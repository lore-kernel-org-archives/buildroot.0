Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03855C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 18:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAE8D60655;
	Tue, 26 Mar 2024 18:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9o--qU-V-pG; Tue, 26 Mar 2024 18:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7EF760B1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EF760B1C;
	Tue, 26 Mar 2024 18:57:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F06C1BF2B9
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 18:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3D8860A6E
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 18:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcMXdyqFh0E2 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 18:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F408E608CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F408E608CC
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F408E608CC
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 18:57:00 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so21880366b.1
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 11:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711479418; x=1712084218;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qinNzwMdv+mcjeLuGIqBiYeSULcGgesElEpGKQVBdlQ=;
 b=TjPANKqQmuThpQGRQLbbrttsmmC7MaQIcr2l3sgWx2SuoxO3oFeHEQfeuwsyoswFPr
 tFi8uXy5qaBoo0O1TjpxgpGcBJDlxU0FsWrYIp5GOxZm6wgErG6nJra5sStUxY2scAWh
 h65P2DJ3ApcbSwOwfTosQQJBfmfFap5xfSYQgVMAUbLbzU4mma/59DOcLs1a1Q4Q6kCR
 EKhpDQchAqoU1v1NjIE52hRn1t+QrULryd6WlyS1WbLgjJejaCUpxp2vvDYu8j9+SDCO
 qL8FYdaxqLZ9QRI7pyDtiQemSuTW3YzajY1qQkvIeScWFcaGQuBA5050TDJxyBB1wbnB
 WGgQ==
X-Gm-Message-State: AOJu0YzDT88Hb7Hl02qxn1iFkNhAb4it1hOpFm79/iX0Qy4TBQQqUZeU
 s/f/RYdLv+O8xH6QIqhOENrBHpjFzgdVIbqaMcnRQPbRvagscT8N0T6mRc4umpc=
X-Google-Smtp-Source: AGHT+IFiWAN054Q1dfirJA1nokZtElcMH4GNnB9gQrocucqGkpEBbdRK61yckUmL1nYAxLslbELirA==
X-Received: by 2002:a17:906:b305:b0:a47:61ca:575 with SMTP id
 n5-20020a170906b30500b00a4761ca0575mr1930899ejz.25.1711479417922; 
 Tue, 26 Mar 2024 11:56:57 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-0b5d-5c92-af34-2bc1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:b5d:5c92:af34:2bc1])
 by smtp.gmail.com with ESMTPSA id
 cb20-20020a170906a45400b00a4731c8f8c9sm4506103ejb.210.2024.03.26.11.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 11:56:57 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 19:56:53 +0100
Message-Id: <20240326185653.3656142-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711479418; x=1712084218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qinNzwMdv+mcjeLuGIqBiYeSULcGgesElEpGKQVBdlQ=;
 b=A8891GKNVr6+q/Hp0fGxvLqPJILl9y6/x5Wk4TBVSgE/zplEEv6MZvQvdD0Jcjr5L+
 lhhOGa0Ti3mBVa8oDNf5mQ57J5ez46RTvv+GrkOykZbx1TdZMP7qqww8gznTDYTXFl7P
 Px7fK0ckTuD+JC/3kZNR2funoz9Bkby/cTvKRc5OVeJBST5lXx85W4f09tIUQufqx5yX
 pfmxiAIV0JhZmV1/yF/Sey0bUfT1T9MWFahqOdMekZoBQsTZWwQH0Wkf5tBdgSsjCDUo
 YL+tRx8h+/TkAzK0VArMLm2otHLYfys/iYzQKbFgMZpQKVaSqSlZgMki0wQckrgEoONf
 FBFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A8891GKN
Subject: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.8
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.18.8

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 48c2fa8ffe..d8d55e42ca 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  995a77848e75737a267b64613acaa6096ba8943f048676d5722c3ff238fb29f9  eza-0.18.3.tar.gz
+sha256  32621dea52695b75fe6f6d24ebd19812b0491a852cb2a970382838dd798cc46c  eza-0.18.8.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index 7ec3f127b4..506e515566 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.18.3
+EZA_VERSION = 0.18.8
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = MIT
 EZA_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
