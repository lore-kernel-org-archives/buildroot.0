From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 25 Oct 2016 21:18:59 +0530
Subject: [Buildroot] [PATCH] rsyslog: not available on musl
Message-ID: <1477410539-13478-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With musl C library, we get following error when building rsyslog:

  imfile.c: In function 'in_setupFileWatchStatic':
  imfile.c:1614:28: error: 'GLOB_BRACE' undeclared (first use in this function)
        GLOB_MARK|GLOB_NOSORT|GLOB_BRACE, NULL, &files);
                              ^
flag GLOB_BRACE is not available on musl. Since package uses it
unconditionally, we mark it not available for musl.

Fixes:
  http://autobuild.buildroot.net/results/6d4/6d480bb1e1466809d8ff119f6b35bb91df00785c/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/rsyslog/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index b3c146d..c4dc97a 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_RSYSLOG
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # modules
+	depends on !BR2_TOOLCHAIN_USES_MUSL # GLOB_BRACE
 	# Propagate the exact same dependency from libfastjson,
 	# even though rsyslog already depends on threads for itself:
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
@@ -16,8 +17,9 @@ config BR2_PACKAGE_RSYSLOG
 
 	  http://www.rsyslog.com
 
-comment "rsyslog needs a toolchain w/ threads, dynamic library"
+comment "rsyslog needs a uClibc or glibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-- 
2.6.2
