From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 18 Jan 2014 09:51:39 +0100
Subject: [Buildroot] [PATCH 1/1] minidlna: Fix configure ffmpeg detection
	when OpenSSL support is enabled
Message-ID: <BLU0-SMTP258246699D2172CA1E77C80D9BB0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/c66/c663a518f65e786895d9ad8866193f70cbd6e96d//

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/minidlna/minidlna.mk |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 94c2641..174f650 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -13,13 +13,18 @@ MINIDLNA_DEPENDENCIES = \
 	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
 	host-xutil_makedepend
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MINIDLNA_FFMPEG_SSL_LIBS=-lcrypto -lssl
+endif
+
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # the configure script / Makefile forgets to link with some of the dependent
 # libraries breaking static linking, so help it along
 MINIDLNA_CONF_ENV = \
-	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
+	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm $(MINIDLNA_FFMPEG_SSL_LIBS)'
 else
 MINIDLNA_CONF_OPT = \
+	LIBS='$(MINIDLNA_FFMPEG_SSL_LIBS)' \
 	--disable-static
 endif
 
-- 
1.7.9.5
