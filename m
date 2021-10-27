Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E348C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA9E60F5A
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEA9E60F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A744B40235;
	Wed, 27 Oct 2021 13:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqRIrhYrPzTL; Wed, 27 Oct 2021 13:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F5C4023E;
	Wed, 27 Oct 2021 13:53:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4473F1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4150381A29
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqj_Tj722Q1q for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CF4781A27
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 86B7888307; Wed, 27 Oct 2021 13:49:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 14:35:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04d7ea4720cbc1e9c4d7ec6307aff71567b0653d
X-Git-Newrev: 6d49446ebdbd32c1b4591c0aa8cacb189a69e318
X-Patchwork-Hint: ignore
Message-Id: <20211027134931.86B7888307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: add RISC-V 64-bits support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d49446ebdbd32c1b4591c0aa8cacb189a69e318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable selecting elf2flt for RISC-V 64-bits no MMU builds and add
support for it in the form of an additional patch (upstream pull request
https://github.com/uclinux-dev/elf2flt/pull/22).

Also modify the package Makefile.in file to add the -fPIC option to
the target CFLAGS for RISC-V 64-bits no MMU builds.

This patch is based on initial work by Christoph Hellwig <hch@lst.de>.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in                                |   3 +
 .../0004-elf2flt-add-riscv-64-bits-support.patch   | 137 +++++++++++++++++++++
 package/elf2flt/Config.in.host                     |   2 +-
 3 files changed, 141 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 50ccd0f25d..04347d2d84 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -178,6 +178,9 @@ TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
+ifeq ($(BR2_RISCV_64),y)
+TARGET_CFLAGS += -fPIC
+endif
 ifeq ($(BR2_BINFMT_FLAT_ONE),y)
 ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt="-r -s$($(PKG)_FLAT_STACKSIZE)",\
diff --git a/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
new file mode 100644
index 0000000000..4b00758446
--- /dev/null
+++ b/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
@@ -0,0 +1,137 @@
+From 1dea576eac4289602adc4a37f48c80330bf82e63 Mon Sep 17 00:00:00 2001
+From: Damien Le Moal <damien.lemoal@wdc.com>
+Date: Wed, 9 Sep 2020 17:31:33 +0900
+Subject: [PATCH] elf2flt: add riscv 64-bits support
+
+Add support for riscv 64bits ISA by defining the relocation types
+R_RISCV_32_PCREL, R_RISCV_ADD32, R_RISCV_SUB32, R_RISCV_32 and
+R_RISCV_64. riscv64 support also needs the __global_pointer$ symbol to
+be defined right after the relocation tables in the data section.
+Furthermore, the .got and .got.plt sections must be reversed. These 2
+requirements are handled with runtime modifications of the default
+linker script using the append_sed() function.
+(1) For the .got.plt and .got sections order swap, append_sed() is used
+to rename "(.got.plt)" to "(.got.tmp)" and to rename "(.got)" to
+"(.got.plt)". A last call finalize the name swap by replacing
+"(.got.tmp)" with "(.got)"
+(2) For the global pointer synbol, a definition line starting with
+"RISCV_GP" is added. The "RISCV_GP" string is removed if the target CPU
+type is riscv64. The definition line is dropped for other CPU types.
+
+With these changes, buildroot/busybox builds and run on NOMMU
+systems with kernel 5.13. Tested on Canaan Kendryte K210 boards.
+
+This patch is based on earlier work by Christoph Hellwig <hch@lst.de>.
+
+Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
+---
+ elf2flt.c     | 23 +++++++++++++++++++++++
+ elf2flt.ld.in |  9 +++++----
+ ld-elf2flt.c  | 16 ++++++++++++++++
+ 3 files changed, 44 insertions(+), 4 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index f87f1fc..dbce467 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -80,6 +80,8 @@ const char *elf2flt_progname;
+ #include <elf/v850.h>
+ #elif defined(TARGET_xtensa)
+ #include <elf/xtensa.h>
++#elif defined(TARGET_riscv64)
++#include <elf/riscv.h>
+ #endif
+ 
+ #if defined(__MINGW32__)
+@@ -122,6 +124,8 @@ const char *elf2flt_progname;
+ #define ARCH	"nios2"
+ #elif defined(TARGET_xtensa)
+ #define ARCH	"xtensa"
++#elif defined(TARGET_riscv64)
++#define ARCH	"riscv64"
+ #else
+ #error "Don't know how to support your CPU architecture??"
+ #endif
+@@ -797,6 +801,16 @@ output_relocs (
+ 					goto good_32bit_resolved_reloc;
+ 				default:
+ 					goto bad_resolved_reloc;
++#elif defined(TARGET_riscv64)
++				case R_RISCV_32_PCREL:
++				case R_RISCV_ADD32:
++				case R_RISCV_SUB32:
++					continue;
++				case R_RISCV_32:
++				case R_RISCV_64:
++					goto good_32bit_resolved_reloc;
++				default:
++					goto bad_resolved_reloc;
+ #else
+ 				default:
+ 					/* The default is to assume that the
+@@ -1806,6 +1820,15 @@ int main(int argc, char *argv[])
+   if (!load_to_ram && !pfile)
+     load_to_ram = 1;
+ 
++#if defined(TARGET_riscv64)
++  /*
++   * riscv only supports loading text and data contiguously.
++   * So fail if load_to_ram is false.
++   */
++  if (!load_to_ram)
++    fatal("Loading to RAM ('-r' option) is required");
++#endif
++
+   fname = argv[argc-1];
+ 
+   if (pfile) {
+diff --git a/elf2flt.ld.in b/elf2flt.ld.in
+index ec1fe6f..c0c44b8 100644
+--- a/elf2flt.ld.in
++++ b/elf2flt.ld.in
+@@ -70,10 +70,11 @@ W_RODAT		*(.gnu.linkonce.r*)
+ 		. = ALIGN(0x20) ;
+ 		LONG(-1)
+ 		. = ALIGN(0x20) ;
+-R_RODAT		*(.rodata)
+-R_RODAT		*(.rodata1)
+-R_RODAT		*(.rodata.*)
+-R_RODAT		*(.gnu.linkonce.r*)
++RISCV_GP:	__global_pointer$ = . + 0x800 ;
++R_RODAT 	*(.rodata)
++R_RODAT 	*(.rodata1)
++R_RODAT 	*(.rodata.*)
++R_RODAT 	*(.gnu.linkonce.r*)
+ 		*(.data)
+ 		*(.data1)
+ 		*(.data.*)
+diff --git a/ld-elf2flt.c b/ld-elf2flt.c
+index e5de506..31b565f 100644
+--- a/ld-elf2flt.c
++++ b/ld-elf2flt.c
+@@ -324,6 +324,22 @@ static int do_final_link(void)
+ 		append_option(&other_options, concat(got_offset, "=", buf, NULL));
+ 	}
+ 
++	if (streq(TARGET_CPU, "riscv64")) {
++		/*
++		 * The .got section must come before the .got.plt section
++		 * (gcc/ld bug ?).
++		 */
++		append_sed(&sed, "(.got.plt)", "(.got.tmp)");
++		append_sed(&sed, "(.got.plt)", "(.got)");
++		append_sed(&sed, "(.got.tmp)", "(.got.plt)");
++
++		/* The global pointer symbol is defined after the GOT. */
++		append_sed(&sed, "^RISCV_GP:", "");
++	} else {
++		/* Get rid of the global pointer definition. */
++		append_sed(&sed, "^RISCV_GP:", NULL);
++	}
++
+ 	/* Locate the default linker script, if we don't have one provided. */
+ 	if (!linker_script)
+ 		linker_script = concat(ldscriptpath, "/elf2flt.ld", NULL);
+-- 
+2.31.1
+
diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index d6685a7ff6..2bab0095c2 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa
+	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
 	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
