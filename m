Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24536C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A75408E9;
	Mon,  7 Aug 2023 21:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A75408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2T2oje3aCfbv; Mon,  7 Aug 2023 21:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 977DD408EB;
	Mon,  7 Aug 2023 21:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 977DD408EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F21D21BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA267408F7
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA267408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4gtO6K6VZuW for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:34:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1108408E9
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1108408E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACD038477A; Mon,  7 Aug 2023 21:34:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 23:34:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b60f2782e6d2d5235842671a8837eefbaca4712
X-Git-Newrev: 365f22960d9f024c7566290b133b65ed8ad21739
X-Patchwork-Hint: ignore
Message-Id: <20230807213447.ACD038477A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
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

commit: https://git.buildroot.net/buildroot/commit/?id=365f22960d9f024c7566290b133b65ed8ad21739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libheif package fails to build for the M68K architecture due to a binutils
bug that leads to:
Internal error in emit_expr_encoded at dw2gencfi.c:215

Let's add binutils bug to avoid to deal with architectures in packages
when a binutils bug arises. Let's instead deal directly with binutils
bug number.

It's been reported upstream:
https://sourceware.org/bugzilla/show_bug.cgi?id=30730

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 9d390ab11e..a37933bc12 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -77,6 +77,12 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	bool
 	default y if BR2_nios2
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=30730
+# Affect toolchains built with binutils 2.40, still not fixed.
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
+	bool
+	default y if BR2_m68k_cf
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
