Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA915C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A36041B74;
	Sun,  5 Nov 2023 07:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A36041B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHAa0qFucS67; Sun,  5 Nov 2023 07:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA1B941B6F;
	Sun,  5 Nov 2023 07:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA1B941B6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6397B1BF5A6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 380E582080
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 380E582080
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isl5XB-dRmHu for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:35:48 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33DA881EFD
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33DA881EFD
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7a66b5f7ea7so133112139f.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699169747; x=1699774547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=setLX9b0X/6Gcf5UDFwUhxILHzo6SdaDQ2VoC3jEZU8=;
 b=Xnt20WAdkibGbRCrNVlPTkfGtawabt0hLaWR9WWq85bnCYk6huE4Tusm5POR/dRE40
 8chKDayGNSDE3W5yzfUz6L0BsC+RL8RYu8WcVufTYl3XFU/i6zt6gVkjBVJ01CvnJG4t
 eGWMFNOVlIL9v0T9rq8JXUzOTGXksRSxfaDZ2tKJrk3lqinKr/wqbknjjChQFowWm/xt
 OIYg6fWzQq6scdZnGulR2PjRsxpbFXRTn8risjDjIj/LzYtrcT28rJWtOghbew2/nbve
 sjT4Lg8EMhZ+ffTXN3da30lf2amswCUDSeoO8xc7qYMVanjsmholgbvmoB9DSiaOrJup
 e5GQ==
X-Gm-Message-State: AOJu0YxAJixJOEsEW3xOu51Z3BvLwBvYlGw//Z5xthPXxlctJ51Pjrbg
 oigUa5m40m6CBUXREMvei2Q+lnUhs5c=
X-Google-Smtp-Source: AGHT+IE9egXLAuoxOsdfksiMdE4RygxWjEP0dyu8LxwY7ZkyjdrUi3cQX8lG4yW2VDFxKTz7bX30TQ==
X-Received: by 2002:a05:6602:2ace:b0:787:4b5f:b6cf with SMTP id
 m14-20020a0566022ace00b007874b5fb6cfmr34138870iov.5.1699169746867; 
 Sun, 05 Nov 2023 00:35:46 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 v9-20020a02b909000000b004290985a1efsm1500924jan.43.2023.11.05.00.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:35:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:35:44 -0600
Message-Id: <20231105073544.2883766-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699169747; x=1699774547; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=setLX9b0X/6Gcf5UDFwUhxILHzo6SdaDQ2VoC3jEZU8=;
 b=GGVpnnbYPLUJtc0SAKjhugLDVeI2ppwFXWU7EuTyEJeMYqtaZDBCsiS5VqpI05GUS0
 /DI7YQg8Xbct+rb+mBoYs5rjMERpoKmsodCwPZl45omd4uNb+zSz9j/mJIwjORUao4Ab
 nK6UkAhJTC4h8XAmegm6nihIPQOD1hpiDS0zDWOdWU5InMg74v0NN4UyMtD/bSWX/SBt
 T+kQPU9x+Lq/eb2wjaLQjkXnNKaguM0usGdNvQAEsDZber4rRZCIVlQQuYtk5IY9+vqJ
 oA706beB5b82cLIPefQ3iRLw00ViRLsRo4mQXI7wjIyV5DaqTZAP59P7/mOusodiTYaH
 llIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GGVpnnbY
Subject: [Buildroot] [PATCH 1/1] package/python-httplib2: bump to version
 0.22.0
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
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index 4da8f26e43..cfbf55a4b0 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  b42f508585d988e77eac3980db1fd967  httplib2-0.21.0.tar.gz
-sha256  fc144f091c7286b82bec71bdbd9b27323ba709cc612568d3000893bfd9cb4b34  httplib2-0.21.0.tar.gz
+md5  7ca0a2bfd95ba4ab4b6e28804cdb94ed  httplib2-0.22.0.tar.gz
+sha256  d7a10bc5ef5ab08322488bde8c726eeee5c8618723fdb399597ec58f3d82df81  httplib2-0.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 2f4eb98356..9d7061cfac 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.21.0
+PYTHON_HTTPLIB2_VERSION = 0.22.0
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/c2/37/a093aaa902f6b2301f0f2cff5285548dbc4ab9b9a29215eb440381cbb32b
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/3d/ad/2371116b22d616c194aa25ec410c9c6c37f23599dcd590502b74db197584
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
