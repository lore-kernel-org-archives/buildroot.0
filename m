From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:56:22 +0200
Subject: [Buildroot] [git commit] package/babeltrace2: fix tests with uclibc
Message-ID: <20200930204613.8CE5B8E519@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00a7a77ddb67828337cffd22fc965fad93cf439c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It should be noted that upstream does not want to add a --disable-tests
option: https://review.lttng.org/c/babeltrace/+/4075

Fixes:
 - http://autobuild.buildroot.org/results/1e50e1ff90c1ac2af2223365dc0cd6e1914bcd75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...test_trace_ir_ref.c-rename-user-structure.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch b/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch
new file mode 100644
index 0000000000..ac9eee82d8
--- /dev/null
+++ b/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch
@@ -0,0 +1,57 @@
+From 7a27f13c192d15cae47740f3e884bba16f15ed41 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 26 Sep 2020 22:03:10 +0200
+Subject: [PATCH] tests/lib/test_trace_ir_ref.c: rename user structure
+
+Rename user structure to bt_user to avoid the following build failure
+with uclibc:
+
+test_trace_ir_ref.c:41:8: error: redefinition of 'struct user'
+ struct user {
+        ^
+In file included from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/procfs.h:33,
+                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:25,
+                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/signal.h:329,
+                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
+                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0/glib.h:34,
+                 from ../../src/common/assert.h:28,
+                 from ../../src/lib/object.h:28,
+                 from test_trace_ir_ref.c:25:
+/home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/user.h:48:8: note: originally defined here
+ struct user
+        ^~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e4229e2b9c892b419a9d2eaa6929b80ea62dd130
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/efficios/babeltrace/pull/115]
+---
+ tests/lib/test_trace_ir_ref.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/lib/test_trace_ir_ref.c b/tests/lib/test_trace_ir_ref.c
+index d5dfa9cf..70caf29c 100644
+--- a/tests/lib/test_trace_ir_ref.c
++++ b/tests/lib/test_trace_ir_ref.c
+@@ -25,7 +25,7 @@
+ 
+ #define NR_TESTS 37
+ 
+-struct user {
++struct bt_user {
+ 	bt_trace_class *tc;
+ 	bt_stream_class *sc;
+ 	bt_event_class *ec;
+@@ -265,7 +265,7 @@ static void test_example_scenario(bt_self_component_source *self_comp)
+ 	bt_stream_class *weak_sc1 = NULL, *weak_sc2 = NULL;
+ 	bt_event_class *weak_ec1 = NULL, *weak_ec2 = NULL,
+ 			*weak_ec3 = NULL;
+-	struct user user_a = { 0 }, user_b = { 0 }, user_c = { 0 };
++	struct bt_user user_a = { 0 }, user_b = { 0 }, user_c = { 0 };
+ 
+ 	/* The only reference which exists at this point is on TC1. */
+ 	tc1 = create_tc1(self_comp);
+-- 
+2.28.0
+
