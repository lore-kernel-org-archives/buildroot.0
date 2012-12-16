From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 20:35:18 +0100
Subject: [Buildroot] [git commit] package/celt051: new package
Message-ID: <20121216200126.903B29A29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a13fd5f4ceba61570cbfb22c452ee8abb898414e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: move to Libraries->Audio/Sound]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in         |    1 +
 package/celt051/Config.in |   15 +++++++++++++++
 package/celt051/celt.mk   |   30 ++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1ed77e0..f395934 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ menu "Libraries"
 menu "Audio/Sound"
 source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
+source "package/celt051/Config.in"
 source "package/libao/Config.in"
 source "package/libcdaudio/Config.in"
 source "package/libcue/Config.in"
diff --git a/package/celt051/Config.in b/package/celt051/Config.in
new file mode 100644
index 0000000..50ed069
--- /dev/null
+++ b/package/celt051/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CELT051
+	bool "celt051"
+	select BR2_PACKAGE_LIBOGG
+	help
+	  The CELT ultra-low delay audio codec
+	  
+	  The CELT codec is a compression algorithm for audio. Like MP3,
+	  Vorbis, and AAC it is suitable for transmitting music with high
+	  quality. Unlike these formats CELT imposes very little delay on
+	  the signal, even less than is typical for speech centric formats
+	  like Speex, GSM, or G.729.
+	  
+	  Note: this is version 0.5.1.3 of celt.
+	  
+	  http://www.celt-codec.org/
diff --git a/package/celt051/celt.mk b/package/celt051/celt.mk
new file mode 100644
index 0000000..9baaa82
--- /dev/null
+++ b/package/celt051/celt.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# celt051
+#
+#############################################################
+
+# Although version newer than 0.5.1.3 exists, we're
+# stuck with 0.5.1.3 for use by Spice (coming later)
+CELT051_VERSION         = 0.5.1.3
+CELT051_SOURCE          = celt-$(CELT051_VERSION).tar.gz
+CELT051_SITE            = http://downloads.xiph.org/releases/celt
+CELT051_LICENSE         = BSD-2c
+CELT051_LICENSE_FILES   = COPYING
+CELT051_INSTALL_STAGING = YES
+CELT051_DEPENDENCIES    = libogg
+
+# Need to specify --with-ogg, otherwise /usr/lib may be searched for
+# if target is the same kind as host (ie. same arch, same bitness,
+# same endianness, so that /usr/lib contains libraries linkable by
+# our cross-compiler)
+CELT051_CONF_OPT =                  \
+  --enable-fixed-point              \
+  --disable-fixed-point-debug       \
+  --disable-experimental-postfilter \
+  --disable-static-modes            \
+  --disable-assertions              \
+  --disable-oggtest                 \
+  --with-ogg=$(STAGING_DIR)/usr     \
+
+$(eval $(autotools-package))
