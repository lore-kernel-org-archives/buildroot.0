From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 19:25:24 +0200
Subject: [Buildroot] [git commit] libcurl: use c-ares if available
Message-ID: <20150503172942.0AAA180793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff05e241f877615c127477dcda2ba99667a8d798
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default libcurl uses the C library's DNS resolver which is
synchronous, even if an application is using libcurl's non-blocking mode
of operation.

Configure libcurl to use c-ares if it is selected so that it can resolve
addresses asynchronously if required.

[Peter: explicitly disable c-ares support if not enabled]
Signed-off-by: John Keeping <john@keeping.me.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index f0d7bac..0ce2dfd 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -46,6 +46,13 @@ LIBCURL_CONF_OPTS += --without-ssl --without-gnutls \
 	--without-polarssl --without-nss
 endif
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+LIBCURL_DEPENDENCIES += c-ares
+LIBCURL_CONF_OPTS += --enable-ares
+else
+LIBCURL_CONF_OPTS += --disable-ares
+endif
+
 # Configure curl to support libssh2
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBCURL_DEPENDENCIES += libssh2
