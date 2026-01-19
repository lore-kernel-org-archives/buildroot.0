Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F038D29C2E
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECFB061226;
	Mon, 19 Jan 2026 15:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7FUxvq74Jho; Mon, 19 Jan 2026 15:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2334061218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768835820;
	bh=yaHzVvg4H23+YuVNkTQeB7+xokklXSTWE3vdxVsjT4U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TgSvPNzExg5k/Mgwt5n/MFixglbHvi7qSvNiMtss9JmG+FLeL3UhwEwkAS0RfuZhg
	 kLJdo9rrUyk0VmBiYCO9mE6kv4llMyic6rLhB3vromSXDQxD3S5aNBjacMiILMj+pp
	 TZC6WEl9ieJ+SdAgtDXoiOVckPp/WgWq1ocxZ2RulJ+LZZCBcMLim7aXvJAv2Yd9RR
	 8v7pV7zfvVBXEpIkOC+cx366a7wRa0xBH2PDEXnbtyEdy4xym0Zo9m2T8CQmKyzul5
	 AkaCSUSlEXe3FB92xQnwrhtDZYiiubvAX0pJ0Tv4XCXMBuGeGBNNSXzajM4oVyInDh
	 bl3Asj+kRPpkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2334061218;
	Mon, 19 Jan 2026 15:17:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E6BF2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AFD261206
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSXX8Q3KlIxh for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E603E611F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E603E611F9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E603E611F9
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so32629245e9.1
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 07:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768835811; x=1769440611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0OqoqJeOLAaWpFDCmihlGm1SHmytle/o6XuaAJ//k0E=;
 b=kz7HPg5vlCkXYXDLZnm/4XGx4s1hvqAHsaGkNKUXxNxRU5pZMBfuFjdY6thkcn7EDx
 7c8nHzpAiSmf3cfaWSwabWcT5CejOptZCmE5OFMTgYzVGaU7r/Q4CLjUwfUFgn21ISoY
 pd7xMELuFSwHd0jLcG9S8ZXd36YiSBv1upLCwQCW3vGSE71Kpakd3cBCG/YVJPSF9UEg
 lsO2q9GXtXqZ73Ow9xZCLbOD1y3a7VpX39muLGP3NXVYt232PiN9GLxQZk6LcWh9EjsW
 +EHA5h4AE/z78xRIylKcqURy8qEOp+ndje6zIwcdXU253HmlQq75HgEKUfEPcgQggm90
 u1Kg==
X-Gm-Message-State: AOJu0Yxqg9qdYaAh438xKgGnQ7EGFq7F2LwRJT3FkKvFb9mhBC32zgMY
 HSef3WTkBjLZKt0otfDUNoiX0QXqZx8nh9/7XQCQYHh1DhvFVLCJxDuDZlL1m1EooGvLcv29323
 XtQLm
X-Gm-Gg: AY/fxX5vFUr7qsS1GUikOD6zykzmRFOFpI+xh89jCKl9phAVXPWPlohHOzP2Z884Xmv
 KGSSJaHZsnUV/Nx63SFSVHjrWK6WdMGcjRgi1PNoxAwHdU2Z1YuU1nTPd8jqESZOO7OUGfnlUG1
 GoDMdZBtnRN7y1XLLNXrhU0n8ndp9OIFDephu8f8akTYveWiYMbzFo/HO8LQFNVYDQtogqZEEE2
 XQ77CifU9TRNtXSK/JWe7TFcyApvTLtCERq4xqc7IMyzfskBwB4afwf8b2V2u6sxKfHUq3x1+rD
 OtwOlUG4261qh6oxowKtpHWxdQDJAIe6GhVqdxEE0QestLMATPrT19Xz9LtIeLj/a43IZDx3hod
 bd+CSaLAX0Ntri6cjI40TNPBFE2riyOp0Wd5OO1ltOjsCZ66whRpc+IVV92mi7MvX8Ixo0U5X+0
 5q+FMDIUArnjyIrSqyauOyph3D0aT2oxQ16luQIe6gZBDi6tSu
X-Received: by 2002:a05:600c:458c:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-4801e30d9famr132382585e9.11.1768835810707; 
 Mon, 19 Jan 2026 07:16:50 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acd0csm253324295e9.6.2026.01.19.07.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 07:16:49 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 19 Jan 2026 16:16:43 +0100
Message-ID: <20260119151644.100529-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119151644.100529-1-thomas.perale@mind.be>
References: <20260119151644.100529-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768835811; x=1769440611; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0OqoqJeOLAaWpFDCmihlGm1SHmytle/o6XuaAJ//k0E=;
 b=IioJZov6PwlP/qWs1A14BxPDvjfGLBrEPEchLVLOPZu92+Qkxa+Xi/FUgkn1ZZfH+1
 msz442lT1H/bxGw7gs9VoUC2M1ON4Xr9qLnShGF1PJ+8+Tffq3tK5F1vGxmqve0iiQM8
 GGdA+I6s5OdjAqXBtj1eVMqVy0bCR1rhS3ZQOcPLJYPXHJ1Np3VIb6KIa7iHx2QhTGcr
 RbGZpWufCH0cbcl3mTnPDMoIvP1SALHZvPu0kicKE3ArlAGjhubzYd38dW0yOAddaw9K
 0FvzxYD7GVreLJTApoKfovedaXfUED8UwrUc9yed0BpZPJz0eUpMWwEMedywMpAk/XaN
 SlVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IioJZov6
Subject: [Buildroot] [PATCH 5/6] utils/generate-cyclonedx: bump to v1.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See changes:

- https://cyclonedx.org/news/cyclonedx-v1.7-released/
- https://github.com/CycloneDX/specification/releases/tag/1.7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index d224b3a24b..2662b673a6 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -20,7 +20,7 @@ import sys
 import re
 
 
-CYCLONEDX_VERSION = "1.6"
+CYCLONEDX_VERSION = "1.7"
 SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
 
 brpath = Path(__file__).parent.parent
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
