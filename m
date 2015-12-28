From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Dec 2015 13:18:16 -0300
Subject: [Buildroot] [PATCH] autofs: not available on static
Message-ID: <1451319496-17224-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses dlfcn & friends, fixes:
http://autobuild.buildroot.net/results/2f2/2f2dcf8d2af961c0401a4b39f96cefe691a4479b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/autofs/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/autofs/Config.in b/package/autofs/Config.in
index 2933740..dbe6674 100644
--- a/package/autofs/Config.in
+++ b/package/autofs/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AUTOFS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_STATIC_LIBS # dlfcn
 	help
 	  Autofs controls the operation of the automount daemons. The
 	  automount daemons automatically mount filesystems when they
@@ -14,6 +15,7 @@ config BR2_PACKAGE_AUTOFS
 
 	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
 
-comment "autofs needs a toolchain w/ threads, RPC"
+comment "autofs needs a toolchain w/ threads, RPC, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
2.4.10
