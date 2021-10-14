Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E733CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61D361090
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A61D361090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 515648315C;
	Thu, 14 Oct 2021 22:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDSbICzLriQG; Thu, 14 Oct 2021 22:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 864B583077;
	Thu, 14 Oct 2021 22:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 845F21BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7462F83ABA
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJXR0Z2fXRi0 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:58:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F4EA83183
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:54 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id y4so5209562plb.0
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DiCWWFJB4edEF41hlrtOquodF+OplXQSVB83UBU2Q0=;
 b=F8W7s1TBVI07spv1QAYq3YOQWZdsCsQb6/kLUMfcMTruXp6R+iVwyK+8VJbhgGjkdb
 PJWMNqAiLldi7hEMnSmC2ATjjydFCGKFSJse4BBKtlaenEiKKLp5oNIT2L9PBjZF1XGC
 auSjdcCNv70C807zXZuglvuUKgCgmhLZl5cyvz/cbvLdQT5xA6qRAEQjQZSWkjWQvuOW
 ZorP0A8lYBkiS0j69JDk9ndreu59XMdJanYwsYih/ik/E4ARMD0mQBam9FvXzChLSx2B
 lVg47tJ+HuII00Ls7G3BF3tr4Q9vP3sdjSJJpYMjgTkYZKYUsfr0TKe2RXpFrNryLtqA
 du+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DiCWWFJB4edEF41hlrtOquodF+OplXQSVB83UBU2Q0=;
 b=uh45C2JwEvOkUcJfpCs3rRON5g51o7ESVzIfXuuAZ/2BlLSiHJGvTm6//vM10UXeAo
 Loj36fanPwnnJyQiEOmPcStL2xS/1/ZqFS1nGVU72wgHyD+qOKfgC1RtPwi4yOLahFF0
 KSUvRG4TLZkhqOKJh+xVMQDD+rY8dfivf2rX2aV7aGznHK8LxpohnQYNW4IwxzZSU8r3
 N8MFUwIhyNBOL8LKz9A5d07kidmy7pBjoXNGqedP/GS58XbrPZ4S9LGupszIR8jy1ENu
 LbfdEI0G8MTjqwZUcRKQqY6n3mvY93VT8a+3wqa63eZXa/FfrqzbMnA2CPBDICmQUz8h
 GpCA==
X-Gm-Message-State: AOAM532ocHdkhls3ynGoE35Msnos0lIieHoyxGhC3o9sSqxCTD4hbmzW
 +90ZH0VzbnnJdil5wH70YrOxpIQf6r4=
X-Google-Smtp-Source: ABdhPJzTkT2S/RofYP56gpFbyXlgXrfhpYsQuuOB5Y9Lj9/HgBf4nFcwZPjua2dEZWcbzhipwDD0pA==
X-Received: by 2002:a17:902:a710:b029:12b:9b9f:c461 with SMTP id
 w16-20020a170902a710b029012b9b9fc461mr7639491plq.59.1634252333642; 
 Thu, 14 Oct 2021 15:58:53 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:53 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:40 -0700
Message-Id: <20211014225849.832479-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 02/11] package/python-pydantic: bump to
 version 1.8.2
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-pydantic/Config.in            | 1 +
 package/python-pydantic/python-pydantic.hash | 6 +++---
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
index 07b506a20f..ac81aeb342 100644
--- a/package/python-pydantic/Config.in
+++ b/package/python-pydantic/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYDANTIC
 	bool "python-pydantic"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Data validation and settings management using python 3.6
 	  type hinting.
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 7bb076fe2f..215b5d1714 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5	ce0c1824d1797bc7d67953428c4fe965  pydantic-1.3.tar.gz
-sha256	2eab7d548b0e530bf65bee7855ad8164c2f6a889975d5e9c4eefd1e7c98245dc  pydantic-1.3.tar.gz
+md5  7845d2f3c8fe8602f73f53ec5b6dfa29  pydantic-1.8.2.tar.gz
+sha256  26464e57ccaafe72b7ad156fdaa4e9b9ef051f69e175dbbb463283000c05ab7b  pydantic-1.8.2.tar.gz
 # Locally computed sha256 checksums
-sha256	66badbfe56618ec52ddcbfda62450e43752d16fe1e7cae78d346c7ed10a35306  LICENSE
+sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 0f9dd66a6f..b282241506 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.3
+PYTHON_PYDANTIC_VERSION = 1.8.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/3e/69/b22c0eb3157115e1e3d111f574a6a41552539f1e53b064121ef4e9ac1368
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b9/d2/12a808613937a6b98cd50d6467352f01322dc0d8ca9fb5b94441625d6684
 PYTHON_PYDANTIC_SETUP_TYPE = setuptools
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
