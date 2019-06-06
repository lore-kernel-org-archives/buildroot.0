From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:37:53 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/netsurf: disallow
 on archs requiring ABI specific CFLAGS
Message-ID: <20190606154048.65F197F881@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb1db3ac17517e73cbd32650df1f1e8182aeff33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
http://autobuild.buildroot.net/results/67ef520d82ea529a9fe593d83a3aeae5f8b0ee5d/
http://autobuild.buildroot.net/results/eafc3e4be571d5ecee549a11530ac4e508f31782/
http://autobuild.buildroot.net/results/ba7f30833fef54162a82f4b336a72d6599594526/

The netsurf build system mixes up host and target CFLAGS, so it isn't
compatible with architectures where we pass ABI specific compiler flags (in
TARGET_ABI).

Add a _ARCH_SUPPORTS kconfig variable matching the TARGET_ABI logic we have
in package/Makefile.in, and use it to disallow netsurf for those
architectures.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 18855d79e2e86dc646182bd6f4861c491a05c624)
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
