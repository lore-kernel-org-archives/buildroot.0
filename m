Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 22:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76AA284E18;
	Fri, 17 Dec 2021 22:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26wZSY0h2vBT; Fri, 17 Dec 2021 22:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA6E084E1C;
	Fri, 17 Dec 2021 22:44:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 049EB1BF5AA
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7EF94226C
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZQbnRLJJQYN for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 22:44:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96F2842269
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 22:44:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q16so6691929wrg.7
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 14:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uJdsVc5nX1tgdQgDQGw57fQga5ctxEYmHWOpE4DiiiI=;
 b=D3BHrjxijoFKm54C40b5lGTS/Ayozy9ma2ciyiCVMSJHsM0LptvYOW3Nd7N46E+v9z
 ZRZxefa9SoNbqCwmq1Ev3Oo9plbhpIAssPQlnGOUykQvpcrIvNqz7tMNXU0a+wzWpJol
 UWAwEY3IhEUkZiLwwidZpJvhQER06VOAOSepTTxHXnpZEyibm3vljoOoGRYBYxO0m0yH
 NAO0Csd2qCrVuaceBX0etA165jkzrhambtdJe/JxdDX5QuiyFiaPR/vB4APbtqbQ4TbX
 IChTMwi9wbkc/7yLkrAWgdgzL6LRK0lwxGzQsyqPm5324z+zH5ohnp5VcWZj2QAArU1p
 WW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uJdsVc5nX1tgdQgDQGw57fQga5ctxEYmHWOpE4DiiiI=;
 b=rfzQgfmPuWIatduVnpXxL3B37WXLai4j/Dw5Ibh4UkuM1koF+knThQn932/NL103jV
 JDqA/uLorZJkvpVKiYQ9GvRVX3YdfgHVSHlrvZnPKFrRCL68KEj4RM6fPunyd7l25nDM
 pM1924Z0mlRLmKtpUxOFXojndS13Rh1mV7kGNf7gf1e0TVPV4Q/Sqe7e5TgQhbOc2j84
 r1MrqHp9SAhhYWSh+B0/9SfjeIw9M/80XD/TtNAAJ6X6Ayu+YI4vUa5681pUmPN5WM+o
 Sb8Ajntc8OCd/W8idlH+lglyhJWN/1vaw3vWvsbxELMnekjzN6FkFHgW4WvUvMxA7Uqd
 BS5w==
X-Gm-Message-State: AOAM5326hW4BP13Mc3V23QMbQ0ofVNW6hiavSwuT+GKbwL4jUOKZ9Zi3
 5dUqp3+OtAtrmmBlkbXLvJxfcX82/guGgA==
X-Google-Smtp-Source: ABdhPJwb6nuOlJcLouiaoKPvRmU5uoVdzONySNgWaPIpjgNgwGU5iyK0siIU4MhrkB9NuQk2oYmKKQ==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr3999441wrt.222.1639781057633; 
 Fri, 17 Dec 2021 14:44:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id d2sm11960302wmb.24.2021.12.17.14.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 14:44:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 23:43:45 +0100
Message-Id: <20211217224345.106940-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lsscsi: bump to version 0.32
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
Cc: Antony Pavlov <antonynpavlov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://sg.danny.cz/scsi/lsscsi.ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lsscsi/lsscsi.hash | 2 +-
 package/lsscsi/lsscsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsscsi/lsscsi.hash b/package/lsscsi/lsscsi.hash
index d444c7e059..f3893c81dc 100644
--- a/package/lsscsi/lsscsi.hash
+++ b/package/lsscsi/lsscsi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca  lsscsi-0.31.tgz
+sha256  12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca  lsscsi-0.32.tgz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lsscsi/lsscsi.mk b/package/lsscsi/lsscsi.mk
index e9a5255397..716b6b74fb 100644
--- a/package/lsscsi/lsscsi.mk
+++ b/package/lsscsi/lsscsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSSCSI_VERSION = 0.31
+LSSCSI_VERSION = 0.32
 LSSCSI_SOURCE = lsscsi-$(LSSCSI_VERSION).tgz
 LSSCSI_SITE = http://sg.danny.cz/scsi
 LSSCSI_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
