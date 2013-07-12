From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Jul 2013 13:31:47 +0200
Subject: [Buildroot] [git commit] nodejs: not supported on old ARM cores
Message-ID: <20130712113810.3BA709A68C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8da92a1c35c7327c49b2a96dc04d7fe80ae9bac6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nodejs needs the ARM blx instruction which is only supported in v5t+
cores (v5 ISA with thumb instructions).
Disable it for lower cores. Fixes:
http://autobuild.buildroot.net/results/89e/89ee5ba047a26a8c7a612d0285b08780b70efbd4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nodejs/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
