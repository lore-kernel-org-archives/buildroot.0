Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C84ECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 18:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E953610C5;
	Thu, 15 Sep 2022 18:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E953610C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PGnfX71SO1E; Thu, 15 Sep 2022 18:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69562610BF;
	Thu, 15 Sep 2022 18:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69562610BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27DFE1BF5AA
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03CCD610BF
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03CCD610BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWPJb_keTLX9 for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 18:34:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F2FC60FC1
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F2FC60FC1
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 18:34:05 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id y11so1687014pjv.4
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 11:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xTSoc+czcyONAmJesQscY6lUoMEFk0JS+zaqxqBi6WY=;
 b=1nVkJ4BNwU8mTyRXFxN9VYXfCkRul800GnUODPPgEm+rIuPRriWLXfIfgjvaVDxIB8
 7gR7Aai2YRt1MgPIZh0u8yfL1C4Z0ACAwJIJr8GEzeQIdczY8yVhFJPPzI4Wq0ZU5Mhu
 GBzkYWbQFBBaU5jyKyYEpj3XWgwArsBtDi07wKtIpIcvW67il3YTci0QFj221x+yoWDF
 eS4I5RV+/CIFb1cJ+xQMBk9bevc4ekMTHYY6NWInK0Q/Vaoh9n3i00hIgw+hQg5EaOd5
 oI/QTvQEgcqj4NpkT88olRcdXuM4hWWBWCx8Fdo6bKNqx0jR0HcUFLkq+izo0WbDmmAF
 X2nw==
X-Gm-Message-State: ACrzQf0rwyuyvnlLFfHEZgpdi2EiMkG3Yv+YoYYjnnaZg4zXT4IG/UD0
 CSiDbo+bu1Q+9fFzQt8WIL3oCNBeIj7d2g==
X-Google-Smtp-Source: AMsMyM7byFt6w69MB8zhfjVrAE81RjLOjxi5CnbM3Ndq0Nd3iVrdMDDjDOCQlW7UuVwh59QiqWHSGQ==
X-Received: by 2002:a17:902:f542:b0:178:4f50:ac1c with SMTP id
 h2-20020a170902f54200b001784f50ac1cmr820523plf.127.1663266844239; 
 Thu, 15 Sep 2022 11:34:04 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y34-20020a631822000000b0041d6d37deb5sm11900403pgl.81.2022.09.15.11.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 11:34:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 11:33:59 -0700
Message-Id: <20220915183359.481550-2-christian@paral.in>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915183359.481550-1-christian@paral.in>
References: <20220915183359.481550-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: bump to version 20.10.18
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v20.10.18

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 87c5d949c6..8af47adc63 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ab2b59c2302017fea9ad2f70827e8a6f0204b557ce28e66bcb80fea262c9fbdc  docker-cli-20.10.17.tar.gz
+sha256  87ba64f76d3bb98666fa44552c3eb0b1c10e5e9c43010e8dbc180ba22690413a  docker-cli-20.10.18.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 75507ed48e..707069512e 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.17
+DOCKER_CLI_VERSION = 20.10.18
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
