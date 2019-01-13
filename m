From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 13 Jan 2019 21:47:22 +1300
Subject: [Buildroot] [PATCH v2] syslog-ng: depend on !BR2_STATIC_LIBS
Message-ID: <20190113084722.19441-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream now unconditionally requires dlfcn.h:
- https://github.com/balabit/syslog-ng/commit/01258e56abc5804f8ea977ff9ab98cc8e2fd4702

Fixes:
- http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
Changes in v2:
- update comment when toolchain prerequisites are not met (thanks Baruch)

 package/syslog-ng/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index fbc236221a..6407645974 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
@@ -15,7 +16,8 @@ config BR2_PACKAGE_SYSLOG_NG
 
 	  https://syslog-ng.org/
 
-comment "syslog-ng needs a toolchain w/ wchar, threads"
+comment "syslog-ng needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-- 
2.20.1
