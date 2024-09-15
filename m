Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF4DC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 147616076D;
	Sun, 15 Sep 2024 04:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3v13lJBdmEP; Sun, 15 Sep 2024 04:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0796C607E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0796C607E4;
	Sun, 15 Sep 2024 04:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B63701BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A593A607E4
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKthgPjFZVmP for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA0486076D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0486076D
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA0486076D
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:31:37 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a09c22d119so1083005ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726374696; x=1726979496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mNu/lMoAZXRVAT7nmFSya7jxg6ijqlyBIeQjbkkhDdo=;
 b=BlIqNqVF5t3EqcYg1+3BKa1uYHwFAfPnMc/vBrYzI1K9OKpY0/3maQIuNud+0+bE7s
 UCjHxq3Ytis80d1IyIC7qaaE8YQnPgAfaScxxb8+FzvHneOsOQA2ppXnw+hsRBZ+JO0P
 hcYuXnzkvDQDG4bYhQ76mWRDX1vYJ68KnpW8iuaMRlI8pTKVJjBw3dLZO2O5Ovrdym+L
 0RWfibUmT0xOysDAHiBtZUwU+6c/FLZe8A+muXTMvboLsmKh/CSKozLzB4B4edgZFb+y
 rW34ccwTOX9Ej32nVkGowtcmcPtbFsaHrHACKKG74aQwYcEbZxl8p0jzB6NiVbyR4zZs
 3vcw==
X-Gm-Message-State: AOJu0YxExim5ZCE+lkgfcWuCNsc3Jsdh8d9l94rNfMsXvjtFApY8yyMC
 M4xtfdiXGAjmq5Uh+FpGizb33e++iQz20rd12pPyIZ6OsQVDMjYsudfS8w==
X-Google-Smtp-Source: AGHT+IHMrXR5vTXYb0vCx1Y4Uqvalz/6qGp1ax4x128Hn1EmnoIzVBMZT6zA3FVpbZXWWSOxJHhZvg==
X-Received: by 2002:a05:6e02:148c:b0:3a0:4d46:7622 with SMTP id
 e9e14a558f8ab-3a08493757emr111212165ab.19.1726374696310; 
 Sat, 14 Sep 2024 21:31:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4c6asm738536173.3.2024.09.14.21.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:31:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:31:31 -0600
Message-Id: <20240915043131.1394319-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726374696; x=1726979496; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mNu/lMoAZXRVAT7nmFSya7jxg6ijqlyBIeQjbkkhDdo=;
 b=L3GimYli0pGwqZqhjfyl+wH/+4k0b++P0uWQ77VM++eqH91EbMKcCoeNSFEgkkK2Yd
 2REM8jv+7Z/Y/JfWNEwnAK4xlI3PXvjLCsAFxn33pe6mCUSL6YKnoaTpBZWz111ZocI8
 cdekWoh+UjaR56WdLXTpvLbH7yunOEj3lovKWAmZfQPn6TpOYcsZExouNLMY9ClUdKha
 SiofCWJRkV8f2N+fsVuo3gY9zuzTPs/mOsoJQSMd6wr2jqOidN5GArjTM3ZQkQDnAWk/
 /suSCrhhEuOoXkVnjsDxu4pokksxlu891fJD2VzkWZVWtyzu1ysz1/I4tv29sw1jZPNF
 BIbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=L3GimYli
Subject: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to version
 2.11.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cssutils/python-cssutils.hash | 6 +++---
 package/python-cssutils/python-cssutils.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index d93135a989..66c87904b4 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  11707e5da7c40bd98e5b4998489f10e0  cssutils-2.9.0.tar.gz
-sha256  89477b3d17d790e97b9fb4def708767061055795aae6f7c82ae32e967c9be4cd  cssutils-2.9.0.tar.gz
+md5  c8c21e635454d9ca73b21892def35f55  cssutils-2.11.1.tar.gz
+sha256  0563a76513b6af6eebbe788c3bf3d01c920e46b3f90c8416738c5cfc773ff8e2  cssutils-2.11.1.tar.gz
 # Locally computed sha256 checksums
-sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
+sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  LICENSE
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index be5be30eee..0fc706780c 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.9.0
+PYTHON_CSSUTILS_VERSION = 2.11.1
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/b4/65/a054545c81eb87af898d664043578b8444ea3ded656db3da8f9d9fa21334
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/33/9f/329d26121fe165be44b1dfff21aa0dc348f04633931f1d20ed6cf448a236
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
-PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
+PYTHON_CSSUTILS_LICENSE_FILES = LICENSE
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
 PYTHON_CSSUTILS_DEPENDENCIES = host-python-setuptools-scm
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
