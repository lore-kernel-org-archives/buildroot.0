Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C455BC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593DD4047D;
	Thu, 29 Dec 2022 09:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593DD4047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jh-9myZYz9Pf; Thu, 29 Dec 2022 09:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58FA24034E;
	Thu, 29 Dec 2022 09:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58FA24034E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EE4E1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 792F34034E
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 792F34034E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82VEtK5LEPEA for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:20:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65A6140346
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65A6140346
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:20:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so10530027wms.0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=983hgVNzbjvLR41YS6RSOOi9oTJiIG/Q/g7um5KfEFY=;
 b=NW9gibD7khTCNDOmhz41a+ej5yOIE8T8Hq9TXWAjb9mmPWcwcFK9KeRyZrVoKtkvjj
 HjsUvRboKIOkYdvJdNslqQ+lJm5eSaWoUAfBw9Gt+p5gz9WHmZHW7FPRQ5OcpJ4C/r0a
 QWqwvBMjEU11sx63LHdQZjarHYHFLCsGs3m02iNDClX7iXz+kxSGl36tw5bFQRfdPaGp
 vKUB7aNbfSaMPoRfhEo/Jq1zVxQ9jsIGArevhZm5/3vPaEFNEw0XnZFu/n062fCF44gT
 qk572Ynf3iypsNakhdcn3RERDIqdgAPN3jah60k7Zy5EWaP0GdEXhVx9BfMoZ0ofpWjP
 Y5hw==
X-Gm-Message-State: AFqh2koI1cSJUkgiEj+vqYkutOpgb8jLdgVxWrCet3XTO/WrtfN4wdp5
 /MRENO66zY1B5mDRvbX8cpUGZaxPF5I=
X-Google-Smtp-Source: AMrXdXvJixcqPkQcThtLIjmUHhte0meJ3YFOrXhLbyfEP7isMRfY0W9KC6m7LQA4VnZFcQ4jRsMnKA==
X-Received: by 2002:a05:600c:1d8e:b0:3d6:e23:76a2 with SMTP id
 p14-20020a05600c1d8e00b003d60e2376a2mr19254380wms.34.1672305637032; 
 Thu, 29 Dec 2022 01:20:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p14-20020adfe60e000000b0022584c82c80sm17685246wrm.19.2022.12.29.01.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:20:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:20:33 +0100
Message-Id: <20221229092033.218162-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=983hgVNzbjvLR41YS6RSOOi9oTJiIG/Q/g7um5KfEFY=;
 b=AvjqDTosanfWdrfFLm8bqsHyU60kbH/jO+bF5rRUq+asaOAPq9CejwZenzWkQiMBAh
 tdn+sI521zTkpCx28wbxGYm9Wl4yVaVRvRt9AwXOHHlOVkAaJyIwNNhOSToCLSNrTlAX
 dQqK3kw1lTFOAU4A8UkXKEUZpVSB6dKrji5Kc0CbLIbMPUGBW8/koCmykirIqrSXzjNz
 BpD9bNVahLgXnJTvxE6DRNvgOh2kGy3qVXroDRzy2kvoYF6shwbNgxq0I5s0H/gV9Bbn
 A1Y9Wg6cN3GY4KMMFPkvsUz3yX6461UIfPFT7BL1w3ecDA2VGKOligEG6xnBj2jZ46+U
 KnJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AvjqDTos
Subject: [Buildroot] [PATCH 1/1] package/xxhash: optimize XXHASH_{TARGETS,
 INSTALL_TARGETS}
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

Optimize XXHASH_{TARGETS,INSTALL_TARGETS} as suggested by Thomas
Petazzoni in
https://patchwork.ozlabs.org/project/buildroot/patch/20221228221522.280696-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xxhash/xxhash.mk | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 6932113f14..04bc98690f 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -10,28 +10,20 @@ XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE cli/COPYING
 XXHASH_INSTALL_STAGING = YES
 
-XXHASH_TARGETS = xxhsum
-XXHASH_INSTALL_TARGETS = install_xxhsum
-
-ifeq ($(BR2_STATIC_LIBS),y)
-XXHASH_TARGETS += libxxhash.a libxxhash.pc
-XXHASH_INSTALL_TARGETS += \
-	install_libxxhash.a \
-	install_libxxhash.includes \
-	install_libxxhash.pc
-else ifeq ($(BR2_SHARED_LIBS),y)
-XXHASH_TARGETS += libxxhash libxxhash.pc
-XXHASH_INSTALL_TARGETS += \
-	install_libxxhash \
-	install_libxxhash.includes \
-	install_libxxhash.pc
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-XXHASH_TARGETS += libxxhash.a libxxhash libxxhash.pc
-XXHASH_INSTALL_TARGETS += \
-	install_libxxhash.a \
-	install_libxxhash \
+XXHASH_TARGETS = xxhsum libxxhash.pc
+XXHASH_INSTALL_TARGETS = \
 	install_libxxhash.includes \
-	install_libxxhash.pc
+	install_libxxhash.pc \
+	install_xxhsum
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+XXHASH_TARGETS += libxxhash.a
+XXHASH_INSTALL_TARGETS += install_libxxhash.a
+endif
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+XXHASH_TARGETS += libxxhash
+XXHASH_INSTALL_TARGETS += install_libxxhash
 endif
 
 define XXHASH_BUILD_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
