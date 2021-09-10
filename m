Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA24C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 08:10:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B67E611BF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 08:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B67E611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 105BD404A2;
	Fri, 10 Sep 2021 08:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNUz3x_xVqr9; Fri, 10 Sep 2021 08:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3C3404AE;
	Fri, 10 Sep 2021 08:10:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9481E1BF84C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 08:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 836EF605C7
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 08:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBoyZO8mOFJN for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 08:10:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89A78605A2
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 08:10:32 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c8so2418421lfi.3
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 01:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7DIplEaH7AdATHT/+/2/97LDAyY/mNjNcRAC32eOdps=;
 b=k/FT+z7XvubdU4A4y9VBIdui1kg3Lqaj7IlCPfdeOBGHGsCbkrgb+HZCUcWvmyuGJ0
 a33Kx4FPGbQPTsVsbRirc3tg3Z4wIi/U4DdzAAz/eXmqotoJBIEywJK1T9nDbS19BhHy
 XJeambbrPaudm+/3KJk8Xcfu4OthQFKHKdrBd3FVw3VvCBy24kgXLq7QtTcIUZDSp19A
 B5rR8ULN3ZJPomAgHvKmbotZ02M03Vz/2z4dbaUwSeVLqB4WYzr+1ciffQHS9El5ajyP
 x9V+q2QZM6vHiNBoKZd2z0i4mGfeHtPfm7MN2PY4r7o9BbugffE7goPBwLU4m8xr4CMy
 jbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7DIplEaH7AdATHT/+/2/97LDAyY/mNjNcRAC32eOdps=;
 b=HWmA+4DawG32ufjIwycORdDGMz2T9+mefjG674THLKej5Pf8rWSbPodQTwW8y8ab9j
 K719NpepS19Z/ZpnV1f24Yf+5FoxcuusDFsTfpJMTlgJxkAx52DG1WhpBoQ/1NnMwKm2
 v2SENJE2/jDDOz8XKMCkRCr6d+UWd0i04/wubgXp/8n//T61yuxPJpkoZFOD1miQ6SXO
 a0Tdlz7O9W27Jv5eY1xlDS1PxGqznC9Z07Y0yG+LANas9saYT1s8Fxy7JjC+56MC1nZL
 N9zzI9j44TKLbdjahM2EsltV8Y8zEr2zMABVsWjOKlLd1VSFDLmzbiM6jBPcaNVxEMXb
 7z2A==
X-Gm-Message-State: AOAM531dLjP7NNqnPPuDF4pHlqu7CY5MHukZSNqzYFjuukYPkA4YHu9a
 6/5DCYq8ZB4JWZUdlq6d3qnIGrtq3pM=
X-Google-Smtp-Source: ABdhPJxH6InkjRXk74DyEP14VNhMcijyCCPgYTu4qw8k6QG26jqerMs+DAEigkdvEkwwLjxGiHoxRg==
X-Received: by 2002:a05:6512:1308:: with SMTP id
 x8mr2964726lfu.161.1631261430297; 
 Fri, 10 Sep 2021 01:10:30 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id o10sm460052lfo.207.2021.09.10.01.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:10:29 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 10:10:30 +0200
Message-Id: <20210910081030.518977-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2021.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 928e4fbe1b..f281e1593c 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0fa5a39f0c3e58c2040133e4229cb28660c61b978cd4a2a3d2f6e97ef4c8d0b3  libostree-2021.3.tar.xz
+sha256  db5ce01a1606af3466ec77236700f53a63ce20e4984a549d0eaba3f66a3d9361  libostree-2021.4.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 94ea08664a..b202b54d85 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2021.3
+LIBOSTREE_VERSION = 2021.4
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
