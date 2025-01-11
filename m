Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5145E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F8BC804CD;
	Sat, 11 Jan 2025 14:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzKS_sgJ54p7; Sat, 11 Jan 2025 14:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7441D83404
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7441D83404;
	Sat, 11 Jan 2025 14:46:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15683950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA01183409
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PusLnHqJDyuo for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 14:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 078E2804CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 078E2804CD
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 078E2804CD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:46:44 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a8f1c97ef1so8078795ab.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736606804; x=1737211604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdPwIMTN8gZaMZ+yx4EeLICfYiSjzNOpUx+gz4z47ag=;
 b=khLQfvJetupkq6fyVy0psYo5CI4LXGjrp8zPYMdw5T1b81NovUsaWJBTFJZJ3DDPw4
 A+uMqCUEqnR4r+CUa7TjkVeYpWVADjcqdVcj6czhU2RbYROoYUzUj9a/rjNH1BqMAtur
 0T+t+2O1RPjd7wRuDhSVt79CHhdJlpkFJsLAvtLMUmFpvkBNac4Ct5Ovjtvg52JdHVXM
 15CQlH9LFEgUucuKuso601UHDBzsu0zz9JlK0Ff0noh4A8ukOqGEwvoVgvRttsGK8pm+
 eGkE3WzbMsn6Zb0XqfBKkOCYD7whuFB7hgma9Ta6x+3YgskRspYbrNlW8Wv5jcK8ZcwO
 uE7g==
X-Gm-Message-State: AOJu0YyCdAK9kZcaZAbGGhH0ps5nvPbm4p/NUYQ5HZseteoU0spU9XAC
 SWqgKV+6gttsyNyHiR8NZD8x2UWYBu2zSfW4yjt4XiBxa9LvxCGaSTn/B8jNnyU=
X-Gm-Gg: ASbGnct/gCb0bmWuG2ytnn6OdAXM3pW1QxQ8opGXscPJl5hw0+IH+I+/dJEUQdXoHS3
 t1HyDIKuYK/76bVpSCBxSDTepQeg/s8XqZzK9fcSVmcnz09TrXzdECq6NHSKcIgBhjkKI8MrQYI
 /591IriTelaZux8YppkDKBWdFHfe31NBfxbcrVlFCcEIBwB65o3iiuhju7vEhavz6FhuLNt/ADs
 jOWGS3QC6ybSzWgthER2EIbNyBv4R8nS2bYl8FbPpyiX2uG4SkbP2MD9VA4RqOeqJs+s+mfaY72
 q2G9N00jFhYchj+IvRpIynV9vIczRug=
X-Google-Smtp-Source: AGHT+IFvJbG01kQvv+R47kAa2qIaBF0xUfXDrVAAncFqr7wVBvJq5E8dYKK7SIBHYb+uMc9xC3m9mw==
X-Received: by 2002:a05:6e02:12ce:b0:3a7:9347:5465 with SMTP id
 e9e14a558f8ab-3ce3a9a6200mr115380295ab.3.1736606803849; 
 Sat, 11 Jan 2025 06:46:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4ad99c16sm15919775ab.1.2025.01.11.06.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 06:46:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 07:46:41 -0700
Message-Id: <20250111144641.2757210-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736606804; x=1737211604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BdPwIMTN8gZaMZ+yx4EeLICfYiSjzNOpUx+gz4z47ag=;
 b=dZsDLTAdWt9STsXgPKyMBQi/BsU4yUtY1TrXJtdwmJwImWrY1w1Ol41RK5ysMkgyFF
 OzejMKIW1qpJbUvjI5DjvQWBcYFh4BHNMG9lk1GeRWUbXGSP4hzMAGWsAsHfu6pLiuyQ
 K/90q8ZbNYbUfAH3EcYemc+9My9QtDH2l3dRpeIiuZSwULDks41yiikpOwHhiQEwa742
 aG5irhUe1iMIIxHG4HDhoQdj5FWEPi5HaCpwTN6N8DgSJlVZY3oIupjqjs6Z/1MT70ft
 SLs5jaOBnVNPWYIgOk/Y2O/cQRmg8ezWkajmOJ+J48gDlAntHQD/1SoDbz+WUMtnAD3l
 LCDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dZsDLTAd
Subject: [Buildroot] [PATCH 1/1] package/python-path: bump to version 17.1.0
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
 package/python-path/python-path.hash | 4 ++--
 package/python-path/python-path.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
index 9a0d1a3681..117d225e75 100644
--- a/package/python-path/python-path.hash
+++ b/package/python-path/python-path.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/path/json
-md5  b970d0bcde985133cae6926a02e496b9  path-17.0.0.tar.gz
-sha256  e1540261d22df1416fb1b498b3b1ed5353a371a48fe197d66611bb01e7fab2d5  path-17.0.0.tar.gz
+md5  3f03cdccfa0fdd9dee34c445701d4a31  path-17.1.0.tar.gz
+sha256  d41e05ed4fa1d4f6d702df3c1e0a1a255d7b544287432456455dc7c51e5f98e9  path-17.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
index 6e094aaad5..1ebaccd099 100644
--- a/package/python-path/python-path.mk
+++ b/package/python-path/python-path.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATH_VERSION = 17.0.0
+PYTHON_PATH_VERSION = 17.1.0
 PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
-PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ff/a3/5dac44ce60ad6543578736a5729c5c2130cdac1c3117c61aad0583c2e3c6
+PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ed/51/127cd9fa2baae5715e24839d6fb73c6fa6eca7b84a52fc7ce8195d830802
 PYTHON_PATH_SETUP_TYPE = setuptools
 PYTHON_PATH_LICENSE = MIT
 PYTHON_PATH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
