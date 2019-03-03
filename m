From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Mar 2019 09:47:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: fix static build with openssl
Message-ID: <20190303084719.11677-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/102796d74e63d0d203e6ac9e2094052588188e6d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tor/0001-Fix-static-linking-with-OpenSSL.patch | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
index 516dc16da3..50ea00af7a 100644
--- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
+++ b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
@@ -10,13 +10,15 @@ and remove host paths when looking for openssl.
  - Adapt the patch to make it apply on the new version.]
 [Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10 &
         0.3.4.8, 0.3.5.7]
+[Fabrice: fix detection of openssl functions in 0.3.5.8]
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- configure.ac         | 2 +-
+ configure.ac         | 4 ++--
  src/test/include.am  | 8 ++++----
  src/tools/include.am | 4 ++--
- 3 files changed, 7 insertions(+), 7 deletions(-)
+ 3 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
 index 05e1392cf..580befa6b 100644
@@ -31,6 +33,15 @@ index 05e1392cf..580befa6b 100644
      [#include <openssl/ssl.h>
       char *getenv(const char *);],
      [struct ssl_cipher_st;
+@@ -919,7 +919,7 @@ dnl Now check for particular openssl functions.
+ save_LIBS="$LIBS"
+ save_LDFLAGS="$LDFLAGS"
+ save_CPPFLAGS="$CPPFLAGS"
+-LIBS="$TOR_OPENSSL_LIBS $LIBS"
++LIBS="$TOR_OPENSSL_LIBS -lz $LIBS"
+ LDFLAGS="$TOR_LDFLAGS_openssl $LDFLAGS"
+ CPPFLAGS="$TOR_CPPFLAGS_openssl $CPPFLAGS"
+ 
 diff --git a/src/test/include.am b/src/test/include.am
 index ecb768957..39a622e88 100644
 --- a/src/test/include.am
-- 
2.14.1
