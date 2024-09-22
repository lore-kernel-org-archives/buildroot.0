Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C4FCF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CFD7402BC;
	Sun, 22 Sep 2024 05:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvnP1enMDWAT; Sun, 22 Sep 2024 05:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BB9402CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3BB9402CD;
	Sun, 22 Sep 2024 05:41:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE6F11BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA036606F0
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3dJrrGZCFXt for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B2D06062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B2D06062D
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B2D06062D
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:41:13 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a0c9ff90b1so7404335ab.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726983672; x=1727588472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=atbVTgsA60a/nsDRkTo077xqiUpWL1o+altLoi9Ybrk=;
 b=euD0mwdFY3Yxpu1NktClQ9HmqUPVh7RMUoftkGH6KYzXCVEeZw3c46ynQfEHrWaLti
 Ko90IPSp/frLuhY2sgD/+r5cLePV3TSVg4AJkE7tmHpP4aOss5bqy3YCnOdQA3Lsw32w
 6ZgHYXk6XZ7kaGCqA5fPKHjEkYM1CtfpgFyTeP8/Rec0zVLic49UzgbqAig8xqpImvB9
 Fj4BWgdCcX3U+ntEmmLyh7ee1KeCe23oDUows7AGOvww98UD+voZPwxQyLhOGL4G/xIq
 dAxYRUEhvN3/4n6EdrJ7XEYo650GpkxkDw4ETmmpGOeztmNAaYG4BKoR97M2VKmqUe1R
 LYMA==
X-Gm-Message-State: AOJu0Yy50Hsl9R6PHn2BHM+BU0cNCva5VZYeHFdlmUr/BkrUFVgHqqsE
 go+YYxP2rGX2SZofFH9Ojf4isFLGm9+SmNNh7rCOABlkqLyPF6MK7vhcGQ==
X-Google-Smtp-Source: AGHT+IH/lDIWcjxWNKE8jJslVfVZjCcYOxWaeCz5nS0hKQ1N8yVY6OLB1sW34UnryIA8VzKYVOBMCw==
X-Received: by 2002:a05:6e02:1fcb:b0:39f:5baa:e50c with SMTP id
 e9e14a558f8ab-3a0c8cbc250mr73945995ab.8.1726983672068; 
 Sat, 21 Sep 2024 22:41:12 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4b83sm4455700173.8.2024.09.21.22.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:41:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:41:10 -0600
Message-Id: <20240922054110.942735-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726983672; x=1727588472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=atbVTgsA60a/nsDRkTo077xqiUpWL1o+altLoi9Ybrk=;
 b=Z6WBra2JF/EXZGXoPKUHXE2uM3buodOiswB7aILH8hq+8yCzr8wsqeFu/MNaOjnoJG
 vx5h/AGZZgPPi58/sfHrkpJQFyw5azaop+k+4qJps2URw/XlamIemfQOwziGohERd/4a
 h5yfJkzL9jD6DRFCRMX0Q0qgQIsz6vAO/xPWDe64Ud0USRIBXWXbIHTjHGAY/WXXLQT7
 LiPVt5vyvUk3FVJ07VKDrIJtBZ03831sKekL8Z2k1aWLCaeLzjj/eWva17pRvK7DIDIU
 nmUNDuXhYa3pm8tL7y4/yAvURy03qbIOzYlfmA9Slzx2auRjN6zvZHNJgEXfjrus/u/Y
 /gHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z6WBra2J
Subject: [Buildroot] [PATCH 1/1] package/python-typeguard: bump to version
 4.3.0
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

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-typeguard/Config.in             | 1 +
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/Config.in b/package/python-typeguard/Config.in
index 6fd8351570..8ade27eacb 100644
--- a/package/python-typeguard/Config.in
+++ b/package/python-typeguard/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TYPEGUARD
 	bool "python-typeguard"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Run-time type checker for Python.
 
diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index 76394bcb19..aa7549e2a2 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  22d49971f62f3baa3525349b1e03723d  typeguard-2.13.3.tar.gz
-sha256  00edaa8da3a133674796cf5ea87d9f4b4c367d77476e185e80251cc13dfbb8c4  typeguard-2.13.3.tar.gz
+md5  cfc79d64f7f21f999e220f208a856ca5  typeguard-4.3.0.tar.gz
+sha256  92ee6a0aec9135181eae6067ebd617fd9de8d75d714fb548728a4933b1dea651  typeguard-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index 8471f2e4fd..27600de276 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 2.13.3
+PYTHON_TYPEGUARD_VERSION = 4.3.0
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/3a/38/c61bfcf62a7b572b5e9363a802ff92559cb427ee963048e1442e3aef7490
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/8d/e1/3178b3e5369a98239ed7301e3946747048c66f4023163d55918f11b82d4e
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
