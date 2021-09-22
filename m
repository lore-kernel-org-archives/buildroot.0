Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27257C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:10:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 647CF611C6
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 647CF611C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D5DD40607;
	Wed, 22 Sep 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWtxvuRrftWS; Wed, 22 Sep 2021 21:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 592E740598;
	Wed, 22 Sep 2021 21:10:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AFF71BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AFD884032
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkxvUV-MkR_q for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:10:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEBF183FFD
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:10:02 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id T9VAmKknWnxSqT9VAmZQwF; Wed, 22 Sep 2021 23:10:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632345001; bh=Bc4aDwUNtM+Ay41NULi+N4rP4/e+RAgtdc2ruTBwXhU=;
 h=From:To:Subject:Date:MIME-Version;
 b=TqkKGfAlTgd9ZBC4L32AG1NdASBC59CeI1a65aWzHSH60vX7zRzKbuBkQMaFvsj5J
 FD2FtvnNhY+6sgdLGITzoq0nHh8A0rZPEVVyEa/C2mv8jJPBUrO+SxJcOUqize+nG3
 SUG5G+H826Y8vD8PMGuIhE4mytd3CmAqniZ9NxsRyByPSmBm+sxL/jVK2HzBd6d5sN
 aTmI9QfmCXz5Ao+CroFZv+t0SMXsw7+dKeUrtlLcQZclLGkCpZ/qA+ly60ISNer+8H
 jc5qQa92dyyRDXwfkZbh5nvN87PP0c0FHX25gk4lbdGMnRYjvrnOrfTCaLdpfZQSBg
 pojrUP+iTE0Lg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>,
	buildroot@buildroot.org
Date: Wed, 22 Sep 2021 23:09:59 +0200
Message-Id: <20210922210959.3604227-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfE5in/duEToptSMQue/fwWbEVY0a5g+pGHj5xv2v+rq99BTcg8rKxy//5uWYv0ZtYr6YJpbM/VmSqKBXpNAgXsMx8TG4volEIP29ir6Jsb904aKg8hHr
 AZoBsTl0Xi5mJh/crdVgqWOAJpV/sQpROM/uCsgegkwitgzsnNv0V8VGoKBr1NzCFaxaW4TkRWaW2lgL/LH/yp+/IkJfztSORWtpV62bAudI+BwWpII181/d
 dhLbJHTWawl8ccrN/VsPh4inPiBZ4cWZvSmbp+ZuwcRDvrcxchUm0PmSWGfmC1QYlv6KpDGhRJbA1R/HisX+AXbB8smrPXAwPwN9JqTHKDvhdqoOhUbe0mer
 ywFKr0us
Subject: [Buildroot] [PATCH v2] package/ffmpeg: fix build on mips
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
