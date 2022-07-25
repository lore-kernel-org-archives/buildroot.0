Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949AFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 17:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE05419C8;
	Mon, 25 Jul 2022 17:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE05419C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zpmv-EuPkqKa; Mon, 25 Jul 2022 17:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 973504199B;
	Mon, 25 Jul 2022 17:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 973504199B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F53A1BF396
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28DD14026A
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28DD14026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeI5-6Tg9rb9 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 17:50:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE0AF4012F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE0AF4012F
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 17:50:55 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b26so17080258wrc.2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VdQn1FhyaypRBGTZ3jgTTYL6AF8g4AZikpH+7vXTyE=;
 b=fxNUO4CRMDOj2nP886Y5Sc3+tB6uQOBVA4U9zIVQ71V++0AtCVGENMqhQyiprjqIkJ
 7zaiqsJLdoevVoos1zc81a9PyEuKdpQ0WC1qXIP7DN3IC1O3sGhLo/iWhvEDIq47wkLU
 0M7ca8HtYxUu4X2A8BtLd6ghb8MPqoEZcyCBLU8X1eJWGy2FMoCaARgDHzUOMFuFtLlu
 XJIn4TOdJbEDw9kvz4B/YChuU++Cf9ZyEUFWfsbGzi6RU5CRlPndGPJZE0yjime/gUzS
 7YWJ9AJgRiqFYBpTLzEa+Tk3LhL4AuQNiRsC9fOIUR9ap2VzSG9NaMFgL+aDCWNHfRHC
 vddQ==
X-Gm-Message-State: AJIora9qxcLvB7vNgIzS+DstOOmklgChow+4n9aXQiI/coKEOXjJL+L6
 UhxgQtL6OObX5IL/OZWUXIRNKmxYcki5aw==
X-Google-Smtp-Source: AGRyM1ua54dqYleCR933aVv3V/83sckZIh4lRMhU+YWdnTtTPkJsFw+CUZJOuexd/akxQ7tBp4bVXA==
X-Received: by 2002:a5d:6da5:0:b0:21d:9275:4de0 with SMTP id
 u5-20020a5d6da5000000b0021d92754de0mr8663604wrs.670.1658771453660; 
 Mon, 25 Jul 2022 10:50:53 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b003a31d200a7dsm15912851wma.9.2022.07.25.10.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 10:50:53 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 19:50:52 +0200
Message-Id: <20220725175052.3417144-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VdQn1FhyaypRBGTZ3jgTTYL6AF8g4AZikpH+7vXTyE=;
 b=dPwaxV4V/OCIdPUpenYYrY2p9PfK6AzJIn7fB+I78QkmYfrOHJrhQicEkoRncfMxQx
 8fJJfffzKl6s/KKSNzssmsy4+YVUh60ckkNHliKvqmrdVJ1B7CwD0dFjSN64J5fdulVT
 B2s3cyb/N5Ip5XsLpFmrIQXmElt/GnPHcoMM/L4GXY7LzMS/tsd7QqexLYDH149NDgYQ
 kTMeIb6hMIdEp6kZGGJrvUTipaN/hSgYTEHn+jzW+x9WxjPc1EtUFoz/o+rm3fwzyEVH
 L9xoanw2tOyU3qBD1JtiZg2UDXMo5COgB2wFG6xR0jskqFxF5aqaEVheqd6SrwnENw7P
 8e7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dPwaxV4V
Subject: [Buildroot] [PATCH] package/bird: bump to 2.0.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While we're at it, update URL to https instead of ftp.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 2d20491dd6..6ccacd8d58 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  19d2de83ee25a307b9e5b9e58797dd68766d439bcee33e3ac617ed502370e7f6  bird-2.0.8.tar.gz
+sha256  7ed341ddd8dc87fa9736586b3515447a8436fec442d65f4022155ab9de1ffd5a  bird-2.0.10.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 7d7002d5f2..a039023764 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.8
-BIRD_SITE = ftp://bird.network.cz/pub/bird
+BIRD_VERSION = 2.0.10
+BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
 BIRD_CPE_ID_VENDOR = nic
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
