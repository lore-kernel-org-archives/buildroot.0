Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A75AE77188
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 00:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBAAA41127;
	Sat, 11 Jan 2025 00:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJseIii3y0LM; Sat, 11 Jan 2025 00:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4704061E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE4704061E;
	Sat, 11 Jan 2025 00:28:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2986376C
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 00:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ECDF608D1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 00:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxFvnmGY2Unh for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 00:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06B24608CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06B24608CD
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06B24608CD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 00:28:07 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2f4448bf96fso3451685a91.0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 16:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736555287; x=1737160087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wVMCjr4wXkudH9cjNG1wMTLZyRntcWVzR0OLtorve7U=;
 b=s1yjhPzBXfezEk5CdXtZLz2WRtp8Z2XARjlJCFkeTVenm7U/kU7mbSf4Ny4chQ+GWG
 Vx4ihmvQxJSfhZ47iF+pU9Jr/4IzU4iSsj4oBJ3gE6mZDQn7WlX9KKNgUdjbjsHJlgZf
 Pe7u/rLyv4lOCLBzEh6Rs2tf/hrVb/9w1NM5Dio8JgVt1E74Ctmp+QmyBioOZu7rWo0b
 yLGIerqFG9SXjOpIPCMGT5DJSfS/P3HIgRtnPBAEpTljrE5nhwoN2LbwSGbStaQzmLSD
 WnwiMw1pDooBLcbvwlhycewlQUEmnsb4FBuoE0HdTSlwvlB36xPegsjlcw48hKrsBNcR
 hxQA==
X-Gm-Message-State: AOJu0YzKS5KAEBUfFKlb2dZrt//UPlHskNer242PoLhIZFCJsq1Zu30O
 QsQrpquIWJ6ENjDt05U+hj89cuQE5zD/vwUX7Rib9Um5Bcyw8nILP7TErtUn
X-Gm-Gg: ASbGnctMXy7MrawvYvDRwTYImpTJMVSKWQcSWURmwARjO/l+UafTUZu+uymThsblpHK
 B1XlvHy6OdbEmyg6Rk56tNRkexbtZ9yuCCCgyss59Rgri6vVegD/BivZLPKfawpWeJ58B5mFzCb
 7z9YcjhzDmhsidrlQSoeSTvT5rfcmgqhlza1oLfJ8giMAyYc7jFzfB/jLtCBacUcXkxPosm73PA
 m9gSp8ZfqWIuRLEWwxhd08g2gDtl7PgyoZNGQDzZ5hwazLV4wPipvvhiiMSaE/+DyYSRAQsS4SJ
 OlTMlucGuE+2uIuSbptryr8m4MnLxq0qCu2b+5Tg
X-Google-Smtp-Source: AGHT+IEwcMJ5XbrYJkOpbGDUG6PZ8QPfJYwinEzcKrhyD5CHvk8q72PmmGX7qGbXcucn//H/sOYNmw==
X-Received: by 2002:a17:90b:2b87:b0:2ee:8031:cdbc with SMTP id
 98e67ed59e1d1-2f548f1ec3fmr15918502a91.23.1736555287041; 
 Fri, 10 Jan 2025 16:28:07 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f262e23sm18292365ad.253.2025.01.10.16.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 16:28:06 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 10 Jan 2025 16:28:03 -0800
Message-Id: <20250111002803.767877-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736555287; x=1737160087; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wVMCjr4wXkudH9cjNG1wMTLZyRntcWVzR0OLtorve7U=;
 b=RRxBkwRXJQW599Mk9XQKAULhcAlwZshic3eBJ6Svx4/rShH4enDA8ujAyeoLlqoMaG
 +c/LIwJx/Bc4oWatZfvgZVTGMs6HMszgYXUDFvSdEqNMUOamIm0pZuXiVUU6Qgh/aL3Y
 IT86v3IyPdTYftsKbinx4Z4oa7d2POoYDxVnFgnCrC5G4HexkOb5bynjQnmS1WgCmE6J
 fo7CO343dPmTRHJRkM1zZo2s5zjQHQgOVQZ8AvOUqjuf1miEaLCSGsObYur/+Ce1mToN
 LwYDtpAmCGnHVIep4fuXIkiyCjOHP/vv8RhfCKN7BeYGHushdthaiQQjY5ODM2WfNcYt
 /Nrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RRxBkwRX
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.21.3
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

Release notes:
https://www.samba.org/samba/history/samba-4.21.3.html
https://www.samba.org/samba/history/samba-4.21.2.html
https://www.samba.org/samba/history/samba-4.21.1.html

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index cf97560e54..144894fd60 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.20.6.tar.asc
-sha256  8fe37f9e7817b6583fa55a0a15568b8e6be8875513741312ef805484b102ccf7  samba-4.20.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.21.3.tar.asc
+sha256  ae2179a613e7a5d4088735ab100d4ca1cae0f92374d6307e22eaec13ad90125c  samba-4.21.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e5b348a3b7..70200279a4 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.20.6
+SAMBA4_VERSION = 4.21.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
