From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2016 11:51:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: not available on musl
Message-ID: <1469958682-6087-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After fixing the usual sys/cdefs.h and _P stuff the build still fails
because Openswan makes use of GLOB_ functions

/home/bernd/buildroot/br4/output/build/openswan-2.6.48/lib/libipsecconf/parser.l:200:29: error: ?GLOB_BRACE? undeclared (first use in this function)
      globresult = glob(try, GLOB_BRACE, NULL, &globbuf);
                             ^
/home/bernd/buildroot/br4/output/build/openswan-2.6.48/lib/libipsecconf/parser.l:200:29: note: each undeclared identifier is reported only once for each function it appears in
/home/bernd/buildroot/br4/output/build/openswan-2.6.48/lib/libipsecconf/parser.l:207:41: error: ?GLOB_NOMAGIC? undeclared (first use in this function)
       globresult = glob(try, GLOB_BRACE|GLOB_NOMAGIC, NULL, &globbuf);

https://github.com/xelerance/Openswan/blob/master/lib/libipsecconf/parser.l#L200
https://github.com/xelerance/Openswan/blob/master/lib/libipsecconf/parser.l#L207
[...]
                                         ^
which musl does not support:
http://www.openwall.com/lists/musl/2013/09/16/1

Fixes
http://autobuild.buildroot.net/results/70d/70da34c1528b51e92e9e60788f83733d70b33353/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openswan/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 0370143..ba5d53d 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	depends on BR2_USE_MMU # iproute2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # iproute2
+	depends on !BR2_TOOLCHAIN_USES_MUSL # GLOB_BRACE
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
 	help
@@ -9,6 +10,7 @@ config BR2_PACKAGE_OPENSWAN
 
 	  http://www.openswan.org
 
-comment "openswan needs a toolchain w/ headers >= 3.0"
+comment "openswan needs a uClibc or glibc toolchain toolchain w/ headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || \
+		BR2_TOOLCHAIN_USES_MUSL
-- 
2.8.1
