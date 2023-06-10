Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ECFC7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 12:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DBD140195;
	Sat, 10 Jun 2023 12:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DBD140195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDcR6yluIguj; Sat, 10 Jun 2023 12:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38105405C0;
	Sat, 10 Jun 2023 12:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38105405C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 939711BF377
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 12:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CAA460C02
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 12:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAA460C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUYnCCxY6trK for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 12:08:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FC2560AB0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FC2560AB0
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 12:08:23 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b3b56dcf1bso662755ad.2
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 05:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686398902; x=1688990902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBe3I0j2SasFk5J5vGUij4sUigBYJFguCY0hyJPeedY=;
 b=jnpobMcOLDAt6SqLKG6nGxXtGb4RHMKVbeZcBtXpNf1Juf3jnlqqr5Im5UQXZsuTi/
 C3z+yzZekolNTmSRtX9DB0TGcIVpUeviGfDlQg1PFIYODHp/Tf4mvX6yJx0DImUwSb2/
 jWAMFLsHbJB+79ajV3MSic+j7eOFIPNO1zerNeXmYmsS3H7yIFHsLPLP5zWDZw40HE4J
 v4INfxiBVQVwtcph4zve8QV2G2SJ74mAyy5fO6SbdzCZnxK+rGkQZOWZpneKswwvhbyO
 E+TOc3fE4I/526F7RD4LvZeGsCrHfYDxjJnEYwPR7gC6zerIPv4mShZibYi5Wub5J8ft
 cWiA==
X-Gm-Message-State: AC+VfDwDVPu+hV11ZDTMWvLusQGUSf9cUJWV1fj4FmJbiXfYQzAhO4qL
 AU7R0A/NCEKJ+VoFYefWLadw2MDnrHI4OyNx5fFjKapi
X-Google-Smtp-Source: ACHHUZ5srSjPow+dTbJu1XpUmE1swXRd+SEXXgUKACe4y1HFlyZGfU5HjaCzVGMeMeXVBvwKNyr/lQ==
X-Received: by 2002:a17:902:da84:b0:1ae:10b3:61e9 with SMTP id
 j4-20020a170902da8400b001ae10b361e9mr1958478plx.65.1686398902574; 
 Sat, 10 Jun 2023 05:08:22 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jj12-20020a170903048c00b001ac2c3e54adsm4894219plb.118.2023.06.10.05.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 05:08:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 05:08:18 -0700
Message-ID: <20230610120818.968354-2-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230610120818.968354-1-christian@aperture.us>
References: <20230610120818.968354-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1686398902; x=1688990902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBe3I0j2SasFk5J5vGUij4sUigBYJFguCY0hyJPeedY=;
 b=G6mhtkdjiVzExo0/gwaK70LMa+x5JQlm3kOH9//jLjI6oksllzv9n96aaKkt5JOgUW
 BLZPxwIyMFbz84WM+Zai9s9xWvdJkNsC+CnnzRc4CWA8ruDDtIx/b1ApvzDUhNk6OROt
 D+2RhEAyd0GFys1N4y4105m43h1FXJzSMvwm832g+QyT4/DFkQCSuIDPcIhphO4Whwkt
 Ng+tlD4yY9K5y57GTnm10e/YbNxp+VkA2Fhshm1fWyQR4UW5/gtqqDa86ciOg/u4kZkX
 rDCsznRJFBDfJHPkY0iX7Wc7ymExZlLyfITxUWlvFtXCMIdBkmA3uSVzLGs9IOFM+All
 ebHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=G6mhtkdj
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: bump version to v24.0.1
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

v24.0.2 patch release notes:

https://github.com/moby/moby/releases/tag/v24.0.2
https://github.com/docker/cli/releases/tag/v24.0.2
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A24.0.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index e9e9a18cb1..dd5d598278 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2d6599783d447ac56d4caa482e9d8f09ad9e6f91ba2be6707bc107be04f89ddd  docker-cli-23.0.5.tar.gz
+sha256  632357aa58d7f5e16ce87dbd73641c5f65c25b6501e3917ac4f0ce553a01e0bc  docker-cli-24.0.2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 522971ac98..ddd3e7bf91 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 23.0.5
+DOCKER_CLI_VERSION = 24.0.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
