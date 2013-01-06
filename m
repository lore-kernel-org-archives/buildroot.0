From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:20 +0100
Subject: [Buildroot] [PATCH 08/28] x11r7: do not globally select libraries
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d72dbd3289911f78a4e38a783cbddafd3cfd5fef.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It doesn't make sense for BR2_PACKAGE_XORG7 to globally select
libraries such as libpng, zlib, expat or fontconfig. For example, if
you do a build with just xlib_libX11, then libpng gets built as the
last package, without anybody actually depending on it, even if it was
selected by BR2_PACKAGE_XORG7.

The individual x11r7 packages should select the libraries they need,
and add them in their DEPENDENCIES variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 6940725..706574c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -1,9 +1,5 @@
 menuconfig BR2_PACKAGE_XORG7
 	bool "X.org X Window System"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_FONTCONFIG
 	depends on BR2_USE_WCHAR
 	help
 	  Support for X11R7 libraries, servers, drivers, and/or
-- 
1.7.9.5
