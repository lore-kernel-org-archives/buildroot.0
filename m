Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921A8CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 10:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A2041160;
	Tue, 12 Aug 2025 10:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JFVC4r09UZX; Tue, 12 Aug 2025 10:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BAB641E42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BAB641E42;
	Tue, 12 Aug 2025 10:02:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F20EEB8B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC8D441A22
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xd74NqA5h15C for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 10:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C354841A1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C354841A1A
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C354841A1A
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:08 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-af939afe5efso613027666b.2
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 03:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754992926; x=1755597726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jji5PR6kMicnKUYkPucRclnqAKwa26UGtUGqOx2r55o=;
 b=LpIYuzItut6F9Fo6FCQAxhrrtxU/BkGYrhv8tkFg50NWEvidnpUuhhE1OySoZXlbKA
 nO37nwHM3bMxnUv4fD2/goGPru1t1IEw7caiWFEuGCCtBJouCANGTAaYtxpw/K37efaq
 +kg2SOHHQc6+/y8ivlYvON91NEeJjeaI1X6ZoAJilGXcxDXziJg4siNC5tPKN2sgsjQF
 mDWTIN8+TubQlI9ItHspniUBvWr57kZ6H2oDSJNI8EfWqimrcKFn4zpEAz2zMaAKP2L4
 zQgo++RGq3/dxvqxx4z398AsXSRHjpjdo8xRmoteZh1PhCzuXCMLsSe2JWZqxiy/Rhz8
 SYIg==
X-Gm-Message-State: AOJu0YzcMelEgzqf3mhW1rAEYqx53DRw82vtGgGcYlZ9p1gQvdZ7V0cv
 4TwXDNiVihAabBpw891LQaIX+oSv9QoNtKU4HwAN5rt1SpWR5CnIBV4/X4BXy63x71ZoFEDv7Ez
 B7D/wFHE=
X-Gm-Gg: ASbGncsgUX//u6inx2Qt6erZLgbeFZKm+sPPVrlvom6HZ/0HzB0DCWkks8EVjIo10Iu
 wAw5EjTujuwH6FA1tgo89XHXuniJ3JjlF8vtclnq8rApIbve0YjpJOIYT/aFfY2nfUnXAyW+VeJ
 /R/3X2kE5rxV8Ph6GQMHBkJ1eQWU8uFpyV/06MrnIUr7+rCUFPHpr8LoAaEGUXoPbH0SOXIMDcn
 zWlQwtxxLTP+TENH7dCNTGaiw/LBu0ow6pIiRrrkr3iuVfO8yhpGWDkuLEqqRoHHRobJndrPoAx
 nH0PxF2ne4UVzDBPZdMosrssxLra2LRK+qZ0OJ5eVbznqPNLX3dloTNjEOTR+LUKwYRxDNed3tP
 ji3iLMHoQqm2QEbYvfejVqXOEuctxdHnQ5y8fFKOF1BXk9NLIn/CIoQ==
X-Google-Smtp-Source: AGHT+IFsm8XWBotW2r/eparCZNmNWeKVjITtNpySpBylMtYAFXGQe8RSMVdDAog2qEdREQlITZ2vMg==
X-Received: by 2002:a17:907:72c9:b0:af2:7ccd:3429 with SMTP id
 a640c23a62f3a-af9c634faccmr1404864166b.9.1754992926387; 
 Tue, 12 Aug 2025 03:02:06 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a243619sm2181494966b.129.2025.08.12.03.02.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 03:02:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 12:01:47 +0200
Message-ID: <20250812100148.717381-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812100148.717381-1-titouan.christophe@mind.be>
References: <20250812100148.717381-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754992926; x=1755597726; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jji5PR6kMicnKUYkPucRclnqAKwa26UGtUGqOx2r55o=;
 b=EllL4WVpxU3T7nKd/FUpPF4yZ5RfzycXgrDeySX6ePAHUjSd30payxoRr3DVeK+2Kd
 2pERXj5TBsPQDeARVbEwsbjumwQj3iqB6RsxoHcbfMPRuPZVl/Kqk9gVizRvgRDWhs9q
 B+B863BYuL+V2OFek2fHpR+as24a/x0Y2KACKVnEQeSHaPwpxn3zlSgWi4beldbH0/ma
 u6qnLWKTzWaXzFVGgxKmgnasK9FhNSDFqwwramAmY1cOP6/gL65aS2Q7ZUJNnFJaAkb4
 zV5/JNAtMbviDhRyi/xlVQDXehGPiA1BGtAfE18DZBEQwz5LglV8yasFr0ph6w8PXZKW
 Hvzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EllL4WVp
Subject: [Buildroot] [PATCH 3/4] package/openocd: add CPE vendor and product
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openocd:open_on-chip_debugger is a valid CPE ID for openocd, see
https://nvd.nist.gov/products/cpe/detail/91C79641-7554-4DA6-939D-E9B0A6E54C99

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/openocd/openocd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 78f872fa76..a563cc6a9e 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -33,6 +33,9 @@ OPENOCD_LICENSE_FILES = \
 	LICENSES/preferred/MIT \
 	LICENSES/stand-alone/GPL-3.0
 
+OPENOCD_CPE_ID_VENDOR = openocd
+OPENOCD_CPE_ID_PRODUCT = open_on-chip_debugger
+
 # 0001-configure-enable-build-on-uclinux.patch patches configure.ac
 OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
