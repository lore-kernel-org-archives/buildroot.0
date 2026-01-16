Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DDBC982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6856784003;
	Fri, 16 Jan 2026 20:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2L-NyvItbD1; Fri, 16 Jan 2026 20:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A19F183FEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768595158;
	bh=WosoUPnlfDWOjoOcVP4TcMwNY4tBxjNBlPUwqWWieaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=krMvAKLbLQpv0MpHz/UveMnjJhsR3aw6GTjp0TD0x2KzScmHJqB2trdfBWxHtGa30
	 +KxgfrCojX5MdqqywSjC7vytCN9k4ZUCk1CaTFiXTZSGaIlOodYWXZYWmgFPXkMDY4
	 UFg25Bb4Gkc3uzVmtOGZPKFMOee42Rl6dpDvSjrACOkyNFh0wypJ6quNp022ogmcGn
	 62vuLBUTH5otHmCY39UAZPUAFmN4dvpEBZG4QosUCnUsKiptCypC9MR79oWpX5aZs1
	 ilDqQSUJPbVMvmQs1PTzNdM2y2uWAx2AAiEj1zw+e1QRDmGV5kePSKjhWsGThxDlU3
	 Hv/vsnNhUweXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19F183FEA;
	Fri, 16 Jan 2026 20:25:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3C0223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE8941812
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vt8-D7M1bp7Y for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:25:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 986C041810
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 986C041810
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:25:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88C628864C; Fri, 16 Jan 2026 20:25:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 21:25:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99b4067859d0623dffcca743adc6ebe5c67a1bd2
X-Git-Newrev: 9868f67d38c598663b72e8d2b8878380303a76de
X-Patchwork-Hint: ignore
Message-Id: <20260116202555.88C628864C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: add a new Kconfig option to
 pass arbitrary build options
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9868f67d38c598663b72e8d2b8878380303a76de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/edk2/Config.in | 15 +++++++++++++++
 boot/edk2/edk2.mk   |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 850b9a39de..168fc296a2 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -130,6 +130,21 @@ config BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL
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
index 05e44c711b..2c089aefca 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -156,7 +156,8 @@ EDK2_BUILD_OPTS += \
 	-n $(BR2_JLEVEL) \
 	-a $(EDK2_ARCH) \
 	-b $(EDK2_BUILD_TYPE) \
-	-p $(EDK2_PACKAGE_NAME)/$(EDK2_PLATFORM_NAME).dsc
+	-p $(EDK2_PACKAGE_NAME)/$(EDK2_PLATFORM_NAME).dsc \
+	$(call qstrip,$(BR2_TARGET_EDK2_EXTRA_BUILD_OPTS))
 
 define EDK2_BUILD_CMDS
 	mkdir -p $(EDK2_BUILD_PACKAGES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
