Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6546EC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 18:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A531140287;
	Sun, 21 Jul 2024 18:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Su0zEkSqkAV; Sun, 21 Jul 2024 18:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2D14028F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2D14028F;
	Sun, 21 Jul 2024 18:32:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF5F1BF2BF
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 18:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0C348113E
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 18:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cr0VH0uyJvd7 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 18:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A4AF81138
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A4AF81138
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A4AF81138
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 18:32:29 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5a3b866ebc9so1730538a12.3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 11:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721586747; x=1722191547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2DskSaCcD7xBYfXvMw6hQkc1+TMZ4INZtwC0xIZogjU=;
 b=ld8y+wMKb/s7r3EzzgAdDUBqeRSUTxab1atzUIsMKibn8eHUWGrjOmGM6/YgPj02Qz
 rw8QKNyH4vrhcxbj32IwpTWTApu69p4ZmabO0yaLqrme9her2VZy01NuSFX6yUy2paSm
 dEYJZoailYFXYAYw0TF3Z9RbPObzDP8vK8Elmi+Mw60S7ldBn+3V9avaFh5Y2eTUHm0t
 YDVzA9wPOe/svabOHL6f3vTf5EINTMGvHjEGofgHRSqc8ujoY7cwXQOWPhBDj5vhXZUV
 M+kPkCvwyaTrE7M1Gknl/f6Rnx3Gds0kO2YzuX0ddpYwpDe15qV8z5Zh7rJ8KovHhVwY
 i5Mw==
X-Gm-Message-State: AOJu0YyA78bEYr02p4x8vVSULda7ccPsVZH9JU/fi9vT6y/6mInVf3X/
 tXI+2jbIA6KFbydWvyLpw/XX4165qz7TxGps7kHmhXR0faJlzPVr6N2wXA==
X-Google-Smtp-Source: AGHT+IHjJeXrgEa01bnU/VUiSuam7zlfWnFfla6TzRQXRNQxmTRg566bJAooTQPxh+2WfuSP7saSDA==
X-Received: by 2002:a50:8a9d:0:b0:5a1:7362:91d9 with SMTP id
 4fb4d7f45d1cf-5a479a75685mr2822653a12.22.1721586747208; 
 Sun, 21 Jul 2024 11:32:27 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-8013-5d90-9d2a-226a.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:8013:5d90:9d2a:226a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d6bf8sm4855043a12.18.2024.07.21.11.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 11:32:26 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 20:32:23 +0200
Message-Id: <20240721183223.2792367-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721586747; x=1722191547; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2DskSaCcD7xBYfXvMw6hQkc1+TMZ4INZtwC0xIZogjU=;
 b=H3mb0xcqhc/PV9dvTkBSjaIMbT1jUM3cS3dkzVc1NFvJg9SFzSRBHSiu/YmOraiFFL
 CmzV479iSV32r/+5F2f+gH65ucekXM0XVSQZldBEqFm+gEJN9DMgI1VmtgAfUp5v7AtJ
 iXa0iBXLjXHQnFoOFo9iBp+zZN2nAlTwuoPANF42m7kVilDfcGueTmZo9KSH+rzXng3e
 01Jb9ZcPMI2/RKS+wRZI68cztH2m2t0YykTKPrNvtXTtkD+0bxDMdD2I1a8Ojy24ARe3
 pccH19Zvjd13vIPQ16gDhAYP1/yUf/wFwsFOflbmBj0FR2D2xMbjc19ehgTp+oR7vKeX
 6cOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=H3mb0xcq
Subject: [Buildroot] [PATCH 1/1] package/parsec: new package
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hardware/platform abstraction service for TPMs, HSMs, and Root of Trust

https://github.com/parallaxsecond/parsec.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...pile-errors-with-latest-Rust-version.patch | 40 +++++++++++++++++++
 package/parsec/Config.in                      | 15 +++++++
 package/parsec/parsec.hash                    |  3 ++
 package/parsec/parsec.mk                      | 12 ++++++
 6 files changed, 72 insertions(+)
 create mode 100644 package/parsec/0001-Fix-compile-errors-with-latest-Rust-version.patch
 create mode 100644 package/parsec/Config.in
 create mode 100644 package/parsec/parsec.hash
 create mode 100644 package/parsec/parsec.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 333e26d74e..a072e8cb13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2862,6 +2862,7 @@ F:	package/biosdevname/
 
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
+F:	package/parsec/
 F:	package/parsec-tool/
 F:	package/procs/
 F:	package/mxt-app/
diff --git a/package/Config.in b/package/Config.in
index a0d78518b6..8a7c257c85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1589,6 +1589,7 @@ menu "Crypto"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
+	source "package/parsec/Config.in"
 	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
diff --git a/package/parsec/0001-Fix-compile-errors-with-latest-Rust-version.patch b/package/parsec/0001-Fix-compile-errors-with-latest-Rust-version.patch
new file mode 100644
index 0000000000..9dcfefedae
--- /dev/null
+++ b/package/parsec/0001-Fix-compile-errors-with-latest-Rust-version.patch
@@ -0,0 +1,40 @@
+From e2ada92b71d8b70e0e771b469f48cc8a07ef11a5 Mon Sep 17 00:00:00 2001
+From: Saeed Kazemi <kazemi.ms@gmail.com>
+Date: Sun, 21 Jul 2024 18:46:38 +0200
+Subject: [PATCH] Fix compile errors with latest Rust version
+
+Upstream: N/A not applicable directly but based on:
+https://github.com/parallaxsecond/parsec/commit/82320d345e08fe6310b684191151c78fc5648693
+
+Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
+---
+ src/key_info_managers/on_disk_manager/mod.rs | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/key_info_managers/on_disk_manager/mod.rs b/src/key_info_managers/on_disk_manager/mod.rs
+index 717b93d..a4bf935 100644
+--- a/src/key_info_managers/on_disk_manager/mod.rs
++++ b/src/key_info_managers/on_disk_manager/mod.rs
+@@ -79,8 +79,8 @@ impl ApplicationName {
+ }
+ 
+ #[allow(deprecated)]
+-impl std::fmt::Display for ApplicationName {
+-    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
++impl fmt::Display for ApplicationName {
++    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+         write!(f, "{}", self.name)
+     }
+ }
+@@ -489,7 +489,7 @@ impl OnDiskKeyInfoManager {
+             fs::remove_file(&key_name_file_path)?;
+         }
+ 
+-        let mut mapping_file = fs::File::create(&key_name_file_path).map_err(|e| {
++        let mut mapping_file = File::create(&key_name_file_path).map_err(|e| {
+             error!(
+                 "Failed to create Key Info Mapping file at {:?}",
+                 key_name_file_path
+-- 
+2.34.1
+
diff --git a/package/parsec/Config.in b/package/parsec/Config.in
new file mode 100644
index 0000000000..378e8b58b4
--- /dev/null
+++ b/package/parsec/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PARSEC
+	bool "parsec"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Hardware/platform abstraction service for TPMs, HSMs, and
+	  Root of Trust
+	  PARSEC is the Platform AbstRaction for SECurity, an
+	  open-source initiative to provide a common API to hardware
+	  security and cryptographic services in a platform-agnostic
+	  way. This abstraction layer keeps workloads decoupled from
+	  physical platform details, enabling cloud-native delivery
+	  flows within the data center and at the edge.
+
+	  https://github.com/parallaxsecond/parsec.git
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
new file mode 100644
index 0000000000..f411a1cad5
--- /dev/null
+++ b/package/parsec/parsec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  d9eaf0612bbe61475701ba3ef8ade40dae2da2d45366064748a7a2215aa060d1  parsec-1.3.0-cargo2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.mk b/package/parsec/parsec.mk
new file mode 100644
index 0000000000..fa8bf66172
--- /dev/null
+++ b/package/parsec/parsec.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# parsec
+#
+################################################################################
+
+PARSEC_VERSION = 1.3.0
+PARSEC_SITE = $(call github,parallaxsecond,parsec,$(PARSEC_VERSION))
+PARSEC_LICENSE = Apache-2.0
+PARSEC_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
