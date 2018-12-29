From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri, 28 Dec 2018 17:21:34 -0800
Subject: [Buildroot] [PATCH 1/1] msmtp: fix configure with openssl/gnutls
Message-ID: <20181229012134.2037-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Msmtp no longer uses openssl as default [1]. The configure options have
changed from --use-ssl to --use-tls. As a note, openssl usage is discouraged
and may be removed in the future.

[1] https://marlam.de/msmtp/news/openssl-discouraged/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/msmtp/msmtp.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index a495072abf..a26de92ef9 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -41,17 +41,17 @@ MSMTP_CONF_OPTS += --without-libsecret
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MSMTP_CONF_OPTS += --with-ssl=openssl
+MSMTP_CONF_OPTS += --with-tls=openssl
 MSMTP_DEPENDENCIES += openssl
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 MSMTP_CONF_ENV += LIBS=-lz
 endif
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-MSMTP_CONF_OPTS += --with-ssl=gnutls
+MSMTP_CONF_OPTS += --with-tls=gnutls
 MSMTP_DEPENDENCIES += gnutls
 else
-MSMTP_CONF_OPTS += --with-ssl=no
+MSMTP_CONF_OPTS += --with-tls=no
 endif
 
 $(eval $(autotools-package))
-- 
2.20.1
