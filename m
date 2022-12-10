Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82188C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1505A4091A;
	Sat, 10 Dec 2022 19:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1505A4091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQWlNH5rdat6; Sat, 10 Dec 2022 19:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFFD240908;
	Sat, 10 Dec 2022 19:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFFD240908
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 925A71BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CF4A81980
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF4A81980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxvP2eeHuSrI for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:43:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7471281971
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7471281971
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:43:30 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e189so3825102iof.1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J1yxlVMgSNeU1io4zbtLi1LT4V+EZK9G8CQigwsP7is=;
 b=6Ik2pVoxjQfD/O9NcyTYXz6AC23rW3xtvQKYFweX+51h2Tp+L2tK0luqcRRKTBtNJN
 BoeEF/nhURo8sphR7v5F/bE0J8fbn4Zcl4+UHPSeJvv2Rd9h+8xRiMj4VcgMR4TQsssT
 7g44VE5GRMq4ChhG76UAWtJXqoeMxF2qAHxP1CS8yL8g+OiTO+Ne+3/bOc2zbU6JHe33
 pFLf1YOWPpwNYmG/NWFutJdgF1f67WT7HcgyQjdcLvBuMF/3PR7GZS3TCkIJm3rIXt5K
 y3Hq7fMjMtT+al91C4pZFFO33YVRpnUD048kXtvXjeT3aIi3ZDIuJHd/qYF8OM3yBzhE
 CC/w==
X-Gm-Message-State: ANoB5pkqMykcNO/Q6DMxYmtsZkCyzllUyEClSqoHfPz6DWm59THx35xw
 towhg4nav2uVzNWHEiNLjfpLlcZqbnxuCj2y
X-Google-Smtp-Source: AA0mqf51NYkvmGXQNZtQFaEd7mnLZqCDti4iQDRCiOZScEmvxDduzA+eJ4iRVFWA5o8Q9QPN0wIsZQ==
X-Received: by 2002:a05:6602:368c:b0:6df:490b:e234 with SMTP id
 bf12-20020a056602368c00b006df490be234mr6323458iob.12.1670701409420; 
 Sat, 10 Dec 2022 11:43:29 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g15-20020a05660203cf00b006cecd92164esm2083228iov.34.2022.12.10.11.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:43:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:43:27 -0700
Message-Id: <20221210194327.3206455-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J1yxlVMgSNeU1io4zbtLi1LT4V+EZK9G8CQigwsP7is=;
 b=D6tZ+PXb6+y7uyNyYYyRfhy3qMRiXZJ4HyG9vO+RLqmR3wGoBnNZ0hOa0CvhvMqIjb
 XASmXvT8mzUyXZwEgc6LKah7cvDLa8qOVOtSFxM2ccYMCtZGplh9eFXPxpgsfpjc6xM9
 KuBmy80ygaGmlDH8JSSfbE0k4kSBM14vwArADiOGgGD2Zb/JQfS0NvS/J4FqlZaHqVgb
 so6xgG5OriEHUqSZkpr7R+nygeYfi3qKJto7AjBq4kO7J6xS/SqoASKOpSePpaFJRdV9
 oOz4Vzrnnz2zEZ7sT76LN6YtMWPhxknUKSlbxO1ad8XCEjOZ9bxoTs8SH6pzEbVYN6hw
 3y9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D6tZ+PXb
Subject: [Buildroot] [PATCH 1/1] package/python-pycairo: bump to version
 1.23.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index f8018e682f..98bb7f2802 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  682238eaa8bd7032e36a20b6f53824d1  pycairo-1.21.0.tar.gz
-sha256  251907f18a552df938aa3386657ff4b5a4937dde70e11aa042bc297957f4b74b  pycairo-1.21.0.tar.gz
+md5  7a3729d21659098e1b9a411b62e88966  pycairo-1.23.0.tar.gz
+sha256  9b61ac818723adc04367301317eb2e814a83522f07bbd1f409af0dada463c44c  pycairo-1.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index 5b231f6b1e..f9933df187 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.21.0
+PYTHON_PYCAIRO_VERSION = 1.23.0
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/92/a4/506564f574fa74c90b98690e8ecc8dbae1629f31fcfe0be69de45d9e1605
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/69/ca/9e9fa2e8be0876a9bbf046a1be7ee33e61d4fdfbd1fd25c76c1bdfddf8c4
 PYTHON_PYCAIRO_SETUP_TYPE = setuptools
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
