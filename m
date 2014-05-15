From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 May 2014 19:37:03 +0200
Subject: [Buildroot] [PATCH 1/3] infra/pkg-virtual: validate only one
	provider provides an implementation
In-Reply-To: <cover.1400175284.git.yann.morin.1998@free.fr>
References: <cover.1400175284.git.yann.morin.1998@free.fr>
Message-ID: <64d7ca44ff517b9a68f60908f1382570fcf77b3d.1400175284.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, it is possible that more than one provider of a virtual package
is selected in the menuconfig.

This leads to autobuild failures, and we do not protect the user from
making a mistake in the configuration. The failure is then hard to
troubleshoot in any case.

We can't use kconfig constructs to prevent this, since kconfig does not
tell how many options did a select on another option.

This change introduces a new variable a provider *must* define to include
all the virtual packages it is an implementation of. Then, when evaluating
the package's rules, we check that the provider is indeed the declared one
for each virtual package it claims to be an implementation of.

This works by taking advantage that when more than one provider is
selected, only one of them will 'win' in setting the _PROVIDES_FOO
option. Thus any provider just has to check it is indeed the declared
provider. If not, it means that one or more other provider is selected.

This gives the opportunity to the user to change its configuration, and
we can match the error message in the autobuilders to skip those failures
(we can skip them instead of reporting them, since they are obviously
configuration errors that should not happen in the first place.)

[Note: kudos to Arnout for suggesting this actual implementation. :-)]

Fixes:
    http://autobuild.buildroot.org/results/285/2851069d6964aa46d26b4aabe7d84e8c0c6c72ce
    http://autobuild.buildroot.net/results/9b7/9b7870354d70e27e42d3d9c1f131ab54706bf20e
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-generic.mk | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6eca6d4..4e84e9a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -241,6 +241,25 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
 
 ################################################################################
+# virt-provides-single -- check that provider-pkg is the declared provider for
+# the virtual package virt-pkg
+#
+# argument 1 is the lower-case name of the virtual package
+# argument 2 is the upper-case name of the virtual package
+# argument 3 is the lower-case name of the provider
+#
+# example:
+#   $(call virt-provides-single,libegl,LIBEGL,rpi-userland)
+################################################################################
+define virt-provides-single
+ifneq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),$(3))
+$$(error Configuration error: both "$(3)" and $$(BR2_PACKAGE_PROVIDES_$(2))\
+are selected as providers for virtual package "$(1)". Only one provider can\
+be selected at a time. Please fix your configuration)
+endif
+endef
+
+################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
 #
@@ -626,6 +645,13 @@ endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
+# Ensure the calling package is the declared provider for all the virtual
+# packages it claims to be an implementation of.
+ifneq ($$($(2)_PROVIDES),)
+$$(foreach pkg,$$($(2)_PROVIDES),\
+	$$(eval $$(call virt-provides-single,$$(pkg),$$(call UPPERCASE,$$(pkg)),$(1))$$(sep)))
+endif
+
 TARGETS += $(1)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
 PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
-- 
1.8.3.2
