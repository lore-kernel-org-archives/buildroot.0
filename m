From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 18 Aug 2016 08:27:04 +0200
Subject: [Buildroot] [PATCH] squeezelite: needs NPTL
Message-ID: <20160818062704.GA28543@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses PTHREAD_PRIO_INHERIT, which isn't available in Linuxthreads.

Fixes:
  http://autobuild.buildroot.net/results/455/455465c332d291929c1612d18a9e7448d9c76e73/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/squeezelite/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index 79d2947..154daaa 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SQUEEZELITE
 	bool "squeezelite"
 	depends on BR2_USE_WCHAR # flac
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # alsa-lib
 	depends on BR2_USE_MMU # mpg123
 	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_ALSA_LIB
@@ -36,7 +36,7 @@ config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
 
 endif
 
-comment "squeezelite needs a toolchain w/ wchar, threads, dynamic library"
+comment "squeezelite needs a toolchain w/ wchar, NPTL, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| BR2_STATIC_LIBS
-- 
2.1.4
