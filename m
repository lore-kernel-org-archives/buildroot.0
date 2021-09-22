Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDC1C4332F
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:10:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF67061215
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF67061215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F94E40694;
	Wed, 22 Sep 2021 20:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9uJvayu9P1J; Wed, 22 Sep 2021 20:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D35406D2;
	Wed, 22 Sep 2021 20:10:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBC581BF32D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6DAD4018D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIaRVPa0XcER for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 20:10:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B262740121
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 20:10:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v24so14589722eda.3
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 13:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQEY1CSIuCG9iHqJOItNwJCoU3YPTg4gjyny5iGQrlo=;
 b=KtAlbCyTIxrrOMDPIlH8pRp8ySh2lsGZPkX3geiX+JvWkBv8JCbBvjDBg0sUB5o2KS
 q8jMxPzYKBzGyl7hn3pTlHVKbzACNw0GgsjK/OeSeP1R7UC5LEjO2CRaY2iQ07srumk9
 I84lU961IVEDnrS2vLUssqm6fNcEW8cZ1G3QhXiuA8yQ7MGyLPj518yjqPv3PA889mRR
 kjSsW3dbwqBiw1D97QzdrqnAGulRz2vT07IsbcNORZZ6uSEiRDuN0NW3n0ill5llCcu4
 0OXR67lFxq2PO9+VmzngtjGRQt4dszA9xXiZM8fXa9WIIgecRd9H6jtomELCyi0vNyO4
 h1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQEY1CSIuCG9iHqJOItNwJCoU3YPTg4gjyny5iGQrlo=;
 b=FtVihzRAqPqgP/KFeo/irTYrCKy4ZJKqctGKAa/3fF4k93v5ZHtwrRU9+P95AK8lwc
 B5xnOQRQadVKyjI0PzEOUFDrbcQuOzWFQIuc3iWZuAV4N2C2YU0ln7Ujsua5dim3Z0cl
 5KrGGo1e3IeWQEwJj1Y0y0hynKUCj1MfUYTRCeRIojo/jNfbr4V+vUi5l9zRUlU6ZHQe
 yzLAJCeSepIR9duP/F+xYnSaBle6AADnCwzyNJJ9afyOL6e3xQqi5hREB34vwS4Ax7ir
 WbwNxXkxgfSUJ5x7riC/VXLAJohMXZ4gMl0NEkbHMjYwkJWn2mX4dQt+RmvOx4ou3YbK
 J2IQ==
X-Gm-Message-State: AOAM532m2mdBFXEr4wITdqgqgQisAlZcW2Wx6Uw79m9HArjOQl7qEP3Z
 E1u7QAReuFrNRzdEnbthcyy6qhUrGHWBjw==
X-Google-Smtp-Source: ABdhPJxQV/+TtkeshTgR4AHSskgsb4xGCiOdC6ea29msKe4vljLIn38BNPb+UNdCiKyhYZfnf1SnDQ==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr1360460edd.135.1632341435761; 
 Wed, 22 Sep 2021 13:10:35 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b2sm662014edv.73.2021.09.22.13.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 13:10:35 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 22:10:27 +0200
Message-Id: <20210922201027.934860-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-9-romain.naour@gmail.com>
References: <20210912141140.253778-9-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: update docker image to
 20210922.2200
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Commit 71b83227128be62c169313e85bb8f339f977ad67 updated the Dockerfile
to be used in CI tests. In order to actually use this new docker image,
update .gitlab-ci.yml to point to the docker image that was created with
the updated Dockerfile.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bf9f2dca6c..150b8eac1a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: buildroot/base:20200814.2228
+image: buildroot/base:20210922.2200
 
 stages:
   - generate-gitlab-ci
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
