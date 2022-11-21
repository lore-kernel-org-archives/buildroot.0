Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC06C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 12:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A1480DA3;
	Mon, 21 Nov 2022 12:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A1480DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6v88-wdbqxE1; Mon, 21 Nov 2022 12:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4487B80CEA;
	Mon, 21 Nov 2022 12:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4487B80CEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03D801BF2AB
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 12:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE82841677
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 12:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE82841677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EicZZ1wuBET8 for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 12:20:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09EC2415E5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09EC2415E5
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 12:20:28 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id d123so8460391iof.7
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 04:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lvvdv/FkQQfHAaOnKRyenx14lFlR9fKqkB2itSOypNA=;
 b=C+20W294OMKPJ/ZRX6R7FMHqGjxSxV0qtirPx2urGciiOozBxCf67/YS12yxh+rVcz
 ssXKw9UQnET3LHjG266hgulCkb7kjBq9I0znp6O2/5ElxvrvQQbE5c++mZqYK9CqBSOH
 b2idmQSTgNoKhtNMpsPmyEMD8YuAJwbCcxung/AcLvGLIOr+pdI+86VmVDsMP5JCad3P
 B5fazVv9EORkU9COyN8XXB95Rajja2dxqwGQAyW+zu0bEgELUTA3r+EyKFksNSIe5ceS
 wEXkBbdIOVkxX6+9Qd4+S5CwfmnGyBP0YRYknQJk6EqDDhx5x7y6UPYcmqpBg0Qkymyg
 QH/Q==
X-Gm-Message-State: ANoB5pl584kBAlL+tq67GWTHEEbYleqHtXjFCu/qPR++Cs5vawndq4ds
 V3DAm1UZO10XRkEHBvErzBSUpPExnVxagQ==
X-Google-Smtp-Source: AA0mqf6tD9jLq1dZ0HQGfXZN37hM6l+6FDP7iOzXotgpOG+d0uOdTRqU865I9aiU4/K/t0tUsAUUfQ==
X-Received: by 2002:a02:a317:0:b0:363:6ef6:a52c with SMTP id
 q23-20020a02a317000000b003636ef6a52cmr7898876jai.287.1669033227801; 
 Mon, 21 Nov 2022 04:20:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 f9-20020a056e0204c900b002f916f15625sm3864695ils.23.2022.11.21.04.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 04:20:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 05:20:21 -0700
Message-Id: <20221121122021.287011-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121122021.287011-1-james.hilliard1@gmail.com>
References: <20221121122021.287011-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lvvdv/FkQQfHAaOnKRyenx14lFlR9fKqkB2itSOypNA=;
 b=QV37mkR2v7fuKXYPnCe4FXTihfc6CNATIuZz1fChSOiNGQSU8kbUnN9rVcLN0DJjhC
 1L1e+YUUBB0k1XkI2iqKn+iWQEqfqz4AGaGhmv2q2fse2jzD1x000TEirU7FyJI1erTq
 QJAM/zkws+FSIuIURs9jyW6no0yxZ+t5TiPqroGHmoOfdyTzUIDcb32d22HmFozyasA9
 Yg53aNKEqZmnzOkHcfS6mHj8BJVf6/Ipkwt8pSOjbODTWLS+jYMTBdba5JVx/xqfBAQp
 0NxUsyS9oQyoH/b8x93F42SdNoGIc3DQLTSdQEV0G5S8Dx0knYZUaYDhe5v8AcvTD4fa
 H5sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QV37mkR2
Subject: [Buildroot] [PATCH 2/2] package/python-maturin: bump to version
 0.14.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index eadf300bc2..b9936fe8bf 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  06d9d166b4a2d86f06ed09eeb362ac03728e1fbd2b852cc6a4ddc7cc75029237  maturin-0.13.7.tar.gz
+sha256  54976d46be5d1e0d94ae8fbcfb8e72212b1ec9fe9752e3d14510c17a4000efeb  maturin-0.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index ffbd131ef0..ab87df3842 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.13.7
+PYTHON_MATURIN_VERSION = 0.14.1
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/4f/19/6f982e341612ab442f90ba1a047a4188d48473ad0d1dbfb3dffdaa20e095
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/a3/54/6bac789ab775b5ef1f07977e998cf719857e2675c3442f3f24e0399e1483
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
