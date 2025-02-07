Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07283C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 15:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A99BC80BC2;
	Fri,  7 Feb 2025 15:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydWN9OcNIoE3; Fri,  7 Feb 2025 15:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B347681B0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B347681B0A;
	Fri,  7 Feb 2025 15:02:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C19E8C0
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A20A9403F3
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gqvo-ytlTqb3 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 15:01:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 710214026B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 710214026B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 710214026B
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:01:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso14752205e9.0
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 07:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738940516; x=1739545316;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vDrXTYGSgIT24uzEqWDNqMJ2fQdkH1S382YBr5k51Mc=;
 b=WEwF3tX/LPv0YSsO+hXJG1dvav61RH2McU5tJncJJpurzYCB4RWkEZYomGCeLOo7dp
 04FimVQKbg4OUKSonKvsj9Dek33G5UEWcOnqkC3Z1MHXB1rjtBgLLUXDdWFi/J8//iht
 Ea63hP7xPs0NPh4J07ZTq8MVll0Fsr7yPEuEJpKx48HRqcvnANqidGZ8P15ZWZuMciw4
 +iEipbwgTNmmJMTUJc1J8PtoV1aDSzvEG0hNhfsrv7WFyEcaNnG0fhyza1ulPOFOQnru
 t90jMz400y3k3UI7+z1IzTzwjb17bXZhOrKxK0u/ozR4DeTAxqppxGfqekwLUBJteSMP
 FAsw==
X-Gm-Message-State: AOJu0YzrEXrCkHZjsYGSs9oK1R7MIrAFFmMR3ZZFTs5M2KcwjC3BhYsF
 zi10j+clUhXcCaIWYCtS2Mfm9is/yRx9D8AkQ13VJKYGLjwLK+beliqYmpDwhMN9dHGAMwia8Ph
 UzD8=
X-Gm-Gg: ASbGncvBZKKre+LPqlaRAODLGjuWak5NI9RRXMAkd/nyKUwlaNBeuyM4uhn6qGBIhUh
 qtvBicSzMd0dImh0PmypKwXc4POlpos4RrN/8u+KKN0InDQZvXAds0wcIH/5DYfX9wgtexFI/oe
 DOzXHt9r7pG8KcL65KBosTdOEfJKw7rQ8Cw/E2fa/Hn9oO0dxvc5R/XkMfcwe6rUeayhuCvJiZx
 5/Euhk5ZDWK6gpcaI3GtXkZHSjI6QssnJ9qKz7AsgOp45prpX6vM/WlvZ9EhSJtAA54KNkx+dSM
 8bPTvU2rtMCPPX0yXwa+tO6fwTOuLlENcOW5gjoZBtRJPomgGdigce8bbgj86+vA0DHtGF1Xp/t
 c4O9vweSnxOubtsRrwLoZYCI5eK/if9Z0RITSQg==
X-Google-Smtp-Source: AGHT+IEMpTJDq8hhRgnvVi8bT4isZYSAZyMRmftDyURxrFQTcYJhvTmYdA0dnmkyUaHG1N4pli28/w==
X-Received: by 2002:a05:6000:1865:b0:38d:b8d0:a184 with SMTP id
 ffacd0b85a97d-38dc935d7fbmr2327420f8f.36.1738940513256; 
 Fri, 07 Feb 2025 07:01:53 -0800 (PST)
Received: from RccLenovo-T14S.amarulasolutions.com
 (host-80-116-124-31.retail.telecomitalia.it. [80.116.124.31])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b80fb0sm2656489a12.39.2025.02.07.07.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:01:52 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 linux-amarula@amarulasolutions.com, dario.binacchi@amarulasolutions.com,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Fri,  7 Feb 2025 16:01:49 +0100
Message-Id: <20250207150149.15505-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1738940516; x=1739545316;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vDrXTYGSgIT24uzEqWDNqMJ2fQdkH1S382YBr5k51Mc=;
 b=LnRy33xppWiCtk8hc72uWAnH+Qs+kIbddmBKzqR462Uy2qanpaxTGkIqGgP3aJabnO
 O+NmX6m1N5W37whIIyj4DjA3In4ZtGHiYCTUuLUL/pwvMs7LZKrOqKNazTaQ9DDFHnAK
 zkAyI3IlFLDw4bXs6lNkFaZ3KSHa/AXIjMZEg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LnRy33xp
Subject: [Buildroot] [PATCH v2 1/1] package/cutekeyboard: bump version to
 1.3.0
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

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>

---
Changes in v2:
- Replaced SHA1 with tag of the version
- Added sha256 for cutekeyboard-v1.3.0.tar.gz
 
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 3d3ec2f858..53b438cc1f 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cbaddc5fbf479d5e20fc88228e9af5928fa5e588052ee496c2f2efbe2afc510  cutekeyboard-afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7.tar.gz
+sha256  0f0af01ec99ad07607d2e58c2feee1fba37c9cb7118e8af309fa021f599aec86  cutekeyboard-v1.3.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index a7b3ba7a1d..775bed0fe9 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7
+CUTEKEYBOARD_VERSION = v1.3.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
