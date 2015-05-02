From: John Keeping <john@keeping.me.uk>
Date: Sat,  2 May 2015 11:58:18 +0100
Subject: [Buildroot] [PATCH] libcurl: use c-ares if available
Message-ID: <de47ffa2f80c24f58f017282718c43b5d0dbc79e.1430563714.git.john@keeping.me.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default libcurl uses the C library's DNS resolver which is
synchronous, even if an application is using libcurl's non-blocking mode
of operation.

Configure libcurl to use c-ares if it is selected so that it can resolve
addresses asynchronously if required.

Signed-off-by: John Keeping <john@keeping.me.uk>
---
 package/libcurl/libcurl.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 014c5e3..825c844 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -46,6 +46,11 @@ LIBCURL_CONF_OPTS += --without-ssl --without-gnutls \
 	--without-polarssl --without-nss
 endif
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+LIBCURL_DEPENDENCIES += c-ares
+LIBCURL_CONF_OPTS += --enable-ares
+endif
+
 # Configure curl to support libssh2
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBCURL_DEPENDENCIES += libssh2
-- 
2.4.0.rc2.272.g764ef63
