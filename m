From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 30 Sep 2019 00:27:56 -0700
Subject: [Buildroot] [PATCH] package/linux-headers: fix uclibc-ng build for
 xtensa
Message-ID: <20190930072756.17420-1-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Definition of struct clone_args made header include/uapi/linux/sched.h
unusable for inclusion from assembly, breaking xtensa and riscv64
uclibc-ng builds. Backport proposed fix.

Fixes:
http://autobuild.buildroot.net/results/336ba3d9f44fdded48bc71a51e8620418793770b
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ..._ASSEMBLY__-guards-around-struct-clone_ar.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/linux-headers/5.3.1/0001-sched-Add-__ASSEMBLY__-guards-around-struct-clone_ar.patch

diff --git a/package/linux-headers/5.3.1/0001-sched-Add-__ASSEMBLY__-guards-around-struct-clone_ar.patch b/package/linux-headers/5.3.1/0001-sched-Add-__ASSEMBLY__-guards-around-struct-clone_ar.patch
new file mode 100644
index 000000000000..529718b75241
--- /dev/null
+++ b/package/linux-headers/5.3.1/0001-sched-Add-__ASSEMBLY__-guards-around-struct-clone_ar.patch
@@ -0,0 +1,40 @@
+From fd7af1d35a8154c54203264cd323113cae672e80 Mon Sep 17 00:00:00 2001
+From: Seth Forshee <seth.forshee@canonical.com>
+Date: Tue, 17 Sep 2019 09:18:53 +0200
+Subject: [PATCH] sched: Add __ASSEMBLY__ guards around struct clone_args
+
+The addition of struct clone_args to uapi/linux/sched.h is not
+protected by __ASSEMBLY__ guards, causing a FTBFS for glibc on
+RISC-V. Add the guards to fix this.
+
+Fixes: 7f192e3cd316 ("fork: add clone3")
+Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
+Message-Id: <20190917071853.12385-1-seth.forshee@canonical.com>
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ include/uapi/linux/sched.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/uapi/linux/sched.h b/include/uapi/linux/sched.h
+index b3105ac1381a..851ff1feadd5 100644
+--- a/include/uapi/linux/sched.h
++++ b/include/uapi/linux/sched.h
+@@ -33,6 +33,7 @@
+ #define CLONE_NEWNET		0x40000000	/* New network namespace */
+ #define CLONE_IO		0x80000000	/* Clone io context */
+ 
++#ifndef __ASSEMBLY__
+ /*
+  * Arguments for the clone3 syscall
+  */
+@@ -46,6 +47,7 @@ struct clone_args {
+ 	__aligned_u64 stack_size;
+ 	__aligned_u64 tls;
+ };
++#endif
+ 
+ /*
+  * Scheduling policies
+-- 
+2.11.0
+
-- 
2.11.0
