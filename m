Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3099CA0EDC
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 17:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F07F412B4;
	Wed, 20 Aug 2025 17:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxbkpuy3H9mN; Wed, 20 Aug 2025 17:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7F0C412AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7F0C412AD;
	Wed, 20 Aug 2025 17:32:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B46EB7AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B076412AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hQGs3i3ZHN7 for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 17:32:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B387940C99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B387940C99
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B387940C99
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 17:32:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1b00797dso967805e9.0
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 10:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755711172; x=1756315972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q+d9Q+V738C4sYn5g+dlT6ZzRiM+WtBDMWG5Hg6V05Y=;
 b=hISAuuz9SHzlhGFTYc6QaDzhWbcoMRqEpKHZKMEXfpdgjQoWjP52OIUY7qw5XBD7ed
 2LZ0rkIfO52r/M4zDgX1FRCEpzncgD7eg9Mi5UXLFarjh49AI2maTuly1bT+EHqXjjmj
 bUd/GzyzWJvDWYkYkr9k48eIa4QBnm/oEKkY6fI+OzsLQQ1OR/IbveTk1PkmjNRtlODm
 +30WqI522SQ5zcVzvpTvQgLcvGSN1f/nUq47m3uJR3jNogrz2E7KpUAD/NtfWnKVIbjI
 KgBLzVZOHuKpFjXPEc9eS0eB95B1+kOVp3CGV2kwXLEGsc0yRXqYhy+4nyxvInO95d0s
 CTsA==
X-Gm-Message-State: AOJu0YzngLbqVsIQjvpD9OYV7Mt3aYd/uWPWuYkR3sy0GVWjEMn3cw2u
 MnZR7YpOYo8iwL9k2QrYAb8i9wO76BLoZGyCz0OFglYP+hMcAGqv8QCHXv0n6fHP
X-Gm-Gg: ASbGncs6Egbs7qOK94w60ZdAmB4sC9XW9mR9cC0gkBo5GK0Xut0BTvMVcQWWZDZ78vM
 NrvYsRwFS6TFuSXdTcpuYvVaaxAGEmGzr0cFd3Dspmhk/Ox0K4AWth2l2PnGaz6eAF2YFLnCu8D
 6wyM/RnJZcOi3cTFpLM35VtkAP4rAIO3VKz8QQNh4nsn2xxMyVeoogaEz1IP6HX+sG8TgGalVhn
 mDA8+EhNVK+L18tIt5LsSz0EmjwZwo9alOR34rJpP82oSR/R21yJM+aG6g2jNfCH2wAdN8l+wNa
 fV6PMCf/b/ka50ZWMenQJIa01QrW6JLRCAOEsRDX91FZ+8Roc2VVfQlqcd4n4Y6t0QiMbQJIWbT
 cBNFRyemal0bXgT+gEAsyxzaqdj0ZT0F58WWg/rZh6Ue60A==
X-Google-Smtp-Source: AGHT+IE9JCZ7q4KhyoBcZ+WXYPI8t9STRyU6aSzVPrzBF/JJC1C653JMHoDPZA45YF3osd0Z+x5+0g==
X-Received: by 2002:a05:600c:3144:b0:456:43d:1198 with SMTP id
 5b1f17b1804b1-45b47a0aa29mr26540225e9.32.1755711172338; 
 Wed, 20 Aug 2025 10:32:52 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b47cb98b6sm43311195e9.26.2025.08.20.10.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 10:32:51 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 19:32:48 +0200
Message-Id: <20250820173248.2076582-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755711172; x=1756315972; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q+d9Q+V738C4sYn5g+dlT6ZzRiM+WtBDMWG5Hg6V05Y=;
 b=gtlRIzkGgH/0rhPYXXtGZqmTLLXgPNehNQ6fq81nl/6rsfxMbY4MZPVEYz60CB32FF
 6v35kxwFSL/0stxo+lp68Mk9zGn6N0Gr5uQKFE9t/sEnT0yceXsRM/ez9wtSYiA8/Xuu
 ga1lCQ/Q576ZgYXyD/gG1ztR2Ui1K6WQNC/y+wT0+6NW94Skk0pBbMcWTWjpcXNFRUa2
 LfqTFghT3wLOUhRsBcuac28QMPcQluRcFE2zybZo2VkLoPcuGJ+ylA4R75AajFaFzMln
 BNwMxZFYxQVE4a4LNK5RtGF+0wY9IfWk9gv6c4CrORu8ORrQQ4JX9MQ5ubNeBPux1WXG
 FcXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gtlRIzkG
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 20250629.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-pydal/python-pydal.hash | 6 +++---
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 2e51472313..aa6b55b951 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  3afe3f02b2b9ddeb366be400740003f5  pydal-20241204.1.tar.gz
-sha256  1ba1f9e528b985e234f5b3acfd9d549998b44f7ed7ae747b9e8d4ad3047bf511  pydal-20241204.1.tar.gz
+# md5, sha256 https://pypi.org/project/pydal/#pydal-20250629.2.tar.gz
+md5  9d6c7dcab8d109355b41befd4e00beea  pydal-20250629.2.tar.gz
+sha256  3fae6250b9dc61ab0deda8700fbe5ccc6970ba6f8de03d58d1609de97a415d29  pydal-20250629.2.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 2764314496..cd9d2967e6 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20241204.1
+PYTHON_PYDAL_VERSION = 20250629.2
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/e8/78/7ddf9aacea5cd2e63423d278d26465c63ecdae87cf1c503d8fc1f7dfcfa5
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/43/9b/a4ec4f0970259b873ee6ea66cfd7681436aa3dff814aa1ad589315a6a4a6
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
