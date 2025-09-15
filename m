Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FE5CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D0640719;
	Mon, 15 Sep 2025 22:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgb7Npqk9vRm; Mon, 15 Sep 2025 22:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9AE44071A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9AE44071A;
	Mon, 15 Sep 2025 22:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65260199
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61A14812F6
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3O3w8bybM2Q8 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 22:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B889812F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B889812F3
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B889812F3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:07:54 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-41d4cd731c5so38448675ab.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 15:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757974073; x=1758578873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rvr7ZnL+eoho19E1pM6mpCqrcTJQDtwrILv2120m3WI=;
 b=IJUrh/i0QYuFnL8raeyQ9G9GKnCZVArTtr/3/pL3LiL7R4oO7Mu2fLIS7Q+Gz6NY0b
 J6gUsOQfcT1nQDrNVdT59DXXywjNt2LxJMer68uzzhMPLAI1zQPCl62hlpi+HZVN40OE
 MRuiVIqwPY1rZK9XsD9VQ6nJxPpTZKaHusrnRq53M1gdjXawmZAHo1iIK4pped7DS8Jb
 YhHgC0csZqYy6XIy/FszErHnsCxOYNf89+Q+oD3SAiL7RyT5btgSzebLnqTuNG3eEOKk
 3umDMjHMGWUvPeYiFz5uoaA4KGqsqrxPqyrqNRq3gX3eDoSwKN3TMBHZfKKEqALK2Zkt
 yE3g==
X-Gm-Message-State: AOJu0YwJk98YnAf3XdxYukMunVyXsIQwfDS4E+evSK6EKQElS8UFqpIr
 kWS1JVUe8YUJqgytl0nYIR+7nyAe0y/+OYG9krq6+u9+WJ0bEuONkYFnvUty0Q==
X-Gm-Gg: ASbGnctI/+XtqAV/42HsDVmuKMVcHejkBKIQY8r+PAir726Fxw6zLeg3hsUY6unNDRX
 IUk5IPxl41f53suS54cIgYt+66UonoczIihcMPWj5SKGmkDSO6FrFpPVAAMIb+Bi+DWunR0qFNv
 sz9ayGvB8KLdLN9Hud22yigHcuV6DJ12m+2S5wIS8Cf8Cbo5ljjVE3dK0j7Lvo+FLyfsDmEnrop
 O52ya60ioKxI2xgx5NtCucnlclO5+YdbuVcU6/3qpPdj+J7hGpO+EO8EqWf1JGphse1V2aPI8kF
 Tf6PXUC9fs4NDoMtuA2K07tdq7SBFhKyajwThie5tEcJdOzSbGpaKABSdVYeG5y4vfmROLPbLc8
 DtLyIu6akoCzUXO+OBzG3D6ySxw48t3ZsaE2G+GlIS1zvr+5Q5DHA3Bzu6qaAjsDCFglg1/NoGM
 RB
X-Google-Smtp-Source: AGHT+IE3KiHUQSC8ghxU45pmAtnaNr0OcFj2dxjl+mFbQrO8RyQaGeusZ90cTZKoTrD1u0boOWVtKg==
X-Received: by 2002:a05:6e02:164c:b0:424:30f:8e7f with SMTP id
 e9e14a558f8ab-424030f90abmr51994735ab.17.1757974073170; 
 Mon, 15 Sep 2025 15:07:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f30cb180sm4997687173.72.2025.09.15.15.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 15:07:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 16:07:42 -0600
Message-ID: <20250915220742.1599145-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757974073; x=1758578873; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rvr7ZnL+eoho19E1pM6mpCqrcTJQDtwrILv2120m3WI=;
 b=kBb45FNYtKFzECpn82YqMUbjnzOrh6viAsf87RvbZ36CfParIeERZkDN1x0fYT7kYU
 zoMwZRCBgTIaE1t7Pmnl1uTlKeQsbsmPohNfVSgPiDQUnL0Tj8wO66D0nM5T+wGIXdEN
 OuPdH7tqUa6tvbIooBC8U2kT3m69U+y7JwnbGKwhEoyzPzUXq+GgxyxKSZn7mvxbjcN1
 DmPeXwrMizFhUFazPrnpBMhMitSViH51P4ust0enNxL5rbjwvsGN2ariT/2AaW4vFuvr
 HeuE38XK+GjEVnLsc3+4hJiVSQPZh/1PLCdd0zEJSG7lYRODHt5HlnBqQ0iemwIjibP+
 CrYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kBb45FNY
Subject: [Buildroot] [PATCH 1/1] package/python-asyncclick: bump to version
 8.2.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop python-anyio runtime dependency which is now an optional
dependency of asyncclick.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asyncclick/Config.in              | 1 -
 package/python-asyncclick/python-asyncclick.hash | 4 ++--
 package/python-asyncclick/python-asyncclick.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-asyncclick/Config.in b/package/python-asyncclick/Config.in
index 9264245213..7147803d23 100644
--- a/package/python-asyncclick/Config.in
+++ b/package/python-asyncclick/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ASYNCCLICK
 	bool "python-asyncclick"
-	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	help
 	  Composable command line interface toolkit, async version.
 
diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
index d121097130..1a2603d2aa 100644
--- a/package/python-asyncclick/python-asyncclick.hash
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncclick/json
-md5  e9bab017b26d1310d42b4043742812ce  asyncclick-8.1.8.tar.gz
-sha256  0f0eb0f280e04919d67cf71b9fcdfb4db2d9ff7203669c40284485c149578e4c  asyncclick-8.1.8.tar.gz
+md5  3c8af1a8b6151c24a102e5ed891d19d1  asyncclick-8.2.2.2.tar.gz
+sha256  014f6b7bfb1ef34a2215bc36aebd5150d5d2e50668b12eceb749961e32c24660  asyncclick-8.2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index 9168d65b58..d413242def 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCCLICK_VERSION = 8.1.8
+PYTHON_ASYNCCLICK_VERSION = 8.2.2.2
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/cb/b5/e1e5fdf1c1bb7e6e614987c120a98d9324bf8edfaa5f5cd16a6235c9d91b
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/35/51/b01dd77c9a14fb0b312d799fd8c10b145b882535dbaa9ac055a52515b390
 PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
 PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
