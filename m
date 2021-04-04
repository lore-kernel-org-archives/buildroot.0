From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 14:22:37 +0200
Subject: [Buildroot] [git commit] package/tvheadend: add option to enable
 Satellite/IP support
Message-ID: <20210404120101.D68F57FA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09c71669ab700fd3a81cb37869abe8cc80cf31a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: one option per-commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tvheadend/Config.in    | 6 ++++++
 package/tvheadend/tvheadend.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 414892cd9e..d96d199898 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -34,6 +34,12 @@ config BR2_PACKAGE_TVHEADEND_DESCRAMBLER
 	help
 	  Enable support for various descrambler modules.
 
+config BR2_PACKAGE_TVHEADEND_SATIP
+	bool "SAT>IP support"
+	default y
+	help
+	  Enable SAT>IP support.
+
 config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4043d73386..9a007ce8d1 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -79,6 +79,12 @@ TVHEADEND_CONF_OPTS += \
 	--disable-constcw
 endif
 
+ifeq ($(BR2_PACKAGE_TVHEADEND_SATIP),y)
+TVHEADEND_CONF_OPTS += --enable-satip_client --enable-satip_server
+else
+TVHEADEND_CONF_OPTS += --disable-satip_client --disable-satip_server
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
 TVHEADEND_CONF_OPTS += --enable-tvhcsa
