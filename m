From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:04:09 +0100
Subject: [Buildroot] [git commit] package/domoticz: disable for Sourcery
	CodeBench SH 2012.09
Message-ID: <20161111140523.D90DC81DD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd8171f4c7eb60fb349f549e124c3744f8a9af32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like for prboom, domoticz trigger an internal compiler error:
[...]/hardware/MySensorsBase.cpp: In member function 'void MySensorsBase::Do_Send_Work()':
[...]/hardware/MySensorsBase.cpp:2190:6: internal compiler error: Segmentation fault

Fixes:
http://autobuild.buildroot.net/results/0ea/0eadf342f86ed71c3a4008f13a4d3e175143460d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/domoticz/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 3bd7824..f128e6f 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
+	# These result in internal compiler error
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
@@ -26,6 +28,7 @@ config BR2_PACKAGE_DOMOTICZ
 
 comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
