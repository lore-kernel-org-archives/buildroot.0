Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E0EC001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A592409AC;
	Sun,  6 Aug 2023 13:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A592409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5qsbaDf6wu6; Sun,  6 Aug 2023 13:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E362040322;
	Sun,  6 Aug 2023 13:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E362040322
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B72671BF8C7
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E362381ABB
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E362381ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWngO-vDPhIt for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:44:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E218380B42
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E218380B42
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0BA3843C5; Sun,  6 Aug 2023 13:44:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 15:43:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3b22e3642c836f83b5f45d0bceba9c36ae9d33f
X-Git-Newrev: d79f9c9f416ac5da90cd428916cff0b5288cb03a
X-Patchwork-Hint: ignore
Message-Id: <20230806134455.D0BA3843C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: backport upstream patch
 to remove use of BFD_VMA_FMT
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
Content-Type: multipart/mixed; boundary="===============4207937988894064228=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4207937988894064228==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d79f9c9f416ac5da90cd428916cff0b5288cb03a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit backports upstream commit
https://github.com/uclinux-dev/elf2flt/commit/a36df7407d9e3f93ca6449841ff0821b0d980438
to fix a build issue with binutils 2.40 or later:

elf2flt.c:223:31: error: expected ‘)’ before ‘BFD_VMA_FMT’

We prefer a backport over updating to a newer elf2flt version for now
as there has been multiple other changes in elf2flt, and elf2flt is
very fragile. Therefore for now we prefer to be conservative.

Fixes:

  http://autobuild.buildroot.net/results/938a59b5e52d712786590e80328bb45b1c5fc519/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch   | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/package/elf2flt/0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch b/package/elf2flt/0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch
new file mode 100644
index 0000000000..82e693f35f
--- /dev/null
+++ b/package/elf2flt/0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch
@@ -0,0 +1,169 @@
+From 9ec7dd9dead2f3c4c73c3ab2166a1f81bfb41825 Mon Sep 17 00:00:00 2001
+From: Greg Ungerer <gerg@kernel.org>
+Date: Thu, 13 Apr 2023 22:58:20 +1000
+Subject: [PATCH] elf2flt: remove use of BFD_VMA_FMT
+
+In binutils-2.40 the BFD_VMA_FMT definition used for printf style
+formatting specifiers has been removed. For reference this was done in
+commit b82817674f46 ("Don't use BFD_VMA_FMT in binutils") in the
+binutils git development tree.
+
+BFD_VMA_FMT is used in a number of places in the elf2flt code to output
+bfd offsets, values and the like. So it is broken when using the bfd
+code from binutils-2.40 and newer.
+
+According to the binutils change PRIx64 (and friends) is used to replace
+it, with appropriate casts to keep it clean for 32 and 64 bit platforms.
+Change the elf2flt.c use of it in the same way to fix.
+
+This does not change the output in any way in normal use. This fix can
+be used on all versions of binutils (older and newer), there is no
+need to only do this on 2.40 and newer.
+
+Signed-off-by: Greg Ungerer <gerg@kernel.org>
+Upstream: https://github.com/uclinux-dev/elf2flt/commit/a36df7407d9e3f93ca6449841ff0821b0d980438
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ elf2flt.c | 58 ++++++++++++++++++++++++++++---------------------------
+ 1 file changed, 30 insertions(+), 28 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 0fcb747..6685bff 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -220,8 +220,8 @@ dump_symbols(asymbol **symbol_table, long number_of_symbols)
+   long i;
+   printf("SYMBOL TABLE:\n");
+   for (i=0; i<number_of_symbols; i++) {
+-	printf("  NAME=%s  VALUE=0x%"BFD_VMA_FMT"x\n",
+-		symbol_table[i]->name, symbol_table[i]->value);
++	printf("  NAME=%s  VALUE=0x%"PRIx64"\n",
++		symbol_table[i]->name, (uint64_t) symbol_table[i]->value);
+   }
+   printf("\n");
+   return(0);
+@@ -466,8 +466,8 @@ output_relocs (
+ 	if (r == NULL)
+ 	  continue;
+ 	if (verbose)
+-	  printf(" RELOCS: %s [%p]: flags=0x%x vma=0x%"BFD_VMA_FMT"x\n",
+-			r->name, r, r->flags, elf2flt_bfd_section_vma(r));
++	  printf(" RELOCS: %s [%p]: flags=0x%x vma=0x%"PRIx64"\n",
++			r->name, r, r->flags, (uint64_t) elf2flt_bfd_section_vma(r));
+   	if ((r->flags & SEC_RELOC) == 0)
+   	  continue;
+ 	relsize = bfd_get_reloc_upper_bound(rel_bfd, r);
+@@ -952,12 +952,13 @@ output_relocs (
+ 					if (verbose)
+ 						fprintf(stderr,
+ 							"%s vma=0x%x, "
+-							"value=0x%"BFD_VMA_FMT"x, "
+-							"address=0x%"BFD_VMA_FMT"x "
++							"value=0x%"PRIx64", "
++							"address=0x%"PRIx64" "
+ 							"sym_addr=0x%x rs=0x%x, opcode=0x%x\n",
+ 							"ABS32",
+-							sym_vma, (*(q->sym_ptr_ptr))->value,
+-							q->address, sym_addr,
++							sym_vma, 
++							(uint64_t) (*(q->sym_ptr_ptr))->value,
++							(uint64_t) q->address, sym_addr,
+ 							(*p)->howto->rightshift,
+ 							*(uint32_t *)r_mem);
+ 					sym_vma = elf2flt_bfd_section_vma(sym_section);
+@@ -971,12 +972,13 @@ output_relocs (
+ 					if (verbose)
+ 						fprintf(stderr,
+ 							"%s vma=0x%x, "
+-							"value=0x%"BFD_VMA_FMT"x, "
+-							"address=0x%"BFD_VMA_FMT"x "
++							"value=0x%"PRIx64", "
++							"address=0x%"PRIx64" "
+ 							"sym_addr=0x%x rs=0x%x, opcode=0x%x\n",
+ 							"PLT32",
+-							sym_vma, (*(q->sym_ptr_ptr))->value,
+-							q->address, sym_addr,
++							sym_vma,
++							(uint64_t) (*(q->sym_ptr_ptr))->value,
++							(uint64_t) q->address, sym_addr,
+ 							(*p)->howto->rightshift,
+ 							*(uint32_t *)r_mem);
+ 				case R_ARM_PC24:
+@@ -994,8 +996,8 @@ output_relocs (
+ 				case R_V850_ZDA_16_16_OFFSET:
+ 				case R_V850_ZDA_16_16_SPLIT_OFFSET:
+ 					/* Can't support zero-relocations.  */
+-					printf ("ERROR: %s+0x%"BFD_VMA_FMT"x: zero relocations not supported\n",
+-							sym_name, q->addend);
++					printf ("ERROR: %s+0x%"PRIx64": zero relocations not supported\n",
++							sym_name, (uint64_t) q->addend);
+ 					continue;
+ #endif /* TARGET_v850 */
+ 
+@@ -1194,12 +1196,12 @@ output_relocs (
+ 					temp |= (exist_val & 0x3f);
+ 					*(unsigned long *)r_mem = htoniosl(temp);
+ 					if (verbose)
+-						printf("omit: offset=0x%"BFD_VMA_FMT"x symbol=%s%s "
++						printf("omit: offset=0x%"PRIx64" symbol=%s%s "
+ 								"section=%s size=%d "
+-								"fixup=0x%x (reloc=0x%"BFD_VMA_FMT"x) GPREL\n",
+-								q->address, sym_name, addstr,
++								"fixup=0x%x (reloc=0x%"PRIx64") GPREL\n",
++								(uint64_t) q->address, sym_name, addstr,
+ 								section_name, sym_reloc_size,
+-								sym_addr, section_vma + q->address);
++								sym_addr, (uint64_t) section_vma + q->address);
+ 					continue;
+ 				}
+ 				case R_NIOS2_PCREL16:
+@@ -1214,12 +1216,12 @@ output_relocs (
+ 					exist_val |= ((sym_addr & 0xFFFF) << 6);
+ 					*(unsigned long *)r_mem = htoniosl(exist_val);
+ 					if (verbose)
+-						printf("omit: offset=0x%"BFD_VMA_FMT"x symbol=%s%s "
++						printf("omit: offset=0x%"PRIx64" symbol=%s%s "
+ 								"section=%s size=%d "
+-								"fixup=0x%x (reloc=0x%"BFD_VMA_FMT"x) PCREL\n",
+-								q->address, sym_name, addstr,
++								"fixup=0x%x (reloc=0x%"PRIx64") PCREL\n",
++								(uint64_t) q->address, sym_name, addstr,
+ 								section_name, sym_reloc_size,
+-								sym_addr, section_vma + q->address);
++								sym_addr, (uint64_t) section_vma + q->address);
+ 					continue;
+ 				}
+ 
+@@ -1231,9 +1233,9 @@ output_relocs (
+ 					    && (p[-1]->sym_ptr_ptr == p[0]->sym_ptr_ptr)
+ 					    && (p[-1]->addend == p[0]->addend)) {
+ 						if (verbose)
+-							printf("omit: offset=0x%"BFD_VMA_FMT"x symbol=%s%s "
++							printf("omit: offset=0x%"PRIx64" symbol=%s%s "
+ 								"section=%s size=%d LO16\n",
+-								q->address, sym_name, addstr,
++								(uint64_t) q->address, sym_name, addstr,
+ 								section_name, sym_reloc_size);
+ 						continue;
+ 					}
+@@ -1646,13 +1648,13 @@ DIS29_RELOCATION:
+ 			 */
+ 			if (relocation_needed) {
+ 				if (verbose)
+-					printf("  RELOC[%d]: offset=0x%"BFD_VMA_FMT"x symbol=%s%s "
++					printf("  RELOC[%d]: offset=0x%"PRIx64" symbol=%s%s "
+ 						"section=%s size=%d "
+-						"fixup=0x%x (reloc=0x%"BFD_VMA_FMT"x)\n",
++						"fixup=0x%x (reloc=0x%"PRIx64")\n",
+ 						flat_reloc_count,
+-						q->address, sym_name, addstr,
++						(uint64_t) q->address, sym_name, addstr,
+ 						section_name, sym_reloc_size,
+-						sym_addr, section_vma + q->address);
++						sym_addr, (uint64_t) section_vma + q->address);
+ 
+ #ifndef TARGET_bfin
+ 				flat_relocs = realloc(flat_relocs,
+-- 
+2.41.0
+

--===============4207937988894064228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4207937988894064228==--
