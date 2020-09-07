From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  7 Sep 2020 20:29:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with uclibc
Message-ID: <20200907182922.133312-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a build failure with ltp-testsuite in version 20200515

Fixes:
 - http://autobuild.buildroot.org/results/fb0a67b15482e76b379b4b4d9c43b45bb0fccae1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-fanotify.h-fix-build-with-uclibc.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch

diff --git a/package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch b/package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch
new file mode 100644
index 0000000000..5531756970
--- /dev/null
+++ b/package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch
@@ -0,0 +1,41 @@
+From cb11e718ce04261cb6ff4c09442b949da33b8797 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Sep 2020 17:55:45 +0200
+Subject: [PATCH] fanotify.h: fix build with uclibc
+
+MAX_HANDLE_SZ is used since version 20200515 and
+https://github.com/linux-test-project/ltp/commit/d20a3e8f9a794e0659277acfa9fbcf7454ba4631
+
+However, it is not defined by uclibc, so define it if needed to avoid
+the following build failure:
+
+fanotify.h:171:11: error: 'MAX_HANDLE_SZ' undeclared here (not in a function)
+  171 |  char buf[MAX_HANDLE_SZ];
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fb0a67b15482e76b379b4b4d9c43b45bb0fccae1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+[Retrieved from:
+https://github.com/linux-test-project/ltp/commit/cb11e718ce04261cb6ff4c09442b949da33b8797]
+---
+ testcases/kernel/syscalls/fanotify/fanotify.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
+index a9a431ca2f..d271578e97 100644
+--- a/testcases/kernel/syscalls/fanotify/fanotify.h
++++ b/testcases/kernel/syscalls/fanotify/fanotify.h
+@@ -139,6 +139,11 @@ struct fanotify_event_info_fid {
+ #endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL */
+ 
+ #ifdef HAVE_NAME_TO_HANDLE_AT
++
++#ifndef MAX_HANDLE_SZ
++#define MAX_HANDLE_SZ		128
++#endif
++
+ /*
+  * Helper function used to obtain fsid and file_handle for a given path.
+  * Used by test files correlated to FAN_REPORT_FID functionality.
-- 
2.28.0
