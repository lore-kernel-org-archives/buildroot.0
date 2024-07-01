Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF29C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 16:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28BE9405F8;
	Mon,  1 Jul 2024 16:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYsjLvjMhypI; Mon,  1 Jul 2024 16:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6E1E4062D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E1E4062D;
	Mon,  1 Jul 2024 16:46:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 074931BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00D214062D
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaHP3TcC2TtV for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 16:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C11A3405F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C11A3405F8
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C11A3405F8
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 16:46:23 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-379c2d0a7bbso11873295ab.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 09:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719852382; x=1720457182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t/w9ZW6uuhKIqyKTMLlUjcer/I5FcEBiIJuAKj2UIHw=;
 b=moPG3F371o/kCm+jXLC3t9imhV5MGFc5mKzGvIJM7y83qmFQRd/FZOLSD6C506+x3y
 itJQop0KISctXQcTHgsRdx3AztkKqlpzlnjQehByoMfVYn9f/dqFK+XDlfITVNV0W5hT
 kSk5xY+78eDmH2QbKLsbGtTNIc2THr8UKXpVHW+K3rL382KlnACtBxc/Y/w+o0CF1skL
 XVkBQ2jKD2NW1m1JrVUdbDucn34+ymw9nUByex8sEGet1hp1LkHVUjKB8jStvWKwVchN
 aaOajc65trwb2dMdhVhS/UXuF8EOWpwfPkgG/D689jpEhmmVh47oxl2xW/sJHxDoYPYH
 YRSQ==
X-Gm-Message-State: AOJu0YyJjESFNgeta/JTZWbVqgfu6SEQI5rEwW9F8LVuINXAYOsqt3Za
 AFtQ7o9gRX3aczu4XTfvwo3G7zJdh7IvoB9vmVevyDUiBB7EOz1eDqQgSg==
X-Google-Smtp-Source: AGHT+IG+QpQpqLUQd98AuttJWiVZu+xfrPl0FO5LX1ubEfaa7NSHFiqVW6Eyu42pF8YRvqjmkrLWdQ==
X-Received: by 2002:a05:6e02:144e:b0:376:3ece:dc5 with SMTP id
 e9e14a558f8ab-37b29465921mr49511195ab.4.1719852382349; 
 Mon, 01 Jul 2024 09:46:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73dd386asm2248120173.37.2024.07.01.09.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 09:46:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 10:46:20 -0600
Message-Id: <20240701164620.1628778-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719852382; x=1720457182; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t/w9ZW6uuhKIqyKTMLlUjcer/I5FcEBiIJuAKj2UIHw=;
 b=T1IPc8pEF3xSX92wPRBn/++7AMNLv7H7PZgnAH+SQBLotnd9UOjryats1Wr/8hDwGl
 PhrQUp9I40np1OU9sVg0I+CMReS6GVR3FvV3X/mwqIkOWHbxJTmPghRNPi/z42kFReTW
 H+zMW3k2zibTNtMMPaCGkmLz6h1ao82II9pVyTzGACB+onrs9MT1qyjEnhy5eOVyyXQ8
 hU1za3X1Aj0S88X9wZXNGk1MLEYzhfQmYAFeqEljnp14KokjtJnVsNYydd/Ky7r1Vzjp
 xHqWrGql8WFxvZuz57mGbBRWaXoP+IZBNeDi47sQbgioDE4O3gsjsG7CSqcxcs/W2I3v
 75Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T1IPc8pE
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to version
 1.9.0
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
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index c6b180c852..2dc1198a76 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
-sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
+md5  eb8730e30aec5f644754b29587b47122  poetry_core-1.9.0.tar.gz
+sha256  fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2  poetry_core-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index 4ca587b11d..5b9b8a15d5 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 1.7.0
+PYTHON_POETRY_CORE_VERSION = 1.9.0
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/f2/db/20a9f9cae3f3c213a8c406deb4395698459fd96962cea8f2ccb230b1943c
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
