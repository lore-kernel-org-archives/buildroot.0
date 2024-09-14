Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30063C021A1
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0C3242450;
	Sat, 14 Sep 2024 15:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tyWk2s5GSn0; Sat, 14 Sep 2024 15:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F3FB4245A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F3FB4245A;
	Sat, 14 Sep 2024 15:23:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8681BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 292FB40260
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfaZTUpNiL2K for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D13740179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D13740179
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D13740179
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:23:38 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so368159866b.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726327416; x=1726932216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRrFtMrc5I0O3sI71EcbjcyxkpG4FWxZNow6Zbx4SrM=;
 b=pw1L0vAuiNDz8Csh1/ghZJEjxp9V/LnsuvhoaqiDigylq6xgLLtxY4uh7pX0nK/wQx
 q4Q+h0n8qmzBeSnrLblC3cYomE6JrUyNkHbdjBKPgasEaKxKq9gzeOulPneDUFA25dR5
 dvT8zcE1i7oxRX0ZaFKJbHSNGIgyZqQw5g7l3heTyk5ONbyR2cVkyrsFxLAlLsyU1GPy
 keTTJd9c/FWk2zxS9c9YnB22YTzq7muLcrv9y6UoY1d1Di5AyGmiMa+jLKquQMHPJENS
 EpQHGrLBhdDp5xHyCemV42cWgaMbHzmJ3yOtgnOCtDWaT4/iow3phz16JLlU6b9JLyAq
 laBg==
X-Gm-Message-State: AOJu0Yw67GfqSYzFpK3meacvMB1pJSn17Jqr4HBhwZ3krzLshyj7Iz/j
 cSZcRTB/QH6DXqpjtUNkUee2qlroxd2HJip1wrHrtC9gnuVHD1cinmURLGPWCxD7/vn/gVUf4Gq
 s6KZQ3Q==
X-Google-Smtp-Source: AGHT+IEQ9aKEcg+VvS23gnw3exMqNU9y4OZho/Me3KH/jpILkWmyLIVdZFoYy3bZIkHzd+3qZ/ZFQw==
X-Received: by 2002:a17:907:6d14:b0:a8e:a578:2b63 with SMTP id
 a640c23a62f3a-a902966303amr1020325566b.55.1726327415722; 
 Sat, 14 Sep 2024 08:23:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::872])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061116c28sm91660066b.95.2024.09.14.08.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 08:23:35 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:23:22 +0200
Message-ID: <20240914152323.2630539-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914152323.2630539-1-thomas.perale@mind.be>
References: <20240914152323.2630539-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1726327416; x=1726932216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRrFtMrc5I0O3sI71EcbjcyxkpG4FWxZNow6Zbx4SrM=;
 b=KOUC3XgGyWLzt4DbXWW6DdD4j0xGzt8T7vkkozErZRV/qYtJezLeagW/js7Ts32YW2
 2X+gpQ2u9o6O3e9/qYLmOUGujEPfMKfRPkboCoH2XSC3H6T75H4Ag+RuecbstV9roLuV
 1zhAIE97zYly5LLOExwe/eW018xzNz7KwyqlFdf9NXyKB2xXd2tSHfc91I+i+fck1/5z
 JDhgJk8asQEtJDOwIdVSQTBka8H3y1SKb41dENe5RjYpFyjOC3R6PGR+nraZAj9hf51x
 AL1N/yoPIKKY+An9o/vaIz/ho7MMLLcduHuFdJPhVNOXOrA2wrvvs1vcJQQScAqbuZq9
 OrOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=KOUC3XgG
Subject: [Buildroot] [PATCH 1/2] package/go/go-bin: new host-go provider
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a pre-built version for the host-go virtual
package introduced in the previous commits:

 - host-go-bin installs a pre-built version of the Go compiler.

By default, host-go remains built from sources to keep the same
behavior as the former version.

The menuconfig entry for host-go is updated to expose the host-go-bin
provider. The dependencies are set as such as if host-go-src does not
support the host architecture, it will automatically fall back to
host-go-bin and vice versa.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/Config.in.host        | 22 ++++++++++++++++------
 package/go/go-bin/Config.in.host | 13 +++++++++++++
 package/go/go-bin/go-bin.hash    |  8 ++++++++
 package/go/go-bin/go-bin.mk      | 20 ++++++++++++++++++++
 package/go/go.mk                 |  2 ++
 5 files changed, 59 insertions(+), 6 deletions(-)
 create mode 100644 package/go/go-bin/Config.in.host
 create mode 100644 package/go/go-bin/go-bin.hash
 create mode 100644 package/go/go-bin/go-bin.mk

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index eefca03b02..435faec555 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
@@ -57,7 +57,8 @@ if BR2_PACKAGE_HOST_GO
 
 choice
 	prompt "Go compiler variant"
-	default BR2_PACKAGE_HOST_GO_SRC
+	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	help
 	  Select a Go compiler variant.
 
@@ -65,18 +66,27 @@ choice
 
 config BR2_PACKAGE_HOST_GO_SRC
 	bool "host go (source)"
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 	help
 	  This package will build the go compiler for the host.
 
-endchoice
+config BR2_PACKAGE_HOST_GO_BIN
+	bool "host go (pre-built)"
+	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	help
+	  This package will install pre-built versions of the compiler
 
-endif
+endchoice
 
 config BR2_PACKAGE_PROVIDES_HOST_GO
 	string
-	# Default to host-go-src, as the only provider for now
-	default "host-go-src"
+	# Default to host-go-src
+	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
+	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
+
+endif
 
+source "package/go/go-bin/Config.in.host"
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
 source "package/go/go-bootstrap-stage3/Config.in.host"
diff --git a/package/go/go-bin/Config.in.host b/package/go/go-bin/Config.in.host
new file mode 100644
index 0000000000..51fe3c3fdc
--- /dev/null
+++ b/package/go/go-bin/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH
+	string "Translate the HOSTARCH into the architecture name used by the Go compiler"
+	default "armv6l" if BR2_HOSTARCH = "arm"
+	default "arm64" if BR2_HOSTARCH = "aarch64"
+	default "ppc64le" if BR2_HOSTARCH = "powerpc64le"
+	default "s390x" if BR2_HOSTARCH = "s390x"
+	default "386" if BR2_HOSTARCH = "x86"
+	default "amd64" if BR2_HOSTARCH = "x86_64"
+
+config BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH != ""
diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
new file mode 100644
index 0000000000..12fd4c2816
--- /dev/null
+++ b/package/go/go-bin/go-bin.hash
@@ -0,0 +1,8 @@
+# sha256 checksum from https://go.dev/dl/
+sha256  3ea4c78e6fa52978ae1ed2e5927ad17495da440c9fae7787b1ebc1d0572f7f43  go1.22.5.linux-386.tar.gz
+sha256  904b924d435eaea086515bc63235b192ea441bd8c9b198c507e85009e6e4c7f0  go1.22.5.linux-amd64.tar.gz
+sha256  8d21325bfcf431be3660527c1a39d3d9ad71535fabdf5041c826e44e31642b5a  go1.22.5.linux-arm64.tar.gz
+sha256  8c4587cf3e63c9aefbcafa92818c4d9d51683af93ea687bf6c7508d6fa36f85e  go1.22.5.linux-armv6l.tar.gz
+sha256  5312bb420ac0b59175a58927e70b4660b14ab7319aab54398b6071fabcbfbb09  go1.22.5.linux-ppc64le.tar.gz
+sha256  24c6c5c9d515adea5d58ae78388348c97614a0c21ac4d4f4c0dab75e893b0b5d  go1.22.5.linux-s390x.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-bin/go-bin.mk b/package/go/go-bin/go-bin.mk
new file mode 100644
index 0000000000..155483a2fc
--- /dev/null
+++ b/package/go/go-bin/go-bin.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# go-bin
+#
+################################################################################
+
+GO_BIN_SITE = https://go.dev/dl
+HOST_GO_BIN_ACTUAL_SOURCE_TARBALL = go$(GO_VERSION).src.tar.gz
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
diff --git a/package/go/go.mk b/package/go/go.mk
index 4c56660651..f48d25d415 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -71,6 +71,8 @@ HOST_GO_TARGET_ENV = \
 	$(HOST_GO_COMMON_ENV) \
 	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GO386),GO386=$(GO_GO386)) \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
 	CGO_CFLAGS="$(TARGET_CFLAGS)" \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
