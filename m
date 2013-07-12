From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Jul 2013 21:58:55 -0300
Subject: [Buildroot] [PATCH] nodejs: not supported on old ARM cores
Message-ID: <1373590735-24767-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nodejs needs the ARM blx instruction which is only supported in v5t+
cores (v5 ISA with thumb instructions).
Disable it for lower cores. Fixes:
http://autobuild.buildroot.net/results/89e/89ee5ba047a26a8c7a612d0285b08780b70efbd4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nodejs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index aa65c6f..fea3480 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_NODEJS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_arm || BR2_i386 || BR2_x86_64
+	# ARM needs BLX, so v5t+
+	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	# uses fork()
 	depends on BR2_USE_MMU
 	help
-- 
1.8.1.5
