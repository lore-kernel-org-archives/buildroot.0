Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EBDC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 07:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF6B60796;
	Tue, 23 Jul 2024 07:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D56GpUKLyTJV; Tue, 23 Jul 2024 07:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF24B607A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF24B607A4;
	Tue, 23 Jul 2024 07:04:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A82021BF2C8
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 07:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 952844019A
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 07:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-P4jaRAsn_s for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 07:04:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 083F4400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 083F4400D7
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 083F4400D7
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 07:04:46 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so62750641fa.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 00:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721718284; x=1722323084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmEp8bAOj1XVm/g1aoq/3B14ygphE4EiFSxZt8DRQ+o=;
 b=xARt+3Lbx/jlT4jBYuPdD5bAf+AE+IVaKULvOwfMCUU9XqDQes+MM6AN7ITg4xG3XN
 BQTCdd0h7AQKkXbZTmn7mmcyFNlb41sIXgcOj9JSAF7Ht574t/E0O2J6v3mEyON1rtqO
 ZuDGiwoUnvAldOGdZ5CjmOXdlk99SBWbzoFK3vQhTo3uLvQL0aN6+cDE4R7xQGTJLUVT
 64AVbjpLuRT41H/usI0UogRH4gE8DgXf/n0wVHh44r0K0CvtXqx193HXUNPnYPf8AwBH
 +OxcHtF0jjERjg7Bu1vtRsMjB6F72xHCO2NEftjQGfIJmHIRmunS9WbquoN2FUV2bvFw
 jHxA==
X-Gm-Message-State: AOJu0Yx7NajvbmzOa8nyN51PYNjnz6pbhaJrqvA2YuuEu3oZF0PaSSAh
 sqF6O7MrL/aOEAjjYqZG0HU/ctHrvTH2YKHHhM0+qkz1Ne2Pd0KMx2mqxA==
X-Google-Smtp-Source: AGHT+IEU4Oi9vnAiO0rAOkUCC9yZwtx+IdZ6LIg2bvCkf57KhiUTUCUHXZdfygmiBjNAkgKyWwfjhA==
X-Received: by 2002:a2e:9684:0:b0:2ef:2f53:c300 with SMTP id
 38308e7fff4ca-2ef2f53c391mr34760941fa.28.1721718283388; 
 Tue, 23 Jul 2024 00:04:43 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-1f25-5d4f-52bb-2df8.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:1f25:5d4f:52bb:2df8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c7d38f7sm7141018a12.88.2024.07.23.00.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 00:04:42 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 09:04:39 +0200
Message-Id: <20240723070439.4119145-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721718284; x=1722323084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WmEp8bAOj1XVm/g1aoq/3B14ygphE4EiFSxZt8DRQ+o=;
 b=YVTio5ks6ZRq3hMtYNShyrakqpmpcfuNxk1cdnL+kB66DykmcG45wb8TGhc4goYiPB
 oC51/HXxz58f4b1wP7tZCda9vMSzF778P6TPAlTIhBfcapKfF2rV17VzKB9QuHNAkFfb
 4LI6kWX72qxkbzsrdf9BlU2XzfWsfztu+YbksedDARB5yQiXnFwEuYiMZKnSsbWf1Arl
 3H+y79+zkfg80kwKjm/V+tZjqsZerGa7xc08H2OsNu7Omb4l46MtQkootZdTqOTR6aQm
 wzXZo3rhCIyH/iLMRrVsflJeNrP8LTySA98ciUF7dzB/3pdO6+hkqHXKNdP4A8sp56NV
 gEcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YVTio5ks
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
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/parsec/Config.in   | 15 +++++++++++++++
 package/parsec/parsec.hash |  3 +++
 package/parsec/parsec.mk   | 12 ++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/parsec/Config.in
 create mode 100644 package/parsec/parsec.hash
 create mode 100644 package/parsec/parsec.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3650321d6f..58d6368339 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2866,6 +2866,7 @@ F:	package/biosdevname/
 
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
index 0000000000..e1d7b4fbc9
--- /dev/null
+++ b/package/parsec/parsec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0b69c30c7e40c65e3c74450e0baf1e3f821ffa624a6dc7aa49f5aa976c42fda0  parsec-1.4.1-cargo2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.mk b/package/parsec/parsec.mk
new file mode 100644
index 0000000000..eec9f4d7a3
--- /dev/null
+++ b/package/parsec/parsec.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# parsec
+#
+################################################################################
+
+PARSEC_VERSION = 1.4.1
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
