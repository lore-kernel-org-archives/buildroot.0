Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246EDC433FE
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF0061108
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBF0061108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B78F46079E;
	Wed,  8 Sep 2021 08:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aiumW3Ao23MD; Wed,  8 Sep 2021 08:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2985560688;
	Wed,  8 Sep 2021 08:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF2341BF5B4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBE5180DEB
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UT6Seh1aqFpK for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 08:19:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0475A80DDE
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 08:19:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i28so1976099wrb.2
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDUBBpdO+BfOgeRVvFSI6Q24IMHEsyidc5lDF6v2wJQ=;
 b=oUfxLffWRPkf8FLY4VhGNDYQbSNJcPE/elE3l0LwHeLmIUmilXPtwiC0An9H/21SMU
 Pbnfk63GfP1171kcZXvOP9oBTTGiQe7E6UPqzR+HxcKw1MRqrHt2HHNVUVhg2nUnk9NF
 uqnTKQJr5wsTM/cFv5DINVsX6Ul18OYTZkal8Al8XvAOZDuLJQHdz2iMWwNmVc5IUpmS
 hLpMFsoRw04gDbph7sXsrGw2oHK4+5+yxFyQDE+TKU3qRWuKqaazaPItCYsnyNaq458Y
 f0zSamU+6rKF9pS4304TGuv4e73ByWEGQfCvTd0UMMTKO8JLJ1FHZZsD4xdux3GN130G
 w6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fDUBBpdO+BfOgeRVvFSI6Q24IMHEsyidc5lDF6v2wJQ=;
 b=oy56f4GZ/tX7Nm30IvbM72LzdED36M/dO0gObEY57lXCUINdwVXM/YhAk4l/+bBQb0
 CaADCYfsfMWGckBFVdOdLd21keTb61CxqzzZOQR6UrRCEvBjIpyxPois8dUvEg4/qQoI
 wSlPA0YG+fBkCTeECpyUjgPk4u6JE5Gmyxo27JEjngMapB8qpkahcUHFfyOIhLeejcq4
 EPCRNgGL8bWutONzuvugTNNt8u2gUBb27ZUzm33o/FIj1h9ADbekpMmfEPwuZXHpxu5W
 ckv2XtK679Q77xmHYgsjHm9iFCmnbA1U+UzH8THd30uXOU4VNmV654FlKci9ZO/vCBFW
 uX7g==
X-Gm-Message-State: AOAM533F+YedSWMaUsArSTJzLBYoj+KfI6CusFcw2JP5CmvmwBsekSfW
 i6LqgJ0tcbwzzJsMEyqEKEzvbLkVegeORw==
X-Google-Smtp-Source: ABdhPJzaRO67xVCUxTaiIKlCiGRbhdB8FsY7qeClKQhOWBFyGLy4fGWDaIktNbX2jLhtfyFA40NyKw==
X-Received: by 2002:a5d:4305:: with SMTP id h5mr2588413wrq.4.1631089186137;
 Wed, 08 Sep 2021 01:19:46 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:8ac0:67ea:778a:fea7])
 by smtp.gmail.com with ESMTPSA id c15sm1304347wmr.8.2021.09.08.01.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:19:43 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 11:19:26 +0300
Message-Id: <20210908081927.694201-6-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908081927.694201-1-asafka7@gmail.com>
References: <20210908081927.694201-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ipdb: bump to version 0.13.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ipdb/python-ipdb.hash | 4 ++--
 package/python-ipdb/python-ipdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipdb/python-ipdb.hash b/package/python-ipdb/python-ipdb.hash
index c7cd93225d..7d483e1777 100644
--- a/package/python-ipdb/python-ipdb.hash
+++ b/package/python-ipdb/python-ipdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipdb/json
-md5  7db72771b279924ac4e5905d7eee184e  ipdb-0.13.2.tar.gz
-sha256  77fb1c2a6fccdfee0136078c9ed6fe547ab00db00bebff181f1e8c9e13418d49  ipdb-0.13.2.tar.gz
+md5  4f5ffb71cd6551319acf8cbceabd8936  ipdb-0.13.9.tar.gz
+sha256  951bd9a64731c444fd907a5ce268543020086a697f6be08f7cc2c9a752a278c5  ipdb-0.13.9.tar.gz
 # Locally computed sha256 checksums
 sha256  4eeb49de04f4894f8ea1f69a04f500799041b750b3d554c06de5ca877258e734  COPYING.txt
diff --git a/package/python-ipdb/python-ipdb.mk b/package/python-ipdb/python-ipdb.mk
index c98f9700b2..7828f83020 100644
--- a/package/python-ipdb/python-ipdb.mk
+++ b/package/python-ipdb/python-ipdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPDB_VERSION = 0.13.2
+PYTHON_IPDB_VERSION = 0.13.9
 PYTHON_IPDB_SOURCE = ipdb-$(PYTHON_IPDB_VERSION).tar.gz
-PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/2c/bb/a3e1a441719ebd75c6dac8170d3ddba884b7ee8a5c0f9aefa7297386627a
+PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/fc/56/9f67dcd4a4b9960373173a31be1b8c47fe351a1c9385677a7bdd82810e57
 PYTHON_IPDB_SETUP_TYPE = setuptools
 PYTHON_IPDB_LICENSE = BSD-3-Clause
 PYTHON_IPDB_LICENSE_FILES = COPYING.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
