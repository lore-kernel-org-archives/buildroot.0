From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 30 Dec 2019 14:36:40 +0100
Subject: [Buildroot] [PATCH] board/qemu/sh4-r2d: fix sh4 kernel bug with
 Binutils 2.33
Message-ID: <20191230133640.9702-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the Binutils patch reverting [1] that trigger a sh4 kernel bug
with Binutils >= 2.33.
Add two kernel patch provided by Alan Modra [2] that fix alignment of rodata.

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../linux/0002-arch-sh-vmlinux.scr.patch      |  32 ++++
 ...03-include-asm-generic-vmlinux.lds.h.patch |  32 ++++
 .../linux/0002-arch-sh-vmlinux.scr.patch      |  32 ++++
 ...03-include-asm-generic-vmlinux.lds.h.patch |  27 ++++
 ...311-FAIL-S-records-with-constructors.patch | 148 ------------------
 5 files changed, 123 insertions(+), 148 deletions(-)
 create mode 100644 board/qemu/sh4-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch
 create mode 100644 board/qemu/sh4-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch
 create mode 100644 board/qemu/sh4eb-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch
 create mode 100644 board/qemu/sh4eb-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch
 delete mode 100644 package/binutils/2.33.1/0003-Revert-PR24311-FAIL-S-records-with-constructors.patch

diff --git a/board/qemu/sh4-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch b/board/qemu/sh4-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch
new file mode 100644
index 0000000000..941052c2b2
--- /dev/null
+++ b/board/qemu/sh4-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch
@@ -0,0 +1,32 @@
+From fe657afd48fc67841d32207ef9eeeb5f099764cd Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 21 Dec 2019 11:52:04 +0100
+Subject: [PATCH 2/3] arch/sh: vmlinux.scr
+
+Building the kernel using a toolchain built with Binutils 2.33.1 prevent
+booting a sh4 system under Qemu.
+Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
+
+[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
+[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/sh/boot/compressed/vmlinux.scr | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/sh/boot/compressed/vmlinux.scr b/arch/sh/boot/compressed/vmlinux.scr
+index 862d74808236..dd292b4b9082 100644
+--- a/arch/sh/boot/compressed/vmlinux.scr
++++ b/arch/sh/boot/compressed/vmlinux.scr
+@@ -1,6 +1,6 @@
+ SECTIONS
+ {
+-  .rodata..compressed : {
++  .rodata..compressed : ALIGN(8) {
+ 	input_len = .;
+ 	LONG(input_data_end - input_data) input_data = .;
+ 	*(.data)
+-- 
+2.24.1
+
diff --git a/board/qemu/sh4-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch b/board/qemu/sh4-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch
new file mode 100644
index 0000000000..3dfa0d3824
--- /dev/null
+++ b/board/qemu/sh4-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch
@@ -0,0 +1,32 @@
+From 7f92adbba385a4e512abfd6633ac0f9f0cdf91f8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 21 Dec 2019 11:54:07 +0100
+Subject: [PATCH 3/3] include/asm-generic: vmlinux.lds.h
+
+Building the kernel using a toolchain built with Binutils 2.33.1 prevent
+booting a sh4 system under Qemu.
+Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
+
+[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
+[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/asm-generic/vmlinux.lds.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
+index d7701d466b60..1aa33597e91e 100644
+--- a/include/asm-generic/vmlinux.lds.h
++++ b/include/asm-generic/vmlinux.lds.h
+@@ -306,6 +306,7 @@
+  */
+ #ifndef RO_AFTER_INIT_DATA
+ #define RO_AFTER_INIT_DATA						\
++	. = ALIGN(8);							\
+ 	__start_ro_after_init = .;					\
+ 	*(.data..ro_after_init)						\
+ 	__end_ro_after_init = .;
+-- 
+2.24.1
+
diff --git a/board/qemu/sh4eb-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch b/board/qemu/sh4eb-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch
new file mode 100644
index 0000000000..941052c2b2
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/patches/linux/0002-arch-sh-vmlinux.scr.patch
@@ -0,0 +1,32 @@
+From fe657afd48fc67841d32207ef9eeeb5f099764cd Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 21 Dec 2019 11:52:04 +0100
+Subject: [PATCH 2/3] arch/sh: vmlinux.scr
+
+Building the kernel using a toolchain built with Binutils 2.33.1 prevent
+booting a sh4 system under Qemu.
+Apply the patch provided by Alan Modra [2] that fix alignment of rodata.
+
+[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
+[2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/sh/boot/compressed/vmlinux.scr | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/sh/boot/compressed/vmlinux.scr b/arch/sh/boot/compressed/vmlinux.scr
+index 862d74808236..dd292b4b9082 100644
+--- a/arch/sh/boot/compressed/vmlinux.scr
++++ b/arch/sh/boot/compressed/vmlinux.scr
+@@ -1,6 +1,6 @@
+ SECTIONS
+ {
+-  .rodata..compressed : {
++  .rodata..compressed : ALIGN(8) {
+ 	input_len = .;
+ 	LONG(input_data_end - input_data) input_data = .;
+ 	*(.data)
+-- 
+2.24.1
+
diff --git a/board/qemu/sh4eb-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch b/board/qemu/sh4eb-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch
new file mode 100644
index 0000000000..7a4543125c
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/patches/linux/0003-include-asm-generic-vmlinux.lds.h.patch
@@ -0,0 +1,27 @@
+From 7f92adbba385a4e512abfd6633ac0f9f0cdf91f8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 21 Dec 2019 11:54:07 +0100
+Subject: [PATCH 3/3] include/asm-generic: vmlinux.lds.h
+
+https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/asm-generic/vmlinux.lds.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
+index d7701d466b60..1aa33597e91e 100644
+--- a/include/asm-generic/vmlinux.lds.h
++++ b/include/asm-generic/vmlinux.lds.h
+@@ -306,6 +306,7 @@
+  */
+ #ifndef RO_AFTER_INIT_DATA
+ #define RO_AFTER_INIT_DATA						\
++	. = ALIGN(8);							\
+ 	__start_ro_after_init = .;					\
+ 	*(.data..ro_after_init)						\
+ 	__end_ro_after_init = .;
+-- 
+2.24.1
+
diff --git a/package/binutils/2.33.1/0003-Revert-PR24311-FAIL-S-records-with-constructors.patch b/package/binutils/2.33.1/0003-Revert-PR24311-FAIL-S-records-with-constructors.patch
deleted file mode 100644
index 046d0d6f36..0000000000
--- a/package/binutils/2.33.1/0003-Revert-PR24311-FAIL-S-records-with-constructors.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 7a8213503e25998e2610d5a8c0b19eefb5e41596 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 30 Nov 2019 03:12:37 +0100
-Subject: [PATCH] Revert "PR24311, FAIL: S-records with constructors"
-
-This reverts commit ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e.
-
-Revert this patch since it prevent booting a sh4 system under
-Qemu as reported on the Binutils mailing list [1].
-This commit is not related to sh4, it's weird that it is the
-only affected architecture.
-
-[1] https://sourceware.org/ml/binutils/2019-10/msg00105.html
-[2] https://sourceware.org/ml/binutils/2019-11/msg00407.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- bfd/merge.c | 52 ++++++++++++++++++++++------------------------------
- 1 file changed, 22 insertions(+), 30 deletions(-)
-
-diff --git a/bfd/merge.c b/bfd/merge.c
-index 632c8523903..fb7c0858beb 100644
---- a/bfd/merge.c
-+++ b/bfd/merge.c
-@@ -621,7 +621,7 @@ is_suffix (const struct sec_merge_hash_entry *A,
- 
- /* This is a helper function for _bfd_merge_sections.  It attempts to
-    merge strings matching suffixes of longer strings.  */
--static struct sec_merge_sec_info *
-+static bfd_boolean
- merge_strings (struct sec_merge_info *sinfo)
- {
-   struct sec_merge_hash_entry **array, **a, *e;
-@@ -633,7 +633,7 @@ merge_strings (struct sec_merge_info *sinfo)
-   amt = sinfo->htab->size * sizeof (struct sec_merge_hash_entry *);
-   array = (struct sec_merge_hash_entry **) bfd_malloc (amt);
-   if (array == NULL)
--    return NULL;
-+    return FALSE;
- 
-   for (e = sinfo->htab->first, a = array; e; e = e->next)
-     if (e->alignment)
-@@ -703,6 +703,11 @@ merge_strings (struct sec_merge_info *sinfo)
- 	}
-     }
-   secinfo->sec->size = size;
-+  if (secinfo->sec->alignment_power != 0)
-+    {
-+      bfd_size_type align = (bfd_size_type) 1 << secinfo->sec->alignment_power;
-+      secinfo->sec->size = (secinfo->sec->size + align - 1) & -align;
-+    }
- 
-   /* And now adjust the rest, removing them from the chain (but not hashtable)
-      at the same time.  */
-@@ -719,7 +724,7 @@ merge_strings (struct sec_merge_info *sinfo)
- 	    e->u.index = e->u.suffix->u.index + (e->u.suffix->len - e->len);
- 	  }
-       }
--  return secinfo;
-+  return TRUE;
- }
- 
- /* This function is called once after all SEC_MERGE sections are registered
-@@ -735,8 +740,7 @@ _bfd_merge_sections (bfd *abfd,
- 
-   for (sinfo = (struct sec_merge_info *) xsinfo; sinfo; sinfo = sinfo->next)
-     {
--      struct sec_merge_sec_info *secinfo;
--      bfd_size_type align;
-+      struct sec_merge_sec_info * secinfo;
- 
-       if (! sinfo->chain)
- 	continue;
-@@ -747,7 +751,6 @@ _bfd_merge_sections (bfd *abfd,
-       secinfo->next = NULL;
- 
-       /* Record the sections into the hash table.  */
--      align = 1;
-       for (secinfo = sinfo->chain; secinfo; secinfo = secinfo->next)
- 	if (secinfo->sec->flags & SEC_EXCLUDE)
- 	  {
-@@ -755,25 +758,18 @@ _bfd_merge_sections (bfd *abfd,
- 	    if (remove_hook)
- 	      (*remove_hook) (abfd, secinfo->sec);
- 	  }
--	else
--	  {
--	    if (!record_section (sinfo, secinfo))
--	      return FALSE;
--	    if (align)
--	      {
--		align = (bfd_size_type) 1 << secinfo->sec->alignment_power;
--		if ((secinfo->sec->size & (align - 1)) != 0)
--		  align = 0;
--	      }
--	  }
-+	else if (! record_section (sinfo, secinfo))
-+	  return FALSE;
-+
-+      if (secinfo)
-+	continue;
- 
-       if (sinfo->htab->first == NULL)
- 	continue;
- 
-       if (sinfo->htab->strings)
- 	{
--	  secinfo = merge_strings (sinfo);
--	  if (!secinfo)
-+	  if (!merge_strings (sinfo))
- 	    return FALSE;
- 	}
-       else
-@@ -793,7 +789,8 @@ _bfd_merge_sections (bfd *abfd,
- 		  e->secinfo->first_str = e;
- 		  size = 0;
- 		}
--	      size = (size + e->alignment - 1) & ~((bfd_vma) e->alignment - 1);
-+	      size = (size + e->alignment - 1)
-+		     & ~((bfd_vma) e->alignment - 1);
- 	      e->u.index = size;
- 	      size += e->len;
- 	      secinfo = e->secinfo;
-@@ -801,16 +798,11 @@ _bfd_merge_sections (bfd *abfd,
- 	  secinfo->sec->size = size;
- 	}
- 
--      /* If the input sections were padded according to their alignments,
--	 then pad the output too.  */
--      if (align)
--	secinfo->sec->size = (secinfo->sec->size + align - 1) & -align;
--
--      /* Finally remove all input sections which have not made it into
--	 the hash table at all.  */
--      for (secinfo = sinfo->chain; secinfo; secinfo = secinfo->next)
--	if (secinfo->first_str == NULL)
--	  secinfo->sec->flags |= SEC_EXCLUDE | SEC_KEEP;
-+	/* Finally remove all input sections which have not made it into
-+	   the hash table at all.  */
-+	for (secinfo = sinfo->chain; secinfo; secinfo = secinfo->next)
-+	  if (secinfo->first_str == NULL)
-+	    secinfo->sec->flags |= SEC_EXCLUDE | SEC_KEEP;
-     }
- 
-   return TRUE;
--- 
-2.23.0
-
-- 
2.24.1
