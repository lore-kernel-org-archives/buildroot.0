Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3C2CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9302B60F07;
	Wed,  6 May 2026 18:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2ADPOTaL6XZ; Wed,  6 May 2026 18:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C0DE60ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092985;
	bh=RG2s/SiktsEje+4Yoamj90Hxv23fSciISGuqeHyjK40=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJhHFuFrwAuAQom9BPza688RsV0vXLBFwacKAMLim+ShiKuSmsd2g6D0Gz2aOHvHM
	 wTmQQfe+5I34eCr6v3AoBMW40XuArWaS7Sn9KBCZA+qzP5d732/pWLPsAaVfuLNnsz
	 BEVM0A7LPe1LceNgOZoll7CvK9SYzdPKG1MK8YSWCzndZiO7EMK/fykDurfRUlkza5
	 dNEvAYHCUPZwm87dsZrPn33xeH5lcP78RY341HSrEHjcRLOZZ3OuTnirJ05smxBUMD
	 i6C59UbuJYPVpuWAhRPYQzyEns1a7HO0yaNnUa+gO5aXLCFXjOEd/X7Io/3EBZ9Q0W
	 mHZa/LTYaRBSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C0DE60ED2;
	Wed,  6 May 2026 18:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DEA4280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F467815D9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARaaTOKgWV9m for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:43:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 582D181585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 582D181585
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 582D181585
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70DA0A4C20EC;
 Wed,  6 May 2026 20:41:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-1vQV;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  6 May 2026 20:40:54 +0200
Message-ID: <20260506184057.665854-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092862;
 bh=nVE8YMqLn4E3doZ3xY81e5jIxx251FrS4bSXdyrFDM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UFgn2yVd2QNhykwmqL/Lb0jEuFzfuBL0p2q0eTW8UhJhw1BchNyEgeuxX0DJrF7mS
 +pt/fCrF88s8ju1Q5vxPafHA+0NALATZtiTlCfcJiCFnK57Bzf9K0P3Mx+IstC++9K
 H6JfePt15HU0OWW48bmhZEkdkVaVXatgBWb7pjYqSkisGJMCgev7MPL+Ew7edM6Wo9
 98/e81W9Ne20GDIsmZZOn90F5fvgOs3VM5Wxjq4au5xmELsk3Wuya96laVFJUebmdZ
 Hrj+P1Uf8naYlqzPQObtK0jXSViCaex9kSoSoHQlBFdmCUJ+EPWgYWo8rQ/Mu4YyxY
 2IL80U/o+FVww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UFgn2yVd
Subject: [Buildroot] [PATCH 10/12] package/igt-gpu-tools: only needs libudev,
 not udev daemon
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/igt-gpu-tools/Config.in        | 6 +++---
 package/igt-gpu-tools/igt-gpu-tools.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 00dc59a2ae..72d3f0b0db 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	depends on BR2_USE_WCHAR # elfutils, procps-ng
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
@@ -40,10 +40,10 @@ config BR2_PACKAGE_IGT_GPU_TOOLS_TESTS
 
 endif
 
-comment "igt-gpu-tools needs udev /dev management and toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
+comment "igt-gpu-tools needs libudev and a toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
 	depends on BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
+	depends on !BR2_PACKAGE_HAS_LIBUDEV || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR || \
 		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index 6e6d4278f1..953440368c 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -19,9 +19,9 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	libglib2 \
 	libpciaccess \
 	pciutils \
+	libudev \
 	pixman \
 	procps-ng \
-	udev \
 	zlib
 
 IGT_GPU_TOOLS_CONF_OPTS = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
