From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:51 +0100
Subject: [Buildroot] [PATCH 05/24 v3] pkg-autotools: remove redundant shell
	conditional
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <d69930346a83bdb78b40bf5caa6e00343ed730db.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libtool patching function checks whether patching libtool is wanted
before doing the actual patching.

This is redundant now, as all callers are now protected by a conditional
block.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/pkg-autotools.mk | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 45947b0..e240b95 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -44,19 +44,17 @@ endef
 #
 define PATCH_LIBTOOL
 	@$(call MESSAGE,"Patching libtool")
-	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES" ]; then \
-		for i in `find $(1) -name ltmain.sh`; do \
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
+	$(Q)for i in `find $(1) -name ltmain.sh`; do \
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
 
 # This function generates the ac_cv_file_<foo> value for a given
-- 
1.9.1
