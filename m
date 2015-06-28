From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:18:04 +0200
Subject: [Buildroot] [git commit] libump: new package
Message-ID: <20150628132435.F1EAF8072B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2da11575c8c317d87309f934e647bf0a72850498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

previously, this library was a part of sunxi-mali

[Thomas: add missing comment about the glibc dependency.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/libump/Config.in |   13 +++++++++++++
 package/libump/libump.mk |   13 +++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9dbc98f..c2f6524 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -367,6 +367,7 @@ endif
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/libump/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
diff --git a/package/libump/Config.in b/package/libump/Config.in
new file mode 100644
index 0000000..10232b3
--- /dev/null
+++ b/package/libump/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBUMP
+	bool "libump"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_arm
+	help
+	  The ARMs Universal Memory Provider userspace library.
+	  This library is a requirement for ARMs binary Mali driver.
+
+	  http://github.com/linux-sunxi/libump
+
+comment "libump needs a (e)glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libump/libump.mk b/package/libump/libump.mk
new file mode 100644
index 0000000..65012ff
--- /dev/null
+++ b/package/libump/libump.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libump
+#
+################################################################################
+
+LIBUMP_VERSION = ec0680628744f30b8fac35e41a7bd8e23e59c39f
+LIBUMP_SITE = $(call github,linux-sunxi,libump,$(LIBUMP_VERSION))
+LIBUMP_LICENSE = Apache-2.0
+LIBUMP_AUTORECONF = YES
+LIBUMP_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
