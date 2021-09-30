Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A862C433FE
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68289615E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68289615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36C13403ED;
	Thu, 30 Sep 2021 07:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hDR30-J7lakn; Thu, 30 Sep 2021 07:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1273F40794;
	Thu, 30 Sep 2021 07:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39D991BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2938083F7D
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtSA1uI2GIhY for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3604183F74
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d21so8227629wra.12
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oTiwyFY4uyBn0QfuvjGl2KNNlNDvbINwnc0I2rgY1GI=;
 b=O8kE43NJEYYK4vRaW8lqUQQ7xsys1ShL5b38WO1kpbPAQm1FsmmPeokWsHsi2GnuwI
 reL8AJ8PO/kgK56sLsjwPrGSl7hiRqGlroByXflPm8/GslqMbQJrgzkaxFH6EtmSUAuF
 LGb38R3Iw67pNYJWzJateuSUCOg+1Jc71piaH9i4ncwRIITcdRLB6huG7nABrers4G3P
 9H1qcvN7yxQF1DCag0sWXVfcSyMtGc/ISYvBHwtk8FumaQ7PSkkrEgfQXC6Hnr6mFxA7
 nBJV7GYzuRmCsm68GTp0XpVQp32CNKGm3FCBwHXSZCmAwUSpEcsVScQIqzkj1GeqK9+2
 9Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oTiwyFY4uyBn0QfuvjGl2KNNlNDvbINwnc0I2rgY1GI=;
 b=0myCoEKQX2tOB4mJSKDcxqdqzpeOGek1eJnle7NX4hUnwZ3GnS4++7SK/Tf1cFZS5q
 UpN3rpQLZfhUgqTPJ8nCmb9OGRo5BQ4Mj7itWjmwh+QAr3LyQ4y2aQbjykdLFSl6g3ZX
 g+apchUzT8G0Y8jSTpk0GX+eQJGVKlCE34PxQS57FumVKbtB2TRAoQ65rcXKBjpISWWm
 shC1dbp/2VaBI1/3JzLRIX71k4lx+ReLLWczw9pemgpkwdBVBTuCr5X5hNWMQwl/EO1S
 UemN5U+EQbHk/kJC9+4VGOjb8QYXmwFwsi2XqGLxiHkysR/xA92T3kK9WkP0i7nexiRq
 tQlA==
X-Gm-Message-State: AOAM532pz2Hji2MAZsTkAQQwqjGN8JefHE1TnbY88Fmx39wKixEV3k6W
 tVYrD26mfOPJulPWwwhtI8kkW5zRa8k=
X-Google-Smtp-Source: ABdhPJzq5aN7blylJWG3of4Ue/kz1T0/WSGtOBCK1w9elpuZJO4Heg08Xj5Eb/C1MFuO7EorvNoDzw==
X-Received: by 2002:a5d:58d0:: with SMTP id o16mr4198781wrf.214.1632985270310; 
 Thu, 30 Sep 2021 00:01:10 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:10 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:46 +0300
Message-Id: <20210930070051.40361-10-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-sqliteschema: bump to
 version 1.2.0
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
 package/python-sqliteschema/python-sqliteschema.hash | 6 +++---
 package/python-sqliteschema/python-sqliteschema.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
index b25b0ae17a..310e56ab32 100644
--- a/package/python-sqliteschema/python-sqliteschema.hash
+++ b/package/python-sqliteschema/python-sqliteschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqliteschema/json
-md5	175afa008a628f6dc32392a72d4c6b74  sqliteschema-0.16.2.tar.gz
-sha256	023a443abdc12796928c04441fabbbe12e1fe8608f562b4650ae1f9a19504139  sqliteschema-0.16.2.tar.gz
+md5  ca70006e289f1d506124de779ed73d64  sqliteschema-1.2.0.tar.gz
+sha256  4c18f141239c58b6dbdc69130be41ed9740d8209a7ab6d529ba982a8b79c071a  sqliteschema-1.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
+sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index 890bfb9dc7..e4fd0de2fb 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLITESCHEMA_VERSION = 0.16.2
+PYTHON_SQLITESCHEMA_VERSION = 1.2.0
 PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
-PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/91/b6/87a9218d37afd061a8b26c0ec058299b85c3f859f1c80aff10752188e056
+PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/5c/d3/0c2e4c989a8d45f9443e431d7cbf89af4aba719fb0647b5f722716ef3990
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
