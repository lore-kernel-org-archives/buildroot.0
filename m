Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710D1CD8CA7
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 21:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2814E61C73;
	Mon,  8 Jun 2026 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzv4MvN9ZF4e; Mon,  8 Jun 2026 21:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED8C61C74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780953677;
	bh=/PS12PAWbRkkuaUR+a64tVajjldhdT9gWf5kBEC7zZg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=BQDDfO+sTH8kxAC/FXsJbQqMby9Lp+noN2/Cz8KYg+HqA9wKZ3RfkaJIqIucGstER
	 uEJfz5rH5niai4m19sx+rZhaX24r64Z1cs19NjyxRoCfqJZD26ImjqoXktRlFs3CRy
	 CeAaS13zXYV/cYwu8kzxGBxLhLkXIboX3I7s33zab4Icsx6XddisIgM/9DhhGHDKm+
	 LS6Qy02/Yqpu5uEVDVy0TOrxJaOrrh9Gn7dW2IiEkFoaJcoGdUfoRFpsY3IABN2OEJ
	 lUnKjKrhdo3kCi6VLEIHCSOtDXjbIWeAgHXiRuTCy7X2dkrSZZOb4slNEnKkkW4yvH
	 dBMZK8iaH9Z8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED8C61C74;
	Mon,  8 Jun 2026 21:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 747B42C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66341422D5
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpt60r1BFVvm for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 21:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E3C742286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E3C742286
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E3C742286
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 21:21:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so61932465e9.2
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 14:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780953672; x=1781558472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gG/+DsQD3GBBEIXHDDhlao1lmgoyZqWz6zqYimOzKM0=;
 b=oz5LWJyuoj4NVVT+cELNYw0x1zBD4QKoak/FkN1eDGBoCxcT3p4t1rOODWxB9vN5YE
 Wf6Y4kkx5VIOWKKThpWv4IqWNBON/jQNUg7WPCNtQjRe5mad5F6ljNbzcYfRikDlbYIP
 pUcoelAmpGXtnkXP9Ts6R0Zd9pXa+MEwlP4HlhVJg1Dnp1G026BvHne52JzxW8rJw0Y/
 1rvCN8l6i/yZ3FK4Dck8Y3go8POZ+sg5gJqfT4NiTD0Vc3SX6Q3/NKsA2u+Ew2JmafgN
 GbSCDLaZOOAaXm9LdRlXdAX7o8Sg3IoVetY/dPRdfvR0Yrrq2GamTPTm6hqaNex/UInF
 EwgA==
X-Gm-Message-State: AOJu0YyEscWRmuoHpGdxl4QQA9lQbWJqH09qgDGYESU+qNFRE/aaxwUJ
 F4QH5/ERsKmIYAHmyYo9WPKUk0Hl/7krrV8qmKwueUTJeR4xMJyeKWVZeUKaj0htMm0E/KMB7zH
 DE5WC
X-Gm-Gg: Acq92OGa8uEpwlyE5mRS5bFioE/KVA6FMvchmIccR7WTsSdHW+AFdNXlV4IlGe+7O7R
 nbRSZqg5q8ATWgowRT+CnjPeYvMQePOnm/+Duh+BYiXNbJFo1sufrVU+FjwvBL+vZdX/LxikGuy
 ZLUE3DUeNg+Ah0C8bP8cDHPGLtkjoFDTdXkLNH9O/dWTBa+G/bEDZdlF5toVatRtAZVki1hLNGp
 ND/9YETTTmaYDwzo3vDm8LjeI4Fmf3Oww4ouuUqxdWcFhoUKs2wjpkdeykm9kGpJS8mSe978uHN
 gZe27ox8X+gz2hBwgaO7laP+cDNktnz6CFzmXyu6V8k/oIiAIbX7BFb6W3fRY/rOlI7T6UwMcGt
 oToSq4PRmx99Nhf2/zbUKF9AjOva60mVWsY9C+KssiqS5AeB2lhOR8rdWc6FwcES4Xq6rQqQ/XF
 ClzFbd6OOXj1yOggLErMEjj7HWKPxXxHC4jV69Lz0v+ztvlpjAnGqMNvrrRw==
X-Received: by 2002:a05:600c:81ca:b0:490:484b:bf41 with SMTP id
 5b1f17b1804b1-490c2560445mr249186965e9.6.1780953672189; 
 Mon, 08 Jun 2026 14:21:12 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46028a6dce6sm48710510f8f.30.2026.06.08.14.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 14:21:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  8 Jun 2026 23:20:47 +0200
Message-ID: <20260608212054.902018-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608212054.902018-1-titouan.christophe@mind.be>
References: <20260608212054.902018-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780953672; x=1781558472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gG/+DsQD3GBBEIXHDDhlao1lmgoyZqWz6zqYimOzKM0=;
 b=Rdjbnm64aezn2Hevfxo+LzRJpTbXLgUBx4EUHDYYsnwxfOG8d00/WwlEjQUOrz1GdH
 bOD3XAQmnJHHd9NOLeAvKrmAjX7RUrGlWpQRIP1bXo/5NJJgeRY9rOWr5hiTVdI0fCq1
 wruIp4sueF/a21sTMRH3+N554NWLJ7xucbvC61IppPtpUVlfjP9YnQOnDgniiOagBrBM
 tvRhtr2UPchAvZUzh/71TpIDWS6qtx915SdLBLWAYFrK2Pta+nO2OhaGvov8/0kdl8Vp
 dA3BPCD4bz2NgGH4TLubT0G9/5Vzf0v+Dc+ECk4hvoa+SDTqMMgu29NjSaHE3/AwucBj
 SZtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Rdjbnm64
Subject: [Buildroot] [PATCH for 2025.02.x 1/4] package/python3: remove stale
 IGNORE_CVES entry
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0013 was removed in Buildroot commit
fdfbad13cad9d7f5640d3bf0aa2abc1c6016fd92 (python3 security bump to v3.12.12),
as it has been integrated in Python3 upstream.

However, said Buildroot commit did not remove the corresponding IGNORE_CVES,
so remove it now.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python3/python3.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 60ab5b0cbc..7336c09ae8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,9 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
-# 0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch
-PYTHON3_IGNORE_CVES += CVE-2025-8194
-
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
