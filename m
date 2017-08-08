From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:47:55 +0200
Subject: [Buildroot] [git commit branch/next] uclibc: fix microblaze runtime
	error
Message-ID: <20170809225749.5D2617FF5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62782633558acf93658f9c0debd02e87f581d1fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With binutils 2.29 a runtime error is seen:
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100

Backport upstream patch to fix the issue.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/uclibc/0002-microblaze-handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch b/package/uclibc/0002-microblaze-handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch
new file mode 100644
index 0000000..9886efd
--- /dev/null
+++ b/package/uclibc/0002-microblaze-handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch
@@ -0,0 +1,42 @@
+From 9db18d93811153fc9a70c9844fadc6fdf7cbbb64 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Sun, 6 Aug 2017 21:15:50 +0200
+Subject: [PATCH] microblaze: handle R_MICROBLAZE_NONE for ld.so bootstrap
+
+Latest binutils 2.29 release emits a R_MICROBLAZE_NONE
+relocation, which breaks shared library loader bootstrap
+relocation.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ ldso/ldso/microblaze/dl-startup.h | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/ldso/ldso/microblaze/dl-startup.h b/ldso/ldso/microblaze/dl-startup.h
+index 720c53a..16d5762 100644
+--- a/ldso/ldso/microblaze/dl-startup.h
++++ b/ldso/ldso/microblaze/dl-startup.h
+@@ -82,18 +82,15 @@ static __always_inline
+ void PERFORM_BOOTSTRAP_RELOC(ELF_RELOC *rpnt, unsigned long *reloc_addr,
+ 	unsigned long symbol_addr, unsigned long load_addr, attribute_unused Elf32_Sym *symtab)
+ {
+-
+ 	switch (ELF_R_TYPE(rpnt->r_info))
+ 	{
+ 		case R_MICROBLAZE_REL:
+-
+ 			*reloc_addr = load_addr + rpnt->r_addend;
+ 			break;
+-
++		case R_MICROBLAZE_NONE:
++			break;
+ 		default:
+ 			_dl_exit(1);
+ 			break;
+-
+ 	}
+-
+ }
+-- 
+2.1.4
+
