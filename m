Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51860C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098978146E;
	Mon,  7 Aug 2023 20:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098978146E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePEK16nZIEVP; Mon,  7 Aug 2023 20:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30FFE81E8B;
	Mon,  7 Aug 2023 20:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30FFE81E8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 156721BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1A71409DB
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1A71409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-qbYYo3TXgU for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:24:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027B3409B0
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 027B3409B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6931846D5; Mon,  7 Aug 2023 20:24:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 22:24:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 124f1d7269a1a8ad0056ea82a185e9a808b91dba
X-Git-Newrev: dd97dfc79906a3bfb72c6cdd2678ed6353d2c56e
X-Patchwork-Hint: ignore
Message-Id: <20230807202415.E6931846D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: handle more relocations
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd97dfc79906a3bfb72c6cdd2678ed6353d2c56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here the comment:
https://github.com/uclinux-dev/elf2flt/pull/24

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/c16/c161f191d85f9d064626ee6fcfebea61d916e434/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-more-relocations-required-to-be-handled.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
new file mode 100644
index 0000000000..74d3085d08
--- /dev/null
+++ b/package/elf2flt/0008-riscv64-add-more-relocations-required-to-be-handled.patch
@@ -0,0 +1,40 @@
+From 5acfed0012f2fff9801b25403bd8a5e1c2ccfea2 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 7 Aug 2023 09:30:34 +0200
+Subject: [PATCH] riscv64: add more relocations required to be handled
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/uclinux-dev/elf2flt/pull/24
+---
+ elf2flt.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 6685bff..6b3bea4 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -850,11 +850,21 @@ output_relocs (
+ 				default:
+ 					goto bad_resolved_reloc;
+ #elif defined(TARGET_riscv64)
++				case R_RISCV_NONE:
+ 				case R_RISCV_32_PCREL:
++				case R_RISCV_ADD8:
++				case R_RISCV_ADD16:
+ 				case R_RISCV_ADD32:
+ 				case R_RISCV_ADD64:
++				case R_RISCV_SUB6:
++				case R_RISCV_SUB8:
++				case R_RISCV_SUB16:
+ 				case R_RISCV_SUB32:
+ 				case R_RISCV_SUB64:
++				case R_RISCV_SET6:
++				case R_RISCV_SET8:
++				case R_RISCV_SET16:
++				case R_RISCV_SET32:
+ 					continue;
+ 				case R_RISCV_32:
+ 				case R_RISCV_64:
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
