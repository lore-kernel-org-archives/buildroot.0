From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 23:09:47 +0200
Subject: [Buildroot] [git commit] package/kexec: bump to version 2.0.21
Message-ID: <20210409204942.F27DC82A96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb8824ddc025a93384a500305c67fecd8880e58f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.infradead.org/pipermail/kexec/2020-December/021835.html

Both patches were backports and are included in the 2.0.21 release so
they are deleted.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-kexec-build-multiboot2-for-i386.patch     |  72 ---------------
 ...s-Remove-duplicated-variable-declarations.patch | 102 ---------------------
 package/kexec/kexec.hash                           |   2 +-
 package/kexec/kexec.mk                             |   2 +-
 4 files changed, 2 insertions(+), 176 deletions(-)

diff --git a/package/kexec/0001-kexec-build-multiboot2-for-i386.patch b/package/kexec/0001-kexec-build-multiboot2-for-i386.patch
deleted file mode 100644
index c67da98ce7..0000000000
--- a/package/kexec/0001-kexec-build-multiboot2-for-i386.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 2c9f26ed20a791a7df0182ba82e93abb52f5a615 Mon Sep 17 00:00:00 2001
-From: Chris Packham <chris.packham@alliedtelesis.co.nz>
-Date: Mon, 18 Nov 2019 12:52:15 +1300
-Subject: kexec: build multiboot2 for i386
-
-This addresses the following compilation issues when building for i386.
-
- kexec/arch/i386/kexec-x86.c:39:22: error: 'multiboot2_x86_probe' undeclared here (not in a function); did you mean 'multiboot_x86_probe'?
-   { "multiboot2-x86", multiboot2_x86_probe, multiboot2_x86_load,
-                       ^~~~~~~~~~~~~~~~~~~~
-                       multiboot_x86_probe
- kexec/arch/i386/kexec-x86.c:39:44: error: 'multiboot2_x86_load' undeclared here (not in a function); did you mean 'multiboot_x86_load'?
-   { "multiboot2-x86", multiboot2_x86_probe, multiboot2_x86_load,
-                                             ^~~~~~~~~~~~~~~~~~~
-                                             multiboot_x86_load
- kexec/arch/i386/kexec-x86.c:40:4: error: 'multiboot2_x86_usage' undeclared here (not in a function); did you mean 'multiboot_x86_usage'?
-     multiboot2_x86_usage },
-     ^~~~~~~~~~~~~~~~~~~~
-     multiboot_x86_usage
- make: *** [Makefile:114: kexec/arch/i386/kexec-x86.o] Error 1
- make: *** Waiting for unfinished jobs....
-
-Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
-Signed-off-by: Simon Horman <horms@verge.net.au>
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=2c9f26ed20a791a7df0182ba82e93abb52f5a615]
----
- kexec/arch/i386/Makefile    | 2 +-
- kexec/arch/i386/kexec-x86.h | 5 +++++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/kexec/arch/i386/Makefile b/kexec/arch/i386/Makefile
-index 105cefd..f486103 100644
---- a/kexec/arch/i386/Makefile
-+++ b/kexec/arch/i386/Makefile
-@@ -7,6 +7,7 @@ i386_KEXEC_SRCS += kexec/arch/i386/kexec-elf-x86.c
- i386_KEXEC_SRCS += kexec/arch/i386/kexec-elf-rel-x86.c
- i386_KEXEC_SRCS += kexec/arch/i386/kexec-bzImage.c
- i386_KEXEC_SRCS += kexec/arch/i386/kexec-multiboot-x86.c
-+i386_KEXEC_SRCS += kexec/arch/i386/kexec-mb2-x86.c
- i386_KEXEC_SRCS += kexec/arch/i386/kexec-beoboot-x86.c
- i386_KEXEC_SRCS += kexec/arch/i386/kexec-nbi.c
- i386_KEXEC_SRCS += kexec/arch/i386/x86-linux-setup.c
-@@ -14,7 +15,6 @@ i386_KEXEC_SRCS += kexec/arch/i386/crashdump-x86.c
- 
- dist += kexec/arch/i386/Makefile $(i386_KEXEC_SRCS)			\
- 	kexec/arch/i386/crashdump-x86.h					\
--	kexec/arch/i386/kexec-mb2-x86.c					\
- 	kexec/arch/i386/kexec-x86.h					\
- 	kexec/arch/i386/x86-linux-setup.h				\
- 	kexec/arch/i386/include/arch/options.h
-diff --git a/kexec/arch/i386/kexec-x86.h b/kexec/arch/i386/kexec-x86.h
-index 1b58c3b..0f941df 100644
---- a/kexec/arch/i386/kexec-x86.h
-+++ b/kexec/arch/i386/kexec-x86.h
-@@ -60,6 +60,11 @@ int multiboot_x86_load(int argc, char **argv, const char *buf, off_t len,
- 	struct kexec_info *info);
- void multiboot_x86_usage(void);
- 
-+int multiboot2_x86_load(int argc, char **argv, const char *buf, off_t len,
-+			struct kexec_info *info);
-+void multiboot2_x86_usage(void);
-+int multiboot2_x86_probe(const char *buf, off_t buf_len);
-+
- int elf_x86_probe(const char *buf, off_t len);
- int elf_x86_load(int argc, char **argv, const char *buf, off_t len,
- 	struct kexec_info *info);
--- 
-cgit 1.2-0.3.lf.el7
-
diff --git a/package/kexec/0002-kexec-tools-Remove-duplicated-variable-declarations.patch b/package/kexec/0002-kexec-tools-Remove-duplicated-variable-declarations.patch
deleted file mode 100644
index 99cb9a2824..0000000000
--- a/package/kexec/0002-kexec-tools-Remove-duplicated-variable-declarations.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From cc087b11462af9f971a2c090d07e8d780a867b50 Mon Sep 17 00:00:00 2001
-From: Kairui Song <kasong@redhat.com>
-Date: Wed, 29 Jan 2020 13:38:19 +0800
-Subject: kexec-tools: Remove duplicated variable declarations
-
-When building kexec-tools for Fedora 32, following error is observed:
-
-/usr/bin/ld: kexec/arch/x86_64/kexec-bzImage64.o:(.bss+0x0): multiple definition of `bzImage_support_efi_boot';
-kexec/arch/i386/kexec-bzImage.o:(.bss+0x0): first defined here
-
-/builddir/build/BUILD/kexec-tools-2.0.20/kexec/arch/arm/../../fs2dt.h:33: multiple definition of `my_debug';
-kexec/fs2dt.o:/builddir/build/BUILD/kexec-tools-2.0.20/kexec/fs2dt.h:33: first defined here
-
-/builddir/build/BUILD/kexec-tools-2.0.20/kexec/arch/arm64/kexec-arm64.h:68: multiple definition of `arm64_mem';
-kexec/fs2dt.o:/builddir/build/BUILD/kexec-tools-2.0.20/././kexec/arch/arm64/kexec-arm64.h:68: first defined here
-
-/builddir/build/BUILD/kexec-tools-2.0.20/kexec/arch/arm64/kexec-arm64.h:54: multiple definition of `initrd_size';
-kexec/fs2dt.o:/builddir/build/BUILD/kexec-tools-2.0.20/././kexec/arch/arm64/kexec-arm64.h:54: first defined here
-
-/builddir/build/BUILD/kexec-tools-2.0.20/kexec/arch/arm64/kexec-arm64.h:53: multiple definition of `initrd_base';
-kexec/fs2dt.o:/builddir/build/BUILD/kexec-tools-2.0.20/././kexec/arch/arm64/kexec-arm64.h:53: first defined here
-
-And apparently, these variables are wrongly declared multiple times. So
-remove duplicated declaration.
-
-Signed-off-by: Kairui Song <kasong@redhat.com>
-Signed-off-by: Simon Horman <horms@verge.net.au>
-[Retrieved from:
-https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=cc087b11462af9f971a2c090d07e8d780a867b50]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kexec/arch/arm64/kexec-arm64.h      | 6 +++---
- kexec/arch/ppc64/kexec-elf-ppc64.c  | 2 --
- kexec/arch/x86_64/kexec-bzImage64.c | 1 -
- kexec/fs2dt.h                       | 2 +-
- 4 files changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/kexec/arch/arm64/kexec-arm64.h b/kexec/arch/arm64/kexec-arm64.h
-index 628de79..ed447ac 100644
---- a/kexec/arch/arm64/kexec-arm64.h
-+++ b/kexec/arch/arm64/kexec-arm64.h
-@@ -50,8 +50,8 @@ int zImage_arm64_load(int argc, char **argv, const char *kernel_buf,
- void zImage_arm64_usage(void);
- 
- 
--off_t initrd_base;
--off_t initrd_size;
-+extern off_t initrd_base;
-+extern off_t initrd_size;
- 
- /**
-  * struct arm64_mem - Memory layout info.
-@@ -65,7 +65,7 @@ struct arm64_mem {
- };
- 
- #define arm64_mem_ngv UINT64_MAX
--struct arm64_mem arm64_mem;
-+extern struct arm64_mem arm64_mem;
- 
- uint64_t get_phys_offset(void);
- uint64_t get_vp_offset(void);
-diff --git a/kexec/arch/ppc64/kexec-elf-ppc64.c b/kexec/arch/ppc64/kexec-elf-ppc64.c
-index 3510b70..695b8b0 100644
---- a/kexec/arch/ppc64/kexec-elf-ppc64.c
-+++ b/kexec/arch/ppc64/kexec-elf-ppc64.c
-@@ -44,8 +44,6 @@
- uint64_t initrd_base, initrd_size;
- unsigned char reuse_initrd = 0;
- const char *ramdisk;
--/* Used for enabling printing message from purgatory code */
--int my_debug = 0;
- 
- int elf_ppc64_probe(const char *buf, off_t len)
- {
-diff --git a/kexec/arch/x86_64/kexec-bzImage64.c b/kexec/arch/x86_64/kexec-bzImage64.c
-index 8edb3e4..ba8dc48 100644
---- a/kexec/arch/x86_64/kexec-bzImage64.c
-+++ b/kexec/arch/x86_64/kexec-bzImage64.c
-@@ -42,7 +42,6 @@
- #include <arch/options.h>
- 
- static const int probe_debug = 0;
--int bzImage_support_efi_boot;
- 
- int bzImage64_probe(const char *buf, off_t len)
- {
-diff --git a/kexec/fs2dt.h b/kexec/fs2dt.h
-index 7633273..fe24931 100644
---- a/kexec/fs2dt.h
-+++ b/kexec/fs2dt.h
-@@ -30,7 +30,7 @@ extern struct bootblock bb[1];
- 
- /* Used for enabling printing message from purgatory code
-  * Only has implemented for PPC64 */
--int my_debug;
-+extern int my_debug;
- extern int dt_no_old_root;
- 
- void reserve(unsigned long long where, unsigned long long length);
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 302e079066..e8eb932a65 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256 dad8077f0315445d1f6335579fc4ade222facf82a67124974c7be5303ba4f8c8 kexec-tools-2.0.20.tar.xz
+sha256 e113142dee891638ad96e0f72cf9277b244477619470b30c41999d312e8e8702 kexec-tools-2.0.21.tar.xz
 # locally calculated
 sha256 fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7 COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index c54ce1f11a..280fe42d30 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.20
+KEXEC_VERSION = 2.0.21
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
