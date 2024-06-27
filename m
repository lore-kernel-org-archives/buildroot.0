Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A87DC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B6BD41A9F;
	Thu, 27 Jun 2024 07:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4_e0vklj8I8; Thu, 27 Jun 2024 07:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92F7A41A83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92F7A41A83;
	Thu, 27 Jun 2024 07:55:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D11B81BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA59B80C9A
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Spi44VuPRqx for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:54:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B06A880C92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B06A880C92
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B06A880C92
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-424acfff613so19689695e9.0
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 00:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474888; x=1720079688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFDhLGiOW25zh83co6yMbwrhKLQ5/lgMKRjiNPIuYm0=;
 b=dRHl763JO22i8rzZa0s4UlsUmBJqsP6khpoIidZ3ffj8ODcKwE0ZAtYjBOlFsI/SsZ
 Lh2tdQuqdf9Ygz5rJnBjT1VylCHysAxLoYjlOWyOz7O/OYE2oIsestoWhSbGid05Lgo+
 QAu+SAgXtVGBqy78XKVaE6ThfNhZ/JNStC8/wvuFhvVKa/UDE7l6FiaarMKM3Iqt2YKs
 8ADxMcfXcttnS3Jvffg3Pp22LyT+gZOPCjck798pS4I7e4agK4MNBYNgAoZW3oTIGF80
 yRHlCwF9KwrkXRsJpmIh/UjFP+KtD5respMGReaeEMX+i/sJzC/DgQcbF39tI0sqDarD
 AoNA==
X-Gm-Message-State: AOJu0Yw+evT37yxNvo6/OBoNAp6Z/Usx26mN5F4lWmW91W4ImCJL6TLY
 WyltBCaJcFrk/YlbSbc/yneqgGWcNbxIP0+ElA20ZI9TrziWzYoozm3APPjpNs+5Qcux14kY3s+
 P
X-Google-Smtp-Source: AGHT+IGWBOuRV34xDnl8WNPnqJE4T2ZzQNc6X20fFhgtqkC0bhHEYVFYY/SeMe97C4XbVkhCmGDPJw==
X-Received: by 2002:a05:600c:4fc9:b0:424:8dc4:ee3f with SMTP id
 5b1f17b1804b1-4248dc4ef5bmr111760305e9.32.1719474887836; 
 Thu, 27 Jun 2024 00:54:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ee67sm991923f8f.110.2024.06.27.00.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:54:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 09:54:41 +0200
Message-ID: <20240627075441.4116645-7-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240627075441.4116645-1-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1719474888; x=1720079688; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFDhLGiOW25zh83co6yMbwrhKLQ5/lgMKRjiNPIuYm0=;
 b=NdY6/jHo9Cha94CooWPN2XXd5fsdYdcu4j1Qt/hN+l/tjCa1HbiOlVclgv7Dv3dpDX
 pKEGuTUTQ6USfI2Af0TdHhmEUn53UKcMgg/z0x9qmJ3MfaNhBD+7MnBecr8suJFVMbV7
 HA0Dje4sULO94qmfPS/UidXeODTIUcoBs7kd0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=NdY6/jHo
Subject: [Buildroot] [PATCH 6/6] package/tpm2-pkcs11: install tool script
 (tpm2_ptool)
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

tpm2_ptool script appear on several TPM2 tutorial and it's packaged as
"tpm2-pkcs11-tools" package on several Linux distribution.

Add a new tpm2-pkcs11 option to install tpm2_ptool script along with
its dependencies.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/tpm2-pkcs11/Config.in      | 22 ++++++++++++++++++++++
 package/tpm2-pkcs11/tpm2-pkcs11.mk | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
index 5d45703223..93aa4a847a 100644
--- a/package/tpm2-pkcs11/Config.in
+++ b/package/tpm2-pkcs11/Config.in
@@ -11,5 +11,27 @@ config BR2_PACKAGE_TPM2_PKCS11
 
 	  https://github.com/tpm2-software/tpm2-pkcs11
 
+if BR2_PACKAGE_TPM2_PKCS11
+
+config BR2_PACKAGE_TPM2_PKCS11_PYTHON_TOOLS
+	bool "Install python tools (tpm2_ptool)"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-bcrypt, python-cryptography
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	select BR2_PACKAGE_PYTHON_TPM2_PYTSS # runtime
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	help
+	  Enable Python-related tools (tpm2_ptool)
+
+comment "python tools needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+
+endif
+
 comment "tpm2-pkcs11 needs a toolchain w/ dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index 18f04157e3..c6218d772e 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -44,4 +44,24 @@ TPM2_PKCS11_CONF_OPTS += \
 	--with-p11kitconfigdir=/usr/share/p11-kit/modules
 endif
 
+ifeq ($(BR2_PACKAGE_TPM2_PKCS11_PYTHON_TOOLS),y)
+TPM2_PKCS11_DEPENDENCIES += python-tpm2-pytss
+
+define TPM2_PKCS11_BUILD_TOOLS
+	(cd $(@D)/tools; \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+		$(HOST_DIR)/bin/python setup.py build)
+endef
+TPM2_PKCS11_POST_BUILD_HOOKS += TPM2_PKCS11_BUILD_TOOLS
+
+define TPM2_PKCS11_INSTALL_TARGET_TOOLS
+	(cd $(@D)/tools; \
+	$(PKG_PYTHON_SETUPTOOLS_ENV) \
+		$(HOST_DIR)/bin/python setup.py install \
+		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
+		--root=$(TARGET_DIR))
+endef
+TPM2_PKCS11_POST_INSTALL_TARGET_HOOKS += TPM2_PKCS11_INSTALL_TARGET_TOOLS
+endif
+
 $(eval $(autotools-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
