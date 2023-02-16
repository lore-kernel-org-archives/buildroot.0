Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71056C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 17:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFD41820E0;
	Thu, 16 Feb 2023 17:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD41820E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6kEV5e5Cnxb; Thu, 16 Feb 2023 17:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48CA0820DD;
	Thu, 16 Feb 2023 17:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48CA0820DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE6371BF2A9
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 17:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8719341963
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 17:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8719341963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cm1gxJkwCWdI for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 17:41:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D9D4195C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30D9D4195C
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 17:41:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id by3so2595056wrb.10
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 09:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Zej1fNsggs6tlGW+j20M1hnupI1l+KubYG6olVlLVM=;
 b=vxeRGR5+4RoIHFUlHX/6lxn0nyI9dpf/+vcJahQ11ZW5gFdNvXOZ9oSlOGeapa9Jej
 pRqCkKMqnWcaL9bCEm2U1sjF05tAGnT6PXnNkpx+OwyM+jQKlozGgPmp1q/uAIrDgegR
 TwcAPypqLUgBFHj9MbrP7grN//5BSCl72FC/xLISDmq5mdNB3QPFhamT2i0fLvi5lbd6
 4lQcnMr6c984E6QzALSpr9lfB7mAYTtFbWUXD0iWE55dxM/LvBUqlXFd3Mk35x0RulGf
 gX7vnqo55OmteTwD4fcN6eLq88TUW39t5C6/r2VTZA99xsppp2e6qhNcP9P9kuTC6RTB
 Vx2Q==
X-Gm-Message-State: AO0yUKX+NxHqYYe9HsMoiMgy/hiB1nJDF118HdtYyt66stLLomFTMpvv
 5PiNMVRUX0e1xsnfSDK+/Rgo3s7yqDE=
X-Google-Smtp-Source: AK7set+6+0RYg65KYpNgzWe+roTK2h3SPpI7nYDnii8PB9F/m57ti75fcwNcvCsUGohRQ0iuPmxi6g==
X-Received: by 2002:a5d:4f0a:0:b0:2c5:6081:5b3f with SMTP id
 c10-20020a5d4f0a000000b002c560815b3fmr5148658wru.69.1676569303785; 
 Thu, 16 Feb 2023 09:41:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f3-20020adffcc3000000b002c559626a50sm1933184wrs.13.2023.02.16.09.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:41:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 18:41:34 +0100
Message-Id: <20230216174134.34179-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Zej1fNsggs6tlGW+j20M1hnupI1l+KubYG6olVlLVM=;
 b=RDQGoGXGh1JKYBnICjWsiUMcIf0wMAocz2z8sa/EDYAzivm9vM7ocYWz+80k30lWwP
 z80SvAIq+IQ4udOI0lr77e525AatfhuSd/p/316ZBVQfQG5fsMw6dMOCOBK147MKweBM
 CTRsGrXhm0R44GMUzFMtLPYklq2OS0ZgHAmCvfiyP1o5ykgAMGBej9qqepqMWK0skmHC
 uCgrfqMq6Krhy9cSSUyhGP9Y1m+hNXSCU+f30K/04ldCTbjCbNrdbc6vRzEWx0spdg+s
 G0Z7t0bYL3DZf4B0dRULGFA/oZ6hde9QM3XdyILAuzrme46XFnqQ5zFzhkOEiQx/ksaD
 ZXMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RDQGoGXG
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 libexecinfo
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libexecinfo raised since commit
d649bcd3805a26cedb30120ebbdcf12f8fbf449f:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips-buildroot-linux-musl/10.4.0/../../../../mips-buildroot-linux-musl/bin/ld: ../lib/monkey/library/libmonkey.a(mk_utils.c.o): in function `mk_utils_stacktrace':
mk_utils.c:(.text+0x1578): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/63a6ba9104dfddbd7f6a7debadc0c6ef6e3a21f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluent-bit/fluent-bit.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index d618fdf1e2..8ba16399bb 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -56,6 +56,11 @@ FLUENT_BIT_CXXFLAGS += -fcommon
 FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
 FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+FLUENT_BIT_DEPENDENCIES += libexecinfo
+FLUENT_BIT_LDFLAGS += -lexecinfo
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 FLUENT_BIT_DEPENDENCIES += musl-fts
 FLUENT_BIT_LDFLAGS += -lfts
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
