From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 16 Nov 2018 20:17:39 +0000
Subject: [Buildroot] [PATCH 2/2] libcurl: Use GnuTLS's default cert path
In-Reply-To: <20181116201718.22455-1-tpiepho@impinj.com>
References: <20181116201718.22455-1-tpiepho@impinj.com>
Message-ID: <20181116201718.22455-2-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.14.4
