Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2262C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ACD840481;
	Sun, 14 Aug 2022 23:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ACD840481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMS5md53oqdw; Sun, 14 Aug 2022 23:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B602E408E6;
	Sun, 14 Aug 2022 23:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B602E408E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AEBF1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 637EF402F5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 637EF402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPyeLZTfIiCn for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B6F0400E4
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B6F0400E4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:34 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id r4so3019546vkf.0
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=chkt6qdGgK+sNq/QtSBaLvKeY8Dec3OSJZl5LSKTt9I=;
 b=gipMASgrj9jRahddip277sOlWmv5+0jgQ9E/6XuxqQPjf6Gp8iB5+vRpVU0mOquwrY
 zt+H9IWT+ZH7ViZ3q9YDgI1BIAqy/DcfLzRFlWUV7V9Xnvk4em8R5/0LjYq7URlu/JZj
 O3jIJux31IcXL8x/iQ2XsWHbsRpJq7o3KiAHS0GVcUb5jTFPPeWuREdhCP+scAq5VR5O
 A7+e8SF6wnw5vGstczbatEt0J9aRC/e7W8eJYsEPZCwrQbGAF7NtXTezL+8T6nhoIVoB
 eDSammGq0CDYOF1HW+JTaKmDz4eF3ssMLdpeXbLRuz9l6jrMB7wW2ecXKqvz/GomOLMf
 Egpg==
X-Gm-Message-State: ACgBeo2RiC0HxU+pWqpHQ7vuxnsbTegQlPUA6mh6WFiCCcYeS3UrhX0K
 cmxHQcG9ze9u7+orwjRy1nOBn3MMmuk=
X-Google-Smtp-Source: AA6agR6fcaO0W3d51WwZ7w8QekcP5v6j1ZfSuP1LSmbm3kXklkMczWnWeE3J4YGE8U0MYha8i7xyfw==
X-Received: by 2002:a1f:9485:0:b0:376:ecda:5892 with SMTP id
 w127-20020a1f9485000000b00376ecda5892mr5410981vkd.2.1660520433430; 
 Sun, 14 Aug 2022 16:40:33 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:32 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:42 -0300
Message-Id: <20220814233845.2247022-31-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=chkt6qdGgK+sNq/QtSBaLvKeY8Dec3OSJZl5LSKTt9I=;
 b=fYIUShe0Q/pZA7j90MfV7Sc0xDYfuZMS1awCi5Ehh8vZQQNGS+viO6JAcIAJSWCLlG
 cTpFYvMCMPXqd1kHPbe/BtPv7OCLzc27SqSkHqSwDsjS5h2GjB3A6Ouz5sipUvmIwXNQ
 p2IW4Id0MZvIinQNk3jjrDNzzrJWHl4nhlmQY4BZ0T7g6tlwuFnN6W68KRfefJxAFJm0
 R5hEk8nO0dzuHej94wnQPpWc6RQUOpodG+jVJzed6H58da/Q8C6/5PWUTLB5Li3I/g7z
 oSWVxPjsi/SsBAq97yLhWXlvWN1D+kejmlkn5Dygq/JahMFykUrwvrKNjPapA1xeHs+B
 J2VQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fYIUShe0
Subject: [Buildroot] [PATCH 30/33] package/gstreamer1/gst1-plugins-good:
 drop bogus BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 'dc7ca780a0 package/gstreamer1/gst1-plugins-good: convert package
type to meson' from 2019 removed the symbol, stating:
  Remove BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
  Existing configs will already have BR2_PACKAGE_ZLIB selected, so no
  legacy entry is needed for BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB

So drop the reference to the symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 61ffc7b989..de7dcb985d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -480,10 +480,6 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dwavpack=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB),y)
-GST1_PLUGINS_GOOD_DEPENDENCIES += zlib
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dbz2=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += bzip2
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
