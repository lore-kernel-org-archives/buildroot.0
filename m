From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:36:24 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: Add support for GnuTLS
Message-ID: <20151018134229.5AF5A81DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f7411e171d81f5fa87d16e6c370cdb2df1b8c57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Besides OpenSSL ffmpeg also supports GnuTLS.

If both GnuTLS and OpenSSL are enabled, the former takes precedence over
the latter:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=7f9fed31a491ed0991aee2d354dba82e54e3291e;hb=refs/heads/release/2.8#l2719

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 287338d..d4815ca 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -200,6 +200,11 @@ else
 FFMPEG_CONF_OPTS += --disable-libfdk-aac
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
+FFMPEG_DEPENDENCIES += gnutls
+else
+FFMPEG_CONF_OPTS += --disable-gnutls
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # openssl isn't license compatible with GPL
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
@@ -211,6 +216,7 @@ endif
 else
 FFMPEG_CONF_OPTS += --disable-openssl
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_LIBDCADEC),y)
 FFMPEG_CONF_OPTS += --enable-libdcadec
