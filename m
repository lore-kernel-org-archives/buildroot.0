Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4D3C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 06:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6DE260D61;
	Mon, 19 May 2025 06:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qwghtOuodP3; Mon, 19 May 2025 06:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C69C060D5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C69C060D5B;
	Mon, 19 May 2025 06:05:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE56E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 06:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ADB340C3E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 06:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShVSZ-GhKVsQ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 06:05:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4690340873
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4690340873
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4690340873
 for <buildroot@buildroot.org>; Mon, 19 May 2025 06:05:45 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e7b3410e122so3811822276.2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 23:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747634744; x=1748239544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IhPNw7Oqog/phn9XGAGrQMizHCup+a9cUB8tU5UMOd4=;
 b=V0Yae1Ha+eokDkZG1fZadvOLnju4XRUN2IAZSjMq40FQ6fajno86FtspqM5heZdy3m
 nuQAIOQbWp8CFRyQRE4ke22cdmiPTwnkEA6nusQbmJLb2UKErAgRCCslqCYe6fjZtrFR
 0jm7bqyAt62RvmzshGkkZOMwioaeZ3tIBLKjXxqHE4DaM8bJTGVNUzXOTiKe97M6I7yp
 vf9e4jirsI5oZ+WcUSSx0WOUwVLYjd4gAGJU/Xa98i9zLIaQ1JDiUZCnqnyP+QO5Z1Dm
 roj0onAQIWNbkS9MhPrlg7HUI1gE0IrgOI661/tne1Op36YMReC+H3LZ4Thc6VRsy62/
 fB1g==
X-Gm-Message-State: AOJu0YxsPz6V2HuOBQINar1AH63Lt6VS8Yf88SLPdho4a/xzTXUyAP90
 MIwajXox9v2sUi7rzsWWVthgeS/YkwRQBgQkblJJ3NRLwMABDXSQgaAotvGbfQ==
X-Gm-Gg: ASbGncvvPn5Nks8XhE9+P/l8mVbeUuSFRSiSE3BDhV9DFW4PBFKkUfqIVXQRr9EZWaU
 TLYz74bIML+CcYF7x3V9i2EiXKwJtpXv5PvUa9q1GDVAYlpXDRPwggInELJwagZqe20CFzdtJvr
 qO9/tmGcviIbKKzqnRhP5P2VcfcRXUe6TIfQy0NIzcK1BAzZCRwK6d4fF9HYgRCV88LaZiuyR3t
 +uPkR8WgUnrg8EXztbgyyTQ0zKfDtuUlDYt+00zrYWLHMr1Cugj5JwnSH4n7REK7/vAC11Or6XJ
 BeRIf1tKOSrdHw2HWN9/oy8eS0zv6uFSDNRg3noQp3Rnkcpg
X-Google-Smtp-Source: AGHT+IH3RIy9p7zk8e2JOCWhhxaQgU6zl0JnhsEmhmTAo+wueOKirzPhy+2p+UIsPQ3H6ytV37Ir0w==
X-Received: by 2002:a05:6902:460d:b0:e79:67c9:b647 with SMTP id
 3f1490d57ef6-e7b69e857dfmr15189445276.16.1747634743654; 
 Sun, 18 May 2025 23:05:43 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7b6acaa599sm2472518276.25.2025.05.18.23.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 23:05:42 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 19 May 2025 14:05:29 +0800
Message-ID: <20250519060531.982830-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747634744; x=1748239544; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IhPNw7Oqog/phn9XGAGrQMizHCup+a9cUB8tU5UMOd4=;
 b=eJyy4wmKb84aa4XjCydLalTUH16JwIswXMbHOJuyEfYqCpd+wJqfAKi9TI42qqLtQp
 TUsNPmQchOGK/jBVrnW6CR0VNhtPHoA6jtKbe7+CBOcNKTO0LU6ew1ph8uY7GhPTXwJW
 rOHw6sMUCifxrc85mHeiGC21RJHDX3Wa/sZUCKJVa+119vs6tMR9EiEGoAT1WHNXH4J2
 EKAV4u6384V4KW4L9fQNxYsGwUheHn8x+MSaivnCwZiodoEfcbrsKM+za8sc4lmIUZ0M
 d4mNZNy5P2FSoaNfweEnl3XdyZackOePyHgHFfWEZDGSFR2imMTJmsAQk5dz7VENQzjQ
 hhIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eJyy4wmK
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.20.0
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

Release notes: https://github.com/timescale/timescaledb/blob/2.20.0/CHANGELOG.md

Add the PG_PATH variable to ensure that CMake can find the "pg_config" program.
Otherwise, the following error will be reported.
CMake Error at CMakeLists.txt:85 (message):
  Unable to find 'pg_config'

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 3318d4614f..4ca325b2d7 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ef2c9019f3e292f77e274a95386e550cb8c358ec0e053f6b7097565f61381e01  timescaledb-2.19.3.tar.gz
+sha256  b6ac4c29ef29e93249fcc25bf193dab2637422797360b12e00fd73067138a953  timescaledb-2.20.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 024a72d4f4..00e2eb81ea 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.19.3
+TIMESCALEDB_VERSION = 2.20.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
@@ -23,6 +23,7 @@ TIMESCALEDB_CONF_OPTS = \
 	-DPG_PKGLIBDIR=lib/postgresql \
 	-DPG_SHAREDIR=share/postgresql \
 	-DPG_BINDIR=bin \
+	-DPG_PATH="$(STAGING_DIR)/usr" \
 	-DPG_CPPFLAGS="$(TARGET_CPPFLAGS) " \
 	-DPG_CFLAGS="$(TARGET_CFLAGS) " \
 	-DPG_LDFLAGS="$(TARGET_LDFLAGS) " \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
