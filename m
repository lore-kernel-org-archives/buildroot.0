From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:02:07 +0100
Subject: [Buildroot] [git commit] package/f2fs-tools: add host variant
Message-ID: <20181103143121.DEBBF88407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a879a6bc28cb5378ed692a04f50dc265b3e9d8b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having a host variant of this package is useful to create f2fs
filesystem images.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: add explicit --without-blkid and --without-selinux options,
following the review from Yann E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                        | 1 +
 package/Config.in.host            | 1 +
 package/f2fs-tools/Config.in.host | 7 +++++++
 package/f2fs-tools/f2fs-tools.mk  | 9 +++++++++
 4 files changed, 18 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 49ff2487cd..179f30451f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -891,6 +891,7 @@ F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
 F:	package/bluez5_utils-headers/
+F:	package/f2fs-tools/
 F:	package/pigpio/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
diff --git a/package/Config.in.host b/package/Config.in.host
index 3a3578ceeb..16b474fc9d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -16,6 +16,7 @@ menu "Host utilities"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
+	source "package/f2fs-tools/Config.in.host"
 	source "package/faketime/Config.in.host"
 	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
diff --git a/package/f2fs-tools/Config.in.host b/package/f2fs-tools/Config.in.host
new file mode 100644
index 0000000000..19c77b9c89
--- /dev/null
+++ b/package/f2fs-tools/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_F2FS_TOOLS
+	bool "host f2fs-tools"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
+	help
+	  Tools for Flash-Friendly File System (F2FS)
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index 119cef35cc..ba16218bda 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -9,6 +9,7 @@ F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-to
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
+HOST_F2FS_TOOLS_DEPENDENCIES = host-pkgconf host-util-linux
 # GIT version, shipped without configure
 F2FS_TOOLS_AUTORECONF = YES
 F2FS_TOOLS_INSTALL_STAGING = YES
@@ -29,4 +30,12 @@ else
 F2FS_TOOLS_CONF_OPTS += --without-blkid
 endif
 
+# blkid is only used to detect if we're overwriting a filesystem
+# during mkfs, which only makes sense on the target, so we disable
+# blkid support even if we have host-util-linux
+HOST_F2FS_TOOLS_CONF_OPTS = \
+	--without-selinux \
+	--without-blkid
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
