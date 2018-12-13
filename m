From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:37:08 +0100
Subject: [Buildroot] [git commit] boot/grub: fix grub-mkimage with binutils
 >= 2.31
Message-ID: <20181213203319.407488D38E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44fbfa08572cce4ba43a7c5ef70d249ace0e971f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While using pc_x86_64_efi_defconfig with a bleeding-edge x86_64 toolchain
based on binutils 2.31, the grub-mkimage command return this error:

grub-mkimage: error: relocation 0x4 is not implemented yet.

Backport an upstream patch [1] as suggested on openembedded mailing list [2].

[1] http://git.savannah.gnu.org/cgit/grub.git/commit/?id=842c390469e2c2e10b5aa36700324cd3bde25875
[2] http://lists.openembedded.org/pipermail/openembedded-core/2018-July/153054.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/boot/grub2/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch b/boot/grub2/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch
new file mode 100644
index 0000000000..cd8b5e73ce
--- /dev/null
+++ b/boot/grub2/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch
@@ -0,0 +1,74 @@
+From 842c390469e2c2e10b5aa36700324cd3bde25875 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 17 Feb 2018 06:47:28 -0800
+Subject: [PATCH] x86-64: Treat R_X86_64_PLT32 as R_X86_64_PC32
+
+Starting from binutils commit bd7ab16b4537788ad53521c45469a1bdae84ad4a:
+
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=bd7ab16b4537788ad53521c45469a1bdae84ad4a
+
+x86-64 assembler generates R_X86_64_PLT32, instead of R_X86_64_PC32, for
+32-bit PC-relative branches.  Grub2 should treat R_X86_64_PLT32 as
+R_X86_64_PC32.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ grub-core/efiemu/i386/loadcore64.c | 1 +
+ grub-core/kern/x86_64/dl.c         | 1 +
+ util/grub-mkimagexx.c              | 1 +
+ util/grub-module-verifier.c        | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/grub-core/efiemu/i386/loadcore64.c b/grub-core/efiemu/i386/loadcore64.c
+index e49d0b6..18facf4 100644
+--- a/grub-core/efiemu/i386/loadcore64.c
++++ b/grub-core/efiemu/i386/loadcore64.c
+@@ -98,6 +98,7 @@ grub_arch_efiemu_relocate_symbols64 (grub_efiemu_segment_t segs,
+ 		    break;
+ 
+ 		  case R_X86_64_PC32:
++		  case R_X86_64_PLT32:
+ 		    err = grub_efiemu_write_value (addr,
+ 						   *addr32 + rel->r_addend
+ 						   + sym.off
+diff --git a/grub-core/kern/x86_64/dl.c b/grub-core/kern/x86_64/dl.c
+index 4406906..3a73e6e 100644
+--- a/grub-core/kern/x86_64/dl.c
++++ b/grub-core/kern/x86_64/dl.c
+@@ -70,6 +70,7 @@ grub_arch_dl_relocate_symbols (grub_dl_t mod, void *ehdr,
+ 	  break;
+ 
+ 	case R_X86_64_PC32:
++	case R_X86_64_PLT32:
+ 	  {
+ 	    grub_int64_t value;
+ 	    value = ((grub_int32_t) *addr32) + rel->r_addend + sym->st_value -
+diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
+index a2bb054..39d7efb 100644
+--- a/util/grub-mkimagexx.c
++++ b/util/grub-mkimagexx.c
+@@ -841,6 +841,7 @@ SUFFIX (relocate_addresses) (Elf_Ehdr *e, Elf_Shdr *sections,
+ 		  break;
+ 
+ 		case R_X86_64_PC32:
++		case R_X86_64_PLT32:
+ 		  {
+ 		    grub_uint32_t *t32 = (grub_uint32_t *) target;
+ 		    *t32 = grub_host_to_target64 (grub_target_to_host32 (*t32)
+diff --git a/util/grub-module-verifier.c b/util/grub-module-verifier.c
+index 9179285..a79271f 100644
+--- a/util/grub-module-verifier.c
++++ b/util/grub-module-verifier.c
+@@ -19,6 +19,7 @@ struct grub_module_verifier_arch archs[] = {
+       -1
+     }, (int[]){
+       R_X86_64_PC32,
++      R_X86_64_PLT32,
+       -1
+     }
+   },
+-- 
+2.7.4
+
