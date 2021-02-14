From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 16:17:54 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/connman: add
 option to enable wireguard support
Message-ID: <20210214150639.A36AC83A03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47fb01118eb77f4832694ed470180d2bf010bb34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2cb778612565e8395c8814a047fc58cc5d746722)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in  | 4 ++++
 package/connman/connman.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 30eae23c96..9b68a4f425 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -31,6 +31,10 @@ config BR2_PACKAGE_CONNMAN_WIFI
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
index 7ea52f012a..0142d07c1e 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -62,6 +62,13 @@ else
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
