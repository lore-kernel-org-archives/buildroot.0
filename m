From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 21:20:47 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libpjsip: add
 optional dependency on libgsm
Message-ID: <20181216201819.D7F8A7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a90e0671e393b5804cfaa0c273e9068f2ab48ab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 94e7a91092781dbb7cf882f155358334bef1e368)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index f4a57965b8..22b922586c 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -26,7 +26,6 @@ LIBPJSIP_CONF_ENV = \
 
 LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
-	--disable-gsm-codec \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
@@ -54,6 +53,16 @@ LIBPJSIP_CONF_OPTS = \
 # so we want to use it.
 LIBPJSIP_CONF_OPTS += --enable-epoll
 
+ifeq ($(BR2_PACKAGE_LIBGSM),y)
+LIBPJSIP_CONF_OPTS += \
+	--enable-gsm-codec \
+	--with-external-gsm
+LIBPJSIP_DEPENDENCIES += libgsm
+else
+LIBPJSIP_CONF_OPTS += \
+	--disable-gsm-codec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBPJSIP_DEPENDENCIES += libopenssl
 LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
