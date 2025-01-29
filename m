Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561A3C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 07:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1CCD8110A;
	Wed, 29 Jan 2025 07:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTOOjuZA1-Iw; Wed, 29 Jan 2025 07:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 205C681113
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205C681113;
	Wed, 29 Jan 2025 07:33:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 579C5942
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 07:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4554E606EC
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 07:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPHJb9V7zTBL for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 07:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DCCE606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DCCE606A9
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DCCE606A9
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 07:33:26 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2f44353649aso8722692a91.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738136005; x=1738740805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z7wyejQB0CVtOIwqDcT7HuTMDP+AlspdrKNCLUvWHwU=;
 b=pwgu37Q87w8rK6uOFgIpgwUklHStK/CUTQcs4N28ni0wAT92fzlVSRb8ihHB1aiFQT
 YPiki216WiBPjsUTjdobWUqH31qOeOsE7ucdEuW9dvJWfy+PsCWpUHi/OAbu0qmG5ksF
 OZuk5c49DEVwrCB7DoikaSAUtI1niQfkINpw+c71weQ0ASkOUZYCzrkoT7LOauNm+zwD
 5EJqumXaoMpi7EXXogOQxEWw9EI4WsEeW9+osVKVAWcuy60h4Mvx5MD6pwb0aWPfVIyo
 TNXWwLf2Q1XaOYJQY/pOPxSGld/mqiNubo/xF9g9Iht+ihwlKm7hxFRVVCg1HFJpH8lG
 OiKQ==
X-Gm-Message-State: AOJu0YzbKoPQqpU7JG9UubzgfTM2sN9lgCwpRPm9po2Mk6ZYImU2vSjK
 76U/3tqlt468Gsqu6Pc4kv5j+Mo+Y0K9eQJcCJUaeCmxio8qNXQRn5AO0vuz
X-Gm-Gg: ASbGncu6kU+zBdrkyF4HhzFAaLnXwKLvlXXDrlNMqEgfv3XrurblBEqP6sq3F/E2Fma
 TgNiGATBm7mSqHp38QO3F8L5WpvsdnEGYE4FrRcneMIcdhSmMtY/D7A4EmQkMwROIHNGutkC8bh
 Ke9uylnsS+adNKdXcCHdKhn73iNt3rGyGZUte6L1hcBfxUrj0Y66lVq6PB+g3tuZ35Z5/grpizy
 W0/kNrh4ohXIQ8w3uDiqeo1Nd3rl4RUpQuEPmdDFJQQC9zRGQzWcbsvHiFYTMFpjLqpYq45lDEk
 PfDDSL/Z3W8GeM66A7m8eLT3x0uawJS8G5PP59VKrMdAc0g2BM9az20FBmwOhcSya4udLMdvbRM
 =
X-Google-Smtp-Source: AGHT+IHKQYSEttlOtGbGX7yQ7FYu3M5R1XISnlM0N45aSw/rfI00IIMUEdhqu0PmVXl2cid59cMLlw==
X-Received: by 2002:a17:90b:2749:b0:2ee:ba84:5cac with SMTP id
 98e67ed59e1d1-2f83abab6b5mr3429020a91.7.1738136005347; 
 Tue, 28 Jan 2025 23:33:25 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f83bfc0ddbsm875325a91.45.2025.01.28.23.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 23:33:24 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 28 Jan 2025 23:33:22 -0800
Message-Id: <20250129073322.5411-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738136005; x=1738740805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z7wyejQB0CVtOIwqDcT7HuTMDP+AlspdrKNCLUvWHwU=;
 b=D5MzoeYgrooKgDbdETtNNNxs0VfAa3sDmj/gOKs0ti9hRQUUBOHzwBtYdOLNpbIrbE
 SB1pZxkW5GeEBxi4g5ZgZs53WuLn58WZDqEFS8z70siTU+m4UuBeixKIYsJHIjj80cNB
 snNj+8W1z8SHisf+opeQ4GkgT6HHKSMNntlyss9rAi0bdr5S4YMDiqype/1fV85nFIx9
 GS4OW8GEt3G8CDnYw4VKstrdiPVDZFSHpExrlWtoXpPngGyf5rDdbp0GN2zs4DaUNzTM
 /W5G89DZamO64Oy2k4nZR34TeIkwdm0nJOh8HpJjf7qcbcwZ+feDKuJUsc5tAhfXoh/B
 CTNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D5MzoeYg
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.28
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

Changelog - https://github.com/pikvm/ustreamer/compare/v6.27...v6.28

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index e46411b5cd..d0f07475fc 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6089137576520e3162fa6574853a15da1a7605f7e9a550c2570b33cfe8a39046  ustreamer-6.27.tar.gz
+sha256  7b1f184e72d30e803ca928bc6e31f9e0fbbd17480a2fae78ed2ae10ccc0062a2  ustreamer-6.28.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index eb707cad00..112b29be8c 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.27
+USTREAMER_VERSION = 6.28
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
