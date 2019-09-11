From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Sep 2019 15:34:42 +0200
Subject: [Buildroot] [git commit] package/minimodem: new package
Message-ID: <20190911133610.C8E6E8DFAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b444dc2fc45198bf840c7ef7becfb494dc693e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minimodem is a command-line program which decodes (or generates)
audio modem tones at any specified baud rate, using various
framing protocols. It acts a general-purpose software FSK modem,
and includes support for various standard FSK protocols such as
Bell103, Bell202, RTTY, TTY/TDD NOAA SAME, and Caller-ID.

Signed-off-by: Alexander Kurz <akurz@blala.de>
[Thomas:
- switch from a depends on to a select for the libsndfile or
  pulseaudio or alsa dependency
- re-order statements in Config.in
- add missing host-pkgconf dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/minimodem/Config.in      | 13 +++++++++++++
 package/minimodem/minimodem.hash |  2 ++
 package/minimodem/minimodem.mk   | 35 +++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 133ae7b665..7604cfe2b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -103,6 +103,9 @@ F:	package/fastd/
 F:	package/libuecc/
 F:	package/putty/
 
+N:	Alexander Kurz <akurz@blala.de>
+F:	package/minimodem/
+
 N:	Alexander Lukichev <alexander.lukichev@espotel.com>
 F:	package/openpgm/
 
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
index 0000000000..cbf0b73db1
--- /dev/null
+++ b/package/minimodem/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MINIMODEM
+	bool "minimodem"
+	select BR2_PACKAGE_FFTW_SINGLE
+	select BR2_PACKAGE_LIBSNDFILE if !BR2_PACKAGE_ALSA_LIB_PCM && !BR2_PACKAGE_PULSEAUDIO
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
index 0000000000..9b9ee158e8
--- /dev/null
+++ b/package/minimodem/minimodem.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# minimodem
+#
+################################################################################
+
+MINIMODEM_VERSION = 0.24
+MINIMODEM_SITE = http://www.whence.com/minimodem
+MINIMODEM_LICENSE = GPL-3.0+
+MINIMODEM_LICENSE_FILES = COPYING
+
+MINIMODEM_DEPENDENCIES = fftw-single host-pkgconf
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+MINIMODEM_DEPENDENCIES += alsa-lib
+MINIMODEM_CONF_OPTS += --with-alsa
+else
+MINIMODEM_CONF_OPTS += --without-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+MINIMODEM_DEPENDENCIES += pulseaudio
+MINIMODEM_CONF_OPTS += --with-pulseaudio
+else
+MINIMODEM_CONF_OPTS += --without-pulseaudio
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+MINIMODEM_DEPENDENCIES += libsndfile
+MINIMODEM_CONF_OPTS += --with-sndfile
+else
+MINIMODEM_CONF_OPTS += --without-sndfile
+endif
+
+$(eval $(autotools-package))
