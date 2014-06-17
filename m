From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 19:07:46 -0300
Subject: [Buildroot] [PATCH] dhcpcd: bump to version 6.4.0
Message-ID: <1403042866-31998-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now with support for static builds.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/Config.in | 9 +--------
 package/dhcpcd/dhcpcd.mk | 7 ++++++-
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
-- 
1.8.5.5
