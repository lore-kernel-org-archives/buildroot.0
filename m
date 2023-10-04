Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05880E7C4C2
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 14:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B416161427;
	Wed,  4 Oct 2023 14:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B416161427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BG3Fputq4m4; Wed,  4 Oct 2023 14:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E9C61441;
	Wed,  4 Oct 2023 14:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E9C61441
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 006781BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE564826B0
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE564826B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIjOLn4Qa3ow for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 14:23:25 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6363B82628
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 14:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6363B82628
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5384975e34cso3978381a12.0
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 07:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696429403; x=1697034203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1OL0V21Ch14FWuztAcXzz/7NLtXoO8OzqD8siWpFhM=;
 b=WI8ZfyFPRbonOWIVtemU5tGE10UKX6WjWYQOV5rhaLq3X/qkpm5K2i6WAu7WgFWZ1h
 W1wtEcgZ2ZpUrmWYXqvzR3K0adlgLN/wMHhzdKrnkyHNx13MShHJTRBP7aT3H4aWH3hn
 5woFpS53aVDP6dim94eXabNnSlw3I6YC/eQqxrCvpT4GQ60HLgL54S/0V02QQWd7yOpF
 IhmM7pXPnvMP8iCI6R88wIU+kEsKQT2ybTrz6/VOCcGtHXD8O2lxeVifb3SCHfJIUdx8
 Nz2nVxax/AWCNj29PRY7LVtLGa8X/C6JOOwejtkEMrrud+dv2iyOUg/xPFxEqTzMJNmW
 ZgRw==
X-Gm-Message-State: AOJu0Yyyibpzop+b2cR+3xO3G0XhML7GvG/O3v6WScXcwfJMZ7TAnBFD
 5xDbQa8eRWCvYToC8dX4AkRCcZcZBtC4Dt15QgKAdw==
X-Google-Smtp-Source: AGHT+IEB374nRRC+QHRf1YqMAuSqGkUgt89UKFUeUCNEJLUhWZw3MN1DTvatkj6SFJpfASh+CjZJ+Q==
X-Received: by 2002:a17:906:76d2:b0:9a9:f14a:22fa with SMTP id
 q18-20020a17090676d200b009a9f14a22famr2235185ejn.16.1696429403352; 
 Wed, 04 Oct 2023 07:23:23 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 dv7-20020a170906b80700b009a5f7fb51dcsm2851805ejb.42.2023.10.04.07.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 07:23:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 16:23:01 +0200
Message-ID: <20231004142303.203520-6-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004142303.203520-1-thomas.perale@essensium.com>
References: <20231004142303.203520-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696429403; x=1697034203; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1OL0V21Ch14FWuztAcXzz/7NLtXoO8OzqD8siWpFhM=;
 b=Ex+qEwDNtmaUxzhaXFgcd8CWDdG3R2wJPUrVSMfxtUTDGcAOSXM6IheDDel/jpoR9W
 RWt+Ddpah5jPmu+M1IwgJeFgmMbfq+ku27OY6zoxaUn4pNoDWCHus5gqPSHNsMlOmlTr
 EZlKJvBsyrlIEYrrwlIkwDnExWDR5X560EraVjlm66Ldr1J/U2+WelFwSKANfUtklhWb
 kiPZlXPI1pw94eg93soIdaVGAdZOIlfy890NZfjJVh5Tal+jp0dUOXt+0Ri4VrCX0S7P
 MdpWq9QyhsyGP449gh1kTgM90KUSK0q4oPx3WdLim1pBMkIaI2chilQmad2RE/wND0a6
 ZyGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=Ex+qEwDN
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Perale <thomas.perale@mind.be>

This package provides a pre-built version for the host-go virtual
package introduced in the previous commits.

host-go-bin install a pre-built version of the Go compiler.

The menuconfig entry for host-go is updated to expose the host-go-bin
provider. The dependencies are set as such as if host-go-bin does not
support the host architecture it will automatically fall back to
host-go-src and vice-versa.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/Config.in.host        | 15 ++++++++++++---
 package/go/go-bin/Config.in.host | 14 ++++++++++++++
 package/go/go-bin/go-bin.hash    |  8 ++++++++
 package/go/go-bin/go-bin.mk      | 19 +++++++++++++++++++
 4 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 package/go/go-bin/Config.in.host
 create mode 100644 package/go/go-bin/go-bin.hash
 create mode 100644 package/go/go-bin/go-bin.mk

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 742d484420..b3906fbae5 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -30,11 +30,11 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS || BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_GO
 	bool "host go compiler"
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	help
 	  Compiler for the Go language
 
@@ -44,7 +44,8 @@ if BR2_PACKAGE_HOST_GO
 
 choice
 	prompt "Go compiler variant"
-	default BR2_PACKAGE_HOST_GO_SRC
+	default BR2_PACKAGE_HOST_GO_SRC if BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	default BR2_PACKAGE_HOST_GO_BIN if BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH_SUPPORTS
 	help
 	  Select a Go compiler variant.
 
@@ -52,9 +53,16 @@ choice
 
 config BR2_PACKAGE_HOST_GO_SRC
 	bool "host go (source)"
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
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
@@ -64,5 +72,6 @@ config BR2_PACKAGE_PROVIDES_HOST_GO
 
 endif
 
+source "package/go/go-bin/Config.in.host"
 source "package/go/go-bootstrap-stage1/Config.in.host"
 source "package/go/go-bootstrap-stage2/Config.in.host"
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
index 0000000000..3952014f44
--- /dev/null
+++ b/package/go/go-bin/go-bin.hash
@@ -0,0 +1,8 @@
+# sha256 checksum from https://go.dev/dl/
+sha256  b93850666cdadbd696a986cf7b03111fe99db8c34a9aaa113d7c96d0081e1901  go1.21.1.linux-386.tar.gz
+sha256  b3075ae1ce5dab85f89bc7905d1632de23ca196bd8336afd93fa97434cfa55ae  go1.21.1.linux-amd64.tar.gz
+sha256  7da1a3936a928fd0b2602ed4f3ef535b8cd1990f1503b8d3e1acc0fa0759c967  go1.21.1.linux-arm64.tar.gz
+sha256  f3716a43f59ae69999841d6007b42c9e286e8d8ce470656fb3e70d7be2d7ca85  go1.21.1.linux-armv6l.tar.gz
+sha256  eddf018206f8a5589bda75252b72716d26611efebabdca5d0083ec15e9e41ab7  go1.21.1.linux-ppc64le.tar.gz
+sha256  a83b3e8eb4dbf76294e773055eb51397510ff4d612a247bad9903560267bba6d  go1.21.1.linux-s390x.tar.gz
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
