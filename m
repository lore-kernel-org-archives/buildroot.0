Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07350CA101C
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A80F684CC1;
	Thu,  4 Sep 2025 08:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJ4_BSJV9cES; Thu,  4 Sep 2025 08:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A8984C34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A8984C34;
	Thu,  4 Sep 2025 08:22:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDDF3106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 08:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C505E84C34
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 08:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsskKKN4iYqa for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 08:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0164847B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0164847B2
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0164847B2
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 08:22:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45cb5e1adf7so4418905e9.0
 for <buildroot@buildroot.org>; Thu, 04 Sep 2025 01:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756974136; x=1757578936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnaZzfU26X1lXFRqSF6KIsHL7sH0GZ5ANDHJXRMn9uY=;
 b=BcPXGoAyqnpge1eveH2Y88c9MO+k04dGt3WYhWB7WEXhMZOf5TdvVAYQMPwIF5GUnT
 EtXeBT4WqcOBXEmpgR+qr7j3X3spNkuQqdHQzot53JrSl+EDjlBUrWVrMNL+4FHpgein
 UiWUY5QqVExss0CV7HSVAsXxad7mt7iY9zKh2M9PT7bWXb7SocE7LTcTG+brLHNegwZj
 iJE8KuHJn/3hZZKsGU0Xu2Z2nx5IuTTr/9IH4pcknr2SrW5GuWqOIit4mv0jzmPf5d0B
 1Cbcym1toRHyzrnp3ca9OT9Ari68zdBwQyYcSGVT/I7+2o6/JE5X/teuQgFH/ImJc0Cq
 ImpA==
X-Gm-Message-State: AOJu0YxjemteIh9iAsz5RTBLUSCxsVBzS/aU/D8qIxg7BF1kjJ2OBpft
 kE9CYrWO7fjaj+MCrbPfl2FakC1CaHKuWOU1z41NR5ySBz+PQw6fyICOQaVc9DmeK5EqSlLsPfX
 gB+3q
X-Gm-Gg: ASbGnctJOoBSX7kX1N7B/wwOYonDnMgXVA1pgRtAzjs8dAk3ejGNnGOn6vBM+JCsirE
 9PND9CeBwDw2qZ3zdAHgkCuwpVP2VBPt1tUo5+uG9PzSd38bM4ZmE3rM7fJMMuLB1bZJX9TZdjR
 cGWSS8rfwkdLTHDEaMiERvzPMLjLAgkMimdty4OP9bMG2dL50E8FGevQNc2+zAJxFnHrYvUR+Gu
 zKDKLNusrYam9O0cmb+mQgsLMyXP+gj6ZxiGIlFAEx9n7kTaHxnZsff8IUlQnyR00KIi+mj9bGV
 MToEpOMEpHdY90HdFzEveDzq96fhtI2m9S8LijsW8g0tTSlWSsEUknx0TZKmXb7gYcB01tIGMKJ
 R/Qdw0JocdjGPmsuDJzW9WHi3PmLrUuq3GR/d1Sv9Lo4IwrPKFEcO/3my/ok5MGREA64D5INdZo
 jB5FpgOi2lmJ1CstCKVYMeS7F60qkOcWo10rumOCMAbbM=
X-Google-Smtp-Source: AGHT+IEyzD0aHPuLu6sWJBukV0SZ9ca73UpfrGvptTjYyfBEDX7BCnMYyJe0g49CHJpAwyUJEzS21A==
X-Received: by 2002:a05:600c:3153:b0:458:bda4:43df with SMTP id
 5b1f17b1804b1-45b85570996mr189063065e9.17.1756974136461; 
 Thu, 04 Sep 2025 01:22:16 -0700 (PDT)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it.
 [93.47.52.235]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d520eada16sm17920415f8f.41.2025.09.04.01.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:22:16 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Thu,  4 Sep 2025 10:22:06 +0200
Message-ID: <20250904082207.61497-2-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904082207.61497-1-andrea.ricchi@amarulasolutions.com>
References: <20250904082207.61497-1-andrea.ricchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756974136; x=1757578936;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnaZzfU26X1lXFRqSF6KIsHL7sH0GZ5ANDHJXRMn9uY=;
 b=LC+dRR9fJsMAwAlZUbQ6qry7Q1YaWg6gT/X2HKbBN2Ce8CJ9YC4E+VDktQacUSfoqC
 EqofTCFSadoDxrb/IOSLAGS1v+8+kl7fcnelNfL5Cd7oDXNxyJyjuPXwafI4I/w3fHcJ
 Z3gLp8ZIEdQQ/JMr5CJdsWJQm6hBUoGJT3joE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LC+dRR9f
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: add Andrea Ricchi for
 cutekeyboard
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

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 Added in v2

 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32d7c8ac61..a293daf56f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -175,6 +175,9 @@ F:	package/libkrb5/
 F:	package/p7zip/
 F:	package/wine/
 
+N:	Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
+F:	package/cutekeyboard/
+
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
