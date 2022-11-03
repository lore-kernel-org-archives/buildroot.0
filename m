Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6944C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59F3D40B6D;
	Thu,  3 Nov 2022 19:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59F3D40B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IXProh1xAEW; Thu,  3 Nov 2022 19:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1DB740B63;
	Thu,  3 Nov 2022 19:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1DB740B63
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A46FA1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CCC240B63
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CCC240B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VoaiAIuUNnre for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:36:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3559840BB8
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3559840BB8
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:36:05 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id z3so2243152iof.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNC49qifmObmj6eR0V1DYrQjBhlpcwkPjyRxteLfJng=;
 b=qCmcW1XKa07XvZNYCfuE2ZI//mJs8KDYHAx6q07/cebhp2xGdtSy9QvtgkXhEFnkhA
 8MecTobj4l9SejBA0bKT8rfSUDBBjoQxNpUMSGtKcmDiB9YeKcTlxTnhJTI0SDvGEMoA
 GgYrajalLz7MeDsaq1z2YGpKMa/P+Hh0YOcCmKGs7GhhiGelkqAeKxF+XkSU4CVLxW+j
 CVlAvmvqFn4YQUuxHXUHfdtErQrq4N+qVmK5XIH1RB3vsYKUpQHZffmhpZ8FYDV4n/8F
 QY1iLTY/ffFzAEg+l+8iv/RleF1mKxq1kCdSir3KfY7Lssk4VnGp3oBw+7KstTX9sgr8
 XTrg==
X-Gm-Message-State: ACrzQf0x91E9JzuQSgum4XcRdAtB8fYiAt+qjnbxubFZXOqvAn9NyWuX
 cqwryHL0oBo7wEljdfo6PBBg1xwwPwCKgwNA
X-Google-Smtp-Source: AMsMyM5S8BfbnKKVFW/uwwrD3w2cb7jEErSfj0+yHRT+O3cgWon8T10tWEyqujNW7OOfoR0Pt+M1Jw==
X-Received: by 2002:a05:6638:470a:b0:374:17a5:cee6 with SMTP id
 cs10-20020a056638470a00b0037417a5cee6mr19912652jab.161.1667504164015; 
 Thu, 03 Nov 2022 12:36:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p30-20020a02b01e000000b00370c2b787a9sm470864jah.168.2022.11.03.12.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:36:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:36:02 -0600
Message-Id: <20221103193602.705984-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YNC49qifmObmj6eR0V1DYrQjBhlpcwkPjyRxteLfJng=;
 b=Zhlx1K2WXCgDX5UzXWAHrKUU6JaJOSpmRFz6OL7XOF5QaBA7ERkKlXSvf4d5QHBCAF
 UDuNcPLWzHQGnv5IF1a8i76hUBThSOzFMw3ccJYTT1P/pVl0d2fZcxjOkTLhqxwIHUpc
 EHgKYS/CUsYNSLSmEw7X6inWgamLlO2f9sZqfWlR+YY7DgingvD3PmZT807NNPdK1axp
 H5yI8gkp302zh2rnxpMCW+cVUASss8ju6b5NtdhTE6anXUAf9NW6xnzY6ZFp8hj8QRtg
 tRIMyQBcn+d/mdECqWVA0+uK3+KulAKIdpqchMWjGRn+0UvljO/+PCU5niartU1yEQnD
 v0ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Zhlx1K2W
Subject: [Buildroot] [PATCH 1/1] package/python-soupsieve: bump to version
 2.3.2.post1
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

Migrate from setuptools to hatchling pep517 build backend.

License hash changed due to date update:
https://github.com/facelessuser/soupsieve/commit/9da2de87bd67308b933d794a46b349d8da74dac1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-soupsieve/python-soupsieve.hash | 6 +++---
 package/python-soupsieve/python-soupsieve.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index 699cb9581a..cf348d441f 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  73ff6ce22ba973fe2d47197834e0f728  soupsieve-2.2.1.tar.gz
-sha256  052774848f448cf19c7e959adf5566904d525f33a3f8b6ba6f6f8f26ec7de0cc  soupsieve-2.2.1.tar.gz
+md5  4c824620563604cbf783de149c8b8889  soupsieve-2.3.2.post1.tar.gz
+sha256  fc53893b3da2c33de295667a0e19f078c14bf86544af307354de5fcf12a3f30d  soupsieve-2.3.2.post1.tar.gz
 # Locally computed sha256 checksums
-sha256  e34a760fe8bb3e3c1ffaa88abe495cf76e56f8ae3c7a6dde0e4b41cd013c41d4  LICENSE.md
+sha256  bc66234cadd3f6e7aaf7160faf165f3f869ffc8a11b6b0d6c44a2e2a83314dd0  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index dd2ddebbb1..ebf2ada7ac 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.2.1
+PYTHON_SOUPSIEVE_VERSION = 2.3.2.post1
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/c8/3f/e71d92e90771ac2d69986aa0e81cf0dfda6271e8483698f4847b861dd449
-PYTHON_SOUPSIEVE_SETUP_TYPE = setuptools
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/f3/03/bac179d539362319b4779a00764e95f7542f4920084163db6b0fd4742d38
+PYTHON_SOUPSIEVE_SETUP_TYPE = pep517
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
+PYTHON_SOUPSIEVE_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
