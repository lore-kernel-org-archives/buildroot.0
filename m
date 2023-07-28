Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CBAC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 06:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 510664097C;
	Fri, 28 Jul 2023 06:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 510664097C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HoCvlVt8RG_c; Fri, 28 Jul 2023 06:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78A0542C6A;
	Fri, 28 Jul 2023 06:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A0542C6A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1BFB1BF836
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 06:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8DA983C0B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 06:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8DA983C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwGV1DSDkR8Y for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 06:41:34 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD62883BF5
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 06:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD62883BF5
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b9ecf0cb4cso11841955ad.2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 23:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690526493; x=1691131293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jLbUyh78bD9nKHqc70OPtYlw60uOhS/16NBi9EfffA=;
 b=UMnUWHAebYQ1ImC5ucEYzJfSqkXM5UhfayqcRUxmznypEOHmMupAd/bSbTPXAXn0Zq
 75MfbcnJRtlaydQa5FSWbk6SbF4Qgqu0DsmLJxdNqS1kvDi6AxxpylLHTlwXYLsDE65h
 7XJ3IG04Wazh9P+ozhV3hwa2EYsczho9M1iG70boVeNAojWDlJ6I9NkQKVTCONvIj+90
 r9gBFgiGpF2FvUtcYue+Obf4mfhaWw+pYISimik679TDtWj8bDQNMJOOvTGTnbNeaz8u
 fCiM7txOR7XMeBggYWvbp58M5QKdwNCeVJvQxGDsCnTcX+8SBK3sPxIFEn0WJCusxR+v
 TDLQ==
X-Gm-Message-State: ABy/qLaXQ9+ibMaGae/Tx5UpH/bE+2Pclydjtd6zQTUrF/UlRW70oyLi
 WHCAaaOYXYOqBVS/QqTokg74A7JCmguG0Am1bixuoJTHDpnmRQ==
X-Google-Smtp-Source: APBJJlGGKE8mQAgqs75XjZ9pk3rJheD/0ezBy+xw1z2mJhdgntrXTX6GHH5LC7V0E9WtBdio1Zt6ug==
X-Received: by 2002:a17:902:f686:b0:1b6:bced:1dc2 with SMTP id
 l6-20020a170902f68600b001b6bced1dc2mr584504plg.0.1690526492900; 
 Thu, 27 Jul 2023 23:41:32 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jh3-20020a170903328300b001b50cbc0b4fsm2767428plb.111.2023.07.27.23.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 23:41:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:41:23 -0700
Message-ID: <20230728064123.1220713-2-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728064123.1220713-1-christian@aperture.us>
References: <20230728064123.1220713-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690526493; x=1691131293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jLbUyh78bD9nKHqc70OPtYlw60uOhS/16NBi9EfffA=;
 b=TkDXZHq9HVjLoiX31TwSpc8aWQSedcXkfw09+tCtOcruo21GrClK8FCqTjvdB9ZFIO
 QpRBja/xLY27zKEw9hnNlpbl4UiBD8Ch/6DHIPtEc96ou/UEWF+5tSLdpItEAwAFOk3j
 Z90CVFce+CiVFMIDaeNnM1mlIBu7RiGrhM8avsKCMsP1ESQSSNRXxdfNX0MSQGIrb3Uv
 AAKAlcIjmbWhWqK/h7PckpcOpEYlEhfORbautckkjmNcczf4xVKX9k1IUB9sPWLG2EeL
 p2C8N7mFB9wxEyT+RDVWZGmw9AB+EgLLhg+a6hvqgjkuH8QRsiqNye9RT/Hc6IxJ7rvV
 2LiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=TkDXZHq9
Subject: [Buildroot] [PATCH v2 2/2] package/docker-cli: bump version to
 v24.0.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes & enhancements.

One major bug fix included in this release: The Go client now avoids using UNIX
socket paths in the HTTP Host: header, in order to be compatible with changes
introduced in go1.20.6.

Previously docker commands would fail with "invalid Host header."

https://github.com/moby/moby/releases/tag/v24.0.5

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - fix version number for docker-cli

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 2ccf1d98b9..95050be88b 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc1d025fd16b113a1a7e2a5d34c30409613d9c4ec313937f17bf34991caf597f  docker-cli-24.0.4.tar.gz
+sha256  fa32b5f3c2f85fba9ef6e1b5099a4b608fa20af45ba71b3da2194e8728037eec  docker-cli-24.0.5.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 9b657093cb..4c38e7cba5 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 24.0.4
+DOCKER_CLI_VERSION = 24.0.5
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
