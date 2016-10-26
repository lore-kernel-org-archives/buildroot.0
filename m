From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 22:02:58 +0200
Subject: [Buildroot] [git commit] olsr: disable in musl configurations
Message-ID: <20161026200342.B4CB4802DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bca88c839e54a9140c06010666f5e034127b8b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

olsr doesn't build on musl, so let's disable it. The issue has been
reported upstream at https://github.com/OLSR/olsrd/issues/6.

Fixes:

  http://autobuild.buildroot.net/results/74cff8fc87d95d70840394fc049fc038797b9888/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index a49c4e0..2f3d024 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_OLSR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	# doesn't build with musl,
+	# https://github.com/OLSR/olsrd/issues/6
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  The Optimized Link State Routing protocol (OLSR) is a
 	  routing protocol that is optimised for mobile ad-hoc
@@ -13,6 +16,7 @@ config BR2_PACKAGE_OLSR
 
 	  http://www.olsr.org/
 
-comment "olsr needs a toolchain w/ threads, dynamic library"
+comment "olsr needs a uClibc or glibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		BR2_TOOLCHAIN_USES_MUSL
