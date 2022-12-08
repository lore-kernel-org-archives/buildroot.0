Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7F7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 10:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7C541852;
	Thu,  8 Dec 2022 10:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7C541852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxPw_a7fDdxa; Thu,  8 Dec 2022 10:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4130541867;
	Thu,  8 Dec 2022 10:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4130541867
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A03C71BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C37F401CC
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C37F401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50ssLcRuwS6R for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE69402E7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE69402E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C50AA85E6B; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Dec 2022 10:54:48 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 534716254ce5b3867adbeef1baab2358c40b83da
X-Git-Newrev: 57ba62490307f802ad201d9af9ce0c43587ce7d0
X-Patchwork-Hint: ignore
Message-Id: <20221208100118.C50AA85E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/elf2flt: fix text
 relocations on xtensa
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

commit: https://git.buildroot.net/buildroot/commit/?id=57ba62490307f802ad201d9af9ce0c43587ce7d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

elf2flt 2021.08 has changed endianness swapping logic for relocated
entries in the text segment. This broke little-endian xtensa FLAT images
which now fail to start with the following message:

  binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20)

Fix it by restoring old endianness swapping logic for relocated entries
in the text segment when building for xtensa.

Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3781e4efc52f542f58147b2de5f599b4e729bcbb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0006-elf2flt-xtensa-fix-text-relocations.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch b/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
new file mode 100644
index 0000000000..3664775906
--- /dev/null
+++ b/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
@@ -0,0 +1,51 @@
+From e248d9774506fdd8698b14a7edead113f19ecdb0 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 29 Nov 2022 17:47:54 -0800
+Subject: [PATCH] xtensa: fix text relocations
+
+The commit 5e08f1968316 ("Don't always update text in !pic_with_got case")
+changed good_32bit_resolved_reloc to not do endianness swapping for
+relocated entries in the text segment. This broke little-endian xtensa
+FLAT images which after this change fail to start with the following
+message:
+
+  binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20)
+
+Fix it by preserving 'update_text' when building for xtensa.
+
+Fixes: 5e08f1968316 ("Don't always update text in !pic_with_got case")
+Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ elf2flt.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index b93aecdaced3..cec3f4a22239 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -808,7 +808,20 @@ output_relocs (
+ 					continue;
+ 				case R_XTENSA_32:
+ 				case R_XTENSA_PLT:
+-					goto good_32bit_resolved_reloc;
++					if (bfd_big_endian (abs_bfd))
++						sym_addr =
++							(r_mem[0] << 24)
++							+ (r_mem[1] << 16)
++							+ (r_mem[2] << 8)
++							+ r_mem[3];
++					else
++						sym_addr =
++							r_mem[0]
++							+ (r_mem[1] << 8)
++							+ (r_mem[2] << 16)
++							+ (r_mem[3] << 24);
++					relocation_needed = 1;
++					break;
+ 				default:
+ 					goto bad_resolved_reloc;
+ #else
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
