From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 21:09:05 +0200
Subject: [Buildroot] [git commit] xorriso: Add host variant
Message-ID: <20160330191134.028F081922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b5120ca92c96d9c4a08019ea5382aa7d14d96d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host         |  1 +
 package/xorriso/Config.in.host | 14 ++++++++++++++
 package/xorriso/xorriso.mk     | 11 +++++++++++
 3 files changed, 26 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 09c98fb..a91612b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -32,6 +32,7 @@ menu "Host utilities"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
+	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 
 endmenu
diff --git a/package/xorriso/Config.in.host b/package/xorriso/Config.in.host
new file mode 100644
index 0000000..2baa043
--- /dev/null
+++ b/package/xorriso/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_XORRISO
+	bool "host xorriso"
+	help
+	  xorriso copies file objects from POSIX compliant
+	  filesystems into Rock Ridge enhanced ISO 9660 filesystems
+	  and allows session-wise manipulation of such filesystems.
+	  It can load the management information of existing ISO
+	  images and it writes the session results to optical media
+	  or to filesystem objects.
+
+	  Vice versa xorriso is able to copy file objects out of ISO
+	  9660 filesystems.
+
+	  https://www.gnu.org/software/xorriso
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index e8bb5cb..57537e8 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -8,6 +8,16 @@ XORRISO_VERSION = 1.4.2
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPLv3+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
+HOST_XORRISO_DEPENDENCIES =
+# Disable everything until we actually need those feature, and add the correct
+# host-libraries
+HOST_XORRISO_CONF_OPTS = \
+        --disable-zlib \
+        --disable-bzip2 \
+        --disable-libcdio \
+        --disable-libreadline \
+        --disable-libedit \
+        --disable-libacl
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 XORRISO_DEPENDENCIES += libiconv
@@ -64,3 +74,4 @@ XORRISO_CONF_OPTS += --disable-jtethreads
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
