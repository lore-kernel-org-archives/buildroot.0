Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886E3C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 08:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E2441A50;
	Sat,  5 Nov 2022 08:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11E2441A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6CoPCCt2Z6M; Sat,  5 Nov 2022 08:04:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA767419E0;
	Sat,  5 Nov 2022 08:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA767419E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 832681BF28E
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 08:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F19E8141D
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 08:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F19E8141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KB0ISAGsclvm for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 08:04:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6422C82106
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6422C82106
 for <buildroot@busybox.net>; Sat,  5 Nov 2022 08:04:17 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k2so18598766ejr.2
 for <buildroot@busybox.net>; Sat, 05 Nov 2022 01:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7FNqVttIoRqrWhTP4wc1ymcAe+1fbpnWdMWl14ulI4=;
 b=T2+RkoxeZwuJva2TzLxOojYNAmRPcebK1bIpSgARMcDVMV1oGVF+fAQSRXkPDPAsdK
 EY8QXzzCJfrxJZqS6vc9K7jxraLE/f0i1Bd6eZImTYd/avkRxhBgErpBK2d4Bp83Qye3
 Gw/KoGF4mx1qOEOvJjt0XY3cFrVj6tyCSYDmxDfMESkgz2e2udbH4RO0JM/+eYXrZzxo
 x/kCzxctdhkS/LTFezwI2BRimeltaZ/HOh2zRih/Q6fVMnNe3b3Q0SfPMzbk0wAHP4zZ
 85UlsfSIjGaYMGVR6FDi/sHkdvAhiGWPI6UYfTxog5t4weFNMLdbup6ajIq39LK9KAds
 fEvA==
X-Gm-Message-State: ACrzQf2BsozpJSMSf7yW3O6PF6273Tf8aCO6zugBX0pUxBa8yBcrvaua
 Sx2NRBdSeQsB8vXWgjsjlbBHdG4jBd8=
X-Google-Smtp-Source: AMsMyM4N63h9bixqc73JTeOHyOBezPwsdE6YUI64ImfBcaAua2iTelTYcWpHq1q3XUj5QLEUUCI3Bg==
X-Received: by 2002:a17:907:7e9f:b0:7ad:b389:1145 with SMTP id
 qb31-20020a1709077e9f00b007adb3891145mr35661388ejc.92.1667635455668; 
 Sat, 05 Nov 2022 01:04:15 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 rh16-20020a17090720f000b0077016f4c6d4sm600449ejb.55.2022.11.05.01.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 01:04:15 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  5 Nov 2022 09:04:07 +0100
Message-Id: <20221105080407.1228468-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221105080407.1228468-1-francois.perrad@gadz.org>
References: <20221105080407.1228468-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7FNqVttIoRqrWhTP4wc1ymcAe+1fbpnWdMWl14ulI4=;
 b=il+sLJCTRTiQywVBnmbiljUUreASidoT/H89BJXypQMbS9OdlulSm3Q6wM0o3SEr8G
 +brPqwjvHGhaaorNWtp9mF3vGVS55qiQudfODFwslh2ixBnWQVEjgb8Y8+YxDEU8ydan
 He6NpQaCmQbrFAg4JpG9csp9d9SURFUjd/Q9z7zzJrNtsiA2zuUTLR0ovjOt/dEwPzmC
 KV4pvicV6zkyShSvWfJwPf/pdKqvJrtBAKSLwgLKbQt5K4oxpu1Mbp3MoYliqBguu3eR
 KAtvl1ASpolax8XHC4GuwDihgW4sKOh79/oYNUWU3pjRSIQwaZQIvoj9Sc/cLhK3OWN4
 dRgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=il+sLJCT
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump to version 2022f
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index b203e5bf5..aadd32006 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2022-August/000072.html
-sha512  e2ae92abac6d87ce4ab4ba9012e868e1791b842e083293489debc0c671b9cf135b5b70426dacb6dbebbf6eba24463205225ae45bb7df891a086b25475f85ee0b  tzdata2022c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
+sha512  72d05d05be999075cdf57b896c0f4238b1b862d4d0ed92cc611736592a4ada14d47bd7f0fc8be39e7938a7f5940a903c8af41e87859482bcfab787d889d429f6  tzdata2022f.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 7a1a77fcd..45bd7cf6e 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2022c
+TZDATA_VERSION = 2022f
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
