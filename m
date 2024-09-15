Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9B1C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76D98194A;
	Sun, 15 Sep 2024 07:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqrnLQSBCGbe; Sun, 15 Sep 2024 07:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD19F81A65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD19F81A65;
	Sun, 15 Sep 2024 07:47:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C90CA1BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B806A40399
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ipP_nvlXTQN for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:47:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83FB7402C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83FB7402C6
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83FB7402C6
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:47:29 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a0979cc639so4462635ab.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726386449; x=1726991249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPpl7tpzJJx7VdYFzBipSKfo/H2hYs7zk6fjTznSDw8=;
 b=F4cxQV+c4KkojxztkDfBMsF5NUDrPO0Zct7VCmd1sDwzoXvnBM6MxQHuDvdYE0FFVm
 w03+WMlbUamqMQebX9WwXv45Dk9ZNVLac+8B6GRT0SpHU0GK8tHhLlxLOUzt3JTbfhR0
 rlQlbdVQTA7R4u0hiOBQX/1FTDwry0polaaui+554JaoofaVwF+uYM/tDAXIC08Soikr
 M3M40nE3F6nV2vujAiNAleDR/S3u1qOMbY562V1llajkPGU7bEXtUjZLaC4gMdKSlVBl
 8rj/9OTdXZHkPRyNZp36AbXnOB/iZSZ5EA6aKGE/ga7xJ399aocnC0e8Xt0bWNayUks4
 00jQ==
X-Gm-Message-State: AOJu0YzxylUGmOrIzIR6V92NDcJ7I3AgKQq+5iRe9ywJGieMGcCJOfh9
 9+XrMKuUnFu2oYkJQXuGF7foxiG+RymGTTIbEKezgFF53g9oj0l0v4AIJg==
X-Google-Smtp-Source: AGHT+IHax5Pp21idG4YyTq8DWpT7qdathYkfMqJ1+N6DdfL9zheDVP58HnHiRb6L2V7I7e8JZBFoSQ==
X-Received: by 2002:a05:6e02:180d:b0:3a0:926a:8d34 with SMTP id
 e9e14a558f8ab-3a0926a903fmr44868305ab.8.1726386448714; 
 Sun, 15 Sep 2024 00:47:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfe1d8sm8843395ab.13.2024.09.15.00.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:47:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:47:26 -0600
Message-Id: <20240915074726.1560940-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726386449; x=1726991249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rPpl7tpzJJx7VdYFzBipSKfo/H2hYs7zk6fjTznSDw8=;
 b=NmABr2UR3rWXWqn0RdjaknNU/xqeV4f+AtiKYMyFAZ/eyUlEbeNFTN3yYWwRnW+gDn
 n8akEtq/XTJNAg7EWelGUsxcFvF0pnSXgI+jqdSHFUhYVlS4xQ44pv4F0eU5dY4IVxD4
 ipUb71jOm0cwX28Zj5+cyLK9Xu/DlhZCy3RjJX30ddv/nbhB+eGqCZh6prEnQYw/PHOL
 5x6g4lbwcpPvkex+P0Z4b6X/XrzTSW1EyZPNlWxeNElC7FVhN7JEIQUMoNp37lyiVe5P
 zelXy1NJFjaeTInzT92p6NBQbNEWMvmTfMYLzajQpi8FZkiRzn0BNFo3JGNOLV8KO5zg
 qdLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NmABr2UR
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.66.1
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
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index 39366f576e..a408802bce 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  480bfb7435426de392a883e6516aae79  grpcio-1.60.0.tar.gz
-sha256  2199165a1affb666aa24adf0c97436686d0a61bc5fc113c037701fb7c7fceb96  grpcio-1.60.0.tar.gz
+md5  cb4fd6dd6b104708bd00348c69f34066  grpcio-1.66.1.tar.gz
+sha256  35334f9c9745add3e357e3372756fd32d925bd52c41da97f4dfdafbde0bf0ee2  grpcio-1.66.1.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index 3d264de4af..51fb7e39e3 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.60.0
+PYTHON_GRPCIO_VERSION = 1.66.1
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/61/38/c615b5c2be690fb31871f294cc08a96e598b085b8d07c5967a5018e0b90c
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/e7/42/94293200e40480d79fc876b2330e7dffb20f959b390afa77c0dbaa0c8372
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
