Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2845C25B06
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F0F4830FB;
	Thu, 11 Aug 2022 20:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F0F4830FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFGPWPJ8noZj; Thu, 11 Aug 2022 20:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E11C83046;
	Thu, 11 Aug 2022 20:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E11C83046
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 386431BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20CC4830C5
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20CC4830C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2T13nQEP-Hth for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:28:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FA1C82F6C
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA1C82F6C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2F7ED87331; Thu, 11 Aug 2022 20:13:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 22:26:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e047b5c09b25506d1139bab5e2daba2db473035
X-Git-Newrev: 95402089c314fbc03b934f5fcf9c29db043d758c
X-Patchwork-Hint: ignore
Message-Id: <20220811201343.2F7ED87331@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: remove broken patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=95402089c314fbc03b934f5fcf9c29db043d758c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove broken elf2flt patch:
package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch

The patch modifies main(), but does not perform a similar change in
output_relocs(), which might cause sectionp in output_relocs() to be
initialized with an invalid address, causing random memory to be
overwritten.

This leads to a segfault when linking e.g. busybox for m68k.

We cannot perform a similar change in output_relocs(), since at this
point in time, data_len will always be non-zero.

Revert this patch completely, so that we can add a working patch.

Note that even with this patch reverted, elf2flt is still broken
on archs like m68k and xtensa, resulting in the fatal error:
ERROR: text=0x3bab8 overlaps data=0x33f60 ?

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...> 0003-elf2flt-add-riscv-64-bits-support.patch} |  0
 ...03-elf2flt-fix-.eh_frame-section-handling.patch | 73 ----------------------
 2 files changed, 73 deletions(-)

diff --git a/package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
similarity index 100%
rename from package/elf2flt/0004-elf2flt-add-riscv-64-bits-support.patch
rename to package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
diff --git a/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch b/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
deleted file mode 100644
index e7e8c6f25b..0000000000
--- a/package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 8b7fdb1dedfb8a6e858b46e5af33029fe0462ab8 Mon Sep 17 00:00:00 2001
-From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
-Date: Tue, 10 May 2022 23:14:36 +0900
-Subject: [PATCH] elf2flt: fix .eh_frame section handling
-
-elf2flt.ld linker script positions the .eh_frame section in an output
-section after the .text and .data output sections.
-
-However, when elf2flt.c is supplied the ELF linked using the elf2flt.ld
-linker script, it only looks at the flags for each input section, and
-then puts it in either a bFLT text, data or bss output section.
-
-Commit ba379d08bb7 ("elf2flt: fix for segfault on some ARM ELFs")
-modified the section scanning loop of elf2flt main() function to put
-read-only relocation data sections in the bFLT text output section so
-that the .ARM.exidx section is placed in the .text flat output section.
-Previously a read-only relocation data section would be put in the data
-output section.
-
-On ARM, the .eh_frame section does not have the SEC_RELOC flag set, so
-it will still end up in the data output section. However, on
-architectures that generates the .eh_frame section with the SEC_RELOC
-flag set, this section will now be placed in the text output section.
-
-The logic in elf2flt will handle all sections in order, and since the
-input order is .text, .data, and .eh_frame, putting .eh_frame in text
-output section does not work, since elf2flt.c has already put the .data
-input section in the bFLT data output section. This leads to the
-following print (example for riscv64 architecture):
-
-buildroot/output/host/riscv64-buildroot-linux-uclibc/bin/elf2flt:
-ERROR: text=0x3bab8 overlaps data=0x33f60 ?
-
-The way that elf2flt is written, we cannot append to the text output
-section after an input section has been added to the data output
-section. It might be possible to change this, but that would require
-moving all the code the was already placed in the data output section.
-
-Instead, let's allow putting a read-only relocation data section in the
-text output section (so that .ARM.exidx will still be placed correctly),
-but only if there has not yet been anything placed in the data output
-section.
-
-That way .ARM.exidx will still be placed correctly, and .eh_frame will
-be placed correctly in the .data output section, regardless if it has
-flag SEC_RELOC set or not.
-
-Fixes: ba379d08bb7 ("elf2flt: fix for segfault on some ARM ELFs")
-Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
-Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
----
- elf2flt.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/elf2flt.c b/elf2flt.c
-index 7ac0617..da25e93 100644
---- a/elf2flt.c
-+++ b/elf2flt.c
-@@ -1877,8 +1877,9 @@ int main(int argc, char *argv[])
-     bfd_vma sec_vma;
- 
-     if ((s->flags & SEC_CODE) ||
--       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
--                    (SEC_DATA | SEC_READONLY | SEC_RELOC))) {
-+        (((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
-+                     (SEC_DATA | SEC_READONLY | SEC_RELOC)) &&
-+          !data_len)) {
-       vma = &text_vma;
-       len = &text_len;
-     } else if (s->flags & SEC_DATA) {
--- 
-2.35.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
