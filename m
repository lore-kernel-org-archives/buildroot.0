Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392DFFF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 14:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B1242A5C;
	Thu, 30 Apr 2026 14:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMf_phoudQd0; Thu, 30 Apr 2026 14:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 335EF42A59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777560770;
	bh=yYPoquwlL/TER0O0iMk+IG4fJGt2lA6xr4VkxkttjDA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d+283POKJo32FQotdmkvXeWIRQ6FTnO9dp5xTumZZAVmcNTHPq7aE4BA+NQjBzr1N
	 ix6TJzu3djeRA5DltdjsCA3TrZ/T3wBi5t3PpcGYhrZuniHA7vMih/pkk8EtQ+zeCo
	 3sb0BLWL37MPISfGRbckGYIW7DDRo/EQ984/QI4/P1lJ9YU5e+65c34OHsasmdaZfs
	 E36+Pu1btEPf7wVUN2P8oFd82URBxDSvwDMCRvT4e9ZzEcPo1+7nhok0taryZfESsl
	 TqAx9DqnEJeFxURlQVRDe/6iuH7QjTe3CI0of0f3nYQBFukTfX9rSTiMCV1Avcpbcv
	 w4q4rF3n6BvjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 335EF42A59;
	Thu, 30 Apr 2026 14:52:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDCFD18F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2E4984556
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMxlhZtTdQux for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 14:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54AC084CE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AC084CE8
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54AC084CE8
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:52:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ISkvwuKDL5gYjISkvwdMxt; Thu, 30 Apr 2026 16:52:45 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 30 Apr 2026 16:52:44 +0200
Message-ID: <20260430145244.1804343-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ1u4JpxLbxubsFNtps62qGagqLiBqprY5B40oereai56qrUCs9iKY2lHpt6p+XTrFrYsDgo70N6GbX4W4Aeead+N0Kw3KrQCxBi7unk0a0SIla/qFMv
 m0ETX+Hps/9McQ13eB+mgSTZgSKyTKqZy/M5xN8JkjNX4kRhitNF57jjsdqBJpjjqsGwu2Qr7m3K/ek2u6iD0dkOA7dlTy90Rw9dwd6shYfK8N/Zud6biZQ9
 zUL0LN752qjErWVvm1ydhYDAvpWfF5BWW8iOyJF79S8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1777560765; bh=z4QX3/vBO01MAppYg+WwheLR21gFxabWj4cVuds5OHU=;
 h=From:To:Subject:Date:MIME-Version;
 b=Aw9YwczMvSUqro2uwsRoV1JLKbdIp5HLW4VSuY4xtUmXw8YKoJ9/re3Hh4FxCL//e
 2AeJZwfvBjrAWfwSsO4xMtEC7HcSbroyBFcN3QGjPYmMR5BZSfymd8jcOZ1UFaSkIy
 f8dBWJtwHqLv2DfItcPMbSvq3KSoEd+4p5UlDMpICSaPVOiKjo/trLH1CAOBZ8deFn
 juU9iynaqXkNk6AsGtyRHngpUgBLwRjf/AkK6imt78BgBVJDGi1/iCDXDWmWvtbni1
 QLfb6Kn3CAI5Zcwa085NW7NxmphRwkpVInCqx56Kf43fx6eWCT/cSl5aDuHStIlH0w
 uR5uUgPvu512Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Aw9YwczM
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to wireshark
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 039fe6604a..e5bc6ba19a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1339,6 +1339,7 @@ F:	package/udisks/
 F:	package/util-linux/
 F:	package/vim/
 F:	package/wilc-driver/
+F:	package/wireshark/
 F:	package/zlib-ng/
 F:	toolchain/
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
