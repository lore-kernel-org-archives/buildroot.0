Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B03FE94109
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A2B5812C6;
	Tue, 30 Dec 2025 08:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiaYuv1CI3VW; Tue, 30 Dec 2025 08:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B3181301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082783;
	bh=HLfLEn/JjZCEy1fTgUPUDYBfrU6Yl5P0sakudOHvCOE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=lEqT3oBOSBXOWgkg56n7qLF0kwx07POBrvrro+fzDOoI812zvstOBm7TDlnJU7OF6
	 k1KpuiLQ5Jz8x52i1DgPzMZCHz7HWrGuTiAKYvAGO0tvxFmJ+310chLrfAjvLit7bE
	 LohFAOOSYhdeA73/7DfUO5blyDi2vxMbj62PqQYlYDIZIUkkbnSgcktDkkc0ttcE5N
	 Xkf3+CBeawGIsI0J17CxRDU7EbYMeXX0ioqnwW0jaZ/6vtNAgXw6qsOWOjK4FkAcjB
	 eZdFiPyS77S4k/5RgbjcfUw/sIRGER/0D9+02Ou9tzta6JakydMuxwlR+o4AA8JcHv
	 JBQB7VlNw8BoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B3181301;
	Tue, 30 Dec 2025 08:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3039CD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17907813B5
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2t_FqglbIHWM for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12D5681300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D5681300
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12D5681300
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42b3b0d76fcso5593737f8f.3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082777; x=1767687577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=reKsFCVl0aHXGTaCUiJFKefwg8buNnMTWdX/MTeWkLc=;
 b=NWE6H4iqT8cIwHXqmNvydDFNTQBwEDazyiZdAssFWcoRNJ7et11jGvtmI/LApVtNwC
 WSfhmV29aJRH1f9MncYQ2ZOBXDxU5loWf5WeRFx05gdRKgHU0KuzMHjw/5XZAmoPlPbt
 0f++k4oVCb+ZdygCu58uQwIEhlytBjSdYxcfILxYHUFG8Kj60rTgRMJJNRP0ovlQIfBC
 zDZSBBE3V6ca05X31Kli4p3AzLB0qgfmMkMghYCTTYn1XQAl+zoxuFh5XPPT1gBV0Dyk
 WIC83FNstqoMoXqxstRum3eEuKacCqAo+DqLqke/hwAo9uWhsuhijb1Lqmq0zuu1yyNy
 UQWQ==
X-Gm-Message-State: AOJu0YxiBbSRuoptkRZKHSg0WdCfqHLDM3C73FpTHA9zRgt12aP4MgAb
 fYRPBBftx/ONj9S0opgpElMXR2ukc59rcc/6NSgHfoOCRRXab3l626sRMuGPCXNoUspDgalar95
 TFxZDDPw=
X-Gm-Gg: AY/fxX7KLZDm2ALxj3czOmw6uXgJJhhd9XK1IbGBlH/gSBPMscQwisLozMcJj+mONe6
 8Nz3QK2HjmPIwHIiXV57xn2ZeklX34XPemoR3NfRn/cjLOmFl/jwAlbU040H7Xj5uPpohVf4Jaw
 wQw8TSFiKN6EkiI62pYtRTcXjQtYgTH98fvp7tD0yHlHewMNkbdsLK1gp4UDYhGXBLucU+xl+p+
 c1GdS2wx+uWK+g4c7XWhYxaQnXzJUn4e/1HlsIvuW/IrXoCAm0siJy9XMsiA1Y4Rw+bMzSxya7L
 6U1/PvLjzc9JubzwvPYe34YVkKjnb4Wv8+qRH+N3RAd0xMOiwkmefw1oteM97SBtoj/OgsXLVKN
 9s2O8irUeDx3FII69gAu12rJvG0i6rWwyS+InhjCegxBfCB12hwf7sD20EicIHEInthFuvXXsyl
 GIFkc=
X-Google-Smtp-Source: AGHT+IGeG9rpn6j9osxQNjn3Y4wgb6Var0PTMj5xZ2J+eR1A1L6wHPSzeVdQ0az9SqXJGp/3e8vQ2A==
X-Received: by 2002:a5d:588c:0:b0:42f:b707:56cc with SMTP id
 ffacd0b85a97d-4324e4fdb0bmr36438377f8f.30.1767082776873; 
 Tue, 30 Dec 2025 00:19:36 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:35 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:13 +0100
Message-ID: <20251230081917.18676-12-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082777; x=1767687577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reKsFCVl0aHXGTaCUiJFKefwg8buNnMTWdX/MTeWkLc=;
 b=CNQ3NgNoIIr6ls5m7itBetRhdntKPKGixM9XFwWIiAcXosieZOukc1/nmRdoiLPUa5
 DVZUiFYeLV3M29Imd7ceppW6w3XE90y2hMiv9B8BsVqMUDKhYHxyxO5LLtipSPu5xVX0
 UKagP0YZofIpH4WSaLzey2JHRRoSUDBTCAHrxF6pa3B56IeRQDrFNaqsXfzHdx2RqRqZ
 Shzh9zQ9N0tw8SBRukkbQrMw5h9lr3uSoor+5QEFVGjOqBq1zyDgNEisLij3x5ncuLC2
 6/1MktAC0rQji6hhxeWA234s1xACDXt5bJbNIJNyJ4qV70dBIhLxCwpV2taNBPqAuGHx
 umqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CNQ3NgNo
Subject: [Buildroot] [PATCH v2 11/15] package/glibc: remove stale IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entries introduced in [2] are then no longer matched to
the glibc package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] adaae82c58 package/glibc: ignore CVEs not considered as security issues by upstream

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a7727cbad8..924274a7d6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -34,19 +34,10 @@ GLIBC_IGNORE_CVES += CVE-2025-5702
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
-# All these CVEs are considered as not being security issues by
+# This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010022
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010023
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010024
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010025
-GLIBC_IGNORE_CVES += \
-	CVE-2010-4756 \
-	CVE-2019-1010022 \
-	CVE-2019-1010023 \
-	CVE-2019-1010024 \
-	CVE-2019-1010025
+GLIBC_IGNORE_CVES += CVE-2010-4756
 
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
