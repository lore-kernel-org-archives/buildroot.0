Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D94D715EF
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 16:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1426440AD5;
	Sat, 24 Jan 2026 16:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORy1nFBDUb2K; Sat, 24 Jan 2026 16:15:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EE35409F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769271349;
	bh=tc4hDSE2kxWA66v6ormhKlI/yaX+BZU1q3zug3EuNJY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=elpOwsdzcgnXCH14nBK78wxshkSmGh0cxJlsfT4ErnlpH1GqEDnbqu6aYfHZST5vU
	 UqzRvR1OkXPg7Q9ejD59uWLahgpmuRQQWzplWbv6gZckAOzJSnAXUapBmWCbIZFzh3
	 7A7cpFi/czryYDE8r8ugRtW9u2ibw41fkykdw3Ozh7gJ2keuMkN7Fx27/C0aYXmofc
	 dbI2/Rl5/rQ0+Z15LnM5bglWWZCiQJA9KKZhSPLKYoe/ZfmWFAWQHjAKOz1Oj3Iq2a
	 p4ehsh+ZLkw8Ld0C84FBrrD2L8D7JvIpZitULOWaUTI0Bg52/UjtoPml2E5xFIVv1Y
	 ugMIWctmQUYzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE35409F7;
	Sat, 24 Jan 2026 16:15:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20F60358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 16:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEFBA81FFC
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 16:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UW3F8rnJpmQT for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 16:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0101481F67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0101481F67
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0101481F67
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 16:15:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-432d28870ddso1675071f8f.3
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 08:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769271344; x=1769876144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Li7EwRfzNS2L+Gt7ALW+4VNUkIm2sIT9fS0uNavfN0=;
 b=qKrsZM3QkTiPFmRtCKObfsreyq4WPx1+ywLBwzFmUVGnnjFm7+XlQscTVM68Wqe2Xx
 ieavYERPl3P0tfubqy4vtvEIvelmxa/M2IqixxJ4uwUb12QKZQUXgjMr91ReU6OCgcQM
 P61wU4S5Lmts3AWEpAPg60OizVmVYP2V05+j92CTdsrHHB8XrsxBmTivakUiFbtz/gSB
 IhUF8jTwEZpqFBo1kFJkMmskmH/elZyp7BKivI5yaksBgZKRx/LnEH+FQyM2v7PH1bek
 /ubUeNccAsOEnJR0NnMF2RXDFxnafiMbziAbXgGFplGBf7aIvcZ9Ds8uAuwcxuwviVxo
 F6/w==
X-Gm-Message-State: AOJu0YwuytFK2uah7DAvMTNAUqE2ctmvBEjKeYICIBbcEG8Ig8YcKpUx
 A4aLYVr4UinVJ3C1syzgIZgvHS4Tujl5CGpk41mlUnGmYhcgLec2D9+HH3mGHJ7/iF71IjpYftM
 alyW/ISU=
X-Gm-Gg: AZuq6aJ3gLxs2ocP7rCPCn+totWyyFWkSbJ/4TaBeS0VsX0Eavv/aO0SpQb/zedsrM8
 4NcJrZBR+aQKal45fLGcpYTAqBMljlQbmIpKkCyXH//RTxVlsG2WSloXWlnmhiIoINwI+IKi+rl
 emNVFAbbXvuHJ1ssDt4cEjaeNeKlXUkVlRvKHTmVIl3+VYgGd8gUftXoA0sdQvpugYUiW9+Fsva
 PgFpVmHeCHJMLBkgN4lMq7maaySMVoPzDSAbDBTRgofqHu3FvBTyp69jb1fxGDtCOVGwSL25YrW
 vXMsZe/EReSuvDgj/6bOIWw+S+DHtNFttSEA8MDZ76gdybPhT/k6vM9Ot7HO/jBU6U/NdSrQE5r
 p37mq92dVc9dthaw4fp1L42RkrBXrk5mBDNkGhI14CDUbq0+BFfK63xBAArytRX5VobmjmNoIHe
 E4y3it5GurN4jhDhHKDDZW2jfYuUXse3ggOP3ri51lhzN1Z9FtbQ0x47m9nBB6INDFTdma7kvt7
 UtA5tDv90X9FNtZMGImicthgnY0MOnZpZPlo0JckUjHFGQSk4EqS8/rhbOGLZm6Z0XQH69ozO9X
 54UAvVTN65c=
X-Received: by 2002:a5d:5887:0:b0:435:91ab:c6e4 with SMTP id
 ffacd0b85a97d-435b92f94camr9306215f8f.12.1769271344611; 
 Sat, 24 Jan 2026 08:15:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c02cd8sm14445344f8f.8.2026.01.24.08.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 08:15:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 24 Jan 2026 17:15:40 +0100
Message-ID: <20260124161540.2325660-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769271344; x=1769876144;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Li7EwRfzNS2L+Gt7ALW+4VNUkIm2sIT9fS0uNavfN0=;
 b=Z/C//c1HwZbnEWfcFF7VzuWW08/jHxW6HXSLSJjqlir9DVTs39dAZ06ujQMrIOTLbS
 glSdKKwW7BliB93QR9U+QSVUmYPb4pC2zLk4vkITBPjRDXOL4ET8/YCL43f9ornoZWs1
 WeD7RWAn+ImgMui4iOLyyI8TQmZQHM5RBVF3Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Z/C//c1H
Subject: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2: exit
 post-build.sh on error
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

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
index 49df4cd6fb10..ede1738ecbc5 100755
--- a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
+++ b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname $0)"
 
 cp ${BOARD_DIR}/nand-full.lst ${BINARIES_DIR}
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
