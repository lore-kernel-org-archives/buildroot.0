Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41CDC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:37:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0F1610FB
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C0F1610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E6D04098D;
	Thu,  7 Oct 2021 07:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eKe1HwN53Ru; Thu,  7 Oct 2021 07:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E8C40991;
	Thu,  7 Oct 2021 07:37:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D83D1BF48B
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C68283F27
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNNzW_6P86xH for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 07:37:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638F583EE6
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 07:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A6463918AE; Thu,  7 Oct 2021 07:34:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 08:32:11 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: ce38b7bff443a73339b2ae008d3a41bb50f98041
X-Git-Newrev: 3554ee058fa928179aac1cd737ff43f8a054438b
X-Patchwork-Hint: ignore
Message-Id: <20211007073449.A6463918AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ffmpeg: fix build
 on mips
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

commit: https://git.buildroot.net/buildroot/commit/?id=3554ee058fa928179aac1cd737ff43f8a054438b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

mips_32 is not supported by ffmpeg and it tries to build with loongson3
SIMD support that leads to build failure due to:
/tmp/ccFO2LRa.s: Assembler messages:
/tmp/ccFO2LRa.s:15314: Error: opcode not supported on this processor: mips32 (mips32) `dmult $2,$6'
/tmp/ccFO2LRa.s:15316: Error: opcode not supported on this processor: mips32 (mips32) `dsrl $2,$2,32'

So let's --disable-asm to prevent using those unsupported opcodes for every
mips architecture according to Arnout.

Fixes:
http://autobuild.buildroot.net/results/f01/f01d9cedec8e1b371308d0f7af561a75883fa27c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4e822fcadf409c3eb4e721ad6780117ef77f45d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 8ff8ea8c6c..b3ce4c0656 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -507,10 +507,8 @@ else
 FFMPEG_CONF_OPTS += --enable-mipsfpu
 endif
 
-# Fix build failure on "addi opcode not supported"
-ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+# Fix build failure on several missing assembly instructions
 FFMPEG_CONF_OPTS += --disable-asm
-endif
 endif # MIPS
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
