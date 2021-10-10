Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432BAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 06:13:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0DA260F92
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 06:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0DA260F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4762740282;
	Sun, 10 Oct 2021 06:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ihTusZ2C4Pf; Sun, 10 Oct 2021 06:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B59340190;
	Sun, 10 Oct 2021 06:13:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67D771BF4D8
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 06:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5794282C99
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 06:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cd0gzGMGZWcY for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 06:13:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AE2382B84
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 06:13:13 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id r19so56259414lfe.10
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 23:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/FOKVXcbzi93QWP7+jDZoB6JI0YRp/TJJ5VaZ84gNCo=;
 b=HD2nutAgiXAe9GVgz/4T+xKz7SavTVeqRy0n+As61U9hDirRt65L6YAJCqkZ6P7Cac
 BjrmzmtCqx3u43/vYSwijly0Ns9spzzMyp1uYogg74kwHTeblIamq+UxPRwoOJfl1jEh
 4LGPcEHvlMZc7wMwrHMDqLmy8lAMGIjlxira5txC5PDIo6sKr9jMNhnU7z4bZ4WvstWe
 XJwR5aa+q12SCplHeOouHJbm3gQcbDwV5w1RsHx0xoFjZdO7rLcRFtSXd6lcXoSApXfa
 xINU3gK5ahdbIIIbdQY18TzXefzHcMZeUAIzhqqu0K+mXrjWvgczOJELEd6YYl1DeNAG
 zP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/FOKVXcbzi93QWP7+jDZoB6JI0YRp/TJJ5VaZ84gNCo=;
 b=w58xDH3rjVQH6IOOXv2q5lp92QMztP4P5BW6R2NkOjFpSYLD+4vqcqXW6FyEbWUTJ5
 90lIDuZqLm8hsXAnnneyuD48KePOMxfqNg8G07DvUAfEURpZnLya3dQ52F/Cn6htZtJF
 +OCcO6s5jldXbRKAV9dZNXTMQgpVwBgRkug30Yvde6YDYdmi/35chcKp+gQpKRPPfqy+
 rBhqH2GstnlPRoAizY+LGrdvOTETLHQBh3SrApMOhVZMNeI4iV0E79ZTvJwoKqtRHknC
 CiJ+Y25nQeEdg2hE41PMggEAdQTdyWJijWCbsD1b8mIvf4syG6zasm46x5GPiU9uj/r/
 U3OQ==
X-Gm-Message-State: AOAM530Llf7NzZrlgLLyD04vpfDczf5kFxBgnpDnRJt3KRPDAdzoLrF5
 BsAp3MS32O/KZm67XEYqKLBOCk1MFmhNlA==
X-Google-Smtp-Source: ABdhPJxkzgvxmBfHUlFKvJAPFjhcB+OE0MgvVUX8FZmT6doWt0JPgQIutrPDdFGtYpTzg3JctabDmA==
X-Received: by 2002:a05:651c:1611:: with SMTP id
 f17mr14699988ljq.356.1633846391625; 
 Sat, 09 Oct 2021 23:13:11 -0700 (PDT)
Received: from localhost.localdomain ([94.254.51.197])
 by smtp.gmail.com with ESMTPSA id d13sm382577lfi.48.2021.10.09.23.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 23:13:11 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 08:13:00 +0200
Message-Id: <20211010061300.469361-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libuev: add myself as co-maintainer
 in DEVELOPERS
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding myself as co-maintainer of libuev alongside Peter Seiderer, his
initiative, and I am the upstream so seems logical.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ebfc9234b..f8cacc3d10 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1331,6 +1331,7 @@ N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
 F:	package/libite/
+F:	package/libuev/
 F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
