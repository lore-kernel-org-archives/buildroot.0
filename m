Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69C8CCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 11:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D2B811A3;
	Sat,  8 Nov 2025 11:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zznUqsn4Tzdx; Sat,  8 Nov 2025 11:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC9AD81176
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9AD81176;
	Sat,  8 Nov 2025 11:01:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70DB02B8
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 11:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6907F40231
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 11:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMJwJ3-Eltvi for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 11:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 151EA400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 151EA400C7
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 151EA400C7
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 11:01:19 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-641677916b5so316225a12.0
 for <buildroot@buildroot.org>; Sat, 08 Nov 2025 03:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762599678; x=1763204478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWiYrqf6Qyu7hgHz56jObUqqulQaWCLGZk5sVr+ACys=;
 b=aapVfGkv2LHXsO+eRR2pxC/dLrzYIsphGVV8vxkOH3BG0hE5zGjMSm9OknBhhH0bsO
 Ny27QS4WcA0uQhHjqPKhPrrRwxSLOtU3KL/OLlUwvXkh4nnSMwIRvPOCQiC2cP363TnV
 GukoOksJyFXVe2zyEs2wQkLgg6tOb90gjeCtFwvywlSqyKEHboORJHfX92BE8ZAIsh9+
 ctuSEiA14MpWrsUsHTjO8Q5dOz9nq+V40xnH1vWuAmIBAXiMpHoNRoTi1coa9cKH5OE+
 DyeHGq4AMVsg51tEyYxEdFXbd4N+hTqwKyMuul644Z1CTDvsnf6RWNI1lXtDzKGQAmVd
 NdpQ==
X-Gm-Message-State: AOJu0YwCe3Ls6Qna4Gsok3x2OKewqPOqG6RALAp2LPtoa4tbuBG9nWL0
 Ht5e6uJDdTNQGTQ9R0JcKcAS9iDEjOEzQIAvvoxaq/1sxc98Q5NJZoMLwj9SwotV4XPZXwI3vBP
 XJ0tW+ig=
X-Gm-Gg: ASbGncsMToX0cx/hHiMLv7d+TmNl+jZSnclK4UNzrZYyzzec1faAuvgIlokcEfSs5eZ
 1AQQ/tTRyKmiKJ7u+Ps0qsg2458nD/jW1CmrqcuV25NuXvZ6r3gTAQ1uU7ujYKN424/oboyMrse
 vwaRLFPMFh6H61J7jW9FlBCqAabpKQciTtq+qA+LpmYfKUAuiw8jyNb6y6DQdwt4H0zKBi3fVs1
 /jvH3b3B42uFti2NW2LVDisLRNXlzt4e0+EN3LLXRDOTiZq73RdoSLFvCBCI5NMXYU/81e3tx3t
 ogAlCmRKhbFTo8YpKsz5dhKmngNlS+fVuFjCLFhU2pUoZ29WgD2ropBinfEiVbED4JANAqduLpF
 7qRdIpZAOwxL3MYgzng1Tu11+S3BaXNVvCg5ajOonoV52/W/xWiwL0F1fXT9LbfZj3/lyX4nwf4
 2va+lF7v1O4RwwYOAbWy3FQfYwopJruTCxX3wdzXYwzF8XITsEvunz7m4E1PKd8zEtWGxl4cEIn
 wByF2xtnucOq3FSL7wdGL6fSoaOvG6wx9eNq+3Td0LdLLlJvtI8
X-Google-Smtp-Source: AGHT+IGkeUMWRg0PQRzJQp8BuWIhAq/yYvHV7xv1oauCBiUaREmD++Ow/rGn9Zx3wjFO5RL77R42+w==
X-Received: by 2002:a17:906:6a28:b0:b50:a389:7aa4 with SMTP id
 a640c23a62f3a-b72e02730b3mr216893566b.13.1762599677759; 
 Sat, 08 Nov 2025 03:01:17 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-99-245.retail.telecomitalia.it. [87.9.99.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9be2eesm501026366b.63.2025.11.08.03.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 03:01:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  8 Nov 2025 12:01:12 +0100
Message-ID: <20251108110113.2813893-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762599678; x=1763204478;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mWiYrqf6Qyu7hgHz56jObUqqulQaWCLGZk5sVr+ACys=;
 b=BTm1Cq9UEsMvHzL+BNBdNHVMd77ZuYJWtiDDiMOmmClz4Fz2+LORdFKHPTh5Uq1ecp
 u5osfGDanwzJ30LE3nT+mK+2DF/J+HSsL5QxkuaweqQPEtxHinu7ZaOENsCsWDCvs0YF
 Ea3Onxo1415eCWRWg//q66NYpxVE1C6daw9i0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BTm1Cq9U
Subject: [Buildroot] [PATCH 1/1] package/brotli: bump to version 1.2.0
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

Release notes:
https://github.com/google/brotli/releases/tag/v1.2.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 145467c420ac..9ec1f79c7d67 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  6eb280d10d8e1b43d22d00fa535435923c22ce8448709419d676ff47d4a644102ea04f488fc65a179c6c09fee12380992e9335bad8dfebd5d1f20908d10849d9  v1.1.0.tar.gz
+sha512  f94542afd2ecd96cc41fd21a805a3da314281ae558c10650f3e6d9ca732b8425bba8fde312823f0a564c7de3993bdaab5b43378edab65ebb798cefb6fd702256  v1.2.0.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 80aa2566b51d..aded9cf17b6b 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROTLI_VERSION = 1.1.0
+BROTLI_VERSION = 1.2.0
 BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
