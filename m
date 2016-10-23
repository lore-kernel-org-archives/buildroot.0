From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 23 Oct 2016 21:26:16 +0200
Subject: [Buildroot] [PATCH] microblaze: fix musl support
Message-ID: <20161023192616.GA12827@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For musl we need patches for bintils 2.25.1 and 2.26.1.
Binutils 2.27 and gcc 6.2.x does not work for microblaze,
even not for uClibc-ng or glibc.
For gcc 5.4.x the existing patch need reworking so that
musl and uClibc-ng is supported.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
I have not yet reported the open issues to upstream.
It is on my todo. But this patchset allows at least to build working
toolchains and allows to do runtime test in Qemu.
---
 package/binutils/2.25.1/800-microblaze-musl.patch  | 18 +++++++++++
 package/binutils/2.26.1/0800-microblaze-musl.patch | 19 ++++++++++++
 package/binutils/Config.in.host                    |  2 ++
 package/gcc/5.4.0/892-microblaze-uclibc.patch      | 24 ---------------
 .../gcc/5.4.0/910-microblaze-musl-and-uclibc.patch | 36 ++++++++++++++++++++++
 package/gcc/Config.in.host                         |  4 +++
 6 files changed, 79 insertions(+), 24 deletions(-)
 create mode 100644 package/binutils/2.25.1/800-microblaze-musl.patch
 create mode 100644 package/binutils/2.26.1/0800-microblaze-musl.patch
 delete mode 100644 package/gcc/5.4.0/892-microblaze-uclibc.patch
 create mode 100644 package/gcc/5.4.0/910-microblaze-musl-and-uclibc.patch

diff --git a/package/binutils/2.25.1/800-microblaze-musl.patch b/package/binutils/2.25.1/800-microblaze-musl.patch
new file mode 100644
index 0000000..84b91a2
--- /dev/null
+++ b/package/binutils/2.25.1/800-microblaze-musl.patch
@@ -0,0 +1,18 @@
+From here:
+https://sourceware.org/bugzilla/show_bug.cgi?id=19516
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur binutils-2.25.1.orig/bfd/elf32-microblaze.c binutils-2.25.1/bfd/elf32-microblaze.c
+--- binutils-2.25.1.orig/bfd/elf32-microblaze.c	2015-07-21 10:20:58.000000000 +0200
++++ binutils-2.25.1/bfd/elf32-microblaze.c	2016-02-14 11:38:45.822387506 +0100
+@@ -3293,8 +3293,7 @@
+          The entry in the global offset table will already have been
+          initialized in the relocate_section function.  */
+       if (info->shared
+-          && (info->symbolic || h->dynindx == -1)
+-          && h->def_regular)
++          && ((info->symbolic && h->def_regular) || h->dynindx == -1))
+         {
+           asection *sec = h->root.u.def.section;
+           microblaze_elf_output_dynamic_relocation (output_bfd,
diff --git a/package/binutils/2.26.1/0800-microblaze-musl.patch b/package/binutils/2.26.1/0800-microblaze-musl.patch
new file mode 100644
index 0000000..623102c
--- /dev/null
+++ b/package/binutils/2.26.1/0800-microblaze-musl.patch
@@ -0,0 +1,19 @@
+From here:
+https://sourceware.org/bugzilla/show_bug.cgi?id=19516
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur binutils-2.26.1.orig/bfd/elf32-microblaze.c binutils-2.26.1/bfd/elf32-microblaze.c
+--- binutils-2.26.1.orig/bfd/elf32-microblaze.c	2015-11-13 09:27:40.000000000 +0100
++++ binutils-2.26.1/bfd/elf32-microblaze.c	2016-10-20 19:06:58.655565765 +0200
+@@ -3296,8 +3296,8 @@
+          The entry in the global offset table will already have been
+          initialized in the relocate_section function.  */
+       if (bfd_link_pic (info)
+-          && (info->symbolic || h->dynindx == -1)
+-          && h->def_regular)
++	  && ((info->symbolic && h->def_regular)
++		|| h->dynindx == -1))
+         {
+           asection *sec = h->root.u.def.section;
+           microblaze_elf_output_dynamic_relocation (output_bfd,
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 3e0c357..a7610b4 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -17,6 +17,8 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_27_X
 		bool "binutils 2.27"
+		# supported but broken on Microblaze
+		depends on !BR2_microblaze
 
 endchoice
 
diff --git a/package/gcc/5.4.0/892-microblaze-uclibc.patch b/package/gcc/5.4.0/892-microblaze-uclibc.patch
deleted file mode 100644
index a8eb5a6..0000000
--- a/package/gcc/5.4.0/892-microblaze-uclibc.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Add dynamic linker support for uClibc
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
-
-diff -Nur gcc-5.3.0.orig/gcc/config/microblaze/linux.h gcc-5.3.0/gcc/config/microblaze/linux.h
---- gcc-5.3.0.orig/gcc/config/microblaze/linux.h	2015-05-28 16:08:19.000000000 +0200
-+++ gcc-5.3.0/gcc/config/microblaze/linux.h	2016-05-13 09:21:01.579262885 +0200
-@@ -28,7 +28,15 @@
- #undef TLS_NEEDS_GOT
- #define TLS_NEEDS_GOT 1
- 
--#define DYNAMIC_LINKER "/lib/ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER	"/lib/ld.so.1"
-+#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
-+
-+#if DEFAULT_LIBC == LIBC_UCLIBC
-+#define DYNAMIC_LINKER UCLIBC_DYNAMIC_LINKER
-+#else
-+#define DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
-+#endif
-+
- #undef  SUBTARGET_EXTRA_SPECS
- #define SUBTARGET_EXTRA_SPECS \
-   { "dynamic_linker", DYNAMIC_LINKER }
diff --git a/package/gcc/5.4.0/910-microblaze-musl-and-uclibc.patch b/package/gcc/5.4.0/910-microblaze-musl-and-uclibc.patch
new file mode 100644
index 0000000..6fe4993
--- /dev/null
+++ b/package/gcc/5.4.0/910-microblaze-musl-and-uclibc.patch
@@ -0,0 +1,36 @@
+Add dynamic linker support for uClibc-ng/musl
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+
+
+diff -Nur gcc-5.4.0.orig/gcc/config/microblaze/linux.h gcc-5.4.0/gcc/config/microblaze/linux.h
+--- gcc-5.4.0.orig/gcc/config/microblaze/linux.h	2015-05-28 16:08:19.000000000 +0200
++++ gcc-5.4.0/gcc/config/microblaze/linux.h	2016-10-23 17:09:46.962010871 +0200
+@@ -28,7 +28,26 @@
+ #undef TLS_NEEDS_GOT
+ #define TLS_NEEDS_GOT 1
+ 
+-#define DYNAMIC_LINKER "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER	"/lib/ld.so.1"
++#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
++
++#if TARGET_BIG_ENDIAN_DEFAULT == 0 /* LE */
++#define MUSL_DYNAMIC_LINKER_E "%{EB:;:el}"
++#else
++#define MUSL_DYNAMIC_LINKER_E "%{EL:el}"
++#endif
++
++#undef MUSL_DYNAMIC_LINKER
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
++
++#if DEFAULT_LIBC == LIBC_UCLIBC
++#define DYNAMIC_LINKER UCLIBC_DYNAMIC_LINKER
++#elif DEFAULT_LIBC == LIBC_MUSL
++#define DYNAMIC_LINKER MUSL_DYNAMIC_LINKER
++#else
++#define DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
++#endif
++
+ #undef  SUBTARGET_EXTRA_SPECS
+ #define SUBTARGET_EXTRA_SPECS \
+   { "dynamic_linker", DYNAMIC_LINKER }
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d204bf7..2060e51 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -48,6 +48,8 @@ choice
 		depends on !BR2_MIPS_CPU_MIPS32R5 && !BR2_MIPS_CPU_MIPS64R5
 		# Unsupported for MIPS R6
 		depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+		# musl microblaze unsupported
+		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
 		# musl ppc64 unsupported
 		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
 		# musl mips64 unsupported
@@ -73,6 +75,8 @@ choice
 		bool "gcc 6.x"
 		# Broken or unsupported architectures
 		depends on !BR2_arc
+		depends on !BR2_microblazeel
+		depends on !BR2_microblazebe
 		# Unsupported MIPS cores
 		depends on !BR2_mips_m6201 && !BR2_mips_p6600
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-- 
2.1.4
