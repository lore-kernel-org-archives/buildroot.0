From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:35:04 +0100
Subject: [Buildroot] [git commit branch/next] pkg-autotools: commonalise the
	libtool patching code
Message-ID: <20141122195743.3894F7FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2d0052f3b665d60302c95a9e0eb98741f17b3f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, the heuristic to patch libtool scripts is duplicated both in
the libtool post-patch hook and the autoreconf pre-configure hook.

Move that code into a single function that gets called from both hooks.

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
 package/pkg-autotools.mk |   53 +++++++++++++++++++++------------------------
 1 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 6e198ed..393f995 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -36,6 +36,29 @@ define CONFIG_UPDATE
 	done
 endef
 
+#
+# Utility function to patch the libtool files
+#
+# argument 1 : directory into which to search for libtool scripts to patch.
+# Note that libtool scripts are searched for recursively in this directory
+#
+define PATCH_LIBTOOL
+	@$(call MESSAGE,"Patching libtool")
+	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES" ]; then \
+		for i in `find $(1) -name ltmain.sh`; do \
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
 # This function generates the ac_cv_file_<foo> value for a given
 # filename. This is needed to convince configure script doing
 # AC_CHECK_FILE() tests that the file actually exists, since such
@@ -58,21 +81,7 @@ endef
 # Hook to patch libtool to make it work properly for cross-compilation
 #
 define LIBTOOL_PATCH_HOOK
-	@$(call MESSAGE,"Patching libtool")
-	if test "$($(PKG)_LIBTOOL_PATCH)" = "YES" \
-		-a "$($(PKG)_AUTORECONF)" != "YES"; then \
-		for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
-			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
-			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
-			if test $${ltmain_version} = '1.5'; then \
-				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
-			elif test $${ltmain_version} = "2.2"; then\
-				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
-			elif test $${ltmain_version} = "2.4"; then\
-				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
-			fi \
-		done \
-	fi
+	$(call PATCH_LIBTOOL,$($(PKG)_SRCDIR))
 endef
 
 #
@@ -89,19 +98,7 @@ endef
 define AUTORECONF_HOOK
 	@$(call MESSAGE,"Autoreconfiguring")
 	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
-	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
-		for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
-			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
-			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
-			if test $${ltmain_version} = "1.5"; then \
-				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
-			elif test $${ltmain_version} = "2.2"; then\
-				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
-			elif test $${ltmain_version} = "2.4"; then\
-				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
-			fi \
-		done \
-	fi
+	$(call PATCH_LIBTOOL,$($(PKG)_SRCDIR))
 endef
 
 ################################################################################
