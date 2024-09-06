Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5764AE6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19F1F40544;
	Fri,  6 Sep 2024 18:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RP0yP2Oefju; Fri,  6 Sep 2024 18:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B99E340538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B99E340538;
	Fri,  6 Sep 2024 18:37:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA67B1BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B52CB6064F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1nXmt2jZQ1h for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B51936063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B51936063F
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B51936063F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:37:03 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82a151ac935so91427139f.3
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725647822; x=1726252622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9nKeg8mO4piyiQnh3k9cYhtF2bGnMXah4sm9YOp2FNg=;
 b=m+RgPRgy6/NGJsCymSnrBGh5kZ8RyUSn8otobwPjaqiwWWCuhNEyqdVe/uiW6Z9aJA
 U3x0UpyeGe2UvNx5wHjn/XKiQ/2LjdK1ebTwXqKAiyO+AQrdklwVA5vR2h0b1vXB6NFh
 b8VAD5oIX7JgooBCOZUgGitz85IOQ6H/N4E2Pyr31W1j3kdQnqbTwj+l3wioEmo0k3+f
 /o8RryDVYjdmfA4/0ksvC62Sn54/7jmMW/8OBM0vrfv2A0UM+sT52LFZi4Puqhcy6ht9
 GbAcIrB5mHslTnyFjoj1jCqyqdr5dUdwOj+1UlBeQU7hQvca7v+qP2XltQ9eVlDg2dk6
 KTaQ==
X-Gm-Message-State: AOJu0Yzmxble7q4YnwxnHOiUuspz1Ft8k+UewqrGagJ114ION0gUE2eI
 V4VxYOcxgMZXdRr5CfrDz6iUozfDFhE47Ff56wfm1z+BTxK/q+HahcGBHg==
X-Google-Smtp-Source: AGHT+IGFUmYUHtnPTS1mU+1gwHvgEpzcMd13npvPU9mrAnPhoBo5Qxfh3MpMfE0Tbro3zCDJ213Hhg==
X-Received: by 2002:a05:6e02:148f:b0:39f:4e36:4b96 with SMTP id
 e9e14a558f8ab-3a04f0765cbmr42342985ab.10.1725647822182; 
 Fri, 06 Sep 2024 11:37:02 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d0888599b1sm360804173.163.2024.09.06.11.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:37:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:36:48 -0600
Message-Id: <20240906183648.698792-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725647822; x=1726252622; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9nKeg8mO4piyiQnh3k9cYhtF2bGnMXah4sm9YOp2FNg=;
 b=F8+XjttAg6+I/IO1h0vb3Pp6zqWRgJoohmFGpAsZ5GAoJa5NkBcY9Ialv+QnKu3O0/
 pqveeD1z0JW13hRgaan+2I7IUSrhbtdeXR6q/cp7pwRelM8x4rGBF/QUZ9PFZUuUIhSD
 RovpdRY6RCbwwKjZ9A8DD8Dhbss1RqMTApqY31G7yIqa+2zlllaiAwe/WYzQcWAVsga3
 7z/c2UsEqED8TvvLiQ2lYnhL5zxsmeoDFnksMFGBucC3L3WNGulJYeuY+TgNpMhwpJ4t
 um1JmN6QTL/cTRUF5ICUXvabetL8n9j2JryyfRtvESwd+exC8n+9w6BqL00z0vALM1fT
 v1vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F8+XjttA
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.23.2
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
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 3554d0c0f6..ae07d23b2f 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  87cee9e796c31e3470dd13675286f13d58084e4362dae9288a9fa45b1264c084  pydantic_core-2.20.1.tar.gz
+sha256  4d2ad4888a80e06641bfe6a950fa2390ac59a6b0cf0f4e03574122b4b5bcc6a4  pydantic_core-2.23.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 4332c4f6a6..27114117e7 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.20.1
+PYTHON_PYDANTIC_CORE_VERSION = 2.23.2
 PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/12/e3/0d5ad91211dba310f7ded335f4dad871172b9cc9ce204f5a56d76ccd6247
+PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/5f/03/54e4961dfaed4804fea0ad73e94d337f4ef88a635e73990d6e150b469594
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
