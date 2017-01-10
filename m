From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 10 Jan 2017 23:23:42 +0100
Subject: [Buildroot] [PATCH] package/mpd: fix static linking with tremor
Message-ID: <20170110222342.21045-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although tremor (the library is named vorbisidec) provides a pkg-config
file, mpd does not use it to find tremor. Since version 0.20 does throw
an error instead of a warning, that's why the issue was left unnoticed
by the autobuilders.

Help mpd to find tremor by providing the path to the library and passing
LIBS through the environment. We use the host pkg-config tool to get the
correct values from the vorbisidec.pc file.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/mpd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 10e6b90dd..bee68436d 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -222,7 +222,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
 MPD_DEPENDENCIES += tremor
-MPD_CONF_OPTS += --with-tremor
+# Help mpd to find tremor in static linking scenarios
+MPD_CONF_ENV += \
+	TREMOR_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs vorbisidec`"
+MPD_CONF_OPTS += --with-tremor=$(STAGING_DIR)/usr
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_TWOLAME),y)
-- 
2.11.0
