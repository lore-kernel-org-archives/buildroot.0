Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3AFC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3498860BBA;
	Sun, 26 Nov 2023 18:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3498860BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id He6RQkt5_iNz; Sun, 26 Nov 2023 18:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8602860838;
	Sun, 26 Nov 2023 18:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8602860838
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E19F1BF40F
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54003812ED
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54003812ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THWjW6tT7B0a for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 18:08:45 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72B54812B5
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 18:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72B54812B5
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-35b2144232bso9891415ab.3
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 10:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701022124; x=1701626924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=VKKe9nqP+Q0KV2lzw/A/xvQIHq7grRwTnCcGxIb9cFw1F8teIHBhtwE12U+Kd7HqdB
 8MuWMUZIpOdcwoNovaNNPOhPMfjQnXtnGjDG3naTGdLulAh94kz9f46rqWoaIkXBTk+D
 q8ii6WrIlBPzdMb9rBt3WfaKzUZ5pF/F26/2KhIhq1PgGT+XeJymHxERt8o0d0/HNyqR
 aF8pmkixiRV+ocvnmFNk7+chgl297gWi2weFOs9+klIGDyy1zD1C/hVM0DTPBX6QYoEC
 L7d/pVav6h5ve7Q7Jvq6VUn/HzdtWApUrtTwnHjmq5voDdyalMQKIdkhmXuKPZPZk9Kl
 fuug==
X-Gm-Message-State: AOJu0Yz24lrHk98IIcbBWjjpGnCtAp2+LJNFTb47B6hCNue4SbbaSgae
 2aP9YVwM2uMDESBFg4h3Pap/sVN7WZM=
X-Google-Smtp-Source: AGHT+IHDe/x5ayBKYQg2AtbxpTOZm0zUYRwzrQpEHQxVd0AcWRnyV/La5C4gO3yNx6M4zM3PiNHI8w==
X-Received: by 2002:a05:6e02:2191:b0:35c:b333:a860 with SMTP id
 j17-20020a056e02219100b0035cb333a860mr2034592ila.18.1701022123929; 
 Sun, 26 Nov 2023 10:08:43 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 o9-20020a92d4c9000000b0035ccfc69f95sm153207ilm.20.2023.11.26.10.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 10:08:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 11:08:36 -0700
Message-Id: <20231126180840.2081945-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701022124; x=1701626924; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=U1QXtl4imdp0RYcgG+64iHMzsYOhYhCDrJohPdCO1gBfGsQav9y0+l2QGKYjtualZ/
 Fr32o+metnHTqzs67s154TrmgIFZk+tQqjaNl3Sjt7+AEy63akgmwyKcXvyGzaTAYY6p
 Q5MK3W1fuxDpGVxBVO0YboSuO+g9SQ2/NzMXOlfQWKZirmrM4xNvrU6dfX0YblaB8MFG
 OKZM9d7wKTMYUSWBfQ0FTol0NJZ/yeqPKA1hdgpiR492iQ3bsD6HX9yVqLbjD732EIAD
 fsaAod5qx0L21E3AhdVPQByOnMhfGfEr4FcQcDNSLxdic93iMTukhEGVAZPAfR8ajtLN
 xzSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U1QXtl4i
Subject: [Buildroot] [PATCH v6 1/5] package/python-poetry-core: new host
 package
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update to 1.7.0
  - drop patch which is now upstream
---
 package/python-poetry-core/python-poetry-core.hash |  5 +++++
 package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..c6b180c852
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
+sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..4ca587b11d
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.7.0
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
+PYTHON_POETRY_CORE_SETUP_TYPE = pep517
+PYTHON_POETRY_CORE_LICENSE = MIT
+PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
