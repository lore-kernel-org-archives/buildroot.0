From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:38 -0000
Subject: [Buildroot] [git commit branch/next] package/luajit: disable for
	static build
Message-ID: <20150808105637.6E20F80414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2e8f28efac7125a6a8cf1db9087b3710101b487
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

luajit requires dlopen().

Fixes:
http://autobuild.buildroot.net/results/20d/20dfb10198f3688f92208591960192ca08280987/
http://autobuild.buildroot.net/results/c3c/c3cfdf8dfb315bf64caa9ed0f362016111fd93ac/
http://autobuild.buildroot.net/results/8cb/8cbf6207ecf7b254aeccd9ec5c07376a044e1f8f/

[Thomas: propagate the new dependency to the sysdig package, which
selects luajit.]

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/Config.in |    4 ++++
 package/sysdig/Config.in |    5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f6995e2..8ce528b 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_STATIC_LIBS # dlopen
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
@@ -32,3 +33,6 @@ config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.1"
 
 endif
+
+comment "luajit needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 3d7ee67..36d35fb 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # luajit
 	help
 	  Sysdig is open source, system-level exploration:
 	  capture system state and activity from a running Linux instance,
@@ -15,6 +16,6 @@ config BR2_PACKAGE_SYSDIG
 
 	  http://sysdig.org
 
-comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP
+comment "sysdig needs a toolchain w/ C++, dynamibc library and a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
