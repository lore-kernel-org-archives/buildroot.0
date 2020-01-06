From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  6 Jan 2020 11:47:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/wireguard-linux-compat: new package
In-Reply-To: <20200106104731.13306-1-peter@korsgaard.com>
References: <20200106104731.13306-1-peter@korsgaard.com>
Message-ID: <20200106104731.13306-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the kernel support for WireGuard getting mainlined, the upstream repo
has been split in a wireguard-tools repo for the userspace tooling and
wireguard-linux-compat for the kernel side (for 3.10+ legacy kernels).

Add a wireguard-linux-compat for the compatibility out-of-tree kernel module.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/wireguard-linux-compat/Config.in      | 23 +++++++++++++++++++
 .../wireguard-linux-compat.hash               |  4 ++++
 .../wireguard-linux-compat.mk                 | 15 ++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/wireguard-linux-compat/Config.in
 create mode 100644 package/wireguard-linux-compat/wireguard-linux-compat.hash
 create mode 100644 package/wireguard-linux-compat/wireguard-linux-compat.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 63e6981570..ac10b9270b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1940,6 +1940,7 @@ F:	package/sedutil/
 F:	package/tpm2-totp/
 F:	package/triggerhappy/
 F:	package/wireguard/
+F:	package/wireguard-linux-compat/
 F:	support/testing/tests/package/test_docker_compose.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
diff --git a/package/Config.in b/package/Config.in
index 894284c650..00718d4fc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2173,6 +2173,7 @@ endif
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
 	source "package/wireguard/Config.in"
+	source "package/wireguard-linux-compat/Config.in"
 	source "package/wireless-regdb/Config.in"
 	source "package/wireless_tools/Config.in"
 	source "package/wireshark/Config.in"
diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
new file mode 100644
index 0000000000..4ee214be63
--- /dev/null
+++ b/package/wireguard-linux-compat/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
+	bool "wireguard linux-compat"
+	depends on BR2_LINUX_KERNEL
+	# kernel module requires 3.10+
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	help
+	  WireGuard is an extremely simple yet fast and modern VPN
+	  that utilizes state-of-the-art cryptography. It aims to be
+	  faster, simpler, leaner, and more useful than IPSec, while
+	  avoiding the massive headache. It intends to be considerably
+	  more performant than OpenVPN. WireGuard is designed as a
+	  general purpose VPN for running on embedded interfaces and
+	  super computers alike, fit for many different
+	  circumstances.
+
+	  Support for WireGuard is included in Linux 5.6+. This
+	  package provides a backport of the kernel support for older
+	  kernels.
+
+	  https://www.wireguard.com
+
+comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
+	depends on BR2_LINUX_KERNEL && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
new file mode 100644
index 0000000000..1653eaa089
--- /dev/null
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -0,0 +1,4 @@
+# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004844.html
+sha256 9f12f68e96f6865325995c38213e09b05751cd1ef03e0bbc9f1bdc3e5680b337  wireguard-linux-compat-0.0.20200105.tar.xz
+# Locally calculated
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
new file mode 100644
index 0000000000..ddceed5660
--- /dev/null
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# wireguard
+#
+################################################################################
+
+WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200105
+WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
+WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
+WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
+WIREGUARD_LINUX_COMPAT_LICENSE_FILES = COPYING
+WIREGUARD_LINUX_COMPAT_MODULE_SUBDIRS = src
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.20.1
