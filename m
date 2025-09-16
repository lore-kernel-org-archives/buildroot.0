Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E917ECAC59D
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E98611C3;
	Tue, 16 Sep 2025 20:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNMI678Dw6gI; Tue, 16 Sep 2025 20:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9A36611C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A36611C7;
	Tue, 16 Sep 2025 20:27:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A947A199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B75941C7F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewGzKdB-eg86 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAD0241963
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD0241963
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAD0241963
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3e7636aa65fso5422908f8f.1
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054462; x=1758659262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XOjEYKsXSjPMjxqt2FFvpdREZ8IUtgC3mxddqG4y1Fk=;
 b=cEiinnhbntu03y4oP8mDAQXmL/FdGF5h7fSpsbyuEG+O39Cc1LIKJ8A8HphMd7Rb3H
 jvNbQ4rVXf6J3Gf/V1HopuiL/v1U98u+7C1UY3Ds1yikTMB4vq+T/XQ1DLEK4VYZl3B7
 jEq0C77ENUY9f3PIie8ljJfqBjuKQjRB1VdeE4XFcwN5wzcCMFNqUmP2bqiau4U0orKm
 hi4AFyyLX595s/3TPif0OvpO04BE8kg7v31kN8kpFyESzmgRkU2khgccuDUVsjbCp/B0
 yX+OZygt6ov50ntWA9QmaCUgLapZXKzRjbRyAPnhhjfzpjuMmlZpKw2V5ltvJny4PcQB
 iA8Q==
X-Gm-Message-State: AOJu0Yxpn8Z/jdp1p13xYINeK07bOaubwpBaHNzbpK92hBe5sto1fNbN
 p1dRdzgbyr537E2NUFxzchjVoOAkaQq1VLYR8YmdJue/MqJ87d0SXXUshpIWvOLUay4BoSDf8nS
 7icpEjPY=
X-Gm-Gg: ASbGncvwHebbwcUDsvwOTC33Gdc2akkPKWkq3PVKqq0byeo6/jWyKEtJHlvoqWUcsZi
 bWRv44X3whDVSd/kx6hRTQZ1Eo9aSDf872iDR9cs14rWczsRGfyT71ND21dELCqFoxmPYUOAa0w
 aVbph1yrhs5Hu6PrdSoSq1eaMNqW3e0CebOX0/yEDgresGZyVxFTXDBaQ41TkhpU2VB2LRvliWy
 5GBjnaB6p4Q/34HjsJKJcQYMD9PhGktfi7/+hVXFu93u0kd2TGDa6N33MZkyUxWRj1Rbo5jxWmM
 RE/Qi9LmRbrqGbLUAlHysT4JuU0gxZQFZnsaBA/eRsvI7E0+ySvouNYJkx/tjlYTI+CRKn/ZltP
 ZhcMeBR25KoQoweQ=
X-Google-Smtp-Source: AGHT+IEvZok8JnF4m8MYy9P34pSlLQiIhBNkwTKsqq7ScbLMr17excuahFGDOYt7kO86qZ+Aig64Eg==
X-Received: by 2002:a05:6000:2508:b0:3e9:ad34:2b2e with SMTP id
 ffacd0b85a97d-3e9ad343387mr10142575f8f.46.1758054462429; 
 Tue, 16 Sep 2025 13:27:42 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:30 +0200
Message-ID: <20250916202735.1121872-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054462; x=1758659262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XOjEYKsXSjPMjxqt2FFvpdREZ8IUtgC3mxddqG4y1Fk=;
 b=hbGQWdGNRR+xC0m2ggNJNYdLs8PQhP9DN1htbOHTMRxovDOtAl9lR6zE2/nwU+C2cG
 kJ3ZFup+7K/c+bp25WSiSUi1uHscJNQCtz3fxYsMevQ+zYEgBcjGOxhFwrHi7cPNH8Va
 h3bK0ABzOrEfKWQIA6IyH0lPHBe4iOrdQO4Rr6p1A/lEMtdDerSb766Cc7dVK7BMAj9h
 GPM3C3cHMh+nfa84cpiflV7N6R+pPesgOeMjohiQfH0GsotGQis7+g9C/eDadIpVvFU7
 hEBLy41DBXM0mhWn4M0jtwDDlrAF3D4d1CNWi7sVjMwX76Ljt/hlMuFFRxY25ZgVbBjK
 LIEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hbGQWdGN
Subject: [Buildroot] [PATCH 07/12] package/upx: fix deprecated CPE
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
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'upx_project:upx' has been deprecated in favour of 'upx:upx'.

See the following:
  - https://nvd.nist.gov/products/cpe/detail/36CA8E94-4A35-4373-8D69-22313060322B
  - https://nvd.nist.gov/vuln/detail/CVE-2020-24119

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/upx/upx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 65f4bac517..210114b926 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -9,7 +9,7 @@ UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
-UPX_CPE_ID_VALID = YES
+UPX_CPE_ID_VENDOR = upx
 UPX_SUPPORTS_IN_SOURCE_BUILD = NO
 
 $(eval $(host-cmake-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
