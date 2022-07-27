Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143C5C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B8F360AB8;
	Wed, 27 Jul 2022 08:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B8F360AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIMTNIlxZf3c; Wed, 27 Jul 2022 08:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB262605EA;
	Wed, 27 Jul 2022 08:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB262605EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC1071BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B221A408FB
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B221A408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsF1qMAwZTlB for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:20:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E0C7408F6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E0C7408F6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:20:15 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id mf4so30236834ejc.3
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 01:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3X+E5FmauJjQNDKH0608mXuv61YipiYmFZsDiRsbIuA=;
 b=imgmr2F+rz26KFKHm8D5G9V/eTOCdV5gQeXL0lS1DD3VSqf6MZ2nBeC+BFEsTuTFkI
 4RfHlPsvlpM/h7+2nnrGfrEhIQpHp8E2pFfGJE1Lm5ZBxnX9BUU0PEVXMlt+iHe8oLEo
 hYr6Kzk5peiqaYRRoSJTgt9Bb23S3JapMSgPoSH4frX84uZO81HTMAENbU1mPd2L7Khr
 40bSyhiBuzUHheKcgPqikMt+Xe2ZMXoOG+2YTXTibBrrAHTQoZjwOdLrYxa+RBaffNqo
 6tjIir8hh8gggzVQepgtmzjByFDFQ8bK3CwlLAwLBkxuqLR2hDAlnUMmc9+8sf6YwR2K
 Y+GA==
X-Gm-Message-State: AJIora/gT76XopvgJ7aIaoaKEy5+sqTSfw7B60va9WLrQYTMWmAjkEW2
 P724APL2S5Y9+988NfMEPIKC78SFcOw=
X-Google-Smtp-Source: AGRyM1u67osgK9iQqpEjU9RXLpGTiW6pEAQtJCfUFsFRpw7nIuJOmVuBJMLaMYmzj8SRycE1C0YckQ==
X-Received: by 2002:a17:906:5a5b:b0:72b:39cf:6042 with SMTP id
 my27-20020a1709065a5b00b0072b39cf6042mr16497233ejc.301.1658910013282; 
 Wed, 27 Jul 2022 01:20:13 -0700 (PDT)
Received: from mercury.lan ([5.2.192.119]) by smtp.gmail.com with ESMTPSA id
 kw24-20020a170907771800b0072b609d9a36sm3433563ejc.16.2022.07.27.01.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 01:20:12 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:19:52 +0300
Message-Id: <20220727081953.38627-1-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3X+E5FmauJjQNDKH0608mXuv61YipiYmFZsDiRsbIuA=;
 b=Gk9H0GOryi48+vgjDOEhYpo0XFUad1cL3LnhglTR/haan03d2/an/SpRmwsOD4tHXB
 9dB9f3k6/ef0K7unbeivYzJEXhyT5K//6HMVv42dsqFkzF8oyEXu/h2jdOyZWioQQLc9
 JnemydkELkHaDZcKe7Yli+XArdetYXJCPr+iR/26I3C5bPfV0Qf40ehjRLJ9U14agsW4
 WRDNqMjLs9Jwz5cHJR7clUpuVFWL9lXlvhqeULup7dbaifCb6Vic8/a1+ikvhkXhdr+V
 UbY3Iwa9vAUQ5Dq0tH7KmNwWNrtlNDi6sUL77MaCrxf7w5DdzoT/j/3j73W4c7XJ70yB
 4dzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gk9H0GOr
Subject: [Buildroot] [PATCH 1/2] package/cog: add udev dependency to drm
 platform support
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
Cc: aperez@igalia.com, michael@nosthoff.rocks, thomas.petazzoni@bootlin.com,
 Alexandru Ardelean <ardeleanalex@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DRM platform support already has the 'BR2_PACKAGE_HAS_UDEV' symbol in
package/cog/Config.in

We just need to specify 'udev' as a dependency in the cog.mk file.
The udev virtual package is pulled by libinput anyway, but this makes it
more explicit.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---

In continuation of:
  https://patchwork.ozlabs.org/project/buildroot/patch/20220722070150.40715-1-ardeleanalex@gmail.com/

 package/cog/cog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index da660eb7c1..95b6220629 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
-COG_DEPENDENCIES += libdrm libinput libgbm libegl
+COG_DEPENDENCIES += libdrm libinput libgbm libegl udev
 else
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
