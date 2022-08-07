Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64896C19F2D
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 00:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032A583EC3;
	Sun,  7 Aug 2022 00:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032A583EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wbamo6L2B2Wb; Sun,  7 Aug 2022 00:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 194C583ED5;
	Sun,  7 Aug 2022 00:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 194C583ED5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F50C1BF3A1
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AE8440359
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AE8440359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yd4es305vbMi for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 00:38:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50FC74012D
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50FC74012D
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 00:38:58 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10e615a36b0so6945481fac.1
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 17:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=o3zKTRaLoqjhbGV/8scVC2gGbUi0JGQx8FL/jrJxTSc=;
 b=5/loszwBwicV7INdkanGuQLM+aGa1y1NFufuJg1u+SruWPl6pKINiS940P6OWd2umj
 /mYB+mpUuIomq5kDZWPPwdAj5fIq9TctaIleUttseJdqqfEThACB/Pkwy42V2alwHk4V
 c4i4Lw+24+7ccZFic2liAsKa3ZetjFhFqWLLy93Wso0HLgBYey2RkDV/xzon9QmYaMr5
 Su4NpzjSw23bFXbmdMIaeEjJSA8JCWInJjVoyrMVBYb849JyAxJZHIG4keUFq+uyQbIy
 8CDgCzZz1laz+GLTxCubIZ1QTx9e2IYRt5SZNYxpD0GMpJBVUeAt3Sl+mXzKdUTPvOJX
 OHLg==
X-Gm-Message-State: ACgBeo26i68KQj3yOS/KDXZCaDrIRRMqL+JHWcQrQUOkw/WIWu6uBibY
 CWAw0llOOdytvKLdDqVMzIRooMAc5Hg=
X-Google-Smtp-Source: AA6agR6rB4t6Zgsw1qwqjH2KUl1UVaWgN4q8ZKhn8nf13sM4Ren8ZXudKhac1E+wINoULnjbe43FlQ==
X-Received: by 2002:a05:6870:4214:b0:10b:be93:47 with SMTP id
 u20-20020a056870421400b0010bbe930047mr9959895oac.276.1659832736807; 
 Sat, 06 Aug 2022 17:38:56 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 j8-20020a9d7f08000000b0061cac699458sm1469298otq.38.2022.08.06.17.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 17:38:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 18:38:31 -0600
Message-Id: <20220807003832.1177015-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220807003832.1177015-1-james.hilliard1@gmail.com>
References: <20220807003832.1177015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=o3zKTRaLoqjhbGV/8scVC2gGbUi0JGQx8FL/jrJxTSc=;
 b=jxgl7In7B5uAdgb2mVBPQR8d4B6jXdCxDfiq3PyWW46Uv45z/2Wem1Vj4SN0KDHkc8
 Q6XuCLTd1PjU9eefwXDz9BApmKusCOPxX340l8rCY/0NoUV9Ghw7cuU3iLHQWyEUOzUR
 Z4QnWHXDM6heeUQh6iNiNYnNJwtknf/GgSeK+aI+FAwBvnNoo86kR5RBjKy1uS4qPf7f
 cEXZ5yCCfIPuOQfL+pJff4QiVmGGLvfGZMD/fHuZyJ6f74wWgNO5kjmqw0PIOjsc/Xa8
 D1RDV4QkES27cwhWHlSIcrM2GNOW1bZ592HWpoaXA4Pad1Aosl5ac2v+nPjsrLr49oOU
 9XOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jxgl7In7
Subject: [Buildroot] [PATCH v4 4/5] package/python-orjson: migrate to
 maturin infrastructure
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

We can now significantly simplify the python-orjson build using the
new maturin setup type introduced in the python package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index e0071fa390..aed8036a0d 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -7,16 +7,9 @@
 PYTHON_ORJSON_VERSION = 3.7.7
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
 PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/8a/68/47bc5e624431d77445f06a2d3ba32777fda650f05a2f803ea1dc2b07b65a
-PYTHON_ORJSON_SETUP_TYPE = pep517
+PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-python-maturin
-PYTHON_ORJSON_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_ORJSON_DL_ENV = $(PKG_CARGO_ENV)
+PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
