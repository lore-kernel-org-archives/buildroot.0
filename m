Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235C4C021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 07:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C5C40753;
	Tue, 18 Feb 2025 07:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJ2Yz1rp1HFt; Tue, 18 Feb 2025 07:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A7F7411C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A7F7411C6;
	Tue, 18 Feb 2025 07:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C070EE05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A599581329
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYQ5xe3ZdH1j for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 07:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEBD68214C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEBD68214C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEBD68214C
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 07:57:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43948021a45so52943895e9.1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 23:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739865460; x=1740470260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=THY44zlEzSJ8ytTmtmQC6hWUmppiG6LubBkaynV0/Ac=;
 b=UCHFaCvS3YLC0ji7HGA9cQ7m9teaa2FEI+ZkRRXSGUVGQUXPA+SkNn+e/0Wz75t0hf
 I7HVs4F34q/9GH7bet01OnXfC2o63x44Tt82MVR2ybsh6gP7PKty3ViP1am1nwMhWtEi
 JIznG3MoFDaXpjcAMFSsJQFu5YrWU8RHcvcmKLTrrbonYrmU40L2UwoP2Epv75kPU7Mq
 gcK99o19OtyzEXG+b50c4L2GlsHJTGWxJg9HhdrilIt0qho4U4RKOwoRvyREVc99utvX
 cH97lfJRfcVi5sZuA1xZIWlqlEP7ImYBzke3DpbeHgg/tWQAc2BWgqLEfAOGujM3ZH1x
 zF1Q==
X-Gm-Message-State: AOJu0YznlBVl/+LLY9Tplotd+TezxiUy/NdSMHy5sYvSHuVd6z2GeIgR
 Cf5k9qHZ+Ln+kt5DXDLkoJW4s5gAKuR9J9NSpYeD8rbcvgokY3OvmGktRQ==
X-Gm-Gg: ASbGncvbkFBUvPppJdHjdBLevYUXZTiLhtCbTzPcXhd1quvTTDOFm7Lz5+BhQFlH9h5
 jG9yCTomZSlCZUhX3vpEsT1QPh2EANMQbKqwnz6cHu6OiRF+1ozHme6Dz8cJ2YZMsIWuzvTi4Rw
 z5uFl73NnOuTAKcj2+Nasjuo98A4RBCqssa6GPhU8ES559pU7HJ8OXAAQlVdAgryV55212Qsszi
 yc7SmOx1uchkNvkPxnhwJUz50dbrAcDXToaYEmeiRhiZyl52XGCqNEOfiN4vcxERe27Au6muBAS
 ouyNOlrBdCeE9K/8LQafSSVhRg==
X-Google-Smtp-Source: AGHT+IHdFIn6Afanmd+J5dZvL3HyYK3leT/KRD7yQcbuxQu54cXIKf5zPxOSSif51VHnVPVzSEttVg==
X-Received: by 2002:a05:600c:1c26:b0:439:6332:2780 with SMTP id
 5b1f17b1804b1-4396e71af3emr105978545e9.27.1739865459644; 
 Mon, 17 Feb 2025 23:57:39 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm173722215e9.36.2025.02.17.23.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 23:57:39 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Tue, 18 Feb 2025 08:57:38 +0100
Message-ID: <440f9b3dc07974a53857fe6faf98dcfff511705e.1739865449.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739865449.git.yann.morin.1998@free.fr>
References: <cover.1739865449.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739865460; x=1740470260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THY44zlEzSJ8ytTmtmQC6hWUmppiG6LubBkaynV0/Ac=;
 b=DjrY/adr5Pb592Jq2Kx+2Uib9OxSyIi054Qtpy4AGOF8t5FtvN5hWpia5w26mwQxlJ
 NRzyl8SaNfyXj8NGoGugX+b8e1wVZi24QcvLNX8airE3n0flavQ+6w40lALWfUC/4OIi
 mZEB+JB05MrZiOHv+fBGoMa2xveQ+rjVpR4zSx9t6NelR9YR+oYYD28UBCkGEakpmLOS
 7Gr00c+PHMm50fvUWFrDGvwD+IZ94rQQiHqPJC1DR0iDqCfgDgSLFONxmRdsPdRiwsR5
 CFK4mEfIrDD+ypGqJ4PQDU/6vyMQy2H4l8itnAkKbDjHKtiUsSoIBNHhiaslTtySllaL
 OnBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DjrY/adr
Subject: [Buildroot] [PATCH 3/3] utils/brmake: simplify redirection
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

We want to redirect both stout and stderr to the log, so just do both
redirections at once. This simplifies the call to make, which was
inherited from afdb545b2847 (tools: new tool to filter the output of
make) when brmake was using unbuffer (and even then it was not entirely
waranted to do the redirection that way).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/brmake | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/brmake b/utils/brmake
index 4b9179e415..a4b9e7fa71 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -7,8 +7,8 @@ main() {
 
     start=${SECONDS}
 
-    ( exec 2>&1; make "${@}" ) \
-    > >( while read -r line; do
+    make "${@}" \
+    &> >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
          |tee -a br.log \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
