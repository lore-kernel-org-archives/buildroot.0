Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E262C369C2
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 07:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAFFD60846;
	Mon,  5 May 2025 07:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSgeoKsmmPnk; Mon,  5 May 2025 07:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D968E60825
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D968E60825;
	Mon,  5 May 2025 07:51:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44835EA
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33D944070B
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdnjYfRezlcc for <buildroot@buildroot.org>;
 Mon,  5 May 2025 07:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27916408C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27916408C7
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27916408C7
 for <buildroot@buildroot.org>; Mon,  5 May 2025 07:51:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso22960515e9.0
 for <buildroot@buildroot.org>; Mon, 05 May 2025 00:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746431496; x=1747036296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i5IAk/43JerCVAFIQqvfhaITmkE+4W7nQa6cMB8AwjM=;
 b=jssaYvW53CNkvagD0YCui7qnozusLgnW/tLM6eLtfeel+QPNwVDIPQH77RqkZZdgv/
 ruKmrGxnEbgKRn1QE7qz4K2CmOeI5fAdJmE01Qe63mn/KDrxRwxz9ZmN3I7cgaGhtdIr
 RvLauPxI4u1QnzoA+0b2OndzpE+ScbNo4Pal/7I70ph011KE5Ofxk2YhMr+rwj3/Tp3J
 9dQwAkRF2S14rP6y2D89w2z9pOhcX5ZSE0eMSMu1ZABi6Bc9CTWYWSZFpqm1ht/mJSZh
 SOCurCzQSAnII3UYXrnlS7GPq3XTrHlFe/fzS5HK/rdRI6wenrHyHS7XNEHGlEtRnof0
 OJWA==
X-Gm-Message-State: AOJu0Yyt/b2NyM2Cy1Qi8UEh/GHvtaQpoT9MidBLDknAr6IBf5KBthuI
 VllEelcLEkTDByJpIvuf07og4pKH82fYmc6uAvNYt5cko8HQq+4zqieuaQ==
X-Gm-Gg: ASbGncsl/UcHM/9BQevj/J8nNzJx6V5TL5ynYC9w9NFSiqLzXEwODZjhgNsXwys3qP9
 wR0hIC0jLZ+T72fN3KiNZ7/mjMRBWORn1q6G5swjwdZMS87DLrewZrt4RsQzkrDIp+VUIvDNugU
 gV1B808PKmP5LtbOm8lqKf7KJ2qcYmJf7Oujs02a89U4oaDphB7jQCMtiyWSduJP03UR4APzzeK
 O2xFB1t5nvVpZTDtmiR5Ds28lUqrHT7aEzZDcrolCVIUpk5F8soNau0/EXVkesUKlLpoKDtwQuv
 Rc2+WwDqLfUytZ5T+VYLbxkfqUjUIV5lt8/VImkjHB5iiGkk/YqN3/4cugkE6FBaMF2euaEMFTy
 GLZER
X-Google-Smtp-Source: AGHT+IFU0NdU1jbZba4K+jJzdC57tzY/29opLCD8Upct7Yt4w1X7iNDOK0UJwyx3CmRf6gJhQgjtrw==
X-Received: by 2002:a05:600c:3492:b0:43d:683:8caa with SMTP id
 5b1f17b1804b1-441c48dc057mr60414265e9.15.1746431495802; 
 Mon, 05 May 2025 00:51:35 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online ([207.188.149.64])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441ad813a64sm171191775e9.0.2025.05.05.00.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 00:51:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Mon,  5 May 2025 09:51:00 +0200
Message-ID: <20250505075105.848775-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746431496; x=1747036296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i5IAk/43JerCVAFIQqvfhaITmkE+4W7nQa6cMB8AwjM=;
 b=fDN74Yzx8YbeGXA7YCbtr1hF3FuMDsEHevydE9cF4u5tDHBOYGhItCMh6k1pBYE5aM
 ELD6cMNwdCesKyJQmKryB3x4Im5qr0MFtZ7qL8DMkxsctfrHlR45VgzXJngU0gcHMPBz
 87MhcLWtxIEgEkxyc6UNvcNBtpt2ZO9eMso48y2C+A0UCPGrdSvtd43ftevMJRCan2X9
 IfNCdqmy7p4cgsmlZurQ57+W6Vn3k3hp/GQvGH/YUQ6lLBT2MxbJbUb2qkeMeftynG4G
 bf5tR1K9aNeexpR12nVr6cTPE6oTJ7NMwbsMhOhFLw01O8aUFUKJHgXkKbzpKWun1KIx
 8MNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fDN74Yzx
Subject: [Buildroot] [PATCH 1/2] package/zfs: bump version to 2.3.2
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

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.3.2
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 3640963bdb..4c607d84a4 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.1/zfs-2.3.1.sha256.asc
-sha256  053233799386920bdc636e22d0e19a8c2c3e642e8bd847ff87e108f8bb1f9006  zfs-2.3.1.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.2/zfs-2.3.2.sha256.asc
+sha256  80da628a9543ec3355bf410617450e167706948ceb287541455a1b8d87b8758a  zfs-2.3.2.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index b2edeb1268..bdd7b2a3b0 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.3.1
+ZFS_VERSION = 2.3.2
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
