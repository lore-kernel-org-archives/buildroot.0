From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:26:22 +0100
Subject: [Buildroot] [git commit] package/libcurl: use GnuTLS's default cert
 path
Message-ID: <20181203202302.E320A8A586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43b4d3ae4557b97d84c06a8a79a4f40a31c67697
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcurl doesn't find any trust path for CA certs when it cross-compiles.
When using OpenSSL, it is explicitly configured to use the SSL cert
directory with OpenSSL style hash files in it.  But with GnuTLS, it gets
nothing.

Rather than configure libcurl to use the OpenSSL directory or a bundle
file, configure it to use the GnuTLS default.  This way the CA certs
path can be configured in one place (gnutls) and then libcurl and anyone
else who uses gnutls can default to that.

Also, when libcurl with gnutls is configured to use a directory, it ends
up loading each cert three times.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcurl/libcurl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 5aa6d542ad..3bc5207951 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -50,7 +50,8 @@ LIBCURL_CONF_OPTS += -without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
-LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
+LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
+	--with-ca-fallback
 LIBCURL_DEPENDENCIES += gnutls
 else
 LIBCURL_CONF_OPTS += --without-gnutls
