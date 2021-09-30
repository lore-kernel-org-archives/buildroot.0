Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0724C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A6B617E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91A6B617E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34F8F4033D;
	Thu, 30 Sep 2021 07:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1w8zmaTctmx; Thu, 30 Sep 2021 07:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44279402EA;
	Thu, 30 Sep 2021 07:02:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 087D71BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04163402D6
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLXzxbui73rH for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC0BD400FD
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:10 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id s24so3756786wmh.4
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qh8GhgnKNHPi6eASHN/wbjrFhp5v//QkO7ZuviPg8g4=;
 b=X6ygK8giP7YdZkGDqsEPEbovjfgEgigl8dtriC5ZWiG8jOVYFyJYab1TEBnJUvt29g
 ZWt3Q5Hw6AOJ1Sdub9qjnksWH/ztPdwt1i23mlBu1VKgrAoHZFzte3ctZQeGe83a61E+
 g+ucqvX3ApUBuy2itFhJ+ZM0/DytnjgWubZsK96PFoM+hdyNDtdwWVr1kh+8bFGHVF7D
 xLlK+zW7T6a7YDImoigNtBTF1LU2TairOS5VoS3khLquS6xq60QgO2wZ2aJw3q7t1RMx
 iet6SUERiYpTN8I7ByX9V3iXqSFPkdHk0RyxBaF+DrHRexlL3LKKa05epJq0AXdYQjcX
 EDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qh8GhgnKNHPi6eASHN/wbjrFhp5v//QkO7ZuviPg8g4=;
 b=hyt5wc9Zf2TMY87oXAZ3snWea0yyD1RqyEJdY2Zv1f/pZYOsotOAEv2pwWHspACIGY
 FnwA4uTmtrqK6C4xTPwmiv/l1xe0Q/m5MfHB9Xi9LD8Cci8QnUlfCexGJZfIsTChpzy5
 /Zpqj6T3Mzko9sPNXIST5hXIacm0WKNlZJg10rabwEnB1cjZLND4ff14FtZIKZt8g9LX
 l/0jnynaQJp8wG8yrNGX0C97SCqGB8OqwloUdsuL1K2N3s9F92MoYogW8hb4hIcSyIPT
 1rx/iOImswPIBiz+teUTtqbx/O9snkl6JzF3N8dFxR+VnttOF6paUd1Xe8O6cwynHHi6
 M9Lg==
X-Gm-Message-State: AOAM5334uxMcKGGwoEecsf/LuwpyIjoAN24LrHbP1JfOgLlV8QsXJdEH
 7s5AgSUOZP/eUZFzVOKVsHbdgqRt/IE=
X-Google-Smtp-Source: ABdhPJwTS/+jG9kxZah/pqDX5uIqIvGo+Ti+rqdFTfnMsT5nqGvA//6SntsqqHNMBvBgh721eX027w==
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr3706205wmj.146.1632985268929; 
 Thu, 30 Sep 2021 00:01:08 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:08 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:45 +0300
Message-Id: <20210930070051.40361-9-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-soupsieve: bump to version
 2.2.1
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
* License was updated with a year bump.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-soupsieve/Config.in             | 3 +--
 package/python-soupsieve/python-soupsieve.hash | 6 +++---
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-soupsieve/Config.in b/package/python-soupsieve/Config.in
index c42e975875..eeac0ee36e 100644
--- a/package/python-soupsieve/Config.in
+++ b/package/python-soupsieve/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_SOUPSIEVE
 	bool "python-soupsieve"
-	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-	       if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A modern CSS selector implementation for Beautiful Soup.
 
diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index c4c1273e5a..699cb9581a 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5	43d8ea20c58494446aa65ba5cc6320fe  soupsieve-1.9.4.tar.gz
-sha256	605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3  soupsieve-1.9.4.tar.gz
+md5  73ff6ce22ba973fe2d47197834e0f728  soupsieve-2.2.1.tar.gz
+sha256  052774848f448cf19c7e959adf5566904d525f33a3f8b6ba6f6f8f26ec7de0cc  soupsieve-2.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256	0eee19bf360e5f7a8180e2f6d613d716f7115a456f670e3d8bb35c45a0db1838  LICENSE.md
+sha256  e34a760fe8bb3e3c1ffaa88abe495cf76e56f8ae3c7a6dde0e4b41cd013c41d4  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index 1203b26ce0..dd2ddebbb1 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 1.9.4
+PYTHON_SOUPSIEVE_VERSION = 2.2.1
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/7f/4e/95a13527e18b6f1a15c93f1c634b86d5fa634c5619dce695f4e0cd68182f
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/c8/3f/e71d92e90771ac2d69986aa0e81cf0dfda6271e8483698f4847b861dd449
 PYTHON_SOUPSIEVE_SETUP_TYPE = setuptools
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
