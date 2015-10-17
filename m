From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Oct 2015 12:34:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Add support for GnuTLS
Message-ID: <1445078098-18915-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Besides OpenSSL ffmpeg also supports GnuTLS.

If both GnuTLS and OpenSSL are enabled, the former takes precedence over
the latter:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=7f9fed31a491ed0991aee2d354dba82e54e3291e;hb=refs/heads/release/2.8#l2719

Introduce a Kconfig choice option to let the user decide which SSL
library ffmpeg should use. This choice also shows the fact, that OpenSSL
is incompatible with the GPL, instead of silently ignoring OpenSSL when
BR2_PACKAGE_FFMPEG_GPL is enabled.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/Config.in | 33 +++++++++++++++++++++++++++++++++
 package/ffmpeg/ffmpeg.mk | 12 +++++++-----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index e5981fe..f8fd7a2 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -70,6 +70,39 @@ config BR2_PACKAGE_FFMPEG_SWSCALE
 	help
 	  Swscale is a library of video scaling routines.
 
+if BR2_PACKAGE_GNUTLS || (BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_FFMPEG_GPL)
+
+choice
+	prompt "https support library"
+
+config BR2_PACKAGE_FFMPEG_GNUTLS
+	bool "gnutls"
+	depends on BR2_PACKAGE_GNUTLS
+
+comment "GnuTLS support not available"
+	depends on !BR2_PACKAGE_GNUTLS
+
+config BR2_PACKAGE_FFMPEG_OPENSSL
+	bool "openssl"
+	depends on !BR2_PACKAGE_FFMPEG_GPL
+	depends on BR2_PACKAGE_OPENSSL
+
+comment "OpenSSL support not available"
+	depends on !BR2_PACKAGE_OPENSSL
+
+comment "OpenSSL support is incompatible with the GPL"
+	depends on BR2_PACKAGE_FFMPEG_GPL && BR2_PACKAGE_OPENSSL
+
+endchoice
+
+endif
+
+comment "https support needs either OpenSSL or GnuTLS"
+	depends on !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_OPENSSL
+
+comment "https support using OpenSSL is incompatible with the GPL"
+	depends on !BR2_PACKAGE_GNUTLS && BR2_PACKAGE_OPENSSL && BR2_PACKAGE_FFMPEG_GPL
+
 config BR2_PACKAGE_FFMPEG_ENCODERS
 	string "Enabled encoders"
 	default "all"
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f361970..febca90 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -191,14 +191,16 @@ else
 FFMPEG_CONF_OPTS += --disable-bzlib
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-# openssl isn't license compatible with GPL
-ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
-FFMPEG_CONF_OPTS += --disable-openssl
+ifeq ($(BR2_PACKAGE_FFMPEG_GNUTLS),y)
+FFMPEG_CONF_OPTS += --enable-gnutls
+FFMPEG_DEPENDENCIES += gnutls
 else
+FFMPEG_CONF_OPTS += --disable-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_OPENSSL),y)
 FFMPEG_CONF_OPTS += --enable-openssl
 FFMPEG_DEPENDENCIES += openssl
-endif
 else
 FFMPEG_CONF_OPTS += --disable-openssl
 endif
-- 
2.6.1
