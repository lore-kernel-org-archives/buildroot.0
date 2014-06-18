From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:58:21 +0200
Subject: [Buildroot] [git commit] dhcpcd: bump to version 6.4.0
Message-ID: <20140618123419.C05F59CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5de7f26975975d56a103032e2401ec1e9e032aa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now with support for static builds.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/Config.in |    9 +--------
 package/dhcpcd/dhcpcd.mk |    7 ++++++-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index 68eac1c..79063ef 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -1,15 +1,8 @@
 config BR2_PACKAGE_DHCPCD
 	bool "dhcpcd"
 	# No support for AI_ADDRCONFIG
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	help
 	  An RFC2131 compliant DHCP client
 
 	  http://roy.marples.name/downloads/dhcpcd
-
-comment "dhcpcd needs a toolchain w/ dynamic library"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
-		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
-	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 01ced3a..7a16f52 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,15 +4,20 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.1.0
+DHCPCD_VERSION = 6.4.0
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
+DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2c
 
 ifeq ($(BR2_INET_IPV6),)
 	DHCPCD_CONFIG_OPT += --disable-ipv6
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	DHCPCD_CONFIG_OPT += --enable-static
+endif
+
 ifeq ($(BR2_USE_MMU),)
 	DHCPCD_CONFIG_OPT += --disable-fork
 endif
