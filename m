Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78918E7849A
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 12:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E9641E5D;
	Mon,  2 Oct 2023 12:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E9641E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vic1H7EUu-6y; Mon,  2 Oct 2023 12:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C54D41E86;
	Mon,  2 Oct 2023 12:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C54D41E86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1F171BF94D
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ABA24056B
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ABA24056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwn5CVRXMRWE for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 12:48:14 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CC6640120
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 12:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC6640120
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32483535e51so4486996f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 05:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250892; x=1696855692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1OL0V21Ch14FWuztAcXzz/7NLtXoO8OzqD8siWpFhM=;
 b=hbxvSWG31IJtxbbz9/cvsUloFk7RfqxjBP+2fjQzGcLrfZmiNQZMl6C+exRBBC9Ok5
 Atgf+7jGbTGrGrVOKGM/4FrB+xqNVO6CgwFWTw8sB8So0j/B1Th9R1iO4op2IEG3296S
 7ltMZkOTt2EslQJ6NtIckZ59wj5B636nM4RXJTj9Go1eCOKfS8qHaYn8WN6c3qPOD35Q
 NP5T60AQWYckIW7Ob12xNL1pdt56tU+SbvZQ0GL02KZPlhnj3Dm9SWJpNmew79tcVD2s
 L/7JverhYSUVa/c0tiXVKylyBIkTSXGWSu0YMsqeoetCPu6gnVnykx/xjVEgm3MYUJ2/
 2T6g==
X-Gm-Message-State: AOJu0Yze56YtuSB3CfeiQcEYAN/pMusCtWPinuKPZL+iTxRdnEyqnhX3
 tfm1xqpIZhx/TAM40PdsxwsyM5jM+O+/t9jbvIwE+g==
X-Google-Smtp-Source: AGHT+IFGKWkm8jPpb8FTy3mODMrkTYiv72NU/Xe3o3b3jyafMqdtcAyj7r4qT4UVW/g3hOFx8e2cgw==
X-Received: by 2002:a5d:68ce:0:b0:321:7844:de44 with SMTP id
 p14-20020a5d68ce000000b003217844de44mr8630237wrw.45.1696250891968; 
 Mon, 02 Oct 2023 05:48:11 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a17090635c300b0098951bb4dc3sm16688189ejb.184.2023.10.02.05.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:48:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 14:47:27 +0200
Message-ID: <20231002124736.179251-6-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002124736.179251-1-thomas.perale@essensium.com>
References: <20231002124736.179251-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696250892; x=1696855692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1OL0V21Ch14FWuztAcXzz/7NLtXoO8OzqD8siWpFhM=;
 b=c3kRVVtD5Os4gny/VGo/HX7FZbOvMxfYFUwgKla51ms1R3aGMGzxD2WHIP5LCFcWx6
 Ex9m4GbCV8FLWlM5q8R6zJ1mT9i20ySZIU39pTyMWrlO0mvdQBdvKy4+5iQx6Aauvn+I
 mGtEKbU3J6hlJ0serMow3e/qww7JqaDaewOW4jf9YS7o1sKaeZN3fnl2UMLU9HQGjhek
 xomW4gSMz1Qf1Op2HvqH1BHI+P1ptk2I2OrDSxCTqfQEpvGVcwY6XZcN2jU08f2E4dBv
 kf6eqgcMOQPQ/mWQt7aXi7Cl+ueiKjOelvx1qwLZ3LfL2msUPnq76TPTKKr+3aKQkZIo
 Gv4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=c3kRVVtD
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
