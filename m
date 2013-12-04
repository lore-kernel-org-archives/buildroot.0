From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  4 Dec 2013 10:55:03 +0100
Subject: [Buildroot] [PATCH v6 2/3] libmbim: add new package
In-Reply-To: <1386150904-16813-1-git-send-email-yegorslists@googlemail.com>
References: <1386150904-16813-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1386150904-16813-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in          |    1 +
 package/libmbim/Config.in  |   17 +++++++++++++++++
 package/libmbim/libmbim.mk |   19 +++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/libmbim/Config.in
 create mode 100644 package/libmbim/libmbim.mk

diff --git a/package/Config.in b/package/Config.in
index 101c088..87aba87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -543,6 +543,7 @@ source "package/libfreefare/Config.in"
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
index 0000000..f6991f1
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
+LIBMBIM_LICENSE = GPLv2
+LIBMBIM_LICENSE_FILES = COPYING
+LIBMBIM_INSTALL_STAGING = YES
+
+LIBMBIM_DEPENDENCIES = libglib2 udev
+
+# we don't want -Werror
+LIBMBIM_CONF_OPT = --enable-more-warnings=no
+
+$(eval $(autotools-package))
-- 
1.7.7
