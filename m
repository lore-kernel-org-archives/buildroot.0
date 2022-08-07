Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E151CC19F2D
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 00:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834DE83EF6;
	Sun,  7 Aug 2022 00:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834DE83EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBRCffXY0Lmm; Sun,  7 Aug 2022 00:39:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91BD983EDA;
	Sun,  7 Aug 2022 00:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91BD983EDA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8BD91BF3A1
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAD2B41834
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAD2B41834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_E74L9pT149 for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 00:38:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CE5241830
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CE5241830
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 00:38:59 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so6850078fac.13
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 17:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3jTjlH3UPcVzWVkyfRppL+pgeiXMKnoBK5x27CM+V6Q=;
 b=i0XoxNDCfzVbB2wNvyZ5+Ws85ZGXiUEuD54uXkkQ2Q/UKS/jO2aH3+sQjwD1ErgHPy
 YgwUucj6hbf/w2C5m52xHcAsgnzgWlcWyceQ3jy1EtcEBhrggB1k8ls1pyPWVNeNmmuB
 Yy310AcKFrhXtaaSYJTuA4iHdVZ6et8C85Xqf6CRBSP78EmjpuciuX+JRuIuGiBtesm/
 Tb5ym9aZvMVzLCjGbTcVdcp/T3q4IpZsOoU+GP4Oo9/bfm4Lr84b5+JD2O/1fSW4KWo4
 2Kr1A5FqXZ6KMZcNnfVMJAkNAMXAQKL1JAn94g5GG5UeNV76cFcGcIHptz2uqp1aES/X
 8eow==
X-Gm-Message-State: ACgBeo3EQgeoGp7HA9JHMHf7qqBgA/oqkGrfIlm3DY86Cu9/sEp3oiiw
 CpF0dd8BCqjtRIXK9Au8LmqlPAN9SNY=
X-Google-Smtp-Source: AA6agR6tv0X7uFd4ahc2U9pw4U6ujDcf0ogKMKegXV03tltSUYZKZl3/Vr0GQImlk0BlntbiGucPdw==
X-Received: by 2002:a05:6870:f141:b0:10e:3fdf:7953 with SMTP id
 l1-20020a056870f14100b0010e3fdf7953mr5944880oac.297.1659832738185; 
 Sat, 06 Aug 2022 17:38:58 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 j8-20020a9d7f08000000b0061cac699458sm1469298otq.38.2022.08.06.17.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 17:38:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 18:38:32 -0600
Message-Id: <20220807003832.1177015-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220807003832.1177015-1-james.hilliard1@gmail.com>
References: <20220807003832.1177015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3jTjlH3UPcVzWVkyfRppL+pgeiXMKnoBK5x27CM+V6Q=;
 b=Lld+6gnjc1LFImi4czyM/lMVcxaD5/IGIjYMa/SGrykmPmi9dY3sTZSABk4Ulx+sYs
 9UnpSZkcuvhCBQvX4Rd7Sv9MYkSGofjU0wkBHlZBkBoH2IXD6nbF/rgCUvdutRs1VxHs
 wAuuou2ZZI5MA0lHJKr4hlWrdEb4xSwx4n+G0jEV1vs0KrQXS93M6NvhwQkZg8BFMLnA
 kXusSvcInspNJ1+1P3IAj217Ev87irOufyJwOfj1dgkc2jYzJrTi7AEY4rQqpN6rSnwi
 T30KDw9iFGaZKh9fm/BfPWOVV7UqQo9xP3YEFmjbh/fop4MCliU/+DfxMDNj6CGTdza4
 jSzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Lld+6gnj
Subject: [Buildroot] [PATCH v4 5/5] package/python-rtoml: migrate to
 setuptools-rust infrastructure
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
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We can now significantly simplify the python-rtoml build using the
new setuptools-rust setup type introduced in the python package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rtoml/python-rtoml.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
index 9afe8c0315..819dcf3288 100644
--- a/package/python-rtoml/python-rtoml.mk
+++ b/package/python-rtoml/python-rtoml.mk
@@ -7,16 +7,8 @@
 PYTHON_RTOML_VERSION = 0.8.0
 PYTHON_RTOML_SOURCE = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
 PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/33/a6/b42d8e0e28bec9fd7fdbafb2d76db3f8578f151a669eba564d422756d909
-PYTHON_RTOML_SETUP_TYPE = setuptools
+PYTHON_RTOML_SETUP_TYPE = setuptools-rust
 PYTHON_RTOML_LICENSE = MIT
 PYTHON_RTOML_LICENSE_FILES = LICENSE
-PYTHON_RTOML_DEPENDENCIES = host-python-setuptools-rust host-rustc
-PYTHON_RTOML_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_RTOML_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_RTOML_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_RTOML_DL_ENV = $(PKG_CARGO_ENV)
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
