Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D2FE77363
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 349F141591;
	Sat, 30 Sep 2023 15:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 349F141591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4oPO-staenm; Sat, 30 Sep 2023 15:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01DDE4158F;
	Sat, 30 Sep 2023 15:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01DDE4158F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C662D1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D063418A5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D063418A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7WY1qHLl7e1 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:25:26 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69D974188E
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D974188E
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-351367c940cso37084485ab.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696087525; x=1696692325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=I5rN8pr6A/HqBpcInn0c/1maLIATokgCcYurMeNPCa9MMw64ocLuVOcNWXHlVL/vOZ
 My2+0vHox7p5DRVop+50OfDTefF2ikx8yIpHDr+kGAHxUAmpZ5023l6GHkayCBwgEuA9
 VUXOt7vAq6kbB5471CQA67Za4l+1093haqur7e1eZECxQxW0mLkRfpzq17XYO1kThkZM
 IkMexi82VKfwJRHqBKXsx5liuvqEpUo96w2hDVjlfnxC3enElGxU3T60AA8gwb1gb2js
 ZS3L9DrkkvzId2PbwpNzZgQoj0j8P09w+ZCwegCbnXJT0WkD5jzHFdRHdKwyozc0rsAB
 mvbw==
X-Gm-Message-State: AOJu0YzPVoWGmQEBjN6PI2lLq6IzYrC2hRoxtrRJSXGcREs6QGAokd6H
 Kis+N3RFQOChIQx2YGhSElTDvVPZgBVClQ==
X-Google-Smtp-Source: AGHT+IHMDPqghLb/W1Kw+XEXnMiE95lA9acshtxj4I207UEGORqYFH81wW4XNx40bftvEQqGxLKlyw==
X-Received: by 2002:a05:6e02:1c07:b0:34f:6f44:aec4 with SMTP id
 l7-20020a056e021c0700b0034f6f44aec4mr9500097ilh.8.1696087524878; 
 Sat, 30 Sep 2023 08:25:24 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 z2-20020a92cb82000000b0034ff58af12dsm6212220ilo.77.2023.09.30.08.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 08:25:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 09:25:15 -0600
Message-Id: <20230930152517.1077576-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696087525; x=1696692325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=L240V4ZvVO5CYSrxwMtdbzyMyWzbtUHcvwbUOIqec6UmaFMFRxrPZ9pKCa2ockwaWX
 jOIkg5go5JQk9mbu35rim/0xpU/6Q9jZyNO3ILrhUaxXvYYHKeAyW8mRq6VDDCMT75JY
 Of1D+IlUjFHafmsd1NC6JyQG/fmKqaN2D1EQNN3KnijtVnjI0pl7DbzpM5E58k2z879B
 QI/IxpWoa8DfBP3DAeX3yVvwl75EaRj5xPHnMaT5shF95vIJ4yfcodGGKr9aKMAP4WUi
 GpBJzM8vw02sSZHDKx36IkWBGRItlkMb1WTcF/GU0k8nrgTaqpcOqybNXIenVjCs58H1
 QvvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L240V4Zv
Subject: [Buildroot] [PATCH v3 1/3] package/python-poetry-core: new host
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
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
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
