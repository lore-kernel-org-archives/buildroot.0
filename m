From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 16:03:23 +0100
Subject: [Buildroot] [git commit] canfestival: disable static build
Message-ID: <20141120150517.389D07FDBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b58f417c85ed63b1dc6772313d4922514a83706
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

canfestival doesn't really support static build. The configure script accepts
the --disable-dll parameter that should in theory allow a static build. In
practice this options is not well tested, as it causes the build to fails in
various places.

Fixes:
http://autobuild.buildroot.net/results/29f/29fd3e550937f48e2270149a3d44cfb8bcf5c16a/

Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/canfestival/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
index dd0db3e..d2bfaca 100644
--- a/package/canfestival/Config.in
+++ b/package/canfestival/Config.in
@@ -2,14 +2,15 @@ config BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
 
-comment "canfestival needs a toolchain w/ threads"
+comment "canfestival needs a toolchain w/ threads and dynamic library"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_CANFESTIVAL
 	bool "canfestival"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  CanFestival is an OpenSource CANOpen framework, licensed under
 	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan and
