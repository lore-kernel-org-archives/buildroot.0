From: Laine Walker-Avina <lwalkera@ieee.org>
Date: Tue, 20 Apr 2010 09:12:39 +0200
Subject: [Buildroot] [git commit master] toolchain/binutils: Improve arm
	linking performance
Message-ID: <20100420071957.CD8718B79D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b33e2abd4ea5395565f1f417d1e897f6654fd16d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backported a patch from CVS that improves linking times for large
projects (eg 700s to 6s). See
http://old.nabble.com/-PATCH--Reduce-ARM-linking-time-tt27961038.html
for the original.

[Peter: add patch header]
Signed-off-by: Laine Walker-Avina <lwalkera@ieee.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/binutils/2.20.1/400-arm_link_speed.patch |  183 ++++++++++++++++++++
 toolchain/binutils/2.20/400-arm_link_speed.patch   |  183 ++++++++++++++++++++
 2 files changed, 366 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/binutils/2.20.1/400-arm_link_speed.patch
 create mode 100644 toolchain/binutils/2.20/400-arm_link_speed.patch

diff --git a/toolchain/binutils/2.20.1/400-arm_link_speed.patch b/toolchain/binutils/2.20.1/400-arm_link_speed.patch
new file mode 100644
index 0000000..d03385a
--- /dev/null
+++ b/toolchain/binutils/2.20.1/400-arm_link_speed.patch
@@ -0,0 +1,183 @@
+From Binutils CVS:
+
+http://sourceware.org/cgi-bin/cvsweb.cgi/src/bfd/elf32-arm.c?rev=1.230&content-type=text/x-cvsweb-markup&cvsroot=src
+
+Improves linking time from large projects on ARM.
+diff -dupr binutils-2.20.orig/bfd/elf32-arm.c binutils-2.20/bfd/elf32-arm.c
+--- binutils-2.20.orig/bfd/elf32-arm.c	2010-04-19 10:08:50.000000000 -0700
++++ binutils-2.20/bfd/elf32-arm.c	2010-04-19 10:12:45.000000000 -0700
+@@ -12736,108 +12736,15 @@ elf32_arm_section_from_shdr (bfd *abfd,
+   return TRUE;
+ }
+
+-/* A structure used to record a list of sections, independently
+-   of the next and prev fields in the asection structure.  */
+-typedef struct section_list
+-{
+-  asection * sec;
+-  struct section_list * next;
+-  struct section_list * prev;
+-}
+-section_list;
+-
+-/* Unfortunately we need to keep a list of sections for which
+-   an _arm_elf_section_data structure has been allocated.  This
+-   is because it is possible for functions like elf32_arm_write_section
+-   to be called on a section which has had an elf_data_structure
+-   allocated for it (and so the used_by_bfd field is valid) but
+-   for which the ARM extended version of this structure - the
+-   _arm_elf_section_data structure - has not been allocated.  */
+-static section_list * sections_with_arm_elf_section_data = NULL;
+-
+-static void
+-record_section_with_arm_elf_section_data (asection * sec)
+-{
+-  struct section_list * entry;
+-
+-  entry = bfd_malloc (sizeof (* entry));
+-  if (entry == NULL)
+-    return;
+-  entry->sec = sec;
+-  entry->next = sections_with_arm_elf_section_data;
+-  entry->prev = NULL;
+-  if (entry->next != NULL)
+-    entry->next->prev = entry;
+-  sections_with_arm_elf_section_data = entry;
+-}
+-
+-static struct section_list *
+-find_arm_elf_section_entry (asection * sec)
+-{
+-  struct section_list * entry;
+-  static struct section_list * last_entry = NULL;
+-
+-  /* This is a short cut for the typical case where the sections are added
+-     to the sections_with_arm_elf_section_data list in forward order and
+-     then looked up here in backwards order.  This makes a real difference
+-     to the ld-srec/sec64k.exp linker test.  */
+-  entry = sections_with_arm_elf_section_data;
+-  if (last_entry != NULL)
+-    {
+-      if (last_entry->sec == sec)
+-	entry = last_entry;
+-      else if (last_entry->next != NULL
+-	       && last_entry->next->sec == sec)
+-	entry = last_entry->next;
+-    }
+-
+-  for (; entry; entry = entry->next)
+-    if (entry->sec == sec)
+-      break;
+-
+-  if (entry)
+-    /* Record the entry prior to this one - it is the entry we are most
+-       likely to want to locate next time.  Also this way if we have been
+-       called from unrecord_section_with_arm_elf_section_data() we will not
+-       be caching a pointer that is about to be freed.  */
+-    last_entry = entry->prev;
+-
+-  return entry;
+-}
+-
+ static _arm_elf_section_data *
+ get_arm_elf_section_data (asection * sec)
+ {
+-  struct section_list * entry;
+-
+-  entry = find_arm_elf_section_entry (sec);
+-
+-  if (entry)
+-    return elf32_arm_section_data (entry->sec);
++  if (sec && sec->owner && is_arm_elf (sec->owner))
++    return elf32_arm_section_data (sec);
+   else
+     return NULL;
+ }
+
+-static void
+-unrecord_section_with_arm_elf_section_data (asection * sec)
+-{
+-  struct section_list * entry;
+-
+-  entry = find_arm_elf_section_entry (sec);
+-
+-  if (entry)
+-    {
+-      if (entry->prev != NULL)
+-	entry->prev->next = entry->next;
+-      if (entry->next != NULL)
+-	entry->next->prev = entry->prev;
+-      if (entry == sections_with_arm_elf_section_data)
+-	sections_with_arm_elf_section_data = entry->next;
+-      free (entry);
+-    }
+-}
+-
+-
+ typedef struct
+ {
+   void *finfo;
+@@ -13230,8 +13137,6 @@ elf32_arm_new_section_hook (bfd *abfd, a
+       sec->used_by_bfd = sdata;
+     }
+
+-  record_section_with_arm_elf_section_data (sec);
+-
+   return _bfd_elf_new_section_hook (abfd, sec);
+ }
+
+@@ -13659,44 +13564,13 @@ elf32_arm_write_section (bfd *output_bfd
+     }
+
+   free (map);
+-  arm_data->mapcount = 0;
++  arm_data->mapcount = -1;
+   arm_data->mapsize = 0;
+   arm_data->map = NULL;
+-  unrecord_section_with_arm_elf_section_data (sec);
+
+   return FALSE;
+ }
+
+-static void
+-unrecord_section_via_map_over_sections (bfd * abfd ATTRIBUTE_UNUSED,
+-					asection * sec,
+-					void * ignore ATTRIBUTE_UNUSED)
+-{
+-  unrecord_section_with_arm_elf_section_data (sec);
+-}
+-
+-static bfd_boolean
+-elf32_arm_close_and_cleanup (bfd * abfd)
+-{
+-  if (abfd->sections)
+-    bfd_map_over_sections (abfd,
+-			   unrecord_section_via_map_over_sections,
+-			   NULL);
+-
+-  return _bfd_elf_close_and_cleanup (abfd);
+-}
+-
+-static bfd_boolean
+-elf32_arm_bfd_free_cached_info (bfd * abfd)
+-{
+-  if (abfd->sections)
+-    bfd_map_over_sections (abfd,
+-			   unrecord_section_via_map_over_sections,
+-			   NULL);
+-
+-  return _bfd_free_cached_info (abfd);
+-}
+-
+ /* Display STT_ARM_TFUNC symbols as functions.  */
+
+ static void
+@@ -13882,8 +13756,6 @@ const struct elf_size_info elf32_arm_siz
+ #define bfd_elf32_find_inliner_info	        elf32_arm_find_inliner_info
+ #define bfd_elf32_new_section_hook		elf32_arm_new_section_hook
+ #define bfd_elf32_bfd_is_target_special_symbol	elf32_arm_is_target_special_symbol
+-#define bfd_elf32_close_and_cleanup             elf32_arm_close_and_cleanup
+-#define bfd_elf32_bfd_free_cached_info          elf32_arm_bfd_free_cached_info
+ #define bfd_elf32_bfd_final_link		elf32_arm_final_link
+
+ #define elf_backend_get_symbol_type             elf32_arm_get_symbol_type
diff --git a/toolchain/binutils/2.20/400-arm_link_speed.patch b/toolchain/binutils/2.20/400-arm_link_speed.patch
new file mode 100644
index 0000000..d03385a
--- /dev/null
+++ b/toolchain/binutils/2.20/400-arm_link_speed.patch
@@ -0,0 +1,183 @@
+From Binutils CVS:
+
+http://sourceware.org/cgi-bin/cvsweb.cgi/src/bfd/elf32-arm.c?rev=1.230&content-type=text/x-cvsweb-markup&cvsroot=src
+
+Improves linking time from large projects on ARM.
+diff -dupr binutils-2.20.orig/bfd/elf32-arm.c binutils-2.20/bfd/elf32-arm.c
+--- binutils-2.20.orig/bfd/elf32-arm.c	2010-04-19 10:08:50.000000000 -0700
++++ binutils-2.20/bfd/elf32-arm.c	2010-04-19 10:12:45.000000000 -0700
+@@ -12736,108 +12736,15 @@ elf32_arm_section_from_shdr (bfd *abfd,
+   return TRUE;
+ }
+
+-/* A structure used to record a list of sections, independently
+-   of the next and prev fields in the asection structure.  */
+-typedef struct section_list
+-{
+-  asection * sec;
+-  struct section_list * next;
+-  struct section_list * prev;
+-}
+-section_list;
+-
+-/* Unfortunately we need to keep a list of sections for which
+-   an _arm_elf_section_data structure has been allocated.  This
+-   is because it is possible for functions like elf32_arm_write_section
+-   to be called on a section which has had an elf_data_structure
+-   allocated for it (and so the used_by_bfd field is valid) but
+-   for which the ARM extended version of this structure - the
+-   _arm_elf_section_data structure - has not been allocated.  */
+-static section_list * sections_with_arm_elf_section_data = NULL;
+-
+-static void
+-record_section_with_arm_elf_section_data (asection * sec)
+-{
+-  struct section_list * entry;
+-
+-  entry = bfd_malloc (sizeof (* entry));
+-  if (entry == NULL)
+-    return;
+-  entry->sec = sec;
+-  entry->next = sections_with_arm_elf_section_data;
+-  entry->prev = NULL;
+-  if (entry->next != NULL)
+-    entry->next->prev = entry;
+-  sections_with_arm_elf_section_data = entry;
+-}
+-
+-static struct section_list *
+-find_arm_elf_section_entry (asection * sec)
+-{
+-  struct section_list * entry;
+-  static struct section_list * last_entry = NULL;
+-
+-  /* This is a short cut for the typical case where the sections are added
+-     to the sections_with_arm_elf_section_data list in forward order and
+-     then looked up here in backwards order.  This makes a real difference
+-     to the ld-srec/sec64k.exp linker test.  */
+-  entry = sections_with_arm_elf_section_data;
+-  if (last_entry != NULL)
+-    {
+-      if (last_entry->sec == sec)
+-	entry = last_entry;
+-      else if (last_entry->next != NULL
+-	       && last_entry->next->sec == sec)
+-	entry = last_entry->next;
+-    }
+-
+-  for (; entry; entry = entry->next)
+-    if (entry->sec == sec)
+-      break;
+-
+-  if (entry)
+-    /* Record the entry prior to this one - it is the entry we are most
+-       likely to want to locate next time.  Also this way if we have been
+-       called from unrecord_section_with_arm_elf_section_data() we will not
+-       be caching a pointer that is about to be freed.  */
+-    last_entry = entry->prev;
+-
+-  return entry;
+-}
+-
+ static _arm_elf_section_data *
+ get_arm_elf_section_data (asection * sec)
+ {
+-  struct section_list * entry;
+-
+-  entry = find_arm_elf_section_entry (sec);
+-
+-  if (entry)
+-    return elf32_arm_section_data (entry->sec);
++  if (sec && sec->owner && is_arm_elf (sec->owner))
++    return elf32_arm_section_data (sec);
+   else
+     return NULL;
+ }
+
+-static void
+-unrecord_section_with_arm_elf_section_data (asection * sec)
+-{
+-  struct section_list * entry;
+-
+-  entry = find_arm_elf_section_entry (sec);
+-
+-  if (entry)
+-    {
+-      if (entry->prev != NULL)
+-	entry->prev->next = entry->next;
+-      if (entry->next != NULL)
+-	entry->next->prev = entry->prev;
+-      if (entry == sections_with_arm_elf_section_data)
+-	sections_with_arm_elf_section_data = entry->next;
+-      free (entry);
+-    }
+-}
+-
+-
+ typedef struct
+ {
+   void *finfo;
+@@ -13230,8 +13137,6 @@ elf32_arm_new_section_hook (bfd *abfd, a
+       sec->used_by_bfd = sdata;
+     }
+
+-  record_section_with_arm_elf_section_data (sec);
+-
+   return _bfd_elf_new_section_hook (abfd, sec);
+ }
+
+@@ -13659,44 +13564,13 @@ elf32_arm_write_section (bfd *output_bfd
+     }
+
+   free (map);
+-  arm_data->mapcount = 0;
++  arm_data->mapcount = -1;
+   arm_data->mapsize = 0;
+   arm_data->map = NULL;
+-  unrecord_section_with_arm_elf_section_data (sec);
+
+   return FALSE;
+ }
+
+-static void
+-unrecord_section_via_map_over_sections (bfd * abfd ATTRIBUTE_UNUSED,
+-					asection * sec,
+-					void * ignore ATTRIBUTE_UNUSED)
+-{
+-  unrecord_section_with_arm_elf_section_data (sec);
+-}
+-
+-static bfd_boolean
+-elf32_arm_close_and_cleanup (bfd * abfd)
+-{
+-  if (abfd->sections)
+-    bfd_map_over_sections (abfd,
+-			   unrecord_section_via_map_over_sections,
+-			   NULL);
+-
+-  return _bfd_elf_close_and_cleanup (abfd);
+-}
+-
+-static bfd_boolean
+-elf32_arm_bfd_free_cached_info (bfd * abfd)
+-{
+-  if (abfd->sections)
+-    bfd_map_over_sections (abfd,
+-			   unrecord_section_via_map_over_sections,
+-			   NULL);
+-
+-  return _bfd_free_cached_info (abfd);
+-}
+-
+ /* Display STT_ARM_TFUNC symbols as functions.  */
+
+ static void
+@@ -13882,8 +13756,6 @@ const struct elf_size_info elf32_arm_siz
+ #define bfd_elf32_find_inliner_info	        elf32_arm_find_inliner_info
+ #define bfd_elf32_new_section_hook		elf32_arm_new_section_hook
+ #define bfd_elf32_bfd_is_target_special_symbol	elf32_arm_is_target_special_symbol
+-#define bfd_elf32_close_and_cleanup             elf32_arm_close_and_cleanup
+-#define bfd_elf32_bfd_free_cached_info          elf32_arm_bfd_free_cached_info
+ #define bfd_elf32_bfd_final_link		elf32_arm_final_link
+
+ #define elf_backend_get_symbol_type             elf32_arm_get_symbol_type
-- 
1.6.3.3
