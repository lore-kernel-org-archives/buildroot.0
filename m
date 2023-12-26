Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7B8C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 17:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61CE760E44;
	Tue, 26 Dec 2023 17:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61CE760E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tyz-_IWlVqrz; Tue, 26 Dec 2023 17:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA08F60D5F;
	Tue, 26 Dec 2023 17:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA08F60D5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C6C81BF228
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FA2440530
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FA2440530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1GpBw8Jp3YJ for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 17:03:40 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D69F840182
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 17:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D69F840182
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d5aefcc2fso4754495e9.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 09:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703610217; x=1704215017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MJ+oyQ4msnKNbi1wZXnjo+M+7utbQMYqzjOJKOIJe8Q=;
 b=FDyyalEW20NL1SU7Pz2p5m960B4x4vs9DtLYB4MvYLRmeoSrjyghsDanKJviYNPtBL
 f90ju4unoi5NnbXTcHJLNnLVGjAMTx8JfuInMsZSDNHDjArjtceObnarqSwhj1pkkJ+A
 n0qDeJKmmtBokootjH1ihemr8OA+e2sY70DFuu8Ryas27pQKPEHXr4wuZK3ul6KSW7RH
 kUrP1aWEd3IR8Bwlcis3vQFe7cHaZF7BFOPKiFeIrYM6MeL5qLYCR3O/xOQC4CZE1ddC
 T01K74t6+C8xGM1y/FcyHymlNZ9vPs0/+fU2p+DuzgvCHtBTigOsM7sWjCF/irmaxFk8
 7VYA==
X-Gm-Message-State: AOJu0Yy1Is9rftuqeQH5dwcJPJdZ8LcyQuZEBn21dtV81Mvyz43FcMKe
 fBcNfEFiVKQ9V9FtGBO3hFq9WWxdru4=
X-Google-Smtp-Source: AGHT+IFCEqhbuw9beqD0t1/VYu+/rpl+frzdNw2z78u2vStVXQ/kEw6OOFpE1CtSzz81wSDr+AY5pA==
X-Received: by 2002:a05:600c:190c:b0:40c:53c7:28d7 with SMTP id
 j12-20020a05600c190c00b0040c53c728d7mr3917331wmq.60.1703610217470; 
 Tue, 26 Dec 2023 09:03:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a18-20020a5d5712000000b003368f9ec9e0sm10758925wrv.42.2023.12.26.09.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 09:03:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 18:03:33 +0100
Message-ID: <20231226170333.820436-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703610217; x=1704215017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MJ+oyQ4msnKNbi1wZXnjo+M+7utbQMYqzjOJKOIJe8Q=;
 b=NiYrhTFYKgO88gClRJYLk17mzxQuKY8mF/mT0AvYDKA20GJFTEI/jphXShW4D2IRli
 TptQojFWZT2V0SCwsIqOnEPfI5W/iviwQiaH2esuKujacKzlFDZBAW/CkJbIBrhy3ZLD
 KL0C8rgxTL34aaKbA5+svrUAu2QeqD49iCDCuhz3pR968fznA6mNfZbCa3h39PFUg5BG
 BmcCQumolP2O/bbHanBc92aRf/ftkWn75OlWIFvX69cwWBLfOfbjJ5k3A/YhexqCeXub
 GoeLAniUGuSVcNgRVMpPTP2fM2hrCgZRs158fZEDjP05WzEkLx2mdTcw4ckNK4HIvd9Z
 +ORw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NiYrhTFY
Subject: [Buildroot] [PATCH 1/1] package/libebml: security bump to version
 1.4.5
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

Fix invalid memory access (reading beyond allocated memory) due to
missing integer overflow check.

https://github.com/Matroska-Org/libebml/blob/release-1.4.5/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libebml/libebml.hash | 2 +-
 package/libebml/libebml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index c83fde32ab..34626eb1f4 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  82dc5f83356cc9340aee76ed7512210b3a4edf5f346bc9c2c7044f55052687a7  libebml-1.4.4.tar.xz
+sha256  4971640b0592da29c2d426f303e137a9b0b3d07e1b81d069c1e56a2f49ab221b  libebml-1.4.5.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index c85638c03e..0f69de8c81 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.4.4
+LIBEBML_VERSION = 1.4.5
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
