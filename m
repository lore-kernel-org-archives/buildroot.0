Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D8BC83029
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 18:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63B7680B32;
	Mon, 30 Jun 2025 18:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkZhNR7yhHAs; Mon, 30 Jun 2025 18:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6430084869
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6430084869;
	Mon, 30 Jun 2025 18:59:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C0ED1C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 18:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D83E613AA
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 18:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLuJkO7xxy1T for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 18:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EA9960F8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA9960F8F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EA9960F8F
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 18:59:16 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B4CDCB0053E;
 Mon, 30 Jun 2025 20:59:11 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Julien Olivain <ju.o@free.fr>
Date: Mon, 30 Jun 2025 20:58:54 +0200
Message-ID: <20250630185854.9826-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751309954;
 bh=uuQv/fLUysw/hxrXO4PMCq5Cn5sdV3tA3rxro5FCw4Y=;
 h=From:To:Cc:Subject:Date:From;
 b=kAogHDWrGkMjyUyIiLzn+K0fChihUXlF+j8PqqgvNr5CXriEfGktP2tzZEQ+6PWr8
 5pBO4Jdu5nbUuZC7OjGowl/FW99YZ/4TzhH87cfi0CP6z14uy2hFv8JjN3fUnLVhiH
 ZXMSHLgQ6Dl0lyGexivf7jpyDMLQgeUqq0V8ccoWNY26lE7BFESf+xQD+y9pLxqH5i
 tsGEsDHI0okEaQcWedkcVQhRtcs3h/mN7kYG2QvMi/UiTNA3ZzHUALloAdm+8BdEiY
 fMAi2csFcEsEq3n54LXWcP4qS3ym/Sm++E6AYQd2P5kbgtk5Z4n8AMHjIxDuLIxsbT
 t+8sZ1xHywHPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kAogHDWr
Subject: [Buildroot] [PATCH 1/1] boot/edk2: add a new Kconfig option to pass
 arbitrary build options
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

EDK2 build may include extra options. Those are usually in the form
of "-D SOMEFLAG_ENABLE" and might be specific for a processor
architecture or a platform. For example:
"-D NETWORK_HTTP_BOOT_ENABLE", "-D NETWORK_TLS_ENABLE", ...

Those options are generally documented in their respective packages.
See for example:
https://github.com/tianocore/edk2/blob/master/OvmfPkg/README

This commit adds a new Kconfig string option to let the use define
arbitrary build flags.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/edk2/Config.in | 15 +++++++++++++++
 boot/edk2/edk2.mk   |  1 +
 2 files changed, 16 insertions(+)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 635bb0100a..eda15df2a1 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -119,6 +119,21 @@ config BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL
 	  See OVMF README:
 	  https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
 
+config BR2_TARGET_EDK2_EXTRA_BUILD_OPTS
+	string "Extra build options"
+	help
+	  EDK2 build may include extra options. Those are usually in
+	  the form of "-D SOMEFLAG_ENABLE" and might be specific for a
+	  processor architecture or a platform. For example: "-D
+	  NETWORK_HTTP_BOOT_ENABLE", "-D NETWORK_TLS_ENABLE", ...
+
+	  Those options are generally documented in their respective
+	  packages. See for example:
+	  https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
+
+	  This configuration is an arbitrary string that will be
+	  passed to the build command.
+
 config BR2_TARGET_EDK2_FD_NAME
 	string
 	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_I386
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 36bcbfc88b..57d45e5fca 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -146,6 +146,7 @@ EDK2_BUILD_ENV += \
 	GCC5_$(EDK2_ARCH)_PREFIX=$(TARGET_CROSS)
 
 EDK2_BUILD_OPTS += \
+	$(call qstrip,$(BR2_TARGET_EDK2_EXTRA_BUILD_OPTS)) \
 	-t GCC5 \
 	-n $(BR2_JLEVEL) \
 	-a $(EDK2_ARCH) \
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
