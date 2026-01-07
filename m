Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632D5CD583B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 11:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09728405CB;
	Wed,  7 Jan 2026 11:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Pajbgv9sWiv; Wed,  7 Jan 2026 11:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E81A740473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767785525;
	bh=cf6yyVHxgNvDvHFdYKn5+kTcMSvErSgZWvPKSca5Pbc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=srQk8Y+T5sIkXdDBt8BhNb7Tv/Z3wo+Ty/D35fPkP7s5wxU8NkBPfeZTmXhhf8mDH
	 q/H5gof9lmhaGYNFt1XLOckpso53N8CVqMpsgMadd9nFrpHwQ0X0LQvPdXNExbPesr
	 UbixQ+v33NhrZn6fzreM55ULG5oU0pnnX3QGZKIZPFyoOOxJbJdHR5cxqb7Ktuv+wp
	 o8ng0KqvK4Y6XMAYW+oCaClcfxXMSDmjhIHtMG5b0H5hlA/zYEe50As67hlV3XKYk1
	 DMPh58QsWxj9HIj/yUaD9Duhm+u16xs/bvEn4VmIRGHJGZNIjoyEdeo+3J2yXxmM9C
	 sMiI6+PVyfByQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E81A740473;
	Wed,  7 Jan 2026 11:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C24632A3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 11:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3F224040A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 11:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKuVNjYw2g6X for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 11:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB9BC403DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB9BC403DF
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB9BC403DF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 11:32:02 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b843e8a4fbfso174941166b.0
 for <buildroot@buildroot.org>; Wed, 07 Jan 2026 03:32:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767785520; x=1768390320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JfKkODbHhmIYQOE2knyz26+6tC7ZoFVAY/EYzuxeAjY=;
 b=HhrzDSXADKUzlbI8+y4o/CE3dcqgop2Qeo/1iKW4eOmLCqzo9r+StLRam1yRmjRyOQ
 P1L0vuno9LciWNZAoifJxgg9itHSH1VqmFazktjpssmk9RDLKiy6LG4EPi6YDcaFVXbi
 rxYTJE9Z5moawB43osUwuyQVvXMolknN1KhDoMqlVPOr3dlde/uZGLS5YpwgjzLls3+F
 ewVKgnZzfQOGLDso/i9ts1sdqp1Jek9duZPorDaki90OhWoXdEtIv+UqhCniLKxA1/T1
 fGYFXjvgEQgVknzBtL1DirVtNpCW8facuMJUqJxzKUigbV3YE5tAX4td+9iQfRPPK7wq
 lVJQ==
X-Gm-Message-State: AOJu0Yzo9ryebHwyoTtRyCB5XCjXEWsQBIrcieZhzvPWf76AHyQpdAaF
 z+r6mC7iC8zxX68pT7u5FMauFpNFTMmubybiC4oT74srHbv/EzxQVyHByH0OPRsyywwnWlqrsbo
 RAPUw
X-Gm-Gg: AY/fxX5nphUxAv01Ds4XKLm5G87aBUB6xX/JZRLi/KKYP8oEQsN7kB28HJ95TA82KL0
 6qNPWNBXgENLr/ZWQzOywwzJpuwu9pXLCFgRscopG/85HLNAcYG1yzTxDg9aLGCVALZGO4MY0af
 eJbby8RxWZ4zvzqnoikAajc7PedEiWaVSV2e2/PekaNy1eswdV09WthllvzwmnQf3aV3+W7LxpV
 waRUjPO4Ftv6Ig04XAjRKb4H9VilMkFdicOfOO8IgrIgAszwz/qt6I3ygsMOewLxMarPniP0f99
 AplEu3MHsdfw12OJ1iGE8issuLnPlPzxnDPVpeGKGEml3J/A8PJSQ/kvyo3vguVaVTi+x/1XbCG
 yJ2WVCYDCvhNLLC2AGS1ucZ2gNENvQ2zqOcP98COIOO/IyBi+Y2Psy9PjH2/Kbq7B0O/waPU+Kk
 PvdoCaSul5ZyH2RS6DsyZFEJtKCAgvDelro8ckJxo16F6Ry3oWK0hSmbvizyaZOxLZcgFnXDuAc
 9BmFjEs2W+OP7KplrZJedyRgrm9KJKmIBc=
X-Google-Smtp-Source: AGHT+IGx86eKNPD9nuk6oZ3MhMEZDnRQKse1P3NM8P86M0H8kyYYKyL59Eu0KtV+LGhTPHudzQGc/w==
X-Received: by 2002:a17:906:c144:b0:b80:4031:bb56 with SMTP id
 a640c23a62f3a-b844516a82emr191993066b.4.1767785520209; 
 Wed, 07 Jan 2026 03:32:00 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.122])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf661fesm4840939a12.25.2026.01.07.03.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 03:31:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  7 Jan 2026 12:31:53 +0100
Message-ID: <20260107113153.395738-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767785520; x=1768390320;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JfKkODbHhmIYQOE2knyz26+6tC7ZoFVAY/EYzuxeAjY=;
 b=QjRtwHkj3pUUG2LpT70/8IEfVYfNr4bDS8yrbjJylZGuLYKYMabgDe99Z6Hdbh0/qh
 zWjufkKRXehAU2r5I4HxYCXUV8CyNKLWO0ChT8GA7oMjliPJ61FoAs0mbJEO7tva5uNA
 YJEwIqOzNgwAH8WgjBE82WkNfAbxj7m7AmIuI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QjRtwHkj
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2026.01
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

Release announcement:
https://lists.denx.de/pipermail/u-boot/2026-January/606771.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2025.10...v2026.01

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 5efe6d498bf5..22a5c35821b8 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2025.10"
+	bool "2026.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2025.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2026.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -340,7 +340,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2025.10/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2026.01/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 7b71e2d948ca..39b894fe9ab6 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
