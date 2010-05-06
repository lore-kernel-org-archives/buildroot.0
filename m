From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 May 2010 20:20:03 +0200
Subject: [Buildroot] [PATCH 3/7] xfont_font-util: enable host package
In-Reply-To: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4a57f7d261fdb93e4c8dac30907d7f06bf176f11.1273169997.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling xfonts, host utilities like bdftopcf or ucs2any, part
of xfont_font-util are needed. Until now, xfont_font-util was
installing ugly symbolic links, assuming that these tools were
available on the development machine.

This patch enables the host package for xfont_font-util, removes the
post-install.sh script, and keeps only the useful part of this script
in a post install hook.

host-xfont_font-util will be used later by xfont packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_font-util/post-install.sh    |   28 ----------------------
 package/x11r7/xfont_font-util/xfont_font-util.mk |    7 ++++-
 2 files changed, 6 insertions(+), 29 deletions(-)
 delete mode 100755 package/x11r7/xfont_font-util/post-install.sh

diff --git a/package/x11r7/xfont_font-util/post-install.sh b/package/x11r7/xfont_font-util/post-install.sh
deleted file mode 100755
index 2cb54da..0000000
--- a/package/x11r7/xfont_font-util/post-install.sh
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/sh
-
-	STAGING_DIR=$1
-
-	# fix the fontutil pkgconfig file to cross-compile fonts after fontutil is installed
-	sed "s,^mapdir=.*,mapdir=${STAGING_DIR}/usr/share/fonts/X11/util,g" \
-		${STAGING_DIR}/usr/lib/pkgconfig/fontutil.pc > ${STAGING_DIR}/usr/lib/pkgconfig/fontutil.pc.new
-	mv ${STAGING_DIR}/usr/lib/pkgconfig/fontutil.pc.new ${STAGING_DIR}/usr/lib/pkgconfig/fontutil.pc
-	
-	# link to the build host's ucs2any and fc-cache  
-	rm ${STAGING_DIR}/usr/bin/ucs2any 
-
-	ln -s `which ucs2any` ${STAGING_DIR}/usr/bin
-	if [ "$?" != "0" ]; then
-		echo "Error linking to the build host's ucs2any font utility."
-		echo "Make sure that you have the xorg-x11-font-utils package installed."
-		exit 1
-	fi
-
-	rm ${STAGING_DIR}/usr/bin/fc-cache
-
-	ln -s `which fc-cache` ${STAGING_DIR}/usr/bin
-	if [ "$?" != "0" ]; then
-		echo "Error linking to the build host's fc-cache font utility."
-		echo "Make sure that you have the fontconfig package installed."
-		exit 1
-	fi
-
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 3f59b17..3ca51ac 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -11,10 +11,15 @@ XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
 XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
+HOST_XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
+
 define XFONT_FONT_UTIL_POST_INSTALL_FIXES
- package/x11r7/xfont_font-util/post-install.sh $(STAGING_DIR)
+	sed "s,^mapdir=.*,mapdir=$(STAGING_DIR)/usr/share/fonts/X11/util,g" \
+		$(STAGING_DIR)/usr/lib/pkgconfig/fontutil.pc > $(STAGING_DIR)/usr/lib/pkgconfig/fontutil.pc.new
+	mv $(STAGING_DIR)/usr/lib/pkgconfig/fontutil.pc.new $(STAGING_DIR)/usr/lib/pkgconfig/fontutil.pc
 endef
 
 XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += XFONT_FONT_UTIL_POST_INSTALL_FIXES
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
+$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util,host))
-- 
1.6.3.3
