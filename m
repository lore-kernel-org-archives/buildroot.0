Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D03CA5537
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A135081D2D;
	Wed, 13 Sep 2023 16:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A135081D2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wi1IL9Jw-vUi; Wed, 13 Sep 2023 16:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6FC281AD1;
	Wed, 13 Sep 2023 16:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6FC281AD1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9AA1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13A4340151
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13A4340151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8PFj-6542MX for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45590416BF
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45590416BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 317B386E11; Wed, 13 Sep 2023 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 17:26:00 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 8f1bc63d5b68b4be73744a4d4a05b0ff1bfb6101
X-Git-Newrev: 91c74b5185639f265fb1ffc47f5baff367dbdce2
X-Patchwork-Hint: ignore
Message-Id: <20230913160323.317B386E11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gmp: fix compile
 error for riscv
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

commit: https://git.buildroot.net/buildroot/commit/?id=91c74b5185639f265fb1ffc47f5baff367dbdce2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit 6d8deb4b23ee57a69308bcdc5ceafa02aacc1edd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmp/gmp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 9b402767fd..3b732dfa71 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -23,6 +23,11 @@ ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CP
 GMP_CONF_OPTS += --disable-assembly
 endif
 
+# GMP needs M extension for riscv assembly
+ifeq ($(BR2_RISCV_ISA_CUSTOM_RVM),)
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
