From: Shawn J. Goff <shawn7400@gmail.com>
Date: Wed, 17 Apr 2013 17:31:27 -0400
Subject: [Buildroot] [PATCH v2] libcurl: specify capath
Message-ID: <1366234287-8062-1-git-send-email-shawn7400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Shawn J. Goff" <shawn7400@gmail.com>

Since openssl's path is '/etc/ssl/' (specified in our openssl package),
we should also make sure that's what curl is using.

Previously, it's hasn't been specified, which means it changes depending
on the host system where it's compiled.

Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
---

Moved the option inside the BR2_PACKAGE_OPENSSL conditional.

 package/libcurl/libcurl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a631953..f0236d9 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -27,7 +27,9 @@ LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
-LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr --with-random=/dev/urandom
+LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr \
+	--with-random=/dev/urandom \
+	--with-ca-path=/etc/ssl/certs
 else
 LIBCURL_CONF_OPT += --without-ssl
 endif
-- 
1.8.1.5
