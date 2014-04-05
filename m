From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:45 +0200
Subject: [Buildroot] [PATCH 08/21] packages: add infrastructure for virtual
	packages
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <41a747fcf4004c4a56b93d9499e8bf75a7553121.1396711074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The virtual-package infrastructure allows to easily define a
virtual package in a single line:

    $ cat package/some-virtual-package/some-virtual-package.mk
    $(eval $(virtual-package))

And that's all. :-)

Thanks to ?ric for his work on the manual, that prompted the
idea for this virtual-package infrastructure! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Makefile.in    |  1 +
 package/pkg-virtual.mk | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 package/pkg-virtual.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index 986760c..1f5cbcd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -371,4 +371,5 @@ include package/pkg-cmake.mk
 include package/pkg-luarocks.mk
 include package/pkg-perl.mk
 include package/pkg-python.mk
+include package/pkg-virtual.mk
 include package/pkg-generic.mk
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
new file mode 100644
index 0000000..9b206ea
--- /dev/null
+++ b/package/pkg-virtual.mk
@@ -0,0 +1,66 @@
+################################################################################
+# Virtual package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for virtual packages. It should be used for all
+# virtual packages.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this virtual infrastructure requires
+# the .mk file to only call the 'virtual-package' macro.
+#
+################################################################################
+
+
+################################################################################
+# inner-virtual-package -- defines the dependency rules of the virtual
+# package against its provider.
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+
+# Note: putting this comment here rather than in the define block, otherwise
+# make would try to expand the $(error ...) in the comment, which is not
+# really what we want.
+# We need to use second-expansion for the $(error ...) call, below,
+# so it is not evaluated now, but as part of the generated make code.
+
+define inner-virtual-package
+
+# Ensure the virtual package has an implementation defined.
+ifeq ($(BR2_PACKAGE_HAS_$(2)),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2))),)
+$$(error No implementation selected for virtual package $(1). Configuration error)
+endif
+endif
+
+# A virtual package does not have any source associated
+$(2)_SOURCE =
+
+# This must be repeated from inner-generic-package, otherwise we get an empty
+# _DEPENDENCIES
+$(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),\
+	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+
+# Add dependency against the provider
+$(2)_DEPENDENCIES += $(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2)))
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef
+
+################################################################################
+# virtual-package -- the target generator macro for virtual packages
+################################################################################
+
+virtual-package = $(call inner-virtual-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-virtual-package = $(call inner-virtual-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
1.8.3.2
