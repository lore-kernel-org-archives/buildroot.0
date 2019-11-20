From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 20 Nov 2019 18:14:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: Rename older patches
In-Reply-To: <20191120171401.14663-1-petr.vorel@gmail.com>
References: <20191120171401.14663-1-petr.vorel@gmail.com>
Message-ID: <20191120171401.14663-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* add upstream commit hash
* renumber patches

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...7-fanotify-Fix-FSID_VAL_MEMBER-usage.patch | 55 +++++++++++++++++++
 .../0007-fanotify-Fix-for-musl.patch          | 31 -----------
 ...11-Fix-static-linking-with-musl-fts.patch} |  2 +-
 3 files changed, 56 insertions(+), 32 deletions(-)
 create mode 100644 package/ltp-testsuite/0007-fanotify-Fix-FSID_VAL_MEMBER-usage.patch
 delete mode 100644 package/ltp-testsuite/0007-fanotify-Fix-for-musl.patch
 rename package/ltp-testsuite/{0005-Fix-static-linking-with-musl-fts.patch => 0011-Fix-static-linking-with-musl-fts.patch} (96%)

diff --git a/package/ltp-testsuite/0007-fanotify-Fix-FSID_VAL_MEMBER-usage.patch b/package/ltp-testsuite/0007-fanotify-Fix-FSID_VAL_MEMBER-usage.patch
new file mode 100644
index 0000000000..2e80c5820f
--- /dev/null
+++ b/package/ltp-testsuite/0007-fanotify-Fix-FSID_VAL_MEMBER-usage.patch
@@ -0,0 +1,55 @@
+From f37704d6cf69c9616dfd2aee5647b7941aa2bbaa Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Sat, 16 Nov 2019 00:14:42 +0100
+Subject: [PATCH] fanotify: Fix FSID_VAL_MEMBER() usage
+
+This basically reverts part of 0498fc0a8.
+
+FSID_VAL_MEMBER() wrapper was meant to be only for struct
+fanotify_event_info_fid, it was used also for struct event_t
+(which has also __kernel_fsid_t fsid, but shouldn't be redefined).
+
+This caused error on recent musl v1.1.23 (with f67b3c17),
+which has struct fanotify_event_info_fid.
+
+Fixes: 0498fc0a8 ("fanotify: Detect val vs. __val
+fanotify_event_info_fid.fsid member")
+
+Acked-by: Jan Stancek <jstancek@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[Upstream status: f37704d6cf69c9616dfd2aee5647b7941aa2bbaa]
+---
+ testcases/kernel/syscalls/fanotify/fanotify.h   | 1 +
+ testcases/kernel/syscalls/fanotify/fanotify13.c | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
+index 5370e30bb..9c98aaa1d 100644
+--- a/testcases/kernel/syscalls/fanotify/fanotify.h
++++ b/testcases/kernel/syscalls/fanotify/fanotify.h
+@@ -143,6 +143,7 @@ struct fanotify_event_info_fid {
+ };
+ #endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID */
+ 
++/* NOTE: only for struct fanotify_event_info_fid */
+ #ifdef HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL
+ # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
+ #else
+diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
+index 26212ab62..3d8de6009 100644
+--- a/testcases/kernel/syscalls/fanotify/fanotify13.c
++++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
+@@ -130,8 +130,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
+ 					"kernel");
+ 				return 1;
+ 			} else if (errno == ENODEV &&
+-					!FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
+-					!FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
++					!event_set[i].fsid.val[0] &&
++					!event_set[i].fsid.val[1]) {
+ 				tst_res(TCONF,
+ 					"FAN_REPORT_FID not supported on "
+ 					"filesystem type %s",
+-- 
+2.23.0
+
diff --git a/package/ltp-testsuite/0007-fanotify-Fix-for-musl.patch b/package/ltp-testsuite/0007-fanotify-Fix-for-musl.patch
deleted file mode 100644
index d1d0fc08ad..0000000000
--- a/package/ltp-testsuite/0007-fanotify-Fix-for-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 087e13ecb9eea6cbd920708e64eab18e7ab8a90c Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sat, 16 Nov 2019 00:14:42 +0100
-Subject: [PATCH] fanotify: Fix for musl
-
-Fixes: 0498fc0a8 ("fanotify: Detect val vs. __val fanotify_event_info_fid.fsid member")
-
-[upstream status: https://patchwork.ozlabs.org/patch/1195915/]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- testcases/kernel/syscalls/fanotify/fanotify13.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
-index 26212ab62..3d8de6009 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify13.c
-+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
-@@ -130,8 +130,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
- 					"kernel");
- 				return 1;
- 			} else if (errno == ENODEV &&
--					!FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
--					!FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
-+					!event_set[i].fsid.val[0] &&
-+					!event_set[i].fsid.val[1]) {
- 				tst_res(TCONF,
- 					"FAN_REPORT_FID not supported on "
- 					"filesystem type %s",
--- 
-2.24.0
-
diff --git a/package/ltp-testsuite/0005-Fix-static-linking-with-musl-fts.patch b/package/ltp-testsuite/0011-Fix-static-linking-with-musl-fts.patch
similarity index 96%
rename from package/ltp-testsuite/0005-Fix-static-linking-with-musl-fts.patch
rename to package/ltp-testsuite/0011-Fix-static-linking-with-musl-fts.patch
index 9fa888d47e..161a65ecb0 100644
--- a/package/ltp-testsuite/0005-Fix-static-linking-with-musl-fts.patch
+++ b/package/ltp-testsuite/0011-Fix-static-linking-with-musl-fts.patch
@@ -13,7 +13,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/linux-test-project/ltp/pull/616]
+[Upstream status: 22f510de8072c5cacce5b2a4ca2ff97d1a6fa3ca]
 ---
  testcases/kernel/controllers/cpuset/Makefile.inc        | 2 +-
  testcases/kernel/controllers/cpuset/cpuset_lib/Makefile | 2 +-
-- 
2.24.0
