From: Mario Lang <mlang@blind.guru>
Date: Mon, 18 Dec 2017 10:51:43 +0100
Subject: [Buildroot] [PATCH] package/brltty: disable features and add
 optional dependencies
Message-ID: <20171218095143.15343-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* --without-midi-package should fix a number of autobuild failures.
* Disable a number of speech drivers to avoid build failures
  if they are installed on the host.
* Optional dependency on espeak and flite fixes builds where
  espeak or flite are installed on the host.

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/brltty/brltty.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 5ce0684168..7214f10fa0 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -18,7 +18,10 @@ BRLTTY_CONF_OPTS = \
 	--disable-lisp-bindings \
 	--disable-ocaml-bindings \
 	--disable-python-bindings \
-	--disable-tcl-bindings
+	--disable-tcl-bindings \
+	--without-midi-package \
+	--without-mikropuhe --without-speechd --without-swift \
+	--without-theta --without-viavoice
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 BRLTTY_DEPENDENCIES += bluez5_utils
@@ -27,6 +30,20 @@ else
 BRLTTY_CONF_OPTS += --without-bluetooth-package
 endif
 
+ifeq ($(BR2_PACKAGE_ESPEAK),y)
+BRLTTY_DEPENDENCIES += espeak
+BRLTTY_CONF_OPTS += --with-espeak=$(TARGET_DIR)/usr
+else
+BRLTTY_CONF_OPTS += --without-espeak
+endif
+
+ifeq ($(BR2_PACKAGE_FLITE),y)
+BRLTTY_DEPENDENCIES += flite
+BRLTTY_CONF_OPTS += --with-flite=$(STAGING_DIR)/usr
+else
+BRLTTY_CONF_OPTS += --without-flite
+endif
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 BRLTTY_DEPENDENCIES += icu
 BRLTTY_CONF_OPTS += --enable-icu
-- 
2.15.0
