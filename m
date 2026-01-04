Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC10C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C263A80E2F;
	Sun,  4 Jan 2026 13:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTreXbDUTlXN; Sun,  4 Jan 2026 13:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 819BE80E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767534495;
	bh=R739bhOnQsygLP0Wi1fC86dmmcgKKhhs9apgDiKiJa4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Niqsx1Qt+iHt3KqhgRR6p3HK5WtqtqCw4CuUw+Tiduy1OPANFzkjrDH6MbNiCljSV
	 cLFXDwSm4zengyycOQ2p3+40C2KI5yvZQYPRJnIVsgE9sucgMqzdD8LPXiyAYUZDOY
	 aGg+yjSHXBPnhf3hT0D8wQQSLJtKLici2HtgCNFHJB4K99QhwZlaRP7CLvOhBQz8nm
	 Dv8ZVYIlCPEcZzm+WiSQTTwmiLAwSRSycupGtcEr84Agu0Jr4GDfTEZfIzoVo4hVIt
	 jWEv747/hNvRD+pXHMOyEz73a0+k4l93SUfxFDjYNEFLr5I88x2E3Ru1fcH40PXrfW
	 HOhASXnrHIu9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 819BE80E29;
	Sun,  4 Jan 2026 13:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 875C42DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DE0040210
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-S2aDvKxbHy for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BBE2401FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BBE2401FF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BBE2401FF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:48:11 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 18B2F19F5A5;
 Sun,  4 Jan 2026 14:48:07 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Julien Olivain <ju.o@free.fr>
Date: Sun,  4 Jan 2026 14:47:55 +0100
Message-ID: <20260104134755.1786447-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767534489;
 bh=Vf6ReUfA/ka1LxeVU3xueY781JQNrkkkxVmIcQzhuR4=;
 h=From:To:Cc:Subject:Date:From;
 b=G8njoohy8Ys6ugPIUCbNdPFaE2MWtA0JgmPtAE1xXoW8JnvqbPcc0R92aylEysnfx
 5rHHJacMazIelP1TgYGaty9bVA2YrpuiGdBC7AyavxMuITSqsaYiDp0E1oKAmgF8Jj
 0bQ+Or7cS4lCmpSxR8o9r4p+Y/Q68XLiIaoi5vZ6fEiyMOZqegqObC3NzzjDEHORGv
 QdVwuMdvcGimLE+mBJUoosazW7Tbonxw69TFdQrZg6ZERBDG1HQRb4f3+qkOP+gne+
 Psjsg0Sg91UScCQlv71+8DKTjjwpjRBcYDYwA1laqSEBzZnFlmcLMafWO2yc37E6nX
 x3AbdZFxglt8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G8njoohy
Subject: [Buildroot] [PATCH v2 1/1] boot/edk2: add a new Kconfig option to
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
Change v1 -> v2:
- move extra options at the end of EDK2_BUILD_OPTS (Thomas)
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
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
