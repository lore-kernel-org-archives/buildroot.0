Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C6FEE57EE
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 10:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F42460A8A;
	Fri,  8 Sep 2023 10:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F42460A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTpaqEmOiygv; Fri,  8 Sep 2023 10:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDEEB6108A;
	Fri,  8 Sep 2023 10:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDEEB6108A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81BA51BF997
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 10:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5397C401AD
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 10:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5397C401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtacc2Xy1ZbG for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 10:11:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E95E40042
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 10:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E95E40042
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C46886A99; Fri,  8 Sep 2023 10:11:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 12:09:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9204d644a9e81bb51b938a4fe09f7ff9ea5e974c
X-Git-Newrev: f9abda63520b0b2c14353af90b9b6160d4fadea9
X-Patchwork-Hint: ignore
Message-Id: <20230908101118.6C46886A99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gmp: fix !RISC-V RVM conditional
 after merge of next
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9abda63520b0b2c14353af90b9b6160d4fadea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was added both on master and next, but the symbol was also renamed in
next by commit cbd91e89e43d6 (arch/Config.in.riscv: allow extensions for
generic) and resolved wrong.  Ensure we use the new symbol name.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmp/gmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 33399f5166..bd401c6a80 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -21,7 +21,7 @@ GMP_CONF_OPTS += --disable-assembly
 endif
 
 # GMP needs M extension for riscv assembly
-ifeq ($(BR2_riscv):$(BR2_RISCV_ISA_CUSTOM_RVM),y:)
+ifeq ($(BR2_riscv):$(BR2_RISCV_ISA_RVM),y:)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
