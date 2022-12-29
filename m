Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E46C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 10:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C86060D69;
	Thu, 29 Dec 2022 10:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C86060D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrl0eM9wvucL; Thu, 29 Dec 2022 10:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 929B960D65;
	Thu, 29 Dec 2022 10:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 929B960D65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 994311BF292
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 10:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72FA1402E0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 10:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72FA1402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jN6sBTRUY_y5 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 10:39:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51367400C1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51367400C1
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 10:39:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so7417616wmk.4
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 02:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3kE6dt+LpLJnP9Y7Rj9ABVGp6elIAZ+392mlrnlEjYw=;
 b=HEDVqSFmwdHHLtFrHG6pGc1YQdNCba4KWXCTNz126988xmIqQYcpK6Ey4+ThNc2iu2
 WmT8Rrl4fq5Q8owhuoJVsPNFhBvsSFX617xjpleu76A8vJiAypxXzMRR8asBsverP20f
 8bH+vZchLbEV7ZPrdiZd938C7xFW7u/Jm5mN4Rc7FgweL8Q37+fd0Fvce8ZQvudsdjp0
 58NZIfTH0NUJGcXWuCXo+1Cv+k7sfTPGlj+DCUXcWTS3cBESeCFKJKo4WMjoYQzKLUME
 sI9Je0xKuaOGkavX4OAytQEM2GwvNOze9oeBap4ET4ccmaW++t8aWygmBF053sb9UBFP
 7UwA==
X-Gm-Message-State: AFqh2kolUJqzm6zVaewuO3zrwm4KbsBq1Z+uGkli1/2zsLIb7D7REnfJ
 UZcUrr+x1s5RyUnt/GnZDTexZ0rooaE=
X-Google-Smtp-Source: AMrXdXtZ3UowRmLjnu/cgzPwwU0+j7rIWZr7nv7zgMu9fc3eDxfENL7SujMjuLudn1w7q8r2hJfkcA==
X-Received: by 2002:a05:600c:228b:b0:3d2:37a4:222a with SMTP id
 11-20020a05600c228b00b003d237a4222amr23271699wmf.38.1672310397002; 
 Thu, 29 Dec 2022 02:39:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003cfa3a12660sm41287053wmq.1.2022.12.29.02.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 02:39:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 11:39:53 +0100
Message-Id: <20221229103953.115133-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3kE6dt+LpLJnP9Y7Rj9ABVGp6elIAZ+392mlrnlEjYw=;
 b=AdGbtXu6sS7Z4MQCZid/SB7cw+fTii/Frsl1oldZl3srQsisFNav1RGJ3se7DREpGo
 vj2rx33v3uW5sTGBdabN3O4VSqRrUvpfuTsY6jSKhx3zNhrX6HiQbQNCschaFn/FUk+i
 ibOGnCGwaBqecG0mPSbQqh+IfPBm6DXYjepPDqcAfXw/IB4Hzlpz8Q6JCb4aTOylKib3
 Zwj+O3emqjWSEcAB61uCAsLSxV2G8E/PDZhXCWGncaP1V9HlD9wSG9/rCBXQnFzLFUXO
 pUYTgnDN2osSM50GR5fmbL5TB6QpqM9iFM+JP4BhQvtqesTogrcoKkiQ1iDzxDEVH3wI
 xYQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AdGbtXu6
Subject: [Buildroot] [PATCH 1/1] package/wireshark: add zlib optional
 dependency
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

zlib is an optional dependency which is enabled by default since at
least version 1.8.0 and
https://github.com/wireshark/wireshark/commit/7133f6944dc26740f5ebf56c2ca33be86a6e0f09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 48ae834d27..4451394957 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -164,6 +164,13 @@ else
 WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+WIRESHARK_CONF_OPTS += -DENABLE_ZLIB=ON
+WIRESHARK_DEPENDENCIES += zlib
+else
+WIRESHARK_CONF_OPTS += -DENABLE_ZLIB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=ON
 WIRESHARK_DEPENDENCIES += zstd
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
