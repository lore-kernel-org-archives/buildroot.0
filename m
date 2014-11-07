From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Fri,  7 Nov 2014 14:28:37 +0100
Subject: [Buildroot] [PATCH v2 01/15] package/pkg-autotools.mk: Factorize
	hooks.
In-Reply-To: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1415366931-6870-2-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Define common macros only once (instead of as many times as
there are inner-autotools-package calls).
Factorize LIBTOOL_PATCH_HOOK and AUTORECONF_HOOK to avoid duplicated
code.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/pkg-autotools.mk | 119 ++++++++++++++++++++++-------------------------
 1 file changed, 56 insertions(+), 63 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 09f9412..65af6f0 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -46,6 +46,57 @@ endef
 #	$(call AUTOCONF_AC_CHECK_FILE_VAL,/dev/random)=yes
 AUTOCONF_AC_CHECK_FILE_VAL = ac_cv_file_$(subst -,_,$(subst /,_,$(subst .,_,$(1))))
 
+# Recipe that patches libtool so it works properly with
+# cross-compilation.
+define PATCH_LIBTOOL
+	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
+		for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
+			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
+			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
+			if test $${ltmain_version} = 1.5; then \
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+			elif test $${ltmain_version} = 2.2; then\
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+			elif test $${ltmain_version} = 2.4; then\
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+			fi \
+		done \
+	fi
+endef
+
+#
+# Hook to update config.sub and config.guess if needed
+#
+define UPDATE_CONFIG_HOOK
+	@$(call MESSAGE,"Updating config.sub and config.guess")
+	$(call CONFIG_UPDATE,$(@D))
+endef
+
+#
+# Hook to patch libtool to make it work properly for cross-compilation
+#
+define LIBTOOL_PATCH_HOOK
+	@$(call MESSAGE,"Patching libtool")
+	$(call PATCH_LIBTOOL)
+endef
+
+#
+# Hook to gettextize the package if needed
+#
+define GETTEXTIZE_HOOK
+	@$(call MESSAGE,"Gettextizing")
+	$(Q)cd $($(PKG)_SRCDIR) && $(GETTEXTIZE) $($(PKG)_GETTEXTIZE_OPTS)
+endef
+
+#
+# Hook to autoreconf the package if needed
+#
+define AUTORECONF_HOOK
+	@$(call MESSAGE,"Autoreconfiguring")
+	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
+	$(call PATCH_LIBTOOL)
+endef
+
 ################################################################################
 # inner-autotools-package -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
@@ -183,71 +234,8 @@ endef
 endif
 endif
 
-#
-# Hook to update config.sub and config.guess if needed
-#
-define UPDATE_CONFIG_HOOK
-	@$$(call MESSAGE,"Updating config.sub and config.guess")
-	$$(call CONFIG_UPDATE,$$(@D))
-endef
-
 $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
-#
-# Hook to patch libtool to make it work properly for cross-compilation
-#
-define LIBTOOL_PATCH_HOOK
-	@$$(call MESSAGE,"Patching libtool")
-	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
-		-a "$$($$(PKG)_AUTORECONF)" != "YES"; then \
-		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
-			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
-			if test $$$${ltmain_version} = '1.5'; then \
-				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
-			elif test $$$${ltmain_version} = "2.2"; then\
-				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
-			elif test $$$${ltmain_version} = "2.4"; then\
-				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
-			fi \
-		done \
-	fi
-endef
-
-# default values are not evaluated yet, so don't rely on this defaulting to YES
-ifneq ($$($(2)_LIBTOOL_PATCH),NO)
-$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
-endif
-
-#
-# Hook to gettextize the package if needed
-#
-define GETTEXTIZE_HOOK
-	@$$(call MESSAGE,"Gettextizing")
-	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPTS)
-endef
-
-#
-# Hook to autoreconf the package if needed
-#
-define AUTORECONF_HOOK
-	@$$(call MESSAGE,"Autoreconfiguring")
-	$$(Q)cd $$($$(PKG)_SRCDIR) && $$($$(PKG)_AUTORECONF_ENV) $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPTS)
-	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
-		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
-			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
-			if test $$$${ltmain_version} = "1.5"; then \
-				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
-			elif test $$$${ltmain_version} = "2.2"; then\
-				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
-			elif test $$$${ltmain_version} = "2.4"; then\
-				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
-			fi \
-		done \
-	fi
-endef
-
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # and _GETTEXTIZE away from the non-host rule
@@ -265,6 +253,11 @@ $(2)_DEPENDENCIES += host-gettext
 endif
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+else
+# default values are not evaluated yet, so don't rely on this defaulting to YES
+ifneq ($$($(2)_LIBTOOL_PATCH),NO)
+$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
+endif
 endif
 
 #
-- 
2.1.0
