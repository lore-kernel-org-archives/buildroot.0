From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:33:42 +0100
Subject: [Buildroot] [git commit branch/next] pkg-autotools: move common
	macros
Message-ID: <20141122195743.26C7D7FE34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a82b1ec3db7b91c62c3ce13472f2a89dcb815d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, the common macros used for the various hooks are defined for
each and every autotools packages, even though the macros are completely
generic.

Besides being completely useless, it tends to slow down make, as the
variables are redefined over and over again.

Move their definitions out of inner-autotools-package.

Note: we remove the double-$ because we no longer are in a
define-in-a-define block, just a define block.

[Thomas: change back the author to Johan. Yann mistakenly changed it
when submitting the patch series.]

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998 at free.fr: split the patch into semantically separate
patches]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |  116 +++++++++++++++++++++++-----------------------
 1 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 09f9412..60f6997 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -46,6 +46,64 @@ endef
 #	$(call AUTOCONF_AC_CHECK_FILE_VAL,/dev/random)=yes
 AUTOCONF_AC_CHECK_FILE_VAL = ac_cv_file_$(subst -,_,$(subst /,_,$(subst .,_,$(1))))
 
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
+	if test "$($(PKG)_LIBTOOL_PATCH)" = "YES" \
+		-a "$($(PKG)_AUTORECONF)" != "YES"; then \
+		for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
+			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
+			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
+			if test $${ltmain_version} = '1.5'; then \
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+			elif test $${ltmain_version} = "2.2"; then\
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+			elif test $${ltmain_version} = "2.4"; then\
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+			fi \
+		done \
+	fi
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
+	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
+		for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
+			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
+			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
+			if test $${ltmain_version} = "1.5"; then \
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+			elif test $${ltmain_version} = "2.2"; then\
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+			elif test $${ltmain_version} = "2.4"; then\
+				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+			fi \
+		done \
+	fi
+endef
+
 ################################################################################
 # inner-autotools-package -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
@@ -183,71 +241,13 @@ endef
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
 # default values are not evaluated yet, so don't rely on this defaulting to YES
 ifneq ($$($(2)_LIBTOOL_PATCH),NO)
 $(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 
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
