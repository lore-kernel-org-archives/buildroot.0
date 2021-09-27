Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A46C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7168360FD7
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7168360FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501F9403B9;
	Mon, 27 Sep 2021 19:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u32VLuphLljK; Mon, 27 Sep 2021 19:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A80BC403E2;
	Mon, 27 Sep 2021 19:53:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 028D11BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6EC640261
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OstakWgYAuXI for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:52:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E87F940251
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so53944676wrg.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWg+0FGi1DHui59IbZ6qsMmCLA+JMGoX0XdbexR6btY=;
 b=HWkyFBY0S3Z6RuAE1A561ezTEwZP4+u/zwUm28dHQ4luFoNOH9g7X4qzYmkdEflwWa
 eVlHI8R+hY51lcIeuGY7ABRIvtCJLV982coWXlAHnuY7TiJlv1BE8DDQ3qGPmXF7+J64
 kBEjFKalJW707xbQGJM3OzOciVKNC0YMd3EKyiYOICaFKjWlHNwonmAGIuWcLp1ZAV/W
 /KHAK+5IQ4+WmuAAEpM3Hw2Qmjap1ToRsEnIPSPUjxhH4rEO2nCBaaepCrWJkBgWNJkk
 ua0GywdbfHjNSEqbOlU0GDBUFo2v8v+9pYN7kJnkWCOC40uVEjzJdDjHR94XDfoDHa+f
 cBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BWg+0FGi1DHui59IbZ6qsMmCLA+JMGoX0XdbexR6btY=;
 b=czz5XO07c0BLrGL5CsAMSQtfzzmZYmp5hGuWY2AFZwC1AJpORJUMkfQkICBWwofYfU
 PRr/V6AgkLqZFJtMCHKC000bY6RKFJqu6gf6fWH0X2+ajsko1niypP2nNzLG3xVPrc4n
 yhw1YuW1SAddyooAuRhWMe10hQhf5Sptun6c2ZcPunASA/vmOCwzzcPxgtF4znHMhE+u
 UEKM9DTVdecCsqt+j9zoxzyiRJqxcVslqBec10mF35/JsMkuUmYHz8+TOK/zDim3Yuav
 ZerxAKreuFPUu7JSAw3vti33RqdOmiAmkgeYmtvrL80D3fI8TAdBANYyvPfwwQI2W55W
 508Q==
X-Gm-Message-State: AOAM530OFA3zF1S1Y323O+wthZ84WRlP4KFrfM1qWvY1v3q7Gh/VeLNO
 op/pWvEEOD9vkWD00pSAk9+0/WQuwgw=
X-Google-Smtp-Source: ABdhPJzIG60FsbQlbZ4fSaPXni0Hm30v7xuE5mjo3D/f2i7wh21OzzYQ/eEhJrfKgAudnpieH4KiSQ==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr1935201wrj.211.1632772317944; 
 Mon, 27 Sep 2021 12:51:57 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:57 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:35 +0300
Message-Id: <20210927195136.549542-11-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-html5lib: bump to version 1.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-html5lib/python-html5lib.hash | 6 +++---
 package/python-html5lib/python-html5lib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-html5lib/python-html5lib.hash b/package/python-html5lib/python-html5lib.hash
index 04c64c10c1..5023f5ab66 100644
--- a/package/python-html5lib/python-html5lib.hash
+++ b/package/python-html5lib/python-html5lib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/html5lib/json
-md5	942a0688d6bdf20d087c9805c40182ad  html5lib-1.0.1.tar.gz
-sha256	66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736  html5lib-1.0.1.tar.gz
+md5  6748742e2ec4cb99287a6bc82bcfe2b0  html5lib-1.1.tar.gz
+sha256  b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f  html5lib-1.1.tar.gz
 # Locally computed sha256 checksums
-sha256	16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
+sha256  16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
index 1d6aef1aad..84229eabd0 100644
--- a/package/python-html5lib/python-html5lib.mk
+++ b/package/python-html5lib/python-html5lib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTML5LIB_VERSION = 1.0.1
+PYTHON_HTML5LIB_VERSION = 1.1
 PYTHON_HTML5LIB_SOURCE = html5lib-$(PYTHON_HTML5LIB_VERSION).tar.gz
-PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/85/3e/cf449cf1b5004e87510b9368e7a5f1acd8831c2d6691edd3c62a0823f98f
+PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/ac/b6/b55c3f49042f1df3dcd422b7f224f939892ee94f22abcf503a9b7339eaf2
 PYTHON_HTML5LIB_LICENSE = MIT
 PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
 PYTHON_HTML5LIB_SETUP_TYPE = setuptools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
