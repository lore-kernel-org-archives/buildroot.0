From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 May 2021 08:58:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: needs threads
Message-ID: <20210520065826.154984-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build without threads fails because demo apps are not disabled since
commit 5f154799b6ed772a0c028072996e110fac131508

Fixes:
 - http://autobuild.buildroot.org/results/9db945ce0709f4116d2c1c7544322144b6e473bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bullet/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bullet/Config.in b/package/bullet/Config.in
index 1f632b8931..0c420e8212 100644
--- a/package/bullet/Config.in
+++ b/package/bullet/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BULLET
 	bool "bullet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
 	  Bullet is a Collision Detection and Rigid Body Dynamics
@@ -9,6 +10,6 @@ config BR2_PACKAGE_BULLET
 
 	  http://bulletphysics.org
 
-comment "bullet needs a toolchain w/ C++, dynamic library, wchar"
+comment "bullet needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.30.2
