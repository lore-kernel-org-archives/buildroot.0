From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 23:40:52 +0200
Subject: [Buildroot] [PATCH] package/netsurf: disallow on archs requiring
 ABI specific CFLAGS
Message-ID: <20190531214052.14297-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/67ef520d82ea529a9fe593d83a3aeae5f8b0ee5d/
http://autobuild.buildroot.net/results/eafc3e4be571d5ecee549a11530ac4e508f31782/
http://autobuild.buildroot.net/results/ba7f30833fef54162a82f4b336a72d6599594526/

The netsurf build system mixes up host and target CFLAGS, so it isn't
compatible with architectures where we pass ABI specicif compiler flags (in
TARGET_ABI).

Add a _ARCH_SUPPORTS kconfig variable matching the TARGET_ABI logic we have
in package/Makefile.in, and use it to disallow netsurf for those
architectures.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsurf/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index 30b2695309..4f7d5c2713 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -1,10 +1,20 @@
+# netsurf mixes up host and target CFLAGS, so it isn't compatible with
+# architectures where we pass ABI specific compiler flags (TARGET_ABI)
+config BR2_PACKAGE_NETSURF_ARCH_SUPPORTS
+	bool
+	default y if !((BR2_arc && BR2_ARC_ATOMIC_EXT) || \
+		BR2_powerpc_8540 || BR2_powerpc_8548 || BR2_powerpc_e500mc || \
+		BR2_xtensa)
+
 comment "netsurf needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_NETSURF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NETSURF
 	bool "netsurf"
 	# static linking support is broken beyond repair
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_NETSURF_ARCH_SUPPORTS
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-- 
2.11.0
