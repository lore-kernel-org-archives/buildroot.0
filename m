From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 15:00:11 +0100
Subject: [Buildroot] [git commit] libfslvpuwrap: new package
Message-ID: <20130114152700.8DFAD9A0E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85bd7b910c060b1a9649f6cb1b0eec7db04b94b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/libfslvpuwrap/Config.in        |   13 +++++++++++++
 package/libfslvpuwrap/libfslvpuwrap.mk |   18 ++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 34abe85..f891b49 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -467,6 +467,7 @@ menu "Multimedia"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libebml/Config.in"
+source "package/libfslvpuwrap/Config.in"
 source "package/libmatroska/Config.in"
 source "package/libmms/Config.in"
 source "package/libmpeg2/Config.in"
diff --git a/package/libfslvpuwrap/Config.in b/package/libfslvpuwrap/Config.in
new file mode 100644
index 0000000..57b8a02
--- /dev/null
+++ b/package/libfslvpuwrap/Config.in
@@ -0,0 +1,13 @@
+comment "libfslvpuwrap needs an imx-specific kernel to be built"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_LIBFSLVPUWRAP
+	bool "libfslvpuwrap"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	select BR2_PACKAGE_IMX_LIB
+	help
+	  Wrapper library for the vpu library, giving it a different API.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
new file mode 100644
index 0000000..3ad33f9
--- /dev/null
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# buildroot makefile for libfslvpuwrap
+#
+#############################################################
+
+LIBFSLVPUWRAP_VERSION = 1.0.17
+# No official download site from freescale, just this mirror
+LIBFSLVPUWRAP_SITE = http://download.ossystems.com.br/bsp/freescale/source
+LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
+LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
+LIBFSLVPUWRAP_REDISTRIBUTE = NO
+
+LIBFSLVPUWRAP_INSTALL_STAGING = YES
+
+LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
+
+$(eval $(autotools-package))
