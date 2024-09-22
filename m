Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE236CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A37174068D;
	Sun, 22 Sep 2024 09:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNcgqZwbOOCB; Sun, 22 Sep 2024 09:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 682CA40687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 682CA40687;
	Sun, 22 Sep 2024 09:23:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85AD01BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74C3C400CF
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzU3xVAsKQ32 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4575440022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4575440022
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4575440022
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:23:39 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so427801066b.0
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997017; x=1727601817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=750dry+PxKwfB6Kt0e6FyToo49lr3HLwDVPYzO6t8gY=;
 b=Bx6RPLgo8VynJtbfTxe6Ra6O1VMB6RDAZXOmfU7wc7g+AH0ZRMVF5NsiYjxCPW2bqU
 4SvQka8co5eJZT8cjBpgx7kdadd95Zqx0lbtTQ5qLPyfy7qzI/qvXIm0msvtZ1IBy9TR
 s2lJxgnykQcgLrqg9ZE52iyf7Nn5eaxf8YpjazGUEkRWRBZ4yeSoe455hf+oAK7IzMAa
 6Bd/0HMiKXqpu305vy+dZqN8l9t6W4jHmVzC2yGU8U5+k/fk+NzRNy811SsZXl5zhbba
 cpsAqZr9h5Xt1CntM16jyesQA4+YmkVI82xhNe86M2ABWijhjadand2pXuS2COz3FGU6
 hoaw==
X-Gm-Message-State: AOJu0YwLH3haj8t6mQjJrmCno09ErodhUPkhWf2swbI4DfyDCxuJ70N3
 pA6tWfuT7MNyDHAwXfX7Lc/FBo7R0oxGVlimzewlt+tV7i7HaXApdM/f75pHHmCTNCyNk8wh3Ef
 8f3Y=
X-Google-Smtp-Source: AGHT+IEQ6Aw76wxq1CmC/kTIrZv/vkivyQYZsgBN0l0iT47j1Ed5g7nqBv/6zm+LxhpfI7SUhGHtqg==
X-Received: by 2002:a17:907:e655:b0:a90:b712:d7e7 with SMTP id
 a640c23a62f3a-a90d582564bmr751728566b.54.1726997016864; 
 Sun, 22 Sep 2024 02:23:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b33fasm1065235866b.139.2024.09.22.02.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:23:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:23:06 +0200
Message-ID: <20240922092312.2061358-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726997017; x=1727601817;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=750dry+PxKwfB6Kt0e6FyToo49lr3HLwDVPYzO6t8gY=;
 b=c8MHbSjKJlDKaxx2IGdL0X4HFWnbrnH2YeDjAmDN1B/vEYdjbfFNEiczFz2v7Rq1jz
 Qy6KyuuDyR/GZ/pbh8uaLfFYT2xponY4F/+ECE4aBrshtjL4J8vpfqCMhyq/CqN31Jz6
 8OUx2ev7ZauG3HwzeK3ZQEHh7PnKfmbt67aLM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=c8MHbSjK
Subject: [Buildroot] [PATCH v2 3/9] arch: make FDPIC dependent on toolchain
 support
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
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

FDPIC support on ARM requires a certain target name, and therefore is
only currently available with the Buildroot toolchain. In addition,
only uClibc-ng supports FDPIC on ARM at the moment.

This may need to become more complicated if we end up in a situation
where each libc supports FDPIC on a different set of architectures.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 arch/Config.in      | 1 +
 toolchain/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index e57f4b2baa06..52efe3aabda1 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -447,6 +447,7 @@ config BR2_BINFMT_ELF
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
 	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
+	depends on BR2_TOOLCHAIN_SUPPORTS_FDPIC
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6e91ab756cd4..0dd4bb5d9b8e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -48,6 +48,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT
+	select BR2_TOOLCHAIN_SUPPORTS_FDPIC if BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
@@ -307,6 +308,9 @@ config BR2_TOOLCHAIN_HAS_OPENMP
 config BR2_TOOLCHAIN_SUPPORTS_PIE
 	bool
 
+config BR2_TOOLCHAIN_SUPPORTS_FDPIC
+	bool
+
 config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
 	bool "Copy gconv libraries"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
