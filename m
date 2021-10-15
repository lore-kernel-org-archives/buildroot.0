Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A62C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:58:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 418656115C
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 418656115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1D89401CC;
	Fri, 15 Oct 2021 05:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bM8-yd9qpDM8; Fri, 15 Oct 2021 05:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F310840153;
	Fri, 15 Oct 2021 05:58:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E361A1BF2FB
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D287E60780
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghg5Mpf-4IH0 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 05:58:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D44D660638
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 05:58:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a05600c440800b0030d90076dabso937072wmn.1
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sm6SYRdHWhmNStnRUs9yBTp1KFvqu/FqpTJ/q1A7i/I=;
 b=RtCYDBJdiQGus7gDq3XMULQQYOgjA1r8sW6PVq/rnPBQylGLygQjtPSbYGLPzANWJI
 zxk+g2yuuAInx0MQNmYfevlO34SmTNcnMZdBFe7+ZaVeAlsAUotpW0dYFRnREk0NOUvd
 L4v64ez+lxlv5wMon711KnjokQ76H8vGnSFHWmKlQ9xsFQ7ecv+W5C1dvObPMIeag5Qn
 RQ5BgUJfg4oBE6fye7ZkWVeY3iZfIdiGbLX81JLFh3sl7p4A2KTZB/RgaSDbsutc3oFR
 1KXc5yTonRj6u1bn4jX6XgUT+7KUyUmLXhb624jSDqMOWntd9QiC4ZaAMhtxdSM4I8IP
 GIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sm6SYRdHWhmNStnRUs9yBTp1KFvqu/FqpTJ/q1A7i/I=;
 b=CvFciBhnykmBClmNg56h2jDvud6HSFPiVNBkPGKbfVdioCTNLdZ9uTnDl5kOKkoZqs
 iUT1K+xDQyKj4sxZ1HlwWDt68zcwk4rDaRMgh/kT/O6HUbaU6JKUQwhbnqU+A7Kpvbws
 jw2i/SgfT0WrLTVcl2MEuSGKt+bcQ6gtMuSIXfYaOKA/pkMPMtz7uUkUcuFtNggKR+Uu
 1Kh0f8fizoGS+/vGyHJUe6o7wG43aQHy5sLJw7ZFImDK/je8AwLawyqWTtGb4l1u9t71
 AIdP0C62eqQaM0VmCMSfrqut/RK7/EpGPT6p7qz0cpJYRjWnKVC4w++JFLPY72Nhdx/x
 bWUA==
X-Gm-Message-State: AOAM5300WuhFSg1th/jG5nZ747VniyW9SWWamF0XWyMhpvDoI5OpraoC
 IRNNjZuwUSjRCdKtD47FtgoQ48GxZSs=
X-Google-Smtp-Source: ABdhPJyopPyqBf3o4faM/wS9WyA4eppRuK91q3oSRzzTE4GjWkkirXY+NsTwWXBioHnFPqauFMyIOQ==
X-Received: by 2002:a05:600c:21cc:: with SMTP id
 x12mr15741413wmj.8.1634277485902; 
 Thu, 14 Oct 2021 22:58:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t21sm3708304wmi.19.2021.10.14.22.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 22:58:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 07:56:42 +0200
Message-Id: <20211015055643.158071-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
References: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,3/4] package/python3-pip: drop package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop python3-pip now that python3-cryptography has been removed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pip/python-pip.mk     |  1 -
 package/python3-pip/python3-pip.hash |  1 -
 package/python3-pip/python3-pip.mk   | 19 -------------------
 3 files changed, 21 deletions(-)
 delete mode 120000 package/python3-pip/python3-pip.hash
 delete mode 100644 package/python3-pip/python3-pip.mk

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index ba7134e235..81fc87d5f0 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-pip/python3-pip.mk
 PYTHON_PIP_VERSION = 21.2.4
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
 PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
diff --git a/package/python3-pip/python3-pip.hash b/package/python3-pip/python3-pip.hash
deleted file mode 120000
index d90fb3d005..0000000000
--- a/package/python3-pip/python3-pip.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-pip/python-pip.hash
\ No newline at end of file
diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
deleted file mode 100644
index 5e20b06865..0000000000
--- a/package/python3-pip/python3-pip.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# python3-pip
-#
-################################################################################
-
-# Please keep in sync with package/python-pip/python-pip.mk
-PYTHON3_PIP_VERSION = 21.2.4
-PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
-PYTHON3_PIP_SETUP_TYPE = setuptools
-PYTHON3_PIP_LICENSE = MIT
-PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
-PYTHON3_PIP_CPE_ID_VENDOR = pypa
-PYTHON3_PIP_CPE_ID_PRODUCT = pip
-HOST_PYTHON3_PIP_DL_SUBDIR = python-pip
-HOST_PYTHON3_PIP_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
