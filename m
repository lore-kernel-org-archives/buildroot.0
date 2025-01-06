Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA86E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 20:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C293880F6B;
	Mon,  6 Jan 2025 20:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmO2c3vd_Uoq; Mon,  6 Jan 2025 20:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39BF81141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C39BF81141;
	Mon,  6 Jan 2025 20:35:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4AA1DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 929A04017F
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JF0AYaVpraD0 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 20:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51B6F40174
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51B6F40174
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51B6F40174
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:35:09 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so167231381fa.1
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 12:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736195706; x=1736800506;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JHVBp4bEh0XippbmbX7f0n1z3q2O+73utc4XiSFJlzY=;
 b=dPEN9z9A31gU97nh1P6f70CSqUIF9pPP/hgcW2eDuQXylqi6gcrt7173mi3Pqtd3E5
 4EgLBdRNPmhb3IRG4VMSP5gpfbp1tZiYj4PIlW8zdm89YUnw0jVJ1t9wddICfqtqn4TJ
 rKW5A3K5DwKq7X6iWKbzaTLMK3xaWGnYm1uRPbLNEt40IxRnhOugvIDH1mfU2MMqghPj
 YxQQ0Gd6vmj8c6ULzoqQmug3PBqbtWZdn3nIzvYZvXOac0D/m3CymeQmSKYjs06b0xOH
 I54YaxK6fip8gSqgEQALb9h7OqRF/2E2dcU6slHho/bLamzVE6guR7zqZB6VsVs9Ewfn
 bimw==
X-Gm-Message-State: AOJu0Yx/V0EuDXvxmbwJ6J9dG+xcItLTOzrB6DmLnuMqDRvQCaC3Pn5Q
 Y+bqIZNvMJ20igvCg3NwTpcR+q714FZEYBWwXh/Jq3KqaC1Hlsd/0zXsBJim
X-Gm-Gg: ASbGncsZagVHnjx2kuplTprtXTyClURM8b1fDr2gRLEh7e0PovuJB8rL+4pnNsxd8Ab
 NpiT3walBhnr7MPmKCufRnni7NwjZ6BrZgtNBODTOJ605VaPw4QbJQJ/5kUVMHlzNUhhJ3wgG0D
 F+4XwyB9VDuwsn82ekYNBxCfN7S8iBXAT27rj+Zk2DMDz/SnKnJVByUq7BMAEaKuaSNK0WnPjOX
 UiXIvvw20ogh9TzNS80M+11KgJD39rp0wU=
X-Google-Smtp-Source: AGHT+IHfjTLna9xvWg2r/3XbRKBuArX2xX8h0lZWq6QiomFRmk7y9YwnaRMPwJMm+BI5QNqBcBMRlQ==
X-Received: by 2002:a2e:a595:0:b0:2ff:cc65:68aa with SMTP id
 38308e7fff4ca-30468608c3emr196630681fa.31.1736195706110; 
 Mon, 06 Jan 2025 12:35:06 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6c5a0sm57125301fa.22.2025.01.06.12.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 12:35:04 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  6 Jan 2025 21:34:59 +0100
Message-ID: <20250106203459.2875914-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736195706; x=1736800506; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JHVBp4bEh0XippbmbX7f0n1z3q2O+73utc4XiSFJlzY=;
 b=UiWQAiL/pMIFQPGm+Uu5LZP/XR+HClZCteM+BXfAVujSDF7+Ibpf5q2Nqe44T/MO/w
 rAAoL3QIW0+z7gZzsBcPpkauWAr5c4weEvvU9+MG17i2In9pJhKDAahJv7y5PatL/ea+
 Q59QTdj0To1yQj/jpA4GCgav12W43wUuQu+UPvJWIufYjXUAGo/7qQpDFwkcRXIlP0Dd
 V/eyR9F2caeMycN0rJKVhCC+iHPFNAXogpXeuJphMJtsdynH+lrtXKH1ONiYZkbk5sBz
 Um8sj1IJwL7j/pvJ4apPeBptjt4Umup1GeVz6UWI74PCj2E59xaha7gF8et24NVWlL9+
 R+qQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UiWQAiL/
Subject: [Buildroot] [PATCH 1/1] package/frr: make vtysh group configurable
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

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/frr/Config.in | 8 ++++++++
 package/frr/frr.mk    | 7 ++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index c26b160b2a..9b9ad6f331 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -24,6 +24,14 @@ config BR2_PACKAGE_FRR
 
 if BR2_PACKAGE_FRR
 
+config BR2_PACKAGE_FRR_VTYSH_GROUP
+	string "FRR vtysh group, default: frrvty"
+	default "frrvty"
+	help
+	  This setting controls the group a user must be member of to connect
+	  to vtysh.  E.g., on systems with an admin user, which may be member
+	  of the 'wheel' group, it may make more sense to use 'wheel' here.
+
 config BR2_PACKAGE_FRR_BMP
 	bool "BMP protocol"
 	select BR2_PACKAGE_C_ARES
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 921ef99665..9ec4d3af4f 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -37,6 +37,7 @@ FRR_CONF_ENV = \
 
 # Do not enable -fplugin=frr-format for production, see doc/developer/workflow.rst,
 # it is only intended for FRR's developments
+FRR_VTYSH_GROUP=$(call qstrip,$(BR2_PACKAGE_FRR_VTYSH_GROUP))
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
 	--localstatedir=/var/run/frr \
@@ -48,7 +49,7 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--enable-shell-access \
 	--enable-user=frr \
 	--enable-group=frr \
-	--enable-vty-group=frrvty \
+	--enable-vty-group=$(FRR_VTYSH_GROUP) \
 	--enable-fpm
 
 HOST_FRR_CONF_OPTS = --enable-clippy-only
@@ -107,12 +108,12 @@ define FRR_PERMISSIONS
 	/etc/frr/daemons f 640 frr frr - - - - -
 	/etc/frr/daemons.conf f 640 frr frr - - - - -
 	/etc/frr/frr.conf f 640 frr frr - - - - -
-	/etc/frr/vtysh.conf f 640 frr frrvty - - - - -
+	/etc/frr/vtysh.conf f 640 frr $(FRR_VTYSH_GROUP) - - - - -
 	/etc/frr/support_bundle_commands.conf f 640 frr frr
 endef
 
 define FRR_USERS
-	frr -1 frr -1 * /var/run/frr - frrvty FRR user priv
+	frr -1 frr -1 * /var/run/frr - $(FRR_VTYSH_GROUP) FRR user priv
 endef
 
 define FRR_INSTALL_INIT_SYSV
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
