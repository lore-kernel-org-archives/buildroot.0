Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CBEC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 02:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D715A83E57;
	Thu, 11 Jan 2024 02:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D715A83E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIvYejwOOn54; Thu, 11 Jan 2024 02:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09ED383E53;
	Thu, 11 Jan 2024 02:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09ED383E53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 309271BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1302283E4B
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1302283E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pv31vioDilrL for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 02:51:34 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AC0A83E4D
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AC0A83E4D
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7bc32b04d16so205462239f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 18:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704941492; x=1705546292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwRvO3/syBLvMgTxGtEfBmHmW+twO6duVu+AnXRi9KE=;
 b=IVmVdUZaCII71iSA04wz6p2NKC06FHCBoghyZjTkwWzvRwwJHv/rD1CIeZc988vyzq
 q/IQw9wCmZBjQHxu5pRqnnvZ670YXFCAOn7Gyx4mFRq6SSw2wo1KuBtcFLo/lZYiI1S5
 sVy7cQAh2j9/VzohHyoURhGM+w1NVxM9eOdSDe59chj8x8TXOxhVagtAkNeVltwCasyn
 Fh9nqh7m865eCoIgGis7dWpEUzQjdjHvCAz2+TlC4mCMoVTqb8kiTBaKawtnwosjyNz6
 M0hjI/vN4VPLKdKUazcHwTTBbI07vm0KFWzioair5+yuK4n00asUlJO6o0EncWwzzqv9
 Ko1Q==
X-Gm-Message-State: AOJu0YyfOZ7oceVL4CZWF87lk7fAOTzzSw0FzF7EOReh8oMRmXmVQV0J
 9rKfjD3by8gRpx0Bn94z/j4x4KHLRSU5Rw==
X-Google-Smtp-Source: AGHT+IFgkB1NQeylYd2nkMNIc7TlFsUGtmHDJgSdIwx5WEEZq/DRML9x/VTFRI6fFtzTM24zhWvKPQ==
X-Received: by 2002:a05:6602:19:b0:7bc:3a38:43e2 with SMTP id
 b25-20020a056602001900b007bc3a3843e2mr648608ioa.39.1704941492487; 
 Wed, 10 Jan 2024 18:51:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 h11-20020a6b7a0b000000b007bb3c9b3187sm20987iom.4.2024.01.10.18.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 18:51:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 19:51:27 -0700
Message-Id: <20240111025127.2671669-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240111025127.2671669-1-james.hilliard1@gmail.com>
References: <20240111025127.2671669-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704941492; x=1705546292; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwRvO3/syBLvMgTxGtEfBmHmW+twO6duVu+AnXRi9KE=;
 b=nacJKmWzXMrYS+s/W2AhuHKacO97d6yC/1pHOXXGA7ze8wz6XgndEt+VZPO4pGvSMa
 fyhQh4w1QKjnY+lrN80ffmbgm+u/PhD3pyuPtT0ShYbc0yjH6bXKvL8W64l02a1WIQSs
 n6lfx6g+O6BLiNuhUC6wFyPHyXLXEzEYKeFuj4nT3tqB2nscJzuTNtX2gAnfeEMHIyo4
 yLl/mO3e+LyEQijnelIeYcwTB64aGquEkiFo+eKY1Pips7t4ahRd4/1a94xmoTL2nfjY
 weto+RX6fGJmCTwuCCAsz3MKQTP0J3NoLUvA9jH0QRIXw+zO2h8BcMCUZ5BKnBG1f36l
 37IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nacJKmWz
Subject: [Buildroot] [PATCH 2/2] package/python-pytablereader: bump to
 version 0.31.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-pathpy runtime dependency.

Drop no longer required python-six runtime dependency.

Add new python-path runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytablereader/Config.in                 | 3 +--
 package/python-pytablereader/python-pytablereader.hash | 4 ++--
 package/python-pytablereader/python-pytablereader.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index 00be18510f..308e06236a 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -5,9 +5,8 @@ config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_PATHPY # runtime
+	select BR2_PACKAGE_PYTHON_PATH # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index 2034cfd61e..18a26847c8 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablereader/json
-md5  8d732b706186666a4c28d14927c26754  pytablereader-0.31.3.tar.gz
-sha256  e292b81ecd96546fe0f53d9c83e716a4682d07d7ead6d9be8beb14ab0591df11  pytablereader-0.31.3.tar.gz
+md5  d92cbcb2716ecea0eee58649a591edc0  pytablereader-0.31.4.tar.gz
+sha256  ad97308308525cafe0eaa4b6a80a02499e0b4c6c979efb17452d302ad78bd5b1  pytablereader-0.31.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index daa484d393..40614472a6 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEREADER_VERSION = 0.31.3
+PYTHON_PYTABLEREADER_VERSION = 0.31.4
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/b5/c8/67590578e27cb1716c7b71291946d685b5bf63fbfe7a254a7cb3f6f8aeab
+PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/0a/44/e42c24df7b6f1c880b5bf614112e2009ac088fee79b6bc4d1fa43789c460
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
