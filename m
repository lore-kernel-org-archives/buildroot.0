Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EC4C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2BE140102;
	Thu, 11 Jan 2024 07:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2BE140102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ow99q5fL7u5E; Thu, 11 Jan 2024 07:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C616540133;
	Thu, 11 Jan 2024 07:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C616540133
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DECF61BF2C7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0D6A83CF1
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0D6A83CF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-2dVR2pJWrI for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:29:25 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9177783CEE
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9177783CEE
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7bedd61c587so84173039f.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704958164; x=1705562964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MXPTdlTX+3Gbi9kG9gR7UvBPTBAdJN6+quG06CfQKD0=;
 b=RSUgPoGRg+y1voswZxyFrny41qiZCi6LrJonv18RibvrIRBHmo8SepOw+W4yq4P7Ii
 8wjtVTTl8pis4qFfuNeQktKQ5HTTOKLIq1m/H2JEwpjnUl8QbQr9k9m/jLChiUhTQXrG
 dhTEzTpp/9YPqyUydHN5Q6jxYhYgboTie5VuxVv1MroqDDgUm7kJE1vQW3Tswu0ao0I4
 rrym/7KbR+anQTFfjKujEKTm4tzbsOt+IkLsYedEqsRBMyNCi25DAWRezK4WRp7J6/Vu
 1d4ACRNSjMcdD6EN0mEMAaaywHy2SinuHTRrEmxdYBV+nXS4YP1MnwFB3CRbj3jN0p/b
 YKqw==
X-Gm-Message-State: AOJu0YymHcDcI1VvYjdPmouwYSkPl9TRFOmvOxTgPmAbfRkNVzrzcrkA
 b2vnvyMEJpDzuDXNMFDBxzXJ7AUksoUnCw==
X-Google-Smtp-Source: AGHT+IGRqniq3n7CYuj5ovY1iw07FyfLesFX6F7rhpzH5C7s6xU2oaNqLOJfNmhX9Dg9tmyOADCMRw==
X-Received: by 2002:a05:6602:3403:b0:7bc:838:665d with SMTP id
 n3-20020a056602340300b007bc0838665dmr1208059ioz.5.1704958164228; 
 Wed, 10 Jan 2024 23:29:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 z17-20020a056602005100b007bed4940d91sm121211ioz.15.2024.01.10.23.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:29:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:29:22 -0700
Message-Id: <20240111072922.3082638-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704958164; x=1705562964; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MXPTdlTX+3Gbi9kG9gR7UvBPTBAdJN6+quG06CfQKD0=;
 b=Kp/0yzG46/rfQLHJcczm2DuptdfCqch8gcLXrx0pS+ssOYJTKGsAkfawssvyds7+ev
 kEhnKG/GwfVC8RN9G4FGBCTGekOtFnrO7fmzPejSsI0YlYGMAI0MDR9Ocla8L5cYQmUT
 qM12xNu95ZCwLcM+G9oKJrUedAROvW9IxARk49Cf7+6vjieIW3gGzEk9lPHsXD4cYi3f
 J8S7lzUtJFnsX0Dj64FESRgR6qiYsaAcUnV0Kd+cwEd/+ko4KVB3RicLU4HOREZWOfRX
 NROmxW7UevG1usjey3LRm0+5S9tEVtYiCuNbxQaXLO5Ew6d9ULU7Mrh6gFBAzMJeOVtA
 njzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kp/0yzG4
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 0.34.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index a7f1f66446..820026b70b 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  5193c4b7d2ea4c93635c340a7ba9b54f  starlette-0.27.0.tar.gz
-sha256  6a6b0d042acb8d469a01eba54e9cda6cbd24ac602c4cd016723117d6a7e73b75  starlette-0.27.0.tar.gz
+md5  2ef2fc635691fd4a1823564218292dce  starlette-0.34.0.tar.gz
+sha256  ed050aaf3896945bfaae93bdf337e53ef3f29115a9d9c153e402985115cd9c8e  starlette-0.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index b04b95a797..07f9d6be5e 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.27.0
+PYTHON_STARLETTE_VERSION = 0.34.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/06/68/559bed5484e746f1ab2ebbe22312f2c25ec62e4b534916d41a8c21147bf8
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/4f/36/168ba6d56a28382f3b081b23b0cc431de35786e120b94c1f372708ed3059
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
