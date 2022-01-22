Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC76C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 054698280E;
	Sat, 22 Jan 2022 22:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fH0JPblHHqIJ; Sat, 22 Jan 2022 22:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57403827BA;
	Sat, 22 Jan 2022 22:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1C831BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E7FD60B54
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ct7RpTzKUz-i for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:05:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A8F360AB2
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:05:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id v123so20449514wme.2
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RAAVA8iVWRgUtFjT0/dCOKTtrURgzQ6uVVstroXJjFo=;
 b=nCR3rz6yqqqgQZl/Qn4UjL5equ4azftzBO9DYd83Pmlaa7IpBgQuUdtutBynP+OjtF
 yRHxqzmo0IbNgb5zrD1CCN2feAEEupkqSPl5IHFaUDkPbodrCxf3F5OBCSthbSkz723G
 ECUN0GQ2s6KI2Buy8gR3qLnaaLsrO1S6WPMvtcnNB+zz7yeLwmStBoQXYNZlTfkwW/H5
 C49RM6bCuZ3nA7QMissIPg7IO/mQPuL8Eka8ea8Wr4//SFJO9Pi3ZnSCrH1btDdGyNOP
 eQMCiO4SJMVaSSF5vEs9y6ImW4uadE6RaGR3xV8WCm6o9LOSs8+rq4tHkootvHl8xmU6
 dDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RAAVA8iVWRgUtFjT0/dCOKTtrURgzQ6uVVstroXJjFo=;
 b=sBnV+czYGSFVxfj5zii8I0WAUX0Obrk9KkyyVy0Xcaa94+HJFjkSdsTLtfVuMGSZVS
 CzJEUSsnhFzECOafJmzXzXG63hS3n+C2CIr6GaBUDf2NnRzF1RISsuhwqOkofYyQ6PW+
 q22T6eQCOLlml7C/cpOyeQRw4rhLa0ZiGgCqIJ114nHANnc+IVEmzLi2E0yPXV0wUnEc
 LaGdsdTqnU9j2+t0usN7gbTgEfov+KVZ0ItrpqfRYw/ifk31zVUsDpSTS0YEJGijmvTx
 VQSsG9e9bU/SZoeEvV6lv3PKZl5Ok9pO0ImtHotU+L+plCnZSl8m9TkHW3SjNeQkgnU9
 2RUA==
X-Gm-Message-State: AOAM531FGbeblGK+/LwiHuA946wiT/1kgAmkI/FeBOCEPZdkf29PvLN0
 9NgYgBP/lHkItSgfY0s8BSEkHHdtO+Y=
X-Google-Smtp-Source: ABdhPJyu+OJCkLnur6nzFIdJpyLL+JXqyr998oLe1t04hq0F6V0eeQC2nP0RIogM4smC+/AbWTgugw==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr5770264wmq.142.1642889120025; 
 Sat, 22 Jan 2022 14:05:20 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n16sm9686241wms.13.2022.01.22.14.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 14:05:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 23:03:34 +0100
Message-Id: <20220122220334.266735-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luajit: add LUAJIT_CPE_ID_VENDOR
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

cpe:2.3:a:luajit:luajit is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aluajit%3Aluajit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luajit/luajit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 7c1b556ff7..cca806309d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -8,6 +8,7 @@ LUAJIT_VERSION = a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
+LUAJIT_CPE_ID_VENDOR = luajit
 
 LUAJIT_INSTALL_STAGING = YES
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
