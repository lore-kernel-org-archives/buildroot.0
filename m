From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:20:11 +0100
Subject: [Buildroot] [git commit] package/olsr: enable back on musl with
 headers >= 4.15
Message-ID: <20200112211503.2110D8C562@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8033e5b87ddf631071f4b04c470933531bcb6524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

olsr has been disabled on musl three years ago by commit
4bca88c839e54a9140c06010666f5e034127b8b1.

Comments in https://github.com/OLSR/olsrd/issues/6 suggest that the
issue was due to olsr mixing kernel and userspace headers. This issue is
still open.

However, nowadays olsr builds fine on musl under those two conditions:
- musl >= 1.1.16 (i.e. with
  http://git.musl-libc.org/cgit/musl/commit/?id=04983f2272382af92eb8f8838964ff944fbb8258)
- kernels >= 4.15 (i.e. with
  https://github.com/torvalds/linux/commit/c0bace798436bca0fdc221ff61143f1376a9c3de)

So enable it back on musl with kernels >= 4.15.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/olsr/Config.in | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index 85c5b4da1f..632511fba9 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -3,9 +3,8 @@ config BR2_PACKAGE_OLSR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# doesn't build with musl,
 	# https://github.com/OLSR/olsrd/issues/6
-	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	help
 	  The Optimized Link State Routing protocol (OLSR) is a
 	  routing protocol that is optimised for mobile ad-hoc
@@ -16,7 +15,10 @@ config BR2_PACKAGE_OLSR
 
 	  http://www.olsr.org/
 
-comment "olsr needs a uClibc or glibc toolchain w/ threads, dynamic library"
+comment "olsr needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "olsr needs a musl toolchain w/ headers >= 4.15"
+	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
