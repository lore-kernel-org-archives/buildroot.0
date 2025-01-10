Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93905E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36BB9409F2;
	Fri, 10 Jan 2025 19:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSPMMJx9aJvZ; Fri, 10 Jan 2025 19:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B842E40C9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B842E40C9B;
	Fri, 10 Jan 2025 19:54:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 018E4942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF04F409F2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmUcCWKrUidb for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D0AD408BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0AD408BA
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D0AD408BA
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so17926865e9.2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538846; x=1737143646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6aq3hprTnKNvRq+PtZpVq91KyRmPmmleYbhdIkU0hq0=;
 b=bTjY1+d/eViny0JPj2Kk5jb/DkQQ7chtlSUK3speu6175F1d877pHnG+XaAhU7WlkZ
 Ml9P3VxiwI6QXt0ml0WUVCsd5iPXa7CSP0Fo+ussolNsPMNF1HMVURbfzcS1uXrON5rh
 4jw7VwZNJTZIlcQDyWFDkLS+2cr+veHH5QQrBjXFJ6p8ZtqMZuSI1i+/W/TYGdhrITDK
 jBd4ShLCQ6kwLZi3b1qwq0892nKq66Z8sBYQME5wmQgUjK+DSDUJsNi07V1qfJwQRihA
 FF6q9SwPcfpobf5BTdKFNKoMoe90AkfxzHjkDvRDYF2JFZD3rdWKXAQTRcmThep/Od5O
 32gw==
X-Gm-Message-State: AOJu0Ywrfh3eRV1xL3nNe7qIP19HH+6+ED1XC+loJfsrHhtNndIgij1E
 DpxrUZ8A8ZcpSc4VhsDK37R//iR5pJN7GxnwF+QgQ7D6dFYxcnjhR04jGQDV7NT3VI9jhmhZUGc
 q
X-Gm-Gg: ASbGncvwyeyqirDhXzrwtpXEFK+5DDQ6CiDVorUhSbbscm1KEWfiDmorRxV+ugP/uw5
 pY28aBr39JLp3e1Pslx9KtvHr4ylHHjnDjlngJKLuNSqObDGXq67jS1tds5qd6x0yBkhL6xVO89
 TDFDzmILvQvRTo/czROxMFGZQde6DziGBgjxfK274beTF93CAv0HOOL+j3hXS0L/J6C4jTOO+oP
 k6vb6kSbQ9OB3KPo3yDZ6hRRdj4HQLmuhPiDzou0Mn8t6Ni3/EumgEkGBhqmToW/hcRGJmPzU56
 FF4z05dYZTO2TmZ13YWkoii5TWwWcYkdqQ/6cEl2GrG6LKggHO3hdw==
X-Google-Smtp-Source: AGHT+IFcWpP75yuuGmq9znZk4u3dcRBS5XfArZuQr2oGqh0JEA3sHI8v5Zk/srpyTDfATOynNOHN8g==
X-Received: by 2002:a05:600c:138f:b0:434:a4fe:cd71 with SMTP id
 5b1f17b1804b1-436e26a88d9mr119372525e9.12.1736538845765; 
 Fri, 10 Jan 2025 11:54:05 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:05 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 10 Jan 2025 20:53:48 +0100
Message-ID: <20250110195359.3358022-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538846; x=1737143646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6aq3hprTnKNvRq+PtZpVq91KyRmPmmleYbhdIkU0hq0=;
 b=Ckd6eAgYpWA2PATz01NqnsQZIEU5BoS3MROuynJKJoJ7C9yMVNRgyJsdh4AqF0nLz8
 905n5Gv9LQ57WjlTQO7mmOacH9alz0LC8ZWgLz+sqxfh+unmoUA8XV0EDT1tQC5tf2j7
 OKuDRYg3riSKeDnjgrpfbWZmudiwSYQk9k0Vg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Ckd6eAgY
Subject: [Buildroot] [PATCH v2 01/12] support/config-fragments: remove nios2
 toolchain
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The nios2 architecture was deprecated in gcc-14 and has been removed
in the upcoming gcc-15 [1][2].

Our last and only nios2 defconfig "qemu_nios2_10m50_defconfig" was
removed in 2024.11 due to nios2 removal from Qemu 9.1.0 [3].

Remove nios2 testing from Buildroot autobuilders.

[1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153
[3] f96b4c176f6e9d6c4374a0d322de672bf44c35bf

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/config-fragments/autobuild/bootlin-nios2-glibc.config | 4 ----
 support/config-fragments/autobuild/toolchain-configs.csv      | 1 -
 2 files changed, 5 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/bootlin-nios2-glibc.config

diff --git a/support/config-fragments/autobuild/bootlin-nios2-glibc.config b/support/config-fragments/autobuild/bootlin-nios2-glibc.config
deleted file mode 100644
index 575a1b30ed..0000000000
--- a/support/config-fragments/autobuild/bootlin-nios2-glibc.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_nios2=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 654f11e28b..047b22a9fa 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -28,7 +28,6 @@ support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
-support/config-fragments/autobuild/bootlin-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
