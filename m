From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  3 Oct 2017 19:30:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: fix openssl detection for
	static builds
Message-ID: <20171003173044.1595-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8e6/8e639ab8912e7d884fd8e6dbb1ca8b49451dd766/

/home/test/autobuild/run/instance-1/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(c_zlib.o):
In function `zlib_stateful_expand_block':
c_zlib.c:(.text+0x54): undefined reference to `inflate'
/home/test/autobuild/run/instance-1/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(c_zlib.o):
In function `zlib_stateful_compress_block':
c_zlib.c:(.text+0xd4): undefined reference to `deflate'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/0001-openssl-libz.patch | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
index c70894eba1..9d3cf6e124 100644
--- a/package/tor/0001-openssl-libz.patch
+++ b/package/tor/0001-openssl-libz.patch
@@ -11,7 +11,12 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 diff -uNr tor-0.3.1.7.org/configure.ac tor-0.3.1.7/configure.ac
 --- tor-0.3.1.7.org/configure.ac	2017-09-15 15:34:06.000000000 +0200
 +++ tor-0.3.1.7/configure.ac	2017-09-19 19:40:17.090538467 +0200
-@@ -713,7 +713,7 @@
+@@ -709,11 +709,11 @@
+       fi
+   ])
+ 
+-TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI],
++TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI],
      [#include <openssl/rand.h>],
      [void RAND_add(const void *buf, int num, double entropy);],
      [RAND_add((void*)0,0,0);], [],
-- 
2.11.0
