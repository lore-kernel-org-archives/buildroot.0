Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A99C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 20:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2169F60B4C;
	Sat, 30 Dec 2023 20:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2169F60B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JpF1Q-DAC7Yo; Sat, 30 Dec 2023 20:43:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FC9260AA0;
	Sat, 30 Dec 2023 20:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FC9260AA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBEB1BF5B5
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 20:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18E9D415AB
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 20:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E9D415AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbC6HwrLEwqa for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 20:43:37 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A13B405AE
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 20:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A13B405AE
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so7090048f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 12:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703969014; x=1704573814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cs96b217RFTQaZ8X8iaaif9jestSWLpHetmvPRwxD+o=;
 b=wNGSZ6aNrAs9QVI020V+gubIQrDb87GxEGriXqOXrWHbSmFsx+9AI7Ym9ymxP3YScP
 9PpyN45I88QsBMgE2tGB7FAF74HooGqJTlX4VprxcX61JqugmY7IvgbdqUGhrdGrPNUX
 Kfl6jtCm11+7jdmk5i6//pzLZqdqdz2J0pPrWgVkdgOlO/pAP2/5k36nvEntgBoNoXiY
 ndDgqfErJbup2nwmf8JfaqNW0kokAqeqM7E6zxyl6Sk1eKdgHfSDzUV4pJ8mCcl4BCYl
 yreVgcvJwF2z+AWUDr58/sbx/PE+myv9JE1q/C90KORydMtUNyyzYeSQ+zxGXt5S9Uu0
 /mTw==
X-Gm-Message-State: AOJu0YzszcIbVoB/7hYgthCsobRBpju+VKP9e62cLVQDiU5pDjaCQH9e
 BJbz2Z9o3GtGvnivLpT5541EUlsusGA=
X-Google-Smtp-Source: AGHT+IEXSmLdZeHqFWDYWP8U+Kw55CoZroZv1DNvjkiSD+xxkDIsv2R3gkp2Uq4MxfEAJZgP1yE03w==
X-Received: by 2002:adf:a198:0:b0:333:2fd2:7683 with SMTP id
 u24-20020adfa198000000b003332fd27683mr2850393wru.116.1703969013980; 
 Sat, 30 Dec 2023 12:43:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t18-20020a0560001a5200b0033699668c2dsm18611456wry.32.2023.12.30.12.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 12:43:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 21:43:24 +0100
Message-ID: <20231230204325.1219272-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703969014; x=1704573814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cs96b217RFTQaZ8X8iaaif9jestSWLpHetmvPRwxD+o=;
 b=UZSXdDmDj96yhkAIwwXCCOPkUKvMIC2QdkgUn2cTDpPVP4r1CIh4yLpCJvJ28QbT1B
 arriMs7G+R+MEMm4bPDCuqyO1ACXqm1xYK+zlUnAj9oZ4V80wUwTMZkaIhazXbutLxk/
 agARgzM5WS0oAfBIWz33S+M3G8fkkcAgQhaS44Fotb0YirWJqRlw7rk2lGfQIw7+Je9+
 UkmbNHEMKH1QSqSc4hszCBWD5/1W6eELAPR2vFtMmriZFjlfuWy59jMdKnZKURfmndNj
 catBGYrZO/1mPbNQmC9LYWPBVARBXcwWHFYvqFwIg8WakSkGeYcYtOc5prq1qLozpWei
 SNMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UZSXdDmD
Subject: [Buildroot] [PATCH 1/1] package/libseccomp: bump to version 2.5.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/seccomp/libseccomp/blob/v2.5.5/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index 8337f33f3e..b80efd68f5 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.4
-sha256  d82902400405cf0068574ef3dc1fe5f5926207543ba1ae6f8e7a1576351dcbdb  libseccomp-2.5.4.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.5
+sha256  248a2c8a4d9b9858aa6baf52712c34afefcf9c9e94b76dce02c1c9aa25fb3375  libseccomp-2.5.5.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 7d7f33618e..ff295e986a 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.5.4
+LIBSECCOMP_VERSION = 2.5.5
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
