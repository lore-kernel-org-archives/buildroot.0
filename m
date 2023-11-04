Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1F7C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 832D060D7B;
	Sat,  4 Nov 2023 23:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 832D060D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 905aM7S8hqS8; Sat,  4 Nov 2023 23:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29EE60C1A;
	Sat,  4 Nov 2023 23:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B29EE60C1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD3B81BF5B5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6A484192E
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6A484192E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFgmkbmQYznZ for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:43:40 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A947041550
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A947041550
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7aca968a063so123224739f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699141419; x=1699746219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nv1dVH2wS4MzYGwDdcSCAL6k0GMY2EipnFO9Fh0dT0s=;
 b=ky3XAYhcSX0qfHWZwcy3/ZtKUYV9gU4HxG9fM56/ajRxUAE1N+JUu7vUzZndkXzW0M
 ZJl7snQxXaEKD/G9FwgGU/t6d5Bdu1mdlNkW8p+SYn51bfeIZ2R8DrhUlnbS6w5jugIK
 Ue2HQes9hWxbGXE5q8xwRU9nQjRHHWiMNjZoInmD/TnZiTEr/xHxb27yutWpD8KrrYuX
 POO/FGV/COyQUIFqbSylYHjGM71TRjrpewy2SFQI/EeZbbc8n9qsAK8zS6R0RKXsd1s6
 8IUg8R6TBwC/RoogADERVaLNi9ODy/tIW5tRnPP5QijiFRDxh8kTOanrIhf0tBXzUZ1O
 BzMQ==
X-Gm-Message-State: AOJu0Yymn/cn6myZqM68pjPWH1vf0FBgq2CQG9nFlOd+bvPrZZiY79J1
 I+iSyKF4TzcHbgXg9Hw7vZIMU8M67s0=
X-Google-Smtp-Source: AGHT+IHRP/H/90xbuH5gmjhtOIAMIEliEnnl4k5U7WTDG1vfNPy8tIdaoNl6S1FnH392P3vWiElFkw==
X-Received: by 2002:a05:6602:3422:b0:79f:9eb4:3ea1 with SMTP id
 n34-20020a056602342200b0079f9eb43ea1mr34547171ioz.3.1699141419300; 
 Sat, 04 Nov 2023 16:43:39 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056602018500b007a6816de789sm1446007ioo.48.2023.11.04.16.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:43:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:43:37 -0600
Message-Id: <20231104234337.2684087-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699141419; x=1699746219; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nv1dVH2wS4MzYGwDdcSCAL6k0GMY2EipnFO9Fh0dT0s=;
 b=gh3QO2u9tx8GDHuF/dwhnUnPJZYXjWVF7uLF9CueN45g6T8K/fieD/hAP0gKYvasNk
 aZW2xlBdELfk6a6pBtj7Rx6USR67eQNs2jFlKaiG8CJN0NOLncY6kFNmlgSP6NLbYLRd
 apZhtdXkB42NNymqCn/sZuj3sPWfKRo0l4LxheguniXtJMICJaG+6E3u6DjF7UFe4/nh
 izA2r4Z6Lq3dGDEYbKo9FU5TZBM9zalsVdcDpx41VpT6cF+y/DkDUyjV5dNPyfrCrtNO
 TqNNtQwwgO8CjBOoL1kK/cwXoQqR4PjFa+QMTSQ157kBp2whLq7XKMwlwI4/Z5hvG4HI
 5Eyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gh3QO2u9
Subject: [Buildroot] [PATCH 1/1] package/python-aiomonitor: bump to version
 0.6.0
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

Add new host-python-setuptools-scm build dependency.

License hash changed due to line ending removal:
https://github.com/aio-libs/aiomonitor/commit/9ec9910145c70037da8ab52e007b9fc286c3a4c7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiomonitor/python-aiomonitor.hash | 6 +++---
 package/python-aiomonitor/python-aiomonitor.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index 652702c479..b67d68e478 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5  5f184e4b97ea161fc2d690aef604f997  aiomonitor-0.4.5.tar.gz
-sha256  6232c1ab14bf06cd7217845801c27340032f74e283bdaf32d01cdd3b7c673d0e  aiomonitor-0.4.5.tar.gz
+md5  0f786c8278a68e7df8b24317e7d33271  aiomonitor-0.6.0.tar.gz
+sha256  31d30d1e9c0a23926edba2a2242b8572c6e8639af9aae2692dee863064d27e48  aiomonitor-0.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
+sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index a8860097d5..1a3b999b90 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AIOMONITOR_VERSION = 0.4.5
+PYTHON_AIOMONITOR_VERSION = 0.6.0
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/98/76/b62e9fbe267287527fb6f4b6774394d4f00650195774173bb0055a99ab3d
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/13/ab/36fbaf36c1c7cb4d5a81b945faf69e95a48dd38cbc9b57915d41d9445f55
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
+PYTHON_AIOMONITOR_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
