Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51428E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 19:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1644383AD9;
	Sat, 11 Jan 2025 19:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcuWu0Q3bfVU; Sat, 11 Jan 2025 19:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2397E83ADD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2397E83ADD;
	Sat, 11 Jan 2025 19:01:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89D60950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83FD1407DA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id al0msxSV8AE2 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 19:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F91D40817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F91D40817
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F91D40817
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:01:32 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a9628d20f0so19736095ab.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736622091; x=1737226891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kv3XQ2MdDS05b+me6VSbDdX2apcF5B9zwzU3G1wHnM4=;
 b=iNbzZWBzEU0q/Wwr1tqg7PqDu9IF5tX3LI6hL6QS1DEpXiIbJupgqwjJKrtPKXnc82
 vtUYPg8iniLSSrfst5lvl0Xz81xsvjbkADwoOF+T2DB2m3AUZLfdJJI8EEILSGuCYoqs
 7SX5BeLHlo4VsWw2iO5T/qmWspP79S+AXUX6QhTbeEixNMsxS/mRDhHRt+/QHrwK/px/
 GBu0GjGJL7obeLOVm1UoQ61++iTp9V5VxhSK/fT9fLRGnaQPhYn4EZwiuxgD6Hz/Np4E
 YyZCKaOspiOni2y4grYBYuwPmBeRezOqvMqhnRd4GR9AR2vYXT4Q/IphRxg3KCyq3zMR
 YX/g==
X-Gm-Message-State: AOJu0YyWV6hBkVjxyqQjYVdOoJN5zPhlKwwTsrI54fHiLI0aHqcrwZzS
 GmmBOOCp2tq5r1hAxrAhFBf9AH95EdYioUShbyDSzVz7vjHjGKDYEch/sMWGx9g=
X-Gm-Gg: ASbGncu0CGq2wJDO7q/qSvhM+iQrhVwqvsS7YTa/XKiWvFyxjthRrL0/NZ1i3rRovld
 ktbfEa9U1G6/VGq9ivTwxD/OYR+74mGRRQ38D+/33i8rOIm79uZ0iNdgBuuoMuKDBgiVBLxsFYQ
 7IG9ue0UW6T74c3i8VymGnU/l4ISlgA00s30YwymfWp1o+vysS6sePIozZbl7Yzn6pgdi1MQ2EH
 sKBxq5fDCj8BwYpRZ/cyUJnIo2dzEviDjRk65MTtSGzqp7Hbtla1NiCsWTQyW+TCxG/VbV9FRJc
 toI5iedknxwVbKCp8Nr1beJprP2jwCI=
X-Google-Smtp-Source: AGHT+IHpqxPEAfwmL264agR1coKNQR1CqoTL+NoOfM9IqXvnNQeQfNadwDcOQijqfnteG9Er+sxTqA==
X-Received: by 2002:a05:6e02:13a2:b0:3a7:e732:472a with SMTP id
 e9e14a558f8ab-3ce3a9a4ac6mr125783965ab.2.1736622091137; 
 Sat, 11 Jan 2025 11:01:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f8eb6sm1694922173.1.2025.01.11.11.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 11:01:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 12:01:29 -0700
Message-Id: <20250111190129.2960015-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736622091; x=1737226891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kv3XQ2MdDS05b+me6VSbDdX2apcF5B9zwzU3G1wHnM4=;
 b=jx8kAGPgbt3Ol2N2gMRwb7t3abq1896u32Kpn+2Q0Xs1GvLSRfQZG1PxBsvhEV/k1D
 WcnWV2EWQ1Lo3/xtVMy9k0IJACYoj0QcYKk8IgT9LK477Alz/vQL3mUUfM1lC1Pgoa5t
 jIVybVysKYcO+7O9AxDYSXnjJIxjFulQfi2MA6O9bptHfiF6qEqVr6aXWcU4r44cbENj
 9JwYtCdhBWDItN6loBaLHp0gWRKJYIEIvQwV8vmOOl6eNt4YPzDRoM9tEEmtQPKRJwJu
 2hlG5fmlzvM+zzHnIFLdakrbe+xruPGygix+duIH4Z0JkhsucaIDrq+PBy7mdWUvOd+2
 FuiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jx8kAGPg
Subject: [Buildroot] [PATCH 1/1] package/python-wheel: bump to version 0.45.1
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
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 35bee60b72..40836a5d1c 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  3d1f79ff04a1252fa709dec58aa7249b  wheel-0.45.0.tar.gz
-sha256  a57353941a3183b3d5365346b567a260a0602a0f8a635926a7dede41b94c674a  wheel-0.45.0.tar.gz
+md5  dddc505d0573d03576c7c6c5a4fe0641  wheel-0.45.1.tar.gz
+sha256  661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729  wheel-0.45.1.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 21060cfc66..417db7c167 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.45.0
+PYTHON_WHEEL_VERSION = 0.45.1
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/e7/52/fd4516fb8f7d11a08e3f9cd69eb1558f098ab67e79f32d920c4974ee550f
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/8a/98/2d9906746cdc6a6ef809ae6338005b3f21bb568bea3165cfc6a243fdc25c
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
