From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 00:37:20 +0200
Subject: [Buildroot] [PATCH 1/5 v2] pkg-autotools: add support to gettextize
	a package
In-Reply-To: <cover.1405463657.git.yann.morin.1998@free.fr>
References: <cover.1405463657.git.yann.morin.1998@free.fr>
Message-ID: <0408fc7f5abc9973f99ef3afffab4b88aab32a28.1405463657.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case a package comes with a gettext infra which is different from
the one Buildroot provides, we'd get autoreconf errors, like:
    http://autobuild.buildroot.net/results/c0f/c0f7c801f61fdc310cde64342060b00a70155431/

To avoid that, we need to gettextize the package prior to running
autoreconf.

Provide the necessary infrastructure in the autotools infrastructure,
so we can do it consistently across packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - only gettextize with autoreconf  (Gustavo)
  - add host-gettext to the filter-out  (Gustavo)
---
 package/pkg-autotools.mk | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index ddff9bf..866bf6a 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -87,6 +87,22 @@ ifndef $(2)_AUTORECONF
  endif
 endif
 
+ifndef $(2)_GETTEXTIZE
+ ifdef $(3)_GETTEXTIZE
+  $(2)_GETTEXTIZE = $($(3)_GETTEXTIZE)
+ else
+  $(2)_GETTEXTIZE ?= NO
+ endif
+endif
+
+ifndef $(2)_GETTEXTIZE_OPT
+ ifdef $(3)_GETTEXTIZE_OPT
+  $(2)_GETTEXTIZE_OPT = $($(3)_GETTEXTIZE)
+ else
+  $(2)_GETTEXTIZE_OPT ?= -f
+ endif
+endif
+
 ifeq ($(4),host)
  $(2)_AUTORECONF_OPT ?= $$($(3)_AUTORECONF_OPT)
 endif
@@ -200,6 +216,14 @@ $(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 
 #
+# Hook to gettextize the package if needed
+#
+define GETTEXTIZE_HOOK
+	@$$(call MESSAGE,"Gettextizing")
+	$(Q)cd $$($$(PKG)_SRCDIR) && $(HOST_DIR)/usr/bin/gettextize $$($$(PKG)_GETTEXTIZE_OPT)
+endef
+
+#
 # Hook to autoreconf the package if needed
 #
 define AUTORECONF_HOOK
@@ -222,14 +246,19 @@ endef
 
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
-# away from the non-host rule
+# and _GETTEXTIZE away from the non-host rule
 ifeq ($(4),host)
 $(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
-				host-toolchain $(1),\
+				host-gettext host-toolchain $(1),\
     $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
 
 ifeq ($$($(2)_AUTORECONF),YES)
+# This has to come before autoreconf
+ifeq ($$($(2)_GETTEXTIZE),YES)
+$(2)_PRE_CONFIGURE_HOOK += GETTEXTIZE_HOOK
+$(2)_DEPENDENCIES += host-gettext
+endif
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
-- 
1.9.1
