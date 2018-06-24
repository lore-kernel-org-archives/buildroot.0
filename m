From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 11:30:14 +0200
Subject: [Buildroot] [git commit] davfs2: new package
Message-ID: <20180624093057.BAD857FE82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23c91395437febc641f2bd43d90b3344ed90c428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

davfs2 is a Linux file system driver that allows to
mount a WebDAV resource. WebDAV is an extension to HTTP/1.1
that allows remote collaborative authoring of Web resources.

[Peter: Add patch to drop -fstack-protector-strong and update dependencies,
	Not available on musl and nommu, fixup .hash file comments,
	Fix _SITE and drop autoreconf, update DEVELOPERS]
Signed-off-by: Roman Gorbenkov <roman.gorbenkov@ens2m.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 ...e.am-do-not-hardcode-fstack-protector-str.patch | 45 ++++++++++++++++++++++
 package/davfs2/Config.in                           | 18 +++++++++
 package/davfs2/davfs2.hash                         |  4 ++
 package/davfs2/davfs2.mk                           | 17 ++++++++
 6 files changed, 88 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cb55ad64b8..626fba3159 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1665,6 +1665,9 @@ F:	package/chocolate-doom/
 F:	package/irssi/
 F:	package/vnstat/
 
+N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
+F:	package/davfs2/
+
 N:	Romain Naour <romain.naour@gmail.com>
 F:	package/aubio/
 F:	package/bullet/
diff --git a/package/Config.in b/package/Config.in
index a5ecfecbf9..c8e35fd99e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -175,6 +175,7 @@ menu "Filesystem and flash utilities"
 	source "package/cpio/Config.in"
 	source "package/cramfs/Config.in"
 	source "package/curlftpfs/Config.in"
+	source "package/davfs2/Config.in"
 	source "package/dosfstools/Config.in"
 	source "package/e2fsprogs/Config.in"
 	source "package/e2tools/Config.in"
diff --git a/package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch b/package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch
new file mode 100644
index 0000000000..54ae62fc04
--- /dev/null
+++ b/package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch
@@ -0,0 +1,45 @@
+From d209ef650cf2f760ef8217748ab10716bd22d60d Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sun, 24 Jun 2018 10:35:37 +0200
+Subject: [PATCH] src/Makefile.am: do not hardcode -fstack-protector-strong
+
+davfs2 does not truly require -fstack-protector-strong, so do not hardcode
+it.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/Makefile.am | 3 +--
+ src/Makefile.in | 3 +--
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f083462..ed6b682 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -32,8 +32,7 @@ mount_davfs_SOURCES = cache.c dav_coda.c \
+         kernel_interface.h mount_davfs.h webdav.h
+ umount_davfs_SOURCES = umount_davfs.c defaults.h
+ 
+-AM_CFLAGS = -Wall -Werror=format-security \
+-        -fstack-protector-strong --param=ssp-buffer-size=4
++AM_CFLAGS = -Wall -Werror=format-security
+ DEFS = -DPROGRAM_NAME=\"mount.davfs\" \
+        -DDAV_SYS_CONF_DIR=\"$(pkgsysconfdir)\" \
+        -DDAV_LOCALSTATE_DIR=\"$(dav_localstatedir)\" \
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 9fee542..e98758d 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -315,8 +315,7 @@ mount_davfs_SOURCES = cache.c dav_coda.c \
+         kernel_interface.h mount_davfs.h webdav.h
+ 
+ umount_davfs_SOURCES = umount_davfs.c defaults.h
+-AM_CFLAGS = -Wall -Werror=format-security \
+-        -fstack-protector-strong --param=ssp-buffer-size=4
++AM_CFLAGS = -Wall -Werror=format-security
+ 
+ all: all-am
+ 
+-- 
+2.11.0
+
diff --git a/package/davfs2/Config.in b/package/davfs2/Config.in
new file mode 100644
index 0000000000..162753be3e
--- /dev/null
+++ b/package/davfs2/Config.in
@@ -0,0 +1,18 @@
+comment "davfs2 needs a glibc or uClibc toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
+config BR2_PACKAGE_DAVFS2
+	bool "davfs2"
+	depends on !BR2_TOOLCHAIN_USES_MUSL # error.h
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_XML
+	help
+	  davfs2 is a Linux file system driver that allows to
+	  mount a WebDAV resource. WebDAV is an extension to HTTP/1.1
+	  that allows remote collaborative authoring of Web resources.
+	  To use davfs2 via /etc/fstab, FEATURE_MOUNT_HELPERS
+	  must be selected in busybox configuration.
+
+	  http://savannah.nongnu.org/projects/davfs2
diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
new file mode 100644
index 0000000000..102659a38d
--- /dev/null
+++ b/package/davfs2/davfs2.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256 c9c4e0f0912a782386216b2147eb9c36c47f193b8fcf3d637719e0b9fe7c96e0  davfs2-1.5.4.tar.gz
+# License file, locally calculated
+sha256 0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
new file mode 100644
index 0000000000..c1f8477f8b
--- /dev/null
+++ b/package/davfs2/davfs2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# davfs2
+#
+################################################################################
+
+DAVFS2_VERSION = 1.5.4
+DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
+DAVFS2_LICENSE = GPL-3.0+
+DAVFS2_LICENSE_FILES = COPYING
+
+DAVFS2_DEPENDENCIES = neon
+
+DAVFS2_CONF_ENV += \
+	ac_cv_path_NEON_CONFIG=$(STAGING_DIR)/usr/bin/neon-config
+
+$(eval $(autotools-package))
