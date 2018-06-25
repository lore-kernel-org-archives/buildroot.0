From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:33:51 +0200
Subject: [Buildroot] [git commit] gdb: add patch to fix noMMU build issue
Message-ID: <20180625193103.D35B4822A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a98ee4582f127819c1978c8ee43b66b5acf981ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to fix a build issue encountered on noMMU
architectures when building gdbserver, due to the use of fork()
instead of vfork().

The patch has been submitted upstream:

  https://sourceware.org/ml/gdb-patches/2018-06/msg00569.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/gdb/8.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
new file mode 100644
index 0000000000..dea24725fc
--- /dev/null
+++ b/package/gdb/8.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
@@ -0,0 +1,51 @@
+From 887c667089e5417fdc7c5bbb364b027e86a7c113 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 24 Jun 2018 23:33:55 +0200
+Subject: [PATCH] nat/fork-inferior: include linux-ptrace.h
+
+To decide whether fork() or vfork() should be used, fork-inferior.c
+uses the following test:
+
+  #if !(defined(__UCLIBC__) && defined(HAS_NOMMU))
+
+However, HAS_NOMMU is never defined, because it gets defined in
+linux-ptrace.h, which is not included by fork-inferior.c. Due to this,
+gdbserver fails to build on noMMU architectures. This commit fixes
+that by simply including linux-ptrace.h.
+
+This bug was introduced by commit
+2090129c36c7e582943b7d300968d19b46160d84 ("Share fork_inferior et al
+with gdbserver"). Indeed, the same fork()/vfork() selection was done,
+but in another file where linux-ptrace.h was included.
+
+Fixes the following build issue:
+
+../nat/fork-inferior.c: In function 'pid_t fork_inferior(const char*, const string&, char**, void (*)(), void (*)(int), void (*)(), const char*, void (*)(const char*, char* const*, char* const*))':
+../nat/fork-inferior.c:376:11: error: 'fork' was not declared in this scope
+     pid = fork ();
+           ^~~~
+../nat/fork-inferior.c:376:11: note: suggested alternative: 'vfork'
+     pid = fork ();
+           ^~~~
+           vfork
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gdb/nat/fork-inferior.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
+index 8b59387fa5..05167628a6 100644
+--- a/gdb/nat/fork-inferior.c
++++ b/gdb/nat/fork-inferior.c
+@@ -26,6 +26,7 @@
+ #include "common-gdbthread.h"
+ #include "signals-state-save-restore.h"
+ #include "gdb_tilde_expand.h"
++#include "linux-ptrace.h"
+ #include <vector>
+ 
+ extern char **environ;
+-- 
+2.14.4
+
