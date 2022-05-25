Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28073C433FE
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68F441C17;
	Wed, 25 May 2022 13:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64Y97s1TwBmK; Wed, 25 May 2022 13:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B06441BE4;
	Wed, 25 May 2022 13:35:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2509F1BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D466F6130A
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLVS2eHbTXz9 for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:34:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB64C6130C
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653485679; x=1685021679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=loFjWGW/+jdz1l49Ikwyb3MyuJVTmxf1mFKEiISQrPI=;
 b=RyurAUcRSxnlEJl7ao0GhakBVf8T+cy8arOvhcxIlpzxlk8UHd8lXuC/
 7rpkQHScHlYbX3ModPst3g55mOEG/GNRtLP/udCEQk1EZSZ6XKo5EGICg
 PguTX1i51TyAY2MbFPjRK0iyGZEcmhyG6dN8vc8cTIc98iKgab9KGFx14
 jPxhZ0fWZ76hAem/IdD7VTLXKS4PvOsup+XoVFVmdY56QDt/AzgyMSIpf
 MWtF96oeeVAWgcFTsQs+WIRZEYn0qFx1BXJAr5WBcli54hJNuSVAcWRZ0
 VOlIRJCOULNGkqBy8/SS7Wnz0qXu/fLJ0fm0GC6l7GysranIRNypJSRYm A==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305635092"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 21:27:34 +0800
IronPort-SDR: mtkXUyXTrpp5I07xDkhvmZV9UsW58rc1U6bSNxgOAiFStq7d8DlLH1daNiXl7sDZP/6vQHyhNU
 DIOpZkZtKsbSVqTzD5+LAJgIf5J8BqKdVAUC7uZ/neHg7OrOwon2WIAHCVUExd/siZR8E97yYR
 qHhNvQLgXllU2WiNtY1+S4bbyzVNkqOiritr/kD23uMWJE1bkKZspsv8BVXviRcKAKU3sMgE5Q
 KVMpRBkicXL9ESZFXgJ7qfgWJU7OuywCo/24vtpQODiNcGePGgT06YeglFir65Ys6TNSqYW+U6
 H5SxboSXvx4R0acZwbrfx7qJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 05:51:30 -0700
IronPort-SDR: +durAf/PFS363FnDG8s3QbG+moAlla9rS6KMxBw6lVREreo2Y/vu8vHfg2LhrUvVTHbyAPB/ZR
 Zq7iloI92mpYvJKszyXuSjhTqY61PERXXRuLXML6Wwf+QgG6dI3Mcz7Q7OG3I/Z2yr2LxwgcMG
 8pzsTAhY/Gcpm3Zk6/Oj0J+36TFiWQlCnqEtExVHDNsvlAEwYDp6uXb9vM+3pfiu/3JKzH3QlI
 LKtWhpoDqNxfM2CPugoNg/7aH5FxI/rEp9VKxGq9aROAFCYhoDCSguifn9rYSGCnHoxP8J0/pu
 cuU=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.54])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 May 2022 06:27:34 -0700
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 May 2022 22:27:21 +0900
Message-Id: <20220525132729.2349105-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525132729.2349105-1-damien.lemoal@wdc.com>
References: <20220525132729.2349105-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/11] board: Add common Linux kernel support
 for RISCV NOMMU builds
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Add the board/riscv/nommu directory to add Linux kernel patches used for
all RISC-V NOMMU builds (QEMU and Canaan Kendryte K210 SoC based
boards).

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 ...ot-stop-relocating-GOT-entries-prema.patch | 110 ++++++++++++++++++
 board/riscv/nommu/readme.txt                  |   3 +
 2 files changed, 113 insertions(+)
 create mode 100644 board/riscv/nommu/kernel_patches/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
 create mode 100644 board/riscv/nommu/readme.txt

diff --git a/board/riscv/nommu/kernel_patches/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch b/board/riscv/nommu/kernel_patches/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
new file mode 100644
index 0000000000..e5513b729b
--- /dev/null
+++ b/board/riscv/nommu/kernel_patches/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
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
diff --git a/board/riscv/nommu/readme.txt b/board/riscv/nommu/readme.txt
new file mode 100644
index 0000000000..ea754c9920
--- /dev/null
+++ b/board/riscv/nommu/readme.txt
@@ -0,0 +1,3 @@
+RISC-V NOMMU Common Support
+
+This directory provides Linux kernel patches common to all RISC-V NO-MMU builds.
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
