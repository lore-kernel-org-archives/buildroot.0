Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A8CDB481
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B7B760C20;
	Wed, 24 Jun 2026 14:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tEYajiEFayj; Wed, 24 Jun 2026 14:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3152B6084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310026;
	bh=24CNMKqkThkHZaBunNdNxTvX4TUmkApu01jHwJAqx2k=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=R+2XzjOoW/Za/CNIHH71LbQFW/o94xfIaS1jt/FzaWVEx453s72Uniszv8JYeLXGo
	 bM3ixfEvi+laT2VnntoTvTqyn9sa/AL6BCLU7EplGyMrxib8mdd+xlAdfqQg4VIk23
	 mCyL+bkfX9/4Ms64fynzwNaqBoU1otcVFTY8My2LYnj1HRYEHrhHOv3iRtc3+gU+9t
	 hh0Cvgach/9uUY7x5NKEm5aCqIJphAyu230k+ZkHaJbP0yvvwrit3ke27f5/oTNO3U
	 ZrptlE6s3Y6mvZxLU2pc/FtrxQFo8r5G+zXMBhC70ivZq0RPlbkYrBPw/e3a+KiA6u
	 wAI+9usJV367Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3152B6084C;
	Wed, 24 Jun 2026 14:07:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A29EB363
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88CE240120
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNloxIssIqKT for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD97D401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD97D401CC
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD97D401CC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so7436205e9.3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310013; x=1782914813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NulcNptE4KFQClp3josiVxmhResAvYqY5228BkxRmgk=;
 b=B7GonXDgaxM9asXmZjJuC5nETR4CsvS+Iks7bFaLV79umMKdZQDM6YgD6TxtGQMMkE
 aGTcAV2F6tJbN2p5Ww75/z4UyPnBLWsYbUbpiib8YlY6fCROfl430rVe1zksi4b4NrV+
 LR39HXpbhIX3D69K3B9c4iVqyco5INcn7MBHkqwMdLgR0KKq7TNz71oZjoPxwyJp40SS
 qg1qQlFMuTtJitzZ2C7T2QUhjopQPmz3JtdtriMzQ+Ir5qOSG/VZ9cUzeFxPq7iWmYM7
 dmpeDU7VuVbBNO41n7MDVtFzo3BWEzO9g1ohcBYVwt9aGWHFSayb+DctJdk4WcqKlZlU
 /8Rg==
X-Gm-Message-State: AOJu0Ywz+T/AqvtaDDiTs4Bmz1le3HieT7gqBMpxD6282aVwuLq+m1fc
 HpP1SyVylt2z+WvUgVpKw2jRYXFPYmIWTfPcLSlKFoigzkxRaFMSsmSIu7TLdWzuAMzYoBN1oEB
 efPT7
X-Gm-Gg: AfdE7cmjWwOpqPveRzCb8xm08slGhqatKa9QBF013Eqleaz9A++Uwj7FcYhHoFxe8VF
 rsLJia+RbRHZRKr5TditKe3M4JNR6o9tjEvrQ8cEwPqatvL9sihNhCL8HzSClVdnDGjDHymvLmi
 uKT4nheq96bLOvGg4hyyCILt73tU7fjzWUtzqr/s9SScVe8V9Ojz5U9NmDd64/MOElOBLr8fH1n
 +UhxTc18Wz80VVRqp+/UBE8/l1FJYD6mIjSkX9wc79dJF5DKGBwYHtFHoiSuENoM2403TQtRBei
 2GLIi4UuxLljbK3oAOgZsHzDfCmyNZX0LMwazfcBg27YLqJ/7UzDGJ+CsiBh9+mDET8Q4qNnMXg
 d9VvivwHvLameaKW+FiTyA/cwO/Hr4FV/6rdH+i7NTmvZuFJRUf0DJrTl4aY6FGKlz7q04irT2Q
 knBeln+ESG5U/hzis=
X-Received: by 2002:a05:600c:a07:b0:490:5cb3:e94a with SMTP id
 5b1f17b1804b1-49260849677mr49645375e9.2.1782310013308; 
 Wed, 24 Jun 2026 07:06:53 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:40 +0200
Message-ID: <20260624140645.185318-10-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310013; x=1782914813; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NulcNptE4KFQClp3josiVxmhResAvYqY5228BkxRmgk=;
 b=dXrFTQ/OA1HywSriWeqjew3GCORn8qwbWRULXSL8H7WYm8N6fvOYzBvruTX9etcZLd
 t+PO0gTYp1YPbKpFy3Qq4CSXgTuvhDNyyDovPGzJDs1qF6sjMaGfh7yMpKvYqqjk+aZM
 ozR3RKu9uHmAwZw9CFHX1pnWchd1JS9UkRajD5N/OXiECj7EN3sUrEdGXI6woTxR8iT9
 Pb/mH2vK0sx8GwH0uRXWfjnFAdGrnkDqQebqrhOJgPxzfgQETUojxj3P3P34DJ03T1rb
 pM6qsRmpngdokeF4tZZpmKgvh2ehNk3A51Q3nBoXCdWnQkCogn/3m5xxgsbheBsX2Xhb
 qe2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dXrFTQ/O
Subject: [Buildroot] [RFC PATCH 09/14] package/luajit: add details to
 vulnerabilities
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those vulnerabilities has already been addressed upstream but no new
package version have been released with those fixes.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/luajit/luajit.mk | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index bbd423ad02..ef3e840f8d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -12,20 +12,25 @@ LUAJIT_CPE_ID_VENDOR = luajit
 LUAJIT_CPE_ID_VERSION = 2.1.0
 LUAJIT_CPE_ID_UPDATE = beta3
 
-# Fixed in 53f82e6e2e858a0a62fd1a2ff47e9866693382e6
 LUAJIT_IGNORE_CVES += CVE-2020-15890
+LUAJIT_CVE-2020-15890_STATUS = fixed
+LUAJIT_CVE-2020-15890_DETAIL = 53f82e6e2e858a0a62fd1a2ff47e9866693382e6
 
-# Fixed in e296f56b825c688c3530a981dc6b495d972f3d01
 LUAJIT_IGNORE_CVES += CVE-2020-24372
+LUAJIT_CVE-2020-24372_STATUS = fixed
+LUAJIT_CVE-2020-24372_DETAIL = e296f56b825c688c3530a981dc6b495d972f3d01
 
-# Fixed in 343ce0edaf3906a62022936175b2f5410024cbfc
 LUAJIT_IGNORE_CVES += CVE-2024-25176
+LUAJIT_CVE-2024-25176_STATUS = fixed
+LUAJIT_CVE-2024-25176_DETAIL = 343ce0edaf3906a62022936175b2f5410024cbfc
 
-# Fixed in 85b4fed0b0353dd78c8c875c2f562d522a2b310f
 LUAJIT_IGNORE_CVES += CVE-2024-25177
+LUAJIT_CVE-2024-25177_STATUS = fixed
+LUAJIT_CVE-2024-25177_DETAIL = 85b4fed0b0353dd78c8c875c2f562d522a2b310f
 
-# Fixed in defe61a56751a0db5f00ff3ab7b8f45436ba74c8
 LUAJIT_IGNORE_CVES += CVE-2024-25178
+LUAJIT_CVE-2024-25178_STATUS = fixed
+LUAJIT_CVE-2024-25178_DETAIL = defe61a56751a0db5f00ff3ab7b8f45436ba74c8
 
 LUAJIT_INSTALL_STAGING = YES
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
