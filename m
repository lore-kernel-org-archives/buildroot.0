From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  9 Oct 2018 14:49:34 +0300
Subject: [Buildroot] [PATCH] squid: bump to version 4.3
Message-ID: <b7072a8700f563656a067e4bca681327032ba31c.1539085774.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop get_certificate test avoidance patch; upstream made the test cross
compile friendly in commit 958ae827cabf (Fix cross-compile issues with
SSL_get_certificate())

Drop the patch adding <time.h>; the code does not call time() anymore.

Restore netfilter support under musl libc. Squid build fine with current
musl version.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-assume-get-certificate-ok.patch      | 21 --------------
 .../squid/0002-missing-include-time_h.patch   | 28 -------------------
 package/squid/squid.hash                      |  8 +++---
 package/squid/squid.mk                        |  6 ++--
 4 files changed, 6 insertions(+), 57 deletions(-)
 delete mode 100644 package/squid/0001-assume-get-certificate-ok.patch
 delete mode 100644 package/squid/0002-missing-include-time_h.patch

diff --git a/package/squid/0001-assume-get-certificate-ok.patch b/package/squid/0001-assume-get-certificate-ok.patch
deleted file mode 100644
index d3c075a59a7e..000000000000
--- a/package/squid/0001-assume-get-certificate-ok.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-The openssl get_certificate working test isn't cross compile friendly.
-Just assume it works ok since we're using a modern OpenSSL version.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Bernd: Rebased for 4.2]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -Nura squid-3.5.1.orig/configure.ac squid-3.5.1/configure.ac
---- squid-3.5.1.orig/configure.ac	2015-01-27 11:09:15.035711981 -0300
-+++ squid-3.5.1/configure.ac	2015-01-27 11:09:25.829084482 -0300
-@@ -1377,10 +1377,6 @@
-       ])
-     SQUID_STATE_ROLLBACK(check_SSL_CTX_get0_certificate)
- 
--    # check for other specific broken implementations
--    if test "x$missing_SSL_CTX_get0_certificate" = "xyes"; then
--      SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
--    fi
-     SQUID_CHECK_OPENSSL_CONST_SSL_METHOD
-     SQUID_CHECK_OPENSSL_CONST_CRYPTO_EX_DATA
-     SQUID_CHECK_OPENSSL_CONST_SSL_SESSION_CB_ARG
diff --git a/package/squid/0002-missing-include-time_h.patch b/package/squid/0002-missing-include-time_h.patch
deleted file mode 100644
index 18b3ab3b555f..000000000000
--- a/package/squid/0002-missing-include-time_h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-ipc/Kid.cc: add missing include of time.h
-
-Function time() comes from <time.h>, so add the necessary include.
-This fixes compilation on some configurations, for example
-http://autobuild.buildroot.net/results/b33/b33e1f41e50b6e7ac3e30806b9a617d451bc27b4/
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-Upstream-status: submitted (http://bugs.squid-cache.org/show_bug.cgi?id=3967)
-
----
- src/ipc/Kid.cc |  4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-
-diff --git a/src/ipc/Kid.cc b/src/ipc/Kid.cc
---- a/src/ipc/Kid.cc
-+++ b/src/ipc/Kid.cc
-@@ -11,6 +11,10 @@
- #include <sys/wait.h>
- #endif
- 
-+#if HAVE_TIME_H
-+#include <time.h>
-+#endif
-+
- int TheProcessKind = pkOther;
- 
- Kid::Kid():
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 47c7e1bb2146..195477359a4b 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.2.tar.xz.asc
-md5 2cf3f5f183d04322d798f98ea5ead43f squid-4.2.tar.xz
-sha1 77fd6f06e6028780faf85ba7e7e9aef0922e9dc0 squid-4.2.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.3.tar.xz.asc
+md5 ebb67abaec4db9d298c0edd8e1ffaca4 squid-4.3.tar.xz
+sha1 690540e7d0904e3959557f8beca45dbac1c94578 squid-4.3.tar.xz
 # Locally calculated
-sha256 994807762c59991b32449caf29418fd0ec9d2329746b18eb19bd930b6806d208 squid-4.2.tar.xz
+sha256 322612ef0544828f6c673a25124b32364fb41ef5e2847e21c89480b5546a4c7c squid-4.3.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6675cab79007..9335615559eb 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.2
+SQUID_VERSION = 4.3
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
-# For 0001-assume-get-certificate-ok.patch
-SQUID_AUTORECONF = YES
 SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
@@ -25,7 +23,7 @@ SQUID_CONF_ENV = \
 	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
 SQUID_CONF_OPTS = \
 	--enable-async-io=8 \
-	$(if $(BR2_TOOLCHAIN_USES_MUSL),--disable-linux-netfilter,--enable-linux-netfilter) \
+	--enable-linux-netfilter \
 	--enable-removal-policies="lru,heap" \
 	--with-filedescriptors=1024 \
 	--disable-ident-lookups \
-- 
2.19.1
