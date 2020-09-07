From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:22:54 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: fix build with
 uclibc
Message-ID: <20200907191443.ABB118134F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=951571a7995c08b4561653c554a291aeb42de0de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a build failure with ltp-testsuite in version 20200515

Fixes:
 - http://autobuild.buildroot.org/results/fb0a67b15482e76b379b4b4d9c43b45bb0fccae1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fanotify.h-fix-build-with-uclibc.patch    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

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
