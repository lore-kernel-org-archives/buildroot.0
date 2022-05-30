Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3F8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3CF3415E6;
	Mon, 30 May 2022 19:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8wJrRUF8mfz; Mon, 30 May 2022 19:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93DB8410C9;
	Mon, 30 May 2022 19:17:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A320A1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 920A141B2D
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9NL1x-G81Zb for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:16:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 886FA41A6E
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BD78D86783; Mon, 30 May 2022 19:05:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 21:15:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3e50b5fe2632a3081fd3f6574a5e9525fa897fdb
X-Git-Newrev: cecb262571a1754c0e88b7b6e6acece13db9c5d6
X-Patchwork-Hint: ignore
Message-Id: <20220530190522.BD78D86783@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/riscv/nommu: add common
 Linux kernel patch for RISCV NOMMU builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cecb262571a1754c0e88b7b6e6acece13db9c5d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add the board/riscv/nommu directory to add a Linux kernel patch used
for all RISC-V NOMMU builds (QEMU and Canaan Kendryte K210 SoC based
boards). The patch is upstream and will be part of the upcoming 5.19
release.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-do-not-stop-relocating-GOT-entries-prema.patch | 110 +++++++++++++++++++++
 board/riscv/nommu/patches/linux/readme.txt         |   3 +
 2 files changed, 113 insertions(+)

diff --git a/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch b/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
new file mode 100644
index 0000000000..e5513b729b
--- /dev/null
+++ b/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
@@ -0,0 +1,110 @@
+From 6045ab5fea4c849153ebeb0acb532da5f29d69c4 Mon Sep 17 00:00:00 2001
+From: Niklas Cassel <niklas.cassel@wdc.com>
+Date: Thu, 14 Apr 2022 11:10:18 +0200
+Subject: binfmt_flat: do not stop relocating GOT entries prematurely on riscv
+
+Upstream commit 6045ab5fea4c849153ebeb0acb532da5f29d69c4.
+
+bFLT binaries are usually created using elf2flt.
+
+The linker script used by elf2flt has defined the .data section like the
+following for the last 19 years:
+
+.data : {
+	_sdata = . ;
+	__data_start = . ;
+	data_start = . ;
+	*(.got.plt)
+	*(.got)
+	FILL(0) ;
+	. = ALIGN(0x20) ;
+	LONG(-1)
+	. = ALIGN(0x20) ;
+	...
+}
+
+It places the .got.plt input section before the .got input section.
+The same is true for the default linker script (ld --verbose) on most
+architectures except x86/x86-64.
+
+The binfmt_flat loader should relocate all GOT entries until it encounters
+a -1 (the LONG(-1) in the linker script).
+
+The problem is that the .got.plt input section starts with a GOTPLT header
+(which has size 16 bytes on elf64-riscv and 8 bytes on elf32-riscv), where
+the first word is set to -1. See the binutils implementation for riscv [1].
+
+This causes the binfmt_flat loader to stop relocating GOT entries
+prematurely and thus causes the application to crash when running.
+
+Fix this by skipping the whole GOTPLT header, since the whole GOTPLT header
+is reserved for the dynamic linker.
+
+The GOTPLT header will only be skipped for bFLT binaries with flag
+FLAT_FLAG_GOTPIC set. This flag is unconditionally set by elf2flt if the
+supplied ELF binary has the symbol _GLOBAL_OFFSET_TABLE_ defined.
+ELF binaries without a .got input section should thus remain unaffected.
+
+Tested on RISC-V Canaan Kendryte K210 and RISC-V QEMU nommu_virt_defconfig.
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c;hb=binutils-2_38#l3275
+
+Cc: <stable@vger.kernel.org>
+Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
+Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
+Link: https://lore.kernel.org/r/20220414091018.896737-1-niklas.cassel@wdc.com
+Fixed-by: kernel test robot <lkp@intel.com>
+Link: https://lore.kernel.org/lkml/202204182333.OIUOotK8-lkp@intel.com
+Signed-off-by: Kees Cook <keescook@chromium.org>
+---
+ fs/binfmt_flat.c | 27 ++++++++++++++++++++++++++-
+ 1 file changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
+index 6268981500112..dca0b6875f9c3 100644
+--- a/fs/binfmt_flat.c
++++ b/fs/binfmt_flat.c
+@@ -440,6 +440,30 @@ static void old_reloc(unsigned long rl)
+ 
+ /****************************************************************************/
+ 
++static inline u32 __user *skip_got_header(u32 __user *rp)
++{
++	if (IS_ENABLED(CONFIG_RISCV)) {
++		/*
++		 * RISC-V has a 16 byte GOT PLT header for elf64-riscv
++		 * and 8 byte GOT PLT header for elf32-riscv.
++		 * Skip the whole GOT PLT header, since it is reserved
++		 * for the dynamic linker (ld.so).
++		 */
++		u32 rp_val0, rp_val1;
++
++		if (get_user(rp_val0, rp))
++			return rp;
++		if (get_user(rp_val1, rp + 1))
++			return rp;
++
++		if (rp_val0 == 0xffffffff && rp_val1 == 0xffffffff)
++			rp += 4;
++		else if (rp_val0 == 0xffffffff)
++			rp += 2;
++	}
++	return rp;
++}
++
+ static int load_flat_file(struct linux_binprm *bprm,
+ 		struct lib_info *libinfo, int id, unsigned long *extra_stack)
+ {
+@@ -789,7 +813,8 @@ static int load_flat_file(struct linux_binprm *bprm,
+ 	 * image.
+ 	 */
+ 	if (flags & FLAT_FLAG_GOTPIC) {
+-		for (rp = (u32 __user *)datapos; ; rp++) {
++		rp = skip_got_header((u32 __user *) datapos);
++		for (; ; rp++) {
+ 			u32 addr, rp_val;
+ 			if (get_user(rp_val, rp))
+ 				return -EFAULT;
+-- 
+cgit 
+
diff --git a/board/riscv/nommu/patches/linux/readme.txt b/board/riscv/nommu/patches/linux/readme.txt
new file mode 100644
index 0000000000..ea754c9920
--- /dev/null
+++ b/board/riscv/nommu/patches/linux/readme.txt
@@ -0,0 +1,3 @@
+RISC-V NOMMU Common Support
+
+This directory provides Linux kernel patches common to all RISC-V NO-MMU builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
