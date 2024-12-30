Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B6EE7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 10:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ECE460AE5;
	Mon, 30 Dec 2024 10:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2at6nCCeSXmj; Mon, 30 Dec 2024 10:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 350C960AF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 350C960AF5;
	Mon, 30 Dec 2024 10:35:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FB35CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C9C2407CD
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69qVRk5PiObK for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 10:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38861407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38861407CA
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38861407CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 10:35:57 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so807505966b.1
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 02:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554955; x=1736159755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9Vo0aHA72neRnm1nwU7u1dR4Nx5V09umqNiLLXMqXE=;
 b=onQNYH6bCPP2N424ew/66gUaByXPbZeuyQO0MRpyo/B6HYo+JoeJbU5xK/3zgwlEy+
 Gf8G2RN6vVvehv3xAjj+J6PmSC2yj8Bk1S1f2qa4OXr3sqhWZnJ5XMWFRyNsolUdEuKu
 yilcmKI8VpwSANrv1+jfTVi8YZ3W0g0nT/0AjVGlvXyrJk03VmCRqBA7jQ88awM4Q47m
 ojQTtz0GcFFiNKY7HyJhu6wsAKlG6CaZHA4rv5eMi5dcqxM4m9h+la7wDCM6spHvVsbg
 5OVlYMAqCGooBeT+jVbPHRz0uCUqFtUjR4ZFNMWKu/mZEXz1a1YYf01IN+uoF91FPBvw
 oBug==
X-Gm-Message-State: AOJu0YznsSyF9/b1mILg6Gt4B+2m8/6RvVgeXrAn0yhyDtLlaPjjqspp
 eJ0j6K5dn82bMJKMD0QlxmoqTrsg/LrCPQ6iuQ0dZ3UmxSMUEgzhtzU6eA==
X-Gm-Gg: ASbGncupKb6VH8BrbcmyOqfgpIuCQwNgCyK15od7Tm52j18ok4aA9OfNdwD/Z276aOi
 RKwG7iYnStDFc+NBbRcR+jZrag73jKB+aBDHxNK6yWojA/wHecdlV2Qy/G+42cifXvBzo0SE7Ti
 GUtMZ4l4AXPimc5XwZpbtRjJwrwq9DQg2D7ze27ntykEHzbL5sbOSiUGn2YhrwkhPJRIO7TCGlv
 VHFSO6YndQuQFKjZSM43S+xMJaFD9MRgTX5TETBqD2HNd8iatXbdKsojHBw7cW1siZ9gV7h
X-Google-Smtp-Source: AGHT+IE1WFGKYs/vkelAbgECwR9+XMKVrlpn28JJinmkLegCSvTNMFryqPG9cKvWp4rYuDejyeElZA==
X-Received: by 2002:a17:907:1c07:b0:aa6:81dc:6635 with SMTP id
 a640c23a62f3a-aac3342c511mr3256700266b.18.1735554954417; 
 Mon, 30 Dec 2024 02:35:54 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89617bsm1437781766b.76.2024.12.30.02.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 02:35:53 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2024 11:35:31 +0100
Message-Id: <20241230103534.671602-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241230103534.671602-1-heiko.thiery@gmail.com>
References: <20241230103534.671602-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735554955; x=1736159755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I9Vo0aHA72neRnm1nwU7u1dR4Nx5V09umqNiLLXMqXE=;
 b=F/RPUQIwVlb6EkJNF9yqnfs8kbkJGL7URsWbF+/I0mxyjTNyfNYwtESrRG1SlGTdHz
 Bx9mjVBjCAVbA74FUGG0EYS3TSiHjwAhszqevegkmOAOe9PRYt/ZNvqQymKsGJTPepfr
 uP1BFWLUdpMCjzBnWal1Oy8b5le4EygdPmJGezIKmMu85btsV1letXVlbkhJDZ9UyvvL
 gBGu3J1bH7VAaOqd4zealTts4QrEU4qesVGI9skwlOVww3VRyVSjQf77bI0lf0kykZDH
 31xuaHtK2u4EDNhjhM+O53sF8179t2e/T0gdNy8VrJ7vNZ8dHAov0+ux0wlEHsFdc9Ka
 4Y8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F/RPUQIw
Subject: [Buildroot] [PATCH v2 1/6] package/libyang: bump to version 3.4.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The LICENSE hash has to be updated due to copyright year change.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index e03278adfd..eb8388166a 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
-sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
+sha256  2767902aeffc55c55767f4ecfe5371c422174794edd8aa2b02028d5fe3f8b82c  libyang-3.4.2.tar.gz
+sha256  f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index fca0cd63f8..2f095c7e9b 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.148
+LIBYANG_VERSION = 3.4.2
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
