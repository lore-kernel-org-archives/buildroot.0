Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111F8C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 03:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD3F6107E;
	Sun, 24 Jul 2022 03:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BD3F6107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jazmSO64kGlY; Sun, 24 Jul 2022 03:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 866686106A;
	Sun, 24 Jul 2022 03:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 866686106A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6981BF332
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC93781419
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC93781419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKGdj9yM-70G for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 03:18:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E860A80C80
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E860A80C80
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:18:26 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10d9213b77aso10843041fac.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dOoYS1PDzUlnOkEA2D7kWDhcagO31yK/mH/ksAyw+IY=;
 b=yPN/8JNCgq0UKGVFixBx9h9QOv1UH5Wdk7f7dpswKZtMfRUUVHsBvuXaO6wzRpJbpm
 itoL/gHlZrflyLQhyiUuzZLHJBqQN0XI0lGKHZ5smBfzUAefg+h7GHXc0GuCq26kO6RW
 1tUkvb/8Z2Z59yW6MZmXP0Hp7+VuweDdHlxV3d/ZSEBL7y5jJJc7Ev80na2KA7oUK7lS
 ghCYIRJ2hRpSsdAUs1te1VbW8zvEnQMNfXTLcjdYisSGtganR/WHCx4rJdfsCfREzxT7
 Akv5ukaiFbh8xKqIt78DNHopUCyQgyVQkUG1vQ3iYP1Rvj4if1xcxUsWz9aT1v+cW/FD
 8I7Q==
X-Gm-Message-State: AJIora+uPxS7zn8ymrQMRJPkHSpNbwzmM7x4jBBSWerUtuGpxqDTFZnZ
 lXWVVyy0fjgrXlYAk0O4MCdQJKiVz0RJRg==
X-Google-Smtp-Source: AGRyM1sMGKi4PpMZzLBIn1VTgh6ReBza48SFRR43saZkyoFBJXOOEJiNLEr3BtZQH1sVoupC7m2cbw==
X-Received: by 2002:a05:6871:b22:b0:10d:c30a:c096 with SMTP id
 fq34-20020a0568710b2200b0010dc30ac096mr4187577oab.75.1658632705825; 
 Sat, 23 Jul 2022 20:18:25 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 i22-20020a056870221600b000f325409614sm4132515oaf.13.2022.07.23.20.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 20:18:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:18:23 -0600
Message-Id: <20220724031823.1262390-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dOoYS1PDzUlnOkEA2D7kWDhcagO31yK/mH/ksAyw+IY=;
 b=L4R15r5NXCLi8lAhchOsxXh6e9uxMLadj6kRhDQZdYAp39xe5EkGsg8cZmbfljusX6
 HsdXrPfC0kWcLkRkIsRDeUagvyn7uLeitYnDtyJY1sBzXuISviUmXzxHElULkHqw7hrI
 Ro4kwp0WUUZUPuFL6stRKPXhtpJCdCKT9erUc2TDojF6s+jH2qS1VPlMqofE8oLx6vD7
 2BZfgCj88+tr3WXc6aAuddGGlOmlKKZnJhMnLklx57YdjPVwTWnImkq1xZICKZdILfdv
 wfdLUJ6mbbzs/JWu1HWa6VwcLxRSKZuJc95ZP7pfDkm4NKaiPaPla+G3QE+56NRK/sNS
 7lkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L4R15r5N
Subject: [Buildroot] [PATCH 1/1] package/python-pycairo: bump to version
 1.21.0
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
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index c617d8b601..f8018e682f 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  59bc5c5d1debc3af0f6791af9d612551  pycairo-1.19.1.tar.gz
-sha256  2c143183280feb67f5beb4e543fd49990c28e7df427301ede04fc550d3562e84  pycairo-1.19.1.tar.gz
+md5  682238eaa8bd7032e36a20b6f53824d1  pycairo-1.21.0.tar.gz
+sha256  251907f18a552df938aa3386657ff4b5a4937dde70e11aa042bc297957f4b74b  pycairo-1.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index c635498d52..5b231f6b1e 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.19.1
+PYTHON_PYCAIRO_VERSION = 1.21.0
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/e8/9d/c8be300fc6b1298559d37a071c3833b0b251e0fff334d2e4c408d5789162
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/92/a4/506564f574fa74c90b98690e8ecc8dbae1629f31fcfe0be69de45d9e1605
 PYTHON_PYCAIRO_SETUP_TYPE = setuptools
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
