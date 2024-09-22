Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FE4CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6C534011C;
	Sun, 22 Sep 2024 06:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GD1SIxFaOiEC; Sun, 22 Sep 2024 06:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77B81403CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77B81403CA;
	Sun, 22 Sep 2024 06:34:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC4A31BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7FD54062E
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41ByizxIOkK3 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6757B4062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6757B4062C
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6757B4062C
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:34:46 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82aa3f65864so127558739f.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726986885; x=1727591685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7rj4cNyzKcYeAe3KBSYDPWJhfBHEtIlNdc6oFbTyro=;
 b=kqHwWMERTBXSsD3POiLhYUZQUSMu0b3NBHSJ2W/MrnyO3e8YGY1V3IYcw7EOxN3Oja
 +xbrYWCWZ3THlNKlIAkNSgH0XivmXBdqR9ae3TvQDy7SO+kkBGsiJy5qYnFbmDpX23zA
 0bG/X13ruP/4IiFhYYmW/xekk06TVwC4lcR7YnZvShTgMRxBPnVnmy6u9D9PGHDTfKzC
 HMFi81Qx2IpIfZo/J8yQHzbXGCb42K9cMUtPnpEFZLzrWmcaVtyP5BD3Hl7TsviGAlXg
 lkVkNPfZ4Gy1+HJjMbi1X9D4/Gz1N/a7N/yjDxF2127pMYaMI4JCGUHiVOMZZsyBJnTx
 4h5g==
X-Gm-Message-State: AOJu0Ywr77UErS40eqCcI1ooLCsPwDDjdSS3waaxXhPXwfh9LVthCShD
 l+3SUvEg2/TMni8fvi+iy0zqh+RZI2iVYF/MdGumjSybdevdQ+klB3c/nw==
X-Google-Smtp-Source: AGHT+IGhwpL3g2nHLes7w/kjItzIBhr3g4MCy2vSW5p2/kz7Oq0ZjU1N/B9K64Bu0nWcUMFztUGNjw==
X-Received: by 2002:a05:6e02:13ae:b0:3a0:8dc8:4cd with SMTP id
 e9e14a558f8ab-3a0c8d32618mr74534755ab.23.1726986884939; 
 Sat, 21 Sep 2024 23:34:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed5994bsm4428959173.179.2024.09.21.23.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:34:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:34:43 -0600
Message-Id: <20240922063443.972237-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726986885; x=1727591685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J7rj4cNyzKcYeAe3KBSYDPWJhfBHEtIlNdc6oFbTyro=;
 b=kTQHKpnaHGajWDmXrqyvhJMHJ+A7xSr9A8cQYvcJJOdZJoJXXchT3EW80nE0LoYLgH
 ORluSAGf5zV0YXVsjax863QbvSZLWF+oxdDFigUevzQGiocbtdgXVxlNp0G4415Swkp2
 PUh1sc9yhVURxqqvZt2yU+W9qSa2m7x+e2UBrzRV+DK0cUB+ZF/ZzuA5xk1zJkB8ti4q
 bjx+iWlFMuVwXjlCozuLxe/vui0gk74swQwsaNcTsV8NVgDwmUlK1Bc4tmacVrTJ8suD
 RLIn6Hph+kLDc4c82NZJrB/gdL1+lag5njbCTVNnsVTnCxosUS500LdfbTFOgDlCPzGo
 t9Lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kTQHKpna
Subject: [Buildroot] [PATCH 1/1] package/python-websocket-client: bump to
 version 1.8.0
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

License hash changed due to year update:
https://github.com/websocket-client/websocket-client/commit/02457749c4a995af86aed6930e5d26eadcce6b6d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-websocket-client/python-websocket-client.hash    | 6 +++---
 package/python-websocket-client/python-websocket-client.mk  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 5da778027b..373906c3dc 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5  26d1d8db59c9417570d8ec73ace1687b  websocket-client-1.4.2.tar.gz
-sha256  d6e8f90ca8e2dd4e8027c4561adeb9456b54044312dba655e7cae652ceb9ae59  websocket-client-1.4.2.tar.gz
+md5  9cffbda9eefb0a17e9c4cda3b7884493  websocket_client-1.8.0.tar.gz
+sha256  3239df9f44da632f96012472805d40a23281a991027ce11d2f45a6f24ac4c3da  websocket_client-1.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  638eb70dcc4af2e6d8388de0636ced399f7c24716e11b8573a6b06f879e80691  LICENSE
+sha256  453e6a69427ed9ff92a03ef2d7b21ef1db41fdf56d62307a49ba85059f7a0c62  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index 79cde7e590..ce582e89b7 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 1.4.2
-PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket-client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/75/af/1d13b93e7a21aca7f8ab8645fcfcfad21fc39716dc9dce5dc2a97f73ff78
+PYTHON_WEBSOCKET_CLIENT_VERSION = 1.8.0
+PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/e6/30/fba0d96b4b5fbf5948ed3f4681f7da2f9f64512e1d303f94b4cc174c24a5
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
