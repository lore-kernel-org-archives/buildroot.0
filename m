From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:23:08 +0100
Subject: [Buildroot] [git commit] package/asterisk: libsrtp needs openssl
Message-ID: <20181209211922.0D9BA8B759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c48bff9da6101bff35ff420030e5ab2c430352b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Please note that openssl support in libsrtp is not available for static
builds:
https://git.buildroot.net/buildroot/tree/package/libsrtp/libsrtp.mk#n27

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/asterisk/asterisk.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 4ed85743b0..6de498ed07 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -242,7 +242,8 @@ else
 ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+# asterisk needs an openssl-enabled libsrtp
+ifeq ($(BR2_PACKAGE_LIBSRTP)$(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yyx)
 ASTERISK_DEPENDENCIES += libsrtp
 ASTERISK_CONF_OPTS += --with-srtp
 else
