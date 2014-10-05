From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:08:19 +0200
Subject: [Buildroot] [git commit] libbsd: enable package on ARM
Message-ID: <20141005210841.4522FB09C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f25a672f2df90917f935b069d0cb2417d457d510
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rework the architecture dependency by adding a
BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS blind option.

[Thomas: slightly reword commit log.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbsd/Config.in |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index e22226a..d521f05 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -1,8 +1,13 @@
+config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	bool
+	# libbsd requires a.out.h, which is only available for those
+	# architectures: arm, x86 (and alpha, currently not supported in Buildroot;
+	# also m68k which is currently not enabled, so can't be tested.)
+	default y if BR2_arm || BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
-	# libbsd requires a.out.h, which is only available for those
-	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
-	depends on ( BR2_i386 || BR2_x86_64 )
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
@@ -15,5 +20,5 @@ config BR2_PACKAGE_LIBBSD
 	  http://libbsd.freedesktop.org/
 
 comment "libbsd needs an (e)glibc toolchain w/ threads"
-	depends on ( BR2_i386 || BR2_x86_64 )
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
