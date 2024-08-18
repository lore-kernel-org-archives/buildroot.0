Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F68C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 19:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B74C40021;
	Sun, 18 Aug 2024 19:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCgVD3Vav3Cp; Sun, 18 Aug 2024 19:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4704004A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D4704004A;
	Sun, 18 Aug 2024 19:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF3B51BF3C5
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 19:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA30860602
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 19:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8eQmNLlJSHf for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 19:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A303C605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A303C605D5
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A303C605D5
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 19:48:12 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f189a2a7f8so37746561fa.2
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 12:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724010490; x=1724615290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHVbBHB0npPnC16dAok3ei9k7r60q381NEHTXCD1C9E=;
 b=aBVEo2qcnxUZ0aIaArwOe7AUPAdZ5hInqJwe3YGviKclMknlU5UAbIak+pGvq0cUMS
 Ucm/c9mUB5Gr3pBXKg+GgtrRXDD/ZIF6cVrk08cScFYqXnNG3fW6QmlOf27VABZ3bNYe
 8PlsoWNPQ5cR6MsPxM3VelW6U6ENhhznEL+MTGnuw/CLJiEsvOvP8FHay0m/oZqf3S+o
 ELLpYgb3dGOuZSTD2t0HwdQEuixLqIJ8cfO0UUy+616RVkN5D2U7FKEJAxPqRFDnW6QM
 yEm0ptTTRXaEFl9Tv5aluZIuyPeI9fxWs3jL7b/VR9a6o9V5rUcTqazcy29vlZCdObSh
 dHOQ==
X-Gm-Message-State: AOJu0YydmhgS/C7PjxhdQT18XVegSaNpTA1bVhxnFj+4JhmwqVxx1gj6
 HqiTtnLf1F0d+oMx282QRMfTKM3T2oFKQL3HMFyyLAJPMH9Wdg20yMfLYEhx
X-Google-Smtp-Source: AGHT+IHkRjx/Je/s7IxUaROTyF74yacDrBqfIeLlpwLs2EZ7CNIITRUwmsQKMEXg8ZegRLV0DUGS2g==
X-Received: by 2002:a2e:91d1:0:b0:2f2:9f39:3e58 with SMTP id
 38308e7fff4ca-2f3be614169mr50080901fa.48.1724010489441; 
 Sun, 18 Aug 2024 12:48:09 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bece947f46sm3364875a12.18.2024.08.18.12.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 12:48:09 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 21:47:50 +0200
Message-ID: <20240818194750.818808-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724010490; x=1724615290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LHVbBHB0npPnC16dAok3ei9k7r60q381NEHTXCD1C9E=;
 b=Hoz+ZHjERwTwG8y3RUqRtg5VFjigm3Nms/9Wn1dykoF0jBX038XnNKI8P6L4SYTMuV
 inpFrUigmK5HohFqg6Rdr5ELBGRC2xI4xD8ukGnsQ6SSMRnmknLemVrug1SLaGgpFlsV
 JvX3d1HCFrXeV0XOJzKnxW/29fTQQmjyIhmugIaNlVOrk4ezAiTi0ijFrAEhHy7wSvxI
 eKJPsIP6N6qojMyswtsRH4fsTclbiKLQk859nErJBZlqk4bU7SQAfgo6ckLahordJYKV
 fPxjGFd+o7ZHIxlufJwUXqeeXdJe+bPI6mJd9fsUdjnFYP5rBdZrp3lLS+r4M+lmdxwx
 9sdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hoz+ZHjE
Subject: [Buildroot] [PATCH 1/1] package/fping: bump version to 5.2
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/fping/fping.hash | 2 +-
 package/fping/fping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index 4671cd77cf..8b68798409 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1ee5268c063d76646af2b4426052e7d81a42b657e6a77d8e7d3d2e60fd7409fe  fping-5.1.tar.gz
+sha256  a7692d10d73fb0bb76e1f7459aa7f19bbcdbfc5adbedef02f468974b18b0e42f  fping-5.2.tar.gz
 
 # Hash for license file
 sha256  6051b27e4b4a648f7bc8b329024da53a6e95ce88fcf0ccc259c371a74b741757  COPYING
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index 5986d05b93..dc43261be8 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 5.1
+FPING_VERSION = 5.2
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
