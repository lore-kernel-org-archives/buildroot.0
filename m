Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A96EC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:13:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E9161002
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91E9161002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 477614016C;
	Sun,  8 Aug 2021 10:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VElNbPK3Mhxb; Sun,  8 Aug 2021 10:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44CD54023F;
	Sun,  8 Aug 2021 10:13:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAF611BF38E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A658282C75
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtjknf5JJgmV for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 10:13:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2B6F82C5E
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 10:13:14 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id d22so22193844ioy.11
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 03:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEMnDoQkR03e9qnrrN5V1n/ioELwFXQa0G8n9eCftZA=;
 b=doh6055Az2HtTiZglHhEfuIwdwWAsllpTYD4v1xCTbb4ZDU+3VuLPfI2j7mMB6SKLR
 xa+xUARedrjHFnJRHNkyQuVC/Wi80b1OUE2zkIQ1bfIV3r1kQzjYePR5uzGHJR7obMVw
 M74W+x0NCybi/iIGsIlVSZRqMzvW7Qn76NbmVYOTHFDBMffCeg9eKFvT9qdIDqt0EFdI
 LcShx8yEziwjnGK3PDpwALjZQy65dzYwsyMPqqVEwIAdng+lrk85ZWTAg9XsD6Gof5qU
 9NJ3hu+/SphzKhSJTxAi7lwckotH0zHqT0aJVZPgZIxXyR9CvE/jxmdEn+FdADBaKeMG
 bI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEMnDoQkR03e9qnrrN5V1n/ioELwFXQa0G8n9eCftZA=;
 b=K7kaThW82nbQ7VVc6xUV5IqYiVTBAgaSpchjR9eMCOB+jFonfWxmt3/Kz1FyQcrvsh
 VXuv+iqaXhM3k1uDPGaWgixoizlD2JYAbA0yH8pOPGZ9CTbiNtPCs0Ydtqw7rIgVsMM7
 quNbzHn/pNErScH1/WveWmZIK4FkHwJf/yZpqqlVNM9qaPhG4DNvxiiiCSnyGXi42Fcj
 y5OHzWGV+n1FvE2FAqh/NEXDloPGAb2SvUckDdETL+U9n6FoOp/Sff5RLViVZyFQHAIC
 V5/atdOCjjFb+2XOPUADjh/6RN5Un6HffXaavda10i4ydtntnMoUnHJ9H0b9GGn7z7AN
 Gt2Q==
X-Gm-Message-State: AOAM530Jf5lPMiXCrhyVvgp45gFBFq0KcsdBj1mrBTFN9wOYiSGvvsfz
 Sodoidjmgt2b3G+BOiEizSyOvdhXA3I=
X-Google-Smtp-Source: ABdhPJxISsFtn4lYm5SgUGhSk0fdPWZZeKtHhvFgRO9BHm7NhYyt/6ZdcJE2A/CMAc0XwFAeFBTqbw==
X-Received: by 2002:a92:190f:: with SMTP id 15mr115205ilz.45.1628417593430;
 Sun, 08 Aug 2021 03:13:13 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id g20sm7570333ilk.81.2021.08.08.03.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 03:13:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 04:13:11 -0600
Message-Id: <20210808101311.3416344-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-txaio: bump to version 21.2.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-txaio/python-txaio.hash | 4 ++--
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 15b1f5f2c9..5e05f02d3a 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  c998be8d5837218c809266c0fce94687  txaio-20.4.1.tar.gz
-sha256  17938f2bca4a9cabce61346758e482ca4e600160cbc28e861493eac74a19539d  txaio-20.4.1.tar.gz
+md5  7e80b80ed7797245a5eef803043bdede  txaio-21.2.1.tar.gz
+sha256  7d6f89745680233f1c4db9ddb748df5e88d2a7a37962be174c0fd04c8dba1dc8  txaio-21.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 2dd028f4f7..750d9e3d3d 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 20.4.1
+PYTHON_TXAIO_VERSION = 21.2.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/e7/dd/c0c90b080c3fad0ac8e2382eddbe86591d4fa1a5c1aea652de0adf245fc0
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/c5/39/2e715062283f8443d8ceeea32276db71741664d78d43c3edd3675498e926
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
