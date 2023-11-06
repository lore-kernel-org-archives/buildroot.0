Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10870C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 07:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B02741DD5;
	Mon,  6 Nov 2023 07:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B02741DD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rea6tXu4i36t; Mon,  6 Nov 2023 07:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7F1241DCA;
	Mon,  6 Nov 2023 07:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7F1241DCA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 802201BF368
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 07:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 598F261038
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 07:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 598F261038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnEB1OCKfzan for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 07:04:30 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87CA161028
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 07:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87CA161028
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507a5f2193bso4433561e87.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 23:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699254268; x=1699859068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xlXTXk4ZNYQyONQyVu8itTSvDfy+TqvLBiDUPS3qwJo=;
 b=PG8jtBGW5TuU5Phm97QI10Nf2kB1j+c1LpO4kKbUaFKeiFDEk3SPbQkmW0zGHSVoat
 m43PdCO2tn/Wt/22xFtg24jr2H3hOmgewr13wurbC9cTwTeL1W+5w3RNoBz+YuFuQ40n
 Ltn3lqaTO/mZcNBZBXMqFMoV66zzkw+1feXmZU5mfeDgAejFOAtJHZECR3aVoSuUWRWS
 aB0C43u8ygfB8IEVw0FExz3+AudvV/t8vzDiJxrR8rQZOjhsuCjba7TGQnDRbswZDTAd
 FHqrZZLRMLrVD+Qv+0A5t1TwBkkAjDHFy/igCAIn6Q6sCG97gkD4GT/iRZIKBc/6jPBM
 c6gw==
X-Gm-Message-State: AOJu0YzlNneOHP+64xMsnz1jXCkLKOojSmMqRBRJrLTfIrUlXY3s9Gz1
 JJaSX00xCEdFwNph73VYZMk38rQGtFI=
X-Google-Smtp-Source: AGHT+IFcsRUowNAlopyevG/Rm84OjBb9drtdhOIYk7wtG7d7DKGLuszlctMsi9idvI/mYKgTxUTUmw==
X-Received: by 2002:a19:7b0e:0:b0:509:39fa:90d5 with SMTP id
 w14-20020a197b0e000000b0050939fa90d5mr2873169lfc.26.1699254267461; 
 Sun, 05 Nov 2023 23:04:27 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 x9-20020a2ea989000000b002c0167edd86sm1109716ljq.122.2023.11.05.23.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 23:04:26 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 08:08:31 +0100
Message-ID: <20231106070831.1205739-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699254268; x=1699859068; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xlXTXk4ZNYQyONQyVu8itTSvDfy+TqvLBiDUPS3qwJo=;
 b=eifD5hzOaxDcg2OSaDNQ1wfilZGuGd5wzZ5m9/DPmSP0IL73VuF59PsO5nCESumqTu
 4GIFPtGUQ38NVbKS4ht1WHrz/CLOCxCY1Zkr6VTAbw2WCxqumAOVfloWL2T+GDLVYwBI
 n3liUvXH5WvAnlheFwmnk894JAn7BjpIWosxs326GuiNYBUotku9Nr1/EXf6hWzZ6b+U
 G8wGA7qjeybEzGTHa4Knv4TsUNehlk+pEpy/L6sIPKN/U0ij7rPkLjs7AulB29Efmnnp
 QKWFK1kVIdV5J0aTIoORQtHYvXOBv8EZUM+UGTYK/fdxO42i/Myar6Up73Yyf31ErLnX
 Ta6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eifD5hzO
Subject: [Buildroot] [PATCH] package/libcamera-apps: bump to version 1.3.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera-apps/libcamera-apps.hash | 2 +-
 package/libcamera-apps/libcamera-apps.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 1437a0e8fa..281aab88be 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e6b74a0ba10a962f1930199d7dd828c8d9ee370dfe1fdfd8ae2638df744f1344  libcamera-apps-1.2.1.tar.gz
+sha256  92ff51e2aa4cd7165a8f5131df57cb0967a259bc74e4a47d7fb9dcfd65e45e25  libcamera-apps-1.3.0.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 2a217f095f..d60e58e7e4 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.2.1
+LIBCAMERA_APPS_VERSION = 1.3.0
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
