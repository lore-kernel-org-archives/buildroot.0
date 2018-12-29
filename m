From: Ryan Coe <bluemrp9@gmail.com>
Date: Sat, 29 Dec 2018 07:31:57 -0800
Subject: [Buildroot] [PATCH 1/1] msmtp: invert gnutls/openssl preference
Message-ID: <20181229153157.3432-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Msmtp no longer uses openssl as default [1]. If the configuration has both
libraries, gnutls should be preferred over openssl.

[1] https://marlam.de/msmtp/news/openssl-discouraged/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/msmtp/msmtp.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index a26de92ef9..079c7c2319 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -40,16 +40,16 @@ else
 MSMTP_CONF_OPTS += --without-libsecret
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+MSMTP_CONF_OPTS += --with-tls=gnutls
+MSMTP_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MSMTP_CONF_OPTS += --with-tls=openssl
 MSMTP_DEPENDENCIES += openssl
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 MSMTP_CONF_ENV += LIBS=-lz
 endif
-else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-MSMTP_CONF_OPTS += --with-tls=gnutls
-MSMTP_DEPENDENCIES += gnutls
 else
 MSMTP_CONF_OPTS += --with-tls=no
 endif
-- 
2.20.1
