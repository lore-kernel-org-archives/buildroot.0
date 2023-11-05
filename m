Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDECC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 06:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7997C821DA;
	Sun,  5 Nov 2023 06:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7997C821DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMDgNl_knE4b; Sun,  5 Nov 2023 06:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A039A82207;
	Sun,  5 Nov 2023 06:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A039A82207
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37D6D1BF42E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10CE541949
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10CE541949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ucr-GMRRDi7O for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 06:17:18 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 282DE41936
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 06:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 282DE41936
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7a6acc8e222so130281439f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 23:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699165037; x=1699769837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdSdHPFhxSTxkjpYCL+ug9DdSUsnTxjP2tpoya6Pjuw=;
 b=Y+ib5uSOpayM8wcTEn8QRp6xHrZ+pZOQkD4a7XKJiR/PTVHhn58C9GGQpWFqzayHFK
 B9pWYmjvRApAkVf8PTKXlqYEJc/E77RMkU0nnDAHFc/ZX7Qt4M7QLPjxxHBMZQRxG0Ua
 23UeYBDZCxhaROjlUEiL96zghY3PyiwClGGJ0TkLB133/P89gc8Dqq/OCavrn0yt/sMI
 S5w3/P1iYtWZrcqk1tXyIysqS4v4sA1IKwh0Hhnbqew3r30XFQhVWo4MEuffQV62gqTf
 X5AVzzW6K3R+jJMfTszmjRGm1je7hypLNfetEO2/YNUAsj0+eO4r6rdnJ39X+rFZv3X8
 xzow==
X-Gm-Message-State: AOJu0Yzusv8FDlqoCrqkeqGb4iuMNoReCpQ5RVEdM4VGiWkV+27oNSmR
 TPmeSxu51Byuk8LhyAZiqTkDPizA8mg=
X-Google-Smtp-Source: AGHT+IEmGBOn5+e2DgEjYKhO/3AoVGsXndgAi1ZyYpsKoU4UfEcGURmcHi3dSQ1MHcuEVh1h8UkCAQ==
X-Received: by 2002:a05:6602:2e0a:b0:783:62d0:88c with SMTP id
 o10-20020a0566022e0a00b0078362d0088cmr31709299iow.19.1699165036722; 
 Sat, 04 Nov 2023 23:17:16 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 y18-20020a056638015200b0041f552e4aa2sm1367167jao.135.2023.11.04.23.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 23:17:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 00:17:04 -0600
Message-Id: <20231105061704.2855717-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699165037; x=1699769837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wdSdHPFhxSTxkjpYCL+ug9DdSUsnTxjP2tpoya6Pjuw=;
 b=UNJFyk0CNiDC4CPaqAJaEwE1dA9ucSOkBv1PIcklEXPrjGk877lMPo4Ag0Z46AMEIz
 pW9QuKdlc3ht7oEudkQ0Q4ZeqYjIguLQuRlHlNhskifZiqfJhMwycQQ2HhVL0X5Dplzn
 E+XukzfVA7IiLyCHEMcQSLLg7L3anO/Cpv5rOvBO19vAMxnNZB8qJQeiErI9+HQrmO55
 KCziuBbfMvfjvIRONFcsK9D3koTSGx0HXsFmJrpRynhiFMQosF4A6cqPQkhQxUHXlmkA
 AxN4YE7ZkyTe9WJjzKX2hGX8uK4mWm5TQ0294m7XjHPNPLxGxPZETI0/wiiMe0Hit3ZL
 6+AA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UNJFyk0C
Subject: [Buildroot] [PATCH 1/1] package/python-flask-smorest: bump to
 version 0.42.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index 2c9cf3a51a..baeddb0e6b 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  d7f8b4f7c9c6c2607dfc68bd5bbbd52d  flask-smorest-0.42.0.tar.gz
-sha256  868421b29e060a602e3739c2caf7b97cfe21c3ac488f51a2b5e95e168dd3bec2  flask-smorest-0.42.0.tar.gz
+md5  3d8c01cfe9ec4ba16636d6a3078edc87  flask-smorest-0.42.1.tar.gz
+sha256  7fde3f349d464c408c73b7cbbdb1884c1c36cc8c23b2562aba28d9bdfdd14cdc  flask-smorest-0.42.1.tar.gz
 # Locally computed sha256 checksums
 sha256  40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index ac4ff188a5..8a11e96d01 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.42.0
+PYTHON_FLASK_SMOREST_VERSION = 0.42.1
 PYTHON_FLASK_SMOREST_SOURCE = flask-smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/45/ec/9ceb51a4b8a20ae66bfc7e83ad6781f03a9f37cde6a4111a65aa6cb669a2
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/be/6e/8e3d0287bfa2da6ca7cf94cd9c053ed209764538dd5fb1d96f535e4d43bb
 PYTHON_FLASK_SMOREST_SETUP_TYPE = setuptools
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
