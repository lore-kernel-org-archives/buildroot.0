From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon, 18 Mar 2019 09:59:33 +0800
Subject: [Buildroot] [PATCH 1/1] package/gcc: Initialize st in elf_is_symlink
Message-ID: <20190318015933.3478-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Fixes:
../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function ?elf_is_symlink?:
../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
   return S_ISLNK (st.st_mode);
                     ^

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...race-Initialize-st-in-elf_is_symlink.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gcc/8.3.0/0001-libbacktrace-Initialize-st-in-elf_is_symlink.patch

diff --git a/package/gcc/8.3.0/0001-libbacktrace-Initialize-st-in-elf_is_symlink.patch b/package/gcc/8.3.0/0001-libbacktrace-Initialize-st-in-elf_is_symlink.patch
new file mode 100644
index 0000000000..22a6c38209
--- /dev/null
+++ b/package/gcc/8.3.0/0001-libbacktrace-Initialize-st-in-elf_is_symlink.patch
@@ -0,0 +1,32 @@
+From a6c384f38421ed62d5acac30a90dc92de5cf4055 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 18 Mar 2019 09:17:39 +0800
+Subject: [PATCH] [libbacktrace] Initialize st in elf_is_symlink
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes error: ?st.st_mode? may be used uninitialized in this function
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status: https://patchwork.ozlabs.org/patch/1057631/]
+---
+ libbacktrace/elf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libbacktrace/elf.c b/libbacktrace/elf.c
+index f4863f0bea5..6cc2a7dec22 100644
+--- a/libbacktrace/elf.c
++++ b/libbacktrace/elf.c
+@@ -765,7 +765,7 @@ elf_syminfo (struct backtrace_state *state, uintptr_t addr,
+ static int
+ elf_is_symlink (const char *filename)
+ {
+-  struct stat st;
++  struct stat st={0};
+ 
+   if (lstat (filename, &st) < 0)
+     return 0;
+-- 
+2.17.1
+
-- 
2.17.1
