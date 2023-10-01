Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EEFE748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 03:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B1EB81F2C;
	Sun,  1 Oct 2023 03:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B1EB81F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N49QVuKGdueK; Sun,  1 Oct 2023 03:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D6281E97;
	Sun,  1 Oct 2023 03:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87D6281E97
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79D1F1BF5F5
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 03:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51C0B4086B
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 03:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51C0B4086B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3d-6_RGO6QS for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 03:29:58 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7035D40650
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 03:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7035D40650
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6c4bf619b57so8091983a34.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696130997; x=1696735797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bswLeC08Fijnm1eDSvnsgi/dtc7NI7sNBVgqWs3Gt/Y=;
 b=rLlGmLS6p3V9Ma83fDqTox+XD43u9lPFVUl/wvIgpDSHHWdk6csLonu7W3w5zDp5tH
 jAePA/wzLe+MgrOhzg3OvOg9iv8/rmGfhtyLgAi1BOd/eHqFybI6fouoNYSnbFpSqL9k
 6cfsP1UD8w5AhtQGF1PmyBkViHo1UpClsPagna/XtZNfVyx6eIVs5ZT/F5++7/676kGU
 kYXFbR6nveT0R1zSEwhzRfRAGMKv7qgjukSvsDsVx/vhTccOqnYFLqNtnuWux7TG+GpQ
 RoTtThYhKnxwLeGRZaCv0JKVQwBiKBW/NC0+eX4iETrn/dXXEKUSgzLPzA9/+CcmSht+
 JG8w==
X-Gm-Message-State: AOJu0Yzsm2+nnu/xGVGVMKkqt3gnmUk6kwNIEQhqOEvS8I1AJuRJcghx
 SoLnBvm/PSA5bnY3Nm0iT2TjEaaeiiQJug==
X-Google-Smtp-Source: AGHT+IHyhLmBxtyAyX3izbgzAEWjrZAr+RYCd2MMXw/EMWIxzWEQ5vUxSkSaODAK8W+DM0NX9R31bw==
X-Received: by 2002:a9d:4b11:0:b0:6bd:a82:8edb with SMTP id
 q17-20020a9d4b11000000b006bd0a828edbmr9012846otf.10.1696130997333; 
 Sat, 30 Sep 2023 20:29:57 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:976f:4611:4b54:1f71])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a62a501000000b0068be4ce33easm8710608pfm.96.2023.09.30.20.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 20:29:56 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 12:29:44 +0900
Message-ID: <20231001032945.12820-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696130997; x=1696735797; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bswLeC08Fijnm1eDSvnsgi/dtc7NI7sNBVgqWs3Gt/Y=;
 b=IfBLVx6CtxcWGDSpsNWKrop/GVzAHNrxANU20Yi8vuGBXiIqAy57UhGiAN+wSuez/d
 kb2U4Aqj2tMG047MhsgQk9p46FDfrnDPswPvgvyEQE1B0eKKzfuu4x27Os0h+86AFDQd
 u5W2lYzEMHlKVRb5dsnam9VdqxERflghIFjf1qKIH9tM3+DwQ/HJxSlntJwpM+XxBao6
 l6ZmVEYMRa1TI5zsQuclE5fz7GRarmYaBUchXKGXw/HSxU38mPGYtCtehB2cRDTRTm57
 WMxAVJN31VznQ5T25vsnqRiTR9oEv9YYCDCjmHyVXIBY4a21YLLnXyG6J33WngLu1IN9
 Tsmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IfBLVx6C
Subject: [Buildroot] [PATCH] package/python-pygments: support host package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The reason this patch is needed is because gtk-doc requires pygments.
The final goal is to submit a patch for lightdm, but since gtk-doc is
required to build lightdm, pygments will also be required.

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
---
 package/python-pygments/python-pygments.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index f151f0061b..e6d5ba25f5 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -14,3 +14,4 @@ PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
 PYTHON_PYGMENTS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
