Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622FCC4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8A2F405C3;
	Sat,  3 Feb 2024 18:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8A2F405C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvMGMpf1rUcm; Sat,  3 Feb 2024 18:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCCA4405DE;
	Sat,  3 Feb 2024 18:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCCA4405DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD7AC1BF285
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6AC960B8F
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6AC960B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LB1l7ynPw8vL for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 18:35:39 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2B1E60B8B
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 18:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2B1E60B8B
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33b17ff9a78so1789244f8f.1
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 10:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706985336; x=1707590136;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IPc7AAbyQqvvJFcD0qSPsaeychLMmhAn5Ase8YHCWmQ=;
 b=Mw6SaaqY4F+WL+sovwWDlw7NH3uCB3z5m9DmqZhzwxX3aSzXblKVg0clL+Ql4JP4nK
 zHSemM+kAPu6cyShtq7mIvVba6ADD3YhTelkZHd9To7XAanE8egq1dwiT5C8wXuQ142P
 4CmV9A+gwflyx3Hb08d5ck8Wk/4d82fgS4Soa+J+a9qtafMfky0Hdlf0AYVd9aSp+dMJ
 T/pRSpZJEkdPxNMZg1UHPa23ndQR0Nu6RU0XZutct1rsiOACLWrAsbk5refoJkVapzrK
 /HN2+ZShMdhXp6u3mq+W0FKIfrFaziM6CFtUnRVFeoYPsvW9gFj+JvilZWHAxlMeXkq1
 M3eA==
X-Gm-Message-State: AOJu0Yxg3uh/yh+4LM9KXLMS7cL2Y8NXq46VdhhYMrf9DXvI3fEkOOGV
 g+gUiC5VNlwOKuSgn/hg2Dz3AuYxYzyBSAaBNAKgpTRivtvPeN2JL/JrErzcfO0=
X-Google-Smtp-Source: AGHT+IFB5kHjvDFS2jg1C89vopXLMewzmX13BIuN2TrjXscyVOkN3Lf1oGcnTrbaAXJ0X7BbwRP+/A==
X-Received: by 2002:adf:e604:0:b0:33b:687:7e12 with SMTP id
 p4-20020adfe604000000b0033b06877e12mr6165570wrm.57.1706985335692; 
 Sat, 03 Feb 2024 10:35:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b0033ae6e9faebsm4538633wrt.4.2024.02.03.10.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:35:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 19:35:33 +0100
Message-ID: <20240203183533.162251-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706985336; x=1707590136; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IPc7AAbyQqvvJFcD0qSPsaeychLMmhAn5Ase8YHCWmQ=;
 b=jivfjOCvV901yooVuYGNOOxOF2ffhtsRw7C4izVkERrCGGfkErFIq/JnGRvD3WmWJs
 KMxs3s8T/jMw5GIQS1NufIW0xulwaR1GIM6MboRDwB49l2fHrgHx5kVQ4+sOsntu95/Y
 SuQ7Zofe5Z8sw7+fRhvzkLTmE5u33xqPlgpT6sFFioZA/T9ZxBz5mrQnk1O7TdshSWVy
 BQB1ESZ7yQaFots2T+G3d1zsieSjSKrdSitl8OwRfSQx32eOooSzLCGGhmGftX6NmI5U
 wCAaueGl5VAm0XOaHLjTNJqbkVzjaFlp01eD2DkChuw3XGZPBkhMeB9PxRyBppL+6ilk
 yMsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jivfjOCv
Subject: [Buildroot] [PATCH 1/1] package/dbus: fix CPE variables
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

cpe:2.3:a:d-bus_project:d-bus has been deprecated in favor of
cpe:2.3:a:freedesktop:dbus in December 2023:

  <cpe-item name="cpe:/a:d-bus_project:d-bus:1.15.6" deprecated="true" deprecation_date="2023-12-27T16:36:56.510Z">
    <title xml:lang="en-US">D-Bus Project D-Bus 1.15.6</title>
      <reference href="https://gitlab.freedesktop.org/dbus/dbus/-/tags">Version</reference>
      <reference href="https://gitlab.freedesktop.org/dbus/dbus/-/issues/457">Advisory</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:d-bus_project:d-bus:1.15.6:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:freedesktop:dbus:1.15.6:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dbus/dbus.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index c41fbcb4dd..d610846ddb 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -11,8 +11,8 @@ DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-DBUS_CPE_ID_VENDOR = d-bus_project
-DBUS_CPE_ID_PRODUCT = d-bus
+DBUS_CPE_ID_VENDOR = freedesktop
+DBUS_CPE_ID_PRODUCT = dbus
 DBUS_INSTALL_STAGING = YES
 
 define DBUS_PERMISSIONS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
