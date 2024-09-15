Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539E4C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C18DF400D3;
	Sun, 15 Sep 2024 06:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4o41S2DmOlz; Sun, 15 Sep 2024 06:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6922140290
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6922140290;
	Sun, 15 Sep 2024 06:56:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9321F1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E5980E7B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YNKVIq3GsYh for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2C7E80E6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C7E80E6F
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C7E80E6F
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:56:54 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82d24e18dfcso132222039f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726383413; x=1726988213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ttoBo65ge/wSZ8ZmkO8D3wLeL7mRnefYtI1Udl7NEH8=;
 b=K8Xxcr5W6KoIoedFxQ31EIgyOjZ0VJHYmzYThDPzXURUsuSEKFXV+yJlcWGynHV3kH
 Ds172DstwkiILMJ4loC7cHoKjib6rF6TLmV33N6cMRAikgydN63IGxEFxzr3e9vOfbOY
 XOxFHHvBuLClCA4g/590IABdZE9Nks3PQpjJrRS4vbSZXtbajT4Or+E1ba6eO3sUsl1p
 95VEQPfLoohGSIy0b7E6GMuKLF+Uj9bSeoRxk+FT4VmZfqYDVcFdNkJ1NyAjRNoinc6j
 crXIG7d1hwIGg/6PGlr0TFD1XEkS+4pC8GGpvj2UfLHJfdwhfKe5W2Q1XZdYhsp/zrbl
 qYrA==
X-Gm-Message-State: AOJu0Ywn7CMnWgcYwGxzmRFDw5ryf5JP2NZ6wSion5mFwTpj2SH1iiyL
 E631QPDbKB1kqcmLMayognvgolbzmjKKYrS7OKyEgDW7WBpb672mZIHj5g==
X-Google-Smtp-Source: AGHT+IFY49nEMXmR2Ae+S4Csc86kG0FLEueH5Ob74q7qDeFtnEUiauTZPq9uTTMmxKKSnD2hITskKw==
X-Received: by 2002:a05:6602:158c:b0:82a:a403:f0df with SMTP id
 ca18e2360f4ac-82d1f8a81dfmr1416391039f.2.1726383413192; 
 Sat, 14 Sep 2024 23:56:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d4935632bsm81596039f.52.2024.09.14.23.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:56:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:56:51 -0600
Message-Id: <20240915065651.1534020-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726383413; x=1726988213; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ttoBo65ge/wSZ8ZmkO8D3wLeL7mRnefYtI1Udl7NEH8=;
 b=ArZ2xbzdOxUI1uVghEkiyHQF2b7JVgV/TUSPJ1m5DAlfNtf0p8JFUOkrQRHXPdKS2G
 tdbqrHNnrKHOhYGrrtFlyicD32lIGw7Ja5FM+5rf2tXHx0u5QyEKfbYFfOc0tjNdZct5
 tQ0BYR0AKu2xFXj1kdPfv3a+OsDE+woDF4PZt2Q7lGxHu+SHXr7gjvolNX0n9lGp34Db
 IDecZKxmttZz2dFX+XwHFNiAoh2lFd8Zh4xKXftx285cTBIv91Z9wgnuAVJDk5UfPZTu
 aUh/W8mgcKX6QhsFKMOhG/hhaG3DdjXSgP7oEHZ9c+Eu7KulcNbmN5RUE7JA4Zk4Fni7
 C18A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ArZ2xbzd
Subject: [Buildroot] [PATCH 1/1] package/python-gast: bump to version 0.6.0
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gast/python-gast.hash | 4 ++--
 package/python-gast/python-gast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
index 9ce5296938..4071a07919 100644
--- a/package/python-gast/python-gast.hash
+++ b/package/python-gast/python-gast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gast/json
-md5  907c689e3fdbc7a48cc010e665195baa  gast-0.5.4.tar.gz
-sha256  9c270fe5f4b130969b54174de7db4e764b09b4f7f67ccfc32480e29f78348d97  gast-0.5.4.tar.gz
+md5  4a088eca6fd6bae16bc2fd2ff828de51  gast-0.6.0.tar.gz
+sha256  88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb  gast-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
index 0db1dbe93e..771d7a4be4 100644
--- a/package/python-gast/python-gast.mk
+++ b/package/python-gast/python-gast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GAST_VERSION = 0.5.4
+PYTHON_GAST_VERSION = 0.6.0
 PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
-PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/e4/41/f26f62ebef1a80148e20951a6e9ef4d0ebbe2090124bc143da26e12a934c
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/3c/14/c566f5ca00c115db7725263408ff952b8ae6d6a4e792ef9c84e77d9af7a1
 PYTHON_GAST_SETUP_TYPE = setuptools
 PYTHON_GAST_LICENSE = BSD-3-Clause
 PYTHON_GAST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
