Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE45C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B934B4EF39;
	Tue, 21 Feb 2023 00:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B934B4EF39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7Owb8su0lOG; Tue, 21 Feb 2023 00:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6BF4EF32;
	Tue, 21 Feb 2023 00:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6BF4EF32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54C7A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03124417B0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03124417B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwkwxPH07fuS for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D44040C13
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D44040C13
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 183198648F; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:13:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93e7fc3e53bff9db971f3ae951d93d3bd1a39d1e
X-Git-Newrev: f6f15e85b3ac58ba1d387ea86945d3fabf4f8990
X-Patchwork-Hint: ignore
Message-Id: <20230220205247.183198648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/elf2flt: fix error
 when building gdb for target on m68k
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6f15e85b3ac58ba1d387ea86945d3fabf4f8990
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Thomas reported that m68k fails to build when enabling BR2_PACKAGE_GDB.

It fails when building gdb for the target with the following error:
elf2flt: ERROR: text=0x3c826 overlaps data=0x256e0 ?

It turns out that the gdb binary has another problematic input section
(.gcc_except_table), which causes elf2flt to try to append to the .text
output section, after it has already moved on with appending sections
to the .data output section.

elf2flt cannot append to a previous output section once it has moved on
to another output section.

Update the existing elf2flt patch to also add an exception for
.gcc_except_table.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fatal-error-regression-on-m68k-xtensa-ri.patch | 47 +++++++++++-----------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
index 278709cb1c..616bbc891f 100644
--- a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
+++ b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
@@ -1,8 +1,7 @@
-From 65ac5f9e69cfb989d970da74c41e478774d29be5 Mon Sep 17 00:00:00 2001
+From a8c9f650b82109abf7aa730f298ea5182ed62613 Mon Sep 17 00:00:00 2001
 From: Niklas Cassel <niklas.cassel@wdc.com>
 Date: Tue, 9 Aug 2022 21:06:05 +0200
-Subject: [PATCH] elf2flt: fix fatal error regression on m68k, xtensa,
- riscv64
+Subject: [PATCH] elf2flt: fix fatal error regression on m68k, xtensa, riscv64
 
 Commit ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")
 changed the condition of which input sections that should be included
@@ -12,16 +11,15 @@ to:
 ((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
 (SEC_DATA | SEC_READONLY | SEC_RELOC))
 
-On ARM, the .eh_frame input section does not have the SEC_RELOC flag
-set, so this specific change had no effect on ARM.
+On ARM, the .eh_frame input section does not have the SEC_RELOC flag set,
+so on ARM, this change caused .eh_frame to move from .text to .data.
 
-However, on e.g. m68k and riscv64, the .eh_frame input section does
-have the SEC_RELOC flag set, which means that after commit ba379d08bb78
-("elf2flt: fix for segfault on some ARM ELFs"), read-only relocation
-data sections were placed in .text output section, instead of .data
-output section.
+However, on e.g. m68k, xtensa and riscv64, the .eh_frame input section
+does have the SEC_RELOC flag set, which means that the change in
+commit ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")
+caused .eh_frame to move in an opposite way, i.e. from .data to .text.
 
-This will result in a fatal error on m68k, xtensa and riscv64:
+This resulted in a fatal error on m68k, xtensa and riscv64:
 ERROR: text=0x3bab8 overlaps data=0x33f60 ?
 
 This is because elf2flt cannot append to .text after .data has been
@@ -36,21 +34,26 @@ to .text after .data has been appended to (which will require elf2flt
 to move/relocate everything that has already been appended to .data,
 since the virtual addresses are contiguous).
 
-However, for now, add an exception for m68k, xtensa and riscv64
-(specifically for the problematic input section, .eh_frame), so that we
-get the same behavior as older elf2flt releases, where we put read-only
-relocation data in .data, which was working perfectly fine.
+However, for now, add an exception for input sections which have all
+three flags SEC_DATA, SEC_READONLY, and SEC_RELOC set, and which have a
+name equal to a problematic input section (.eh_frame, .gcc_except_table).
+That way, we get the same behavior as older elf2flt releases for m68k,
+xtensa and riscv64, where we put read-only relocation data in .data,
+which was working perfectly fine.
+
+This exception will not change any behavior on ARM, as the .eh_frame
+input section does not have flag SEC_RELOC set.
 
 Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
 ---
- elf2flt.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
+ elf2flt.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index 9c32f9a..a680c89 100644
+index e0d7891..39d035f 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
-@@ -340,8 +340,15 @@ compare_relocs (const void *pa, const void *pb)
+@@ -341,8 +341,13 @@ compare_relocs (const void *pa, const void *pb)
  static bool
  ro_reloc_data_section_should_be_in_text(asection *s)
  {
@@ -58,10 +61,8 @@ index 9c32f9a..a680c89 100644
 -	  (SEC_DATA | SEC_READONLY | SEC_RELOC);
 +  if ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
 +      (SEC_DATA | SEC_READONLY | SEC_RELOC)) {
-+#if defined(TARGET_m68k) || defined(TARGET_riscv64) || defined(TARGET_xtensa)
-+    if (!strcmp(".eh_frame", s->name))
++    if (!strcmp(".eh_frame", s->name) || !strcmp(".gcc_except_table", s->name))
 +      return false;
-+#endif
 +    return true;
 +  }
 +  return false;
@@ -69,5 +70,5 @@ index 9c32f9a..a680c89 100644
  
  static uint32_t *
 -- 
-2.37.1
+2.39.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
