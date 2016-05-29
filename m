From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 May 2016 14:38:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/rpm: needs gcc >= 5.x on SuperH
In-Reply-To: <1464525538-27915-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464525538-27915-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1464525538-27915-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rpm/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index c6fc3b7..5870d6a 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -2,8 +2,12 @@ comment "rpm needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 
+comment "rpm needs a toolchain w/ gcc >= 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
+
 config BR2_PACKAGE_RPM
 	bool "rpm"
+	depends on !BR2_sh || (BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh)
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
-- 
2.8.1
