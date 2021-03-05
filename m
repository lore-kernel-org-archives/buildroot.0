From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 12:10:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: add
 BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
Message-ID: <20210305111048.1902558-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP following Arnout feedback:
https://patchwork.ozlabs.org/project/buildroot/patch/20210303091904.467706-1-fontaine.fabrice at gmail.com

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcpcd/Config.in | 19 +++++++++++++++++++
 package/dhcpcd/dhcpcd.mk | 22 ++++------------------
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index ece08d2c96..3ebacb3ba2 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -8,3 +8,22 @@ config BR2_PACKAGE_DHCPCD
 	  An RFC2131 compliant DHCP client
 
 	  http://roy.marples.name/projects/dhcpcd/
+
+if BR2_PACKAGE_DHCPCD
+
+config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
+	bool
+	default y
+	depends on BR2_USE_MMU
+	# Audit headers were only added in recent kernels for some arches
+	depends on !(BR2_arceb || BR2_arcle) || \
+		BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+	depends on !(BR2_microblazeel || BR2_microblazebe) || \
+		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+	depends on !BR2_nds32 || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+	depends on !BR2_nios2 || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
+	depends on !BR2_or1k || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_sh || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on !BR2_xtensa || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
+endif
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index f040610de4..30f0aab867 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -16,23 +16,9 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
-# AUDIT_ARCH_{OPENRISC,SH,SHEL,SH64,SHEL64} are only available with kernel >= 3.7
-ifeq ($(BR2_or1k)$(BR2_sh):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7),y:)
-DHCPCD_CONFIG_OPTS += --disable-privsep
-endif
-
-# AUDIT_ARCH_MICROBLAZE is only available with kernel >= 3.18
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18),y:)
-DHCPCD_CONFIG_OPTS += --disable-privsep
-endif
-
-# AUDIT_ARCH_XTENSA is only available with kernel >= 5.0
-ifeq ($(BR2_xtensa):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y:)
-DHCPCD_CONFIG_OPTS += --disable-privsep
-endif
-
-# AUDIT_ARCH_{ARCOMPACT,ARCV2,NDS32,NIOS2} are only available with kernel >= 5.2
-ifeq ($(BR2_arceb)$(BR2_arcle)$(BR2_nds32)$(BR2_nios2):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2),y:)
+ifeq ($(BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP),y)
+DHCPCD_CONFIG_OPTS += --enable-privsep
+else
 DHCPCD_CONFIG_OPTS += --disable-privsep
 endif
 
@@ -48,7 +34,7 @@ DHCPCD_CONFIG_OPTS += --enable-static
 endif
 
 ifeq ($(BR2_USE_MMU),)
-DHCPCD_CONFIG_OPTS += --disable-fork --disable-privsep
+DHCPCD_CONFIG_OPTS += --disable-fork
 endif
 
 define DHCPCD_CONFIGURE_CMDS
-- 
2.30.0
