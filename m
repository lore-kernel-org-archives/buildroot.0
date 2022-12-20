Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A1CC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 20:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6FB54056C;
	Tue, 20 Dec 2022 20:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6FB54056C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_TJZzlhWiD3; Tue, 20 Dec 2022 20:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB844409EF;
	Tue, 20 Dec 2022 20:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB844409EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0D1D1BF59A
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5F6E4041C
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 20:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5F6E4041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSWfS391i7SD for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 20:08:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B564140195
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B564140195
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 20:08:15 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id z12so12014516qtv.5
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 12:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rUaVva6sCHmoFzg4Bo4BXfQUZJx5KQF3VZ0MQqHiEN8=;
 b=aDOKjbzZ0dlTrDeB73G73ldjJ0GXFmiZDqvJVQg7etzWyXUlUyWritQFQ8yjE1qC/o
 s105vu0NXF9kljVYpxo3TReQRdKZvfriU6EP06WRDPjsowceHlP+jt3ujwrnhRgEOdKU
 ETn6PWeqa2zeNKyeIQOUiXKaxYRbUYnP3F9Z1gTGH9K4gB3wb3W4xdHQAskVDK8mcfZM
 sQwjlS9eHgqL7heixezq4h0ODM31OYx5ApmKwEtp1lAAcyX1lJAEUtc2QzLhpZdSdMyI
 f+nYIA6dtJMClY5TUImKgN+KkrEvCh3Grph0F5nbvf5UCAYcs/2ZPbp3oFDduDMMWkdG
 T1aQ==
X-Gm-Message-State: AFqh2koMgN1DsWnMFCaTHnWZZbXo1E9f95o25IznNmXTDGv8htGClkec
 JRgqURB/w6pUPdu8Gazes9Zm8u90xtIXfw==
X-Google-Smtp-Source: AMrXdXtv0xKG/NhlScmBxXdD5pnJ/E9xI1B602cmIsMXJ/428Zc9WM29Ay0vfhOqSTjL+hVJ8o1+pQ==
X-Received: by 2002:a05:622a:4ccb:b0:3ab:4221:44e9 with SMTP id
 fa11-20020a05622a4ccb00b003ab422144e9mr3900452qtb.36.1671566894091; 
 Tue, 20 Dec 2022 12:08:14 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 p12-20020ac8460c000000b003a7ef7a758dsm8122462qtn.59.2022.12.20.12.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 12:08:13 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 12:08:05 -0800
Message-Id: <20221220200805.2686768-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rUaVva6sCHmoFzg4Bo4BXfQUZJx5KQF3VZ0MQqHiEN8=;
 b=Ka8sWunXkSG/+ty52G3jYOODjDfqaQ/8sT4jd7EezmMKmW825MBuZe43efzaV6eE2O
 ZrW7qoyIMXPmQEnDdkNi2UcAZLcFGC/EAs91e9Sm2ACgAu9kZ7w5B/tg3kAsMqYJW8uT
 ah8JvjPBj1vU1exG/93b3zxitmchbscNFGxeHeTnUpbk9gsBu5YJf1RKJmqJm1i75U+K
 2AGVnfbFcvxiLNJbJF/Y4A6u01bisot+Fm2Ai8+EoDffnlrwb5jKzSfdybHICh1Dwxs1
 6XINhLntejCiWKNjKpzgue6RcuoAFQ1OC/k5dfha4A1XFG1r6Nmb2r2ggYVxdIX4naYV
 9fZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ka8sWunX
Subject: [Buildroot] [PATCH] package/slang: Add option to enable/disable slsh
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com,
 Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The S-lang shell is currently installed by default but most packages are
typically interested in the shared libraries only. Add a configuration
option to disable the slsh program and its supporting files.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/slang/Config.in |  7 +++++++
 package/slang/slang.mk  | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/slang/Config.in b/package/slang/Config.in
index a500ff5b7d75..b09b0cd8fc84 100644
--- a/package/slang/Config.in
+++ b/package/slang/Config.in
@@ -5,3 +5,10 @@ config BR2_PACKAGE_SLANG
 	  Multi-platform console display library.
 
 	  http://www.jedsoft.org/slang/index.html
+
+config BR2_PACKAGE_SLANG_SLSH
+	bool "enable slsh"
+	default y
+	depends on BR2_PACKAGE_SLANG
+	help
+	  Enable the S-lang interpreter
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index e0f5968b46d0..5fec5512a29f 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -60,4 +60,14 @@ SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
 SLANG_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
 endif
 
+ifneq ($(BR2_PACKAGE_SLANG_SLSH),y)
+define SLANG_REMOVE_SLSH
+	rm -rf $(TARGET_DIR)/etc/slsh.rc \
+		$(TARGET_DIR)/usr/share/slsh \
+		$(TARGET_DIR)/usr/bin/slsh
+endef
+endif
+
+SLANG_POST_INSTALL_TARGET_HOOKS += SLANG_REMOVE_SLSH
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
