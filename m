Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D50C021A4
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3334760B49;
	Sun, 16 Feb 2025 15:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hv0etfMMeTIZ; Sun, 16 Feb 2025 15:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD4460BAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BD4460BAF;
	Sun, 16 Feb 2025 15:35:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6318CDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 479A060B5A
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5kMQUmTAK5Q for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:35:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA36F60B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA36F60B07
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA36F60B07
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:08 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-8691b23d129so91793241.3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 07:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739720107; x=1740324907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9kR6wY6DEL9Jd3lwg61MzZAfJcenjVaSloT5C7rHFTs=;
 b=Rbyg7D/keoV/ZSRd11zJFYcTuNPwFNj+5OBjxq66jenQi4u8YWnFA/4GXrPa1xrFgG
 sOma0nOqGXFJA6RaeLvxW1kePK13L7usfXrzIapRFS4aX1Z84W6Hc+c773zwU/sGQ0iJ
 D4QEVLGEm3r8jCleKpN0sEd8usGXO/ifzzU+VKoBH+/VgdYeZdzex8NK5EOTQABMT4Jq
 cRT7vOegkh4uK0zyZ0z/EO5A9mj39oDlvvKRjvVK1dVwUzwDonb5DDz7PGtnz8arSWn0
 fWgsDf0kzUIlXhnreanoCjDSmbdgIEDVWeGaJpt/R4HtV+beI7/M6qXpt1vPtPBFCMxB
 KSLQ==
X-Gm-Message-State: AOJu0YwRIdX7oLDGIUbAqPiFJiV5GD9xwxW/Mdcl087OohGqegCtNbzf
 MCnlKVY/+DTdHf3yyoUIntZLIv5ujohU/83R7omNhX3JfREkYHEPGVD9AQgb
X-Gm-Gg: ASbGncvR3VDTz+vWBqwU0B5vknqbr2XHyDcrKXwON5WtJanZQxj93zEN4+KsWdbJ/Tt
 y2ASm8Tjg96sCoB0MPu2IwNqK/8oeSnisq7IScGjUplyEzueNKHH2Uh7nCWj4X69dWXHixA4SAZ
 avidTPljDGz7/8EjAR//jvYeLK0Q8jZ62XBvbTtkR0uQi4H/8rmBq9st60t6RJMCjWIMzV2LBTG
 8H9hqrlieHVOt9F3kDUN1h8ftmrGCxCfsr4/vAOOz0TKrmssiZu1dhPNBGz/BsjfbQIZ6S77XWW
 3+xeTO4mSqp0X41zwDruMm7pGBPxrOT6qz6H
X-Google-Smtp-Source: AGHT+IHdxLRHAJRiwC4HABwssJ5iEnxPLULT4UEc9l6dEEUv0OJWuFl6tw0VJksX+bhd1TwdQ7aQKQ==
X-Received: by 2002:a05:6102:4b04:b0:4bb:c527:aacd with SMTP id
 ada2fe7eead31-4bd3fe2d1a9mr3585551137.23.1739720106918; 
 Sun, 16 Feb 2025 07:35:06 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:69c6:af1e:5931:a271])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e8548ae3sm1528875241.2.2025.02.16.07.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 07:35:05 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 16 Feb 2025 11:34:38 -0400
Message-ID: <20250216153441.2706067-4-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216153441.2706067-1-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739720107; x=1740324907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kR6wY6DEL9Jd3lwg61MzZAfJcenjVaSloT5C7rHFTs=;
 b=Sgk495DYU+TnSt7cmOr5CwI7NMbYFNcI/NcV2lh5LARQm28N0kJlu0iAtjNwOwJC9u
 EwHexkcEKD82dZoq44IAHIsPcXFIj33Ymcd+TDrl66SUpYOQgj7DOAa9UumjdqLXOS9M
 HOZtyBXn3KfZmWmTFWqdu/KkL9SgnlqhmnBefSwxJANWcnfqYFGp6jJskw3Pgfg8niKk
 lQOjittwyBiFm2nIhWcWSQutxW5eOrR9E0UnccXihdiORQB7o1PmjeRwGitlMm5LKqd7
 IRR28W+gjGdh0T1aDC9fiM2wIo1/pmhhaBe5eP9WvAfmYtzsC49wzplqTYQjI7jNHMo0
 oz+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Sgk495DY
Subject: [Buildroot] [PATCH] package/restclient-cpp: bump to version 0.5.3
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

ChangeLog:
https://github.com/mrtazz/restclient-cpp/blob/main/CHANGELOG.md

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/restclient-cpp/restclient-cpp.hash | 2 +-
 package/restclient-cpp/restclient-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restclient-cpp/restclient-cpp.hash b/package/restclient-cpp/restclient-cpp.hash
index 96c6d6c9e0..55f3b3589b 100644
--- a/package/restclient-cpp/restclient-cpp.hash
+++ b/package/restclient-cpp/restclient-cpp.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  d62ba618f9a938652fd53b483289e8662a99451839e59058c8beb286dfbc65ec  restclient-cpp-0.5.2.tar.gz
+sha256  ca450e15d9b9724234d234686f22862eef97b776cbebb433382830974949d6f2  restclient-cpp-0.5.3.tar.gz
 sha256  1c2f79e825a39eb61d8919044776627f4d079ff38975410a3bde340154fc94a4  LICENSE
diff --git a/package/restclient-cpp/restclient-cpp.mk b/package/restclient-cpp/restclient-cpp.mk
index 1ba9ed8139..6a0c8627af 100644
--- a/package/restclient-cpp/restclient-cpp.mk
+++ b/package/restclient-cpp/restclient-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTCLIENT_CPP_VERSION = 0.5.2
+RESTCLIENT_CPP_VERSION = 0.5.3
 RESTCLIENT_CPP_SITE = $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
 RESTCLIENT_CPP_LICENSE = MIT
 RESTCLIENT_CPP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
