Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70760C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:54:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B90660EFF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B90660EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9021404B6;
	Tue, 28 Sep 2021 08:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gulpIW2Ecwpm; Tue, 28 Sep 2021 08:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 430DD4040C;
	Tue, 28 Sep 2021 08:54:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3AD61BF298
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D38C9606C4
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yjk3bimrM8Gj for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 08:54:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E58F4605D6
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 08:54:44 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so1574090wmc.0
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 01:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FAx3k1g6kZIIl5x6GTdDQJt44VhC3ESsTJY5pc+YW00=;
 b=CoPMWCgMbuowL+H2kHKgkoVth/yD+egxPfeTpdnPVkYqBbz6/AqBnRnS4TbBGDSQ6z
 Ccm8QY7QPhhXXy4Xew4gkQhvvH7hIWHBjzBXMQYv1EnoTMfBkDv2mI7rBpDq+sbH0X4x
 zSSo91Ha1yVrfPTKgCQC/WKzYl8D02esdEdEz/uL8eQ5/zzQ/HPWRkahuJWUuQO7BHsn
 +9jvfCwF2JbPDd0Lz/MGiOdBE/TMTpsx2jTvsU57brx/W4Jc61XaYl5ZVUYeiBM57tbl
 EPhX0ypgNaxjbzfsacMJyIxvKP13gfKFBkwRzHaJSwTcQGnpuN3cG539/oY2WyU9HHNj
 xQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FAx3k1g6kZIIl5x6GTdDQJt44VhC3ESsTJY5pc+YW00=;
 b=U3NGB8X9RczwloC/YIOD/AxCGkiTsZCtwHfCYR6xdNIVgkowlbX9ru1wO35FxRFwAt
 f0cJwLSZoghKCW/QTJ/7v9cXwN6DcuI/FijfkoAk0ltxMFOJ0bSATLFlvygRuAG6AnEx
 3u4yHOlx0vOZMZJwduMj90Ox3LShghapqJ0m+Tp9aX8WHogCq5XRci3DPfV0O/d/fuMl
 ECfElUvsa2GRA3+f6tXIQj7kDrlF4lLlZW8/PShcxromavJzBTtwBIosngE8uD7IOA5c
 CqqYedzN5/r7jGS/9x4wP9XpMSPrwbXHl6a3jqXWanEme1yq4bfngenyJQMV86abD6D/
 RKyQ==
X-Gm-Message-State: AOAM533qIrikb/RS9BOuR6Hkb1yrqELIak7oL4aorbXKLA3Qbd3Hei6z
 80jWma5rGOG8NROHkR4U3VrWxiPe7hk=
X-Google-Smtp-Source: ABdhPJw9lMpQinwI4Og4Hp8YHgcYd2N0lJSKkSNb8ktMmHgcEVxpvt37VrYek3YHpLjk52Y5hoBAsw==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr478959wms.29.1632819283121; 
 Tue, 28 Sep 2021 01:54:43 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:e3c1:c62:a1cb:8d22])
 by smtp.gmail.com with ESMTPSA id r26sm1947360wmh.35.2021.09.28.01.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 01:54:42 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 11:54:35 +0300
Message-Id: <20210928085436.583218-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928085436.583218-1-asafka7@gmail.com>
References: <20210928085436.583218-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-oauthlib: bump to version
 3.1.1
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
 package/python-oauthlib/python-oauthlib.hash | 6 +++---
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 2bf7f7974d..e55f0c861d 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5	43cb2b5bac983712ee55076b61181cc2  oauthlib-3.1.0.tar.gz
-sha256	bee41cc35fcca6e988463cacc3bcb8a96224f470ca547e697b604cc697b2f889  oauthlib-3.1.0.tar.gz
+md5  9201e30a4eacf3ecfa15503b241ad5e3  oauthlib-3.1.1.tar.gz
+sha256  8f0215fcc533dd8dd1bee6f4c412d4f0cd7297307d43ac61666389e3bc3198a3  oauthlib-3.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256	3d1e12d8ac52c0b6c148af6d291f72400b8720ed16c0ac4a89868b6d14b1c939  LICENSE
+sha256  3d1e12d8ac52c0b6c148af6d291f72400b8720ed16c0ac4a89868b6d14b1c939  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index 407abc7659..7369768b35 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.1.0
+PYTHON_OAUTHLIB_VERSION = 3.1.1
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/fc/c7/829c73c64d3749da7811c06319458e47f3461944da9d98bb4df1cb1598c2
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/9e/84/001a3f8d9680f3b26d5e7711e13d5ff92e4b511766a72ac6b4a4e5f06796
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
