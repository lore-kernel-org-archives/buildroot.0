Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EADC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB2C60B0C;
	Thu,  3 Nov 2022 13:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB2C60B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPpiq6f1ZsjL; Thu,  3 Nov 2022 13:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70C7C60AA3;
	Thu,  3 Nov 2022 13:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70C7C60AA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE4FE1BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 898EF81F25
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898EF81F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msBEzy1h2YNm for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:43:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E57A81F24
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E57A81F24
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:43:28 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id p184so1306729iof.11
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S+UZ7XnPIP6jA21uamGuNNK1EtpYlSeVvT/Dp3DpATI=;
 b=66XAJdCcOiOcyS5lTP6kBz/gcl7JA1U8dXTMUFKidvWzqnWv+msn5dhZ89fxqI89Wk
 GIXodBmXeRD5ayyNW7jgsjpxUieX9RLUObnpwAM1kkB924nL9eZU30+PIw7tREbvbrzb
 jz1WbsVv7qCRl1v1ejZx1yqJPXCYmEtQNCiQpJw1U/GqL/MNsyxooW4dmYJD4evMOm94
 Qe8+okNhafKjwb/9UNtOF/uSRDSFGvTZ9NCRds692J2W+/wQDAIqWyNvt4c/hyEIpsqj
 4eXqzD8OBk0dQFvfzmCYVvJnVrb4ImLv6nqiuV8k4gSDqznaUP3cmcOJDCuNem+ehmga
 JuoQ==
X-Gm-Message-State: ACrzQf2exx/EoViCepcMg8hvMtAbN/TKdJseesFEV3IBieGAwgJ8RVb3
 YxqBe8HEkMEov+Dt3s2wMwLWk4h3PvtHiHhm
X-Google-Smtp-Source: AMsMyM5Trmv1IbW/SQWUJDpLdqo004ta0znzCa5QnwN+nAtgpSZD/sW6s4NzSYrQzYa7AmPSTCWqDg==
X-Received: by 2002:a05:6602:1402:b0:68a:9d38:8248 with SMTP id
 t2-20020a056602140200b0068a9d388248mr18377181iov.68.1667483007305; 
 Thu, 03 Nov 2022 06:43:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 e5-20020a926905000000b00300d3c0e33dsm354059ilc.4.2022.11.03.06.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:43:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:43:25 -0600
Message-Id: <20221103134325.2429673-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S+UZ7XnPIP6jA21uamGuNNK1EtpYlSeVvT/Dp3DpATI=;
 b=epSeUxbcuakHeX14rBqGNRVr8OheyxxN9Pya63W/9jKZJrxnXZ/Ks6c7d5GbqGaAh0
 Ym8Gp2PBEGPa+7ES/LT5Q10BTlKufWliJaD4jmLlHz2M0NPSJv4o9sPRMLusZmbmTMdU
 5Y7u5bBns5a1JjeXkDKbuCEGqUgoaqwDlx94Zau2U8/Ck6Os/kXrwI71rF8MNBsxiU1s
 QWPhen0EE9CcWlp+8QZlJFJn5b2VsqIlelczzRZHpWrHsvYroNyH/JGb8SmRPOw1EzQt
 uVEREF2qj1NXtkmA03ART0rTi+iocmv/Y+GoM+4/yCVAl5cTmSjz0vnl4rWTtw8mtl/Y
 fj5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=epSeUxbc
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 22.3
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

License hash changed due to date change:
https://github.com/pypa/pip/commit/874a2f8c39e531baaaebb47109a9a50f12a247a9

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pip/python-pip.hash | 6 +++---
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 69214110f8..d1442ca39d 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  efbdb4201a5e6383fb4d12e26f78f355  pip-21.2.4.tar.gz
-sha256  0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b  pip-21.2.4.tar.gz
+md5  f0dd02265e7ccd2f8758c840fba64810  pip-22.3.tar.gz
+sha256  8182aec21dad6c0a49a2a3d121a87cd524b950e0b6092b181625f07ebdde7530  pip-22.3.tar.gz
 # Locally computed sha256 checksums
-sha256  23a7361c2b1581028bc623b9da2bd24997abcaa4781ace6ad444a37944f8dae1  LICENSE.txt
+sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 81fc87d5f0..0f2c5d8e02 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 21.2.4
+PYTHON_PIP_VERSION = 22.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/f8/08/7f92782ff571c7c7cb6c5eeb8ebbb1f68cb02bdb24e55c5de4dd9ce98bc3
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
