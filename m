From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Tue,  8 Sep 2020 20:33:23 +0900
Subject: [Buildroot] [PATCH v2 5/6] package/uclibc: fix compilation errors
In-Reply-To: <20200908113324.1022230-1-damien.lemoal@wdc.com>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
Message-ID: <20200908113324.1022230-6-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add four patches to fix compilation errors when building static no MMU
uclibc. The first two patches are upstream uclibc patches on top of
version 1.0.35 tag. The following two patches are added here as
additional fixes.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 ...evert-Fix-static-linking-with-GCC-10.patch |  43 ++++++++
 ...0002-fix-static-builds-with-gcc-10.x.patch |  25 +++++
 ...-utils-getconf-Fix-compilation-error.patch | 103 ++++++++++++++++++
 .../0004-librt-avoid-compilation-error.patch  |  42 +++++++
 4 files changed, 213 insertions(+)
 create mode 100644 package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
 create mode 100644 package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
 create mode 100644 package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
 create mode 100644 package/uclibc/0004-librt-avoid-compilation-error.patch

diff --git a/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
new file mode 100644
index 0000000000..6adc827308
--- /dev/null
+++ b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
@@ -0,0 +1,43 @@
+From e80384786d7b7f895c97f2447d4b91af8eb5f0f4 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 2 Sep 2020 09:45:17 +0200
+Subject: [PATCH 1/4] Revert "Fix static linking with GCC-10"
+
+This reverts commit 5b58a1ebd89a4f05778441814e81817c82193fa3.
+
+This breaks all static builds earlier to gcc 10 :(
+Bad testing on my side.
+---
+ libc/misc/elf/dl-support.c                 | 2 +-
+ libpthread/nptl/sysdeps/generic/libc-tls.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libc/misc/elf/dl-support.c b/libc/misc/elf/dl-support.c
+index eaf08f5bb..87cd1bb72 100644
+--- a/libc/misc/elf/dl-support.c
++++ b/libc/misc/elf/dl-support.c
+@@ -29,7 +29,7 @@ void (*_dl_init_static_tls) (struct link_map *) = &_dl_nothread_init_static_tls;
+ 
+ ElfW(Phdr) *_dl_phdr;
+ size_t _dl_phnum;
+-extern size_t _dl_pagesize;
++size_t _dl_pagesize;
+ 
+ void internal_function _dl_aux_init (ElfW(auxv_t) *av);
+ void internal_function _dl_aux_init (ElfW(auxv_t) *av)
+diff --git a/libpthread/nptl/sysdeps/generic/libc-tls.c b/libpthread/nptl/sysdeps/generic/libc-tls.c
+index a1d2ef913..d746c9a38 100644
+--- a/libpthread/nptl/sysdeps/generic/libc-tls.c
++++ b/libpthread/nptl/sysdeps/generic/libc-tls.c
+@@ -72,7 +72,7 @@ struct dtv_slotinfo_list *_dl_tls_dtv_slotinfo_list;
+ /* Number of modules in the static TLS block.  */
+ size_t _dl_tls_static_nelem;
+ /* Size of the static TLS block.  */
+-extern size_t _dl_tls_static_size;
++size_t _dl_tls_static_size;
+ /* Size actually allocated in the static TLS block.  */
+ size_t _dl_tls_static_used;
+ /* Alignment requirement of the static TLS block.  */
+-- 
+2.26.2
+
diff --git a/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch b/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
new file mode 100644
index 0000000000..63d506c328
--- /dev/null
+++ b/package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
@@ -0,0 +1,25 @@
+From 4deace34cfcc5476b71a9cdc05828f5a48d1cd74 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Thu, 3 Sep 2020 15:08:24 +0200
+Subject: [PATCH 2/4] fix static builds with gcc 10.x
+
+---
+ Rules.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index f270b7bee..55e88d462 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -288,7 +288,7 @@ OPTIMIZATION += $(CFLAG_-fstrict-aliasing)
+ 
+ # Why -funsigned-char: I hunted a bug related to incorrect
+ # sign extension of 'char' type for 10 hours straight. Not fun.
+-CPU_CFLAGS-y := -funsigned-char -fno-builtin
++CPU_CFLAGS-y := -funsigned-char -fno-builtin -fcommon
+ 
+ $(eval $(call check-gcc-var,-fno-asm))
+ CPU_CFLAGS-y += $(CFLAG_-fno-asm)
+-- 
+2.26.2
+
diff --git a/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch b/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
new file mode 100644
index 0000000000..2fc86d6161
--- /dev/null
+++ b/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
@@ -0,0 +1,103 @@
+From 684b80c97a38033cf0065537783ecf29bc2251ee Mon Sep 17 00:00:00 2001
+From: Damien Le Moal <damien.lemoal@wdc.com>
+Date: Mon, 7 Sep 2020 15:12:39 +0900
+Subject: [PATCH 3/4] utils/getconf: Fix compilation error
+
+Avoid "warning: statement will never be executed" compilation error if
+none of the cases are defined.
+
+Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
+---
+ utils/getconf.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/utils/getconf.c b/utils/getconf.c
+index 3dd3d75d9..b8d00f90f 100644
+--- a/utils/getconf.c
++++ b/utils/getconf.c
+@@ -1154,7 +1154,6 @@ environment SPEC.\n\n");
+ 
+   const char *spec = NULL;
+   char buf[sizeof "POSIX_V6_LPBIG_OFFBIG"];
+-  char *argv0 = argv[0];
+   if (argc > 1 && strncmp (argv[1], "-v", 2) == 0)
+     {
+       if (argv[1][2] == '\0')
+@@ -1199,42 +1198,56 @@ environment SPEC.\n\n");
+ 
+       switch (specs[i].num)
+ 	{
++#undef DO_GETCONF_NAME
+ #if !defined(_XBS5_ILP32_OFF32) && defined(_SC_XBS5_ILP32_OFF32)
++#define DO_GETCONF_NAME
+ 	case _SC_XBS5_ILP32_OFF32:
+ #endif
+ #if !defined(_XBS5_ILP32_OFFBIG) && defined(_SC_XBS5_ILP32_OFFBIG)
++#define DO_GETCONF_NAME
+ 	case _SC_XBS5_ILP32_OFFBIG:
+ #endif
+ #if !defined(_XBS5_LP64_OFF64) && defined(_SC_XBS5_LP64_OFF64)
++#define DO_GETCONF_NAME
+ 	case _SC_XBS5_LP64_OFF64:
+ #endif
+ #if !defined(_XBS5_LPBIG_OFFBIG) && defined(_SC_XBS5_LPBIG_OFFBIG)
++#define DO_GETCONF_NAME
+ 	case _SC_XBS5_LPBIG_OFFBIG:
+ #endif
+ #if !defined(_POSIX_V6_ILP32_OFF32) && defined(_SC_V6_ILP32_OFF32)
++#define DO_GETCONF_NAME
+ 	case _SC_V6_ILP32_OFF32:
+ #endif
+ #if !defined(_POSIX_V6_ILP32_OFFBIG) && defined(_SC_V6_ILP32_OFFBIG)
++#define DO_GETCONF_NAME
+ 	case _SC_V6_ILP32_OFFBIG:
+ #endif
+ #if !defined(_POSIX_V6_LP64_OFF64) && defined(_SC_V6_LP64_OFF64)
++#define DO_GETCONF_NAME
+ 	case _SC_V6_LP64_OFF64:
+ #endif
+ #if !defined(_POSIX_V6_LPBIG_OFFBIG) && defined(_SC_V6_LPBIG_OFFBIG)
++#define DO_GETCONF_NAME
+ 	case _SC_V6_LPBIG_OFFBIG:
+ #endif
+ #if !defined(_POSIX_V7_ILP32_OFF32) && defined(_SC_V7_ILP32_OFF32)
++#define DO_GETCONF_NAME
+ 	case _SC_V7_ILP32_OFF32:
+ #endif
+ #if !defined(_POSIX_V7_ILP32_OFFBIG) && defined(_SC_V7_ILP32_OFFBIG)
++#define DO_GETCONF_NAME
+ 	case _SC_V7_ILP32_OFFBIG:
+ #endif
+ #if !defined(_POSIX_V7_LP64_OFF64) && defined(_SC_V7_LP64_OFF64)
++#define DO_GETCONF_NAME
+ 	case _SC_V7_LP64_OFF64:
+ #endif
+ #if !defined(_POSIX_V7_LPBIG_OFFBIG) && defined(_SC_V7_LPBIG_OFFBIG)
++#define DO_GETCONF_NAME
+ 	case _SC_V7_LPBIG_OFFBIG:
+ #endif
++#ifdef DO_GETCONF_NAME
+ 	    {
+ 	      const char *args[argc + 3];
+ 	      size_t spec_len = strlen (spec);
+@@ -1242,14 +1255,15 @@ environment SPEC.\n\n");
+ 	      memcpy (mempcpy (mempcpy (getconf_name, getconf_dir,
+ 					getconf_dirlen),
+ 			       "/", 1), spec, spec_len + 1);
+-	      args[0] = argv0;
++	      args[0] = argv[0];
+ 	      args[1] = "-v";
+ 	      args[2] = spec;
+ 	      memcpy (&args[3], &argv[1], argc * sizeof (argv[1]));
+ 	      execv (getconf_name, (char * const *) args);
+ 	      error (4, errno, _("Couldn't execute %s"), getconf_name);
+ 	    }
+-	  default:
++#endif
++	default:
+ 	    break;
+ 	}
+     }
+-- 
+2.26.2
+
diff --git a/package/uclibc/0004-librt-avoid-compilation-error.patch b/package/uclibc/0004-librt-avoid-compilation-error.patch
new file mode 100644
index 0000000000..c0b7177f58
--- /dev/null
+++ b/package/uclibc/0004-librt-avoid-compilation-error.patch
@@ -0,0 +1,42 @@
+From 4f7150086ffc2936d2c0f44e136984fcb232f7c7 Mon Sep 17 00:00:00 2001
+From: Damien Le Moal <damien.lemoal@wdc.com>
+Date: Mon, 7 Sep 2020 16:51:09 +0900
+Subject: [PATCH 4/4] librt: avoid compilation error
+
+For no MMU builds, LIBC_CANCEL_ASYNC and LIBC_CANCEL_RESET are not
+defined. Prevent these to by visible by the compiler in
+clock_nanosleep() by replacing "if (SINGLE_THREAD_P) {" with the
+pre-compiler directive "#if defined(SINGLE_THREAD_P)".
+
+Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
+---
+ librt/clock_nanosleep.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/librt/clock_nanosleep.c b/librt/clock_nanosleep.c
+index 4cf1e06b4..1515cf5b0 100644
+--- a/librt/clock_nanosleep.c
++++ b/librt/clock_nanosleep.c
+@@ -36,9 +36,9 @@ clock_nanosleep (clockid_t clock_id, int flags, const struct timespec *req,
+   if (clock_id == CLOCK_PROCESS_CPUTIME_ID)
+     clock_id = MAKE_PROCESS_CPUCLOCK (0, CPUCLOCK_SCHED);
+ 
+-  if (SINGLE_THREAD_P)
++#if defined(SINGLE_THREAD_P)
+     r = INTERNAL_SYSCALL (clock_nanosleep, err, 4, clock_id, flags, req, rem);
+-  else
++#else
+     {
+       int oldstate = LIBC_CANCEL_ASYNC ();
+ 
+@@ -47,6 +47,7 @@ clock_nanosleep (clockid_t clock_id, int flags, const struct timespec *req,
+ 
+       LIBC_CANCEL_RESET (oldstate);
+     }
++#endif
+ 
+   return (INTERNAL_SYSCALL_ERROR_P (r, err)
+ 	  ? INTERNAL_SYSCALL_ERRNO (r, err) : 0);
+-- 
+2.26.2
+
-- 
2.26.2
