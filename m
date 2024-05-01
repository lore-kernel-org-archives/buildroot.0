Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92922C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 09:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F126059C;
	Wed,  1 May 2024 09:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unll-XCWR6py; Wed,  1 May 2024 09:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 520E6605A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 520E6605A5;
	Wed,  1 May 2024 09:24:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 009B61BF3A3
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 09:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D2A605A5
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 09:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5NnPAoD-kdc for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 09:24:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6EB86059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6EB86059C
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6EB86059C
 for <buildroot@buildroot.org>; Wed,  1 May 2024 09:24:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5191b61cad3so1591622e87.2
 for <buildroot@buildroot.org>; Wed, 01 May 2024 02:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714555449; x=1715160249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YDfctzUgXUSI8Uy2PutedPSIm9GGDGSl5AR/rndB4ds=;
 b=mhIGc1wGWb+h8SjaaR1grAgw/pTGzhNZ/DTahitesycw1FLGZHewN6Gfmmr//IVDZk
 wz3DWDaX9LdMXvEMGb9YG0FdDFpkB2QwVSu9ZTEQZfUxk5h/YFf+hSBZrg3wW+wXLhcR
 T+RVnPLHSaA/0E1TJmdsW/eZfcZooFy6FlePjx7PDWXHSIuaIoxu+DJx1xGMLlUCm8KZ
 mvVKT7e7D1EGTBKB2zXXPkn0otX9ly/44zvj6anZ2O/fQLYlQMk73JJhpNtZbP69feuw
 ut4pgZ/5Em8QlaZUGiyj5TOmncuCvcaRhBI/9LGov4UeARJxMDbjs9QXYIqoLGeryAHY
 RiBw==
X-Gm-Message-State: AOJu0YynqFHuELf/h7OYL62braK1ET2m/rth+bxBrlERp3uMmi1LuZq/
 PVwD7htdEEJlhCFRL8aDSeDDoJEV0nPjZbk6iqtChFsQUOUVBKWzXxmawlnW
X-Google-Smtp-Source: AGHT+IHI+T+gy3qYgLGtEx2nijHguqOb3K0gDxYrMexxgKMQZjnPxegHSpC0JhzTE831OttgN9yY+g==
X-Received: by 2002:a2e:bc10:0:b0:2e1:9b2f:d47e with SMTP id
 b16-20020a2ebc10000000b002e19b2fd47emr108388ljf.4.1714555448749; 
 Wed, 01 May 2024 02:24:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 s23-20020a2e81d7000000b002dfbff5667csm1446410ljg.52.2024.05.01.02.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 02:24:08 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 12:23:26 +0300
Message-ID: <20240501092328.323236-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714555449; x=1715160249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YDfctzUgXUSI8Uy2PutedPSIm9GGDGSl5AR/rndB4ds=;
 b=P5mAFybzvpq4vWcILEyOKNpUvs6E1GR4n1gthIaZQz2EtweULWhoTWvi3bnJXalTEe
 RAy9TuJAixKnHi+XJnTBecNkACtMoZffSZpp1SBBcRwKrFgSRnZPIYbIc6o5GBkMkzMq
 I6m7M4Sr/NQ5m2FLljt+qBt9ltdgd+PwPv5awJ8v7w1D+9uh0A0HzZIBMly3JwLQ40l8
 8a7uK6oJE1dUVWtObas1c4YSsKHUA/jqS2ow6K3cIdra3yNHTJAzTmi/aWOq19Yk3DKs
 /kwUYelotVamTWtpW3YgxqwsEFI5TDyAp1usqenUZeapVYLD6GW8qfzPmipaYMtvuDwG
 2nJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P5mAFybz
Subject: [Buildroot] [PATCH 1/3] package/uclibc: Bump to 1.0.48.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In 1.0.48 release uClibc-ng has provided the fix
for SPARC related to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index a10ceab54c..571bb7333c 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.47.tar.xz.sha256
-sha256  29a4d684a06da344ee3ee09acc2ca7649d592ae3ff848f698145c46def05efcb  uClibc-ng-1.0.47.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.48.tar.xz.sha256
+sha256  3bf5fc6cc5cbc454b6c478424755c6f71e7c15578a2c966f02606aa5c5596e21  uClibc-ng-1.0.48.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a7b18133ff..9593e18d45 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.47
+UCLIBC_VERSION = 1.0.48
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
