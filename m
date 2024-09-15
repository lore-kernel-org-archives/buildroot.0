Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16634C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3190F41992;
	Sun, 15 Sep 2024 06:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otz1__ThO5yu; Sun, 15 Sep 2024 06:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EEE84070A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEE84070A;
	Sun, 15 Sep 2024 06:26:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 216F31BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FDD540503
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGEJTgx_rAvs for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0B8E40290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0B8E40290
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0B8E40290
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:26:38 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82d07f32eeaso107400439f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726381597; x=1726986397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0eiCj4tGk5gWDuo0HSLMbyzUGTlHGulCuujWZRj8nY=;
 b=PI4s0gzzkZOLLv5vA5kv06oWraBj+XnwroyEiQADrXiDOgPflqmOEH14nApuUNf1Vu
 CJcSNi77XCzzVWi9YVadcDr0nK/a8OLXqSLM6FR7LKwonxwwf0Uzgcx6z2p91+cnD8qF
 3DJlY8mUYkCYJFzk7h5JR/I8T6UJHyElTjTEpDg4xYdDh8RuFhyD2OcN0fhCnfo5yCew
 Jz/c4v4sx2F9P/rAXpnzxz6fb2T13m4wKm7jZprJ/OU0x8mm36T1LKA1BdyvsqJgKKxM
 JSwte+4QhHWYvrhEgnxfMlLZxOzFVU9QQ5B/QEBUnBdkOb2DT2BIKM86y8nulqf08twu
 Wu/A==
X-Gm-Message-State: AOJu0Yya1kSKmrGTmIYS+qL5CxUhHVuwlKlvIVWesoHFo/R8PORSIcBZ
 +j4j3/6LKISxeGFuzlql7nfF70vEYiZDMnfasg+BkChZ5spRwz0BMn7Whw==
X-Google-Smtp-Source: AGHT+IG2JcGyLVKlPq/WKcTjcKoVV7Eg0ktx1rxvi8NH5maAH4NN3Xt15FHhctizGWpJwARWDaiYVA==
X-Received: by 2002:a05:6602:168a:b0:82d:18d:bab with SMTP id
 ca18e2360f4ac-82d37842cb3mr892120939f.15.1726381597360; 
 Sat, 14 Sep 2024 23:26:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492698e2sm82019339f.2.2024.09.14.23.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:26:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:26:32 -0600
Message-Id: <20240915062632.1518366-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240915062632.1518366-1-james.hilliard1@gmail.com>
References: <20240915062632.1518366-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726381597; x=1726986397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0eiCj4tGk5gWDuo0HSLMbyzUGTlHGulCuujWZRj8nY=;
 b=TJvJt4VAdMsBIUqDwYqHrY0ZHvplKoTQsqWAFwATvTyCP8ha3W1W6yHntSgvG4IKJE
 vbCrXD7X5lGAm9yycAF6mPL7LtYGZNFDeGuedCdXX40mz8sTBR3+yQCDZuM35FTU+nCM
 X0Ie7vMyY/fyd17FZpveFSnx6fPUCUR37VH61bi9Qp9znxtzfzcuNNsa9YQPyWHIQAYt
 +GCITcv9Xzlee/wuO6swNQ9yecp1oDkpRhdhWkIHqMfe1gBVqIeZlnWPKNpNOBVNV0CO
 mk/tBpWBmMEUWTE4ZGOjqzuAiREcJtxnT5zyySX/aMpUXG0kp+aaXZddbN+fbAWLKWFx
 KQgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TJvJt4VA
Subject: [Buildroot] [PATCH 2/2] package/python-flask-jsonrpc: bump to
 version 3.0.1
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
 package/python-flask-jsonrpc/python-flask-jsonrpc.hash | 4 ++--
 package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index d5c0e46595..ad1564caab 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask-jsonrpc/json
-md5  fb6205e6e776802c6000ea7119229066  Flask-JSONRPC-2.2.2.tar.gz
-sha256  0cb6ac2804980dc8ac7cbbc3149025f4ec9323227978a4a7ce7b55a9f8263a11  Flask-JSONRPC-2.2.2.tar.gz
+md5  29ca67027f53912cb146d9305ea3e810  Flask-JSONRPC-3.0.1.tar.gz
+sha256  110295be39c6d6a110063630c050e3f8a4f79c50281898b3f1cb8a18fb3cb84a  Flask-JSONRPC-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  LICENSE
 sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  COPYING
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index c816749085..2a60d73d42 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_JSONRPC_VERSION = 2.2.2
+PYTHON_FLASK_JSONRPC_VERSION = 3.0.1
 PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/a5/7b/8cbd53084a1efb58a1105905a38b0cbefcd3ae13ef2c90c07eedf0fdb6dc
+PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/7e/9d/637a0620802e4c496bd5d48e3766c3a4fd6a03f815f9bcb183bc7a17a5bb
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
 PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE COPYING
 PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
