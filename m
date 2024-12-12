Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F25BE77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 20:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5547C605EE;
	Thu, 12 Dec 2024 20:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nPmSfItXD3L; Thu, 12 Dec 2024 20:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591226131B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591226131B;
	Thu, 12 Dec 2024 20:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9B331146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3727414B6
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKjQGeRm3LdE for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 20:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A946414B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A946414B5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A946414B5
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:56:33 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 155BAB005F7;
 Thu, 12 Dec 2024 21:56:27 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
	Julien Olivain <ju.o@free.fr>
Date: Thu, 12 Dec 2024 21:56:19 +0100
Message-ID: <20241212205619.259476-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734036990;
 bh=68m1zkrLmkBDwrLrKNhjWoJ4/IF7+lmfFQGeYE7rRXA=;
 h=From:To:Cc:Subject:Date:From;
 b=F4eQgTh9E+NZ+nMjNGJSm1aiQu4hI5gbDFsIKfVtT3kPtd26vML7lk/pVxF46SrTG
 hTWf6H+QdQi2za7CzORDX6mpYXD47V+K26sYHYZQ/KKF8s6qVdB8BJ0YA6l5r8gCl1
 Sc9THrIXwUOnTfIazMSdZ3c5L+FNsjJXom70bn4VAZ+AkVnF2dW47YzUOr1ScFXGAF
 S9w/5ITrMlnD4mZGcMpe4zx+M7jUPUZccHJOTZ3ZcFX2c7sZeYM7Qj8e1ltozJ9Rj7
 Jby3mfm7Kz7h2TfW1Xqk/kO9tOiDLMG3jd20A9nt3B3oGvsajFuJcSHFt0IsP2AFtX
 +Y0HS2HWkU+Wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F4eQgTh9
Subject: [Buildroot] [PATCH 1/1] boot/opensbi: bump to version 1.5
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

For release notes since version 1.3, see:
https://github.com/riscv-software-src/opensbi/releases/tag/v1.5
https://github.com/riscv-software-src/opensbi/releases/tag/v1.4

This commit also updates the package home page url and the
download _SITE to reflect the change of github account from "riscv"
to "riscv-software-src".

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/opensbi/Config.in    | 6 +++---
 boot/opensbi/opensbi.hash | 2 +-
 boot/opensbi/opensbi.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index de2f0aae20..7604be29d9 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -10,7 +10,7 @@ config BR2_TARGET_OPENSBI
 	  System-on-Chip vendors to fit a particular hadware
 	  configuration.
 
-	  https://github.com/riscv/opensbi.git
+	  https://github.com/riscv-software-src/opensbi
 
 if BR2_TARGET_OPENSBI
 choice
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "1.3"
+	bool "1.5"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.3" if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.5" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 980fb141dc..c69bcf7150 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2c0501eb3475f463b15f5b8531996f64604ea49e0e3ed040ecbd1fc27ecd8c5c  opensbi-1.3.tar.gz
+sha256  9880485672a3a2c48a81d373df6707517b568402f2d3f9eecbfa9d83f8e6f22f  opensbi-1.5.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index dd113a0bf8..0142769a12 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -16,7 +16,7 @@ OPENSBI_SITE = $(call qstrip,$(BR2_TARGET_OPENSBI_CUSTOM_REPO_URL))
 OPENSBI_SITE_METHOD = git
 else
 # Handle official OpenSBI versions
-OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
+OPENSBI_SITE = $(call github,riscv-software-src,opensbi,v$(OPENSBI_VERSION))
 endif
 
 OPENSBI_LICENSE = BSD-2-Clause
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
