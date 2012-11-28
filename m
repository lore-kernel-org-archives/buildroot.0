From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:06 +0100
Subject: [Buildroot] [PATCH 07/51] package/celt051: new package
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-8-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in         |    1 +
 package/multimedia/celt051/Config.in |   15 +++++++++++++++
 package/multimedia/celt051/celt.mk   |   30 ++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/celt051/Config.in
 create mode 100644 package/multimedia/celt051/celt.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 273d9bc..5e8d60c 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -2,6 +2,7 @@ menu "Audio and video applications"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/bellagio/Config.in"
+source "package/multimedia/celt051/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
diff --git a/package/multimedia/celt051/Config.in b/package/multimedia/celt051/Config.in
new file mode 100644
index 0000000..50ed069
--- /dev/null
+++ b/package/multimedia/celt051/Config.in
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
diff --git a/package/multimedia/celt051/celt.mk b/package/multimedia/celt051/celt.mk
new file mode 100644
index 0000000..9baaa82
--- /dev/null
+++ b/package/multimedia/celt051/celt.mk
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
-- 
1.7.2.5
