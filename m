Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E69CFA459
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 17:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9548680511;
	Wed, 23 Oct 2024 17:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sp9_rPo_7AfZ; Wed, 23 Oct 2024 17:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A942C80A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A942C80A50;
	Wed, 23 Oct 2024 17:36:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E191427F2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C303180A50
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jxf1KimCIvYe for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 17:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFB8180511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFB8180511
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFB8180511
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:36:39 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a3a03399fbso531325ab.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 10:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729704998; x=1730309798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gekzQBC+hnaW0hEy74agZhpikqHuRiiOZLCelbRU2eE=;
 b=WhVHEoI4f4sEk4A4Vy9fztaTNBzO9IBh9v75Q4rm3aTwbkqSZNzkhPIzlomLmw/Wna
 4eLOuzMh5dQwahjXVH1TST6x9+n5OEjsJLOxT8FvBjXSYIrluliA3GuCBsyu2VgPz4xj
 ZJDXYWtXACp7a3SOaili4Y6Doz87ajShZI4/BCxJLCx6cFElFkIU20++saI4MSiwGH3D
 DUua1vnyK9U5SLN+Xnk5JDrSqLkQ9/bapNhAcq2piHkyHiyXYoulUvLalJT33WhYgJWf
 hBxTcaPu1GFyOkM/eK0jJ9EpLO1CmOXD14S5u4826+JGRaOAUD6r+tavpSvmR4HnMgdo
 vtXQ==
X-Gm-Message-State: AOJu0YyHuKXiWD1spX5nh5Qc2EV6gN/OujtKhVE7xbU23S5bu4V/LN5r
 50vaM2qLEUloPDbrhM0u3F01dickdKcZMWCI+3XtTnp+0xgYj7R4Sh3Mdw==
X-Google-Smtp-Source: AGHT+IFoHY83n8AQqmC4w52wIo29GHe5kHjpcMa9rC9B7CNbd+Ko6JddXOqdywBN58sv/sHB5KWRKw==
X-Received: by 2002:a05:6e02:1885:b0:3a2:f7b1:2f70 with SMTP id
 e9e14a558f8ab-3a4d59e9b5dmr39201345ab.21.1729704998473; 
 Wed, 23 Oct 2024 10:36:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a630571sm2212912173.147.2024.10.23.10.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 10:36:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Anisse Astier <anisse@astier.eu>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Wed, 23 Oct 2024 11:36:31 -0600
Message-Id: <20241023173631.3304943-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023173631.3304943-1-james.hilliard1@gmail.com>
References: <20241023173631.3304943-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729704998; x=1730309798; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gekzQBC+hnaW0hEy74agZhpikqHuRiiOZLCelbRU2eE=;
 b=j7LklWPyssqSjSew9X9KM1jUiZbDSR2UV4pfj2OqPqnpzZc9tjguXKe0WFH1idRthW
 tPHg/cTB/7QhtfQ9b2FVFEWZfbyDazVD0GnMlq8YoIOk4h/8OSwiysmHSA2i4bbD1dTN
 boEqB9jaW6EdukOdcvgoL71vSxHX/RZzQ4r8+0koSzIzLRq9m4X8Gf3kTs4vjVSsTL/S
 /O08Rf8aFVyip6yUlNSHfMG+GC5U4/uNGj7AY5XF/cTLg5i+Q0Fla5fRBi2cntQwbFS+
 IXKcv9nG1vF1SlLA/XcLhu0N2VS2YP5OhYsqlNI3hafmx7VFMjaHd7N3W0+jEsjoC7jB
 ZRjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j7LklWPy
Subject: [Buildroot] [PATCH 2/2] package/netbird: new package
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/netbird/Config.in    | 10 ++++++++++
 package/netbird/netbird.hash |  3 +++
 package/netbird/netbird.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/netbird/Config.in
 create mode 100644 package/netbird/netbird.hash
 create mode 100644 package/netbird/netbird.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c649d3d6f2..3f23beb326 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1520,6 +1520,7 @@ F:	package/libucontext/
 F:	package/lilv/
 F:	package/lv2/
 F:	package/neon-2-sse/
+F:	package/netbird/
 F:	package/pipewire/
 F:	package/python*
 F:	package/rtl8192eu/
diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..e03ea59683 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2541,6 +2541,7 @@ endif
 	source "package/ndisc6/Config.in"
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
+	source "package/netbird/Config.in"
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netbird/Config.in b/package/netbird/Config.in
new file mode 100644
index 0000000000..b2e1eb6fd5
--- /dev/null
+++ b/package/netbird/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETBIRD
+	bool "netbird"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Connect your devices into a secure WireGuard-based
+	  overlay network with SSO, MFA and granular access
+	  controls.
+
+	  https://github.com/netbirdio/netbird
diff --git a/package/netbird/netbird.hash b/package/netbird/netbird.hash
new file mode 100644
index 0000000000..2e493d1a7e
--- /dev/null
+++ b/package/netbird/netbird.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6dc1b40d23e4c5ef71e0dfdb504ff5cd8238e3eef6e2fed682adc0ffb9c769b3  netbird-0.29.1-go2.tar.gz
+sha256  c9f34c452ac8f054df592e3eeca0e271b91e8010c0fc6cf8c76aabf547a9388d  LICENSE
diff --git a/package/netbird/netbird.mk b/package/netbird/netbird.mk
new file mode 100644
index 0000000000..4fb1d80c86
--- /dev/null
+++ b/package/netbird/netbird.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# netbird
+#
+################################################################################
+
+NETBIRD_VERSION = 0.29.1
+NETBIRD_SITE = $(call github,netbirdio,netbird,v$(NETBIRD_VERSION))
+NETBIRD_LICENSE = BSD-3-Clause
+NETBIRD_LICENSE_FILES = LICENSE
+NETBIRD_GOMOD = github.com/netbirdio/netbird
+NETBIRD_BUILD_TARGETS = client
+NETBIRD_DL_GOPROXY = https://proxy.golang.org
+NETBIRD_LDFLAGS = \
+	-X github.com/netbirdio/netbird/version.version=$(NETBIRD_VERSION)
+
+define NETBIRD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/client $(TARGET_DIR)/usr/bin/netbird
+endef
+
+define NETBIRD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIREGUARD)
+endef
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
