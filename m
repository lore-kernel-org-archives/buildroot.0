Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C3DC5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 11:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A1D241DA3;
	Mon,  2 Jun 2025 11:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPXzzxR9brqO; Mon,  2 Jun 2025 11:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9C3640D10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C3640D10;
	Mon,  2 Jun 2025 11:55:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D542222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43C8A810CA
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JM1xQLNIitfg for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 11:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 005F580FA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005F580FA7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 005F580FA7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:55:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so9296135e9.1
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 04:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748865331; x=1749470131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Wy6smAfMoz8L2+9TjYr90BmSCkFOu2/Wso1ABnefmc=;
 b=wnx8nlN5/R6o94f/ln5TmBVx957/VxeJCxsiE5evziQCg1OoGii5+a2nbeRtZirf5j
 7yi3Vdev8LCDnKRBKq2lyfuov424+dYLgTpt1HBaHXerInZkifW92kMXiI+dnAzsP1Un
 yqnyvvtzBeoFoTQaWg4MQkrqG1huKnxBclxjCNzfab6EWSiD9CC3shbMYxYhwGFPcjcs
 7qp82D1oSg6CZPu/oEbXzNF1cPXPX1ywiDbu4q6X41fjbm/KcWXkX38RMh6tNWZlnLfp
 60r8MwiMbc2RE2Z62Ph3cqJwQImvTiqdNsfMeYqs5LtPWMBEsxL5OnoCPSZWnm3ZqMBw
 v1Dg==
X-Gm-Message-State: AOJu0YxVib/EZbo8ndh/j6YycDRCH/AdWpeSgjx6z6SnCsqxj+n3ZmTj
 rvGDrFGcN4c+JvUj5vCzWIeTUu1HsDIcMTGBVvKK9LrfOWALkzM5mi5vqZVxGelLjUnvR88Y3+Z
 yBgom
X-Gm-Gg: ASbGncshpTvUx0Zs/ow9eHcL0nEYfNQriQXSlZhqj7sB0Vu3q1bBYufSPsvPG2op742
 W5RqcREnLCRZ8BXNqzQMFLIB4F2MjUnUVRTzzryx64Ie8RbPYIRSX72ZA/OHMy5VVqK8aMjKw24
 kxV2WO+tVAG5YaZXgqbz4jHCPcX14+P2nvcy3zu+EI3jTzwfVCVY5Hv0v929mTZVu2URcH/58oX
 pYVK8Ekocm1h0RWPbiqCg/y2jPV04fmL2mUvCZ43olV8mOt0YF21O8IpeyQcRJPMfyle+y4mshN
 Hon3JmBrz6B0/4snwYwOfRwJ78Wyvt3k7mw06F/vTDY60GEfvbh4dC5XQAuW0T4pb1dxdmkFd6F
 zv39MGjg9PiNsF5vubiIw3i6pOGQ3HGgvHZNaNEl3zkk=
X-Google-Smtp-Source: AGHT+IE3wfEzaSG+GKSJET5quvKqk7/iuau7GKyPt4GkEgm+jgmggdDU48CgCVIWQuSGXEWJ3xhEFA==
X-Received: by 2002:a05:600c:3596:b0:43c:fdbe:4398 with SMTP id
 5b1f17b1804b1-4511ecb9ca6mr60340235e9.6.1748865330708; 
 Mon, 02 Jun 2025 04:55:30 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d8000d5dsm120604285e9.26.2025.06.02.04.55.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 04:55:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Jun 2025 13:55:18 +0200
Message-ID: <20250602115518.521408-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1748865331; x=1749470131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Wy6smAfMoz8L2+9TjYr90BmSCkFOu2/Wso1ABnefmc=;
 b=MJYws4W2x3RiNSw493uzTmQk3cYPutIvcQzanlxpvoraK24JuKBbNqICTEO2XzPLhM
 MtxDHKhnWAP+rYkXam8+3Wbxcy80HTr663Rlfdt9CZI58pEe+iSBC6qqH+QYAxywGJy1
 qGyQajuHa9rHIgl1xl7WOna2aitvJiE/jJk0ELSsRb9eDN7HyekiogcK6SkMN2mQjtLB
 E5T7JsBXrs94LY4GX8jDV1lqlu4QMRNWENh7F7hWyh+kUacfLx5tMC9djOe/jc570nzX
 htpQRBf2r9Ttu8olSBqrKMEqcsk5KGLVcIq9DzwLpj0k1xBjyeNLHozLzyKZp/Iii2D2
 eaPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MJYws4W2
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump to
 v7.2.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following CVEs:

- CVE-2025-27151: redis-check-aof may lead to stack overflow and potential RCE
                  https://www.cve.org/CVERecord?id=CVE-2025-27151

- CVE-2025-21605: An unauthenticated client can cause an unlimited growth of
                  output buffers
                  https://www.cve.org/CVERecord?id=CVE-2025-21605

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e01fc6a601..158931bb89 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  72c081e3b8cfae7144273d26d76736f08319000af46c01515cad5d29765cead5  redis-7.2.7.tar.gz
+sha256  2343cc49db3beb9d2925a44e13032805a608821a58f25bd874c84881115a20b7  redis-7.2.9.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7eb30abc4c..7c847690a9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.7
+REDIS_VERSION = 7.2.9
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
