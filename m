Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDFAECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3EBF61112;
	Fri, 26 Aug 2022 13:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3EBF61112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXHKA4eZs1Uv; Fri, 26 Aug 2022 13:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D8861124;
	Fri, 26 Aug 2022 13:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D8861124
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0E31BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C6E61112
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C6E61112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRw8-dIwrT1g for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 747016110C
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 747016110C
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m1so2200953edb.7
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=d/SW6JRYX0LXB/9gmAUZAH+BBl9SPM2HW6yOnxJuYOA=;
 b=zRgLhp5d/AnmGpLiIi8m9sY+kGPqJ7iistdiA+MDXXDmb2oJb/9FIIFnvz+DtxjyeN
 AFEGVBsO5RMUlwSjREPMs7zOuTWQY+NX1vz+BrzcWRRZC+Mv9YatxAGw4i5oMNhyP0J7
 GiTOIpal2Tbpe6w0dbm233L3Nr/6YEowiBpp7liMvAVlPszzdikqufA1eVottZApYLG+
 8+AhQxvvOBFq75YLbszR6Ynd7K9BVkmFVFwBKXc8ffokT1z+8Vk9BJyo4bWdrLLYRjN2
 YmlMwLG7k6LZAmJE4TJtwCLcjhS+Nw7R9ua+bh1T9/HwHnMcCRVlCeD5Opxdux85A/3g
 VuVw==
X-Gm-Message-State: ACgBeo2QNuwS665p7Cjcr1UtZE0A48TSXjfB6BrBX6UJclAcbK7vEs8I
 NcCRs/lfCFT5/N3O7BxlP2b9japlxodAHOfY
X-Google-Smtp-Source: AA6agR5/i4X4/Z50g7mqR+gVS/rKm9dc5SOMvR93eUhrB0SNAur93qD3xBDl14U/QUCdAx5EhAv+Bg==
X-Received: by 2002:a05:6402:400f:b0:446:f7dd:8a67 with SMTP id
 d15-20020a056402400f00b00446f7dd8a67mr6830159eda.140.1661522121267; 
 Fri, 26 Aug 2022 06:55:21 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:20 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:49 +0200
Message-Id: <20220826135503.20612-16-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=d/SW6JRYX0LXB/9gmAUZAH+BBl9SPM2HW6yOnxJuYOA=;
 b=MYd7dk8DhR5TZidcShuyMPnSI1jB4Nksry72kzd0RC2EtZCjbZ6E/Nv+NrVyXHh/xv
 aJ9c+JdQ65gCxE2IY+cYPTPMfN/YdDquoQD2dkKDKEJ9QufZbfFeFGhzfnHAKMqASd1P
 k52rzZHe9RJoMwh8MrmyWUHCyVWZCcDiwJsEsYygoXi7CF4Xp+0U36HKgLRGgIDmRqA6
 ek+uZp2fCFlX0NjO/gQGBTvoSQF8RhQ8Ii+JGMDGu3jfwBG4BY0K59KDIXcEIl4d9NuX
 BALh8wdTXZRdsfkHkdxCfbB/EfZrIiIgxxOkDGxodCzXqYu95uqYPcep1UhwnlOIEjLk
 D5gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MYd7dk8D
Subject: [Buildroot] [PATCH v4 15/29] package/qt6/qt6base: add qt libudev
 support
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 47512fcab6..3e94eaacb3 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -96,6 +96,13 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=ON
+QT6BASE_DEPENDENCIES += udev
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
