From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Feb 2020 15:54:59 +0100
Subject: [Buildroot] [git commit] package/wireguard-tools: bump to version
 1.0-20200206
Message-ID: <20200207144412.E956C80479@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d41be5f6cff753a5e5b869f2bcdba70eff25bcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop libmnl dependency. From the announcement:

 * netlink: remove libmnl requirement

We no longer require libmnl.  It turns out that inlining the small subset of
libmnl that we actually use results in a smaller binary than the overhead of
linking to the external library.

pkg-config is still used for the systemd support though, so move the
host-pkgconf dependency there.

For more details, see the announcement:

https://lists.zx2c4.com/pipermail/wireguard/2020-February/004963.html

While we are at it, adjust the white space in the .hash file to match the
new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-tools/Config.in            | 1 -
 package/wireguard-tools/wireguard-tools.hash | 6 +++---
 package/wireguard-tools/wireguard-tools.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wireguard-tools/Config.in b/package/wireguard-tools/Config.in
index eee6a8a940..130f4c48ed 100644
--- a/package/wireguard-tools/Config.in
+++ b/package/wireguard-tools/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_WIREGUARD_TOOLS
 	bool "wireguard tools"
 	# kernel module requires 3.10+, userspace makes no sense without it
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	select BR2_PACKAGE_LIBMNL
 	help
 	  WireGuard is an extremely simple yet fast and modern VPN
 	  that utilizes state-of-the-art cryptography. It aims to be
diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index 1650f67e7a..9ea0d3ce86 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004869.html
-sha256 15bfdbdbecbd3870ced9a7e68286c871bfcb2071d165f113808081f2e428faa3  wireguard-tools-1.0.20200121.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-February/004963.html
+sha256  f5207248c6a3c3e3bfc9ab30b91c1897b00802ed861e1f9faaed873366078c64  wireguard-tools-1.0.20200206.tar.xz
 # Locally calculated
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index 0acf0fcbb5..c2b2c36651 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20200121
+WIREGUARD_TOOLS_VERSION = 1.0.20200206
 WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
 WIREGUARD_TOOLS_LICENSE_FILES = COPYING
-WIREGUARD_TOOLS_DEPENDENCIES = host-pkgconf libmnl
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 WIREGUARD_TOOLS_MAKE_OPTS += WITH_SYSTEMDUNITS=yes
+WIREGUARD_TOOLS_DEPENDENCIES += host-pkgconf
 else
 WIREGUARD_TOOLS_MAKE_OPTS += WITH_SYSTEMDUNITS=no
 endif
