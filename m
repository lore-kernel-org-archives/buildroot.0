Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13191C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC46281799;
	Mon, 15 Apr 2024 16:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtVFspyjuj_i; Mon, 15 Apr 2024 16:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 050E2818A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 050E2818A2;
	Mon, 15 Apr 2024 16:23:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3C401BF298
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0A92605EF
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3cXNxFO-hya for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:23:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72CDD605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72CDD605A6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72CDD605A6
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:23:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2da08b07157so40005371fa.1
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 09:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713198178; x=1713802978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1IS1RxscUIVKBo4j9PIX8w/HcuXYSi3gXv6SOhYQHg=;
 b=EEu60+VVL622I19ja7mMU7aqTgsmpMrezNyhKiS8byKjZDZsHMKIB2eqQlFTNniEVD
 +ZVSpGs1P8BR5DZ7sflAdzLVxyhPC2a+DMabtlCx4sBjR72LeWl1W9rFkeXK/Jb6ByI8
 pIDEMLe20fTGeyu+La45u8nmlTkhiov5EbH44S8E1Hhg20L21wkjT9IJXl9E9KHR3ch5
 7XWQ06qCICXe6up5gy0i15o268qKeKLuAwAynZCqYKnc1M9XGsbz5iPlcyvdTr/P5tZw
 yW5Q9bZmnEFn+e+QkoAXnFqrCNkXCMVnrXWi3AV2deTHjW8p4pKGJk6wxORa/K0lktMv
 5JXQ==
X-Gm-Message-State: AOJu0YwkxLoYdant8+8ASSCada41sZyoL+CCIG1xVMz+Mj5zUH/G3IAh
 XIf6KelJFAIfhMIQw6Lsmq+OFQH6IFvs8rCdmol2iJopg4lnOFb6oo0qUXJNbOTuP2HPFnG/3B+
 xTFQ=
X-Google-Smtp-Source: AGHT+IGyZGSyQH2WH4FINZ7uAkx8kRLHt9BS+Xwn/5vlquzs7iIFnSM959zRrwPvpGfpRWVLovmw+g==
X-Received: by 2002:a2e:7a19:0:b0:2d8:6fc4:d0b5 with SMTP id
 v25-20020a2e7a19000000b002d86fc4d0b5mr7580587ljc.8.1713198177982; 
 Mon, 15 Apr 2024 09:22:57 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b00418631f91c1sm4302938wmb.28.2024.04.15.09.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 09:22:57 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 18:22:26 +0200
Message-ID: <20240415162229.1357491-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415162229.1357491-1-thomas.perale@mind.be>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1713198178; x=1713802978; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1IS1RxscUIVKBo4j9PIX8w/HcuXYSi3gXv6SOhYQHg=;
 b=SCtXCb2n+iVaNqzZ3qDkCqtSxh1DhGGDrZgXj6LnVkYNQdeRFl+uIFeU6mkwNdw+bz
 mW16PMt+qey1kjMaXQ4p7/wUCskFIhbeNmlw/xU2ghHVwM7ITtv6ZdptCK14S/ZKbUQV
 kSBQmMp2Uk1l9V+DW5tJojXppsT+hExBh/afqqKe73s9LeSzLz5+Itlv39wh5cPnA9qE
 hQk89w/5Mg0Rk5jLfiMf6Qti/40pl0OGgfvVbxuPHdhxkXv+CXoUqnpnw/xJBGjZxxQq
 mt+cXf/Pgcfcb/bRUv33KShIpek9WQOhsoZXDMyANyU+wbjudgwPtfllQLY4W25USLPt
 1klA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=SCtXCb2n
Subject: [Buildroot] [PATCH v2 5/6] package/go/go-bin: new host-go provider
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
 package/go/Config.in.host        | 14 ++++++++++++--
 package/go/go-bin/Config.in.host | 14 ++++++++++++++
 package/go/go-bin/go-bin.hash    |  8 ++++++++
 package/go/go-bin/go-bin.mk      | 19 +++++++++++++++++++
 4 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 package/go/go-bin/Config.in.host
 create mode 100644 package/go/go-bin/go-bin.hash
 create mode 100644 package/go/go-bin/go-bin.mk

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 483393f8e4..7055e9f28a 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -30,7 +30,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS

 # Go packages should select BR2_PACKAGE_HOST_GO
 config BR2_PACKAGE_HOST_GO
@@ -41,7 +41,8 @@ if BR2_PACKAGE_HOST_GO

 choice
 	prompt "Go compiler variant"
-	default BR2_PACKAGE_HOST_GO_SRC
+	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	help
 	  Select a Go compiler variant.

@@ -49,18 +50,27 @@ choice

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
