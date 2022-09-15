Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B34ECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 14:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4047441088;
	Thu, 15 Sep 2022 14:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4047441088
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lu45mgEBN5OV; Thu, 15 Sep 2022 14:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23351408C8;
	Thu, 15 Sep 2022 14:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23351408C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 570BA1BF2FB
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DDAB60BC7
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DDAB60BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsjrqmnOTPc7 for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 14:01:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B2C360FAE
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 14:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B2C360FAE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2568483C62; Thu, 15 Sep 2022 14:01:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 16:01:27 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: fe5d402bd79bb7a217382061f8cdb1da7a244b8a
X-Git-Newrev: 85c89dbaa1097762c33458ccbc6a921e976e256b
X-Patchwork-Hint: ignore
Message-Id: <20220915140133.2568483C62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/elf2flt: fix
 fatal error regression on m68k, xtensa, riscv64
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

commit: https://git.buildroot.net/buildroot/commit/?id=85c89dbaa1097762c33458ccbc6a921e976e256b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This series fixes a fatal error at link time on m68k, xtensa,
and riscv64, caused by a bad upstream elf2flt commit.

Without this patch, m68k, xtensa, and riscv64 would result in
a fatal error:
ERROR: text=0x3bab8 overlaps data=0x33f60 ?

With this patch, qemu_m68k_mcf5208_defconfig,
qemu_riscv64_nommu_virt_defconfig, and
qemu_xtensa_lx60_nommu_defconfig builds properly.

riscv64 and m68k boots to login prompt.
xtensa crashes when loading init, the same behavior as when
reverting the bad upstream elf2flt commit completely.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9dd179d43ffe9be98035f921a0db2bf051b632fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4-elf2flt-create-a-common-helper-function.patch | 76 ++++++++++++++++++++++
 ...-fatal-error-regression-on-m68k-xtensa-ri.patch | 73 +++++++++++++++++++++
 2 files changed, 149 insertions(+)

diff --git a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
new file mode 100644
index 0000000000..6fee99d45a
--- /dev/null
+++ b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
@@ -0,0 +1,76 @@
+From 37e1e0ace8ccebf54ec2f5522bfc1f9db86946ad Mon Sep 17 00:00:00 2001
+From: Niklas Cassel <niklas.cassel@wdc.com>
+Date: Tue, 9 Aug 2022 12:13:50 +0200
+Subject: [PATCH] elf2flt: create a common helper function
+
+In order to make the code more maintainable,
+move duplicated code to a common helper function.
+
+No functional change intended.
+
+Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
+---
+ elf2flt.c | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 669591e..9c32f9a 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -337,6 +337,13 @@ compare_relocs (const void *pa, const void *pb)
+ }
+ #endif
+ 
++static bool
++ro_reloc_data_section_should_be_in_text(asection *s)
++{
++  return (s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
++	  (SEC_DATA | SEC_READONLY | SEC_RELOC);
++}
++
+ static uint32_t *
+ output_relocs (
+   bfd *abs_bfd,
+@@ -428,8 +435,7 @@ output_relocs (
+ 	 */
+ 	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
+ 	    ((a->flags & SEC_CODE) ||
+-	    ((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-		         (SEC_DATA | SEC_READONLY | SEC_RELOC))))
++	     ro_reloc_data_section_should_be_in_text(a)))
+ 		sectionp = text + (a->vma - text_vma);
+ 	else if (a->flags & SEC_DATA)
+ 		sectionp = data + (a->vma - data_vma);
+@@ -1893,8 +1899,7 @@ int main(int argc, char *argv[])
+     bfd_vma sec_vma;
+ 
+     if ((s->flags & SEC_CODE) ||
+-       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-                    (SEC_DATA | SEC_READONLY | SEC_RELOC))) {
++	ro_reloc_data_section_should_be_in_text(s)) {
+       vma = &text_vma;
+       len = &text_len;
+     } else if (s->flags & SEC_DATA) {
+@@ -1932,8 +1937,7 @@ int main(int argc, char *argv[])
+    * data sections.*/
+   for (s = abs_bfd->sections; s != NULL; s = s->next)
+     if ((s->flags & SEC_CODE) ||
+-       ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-                    (SEC_DATA | SEC_READONLY | SEC_RELOC)))
++	ro_reloc_data_section_should_be_in_text(s))
+       if (!bfd_get_section_contents(abs_bfd, s,
+ 				   text + (s->vma - text_vma), 0,
+ 				   bfd_section_size(abs_bfd, s)))
+@@ -1962,8 +1966,7 @@ int main(int argc, char *argv[])
+    * data sections already included in the text output section.*/
+   for (s = abs_bfd->sections; s != NULL; s = s->next)
+     if ((s->flags & SEC_DATA) &&
+-       ((s->flags & (SEC_READONLY | SEC_RELOC)) !=
+-                    (SEC_READONLY | SEC_RELOC)))
++	!ro_reloc_data_section_should_be_in_text(s))
+       if (!bfd_get_section_contents(abs_bfd, s,
+ 				   data + (s->vma - data_vma), 0,
+ 				   bfd_section_size(abs_bfd, s)))
+-- 
+2.37.1
+
diff --git a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
new file mode 100644
index 0000000000..278709cb1c
--- /dev/null
+++ b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
@@ -0,0 +1,73 @@
+From 65ac5f9e69cfb989d970da74c41e478774d29be5 Mon Sep 17 00:00:00 2001
+From: Niklas Cassel <niklas.cassel@wdc.com>
+Date: Tue, 9 Aug 2022 21:06:05 +0200
+Subject: [PATCH] elf2flt: fix fatal error regression on m68k, xtensa,
+ riscv64
+
+Commit ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs")
+changed the condition of which input sections that should be included
+in the .text output section from:
+((a->flags & (SEC_DATA | SEC_READONLY)) == (SEC_DATA | SEC_READONLY))
+to:
+((a->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+(SEC_DATA | SEC_READONLY | SEC_RELOC))
+
+On ARM, the .eh_frame input section does not have the SEC_RELOC flag
+set, so this specific change had no effect on ARM.
+
+However, on e.g. m68k and riscv64, the .eh_frame input section does
+have the SEC_RELOC flag set, which means that after commit ba379d08bb78
+("elf2flt: fix for segfault on some ARM ELFs"), read-only relocation
+data sections were placed in .text output section, instead of .data
+output section.
+
+This will result in a fatal error on m68k, xtensa and riscv64:
+ERROR: text=0x3bab8 overlaps data=0x33f60 ?
+
+This is because elf2flt cannot append to .text after .data has been
+appended to.
+
+Note that the binutils maintainer says that the correct thing is
+to put read-only relocation data sections in .text:
+https://sourceware.org/legacy-ml/binutils/2019-10/msg00132.html
+
+So the proper fix is probably to rewrite elf2flt so that it can append
+to .text after .data has been appended to (which will require elf2flt
+to move/relocate everything that has already been appended to .data,
+since the virtual addresses are contiguous).
+
+However, for now, add an exception for m68k, xtensa and riscv64
+(specifically for the problematic input section, .eh_frame), so that we
+get the same behavior as older elf2flt releases, where we put read-only
+relocation data in .data, which was working perfectly fine.
+
+Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
+---
+ elf2flt.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 9c32f9a..a680c89 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -340,8 +340,15 @@ compare_relocs (const void *pa, const void *pb)
+ static bool
+ ro_reloc_data_section_should_be_in_text(asection *s)
+ {
+-  return (s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+-	  (SEC_DATA | SEC_READONLY | SEC_RELOC);
++  if ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
++      (SEC_DATA | SEC_READONLY | SEC_RELOC)) {
++#if defined(TARGET_m68k) || defined(TARGET_riscv64) || defined(TARGET_xtensa)
++    if (!strcmp(".eh_frame", s->name))
++      return false;
++#endif
++    return true;
++  }
++  return false;
+ }
+ 
+ static uint32_t *
+-- 
+2.37.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
