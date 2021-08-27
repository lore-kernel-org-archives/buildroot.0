Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CC4C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F4FB60FD8
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F4FB60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64A083FA1;
	Fri, 27 Aug 2021 22:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQ35H0b_zVGE; Fri, 27 Aug 2021 22:35:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B343A83F8C;
	Fri, 27 Aug 2021 22:35:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5461BF3D4
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20D9E40872
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CZblWOJYRJV for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 22:34:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02111.aruba.it (smtpcmd02111.aruba.it [62.149.158.111])
 by smtp2.osuosl.org (Postfix) with ESMTP id 169E54000B
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 22:34:37 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.145.219])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JkQimYAQuqG1wJkQlmHeIw; Sat, 28 Aug 2021 00:34:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630103675; bh=MWkly/pt+9zI4PlcRzDZPEEs0mNDYuLVidYIWlsrhGw=;
 h=From:To:Subject:Date:MIME-Version;
 b=MYgFNcWJHDxTdJU44TDq7U5v24zMRhdv959Q8Cc9Us8/PM8nWzyvQolnOiT7H16Yd
 y8wM+I6YNOyVXJvkhoTeMNDuAwJ0PvprTlDSZ3oZMSLrNxzbSXtpwWC3J0yAuerqAd
 VC95hLvH5LTs8ZuhK18FD/bEToHqSvKOAwJG80QneStsepbZJsY42NcTvVkhaEtyQ8
 CVR/HYFfO/yY8fq5Ru2hPCg5nRq8F32oDJvcwMgPcgka42/90YaC1triSe7vccCR5f
 ox2KwOpSk7E+gI63b2Ol8QNW60eT5cEndmvRBlNSJc5wWduJE+7geweM2oZtpJfI/m
 GMheMTsHdqgZw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 00:34:31 +0200
Message-Id: <20210827223432.1961888-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827223432.1961888-1-giulio.benetti@benettiengineering.com>
References: <20210827223432.1961888-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAdORCbSwH1WuyLrxMEl1AW61pQeAY4OTkoBSw8pIhLZmT0frHxrY8nk18wUnykPydKR2kIaRHenWG804ZkYenlIyZ0IlbcKEGH+PFixuoOwyauOw97m
 OzON4pFmh3WhwH59KRs9REDDsr0hq8KQXmFpWHFT1yzbNrECJkosmmNXTm0YFQlgMNZomYdwpkz3IfV7gJDzcIZBud6Ad4vfOay8MF0ZoHwD2XGzFyHYBRnE
 h1CvJl6uqi31Ya4xbaeYI8SzK5I5P6swaUghM9YH88Jh4ULXDSQDglKKOMkgm3yPnkzOJAwre1SNjcwhhJHyeI7so7GCupCmNYjI9u/5QUYM/SIdxS45O5tV
 dVV/qaEAb+L9tYk8DEe/Hx2iXryLKqoej2byCLgDHD6fBuvH66xEPP/c/7fp9IX6iJ5hh31z
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_83143
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

ruby package fails to build for the SH4 architecture with optimization
enabled with gcc = 9.3.0:
http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/

It's already been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bf2bb3efe4..4419443930 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -133,6 +133,15 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143
+# Error: invalid operands (*UND* and .text sections) for `-' on sh4.
+# This bug no longer exists in gcc 10.x but reappeared on gcc 11.x and
+# it still not been fixed yet.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
+	bool
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on BR2_sh4
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
