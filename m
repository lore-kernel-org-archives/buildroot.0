From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 17 Jul 2018 18:31:42 +0200
Subject: [Buildroot] [PATCH] package/elf2flt: fix build with Binutils >= 2.31
Message-ID: <1531845102-20058-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Binutils added diagnostics.h to bfd.h [1], so elf2flt must create a
symlink for this header.

Fixes:
https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82284139

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=95da9854466ada2572b42f5528711a06a2d42db1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Note: for Binutils < 2.31 elf2flt create a broken symlink diagnostics.h
in bfd-headers:
diagnostics.h -> output/build/host-binutils-2.30/include/diagnostics.h

We can add a HOST_ELF2FLT_POST_INSTALL_HOOKS to remove it if necessary.
---
 ...002-Makefile-fix-build-with-Binutils-2.31.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/elf2flt/0002-Makefile-fix-build-with-Binutils-2.31.patch

diff --git a/package/elf2flt/0002-Makefile-fix-build-with-Binutils-2.31.patch b/package/elf2flt/0002-Makefile-fix-build-with-Binutils-2.31.patch
new file mode 100644
index 0000000..8255825
--- /dev/null
+++ b/package/elf2flt/0002-Makefile-fix-build-with-Binutils-2.31.patch
@@ -0,0 +1,34 @@
+From faf1a1646093fbc5ed279bae1c7250c7dfea56f8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 17 Jul 2018 16:36:16 +0200
+Subject: [PATCH] Makefile: fix build with Binutils 2.31
+
+Binutils added diagnostics.h to bfd.h [1], so elf2flt must create a symlink
+for this header.
+
+Fixes:
+https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82284139
+
+[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=95da9854466ada2572b42f5528711a06a2d42db1
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index cfad06c..164e306 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -127,7 +127,7 @@ bfd-headers/.stamp:
+ 	rm -rf bfd-headers
+ 	mkdir bfd-headers
+ 	ln -sf $(BFD_INCLUDE_DIR)/bfd.h bfd-headers/bfd.h
+-	for f in ansidecl filenames hashtab libiberty symcat; do \
++	for f in ansidecl diagnostics filenames hashtab libiberty symcat; do \
+ 		ln -sf $(BINUTILS_INCLUDE_DIR)/$$f.h bfd-headers/$$f.h || exit 1; \
+ 	done
+ 	ln -sf $(BINUTILS_INCLUDE_DIR)/elf bfd-headers/elf
+-- 
+2.7.4
+
-- 
2.7.4
