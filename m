Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC174C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 13:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98AE96137E;
	Fri, 12 Apr 2024 13:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uyjOBiVRg3t; Fri, 12 Apr 2024 13:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2CB613C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B2CB613C6;
	Fri, 12 Apr 2024 13:28:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC7931BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05D0B80F62
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WNCeNXQOWV8 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 13:27:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4DC580F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4DC580F73
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4DC580F73
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:27:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41550858cabso6763055e9.2
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 06:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712928462; x=1713533262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3czOovXis38tY7cs3+oBJAu6zfQuKyNbIXm78+9bc0=;
 b=wR3wBKihZamLUzEAqrd0vwAIjfhgDG891awlL0AGXiJfadfxmkcxVZEDsqSU3T1HxP
 cRF8E+/GK3Jp92KCCJj6BPK5ZWh7TS8CQhuAOfzSuBJctB1MZrWdY2sKv6P8MqKlRoyw
 8uDGNTWZpNmQxRvhsWn22RCrRclKhYNCenAHScgNverWk9bQPDPzVaXfEgcmJCqVYh0c
 54bEPkTMpKy47/dVPmx7ToUqPKbs312ZnMF0LjJHwWUgQkwKuOX5o6Kn3B4LJtzy+HW4
 n2az7YMyAKLg1G6PKjxIjXOcNwTU8AZ+d4vARwzDabQs2XCgVJ5fa8pVHf54WMq+qiDH
 3AWw==
X-Gm-Message-State: AOJu0Yy7V8tl1ALTzuyK5W2jbNhau5HRJuKkuue7jZCUT1BHFcwxIRr9
 yae7p7mYkyyGmwrO1L4fECFg4Z8M9DKByr7txxut+PYdEjGSwDzq+UXmCLHKaIXeP3TzxuLGqJn
 qm2U=
X-Google-Smtp-Source: AGHT+IFxlowv07QnTnkYwnQvG0yspt2R80OId93KoPlihfzhJlp3pXrhuc4feYt4cZ1f5xI0VzS5+Q==
X-Received: by 2002:a5d:69ca:0:b0:343:8a84:85f0 with SMTP id
 s10-20020a5d69ca000000b003438a8485f0mr1671177wrw.29.1712928461805; 
 Fri, 12 Apr 2024 06:27:41 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00343a66f6be4sm4288163wru.24.2024.04.12.06.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 06:27:41 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 15:26:57 +0200
Message-ID: <20240412132659.1168317-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412132659.1168317-1-thomas.perale@mind.be>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712928462; x=1713533262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3czOovXis38tY7cs3+oBJAu6zfQuKyNbIXm78+9bc0=;
 b=P5ZCOXRUjPR+dKOmzZShB0nEJHPd52KbQ0xI+0w1YSk/FTDCCHFd9rFHioBL8VkbMY
 FGluBBK8+ridiuHqoCIw/DuniRALUNx/aAB2IiTaOjC19f4t6AvyWUp4tk1qaC1E4Y2V
 jrSxChrxQ1x6btEgWMgy/Ou88fBSG30TqEb8W3mNlq5kds5pS0ouQiBCUmJzqP6yToub
 6+7AFt0nNNOUKxiBtkwCG6r6tdfWx3fJqJDqqk+PJVWq1nWvUnxn4jYD0eh3MRnDkgQN
 /kfVCrAf3YQ7EAXJHF1LNEQoVM1d3rAbDyJMr2orC5Cc+YC3TFBJg50Eh8dvtiSPAJdh
 6fZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=P5ZCOXRU
Subject: [Buildroot] [PATCH 5/6] package/go/go-bin: new go provider
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@aperture.us>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a pre-built version for the host-go virtual
package introduced in the previous commits.

host-go-bin install a pre-built version of the Go compiler.

The menuconfig entry for host-go is updated to expose the host-go-bin
provider. The dependencies are set as such as if host-go-src does not
support the host architecture, it will automatically fall back to
host-go-bin and vice versa.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/Config.in.host        | 14 ++++++++++++--
 package/go/go-bin/Config.in.host | 14 ++++++++++++++
 package/go/go-bin/go-bin.hash    |  8 ++++++++
 package/go/go-bin/go-bin.mk      | 19 +++++++++++++++++++
 4 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 package/go/go-bin/Config.in.host
 create mode 100644 package/go/go-bin/go-bin.hash
 create mode 100644 package/go/go-bin/go-bin.mk

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index a213ee94bf..c98e41483d 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -30,7 +30,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_GO
 	bool "host go compiler"
@@ -44,7 +44,8 @@ if BR2_PACKAGE_HOST_GO
 
 choice
 	prompt "Go compiler variant"
-	default BR2_PACKAGE_HOST_GO_SRC
+	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	help
 	  Select a Go compiler variant.
 
@@ -52,18 +53,27 @@ choice
 
 config BR2_PACKAGE_HOST_GO_SRC
 	bool "host go (source)"
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 	help
 	  This package will build the go compiler for the host.
 
+config BR2_PACKAGE_HOST_GO_BIN
+	bool "host go (pre-built)"
+	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	help
+	  This package will install pre-built versions of the compiler
+
 endchoice
 
 config BR2_PACKAGE_PROVIDES_HOST_GO
 	string
 	# Default to host-go-src
 	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
+	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
 
 endif
 
+source "package/go/go-bin/Config.in.host"
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
 source "package/go/go-bootstrap-stage3/Config.in.host"
diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
new file mode 100644
index 0000000000..b259afa197
--- /dev/null
+++ b/package/go/go-bin/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH
+	string "Translate the HOSTARCH into the architecture name used by the Go compiler"
+	default armv6l   if BR2_HOSTARCH = "arm"
+	default arm64    if BR2_HOSTARCH = "aarch64"
+	default ppc64le  if BR2_HOSTARCH = "powerpc64le"
+	default s390x    if BR2_HOSTARCH = "s390x"
+	default 386      if BR2_HOSTARCH = "x86"
+	default amd64    if BR2_HOSTARCH = "x86_64"
+	default ""
+
+config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
new file mode 100644
index 0000000000..298503c156
--- /dev/null
+++ b/package/go/go-bin/go-bin.hash
@@ -0,0 +1,8 @@
+# sha256 checksum from https://go.dev/dl/
+sha256  586d9eb7fe0489ab297ad80dd06414997df487c5cf536c490ffeaa8d8f1807a7  go1.22.2.linux-386.tar.gz
+sha256  5901c52b7a78002aeff14a21f93e0f064f74ce1360fce51c6ee68cd471216a17  go1.22.2.linux-amd64.tar.gz
+sha256  36e720b2d564980c162a48c7e97da2e407dfcc4239e1e58d98082dfa2486a0c1  go1.22.2.linux-arm64.tar.gz
+sha256  9243dfafde06e1efe24d59df6701818e6786b4adfdf1191098050d6d023c5369  go1.22.2.linux-armv6l.tar.gz
+sha256  32ea3dfef75d6a4d42a28a315148ba54c4f6f9a8dc93a522d421d13df0e6c3b7  go1.22.2.linux-ppc64le.tar.gz
+sha256  2b39019481c28c560d65e9811a478ae10e3ef765e0f59af362031d386a71bfef  go1.22.2.linux-s390x.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-bin/go-bin.mk b/package/go/go-bin/go-bin.mk
new file mode 100644
index 0000000000..6c5c1b6485
--- /dev/null
+++ b/package/go/go-bin/go-bin.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# go-bin
+#
+################################################################################
+
+GO_BIN_SITE = https://go.dev/dl
+GO_BIN_LICENSE = BSD-3-Clause
+GO_BIN_LICENSE_FILES = LICENSE
+
+HOST_GO_BIN_PROVIDES = host-go
+
+HOST_GO_BIN_SOURCE = go$(GO_VERSION).linux-$(call qstrip, $(BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH)).tar.gz
+
+define HOST_GO_BIN_INSTALL_CMDS
+	$(GO_BINARIES_INSTALL)
+endef
+
+$(eval $(host-generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
