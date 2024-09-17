Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B19CAC596
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24AB4608E6;
	Tue, 17 Sep 2024 18:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofaxpw8b_LWh; Tue, 17 Sep 2024 18:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 144F560A48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 144F560A48;
	Tue, 17 Sep 2024 18:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9631BF295
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CE1B81395
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKNo3x4i2NPc for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FF2680584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF2680584
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FF2680584
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:40:12 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a0b57059f0so2667705ab.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726598412; x=1727203212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BvPl40T4rQBh1BNUic/37hnEKb3cnrrasJj9J3jALTg=;
 b=V405daFktfEZ2eyBSBW2P2lsehhsJVl4UoGrnNQ7rUebGqJdRiFWVvvLqZ51PpvmTJ
 xQcFtMP8gr+KJblq11tZ5fH1r3t93b1/Ala8vGExS8b3SpSdukdrLQZjz0AnMfLr9jFb
 C2X2mKVKz/shuq8C6tLh911vJsHMuF1a0iUBcAs3rk+XSU4w2l4456x1DTsv7QVbw087
 wuwBd+sZ2C1L+6TliZTyfxsP12dItajNzYkxWEXXRSIRkre9aiOQ4y5CMo8Z26D2tZm1
 DmCLujJ/9CKo2yz4u3lP7w7RU6X+IudFhT51CmcIQbwfWBmzMwGH4BephSS153d51JDX
 gKeA==
X-Gm-Message-State: AOJu0Yyz9gu3jlsFSwEyyhJmzHgp0Ge7FlJO1ShgEy+G7RB9Azez6OI1
 +8rLmOIsXa5sFZAjT7+jBsN2uS4Acu2MPY7/aihxyANqnfvm5e82e7vUQw==
X-Google-Smtp-Source: AGHT+IHMhaeg0CLz5zv1BiSQL1EM1i5oWyDcX/srl4EKd+7q274oeUxGvrAvoeKUer76bw5rsLgk3w==
X-Received: by 2002:a05:6e02:1b09:b0:3a0:ab21:e32f with SMTP id
 e9e14a558f8ab-3a0ab21e472mr51680775ab.13.1726598411268; 
 Tue, 17 Sep 2024 11:40:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d83sm2069527173.117.2024.09.17.11.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:40:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:40:09 -0600
Message-Id: <20240917184009.3889183-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726598412; x=1727203212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BvPl40T4rQBh1BNUic/37hnEKb3cnrrasJj9J3jALTg=;
 b=K1rOyL7aLxSk0l0qrrOHO1hCmYbQthkoXtz3viAKViTjKqQx8mO6Dze2D8AqUx4eqX
 lC6j4cXooYPTigAR6o/yWg6SNDLQcJCxOCocD9y8ibfVWfl3tHRGNgQBFMdMiatDRm8h
 FKsxB1f243AdIuN+bL08qS4yyqA7aS/pwXx2aTTwuLCiTxcry1f3W6cEvNL79j7RXwZi
 5QO8RVSE/F0LgNYOAv3Xo60Ga+S+Bib/ghM2PxEcF3Nu7HJsGobDuIu4ZnllZMYB6MEB
 ogAetvnRKYvUe3tgKHQrmW1J15AE7E04O3AiuUymVZwcwjXHT7hCga3aWODJd4Jkgl+S
 +n1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K1rOyL7a
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 10.4.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 7 +++----
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 352536a035..91626319b2 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,5 @@
-# md5, sha256 https://pypi.org/project/pillow/10.3.0/#copy-hash-modal-125abe0d-59be-40cd-89a3-3e2f78136be0
-md5  6c21a12849ae42f93881f614d8f6f651  pillow-10.3.0.tar.gz
-sha256  9d2455fbf44c914840c793e89aa82d0e1763a14253a000743719ae5946814b2d  pillow-10.3.0.tar.gz
-
+# md5, sha256 from https://pypi.org/pypi/pillow/json
+md5  869758b3c5f5d8c15ffda4c8011b78d6  pillow-10.4.0.tar.gz
+sha256  166c1cd4d24309b30d61f79f4a9114b7b2313d7450912277855ff5dfd7cd4a06  pillow-10.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 38214376ce..62e87951c9 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.3.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/ef/43/c50c17c5f7d438e836c169e343695534c38c77f60e7c90389bd77981bc21
+PYTHON_PILLOW_VERSION = 10.4.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/cd/74/ad3d526f3bf7b6d3f408b73fde271ec69dfac8b81341a318ce825f2b3812
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
