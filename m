From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed,  4 Jul 2018 09:07:39 +0200
Subject: [Buildroot] [PATCH 5/5] dropbear: add option to disable weak HMAC
 algorithms
In-Reply-To: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180704070739.7259-6-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sha1-96 and md5 HMAC algorithms are considered insecure.
Add an option to disable them.

Note that the md5 HMAC algorithm seems to be disabled by default in current
dropbear, but the upstream commit in which that was done
(750ec4ec4cbed4cf5e2f3c7b9de95c90d9ebd68d - "Convert #ifdef to #if, other
build changes") does not explicitly state this change as a goal. To make
sure it is not reverted in the future, explicitly disable the algorithm.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/dropbear/Config.in   | 7 +++++++
 package/dropbear/dropbear.mk | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index d92420ac81..bb7d914c06 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -42,6 +42,13 @@ config BR2_PACKAGE_DROPBEAR_DISABLE_CBC
 	  plaintext messages from the ciphertext. For higher security, it is
 	  recommended to disable it (and thus enable this option).
 
+config BR2_PACKAGE_DROPBEAR_DISABLE_WEAK_HMAC
+	bool "disable weak HMAC algorithms"
+	help
+	  Disable support for following weak HMAC algorithms:
+	  - sha1-96 HMAC
+	  - md5 HMAC
+
 config BR2_PACKAGE_DROPBEAR_SMALL
 	bool "optimize for size"
 	default y
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index dc233aab53..17e937444f 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -75,6 +75,11 @@ define DROPBEAR_DISABLE_CBC_CIPHERS
 	echo '#define DROPBEAR_ENABLE_CBC_MODE 0'       >> $(@D)/localoptions.h
 endef
 
+define DROPBEAR_DISABLE_WEAK_HMAC_ALGORITHMS
+	echo '#define DROPBEAR_SHA1_96_HMAC 0'          >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_MD5_HMAC 0'              >> $(@D)/localoptions.h
+endef
+
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
@@ -100,6 +105,10 @@ ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_CBC),y)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_CBC_CIPHERS
 endif
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_WEAK_HMAC),y)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_WEAK_HMAC_ALGORITHMS
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
 DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
 else
-- 
2.16.4
