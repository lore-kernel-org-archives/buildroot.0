Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D7BC5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 07:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622C080D75;
	Mon, 26 Aug 2024 07:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upmHOd10xBgF; Mon, 26 Aug 2024 07:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5B980E1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5B980E1C;
	Mon, 26 Aug 2024 07:21:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14F731BF29F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 07:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02C7540200
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 07:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LnyTEZxTMw5 for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 07:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2899401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2899401D5
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2899401D5
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 07:21:24 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7cda2695893so1180620a12.1
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 00:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724656883; x=1725261683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1kXPdMsOM5RI3ZZhKSdQS9Nx7UjYFuMcPraotUjiloQ=;
 b=HtkRZ3mFZ+SOdatVfl3lGHCeI7dQL7UhUqtF1txsefepYMzPtbdzOVN1jROm+QyMSA
 hrFk544KCAmV5eV+SjWZgHbKmnF15X0rgxsb5FmpR7GBRTKIpMS4fjv/T8YL+w5ZMpwQ
 Z0L2wQw6pDYIZHPr3ue6PbIYl9dw6UQ5sHmpu6/Lf3WR+0KHMRDAw3cuipiJBtAiTZAM
 kzqZXdP3ZIX0OeGG9ZLSuTdzXZZU8HHk579/xpWFlJOpQTOw5GLG96Lvh2P3uZ6J23je
 rZB+2K9eYToVv+x9Bm/aWHMwUdmvFvpC/6fNhfhBsDC//IhdPnN6AHxAi2FFrWjUHWuh
 ugbw==
X-Gm-Message-State: AOJu0YzUbla286xi5dZjWXgJ1Ax82VBWDaAVqYqFBsHH+XHB0xUb25og
 vIqnS+GwteSW147RsZcQc2X63OMqimERVqnxAlYvUUgIz9iqFF/rsRz+pA==
X-Google-Smtp-Source: AGHT+IFeyzxKlKd4ech7E55M/yuaz66ydhej6vYHRTSjSY2eV695vPMgGC8kyLO/u5/nROJY+M4QCw==
X-Received: by 2002:a05:6a21:3983:b0:1c2:8fd1:a47d with SMTP id
 adf61e73a8af0-1cc89d293e8mr9333100637.6.1724656883417; 
 Mon, 26 Aug 2024 00:21:23 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d613af1468sm9005267a91.44.2024.08.26.00.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 00:21:22 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 15:20:47 +0800
Message-Id: <20240826072049.719043-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724656883; x=1725261683; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1kXPdMsOM5RI3ZZhKSdQS9Nx7UjYFuMcPraotUjiloQ=;
 b=iL6lgAQ61iQNtZ1nbhD5Bgdd++beno4zP95LVaoS1xYKxFrktnJYfcMEx83xMmfUYH
 Z8bmqaywS2eY94ipcQ+WiAs7zE+TqT5ZZh5wvZ7EXmDOHg/Osin9MJIqRw53ek9zs5Ev
 wpVp2/cPOeL5kVypavELCgOdbbY4a+Nq6rvJ5OPH5/HMRvFYqLZjVIlCWX+xaSsOP9Xw
 hIUcxDoBOTW5KUYnipzdLLLNq5DD3vv5D4M7NmPpLvmih/s1jpk8yjA5A1U6/pj2wE3X
 +6foCtXeIJ/luRQgOnXzUe3Rpy3i1F5Ln4QMXyfGwGEKe7OGIJ3bF21mNAV+WThGkS+r
 Kxpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iL6lgAQ6
Subject: [Buildroot] [PATCH 1/2] package/postgresql: security bump version
 to 16.4
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
 - https://www.postgresql.org/docs/release/16.4/
 - https://www.postgresql.org/about/news/postgresql-164-158-1413-1316-1220-and-17-beta-3-released-2910/

Fixes CVE-2024-7348:
 - https://www.postgresql.org/support/security/CVE-2024-7348/

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index d917a03ebb..1d9a9081b7 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.2/postgresql-16.3.tar.bz2.sha256
-sha256  331963d5d3dc4caf4216a049fa40b66d6bcb8c730615859411b9518764e60585  postgresql-16.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v16.4/postgresql-16.4.tar.bz2.sha256
+sha256  971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f  postgresql-16.4.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 0a1d98079a..4021a54300 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.3
+POSTGRESQL_VERSION = 16.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
