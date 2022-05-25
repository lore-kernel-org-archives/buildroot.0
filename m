Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3219CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C24FC84284;
	Wed, 25 May 2022 13:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5hwRcGe67IA; Wed, 25 May 2022 13:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B8884285;
	Wed, 25 May 2022 13:35:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A06A11BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BF5961307
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vf5YAxUwEaFC for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:34:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77C046130A
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653485678; x=1685021678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5dC/QMXp/S3DwDTAj6qUj7IyWvO9T9fS1ELM+1xoU7g=;
 b=ZB+uHX9exqwLfI9KazrYx1LWHqrS9PWI+kb0/mRQZt+SfuIGxaPu7qiP
 qn8911Ua/kV+Fb5FfUruyiEClnd95IaQ5Bkp9kVWrrGEb3EXmIE9N/cvW
 /jAyqq/xdeobaMxC8mAbhOiSQmp2l3fs0Yi0rUbPdzSJH+bBmqMBb1PiD
 XbBdfiy0HdWDf08I5Db5uvgZmP5YvEGNZiU9VUhBfJjpoI6T5cW9n3yz4
 JM4l1OEgXI3ovBYxsFwjH/TfR1YR7vEkZdTVQsEQOsGzfz1yuQSNMvCDk
 GhPo+uKeaG0+/JCi1tZr07wWGvBrHfUAjz+cCyCDUKOKGS+vUjMkegWnH g==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305635087"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 21:27:33 +0800
IronPort-SDR: w9SDctECc+kA1kKuG15JpboGyiPEUBZ5SQ5jFSFJDGCGAxhTmRW24inv4ofSoa+yjZqkZBKrUB
 /rib6wVjjYXFH+uR8+qmMzMSbE6XNIt0GCRTEp0aYlr2E1H6ZO1ktMJadkK76tg3gUhM7GZRwa
 8a9n1RcJE4Ptae+/lV90/hDj1RHEf+inCKR5fjb0Cyf/DlvJDT3TzV5funHuS9OUmUvGal0Hth
 dFquZhyknpWfxXtDzpKRZAMxQDQ9KwfyBS1xaGNvdttrgZZEZB0dmO/r4hkEwe/jmDWQhBOB6W
 fcA+Ti6DCEURWt/0sxJB5arM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 05:51:29 -0700
IronPort-SDR: vCFsZeScahQf5iWE2jlS0brCRnrIggOsbUxOXuuM459EbsrCoi4FCcGWYCeoJxlCWF8xQCdCU8
 6XsA2UdV6ubMWT0VCl9u74FuCiLepXBxcEdyVq3Ny6h8gp27uCNJjFukQ3fOMVxP/pGSjoVgmP
 HHwBo/XjS2i15GJYsOutNJmQvcqCa95s61ATL13GEdZ/35/4AIcXOU/YK/bUAqcpOenKKGzwXu
 t/XBcDsyPXAqM0C1YeykJmwc8epJ+7ydmZ5yYagm2bklllEf+m0NOBo1xNcKxiKLTlGpcdIxZK
 q1w=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.54])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 May 2022 06:27:33 -0700
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 May 2022 22:27:20 +0900
Message-Id: <20220525132729.2349105-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525132729.2349105-1-damien.lemoal@wdc.com>
References: <20220525132729.2349105-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/11] package: elf2flt: Update RISC-V 64-bits
 support
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

Remove the old elf2flt 0002-elf2flt-add-riscv-64-bits-support.patch
patch file for riscv64 architecture and replace it with 3 patches:

(1) The first patch fixes the data section alignment
(2) The second patch fixes a bug with the handling of the eh_frame
    section causing text and data section overlap problems.
(3) The third patch adds a simpler riscv64 flat bin relocation support.

These 3 patches are submitted to the upstream elf2flt project as pull
request #22:

https://github.com/uclinux-dev/elf2flt/pull/22

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 ...tate-32-byte-alignment-for-.data-sec.patch | 81 +++++++++++++++++++
 ...f2flt-fix-.eh_frame-section-handling.patch | 73 +++++++++++++++++
 ...4-elf2flt-add-riscv-64-bits-support.patch} | 80 +++++++-----------
 3 files changed, 181 insertions(+), 53 deletions(-)
 create mode 100644 package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
 create mode 100644 package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
 rename package/elf2flt/{0002-elf2flt-add-riscv-64-bits-support.patch => 0004-elf2flt-add-riscv-64-bits-support.patch} (52%)

diff --git a/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch b/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
new file mode 100644
index 0000000000..015b3ab988
--- /dev/null
+++ b/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
@@ -0,0 +1,81 @@
+From 85ba5664eb368eb1cbd2c30b7cd574acd75edd4c Mon Sep 17 00:00:00 2001
+From: Niklas Cassel <niklas.cassel@wdc.com>
+Date: Mon, 4 Apr 2022 15:30:24 +0200
+Subject: [PATCH 1/3] elf2flt.ld: reinstate 32 byte alignment for .data section
+
+Commit 8a3e74446fe7 ("allow to build arm flat binaries") moved the
+following commands:
+	. = ALIGN(0x20) ;
+	@SYMBOL_PREFIX@_etext = . ;
+from the .text section to the top level in the SECTIONS node.
+
+The .text output section is being directed to a memory region using the
+"> flatmem :text" output section attribute. Commands in the top level in
+the SECTIONS node are not.
+
+This means that the ALIGN() command is no longer being appended to the
+flatmem memory region, it will simply update the Location Counter.
+
+The heuristic for placing an output section is described here:
+https://sourceware.org/binutils/docs-2.38/ld.html#Output-Section-Address
+
+"If an output memory region is set for the section then it is added to this
+region and its address will be the next free address in that region."
+
+Since the .data section is being directed to the same memory region as the
+.text section, this means that the Location Counter is not used when
+assigning an address to the .data output section, it will simply use the
+next free address.
+
+No longer directing these commands to the flatmem memory region means that
+the .data output section is no longer aligned to a 32 byte boundary.
+
+Before commit 8a3e74446fe7 ("allow to build arm flat binaries"):
+$ readelf -S busybox_unstripped.gdb | grep data
+  [ 3] .data             PROGBITS         0000000000035ac0  00036ac0
+$ readelf -s busybox_unstripped.gdb | grep _etext
+ 19286: 0000000000035ac0     0 NOTYPE  GLOBAL DEFAULT    1 _etext
+
+After commit 8a3e74446fe7 ("allow to build arm flat binaries"):
+$ readelf -S busybox_unstripped.gdb | grep data
+  [ 3] .data             PROGBITS         0000000000035ab0  00036ab0
+$ readelf -s busybox_unstripped.gdb | grep _etext
+ 19287: 0000000000035ac0     0 NOTYPE  GLOBAL DEFAULT    3 _etext
+
+The .data output section has to be aligned to a 32 byte boundary, see the
+FLAT_DATA_ALIGN 0x20 macro and its usage in fs/binfmt_flat.c:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/binfmt_flat.c?h=v5.17#n59
+
+Readd an explicit ALIGN attribute on the .data section itself, since the
+linker will obey this attribute regardless if being directed to a memory
+region or not. Also remove the ALIGN() command before the .data section,
+since this misleads the reader to think that the Location Counter is used
+when assigning an address to the .data section, when it actually is not.
+
+Fixes: 8a3e74446fe7 ("allow to build arm flat binaries")
+Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
+---
+ elf2flt.ld.in | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/elf2flt.ld.in b/elf2flt.ld.in
+index 0df999d..e5aea14 100644
+--- a/elf2flt.ld.in
++++ b/elf2flt.ld.in
+@@ -94,12 +94,9 @@ W_RODAT:	*(.gnu.linkonce.r*)
+ 		*(.ARM.exidx* .gnu.linkonce.armexidx.*)
+ 	} > flatmem
+ 	@SYMBOL_PREFIX@__exidx_end = .;
+-
+-	. = ALIGN(0x20) ;
+ 	@SYMBOL_PREFIX@_etext = . ;
+ 
+-	.data : {
+-		. = ALIGN(0x4) ;
++	.data ALIGN(0x20): {
+ 		@SYMBOL_PREFIX@_sdata = . ;
+ 		@SYMBOL_PREFIX@__data_start = . ;
+ 		@SYMBOL_PREFIX@data_start = . ;
+-- 
+2.35.1
+
diff --git a/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch b/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
new file mode 100644
index 0000000000..e690dc3484
--- /dev/null
+++ b/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
@@ -0,0 +1,73 @@
+From 8b7fdb1dedfb8a6e858b46e5af33029fe0462ab8 Mon Sep 17 00:00:00 2001
+From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
+Date: Tue, 10 May 2022 23:14:36 +0900
+Subject: [PATCH 2/3] elf2flt: fix .eh_frame section handling
+
+elf2flt.ld linker script positions the .eh_frame section in an output
+section after the .text and .data output sections.
+
+However, when elf2flt.c is supplied the ELF linked using the elf2flt.ld
+linker script, it only looks at the flags for each input section, and
+then puts it in either a bFLT text, data or bss output section.
+
+Commit ba379d08bb7 ("elf2flt: fix for segfault on some ARM ELFs")
+modified the section scanning loop of elf2flt main() function to put
+read-only relocation data sections in the bFLT text output section so
+that the .ARM.exidx section is placed in the .text flat output section.
+Previously a read-only relocation data section would be put in the data
+output section.
+
+On ARM, the .eh_frame section does not have the SEC_RELOC flag set, so
+it will still end up in the data output section. However, on
+architectures that generates the .eh_frame section with the SEC_RELOC
+flag set, this section will now be placed in the text output section.
+
+The logic in elf2flt will handle all sections in order, and since the
+input order is .text, .data, and .eh_frame, putting .eh_frame in text
+output section does not work, since elf2flt.c has already put the .data
+input section in the bFLT data output section. This leads to the
+following print (example for riscv64 architecture):
+
+buildroot/output/host/riscv64-buildroot-linux-uclibc/bin/elf2flt:
+ERROR: text=0x3bab8 overlaps data=0x33f60 ?
+
+The way that elf2flt is written, we cannot append to the text output
+section after an input section has been added to the data output
+section. It might be possible to change this, but that would require
+moving all the code the was already placed in the data output section.
+
+Instead, let's allow putting a read-only relocation data section in the
+text output section (so that .ARM.exidx will still be placed correctly),
+but only if there has not yet been anything placed in the data output
+section.
+
+That way .ARM.exidx will still be placed correctly, and .eh_frame will
+be placed correctly in the .data output section, regardless if it has
+flag SEC_RELOC set or not.
+
+Fixes: ba379d08bb7 ("elf2flt: fix for segfault on some ARM ELFs")
+Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
+Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
+---
+ elf2flt.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 7ac0617..da25e93 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -1877,8 +1877,9 @@ int main(int argc, char *argv[])
+     bfd_vma sec_vma;
+ 
+     if ((s->flags & SEC_CODE) ||
+-       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-                    (SEC_DATA | SEC_READONLY | SEC_RELOC))) {
++        (((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
++                     (SEC_DATA | SEC_READONLY | SEC_RELOC)) &&
++          !data_len)) {
+       vma = &text_vma;
+       len = &text_len;
+     } else if (s->flags & SEC_DATA) {
+-- 
+2.35.1
+
diff --git a/package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
similarity index 52%
rename from package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch
rename to package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
index c530bc020d..15c191c83d 100644
--- a/package/elf2flt/0002-elf2flt-add-riscv-64-bits-support.patch
+++ b/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
@@ -1,4 +1,4 @@
-From 3879965dfda08a24e7d44ed76bbcc2f4a41df1fa Mon Sep 17 00:00:00 2001
+From 3f1f323feb5cf25d8c80861991d0360784f4d2e6 Mon Sep 17 00:00:00 2001
 From: Damien Le Moal <damien.lemoal@wdc.com>
 Date: Wed, 9 Sep 2020 17:31:33 +0900
 Subject: [PATCH] elf2flt: add riscv 64-bits support
@@ -6,32 +6,28 @@ Subject: [PATCH] elf2flt: add riscv 64-bits support
 Add support for riscv 64bits ISA by defining the relocation types
 R_RISCV_32_PCREL, R_RISCV_ADD32, R_RISCV_SUB32, R_RISCV_32 and
 R_RISCV_64. riscv64 support also needs the __global_pointer$ symbol to
-be defined right after the relocation tables in the data section.
-Furthermore, the .got and .got.plt sections must be reversed. These 2
-requirements are handled with runtime modifications of the default
-linker script using the append_sed() function.
-(1) For the .got.plt and .got sections order swap, append_sed() is used
-to rename "(.got.plt)" to "(.got.tmp)" and to rename "(.got)" to
-"(.got.plt)". A last call finalize the name swap by replacing
-"(.got.tmp)" with "(.got)"
-(2) For the global pointer synbol, a definition line starting with
-"RISCV_GP" is added. The "RISCV_GP" string is removed if the target CPU
-type is riscv64. The definition line is dropped for other CPU types.
+be defined right after the relocation tables in the data section. To
+define this symbol, the "RISCV_GP" line prefix is added. The "RISCV_GP"
+string is removed if the target CPU type is riscv64 and the definition
+line is dropped for other CPU types.
 
-With these changes, buildroot/busybox builds and run on NOMMU
-systems with kernel 5.13. Tested on Canaan Kendryte K210 boards.
+With these changes, buildroot and busybox build and run on riscv NOMMU
+systems with Linux kernel including patch 6045ab5fea4c
+("binfmt_flat: do not stop relocating GOT entries prematurely on riscv")
+fixing the binfmt_flat loader. Tested on QEMU and Canaan Kendryte K210
+boards.
 
 This patch is based on earlier work by Christoph Hellwig <hch@lst.de>.
 
 Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
 ---
- elf2flt.c     | 23 +++++++++++++++++++++++
+ elf2flt.c     | 16 ++++++++++++++++
  elf2flt.ld.in |  1 +
- ld-elf2flt.c  | 16 ++++++++++++++++
- 3 files changed, 40 insertions(+)
+ ld-elf2flt.c  |  8 ++++++++
+ 3 files changed, 25 insertions(+)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index ea6b5a1..7100c20 100644
+index da25e93..a03ea3a 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
 @@ -81,6 +81,8 @@ const char *elf2flt_progname;
@@ -52,14 +48,16 @@ index ea6b5a1..7100c20 100644
  #else
  #error "Don't know how to support your CPU architecture??"
  #endif
-@@ -821,6 +825,16 @@ output_relocs (
+@@ -812,6 +816,18 @@ output_relocs (
  					goto good_32bit_resolved_reloc;
  				default:
  					goto bad_resolved_reloc;
 +#elif defined(TARGET_riscv64)
 +				case R_RISCV_32_PCREL:
 +				case R_RISCV_ADD32:
++				case R_RISCV_ADD64:
 +				case R_RISCV_SUB32:
++				case R_RISCV_SUB64:
 +					continue;
 +				case R_RISCV_32:
 +				case R_RISCV_64:
@@ -69,27 +67,11 @@ index ea6b5a1..7100c20 100644
  #else
  				default:
  					/* The default is to assume that the
-@@ -1841,6 +1855,15 @@ int main(int argc, char *argv[])
-   if (!load_to_ram && !pfile)
-     load_to_ram = 1;
- 
-+#if defined(TARGET_riscv64)
-+  /*
-+   * riscv only supports loading text and data contiguously.
-+   * So fail if load_to_ram is false.
-+   */
-+  if (!load_to_ram)
-+    fatal("Loading to RAM ('-r' option) is required");
-+#endif
-+
-   fname = argv[argc-1];
- 
-   if (pfile) {
 diff --git a/elf2flt.ld.in b/elf2flt.ld.in
-index 0df999d..f1eed1f 100644
+index e5aea14..950849e 100644
 --- a/elf2flt.ld.in
 +++ b/elf2flt.ld.in
-@@ -109,6 +109,7 @@ W_RODAT:	*(.gnu.linkonce.r*)
+@@ -106,6 +106,7 @@ W_RODAT:	*(.gnu.linkonce.r*)
  		. = ALIGN(0x20) ;
  		LONG(-1)
  		. = ALIGN(0x20) ;
@@ -98,32 +80,24 @@ index 0df999d..f1eed1f 100644
  R_RODAT:	*(.rodata1)
  R_RODAT:	*(.rodata.*)
 diff --git a/ld-elf2flt.c b/ld-elf2flt.c
-index 7cb02d5..1a503dd 100644
+index 7cb02d5..75ee1bb 100644
 --- a/ld-elf2flt.c
 +++ b/ld-elf2flt.c
-@@ -324,6 +324,22 @@ static int do_final_link(void)
+@@ -324,6 +324,14 @@ static int do_final_link(void)
  		append_option(&other_options, concat(got_offset, "=", buf, NULL));
  	}
  
-+	if (streq(TARGET_CPU, "riscv64")) {
-+		/*
-+		 * The .got section must come before the .got.plt section
-+		 * (gcc/ld bug ?).
-+		 */
-+		append_sed(&sed, "(.got.plt)", "(.got.tmp)");
-+		append_sed(&sed, "(.got.plt)", "(.got)");
-+		append_sed(&sed, "(.got.tmp)", "(.got.plt)");
-+
-+		/* The global pointer symbol is defined after the GOT. */
++	/* riscv adds a global pointer symbol to the linker file with the
++	   "RISCV_GP:" prefix. Remove the prefix for riscv64 architecture and
++	   the entire line for other architectures. */
++	if (streq(TARGET_CPU, "riscv64"))
 +		append_sed(&sed, "^RISCV_GP:", "");
-+	} else {
-+		/* Get rid of the global pointer definition. */
++	else
 +		append_sed(&sed, "^RISCV_GP:", NULL);
-+	}
 +
  	/* Locate the default linker script, if we don't have one provided. */
  	if (!linker_script)
  		linker_script = concat(ldscriptpath, "/elf2flt.ld", NULL);
 -- 
-2.35.1
+2.36.1
 
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
