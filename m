Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49A0EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 10:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DA4840C96;
	Mon, 11 Sep 2023 10:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA4840C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNG-CSl89sjv; Mon, 11 Sep 2023 10:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B14EF4102B;
	Mon, 11 Sep 2023 10:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B14EF4102B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 689B41BF28E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F79160B71
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F79160B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQsAf3y7Czv2 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0093D60BFF
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0093D60BFF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4C0686C6A; Mon, 11 Sep 2023 10:35:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 12:26:52 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2625ea6bf2f77b0292811432ea627c44b81f9ee3
X-Git-Newrev: 3a019470eaa5aa9a47d3465848eebaef66c7491d
X-Patchwork-Hint: ignore
Message-Id: <20230911103505.E4C0686C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] toolchain: introduce
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a019470eaa5aa9a47d3465848eebaef66c7491d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

openssh package fails to build for the M68K architecture with -fzero-call-used-regs=all
passed to gcc = 12.3.0 and it's still present in gcc = 13.2.0:
http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51435d30ba283036d027f2d02c693da138bbdf71)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 08e4ccad9e..b3cbec8377 100644
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
