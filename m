Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA66C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 019F540120;
	Thu, 27 Jun 2024 07:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZVF0EGmNItB; Thu, 27 Jun 2024 07:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B10F41A74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B10F41A74;
	Thu, 27 Jun 2024 07:55:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10ABA1BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 756C9409E0
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofoftx5TmbJ2 for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2D6840523
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D6840523
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2D6840523
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 07:54:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4256788e13bso48885e9.2
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 00:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474886; x=1720079686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gy2D5A2q0BRpPbunZ+NjeM1LKbpNtI21rEbjGZy1Rck=;
 b=GNwrsWsAYcPuAjtZw2xf20pE7vhGU6rR02sZa8Ur9oqWeJBIBQkmKlqEsxjmiFXwdq
 o7GE7axRqyYie+XGBmMFDVPnVFkdiQWnzShU/mDoFF2liX3ESoYQm9VigQvPrrTFdrPk
 nPkS61FBYLtnIOvP/SLPVDgBeUshkIOCM5CE5vxY72Ggo16WQj0+fmCMepDCr3ZfH4MP
 eoIEL3+1IR/vmWA0DHKM9bsjRvkkey8dRAxs7QZyhdYRuwlyHiLx3QTtgLAASQq2V0/t
 qExJt6YQGv8gQKvX3Z5KuzlODZC2XkZo1lYuU4jnV75z4Li2I9UgJ9z/9EIRSu9PAkb2
 /5cA==
X-Gm-Message-State: AOJu0Yw0vSr9uhlsaHppZQr7kqn1euU/FgxMfv8sT/p6MPx+PSmnQ8HM
 TimMuQYFwlHcRMY4SbRPyLKvWcdm/2nZh6Q1kLl/lDsXRXTNNVUFY/uOo5ib+HEJ2/STIIDCYpN
 S
X-Google-Smtp-Source: AGHT+IGZsXvfj8QL+gesh6jFBkg4QC+kBz3xio3AVNpWZIfdkm/5TWYfsrSOF4W3jHEghlMiDW3lFw==
X-Received: by 2002:a05:600c:982:b0:424:a58b:4078 with SMTP id
 5b1f17b1804b1-424a58b4162mr44404295e9.32.1719474885810; 
 Thu, 27 Jun 2024 00:54:45 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ee67sm991923f8f.110.2024.06.27.00.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:54:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 09:54:37 +0200
Message-ID: <20240627075441.4116645-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240627075441.4116645-1-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1719474886; x=1720079686; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gy2D5A2q0BRpPbunZ+NjeM1LKbpNtI21rEbjGZy1Rck=;
 b=Apl/2GDXzWvqwyUYSfnfidNi8CKeUblu+lN9ul7Vy75EaJJQlMBQd4stTTXy2beNWN
 yoXkrNkoyfAt4IjYfNKftFZjvo7sHTW4Agx1g6Gic1Os60lzPItqsGOwGWOHvQAd+FA+
 sNwTEMhww4nuZmHy/6vqg2HffAZNE7oPw21vI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Apl/2GDX
Subject: [Buildroot] [PATCH 2/6] package/tpm2-openssl: new package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/tpm2-openssl/Config.in         | 17 +++++++++++++++++
 package/tpm2-openssl/tpm2-openssl.hash |  3 +++
 package/tpm2-openssl/tpm2-openssl.mk   | 19 +++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/tpm2-openssl/Config.in
 create mode 100644 package/tpm2-openssl/tpm2-openssl.hash
 create mode 100644 package/tpm2-openssl/tpm2-openssl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a5cceba78..423fb2dd64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2780,6 +2780,7 @@ F:	package/supertux/
 F:	package/supertuxkart/
 F:	package/terminology/
 F:	package/tk/
+F:	package/tpm2-openssl/
 F:	package/upower/
 F:	package/waffle/
 F:	package/xenomai/
diff --git a/package/Config.in b/package/Config.in
index 550fdc1f41..20fd8a965a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1574,6 +1574,7 @@ menu "Crypto"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
+	source "package/tpm2-openssl/Config.in"
 	source "package/tpm2-pkcs11/Config.in"
 	source "package/tpm2-tss/Config.in"
 	source "package/trousers/Config.in"
diff --git a/package/tpm2-openssl/Config.in b/package/tpm2-openssl/Config.in
new file mode 100644
index 0000000000..0e151a94d3
--- /dev/null
+++ b/package/tpm2-openssl/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_TPM2_OPENSSL
+	bool "tpm2-openssl"
+	depends on !BR2_STATIC_LIBS # tpm2-tss
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_TPM2_TSS
+	help
+	  Provider for integration of TPM 2.0 to OpenSSL 3.0.
+
+	  tpm2-openssl is based on a major refactoring of the
+	  tpm2-tss-engine. The code is still there, but largely
+	  reshuffled to match the new OpenSSL API.
+
+	  https://github.com/tpm2-software/tpm2-openssl
+
+comment "tpm2-openssl needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-openssl/tpm2-openssl.hash b/package/tpm2-openssl/tpm2-openssl.hash
new file mode 100644
index 0000000000..ee15ee885f
--- /dev/null
+++ b/package/tpm2-openssl/tpm2-openssl.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  2ee15da2dceae1466ffba868e75a00b119d752babc1b6a2792286336a3324fb0  tpm2-openssl-1.2.0.tar.gz
+sha256  7ffba9d66226eb67abb9747ce1cd47477d566143a8ded597bbd974c6fb5fe9f5  LICENSE
diff --git a/package/tpm2-openssl/tpm2-openssl.mk b/package/tpm2-openssl/tpm2-openssl.mk
new file mode 100644
index 0000000000..ed590c2f47
--- /dev/null
+++ b/package/tpm2-openssl/tpm2-openssl.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# tpm2-openssl
+#
+################################################################################
+
+TPM2_OPENSSL_VERSION = 1.2.0
+TPM2_OPENSSL_SITE = https://github.com/tpm2-software/tpm2-openssl/releases/download/$(TPM2_OPENSSL_VERSION)
+TPM2_OPENSSL_LICENSE = BSD-3-Clause
+TPM2_OPENSSL_LICENSE_FILES = LICENSE
+TPM2_OPENSSL_INSTALL_STAGING = YES
+TPM2_OPENSSL_DEPENDENCIES = host-pkgconf openssl tpm2-tss
+
+# Provide --with-modulesdir to avoid using abs_builddir and DESTDIR
+# (also defined as absolute path) at the same time to define modules
+# install path (am__installdirs).
+TPM2_OPENSSL_CONF_OPTS = --with-modulesdir="/usr/lib/ossl-modules"
+
+$(eval $(autotools-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
