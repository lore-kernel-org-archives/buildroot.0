From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 21:29:38 +0200
Subject: [Buildroot] [git commit] package/rpm: needs gcc >= 5.x on SuperH
Message-ID: <20160530192959.C406E8010F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15b6f3ba635d0233b0a5c6327e0eb4df0a2924da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compilation triggers an ICE in gcc with gcc 4.9

../db/dist/../lock/lock_deadlock.c: In function '__lock_detect_rpmdb':
../db/dist/../lock/lock_deadlock.c:354:1: internal compiler error: Segmentation fault
 }
 ^

using this defconfig

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_RPM=y

Compiling rpm with gcc5 works fine using this defconfig:

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_GCC_VERSION_5_X=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_RPM=y

This patch adds a dependency to gcc >= 5.x to fix
http://autobuild.buildroot.net/results/e4b/e4b7705e3e148755ae34d498c860a3b9b915e0b0/

[Peter: simpify kconfig, add comment explaining why]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index c6fc3b7..ad8279e 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -2,8 +2,13 @@ comment "rpm needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 
+comment "rpm needs a toolchain w/ gcc >= 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
+
 config BR2_PACKAGE_RPM
 	bool "rpm"
+	# triggers internal compiler error
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
