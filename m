From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:14:34 +0200
Subject: [Buildroot] [git commit] pdbg: bump version to latest
Message-ID: <20171007210713.7A0B07FF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe7285cd4e985a82d846302ef6ed8053c4e9a26d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I got this error when attempting to build:

 aclocal: error: couldn't open directory 'm4': No such file or directory

So we now have the post patch hook to ensure the m4 directory is
present.

In addition, the package now sets a variable with the Git SHA1 so that
the binary contains the expected output for --version.

Specific configurations of uClibc cause a build failure in pdbg. This commit
adds a patch to remove the definition of the offending macro (it is unused in
the source).

 In file included from usr/include/stdio.h:71:0,
                  from libpdbg/fake.c:17:
 include/bits/uClibc_stdio.h:149:16: error: expected identifier or ???(??? before ???;??? token
   void *__unused;    /* Placeholder for codeset binding. */

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...bg-Remove-unused-__unused-from-compiler.h.patch | 39 ++++++++++++++++++++++
 package/pdbg/pdbg.hash                             |  2 +-
 package/pdbg/pdbg.mk                               |  9 ++++-
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/package/pdbg/0001-libpdbg-Remove-unused-__unused-from-compiler.h.patch b/package/pdbg/0001-libpdbg-Remove-unused-__unused-from-compiler.h.patch
new file mode 100644
index 0000000..e778f28
--- /dev/null
+++ b/package/pdbg/0001-libpdbg-Remove-unused-__unused-from-compiler.h.patch
@@ -0,0 +1,39 @@
+From 5a85b8c78846b342bdeba37caed03b64b1dd2864 Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Tue, 3 Oct 2017 21:37:46 +1030
+Subject: [PATCH] libpdbg: Remove unused __unused from compiler.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The compiler.h header contains a macro that defines __unused. When
+building against uClibc this collides with uClibc_stdio.h:
+
+In file included from /usr/include/stdio.h:71:0,
+                 from libpdbg/fake.c:17:
+/usr/include/bits/uClibc_stdio.h:149:16: error: expected identifier or ???(??? before ???;??? token
+  void *__unused;    /* Placeholder for codeset binding. */
+                ^
+
+As it is unused in pdbg, remove it.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ libpdbg/compiler.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libpdbg/compiler.h b/libpdbg/compiler.h
+index 35bf16525761..86bd9673ac36 100644
+--- a/libpdbg/compiler.h
++++ b/libpdbg/compiler.h
+@@ -24,7 +24,6 @@
+ /* Macros for various compiler bits and pieces */
+ #define __packed		__attribute__((packed))
+ #define __align(x)		__attribute__((__aligned__(x)))
+-#define __unused		__attribute__((unused))
+ #define __used			__attribute__((used))
+ #define __section(x)		__attribute__((__section__(x)))
+ #define __noreturn		__attribute__((noreturn))
+-- 
+2.14.1
+
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 16bf580..2aec718 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8edabb9ae98ce3b1892b768f2ee5e779a00476b63cdcc6f905e8464a0b7d96a3 pdbg-90a7370a11e727f1482dea6ff2bd6aec20c64805.tar.gz
+sha256 e0b81fc65eb83692c5c07d7ae109882cefebf663444b7ea804d0544451c1a72f pdbg-77158819158d1d7053a737ac090d04fdfbfe9265.tar.gz
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 184de86..1a3a6b7 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,10 +4,17 @@
 #
 ################################################################################
 
-PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
+PDBG_VERSION = 77158819158d1d7053a737ac090d04fdfbfe9265
 PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
 PDBG_AUTORECONF = YES
 
+PDBG_MAKE_OPTS = "GIT_SHA1=\"$(PDBG_VERSION)\""
+
+define PDBG_PATCH_M4
+	mkdir -p $(@D)/m4
+endef
+PDBG_POST_PATCH_HOOKS += PDBG_PATCH_M4
+
 $(eval $(autotools-package))
