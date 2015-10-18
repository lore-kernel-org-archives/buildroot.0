From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Oct 2015 18:15:50 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: Improve logic for
	GnuTLS/OpenSSL
In-Reply-To: <1445184950-9386-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445184950-9386-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1445184950-9386-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch proposed by Thomas:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/129705

and improved because according to ffmpeg configure

http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=7f9fed31a491ed0991aee2d354dba82e54e3291e;hb=refs/heads/release/2.8#l4664

OpenSSL can be used in the following cases:

OpenSSL| GPL    | nonfree |
---------------------------
  no   | yes    |  no     |
  yes  | no     |  yes    |
  yes  | yes    |  yes    |
  yes  | no     |  no     |
---------------------------

If BR2_PACKAGE_FFMPEG_GPL is enabled, option BR2_PACKAGE_FFMPEG_NONFREE
has to enabled at the same time.
If BR2_PACKAGE_FFMPEG_GPL is disabled, OpenSSL can be used, regardless
of BR2_PACKAGE_FFMPEG_NONFREE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d4815ca..dd31847 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -203,19 +203,12 @@ endif
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
 FFMPEG_DEPENDENCIES += gnutls
-else
-FFMPEG_CONF_OPTS += --disable-gnutls
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-# openssl isn't license compatible with GPL
-ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
-FFMPEG_CONF_OPTS += --disable-openssl
-else
+# OpenSSL license is not compatible with the LGPL license of ffmpeg.
+else ifneq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
 FFMPEG_CONF_OPTS += --enable-openssl
 FFMPEG_DEPENDENCIES += openssl
-endif
 else
-FFMPEG_CONF_OPTS += --disable-openssl
-endif
+FFMPEG_CONF_OPTS += --disable-gnutls --disable-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDCADEC),y)
-- 
2.6.1
