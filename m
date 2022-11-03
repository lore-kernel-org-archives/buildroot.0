Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41772C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D852D40B90;
	Thu,  3 Nov 2022 19:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D852D40B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rgKQSyDRm58; Thu,  3 Nov 2022 19:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC157404EC;
	Thu,  3 Nov 2022 19:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC157404EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B33861BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9738041780
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9738041780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s75Epu3Eie-U for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:41:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 458824174E
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 458824174E
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:41:25 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id d123so2234442iof.7
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YhNFFX6uM8OGefrwTRhMPiGe2H7EOhwkSMol5ZkDxSQ=;
 b=o5nhM12j6Y1PBtSGvD0cE6N0r7LozyH+xASPQU9giIlifxyhW1AOItuV5JO5MjzEtJ
 yH49DaYv4RJftSpZWK3z4D3Ad2KIgrmiS+k+sbm5X2z9XNmsLPQkrhiKIX9wjR/+ebgD
 dA1YIaQIMhYxyuOhMIagiSoL4Y6wIgCsbFBoZlT83n1vZq2fn2nm3RrEJN+j7Nrfgkv/
 R9huWtgdzWhsvMHyoFYKopTuU39kBmV3RyEo/FYHiQ3LGZuTJnmUyWz8lSmvx0WnWvHX
 H5VejBPQb+JysBLrTlzl3bnQWe4qhJDr6je2H5dTBqw6YSySkouN4IZ7hbSSZl5wZ5du
 DMXA==
X-Gm-Message-State: ACrzQf0JjtC+9MRcc86jLXN+SeS8mDuWoYuBZIf1gmvwTmpfvMwjnlHw
 d0YedFKKWRA5hVBnIxvVoW1M2fFeXkGgdd2G
X-Google-Smtp-Source: AMsMyM5a90AAVqTLygkLcFfumSPMIIGSUNbPj1yPzFSqUYEuajOBv2bvamTOve8UDTyP/09FcjUfcQ==
X-Received: by 2002:a05:6638:430f:b0:371:667:72a1 with SMTP id
 bt15-20020a056638430f00b00371066772a1mr19837868jab.74.1667504484036; 
 Thu, 03 Nov 2022 12:41:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s8-20020a056602168800b006bc48537658sm676558iow.0.2022.11.03.12.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:41:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:41:22 -0600
Message-Id: <20221103194122.957816-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YhNFFX6uM8OGefrwTRhMPiGe2H7EOhwkSMol5ZkDxSQ=;
 b=leTtRx8aNqGJkqxAAqv8jQav+rL7dqIVLf4V8hgqrPbLKL3zAMdTSIfg6BOY+mrGzG
 lUpSmPX30HidtsS9Wr0L7F6pHO9wIUSeTHirIv3eGpNP9jBzd8P/B15lpJY9w4QO64Es
 COSWflg868pYiHCfCtP74BVG68yXYT9LeldZt5PR9dXyYBlVOSKFOpx0p0OphtpMuOIC
 rm04YyOY4WQqw5nqg69e9rQv+NaFL2JkbC5yHpMWkGnT/TeYV5/wY2ckSFNngAkur3+n
 TsCOTngN8guPV0yDHLzTwg0GhkoweswyuzRzSafQDhXZZugCwwTdY25u/oW24ehe8Dwd
 7Pxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=leTtRx8a
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 1.4.42
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

License hash changed due to date update:
https://github.com/sqlalchemy/sqlalchemy/commit/ad244b9b7577486bd4e22d74d64e35802af84977

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 6 +++---
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 3274e10fd3..9f479d8f7b 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  af9722657ba51131703dbe75f24b054a  SQLAlchemy-1.3.10.tar.gz
-sha256  0f0768b5db594517e1f5e1572c73d14cf295140756431270d89496dc13d5e46c  SQLAlchemy-1.3.10.tar.gz
+md5  52318b83e8931c5f5a459f54fe4be3e8  SQLAlchemy-1.4.42.tar.gz
+sha256  177e41914c476ed1e1b77fd05966ea88c094053e17a85303c4ce007f88eff363  SQLAlchemy-1.4.42.tar.gz
 # Locally computed sha256 checksums
-sha256  0acffa15f3427e94014235e3c44376f6fe5df0ff461a93a9116eebcce74c056e  LICENSE
+sha256  859ded25da34c1eb73e6e736df4c5f8ce3ed2ed5290663176f06e7720d9c9a20  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index d6829853fc..a94b9eca92 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 1.3.10
+PYTHON_SQLALCHEMY_VERSION = 1.4.42
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/14/0e/487f7fc1e432cec50d2678f94e4133f2b9e9356e35bacc30d73e8cb831fc
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/e4/56/8ea85eaab7d93b58f9c213ad8fc5882838189a29fc8cc401d80710a12969
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
