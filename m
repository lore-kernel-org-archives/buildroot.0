Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D95D5E36B
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE558600BB;
	Sat,  9 Nov 2024 18:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vCRVR6qOlCt; Sat,  9 Nov 2024 18:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF76B60586
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF76B60586;
	Sat,  9 Nov 2024 18:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD6CFD92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E1108121A
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NzqHACX7b8H for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:40:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2DC4811E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2DC4811E3
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2DC4811E3
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:40:39 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a6be9bd626so12547515ab.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 10:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731177638; x=1731782438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MWWHrz8ja2EO7iO6I8/w6dnbBcIxMnFn3YO2TcJ0vPY=;
 b=hnDeCPYDS5tJl63mX25GdiP1SjEGq9swjhY2W0jI40T+yy3xClZeNKFjLF3lYGdliB
 +vd9j5cY8xHtSrczWxzqfYzuLg04of2IASgV4wyRIHZM8oH7U41S29WcMckcXwc6kEPT
 N6mE25WBhRUOfulC2SM/9vTnPC4Rf3xgQ0qseN+3aVjoblxJp13pj4BtBZwA7NpuD+lh
 aDjVsYJVawSH2WGAWbXy6QNUnQ+c4v524OSWkeQKF26ErfRrxWYqnip4bvpz2DXnYzH7
 LIAlUrMdIL4Ao4mQJzps37t3rHTfIFl5vrA11DVeczHBZdX7fDFGPKy3PBKmps9LVb0K
 H8Ew==
X-Gm-Message-State: AOJu0YzLGXaVBTYrkxuXbcBgec9TDq+ZnJ0fDe+yt0vNgV0BUiK0ESSu
 KUp9+D9djOmhf33zI7cDGYRZJ6Vl1ku0Wz30p6navWkb+lTX1vaQdSiQtA==
X-Google-Smtp-Source: AGHT+IFAi7snmYbkcFeE/G3o9bbi2j7J3Q+AiIfwYQUeZo8eFJRFc0ztVgenE1TIHO9ZxWRByXfq4Q==
X-Received: by 2002:a05:6e02:17c6:b0:3a0:a80a:997c with SMTP id
 e9e14a558f8ab-3a6f1a25691mr65048865ab.19.1731177638371; 
 Sat, 09 Nov 2024 10:40:38 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9820ec3sm4515735ab.5.2024.11.09.10.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 10:40:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 11:40:28 -0700
Message-Id: <20241109184028.752155-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731177638; x=1731782438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MWWHrz8ja2EO7iO6I8/w6dnbBcIxMnFn3YO2TcJ0vPY=;
 b=gOaz5uwjnRm9DMs3hEtWPcsE+WhMXU6bnOX0zwxzaOX3vsSBuFGylvuVHM2qcaWTMj
 Rub8DydgJGN6pcOdeZeUhqS7PaPOQAHhED078DW+Unws2GMmTNWZFoe7dEg7GddYi3H9
 4MOqESifEMqZgBC8gHPDnOA2FhLguKJ0zpL7P10W7dJz+9x3qiZ/FsodXxLbjHwIh/Lz
 DQ0UGEE71GfMzZChls7VgYZ1Nz8yO5wNvUxLzsa5YB+doYP7/d6QaHPA50T95nC5GTTr
 1wyNSw4l3EWQ7NupNi7DwZLGd9hS/+EUKqrOBLxx+fnxtF2syj383rong+Vv9DulUM+v
 7xbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gOaz5uwj
Subject: [Buildroot] [PATCH 1/1] package/python-meson-python: bump to
 version 0.17.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-packaging build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-meson-python/python-meson-python.hash | 4 ++--
 package/python-meson-python/python-meson-python.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
index 537353bad2..11f1807144 100644
--- a/package/python-meson-python/python-meson-python.hash
+++ b/package/python-meson-python/python-meson-python.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/meson-python/json
-md5  e91eb9946d7bb8be06e434c5a2dadd05  meson_python-0.15.0.tar.gz
-sha256  fddb73eecd49e89c1c41c87937cd89c2d0b65a1c63ba28238681d4bd9484d26f  meson_python-0.15.0.tar.gz
+md5  bf1299782f02e4bb590a437bd140fd12  meson_python-0.17.1.tar.gz
+sha256  efb91f69f2e19eef7bc9a471ed2a4e730088cc6b39eacaf3e49fc4f930eb5f83  meson_python-0.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index 64d5de4ba9..be8ab00c6a 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-PYTHON_MESON_PYTHON_VERSION = 0.15.0
+PYTHON_MESON_PYTHON_VERSION = 0.17.1
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/a2/3b/276b596824a0820987fdcc7721618453b4f9a8305fe20b611a00ac3f948e
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/67/66/91d242ea8dd1729addd36069318ba2cd03874872764f316c3bb51b633ed2
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
 HOST_PYTHON_MESON_PYTHON_DEPENDENCIES = \
 	host-meson \
 	host-patchelf \
+	host-python-packaging \
 	host-python-pyproject-metadata
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
