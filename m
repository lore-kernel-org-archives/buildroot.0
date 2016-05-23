From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 17:09:53 +0200
Subject: [Buildroot] [git commit] ruby: fix build for nommu
Message-ID: <20160523151002.AA65580DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cefd7a7bbeb67c4deacd74c1a2447b1c4cf6a64d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a8b/a8b5fe95bbc1b3cc23db828fbc80d815c88f18c2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-process.c-fix-rb_spawn_process-for-nommu.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/ruby/0001-process.c-fix-rb_spawn_process-for-nommu.patch b/package/ruby/0001-process.c-fix-rb_spawn_process-for-nommu.patch
new file mode 100644
index 0000000..701c105
--- /dev/null
+++ b/package/ruby/0001-process.c-fix-rb_spawn_process-for-nommu.patch
@@ -0,0 +1,34 @@
+From 24e6d5bcf791a5c3f46191e544731420ff8b1312 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 19 May 2016 11:10:02 -0300
+Subject: [PATCH] process.c: fix rb_spawn_process() for nommu
+
+rb_spawn_process() in process.c tries different solutions for when fork
+and/or spawnv are/aren't available.
+The last resort when both aren't is to use the system() call which
+stores the value in the status variable, which isn't declared.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: reported https://bugs.ruby-lang.org/issues/12398
+
+ process.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/process.c b/process.c
+index e196639..40967f7 100644
+--- a/process.c
++++ b/process.c
+@@ -3897,6 +3897,9 @@ rb_spawn_process(struct rb_execarg *eargp, char *errmsg, size_t errmsg_buflen)
+     VALUE prog;
+     struct rb_execarg sarg;
+ #endif
++#if !defined HAVE_WORKING_FORK || !USE_SPAWNV
++    int status;
++#endif
+ 
+ #if defined HAVE_WORKING_FORK && !USE_SPAWNV
+     pid = rb_fork_async_signal_safe(NULL, rb_exec_atfork, eargp, eargp->redirect_fds, errmsg, errmsg_buflen);
+-- 
+2.7.3
+
