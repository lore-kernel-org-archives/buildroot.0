Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968D1C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 12:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F7680AB6;
	Sun, 19 Jan 2025 12:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afSceT4WhVs9; Sun, 19 Jan 2025 12:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C5BE809DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C5BE809DD;
	Sun, 19 Jan 2025 12:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EFCED7
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97C1240B00
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK-XMiTvAtp6 for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 12:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E79D40B33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E79D40B33
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:22:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4186C85ECF; Sun, 19 Jan 2025 12:22:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Jan 2025 11:36:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6cc52627d866c5a6277ab78970a491e3b89de40
X-Git-Newrev: a311245ff7cf432de861ff095941ef53fc16460d
X-Patchwork-Hint: ignore
Message-Id: <20250119122213.4186C85ECF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: add multiple patches fixing
 build issues with GCC >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3137932819057348506=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3137932819057348506==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a311245ff7cf432de861ff095941ef53fc16460d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No autobuilder failures reported, but it fixes build issues that can
be reproduced with:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_EFI=y

First patch is backported from upstream. Last 3 patches are not from
upstream, and they have not been submitted as upstream is basically
dead (last release 10 years ago, last commit 5 years ago).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/syslinux/0021-load_linux-correct-a-type.patch | 34 +++++++++++++++
 ...es-pxechn.c-use-proper-type-in-struct-dat.patch | 46 +++++++++++++++++++++
 ...-chain.h-use-proper-type-in-struct-data_a.patch | 42 +++++++++++++++++++
 ...in.c-fix-incorrect-type-of-load_error_buf.patch | 48 ++++++++++++++++++++++
 4 files changed, 170 insertions(+)

diff --git a/boot/syslinux/0021-load_linux-correct-a-type.patch b/boot/syslinux/0021-load_linux-correct-a-type.patch
new file mode 100644
index 0000000000..ff4e5a2d29
--- /dev/null
+++ b/boot/syslinux/0021-load_linux-correct-a-type.patch
@@ -0,0 +1,34 @@
+From 7f1b68d561dfe615d5cd73d2f4561ac032832802 Mon Sep 17 00:00:00 2001
+From: Scot Doyle <lkml14@scotdoyle.com>
+Date: Sat, 7 Feb 2015 13:52:05 -0500
+Subject: [PATCH] load_linux: correct a type
+
+Correct base's type to match its initialization from prot_mode_base and
+passage to syslinux_memmap_find(). Tested with extlinux.
+
+Signed-off-by: Scot Doyle <lkml14@scotdoyle.com>
+Signed-off-by: Gene Cumm <gene.cumm@gmail.com>
+Upstream: https://github.com/geneC/syslinux/commit/83aad4f69065509ba5b1c080edccfed316a4cff0
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ com32/lib/syslinux/load_linux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/com32/lib/syslinux/load_linux.c b/com32/lib/syslinux/load_linux.c
+index 06ae2a97..ac737293 100644
+--- a/com32/lib/syslinux/load_linux.c
++++ b/com32/lib/syslinux/load_linux.c
+@@ -155,8 +155,8 @@ int bios_boot_linux(void *kernel_buf, size_t kernel_size,
+ 		    char *cmdline)
+ {
+     struct linux_header hdr, *whdr;
+-    size_t real_mode_size, prot_mode_size, base;
+-    addr_t real_mode_base, prot_mode_base, prot_mode_max;
++    size_t real_mode_size, prot_mode_size;
++    addr_t real_mode_base, prot_mode_base, prot_mode_max, base;
+     addr_t irf_size;
+     size_t cmdline_size, cmdline_offset;
+     struct setup_data *sdp;
+-- 
+2.47.1
+
diff --git a/boot/syslinux/0022-com32-modules-pxechn.c-use-proper-type-in-struct-dat.patch b/boot/syslinux/0022-com32-modules-pxechn.c-use-proper-type-in-struct-dat.patch
new file mode 100644
index 0000000000..65ad65eff6
--- /dev/null
+++ b/boot/syslinux/0022-com32-modules-pxechn.c-use-proper-type-in-struct-dat.patch
@@ -0,0 +1,46 @@
+From b9514337ecfc0efaa04a926713188d87a88bb59e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 18 Jan 2025 16:03:34 +0100
+Subject: [PATCH] com32/modules/pxechn.c: use proper type in struct data_area
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use a size_t for the size field, so that we meet the expectations of
+the loadfile() function.
+
+Fixes a build issue with GCC >= 14:
+
+com32/modules/pxechn.c:985:38: error: passing argument 3 of ‘loadfile’ from incompatible pointer type [-Wincompatible-pointer-types]
+  985 |     if (loadfile(pxe.fn, &file.data, &file.size)) {
+      |                                      ^~~~~~~~~~
+      |                                      |
+      |                                      addr_t * {aka unsigned int *}
+
+In file included from com32/modules/pxechn.c:33:
+com32/include/syslinux/loadfile.h:11:37: note: expected ‘size_t *’ {aka ‘long unsigned int *’} but argument is of type ‘addr_t *’ {aka ‘unsigned int *’}
+   11 | int loadfile(const char *, void **, size_t *);
+      |                                     ^~~~~~~~
+
+Upstream: N/A, dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ com32/modules/pxechn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/com32/modules/pxechn.c b/com32/modules/pxechn.c
+index e4e21e88..15f008a3 100644
+--- a/com32/modules/pxechn.c
++++ b/com32/modules/pxechn.c
+@@ -130,7 +130,7 @@ struct pxelinux_opt {
+ struct data_area {
+     void *data;
+     addr_t base;
+-    addr_t size;
++    size_t size;
+ };
+ 
+ /* From chain.c */
+-- 
+2.47.1
+
diff --git a/boot/syslinux/0023-com32-chain-chain.h-use-proper-type-in-struct-data_a.patch b/boot/syslinux/0023-com32-chain-chain.h-use-proper-type-in-struct-data_a.patch
new file mode 100644
index 0000000000..d4b62eb234
--- /dev/null
+++ b/boot/syslinux/0023-com32-chain-chain.h-use-proper-type-in-struct-data_a.patch
@@ -0,0 +1,42 @@
+From 57dddf8d6d1c48aa78b9cdfb2b474aa89c3ae7c7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 18 Jan 2025 16:11:36 +0100
+Subject: [PATCH] com32/chain/chain.h: use proper type in struct data_area
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build issue with GCC >= 14:
+
+com32/chain/chain.c:517:44: error: passing argument 3 of ‘loadfile’ from incompatible pointer type [-Wincompatible-pointer-types]
+  517 |         if (loadfile(opt.file, &fdat.data, &fdat.size)) {
+      |                                            ^~~~~~~~~~
+      |                                            |
+      |                                            addr_t * {aka unsigned int *}
+In file included from com32/chain/chain.c:32:
+com32/include/syslinux/loadfile.h:11:37: note: expected ‘size_t *’ {aka ‘long unsigned int *’} but argument is of type ‘addr_t *’ {aka ‘unsigned int *’}
+   11 | int loadfile(const char *, void **, size_t *);
+      |                                     ^~~~~~~~
+
+Upstream: N/A, dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ com32/chain/chain.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/com32/chain/chain.h b/com32/chain/chain.h
+index fb5914b1..dcf43844 100644
+--- a/com32/chain/chain.h
++++ b/com32/chain/chain.h
+@@ -21,7 +21,7 @@
+ struct data_area {
+     void *data;
+     addr_t base;
+-    addr_t size;
++    size_t size;
+ };
+ 
+ #endif
+-- 
+2.47.1
+
diff --git a/boot/syslinux/0024-efi-main.c-fix-incorrect-type-of-load_error_buf.patch b/boot/syslinux/0024-efi-main.c-fix-incorrect-type-of-load_error_buf.patch
new file mode 100644
index 0000000000..9f61745a61
--- /dev/null
+++ b/boot/syslinux/0024-efi-main.c-fix-incorrect-type-of-load_error_buf.patch
@@ -0,0 +1,48 @@
+From cbc8a8e25c3548771de5294f5a1eaef6bfe9b5da Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 18 Jan 2025 17:03:16 +0100
+Subject: [PATCH] efi/main.c: fix incorrect type of load_error_buf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+load_error_buf is used as argument of setjmp()/longjmp(), so it should
+be a "jmp_buf", not a "jmp_buf *". According to the setjmp/longjmp man
+page:
+
+       int setjmp(jmp_buf env);
+       int sigsetjmp(sigjmp_buf env, int savesigs);
+
+Fixes build issue with GCC >= 14:
+
+efi/main.c:1329:21: error: passing argument 1 of ‘setjmp’ from incompatible pointer type [-Wincompatible-pointer-types]
+ 1329 |         if (!setjmp(load_error_buf))
+      |                     ^~~~~~~~~~~~~~
+      |                     |
+      |                     struct <anonymous> (*)[1]
+x86_64-buildroot-linux-gnu/sysroot/usr/include/efi/efisetjmp.h:7:29: note: expected ‘struct <anonymous> *’ but argument is of type ‘struct <anonymous> (*)[1]’
+    7 | extern UINTN setjmp(jmp_buf env) __attribute__((returns_twice));
+      |                     ~~~~~~~~^~~
+
+Upstream: N/A dead
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ efi/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/efi/main.c b/efi/main.c
+index 7dc7bca7..045dae56 100644
+--- a/efi/main.c
++++ b/efi/main.c
+@@ -30,7 +30,7 @@ uint32_t timer_irq;
+ __export uint8_t KbdMap[256];
+ char aux_seg[256];
+ 
+-static jmp_buf *load_error_buf;
++static jmp_buf load_error_buf;
+ 
+ static inline EFI_STATUS
+ efi_close_protocol(EFI_HANDLE handle, EFI_GUID *guid, EFI_HANDLE agent,
+-- 
+2.47.1
+

--===============3137932819057348506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3137932819057348506==--
