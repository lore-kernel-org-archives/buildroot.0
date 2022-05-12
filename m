Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606DBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 12:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 110AA419E1;
	Thu, 12 May 2022 12:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etD0XAcIJhzl; Thu, 12 May 2022 12:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABFFE41981;
	Thu, 12 May 2022 12:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A08A91BF3BA
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 12:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C84B6828B5
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 12:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eP2taVUrLjBO for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 12:12:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08F37829DC
 for <buildroot@buildroot.org>; Thu, 12 May 2022 12:12:21 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y21so6008004edo.2
 for <buildroot@buildroot.org>; Thu, 12 May 2022 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvc3u9zfHCsSVOm8W2L03ImuOpgkt7PySK3Vb+mtjkE=;
 b=RdXlvT1bpjt3XQt6b+WJyiH1mMpCjvsJ8Z3NkHqn4cXJhxsJCCJYBD+P5GNlb0rBUI
 rYBH3ffop05Hkc2Us92mb9C3xluoqNWQe126QOsFQHkm2JHVjRWTsntR3H3WeImcJcD5
 1xYJmirAWTrjkCeq9XLVW32Q9URGM7um55fw84QDuvcYs5ztwgJkorFjFpZQTIVe1eBM
 pvQa2EfXZVDskqyRwa5+THg5aFIQtQETF9ndHWN/b/kaDzTb9Izok4mon/9+dPgKjI9f
 wmiX9kJF7BLrdPUdG4petW0M0kPcP//pyb0Noagcsk/xOZdnbmwAkVJ85k7bYKSIz0iW
 ik9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvc3u9zfHCsSVOm8W2L03ImuOpgkt7PySK3Vb+mtjkE=;
 b=NFbUIgeCIe8xp2cFazAQ6D0SRuufqgVD8M+pyBEvg8aF83lY4vo7sd1XrwHWWkYOfV
 TYJMg1UqbQbv+mnhnX4HCT/RfT0qf7rcWyFf8VcPS8GzRAjhAtZ+BWRCcRksh132uc6e
 Lp8/8Ja3Jnz4we+AFy4zA8DwNjhnacqcnX3rLFNwG37LvPukYBOlaHssj5omIUqBBRtn
 gyTnbRD9/jcAeWSp0uY0mo19NrlL5nbrO+SmDAHA/OqgXxfF9uiq+2NpFW2L3kODP0V3
 YwQGuBnHb/xGg0UfF0wVXJchKO8CgYhJ0DFwAf8keJ3AKeJ/XB2w9YXjfXt2iYvQ6CDc
 jGHg==
X-Gm-Message-State: AOAM530NKc6IEtET3iwapJVOXoFLdWerVYsRjW6mrdcK6T8XqOg8ihtv
 eMoB7U0MFTDwaRBifAfZKjjCtjR/7/r7KQ==
X-Google-Smtp-Source: ABdhPJzqa+CaNkFK5WxFs1RFu3e0pp10coaIJvll7SApsgj7V9ajvWXH9XVVp9xfBkKDCCJqoeOtpQ==
X-Received: by 2002:a05:6402:424a:b0:427:d3d0:da1e with SMTP id
 g10-20020a056402424a00b00427d3d0da1emr34945505edb.262.1652357540039; 
 Thu, 12 May 2022 05:12:20 -0700 (PDT)
Received: from arnoutx1.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 fb21-20020a1709073a1500b006f3ef214e1fsm1977634ejc.133.2022.05.12.05.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:12:19 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 14:12:17 +0200
Message-Id: <20220512121217.176652-2-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512121217.176652-1-arnout@mind.be>
References: <20220512121217.176652-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/nodejs: use ninja for build
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

Not only is ninja much faster, it also avoids the following build
failure:
make[3]: printf: Argument list too long

This failure happens when the output directory is about 6 levels deep.
It's due to the make generator of gyp that uses some crazy shell
processing for splitting up paths on /. The ninja generator does no such
thing.

While we're at it, remove redundant parenthesis in
HOST_NODEJS_CONFIGURE_CMDS.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nodejs/nodejs.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 909347eb2e..70febca74f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -10,6 +10,7 @@ NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
 	c-ares \
 	host-nodejs \
+	host-ninja \
 	host-pkgconf \
 	host-python3 \
 	host-qemu \
@@ -20,6 +21,7 @@ NODEJS_DEPENDENCIES = \
 HOST_NODEJS_DEPENDENCIES = \
 	host-icu \
 	host-libopenssl \
+	host-ninja \
 	host-pkgconf \
 	host-python3 \
 	host-zlib
@@ -37,7 +39,8 @@ NODEJS_CONF_OPTS = \
 	--without-dtrace \
 	--without-etw \
 	--cross-compiling \
-	--dest-os=linux
+	--dest-os=linux \
+	--ninja
 
 HOST_NODEJS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
@@ -82,7 +85,7 @@ NODEJS_CONF_OPTS += --without-npm
 endif
 
 define HOST_NODEJS_CONFIGURE_CMDS
-	(cd $(@D); \
+	cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		PATH=$(@D)/bin:$(BR_PATH) \
 		PYTHON=$(HOST_DIR)/bin/python3 \
@@ -96,7 +99,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--shared-zlib \
 		--no-cross-compiling \
 		--with-intl=system-icu \
-	)
+		--ninja
 endef
 
 NODEJS_HOST_TOOLS_V8 = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
