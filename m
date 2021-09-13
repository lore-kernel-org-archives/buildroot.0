Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B43C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04509610F9
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04509610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2322401F4;
	Mon, 13 Sep 2021 20:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_KYQ-Uo9s-l; Mon, 13 Sep 2021 20:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C1040135;
	Mon, 13 Sep 2021 20:45:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A44541BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A067B40302
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owqP1uSBdfBi for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:45:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1A8E402F5
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:45:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PsprmaZ0unyXHPsprmPCxU; Mon, 13 Sep 2021 22:45:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631565952; bh=dFtLqJ1rFur3/a6m54LKyLn2YCWVF4P+mSAA3nk/+DU=;
 h=From:To:Subject:Date:MIME-Version;
 b=N7+xoiGgdgKtlQsiw9Wj+g7V6PjwM+2/ZUpuWVJQq/+YrGEsig6tN+dUCqwXZgHde
 gu8EOicQ4JjFjGKS/IkZYZsagjCVP5/1nYL3v05EiQTaTdlv/2t6gYmixv3yznCT5P
 VyA/HuwfsHL4XcNAQ3bxcpBosrlNKol14KAsGJaAxwCd4zKhgcwzKC4u9WHVqtIn/n
 dXXjOLYsMSji7DW36VMRyCAkLm29wDat/2FqZteiwn8Gssk0kXsJg2ZiVYK1gXZa6x
 x5o4pryuKdS0gPrBJ6N+tO1gpOjpJW2yxuWNujXjPsywMmfX7PL/uslrE2FaAedTGg
 Del3PYYxqrkyg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:45:51 +0200
Message-Id: <20210913204551.2328033-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL4Ud7VF/Yr4uQy7U1m5f+3SwTdDbTPPknf+IzFVC5lZIbk3eb2sxRfxsizamyp/vIW/AqU7VCgwyrCwmXcpwyS0H87SLgpvfD/8XruhmydQpjlLu9Hl
 eAR4iZZ83qrKhayMDT5xKqmx7zymS8go2Oe+jhE0xfvsO3oi/HNY/k6HIR45s/3QEeqqCljpFqGOBH8lZcOtirL7DMD8N55oLmSzlL1NyhdgRl7LZyamV5+v
 tuTkfyW3VM6ttbrpp9bGEiWBJOeTRXoh5AxzXmqXgjCBal+6fOjumdz86a5jdSy3384f5s/6v9i3mccuCWLbiWPNZrfMMHX3fbRbRVgqV60=
Subject: [Buildroot] [PATCH] package/ffmpeg: fix build on mips_32
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

So let's --disable-asm to prevent using those unsupported opcodes.

Fixes:
http://autobuild.buildroot.net/results/f01/f01d9cedec8e1b371308d0f7af561a75883fa27c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 8ff8ea8c6c..5e405d0f60 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -508,7 +508,7 @@ FFMPEG_CONF_OPTS += --enable-mipsfpu
 endif
 
 # Fix build failure on "addi opcode not supported"
-ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+ifeq ($(BR2_mips_32)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
 FFMPEG_CONF_OPTS += --disable-asm
 endif
 endif # MIPS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
