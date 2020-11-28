From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 28 Nov 2020 10:50:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: bump to version 1.6.8
Message-ID: <20201128095050.6055-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 ...001-PATCH-Define-PN_XNUM-if-missing.patch} |   0
 ...move-duplicated-variable-definitions.patch | 104 ------------------
 package/makedumpfile/makedumpfile.hash        |   2 +-
 package/makedumpfile/makedumpfile.mk          |   4 +-
 4 files changed, 3 insertions(+), 107 deletions(-)
 rename package/makedumpfile/{0002-PATCH-Define-PN_XNUM-if-missing.patch => 0001-PATCH-Define-PN_XNUM-if-missing.patch} (100%)
 delete mode 100644 package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch

diff --git a/package/makedumpfile/0002-PATCH-Define-PN_XNUM-if-missing.patch b/package/makedumpfile/0001-PATCH-Define-PN_XNUM-if-missing.patch
similarity index 100%
rename from package/makedumpfile/0002-PATCH-Define-PN_XNUM-if-missing.patch
rename to package/makedumpfile/0001-PATCH-Define-PN_XNUM-if-missing.patch
diff --git a/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch b/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
deleted file mode 100644
index aab4f70f06..0000000000
--- a/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 399f2c9a3acd5bd913e50a4dde52dee6527b297e Mon Sep 17 00:00:00 2001
-From: Kairui Song <kasong@redhat.com>
-Date: Wed, 29 Jan 2020 13:37:13 +0800
-Subject: [PATCH] Remove duplicated variable definitions
-
-When building on Fedora 32 (with GCC 10), following error is observed:
-
-/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2010: multiple definition of
- `crash_reserved_mem_nr'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2010: first defined here
-/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2009: multiple definition of
- `crash_reserved_mem'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2009: first defined here
-/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1278: multiple definition of
- `parallel_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1278: first defined here
-/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1265: multiple definition of
- `splitting_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1265: first defined here
-...
-collect2: error: ld returned 1 exit status
-make: *** [Makefile:97: makedumpfile] Error 1
-
-These variables are wrongly defined multiple times. So remove the
-duplicated definitions.
-
-Signed-off-by: Kairui Song <kasong@redhat.com>
-Signed-off-by: Kazuhito Hagio <k-hagio-ab@nec.com>
-Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
----
- makedumpfile.c | 8 ++++----
- makedumpfile.h | 8 ++++----
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/makedumpfile.c b/makedumpfile.c
-index e290fbd..ae7336a 100644
---- a/makedumpfile.c
-+++ b/makedumpfile.c
-@@ -10954,7 +10954,7 @@ check_param_for_reassembling_dumpfile(int argc, char *argv[])
- 		return FALSE;
- 
- 	if ((info->splitting_info
--	    = malloc(sizeof(splitting_info_t) * info->num_dumpfile))
-+	    = malloc(sizeof(struct splitting_info) * info->num_dumpfile))
- 	    == NULL) {
- 		MSG("Can't allocate memory for splitting_info.\n");
- 		return FALSE;
-@@ -11042,7 +11042,7 @@ check_param_for_creating_dumpfile(int argc, char *argv[])
- 			return FALSE;
- 		}
- 		if ((info->splitting_info
--		    = malloc(sizeof(splitting_info_t) * info->num_dumpfile))
-+		    = malloc(sizeof(struct splitting_info) * info->num_dumpfile))
- 		    == NULL) {
- 			MSG("Can't allocate memory for splitting_info.\n");
- 			return FALSE;
-@@ -11077,13 +11077,13 @@ check_param_for_creating_dumpfile(int argc, char *argv[])
- 
- 	if (info->num_threads) {
- 		if ((info->parallel_info =
--		     malloc(sizeof(parallel_info_t) * info->num_threads))
-+		     malloc(sizeof(struct parallel_info) * info->num_threads))
- 		    == NULL) {
- 			MSG("Can't allocate memory for parallel_info.\n");
- 			return FALSE;
- 		}
- 
--		memset(info->parallel_info, 0, sizeof(parallel_info_t)
-+		memset(info->parallel_info, 0, sizeof(struct parallel_info)
- 							* info->num_threads);
- 	}
- 
-diff --git a/makedumpfile.h b/makedumpfile.h
-index 68d9691..7217407 100644
---- a/makedumpfile.h
-+++ b/makedumpfile.h
-@@ -1262,7 +1262,7 @@ struct splitting_info {
- 	mdf_pfn_t		end_pfn;
- 	off_t			offset_eraseinfo;
- 	unsigned long		size_eraseinfo;
--} splitting_info_t;
-+};
- 
- struct parallel_info {
- 	int			fd_memory;
-@@ -1275,7 +1275,7 @@ struct parallel_info {
- #ifdef USELZO
- 	lzo_bytep		wrkmem;
- #endif
--} parallel_info_t;
-+};
- 
- struct ppc64_vmemmap {
- 	unsigned long		phys;
-@@ -2006,8 +2006,8 @@ struct memory_range {
- };
- 
- #define CRASH_RESERVED_MEM_NR   8
--struct memory_range crash_reserved_mem[CRASH_RESERVED_MEM_NR];
--int crash_reserved_mem_nr;
-+extern struct memory_range crash_reserved_mem[CRASH_RESERVED_MEM_NR];
-+extern int crash_reserved_mem_nr;
- 
- unsigned long read_vmcoreinfo_symbol(char *str_symbol);
- int readmem(int type_addr, unsigned long long addr, void *bufptr, size_t size);
--- 
-2.28.0
-
diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index 2ecfc5b1c5..1b2df008d2 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cd3642dfe780d446f2dc328736bb2070007032718f5628262d5f59baf03619a4  makedumpfile-1.6.7.tar.gz
+sha256  85d79b7090e9a8ce0d426795d3bc1de2858def7e12954d9bc6ae03de160b694c  makedumpfile-1.6.8.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index ad63e280e8..99fb3a71c8 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.6.7
-MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,Released-$(subst .,-,$(MAKEDUMPFILE_VERSION)))
+MAKEDUMPFILE_VERSION = 1.6.8
+MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,$(MAKEDUMPFILE_VERSION))
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
 MAKEDUMPFILE_LICENSE_FILES = COPYING
-- 
2.29.2
