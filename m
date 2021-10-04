Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0FAC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:14:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D59EC61401
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D59EC61401
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E4583B3A;
	Mon,  4 Oct 2021 17:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4KQ-VxzoteK; Mon,  4 Oct 2021 17:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD4C83B60;
	Mon,  4 Oct 2021 17:14:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26C5E1BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E636060D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dmb6t8_jxdmF for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 17:13:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE3EB606DE
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 17:13:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m22so26606621wrb.0
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kHKXpv4kISmNrgdKmcO14gdytmHM05u+Y8EL0RrGMaw=;
 b=VzsCbF5hjwguM8p1vVPJ6jGU46CTFLwCLM9YOjRzKzXN8su1cb2SlN8AYjiNrWrt+v
 sNJY9GKLok0VvpsE+q7IAai+8hl07ceiEUK7dbfTP52kVYjNeiGzX6Rtq4znVXrSLKrC
 Ai+tX/O6hVjVWJbfpnoxULjedwPXkfFC2ylvTrKoZb8A7b/dIDLAg73ycW3yYrUCCGaN
 CPV9FlAF5uQ1t8qoVGaHWtRiZEo/cdymo9fO4I9ztTNFj0x2yjTGRaw3p56uEkj/+hfn
 EVgHG0rNLn7HbrN2reZWxX6nPNxosCj9r6X0SnXzbVd9bdnA895Pq8FG6p23OqD/flUy
 +cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kHKXpv4kISmNrgdKmcO14gdytmHM05u+Y8EL0RrGMaw=;
 b=p4zQXtibEz3U7uzCOO90VNnSxEcMMIo9rz/5ctwmKK0oHToUBG1loowdXFPAE3iUCd
 8CEUUl33KecvVdqnxmSFxL9Ej79YpmsigcSPIUsZfmEBZD+2OadUG/DKUGoAeqxYjzmI
 OaOLwwgncwrHxSKyvndAq/C0UOO+Sm3R1/11Qr1gQPdApsgLZ4YVmNsbtHIV+ZtzCa03
 OBHRisEGnHGvk8LxEhzH4ZCWAy826/xhE3Dy7QIzvrcpZnhw99IvOVUdGiQtvKRr10hI
 e53ewEusu46i1Zx4zkOZWSJURsbQZTD1kud4uXcYgUgRa48A3C7p5DLZsgUfo0IXIoQq
 x9Cg==
X-Gm-Message-State: AOAM533mQk9uHOKVfn4XSJx8OwQQ5pyYpYP/WaWfb8RExU+NJ4Tsk5dE
 ldsIh1ON9FTiuV3NIOKE+BQ5vK4Poi0=
X-Google-Smtp-Source: ABdhPJwzpfylTUK2rTmbC3F12FgOro0p8Uk57xN5a4XJxghShzPuvtjufX1csniGMEfePfpHtm41QQ==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr16112422wri.113.1633367630067; 
 Mon, 04 Oct 2021 10:13:50 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:576:abe5:6aef:aec6])
 by smtp.gmail.com with ESMTPSA id i92sm14669053wri.28.2021.10.04.10.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:13:49 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 20:13:40 +0300
Message-Id: <20211004171341.19564-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004171341.19564-1-asafka7@gmail.com>
References: <20211004171341.19564-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-gunicorn: bump to version
 20.1.0
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

* The package doesn't support python2 anymore (so the POST_INSTALL
hook is not needed now).
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-gunicorn/Config.in            |  4 ++--
 package/python-gunicorn/python-gunicorn.hash |  6 +++---
 package/python-gunicorn/python-gunicorn.mk   | 16 ++--------------
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index b3d11cf199..4e7c0179a5 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Gunicorn 'Green Unicorn' is a Python WSGI HTTP Server for
 	  UNIX. It's a pre-fork worker model ported from Ruby's
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index 402250ea78..cff4915b72 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.python.org/pypi/gunicorn/json
-md5	f581937e9d8569ebd3fd6af1f9ab809f  gunicorn-19.9.0.tar.gz
-sha256	fa2662097c66f920f53f70621c6c58ca4a3c4d3434205e608e121b5b3b71f4f3  gunicorn-19.9.0.tar.gz
+md5  db8a7c5c2064000af70286534803bf1d  gunicorn-20.1.0.tar.gz
+sha256  e0a968b5ba15f8a328fdfd7ab1fcb5af4470c28aaf7e55df02a99bc13138e6e8  gunicorn-20.1.0.tar.gz
 # Locally computed sha256
-sha256	789fe11b92e1cabfbcf744b5fcc392c9bd5c6798603a4e89f925b6337984d1df  LICENSE
+sha256  789fe11b92e1cabfbcf744b5fcc392c9bd5c6798603a4e89f925b6337984d1df  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index d113f75185..fb747bc00e 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,23 +4,11 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 19.9.0
+PYTHON_GUNICORN_VERSION = 20.1.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/47/52/68ba8e5e8ba251e54006a49441f7ccabca83b6bef5aedacb4890596c7911
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/28/5b/0d1f0296485a6af03366604142ea8f19f0833894db3512a40ed07b2a56dd
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
 
-# At the end of the build, we try to compile all py files using the host python
-# that has been built.
-# The GAIO HTTP Worker is only compatible with Python3.4.2 and up. So don't try
-# to compile it with python 2.x
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-define PYTHON_GUNICORN_REMOVE_GAIO_WORKER
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
-		-name "_gaiohttp.py" -exec rm -f {} \;
-endef
-PYTHON_GUNICORN_POST_INSTALL_TARGET_HOOKS += PYTHON_GUNICORN_REMOVE_GAIO_WORKER
-endif
-
 $(eval $(python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
