From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 May 2014 23:47:50 +0200
Subject: [Buildroot] [PATCH] infra/pkg-virtual: validate only one provider
	provides an implementation
In-Reply-To: <20140513180945.GC3507@free.fr>
References: <20140513180945.GC3507@free.fr>
Message-ID: <1400017670-2708-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

BIG FAT NOTICE:
    This is *not* tested.
    This is only a track I'd like to further explore to fix the issue.

Currently, it is possible that more than one provider of a virtual package
is selected in the menuconfig.

This leads to autobuild failures, and we do not protect the user from
making a mistake in the configuration. The failure is then hard to
troubleshoot in any case.

We can't use kconfig constructs to prevent this, sicne kconfig does not
tell how many options did a select on another option.

This patch adds a new function that providers *must* call in their .mk
to ensure at most one provider is selected.

This works by taking advantage that when more than one provider is
selected, only one of them will 'win' in setting the _PROVIDES_FOO
option. Thus any provider just have to check they are indeed the declared
provider. If not, it means that one or more other provider is selected.

This gives the opportunity to the user to change its configuration, and
we can match the error message in the autobuilders to skip those failures
(we can skip them instead of reporting them, since they are obviously
configuration errors that should not happen in the first place.)

NOT Signed-off-by on purpose.
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-virtual.mk               | 9 +++++++++
 package/rpi-userland/rpi-userland.mk | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 617e5f2..66537bf 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -13,6 +13,15 @@
 #
 ################################################################################
 
+# Providers shall call this function with all the FEATURES they provide
+# 	$(eval $(call virt-provides,FEATURE[ FEATURE ...]))
+# where FEATURE has a corresponding BR2_PACKAGE_HAS_FEATURE
+define virt-provides
+$(foreach p,$(1),\
+ifneq ($$(BR2_PACKAGE_PROVIDES_$(p)),$(pkgname))$(sep)\
+$$(error $(pkgname is trying to override $$(BR2_PACKAGE_PROVIDES_$(p)) to provide $(p)))$(sep)\
+endif$(sep))
+endef
 
 ################################################################################
 # inner-virtual-package -- defines the dependency rules of the virtual
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index f6e4443..86125f2 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -16,4 +16,7 @@ define RPI_USERLAND_POST_TARGET_CLEANUP
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
 
+# rpi-userland is a provider for those features:
+$(eval $(call virt-provides,LIBEGL LIBGLES OPENVG OPENMAX))
+
 $(eval $(cmake-package))
-- 
1.8.3.2
