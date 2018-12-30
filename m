From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:29:17 +0100
Subject: [Buildroot] [git commit] package/msmtp: prefer gnutls over openssl
Message-ID: <20181230152441.669AB815B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bc23d50fdd3952f7339183762233e0423be4390
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Msmtp no longer uses openssl as default [1], and even discourages the
use of the OpenSSL. Let's follow this upstream recommendation: if the
Buildroot configuration has both OpenSSL and GnuTLS enabled, GnuTLS
will be preferred over OpenSSL.

[1] https://marlam.de/msmtp/news/openssl-discouraged/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
