Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289E2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C98D1611CB
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C98D1611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BC3A404E7;
	Thu,  4 Nov 2021 00:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Z48mU2EnFaE; Thu,  4 Nov 2021 00:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E53D404F9;
	Thu,  4 Nov 2021 00:36:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD4081BF9CB
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B761404E8
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKd_PLUCmqtL for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 00:36:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A844404DB
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 00:36:14 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id bm28so4147182qkb.9
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 17:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2C5nG1hBVLwIrH2OqBGZv5eEFsY73sEzcCNfb3ohnr8=;
 b=VBqA0CYsvD/WjpKF6z8N/ftddc7BKxjH0LkS5vGU88cy0iFzeFdmf72Tf8+vrgFcBA
 9Tezv+8GEdVtlYyMJsc/7FHFl0CrrwRfl2PjyHUxZUUEHEhMTHs5H4SVfnhG4oD6f1VC
 YLz1HNZhmGwmD7hxEe5tRSiFa1vfpr2wLhXtnnQOG3UOSBNF3vQq22Ekrq3Q06q6AKpo
 PAS6LcjLss1q81Amh5sRhQRLwsBnFgTPfoYrcoAQoaN+sys0++uBWrP6Yxwd0TrSXims
 XwtqntyznrkV+NsMsimC/51uWv2+GJv4PwRa4ZZNfPktPKeCnApSW/z+KI5TJF6/Hn9O
 h6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2C5nG1hBVLwIrH2OqBGZv5eEFsY73sEzcCNfb3ohnr8=;
 b=hIgKsuvEYgOle5PyiZyYl+SIFL6lRyff2eONPvLoJeE1LFSzdXmmimQsAPe8/kdqSC
 0UeL9oaHt6MjXI34BjW3xtTHUzMFhYE9hkj86/HWXpdccxY+/6AO82d16JCrdjIaZ39n
 /I2qnzK58PXIKYef1TVyIJzEQzP3v03X//QkfXBFIuknLg/A2Y59Y9JfbYYbeMxQzIcU
 NkopqQp8XbWkJZh8JXJ87jGaD8iYQOTm2UVDHxQViXcxAZXArOLPFvG/4YnWeE1a6l+z
 4cfFqbauvox2gZi9PylrdyxQIZIUsnr9hhOrTTVAGxpyXIgmz2fdbVee1uUhb4Ia72zb
 eXwQ==
X-Gm-Message-State: AOAM533i9gpHjPgLcYU49bhsOCHJEcA/4x6IFWVFcBrpONmfO+6GI+Xq
 9gl/IFcvdMb0hgQA51cbwrntx8CybuU=
X-Google-Smtp-Source: ABdhPJweZwr4rLqPil/xv3N2L4pY+U2SoYgS/++aMmfRNBIWSFXHfTl8svy55PwOc8wcDwl1pmtY2A==
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr22501874qkb.436.1635986173168; 
 Wed, 03 Nov 2021 17:36:13 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o6sm2847034qta.2.2021.11.03.17.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 17:36:12 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 17:36:04 -0700
Message-Id: <20211104003607.2022984-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104003607.2022984-1-aduskett@gmail.com>
References: <20211104003607.2022984-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH vRFC 1/4] package/gcr/gcr.mk: enable gtk backend
 for wayland
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gcr has supported wayland since commit
685e1da9642b7a3fb0dbe1afda482f7bd5b05f33.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gcr/gcr.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index d51e853f3f..ef253b4ef9 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -30,10 +30,12 @@ else
 GCR_CONF_OPTS += -Dintrospection=false
 endif
 
-# Only the X11 backend is supported for the simple GUI
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 GCR_DEPENDENCIES += libgtk3
 GCR_CONF_OPTS += -Dgtk=true
+else ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
+GCR_DEPENDENCIES += libgtk3
+GCR_CONF_OPTS += -Dgtk=true
 else
 GCR_CONF_OPTS += -Dgtk=false
 endif
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
