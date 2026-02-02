Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613DCE7FDE2
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E98560791;
	Mon,  2 Feb 2026 21:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2qONcwoofob; Mon,  2 Feb 2026 21:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0395E607A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770067712;
	bh=LcRq+LkLq7zhRPCGtXatHIFn0/MAsZ2x3YaKQPYC0tc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MuOlPWpUseGMn2LVSRecUYjRF7Htw2mNjlTqp+y5G8aJ3gvei3HQ7Ik4PDLu+avrY
	 NwQiS1m4I5MPGkiWFgoFKOpchEzPOWAoChpORtfVlNV2f98FTMiboDxoF5eri/tlin
	 2Y6KH6/11w5iIboO9sx1dXUnfxF8EioNyvV+81sVb6aUukdZ6eEj48W08MR9GG6oUm
	 SkRs47tkfCgC3sl5WH1n290Z2yQx3/97wflGDeTfiLxnBWk1lXK8/J/GN8AmVmfz3P
	 pR7bGB5VTqxcELbpQadN2fUCX2SjkNRgYBvyF9aAyJI4/sP06cudhwE+ADpzYExPcr
	 YWyhaSB/MvdTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0395E607A6;
	Mon,  2 Feb 2026 21:28:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89120F5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 777FD60793
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtwEiAipQK6d for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:28:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E0AD60744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E0AD60744
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E0AD60744
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 65FE84E423CD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CA9D60767;
 Mon,  2 Feb 2026 21:28:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F0F2119A8888; Mon,  2 Feb 2026 22:28:24 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Feb 2026 22:28:09 +0100
Message-ID: <20260202212814.2607588-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770067704; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=sKW41XtQSeVGFdek/aztA+32B9gouGVygJwlJ9enbNA=;
 b=huCqwDV1jERVN5wCWmqRR4uuCv9hZw9Xd1E9BkQzivxj90VWml73VuAghPqHo+3Ohg6Kf/
 tsbZZ/6EGu8jYFDrAU0mnx2pu94WQzQBAfrBUanTdyLgcikRZJxR/zKq0Q3ux7L7pR+itB
 IgIF50SWpdjt6xYeuNr0+Kenl0rAKs1JLsMhA1NC0XVQNLdzUfA86YBVvusxaIpPWzx5xR
 degi+Bqs6EJm3w6ulO3c8ihJO3Gc22uSL35yeo+VA3EcVT5J6ympAFOyONLtKYqz83cRbW
 Fw29Vzh1ndcfUwRSkSTCJ4idpPLwO57lBF7q0h8PTOE1XGCg8R6qtmSOjKfIHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=huCqwDV1
Subject: [Buildroot] [PATCH 3/5] support/config-fragments/autobuild: drop
 somewhat duplicate toolchain configs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- br-i386-pentium4-full.config as an x86 32-bit toolchain test is
  already reasonably covered by bootlin-x86-i686-musl.config

- br-microblazeel-full-internal.config as a Microblaze toolchain test is
  already reasonably covered by bootlin-microblazeel-uclibc.config

- br-powerpc-internal-full.config and br-powerpc-603e-basic-cpp.config
  as PowerPC 32-bit toolchain tests are already reasonably covered by
  bootlin-powerpc-e500mc-uclibc.config

- br-powerpc64-power7-glibc.config as a PowerPC 64-bit toolchain test
  is already reasonably covered by
  bootlin-powerpc64le-power8-glibc.config

- br-riscv64-full-internal.config as a RISC-V 64-bit toolchain test is
  already reasonably covered by bootlin-riscv64-glibc.config and
  bootlin-riscv64-musl.config

- br-s390x-z13-internal-glibc.config as a s390 toolchain test is
  already reasonably covered by bootlin-s390x-z13-glibc.config

- br-xtensa-full-internal.config as an Xtensa toolchain test is
  already reasonably covered by bootlin-xtensa-uclibc.config

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/br-i386-pentium4-full.config             | 10 ----------
 .../autobuild/br-microblazeel-full-internal.config     |  1 -
 .../autobuild/br-powerpc-603e-basic-cpp.config         | 10 ----------
 .../autobuild/br-powerpc-internal-full.config          |  4 ----
 .../autobuild/br-powerpc64-power7-glibc.config         |  9 ---------
 .../autobuild/br-riscv64-full-internal.config          |  4 ----
 .../autobuild/br-s390x-z13-internal-glibc.config       |  4 ----
 .../autobuild/br-xtensa-full-internal.config           |  3 ---
 .../config-fragments/autobuild/toolchain-configs.csv   |  8 --------
 9 files changed, 53 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/br-i386-pentium4-full.config
 delete mode 100644 support/config-fragments/autobuild/br-microblazeel-full-internal.config
 delete mode 100644 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
 delete mode 100644 support/config-fragments/autobuild/br-powerpc-internal-full.config
 delete mode 100644 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-riscv64-full-internal.config
 delete mode 100644 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-xtensa-full-internal.config

diff --git a/support/config-fragments/autobuild/br-i386-pentium4-full.config b/support/config-fragments/autobuild/br-i386-pentium4-full.config
deleted file mode 100644
index c680699288..0000000000
--- a/support/config-fragments/autobuild/br-i386-pentium4-full.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_x86_pentium4=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-microblazeel-full-internal.config b/support/config-fragments/autobuild/br-microblazeel-full-internal.config
deleted file mode 100644
index 0d2d7df8f1..0000000000
--- a/support/config-fragments/autobuild/br-microblazeel-full-internal.config
+++ /dev/null
@@ -1 +0,0 @@
-BR2_microblazeel=y
diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
deleted file mode 100644
index 045428c1de..0000000000
--- a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_powerpc=y
-BR2_powerpc_603e=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc-internal-full.config b/support/config-fragments/autobuild/br-powerpc-internal-full.config
deleted file mode 100644
index 61b3e7a966..0000000000
--- a/support/config-fragments/autobuild/br-powerpc-internal-full.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_powerpc=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
deleted file mode 100644
index a80047ea66..0000000000
--- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_powerpc64=y
-BR2_powerpc_power7=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64-full-internal.config b/support/config-fragments/autobuild/br-riscv64-full-internal.config
deleted file mode 100644
index 5c1dfc47e3..0000000000
--- a/support/config-fragments/autobuild/br-riscv64-full-internal.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_riscv=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config b/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
deleted file mode 100644
index 56af5fb1ba..0000000000
--- a/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_s390x=y
-BR2_s390x_z13=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-xtensa-full-internal.config b/support/config-fragments/autobuild/br-xtensa-full-internal.config
deleted file mode 100644
index 89e81d4c45..0000000000
--- a/support/config-fragments/autobuild/br-xtensa-full-internal.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_xtensa=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 5c9fe660d3..ff8927eb37 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -45,15 +45,7 @@ support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
-support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
 support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
-support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
-support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
-support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
-support/config-fragments/autobuild/br-powerpc-internal-full.config,any
-support/config-fragments/autobuild/br-riscv64-full-internal.config,any
-support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
-support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
