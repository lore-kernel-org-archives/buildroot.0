From: Robert Urban <urban@unix-beratung.de>
Date: Fri, 14 May 2010 14:37:24 +0200
Subject: [Buildroot] libcurl patch for package/libcurl.mk
Message-ID: <4BED4404.8070706@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apparently the boolean workaround (typedef unsigned char _Bool) gets in the way
of a native (gcc?) boolean datatype.  Below is a patch for libcurl.mk.

My buildroot version is

	BR2_VERSION="2010.05-rc2"

my host platform is Fedora-11, x86_64.

cheers,

Rob Urban

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 863c301..f9e7b08 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -12,6 +12,7 @@ LIBCURL_CONF_OPT = --disable-verbose --disable-manual
--enable-hidden-symbols
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
+LIBCURL_CONF_ENV += ac_cv_type_bool=yes
 # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
 # native stuff during the rest of configure when target == host.
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
