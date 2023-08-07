Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8795C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E14781EAE;
	Mon,  7 Aug 2023 20:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E14781EAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPR6Rmtc3KG2; Mon,  7 Aug 2023 20:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB82F81EA0;
	Mon,  7 Aug 2023 20:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB82F81EA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29A691BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F0C81EA0
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F0C81EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tX1mrVgKazzu for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:25:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A7581E9C
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A7581E9C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38BD9846E2; Mon,  7 Aug 2023 20:25:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 22:25:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd97dfc79906a3bfb72c6cdd2678ed6353d2c56e
X-Git-Newrev: 51435d30ba283036d027f2d02c693da138bbdf71
X-Patchwork-Hint: ignore
Message-Id: <20230807202519.38BD9846E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_110934
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

commit: https://git.buildroot.net/buildroot/commit/?id=51435d30ba283036d027f2d02c693da138bbdf71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssh package fails to build for the M68K architecture with -fzero-call-used-regs=all
passed to gcc = 12.3.0 and it's still present in gcc = 13.2.0:
http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a142d27231..9d390ab11e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -244,6 +244,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_OPTIMIZE_0
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934
+# ICE: on M68K: in change_address_1, at emit-rtl.cc:2287
+# This bug exists in gcc = 12.3.0 and gcc = 13.2.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_110934
+	bool
+	default y if BR2_m68k
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
