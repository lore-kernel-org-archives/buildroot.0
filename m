From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:52 +0100
Subject: [Buildroot] [PATCH 06/24 v3] pkg-autotools: fold the libtool
	patching code directly into the hook
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <5369a9dfe92b77dbebaba5ec6de2fdc42c9beadc.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We now have only one caller of the libtool patching code, which is the
hook itself.

So, there is no longer any need to extract this code into a utility
function, and it can be folded into the hook itself.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/pkg-autotools.mk | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index e240b95..924816b 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -36,27 +36,6 @@ define CONFIG_UPDATE
 	done
 endef
 
-#
-# Utility function to patch the libtool files
-#
-# argument 1 : directory into which to search for libtool scripts to patch.
-# Note that libtool scripts are searched for recursively in this directory
-#
-define PATCH_LIBTOOL
-	@$(call MESSAGE,"Patching libtool")
-	$(Q)for i in `find $(1) -name ltmain.sh`; do \
-		ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
-		sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
-		if test $${ltmain_version} = '1.5'; then \
-			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
-		elif test $${ltmain_version} = "2.2"; then\
-			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
-		elif test $${ltmain_version} = "2.4"; then\
-			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
-		fi \
-	done
-endef
-
 # This function generates the ac_cv_file_<foo> value for a given
 # filename. This is needed to convince configure script doing
 # AC_CHECK_FILE() tests that the file actually exists, since such
@@ -79,7 +58,18 @@ endef
 # Hook to patch libtool to make it work properly for cross-compilation
 #
 define LIBTOOL_PATCH_HOOK
-	$(call PATCH_LIBTOOL,$($(PKG)_SRCDIR))
+	@$(call MESSAGE,"Patching libtool")
+	$(Q)for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
+		ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$i | \
+		sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
+		if test $${ltmain_version} = '1.5'; then \
+			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+		elif test $${ltmain_version} = "2.2"; then\
+			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+		elif test $${ltmain_version} = "2.4"; then\
+			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+		fi \
+	done
 endef
 
 #
-- 
1.9.1
