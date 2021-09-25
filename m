Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6962DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:47:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A2760F70
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09A2760F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0F1E832D9;
	Sat, 25 Sep 2021 09:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y56oPkmZ4BQK; Sat, 25 Sep 2021 09:46:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20BE382C89;
	Sat, 25 Sep 2021 09:46:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A71B71BF29E
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A453982C33
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xKjb2yrHzLK for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 09:46:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAFCF82C89
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 09:46:35 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t8so34996183wri.1
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=taFd85z1K+79eheBAHODB4RKrfAnvsLMQ3+xxit8wps=;
 b=XHEFV2Bgofdnc1HtNy6ZT+sBvMknlEiIpx2PI1hYKfRpat3FHi8TfwZNSIzBs04yp9
 0QPwv90N0dn70A8JjrlAN3lEXlZxj9IRv0MydwnwsvBiI1MgOVh5P77zEo82Qd5ZDeHC
 +Sj3srJjze3i8MUt6yvlvBfn/YVX8Gl6SSuVKLpmEeMYL0MX7ySSy3iflFBYCiX9B/em
 R4FQsSmEBzTldHsOD2dfiDmYSPyAEa9+AkHWwrSaMYm0xn7pX48HndQTNwWfwRWxnXoC
 v7+wzxfkcrAu3A7HLOd3Mh9T9ol5biG8Luj2r2Z4R6qsJ169QOk69jtsyXZWgBdhpaBL
 qBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=taFd85z1K+79eheBAHODB4RKrfAnvsLMQ3+xxit8wps=;
 b=hgkezcRJilFrkWly1I6yIylSzn5HbKjBAKyUILppFox8nJYqafB9cPhU2hJPJ3Lkqk
 7J6WcF+uxgsmOYTuvTCWgE6YvnnuZHCyzq+oLmp2OIQBl6PZqn6UQFFtu8TyVOBtl3+P
 2stHslWBbZryOuuyi7Jlgwh6szBSATmA5kGhrOUv7WpFZVMOl1otX2w3efxtw1ghzdQ4
 k5RNwCov93lpk/wftCaquSYbAlqjZwMDCvrVfyThhIjbo+AfKqJrw12/5QIzvsk7++ih
 9frwZB86SPesb4YAuYZRJ3YGL4dkXAqichIpysKHdJhqX9j6TcyogfiEbLg3OdikUgmC
 cg1A==
X-Gm-Message-State: AOAM530b5/uDr00/2+NiAFpEdvftdnHmo3UE6aQgMLfM01miOsvt25jM
 YdC6t6FzSV63Epy5PywuBRl4FNLMZwY=
X-Google-Smtp-Source: ABdhPJzF1iCMlshYlZKYc1ZrisVAj42zS6EKNEinLUkhteIbMFrYfXiCe7vPt5p9zfvam2WYjsrmkQ==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr16212565wro.94.1632563193608; 
 Sat, 25 Sep 2021 02:46:33 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7829:fae8:ae6e:81f0])
 by smtp.gmail.com with ESMTPSA id d2sm10297194wrc.32.2021.09.25.02.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 02:46:33 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 12:46:23 +0300
Message-Id: <20210925094626.365400-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210925094626.365400-1-asafka7@gmail.com>
References: <20210925094626.365400-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ipy: bump to version 1.01
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

* The package supports both python versions.
* Indent with two spaces in hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ipy/Config.in       | 1 -
 package/python-ipy/python-ipy.hash | 6 +++---
 package/python-ipy/python-ipy.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-ipy/Config.in b/package/python-ipy/Config.in
index bead932da8..b4f0c8cb5e 100644
--- a/package/python-ipy/Config.in
+++ b/package/python-ipy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_IPY
 	bool "python-ipy"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  IPy - class and tools for handling of IPv4 and
 	  IPv6 addresses and networks.
diff --git a/package/python-ipy/python-ipy.hash b/package/python-ipy/python-ipy.hash
index 641a2eb21f..3d8e1e8c71 100644
--- a/package/python-ipy/python-ipy.hash
+++ b/package/python-ipy/python-ipy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipy/json
-md5	1a90c68174234672241a7e60c7ea0fb9  IPy-1.00.tar.gz
-sha256	2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621  IPy-1.00.tar.gz
+md5  d6cf83e7f418ebbd23324ba1c658b907  IPy-1.01.tar.gz
+sha256  edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a  IPy-1.01.tar.gz
 # Locally computed sha256 checksums
-sha256	078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
+sha256  078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index 817b531e0b..2a01daf4ca 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPY_VERSION = 1.00
+PYTHON_IPY_VERSION = 1.01
 PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
-PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/e1/66/b6dd22472bb027556849876beae2dd4dca3a4eaf2dd3039277b4edb8c6af
+PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/64/a4/9c0d88d95666ff1571d7baec6c5e26abc08051801feb6e6ddf40f6027e22
 PYTHON_IPY_LICENSE = BSD-3-Clause
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = distutils
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
