From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 14:05:31 +0200
Subject: [Buildroot] [git commit branch/next] libopusenc: new package
Message-ID: <20180519120519.E9DBC88E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7fae441c9064207a0fa21c18134358e26c800b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The libopusenc library provides a high-level API for encoding opus audio files
and live streams.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas: add missing select on opus in Config.in file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libopusenc/Config.in       |  8 ++++++++
 package/libopusenc/libopusenc.hash |  3 +++
 package/libopusenc/libopusenc.mk   | 16 ++++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b910a86a8c..7fc7e354d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1045,6 +1045,7 @@ F:	configs/bananapro_defconfig
 F:	package/augeas/
 F:	package/bctoolbox/
 F:	package/freescale-imx/imx-alsa-plugins/
+F:	package/libopusenc/
 F:	package/libshout/
 F:	package/libupnpp/
 F:	package/luv/
diff --git a/package/Config.in b/package/Config.in
index ecee4938c9..1d6ddee8ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1359,6 +1359,7 @@ menu "Multimedia"
 	source "package/libmpeg2/Config.in"
 	source "package/libogg/Config.in"
 	source "package/libopenh264/Config.in"
+	source "package/libopusenc/Config.in"
 	source "package/libplayer/Config.in"
 	source "package/libtheora/Config.in"
 	source "package/libvpx/Config.in"
diff --git a/package/libopusenc/Config.in b/package/libopusenc/Config.in
new file mode 100644
index 0000000000..4b29f9b82c
--- /dev/null
+++ b/package/libopusenc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBOPUSENC
+	bool "libopusenc"
+	select BR2_PACKAGE_OPUS
+	help
+	  The libopusenc library provides a high-level API for
+	  encoding opus audio files and live streams.
+
+	  http://opus-codec.org
diff --git a/package/libopusenc/libopusenc.hash b/package/libopusenc/libopusenc.hash
new file mode 100644
index 0000000000..1eea51b6bc
--- /dev/null
+++ b/package/libopusenc/libopusenc.hash
@@ -0,0 +1,3 @@
+# From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
+sha256  02e6e0b14cbbe0569d948a46420f9c9a81d93bba32dc576a4007cbf96da68ef3  libopusenc-0.1.1.tar.gz
+sha256  93b17ab56b8230127fea532be0dcb4e6d71e66ab5e8ce5d6ae8785d7288b164f  COPYING
diff --git a/package/libopusenc/libopusenc.mk b/package/libopusenc/libopusenc.mk
new file mode 100644
index 0000000000..0debe85c71
--- /dev/null
+++ b/package/libopusenc/libopusenc.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libopusenc
+#
+################################################################################
+
+LIBOPUSENC_VERSION = 0.1.1
+LIBOPUSENC_SITE = https://downloads.xiph.org/releases/opus
+LIBOPUSENC_LICENSE = BSD-3-Clause
+LIBOPUSENC_LICENSE_FILES = COPYING
+LIBOPUSENC_INSTALL_STAGING = YES
+LIBOPUSENC_DEPENDENCIES = host-pkgconf opus
+
+LIBOPUSENC_CONF_OPTS = --disable-examples
+
+$(eval $(autotools-package))
