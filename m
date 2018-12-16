From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:25:12 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libcurl: use
 GnuTLS's default cert path
Message-ID: <20181216142136.8689A80DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bbd9c77893989b0697a31c70c74f9f133e1e59d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
(cherry picked from commit 43b4d3ae4557b97d84c06a8a79a4f40a31c67697)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index af82ae0c83..3dc04b15ed 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -46,7 +46,8 @@ LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)
 LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
+LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
+	--with-ca-fallback
 LIBCURL_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_LIBNSS),y)
 LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr
