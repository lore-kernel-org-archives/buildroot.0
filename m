Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72789C4706F
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E9B60AA0;
	Sat, 30 Dec 2023 17:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E9B60AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ZbSeN-N22Md; Sat, 30 Dec 2023 17:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C6D6079E;
	Sat, 30 Dec 2023 17:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C6D6079E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3345C1BF5B5
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B6D36079E
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B6D36079E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJDJzfgL9sCQ for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:34:23 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E614360783
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E614360783
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so6999359f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 09:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703957660; x=1704562460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dq+jWkOx6opacBj3c7w5o5oSJBE9rC+nGgO8x4tNQ4E=;
 b=xBojyk+G+kFrDhSW2QSN+IChZBPyNjnB0FuBszTWSL9ResKWAR4gbFLmYBTLyYC0gE
 7FVsPM7I9xBuHVxFUyrVM18YVIHx5e5ct4RtPDVVrSabl2jqa1j3hsjelHRVNxH1Il2I
 fMbKLD3Veg3IwOJRdJvgAWH9F+CpUVO68XuOPELjOPQE8+cHad5wWoPYv6Q30DLlGVBM
 cp1sfvN3UKs1e7cedR4hgTCVZcg97ienCRQj3hyyr3ddnHiPIcsz/2fmxavpUU/5oQOg
 frNxrDq8zcB/RSt9tRwcBStrVzjYS0cz1VpOti+VFNGHjfxeDqZ/UE1ajWHKe7t8yJ1I
 gOmA==
X-Gm-Message-State: AOJu0YysM+vuNC814AVqbX5fXbcg7BbKkqC2uu/azWsQM63h+xWfDlkE
 +RwN+tfkNBTMk4kWhmQJzH8Yp4QgibM=
X-Google-Smtp-Source: AGHT+IEoxPzJbuZJqCCt0sJpevsU9auA6tWgavJlFa4fNYUecXhUvQwLrhGwdjnYbuYSlLJxsx4hMQ==
X-Received: by 2002:adf:f1c5:0:b0:336:6812:6bc with SMTP id
 z5-20020adff1c5000000b00336681206bcmr3358967wro.232.1703957660562; 
 Sat, 30 Dec 2023 09:34:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v28-20020adfa1dc000000b00336f8b2f60fsm8741080wrv.8.2023.12.30.09.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 09:34:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:34:04 +0100
Message-ID: <20231230173404.920326-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703957660; x=1704562460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dq+jWkOx6opacBj3c7w5o5oSJBE9rC+nGgO8x4tNQ4E=;
 b=DOxsMI1NA4NOYt4CSIQdv4illDNVJlNrt/DQ7Y+H0R3Rl4O4+ZrKOWJUyz1xWup+lW
 TBnCPF+z0Uy4faDsG/IU9ZyAbo5ZTDnvL5PR/F7WEO1p4QZ3STqIP0nZVa2pdipYVyMN
 S6Djtpo2MxLQK7kjRteM6iA/b3RdXcFPPy5aSQPuJUnbrUlRGIxVibsj+a0r3g+FxOLV
 A8J1UMKV/+UhDuaA/V5Kw061QkMFv4Nd90qw3A9ajVpGyUb1z7tY43gCXAd59ztT4Rgz
 RjoIp5a7ebN/tNpgiw9jyfyst5ca/5tjbeuPrNc8Gp6Py4V9u6jckWJB4f8UQmyWyTvR
 AEJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DOxsMI1N
Subject: [Buildroot] [PATCH 1/1] package/ipcalc: bump to version 1.0.3
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

https://gitlab.com/ipcalc/ipcalc/-/blob/1.0.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipcalc/ipcalc.hash | 2 +-
 package/ipcalc/ipcalc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ipcalc/ipcalc.hash b/package/ipcalc/ipcalc.hash
index 50d08239fa..dec69d2abf 100644
--- a/package/ipcalc/ipcalc.hash
+++ b/package/ipcalc/ipcalc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  47c866941916800270fca23496acc9976ca9488ce9053aeaedc5f47c5929b772  ipcalc-1.0.2.tar.bz2
+sha256  5ed8f20819a5bdb089829fc62c9a2c685252759d5c3ec289492e6ef5762f4e3b  ipcalc-1.0.3.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index e63e174ce2..c1eba5d59f 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPCALC_VERSION = 1.0.2
+IPCALC_VERSION = 1.0.3
 IPCALC_SITE = $(call gitlab,ipcalc,ipcalc,$(IPCALC_VERSION))
 IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
