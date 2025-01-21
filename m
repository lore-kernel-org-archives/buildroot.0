Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECFCC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 03:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA17415D4;
	Tue, 21 Jan 2025 03:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZ2_y7V8P6w7; Tue, 21 Jan 2025 03:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72BC6415D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72BC6415D6;
	Tue, 21 Jan 2025 03:14:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4329D959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 03:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 231CD60ECE
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 03:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeKdAX1iATUD for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 03:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=patrick.oppenlander@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DFD760E82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DFD760E82
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DFD760E82
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 03:14:21 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2161eb94cceso63292395ad.2
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737429261; x=1738034061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4uML0QBzkP72bJ6Eyf+WZx+xbyWviZMWpS8RjHMpldY=;
 b=q/QsihHcuHyWQF9fBfVBZltfYjymZsMUnvXQQ3Pg+3ydSofp7aiPydrMlYmESTLV80
 hszzps13pCUH9kPQScfwpcls+BqshT1GCJMLr+rF9SXOuJDOg2A0WWsm+2855F/uOtfN
 jyjbDD6WP0wFtqTJSPkUymWQNWp5UsMLgVziQfPne1KgfTCE0VOuhmwuHzvu9XsYi5c0
 19LRT2d0vTr4n4rMijrWXdQ5l8ngJ1sBbLFtpNAea6F5K46DLzysjc5lIXdN1JwfrkDI
 U4bUKI7JvCPlHIREurKile7xjXa+CX7JZWWywqB/+xGcSriJCm4fdRTb5utLJUUbS46q
 2nEA==
X-Gm-Message-State: AOJu0YzW2AGydEcUd8rXDbb6KbUaoxLwr5WSehp+MwjmueOZ1lJZx914
 ZYS2pyCxNSxx5YPg780tXQV1wmvxQ1O+LLl4uGU/1ongmLaKYSCQZ/A7bw==
X-Gm-Gg: ASbGncvxgBkCxyQ/wJTdnnIZQnJs/DOE1suUY9UWRlM9A1D9ZkG53pOcsByAfBJBxJP
 4Zyktsl2o+ZTwwSHF3vRUMFcFVwIo4GGIk1GikNGPVnSLdEG+Viomxl60pzgMWZBP4G1T0yHyp1
 ye7UGbcXRRaEUjZiQrRSsK2huvgy6s8BuGgcvMRNr9nVQG7CN3xdpAY5nsgUe+EMIXaC3bOqEGY
 l7lLTY0VqbO27iVTXs+bA9fioD1cVS5yeguEnr7G9D28I/iUIasAYdlOsBbdb4zRTyBxNZfbt86
 ZkAiJzD+
X-Google-Smtp-Source: AGHT+IFCMPS8V7jn6zmnK7/rydVVUO3REtONaOjhs7qp2QJkk1jJDrGrIp7P1Urrk8/DXqNwDBJmQQ==
X-Received: by 2002:a17:902:eccb:b0:219:e4b0:4286 with SMTP id
 d9443c01a7336-21c3558fc4dmr236040495ad.29.1737429260581; 
 Mon, 20 Jan 2025 19:14:20 -0800 (PST)
Received: from gtr.feiar.com ([2403:5814:e4c2:0:6876:9fff:feae:cf11])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d406cb5sm67891965ad.246.2025.01.20.19.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 19:14:20 -0800 (PST)
From: patrick.oppenlander@gmail.com
To: buildroot@buildroot.org
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Tue, 21 Jan 2025 14:14:04 +1100
Message-ID: <20250121031414.5907-1-patrick.oppenlander@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737429261; x=1738034061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4uML0QBzkP72bJ6Eyf+WZx+xbyWviZMWpS8RjHMpldY=;
 b=bxOFwEJiHWYx0/T0Og0E8JXqHAg6QzI4eOsXIaG0acaAzk2geYb83LDvAd6iIcODh2
 sZDRHOXMfHnix1QThTMd4IPNoWjpZlAz0BqROkPZG0tq/00HnI33Gi3dYolUT1iP6VUP
 +MOpGT8TN+Gl49mvIJ8ZY0o96LLucb6pRlIM0Y9bqMHvTkgdEeyK3vrBa7iZ9Js2s1Hv
 QO7STB2zBrwh6ygT+cgHW+FfsQzxju78ecKgXyMnUuT4nKODoBYio3bjW4pVXvRdJcIP
 Yl9Fq0wwLh91vP9HkOTjY1J8yYklXOjk36XIf60p3gov/9oGKfvAXBfuazxJmiUv9KeO
 bdeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bxOFwEJi
Subject: [Buildroot] [PATCH] package/minisign: bump to version 0.12
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

From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
---
 package/minisign/minisign.hash | 2 +-
 package/minisign/minisign.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minisign/minisign.hash b/package/minisign/minisign.hash
index 12cde42a43..74941163e9 100644
--- a/package/minisign/minisign.hash
+++ b/package/minisign/minisign.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  74c2c78a1cd51a43a6c98f46a4eabefbc8668074ca9aa14115544276b663fc55  minisign-0.11.tar.gz
+sha256  796dce1376f9bcb1a19ece729c075c47054364355fe0c0c1ebe5104d508c7db0  minisign-0.12.tar.gz
 sha256  d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b  LICENSE
diff --git a/package/minisign/minisign.mk b/package/minisign/minisign.mk
index 7cdce597f7..5cc8e14cba 100644
--- a/package/minisign/minisign.mk
+++ b/package/minisign/minisign.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISIGN_VERSION = 0.11
+MINISIGN_VERSION = 0.12
 MINISIGN_SITE = $(call github,jedisct1,minisign,$(MINISIGN_VERSION))
 MINISIGN_LICENSE = ISC
 MINISIGN_LICENSE_FILES = LICENSE
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
