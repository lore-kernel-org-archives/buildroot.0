Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36BEE82CB0
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 16:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66D2C408F7;
	Wed, 27 Sep 2023 16:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D2C408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dS4T-vXxbb_g; Wed, 27 Sep 2023 16:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42BEC40297;
	Wed, 27 Sep 2023 16:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42BEC40297
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9098F1BF280
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ADA060F83
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ADA060F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2V4CWZQzfZWT for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 16:47:16 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41F9560E15
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 16:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41F9560E15
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-69101d33315so9677781b3a.3
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 09:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833235; x=1696438035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJj34sOke3u3keLVLmtPgh9OKm+TQcIp+6OfK1UhJu0=;
 b=Ukfkimau4Tl8FXmjt6Q97Kr4m8Y1SRnvV1SAAi5Nq4obH8XwOUjkNZUFdnjDXbawc7
 NiIdZbTzeurugDiyhlrehXZ1uRJLoEA0q9Wjqeqa60G2e3o9QSk0P5a+wrjVQZFuPWZ+
 WcvNJk4j0r5Ow/q+c6y4ncm53w6OxIkVoUdZO8a3Z2C+JqW/fMpsYlZuZ0aR2yDtKb2A
 KU2Afu1FKeUyA1ZwZVTX+Dunjx+kDiUDV4H7vrQ6gGpaFEEb/BXETrvnmf/YpTqZuKVG
 2IBJep1dD+x1huvA9AKNEO0AKywpNvKmFoL74SwytHAYby6V/ZKiZWX/IeFVv/oTp1yb
 1aew==
X-Gm-Message-State: AOJu0YwGLda9IGaeQVUyHgOcxnuKfZmNdetYrazIPTBKD6uqhpnAcg8R
 YjYvLeQBeqpoY5bsf/oNjow5Rflwo/5IxCe+
X-Google-Smtp-Source: AGHT+IGk0qGzpot+wvyEBdDvHr/eqCk5YEziTvGhqvKtOOBO+39L6Ct+jqLH66hEi02uxA++ck3Ebg==
X-Received: by 2002:a05:6a00:1988:b0:690:1857:333e with SMTP id
 d8-20020a056a00198800b006901857333emr2856484pfl.26.1695833235441; 
 Wed, 27 Sep 2023 09:47:15 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a62e402000000b0068fe9f23bf4sm11999270pfh.103.2023.09.27.09.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 09:47:15 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 09:46:40 -0700
Message-Id: <20230927164640.67592-6-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927164640.67592-1-cdimich2188@gmail.com>
References: <20230927164640.67592-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695833235; x=1696438035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJj34sOke3u3keLVLmtPgh9OKm+TQcIp+6OfK1UhJu0=;
 b=KYm52aUAWEyfB3Q8lDqpfeREb1qCOZRUrSSmFrcByr6/8LIdi2AWIvJmXI0H9xQQdr
 2o3o2HssX/QCH4+x08hazZ6L5Iej5H7NndqvYOGr5l2ahEfO8jHJwAcKmgWbsjvEXZsU
 5miYzLgMbQz7ahyOvYkSDHosYw55h7sqTFfUfb32hv8skMWW/fWlWmN7GM3q4WmvSWVg
 Y1jgtqcdJD+xB5iXfDJD1oly/gWPF7dwqWP9fIghTiIf11S1othtyDZIxxyB2KJ3AbtP
 qnuuDEommFyu1qXEIIph1GGD382oGlGw+lZ1p7Sj9iS40fTu+pSaxPaYQeeUSjFPB+V0
 DrKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KYm52aUA
Subject: [Buildroot] [PATCH 5/5]
 package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.1.7
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To match NXP 6.1.22-2.0.0 release.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 .../imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash            | 2 +-
 .../imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
index e952491a60..2992baead8 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  83ba2798564702d74ab65f6238f95f59247d983b846de1de4c19bdfaf6dabeb8  imx-vpu-hantro-daemon-1.1.4.tar.gz
+sha256  111cb6d5970f76aa3619cfd1a59a251d590fc474f84aad2d4d4083c2a4264fc8  imx-vpu-hantro-daemon-1.1.7.tar.gz
 sha256  bb645f02b260955f333348100e40af76253e2cd8b116bac047230439dd53ec5a  LICENSE.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
index 4f6f166b60..ab4746beb4 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.4
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.7
 IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
