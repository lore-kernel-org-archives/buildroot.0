Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78518C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 00:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0491C612FC;
	Sat, 20 May 2023 00:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0491C612FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-IoBVK40Nx0; Sat, 20 May 2023 00:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B60F612F0;
	Sat, 20 May 2023 00:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B60F612F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41B041BF407
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 00:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B24D612D9
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 00:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B24D612D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbN1CeC3N-oj for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 00:04:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16601612A9
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16601612A9
 for <buildroot@buildroot.org>; Sat, 20 May 2023 00:04:37 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64d3bc502ddso1213415b3a.0
 for <buildroot@buildroot.org>; Fri, 19 May 2023 17:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684541077; x=1687133077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FD0dxwV5KsuAlhIiE7VInTd962oQ2aSu0m2+VRgCEWg=;
 b=bdnj6guOcMUAEalxVMoBNA58SzzeDsdykFAZ6p//vJejnH4U9jR2bfFMsA6bCYHNWJ
 8xb1GL+ILHgGbaV7XZrb6gmlvlOfiH7Bmy1561uZNoKWkJiFeabJHxrpu0kzVb3+ztxV
 WAM0QtHTGIRZtaUkaIiwQ5gnXqqWFkS11qDYzHONBAgTXQA/SJayMNd7uVvlqLCSVciL
 z/Lt1105PhOJ2Q/SlZ4FY1/f/k20d6cIZCdYjzVjwU7nplSw6i7f0UCUxPU87A+0M26X
 50X6br6a0K0JA246Ygd6V97VatuYu65smb89xXgSMRvJoPiiADo55VPnFIbbyJir/NWE
 aPCQ==
X-Gm-Message-State: AC+VfDwA5uaUfgfbpfFLK8tPt9LCXD7QFMkwsPTg1MhDUbhs6eeCGwAw
 Cdn0Una1y6fdEKvckh2KyvLo+cVERxKWYR8gMOdAxoMh
X-Google-Smtp-Source: ACHHUZ6VZ7Y8m7FZlh54CqJaPqw7w0UZ2PeZWAdSw+lMz0cw439l2wGcDYmADfDDXcTqt0YK0u2Pnw==
X-Received: by 2002:a05:6a00:1505:b0:64c:c5c0:6e01 with SMTP id
 q5-20020a056a00150500b0064cc5c06e01mr5796042pfu.31.1684541077339; 
 Fri, 19 May 2023 17:04:37 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d22-20020a631d16000000b0050be8e0b94csm253334pgd.90.2023.05.19.17.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 17:04:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 19 May 2023 17:04:33 -0700
Message-Id: <20230520000433.9841-2-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230520000433.9841-1-christian@aperture.us>
References: <20230520000433.9841-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684541077; x=1687133077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FD0dxwV5KsuAlhIiE7VInTd962oQ2aSu0m2+VRgCEWg=;
 b=G9WxUQhxeMLDkb9PrfY6BgEIDj1tO1qBaYeUAWBCOhN7xFA0tkSAc/i/+wpC/973oq
 qqlAUVTbd4f82TwLIqUu5bzLwBJH2QdMSAgODi3Q2MMPxnPv5b/M2qigKiKF1je5Cw/Y
 vFdCYm4i4eUEFcnog2/MH2b3rV5/zeTWkbNAcjOo3Gg5j7VxRkYa8+iBKJDGBJBpVMxY
 jOEfKTaBvUlMy//VVnoQBcGCMrATEIy3OrNySgrFHdI3zTd8fbf93KCqvklwIBJ+doNs
 2x/49QGz1zLX0LZubpRDeQv71k+tmgPMp/XTQPFMQkU1L/LGLvZShFNKCtU1X+Bk+1kt
 03Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=G9WxUQhx
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 v24.0.1
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

v24.0.0 release notes:

https://github.com/moby/moby/releases/tag/v24.0.0
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A24.0.0

v24.0.1 patch release notes:

https://github.com/moby/moby/releases/tag/v24.0.1
https://github.com/docker/cli/releases/tag/v24.0.1
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A24.0.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index e9e9a18cb1..9d137de3a1 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2d6599783d447ac56d4caa482e9d8f09ad9e6f91ba2be6707bc107be04f89ddd  docker-cli-23.0.5.tar.gz
+sha256  f5916273959fb2df56424bb2c26d8b6feb9a148dd15eb400aedd5d3753e06959  docker-cli-24.0.1.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 522971ac98..6ff2682335 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 23.0.5
+DOCKER_CLI_VERSION = 24.0.1
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
