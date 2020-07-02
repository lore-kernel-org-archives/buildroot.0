From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu,  2 Jul 2020 12:36:16 +0200
Subject: [Buildroot] [PATCH 4/6] wireless-regdb: add option to rebuild
In-Reply-To: <20200702103618.5147-1-dev.kurt@vandijck-laurijssen.be>
References: <20200702103618.5147-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200702103618.5147-5-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In some countries, different regulations apply for indoor and outdoor use.
The precompiled binary of wireless-regdb is for indoor use only.
If your product is for outdoor use, or for other deviations,
you may need to rebuild the patched or modified wireless-regdb.

Building is done explicitely using python3

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/wireless-regdb/Config.in         | 15 +++++++++++++++
 package/wireless-regdb/wireless-regdb.mk | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
index 17350a41d8..55347b5e8c 100644
--- a/package/wireless-regdb/Config.in
+++ b/package/wireless-regdb/Config.in
@@ -12,3 +12,18 @@ config BR2_PACKAGE_WIRELESS_REGDB
 	  application is needed.
 
 	  https://wireless.wiki.kernel.org/en/developers/regulatory/wireless-regdb
+
+if BR2_PACKAGE_WIRELESS_REGDB
+
+config BR2_WIRELESS_REGDB_REBUILD
+	bool "rebuild wireless-regdb"
+	help
+	  Say no to use the pre-built wireless regdb.
+
+	  Say yes if you need to deploy a modified wireless-regdb.
+	  Deviations to the precompiled upstream wireless-regdb may be required
+	  e.g. if you plan to deploy your product outdoor in countries where
+	  outdoor and indoor regulations differ.
+	  Make sure to deploy your wireless-regdb public key if you use crda
+	  or compile them into the kernel.
+endif
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 31b62e36e1..7c6b140a4a 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -10,12 +10,30 @@ WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
 
+
+ifeq ($(BR2_WIRELESS_REGDB_REBUILD),y)
+
+define WIRELESS_REGDB_PATCH_PYTHON3
+	sed -i -e '1 s/python$$/python3/' $(@D)/*.py
+endef
+
+WIRELESS_REGDB_POST_PATCH_HOOKS += WIRELESS_REGDB_PATCH_PYTHON3
+
+WIRELESS_REGDB_DEPENDENCIES += host-python3-m2crypto
+define WIRELESS_REGDB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		REGDB_AUTHOR=buildroot
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_CRDA),y)
 define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
 	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
 	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
 		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
+	$(INSTALL) -m 644 -D -T ~/.wireless-regdb-buildroot.key.pub.pem \
+		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/buildroot.key.pub.pem
 endef
 endif
 
-- 
2.25.0
