Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8878ACF6497
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 20:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4922D81007;
	Sun, 29 Sep 2024 20:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKrEKfvStA2V; Sun, 29 Sep 2024 20:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BE5E80FA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE5E80FA1;
	Sun, 29 Sep 2024 20:15:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE541BF334
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7207E605A5
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugg7b9wSLdRi for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 20:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A09E9600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A09E9600D4
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A09E9600D4
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:15:13 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c88370ad7bso3076650a12.3
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 13:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727640911; x=1728245711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVZ5Sma0f3vC+xKmCHjTGLKC6H2ioJzQjxLLFriK5Bk=;
 b=nHmsVuosC1RbNqSUFXlruZrolAAT0bZnIMXIDU6BTIphIpW6HyAUEIk0fDYglI3N9r
 8rFKh1fThTDsicgoY4v0WCHYdqYa8ZfZOBSIgQmcM5hSSLq1g3GpyI0i2YB71xkjhAkK
 Saf8YNsQHiHNGQkOdP1lYpHyWPOTd03BzDLYi+fALSsOdd/d7+hUCHBGRPODoaqB+o10
 iEnrd1A60DoIXLBZ0NDxLNe/yVb7kCGFFPqMdWZNGoPvqy7fxDgmbRYkepiZ9+mp5ZF3
 H2ZQG06wBPr753ifR3GxEeU0rfcfrMUsglM5JL6wG83n8frh2+fcOv6lOcKGRdf90Usf
 CjHA==
X-Gm-Message-State: AOJu0YwNweI8a5qamSAlSKKcrduTKz+QyNfrR5LfPrcyYqfGrcR1vyqs
 f4nWs6rW67sPrl5U2JhG7P06soMS5ltCU9tKM8hicxYDMQi2ehq4DgRY3801LDxgt8crRAeUfE2
 g1Po=
X-Google-Smtp-Source: AGHT+IF9JrtaMSGYxQD0wfeKAjTphg5QdySOaFfSyg10+jBfwoP9BdZTDEEvNRLX0KB3epy0VMwxXw==
X-Received: by 2002:a05:6402:210b:b0:5c2:4cbe:ac33 with SMTP id
 4fb4d7f45d1cf-5c8824cffaemr9973766a12.2.1727640911018; 
 Sun, 29 Sep 2024 13:15:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fbd2sm3537870a12.42.2024.09.29.13.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 13:15:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 22:14:53 +0200
Message-ID: <20240929201459.1761285-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
References: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727640911; x=1728245711;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVZ5Sma0f3vC+xKmCHjTGLKC6H2ioJzQjxLLFriK5Bk=;
 b=g8OAdaHocFhGeKAIIJiEt+Uh35DL/Y6JInwgdjolWMcLhaED0c51gC/YMgOg7Op5ry
 fqm3CFfZTHkdoGxyAXragkwXHPQwFSepyWqFwWEwaajdG+WRzF7WbvRK6IvJPh0UvBmF
 Z3fmbhksk8OnP3LDo3BCmf4CV1qPDvb0lk0a8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=g8OAdaHo
Subject: [Buildroot] [RFC PATCH v3 3/9] Add the right dependencies on
 BR2_BINFMT_* to the toolchains
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FDPIC support is not provided by all toolchains. The patch adds the
correct dependencies on BR2_BINFMT_* to the toolchains, so they can only
be selected if they support the chosen target binary format

Checking the FDPIC support for the different toolchains was done by
running the following command for each of them:

*-gcc -mfdpic -o test test.c

where test.c is:

int main(int argc, char**argv)
{
	printf("Ciao!\n");
	return 0;
}

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
- Added in v3.
- It replaces the previous patch "arch: make FDPIC
  dependent on toolchain support", considered incorrect.

 package/glibc/Config.in                       |   1 +
 package/musl/Config.in                        |   1 +
 .../Config.in                                 |   1 +
 .../toolchain-external-arm-aarch64/Config.in  |   1 +
 .../Config.in.options                         | 194 ++++++++++++++++++
 .../Config.in                                 |   1 +
 .../Config.in                                 |   1 +
 .../Config.in                                 |   1 +
 .../toolchain-external-linaro-arm/Config.in   |   1 +
 .../toolchain-external-linaro-armeb/Config.in |   1 +
 .../toolchain-external-synopsys-arc/Config.in |   1 +
 11 files changed, 204 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 6075d28874c5..181e0ac7b244 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 
 config BR2_PACKAGE_GLIBC_SUPPORTS
 	bool
diff --git a/package/musl/Config.in b/package/musl/Config.in
index a6e2af054c35..381f36d1f8c9 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 
 config BR2_PACKAGE_MUSL_SUPPORTS
 	bool
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index d3c095b2b6a5..e388f46f771e 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -3,6 +3,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 7f4fc61f2fbe..0dda69aa321b 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -3,6 +3,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index e3ee7aa2c037..b56dee6b98b6 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -62,6 +62,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -87,6 +88,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -111,6 +113,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -136,6 +139,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -158,6 +162,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
 	bool "aarch64 uclibc bleeding-edge 2024.05-1"
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -183,6 +188,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
 	bool "aarch64 uclibc stable 2024.05-1"
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -208,6 +214,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -233,6 +240,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -257,6 +265,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -282,6 +291,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -304,6 +314,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
 	bool "aarch64be uclibc bleeding-edge 2024.05-1"
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -329,6 +340,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
 	bool "aarch64be uclibc stable 2024.05-1"
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -354,6 +366,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -379,6 +392,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -404,6 +418,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
 	depends on BR2_archs38
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -429,6 +444,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
 	depends on BR2_archs38
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -452,6 +468,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -477,6 +494,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -1184,6 +1202,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
 	depends on BR2_m68k_m68k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1209,6 +1228,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
 	depends on BR2_m68k_m68k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -1233,6 +1253,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
 	depends on BR2_m68k_m68k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1258,6 +1279,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
 	depends on BR2_m68k_m68k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -1281,6 +1303,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 	bool "m68k-68xxx uclibc bleeding-edge 2024.05-1"
 	depends on BR2_m68k_m68k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -1306,6 +1329,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
 	bool "m68k-68xxx uclibc stable 2024.05-1"
 	depends on BR2_m68k_m68k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -1330,6 +1354,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
 	bool "m68k-coldfire uclibc bleeding-edge 2024.05-1"
 	depends on BR2_m68k_cf
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -1353,6 +1378,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
 	bool "m68k-coldfire uclibc stable 2024.05-1"
 	depends on BR2_m68k_cf
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -1376,6 +1402,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1399,6 +1426,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -1422,6 +1450,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1445,6 +1474,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -1467,6 +1497,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
 	bool "microblazebe uclibc bleeding-edge 2024.05-1"
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1491,6 +1522,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 	bool "microblazebe uclibc stable 2024.05-1"
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -1516,6 +1548,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1539,6 +1572,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -1562,6 +1596,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1585,6 +1620,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -1607,6 +1643,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
 	bool "microblazeel uclibc bleeding-edge 2024.05-1"
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1631,6 +1668,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
 	bool "microblazeel uclibc stable 2024.05-1"
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -1658,6 +1696,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1685,6 +1724,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -1711,6 +1751,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1738,6 +1779,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -1762,6 +1804,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -1789,6 +1832,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -1816,6 +1860,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1843,6 +1888,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -1869,6 +1915,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -1896,6 +1943,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -1920,6 +1968,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -1947,6 +1996,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -1974,6 +2024,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2001,6 +2052,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2027,6 +2079,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2054,6 +2107,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2079,6 +2133,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -2106,6 +2161,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -2133,6 +2189,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2160,6 +2217,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2186,6 +2244,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2213,6 +2272,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2238,6 +2298,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -2265,6 +2326,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -2293,6 +2355,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2321,6 +2384,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2348,6 +2412,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2376,6 +2441,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2402,6 +2468,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -2430,6 +2497,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -2458,6 +2526,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2486,6 +2555,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2513,6 +2583,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2541,6 +2612,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2567,6 +2639,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -2595,6 +2668,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -2623,6 +2697,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2651,6 +2726,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2678,6 +2754,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2706,6 +2783,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2732,6 +2810,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -2760,6 +2839,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -2785,6 +2865,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
 	depends on BR2_nios2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -2810,6 +2891,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
 	depends on BR2_nios2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -2834,6 +2916,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -2860,6 +2943,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -2885,6 +2969,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -2911,6 +2996,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -2934,6 +3020,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	bool "openrisc uclibc bleeding-edge 2024.05-1"
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -2960,6 +3047,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 	bool "openrisc uclibc stable 2024.05-1"
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -2987,6 +3075,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3013,6 +3102,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3038,6 +3128,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3063,6 +3154,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3086,6 +3178,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -3112,6 +3205,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -3138,6 +3232,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3164,6 +3259,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3189,6 +3285,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3214,6 +3311,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3237,6 +3335,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -3263,6 +3362,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -3289,6 +3389,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3315,6 +3416,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3340,6 +3442,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3365,6 +3468,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3388,6 +3492,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -3414,6 +3519,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -3440,6 +3546,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc_e5500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3466,6 +3573,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	depends on BR2_powerpc_e5500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3491,6 +3599,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc_e6500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3517,6 +3626,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	depends on BR2_powerpc_e6500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3542,6 +3652,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
 	depends on BR2_powerpc_e6500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3568,6 +3679,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
 	depends on BR2_powerpc_e6500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3593,6 +3705,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3619,6 +3732,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3644,6 +3758,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3670,6 +3785,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3695,6 +3811,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3721,6 +3838,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3746,6 +3864,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3772,6 +3891,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -3799,6 +3919,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3827,6 +3948,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_STABLE
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3854,6 +3976,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_BLEEDING_EDGE
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3882,6 +4005,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_MUSL_STABLE
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3908,6 +4032,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -3936,6 +4061,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_UCLIBC_STABLE
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -3964,6 +4090,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -3992,6 +4119,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4019,6 +4147,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4047,6 +4176,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4074,6 +4204,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -4103,6 +4234,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -4129,6 +4261,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
 	depends on BR2_s390x_z13
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4155,6 +4288,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
 	depends on BR2_s390x_z13
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4180,6 +4314,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_BLEEDING_EDGE
 	depends on BR2_s390x_z13
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4206,6 +4341,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_MUSL_STABLE
 	depends on BR2_s390x_z13
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4230,6 +4366,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4256,6 +4393,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4281,6 +4419,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4307,6 +4446,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4330,6 +4470,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -4356,6 +4497,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -4382,6 +4524,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
 	depends on BR2_sh4aeb
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4408,6 +4551,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
 	depends on BR2_sh4aeb
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4433,6 +4577,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
 	depends on BR2_sh4aeb
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4459,6 +4604,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
 	depends on BR2_sh4aeb
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4483,6 +4629,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
 	depends on BR2_sparc_v9
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4509,6 +4656,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
 	depends on BR2_sparc_v9
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4533,6 +4681,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -4559,6 +4708,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -4587,6 +4737,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4615,6 +4766,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4642,6 +4794,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4670,6 +4823,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4695,6 +4849,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -4723,6 +4878,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -4755,6 +4911,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4787,6 +4944,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4818,6 +4976,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4850,6 +5009,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -4879,6 +5039,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -4911,6 +5072,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -4945,6 +5107,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -4979,6 +5142,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5012,6 +5176,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5046,6 +5211,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5077,6 +5243,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -5111,6 +5278,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -5146,6 +5314,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5181,6 +5350,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5215,6 +5385,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5250,6 +5421,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5282,6 +5454,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -5317,6 +5490,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -5349,6 +5523,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5381,6 +5556,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5412,6 +5588,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5444,6 +5621,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5474,6 +5652,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -5506,6 +5685,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -5536,6 +5716,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5566,6 +5747,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5595,6 +5777,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5624,6 +5807,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5650,6 +5834,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -5680,6 +5865,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -5713,6 +5899,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_winchip2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5746,6 +5933,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_winchip2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5778,6 +5966,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	depends on !BR2_x86_winchip2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_INSTALL_LIBSTDCPP
@@ -5810,6 +5999,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	depends on !BR2_x86_winchip2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
@@ -5839,6 +6029,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -5872,6 +6063,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
@@ -5898,6 +6090,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -5925,6 +6118,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
index 8e067c8ffb37..c0a190c78c27 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
@@ -7,6 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on !BR2_mips_interaptiv
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
index 295a8987f16d..a13888142c33 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
@@ -3,6 +3,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index 1b0ec7cd9f87..258f59a30e50 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -3,6 +3,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index 8b3b4c844eb9..cbae3cba1f8d 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -9,6 +9,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index b143ee5e2472..7ee7089dcbfe 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -9,6 +9,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+	depends on BR2_BINFMT_ELF
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index dc333f84747a..b4fc9699dfa9 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -3,6 +3,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	depends on BR2_arc
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on BR2_BINFMT_ELF
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
