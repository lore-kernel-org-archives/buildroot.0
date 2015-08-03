From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:23:03 +0200
Subject: [Buildroot] [git commit branch/next] package/nodejs: disable for
	static build
Message-ID: <20150808105653.1A8ED7FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0399ed064dacf5cc9ce7214a0e660dc6d8ab8b58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

nodejs requires dlopen(), etc.

Fixes:
http://autobuild.buildroot.net/results/87d/87dab0186abd7b2737a56b2f939f3aba294e8772/
http://autobuild.buildroot.net/results/be1/be1010a3a31642d49ec3a118858c77fed2f762b8/

[Thomas: add comment explaining that we could support static linking
on ARMv5, but we don't do it since it's too much of a corner case.]

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index c5ec792..329d270 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -8,17 +8,20 @@ config BR2_PACKAGE_NODEJS
 	depends on !BR2_ARM_CPU_ARMV4
 	# uses fork()
 	depends on BR2_USE_MMU
+	# uses dlopen(). On ARMv5, we could technically support static
+	# linking, but that's too much of a corner case to support it.
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
 
 	  http://nodejs.org/
 
-comment "nodejs needs a toolchain w/ C++, threads"
+comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_NODEJS
 
