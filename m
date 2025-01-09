Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E02E7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E4C606C5;
	Thu,  9 Jan 2025 20:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juKVf69N-mui; Thu,  9 Jan 2025 20:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 558E660716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 558E660716;
	Thu,  9 Jan 2025 20:53:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4318A942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24687606C5
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HCsFbptzFcO for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3089960AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3089960AE1
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3089960AE1
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:53:36 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844e1020253so43421439f.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736456015; x=1737060815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V+wgrxtQsvhI1Mwt0dCKxMZAqw7gfHyemZaeEwjXQtM=;
 b=S++VJqjcnZVEuRe5khrCN6tIfdBl/cgEa3ZcOwulfiIq1W65eQP3bDE/o/W/mQmKbD
 APbg3CNxMsqSeEJfz2FPuHUTIhkLPzqUodslxW84xsLOBQ2eVo1jcrvDX6kz5cTCHB7l
 j/+TtwSurOs7Kf8ZoLH7sQpCReiEkAT+2sw04TWJbp2lV6KbBykkppJK3yaimkmogdZr
 BiLLqRLs0KzqEr4DIukeTZli31dv3T9B2rjzEQQQRkqH9oFESCXxO1HP5hovf/0uSp+2
 PojSSsRywR4FznC4QibBPTj3e5t4wxuLQGlh6z1blbz00QIgqcMP0Rkj9JLuTbLZxFrr
 r6CQ==
X-Gm-Message-State: AOJu0YwUKSv5S9VhrpeTrjs+oRHIvfLMR+BQn+0UvRZvSplzrYbHYuL0
 IRe7x8TFZ+7iDK3ZfwxLH9EPWddBozscPsS7LmBwWVd3eFwczRw81yi2dNXm+54=
X-Gm-Gg: ASbGncuM0r0cxfZP2zrNh/Em9uqTlCNsWf0T2AIdtwdpk88Ld29XyyXKQT0stNBb1gm
 3+Nbm8Sb1KrTsGh43C80TG6V6kCcqcrNlMMsYpt1joFgqv8LqBdBTeW1wjnYqWgV9w+aPayNDZs
 u00feoFwbiEJUGKY9CFa050Qz7dQPk42z7xjMH5rjMXgAiynKgS/brl/fhl8X+iRWifJGXhr9h3
 pnORxtTZ0xXhXFnNBN2MNQjs/nOjhPrdbebcDtN7eprWI7K8fflRtj9bhsNaf+IShvnYqneBS9B
 Q/pQsNHvpkI8ImqqXE2Sg/D+foxYGDw=
X-Google-Smtp-Source: AGHT+IHkSJD7lMELstUb8TEo5nhH5BIt+hmFkUGtyoZvt74Ss184SEM05PerPumaw8I1ddWEckD3Yg==
X-Received: by 2002:a05:6e02:5ad:b0:3a7:e86a:e812 with SMTP id
 e9e14a558f8ab-3ce3a8bb663mr45090185ab.17.1736456014893; 
 Thu, 09 Jan 2025 12:53:34 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b613391sm502327173.47.2025.01.09.12.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:53:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:53:33 -0700
Message-Id: <20250109205333.2393948-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736456015; x=1737060815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V+wgrxtQsvhI1Mwt0dCKxMZAqw7gfHyemZaeEwjXQtM=;
 b=Q6OD1Jq1Pws7l+sZdmZkoONmuUDWIsIvCul9za8R+3Lo/GCXienrIAKttl2jfc2D5G
 s2SH8ALdimkXYuH61kaLBfaQvcWacX7c71m9qo1Rh4gDQgc54zV9LjW32+i3Wowwc/jf
 XVy6wr6XuQMQrt7qN25j+kadClSZTTOg7fSD3oHboAQfGKUk0E7jaAodf1Sx0SG4OYkE
 yH+i1PHm65/E5F7xLsQh6dYhwa2UXbwkl9CnDoRvFUzw+DVNIh+iSsPldQdrG810dwVc
 /pDtJ99Tt8En3Qh0Ym4WyRD3g7igfZAzyFSVSmYEltdIreBP6qJQGGdPXteSSyQEBSVq
 NzyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q6OD1Jq1
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: bump to version
 4.11.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 427e6cea12..764da93f83 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  cfed3d8b399a2a9889ee2e2371e5e03f  python_engineio-4.11.1.tar.gz
-sha256  ff8a23a843c223ec793835f1bcf584ff89ce0f1c2bcce37dffa6436c6fa74133  python_engineio-4.11.1.tar.gz
+md5  3ef6c195d98209d6d0daf0fe728c98ec  python_engineio-4.11.2.tar.gz
+sha256  145bb0daceb904b4bb2d3eb2d93f7dbb7bb87a6a0c4f20a94cc8654dec977129  python_engineio-4.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 99a7dae0a3..5bc9906ec5 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.11.1
+PYTHON_ENGINEIO_VERSION = 4.11.2
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/17/54/39e4c942296943cc79a1fd7d744a1a10ba2fc3af59293f26a8bd48c2aa74
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/52/e0/a9e0fe427ce7f1b7dbf9531fa00ffe4b557c4a7bc8e71891c115af123170
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
