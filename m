Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB5CC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED7C140359;
	Sun, 18 May 2025 20:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjVA7ay7dfR0; Sun, 18 May 2025 20:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3692F403A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3692F403A4;
	Sun, 18 May 2025 20:57:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 878AF1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D61C40B30
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnX_lxtjsh-U for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A115640193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A115640193
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A115640193
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:57:12 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-30ea7770bd2so1837159a91.0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747601831; x=1748206631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d4ykKvgYfkvrRPoZfAYk0Uw97GEYPx9BTcWlp4jnF2c=;
 b=dURsTRwRlsfatwXNn4EIfQDbVuS88pRpOEWHOfl8ewk6XmLkmNebRLBefcEaFzUpcD
 FqyXPJlZzIlnO+3UsW3t19Myl+WMfWg5T7MSuNOp4uiqi9mcgjBa4HlBavxhGw+InTct
 YwLx1Mty17eSLkzSO+/++9tfOkRhiefqFC1Lq2fYHEhik8kX/eiXmkhiXXFcu+IfcaNz
 BfpqR0fQhtG+ApVvMTOBsVntiAQhZ6WEhrIOyVAnev0YwS2CfMhxH3srqg1JHnlwd5t5
 lq6BX1ztRZ702T4g+4cH07dXVO9U6OSQEtL1GAGpLErDYUsTYUuc5ysf+f0lx4LGaxsd
 zXdw==
X-Gm-Message-State: AOJu0YyiODggSL6BRs0arb13UvejaxuYIyL1W+AQty22FMYV/vaG8eB2
 mixxKAwdU8J3olsvGxT3bRtenC9PZAOYBMS0JYpGAeh9V6x1CwL3wro59WqeUOXw
X-Gm-Gg: ASbGncsBH5HicGYYPC0rwrDUYhQTnB6tMXIKkOL88weYpWGugntXb3K3W16FPrrXKkb
 gXMkZAu4yPJepwyZNUjbnDozfbumNCzZZ9LO0d8CpxSIdZTZD64QmFnDSyh/XMP15AWsWp0aLAt
 JSZNw2egTk3Msp9FzNjjzy25KU7vD9QUECEeQpnJn+XwUogtyCihjfky/IrvCfIAxZ5mUa4D6pA
 4sQyjaK55aTYvrgu9Ke0LTHjZ2SxhC7DxTmCGU07ckJzjrrLQjyaEww9IFx/Yab+fEhSSN/Rqac
 iD4ECFjI7+vhuw5pU6JoXDrZPVn+BNZL4lGwznjbo0Lhx0FnW8XNdcUDyh0kO6VHRJ0I/P271CG
 L6wAexmheZwDucnw+aEoyQQfxYmkZNa8ygg1I9w==
X-Google-Smtp-Source: AGHT+IFvottMpt42FitQhX1ELaFpusYTVpHzUds4NLSNA2hv40vUkLsYEhAvz/ygxnZtlhIbV0WeWQ==
X-Received: by 2002:a17:90a:d604:b0:2fe:ba82:ca5 with SMTP id
 98e67ed59e1d1-30e7d52221bmr17883247a91.11.1747601831369; 
 Sun, 18 May 2025 13:57:11 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e7d48a3cfsm5732381a91.15.2025.05.18.13.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 13:57:10 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Sun, 18 May 2025 13:57:08 -0700
Message-Id: <20250518205708.203005-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747601831; x=1748206631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d4ykKvgYfkvrRPoZfAYk0Uw97GEYPx9BTcWlp4jnF2c=;
 b=aJ+JtQJHK+eICdqdiSfhKFHdcrB4bt+qKE34d7IlsuRAVS0x0WB52bF0c6Y7iCfQDb
 +mpbdKc8Bzq2sYb7YY0Lh86bk6YyqR3Lln5zCS9aooheULQNR89TGAjKgBNjY3n99SQg
 PELX5+gBlvzytGczUya7y51Drx9J1kODXXZ+Bj/03Q/8FhO9xqrnfSH+BbCkdFbeNpe8
 FqfQEKTMxHeGOS4F8mrfltFQfn38SsbAXaTqvuZGkf3q6yoq87P/CRWT8SbpuIF/e++X
 zrMeMigRD/QTAXBrawjvQKPcx/h5+fO6hkfzhuJRqqxEII1Y8LEvH8D8x/pto8GDwjeR
 FIGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aJ+JtQJH
Subject: [Buildroot] [PATCH 1/1] package/nmap: bump to version 7.97
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

Changelog:
https://nmap.org/changelog.html#7.97
https://nmap.org/changelog.html#7.96

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/nmap/nmap.hash | 6 +++---
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 4f6ea20731..e9bce1a01f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.95.tar.bz2.digest.txt (lowercase)
-sha256  e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778  nmap-7.95.tar.bz2
-sha512  fd95a8bc627a2b8b507353f761dc9fdc8e880a0dd2d75a51b9cb3ec664318796af9bb16a6ff9a1358bd77ad669c2a54e333be630f201f69287692a7d2d41c17e  nmap-7.95.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.97.tar.bz2.digest.txt (lowercase)
+sha256  af98f27925c670c257dd96a9ddf2724e06cb79b2fd1e0d08c9206316be1645c0  nmap-7.97.tar.bz2
+sha512  050241744c311f5fc16297e1698aded2a9fdc78eb7a0954d1c70f7713ef6e1b07f3fcbf28a6a53f43785b1ae710aadf10237d1d0bd8855c6b3c423da4d35961c  nmap-7.97.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 077840b192..a944627b38 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.95
+NMAP_VERSION = 7.97
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
