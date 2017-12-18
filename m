From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 15:55:21 +0100
Subject: [Buildroot] [git commit] package/brltty: disable features and add
 optional dependencies
Message-ID: <20171218145711.2B1D5825C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9de1bde60a578cf3036987b29696d03800f786c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* --without-midi-package should fix a number of autobuild failures.
* Disable a number of speech drivers to avoid build failures
  if they are installed on the host.
* Optional dependency on espeak and flite fixes builds where
  espeak or flite are installed on the host.

Fixes:

  http://autobuild.buildroot.net/results/0c4f557c2ad276b1ed065119532af37c0af5f014
  http://autobuild.buildroot.net/results/ea82b7c7732821368746ddddb5d529e97c9b6c16

Signed-off-by: Mario Lang <mlang@blind.guru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/brltty/brltty.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 5ce0684..7214f10 100644
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
