Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B274C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 05:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C1A40933;
	Tue,  6 Dec 2022 05:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C1A40933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTsYse3y7VGG; Tue,  6 Dec 2022 05:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98724094C;
	Tue,  6 Dec 2022 05:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D98724094C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 463761BF34C
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 05:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB0C40612
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 05:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AB0C40612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PX1JT1qH-Wfn for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 05:13:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1DE405A9
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D1DE405A9
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 05:13:37 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e189so9087587iof.1
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 21:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O08ODgP/RjXd5dWcFfjstKp/Dpe1MqgzFr+h1BraEGI=;
 b=nrl9TZW6T7iJZ6ZdqpOBveINjtQSzLTI3+1TPFxnPKikSSIWzY91oGCUXQvUyGpE7o
 pdmNiJmxa6+Dmv/u59dllM3RSXgC6bsi7E0g8IUmxaFkZwIQUFxKnKk/UGMqSmyVIeME
 kVudCXm3IdcEFkc9GMt+RZkr4fESXqGjg0dGTVYnGVKipSPnASsqGfWtw+CQRIXgwxz1
 sapPZFhfiqMgA+7w8jBYRYQFCUuQIA0l38NR/k9SSHXU2pNMbWeZpA7X1nGatvByepCo
 w6SUIvJy4TXclYKC+3SUJzey/ELrtmY0/6fSMHAo6Yb6YT9aH1CO4R9CDWkJjNw8TVqg
 Ocsg==
X-Gm-Message-State: ANoB5pmsLAJpAWg963Jt4nTsGHrCL7aGDJQMmC/gh0GWvdvCH2LMix6a
 O1UQUabXRYF/pukbsNKSFan00BEpmpJogrwU
X-Google-Smtp-Source: AA0mqf6kR2RsRUO7dd3bjTKU6NdRuWK4tslABdp9NVibt1+DWMCJF3GTbtns93JU1Ffc3Oc5p939Kw==
X-Received: by 2002:a5d:9b09:0:b0:6db:ee91:7ca6 with SMTP id
 y9-20020a5d9b09000000b006dbee917ca6mr31007107ion.211.1670303616110; 
 Mon, 05 Dec 2022 21:13:36 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 x27-20020a0566380cbb00b0038a0eff63d0sm5610666jad.155.2022.12.05.21.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 21:13:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 22:13:33 -0700
Message-Id: <20221206051333.2901529-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O08ODgP/RjXd5dWcFfjstKp/Dpe1MqgzFr+h1BraEGI=;
 b=WVKNArVEHyxJdb9Vix/WXrroS4C9vl5GiF8+8BAShF0z3Bg2fwvkcfOTBc3UzPUo1t
 4SjA+GpK4ZaQ2ffw/w+fm+ui8HXUV7Tm5RC4n29R+mW+PAtQVnQNceO0SL8PEKqMCqXE
 eVisgKQ1JX8EmdwF9grIM+7uWqJVcjKLs+OSQYSflYDK7ysPw71hPC3g8fhCylvqpSPq
 e2zDsoK0uCU2CbGigjLquUE81BKfOcVBgmdGrBlqe+k5LIHCEMFdHLc5c4wxrf6nWWN1
 OnV6EuR5n84NjATu67GyyQqiCfTFuQst7Ag3wzbqnq1+FvH5S70v+5HeXdVPqpFbJqo4
 jXlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WVKNArVE
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 65.6.3
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 3e4ae01d92..76ad1ba1ce 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  3f062858ddfb5efa564c9c02a30cb104  setuptools-65.5.1.tar.gz
-sha256  e197a19aa8ec9722928f2206f8de752def0e4c9fc6953527360d1c36d94ddb2f  setuptools-65.5.1.tar.gz
+md5  1fd8bd04b0bed95ad6c81f03b1c080bc  setuptools-65.6.3.tar.gz
+sha256  a7620757bf984b58deaf32fc8a4577a9bbc0850cf92c20e1ce41c38c19e5fb75  setuptools-65.6.3.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3b62221e25..226ef2b479 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 65.5.1
+PYTHON_SETUPTOOLS_VERSION = 65.6.3
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/26/f4/ca5cb6df512f453ad50f78900bf7ec6a5491ee44bb49d0f6f76802dbdd43
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b6/21/cb9a8d0b2c8597c83fce8e9c02884bce3d4951e41e807fc35791c6b23d9a
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
