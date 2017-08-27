From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Aug 2017 19:36:06 +0200
Subject: [Buildroot] [PATCH 7/7] package/glibc: bump to 2.26
In-Reply-To: <20170827173606.13144-1-romain.naour@gmail.com>
References: <20170827173606.13144-1-romain.naour@gmail.com>
Message-ID: <20170827173606.13144-8-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch:

0001-sh-Fix-building-with-gcc5-6.patch
https://sourceware.org/git/?p=glibc.git;a=commit;h=d40dbe722f004f999b589de776f7e57e564dda01

0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
https://sourceware.org/git/?p=glibc.git;a=commit;h=f6110a8fee2ca36f8e2d2abecf3cba9fa7b8ea7d

0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
https://sourceware.org/git/?p=glibc.git;a=commit;h=6d0ba622891bed9d8394eef1935add53003b12e8

0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch

https://sourceware.org/git/?p=glibc.git;a=commit;h=81b82fb966ffbd94353f793ad17116c6088dedd9

0005-fix-binutils-2-29-build.patch
https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff_plain;h=388b4f1a02f3a801965028bbfcd48d905638b797

0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff_plain;h=69052a3a95da37169a08f9e59b2cc1808312753c

0006-sh4-trap.patch
https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff_plain;h=db3d848e154b00071f4a5e729d5884efad410109

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../glibc/0001-sh-Fix-building-with-gcc5-6.patch   |  56 ----
 ...00366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch |  35 ---
 ...ject-overly-long-LD_PRELOAD-path-elements.patch | 122 --------
 ...Reject-overly-long-LD_AUDIT-path-elements.patch | 204 -------------
 package/glibc/0005-fix-binutils-2-29-build.patch   |  65 -----
 ...g-IS_IN-libc-guards-to-vectorized-strcspn.patch |  47 ---
 package/glibc/0006-sh4-trap.patch                  | 318 ---------------------
 package/glibc/glibc.hash                           |   2 +-
 package/glibc/glibc.mk                             |   2 +-
 9 files changed, 2 insertions(+), 849 deletions(-)
 delete mode 100644 package/glibc/0001-sh-Fix-building-with-gcc5-6.patch
 delete mode 100644 package/glibc/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
 delete mode 100644 package/glibc/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
 delete mode 100644 package/glibc/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
 delete mode 100644 package/glibc/0005-fix-binutils-2-29-build.patch
 delete mode 100644 package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
 delete mode 100644 package/glibc/0006-sh4-trap.patch

diff --git a/package/glibc/0001-sh-Fix-building-with-gcc5-6.patch b/package/glibc/0001-sh-Fix-building-with-gcc5-6.patch
deleted file mode 100644
index fa43bdd..0000000
--- a/package/glibc/0001-sh-Fix-building-with-gcc5-6.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 3840d4c2add1dd282f5f01fa51720b2d5b8fd8d2 Mon Sep 17 00:00:00 2001
-From: Alexey Neyman <stilor@att.net>
-Date: Wed, 8 Feb 2017 16:00:57 -0200
-Subject: [PATCH] sh: Fix building with gcc5/6
-
-Build glibc for sh4-unknown-linux-gnu currently fails if one's
-using GCC5/6: in dl-conflict.c, the elf_machine_rela() function
-is called with NULL as its 3rd argument, sym. The implementation
-of that function in sysdeps/sh/dl-machine.h dereferences that pointer:
-
-const Elf32_Sym *const refsym = sym;
-...
-if (map == &GL(dl_rtld_map))
-  value -= map->l_addr + refsym->st_value + reloc->r_addend;
-
-GCC discovers a null pointer dereference, and in accordance with
--fdelete-null-pointer-checks (which is enabled in -O2) replaces this
-code with a trap - which, as SH does not implement a trap pattern in
-GCC, evaluates to an abort() call. This abort() call pulls many more
-objects from libc_nonshared.a, eventually resulting in link failure
-due to multiple definitions for a number of symbols.
-
-As far as I see, the conditional before this code is always false in
-rtld: _dl_resolve_conflicts() is called with main_map as the first
-argument, not GL(_dl_rtld_map), but since that call is in yet another
-compilation unit, GCC does not know about it. Patch that wraps this
-conditional into !defined RESOLVE_CONFLICT_FIND_MAP attached.
-
-	* sysdeps/sh/dl-machine.h (elf_machine_rela): The condition
-	in R_SH_DIR32 case is always false when inlined from
-	dl-conflict.c. Ifdef out to prevent GCC from insertin an
-	abort() call.
-
-[Waldemar: backport of
-https://sourceware.org/git/?p=glibc.git;a=commit;h=d40dbe722f004f999b589de776f7e57e564dda01.]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- sysdeps/sh/dl-machine.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysdeps/sh/dl-machine.h b/sysdeps/sh/dl-machine.h
-index 449deea..2b468af 100644
---- a/sysdeps/sh/dl-machine.h
-+++ b/sysdeps/sh/dl-machine.h
-@@ -389,7 +389,7 @@ elf_machine_rela (struct link_map *map, const Elf32_Rela *reloc,
- 	  break;
- 	case R_SH_DIR32:
- 	  {
--#ifndef RTLD_BOOTSTRAP
-+#if !defined RTLD_BOOTSTRAP && !defined RESOLVE_CONFLICT_FIND_MAP
- 	   /* This is defined in rtld.c, but nowhere in the static
- 	      libc.a; make the reference weak so static programs can
- 	      still link.  This declaration cannot be done when
--- 
-2.7.4
-
diff --git a/package/glibc/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch b/package/glibc/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
deleted file mode 100644
index d701294..0000000
--- a/package/glibc/0002-CVE-2017-1000366-Ignore-LD_LIBRARY_PATH-for-AT_SECUR.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f6110a8fee2ca36f8e2d2abecf3cba9fa7b8ea7d Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 19 Jun 2017 17:09:55 +0200
-Subject: [PATCH] CVE-2017-1000366: Ignore LD_LIBRARY_PATH for AT_SECURE=1
- programs [BZ #21624]
-
-LD_LIBRARY_PATH can only be used to reorder system search paths, which
-is not useful functionality.
-
-This makes an exploitable unbounded alloca in _dl_init_paths unreachable
-for AT_SECURE=1 programs.
-
-[Peter: Drop ChangeLog modification]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- elf/rtld.c | 3 ++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/elf/rtld.c b/elf/rtld.c
-index 2446a87680..2269dbec81 100644
---- a/elf/rtld.c
-+++ b/elf/rtld.c
-@@ -2422,7 +2422,8 @@ process_envvars (enum mode *modep)
- 
- 	case 12:
- 	  /* The library search path.  */
--	  if (memcmp (envline, "LIBRARY_PATH", 12) == 0)
-+	  if (!__libc_enable_secure
-+	      && memcmp (envline, "LIBRARY_PATH", 12) == 0)
- 	    {
- 	      library_path = &envline[13];
- 	      break;
--- 
-2.11.0
-
diff --git a/package/glibc/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch b/package/glibc/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
deleted file mode 100644
index df41093..0000000
--- a/package/glibc/0003-ld.so-Reject-overly-long-LD_PRELOAD-path-elements.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 6d0ba622891bed9d8394eef1935add53003b12e8 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 19 Jun 2017 22:31:04 +0200
-Subject: [PATCH] ld.so: Reject overly long LD_PRELOAD path elements
-
-[Peter: Drop ChangeLog modification]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- elf/rtld.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++------------
- 1 file changed, 72 insertions(+), 16 deletions(-)
-
-diff --git a/elf/rtld.c b/elf/rtld.c
-index 2269dbec81..86ae20c83f 100644
---- a/elf/rtld.c
-+++ b/elf/rtld.c
-@@ -99,6 +99,35 @@ uintptr_t __pointer_chk_guard_local
- strong_alias (__pointer_chk_guard_local, __pointer_chk_guard)
- #endif
- 
-+/* Length limits for names and paths, to protect the dynamic linker,
-+   particularly when __libc_enable_secure is active.  */
-+#ifdef NAME_MAX
-+# define SECURE_NAME_LIMIT NAME_MAX
-+#else
-+# define SECURE_NAME_LIMIT 255
-+#endif
-+#ifdef PATH_MAX
-+# define SECURE_PATH_LIMIT PATH_MAX
-+#else
-+# define SECURE_PATH_LIMIT 1024
-+#endif
-+
-+/* Check that AT_SECURE=0, or that the passed name does not contain
-+   directories and is not overly long.  Reject empty names
-+   unconditionally.  */
-+static bool
-+dso_name_valid_for_suid (const char *p)
-+{
-+  if (__glibc_unlikely (__libc_enable_secure))
-+    {
-+      /* Ignore pathnames with directories for AT_SECURE=1
-+	 programs, and also skip overlong names.  */
-+      size_t len = strlen (p);
-+      if (len >= SECURE_NAME_LIMIT || memchr (p, '/', len) != NULL)
-+	return false;
-+    }
-+  return *p != '\0';
-+}
- 
- /* List of auditing DSOs.  */
- static struct audit_list
-@@ -718,6 +747,42 @@ static const char *preloadlist attribute_relro;
- /* Nonzero if information about versions has to be printed.  */
- static int version_info attribute_relro;
- 
-+/* The LD_PRELOAD environment variable gives list of libraries
-+   separated by white space or colons that are loaded before the
-+   executable's dependencies and prepended to the global scope list.
-+   (If the binary is running setuid all elements containing a '/' are
-+   ignored since it is insecure.)  Return the number of preloads
-+   performed.  */
-+unsigned int
-+handle_ld_preload (const char *preloadlist, struct link_map *main_map)
-+{
-+  unsigned int npreloads = 0;
-+  const char *p = preloadlist;
-+  char fname[SECURE_PATH_LIMIT];
-+
-+  while (*p != '\0')
-+    {
-+      /* Split preload list at space/colon.  */
-+      size_t len = strcspn (p, " :");
-+      if (len > 0 && len < sizeof (fname))
-+	{
-+	  memcpy (fname, p, len);
-+	  fname[len] = '\0';
-+	}
-+      else
-+	fname[0] = '\0';
-+
-+      /* Skip over the substring and the following delimiter.  */
-+      p += len;
-+      if (*p != '\0')
-+	++p;
-+
-+      if (dso_name_valid_for_suid (fname))
-+	npreloads += do_preload (fname, main_map, "LD_PRELOAD");
-+    }
-+  return npreloads;
-+}
-+
- static void
- dl_main (const ElfW(Phdr) *phdr,
- 	 ElfW(Word) phnum,
-@@ -1464,23 +1529,8 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
- 
-   if (__glibc_unlikely (preloadlist != NULL))
-     {
--      /* The LD_PRELOAD environment variable gives list of libraries
--	 separated by white space or colons that are loaded before the
--	 executable's dependencies and prepended to the global scope
--	 list.  If the binary is running setuid all elements
--	 containing a '/' are ignored since it is insecure.  */
--      char *list = strdupa (preloadlist);
--      char *p;
--
-       HP_TIMING_NOW (start);
--
--      /* Prevent optimizing strsep.  Speed is not important here.  */
--      while ((p = (strsep) (&list, " :")) != NULL)
--	if (p[0] != '\0'
--	    && (__builtin_expect (! __libc_enable_secure, 1)
--		|| strchr (p, '/') == NULL))
--	  npreloads += do_preload (p, main_map, "LD_PRELOAD");
--
-+      npreloads += handle_ld_preload (preloadlist, main_map);
-       HP_TIMING_NOW (stop);
-       HP_TIMING_DIFF (diff, start, stop);
-       HP_TIMING_ACCUM_NT (load_time, diff);
--- 
-2.11.0
-
diff --git a/package/glibc/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch b/package/glibc/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
deleted file mode 100644
index 25e937b..0000000
--- a/package/glibc/0004-ld.so-Reject-overly-long-LD_AUDIT-path-elements.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-From 81b82fb966ffbd94353f793ad17116c6088dedd9 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 19 Jun 2017 22:32:12 +0200
-Subject: [PATCH] ld.so: Reject overly long LD_AUDIT path elements
-
-Also only process the last LD_AUDIT entry.
-
-[Peter: Drop ChangeLog modification]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- elf/rtld.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 105 insertions(+), 15 deletions(-)
-
-diff --git a/elf/rtld.c b/elf/rtld.c
-index 86ae20c83f..65647fb1c8 100644
---- a/elf/rtld.c
-+++ b/elf/rtld.c
-@@ -129,13 +129,91 @@ dso_name_valid_for_suid (const char *p)
-   return *p != '\0';
- }
- 
--/* List of auditing DSOs.  */
-+/* LD_AUDIT variable contents.  Must be processed before the
-+   audit_list below.  */
-+const char *audit_list_string;
-+
-+/* Cyclic list of auditing DSOs.  audit_list->next is the first
-+   element.  */
- static struct audit_list
- {
-   const char *name;
-   struct audit_list *next;
- } *audit_list;
- 
-+/* Iterator for audit_list_string followed by audit_list.  */
-+struct audit_list_iter
-+{
-+  /* Tail of audit_list_string still needing processing, or NULL.  */
-+  const char *audit_list_tail;
-+
-+  /* The list element returned in the previous iteration.  NULL before
-+     the first element.  */
-+  struct audit_list *previous;
-+
-+  /* Scratch buffer for returning a name which is part of
-+     audit_list_string.  */
-+  char fname[SECURE_NAME_LIMIT];
-+};
-+
-+/* Initialize an audit list iterator.  */
-+static void
-+audit_list_iter_init (struct audit_list_iter *iter)
-+{
-+  iter->audit_list_tail = audit_list_string;
-+  iter->previous = NULL;
-+}
-+
-+/* Iterate through both audit_list_string and audit_list.  */
-+static const char *
-+audit_list_iter_next (struct audit_list_iter *iter)
-+{
-+  if (iter->audit_list_tail != NULL)
-+    {
-+      /* First iterate over audit_list_string.  */
-+      while (*iter->audit_list_tail != '\0')
-+	{
-+	  /* Split audit list at colon.  */
-+	  size_t len = strcspn (iter->audit_list_tail, ":");
-+	  if (len > 0 && len < sizeof (iter->fname))
-+	    {
-+	      memcpy (iter->fname, iter->audit_list_tail, len);
-+	      iter->fname[len] = '\0';
-+	    }
-+	  else
-+	    /* Do not return this name to the caller.  */
-+	    iter->fname[0] = '\0';
-+
-+	  /* Skip over the substring and the following delimiter.  */
-+	  iter->audit_list_tail += len;
-+	  if (*iter->audit_list_tail == ':')
-+	    ++iter->audit_list_tail;
-+
-+	  /* If the name is valid, return it.  */
-+	  if (dso_name_valid_for_suid (iter->fname))
-+	    return iter->fname;
-+	  /* Otherwise, wrap around and try the next name.  */
-+	}
-+      /* Fall through to the procesing of audit_list.  */
-+    }
-+
-+  if (iter->previous == NULL)
-+    {
-+      if (audit_list == NULL)
-+	/* No pre-parsed audit list.  */
-+	return NULL;
-+      /* Start of audit list.  The first list element is at
-+	 audit_list->next (cyclic list).  */
-+      iter->previous = audit_list->next;
-+      return iter->previous->name;
-+    }
-+  if (iter->previous == audit_list)
-+    /* Cyclic list wrap-around.  */
-+    return NULL;
-+  iter->previous = iter->previous->next;
-+  return iter->previous->name;
-+}
-+
- #ifndef HAVE_INLINED_SYSCALLS
- /* Set nonzero during loading and initialization of executable and
-    libraries, cleared before the executable's entry point runs.  This
-@@ -1305,11 +1383,13 @@ of this helper program; chances are you did not intend to run this program.\n\
-     GL(dl_rtld_map).l_tls_modid = _dl_next_tls_modid ();
- 
-   /* If we have auditing DSOs to load, do it now.  */
--  if (__glibc_unlikely (audit_list != NULL))
-+  bool need_security_init = true;
-+  if (__glibc_unlikely (audit_list != NULL)
-+      || __glibc_unlikely (audit_list_string != NULL))
-     {
--      /* Iterate over all entries in the list.  The order is important.  */
-       struct audit_ifaces *last_audit = NULL;
--      struct audit_list *al = audit_list->next;
-+      struct audit_list_iter al_iter;
-+      audit_list_iter_init (&al_iter);
- 
-       /* Since we start using the auditing DSOs right away we need to
- 	 initialize the data structures now.  */
-@@ -1320,9 +1400,14 @@ of this helper program; chances are you did not intend to run this program.\n\
- 	 use different values (especially the pointer guard) and will
- 	 fail later on.  */
-       security_init ();
-+      need_security_init = false;
- 
--      do
-+      while (true)
- 	{
-+	  const char *name = audit_list_iter_next (&al_iter);
-+	  if (name == NULL)
-+	    break;
-+
- 	  int tls_idx = GL(dl_tls_max_dtv_idx);
- 
- 	  /* Now it is time to determine the layout of the static TLS
-@@ -1331,7 +1416,7 @@ of this helper program; chances are you did not intend to run this program.\n\
- 	     no DF_STATIC_TLS bit is set.  The reason is that we know
- 	     glibc will use the static model.  */
- 	  struct dlmopen_args dlmargs;
--	  dlmargs.fname = al->name;
-+	  dlmargs.fname = name;
- 	  dlmargs.map = NULL;
- 
- 	  const char *objname;
-@@ -1344,7 +1429,7 @@ of this helper program; chances are you did not intend to run this program.\n\
- 	    not_loaded:
- 	      _dl_error_printf ("\
- ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
--				al->name, err_str);
-+				name, err_str);
- 	      if (malloced)
- 		free ((char *) err_str);
- 	    }
-@@ -1448,10 +1533,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
- 		  goto not_loaded;
- 		}
- 	    }
--
--	  al = al->next;
- 	}
--      while (al != audit_list->next);
- 
-       /* If we have any auditing modules, announce that we already
- 	 have two objects loaded.  */
-@@ -1715,7 +1797,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
-   if (tcbp == NULL)
-     tcbp = init_tls ();
- 
--  if (__glibc_likely (audit_list == NULL))
-+  if (__glibc_likely (need_security_init))
-     /* Initialize security features.  But only if we have not done it
-        earlier.  */
-     security_init ();
-@@ -2346,9 +2428,7 @@ process_dl_audit (char *str)
-   char *p;
- 
-   while ((p = (strsep) (&str, ":")) != NULL)
--    if (p[0] != '\0'
--	&& (__builtin_expect (! __libc_enable_secure, 1)
--	    || strchr (p, '/') == NULL))
-+    if (dso_name_valid_for_suid (p))
-       {
- 	/* This is using the local malloc, not the system malloc.  The
- 	   memory can never be freed.  */
-@@ -2412,7 +2492,7 @@ process_envvars (enum mode *modep)
- 	      break;
- 	    }
- 	  if (memcmp (envline, "AUDIT", 5) == 0)
--	    process_dl_audit (&envline[6]);
-+	    audit_list_string = &envline[6];
- 	  break;
- 
- 	case 7:
--- 
-2.11.0
-
diff --git a/package/glibc/0005-fix-binutils-2-29-build.patch b/package/glibc/0005-fix-binutils-2-29-build.patch
deleted file mode 100644
index 47fcd2f..0000000
--- a/package/glibc/0005-fix-binutils-2-29-build.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From: H.J. Lu <hjl.tools@gmail.com>
-Date: Fri, 23 Jun 2017 21:38:46 +0000 (-0700)
-Subject: Avoid .symver on common symbols [BZ #21666]
-X-Git-Tag: glibc-2.26~241
-X-Git-Url: https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff_plain;h=388b4f1a02f3a801965028bbfcd48d905638b797
-
-Avoid .symver on common symbols [BZ #21666]
-
-The .symver directive on common symbol just creates a new common symbol,
-not an alias and the newer assembler with the bug fix for
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=21661
-
-will issue an error.  Before the fix, we got
-
-$ readelf -sW libc.so | grep "loc[12s]"
-  5109: 00000000003a0608     8 OBJECT  LOCAL  DEFAULT   36 loc1
-  5188: 00000000003a0610     8 OBJECT  LOCAL  DEFAULT   36 loc2
-  5455: 00000000003a0618     8 OBJECT  LOCAL  DEFAULT   36 locs
-  6575: 00000000003a05f0     8 OBJECT  GLOBAL DEFAULT   36 locs at GLIBC_2.2.5
-  7156: 00000000003a05f8     8 OBJECT  GLOBAL DEFAULT   36 loc1 at GLIBC_2.2.5
-  7312: 00000000003a0600     8 OBJECT  GLOBAL DEFAULT   36 loc2 at GLIBC_2.2.5
-
-in libc.so.  The versioned loc1, loc2 and locs have the wrong addresses.
-After the fix, we got
-
-$ readelf -sW libc.so | grep "loc[12s]"
-  6570: 000000000039e3b8     8 OBJECT  GLOBAL DEFAULT   34 locs at GLIBC_2.2.5
-  7151: 000000000039e3c8     8 OBJECT  GLOBAL DEFAULT   34 loc1 at GLIBC_2.2.5
-  7307: 000000000039e3c0     8 OBJECT  GLOBAL DEFAULT   34 loc2 at GLIBC_2.2.5
-
-	[BZ #21666]
-	* misc/regexp.c (loc1): Add __attribute__ ((nocommon));
-	(loc2): Likewise.
-	(locs): Likewise.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Backported from upstream commit
-388b4f1a02f3a801965028bbfcd48d905638b797, to fix the build with
-binutils 2.29.]
----
-diff --git a/misc/regexp.c b/misc/regexp.c
-index 19d76c0..eaea7c3 100644
---- a/misc/regexp.c
-+++ b/misc/regexp.c
-@@ -29,14 +29,15 @@
- 
- #if SHLIB_COMPAT (libc, GLIBC_2_0, GLIBC_2_23)
- 
--/* Define the variables used for the interface.  */
--char *loc1;
--char *loc2;
-+/* Define the variables used for the interface.  Avoid .symver on common
-+   symbol, which just creates a new common symbol, not an alias.  */
-+char *loc1 __attribute__ ((nocommon));
-+char *loc2 __attribute__ ((nocommon));
- compat_symbol (libc, loc1, loc1, GLIBC_2_0);
- compat_symbol (libc, loc2, loc2, GLIBC_2_0);
- 
- /* Although we do not support the use we define this variable as well.  */
--char *locs;
-+char *locs __attribute__ ((nocommon));
- compat_symbol (libc, locs, locs, GLIBC_2_0);
- 
- 
diff --git a/package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch b/package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
deleted file mode 100644
index eebf89e..0000000
--- a/package/glibc/0006-i686-Add-missing-IS_IN-libc-guards-to-vectorized-strcspn.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From patchwork Wed Jun 14 06:19:50 2017
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: i686: Add missing IS_IN (libc) guards to vectorized strcspn
-From: Florian Weimer <fweimer@redhat.com>
-X-Patchwork-Id: 21003
-Message-Id: <20170614061950.400FE4010728F@oldenburg.str.redhat.com>
-To: libc-alpha at sourceware.org
-Date: Wed, 14 Jun 2017 08:19:50 +0200
-
-Since commit d957c4d3fa48d685ff2726c605c988127ef99395 (i386: Compile
-rtld-*.os with -mno-sse -mno-mmx -mfpmath=387), vector intrinsics can
-no longer be used in ld.so, even if the compiled code never makes it
-into the final ld.so link.  This commit adds the missing IS_IN (libc)
-guard to the SSE 4.2 strcspn implementation, so that it can be used from
-ld.so in the future.
-
-2017-06-14  Florian Weimer  <fweimer@redhat.com>
-
-	* sysdeps/i386/i686/multiarch/strcspn-c.c: Add IS_IN (libc) guard.
-	* sysdeps/i386/i686/multiarch/varshift.c: Likewise.
-
-[Thomas: fixes a build issue of glibc on x86:
-sysdeps/x86_64/multiarch/varshift.h:26:1: error: SSE vector return without SSE enabled changes the ABI]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff --git a/sysdeps/i386/i686/multiarch/strcspn-c.c b/sysdeps/i386/i686/multiarch/strcspn-c.c
-index 6d61e19..ec230fb 100644
---- a/sysdeps/i386/i686/multiarch/strcspn-c.c
-+++ b/sysdeps/i386/i686/multiarch/strcspn-c.c
-@@ -1,2 +1,4 @@
--#define __strcspn_sse2 __strcspn_ia32
--#include <sysdeps/x86_64/multiarch/strcspn-c.c>
-+#if IS_IN (libc)
-+# define __strcspn_sse2 __strcspn_ia32
-+# include <sysdeps/x86_64/multiarch/strcspn-c.c>
-+#endif
-diff --git a/sysdeps/i386/i686/multiarch/varshift.c b/sysdeps/i386/i686/multiarch/varshift.c
-index 7760b96..6742a35 100644
---- a/sysdeps/i386/i686/multiarch/varshift.c
-+++ b/sysdeps/i386/i686/multiarch/varshift.c
-@@ -1 +1,3 @@
--#include <sysdeps/x86_64/multiarch/varshift.c>
-+#if IS_IN (libc)
-+# include <sysdeps/x86_64/multiarch/varshift.c>
-+#endif
diff --git a/package/glibc/0006-sh4-trap.patch b/package/glibc/0006-sh4-trap.patch
deleted file mode 100644
index c986ac3..0000000
--- a/package/glibc/0006-sh4-trap.patch
+++ /dev/null
@@ -1,318 +0,0 @@
-commit db3d848e154b00071f4a5e729d5884efad410109
-Author: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date:   Wed Mar 15 15:44:59 2017 -0300
-
-    Build divdi3 only for architecture that required it
-    
-    As noted in [1], divdi3 object is only exported in a handful ABIs
-    (i386, m68k, powerpc32, s390-32, and ia64), however it is built
-    for all current architectures regardless.
-    
-    This patch refact the make rules for this object to so only the
-    aforementioned architectures that actually require it builds it.
-    
-    Also, to avoid internal PLT calls to the exported symbol from the
-    module, glibc uses an internal header (symbol-hacks.h) which is
-    unrequired (and in fact breaks the build for architectures that
-    intend to get symbol definitions from libgcc.a).  The patch also
-    changes it to create its own header (divdi3-symbol-hacks.h) and
-    adjust the architectures that require it accordingly.
-    
-    I checked the build/check (with run-built-tests=no) on the
-    following architectures (which I think must cover all supported
-    ABI/builds) using GCC 6.3:
-    
-    aarch64-linux-gnu
-    alpha-linux-gnu
-    arm-linux-gnueabihf
-    hppa-linux-gnu
-    ia64-linux-gnu
-    m68k-linux-gnu
-    microblaze-linux-gnu
-    mips64-n32-linux-gnu
-    mips-linux-gnu
-    mips64-linux-gnu
-    nios2-linux-gnu
-    powerpc-linux-gnu
-    powerpc-linux-gnu-power4
-    powerpc64-linux-gnu
-    powerpc64le-linux-gnu
-    s390x-linux-gnu
-    s390-linux-gnu
-    sh4-linux-gnu
-    sh4-linux-gnu-soft
-    sparc64-linux-gnu
-    sparcv9-linux-gnu
-    tilegx-linux-gnu
-    tilegx-linux-gnu-32
-    tilepro-linux-gnu
-    x86_64-linux-gnu
-    x86_64-linux-gnu-x32
-    i686-linux-gnu
-    
-    I only saw one regression on sparcv9-linux-gnu (extra PLT call to
-    .udiv) which I address in next patch in the set.  It also correctly
-    build SH with GCC 7.0.1 (without any regression from c89721e25d).
-    
-    [1] https://sourceware.org/ml/libc-alpha/2017-03/msg00243.html
-    
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff --git a/sysdeps/i386/symbol-hacks.h b/sysdeps/i386/symbol-hacks.h
-new file mode 100644
-index 0000000000..36a13c83f7
---- /dev/null
-+++ b/sysdeps/i386/symbol-hacks.h
-@@ -0,0 +1,21 @@
-+/* Hacks needed for symbol manipulation.  i386 version.
-+   Copyright (C) 2017 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#include <sysdeps/wordsize-32/divdi3-symbol-hacks.h>
-+
-+#include_next "symbol-hacks.h"
-diff --git a/sysdeps/m68k/symbol-hacks.h b/sysdeps/m68k/symbol-hacks.h
-new file mode 100644
-index 0000000000..e449d29810
---- /dev/null
-+++ b/sysdeps/m68k/symbol-hacks.h
-@@ -0,0 +1,21 @@
-+/* Hacks needed for symbol manipulation.  m68k version.
-+   Copyright (C) 2017 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#include <sysdeps/wordsize-32/divdi3-symbol-hacks.h>
-+
-+#include_next "symbol-hacks.h"
-diff --git a/sysdeps/powerpc/powerpc32/symbol-hacks.h b/sysdeps/powerpc/powerpc32/symbol-hacks.h
-new file mode 100644
-index 0000000000..dbb3141621
---- /dev/null
-+++ b/sysdeps/powerpc/powerpc32/symbol-hacks.h
-@@ -0,0 +1,21 @@
-+/* Hacks needed for symbol manipulation.  powerpc version.
-+   Copyright (C) 2017 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#include <sysdeps/wordsize-32/divdi3-symbol-hacks.h>
-+
-+#include_next "symbol-hacks.h"
-diff --git a/sysdeps/s390/s390-32/symbol-hacks.h b/sysdeps/s390/s390-32/symbol-hacks.h
-new file mode 100644
-index 0000000000..585c42365a
---- /dev/null
-+++ b/sysdeps/s390/s390-32/symbol-hacks.h
-@@ -0,0 +1,21 @@
-+/* Hacks needed for symbol manipulation.  s390 version.
-+   Copyright (C) 2017 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#include <sysdeps/wordsize-32/divdi3-symbol-hacks.h>
-+
-+#include_next "symbol-hacks.h"
-diff --git a/sysdeps/unix/sysv/linux/i386/Makefile b/sysdeps/unix/sysv/linux/i386/Makefile
-index 6aac0dfe15..4080b8c966 100644
---- a/sysdeps/unix/sysv/linux/i386/Makefile
-+++ b/sysdeps/unix/sysv/linux/i386/Makefile
-@@ -26,6 +26,11 @@ endif
- 
- ifeq ($(subdir),csu)
- sysdep-dl-routines += sysdep
-+ifeq (yes,$(build-shared))
-+sysdep_routines += divdi3
-+shared-only-routines += divdi3
-+CPPFLAGS-divdi3.c = -Din_divdi3_c
-+endif
- endif
- 
- ifeq ($(subdir),nptl)
-diff --git a/sysdeps/unix/sysv/linux/m68k/Makefile b/sysdeps/unix/sysv/linux/m68k/Makefile
-index 5c50ce6927..ce1f696a6f 100644
---- a/sysdeps/unix/sysv/linux/m68k/Makefile
-+++ b/sysdeps/unix/sysv/linux/m68k/Makefile
-@@ -4,6 +4,11 @@ m68k-syntax-flag = -DMOTOROLA_SYNTAX
- 
- ifeq ($(subdir),csu)
- sysdep_routines += m68k-helpers
-+ifeq (yes,$(build-shared))
-+sysdep_routines += divdi3
-+shared-only-routines += divdi3
-+CPPFLAGS-divdi3.c = -Din_divdi3_c
-+endif
- endif
- 
- ifeq ($(subdir),misc)
-diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/Makefile b/sysdeps/unix/sysv/linux/powerpc/powerpc32/Makefile
-index 3d6c150582..1f45659ed1 100644
---- a/sysdeps/unix/sysv/linux/powerpc/powerpc32/Makefile
-+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/Makefile
-@@ -1,2 +1,10 @@
- # See Makeconfig regarding the use of default-abi.
- default-abi := 32
-+
-+ifeq ($(subdir),csu)
-+ifeq (yes,$(build-shared))
-+sysdep_routines += divdi3
-+shared-only-routines += divdi3
-+CPPFLAGS-divdi3.c = -Din_divdi3_c
-+endif
-+endif
-diff --git a/sysdeps/unix/sysv/linux/s390/s390-32/Makefile b/sysdeps/unix/sysv/linux/s390/s390-32/Makefile
-index da3b3c76b4..fd8cf92633 100644
---- a/sysdeps/unix/sysv/linux/s390/s390-32/Makefile
-+++ b/sysdeps/unix/sysv/linux/s390/s390-32/Makefile
-@@ -21,3 +21,11 @@ endif
- ifeq ($(subdir),stdlib)
- sysdep_routines += __makecontext_ret
- endif
-+
-+ifeq ($(subdir),csu)
-+ifeq (yes,$(build-shared))
-+sysdep_routines += divdi3
-+shared-only-routines += divdi3
-+CPPFLAGS-divdi3.c = -Din_divdi3_c
-+endif
-+endif
-diff --git a/sysdeps/wordsize-32/Makefile b/sysdeps/wordsize-32/Makefile
-deleted file mode 100644
-index 82beac44ed..0000000000
---- a/sysdeps/wordsize-32/Makefile
-+++ /dev/null
-@@ -1,7 +0,0 @@
--ifeq ($(subdir),csu)
--ifeq (yes,$(build-shared))
--sysdep_routines += divdi3
--shared-only-routines += divdi3
--CPPFLAGS-divdi3.c = -Din_divdi3_c
--endif
--endif
-diff --git a/sysdeps/wordsize-32/divdi3-symbol-hacks.h b/sysdeps/wordsize-32/divdi3-symbol-hacks.h
-new file mode 100644
-index 0000000000..6c90cb796d
---- /dev/null
-+++ b/sysdeps/wordsize-32/divdi3-symbol-hacks.h
-@@ -0,0 +1,31 @@
-+/* Hacks needed for divdi3 symbol manipulation.
-+   Copyright (C) 2004-2017 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+/* A very dirty trick: gcc emits references to __divdi3, __udivdi3,
-+   __moddi3, and __umoddi3.  These functions are exported and
-+   therefore we get PLTs.  Unnecessarily so.  Changing gcc is a big
-+   task which might not be worth it so we play tricks with the
-+   assembler.
-+   Note: in_divdi3_c is only used to avoid symbol alias on divdi3
-+   build itself.  */
-+#if !defined __ASSEMBLER__ && !defined in_divdi3_c && IS_IN (libc) && defined SHARED
-+asm ("__divdi3 = __divdi3_internal");
-+asm ("__udivdi3 = __udivdi3_internal");
-+asm ("__moddi3 = __moddi3_internal");
-+asm ("__umoddi3 = __umoddi3_internal");
-+#endif
-diff --git a/sysdeps/wordsize-32/symbol-hacks.h b/sysdeps/wordsize-32/symbol-hacks.h
-deleted file mode 100644
-index 0aec1e0b97..0000000000
---- a/sysdeps/wordsize-32/symbol-hacks.h
-+++ /dev/null
-@@ -1,31 +0,0 @@
--/* Hacks needed for symbol manipulation.
--   Copyright (C) 2004-2017 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
--
--   The GNU C Library is free software; you can redistribute it and/or
--   modify it under the terms of the GNU Lesser General Public
--   License as published by the Free Software Foundation; either
--   version 2.1 of the License, or (at your option) any later version.
--
--   The GNU C Library is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--   Lesser General Public License for more details.
--
--   You should have received a copy of the GNU Lesser General Public
--   License along with the GNU C Library; if not, see
--   <http://www.gnu.org/licenses/>.  */
--
--#include_next "symbol-hacks.h"
--
--/* A very dirty trick: gcc emits references to __divdi3, __udivdi3,
--   __moddi3, and __umoddi3.  These functions are exported and
--   therefore we get PLTs.  Unnecessarily so.  Changing gcc is a big
--   task which might not be worth it so we play tricks with the
--   assembler.  */
--#if !defined __ASSEMBLER__ && !defined in_divdi3_c && IS_IN (libc) && defined SHARED
--asm ("__divdi3 = __divdi3_internal");
--asm ("__udivdi3 = __udivdi3_internal");
--asm ("__moddi3 = __moddi3_internal");
--asm ("__umoddi3 = __umoddi3_internal");
--#endif
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index daaf014..afae10f 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature (glibc)
-sha256	067bd9bb3390e79aa45911537d13c3721f1d9d3769931a30c2681bfee66f23a0	glibc-2.25.tar.xz
+sha256	e54e0a934cd2bc94429be79da5e9385898d2306b9eaf3c92d5a77af96190f6bd	glibc-2.26.tar.xz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index c9a6579..f5d0282 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIBC_VERSION = 2.25
+GLIBC_VERSION = 2.26
 GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
-- 
2.9.5
