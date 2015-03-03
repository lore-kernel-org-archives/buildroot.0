From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 16:10:42 -0300
Subject: [Buildroot] [PATCH 1/2] uclibc: add patch to unbreak sparc
	non-threaded builds
Message-ID: <1425409843-13569-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SPARC non-threaded builds are broken, add patch for uClibc & uClibc-ng to fix
it.

Status: upstream uClibc (so likely -ng will follow suit shortly).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-guard-tcb-offsets.h-include-with-RESET_P.patch | 31 ++++++++++++++++++++++
 ...-guard-tcb-offsets.h-include-with-RESET_P.patch | 31 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
 create mode 100644 package/uclibc/1.0.0/0001-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch

diff --git a/package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch b/package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
new file mode 100644
index 0000000..a98ee68
--- /dev/null
+++ b/package/uclibc/0.9.33.2/0067-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
@@ -0,0 +1,31 @@
+From 857420a3271dc5bbddbe45a9e9878b9dc88fd143 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 3 Mar 2015 14:56:17 -0300
+Subject: [PATCH] sparc/clone.S: guard tcb-offsets.h include with RESET_PID
+
+Status: upstream [uClibc]
+
+Otherwise we have a broken scenario with non-threading builds.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ libc/sysdeps/linux/sparc/clone.S | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libc/sysdeps/linux/sparc/clone.S b/libc/sysdeps/linux/sparc/clone.S
+index 8d9da5a..1d0e3e6 100644
+--- a/libc/sysdeps/linux/sparc/clone.S
++++ b/libc/sysdeps/linux/sparc/clone.S
+@@ -22,7 +22,9 @@
+ 
+ #include <asm/errno.h>
+ #include <asm/unistd.h>
++#ifdef RESET_PID
+ #include <tcb-offsets.h>
++#endif
+ #include <sysdep.h>
+ 
+ #define CLONE_VM	0x00000100
+-- 
+2.0.5
+
diff --git a/package/uclibc/1.0.0/0001-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch b/package/uclibc/1.0.0/0001-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
new file mode 100644
index 0000000..a98ee68
--- /dev/null
+++ b/package/uclibc/1.0.0/0001-sparc-clone.S-guard-tcb-offsets.h-include-with-RESET_P.patch
@@ -0,0 +1,31 @@
+From 857420a3271dc5bbddbe45a9e9878b9dc88fd143 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 3 Mar 2015 14:56:17 -0300
+Subject: [PATCH] sparc/clone.S: guard tcb-offsets.h include with RESET_PID
+
+Status: upstream [uClibc]
+
+Otherwise we have a broken scenario with non-threading builds.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ libc/sysdeps/linux/sparc/clone.S | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libc/sysdeps/linux/sparc/clone.S b/libc/sysdeps/linux/sparc/clone.S
+index 8d9da5a..1d0e3e6 100644
+--- a/libc/sysdeps/linux/sparc/clone.S
++++ b/libc/sysdeps/linux/sparc/clone.S
+@@ -22,7 +22,9 @@
+ 
+ #include <asm/errno.h>
+ #include <asm/unistd.h>
++#ifdef RESET_PID
+ #include <tcb-offsets.h>
++#endif
+ #include <sysdep.h>
+ 
+ #define CLONE_VM	0x00000100
+-- 
+2.0.5
+
-- 
2.0.5
