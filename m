From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 May 2021 23:18:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: needs wchar
Message-ID: <20210514211801.2261810-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bullet needs wchar since bump to version 3.09 in commit
28b4947ed8f53c4edfbf8fef9304dc76480c01ca:

/home/giuliobenetti/autobuild/run/instance-0/output-1/build/bullet-3.09/examples/ThirdPartyLibs/Gwen/Structures.h:42:14: error: 'wstring' in namespace 'std' does not name a type
   42 | typedef std::wstring UnicodeString;
      |              ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2b1158970fc45e9ebd4be4d726352166ed417a1f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bullet/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bullet/Config.in b/package/bullet/Config.in
index 5d8a57aa47..1f632b8931 100644
--- a/package/bullet/Config.in
+++ b/package/bullet/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_BULLET
 	bool "bullet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_USE_WCHAR
 	help
 	  Bullet is a Collision Detection and Rigid Body Dynamics
 	  Library.
 
 	  http://bulletphysics.org
 
-comment "bullet needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "bullet needs a toolchain w/ C++, dynamic library, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
-- 
2.30.2
