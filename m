From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jan 2017 12:28:28 +0100
Subject: [Buildroot] [git commit] package/mpd: fix static linking with tremor
Message-ID: <20170111113212.434BE802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43b49a091e886fb1f2d411187d2929d8d17ce3a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although tremor (the library is named vorbisidec) provides a pkg-config
file, mpd does not use it to find tremor. Since version 0.20 does throw
an error instead of a warning, that's why the issue was left unnoticed
by the autobuilders.

Help mpd to find tremor by providing the path to the library and passing
LIBS through the environment. We use the host pkg-config tool to get the
correct values from the vorbisidec.pc file.

Fixes:
http://autobuild.buildroot.net/results/6b9/6b97403e70caa12c32494b1c82ce61d3e4e456f6/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 10e6b90..bee6843 100644
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
