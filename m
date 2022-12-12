Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6724EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 14:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9117814A9;
	Mon, 12 Dec 2022 14:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9117814A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwiKyyCkZzYR; Mon, 12 Dec 2022 14:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3486A8149C;
	Mon, 12 Dec 2022 14:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3486A8149C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BCCE1BF390
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 14:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E394B410DB
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 14:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E394B410DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1mzYpj8nRyx for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 14:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A24A84156A
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A24A84156A
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 14:44:05 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id x12so3456116ilg.1
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 06:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VgSBWrG8qtsANH/oGe43Uj3ZjzVzwW0dyQFXpWMP+f0=;
 b=skmckJ5yFX0B9S1KXouJDxdj72HpxLIc3evk98vuGeFsuSb0EuRAm9NEwFJ+FHSt8x
 e8Ptf68kdZGUq9y8OnvsDjm44JJb1zPsCeEBEwCv51Wd4zBzaS0jfI8AsbpWTKeHMevu
 /An43nqDZxI7XrC1kb/8+81XgaPuvP11OR1bBSHEyaCa/2u5SdPka8+W0xFBPqQspani
 e5Uy7FreGv/iFDJ1n1BvjoF2bJw80S2N3RifBH/vPjh9EFTnflmnKYek+i2GZSU9CnAv
 mj7tid1LJ3nZERc8ee7BsEVqxQEqG0v76CUTEEIQI+d1X6xFneGn2K8LTwYesql1Mxgs
 J3vA==
X-Gm-Message-State: ANoB5pkcpv7gxej13YsJLwm1LolvWGbhzXJ2hEjO1aoCgfc0uMUh2bH/
 Ch6zfmcZovK/LWjgsYAsr2ZKgeXSlC4pPA==
X-Google-Smtp-Source: AA0mqf5EpfvLrvaiXfEKmWWnksUni5Y33QpUIDNVJUtzYzDY4TM7m9A6i9PlNdDUkQmcRVCs7xNe/w==
X-Received: by 2002:a92:c088:0:b0:304:b398:24ff with SMTP id
 h8-20020a92c088000000b00304b39824ffmr2983977ile.8.1670856244475; 
 Mon, 12 Dec 2022 06:44:04 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 j22-20020a056e02219600b002f956529892sm3066862ila.2.2022.12.12.06.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:44:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 07:44:00 -0700
Message-Id: <20221212144400.2417899-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VgSBWrG8qtsANH/oGe43Uj3ZjzVzwW0dyQFXpWMP+f0=;
 b=cZvOqQFJiyhpnR+CVcG3LlxPcwmn+TVVxSNfCngFD4cAcZsjqQlYbAWPrcjwagrtdi
 OYOZdI4j2lJvjH/aqFugTSx76kF1bqYnGp74M7qz5mF8awLG684PQjo4pQGN5X9l3rw1
 4eB3ihOOGS4tNGjOG7ODaNi/SCrVhFIQBhusMCdYaDZelHtODomLbBr3vEP49KFdj4yN
 nnvGmyBQA2TMBO8YcLbbnpFv24bq9mFXiael23k/cNHatN+g1jH7zHajjVc0ViBPh0en
 S899vp7jLPeXq/G9xDa6I1WhLxqn5ysCFNZR5Wvso/ReJ0QG96EO/xUJxe6shRFMvfHo
 x38g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cZvOqQFJ
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.14.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
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
index d642119786..9d68751c03 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  dd1ee5cd1bb76c434319f305cd30873be2f8221e310168fc376b53b7d0e166ff  maturin-0.14.4.tar.gz
+sha256  383f60977a330ec8699a51c37ea9c5175ee7e95fc36b06d9415e0eec1f3acaf0  maturin-0.14.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index ea055ffcf6..4570ad4535 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.14.4
+PYTHON_MATURIN_VERSION = 0.14.5
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/7c/51/36749c1a0881a4292e4f334bd9ddb0865e0991a83070834d1aaa1af7443f
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/36/83/2bdec738921e253d774ab8b9e99f4540a406ad0d8a1442c84575e5506686
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
