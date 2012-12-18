From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 18 Dec 2012 12:21:29 +0100
Subject: [Buildroot] [PATCH] gadget-test: inherit arch dependencies from
	libaio
Message-ID: <1355829689-15812-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/7ad59020d4584a777d721352ae73ab2dd33326d7/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/gadgetfs-test/Config.in |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index a582db6..36713fc 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -6,8 +6,13 @@ config BR2_PACKAGE_GADGETFS_TEST
 
 config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
 	bool "use asynchronous i/o"
-	depends on BR2_PACKAGE_GADGETFS_TEST
 	select BR2_PACKAGE_LIBAIO
+	depends on BR2_PACKAGE_GADGETFS_TEST
+	# libaio is available only on few architectures
+	depends on \
+		BR2_arm   || BR2_armeb || BR2_avr32  || BR2_i386    || \
+		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
+		BR2_sparc || BR2_x86_64
 	help
 	  Select this to have gadgetfs-test do asynchronous I/O using
 	  the libaio library.
-- 
1.7.9.5
