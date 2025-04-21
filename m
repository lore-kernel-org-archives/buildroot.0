Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89E8C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 20:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1D780B86;
	Mon, 21 Apr 2025 20:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-S2ISU29ChW; Mon, 21 Apr 2025 20:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F5C80BB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F5C80BB1;
	Mon, 21 Apr 2025 20:27:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ABED1BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20640403A4
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7itImCOSYVV3 for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 20:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17175404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17175404A8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17175404A8
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:27:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so46764065e9.1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745267249; x=1745872049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UsZMcA8IgC+iuuw5CmGicyKDHJSPbqU9jSQ+RPLdLOw=;
 b=Q+H1IpJPzDYRuU0fpEALpoY5WgLu4MLZG/IjETXsGwA6kbWuzeiyb+UM+ZFiysGl23
 /qO5nFV00OUjBZ55IpM4aPyZnQuP7KVW6KJgcnYWs34vVAdXSbz/9Pj27VoHXEyK91gW
 4aPo11BXoktc2HgsM2RP695/Lmg7TKGs9SQGN2qUcmNPtOfQxPnENqXnvpRn6xx6tvLy
 6eVB7BZlLMxWwVzz+pk4wzpG7be/fQs3wKjyWRRLejUKAY4FgbDEwtufpDhdvA4n55mE
 nH0fwyi6vrdbXjV51UvhUlhKC6fWSH7ibttjltObu/TZeh6d2jpC11Fo0RwDRSK7RB6T
 dTjg==
X-Gm-Message-State: AOJu0YwF6OIb4cBFkSrHzVu4SxbhzOTTEqJz2Hzc1SNMvHRuSicQ6rHb
 OGAOnRx3+B/XLInAcbbfXEpREwWH7Zgsl5jecyHQNfHmdlhhSQ+6vh4Eow==
X-Gm-Gg: ASbGncvdZQNjPE9TYBZHjKmzyPlrHGD1ZzJPce+VQO236uFOv8PoB8DIErWQszvnTiE
 48/FkEvdnHkSNaSNN32nwkhBRW+kgAmVHoANZk3SHunDt+4NjDvRxNu9fjg808jJM440stnj16E
 9TkHDKeX6fGvW20drPYVfknlPGQ/5QvsSEGm2bxrNVM3fdbr69aQKgAmWBN2maIBm2TkgMQfm+l
 b1KlE3dTbBSHVFf3xRhI6XAWtERnXKKve3+DMRMsGIpfs19Rei8/BDqMLHTqtnL3dyEVo5hNvpK
 2UAbjUwBfFNnRmUCCcMd3zn+gWQz/StWA3c23pWJhsGkUL0sofDQ8juE2euvF2euNvbme5zY7FU
 R+w==
X-Google-Smtp-Source: AGHT+IHWFDk2ksws47y442evtGPKlDG/aabY6ldkpw81qavh2VdSkDZ+an/N5kNDbxaS79YttnRQrg==
X-Received: by 2002:a05:600c:4e8f:b0:43d:b51:46fb with SMTP id
 5b1f17b1804b1-4406ab66eb4mr125687035e9.2.1745267248628; 
 Mon, 21 Apr 2025 13:27:28 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acc93sm148912705e9.10.2025.04.21.13.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 13:27:28 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 22:27:13 +0200
Message-ID: <20250421202719.896659-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745267249; x=1745872049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UsZMcA8IgC+iuuw5CmGicyKDHJSPbqU9jSQ+RPLdLOw=;
 b=TQRHYY1ptmuSV9RzwDI9DagicCOn1iX9Dkld+0zinpJzQ658YNb/tEuIT0nsvjPU5P
 IZSzTv29oHH1iVSBtgb2nUCv8sQgMgT14APrKB664NirEmGNpj6YiPvSB/2gT6UeIOVt
 777UhORahZbMVpXFCJUxzCFjD0jHHRpyDnM4gqWXHq4atmWctJXp8I9aoGQJrwNd9hfi
 YxiflIn4SQYZvRlXtFJttMYAccmuu2pHxkTlCfOjA8/GrTFuBbTLwIHrKlhJ8gotLVML
 PsOoKc+1spNJiR/Izvxc1LEOm9BP7jZAXWNtLsaZSHoUGHdG2+WKIl+ehr/l4MtBlMx6
 IvOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TQRHYY1p
Subject: [Buildroot] [PATCH 1/2] package/iproute2: bump to version 6.13.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Build tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK


 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index fad4debeab..d64ff918c6 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  a43aa43338d882b44d01e549f3f105a92ae9feea32a82fae45a88e7a49302819  iproute2-6.13.0.tar.xz
+sha256  a6d23588150096591c3d00fc27a324a82ee71d7a1a9eea78df5df17ad9b8461f  iproute2-6.14.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 016b235469..3faa2235b8 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.13.0
+IPROUTE2_VERSION = 6.14.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
