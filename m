Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2AC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06FBD83EE5;
	Fri,  5 Jan 2024 13:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06FBD83EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTKye6uWjrrB; Fri,  5 Jan 2024 13:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA2D83EE0;
	Fri,  5 Jan 2024 13:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA2D83EE0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2EF51BF30B
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8F104221C
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F104221C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTJcdhXF8d7Q for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:31:17 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C591F42207
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C591F42207
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso14879085e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 05:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704461474; x=1705066274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yDX4rNUS+IfdfFY8MuzuYbIpWmbgF47W37i+BZI0nMM=;
 b=jMbKVXaKrviZzwbQ4k0Sr4NDfIrQOR7O/Kub9Iq5qYB6prexfVyDWJ4hMB+5XL7PyK
 4MwI/HzdyPek8jNwoUyoepA9jfIfOluuEwfYu98hVTgLC3no61Dd2V7tGWrgh0r57goG
 qVySncqidTwQltoXmRUMDf+c9ht7FmC7tjrl029BAAtsGmOVV421rR6RyAoPskF4NXiz
 geYz8+vBxOhHB0YQZK1xKk5jDdcBI4POcIlL6oQygRUzrZEfr6C6oow6QVeptBbJs53Q
 4Nv7svaKnzjCxYS5oRPa9n1jmTxTZZTxSI0kfT0o9XpQ82qwiRexwg9dxyQr1XVyt1Ra
 x9zg==
X-Gm-Message-State: AOJu0YwOwHvuLqvX2G+hkxvBNSW6wJBUgca7m+Bqg5/0Lc9znAypUNcO
 zdGIvRk7kMvlPlexHtVVM22K9z0NChE=
X-Google-Smtp-Source: AGHT+IGzXVXHiiayJyAhPiztToPcgivdMaoroCewuClt4cAkrnwLirZw6JqItE506wIo3YWj81FqrA==
X-Received: by 2002:a05:600c:1548:b0:40d:2dbe:b124 with SMTP id
 f8-20020a05600c154800b0040d2dbeb124mr1108166wmg.87.1704461473873; 
 Fri, 05 Jan 2024 05:31:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b0040d8810efc9sm1600850wmq.17.2024.01.05.05.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:31:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 14:31:11 +0100
Message-ID: <20240105133111.510172-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704461474; x=1705066274; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yDX4rNUS+IfdfFY8MuzuYbIpWmbgF47W37i+BZI0nMM=;
 b=Nu2Cb0sK+YALDKMd33gxGqAZ1bYUYdQrxqCSMN4v9ifBXbmSyH5X0Kt6L/uPqP83Sr
 h57b1Vov211CExBb2hRhYKxUMTBSKxgeCWJIv32XmOh4VZVn6kor85ddLfwZURmicmFD
 eyxPUiH1OXrpcsSZq56Dd+Kpj6Vxm26C+UByL98qzmzQU7bru1Yk/T8ph7xfYdolI+lN
 nSAx0t1V3fgXlI5TdbAFzQkCOQ7tsQ/pkfGoyAxYy8DterR1mVogtlei06Q42nItB297
 HgZFmskf7hcmKEpJY7wK1BO1dWpkkoP4iMNrmZzFxj5UHlsqtoTBvdbILIbOaUoCOd8E
 /IfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nu2Cb0sK
Subject: [Buildroot] [PATCH 1/1] package/tcf-agent: bump to version 1.8.0
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use xz tarball

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcf-agent/tcf-agent.hash | 2 +-
 package/tcf-agent/tcf-agent.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/tcf-agent/tcf-agent.hash b/package/tcf-agent/tcf-agent.hash
index 3ff4d9a546..34893d280b 100644
--- a/package/tcf-agent/tcf-agent.hash
+++ b/package/tcf-agent/tcf-agent.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2f8c7be8a0bf7c86c72fd5680bc19a9e8f98792d40c94a0fee30ceb6428b8f33  org.eclipse.tcf.agent-1.7.0.tar.gz
+sha256  64131790c7d4636d4abff8516d5b4b6329e4d3e691f44dc604e2c30f55edb0dd  org.eclipse.tcf.agent-1.8.0.tar.xz
 
 # Hash for license files:
 sha256  f82d01b74a513bd3504d08136026a5ac2a7e6ff62ebcde391fa74aa222d11ce0  agent/edl-v10.html
diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
index 2b8a61b66f..9d955d4b6f 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-TCF_AGENT_VERSION = 1.7.0
-# the tar.xz link was broken the time this file got authored
-TCF_AGENT_SOURCE = org.eclipse.tcf.agent-$(TCF_AGENT_VERSION).tar.gz
+TCF_AGENT_VERSION = 1.8.0
+TCF_AGENT_SOURCE = org.eclipse.tcf.agent-$(TCF_AGENT_VERSION).tar.xz
 TCF_AGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
 # see https://wiki.spdx.org/view/Legal_Team/License_List/Licenses_Under_Consideration
 TCF_AGENT_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
