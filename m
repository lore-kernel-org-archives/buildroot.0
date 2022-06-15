Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB18C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 23:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 574A7419AD;
	Wed, 15 Jun 2022 23:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pp_iTenoOLrg; Wed, 15 Jun 2022 23:17:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 260924199A;
	Wed, 15 Jun 2022 23:17:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 765F51BF3BA
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 23:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 639FD404B2
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 23:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuPhx-ZAN_lo for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 23:17:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83F3440292
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 23:17:35 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id b138so7436642iof.13
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMmqvg5BIm8/BojZf6WMWCwq1GwHTvqw+g4GCQd/JZg=;
 b=iWNe+hIUTAnZozigVUaOHNp1T8TWQAotsdRWQFzjPEvTEZsjPUiR/S+AKDqpY9hFdB
 qi9TjLQjsrLDpxQCRF4cT1KNI58/+Bh6r3KR65qUpcaKLZm5Y8cIo3qDRrR8KkvLQm90
 yax/m4UU7OqjQ8MkHuvjPMS11hudHZiaMNPxP9qyRIFbeoVV7UoznJ7JaDwAosEPW8VL
 AycTpNGokzyBcLtCMRXR+vtpmeKHmKc3qYHGrT6zoC5pi+8w+xwgBrX3Mh9z7am/IB1l
 xoQ3TPH6bLcurDMJ/c4M3k+S5G9RYQ3E0jCl8hOIfnAzyStsFcBbpXBveWs2isOn11kp
 d7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMmqvg5BIm8/BojZf6WMWCwq1GwHTvqw+g4GCQd/JZg=;
 b=GFaXzRQA+kKOvOKgCSn0k6mIpjVbImXSkImAiSIcPr42m5N7/qz6aRHKUJYBa7rLsA
 fUDDtpA23c5HsX5JkzxA2WYnhhOHPPX2xjooKGQ2++cYLsayl8VHXsPwyDJlINQmU/KS
 kiD6kwjDhG4IBaY+l6sZI1wYanC6berKvcQ7ZoJ2VwhnAiU9oO7j7wkz4VR3IijUCUeF
 bhgpgcNQ/Cmp6yUmiQbxMVpn9CGdPZYcD2tdHa6s+ZtKZB1UXu9WQCSjmaPk9XIN/NMa
 R021+ZjkeECchLj5zCZOLcjn+ylLWJnJExQAcAEPopvWPh2S5UAAKN+GdUZaYj5gksGD
 aZdw==
X-Gm-Message-State: AJIora+DcfLbwC+39frCAaasF9XHmaPcV7J0DiB7f/rclPrtUZ/vnLpL
 4CQbAaZj00E8N8uqrxMih0k2LsimxYQ=
X-Google-Smtp-Source: AGRyM1uruKsRYcoxThkdGRx6VZkUX3dd3DN+KDN7/5i7Y+WLPjYuXWjhMIPEZqLPLRfG+Ftp6slnnA==
X-Received: by 2002:a05:6638:14cd:b0:331:d9b3:fa47 with SMTP id
 l13-20020a05663814cd00b00331d9b3fa47mr1185923jak.303.1655335054503; 
 Wed, 15 Jun 2022 16:17:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 q13-20020a02c8cd000000b0033167aa9be5sm160802jao.114.2022.06.15.16.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 16:17:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 17:17:30 -0600
Message-Id: <20220615231730.2900335-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615231730.2900335-1-james.hilliard1@gmail.com>
References: <20220615231730.2900335-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-jsonschema: bump to version
 4.5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-pyrsistent runtime dependency.

Drop unused host-python-vcversioner build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jsonschema/Config.in              | 1 +
 package/python-jsonschema/python-jsonschema.hash | 8 ++++----
 package/python-jsonschema/python-jsonschema.mk   | 5 ++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-jsonschema/Config.in b/package/python-jsonschema/Config.in
index 7002653722..7b30d46fc6 100644
--- a/package/python-jsonschema/Config.in
+++ b/package/python-jsonschema/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JSONSCHEMA
 	bool "python-jsonschema"
+	select BR2_PACKAGE_PYTHON_PYRSISTENT # runtime
 	help
 	  An implementation of JSON Schema validation for Python.
 
diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index c631fe981e..a2766f78cc 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
-# md5 from https://pypi.python.org/pypi/jsonschema/json
-md5	374e848fdb69a3ce8b7e778b47c30640  jsonschema-2.5.1.tar.gz
-# Locally computed
-sha256	36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41  jsonschema-2.5.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/jsonschema/json
+md5  c3f7a29c187bf1d038c66a5d5763eab1  jsonschema-4.5.1.tar.gz
+sha256  7c6d882619340c3347a1bf7315e147e6d3dae439033ae6383d6acb908c101dfc  jsonschema-4.5.1.tar.gz
+# Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 0fb2be869f..013a5c1293 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 2.5.1
+PYTHON_JSONSCHEMA_VERSION = 4.5.1
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/9e/62/93a54db0e44c4de57868a7d638d7a8abce113c8bc43a20b10b1109b2a517
 PYTHON_JSONSCHEMA_SETUP_TYPE = setuptools
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
-PYTHON_JSONSCHEMA_DEPENDENCIES = host-python-vcversioner
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
