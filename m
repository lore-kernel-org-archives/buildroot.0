From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Aug 2017 09:15:48 +0200
Subject: [Buildroot] [PATCH] gdb: add fix for gdb 7.12 and gdb 8.0 build on
	noMMU platforms
Message-ID: <20170803071548.2876-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a patch to gdb 7.12 and gdb 8.x, which fixes the build on
noMMU platforms. It is not needed for older versions of gdb, since
it's related to the switch of gdb to C++ in the 7.12 release.

Fixes:

../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
       child_stack = xmalloc (STACK_SIZE * 4);

The patch has already been merged upstream, as of commit
ffce45d2243e5f52f411e314fc4e1a69f431a81f, and will therefore be part
of future gdb releases.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-linux-ptrace.c-add-missing-gdb_byte-cast.patch | 41 ++++++++++++++++++++++
 ...-linux-ptrace.c-add-missing-gdb_byte-cast.patch | 41 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 package/gdb/7.12.1/0006-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
 create mode 100644 package/gdb/8.0/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch

diff --git a/package/gdb/7.12.1/0006-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch b/package/gdb/7.12.1/0006-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
new file mode 100644
index 0000000..4eb72e4
--- /dev/null
+++ b/package/gdb/7.12.1/0006-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
@@ -0,0 +1,41 @@
+From 09a2c3e0164545324a1ddee70f5c9fdee71e2079 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 18 Jun 2017 23:09:43 +0200
+Subject: [PATCH] nat/linux-ptrace.c: add missing gdb_byte* cast
+
+On noMMU platforms, the following code gets compiled:
+
+  child_stack = xmalloc (STACK_SIZE * 4);
+
+Where child_stack is a gdb_byte*, and xmalloc() returns a void*. While
+the lack of cast is valid in C, it is not in C++, causing the
+following build failure:
+
+../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
+../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
+       child_stack = xmalloc (STACK_SIZE * 4);
+
+Therefore, this commit adds the appropriate cast.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Upstream commit: ffce45d2243e5f52f411e314fc4e1a69f431a81f]
+---
+ gdb/nat/linux-ptrace.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
+index 3447e07..33833e2 100644
+--- a/gdb/nat/linux-ptrace.c
++++ b/gdb/nat/linux-ptrace.c
+@@ -270,7 +270,7 @@ linux_fork_to_function (gdb_byte *child_stack, int (*function) (void *))
+ #define STACK_SIZE 4096
+ 
+     if (child_stack == NULL)
+-      child_stack = xmalloc (STACK_SIZE * 4);
++      child_stack = (gdb_byte*) xmalloc (STACK_SIZE * 4);
+ 
+     /* Use CLONE_VM instead of fork, to support uClinux (no MMU).  */
+ #ifdef __ia64__
+-- 
+2.9.4
+
diff --git a/package/gdb/8.0/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch b/package/gdb/8.0/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
new file mode 100644
index 0000000..4eb72e4
--- /dev/null
+++ b/package/gdb/8.0/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
@@ -0,0 +1,41 @@
+From 09a2c3e0164545324a1ddee70f5c9fdee71e2079 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 18 Jun 2017 23:09:43 +0200
+Subject: [PATCH] nat/linux-ptrace.c: add missing gdb_byte* cast
+
+On noMMU platforms, the following code gets compiled:
+
+  child_stack = xmalloc (STACK_SIZE * 4);
+
+Where child_stack is a gdb_byte*, and xmalloc() returns a void*. While
+the lack of cast is valid in C, it is not in C++, causing the
+following build failure:
+
+../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
+../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
+       child_stack = xmalloc (STACK_SIZE * 4);
+
+Therefore, this commit adds the appropriate cast.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Upstream commit: ffce45d2243e5f52f411e314fc4e1a69f431a81f]
+---
+ gdb/nat/linux-ptrace.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
+index 3447e07..33833e2 100644
+--- a/gdb/nat/linux-ptrace.c
++++ b/gdb/nat/linux-ptrace.c
+@@ -270,7 +270,7 @@ linux_fork_to_function (gdb_byte *child_stack, int (*function) (void *))
+ #define STACK_SIZE 4096
+ 
+     if (child_stack == NULL)
+-      child_stack = xmalloc (STACK_SIZE * 4);
++      child_stack = (gdb_byte*) xmalloc (STACK_SIZE * 4);
+ 
+     /* Use CLONE_VM instead of fork, to support uClinux (no MMU).  */
+ #ifdef __ia64__
+-- 
+2.9.4
+
-- 
2.9.4
