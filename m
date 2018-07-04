From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed,  4 Jul 2018 09:07:38 +0200
Subject: [Buildroot] [PATCH 4/5] dropbear: add option to disable CBC mode
 ciphers
In-Reply-To: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180704070739.7259-5-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CBC mode ciphers are considered insecure. Add an option to disable it.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/dropbear/Config.in   | 7 +++++++
 package/dropbear/dropbear.mk | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 5d6b83b6d1..d92420ac81 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -35,6 +35,13 @@ config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 	  on systems without working DNS, as connections otherwise
 	  stall until DNS times out.
 
+config BR2_PACKAGE_DROPBEAR_DISABLE_CBC
+	bool "disable CBC mode ciphers"
+	help
+	  Cipher Block Chaining (CBC) may allow an attacker to recover
+	  plaintext messages from the ciphertext. For higher security, it is
+	  recommended to disable it (and thus enable this option).
+
 config BR2_PACKAGE_DROPBEAR_SMALL
 	bool "optimize for size"
 	default y
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bb902bc7ce..dc233aab53 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -71,6 +71,10 @@ define DROPBEAR_DISABLE_STANDALONE
 	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
 endef
 
+define DROPBEAR_DISABLE_CBC_CIPHERS
+	echo '#define DROPBEAR_ENABLE_CBC_MODE 0'       >> $(@D)/localoptions.h
+endef
+
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
@@ -92,6 +96,10 @@ ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_CBC),y)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_CBC_CIPHERS
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
 DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
 else
-- 
2.16.4
