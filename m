Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF4EC6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 18:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38B664159D;
	Thu, 24 Aug 2023 18:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38B664159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZqdWH_COi5w; Thu, 24 Aug 2023 18:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96783415BC;
	Thu, 24 Aug 2023 18:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96783415BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67DD51BF853
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E8FC60F77
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E8FC60F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pJ-WFaiq3wW for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 18:53:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6046B60F69
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 18:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6046B60F69
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C434861F7; Thu, 24 Aug 2023 18:53:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 20:53:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c61470c4bc0c88dbaba49468ee8cc4c983d2604
X-Git-Newrev: 3f46db39e62a5b84ca4cd938d07ca7aa49edfc88
X-Patchwork-Hint: ignore
Message-Id: <20230824185338.4C434861F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gmp: guard riscv definition
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f46db39e62a5b84ca4cd938d07ca7aa49edfc88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 30997eaa65438a2ce726ad8a204ac5a36363f5c8 a mistake
was made. Guard the definition correctly.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gmp/gmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 3b732dfa71..a077c89d92 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -24,7 +24,7 @@ GMP_CONF_OPTS += --disable-assembly
 endif
 
 # GMP needs M extension for riscv assembly
-ifeq ($(BR2_RISCV_ISA_CUSTOM_RVM),)
+ifeq ($(BR2_riscv):$(BR2_RISCV_ISA_CUSTOM_RVM),y:)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
