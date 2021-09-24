Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D91BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 10:53:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18FB61214
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 10:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A18FB61214
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A3683F99;
	Fri, 24 Sep 2021 10:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcIEqA5R0ERo; Fri, 24 Sep 2021 10:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FA583E70;
	Fri, 24 Sep 2021 10:53:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 686331BF909
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 10:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A55A6059A
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 10:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muztx2gJqw1H for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 10:53:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5D5660648
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 10:53:44 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s24so11325197oij.8
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 03:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+ov0BkoH3NwgCTcirbchGoRb68PbY9Eh816Z3Qzfl8=;
 b=Ix4fTDq7cgS5o8ZbaVhEanI3ghhHKwA6cQeSCK1attJDVROp61jUiGZfFX6To1wysq
 kb8o4kBHMYLrEixYh6zohLgOc5XcjIrlvVDPyzfiBV7m8RY25aQH0LUBUm4fbOyCJBZ6
 a0cedbuV0hRRwnSLKMbJ4yK3Hu36cBx99p6bQI5qzzUbERdqVk90RMVIh4+kKy0qCVDP
 YN5ESEB1gCHLCp/F6Z/ZbSGaHbE3krgjp6asu2mOcyZrColv2CPrV+XPWdAisei5sqRS
 /HHUDqRuamwl2UU7cW6E87hlKIqwBjuTjkKDPhf1oBRURRdVzfQLv9l4cR3z9o7r00h5
 lAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+ov0BkoH3NwgCTcirbchGoRb68PbY9Eh816Z3Qzfl8=;
 b=2Ksr7buC36Y93b8MhALgPrbfBlnIL6wLzBLYIflWeoGCY16SVW0BKEB0OCHJWx/zAg
 ZLwzP/yn3crdXeEMmFET8vpGcSTNRN3T1TcEf8p/RHkIqx9A7d0d8iajVWiCmsCHHR6E
 hD9UPY78Q4sVO0ioR4eTQyVfmKELyLZuuS4sjgEiDp1lVCpYQmxy01XFdxhkS+uQadJi
 Vxqikgxj+NHzN/rfBUcQs/oA6Wg1pw7oa5Evgj5nXS2QSZb9NfcI3QNcieNd5dvKoFvO
 A5LVPdtxdlNe9J3yzECkkd9h6wy7KMk/ZLuPuUTWN0uc8rpx58iK+z18XF8sRJETKbYg
 dQKQ==
X-Gm-Message-State: AOAM533BmyjHQR5YIXbjyxX/BTxn+W6rUpAIagnc1efVZUGPervXgiiS
 0GZsP6VOiWi04fMWNEnphloqEpRBD90=
X-Google-Smtp-Source: ABdhPJweihk12YfB84LAGkHOHGsWvzH/YUAclBVK+xRLPa+BJwqAD6wl5z/V2x1M9qY2nlXE7F9BvA==
X-Received: by 2002:aca:abc7:: with SMTP id u190mr888569oie.159.1632480823403; 
 Fri, 24 Sep 2021 03:53:43 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id f13sm2016064oto.49.2021.09.24.03.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 03:53:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 04:53:40 -0600
Message-Id: <20210924105340.3514180-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add option to enable
 media-stream
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This has a compile time dependency on gst1-plugins-bad due to
the codecparsers dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wpewebkit/Config.in    | 6 ++++++
 package/wpewebkit/wpewebkit.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 04b2bf3beb..df1c900d9f 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -105,6 +105,12 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	  This option pulls in all of the required dependencies
 	  to enable multimedia (video/audio) support.
 
+config BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM
+	bool "media-stream support"
+	depends on BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
+	help
+	  This option enables media-stream support.
+
 if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 
 config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 5c5e6625f8..9ad569a472 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -46,6 +46,13 @@ WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_WEB_AUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM),y)
+WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=ON
+WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
+else
+WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
