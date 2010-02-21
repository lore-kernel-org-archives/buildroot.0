From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:47:14 +0100
Subject: [Buildroot] [PATCH 36/38] webkit: make sure that people don't try
	to build with uClibc
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1c517be59aac9a3569bd10769125d5f7229e0111.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, webkit uses the pthread_getattr_np() function (in
JavaScriptCore/runtime/Collector.cpp), and this function isn't
implemented by uClibc (see pthread.h).

So, we enforce the fact that a glibc external toolchain should be used
to build Webkit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 3c669a5..720121d 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_WEBKIT
 	bool "webkit"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_CURL
@@ -16,8 +17,8 @@ config BR2_PACKAGE_WEBKIT
 
 	  http://webkit.org/
 
-comment "webkit requires a toolchain with C++ support and WCHAR enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "webkit requires a glibc toolchain with C++ support and WCHAR enabled"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_GLIBC || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 if BR2_PACKAGE_WEBKIT
 
-- 
1.6.3.3
