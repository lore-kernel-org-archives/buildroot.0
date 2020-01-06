From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  6 Jan 2020 11:47:30 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireguard: change to the
 wireguard-tools package
In-Reply-To: <20200106104731.13306-1-peter@korsgaard.com>
References: <20200106104731.13306-1-peter@korsgaard.com>
Message-ID: <20200106104731.13306-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the kernel support for WireGuard getting mainlined, the upstream repo
has been split in a wireguard-tools repo for the userspace tooling and
wireguard-linux-compat for the kernel side (for 3.10+ legacy kernels).

Keep the BR2_PACKAGE_WIREGUARD name for the userspace utilities for
compatibility reasons.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/Config.in      |  9 ++++-----
 package/wireguard/wireguard.hash |  4 ++--
 package/wireguard/wireguard.mk   | 15 +++++----------
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/package/wireguard/Config.in b/package/wireguard/Config.in
index fe92fd6cfc..ba90ce82f2 100644
--- a/package/wireguard/Config.in
+++ b/package/wireguard/Config.in
@@ -11,11 +11,10 @@ config BR2_PACKAGE_WIREGUARD
 	  more performant than OpenVPN. WireGuard is designed as a
 	  general purpose VPN for running on embedded interfaces and
 	  super computers alike, fit for many different
-	  circumstances. Initially released for the Linux kernel, it
-	  plans to be cross-platform and widely deployable. It is
-	  currently under heavy development, but already it might be
-	  regarded as the most secure, easiest to use, and simplest
-	  VPN solution in the industry.
+	  circumstances.
+
+	  This package provides the userspace tooling to configure
+	  WireGuard tunnels.
 
 	  https://www.wireguard.com
 
diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 66ebf41dc6..b8b1dac1ac 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-December/004764.html
-sha256 b0d718380f7a8822b2f12d75e462fa4eafa3a77871002981f367cd4fe2a1b071  WireGuard-0.0.20191212.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004819.html
+sha256 547cd1c2f8dca904faac9e8d3964f1ef956c24bb12e3498da88dde95243c7f08  wireguard-tools-1.0.20200102.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 3c604b3014..80c1f4c186 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20191212
-WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
-WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
+WIREGUARD_VERSION = 1.0.20200102
+WIREGUARD_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
+WIREGUARD_SOURCE = wireguard-tools-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
 WIREGUARD_LICENSE_FILES = COPYING
 WIREGUARD_DEPENDENCIES = host-pkgconf libmnl
@@ -25,17 +25,12 @@ endif
 
 define WIREGUARD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(WIREGUARD_MAKE_OPTS) \
-		-C $(@D)/src/tools
+		-C $(@D)/src
 endef
 
 define WIREGUARD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(WIREGUARD_MAKE_OPTS) \
-		-C $(@D)/src/tools install DESTDIR=$(TARGET_DIR)
+		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
 endef
 
-ifeq ($(BR2_LINUX_KERNEL),y)
-WIREGUARD_MODULE_SUBDIRS = src
-$(eval $(kernel-module))
-endif
-
 $(eval $(generic-package))
-- 
2.20.1
