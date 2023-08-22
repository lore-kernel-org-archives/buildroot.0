Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE476EC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872A683C7B;
	Thu,  7 Sep 2023 15:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872A683C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXR62f2uH4Ev; Thu,  7 Sep 2023 15:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C6B83C77;
	Thu,  7 Sep 2023 15:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C6B83C77
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 052291BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1C3641DE1
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1C3641DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06q5MCgHnnjI for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C205C41DF9
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C205C41DF9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA14186A21; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 20:08:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06702c81d3ce70dbba1d6a733a95bf13a3cff0c3
X-Git-Newrev: 97c06c5b593a05716a3bd8941d2e208fa592cb38
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.BA14186A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gmp: fix compile error for riscv
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

commit: https://git.buildroot.net/buildroot/commit/?id=97c06c5b593a05716a3bd8941d2e208fa592cb38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 87b2a30319394c2cc79efae1af7833cad8c62b32 gmp got updated
to 6.2.1, since then the compile error exist.

Compile error looks like this:
tmp-mul_1.s: Assembler messages:
tmp-mul_1.s:55: Error: unrecognized opcode `mul a5,a7,a3'
tmp-mul_1.s:57: Error: unrecognized opcode `mulhu a7,a7,a3'

Patch should be backported to stable branches.

Fixes:
 - http://autobuild.buildroot.net/results/2f2/2f2112bea73adbf49eabb62fe6cda6a9cd5d0567
 - http://autobuild.buildroot.net/results/566/566a4945555b781ed127997176f73b3c17ecab5d

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gmp/gmp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index c52a5214a6..1a50b0bf69 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -20,6 +20,11 @@ ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CP
 GMP_CONF_OPTS += --disable-assembly
 endif
 
+# GMP needs M extension for riscv assembly
+ifeq ($(BR2_RISCV_ISA_RVM),)
+GMP_CONF_OPTS += --disable-assembly
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GMP_CONF_OPTS += --enable-cxx
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
