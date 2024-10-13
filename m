Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B117CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 19:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA52B40282;
	Sun, 13 Oct 2024 19:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-gac7iV6t5K; Sun, 13 Oct 2024 19:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE38040185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE38040185;
	Sun, 13 Oct 2024 19:18:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 545E21BF46A
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42B6F404F9
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Do5UVUppI3ff for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 19:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA80140425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA80140425
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA80140425
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 19:18:35 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a3bb6a01eeso7443935ab.0
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 12:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728847114; x=1729451914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=40p5lwccF+J7NeqTDbn2wNiIII1VYqbh+HDivzNcD88=;
 b=FvsFerAPHzVjDGw3pouEJz/EhQ5h/8if7a2c0ViosmqvMnnEkEYF0ESbaPz9FQPUy2
 XmHI6akg8FJRLONSqpXHIhX576EPuvaYnnNWA2QUaQnBxrS5LGgWexnyBHuSdyR+XBTN
 WbAQe4V9/FFzIPhvDudQDIJnVwD3oC8J8ufWV77Ep2YC4jqjV0VPCoBeD+VIDWSnRhbT
 HaZS+pekCT2Jdanxf3DLKkl+mKpD8MvJQORC5Fyg34GPsw9YnmHCHc7eOQaK6jGEodzO
 bS1zW6LCMybp1K2j+wpig4qPxBKYn3+rOWVtv2qLstkhqUs/QFp6a2wvta9GhTeU6ORO
 gKIg==
X-Gm-Message-State: AOJu0YxX/NGYXPyIbBWEtZAqMEGic6/FrplS3xaugDA3DAClGZnIb5Pu
 qHmYI4c9ZqBkhmBjF6YfyyZ12Y7rMmmIu8B2UvUvwoB62IOHnPukQEhdsg==
X-Google-Smtp-Source: AGHT+IFOfNv3C5pZK6Ab8au6W2heD9HAFq3q/erbMg516swwUX+jULEcDPN8gahL86Y7emEIxjte1A==
X-Received: by 2002:a05:6e02:19c9:b0:3a0:9043:59ac with SMTP id
 e9e14a558f8ab-3a3b5fe35b4mr66283465ab.25.1728847114501; 
 Sun, 13 Oct 2024 12:18:34 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a3afdb3439sm16619525ab.27.2024.10.13.12.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 12:18:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 13:18:32 -0600
Message-Id: <20241013191832.2801141-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728847114; x=1729451914; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=40p5lwccF+J7NeqTDbn2wNiIII1VYqbh+HDivzNcD88=;
 b=OUv+i7fL6+zlwIZqcQuvxZf1ygqcM7osfblUd9otCR1JvSJYVz4+tEnh5Q64JPAfhZ
 myz0lDbg9J+Ch1YBf1+DZ2xWUibHhAoyRhm5N+0DD8IRIhI7tkDEW8J/eHsEuo5OM/m0
 ejajThRJEKJpD2+HgFWH8fk5n6JIz0Qkddfzi/7Ovuet6yNUc3qQOF3QFlX6p7jhTLkP
 9gRi0QAg3U8rsGq7q39J6pcEh77bu4Lwjg9bfSAM6quYLYZYny/YA197BTsqIs89GtVJ
 8mtjswo4Yg3wHNm3O0lYq2QgXY9YXiBjEOIU08PWDv2XwVmlRg44XJENVZT9616isT8B
 7lxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OUv+i7fL
Subject: [Buildroot] [PATCH 1/1] package/python-simple-websocket: bump to
 version 1.1.0
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
 .../python-simple-websocket/python-simple-websocket.hash    | 4 ++--
 package/python-simple-websocket/python-simple-websocket.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-simple-websocket/python-simple-websocket.hash b/package/python-simple-websocket/python-simple-websocket.hash
index f6cf8457dc..2350f4d2c3 100644
--- a/package/python-simple-websocket/python-simple-websocket.hash
+++ b/package/python-simple-websocket/python-simple-websocket.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simple-websocket/json
-md5  e1dd8c3da6994555289611586c326dfe  simple-websocket-1.0.0.tar.gz
-sha256  17d2c72f4a2bd85174a97e3e4c88b01c40c3f81b7b648b0cc3ce1305968928c8  simple-websocket-1.0.0.tar.gz
+md5  2c5f6f6bad380676db0eb7e2c4070454  simple_websocket-1.1.0.tar.gz
+sha256  7939234e7aa067c534abdab3a9ed933ec9ce4691b0713c78acb195560aa52ae4  simple_websocket-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4b8abadcc5e3dd29c71905b84952945699f0a7ba41e6af99eaba46faabe95bb7  LICENSE
diff --git a/package/python-simple-websocket/python-simple-websocket.mk b/package/python-simple-websocket/python-simple-websocket.mk
index 1fdf7f8763..a77d9a66f6 100644
--- a/package/python-simple-websocket/python-simple-websocket.mk
+++ b/package/python-simple-websocket/python-simple-websocket.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLE_WEBSOCKET_VERSION = 1.0.0
-PYTHON_SIMPLE_WEBSOCKET_SOURCE = simple-websocket-$(PYTHON_SIMPLE_WEBSOCKET_VERSION).tar.gz
-PYTHON_SIMPLE_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/d3/82/3cf87d317911864a2f2a8daf1779fc7f82d5d55e6a8aaa0315f8209047a7
+PYTHON_SIMPLE_WEBSOCKET_VERSION = 1.1.0
+PYTHON_SIMPLE_WEBSOCKET_SOURCE = simple_websocket-$(PYTHON_SIMPLE_WEBSOCKET_VERSION).tar.gz
+PYTHON_SIMPLE_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/b0/d4/bfa032f961103eba93de583b161f0e6a5b63cebb8f2c7d0c6e6efe1e3d2e
 PYTHON_SIMPLE_WEBSOCKET_SETUP_TYPE = setuptools
 PYTHON_SIMPLE_WEBSOCKET_LICENSE = MIT
 PYTHON_SIMPLE_WEBSOCKET_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
