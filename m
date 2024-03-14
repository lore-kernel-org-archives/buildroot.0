Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81BAC54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A5BF402D7;
	Thu, 14 Mar 2024 21:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5nl7qNKhX_p; Thu, 14 Mar 2024 21:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C59B4032A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C59B4032A;
	Thu, 14 Mar 2024 21:41:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E61D1BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B35F414C5
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9e3hisJ-iKw for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:41:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D83A414B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D83A414B9
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D83A414B9
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:41:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33e8b957a89so982388f8f.0
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 14:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710452489; x=1711057289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iMT+Q/ALI2CAf+idYaSlQFuwApUfISgEkqnsroiA19o=;
 b=YbW6rrznJOIL25sHn/7u37SU16BBdZ9UVVY0hziu5hy3ePy2NFvy1QxE5xqhWcUng3
 y+kDO0iK3C7olPB+NXYEYTmBoYTRyMDbJRnByNOJBlMdrF5OxRfrvV//teADJ2ZnFVZg
 PMWCgdG27oMYZ40JhuYdi3zE7t6Iah68zBqQGynvMQo2g2/hfs9ADATtsMaZ8wEsaAao
 ETjdIANwFFlJm/5Rv8TWHW3k3ZavNF9tdXcbqUuflXKyxfLKVC5hOL5wBP578o75IWw0
 iZgLsrUJxkynu7pusDVoMBokyJnDidq2DIVTI2cHRfUx7+fvsWG6lH/Sr7XcP7Iu4j8q
 xv1A==
X-Gm-Message-State: AOJu0YxM0NoN4uHF7+q0pwW/SSslwHfUg8ojtjcREA2Sq/ZSzVgO3vXm
 vQmPkjzKbeI9AfBmdJ1mzEm56SOOq6EmalD9I835pVl20iHK556HVeYClt5J
X-Google-Smtp-Source: AGHT+IGCmL6GJX5qfEyf9oABb0xx84oTXq4P5m+1b2+R8Z7sYH9bmz4fh30aeOICHs5wPy/bdElO7g==
X-Received: by 2002:a5d:5384:0:b0:33d:8029:b136 with SMTP id
 d4-20020a5d5384000000b0033d8029b136mr951917wrv.55.1710452489323; 
 Thu, 14 Mar 2024 14:41:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f16-20020adfdb50000000b0033ec8f3ca9bsm1593637wrj.49.2024.03.14.14.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 14:41:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 22:41:25 +0100
Message-ID: <20240314214125.397970-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710452489; x=1711057289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iMT+Q/ALI2CAf+idYaSlQFuwApUfISgEkqnsroiA19o=;
 b=N6aSrSxpjmcSHaeE3QN18HyIKsTPh2QWsXeUCkUxXUmpaCWJQ3o5ko8JwVIBfClkiG
 FIKVbACVAWTsNjngxuHh8IqdVuXEtFdA/ZeYIr4Ml2PdMHSHmrtQwhnf7RwXaXjcCQ7g
 cxnsv4a0+01DyaAQHFH3iKyHiJRqgcFeYEs7GE5FtrXJPi8ucElGKkbS10C/zS6LDgSF
 KGKAFPQKnlyf9wMP8y/BKcNe1ZMhz3HuXaep4gS57LRBtGRLMa/95dOf8GUw3qVFDSdL
 pg4whLblCaT25PmkL/1jcI0oQtha1eienati4aPvbsJVp5i0VK/6BkSvetU08ZS8jpSO
 lcxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N6aSrSxp
Subject: [Buildroot] [PATCH 1/1] package/libnfs: fix pthread option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo added by commit f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6

Fixes: f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnfs/libnfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index b013decfc7..19044527e0 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -17,9 +17,9 @@ LIBNFS_DEPENDENCIES += libtirpc
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIBNFS_CONF_OPTS += --enable-threads
+LIBNFS_CONF_OPTS += --enable-pthread
 else
-LIBNFS_CONF_OPTS += --disable-threads
+LIBNFS_CONF_OPTS += --disable-pthread
 endif
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
