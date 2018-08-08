From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Aug 2018 16:27:58 +0200
Subject: [Buildroot] [git commit] uclibc: ldso/arc: fix LD_DEBUG segv when
 printing R_ARC_NONE
Message-ID: <20180808142438.00C8B8B518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9c3f93f3f9e416930b3e72c6e22bd7f3f7f1c50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dynamic linker used to segfault on attempt to print info
about R_ARC_NONE reloaction.

The fix is already in upstream master [1],
should be removed on uClibc version bump.

[1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=269a2a2a0f863e1b43dc02f2f4f0f3c50299456e

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/uclibc/0003-ldso-arc-fix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch b/package/uclibc/0003-ldso-arc-fix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch
new file mode 100644
index 0000000000..ad87698f53
--- /dev/null
+++ b/package/uclibc/0003-ldso-arc-fix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch
@@ -0,0 +1,45 @@
+From 269a2a2a0f863e1b43dc02f2f4f0f3c50299456e Mon Sep 17 00:00:00 2001
+From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
+Date: Tue, 26 Jun 2018 18:26:24 -0700
+Subject: [PATCH] ldso/arc: fix LD_DEBUG segv when printing R_ARC_NONE
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ ldso/ldso/arc/elfinterp.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ldso/ldso/arc/elfinterp.c b/ldso/ldso/arc/elfinterp.c
+index 5a02bc234..a30c19bcb 100644
+--- a/ldso/ldso/arc/elfinterp.c
++++ b/ldso/ldso/arc/elfinterp.c
+@@ -64,7 +64,7 @@ _dl_linux_resolver(struct elf_resolve *tpnt, unsigned int plt_pc)
+ 	if (_dl_debug_bindings) {
+ 		_dl_dprintf(_dl_debug_file, "\nresolve function: %s", symname);
+ 		if (_dl_debug_detail)
+-			_dl_dprintf(_dl_debug_file, "\n\tpatched %x ==> %pc @ %pl\n",
++			_dl_dprintf(_dl_debug_file, "\n\tpatched %x ==> %pc @ %p\n",
+ 					*got_addr, new_addr, got_addr);
+ 	}
+ 
+@@ -178,7 +178,7 @@ _dl_do_reloc(struct elf_resolve *tpnt, struct r_scope_elem *scope,
+ 
+ log_entry:
+ #if defined __SUPPORT_LD_DEBUG__
+-	if (_dl_debug_detail)
++	if (_dl_debug_detail && (reloc_type != R_ARC_NONE))
+ 		_dl_dprintf(_dl_debug_file,"\tpatched: %x ==> %x @ %x",
+ 				old_val, *reloc_addr, reloc_addr);
+ #endif
+@@ -214,7 +214,7 @@ _dl_do_lazy_reloc(struct elf_resolve *tpnt, struct r_scope_elem *scope,
+ 	}
+ 
+ #if defined __SUPPORT_LD_DEBUG__
+-	if (_dl_debug_reloc && _dl_debug_detail)
++	if (_dl_debug_reloc && _dl_debug_detail && (reloc_type != R_ARC_NONE))
+ 		_dl_dprintf(_dl_debug_file, "\tpatched: %x ==> %x @ %x\n",
+ 				old_val, *reloc_addr, reloc_addr);
+ #endif
+-- 
+2.16.2
+
