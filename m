Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB8D715EC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7E5740746;
	Sat, 24 Jan 2026 15:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ccfC4fNv1nJ; Sat, 24 Jan 2026 15:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C9FB405EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769268593;
	bh=b/NX1zTM0DXUt+moXqUC56BXn5yeBFboveKX/I747Dk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BYaqwSi2GW/36CIr7eAoGI1IZ/A+OPmy+ze6Atr6LpiWUVX63XA4jAs+kMjEcjb3c
	 lKLX3TUl0ndb0lUBT+DcRuK3omSqjoeQN14S1kuq5XUYYYyyIrSmc8+PZpr/fZZI49
	 rHGL8l+Btcjia0ATxbRNEVrO9Pk83rmdJMjtxKP7Z3O4ZtiaeinrXL7MBc77Reg8wK
	 YR1+qcmnIuDfR+2m47RmgNaeXv5X5SwcAZM8YahNrFXzn/l5UCMQL6DPZrXLvbxZ5M
	 K6BnyPvSPMcxYoCu4SGnbt+1gqlCzEQZq883XNICuZJtNnBn+/OTNM0iNHPX0PXxvp
	 DsxggbEJ2hjUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9FB405EF;
	Sat, 24 Jan 2026 15:29:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89168122
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DB3781DEB
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ey44kscaJVDJ for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78C5F81D67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C5F81D67
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78C5F81D67
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:29:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso36140385e9.0
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769268589; x=1769873389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFXNuwZj/8jXOlnYvmT6FJyYjZqk9kXz6dN2KckUW2g=;
 b=C4SXAaUeZ7EsuL9ZBgDpzAaaWGmGHXvdueBpnVN5t96YCHrmWQwgu1WTSt8g+yr/qk
 W5KGRUnpz76Oge8rPNoQBbNP2pkP/DI4ywSEHcuowMpnN9qeNjlZCRTlLUCkQyKub5f5
 WGl7EFDSJEbwh6BHMDKyGYEgIX9hS/pNn8ZfhUPWBXJR8alKv2LO93NJVjDEya4dw/ZK
 qX5toOONzUZ0xnaoyptBWeCQwSNAHYLLmigCFy10d/6ohaBnXYsvzjQEfKf/6yja9rZo
 bflGsczMs1UU7SLB74oAoB0Jpoo6IuF5nrO/A24NpGTsfdQx2bV9epDp9xabl8fKygKa
 VutA==
X-Gm-Message-State: AOJu0YweQ2vtVQJtwoSOBo0dJHckFLS6Qrl4i8ArYMyxvjzc1jJO68k4
 gqaCzPN+z15Q7Td3DMt0RCVXhlf1XQSrrfOhqo0cGpdcCvLRttbK6DVmRBUzdFqBpqVVlJw3yt/
 jANIV
X-Gm-Gg: AZuq6aLbl/OUKV+BizfMCIlL3I4mPrXxFbirFdWsfT+ZpfsdzZCABguRhWCM4ICsoSX
 UWAJIJDUqLhn2D1T1nGHQc+fg7lSGx+0/ZoImbF30G8ldgb6G8bkQT4XyHQD8z8/sn1KOmUTa/H
 wsMSXjC2lrJ+Rdk6GJmFcuH2jpwQ0iUzVMktdsWq4eU3hi8v3o5ysfjMnT83017cnbIEn9+RWfl
 +qfXKbOY24PdCxoeECusVGj+44eG/46jFqFIyakAZ9sb5trfM9xzDeNTjY9p6QANQbu5VpAMZ9w
 l6+3FP5ttaknXzaJhJUIhrlBTwxvdw/xVxUq5X0hn7pEYWe9dD3AgRJ8n17clOHanEGKOUDOsio
 qJ9AFK7WLZZqN8R3aGRILt7NC0/o80yiGKp4wFhfoq0uX8SGP8i2zzsd3UPLOG5TSR4T8+F51CW
 AwNPame581I/8IJ7y+QT6hXcoqch5Ys+XUCXKFbNBsGqzoA6ewt8Be7x6gKIJZWPTH+tvcd7GTk
 9PglvCH8O+ges0dvu5cu7U6ZzCCCIfnm8L8EeGawxMVUjodcRNLttbIGyT1OyCmsVYFwE+7IvmZ
 GhXcInIwQF4=
X-Received: by 2002:a05:600c:8b81:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-48052773f9emr64751225e9.11.1769268589134; 
 Sat, 24 Jan 2026 07:29:49 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d4f8417sm53068395e9.2.2026.01.24.07.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:29:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bryan Brattlof <bb@ti.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 24 Jan 2026 16:29:40 +0100
Message-ID: <20260124152941.902168-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769268589; x=1769873389;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iFXNuwZj/8jXOlnYvmT6FJyYjZqk9kXz6dN2KckUW2g=;
 b=ok+vM4vXIOnsepskEOuyYcJFQaHCqU+ZK6P6qkXF+Ftu07slr43CvfMr7FTPT+BD4X
 Tv6Pl/8cGXHBEafrzRSulxtV0QY4/bP8etTj4Mj5cxA12Pwv0WeJm/IFoWjNlCRT+L4T
 dbRDLCij5v0q86OQyB9hJZa4LFQMi4SPT8pSw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ok+vM4vX
Subject: [Buildroot] [PATCH 1/2] board/ti/common/am6xx: remove debug flag
 from post-build script
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

Remove the '-x' option from the shebang, which was a leftover from the
debugging phase and not intended for the final submission.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/common/am6xx/post-build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/ti/common/am6xx/post-build.sh b/board/ti/common/am6xx/post-build.sh
index d066e28fd0d5..e3ff4d7f12ce 100755
--- a/board/ti/common/am6xx/post-build.sh
+++ b/board/ti/common/am6xx/post-build.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -x
+#!/bin/sh
 
 # genimage will need to find the extlinux.conf
 # in the binaries directory
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
