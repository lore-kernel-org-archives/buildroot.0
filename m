Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E2FD10F28
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 20:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3239461480;
	Sun, 17 Nov 2024 20:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpdLTAOSFd9C; Sun, 17 Nov 2024 20:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F2A2614AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F2A2614AE;
	Sun, 17 Nov 2024 20:19:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BB1FDB2
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F034C614AE
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 20:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5X0_Xw-2dUZ for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 20:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAD3961480
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD3961480
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAD3961480
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 20:19:07 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:4a2:8c06:3742:179a])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id BCC842003DC;
 Sun, 17 Nov 2024 21:19:01 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, zer0@droids-corp.org, robin@jarry.cc,
 Vincent Jardin <vjardin@free.fr>
Date: Sun, 17 Nov 2024 21:17:44 +0100
Message-ID: <20241117201744.31404-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <31efd2663d1b8e193e49c0cc76113384@free.fr>
References: <31efd2663d1b8e193e49c0cc76113384@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731874745;
 bh=Lmr9MaWpisfhakSKLPlJcodOPSsGNllY8z0Nv78iEAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IigA3PIqCc8SyhfgiHXQ9mi2mcQ7tfta3YADp4LO6GWMmGHaDY8Yn3tAg5hWDgg03
 uO0fn6hQR18xgxcVWdt7jJ25o5oupN0w+SH/HtvbQ9/KxbE5NrSSan1ozoRnIt9Vc+
 tZ+NE8iGpSfj1ppV1SSZSOX3hAILHghEIQwKITfXQvx/lpFbmTmRRwiQz6kSP3w0cE
 y2SCLzT6qRaWCpbW1TwQmDw7I1u7OrSX07pNnbs8eu+C8UyoMp5xL8kU8WrYG4DT+U
 AWbAioENWoQQ/VJJef7d7YTdvz0alDk8aQNvKoCeAuI9ILugX5Gs50OpZKcc8PKzLK
 IXjOlhuSy0n/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IigA3PIq
Subject: [Buildroot] [PATCH 1/1] package/libecoli: new package
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

Add a new smart library for CLI / command line.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libecoli/Config.in     |  7 +++++++
 package/libecoli/libecoli.hash |  3 +++
 package/libecoli/libecoli.mk   | 17 +++++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/libecoli/Config.in
 create mode 100644 package/libecoli/libecoli.hash
 create mode 100644 package/libecoli/libecoli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..a44c79e66a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
+F:	package/libecoli/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..278c82bb05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2337,6 +2337,7 @@ menu "Text and terminal handling"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
 	source "package/libcli/Config.in"
+	source "package/libecoli/Config.in"
 	source "package/libedit/Config.in"
 	source "package/libenca/Config.in"
 	source "package/libestr/Config.in"
diff --git a/package/libecoli/Config.in b/package/libecoli/Config.in
new file mode 100644
index 0000000000..765a8b9e5c
--- /dev/null
+++ b/package/libecoli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBECOLI
+	bool "libecoli"
+	depends on BR2_PACKAGE_LIBEDIT
+	help
+	  libecoli is the best library to develop a CLI
+
+	  https://github.com/rjarry/libecoli/
diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
new file mode 100644
index 0000000000..0540ef7270
--- /dev/null
+++ b/package/libecoli/libecoli.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  0da8f953e054dd2ba75a0d1dcbbc8830b76747282035e1d1de6082ec3bb6f995  libecoli-0.2.0.tar.gz
+sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
new file mode 100644
index 0000000000..c46f62b523
--- /dev/null
+++ b/package/libecoli/libecoli.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libecoli
+#
+################################################################################
+
+LIBECOLI_VERSION = 0.2.0
+LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
+LIBECOLI_INSTALL_STAGING = YES
+LIBECOLI_LICENSE = BSD-3-Clause
+LIBECOLI_LICENSE_FILES = LICENSE
+
+LIBECOLI_DEPENDENCIES = \
+	host-pkgconf \
+	libedit
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
