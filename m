From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Nov 2013 09:26:52 -0300
Subject: [Buildroot] [PATCH] dhcpcd: bump to version 6.1.0
Message-ID: <1383913612-16418-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now has proper support for nommu and non-IPv6.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/Config.in |  8 +++-----
 package/dhcpcd/dhcpcd.mk | 17 ++++++++++++-----
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index ddbc6f4..ac20615 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -1,11 +1,9 @@
 config BR2_PACKAGE_DHCPCD
-	depends on BR2_INET_IPV6
-	depends on BR2_USE_MMU # fork()
 	bool "dhcpcd"
+	# No support for AI_ADDRCONFIG
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	help
 	  An RFC2131 compliant DHCP client
 
 	  http://roy.marples.name/downloads/dhcpcd
-
-comment "dhcpcd needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 13810f3..8037706 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,22 +4,29 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 5.6.7
+DHCPCD_VERSION = 6.1.0
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
-DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd/
+DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_LICENSE = BSD-2c
 
+ifeq ($(BR2_INET_IPV6),)
+	DHCPCD_CONFIG_OPT += --disable-ipv6
+endif
+
+ifeq ($(BR2_USE_MMU),)
+	DHCPCD_CONFIG_OPT += --disable-fork
+endif
+
 define DHCPCD_CONFIGURE_CMDS
 	(cd $(@D); \
-	./configure \
+	$(TARGET_CONFIGURE_OPTS) ./configure \
 		--target=$(BR2_GCC_TARGET_ARCH) \
 		--os=linux \
 		$(DHCPCD_CONFIG_OPT) )
 endef
 
 define DHCPCD_BUILD_CMDS
-	$(MAKE) \
-		$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) \
 		-C $(@D) all
 endef
 
-- 
1.8.1.5
