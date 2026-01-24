Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB2BD715EE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB6E40A9D;
	Sat, 24 Jan 2026 15:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oyf4tu6L1Lju; Sat, 24 Jan 2026 15:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B49F40A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769269454;
	bh=W+6Ge5sKxzKidWsnT91x3JnGj6IrUEopTSC0GS+1QlQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iesnVlHFCr9MB8tLIvr1bmULc92/aOKrhP3ZW5NOKh2trOcM95H6HfBXjn1RyWT6Y
	 igvEh/COie3o/1IzoOcWvM5yua1Ax4NqAQ6yNcRt9nTYL8ir9dvJIBlkKQfXR56joI
	 nUTB+rDre8/Sosvk+MglKyU+t9oxY+1nJrDf0fK7BZ69GC6Zt9xTsKQqQhUahNrSh0
	 1jtLvY7yB5B7m+Ox5M6QNiTCaoWADSAYs57swy2WFLz5Vzew7JsBMFVpJ7+WVwipI2
	 qcXfnl9FDAi4tVv7DGzXqrJncCryjzx/TGu2wJq98Qi9n0qT6DbAjdSzkR8MRo5HjK
	 Er0m0+9HSCIig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B49F40A4E;
	Sat, 24 Jan 2026 15:44:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76E91122
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6626B405A7
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-odNLLXuZMB for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90A0B40168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90A0B40168
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90A0B40168
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:44:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso26540875e9.1
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769269449; x=1769874249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9bs3JIp20AG24tyOY9aSA9a3cUwP1coECoaRVX7+tg=;
 b=NLoyDEwS2p1WyVxJqF910EZhjdcVzb1knfrVNcQLLQLIqFSJMuIyCOTqtlPkY1n/f4
 +Og7xNI4k6MJJvxnIdFr80e1+5GtDWdVROaJFNA7vEqTI2NrHDVMiYYGRsriaZMzuiDh
 T6sgmu9ch4ol4yDICiCwF/frEQ4uaZUYVy7qaKgKP5dFhsfdT2oqXqjbY04xY4kEP1Qt
 hDY9nTDYLzdgrNAB5c0j2VjkraGqKq3MKP5mW7Mz2+JRCBr9tUKiaV51AAjAs95mXIVX
 CKXVvyPGB6Y9tbTqF5ha6OYyyeXcIiKazLjW1NMMjZaYveCXonMeNDTxiBhMRUfKboX6
 GVGg==
X-Gm-Message-State: AOJu0YxOMapyLhtjVp5MKVMFy1CGiR3EK5OJtWRZCesgoGa2rv6HS65F
 Fc0b76717mfnyMn2u/+YeZJERlTQ0/GDAxSG3H5i/Mgy6y9AgV2Bxy1faTt8SyUxG2X669oKwe4
 UYvb0
X-Gm-Gg: AZuq6aJlBFDldxWmqsuFwcRU5Oa91RNhpSIbBO+CYWrVWq4JUftbrgAy4aOezIUMjr3
 NDtuBRPlpXSDH+ZfclDu3GPwkvEH0+jhipWMjw9wuGqdQKTZ33EAD8Zb6r8aHC+E534fYIl3/1o
 DQ2Xwoz/MNKEO/oOKdieVK//iKLhzd/0ZrnOhsAIZF5MwFDfto4g5EafExIt+unwtpzyJXOAIbL
 gs9foZd3E/DpyCygfl/JIzl5+e217V4GdnVHxGO02ktpT18W1a9wtEXvlDfLb02H/ctrlPoU/X/
 LM01SkbBI4ngWkXOoDw5Gg6WECteg/kEBZn7TGH2rFStD6ltQnDtzXczl7sVUYeRspqBcWbz+FY
 8/OZA1zFgFZXa5qwqjWvPEBFtSYaVD5BS8IsuWkNJU9OLM7/nxuZL6lvWBRc3E5bEIfhymVfFK/
 5X3OqazNwRVuK/pzH1Fqie3bpiOtLoZiwNxEtD8jhWCrhs9jNGR7LjPYGk+lCzEjuBmNjoPqwpT
 2g7VADZIeYYJDYuTnmXrdVilEap7K8SqNqTKWslSY2tAOr/JrrNHMYI2oKXvAFCnjHSBgxV0iYI
 6xKBynApTpk=
X-Received: by 2002:a05:600c:58d3:b0:47e:e48f:43b5 with SMTP id
 5b1f17b1804b1-480470d4b5emr112824815e9.18.1769269449466; 
 Sat, 24 Jan 2026 07:44:09 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d8a5b67sm125787005e9.10.2026.01.24.07.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:44:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 24 Jan 2026 16:44:06 +0100
Message-ID: <20260124154406.1093087-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769269449; x=1769874249;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d9bs3JIp20AG24tyOY9aSA9a3cUwP1coECoaRVX7+tg=;
 b=WOiI3nKvTsNOg/RjLfjx2bC7ytXVjR3GTT9KVDfbHlAZogxwGbxV7m8/aiEh5VrDfS
 3JVM5lIap1JmfIpSivJnORoo5HlqFQa2u0vJ9hKMsZgu/VihrCz/D2shr0+DJPtDl1Ke
 bat4nZ+41wWIYJMI/tgthttFUGixVaOE3llH0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WOiI3nKv
Subject: [Buildroot] [PATCH 1/1] board/bsh/imx6ulz-bsh-smm-m2: exit
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
 board/bsh/imx6ulz-bsh-smm-m2/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh b/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
index eac82cc22af5..4a9bc1cfd50f 100755
--- a/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
+++ b/board/bsh/imx6ulz-bsh-smm-m2/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 cp "${BOARD_DIR}/nand-full.lst" "${BINARIES_DIR}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
