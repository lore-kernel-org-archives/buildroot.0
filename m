Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89387C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E58D4086B;
	Tue,  7 Jun 2022 19:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPvDGO3MaLaQ; Tue,  7 Jun 2022 19:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4586341950;
	Tue,  7 Jun 2022 19:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 199BB1BF9B6
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC031408A6
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgL2AGFBmegJ for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2FFA4055A
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9471786E23; Tue,  7 Jun 2022 19:04:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 21:00:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75301bf98821ccea20e38abeef41a15f0462be04
X-Git-Newrev: 32f93b0ef2c602dfa1f5b243ba865d5b16e2fa33
X-Patchwork-Hint: ignore
Message-Id: <20220607190455.9471786E23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: update RISC-V 64-bits
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32f93b0ef2c602dfa1f5b243ba865d5b16e2fa33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...reinstate-32-byte-alignment-for-.data-sec.patch | 81 ++++++++++++++++++++++
 ...03-elf2flt-fix-.eh_frame-section-handling.patch | 73 +++++++++++++++++++
 ...> 0004-elf2flt-add-riscv-64-bits-support.patch} | 80 ++++++++-------------
 3 files changed, 181 insertions(+), 53 deletions(-)

diff --git a/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch b/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
new file mode 100644
index 0000000000..4df3ea5929
--- /dev/null
+++ b/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
@@ -0,0 +1,81 @@
+From 85ba5664eb368eb1cbd2c30b7cd574acd75edd4c Mon Sep 17 00:00:00 2001
+From: Niklas Cassel <niklas.cassel@wdc.com>
+Date: Mon, 4 Apr 2022 15:30:24 +0200
+Subject: [PATCH] elf2flt.ld: reinstate 32 byte alignment for .data section
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
index 0000000000..e7e8c6f25b
--- /dev/null
+++ b/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
@@ -0,0 +1,73 @@
+From 8b7fdb1dedfb8a6e858b46e5af33029fe0462ab8 Mon Sep 17 00:00:00 2001
+From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
+Date: Tue, 10 May 2022 23:14:36 +0900
+Subject: [PATCH] elf2flt: fix .eh_frame section handling
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
