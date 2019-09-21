From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 23:15:27 +0200
Subject: [Buildroot] [git commit] boot/grub2: bump to verson 2.04
Message-ID: <20190921211051.7DD2E8F0CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea7ec41cf64e86a692ac45e0d012c6e8199ef110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch | 74 ----------------------
 boot/grub2/grub2.hash                              |  3 +-
 boot/grub2/grub2.mk                                |  2 +-
 3 files changed, 3 insertions(+), 76 deletions(-)

diff --git a/boot/grub2/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch b/boot/grub2/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch
deleted file mode 100644
index cd8b5e73ce..0000000000
--- a/boot/grub2/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 842c390469e2c2e10b5aa36700324cd3bde25875 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Sat, 17 Feb 2018 06:47:28 -0800
-Subject: [PATCH] x86-64: Treat R_X86_64_PLT32 as R_X86_64_PC32
-
-Starting from binutils commit bd7ab16b4537788ad53521c45469a1bdae84ad4a:
-
-https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=bd7ab16b4537788ad53521c45469a1bdae84ad4a
-
-x86-64 assembler generates R_X86_64_PLT32, instead of R_X86_64_PC32, for
-32-bit PC-relative branches.  Grub2 should treat R_X86_64_PLT32 as
-R_X86_64_PC32.
-
-Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- grub-core/efiemu/i386/loadcore64.c | 1 +
- grub-core/kern/x86_64/dl.c         | 1 +
- util/grub-mkimagexx.c              | 1 +
- util/grub-module-verifier.c        | 1 +
- 4 files changed, 4 insertions(+)
-
-diff --git a/grub-core/efiemu/i386/loadcore64.c b/grub-core/efiemu/i386/loadcore64.c
-index e49d0b6..18facf4 100644
---- a/grub-core/efiemu/i386/loadcore64.c
-+++ b/grub-core/efiemu/i386/loadcore64.c
-@@ -98,6 +98,7 @@ grub_arch_efiemu_relocate_symbols64 (grub_efiemu_segment_t segs,
- 		    break;
- 
- 		  case R_X86_64_PC32:
-+		  case R_X86_64_PLT32:
- 		    err = grub_efiemu_write_value (addr,
- 						   *addr32 + rel->r_addend
- 						   + sym.off
-diff --git a/grub-core/kern/x86_64/dl.c b/grub-core/kern/x86_64/dl.c
-index 4406906..3a73e6e 100644
---- a/grub-core/kern/x86_64/dl.c
-+++ b/grub-core/kern/x86_64/dl.c
-@@ -70,6 +70,7 @@ grub_arch_dl_relocate_symbols (grub_dl_t mod, void *ehdr,
- 	  break;
- 
- 	case R_X86_64_PC32:
-+	case R_X86_64_PLT32:
- 	  {
- 	    grub_int64_t value;
- 	    value = ((grub_int32_t) *addr32) + rel->r_addend + sym->st_value -
-diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
-index a2bb054..39d7efb 100644
---- a/util/grub-mkimagexx.c
-+++ b/util/grub-mkimagexx.c
-@@ -841,6 +841,7 @@ SUFFIX (relocate_addresses) (Elf_Ehdr *e, Elf_Shdr *sections,
- 		  break;
- 
- 		case R_X86_64_PC32:
-+		case R_X86_64_PLT32:
- 		  {
- 		    grub_uint32_t *t32 = (grub_uint32_t *) target;
- 		    *t32 = grub_host_to_target64 (grub_target_to_host32 (*t32)
-diff --git a/util/grub-module-verifier.c b/util/grub-module-verifier.c
-index 9179285..a79271f 100644
---- a/util/grub-module-verifier.c
-+++ b/util/grub-module-verifier.c
-@@ -19,6 +19,7 @@ struct grub_module_verifier_arch archs[] = {
-       -1
-     }, (int[]){
-       R_X86_64_PC32,
-+      R_X86_64_PLT32,
-       -1
-     }
-   },
--- 
-2.7.4
-
diff --git a/boot/grub2/grub2.hash b/boot/grub2/grub2.hash
index 7f0679fe3a..338fe59724 100644
--- a/boot/grub2/grub2.hash
+++ b/boot/grub2/grub2.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 810b3798d316394f94096ec2797909dbf23c858e48f7b3830826b8daa06b7b0f grub-2.02.tar.xz
+sha256 e5292496995ad42dabe843a0192cf2a2c502e7ffcc7479398232b10a472df77d grub-2.04.tar.xz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 65371f0170..a202525d71 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRUB2_VERSION = 2.02
+GRUB2_VERSION = 2.04
 GRUB2_SITE = http://ftp.gnu.org/gnu/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
