From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 10 Mar 2019 11:44:27 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/elf2flt: bump version to fix
 build with Binutils >= 2.32
Message-ID: <20190310104428.11398-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

Binutils added bfd_stdint.h to bfd.h [1], so elf2flt must create a
symlink for this header.

Bump the elf2flt version that include the upstream fix [2].

Keep our local patch 0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
that was not integrated with the recent project activity [3].

Fixes:
[armv7m-uclibc]
https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356410

[m68k-coldfire-uclibc]
https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356412

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2d5d5a8f0a8b5a03454bf168b7fa7024bb1ebbd8
[2] https://github.com/uclinux-dev/elf2flt/commit/429521f695c6f4212d809a141bfa4417b733f395
[3] https://github.com/uclinux-dev/elf2flt/pull/8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: bump the version instead of adding a new local patch (Arnout).
---
 ...002-Makefile-fix-build-with-Binutils-2.31.patch | 34 ----------------------
 package/elf2flt/elf2flt.hash                       |  2 +-
 package/elf2flt/elf2flt.mk                         |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/elf2flt/0002-Makefile-fix-build-with-Binutils-2.31.patch

diff --git a/package/elf2flt/0002-Makefile-fix-build-with-Binutils-2.31.patch b/package/elf2flt/0002-Makefile-fix-build-with-Binutils-2.31.patch
deleted file mode 100644
index 825582550b..0000000000
--- a/package/elf2flt/0002-Makefile-fix-build-with-Binutils-2.31.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From faf1a1646093fbc5ed279bae1c7250c7dfea56f8 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 17 Jul 2018 16:36:16 +0200
-Subject: [PATCH] Makefile: fix build with Binutils 2.31
-
-Binutils added diagnostics.h to bfd.h [1], so elf2flt must create a symlink
-for this header.
-
-Fixes:
-https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82284139
-
-[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=95da9854466ada2572b42f5528711a06a2d42db1
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index cfad06c..164e306 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -127,7 +127,7 @@ bfd-headers/.stamp:
- 	rm -rf bfd-headers
- 	mkdir bfd-headers
- 	ln -sf $(BFD_INCLUDE_DIR)/bfd.h bfd-headers/bfd.h
--	for f in ansidecl filenames hashtab libiberty symcat; do \
-+	for f in ansidecl diagnostics filenames hashtab libiberty symcat; do \
- 		ln -sf $(BINUTILS_INCLUDE_DIR)/$$f.h bfd-headers/$$f.h || exit 1; \
- 	done
- 	ln -sf $(BINUTILS_INCLUDE_DIR)/elf bfd-headers/elf
--- 
-2.7.4
-
diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index 40df62c8c0..773cf35b77 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 7713bd1debd24a94b795b7fc698dc97e306e7cbcc1d0580856c79fe70aac9c45  elf2flt-6d80ab6c93409e796f85da404bde84b841231531.tar.gz
+sha256 d63baae6fe0d7fcc50a635be151a6f9e1e83dba30568046a869a395c15bf6284  elf2flt-7e33f28df198c46764021ed14408bd262751e148.tar.gz
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 557f94d338..e7edd8b9de 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 6d80ab6c93409e796f85da404bde84b841231531
+ELF2FLT_VERSION = 7e33f28df198c46764021ed14408bd262751e148
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
-- 
2.14.5
