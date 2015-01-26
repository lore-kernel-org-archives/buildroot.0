From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 Jan 2015 20:24:16 +0100
Subject: [Buildroot] [PATCH 1/5] package/giflib: New package
Message-ID: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package will replace libungif.

Needed for Kodi 15.0, TexturePacker depends on giflib >= 5.0.5
https://github.com/xbmc/xbmc/blob/master/tools/depends/native/TexturePacker/src/configure.ac#L29

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in          |    1 +
 package/giflib/Config.in   |    8 ++++++++
 package/giflib/giflib.hash |    2 ++
 package/giflib/giflib.mk   |   28 ++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/giflib/Config.in
 create mode 100644 package/giflib/giflib.hash
 create mode 100644 package/giflib/giflib.mk

diff --git a/package/Config.in b/package/Config.in
index fbb1341..9bc8cdb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -664,6 +664,7 @@ menu "Graphics"
 	source "package/gd/Config.in"
 	source "package/gdk-pixbuf/Config.in"
 	source "package/giblib/Config.in"
+	source "package/giflib/Config.in"
 	source "package/gtk2-engines/Config.in"
 	source "package/gtk2-themes/Config.in"
 	source "package/harfbuzz/Config.in"
diff --git a/package/giflib/Config.in b/package/giflib/Config.in
new file mode 100644
index 0000000..70368dc
--- /dev/null
+++ b/package/giflib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GIFLIB
+	bool "giflib"
+	help
+	  giflib is a library for reading and writing gif images. It is API and
+	  ABI compatible with libungif which was in wide use while the LZW
+	  compression algorithm was patented.
+
+	  http://sourceforge.net/projects/giflib
diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
new file mode 100644
index 0000000..46ba7ca
--- /dev/null
+++ b/package/giflib/giflib.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/giflib/files
+sha1	e5d716e0ccef671103c38c25693927e413fac639	giflib-5.1.1.tar.bz2
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
new file mode 100644
index 0000000..96a1dfd
--- /dev/null
+++ b/package/giflib/giflib.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# giflib
+#
+################################################################################
+
+GIFLIB_VERSION = 5.1.1
+GIFLIB_SOURCE = giflib-$(GIFLIB_VERSION).tar.bz2
+GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
+GIFLIB_INSTALL_STAGING = YES
+GIFLIB_LICENSE = MIT
+GIFLIB_LICENSE_FILES = COPYING
+
+GIFLIB_BINS = \
+	gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifbuild gifburst gifclip \
+	gifclrmp gifcolor gifcomb gifcompose gifecho giffiltr giffix gifflip  \
+	gifhisto gifinfo gifinter gifinto gifovly gifpos gifrotat     \
+	gifrsize gifspnge giftext giftool gifwedge icon2gif raw2gif rgb2gif \
+	text2gif
+
+define GIFLIB_BINS_CLEANUP
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GIFLIB_BINS))
+endef
+
+GIFLIB_POST_INSTALL_TARGET_HOOKS += GIFLIB_BINS_CLEANUP
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
