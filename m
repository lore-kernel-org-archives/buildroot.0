From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:39:22 +1300
Subject: [Buildroot] [git commit] package/libpjsip: disable remaining
	unspecified options
Message-ID: <20170125033933.C740B81911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7bc10247007e8ad7178864bcbd752a9e2ca10d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are a bunch of options that are left unspecified; explicitly
disable them.

The epoll case is special: the configure script is broken, and will
enable it whether we pass --enable-epoll or --disable-epoll. But that's
OK because we prefer epoll over the alternative (select). So we do not
need to fix it. Which is nice becasue the configure.ac is named
aconfigure.ac (yes, with a leading 'a'), so it does not autoreconf
nicely... :-/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpjsip/libpjsip.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index cb0d866..70dd4aa 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -36,8 +36,29 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ilbc-codec \
 	--disable-webrtc \
 	--disable-opus \
+	--disable-oss \
+	--disable-ext-sound \
+	--disable-small-filter \
+	--disable-large-filter \
+	--disable-g711-codec \
+	--disable-l16-codec \
+	--disable-g722-codec \
+	--disable-libsamplerate \
+	--disable-sdl \
+	--disable-ffmpeg \
+	--disable-v4l2 \
+	--disable-openh264 \
+	--disable-libyuv \
+	--disable-ipp \
+	--disable-ssl \
+	--disable-silk \
 	--with-external-srtp=$(STAGING_DIR)/usr
 
+# Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
+# both enable it. But that's OK, epoll is better than the alternative,
+# so we want to use it.
+LIBPJSIP_CONF_OPTS += --enable-epoll
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBPJSIP_DEPENDENCIES += openssl
 LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
