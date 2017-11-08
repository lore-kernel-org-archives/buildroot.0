From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  8 Nov 2017 07:11:43 -0500
Subject: [Buildroot] [PATCH 1/1] ntp: add patch to support for libressl
Message-ID: <20171108121143.5411-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NTP currently fails to compile against LibreSSL because of checks used
to determine the SSL library version.

Upstream-Status: Pending
http://bugs.ntp.org/show_bug.cgi?id=3401#c3

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/ntp/0004-libressl-support.patch | 107 ++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 package/ntp/0004-libressl-support.patch

diff --git a/package/ntp/0004-libressl-support.patch b/package/ntp/0004-libressl-support.patch
new file mode 100644
index 0000000000..2d046b4b09
--- /dev/null
+++ b/package/ntp/0004-libressl-support.patch
@@ -0,0 +1,107 @@
+From a3bd714d3028241c7546ded6ae6b93887a17a7fa Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Wed, 12 Jul 2017 09:14:38 -0400
+Subject: [PATCH] add libressl support
+
+Fix some preprocessor macros to add libressl support.
+
+Upstream-Status: Pending
+http://bugs.ntp.org/show_bug.cgi?id=3401#c3
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ include/libssl_compat.h                | 4 +++-
+ libntp/libssl_compat.c                 | 2 +-
+ libntp/ssl_init.c                      | 2 +-
+ ports/winnt/include/msvc_ssl_autolib.h | 2 +-
+ sntp/libevent/test/regress_ssl.c       | 4 ++--
+ 5 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/include/libssl_compat.h b/include/libssl_compat.h
+index 2a3697c..eede47b 100644
+--- a/include/libssl_compat.h
++++ b/include/libssl_compat.h
+@@ -25,8 +25,10 @@
+ #include "openssl/rsa.h"
+ 
+ #ifndef OPENSSL_VERSION_NUMBER
++#ifndef LIBRESSL_VERSION_NUMBER
+ #define OPENSSL_VERSION_NUMBER SSLEAY_VERSION_NUMBER
+ #endif
++#endif
+ 
+ #ifndef OPENSSL_VERSION_TEXT
+ #define OPENSSL_VERSION_TEXT SSLEAY_VERSION_TEXT
+@@ -37,7 +39,7 @@
+ #endif
+ 
+ /* ----------------------------------------------------------------- */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ /* ----------------------------------------------------------------- */
+ 
+ # include <openssl/objects.h>
+diff --git a/libntp/libssl_compat.c b/libntp/libssl_compat.c
+index afe4d07..dae7017 100644
+--- a/libntp/libssl_compat.c
++++ b/libntp/libssl_compat.c
+@@ -26,7 +26,7 @@
+ /* ----------------------------------------------------------------- */
+ 
+ /* ----------------------------------------------------------------- */
+-#if defined(OPENSSL) && OPENSSL_VERSION_NUMBER < 0x10100000L
++#if defined(OPENSSL) && OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ /* ----------------------------------------------------------------- */
+ 
+ #include "libssl_compat.h"
+diff --git a/libntp/ssl_init.c b/libntp/ssl_init.c
+index bebf6e1..0a27050 100644
+--- a/libntp/ssl_init.c
++++ b/libntp/ssl_init.c
+@@ -21,7 +21,7 @@
+ 
+ int ssl_init_done;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 
+ static void
+ atexit_ssl_cleanup(void)
+diff --git a/ports/winnt/include/msvc_ssl_autolib.h b/ports/winnt/include/msvc_ssl_autolib.h
+index 688b5e2..393e1c9 100644
+--- a/ports/winnt/include/msvc_ssl_autolib.h
++++ b/ports/winnt/include/msvc_ssl_autolib.h
+@@ -85,7 +85,7 @@
+  * request in the object file, depending on the SSL version and the
+  * build variant.
+  */
+-# if OPENSSL_VERSION_NUMBER >= 0x10100000L
++# if OPENSSL_VERSION_NUMBER >= 0x10100000L && ! defined(LIBRESSL_VERSION_NUMBER)
+ #  pragma comment(lib, "libcrypto" LTAG_SIZE LTAG_RTLIB LTAG_DEBUG ".lib")
+ # else
+ #  pragma comment(lib, "libeay32" LTAG_RTLIB LTAG_DEBUG ".lib")
+diff --git a/sntp/libevent/test/regress_ssl.c b/sntp/libevent/test/regress_ssl.c
+index 226a2a3..dc761dc 100644
+--- a/sntp/libevent/test/regress_ssl.c
++++ b/sntp/libevent/test/regress_ssl.c
+@@ -61,7 +61,7 @@
+ 
+ #include <string.h>
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) || defined(LIBRESSL_VERSION_NUMBER)
+ #define OpenSSL_version_num SSLeay
+ #endif /* OPENSSL_VERSION_NUMBER */
+ 
+@@ -130,7 +130,7 @@ getcert(void)
+ 	X509_set_subject_name(x509, name);
+ 	X509_set_issuer_name(x509, name);
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	X509_time_adj(X509_get_notBefore(x509), 0, &now);
+ 	now += 3600;
+ 	X509_time_adj(X509_get_notAfter(x509), 0, &now);
+-- 
+2.13.0
+
-- 
2.13.6
