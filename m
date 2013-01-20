From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 23:16:30 +0100
Subject: [Buildroot] [git commit] libatasmart: new package.
Message-ID: <20130121075019.3DC939A556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7a81abc5421b95ea24efd1d74614ee032c014a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/libatasmart/Config.in      |   11 +++++++++++
 package/libatasmart/libatasmart.mk |   18 ++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 167a526..f3aa1c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,6 +245,7 @@ source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
+source "package/libatasmart/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
new file mode 100644
index 0000000..a3e44f8
--- /dev/null
+++ b/package/libatasmart/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBATASMART
+	bool "libatasmart"
+	depends on BR2_PACKAGE_UDEV # libudev is configure dependency
+	help
+	  The libatasmart package is a disk reporting library.
+	  It only supports a subset of the ATA S.M.A.R.T. functionality.
+
+	  http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
+
+comment "libatasmart requires udev to be enabled"
+	depends on !BR2_PACKAGE_UDEV
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
new file mode 100644
index 0000000..5dbdcc4
--- /dev/null
+++ b/package/libatasmart/libatasmart.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# libatasmart
+#
+#############################################################
+LIBATASMART_VERSION = 0.19
+LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
+LIBATASMART_SITE    = http://0pointer.de/public
+LIBATASMART_LICENSE = LGPLv2.1
+LIBATASMART_LICENSE_FILE = LGPL
+LIBATASMART_INSTALL_STAGING = YES
+
+# package doesn't include configure script
+LIBATASMART_AUTORECONF = YES
+
+LIBATASMART_DEPENDENCIES = udev
+
+$(eval $(autotools-package))
