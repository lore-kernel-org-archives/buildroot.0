Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D55C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 20:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3B083B35;
	Tue, 16 May 2023 20:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A3B083B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkrHSkaSXXkC; Tue, 16 May 2023 20:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409668424E;
	Tue, 16 May 2023 20:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 409668424E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71D981BF426
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A412420E6
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A412420E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9NEe7cl0KqY for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 20:56:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C2AE41F74
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C2AE41F74
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:56:00 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6439df6c268so9644161b3a.0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684270559; x=1686862559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fH4wOFIOQQNLE+xfdC9XgH2Xh2t17BnFnzpveZtmv3M=;
 b=jFjdgj4HfTHiPsR21UZTcnu01YWSUWkcE0dvhZoKpIl5hQ9GxOjrnhifHI6hljlfXT
 ymD9gztU4kPwkjswKOEDAdvNxjlrz8mWhse+OFCKOtqNrycZkGNs5DRFmfYiTHrZ9t08
 fENa/BpczMKSGQiF0DIEbstgcQ21kenDM71BAEtDo085Aqb4KDq9OR1P1rRCZnMoXh5n
 qXOnV8HTD2qAep4i4TACvsEyBqRZClFGVdZFtlYNs1dipxGqDXe3kmrTPglImttPxtsD
 EpP9rMiARC83Jx6p+T31OS6ngom/oaV3xpPIPe0dCeWUWJtMIkc8ca7ISXKn1wxh4HUS
 MBOA==
X-Gm-Message-State: AC+VfDycVzl9ZEigxCjUZT8lNUNKj2Z/rY9Dox7S+Dv9ieynV9jGQru2
 mf4hY1P/w0Hf3dW7DiHAYZq88oTLJBnTUKSlMQ8CdBNq
X-Google-Smtp-Source: ACHHUZ5cyP9SJMCr7wrk2/QZdkA1ugd/mxA1jZSFzZM7Xt+60CnwFcpedTJwoWLKRx/v0k+Ttg5d2w==
X-Received: by 2002:a05:6a00:80c:b0:64c:b45e:bcbf with SMTP id
 m12-20020a056a00080c00b0064cb45ebcbfmr6886847pfk.4.1684270559570; 
 Tue, 16 May 2023 13:55:59 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 i8-20020aa79088000000b0064afdc88465sm6371836pfa.213.2023.05.16.13.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 13:55:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 13:55:54 -0700
Message-Id: <20230516205554.841557-2-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516205554.841557-1-christian@aperture.us>
References: <20230516205554.841557-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684270559; x=1686862559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fH4wOFIOQQNLE+xfdC9XgH2Xh2t17BnFnzpveZtmv3M=;
 b=KGGsqF9gVsiI0c2uuoCje5NmhMJZcyYCnHLqNnnPpEQFXfD9r7vcZqvuwiLzqjBaAl
 pZZigH3CuxWe2JCxvzLjb7BCiE8es3/5IZ5Ri0+TXZC2IOgjJ6c8VqodtSjw6ECf3Wtm
 fO63C+d7agKrudxFiU2aSHbPRueIZTsa7dFWjOTqD41FGtqq4ltaNWYC86uCsE9uiYkX
 JbpCJZhM2Aq+G75kfDhaZBNiMTCNCegcgysFl+OzMfW0fi6ubKJ3ldz+SIkriCqIOU2n
 6Sawq5/iS5+znpV9ROks8y6UlFNwH93UxhI3IjTOgxyzJVNNzyOyffoFR11lffEsOZPf
 LsmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=KGGsqF9g
Subject: [Buildroot] [PATCH v1 2/2] package/docker-engine: bump version to
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
https://github.com/moby/moby/issues?q=is%3Aclosed+milestone%3A24.0.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 092ec989cf..14647a900e 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f502eba135828ae52cefb12f1c74092c8865e39cb94f5daed0f3f6717a8d50a3  docker-engine-23.0.5.tar.gz
+sha256  62243fe5d1549cb106461ce4a144e81a18d9e2683051f9f6ec201f3ab4d90075  docker-engine-24.0.0.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index f904793aa2..f2b12f0f28 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.5
+DOCKER_ENGINE_VERSION = 24.0.0
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
