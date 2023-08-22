Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62846EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E860F61219;
	Tue, 22 Aug 2023 18:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E860F61219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doRs_QhvBWIs; Tue, 22 Aug 2023 18:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7596120E;
	Tue, 22 Aug 2023 18:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7596120E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 546DC1BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B47481293
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B47481293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kzQib9Y_9NUM for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79B3080ED5
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79B3080ED5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6953F86114; Tue, 22 Aug 2023 18:09:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 20:08:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2612d918f460f1855121ca2ae845b2d18576332
X-Git-Newrev: 6d8deb4b23ee57a69308bcdc5ceafa02aacc1edd
X-Patchwork-Hint: ignore
Message-Id: <20230822180900.6953F86114@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d8deb4b23ee57a69308bcdc5ceafa02aacc1edd
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
