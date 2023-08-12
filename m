Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD65EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB293414A4;
	Mon, 21 Aug 2023 20:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB293414A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_tdR4QPy3FY; Mon, 21 Aug 2023 20:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E9A8414A1;
	Mon, 21 Aug 2023 20:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E9A8414A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A43601BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E1A2409AC
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E1A2409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpqZ1eKb9_3C for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45507415D9
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45507415D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34A2686023; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 14:33:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 29834d8a12d984e8efe05398c5aaa6a61f7880e0
X-Git-Newrev: 61f79aa13d7ba84cfa720ad9565fc12d60b56000
X-Patchwork-Hint: ignore
Message-Id: <20230821200126.34A2686023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_111001
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

commit: https://git.buildroot.net/buildroot/commit/?id=61f79aa13d7ba84cfa720ad9565fc12d60b56000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

e2fsprogs package fails to build for the SH4 architecture due to a gcc
13.2.0 bug that leads to:
during RTL pass: sh_treg_combine2
rw_bitmaps.c: In function read_bitmaps_range_start:
internal compiler error: Aborted

Let's add gcc bug to avoid to deal with architectures in packages
when a gcc bug arises. Let's instead deal directly with gcc
bug number.

It's been reported upstream:
https://gcc.gnu.org/bugzilla//show_bug.cgi?id=111001

No need to backport as gcc 13.20 was introduced recently in
buildroot.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a37933bc12..da6bf5f4c8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -257,6 +257,17 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_110934
 	bool
 	default y if BR2_m68k
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111001
+# ICE: on SH4: during RTL pass: sh_treg_combine2
+# This bug exist in gcc = 13.2.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
+	bool
+	default y if BR2_sh
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	depends on BR2_OPTIMIZE_1 || \
+		   BR2_OPTIMIZE_2 || \
+		   BR2_OPTIMIZE_3
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
