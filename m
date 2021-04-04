From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 14:22:24 +0200
Subject: [Buildroot] [git commit] package/tvheadend: add option to enable
 descrambler support
Message-ID: <20210404120101.C7D4A81333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4989c16072c809fc3b53cff2855ee5cd68b72891
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: one option per-commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tvheadend/Config.in    |  6 ++++++
 package/tvheadend/tvheadend.mk | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 909d955c02..414892cd9e 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -28,6 +28,12 @@ config BR2_PACKAGE_TVHEADEND
 
 if BR2_PACKAGE_TVHEADEND
 
+config BR2_PACKAGE_TVHEADEND_DESCRAMBLER
+	bool "descrambler support"
+	default y
+	help
+	  Enable support for various descrambler modules.
+
 config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 114142bfa9..4043d73386 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -63,6 +63,22 @@ TVHEADEND_CONF_OPTS += \
 	--disable-libx265
 endif
 
+ifeq ($(BR2_PACKAGE_TVHEADEND_DESCRAMBLER),y)
+TVHEADEND_CONF_OPTS += \
+	--enable-cardclient \
+	--enable-cwc \
+	--enable-cccam \
+	--enable-capmt \
+	--enable-constcw
+else
+TVHEADEND_CONF_OPTS += \
+	--disable-cardclient \
+	--disable-cwc \
+	--disable-cccam \
+	--disable-capmt \
+	--disable-constcw
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
 TVHEADEND_CONF_OPTS += --enable-tvhcsa
