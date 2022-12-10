Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA38C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 15:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2790B403B8;
	Sat, 10 Dec 2022 15:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2790B403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okTWRb1c1Qce; Sat, 10 Dec 2022 15:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B42740138;
	Sat, 10 Dec 2022 15:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B42740138
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E04CC1BF5A4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 15:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B964C4094B
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 15:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B964C4094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MM6fg61WKf9z for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 15:52:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B6954085E
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B6954085E
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 15:52:31 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id x11so1346019ilo.13
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 07:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5OjCIOWUvo58lhHx6iWpG8QagTWuq+LkRmsq8s7bfLo=;
 b=7wLqjXtnE/OnuswBwcM1dOPqjlUgLn1UNDFDZWO1PFDbXZZMkh/QTZcdUrnUsGoxVy
 0Ab0i4YJm8931/Q36B7/X/eGiBetqlAsyfH/uY9DI8t6c/WOpJrg8EXnYMjh4UKc85O7
 W5kYR3d/xV/Hfv5ESWJkBJnyNhuSquEMbIvARSmsz+iaPy+lffMMbq6hwKPgL/Q4KtXk
 KvT6BukZIi6fqLY9McFs3LbtqIajo3qvywvpDwip51OclHuK5qGMhhyQ3ELnwc1EK550
 CDeLU7LBCRywk2ql4Mw5uK9j0zEJnFH4aXT7xm+yZZhvJCXU+czN9juraunRIElbiwUx
 92hw==
X-Gm-Message-State: ANoB5pktgZiCLAEryC4XAXxxoDMiRSrTbeGWHbq3X0cwIgSJg5VMXWJ1
 K1aEcO4nJuDqWoT9fUrBom6rFfaJtIllYw==
X-Google-Smtp-Source: AA0mqf72OH7MlVta+HwzpkZrOAoCZV+XXCtp9lQ832ZBeVD7vQFjfV+fbAvTlf6b3g+q8cyDTeJglg==
X-Received: by 2002:a92:c5cc:0:b0:302:e7cd:c77d with SMTP id
 s12-20020a92c5cc000000b00302e7cdc77dmr5361890ilt.6.1670687550299; 
 Sat, 10 Dec 2022 07:52:30 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p9-20020a92d289000000b00302f958e71dsm1408876ilp.49.2022.12.10.07.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 07:52:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 08:52:28 -0700
Message-Id: <20221210155228.2399194-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5OjCIOWUvo58lhHx6iWpG8QagTWuq+LkRmsq8s7bfLo=;
 b=E9kAzxgmvoIt84NM3rZ2rNE203YJajn3krkgD7jMef9YiftYRX2Q0qfnf26WSYCXrw
 wW6pg4pwh9ORMrPWdnr05Neo3z5Dm/Vfkn8EJpUKH4KHtmt4dXas9m0c3+4StlGJN7+T
 yVjfoAgz4eKEA+hMRjJFnuJ5uqSWr5QwjgeXO3zwLrbe+kKJPgAoo1jaVBB1zdFxqHYW
 GpGgvPpp/7ZicG2u7L+jD9ZmPv0unP6LUAdLRBwM/Z7E8JT4KMIkyp++JspyOBu/OasH
 pOMeG53Esfzd5U21aDiUHF4M+zJO3OHRV6iMDTUioN7oeCYGWFUQb5NmgyX6DVdaVjrK
 vfrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E9kAzxgm
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.29.27
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 72e64f521e..8314c534e9 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  fae1e9ad89e12436ef65b8208febdc3e  botocore-1.29.0.tar.gz
-sha256  f25dc0827005f81abf4b890a20c71f64ee40ea9e9795df38a242fdeed79e0a89  botocore-1.29.0.tar.gz
+md5  488df64a4fcd884f9fbcf990bdc8b34c  botocore-1.29.27.tar.gz
+sha256  0932b22d8737b11037adf7e734f9b90425b575d0757e4c1a035e99f382955221  botocore-1.29.27.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 9d2a94b39b..4b14af4368 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.29.0
+PYTHON_BOTOCORE_VERSION = 1.29.27
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/0a/95/8f31139077187f2da9132d7547979262376e19056d99c7cf6278431a53de
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/08/3f/e9f97b0700e0be670404a7d4a9ac62fd59495897f15c928dd38874e98ef7
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
