From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Apr 2018 22:05:02 +0300
Subject: [Buildroot] [PATCH] libbsd: fix build for openrisc with uClibc
Message-ID: <399872a6c84372d78d1ed93e337d2e858456610b.1522782302.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d879be30495 (package/libbsd: enable for non-glibc toolchains)
enabled libbsd for openrisc. Unfortunately uClibc does not define the
EM_OPENRISC macro that libbsd expects for ELF e_machine ID. Add patch
making libbsd fallback to the equivalent EM_OR1K macro that uClibc does
provide.

Fixes:
http://autobuild.buildroot.net/results/2f5/2f51eebe5964e8f1be3ecd2032e7d7837bf98b84/

Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0002-Fix-build-for-openrisc-with-uClibc.patch  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/libbsd/0002-Fix-build-for-openrisc-with-uClibc.patch

diff --git a/package/libbsd/0002-Fix-build-for-openrisc-with-uClibc.patch b/package/libbsd/0002-Fix-build-for-openrisc-with-uClibc.patch
new file mode 100644
index 000000000000..1b28df5a8beb
--- /dev/null
+++ b/package/libbsd/0002-Fix-build-for-openrisc-with-uClibc.patch
@@ -0,0 +1,48 @@
+From aa902671bf1e0e808fd994bd6b403d70af7ab6dd Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 3 Apr 2018 20:02:14 +0300
+Subject: [PATCH] Fix build for openrisc with uClibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+uClibc defines EM_OR1K instead of EM_OPENRISC for the OpenRISC ELF
+e_machine ID. Use EM_OR1K when EM_OPENRISC is not defined.
+
+This fixes the following build failure:
+
+In file included from nlist.c:44:0:
+nlist.c: In function ?__elf_is_okay__?:
+local-elf.h:224:23: error: ?EM_OPENRISC? undeclared (first use in this function)
+ #define ELF_TARG_MACH EM_OPENRISC
+                       ^
+nlist.c:77:26: note: in expansion of macro ?ELF_TARG_MACH?
+   if (ehdr->e_machine == ELF_TARG_MACH &&
+                          ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent to libbsd at lists.freedesktop.org
+
+ src/local-elf.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/local-elf.h b/src/local-elf.h
+index 1faf182f87d7..79f7d026f6c9 100644
+--- a/src/local-elf.h
++++ b/src/local-elf.h
+@@ -221,7 +221,11 @@
+ 
+ #elif defined(__or1k__)
+ 
++#if defined(EM_OPENRISC)
+ #define ELF_TARG_MACH	EM_OPENRISC
++#else
++#define ELF_TARG_MACH	EM_OR1K
++#endif
+ #define ELF_TARG_CLASS	ELFCLASS32
+ #define ELF_TARG_DATA	ELFDATA2MSB
+ 
+-- 
+2.16.3
+
-- 
2.16.3
