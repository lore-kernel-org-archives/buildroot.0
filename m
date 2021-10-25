Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83343C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A6F60232
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9A6F60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yuriev.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D3D06085F;
	Mon, 25 Oct 2021 18:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xQGVeeun9Yx; Mon, 25 Oct 2021 18:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6AD260799;
	Mon, 25 Oct 2021 18:14:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 163691BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 059A740447
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yuriev-ru.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BoKdtNARKSQG for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:14:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3C5E40445
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:14:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j9so11401782lfu.7
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev-ru.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aIn0y3P3u6bpLWKHopJ59PDdXoPxjCrZ5xYkRpswq1g=;
 b=AtuWIszrsSNHJ2Q3h1+rp63c74CSom8oEnt7ZEiLNIwEorP7SdidaC5J/z0ktzh8lc
 OiKrRpjT4yJON1XZQU1LFxP5icGOTOiz8QlqQmtDVnt9ibZG/oLsrqL/6YbmLsjzfT0j
 UAgpu1rYasEjgVLKoYiSSD1Rx/NWLwshGyrJLQQ4L0Brls/SSRa/Qyw4wqo/3j6HYRQj
 4+ITXgY2KucEEin8v1k6TAkmHUGAWMwxsSHWHhm5xSG1kKyUQh6eS3fWdsC2uVZXcS1N
 KtR2mcbh0RGV5HH8EdSE+yN1Qqtk7vP8y82gbY+CCEDIAF8J7SFfR77KyBp5nrCkctEr
 qpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aIn0y3P3u6bpLWKHopJ59PDdXoPxjCrZ5xYkRpswq1g=;
 b=CT7z/qgkvQgSLrIqnHGDyJT6KewKDlF10YYi6Q6FU04qcmhvCNs/iotbLNW+HqoD2Q
 MhRYUNiD04nBMCizhsLzTHp35D4yT0wSodnKayRmFYs6VN+8SgB0yL++Z1L8J1V1FVSv
 0CYlWYLA+wNOZ/4Gs8KN2qTjiQ48Q5N3JM5qy3/2j8ULUvMiyJrYEmx59HXEK/Rd8C0P
 kL5xMIbtw+nibSQNM9JP+hmy57/H8utt/wkQaLi7bgH6dNzoF0Mh+bMOadA4OZhcWPBP
 6DB+FRaW6Y445T/iXhv/DJgCTshOdMxByxQm+1HLSbnvZ1w87jivpz1Qq197WLUV1v5n
 sW4w==
X-Gm-Message-State: AOAM532jcXXi4kPYr8AhdTYVLxsyre5F2TfMGcrQmzYlYxp1mwOZsber
 LNetxAbiL955q/Vel6spkdIKLMc2xP9oow==
X-Google-Smtp-Source: ABdhPJxsuGFagchX1z7WzUobFU4RF5RNEMwhusv4ZjVQjKxkrEsSc0pnRpQFDzM97uwjS1S70tvnwA==
X-Received: by 2002:a05:6512:2311:: with SMTP id
 o17mr18147318lfu.246.1635185671116; 
 Mon, 25 Oct 2021 11:14:31 -0700 (PDT)
Received: from ly-ThinkPad-X1-Carbon-2nd.ptsecurity.com ([85.26.183.151])
 by smtp.gmail.com with ESMTPSA id f1sm39281lfg.189.2021.10.25.11.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 11:14:30 -0700 (PDT)
From: Leonid Yuriev <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 21:14:09 +0300
Message-Id: <20211025181410.1346690-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.1 (stable,
 bugfix release).
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
Cc: Leonid Yuriev <leo@yuriev.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is stable bugfix release of libmdbx. So it is reasonable to backport
this patch to all applicable releases/branches of buildroot.

Please refer to the ChangeLog for more historical information and actual TODOs.
https://github.com/erthink/libmdbx/blob/master/ChangeLog.md

Release notes: https://github.com/erthink/libmdbx/releases/tag/v0.11.1

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 7cc835a96a..c8b50f9ac3 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://github.com/erthink/libmdbx/releases/
-sha256  a8f2436c4d008886e044f568a22bda44329fb1c67f175d91a929ff8e2065340a  libmdbx-amalgamated-0.10.3.tar.gz
+sha256  f954ba8c9768914a92c2b46aac0d66bec674dbb4d7b0f01e362ea2921746ddaa  libmdbx-amalgamated-0.11.1.tar.gz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 76bd56dfd7..02d00b1a5a 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.10.3
+LIBMDBX_VERSION = 0.11.1
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
 LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
