From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 11:48:38 +0200
Subject: [Buildroot] [git commit] uclibc: remove obsolete patches
Message-ID: <20150715095359.325817FAE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d03a8e4c94f29591adae7f78a1c3e4d14b3796c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches are in 1.0.4 release included.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../1.0.3/0001-Fix-libgcc_s_resume-issue.patch     |   56 --------------------
 package/uclibc/1.0.3/0002-fix-parallel-build.patch |   21 -------
 2 files changed, 0 insertions(+), 77 deletions(-)

diff --git a/package/uclibc/1.0.3/0001-Fix-libgcc_s_resume-issue.patch b/package/uclibc/1.0.3/0001-Fix-libgcc_s_resume-issue.patch
deleted file mode 100644
index 2d64b98..0000000
--- a/package/uclibc/1.0.3/0001-Fix-libgcc_s_resume-issue.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 8f3bfd31864c28bf5901fc92e0405c729c2204c9 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 14 Jun 2015 13:19:43 +0200
-Subject: [PATCH] Fix libgcc_s_resume issue
-
-When built with gcc 5.1, uClibc-ng fails to build with the following
-issue:
-
-    LD librt-0.9.33.2.so
-  librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
-  rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
-  collect2: error: ld returned 1 exit status
-  make[2]: *** [lib/librt.so] Error 1
-
-This commit fixes the code in a way similar to what was done in glibc
-in commit:
-
-   https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=175cef4163dd60f95106cfd5f593b8a4e09d02c9
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c | 3 ++-
- libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c       | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
-index f4d6f41..a6a0515 100644
---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
-+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
-@@ -27,7 +27,8 @@
- #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
- 
- static void *libgcc_s_handle;
--static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
-+static void (*libgcc_s_resume) (struct _Unwind_Exception *exc)
-+  __attribute_used__;
- static _Unwind_Reason_Code (*libgcc_s_personality)
-   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
- static _Unwind_Reason_Code (*libgcc_s_forcedunwind)
-diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
-index f9a4ffb..e2e2e0b 100644
---- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
-+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
-@@ -25,7 +25,8 @@
- #define __libc_dlclose          dlclose
- #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
- 
--static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
-+static void (*libgcc_s_resume) (struct _Unwind_Exception *exc)
-+  __attribute_used__;
- static _Unwind_Reason_Code (*libgcc_s_personality)
-   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
- 
--- 
-2.1.0
-
diff --git a/package/uclibc/1.0.3/0002-fix-parallel-build.patch b/package/uclibc/1.0.3/0002-fix-parallel-build.patch
deleted file mode 100644
index d7c3091..0000000
--- a/package/uclibc/1.0.3/0002-fix-parallel-build.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-fix parallel build if UCLIBC_HAS_LOCALE is enabled for arm/xtensa
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
- 
-diff -Nur uClibc-ng-1.0.3.orig/Makefile.in uClibc-ng-1.0.3/Makefile.in
---- uClibc-ng-1.0.3.orig/Makefile.in	2015-06-13 20:26:56.000000000 +0200
-+++ uClibc-ng-1.0.3/Makefile.in	2015-06-29 20:23:26.000000000 +0200
-@@ -183,11 +183,12 @@
- headers-y += $(target-headers-sysdep)
- 
- headers: $(top_builddir)include/bits/uClibc_config.h | subdirs
-+	$(Q)$(if $(UCLIBC_HAS_LOCALE),$(MAKE) -C extra/locale locale_headers)
-+
- subdirs: $(addprefix $(top_builddir),$(subdirs))
- 
- $(pregen-headers-y): $(headers_dep)
- pregen: headers $(pregen-headers-y) $(headers_dep)
--	$(Q)$(if $(UCLIBC_HAS_LOCALE),$(MAKE) -C extra/locale locale_headers)
- 
- $(top_builddir)include/bits/sysnum.h: $(top_srcdir)extra/scripts/gen_bits_syscall_h.sh | $(top_builddir)include/bits
- 	@$(disp_gen)
