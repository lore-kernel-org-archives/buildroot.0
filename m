Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C13C433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 20:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BFBB607B5;
	Sat, 22 Oct 2022 20:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BFBB607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9CuImbD7BVxn; Sat, 22 Oct 2022 20:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E62460773;
	Sat, 22 Oct 2022 20:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E62460773
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 345D61BF3BD
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1683081C44
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1683081C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBYDdckumhvw for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 20:46:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7FE181C04
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7FE181C04
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 20:46:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a10so9405432wrm.12
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 13:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ZLgqHmA2HspVexbQtRvEnxGl7alc+Y6pulg4jdNcss=;
 b=dBomx3FY93lQSUSl2HsOYYVA6isVsmqKhIsmmI7AS5NLM7XEQtzbZqMW+/JPUnl/l6
 2f0x67HCtRpGua27hIv6sHAJxYLbUboPDbABzCH8i+Qz1kVzt+fltUzHF38ulpn4owJi
 jEMOEhTzdf+O3Tb6P/FxqhNYDwtR9537rD8fs50rX31Yv8wZCMZSsvxCZ3yIXcGcQPT8
 BwhOTRAMVhcTWXF9gaMA+Qwsr0+bQ2ncWqQyCqnb1XU+2bXfLPc+PW6TFMZd1YYKjgNR
 eUF1usVb56jCfLOJj4/ZxGLmx43j0knko8hBOZwy5yO3Wlo9YM4t0wEkWnT4s2cpMGXz
 UoNw==
X-Gm-Message-State: ACrzQf1ZBL8ssd6liCk4PwgHYRUa/Dmy2VRaqbMPBhujnAdwhaRuN+cv
 2YQn0cNRIjHplakvmdGrFEbfAgPGw4Q=
X-Google-Smtp-Source: AMsMyM6WYLZgRNh7Bh1u+npWXuoB2FXAzqrocMOHGwqk2aOnSkwGOoJhtx+xbohEndj3rmfU022gyw==
X-Received: by 2002:a5d:5c04:0:b0:234:88dc:3d19 with SMTP id
 cc4-20020a5d5c04000000b0023488dc3d19mr11080776wrb.681.1666471596452; 
 Sat, 22 Oct 2022 13:46:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b003a8434530bbsm3941364wmq.13.2022.10.22.13.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 13:46:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 22:46:31 +0200
Message-Id: <20221022204631.147518-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ZLgqHmA2HspVexbQtRvEnxGl7alc+Y6pulg4jdNcss=;
 b=qAZuyPrdhw91MIdSoX2WeNuLumPO2LTuWSFM0dxYdUq6s/vNiYTQOSmFsb0PPi5ayD
 Bhyrg5EjIf8/JLAoaPdrQ2bLRnzo34EX9jXsx4Ht4bsJr/yS/cGwWfQBm84gip8+JlKA
 K2RVFLW++gh6fsYJka7tLuCstst33d5eQVvJozOxRi7xT1TcPxq9OHH+c3ibokj70T3a
 TJYlZ/RoqlGqgU9I/b3nnNI/ALiSXUlrXQLece5Ovfz+KiqKJ2GZvORYgf2At/O8BT8p
 rrozUpaIaCuCcUNV/vURoPLzzM+xkUyXVAPenDvGdXLDaHhQwkIz/QYBUMZGhOihEUVi
 GJFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qAZuyPrd
Subject: [Buildroot] [PATCH 1/1] package/vnstat: bump to version 2.10
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Rodrigo Rebello <rprebello@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/vergoh/vnstat/blob/v2.10/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vnstat/vnstat.hash | 2 +-
 package/vnstat/vnstat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 191dc4ec0b..bad4325d90 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  03f858a7abf6bd85bb8cd595f3541fc3bd31f8f400ec092ef3034825ccb77c25  vnstat-2.8.tar.gz
+sha256  a9c61744e5cd8c366e2db4d282badc74021ddb614bd65b41240937997e457d25  vnstat-2.10.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index 91f0233f56..3b2951b8c9 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 2.8
+VNSTAT_VERSION = 2.10
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
