From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Feb 2019 12:03:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix static build with
 openssl
Message-ID: <20190219110334.18185-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8f6fdbf8a21967363b737bc771252bcded4278a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ..._IFELSE-BIO_dgram_get_peer-when-static-li.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/netsnmp/0005-fix-AC_LINK_IFELSE-BIO_dgram_get_peer-when-static-li.patch

diff --git a/package/netsnmp/0005-fix-AC_LINK_IFELSE-BIO_dgram_get_peer-when-static-li.patch b/package/netsnmp/0005-fix-AC_LINK_IFELSE-BIO_dgram_get_peer-when-static-li.patch
new file mode 100644
index 0000000000..5ec4de3f9e
--- /dev/null
+++ b/package/netsnmp/0005-fix-AC_LINK_IFELSE-BIO_dgram_get_peer-when-static-li.patch
@@ -0,0 +1,30 @@
+From 9df00594114f3bd9ca8eab4e6d715ceaa7110dc5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 19 Feb 2019 11:54:29 +0100
+Subject: [PATCH] fix AC_LINK_IFELSE(BIO_dgram_get_peer) when static linking
+
+When building as a static library, AC_LINK_IFELSE(BIO_dgram_get_peer)
+fails because $LIBS (that contains -lz) is added before -lcrypto so
+invert both variables.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.d/config_os_functions | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.d/config_os_functions b/configure.d/config_os_functions
+index ba39069fe..813fda644 100644
+--- a/configure.d/config_os_functions
++++ b/configure.d/config_os_functions
+@@ -337,7 +337,7 @@ if echo " $transport_result_list " | $GREP "DTLS" > /dev/null; then
+        AC_MSG_CHECKING([[for BIO_dgram_get_peer]])
+        [
+         oldLIBS="$LIBS"
+-        LIBS="$LIBS -lcrypto"
++        LIBS="-lcrypto $LIBS"
+         AC_LINK_IFELSE(
+           [AC_LANG_PROGRAM(
+             [[#include <openssl/bio.h>]],
+-- 
+2.14.1
+
-- 
2.14.1
