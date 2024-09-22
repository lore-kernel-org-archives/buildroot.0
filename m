Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD8CCF9C6D
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 819E3605FD;
	Sun, 22 Sep 2024 03:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kSfbIbxQPpw; Sun, 22 Sep 2024 03:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1FE60605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C1FE60605;
	Sun, 22 Sep 2024 03:44:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 249311BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01D2E40579
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n29OneMwvtmx for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDFAD4056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDFAD4056C
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDFAD4056C
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:44:05 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82cdada0f21so132453039f.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726976644; x=1727581444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OiigKfzKDidryZTlVok1lZQiDgzq+3hLqRGMI5niUcY=;
 b=fYWQHSM1TjEOwcrI9Ly3kJUAibtQ1AmPEhPeRMkOTIgnaARbZwUzPNttX5efnRhZ7e
 fkeEe0C/5YpeuItpD8h+mn/lBgwCp6iQtfNfHda/Sn+Oz1A3/CiJ38H2/YIN9rChY6Sz
 gPZcJSQDbPZS8xWhzfWf9ttKxy23z6jUSUmBtTQa1Dcx5UYN7m6zbNY4/DHnMurBc/4H
 ZWnuAnIGAaRkR3n05f1ZEHz61efGH0PnE6MTY0qeBHfeqO5rmvfJMzCxNvqeF1nh1vap
 rfV4a+yZC7i80D666sqcqus4ZJsq9bP8OV92Kb8teT4Twgczl6IiMlFmv1pKMgMtgX0l
 xVgA==
X-Gm-Message-State: AOJu0YwGUC77zs1/3xvstLuE4tD1ctZTioM4zI6PZTz+mg5JBlu7BUma
 gUdOaOZK6oNAvIwVh1ry5fzN2bCb1XHJE3CeHO9a8KygS2GZuRfwkCtTQQ==
X-Google-Smtp-Source: AGHT+IGxldhwD7RwmlCtYmuF5rMDQ41ayzEJ2Dmrus4iodLjpy7oV0sNxWsdZOnfAtJEL5o7jgv/Ig==
X-Received: by 2002:a05:6e02:1546:b0:3a0:98b2:8f2a with SMTP id
 e9e14a558f8ab-3a0c8c9a3eamr63848235ab.10.1726976644188; 
 Sat, 21 Sep 2024 20:44:04 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e72080sm51775275ab.68.2024.09.21.20.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:44:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:44:02 -0600
Message-Id: <20240922034402.850629-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726976644; x=1727581444; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OiigKfzKDidryZTlVok1lZQiDgzq+3hLqRGMI5niUcY=;
 b=AB8BXhjd8iw2SQEgdcKX5e5/t9KcQ79Hw6QvHdc4i62bX4AnNLQtzVDdFAUtD++GNi
 S3ObrBPov36q4egdMutZNKCvhbZZifZ9rbZ9dlXN/BfISAngq6hzR98ZSH9I+FfLYoxy
 Y5vREUNfwcA+hXARFrrALZq8EdmWR9xLiXh0h8W7Mqt3sRIlUex1/8bG6uw6IH09RjZo
 zHqj6lij957wE5k3POS6fn8lmhD5vaIOakNCYHBa8qBl6RdadKz6q1kNCaL/9lkXbsKS
 9tiPtWJCnJL/baobTx4QXQh8CS5rAHPCAbzLWHr/kpF8uCK0ZnZpGHCWaY8fj8vleJjF
 suLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AB8BXhjd
Subject: [Buildroot] [PATCH 1/1] package/python-tinycss2: bump to version
 1.3.0
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
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index f9b638df6c..abd9dc4b12 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  e8a06102e7f42ca791463f11ce7b814d  tinycss2-1.2.1.tar.gz
-sha256  8cff3a8f066c2ec677c06dbc7b45619804a6938478d9d73c284b29d14ecb0627  tinycss2-1.2.1.tar.gz
+md5  736b69f1b164da932028538fe2a60262  tinycss2-1.3.0.tar.gz
+sha256  152f9acabd296a8375fbca5b84c961ff95971fcfc32e79550c8df8e29118c54d  tinycss2-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index de26639587..c803167032 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.2.1
+PYTHON_TINYCSS2_VERSION = 1.3.0
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/75/be/24179dfaa1d742c9365cbd0e3f0edc5d3aa3abad415a2327c5a6ff8ca077
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/44/6f/38d2335a2b70b9982d112bb177e3dbe169746423e33f718bf5e9c7b3ddd3
 PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
