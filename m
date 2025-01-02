Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BFCE7718B
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1DC4059B;
	Thu,  2 Jan 2025 10:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_NVUvoArPPv; Thu,  2 Jan 2025 10:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67F30403BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67F30403BD;
	Thu,  2 Jan 2025 10:09:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D31F3E0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0D8040401
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhOBe34qzrQx for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B3CC403CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B3CC403CA
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B3CC403CA
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:09:07 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa676e4f36cso134966766b.2
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 02:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735812544; x=1736417344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKGy+wKEMnKwv/lkCJK+2v7bTZ1nmjagpNzyAmpifVM=;
 b=neEE1jCH0dAaR1JefkrOO8s2/nHjTt8nZzpgYJr7hXPlxH60GQS3jztU770bwCCpQy
 dt2sgN3giNj3lc+NMEOk7Yu2zFX0XZHAnesM9rNA0pakIqsdUn5Z40Gofi2VZ6t2jSNI
 5mr3ojDw5r7UqBkEYBHcw8dDRjxJ2pDSJ6YlJEBNfLsVYlR6zAHBoSojK3yr0SyNBC18
 sytp+JZId4ygzbBDMbmQOy2K0UKnR9bymHZ2lT2yEjcr2XHc8Ue33SQHvrItA4JVkcIx
 GoEV3aanCGs2dhsBB6WuWxmmIuuacfMch/radYHbGerQXKDdbAASQO+QP5FIBmyEsj5S
 fMhw==
X-Gm-Message-State: AOJu0YzHDNuFY4PzCM94MGtA/GfFKg1BgFZnO/oOFtkqFDAwC+cthOc5
 R4Gk6swsLKyEkdCdR+2FjpCCc8syJbyD/gDUsJgIMrog6Lp68XB39PvEOKtVU773s22ul3J/C6h
 RuKA=
X-Gm-Gg: ASbGnct2BgLKltxI/fJa8n7+yahbgBBcQ2SBeaLmszkFSYF+cJWoFoGzz6h9iztlmIT
 9Ckne+MyruTjR+IsRLgrwuagYu9EuhBsoei3faWGkAsk24M5omjX42i60cI706mKIWzRrsUQqU3
 H8mTW2QSsWmzz5HXkz81+dqnLlb2zJXcc1Qk7eoVDEHBDtuAKXjz7K3G0WMv1OlL/R7ShdGsob0
 U89SSZKlQc8tpCWdHixGj3NzdwnRyWHh48pmPWHe/+wp467TtlG3A/1HM9cYnJKbKPNrmQ27Mo3
 FW/DMgLium8Q
X-Google-Smtp-Source: AGHT+IG+Kh3wIb/7g8goTF68LvZ92M9vh1h5HoN/qwCQ3oJ8YB4xinw/GiUXNgQisjo4rqlfwbgSSQ==
X-Received: by 2002:a17:907:d9f:b0:aa6:6e2e:b7b with SMTP id
 a640c23a62f3a-aac27247cf9mr1356418866b.1.1735812542554; 
 Thu, 02 Jan 2025 02:09:02 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830b10sm1759295866b.37.2025.01.02.02.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 02:09:02 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu,  2 Jan 2025 11:08:51 +0100
Message-ID: <20250102100854.8937-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
References: <20250102100854.8937-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735812544; x=1736417344;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKGy+wKEMnKwv/lkCJK+2v7bTZ1nmjagpNzyAmpifVM=;
 b=lbI8mFCJnAcm3hLzJz3U6tsmuRJ+J2va1ywK+wHCbjKpg77Z3AZjts/1esjSz/kD8p
 VTwfgWN1lpAeYUibCBaX5XntLZjNT0mkfS3xYOGIkCmlmWeajGVwgLkY+6BuBFsr1mtd
 6as/QIA1eH5CGpAqEJlXHlWh/OIjTVUTARDW4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lbI8mFCJ
Subject: [Buildroot] [PATCH 2/5] package/flutter-sdk-bin: bump to version
 3.27.1
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index ea7bab28a5..02fee767a3 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2ce78d4a51f063efa7f04666ae010d026d119eea6bdea7e08b736840fe88ddb4  flutter_linux_3.24.4-stable.tar.xz
+sha256  61497eb64cd7b3aa99ca9911ccd921c8dab79afd909ca1c9ff9546067ebcf6ca  flutter_linux_3.27.1-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 5b69cde465..68cce21eac 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.24.4
+FLUTTER_SDK_BIN_VERSION = 3.27.1
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
