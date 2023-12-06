Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03997C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 22:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730E741E80;
	Wed,  6 Dec 2023 22:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 730E741E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cK33Ak3N6yR2; Wed,  6 Dec 2023 22:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13BF41E70;
	Wed,  6 Dec 2023 22:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C13BF41E70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 498EB1BF296
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 22:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F3A661584
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 22:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F3A661584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lO1gZQUgd6wE for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 22:12:11 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40A156157C
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 22:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A156157C
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d069b1d127so2104485ad.0
 for <buildroot@buildroot.org>; Wed, 06 Dec 2023 14:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701900730; x=1702505530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4crNQCmchF+IXsEqSBxBR5N5mvkbVpNfZWTuVquvs8=;
 b=Cbrts6ARAiSxUaLKfHQaCYg9J+o6PVzznfS8EbysCL6ubsWZmvb+oiOPoCCGmYDDRU
 myyFsqOkOgrujzP3pqWSJ6NJm/9QiZBSSElUmqbHPiY091gGseVvYECvCdwaF8WD7AaJ
 0lBT9ZBB9ibNqaFFszHG5nY7+BpMOFW0NJT8ZOSOh7qbJeJYjbgU8tUSXV4EcrL8BQ0h
 WJwP7K3vpX6ul1WtpUSRe/rIywjhWRJsa9uVHodl2bCk7gyjyud6o57JA4E7vYkJlZiv
 5jxMV5Jaxg33ACAuZC3HSvB1wjqB0GjfTeldbfcWbA5KoqLh5BZNf+gScGjhLp2zoiA7
 5pxA==
X-Gm-Message-State: AOJu0YzOLv8PEMbn72pizSv6W2gSWzSdJ291iKfjSxNwrUeqm+kFHzjj
 AXgIN0ubBMYxUSexpFb9v3C6rh/3fc82WdslIXc0gg==
X-Google-Smtp-Source: AGHT+IG3eMRq5J8oW8vzQ8dij/ZIbuboSNXbYLvXDX7XpBYz6m1rX/Dwyd+FJ+6FoX2ZcGfhJLS9wA==
X-Received: by 2002:a17:902:f7c7:b0:1d0:6ffd:f215 with SMTP id
 h7-20020a170902f7c700b001d06ffdf215mr1339184plw.107.1701900730439; 
 Wed, 06 Dec 2023 14:12:10 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e5c700b001d076c2e346sm307974plf.51.2023.12.06.14.12.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Dec 2023 14:12:09 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  6 Dec 2023 14:12:02 -0800
Message-Id: <20231206221202.39468-1-christian@aperture.us>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1701900730; x=1702505530; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V4crNQCmchF+IXsEqSBxBR5N5mvkbVpNfZWTuVquvs8=;
 b=xP0ow93OFytVc3dUxXunLSSXT1fa8Am/PFD2BSZ1qbB7fg7BvSMvsY7L1DcMv8nNv4
 fBnWl76CdgKCMt62JrPtafooeAMA++w9CPqZtWo4YS68AfBdB0XR+fyLTCG0i1xFdkTO
 RbBI5vQG1wmiUURW6Zs4Tn51o3dzkQFVKIGeihxnoO8xFk3/gi/6eMIZX9zcPL6yyBx/
 f8bOYvjZDyII3xxgahC0wY3efZSmvsLN4lUziFoU4Msqshv16+ogvE4r+Jqx+PNp+PyA
 LmvQjaM5wUMg3MGE6ML00UUOqa3ZQLdeFpjgQbpgdd9iNtvJNSnZkLKiSC8xIi7inlDV
 DqpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=xP0ow93O
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to v1.21.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs:

CVE-2023-39326: net/http: limit chunked data overhead
CVE-2023-45285: cmd/go: go get may unexpectedly fallback to insecure git

https://go.dev/doc/devel/release#go1.21.5

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 74b18a9b38..34822b7537 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  47b26a83d2b65a3c1c1bcace273b69bee49a7a7b5168a7604ded3d26a37bd787  go1.21.4.src.tar.gz
+sha256  285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb09db19  go1.21.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 7bd7866a05..f3747b6473 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.4
+GO_VERSION = 1.21.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.39.3 (Apple Git-145)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
