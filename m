From: Alexander Kurz <akurz@blala.de>
Date: Sun,  8 Sep 2019 16:08:46 +0000
Subject: [Buildroot] [PATCH 1/1] package/minimodem: new package
Message-ID: <20190908160846.17343-1-user@vserver64>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexander Kurz <akurz@blala.de>

Minimodem is a command-line program which decodes (or generates)
audio modem tones at any specified baud rate, using various
framing protocols. It acts a general-purpose software FSK modem,
and includes support for various standard FSK protocols such as
Bell103, Bell202, RTTY, TTY/TDD NOAA SAME, and Caller-ID.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 package/Config.in                |  1 +
 package/minimodem/Config.in      | 13 +++++++++++++
 package/minimodem/minimodem.hash |  2 ++
 package/minimodem/minimodem.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/minimodem/Config.in
 create mode 100644 package/minimodem/minimodem.hash
 create mode 100644 package/minimodem/minimodem.mk

diff --git a/package/Config.in b/package/Config.in
index 9336261c5d..7d915ea4d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -32,6 +32,7 @@ menu "Audio and video applications"
 	source "package/lame/Config.in"
 	source "package/madplay/Config.in"
 	source "package/mimic/Config.in"
+	source "package/minimodem/Config.in"
 	source "package/miraclecast/Config.in"
 	source "package/mjpegtools/Config.in"
 	source "package/modplugtools/Config.in"
diff --git a/package/minimodem/Config.in b/package/minimodem/Config.in
new file mode 100644
index 0000000000..6eda51e401
--- /dev/null
+++ b/package/minimodem/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MINIMODEM
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_SINGLE
+	bool "minimodem"
+	help
+	  Minimodem is a command-line program which decodes (or
+	  generates) audio modem tones at any specified baud rate,
+	  using various framing protocols. It acts a general-purpose
+	  software FSK modem, and includes support for various
+	  standard FSK protocols such as Bell103, Bell202, RTTY,
+	  TTY/TDD NOAA SAME, and Caller-ID.
+
+	  http://www.whence.com/minimodem/
diff --git a/package/minimodem/minimodem.hash b/package/minimodem/minimodem.hash
new file mode 100644
index 0000000000..084a5606fb
--- /dev/null
+++ b/package/minimodem/minimodem.hash
@@ -0,0 +1,2 @@
+sha256 f8cca4db8e3f284d67f843054d6bb4d88a3db5e77b26192410e41e9a06f4378e  minimodem-0.24.tar.gz
+sha256 c298178753129680ef6d3112f0f8b61acc405c86c1997dfe59735257988f8b33  COPYING
diff --git a/package/minimodem/minimodem.mk b/package/minimodem/minimodem.mk
new file mode 100644
index 0000000000..899f59547b
--- /dev/null
+++ b/package/minimodem/minimodem.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# minimodem
+#
+################################################################################
+
+MINIMODEM_VERSION = 0.24
+MINIMODEM_SOURCE = minimodem-$(MINIMODEM_VERSION).tar.gz
+MINIMODEM_SITE = http://www.whence.com/minimodem
+MINIMODEM_LICENSE = GPL-3.0+
+MINIMODEM_LICENSE_FILES = COPYING
+
+ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+MINIMODEM_CONF_OPTS += --without-alsa
+endif
+
+ifneq ($(BR2_PACKAGE_PULSEAUDIO),y)
+MINIMODEM_CONF_OPTS += --without-pulseaudio
+endif
+
+ifneq ($(BR2_PACKAGE_LIBSNDFILE),y)
+MINIMODEM_CONF_OPTS += --without-sndfile
+endif
+
+$(eval $(autotools-package))
-- 
2.11.0
