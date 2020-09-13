From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 21:56:18 +0200
Subject: [Buildroot] [git commit] package/libcap: needs MMU
Message-ID: <20200913194805.4A0438A61B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d94871d67798d178a4b47dc7486b283e6d52eaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap uses fork() since version 2.33 and
https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=ef485973d5547431782f9e5f4323eabfebb38622

So add MMU dependency to avoid the following build failure on
applications using libcap without MMU such as ntp:

/tmp/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /tmp/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libcap.a(cap_proc.o): in function `cap_launch':
/tmp/instance-0/output-1/build/libcap-2.42/libcap/cap_proc.c:912: undefined reference to `fork'

All packages that select BR2_PACKAGE_LIBCAP already have a BR2_USE_MMU
dependency, so none of them have to be changed.

Fixes:

 - http://autobuild.buildroot.org/results/89f39dae01c07977062b909079bfcd45a68060d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 5b0c827191..1fb2e7caec 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
+	depends on BR2_USE_MMU # fork()
 	help
 	  This library implements the user-space interfaces to the
 	  POSIX 1003.1e capabilities available in Linux kernels. These
@@ -12,7 +13,6 @@ if BR2_PACKAGE_LIBCAP
 
 config BR2_PACKAGE_LIBCAP_TOOLS
 	bool "install tools"
-	depends on BR2_USE_MMU
 	help
 	  Install setcap, getcap, getpcaps and capsh tools.
 
