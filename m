Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AFACA5537
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CE268144A;
	Wed, 13 Sep 2023 16:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CE268144A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTIYBDcmw6jY; Wed, 13 Sep 2023 16:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FE9281422;
	Wed, 13 Sep 2023 16:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FE9281422
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A106C1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 349D9610DF
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349D9610DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ijmR1877mif for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5048360640
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5048360640
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DDE786E12; Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 17:26:03 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 91c74b5185639f265fb1ffc47f5baff367dbdce2
X-Git-Newrev: 1cbb24f995401fd3fef1539443e17cb120e8719e
X-Patchwork-Hint: ignore
Message-Id: <20230913160323.3DDE786E12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gmp: guard riscv
 definition
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cbb24f995401fd3fef1539443e17cb120e8719e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

In commit 30997eaa65438a2ce726ad8a204ac5a36363f5c8 a mistake
was made. Guard the definition correctly.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3f46db39e62a5b84ca4cd938d07ca7aa49edfc88)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
