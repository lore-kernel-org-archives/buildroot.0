From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 10:29:49 +0100
Subject: [Buildroot] [git commit] libmbim: add new package
Message-ID: <20131206093441.33B6D9BF46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f614fc415306c1f9b184efa3a9db0abdb8a54d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fixup license info as pointed out by Thomas]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/libmbim/Config.in  |   17 +++++++++++++++++
 package/libmbim/libmbim.mk |   19 +++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 754e38f..5128b34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -542,6 +542,7 @@ source "package/libfreefare/Config.in"
 source "package/libftdi/Config.in"
 source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
+source "package/libmbim/Config.in"
 source "package/libnfc/Config.in"
 source "package/libnfc-llcp/Config.in"
 source "package/libqmi/Config.in"
diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
new file mode 100644
index 0000000..ccc0f25
--- /dev/null
+++ b/package/libmbim/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBMBIM
+	bool "libmbim"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_UDEV_ALL_EXTRAS
+	help
+	  libmbim is a glib-based library for talking to WWAN modems and
+	  devices which speak the Mobile Interface Broadband Model (MBIM)
+	  protocol.
+
+	  http://www.freedesktop.org/wiki/Software/libmbim/
+
+comment "libmbim needs udev and a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
new file mode 100644
index 0000000..e10d60f
--- /dev/null
+++ b/package/libmbim/libmbim.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libmbim
+#
+################################################################################
+
+LIBMBIM_VERSION = 1.4.0
+LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim/
+LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
+LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
+LIBMBIM_LICENSE_FILES = COPYING
+LIBMBIM_INSTALL_STAGING = YES
+
+LIBMBIM_DEPENDENCIES = libglib2 udev
+
+# we don't want -Werror
+LIBMBIM_CONF_OPT = --enable-more-warnings=no
+
+$(eval $(autotools-package))
