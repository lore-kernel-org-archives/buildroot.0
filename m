From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:08:40 +0100
Subject: [Buildroot] [git commit] package/lirc-tools: not available on musl
Message-ID: <20160205221225.5EF517FE53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ade46eea1bf0f80dc9300f7080c8fff35dac225e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GLOB_BRACE is not supported by the musl libc:
http://www.openwall.com/lists/musl/2013/09/16/1

Upstream correctly rejected the hack proposed by me:
http://patchwork.ozlabs.org/patch/576188/
http://sourceforge.net/p/lirc/tickets/174/#b087

Fixes
http://autobuild.buildroot.net/results/603/603c4426c47220808305a416f3d60fec2d8c02a3/
http://autobuild.buildroot.net/results/c08/c08abddeb5f0d0d1adec63ab4390562e3cfe1087/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lirc-tools/Config.in b/package/lirc-tools/Config.in
index a0fbbb8..3bee094 100644
--- a/package/lirc-tools/Config.in
+++ b/package/lirc-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIRC_TOOLS
 	bool "lirc-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # GLOB_BRACE
 	# dlopen()
 	depends on !BR2_STATIC_LIBS
 	help
@@ -17,6 +18,7 @@ config BR2_PACKAGE_LIRC_TOOLS
 
 	  http://www.lirc.org/
 
-comment "lirc-tools needs a toolchain w/ threads, dynamic library"
+comment "lirc-tools needs a uClibc or (e)glibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL
