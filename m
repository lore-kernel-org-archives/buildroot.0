From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Oct 2015 18:52:28 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/ffmpeg: Add support for GnuTLS
Message-ID: <1445100748-1803-1-git-send-email-bernd.kuhls@t-online.de>
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
is incompatible with the GPL unless the nonfree option is enabled,
instead of silently ignoring OpenSSL when BR2_PACKAGE_FFMPEG_GPL is
enabled.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: rebased
v2: OpenSSL and gpl'ed code from ffmpeg play together when nonfree

 package/ffmpeg/Config.in | 38 ++++++++++++++++++++++++++++++++++++++
 package/ffmpeg/ffmpeg.mk | 12 +++++++-----
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index e5981fe..de253c3 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -70,6 +70,44 @@ config BR2_PACKAGE_FFMPEG_SWSCALE
 	help
 	  Swscale is a library of video scaling routines.
 
+if BR2_PACKAGE_GNUTLS || \
+	(BR2_PACKAGE_OPENSSL && \
+		(!BR2_PACKAGE_FFMPEG_GPL || \
+		BR2_PACKAGE_FFMPEG_NONFREE))
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
+	depends on !BR2_PACKAGE_FFMPEG_GPL || BR2_PACKAGE_FFMPEG_NONFREE
+	depends on BR2_PACKAGE_OPENSSL
+
+comment "OpenSSL support not available"
+	depends on !BR2_PACKAGE_OPENSSL
+
+comment "OpenSSL is incompatible with the GPL, enable nonfree"
+	depends on BR2_PACKAGE_FFMPEG_GPL && \
+		!BR2_PACKAGE_FFMPEG_NONFREE && BR2_PACKAGE_OPENSSL
+
+endchoice
+
+endif
+
+comment "https support needs either OpenSSL or GnuTLS"
+	depends on !BR2_PACKAGE_GNUTLS && !BR2_PACKAGE_OPENSSL
+
+comment "https support using OpenSSL is incompatible with the GPL, enable nonfree"
+	depends on !BR2_PACKAGE_GNUTLS && BR2_PACKAGE_OPENSSL && \
+		BR2_PACKAGE_FFMPEG_GPL && !BR2_PACKAGE_FFMPEG_NONFREE
+
 config BR2_PACKAGE_FFMPEG_ENCODERS
 	string "Enabled encoders"
 	default "all"
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 287338d..26e01e2 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -200,14 +200,16 @@ else
 FFMPEG_CONF_OPTS += --disable-libfdk-aac
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
