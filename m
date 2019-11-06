From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 15:47:34 +0100
Subject: [Buildroot] [git commit] toolchain: bump ARC tools to
 arc-2019.09-rc1
Message-ID: <20191106144146.621948E8B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a1e1ee9bc3164f18160a91f597c6051ebb11e95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps ARC toolchain to arc-2019.09-rc1.
We want to test how new toolchain-rc1 builds packages,
so we can make fixes before release of toolcain.

ARC GNU tools of version arc-2019.09-rc1 bring some quite significant changes like:
* Binutils v2_33.20191002 with additional ARC patches
* GCC 9.2.0 with additional ARC patches
* glibc 2.30 with additional ARC patches

Please note that it is a release candidate and it might contain some breakages,
please don't use it for production builds.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                    |   2 +-
 ...vert-ARC-Check-UNDEFWEAK_NO_DYNAMIC_RELOC.patch | 244 ---------------------
 .../0001-poison-system-directories.patch           |   0
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   4 +-
 package/gcc/Config.in.host                         |   2 +-
 .../0100-uclibc-conf.patch                         |   0
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 ...4-defining-TRAP_HWBKPT-before-including-g.patch |  52 -----
 package/gdb/gdb.hash                               |   2 +-
 .../glibc.hash                                     |   2 +-
 package/glibc/glibc.mk                             |   2 +-
 13 files changed, 10 insertions(+), 306 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 9def812dc1..7246411de0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -37,7 +37,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2019.09-eng002"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2019.09-rc1"	if BR2_BINUTILS_VERSION_ARC
 	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
diff --git a/package/binutils/arc-2019.09-eng002/0002-Revert-ARC-Check-UNDEFWEAK_NO_DYNAMIC_RELOC.patch b/package/binutils/arc-2019.09-eng002/0002-Revert-ARC-Check-UNDEFWEAK_NO_DYNAMIC_RELOC.patch
deleted file mode 100644
index 74a1a8cd9b..0000000000
--- a/package/binutils/arc-2019.09-eng002/0002-Revert-ARC-Check-UNDEFWEAK_NO_DYNAMIC_RELOC.patch
+++ /dev/null
@@ -1,244 +0,0 @@
-From 0bd0ecc386b82ce4b61dc64fe6cdd6a851acc866 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@gmail.com>
-Date: Thu, 31 Oct 2019 10:39:07 +0100
-Subject: [PATCH] Revert "[ARC] Check UNDEFWEAK_NO_DYNAMIC_RELOC"
-
-Gives errors when -fPIE used.
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
-
-This reverts commit 1823527532407648f3061b130c55f2138496b2aa.
----
- bfd/elf32-arc.c                  | 120 +++++++++++++------------------
- ld/testsuite/ld-arc/weakhid.s    |  13 ----
- ld/testsuite/ld-arc/weakhiddso.d |  29 --------
- 3 files changed, 50 insertions(+), 112 deletions(-)
- delete mode 100644 ld/testsuite/ld-arc/weakhid.s
- delete mode 100644 ld/testsuite/ld-arc/weakhiddso.d
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index b92b0b7501a..e9463bea04f 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -1462,7 +1462,6 @@ elf_arc_relocate_section (bfd *			  output_bfd,
-       struct elf_link_hash_entry *  h2;
-       const char *		    msg;
-       bfd_boolean		    unresolved_reloc = FALSE;
--      bfd_boolean resolved_to_zero;
- 
-       struct arc_relocation_data reloc_data =
-       {
-@@ -1604,8 +1603,6 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 	  continue;
- 	}
- 
--      resolved_to_zero = (h != NULL && UNDEFWEAK_NO_DYNAMIC_RELOC (info, h));
--
-       if (r_symndx < symtab_hdr->sh_info) /* A local symbol.  */
- 	{
- 	  reloc_data.sym_value = sym->st_value;
-@@ -1714,8 +1711,7 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 		  reloc_data.sym_section = htab->splt;
- 		  reloc_data.should_relocate = TRUE;
- 		}
--	      /* See pr22269.  */
--	      else if (!resolved_to_zero)
-+	      else
- 		continue;
- 	    }
- 	  else
-@@ -1787,26 +1783,24 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 
-       switch (r_type)
- 	{
--	case R_ARC_32:
--	case R_ARC_32_ME:
--	case R_ARC_PC32:
--	case R_ARC_32_PCREL:
--	  if (bfd_link_pic (info)
--	      && !resolved_to_zero
--	      && (input_section->flags & SEC_ALLOC) != 0
--	      && (!IS_ARC_PCREL_TYPE (r_type)
--		  || (h != NULL
--		      && h->dynindx != -1
--		      && !h->def_regular
--		      && (!info->symbolic || !h->def_regular))))
--	    {
--	      Elf_Internal_Rela outrel;
--	      bfd_byte *loc;
--	      bfd_boolean skip = FALSE;
--	      bfd_boolean relocate = FALSE;
--	      asection *sreloc = _bfd_elf_get_dynamic_reloc_section
--		(input_bfd, input_section,
--		 /*RELA*/ TRUE);
-+	  case R_ARC_32:
-+	  case R_ARC_32_ME:
-+	  case R_ARC_PC32:
-+	  case R_ARC_32_PCREL:
-+	    if (bfd_link_pic (info)
-+		&& (!IS_ARC_PCREL_TYPE (r_type)
-+		    || (h != NULL
-+			&& h->dynindx != -1
-+			&& !h->def_regular
-+			&& (!info->symbolic || !h->def_regular))))
-+	      {
-+		Elf_Internal_Rela outrel;
-+		bfd_byte *loc;
-+		bfd_boolean skip = FALSE;
-+		bfd_boolean relocate = FALSE;
-+		asection *sreloc = _bfd_elf_get_dynamic_reloc_section
-+				 (input_bfd, input_section,
-+				  /*RELA*/ TRUE);
- 
- 		BFD_ASSERT (sreloc != NULL);
- 
-@@ -2009,8 +2003,6 @@ elf_arc_check_relocs (bfd *			 abfd,
- 
-       switch (r_type)
- 	{
--	case R_ARC_8:
--	case R_ARC_16:
- 	case R_ARC_32:
- 	case R_ARC_32_ME:
- 	  /* During shared library creation, these relocs should not
-@@ -2041,51 +2033,39 @@ elf_arc_check_relocs (bfd *			 abfd,
- 	      return FALSE;
- 	    }
- 
--	  /* In some cases we are not setting the 'non_got_ref' flag,
--	     even though the relocations don't require a GOT access.
--	     We should extend the testing in this area to ensure that
--	     no significant cases are being missed.  */
--	  if (h)
--	    h->non_got_ref = 1;
--
--	  /* We don't need to handle relocs into sections not going
--	     into the "real" output.  */
--	  if ((sec->flags & SEC_ALLOC) == 0)
--	    break;
-+	    /* In some cases we are not setting the 'non_got_ref'
-+	       flag, even though the relocations don't require a GOT
-+	       access.  We should extend the testing in this area to
-+	       ensure that no significant cases are being missed.  */
-+	    if (h)
-+	      h->non_got_ref = 1;
-+	    /* FALLTHROUGH */
-+	  case R_ARC_PC32:
-+	  case R_ARC_32_PCREL:
-+	    if ((bfd_link_pic (info))
-+		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
-+		    || (h != NULL
-+			&& (!info->symbolic || !h->def_regular))))
-+	      {
-+		if (sreloc == NULL)
-+		  {
-+		    if (info->dynamic
-+			&& ! htab->dynamic_sections_created
-+			&& ! _bfd_elf_link_create_dynamic_sections (abfd, info))
-+		      return FALSE;
-+		    sreloc = _bfd_elf_make_dynamic_reloc_section (sec, dynobj,
-+								  2, abfd,
-+								  /*rela*/
-+								  TRUE);
-+
-+		    if (sreloc == NULL)
-+		      return FALSE;
-+		  }
-+		sreloc->size += sizeof (Elf32_External_Rela);
- 
--	  /* No need to do anything if we're not creating a shared
--	     object.  */
--	  if (!bfd_link_pic (info)
--	      || (h != NULL
--		  && UNDEFWEAK_NO_DYNAMIC_RELOC (info, h)))
-+	      }
-+	  default:
- 	    break;
--
--	  /* FALLTHROUGH */
--	case R_ARC_PC32:
--	case R_ARC_32_PCREL:
--	  if ((bfd_link_pic (info))
--	      && ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
--		  || (h != NULL
--		      && (!info->symbolic || !h->def_regular))))
--	    {
--	      if (sreloc == NULL)
--		{
--		  if (info->dynamic
--		      && ! htab->dynamic_sections_created
--		      && ! _bfd_elf_link_create_dynamic_sections (abfd, info))
--		    return FALSE;
--		  sreloc = _bfd_elf_make_dynamic_reloc_section (sec, dynobj,
--								2, abfd,
--								/*rela*/
--								TRUE);
--
--		  if (sreloc == NULL)
--		    return FALSE;
--		}
--	      sreloc->size += sizeof (Elf32_External_Rela);
--	    }
--	default:
--	  break;
- 	}
- 
-       if (is_reloc_for_PLT (howto))
-diff --git a/ld/testsuite/ld-arc/weakhid.s b/ld/testsuite/ld-arc/weakhid.s
-deleted file mode 100644
-index a8c87da1a2d..00000000000
---- a/ld/testsuite/ld-arc/weakhid.s
-+++ /dev/null
-@@ -1,13 +0,0 @@
-- .weak xweakobj
-- .weak xweakhidobj
-- .hidden xweakhidobj
--
-- .data
-- .global x
-- .type	x, at object
--x:
-- .word xweakhidobj
-- .word xweakobj
-- .word xregobj
--.Lfe1:
-- .size	x,.Lfe1-x
-diff --git a/ld/testsuite/ld-arc/weakhiddso.d b/ld/testsuite/ld-arc/weakhiddso.d
-deleted file mode 100644
-index f52f27fc048..00000000000
---- a/ld/testsuite/ld-arc/weakhiddso.d
-+++ /dev/null
-@@ -1,29 +0,0 @@
--#source: weakhid.s
--#ld: --shared -m arclinux -z nocombreloc --hash-style=sysv
--#objdump: -s -R -T
--
--# Check that .weak and .weak .hidden object references are handled
--# correctly when generating a DSO.  Copied from CRIS port.
--
--.*: +file format .*arc.*
--
--DYNAMIC SYMBOL TABLE:
--0+2208 l    d  \.data	0+ \.data
--0+2208 g    DO \.data	0+c x
--0+      D  \*UND\*	0+ xregobj
--0+2214 g    D  \.data	0+ __bss_start
--0+  w   D  \*UND\*	0+ xweakobj
--0+2214 g    D  \.data	0+ _edata
--0+2214 g    D  \.data	0+ _end
--
--
--DYNAMIC RELOCATION RECORDS
--OFFSET   TYPE              VALUE 
--0+2210 R_ARC_32 +xregobj
--0+ R_ARC_NONE +\*ABS\*
--
--Contents of section \.hash:
--#...
--Contents of section \.data:
-- 2208 00000000 00000000 00000000           .*
--#...
-\ No newline at end of file
--- 
-2.17.2
-
diff --git a/package/binutils/arc-2019.09-eng002/0001-poison-system-directories.patch b/package/binutils/arc-2019.09-rc1/0001-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2019.09-eng002/0001-poison-system-directories.patch
rename to package/binutils/arc-2019.09-rc1/0001-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 4aea049d3a..586e619c6c 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,7 +4,7 @@ sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe13
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  db6a0a855733a79ec71127b94981e6be63c4852dee5aed2bc9738da7d3c3796d88974e86ae9dc20cf28ea5e31897ddf8d68f695fcadfbdec1a8406b437d73df6  binutils-gdb-arc-2019.09-eng002.tar.gz
+sha512  3840770da5ede0248f6a6605e3f1743210acd9f4da7de48720ef566cc2aae52ea9e84c285a0a6d39eb15bd7ad197d543b6e407ec9e1a00739989e574d4e04384  binutils-gdb-arc-2019.09-rc1.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a4ed1a8f76..f492be8383 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2019.09-eng002
+BINUTILS_VERSION = arc-2019.09-rc1
 else
 BINUTILS_VERSION = 2.31.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2019.09-eng002)
+ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e2a4032c90..a5550e50d8 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -96,7 +96,7 @@ config BR2_GCC_VERSION
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
 	default "9.2.0"     if BR2_GCC_VERSION_9_X
-	default "arc-2019.09-eng002" if BR2_GCC_VERSION_ARC
+	default "arc-2019.09-rc1" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
diff --git a/package/gcc/arc-2019.09-eng002/0100-uclibc-conf.patch b/package/gcc/arc-2019.09-rc1/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2019.09-eng002/0100-uclibc-conf.patch
rename to package/gcc/arc-2019.09-rc1/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 756e133820..fda14dd126 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,7 +8,7 @@ sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8
 sha512  a12dff52af876aee0fd89a8d09cdc455f35ec46845e154023202392adc164848faf8ee881b59b681b696e27c69fd143a214014db4214db62f9891a1c8365c040  gcc-9.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  7ab8f8ffb79f0b7b69e87aa5692ba29e71478c9e2a4521ba57fcd818e25a20869025c8985a5e09f2f24483aa695881ba9aed4d2df0fc8c8129d791526156db93  gcc-arc-2019.09-eng002.tar.gz
+sha512  c478efba4a497875b2add3b1bf4261c187459e252d397ace40ca740e51ac96491defa78733aafcb2b03c8e2e423dd8c115761a5e74ef2386368d53730f3e45ba  gcc-arc-2019.09-rc1.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 # Locally calculated (fetched from https://github.com/c-sky/gcc)
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a9b6dcbd2d..a22b3150aa 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,7 +67,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2019.09-eng002-gdb" if BR2_arc
+	default "arc-2019.09-rc1-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.1.1"    if BR2_GDB_VERSION_8_1
 	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/arc-2018.09-gdb/0001-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch b/package/gdb/arc-2018.09-gdb/0001-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
deleted file mode 100644
index 1ee39658f1..0000000000
--- a/package/gdb/arc-2018.09-gdb/0001-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e213d8e1b5317389c3beee648811bc649d62d743 Mon Sep 17 00:00:00 2001
-From: James Clarke <jrtc27@jrtc27.com>
-Date: Fri, 19 Jan 2018 17:22:49 +0000
-Subject: [PATCH] gdb: Fix ia64 defining TRAP_HWBKPT before including
- gdb_wait.h
-
-On ia64, gdb_wait.h eventually includes siginfo-consts-arch.h, which
-contains an enum with TRAP_HWBKPT, along with a #define. Thus we cannot
-define TRAP_HWBKPT to 4 beforehand, and so gdb_wait.h must be included
-earlier; include it from linux-ptrace.h so it can never come afterwards.
-
-gdb/ChangeLog:
-
-	* nat/linux-ptrace.c: Remove unnecessary reinclusion of
-	gdb_ptrace.h, and move including gdb_wait.h ...
-	* nat/linux-ptrace.h: ... to here.
-
-[Backport from upstream 5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8]
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gdb/nat/linux-ptrace.c | 2 --
- gdb/nat/linux-ptrace.h | 1 +
- 2 files changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
-index 438177fa7622..1240eead0d50 100644
---- a/gdb/nat/linux-ptrace.c
-+++ b/gdb/nat/linux-ptrace.c
-@@ -21,8 +21,6 @@
- #include "linux-procfs.h"
- #include "linux-waitpid.h"
- #include "buffer.h"
--#include "gdb_wait.h"
--#include "gdb_ptrace.h"
- #ifdef HAVE_SYS_PROCFS_H
- #include <sys/procfs.h>
- #endif
-diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
-index 59549452c099..6faa89b22a0e 100644
---- a/gdb/nat/linux-ptrace.h
-+++ b/gdb/nat/linux-ptrace.h
-@@ -21,6 +21,7 @@
- struct buffer;
- 
- #include "nat/gdb_ptrace.h"
-+#include "gdb_wait.h"
- 
- #ifdef __UCLIBC__
- #if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
--- 
-2.19.2
-
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 69ab252130..ec60b47c20 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,7 +4,7 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
 sha512  47ac074d20a09a3fac8f4a41dce0a0cbe6ef702f7dc21ba8b7d650d306128dcae481e9a16bf65e596b3a541dc82ae57c02bcbb786d551b4ef3e2917b9b6f0ae1	gdb-8.3.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  2625e568ec85652cc223409162b4bd97dd292c5f7a597a57ccb2c6c88a69dfc5fbcf1f0750716ab94c932fa97c8900732f7d2fec940973bc3d6c88ef3f8c6d26 	gdb-arc-2019.09-eng002-gdb.tar.gz
+sha512  a2b83e949638fa27d3d2b971e3a77902050191d517c5b9ca1273d182b8c3b9da2c993a0dbaf76e18d2603e59a1af6618dff830a3905f22272af68fcbb49d58a8 	gdb-arc-2019.09-rc1-gdb.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/glibc/arc-2019.09-eng002/glibc.hash b/package/glibc/arc-2019.09-rc1/glibc.hash
similarity index 75%
rename from package/glibc/arc-2019.09-eng002/glibc.hash
rename to package/glibc/arc-2019.09-rc1/glibc.hash
index 5a0b7629ea..e99eedc8ea 100644
--- a/package/glibc/arc-2019.09-eng002/glibc.hash
+++ b/package/glibc/arc-2019.09-rc1/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  7ae8409c6e0649f21a9dccd55b0d84cb34ab69c1e95cb1bf807a0713bcf7a086  glibc-arc-2019.09-eng002.tar.gz
+sha256  a9beeace7e2b4b25c6d253591b005975c50bf4ca1c0b6b38a24d89ac5a1458e1  glibc-arc-2019.09-rc1.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index c6acc43ff5..fd25162920 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2019.09-eng002
+GLIBC_VERSION =  arc-2019.09-rc1
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
