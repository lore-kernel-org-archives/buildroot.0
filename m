Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAEAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4377160C21;
	Sat,  5 Feb 2022 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGk6JsMcFGaV; Sat,  5 Feb 2022 20:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F26360A79;
	Sat,  5 Feb 2022 20:18:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5401BF39E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0865E4047D
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phGYhskZ4Mbi for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 20:18:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBEE74032B
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 20:18:44 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id z7so7807940ilb.6
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 12:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZfz7TRvXma6hA1/1x+0f4GE07wkbDMKrrj3weLZT1o=;
 b=mZus9EJBVCGZTH1hqbZIheavgFl/8UXpjL+wNmbvwdTIQtxKh/HvqINgvIvc+9e744
 0xyh8PWWvtLUapyvi73cKKp6W+sxGxCqiVAgHGaSUT/s56HJ440BKfNx5v7jRI5fHKrH
 p/7/ElvLV6BeYIVI98wEmRNXPgYCggs5dhgwubTx3FU+Em/WMgGkWdB7zBBmZ3z44lh+
 Nj+SQ8vE4zZQqmWNn7Wen/8lMmpjmbPZ8JXXI/7/6JBreptuLiERMuJ9HtmABa5UH7Ya
 uHOlAPKV5l+DjHwHLVpfpZ+txddg7L52KYscy090UOvuw1GVWN5ruSqCYe8Dq8/8RCxC
 s0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rZfz7TRvXma6hA1/1x+0f4GE07wkbDMKrrj3weLZT1o=;
 b=TKxN65x27JTofm2IiHq4dE5oo8xYxl564U/clJws59T9sZ0A026Gerj3y+EmhmvZEF
 QOhhKhhvFtwVan2sVbaEevjhzjqwJE+HR5NOFTOD1HS2oc+SNScsL3OFW2ZPF1Hw4x8w
 tZ0gYrPWwwbA8dSIqERh+rXK7xYKtz8fWM/vJ/6ebMQLr0FFnL6eHMRKcaRMZXmOIsMd
 AXmGv2m9QTQbqI0KCznECLjBr6+u9ytXWKofzy+k2XtTAJZciuraRNDQA5IIazrjNCjn
 LzduJg6dLd86058VGN01EA8mMJlVjWcsJ3U8X5Tij4hdNxLEAPRQ8/38MqrkStczNKol
 U95w==
X-Gm-Message-State: AOAM533xPVFyUCRhkIyBdTmWkw11Wt0hj/qyaFDUAKROGaszPBmVWgIj
 zP5hQVP8eW5bLOhN/IvyQGqBMDelVxY=
X-Google-Smtp-Source: ABdhPJxb96capmXP/Lrhp0z8025/7nzISFBTCds15rRI6e1Mrv8BjOw9ZcByXg6IZgpCsZ8WuUgH8w==
X-Received: by 2002:a92:c54f:: with SMTP id a15mr2375501ilj.302.1644092323634; 
 Sat, 05 Feb 2022 12:18:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id a7sm2781090ilq.88.2022.02.05.12.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 12:18:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 13:18:32 -0700
Message-Id: <20220205201837.3324085-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205201837.3324085-1-james.hilliard1@gmail.com>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 3/8] package/icu: don't disable renaming for
 host build
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Using a different renaming option for the icu host build can cause
issues for packages such as qt5webengine which expect target and
host packages to be built with the same options.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/icu/icu.mk       | 3 +--
 package/nodejs/nodejs.mk | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 7e0c96e43a..ebbb1968fc 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -45,8 +45,7 @@ HOST_ICU_CONF_OPTS = \
 	--disable-tests \
 	--disable-extras \
 	--disable-icuio \
-	--disable-layout \
-	--disable-renaming
+	--disable-layout
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 727af6dc50..2e41c11dbd 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -94,7 +94,7 @@ NODEJS_HOST_TOOLS_V8 = \
 NODEJS_HOST_TOOLS_NODE = mkcodecache
 NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
 
-HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
+HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS)
 
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
