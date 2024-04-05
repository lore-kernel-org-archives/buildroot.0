Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89B8C67861
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 07:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D7824076F;
	Fri,  5 Apr 2024 07:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQDmBxXCVyT4; Fri,  5 Apr 2024 07:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11F8E407AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11F8E407AD;
	Fri,  5 Apr 2024 07:52:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB7A61BF33F
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 07:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D715E407AD
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 07:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qPKPojRm_Fp for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 07:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 330F24076F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330F24076F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 330F24076F
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 07:52:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4162fe73594so2362205e9.2
 for <buildroot@buildroot.org>; Fri, 05 Apr 2024 00:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712303560; x=1712908360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J4YlfCzbygWIk2hIBB7PUWOs8P2RiPP81zWPS9iqxi0=;
 b=HoSw5PJKXAz7NZxYg7wE091DONKzm8wqEWXZpFrqF3Wfzh6x9pevjfPT9cxqkLKiUk
 2j9E9RKIuTE3z2uVmn9vrF3W280mKnz7AcR+Inh+cKLudLhQ1nybk9fDVYD4OayEgOlH
 JFPutelyY0VCglgpqXTyTf8IupYasIuPeWpFm1x9sdDwFldPcqEmXmcLkQJg+z5P1DCJ
 pwWDfZzxJwNNrUb5IXHhNBvFOmCCS4vaof8VAWY64Ll/3dBynavZvFr7a3khlEHS52BM
 5eK5QBAkK8+zxRpOtH04GvKWVoP4jxctcv2IyMX7w+Y6olOFz2oTe2B6RpO2c8CdbwG6
 ORTA==
X-Gm-Message-State: AOJu0YwpSqtuQl2k/jK1kTS1xTYUAx4qDrA0eRgTRjdlegaIb5UtpRRS
 /Ch7HsY11q74F5LziyZxQOpCkciiaAdsC6SM8O3T29vU5FsjVXuetmS/+ZC5YHq95oIk9AQLx4N
 A9H0=
X-Google-Smtp-Source: AGHT+IFHtGrqYNBaV+v21lylSL3XpLwcydZBAnYt5K2B3MELtAYGOZvbi0ca6JaWs/pPDL1Gqah0Hg==
X-Received: by 2002:a05:600c:4e93:b0:415:691c:f83d with SMTP id
 f19-20020a05600c4e9300b00415691cf83dmr559604wmq.33.1712303559726; 
 Fri, 05 Apr 2024 00:52:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:faed:9680:1a03:7f6c])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b0041552dbc539sm1970983wmg.11.2024.04.05.00.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 00:52:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  5 Apr 2024 09:52:30 +0200
Message-ID: <20240405075230.809460-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1712303560; x=1712908360;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J4YlfCzbygWIk2hIBB7PUWOs8P2RiPP81zWPS9iqxi0=;
 b=R9cnDZy683DfYT9KY0WI7SKs2dclq7vn7O2VQB0HyUTPkAAlpz6lUaCwlVWyUv9tCY
 JDe6ZvLNZtLmcfxONsryZ9ADz0jVqc0Hd2fWw9cQ62lnLirW44j7wLKRyce0VMrM7TR6
 N0NtuwZEK08Ihnm/OnoClZSii3Pad8Pyh2j/A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=R9cnDZy6
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.177
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Support i.MX91
- Fix a crash with -d option when change back file.

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.177

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index e45cbb868078..0f746a763385 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  6e65fc028afacc94b805ae376e3da3864dcb2570d425037820e716207ab70373  uuu_source-uuu_1.5.165.tar.gz
+sha256  fac38e93714181fbfb0ff52b9cd29395c7eb342def5c3857da87e5429beb3927  uuu_source-uuu_1.5.177.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 5800277b10d5..b6611dc3d406 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.165
+UUU_VERSION = 1.5.177
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
