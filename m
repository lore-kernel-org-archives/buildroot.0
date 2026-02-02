Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548CBE7FDE9
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25BD2608B1;
	Mon,  2 Feb 2026 21:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAiXFO78MEc3; Mon,  2 Feb 2026 21:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C88D60AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770067716;
	bh=7rsOmTj5ufE6gLJtHreKUnK49Cegc7T5dIveVA4yjho=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NUqL09R1pC1KAvudjs6KnFG5cILDfkXtFHLjsXWatN82Wq53QfswzhFt5SkWL5pF9
	 SYEoGZvaYhSdmLx+pAF7PAa7zQYX3Ha0FQP4z5hM1uqc5V0nqC/r0jmTJGDdiHLLKC
	 lo6Il0kk8mVLL643DMv32DcyAzXdhxO1v+omRAqfUyoJqDYxo715MEzjsO4hV1O2G7
	 76Q9SunqUHtoxF9U+AeT8GdUJsZn66xtNhg66eTmcV+w7qs4drhn1fslX48/u8YyxZ
	 wDv0sWFaqezXAalIQdyjavvDJ1/alflhL9OOFpx9j23ywRnuBmj8MFSy6xosKBtNNg
	 dnuDBmVrF4vWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C88D60AD7;
	Mon,  2 Feb 2026 21:28:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37AADF5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C63F160744
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2OUbu43hp-1 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B64EA60760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B64EA60760
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B64EA60760
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9442DC237FA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ADF8A60767;
 Mon,  2 Feb 2026 21:28:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4009119A88EE; Mon,  2 Feb 2026 22:28:22 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Feb 2026 22:28:08 +0100
Message-ID: <20260202212814.2607588-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770067703; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=WYGm8HdO612NNQANiz4HU+AfCSqkPlJve3f6fnWpHrM=;
 b=dUsxa2UBqeFSyQN0AIpSJY2l7ATwoG3V3kU84i9lIk7AYA5VFTRGcirPJ8X/Vthl9KHH8E
 N01QTSS3TC0IVRAO0STLJig0ZnqHvPc6KzQjo/KNCrPXWQyn5j/QWPbhSO3apyziFiVamm
 bWwHZqIF/BoDtVUZ43Ho+NbabLunSgIVo9YkMlyIE7k89VzjqLGwULRsNqkyLzAJmqNStK
 0mzt4owgwaZTuWSu83621JDFZFeZANfBVK3fyLOuozIewkYULJ+jsG8MZKiCPC0/dUdFj5
 96fMbCgXrlRbS+OuLZDe5YLLCdGR9NRWcqcLIWmW+DTSeu7im7QO9n1hH69Vcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=dUsxa2UB
Subject: [Buildroot] [PATCH 2/5] support/config-fragments/autobuild: reduce
 ARM internal toolchain
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

Building internal toolchains takes a long time, and since the
differences between the 3 internal ARM toolchains is just the libc,
and we're already testing uclibc/musl with external toolchains, it
doesn't make much sense to build 3 different ARM internal toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../config-fragments/autobuild/br-arm-internal-full.config   | 5 -----
 .../config-fragments/autobuild/br-arm-internal-musl.config   | 4 ----
 support/config-fragments/autobuild/toolchain-configs.csv     | 2 --
 3 files changed, 11 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/br-arm-internal-full.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-internal-musl.config

diff --git a/support/config-fragments/autobuild/br-arm-internal-full.config b/support/config-fragments/autobuild/br-arm-internal-full.config
deleted file mode 100644
index b5f10069c6..0000000000
--- a/support/config-fragments/autobuild/br-arm-internal-full.config
+++ /dev/null
@@ -1,5 +0,0 @@
-BR2_arm=y
-BR2_ARM_EABI=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-internal-musl.config b/support/config-fragments/autobuild/br-arm-internal-musl.config
deleted file mode 100644
index 92788626d6..0000000000
--- a/support/config-fragments/autobuild/br-arm-internal-musl.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_arm=y
-BR2_cortex_a8=y
-BR2_TOOLCHAIN_BUILDROOT_MUSL=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index f5c6c6672a..5c9fe660d3 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -44,9 +44,7 @@ support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
-support/config-fragments/autobuild/br-arm-internal-full.config,any
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
-support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
 support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
