From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2020 17:56:39 +0100
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: new package
Message-ID: <20200109164801.56B93882D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de591c5c3a93a40d049a32bd79c30cc66daf5fb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the kernel support for WireGuard getting mainlined, the upstream repo
has been split in a wireguard-tools repo for the userspace tooling and
wireguard-linux-compat for the kernel side (for 3.10+ legacy kernels).

Add a wireguard-linux-compat for the compatibility out-of-tree kernel
module, and update the Config.in.legacy handling to use it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  6 ++++--
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/wireguard-linux-compat/Config.in           | 23 ++++++++++++++++++++++
 .../wireguard-linux-compat.hash                    |  4 ++++
 .../wireguard-linux-compat.mk                      | 15 ++++++++++++++
 6 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b9bb1aa57d..1801ec06da 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -150,10 +150,12 @@ config BR2_PACKAGE_WIREGUARD
 	bool "wireguard package renamed"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_LEGACY
+	select BR2_PACKAGE_WIREGUARD_LINUX_COMPAT if BR2_LINUX_KERNEL
 	select BR2_PACKAGE_WIREGUARD_TOOLS
 	help
-	  The wireguard package has been renamed to wireguard-tools to
-	  match upstream.
+	  The wireguard package has been renamed to wireguard-tools
+	  for the userspace tooling and wireguard-linux-compat for the
+	  kernel side for legacy (<5.6) kernels to match upstream.
 
 config BR2_PACKAGE_PERL_NET_PING
 	bool "perl-net-ping was removed"
diff --git a/DEVELOPERS b/DEVELOPERS
index 66dc7cf4c2..80843dd1a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1945,6 +1945,7 @@ F:	package/python-websocket-client/
 F:	package/sedutil/
 F:	package/tpm2-totp/
 F:	package/triggerhappy/
+F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
 
diff --git a/package/Config.in b/package/Config.in
index 170a1c986d..873a592d64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2176,6 +2176,7 @@ endif
 	source "package/wavemon/Config.in"
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
+	source "package/wireguard-linux-compat/Config.in"
 	source "package/wireguard-tools/Config.in"
 	source "package/wireless-regdb/Config.in"
 	source "package/wireless_tools/Config.in"
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
