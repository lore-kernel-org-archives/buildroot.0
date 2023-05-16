Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBA3C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 879EF84250;
	Tue, 16 May 2023 20:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 879EF84250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7Z5Mh6LfgHl; Tue, 16 May 2023 20:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB3C8424E;
	Tue, 16 May 2023 20:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFB3C8424E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8358E1BF426
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CA5B40C5A
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CA5B40C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnah33RuUUFQ for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 20:55:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A12C403C8
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A12C403C8
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:55:59 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-52160f75920so10254040a12.2
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684270558; x=1686862558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Xjvc8JMhokWYnJT1H1inbArMirfEEBS0SuW/TlmM9w=;
 b=Me8JaHGVS1I3Tz4cYB5det+822OCKHniB4dAsy1HtCJK3CkAdaZQzM07L11PcMt93r
 zinZdMjAD4NYyYA02zMp4bKm0uUcjM+8RYcS1PzK/f83skoe/hvoUsSgXBiGcRIA0nvq
 4MMUKQ7PNQXDu8EdcyYFyQywJRNlS1jX53sG4s/rOJ62mR7sOKAQELs3Nh+DCkeH20R0
 2JF8RlGz0DLubYTDt1ggkgcW4gMHxaqI5u4DZpVy2rLX+ryBAkg8LkstXN8GOkeWIugq
 KsmNnbpFrfnEICQkCTkkLd7EFcA8DTS2M734gs6E1Uhr4BN295P9PaSN/tvJcja2j/1b
 9TlA==
X-Gm-Message-State: AC+VfDyTHy/gLjal8Nz7hTwmbS+w4OL6Fqdoj+K8tacTSariqAEPkNUh
 ETQOai4IQq6W25ggQI0ONqvX85QdcpOPh6FfUvZxVQ==
X-Google-Smtp-Source: ACHHUZ4+3UHUeEs8BntEyvr0BlMflbzUXDWuqTpnqjujCUhpIC7+wC9vI7VZSrQAJRyGhOCFuZvPnw==
X-Received: by 2002:a05:6a20:12cf:b0:104:1016:dd4d with SMTP id
 v15-20020a056a2012cf00b001041016dd4dmr24778520pzg.57.1684270558487; 
 Tue, 16 May 2023 13:55:58 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 i8-20020aa79088000000b0064afdc88465sm6371836pfa.213.2023.05.16.13.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 13:55:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 13:55:53 -0700
Message-Id: <20230516205554.841557-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684270558; x=1686862558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Xjvc8JMhokWYnJT1H1inbArMirfEEBS0SuW/TlmM9w=;
 b=LtYFePStdRkzoviI51o69mQc/b7tFPxs0oyaGJFzT+pG68D6PokyIzWqbmblO6IPjk
 4nJIpRD/L++XshltuOA2iKk/DfBxD5l4kzsDJ4BX/6Msd5uB9iFQ8BTX0Szfh6Wi6OLU
 2bOv5B5bb9vwXreU9RiSyeIOUfGpUHVBCffhfOHtsjAXoXB458P6Pgav1Xr2FywnYk0T
 TsIYsSMm49blZZc5rkv+THry3LqVnvFQpU4S7mCuWR3+aIQ30tFg2Y0GxMCaG6JOK6h5
 dS0TOaMLitlcXKtDfPDODi4k6f0ATXKoJJLE8Fzm6bs1vzute0f8rH6KmPiGPFRTAaIH
 Eebw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=LtYFePSt
Subject: [Buildroot] [PATCH v1 1/2] package/docker-cli: bump version to
 v24.0.0
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
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v24.0.0
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A24.0.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index e9e9a18cb1..cf54c8116b 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2d6599783d447ac56d4caa482e9d8f09ad9e6f91ba2be6707bc107be04f89ddd  docker-cli-23.0.5.tar.gz
+sha256  67260439687cc7f5135e93a6e566106db49791833190695d716f9116edb15d0f  docker-cli-24.0.0.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 522971ac98..2508162566 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 23.0.5
+DOCKER_CLI_VERSION = 24.0.0
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
