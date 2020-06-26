From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 26 Jun 2020 14:30:53 +0200
Subject: [Buildroot] [PATCH 6/6] wireless-regdb: add signing key to linux
 kernel
In-Reply-To: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
References: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200626123053.30626-7-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When rebuilding wireless-regdb, linux kernel needs the signing
public key to validate the database.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 linux/linux.mk                           |  4 ++++
 package/wireless-regdb/wireless-regdb.mk | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index b9f2052ee7..8366afaa03 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -367,6 +367,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 
+ifeq ($(BR2_WIRELESS_REGDB_REBUILD),y)
+LINUX_DEPENDENCIES += wireless-regdb
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 # Starting with 4.17, the generated dtc parser code is no longer
 # shipped with the kernel sources, so we need flex and bison. For
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index af54d2c0f4..2401342695 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -42,6 +42,20 @@ define WIRELESS_REGDB_BUILD_CMDS
 		-outform DER \
 		-out $(@D)/$(WIRELESS_REGDB_PRIVKEYNAME).x509
 endef
+
+# Sarting with 4.15, the kernel can hold public keys for validating
+# regulatory.db file.
+# make sure wireless-regdb is rebuilt before linux
+# and fixup kernel to include the signing key
+
+define WIRELESS_REGDB_LINUX_FIXUP
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211_CERTIFICATION_ONUS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS)
+	$(call KCONFIG_SET_OPT,CONFIG_CFG80211_EXTRA_REGDB_KEYDIR,"$(WIRELESS_REGDB_DIR)")
+endef
+
+PACKAGES_LINUX_CONFIG_FIXUPS += $(call WIRELESS_REGDB_LINUX_FIXUP)
+
 endif
 
 ifeq ($(BR2_PACKAGE_CRDA),y)
-- 
2.25.0
