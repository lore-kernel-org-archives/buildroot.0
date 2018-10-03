From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Oct 2018 21:08:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/asterisk: libsrtp needs openssl
Message-ID: <20181003190829.28477-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes configure error

checking for the ability of -lsrtp2 to be linked in a shared object... yes
checking for srtp_crypto_policy_set_aes_cm_256_hmac_sha1_80 in -lsrtp2... yes
checking for srtp_crypto_policy_set_aes_cm_192_hmac_sha1_80 in -lsrtp2... no
checking for srtp_crypto_policy_set_aes_gcm_128_8_auth in -lsrtp2... no
checking for srtp_shutdown in -lsrtp2... yes
checking for srtp2/srtp.h... (cached) yes
configure: WARNING: ***
configure: WARNING: *** OpenSSL required when using libsrtp2, checking for libsrtp instead.
configure: WARNING: ***

using this defconfig:

BR2_PACKAGE_LIBSRTP=y
BR2_PACKAGE_ASTERISK=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/asterisk/asterisk.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 9480d6ba82..c3f1136068 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -245,7 +245,8 @@ else
 ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+# asterisk needs an openssl-enabled libsrtp
+ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yyx)
 ASTERISK_DEPENDENCIES += libsrtp
 ASTERISK_CONF_OPTS += --with-srtp
 else
-- 
2.19.0
