From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 26 Jun 2020 14:30:52 +0200
Subject: [Buildroot] [PATCH 5/6] wireless-regdb: add explicit signing key
 config
In-Reply-To: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
References: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200626123053.30626-6-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit allows to set an explicit file with signing key to use.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/wireless-regdb/Config.in         | 18 ++++++++++++++++++
 package/wireless-regdb/wireless-regdb.mk | 24 +++++++++++++++++++++---
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
index 55347b5e8c..be2c421438 100644
--- a/package/wireless-regdb/Config.in
+++ b/package/wireless-regdb/Config.in
@@ -26,4 +26,22 @@ config BR2_WIRELESS_REGDB_REBUILD
 	  outdoor and indoor regulations differ.
 	  Make sure to deploy your wireless-regdb public key if you use crda
 	  or compile them into the kernel.
+
+if BR2_WIRELESS_REGDB_REBUILD
+
+config BR2_WIRELESS_REGDB_COMMONNAME
+	string "CommonName for x509 cert"
+	default "buildroot"
+
+config BR2_WIRELESS_REGDB_PRIVKEY
+	string "private key for signing wireless-regdb"
+	default "~/.buildroot"
+	help
+	  Path to file containing private key to sign wireless-regdb.
+	  The key should be in .pem format.
+
+	  If the file does not exist, a new key will be generated
+
+endif
+
 endif
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 7c6b140a4a..af54d2c0f4 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -13,16 +13,34 @@ WIRELESS_REGDB_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_WIRELESS_REGDB_REBUILD),y)
 
+WIRELESS_REGDB_PRIVKEY = $(call qstrip,$(BR2_WIRELESS_REGDB_PRIVKEY))
+# make sure PRIVKEYNAME is set
+ifeq ($(WIRELESS_REGDB_PRIVKEYNAME),)
+WIRELESS_REGDB_PRIVKEY=~/.buildroot
+endif
+WIRELESS_REGDB_PRIVKEYNAME = $(patsubst .%,%,$(notdir $(WIRELESS_REGDB_PRIVKEY)))
+
+ifeq ($(call qstrip,$(BR2_WIRELESS_REGDB_COMMONNAME)),)
+BR2_WIRELESS_REGDB_COMMONNAME = "buildroot"
+endif
+
 define WIRELESS_REGDB_PATCH_PYTHON3
 	sed -i -e '1 s/python$$/python3/' $(@D)/*.py
+	sed -i -e 's/= sforshee$$/= $(call qstrip,$(BR2_WIRELESS_REGDB_COMMONNAME))/' $(@D)/gen-pubcert.sh
 endef
 
 WIRELESS_REGDB_POST_PATCH_HOOKS += WIRELESS_REGDB_PATCH_PYTHON3
 
 WIRELESS_REGDB_DEPENDENCIES += host-python3-m2crypto
+
 define WIRELESS_REGDB_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		REGDB_AUTHOR=buildroot
+		REGDB_PRIVKEY=$(WIRELESS_REGDB_PRIVKEY) \
+		REGDB_PUBKEY=$(WIRELESS_REGDB_PRIVKEYNAME).pub \
+		REGDB_PUBCERT=$(WIRELESS_REGDB_PRIVKEYNAME).x509.pem
+	openssl x509 -in $(@D)/$(WIRELESS_REGDB_PRIVKEYNAME).x509.pem \
+		-outform DER \
+		-out $(@D)/$(WIRELESS_REGDB_PRIVKEYNAME).x509
 endef
 endif
 
@@ -32,8 +50,8 @@ define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
 	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
 		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
-	$(INSTALL) -m 644 -D -T ~/.wireless-regdb-buildroot.key.pub.pem \
-		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/buildroot.key.pub.pem
+	$(INSTALL) -m 644 -D -T $(@D)/$(WIRELESS_REGDB_PRIVKEYNAME).pub \
+		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/$(WIRELESS_REGDB_PRIVKEYNAME).pub
 endef
 endif
 
-- 
2.25.0
