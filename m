Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2213C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 03:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6311640C05;
	Mon, 30 May 2022 03:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GdcqLXL0-Lj; Mon, 30 May 2022 03:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A47F40C01;
	Mon, 30 May 2022 03:39:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC5551BF834
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD8834000B
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NdVsfw-DofY for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 03:38:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC27640C01
 for <buildroot@buildroot.org>; Mon, 30 May 2022 03:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653881924; x=1685417924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IozSSI9cYVG18v4LV087P5xscR+wnh6MD4XGiy36VZc=;
 b=dmQraa1xN93UnWOdPX1Cmj4dRFplU14xUw/0tSQA2W/o+K89FkHjOudm
 v1WD/0Hlwj91M6seTgLI+Za6rOjz7RofmgJ0lAkSvS2t59c4KVfiSihz4
 vyE4wJsk6KQfrMJpJJIGtYIo/hYOjoGw351qHAt22QOqUGfbr4MygNJo3
 MLHdxk2GBcJ+npXyIBaIsdQyCyJf6KNcv80gxeUOqcdGg+N4iWFJjOlpW
 oEBdKxdckfX3ogt0NbpNtJROg+EOJDX7LVheie3B2gkXPS3954+Gz49He
 HxfskNAzeE9PldKSDxktDE29JqHiALtlOo2z14so9TLlPHddpoBoX4HE6 Q==;
X-IronPort-AV: E=Sophos;i="5.91,261,1647273600"; d="scan'208";a="313781119"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2022 11:38:44 +0800
IronPort-SDR: eXwOEk4CTTF8JuBYjyvNgpN2EBaz68VEg+rJUQ1np7lV+G2p+06fj5lawLzDV6cSCcO2ZNjU2L
 5sxBV/2HUEpsQHxKwB2UUebCpz2Yl8LQ2IRf5yL6NvnZS4iMf/ZtRa8KiTXc/3Es5tvGQeriNI
 CHgVY0G60OcA/orIAJthp3M/fhXWsLnitvzZoTtynsJsspx6c3MxpHbpx3IuyYDX7Le+boGcm/
 WBoF9lEaDYUXdTkSkh6w54eC6jSANhhu+rQfNzLxlbNLh5rkvS1yf9Q5UfKhPz90qPvkBQ2Pcw
 YjCzHo1gfnGYv+MPLtudPPV4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 19:58:10 -0700
IronPort-SDR: CcZwF0nL6ZPu2kV3X77DgDy6eMFQNiG4M5EBApwGvs1XZbet+uqZjI4pQNcOppTGtrDSnr1HLJ
 Io1nij1NTk7bKuc0w9iPA6bs/7SEgvLfvhvv/vwlqYHwLf5lZsL7G3FmX3ClH5JwFl8Omfxnbq
 kUbPPZx0PIgorAQvYL7z9qUFrSGTLhirQBGfyh2uAS8EemOygvp2GzTWB271zzk15/Tte1qamo
 cO4wUhOo9tcJAQwOuXzChqRV1OTWHgOMQWPc0Rm5EOsoPFT79VrwjOvNGD3mO+xCZYK1a27/gY
 /To=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 20:38:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LBLjc0dJzz1SHwl
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:38:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653881923; x=1656473924; bh=IozSSI9cYVG18v4LV0
 87P5xscR+wnh6MD4XGiy36VZc=; b=aMMLgrDhhB/zuy4B60x+YvBsGAwHzi03+c
 9OrVEPC/yqPwlOOGOfjrazPjQHUJt3dhyGNJqUNmDFrzK1cYIw6hG7jNzYCSDnQ/
 /74ii0LBWz9iTLPFQL1Ea3rJhB0YxGn+6F830Zxm0kVNWY5x5NfScg1OVIKcOypi
 D197T1uqPdoRVUa9eiSda/3Tm0pFTdsEm9JpLh0cDph4enldUKMQ6/UNOB/PH8Ts
 +LMh8d+Ld7DJ6PeLVkJSW/6k4xe23Cw0WU/yhbo9IkZ0x6D+bKLuIBAHkbmCvhYI
 4yVxnoCTuzLHsS62vm6Q/Qv4qt+rfwgRaU3UoSy/7FiIT006GjHg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QQwZXkHEy61T for <buildroot@buildroot.org>;
 Sun, 29 May 2022 20:38:43 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LBLjY5dpDz1Rvlc;
 Sun, 29 May 2022 20:38:41 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 May 2022 12:38:28 +0900
Message-Id: <20220530033836.474926-4-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 03/11] board: Add common Linux kernel support
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
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
