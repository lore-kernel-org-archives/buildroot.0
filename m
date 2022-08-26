Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFE0ECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37C6083E8B;
	Fri, 26 Aug 2022 06:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37C6083E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pjh4qnDUSP5s; Fri, 26 Aug 2022 06:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1BD83112;
	Fri, 26 Aug 2022 06:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1BD83112
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B96C71C11A9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FE9F40336
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE9F40336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFFD-r5DPccL for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8463C40919
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8463C40919
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:15 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x93so805700ede.6
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZcVmN8QOZ9MmSQOocyDgQ6lK7U6knmmRTjz2Mkscpf0=;
 b=D2DKtpcRCvb7QNr21d9SZOATPbyMYEqs34+4oJ+M95wqfaoogwwmMKEFEfJIQ/AE4z
 scbEsYG3gN6/S99IyZfcc0Qab/l48cs4EFGF4pNNHsFR+WB3P7qc3b2IOZO183ELOE1Q
 v3PYoWZ+DKlqbxTnYRE7/O6lkEjePwR/ehAhuYXiuhO8ihmYGLDgt/mQpEWRJYI4gdho
 DiJ+OEPduJkncj7U5Zi68xbwKdijeZbvLYJsL+4TdTIFKVZPS3t1sK7wFYT0xr8Ckbc/
 lN8C73Ea7kOauTqc3Q+cGP1egnjVI8jAZJyI37cp8IQBJon5D1LNze8M6C1ZaFglHZiR
 btRg==
X-Gm-Message-State: ACgBeo2PRIdsa2kIIACnZXyx9/IEgCiw4giA4nIzhSeouN//FZZ5ykR3
 Dt571Mqk49eibqRMl62e6TCVMXiyDz22BOed
X-Google-Smtp-Source: AA6agR6lqQOg+mP/Ijj4oDT7bhydRossvQegfvyhR+PfoH51Vl5L5cUWsPKk30H4YilyNYxAUf8fhw==
X-Received: by 2002:a50:ee0f:0:b0:447:f097:aef with SMTP id
 g15-20020a50ee0f000000b00447f0970aefmr884535eds.20.1661496494694; 
 Thu, 25 Aug 2022 23:48:14 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:14 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:42 +0200
Message-Id: <20220826064758.3968647-14-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZcVmN8QOZ9MmSQOocyDgQ6lK7U6knmmRTjz2Mkscpf0=;
 b=j4naXHiF9J1N7JcNX4Sm4f95pzCfJsvUVaOYBWasxhsjjqG7MB5ZYraRO3kraOkVz0
 0WR1kCRvYOTy2rYyxBP0Gpic6BJCmRo7jeM7ICoHLPgtQTawVeJTPO1ytC+tJiudPoln
 froT3QXIZ8OjO36GjtT8cmFbLg7svCK62p4ya9rwhRou2kZDZHekED6X5qfntyynMFYp
 ubdkSnXronkVaFQNvKYXBzSRwNjxON66b/wd6ppsKT5psDJGh0fJJBchjO8vKg4iRpkJ
 ghAqgVGVQFccpfmbBpgAtTbcyhL46L0BXVuYC8+j76CXIPMeUviORt2AHPniYCdONXT7
 NOPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j4naXHiF
Subject: [Buildroot] [PATCH v2 13/29] package/qt6/qt6base: add linking to
 libatomic
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch might not be necessary for qt6 but I can't find anything
indicating so, Yann E. made the original commit for this on qt5 so
he might be aware of current necessity
---
 package/qt6/qt6base/qt6base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5474a80302..033e92c26b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -157,5 +157,10 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+# Qt needs atomics, which on various architectures are in -latomic
+QT6BASE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-latomic"
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
