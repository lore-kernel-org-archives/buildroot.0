Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663E7C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 09:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D6660759;
	Tue,  8 Aug 2023 09:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5D6660759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6-E_ARsMnil; Tue,  8 Aug 2023 09:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F2C606DC;
	Tue,  8 Aug 2023 09:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F2C606DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50EAB1BF276
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 09:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2996D813CB
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 09:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2996D813CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bjZ6nXRyzx2 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 09:04:15 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A65581399
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 09:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A65581399
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-52327d63d7cso4154453a12.1
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 02:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691485452; x=1692090252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GK1AH0Nc9chncK3DwIpaoAMEy7tqQKXX03XH8oCzzjE=;
 b=cj02vMjEenVFW5zY5e8I8sIXLaoroCpKmmE0hf2Lh0rwffokiEYReCrAYtvs5SUyGO
 UQFecKw+dMavWtjjkI9qeXETPWyO/J2JVSCT3ZyoWTJnv1tEoIKqmBV7qvkcIMCx4bQu
 8Q6g8zZ21LkH79Ws9KG+z7aN1rxApimOrmR5A8IursNJ4Aa3n6Crxe2/fg6+zEawh2M2
 Xi8t6hnJJhrVgkh31WsaHdbf5sY2/boKB66FJaTphamqMgo/cRfusG8p96691w1qCLG+
 v51eMd6ImSeBzpzilZ2eItmewCY5qcbNQMfOcK5rH1WL4WEKOK/zV/Rxb48a/ZMRmEHd
 FQPA==
X-Gm-Message-State: AOJu0Yyi8QEqWjmXw+44ZgtXE8l1LmFvkmPmM1L1/ZpwUBjqOTb9zEQu
 X34kVRdvvgPvGB0H4lPfqxzhG31pHc96PDOII0Q=
X-Google-Smtp-Source: AGHT+IGpVqcn4oTuqyxd6xh8FxHoLXVo2yrAeO19TGnKBOCOelfSykWi2kyot1KTNG2Q550ghV2tzQ==
X-Received: by 2002:a17:906:74cd:b0:993:f90b:e549 with SMTP id
 z13-20020a17090674cd00b00993f90be549mr11039773ejl.37.1691485452369; 
 Tue, 08 Aug 2023 02:04:12 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb68:2f00:529:a57f:c3b9:5803])
 by smtp.gmail.com with ESMTPSA id
 la4-20020a170906ad8400b0099bd682f317sm6234468ejb.206.2023.08.08.02.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 02:04:12 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 11:04:07 +0200
Message-Id: <20230808090407.558957-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1,
 next] package/llvm-project/compiler-rt: fix build with Ninja
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <dalang@gmx.at>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ninja: error: dependency cycle: include/sanitizer/allocator_interface.h -> include/sanitizer/allocator_interface.h

It's not clear why this cycle happens, but compiler-rt also proposes to
create a separate build folder on their site: https://compiler-rt.llvm.org/.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/llvm-project/compiler-rt/compiler-rt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 03dc76eaea..5d9c3d8fa8 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -11,6 +11,7 @@ COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_CPE_ID_VENDOR = llvm
 COMPILER_RT_DEPENDENCIES = host-clang llvm
+COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 
 COMPILER_RT_INSTALL_STAGING = YES
 COMPILER_RT_INSTALL_TARGET = NO
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
