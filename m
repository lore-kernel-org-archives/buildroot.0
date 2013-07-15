From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:33 -0500
Subject: [Buildroot] [PATCH 50/67] sysprof: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-51-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minor cleanups as well

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/sysprof/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 513a32c..d78062a 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	# In its util.h file, sysprof contains architecture-specific
 	# code
 	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
@@ -11,14 +12,17 @@ config BR2_PACKAGE_SYSPROF
 
 	  http://sysprof.com
 
+if BR2_PACKAGE_SYSPROF
+
 config BR2_PACKAGE_SYSPROF_GUI
 	bool "sysprof GUI"
-	depends on BR2_PACKAGE_SYSPROF
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLADE
 	select BR2_PACKAGE_GDK_PIXBUF
 	help
 	  GUI for the sysprof system-wide statistical profiler.
 
-comment "sysprof requires a toolchain with WCHAR support"
-        depends on !BR2_USE_WCHAR
+endif
+
+comment "sysprof requires a toolchain with WCHAR and threading support"
+        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
