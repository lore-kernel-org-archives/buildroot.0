From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 21:17:45 +0100
Subject: [Buildroot] [git commit] package/connman: add option to enable
 wireguard support
Message-ID: <20200326202533.503B1882DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cb778612565e8395c8814a047fc58cc5d746722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/connman/Config.in  | 4 ++++
 package/connman/connman.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 48a2ee421c..614b826f96 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -52,6 +52,10 @@ config BR2_PACKAGE_CONNMAN_WIFI
 	  setup). ConnMan detects the start of wpa_supplicant
 	  automatically.
 
+config BR2_PACKAGE_CONNMAN_WIREGUARD
+	bool "enable wireguard support"
+	select BR2_PACKAGE_LIBMNL
+
 config BR2_PACKAGE_CONNMAN_WISPR
 	bool "enable WISPr support"
 	depends on !BR2_STATIC_LIBS # gnutls
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 1ebfe9cf14..23e7cb7797 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -70,6 +70,13 @@ else
 CONNMAN_CONF_OPTS += --disable-wifi
 endif
 
+ifeq ($(BR2_PACKAGE_CONNMAN_WIREGUARD),y)
+CONNMAN_CONF_OPTS += --enable-wireguard
+CONNMAN_DEPENDENCIES += libmnl
+else
+CONNMAN_CONF_OPTS += --disable-wireguard
+endif
+
 ifeq ($(BR2_PACKAGE_CONNMAN_WISPR),y)
 CONNMAN_CONF_OPTS += --enable-wispr
 CONNMAN_DEPENDENCIES += gnutls
