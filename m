From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Jun 2015 19:04:58 +0200
Subject: [Buildroot] [PATCHv2] uclibc: add libgcc_s_resume fix
Message-ID: <1435079098-8424-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a fix for building uClibc 0.9.33.2 and uClibc-ng
1.0.3 with gcc 5.1 on ARM, since we're about to add support for gcc
5.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes since v1:
 - Fix commit log issues
---
 .../0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch  | 56 ++++++++++++++++++++++
 .../1.0.3/0001-Fix-libgcc_s_resume-issue.patch     | 56 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
 create mode 100644 package/uclibc/1.0.3/0001-Fix-libgcc_s_resume-issue.patch

diff --git a/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch b/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
new file mode 100644
index 0000000..287405d
--- /dev/null
+++ b/package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
@@ -0,0 +1,56 @@
+From 7ed8bacef45a2537646e7235092bd2e5408cd0b5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 14 Jun 2015 15:14:22 +0200
+Subject: [PATCH] Fix libgcc_s_resume issue
+
+When built with gcc 5.1, uClibc fails to build with the following
+issue:
+
+    LD librt-0.9.33.2.so
+  librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
+  rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
+  collect2: error: ld returned 1 exit status
+  make[2]: *** [lib/librt.so] Error 1
+
+This commit fixes the code in a way similar to what was done in glibc
+in commit:
+
+   https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=175cef4163dd60f95106cfd5f593b8a4e09d02c9
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c | 3 ++-
+ libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c       | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
+index f4d6f41..a6a0515 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
+@@ -27,7 +27,8 @@
+ #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
+ 
+ static void *libgcc_s_handle;
+-static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
++static void (*libgcc_s_resume) (struct _Unwind_Exception *exc)
++  __attribute_used__;
+ static _Unwind_Reason_Code (*libgcc_s_personality)
+   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
+ static _Unwind_Reason_Code (*libgcc_s_forcedunwind)
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
+index f9a4ffb..e2e2e0b 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
+@@ -25,7 +25,8 @@
+ #define __libc_dlclose          dlclose
+ #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
+ 
+-static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
++static void (*libgcc_s_resume) (struct _Unwind_Exception *exc)
++  __attribute_used__;
+ static _Unwind_Reason_Code (*libgcc_s_personality)
+   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
+ 
+-- 
+2.1.0
+
diff --git a/package/uclibc/1.0.3/0001-Fix-libgcc_s_resume-issue.patch b/package/uclibc/1.0.3/0001-Fix-libgcc_s_resume-issue.patch
new file mode 100644
index 0000000..2d64b98
--- /dev/null
+++ b/package/uclibc/1.0.3/0001-Fix-libgcc_s_resume-issue.patch
@@ -0,0 +1,56 @@
+From 8f3bfd31864c28bf5901fc92e0405c729c2204c9 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 14 Jun 2015 13:19:43 +0200
+Subject: [PATCH] Fix libgcc_s_resume issue
+
+When built with gcc 5.1, uClibc-ng fails to build with the following
+issue:
+
+    LD librt-0.9.33.2.so
+  librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
+  rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
+  collect2: error: ld returned 1 exit status
+  make[2]: *** [lib/librt.so] Error 1
+
+This commit fixes the code in a way similar to what was done in glibc
+in commit:
+
+   https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=175cef4163dd60f95106cfd5f593b8a4e09d02c9
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c | 3 ++-
+ libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c       | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
+index f4d6f41..a6a0515 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
+@@ -27,7 +27,8 @@
+ #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
+ 
+ static void *libgcc_s_handle;
+-static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
++static void (*libgcc_s_resume) (struct _Unwind_Exception *exc)
++  __attribute_used__;
+ static _Unwind_Reason_Code (*libgcc_s_personality)
+   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
+ static _Unwind_Reason_Code (*libgcc_s_forcedunwind)
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
+index f9a4ffb..e2e2e0b 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
+@@ -25,7 +25,8 @@
+ #define __libc_dlclose          dlclose
+ #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
+ 
+-static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
++static void (*libgcc_s_resume) (struct _Unwind_Exception *exc)
++  __attribute_used__;
+ static _Unwind_Reason_Code (*libgcc_s_personality)
+   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
+ 
+-- 
+2.1.0
+
-- 
2.1.0
