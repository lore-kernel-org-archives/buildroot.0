From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 12 Sep 2018 13:18:35 +0200
Subject: [Buildroot] [PATCH] vboot-utils: fix major() build failure due to
 glibc 2.28
Message-ID: <20180912111835.35443-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major() are used.

This commit adds an upstream patch to directly include
<sys/sysmacros.h> into cgpt_wrapper.c and dump_kernel_config_lib.c files
where major() macro is used.

The upstream patch has been taken from:
https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+/435fbcee218b37a87368e2b22fa33366875d458c

Fixes:
http://autobuild.buildroot.net/results/4a2/4a21307984cb16d7879149dd9b9b062181b0388f/
http://autobuild.buildroot.net/results/899/899569165112fe577cf191cd4f0c698cbedeb9b1/
http://autobuild.buildroot.net/results/0e5/0e527d231fa791ec8e3375804f1a0043f92d73d0/
http://autobuild.buildroot.net/results/184/1849be60dd13c1debfbcfb8fba5cec113e81af62/
http://autobuild.buildroot.net/results/38f/38fcefe4feabfd95692cf6b3f7ecf84259fca4de/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...05-include-sys-sysmacros.h-for-major.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch

diff --git a/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch b/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
new file mode 100644
index 0000000000..5d76428eb6
--- /dev/null
+++ b/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
@@ -0,0 +1,51 @@
+From 435fbcee218b37a87368e2b22fa33366875d458c Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@chromium.org>
+Date: Tue, 19 Apr 2016 13:58:49 -0400
+Subject: [PATCH] include sys/sysmacros.h for major()
+
+The major() func is defined in the sys/sysmacros.h header, so include it
+explicitly for the prototype.  Upstream C libs are moving away from having
+sys/types.h include it all the time implicitly.
+
+BUG=None
+TEST=precq passes
+BRANCH=None
+
+Change-Id: I56b84138f08ded2376193403f9c9db22c5f24f71
+Reviewed-on: https://chromium-review.googlesource.com/339680
+Commit-Ready: Mike Frysinger <vapier@chromium.org>
+Tested-by: Mike Frysinger <vapier@chromium.org>
+Reviewed-by: Bill Richardson <wfrichar@google.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ cgpt/cgpt_wrapper.c               | 1 +
+ futility/dump_kernel_config_lib.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/cgpt/cgpt_wrapper.c b/cgpt/cgpt_wrapper.c
+index dcfaab9c..1716cdde 100644
+--- a/cgpt/cgpt_wrapper.c
++++ b/cgpt/cgpt_wrapper.c
+@@ -18,6 +18,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
+diff --git a/futility/dump_kernel_config_lib.c b/futility/dump_kernel_config_lib.c
+index 4fe990c3..abf37ae1 100644
+--- a/futility/dump_kernel_config_lib.c
++++ b/futility/dump_kernel_config_lib.c
+@@ -10,6 +10,7 @@
+ #include <string.h>
+ #include <sys/mman.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
+-- 
+2.17.1
+
-- 
2.17.1
