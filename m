Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB13E9411C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1327407DA;
	Tue, 30 Dec 2025 08:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekKu3LRb7kxX; Tue, 30 Dec 2025 08:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552F340405
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082786;
	bh=HVB6vEOafKituHrmOpDjKlZpY+nrQJLCxSiRbzl3+EQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UgcpVzA6RccHol/HxfWho6tFbYoqwP/piAY0pl2fftlcOgZMgAyySky6bYRuN5ISn
	 S31rrqcU9dcHVc90LNRYDmN/aZEQX8Qg2E8i6Hmhfe/EF53MIq7i1FvAiXzED0Arhx
	 awHPyEqgikgPedYndVP6WnryNj0EqS240gM0yUKUB8JZ94Ns6Vm5KcdMH+cEvhAWtd
	 2oFvvjI3PXFRqapwHCrvUQ5XTFZ/BNWBJKfz3zc+yNqCe6axpF+8533uWU4G0gChIe
	 k4648JNeDUxmnn6623y2djCyIHfQTipW2P84Drb5xwXwRHjSS/VhXP8O7FWj96Jyrs
	 fqT4bGDpnp1Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 552F340405;
	Tue, 30 Dec 2025 08:19:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F92A177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0BE381337
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oN9JZtwaJSs for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31DC8813C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31DC8813C5
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31DC8813C5
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so4751069f8f.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082778; x=1767687578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wQlSnuwdq/yZCaR39sDeYWmFhBR/tIwAP+OhLbH53e8=;
 b=DMbNXbXvyR2vqQcoebpc4pb5lWqnH+8dU1iSMsLx4gt2XqYrSJ31PAZO44OIE0cf4T
 LNhY5a2zKogRaJFoVfIdMb8ZP6szFgPzHvb7bos3+VM9hkF9B920wkgvorjtnFISJk3U
 SyD9pRsopk9dn5ZL42VdFN4zRbNctyV9hNn5bVYIVCahJgIKFELJV6LbHRzch2WU0C4Y
 mo5N+9LavqbX7Y6m9ig6LMQSU1kBYXxEokR83NukMtEhsZCaWkvynQ7U6YyeUs1YKFTf
 qk7d1XfHFAIIvNm+jx6IuXRjSBeoyWgyAamwDiRpigs6RFGoxuUQ0D3cxJelqkQ54X4g
 5V0w==
X-Gm-Message-State: AOJu0Ywu6ZNv/BqT5oaWyW+wOsq6OLQUSZHcVhEuv+Y/Idzn7DbbZ2dc
 e20tqpkYhBn1C/CkDpBN62hwlbRNThKr9LHrUCZdKHvVY9zyWSiDfCm5h9gZgu4kB9cUPM8Mpxf
 oD3pH+H4=
X-Gm-Gg: AY/fxX5P6+GPk1I2ENRSTHxDBD6OOTHFPLXG2f22bXosli0cRhcois0XQ0TU+VxE10A
 cfcUlQsRU+P0y87sSrl3afs0gXdvP1HlD3/iC6hKw+ZYPJ4v/fyzwDv/XNWXZRn0GtFR+Xcpgxa
 dp5jorV2wa1xWtNiv26CPU7OdK1DSn6o8GPFSpFLC0opcVmnjGaUprRYDVEO+HqjK8H4z7FLNyO
 OIYdtUZEOWBl8lZW7v0u6BRigNMgZKsJBZGrD9dEjXIpQ8987c4y4LJiL5M4frjnelxt0/LyFQz
 OSyF/moFuygpCgWZwkJln3/opUybsm+qayjx09zWlzIfCQClenbA3FL2dKoyCAn7kRhbPvC72wF
 x2eE8n9c7GzAFCES/Bm2oUyqhnYdjdr1uCXc6WMUyyF0yCadzgJjVWPcTWvup1qcwSWLXPxSCI/
 lxqxE=
X-Google-Smtp-Source: AGHT+IHS8SNnfl1zPIXY7a2mN1tz2wn3W04wy1h44GfBqzYsRg1WpfllCwFgqXWcES4ujD5cu86cqQ==
X-Received: by 2002:a5d:4652:0:b0:430:fc63:8c8 with SMTP id
 ffacd0b85a97d-4324e4fb665mr30644345f8f.35.1767082778042; 
 Tue, 30 Dec 2025 00:19:38 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:37 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:14 +0100
Message-ID: <20251230081917.18676-13-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082778; x=1767687578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQlSnuwdq/yZCaR39sDeYWmFhBR/tIwAP+OhLbH53e8=;
 b=QIIPr/Jc1iCo9vu3EFVwUsL41muSuqsHyVHET23nNYwU20tzQq/9c3Ia3KIcxYCwrL
 A3cu9s8PoVhwYZTn3X5ThZHNjoTLr/LikvARu+gHOPE9lEaOg9o3sSI7rTzc0YnPINvm
 9Bp1x6ZpKbgquLuZqBlRh7D5m9hUFW9bfzlll/iiKn3f+O/U+bIFjBl5LD9FJmz8igCi
 vZmKEC6Mm4QqNANPwGBt7XDQkm114/zviSDiknbmXfK9mYAEPPDf8+idZAPo6VrSQYJl
 p0oDxSg5X10xyoPxWzTUgkouu+gJMXbAco8u0H2g6lQT66MwCwHBj70buCEkvv/RcNR9
 kfBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QIIPr/Jc
Subject: [Buildroot] [PATCH v2 12/15] package/glibc: remove stale IGNORE_CVES
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

The IGNORE_CVES entries introduced in [1] no longer match to the glibc
package following the bump to v2.42 in [2]. The version boundaries
specified on the NVD DB are specific to 2.40 & 2.41.

The CVE-2025-8058 though don't have any information available on the NVD
DB and will remain on the IGNORE_CVES then.

[1] feaf53585a package/glibc: security bump to version 2.41-70
[2] fb6256c0ef package/{glibc, localdef}: bump to version 2.42

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 924274a7d6..9c3ff7124e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -25,12 +25,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by glibc-2.41-57-g84bdbf8a6f2fdafd3661489dbb7f79835a52da82
-GLIBC_IGNORE_CVES += CVE-2025-5745
-
-# Fixed by glibc-2.41-60-g0c76c951620f9e12df2a89b2c684878b55bb6795
-GLIBC_IGNORE_CVES += CVE-2025-5702
-
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
