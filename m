Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46818C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 01:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 914F5610B3;
	Wed, 11 Jan 2023 01:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 914F5610B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9LY39Wc9i4v; Wed, 11 Jan 2023 01:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9CB46109F;
	Wed, 11 Jan 2023 01:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9CB46109F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2850C1BF40E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 01:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 041344029B
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 01:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 041344029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoOl24C9vOJw for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 01:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F27040106
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F27040106
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 01:16:03 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id u8so7269760ilq.13
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 17:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ntDkDktK1a2Rgor2JH692XbSgcG3PB4bVfljUDtSpg=;
 b=v8pE0188CVquYsmtqqftjwLk1M1C63vmD10qZHVn0j/jYVokU8OqWRRlbiPC+q9Vs9
 aRcJvEtzrsVQIWK3DF80JO9bTE0fs8dDxYkqXRYVspBOSC4YKg7iAna4Ehjpre8F3QVG
 jnkrKKRatMl1ijjIL2lNjepj0FgPd3V0df9M8pxQhm7kz17+gfE5AnrR8mPTzP1o9CkS
 X47EcXx5o97BN8EAWgq6somlXd4f1ofl50Q81G9tgfohK/4Cm7kon+YM4XSBu1wO1JWq
 84boDYQUcpfIXYGzDhQAnU18G7Ml7Tj90mED+Yetjr0NdT7g87WG/GgjdNkX5hnVDyLS
 OVNA==
X-Gm-Message-State: AFqh2koEK2TBT718WQo3f39pmvcipdadFtMICoLgXZz4cMA6J5bz+Hlb
 PAtD6JltrNp+yHFUZkNdY9SfnJANWiR2H6rd
X-Google-Smtp-Source: AMrXdXvCda1jXiaKR2+af+6szUjEneeHsgaFnLjRlrCjlrShbKjPRyaV6fW7BJ70VAVuKOQKD6qmFA==
X-Received: by 2002:a05:6e02:58a:b0:303:608d:b34d with SMTP id
 c10-20020a056e02058a00b00303608db34dmr49116468ils.18.1673399762230; 
 Tue, 10 Jan 2023 17:16:02 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 i26-20020a056e021d1a00b002f139ba4135sm3871426ila.86.2023.01.10.17.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 17:16:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 18:16:00 -0700
Message-Id: <20230111011600.4044319-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ntDkDktK1a2Rgor2JH692XbSgcG3PB4bVfljUDtSpg=;
 b=bPro65IIFjStJms6zKdYRmoNRActaxD3JQRJqUmIu3OafLQ2mzijvgUi4UwqEekoQZ
 IwonsvVM10YGza5JFdPRnQEMf09n6lYdiR6O9MHAteGPsgQakzwai8xAZAkiTMyyAvar
 J3ffGgzCsuDfr1wdaNustWZeStEOY8v3jxeOVzTDOk4Qy4n3BjgKkrWs4QiqA8/SgYvD
 ELEeOwuITyv9fKkSd4dQHgpa4iKxWZYNerGdnpAKnBxasG8DCx/nISkLr9HrnnRxYZJF
 J2o94+T4ZxszipiDG1BDeQGQ5InSipaZCWvZkPqapVD24LrvO3TcExz60DcgMtGcqDl0
 grxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bPro65II
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.14.9
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 9d68751c03..b104b1fbbe 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  383f60977a330ec8699a51c37ea9c5175ee7e95fc36b06d9415e0eec1f3acaf0  maturin-0.14.5.tar.gz
+sha256  59157a06c0a482aec750d64746f2b23e556ce3ec62d9cdce74fcb7b4658b722b  maturin-0.14.9.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 4570ad4535..3484e09d22 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.14.5
+PYTHON_MATURIN_VERSION = 0.14.9
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/36/83/2bdec738921e253d774ab8b9e99f4540a406ad0d8a1442c84575e5506686
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/90/f9/f4242c0e8bc5def9a7135c12574449dbb411ecc595cf72202ca97a79c2ad
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
