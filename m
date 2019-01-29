From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Tue, 29 Jan 2019 10:39:12 +0100
Subject: [Buildroot] [PATCH v7 1/8] package/libshout: Add support for
 openssl 1.1.x
Message-ID: <20190129093919.22060-1-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

Added patch from Debian:

https://sources.debian.org/data/main/libs/libshout/2.4.1-2/debian/patches/01-libshout-tls-compile-with-OpenSSL-1.1.0.patch

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
Changes v7:
  - Restore original link to original patch in commit msg

Changes v6:
  - Added Signed-off-by to the patch
---
 ...shout-tls-compile-with-OpenSSL-1.1.0.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/libshout/0003-libshout-tls-compile-with-OpenSSL-1.1.0.patch

diff --git a/package/libshout/0003-libshout-tls-compile-with-OpenSSL-1.1.0.patch b/package/libshout/0003-libshout-tls-compile-with-OpenSSL-1.1.0.patch
new file mode 100644
index 0000000000..49b71501ed
--- /dev/null
+++ b/package/libshout/0003-libshout-tls-compile-with-OpenSSL-1.1.0.patch
@@ -0,0 +1,59 @@
+From 01fafc449f0de56743d08e7976933c49e2915bfa Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Wed, 15 Nov 2017 12:46:25 +0000
+Subject: [PATCH] tls: compile with OpenSSL 1.1.0
+
+The init functions are not longer required in OpenSSL 1.1 so I dropped
+them.
+
+TLSv1_client_method() should not be used because it enables only the
+TLSv1.0 protocol. Better is to use SSLv23_client_method() which enable
+all the protocols including TLSv1.2. With this functions SSLv2 and SSLv3
+is theoretically possible but as of today those protocols are usually
+build-time disabled.
+To avoid all this OpenSSL 1.1 provides TLS_client_method() which is aim
+to provide to highest TLS protocol version (same as
+SSLv23_client_method() but it is deprecated in 1.1).
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
+---
+ src/tls.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/tls.c b/src/tls.c
+index 4562c7327077..e0e5c1a5f079 100644
+--- a/src/tls.c
++++ b/src/tls.c
+@@ -24,6 +24,7 @@
+ #endif
+ 
+ #include <shout/shout.h>
++#include <string.h>
+ #include "shout_private.h"
+ 
+ #ifndef XXX_HAVE_X509_check_host
+@@ -61,14 +62,17 @@ shout_tls_t *shout_tls_new(shout_t *self, sock_t socket)
+ 
+ static inline int tls_setup(shout_tls_t *tls)
+ {
+-	SSL_METHOD *meth;
+-
++	const SSL_METHOD *meth;
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
+ 	SSL_library_init();
+ 	SSL_load_error_strings();
+ 	SSLeay_add_all_algorithms();
+- 	SSLeay_add_ssl_algorithms();
++	SSLeay_add_ssl_algorithms();
+ 
+-	meth = TLSv1_client_method();
++	meth = SSLv23_client_method();
++#else
++	meth = TLS_client_method();
++#endif
+ 	if (!meth)
+ 		goto error;
+ 
+-- 
+2.15.0
-- 
2.17.1
