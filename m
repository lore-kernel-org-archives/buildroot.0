Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB71CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C216E80A50;
	Sun,  7 Apr 2024 11:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3T7pgFurIywD; Sun,  7 Apr 2024 11:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAB0581DA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAB0581DA3;
	Sun,  7 Apr 2024 11:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0A951BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D8DA60733
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWTparPvR9xG for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67523605CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67523605CC
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67523605CC
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:54:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4166d58a71eso312945e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 04:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712490889; x=1713095689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O9lPC70EaANsVuTjUgdTluLYLjMSteq8BYf4qUPVL4s=;
 b=ePztbe+o9qCKT0Z/c6VZ/WT7i2DvizHsaiW96JEg3WUTnpC8wCV54ekzEmb1GptvUZ
 R32/MRQc3vMt0SoOo4/RsdC0Y70a5lHcU7yg0U0ciKOri9hLTPOGsg0oSEGI/QdiW02K
 h9EMp0t3A8K6qXsPbcGVPyXnT5mO2SiFtMjxhrt2PLwZjEtySl2i/Mzd0oGzB4Wp8MYA
 hrhx8aQuPZNoXQJcrrQ4WxU7a9pe7v2wGEdnDM3PxlvzhlS3zowOesub+/kzoeb/TU1u
 5aMfoO3TqUs+5YkCHP/Q4nKIgcRAvFzw2yW7SYyEQvH6hohpvtC4M657XtalwwXtjGcr
 gUbQ==
X-Gm-Message-State: AOJu0YwtlLVhEGjn1P5BiV74QYZfcOwZcpfjUyoSkPo7ArShFx68ntlq
 kUMfLEou3cW202J+6/YDGH/R+aIRUK6B2sKQTMz+I5NhOjb46+Q3enoDR1tr
X-Google-Smtp-Source: AGHT+IFk4XIThK5FIsaCYEi2zx5S6tPA9P9gMW3ZCXYZz3aupP19v9lakJzc94iFmh8UiDqNmgLYJg==
X-Received: by 2002:a05:600c:3496:b0:416:34c0:de9 with SMTP id
 a22-20020a05600c349600b0041634c00de9mr3237220wmq.29.1712490889190; 
 Sun, 07 Apr 2024 04:54:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e2-20020a05600c4e4200b0041643750e3bsm4148147wmq.25.2024.04.07.04.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 04:54:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:54:39 +0200
Message-ID: <20240407115439.872167-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712490889; x=1713095689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O9lPC70EaANsVuTjUgdTluLYLjMSteq8BYf4qUPVL4s=;
 b=i5QQOBUdWkso5mkcahMj1i6T9abxq7qY1NsPWYVL+sDNweK/ykn76lJI2suwV4VezP
 6EIh3VbUGhWe9eYnlbEWdj//xz9q0jCHCAuSzEHHR5iGFoz462BaRbGe2eEfiBK0hWJK
 wnHIPbrguJwJD9u0wJpVL7OOBJkRviMlS7DsdMmyjK2u8ulvCaT9M0eMBM9SEsHB2ZCT
 InXS/mnPO0PfP+736vcOPwLh8dGBjk6OwPsDcoULB/MeqgVaHuMwIEtO037HVZ5nWOgq
 Rvj/fefgYHvvMlPb9JtKw7UcgHcC9GPAJgmNE6K+zQ1O3IreTIsKduyfq1FWKRfN7GP3
 5Wxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i5QQOBUd
Subject: [Buildroot] [PATCH 1/1] package/python-remi: fix pep517 build
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
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
8937db8dd595e0988751e5dbb568e870b07b39cc:

  File "/home/buildroot/autobuild/run/instance-0/output-1/host/lib/python3.11/site-packages/setuptools/build_meta.py", line 76, in fetch_build_eggs
    raise SetupRequirementsError(specifier_list)
setuptools.build_meta.SetupRequirementsError: ['setuptools_scm']

Fixes: 8937db8dd595e0988751e5dbb568e870b07b39cc
 - http://autobuild.buildroot.org/results/59ff2895baa49260fb83bc375993907144b945af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-remi/python-remi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 419a3441a7..ec1649f8a4 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -11,5 +11,6 @@ PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_LICENSE_FILES = LICENSE
 PYTHON_REMI_SETUP_TYPE = setuptools
+PYTHON_REMI_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
