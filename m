Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4719C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:14:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EDD6139F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27EDD6139F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB1E40460;
	Mon,  4 Oct 2021 17:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItzYD0hsVIMT; Mon,  4 Oct 2021 17:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA80240018;
	Mon,  4 Oct 2021 17:14:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 073BF1BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB48160632
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWEzg-j6F5f2 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 17:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E1FF6060D
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 17:13:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so16532210wrc.10
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2tbH8o1fnFsOtAr3QlKkum+0rUxsfglf4LuORD7HGgA=;
 b=neSypBhEqJx8+wsuV278Xc0l0Z9K6PXA4HO/onolXtTaolYanQUZP6oojRY8iHZ/aK
 PNcc4m7ciMyxhB2Q8laVJUB8ZoqfECvo3bD3X6n8Hdlji8qX3k5nfScvlHu029cKNWHc
 hZjM7uJWhpdCory+voixJp3ViXzWt/8JFPRGAPegwp019Lr3SJU1MiKkS8Qorraxboyu
 EDcJ5SBryjWS2Ht5azwgW2xEVUx4yKwewuQL49HwHWr75CkAr0jdv6HG+GZ/CmKyhKhB
 Viflhn0D/FQLF6Mu+wdEbcbZCOioIRyOca08QR+G211+XKaU31MRf7ayZRvxZ2ktodkB
 P0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2tbH8o1fnFsOtAr3QlKkum+0rUxsfglf4LuORD7HGgA=;
 b=6Cf3zdSVMzDeipiHqEINKUCsN8Ip2fKA9J8wd4lEAFFn9c6Y+ZYMZ6spDMifa8bK3h
 gGmOF7IjMPlaMCb8YQlX+CIZe01WoscTjQxihXA9dVCBuBf8ZV9KMptXgCSYQTI8Yshw
 BbMR4ldg1BjLuIrUAEGiauTXDcvEpaPhTNcmF2iBDDljcC+EyF7utckiMhistaoP0Zaf
 dOTx+4Z1/cCZ0WkrVxQm4gsO7677CztIU5PENQ8Sk2HwR/i3cwMLgUUsXG0Vjbw0oq9r
 YEhAB78SVXyxOZ3DZ7vfbEAdTTAexqaD/fGXLDMNZpd11NbwyiVOazKRuAKquVLc44xJ
 1IIg==
X-Gm-Message-State: AOAM530W33qumC4F6s4KM2XAIKVkjoOWd9Z3BpEs6JHN3TXSpJyVBBeG
 B18k0aVJ9I+HFHnLLQGsxgQ0oeWKogM=
X-Google-Smtp-Source: ABdhPJx3kC4H55gVOvYnAWLMDmEn7rN0C9Olk0NvKgQow2uuR8puXsFtVp8ePxiRYmqzB3nO7rsNhg==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr15604771wri.93.1633367628610; 
 Mon, 04 Oct 2021 10:13:48 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:576:abe5:6aef:aec6])
 by smtp.gmail.com with ESMTPSA id i92sm14669053wri.28.2021.10.04.10.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:13:48 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 20:13:39 +0300
Message-Id: <20211004171341.19564-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004171341.19564-1-asafka7@gmail.com>
References: <20211004171341.19564-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-flask-wtf: bump to version
 0.15.1
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

* The package doesn't support python2 anymore.
* Update URL in Config.in

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-flask-wtf/Config.in             | 3 ++-
 package/python-flask-wtf/python-flask-wtf.hash | 9 ++++-----
 package/python-flask-wtf/python-flask-wtf.mk   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-flask-wtf/Config.in b/package/python-flask-wtf/Config.in
index bb15489956..18329d0776 100644
--- a/package/python-flask-wtf/Config.in
+++ b/package/python-flask-wtf/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_FLASK_WTF
 	bool "python-flask-wtf"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
 	select BR2_PACKAGE_PYTHON_WTFORMS # runtime
 	help
 	  Simple integration of Flask and WTForms.
 
-	  https://github.com/lepture/flask-wtf
+	  https://github.com/wtforms/flask-wtf
diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index cff3661824..848d6d7783 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,6 +1,5 @@
-# From https://pypi.org/project/Flask-WTF/#copy-hash-modal-d090dbe5-8665-4c96-a565-57134e470a60
-md5  1b60b7dd1245b0d0173c21123717af61  Flask-WTF-0.14.3.tar.gz
-sha256  d417e3a0008b5ba583da1763e4db0f55a1269d9dd91dcc3eb3c026d3c5dbd720  Flask-WTF-0.14.3.tar.gz
-
-# License files
+# md5, sha256 from https://pypi.org/pypi/flask-wtf/json
+md5  920a5a476ecfb751952b5048cc05fcf8  Flask-WTF-0.15.1.tar.gz
+sha256  ff177185f891302dc253437fe63081e7a46a4e99aca61dfe086fb23e54fff2dc  Flask-WTF-0.15.1.tar.gz
+# Locally computed sha256 checksums
 sha256  a075f8d98acfdb05dd98716242b9e2c1b3ab98722926b3c4cf6c916ac14e8350  LICENSE
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index a334e3c052..e2078103f5 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 0.14.3
+PYTHON_FLASK_WTF_VERSION = 0.15.1
 PYTHON_FLASK_WTF_SOURCE = Flask-WTF-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/2e/f4/3d9e1905ffad67e20ef4f5963d711e8e29ab9439120d7ffec3d2922020e3
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9c/b5/4b48cece7b31aac2beab115330c2978ef4deee3aeb0dd1037c9b7a71b8c3
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE
 PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
