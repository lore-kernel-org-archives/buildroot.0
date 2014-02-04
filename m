From: Antoine Pierlot-Garcin <antoine@bokbox.com>
Date: Tue,  4 Feb 2014 15:57:43 +0100
Subject: [Buildroot] [PATCH 1/1] gnutls: fix libz autodetection failure
Message-ID: <1391525863-22787-1-git-send-email-antoine@bokbox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script finds libz in the distribution libraries, which causes
zlib support to be dropped from the cross-compiled GnuTLS.

Signed-off-by: Antoine Pierlot-Garcin <antoine@bokbox.com>
---
 package/gnutls/gnutls.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 73b525d..c0bd778 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -28,8 +28,9 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=$(if $(BR2_INET_IPV6),yes,no) \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
-# libpthread autodetection poisons the linkpath
+# libpthread and libz autodetection poison the linkpath
 GNUTLS_CONF_OPT += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
+GNUTLS_CONF_OPT += $(if $(BR2_PACKAGE_ZLIB),--with-libz-prefix=$(STAGING_DIR)/usr)
 
 # gnutls needs libregex, but pcre can be used too
 # The check isn't cross-compile friendly
-- 
1.8.5.3
