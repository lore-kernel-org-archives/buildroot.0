From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:19:44 +0200
Subject: [Buildroot] [git commit] package/tvheadend: add optional support
	for libva-accelerated transcoding
Message-ID: <20170919201318.B870981076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14670c2ce2f60cd038dddcf99a42810939e5c412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tvheadend/tvheadend.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4722cb0..ee3607a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -29,6 +29,12 @@ endif
 ifeq ($(BR2_PACKAGE_TVHEADEND_TRANSCODING),y)
 TVHEADEND_CONF_OPTS += --enable-libav --enable-libx264
 TVHEADEND_DEPENDENCIES += ffmpeg x264
+ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_XORG7),yy)
+TVHEADEND_CONF_OPTS += --enable-vaapi
+TVHEADEND_DEPENDENCIES += libva
+else
+TVHEADEND_CONF_OPTS += --disable-vaapi
+endif
 ifeq ($(BR2_PACKAGE_OPUS),y)
 TVHEADEND_CONF_OPTS += --enable-libopus
 TVHEADEND_DEPENDENCIES += opus
@@ -45,6 +51,7 @@ else
 TVHEADEND_CONF_OPTS += \
 	--disable-libav \
 	--disable-libopus \
+	--disable-vaapi \
 	--disable-libx264 \
 	--disable-libx265
 endif
