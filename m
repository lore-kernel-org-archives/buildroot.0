Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5318CC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 15:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB07E81450;
	Mon,  6 Feb 2023 15:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB07E81450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDda2Ces12WV; Mon,  6 Feb 2023 15:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1049F81449;
	Mon,  6 Feb 2023 15:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1049F81449
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40AF61BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A68D60AD0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A68D60AD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrlYU6zCG6wN for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 15:15:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E5D605D6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15E5D605D6
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 15:15:36 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id q19so12018782edd.2
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 07:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ahjOvOzs+m9qnv1uoN0USw17trpOf/ZL8VNAAUHVwOk=;
 b=xaGpfWY+GF4myQpLR65dG3DEINBTxMurSdalK0rjFgTNab6Msrap4vT3AWUhhGT5pT
 5DiDc221vezOpUy2PwUnjn9Ay4i2e1ryNZGTFeTCb1R2g/5FvwY7FR6mo8t1CCXwVaTi
 jPofiyKz8MAhUCcUeJqBMqMn66Gy3gz2LuWgF36kYiAZgmXTho0nDZscpM5Vo85OAxrt
 /xWWzJ8bqkRsBppOIGIp53BCF9eXvk8Qo15TIDBHZj1gGI+KCz4PXWXM2ouSNEPXLgk4
 8fhjdPFSSrPq/1yphjq7w16UxEpayajAeqKQeRd9y3M8eWxh8NHqj/576j8zkuvoEVJ7
 QO6g==
X-Gm-Message-State: AO0yUKU0Os6PhZcvyC+k2zJLnXwnfO9RkzwzfClaU6ziVDJzkmGR0L6h
 gHAxI1/YQeIkzvLeQESwTm24AgzQgo4D8Q==
X-Google-Smtp-Source: AK7set8KFvx/xV9ItI4OWrwD4bo1BLs64pJKVGWxLkC0VxAZqRP5LzEBaMlEOIald5p7LM10FmVWvw==
X-Received: by 2002:a05:6402:1d4d:b0:4a3:43c1:8433 with SMTP id
 dz13-20020a0564021d4d00b004a343c18433mr17531679edb.7.1675696533844; 
 Mon, 06 Feb 2023 07:15:33 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 g2-20020a056402320200b004a3f33010a3sm5178133eda.90.2023.02.06.07.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:15:33 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 16:15:14 +0100
Message-Id: <20230206151514.1579632-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ahjOvOzs+m9qnv1uoN0USw17trpOf/ZL8VNAAUHVwOk=;
 b=KC964QtdPrr0VkvSHs8TRgsa4n4FPaonFZDXbYY1wiNMarYxo3Ni5MFWjyYBH0RuEo
 7CFmhSXrw7pQSHQSY0jKx6+dmJGpGyM1FeVJlBEyBefQlWFUgYeqCObLJ0u4oG21/OUk
 zIDLomSnLy9sU2ZadhLRzPGlMbCRYQpptpfISJ8baO1aCBWjEAlY4+QJBO0ivl6U6XGm
 lP390DjER1lTUaGt/Dkd+tvaH3MhKk+zGPlEzISp3sO0bOHhEVw5T+VA6hCxkJfCSflA
 nEmVKp/PHK2qLFH1oaG/237X2gHxTvRQ423mgK1hjpO8xegP4m/DvvTi1HrkBPyQTcbb
 kD7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KC964Qtd
Subject: [Buildroot] [PATCH] package/libcamera: bump to version 0.0.4
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 033e318910..ea204aee98 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  d7100286616550aca487b46ae9de2a70bb471352a332b8214901b4148739990f  libcamera-v0.0.3-br1.tar.gz
+sha256  13e53b33652b16454264b6eff0a6f032aa9331f919b07b6d0e622917ed7f7dd8  libcamera-v0.0.4-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8979a43aca..01c4cb2ff2 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.0.3
+LIBCAMERA_VERSION = v0.0.4
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
