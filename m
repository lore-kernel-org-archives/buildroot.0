Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF436CA9EC7
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76CDC81138;
	Sat, 10 Oct 2026 15:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ioS9AKUZHuz; Sat, 10 Oct 2026 15:11:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4BDC681128
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645117;
	b=ZUU7UOdUDe6ZMAAdn92UysRavQArFu33KuWfjcCDykm0DPlS4Lh+KSADXfNsg7563myw
	 mzhCitXKo5Su2e3YW9kJyoDuVxGxXlbAlIKbSh1rvLCxAzSFKfcpFZfx9pXC9oYBFoi4g
	 wHjA6qBA6CqJwvXkZiX5VFF+DVN35MUExY6nAy0LgLvqXqv0GfXVk7SLPqVWJ/Zx14CFh
	 hMpY1vEHzkfErDKBksoegEzCtoW7S04DKgOjJ4mNgITGpqrNrGrGhwKmG1+rHjF2LTBYJ
	 blrrP2d9HN34+KhyQrmJpYOTVI8MrE2S1ejbYROWdG8e7+O8LkzdnVDIa3AUgGjdpjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8jcLqyFVXXXOHnV1TLoNNexa5EMvOPOhIl1d6lI6les=;
	b=WleNrstxZYHHTcrdc8HxXhOTrO7Obqub1f15rbZmTm0dOD4quKQnvoDxBqRO34/r9jrK
	 lYOzPcLE7f5nkGeLZC2VDrFh5qHqWR0dA2HHXgq3TzG8F5f4ONLq0I7gNyc0vGnqYW9Bl
	 XRLec+U0K/6fRWK/extZANsF7xZSCNHdoIBiWztIg+iaMRkCf+Q8+F2yFZGYMjYiqnOCS
	 UWDR4fZo4U0oArNN5cQzMy8J5WiccGFPjr+9Jmdako0n2zi7JVtSpvb6Nu5+Tu0E8c2H8
	 s7dSGx81ynZwzLoN3dpR+OroaxtsHhTI5NlufEOMJ3+GeWlxRxNyqGp5SCIHyTXG6yg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645117;
	bh=8jcLqyFVXXXOHnV1TLoNNexa5EMvOPOhIl1d6lI6les=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZE8OhjmXIUvuGcDveTuiDsFFloVcXMqXh5/+KNfouyuFx28JtbiLwuxSqX3QfErru
	 b2mEtR11GjNZ4Xe66fwZuzTUGyMQZVhrz78Mhty6i17SjWa35EIe/+gbe+fllBosr2
	 tNmYjeUhjud6YXWd3unNCUW3YpLEhijSxJSIWWL1VkwtaSoxtRnkTlBjjs2GLu5yyH
	 zdnFdjU5Tm6rSELfCe9NzZ/Ll5SQldjplSOLaBaS88EbDZibRh46DPzM0JLSfRYeWY
	 N4D37za+w6P8HAE7erMiXXBxs/S48sve+6qPdDd6eYV+IcoG5FQUBHINQWncNdAk7G
	 bdJwwu6PZ84AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BDC681128;
	Sat, 10 Oct 2026 15:11:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6939E317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FAC86064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0db3dRvgcr2 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:11:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E7C136065F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645112;
 b=TlIQ9H4I3dso6DAa/h4JExWP/orgj0ulFBmkbYLpvbOFAH7Vd2bl8o8C645I8k7mJgqj
 cDo7lGGGLpiLiEwe6xKz/AewdcjNKaXB6jF98neU5wRtB6a1Ir/jxQLXukaJN6SwIUe/d
 Bw3yrBfDCFl1NZp9BufMMAOeCpFPQncXElTbmenjev1Isoa1LcTDFW9J6Xx/bef7JZCYD
 DR7YLTF7QoW36sAkjacb4Erj9BlIuxx5/TCf0EODn8haVG/fJ+CSt2mbLtXxW3dvgYc7B
 24RIgZfup+HVlSQK6ohIl8zeb+w7DT6zvXw1yG+CSSBG0H9pNV+kQlpXVqzjMJkCFIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645112;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=R0aY+3sUdhFkUVZkNltmRumW9biHjTlIt0pf41tc9c4=;
 b=AfEJot7eUtaLv3KAL9wJg2AkXNTEWSlmRqUE7yBqlEPtJ6ak0Kios02iAIWPJiYNCoyP
 ucdfsD9MYBgLpF3XcUPrsfG+fFvVjFAU9DpI3Vxy/8NulUaTozxuoL76ucqHbh0xA481Q
 0vv0wqIKaMLY/XayTKkVBH5TxUNgdbDfUeuaWaVwrL99mxBA7kkxpyfhTm1D5DWaPOXeF
 2NJ2hkPs4WqhqX+IjCm8q/kETrMa3DKoK8+BevHDznTTnOfD1fVivAWO8tkkvy9b+9MgU
 lWrRvHb4wpyI889m4AcpkmJihsAkAB8u+WoIi9qYssYzo9tniOyCWWXZKjwyJWMGjXQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=O30qx8oc; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7C136065F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so6778305e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791645109; x=1792249909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R0aY+3sUdhFkUVZkNltmRumW9biHjTlIt0pf41tc9c4=;
 b=h4nTyFmyYYdtZt0R9sVJ5xOuqY4d2DGYXRtmEuuAryJ60V1F0n1flcamBMkdJ03hLK
 Qv3HiupbC5kKA4I7YByL5pvtNTS899xH7W4dYvRceXIhKlwMCmgl4+y43WIBgW0KOM18
 QmWWzCrzzI/rOLz+ySilNcvDWiz/XACFAAgxxwNIaLmF3t6GlBdBLv2VPy/hkYobquia
 mti9R10ScIDaFAtT1/b47Q84QjCqhgAaPa2XOo9eOUe0j3GoAz3hwa/aEy9BZ62EAtTW
 PqGawOPUzywvbuPPnYm2dGiM9TTdUsGqSxM7HoSiBdeytJQdNj1aOLn5ZRuokDoSdZd5
 80cg==
X-Gm-Message-State: AFq9FYI8Glg2Z+RtnhMuKjlyp5agU0cGaFB+CtY3AndGj18PllVZO9bd
 cm3h5wtLDmQdreaddWwFUs001gqQXcdeX6CLEU4Q0vFGIb8okct+sQ5c/6AgR8iaCXl0pgLZQuz
 bipcCsLU=
X-Gm-Gg: AYBFou36pjjvyKGAUvPQFHhnEo4a56jBEy5b/oyuevCshSTBaVfwiwkssE+uW1c1jah
 GyBbj2DEO2KVuvdyzYY8yoI4G8x8srWNP3vHdQSJDGnw0h7UHzT4HMIAEwZqWyM2PwOhC/FA71u
 m4x57h9PIZcNh0TR+nhum+UZBy9HebJmOFdKCVPQ8iwD8QhFuiGBSKeq0Hqitu1rGkZTNowW6zd
 6Pf385Qgf8yYh9z5TzXZkaPSzl/z8fODVNDDeBkzCMpw6+dsZqcXToyOK9ZmilIETyzjYXEpalL
 UULlhizNvlZmWhvhFBLrXSFF8DW/xBCI4+PXS/Acz7KlNhQrsF44BboC3V0ZACTvZTVrKpie9lB
 jRGDEn46X8k8kbFwp6F2Dwqpk8bN5H2Y1BLYNuPCZPORNN6DyxsKGsla7le4ZcIJIoI5eFOT6kY
 ETBl9kUwlxieF6Ac2/g2tWSZdgxM/jhy9RNSAS0SOHBOJRcHTTwvKDR6kI13+CIKKu2iGTV/iGP
 a6rZiAkuOLzxA8q0bYo79UBgyyoYPL+SwW09O+WNXoal2ouUUVHiSvqmyfXE+2Wdzvp8WF0Ng==
X-Received: by 2002:a05:600c:3b0a:b0:4a1:6fa9:48ad with SMTP id
 5b1f17b1804b1-4a18e4a9b9amr96983865e9.26.1791645109258; 
 Sat, 10 Oct 2026 08:11:49 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm115104125e9.0.2026.10.10.08.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 08:11:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:11:15 +0200
Message-ID: <20261010151121.876133-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010151121.876133-1-titouan.christophe@mind.be>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/7] */Config.in: replace bool entries with
 prompt within all choices
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: petr.vorel@gmail.com, ps.report@gmx.net, yann.morin@orange.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Linux commit bea2c5ef78 [1], first released in v6.13, the prompt of a
choice must be given with "prompt" instead of "bool".

[1] bea2c5ef78: kconfig: remove support for "bool" prompt for choice entries
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bea2c5ef789a37bace99f2f45eeef3be4559b228

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in                                                 | 8 ++++----
 boot/xilinx-prebuilt/Config.in                            | 2 +-
 fs/ext2/Config.in                                         | 2 +-
 package/docker-engine/Config.in                           | 2 +-
 package/efl/Config.in                                     | 2 +-
 package/freescale-imx/firmware-imx/Config.in              | 2 +-
 package/linux-headers/Config.in.host                      | 2 +-
 package/podman/Config.in                                  | 4 ++--
 package/xenomai/Config.in                                 | 2 +-
 system/Config.in                                          | 6 +++---
 .../toolchain-external-custom/Config.in.options           | 4 ++--
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Config.in b/Config.in
index 1fa7ea3ca7..7a2de62a2e 100644
--- a/Config.in
+++ b/Config.in
@@ -643,7 +643,7 @@ config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
 endif
 
 choice
-	bool "libraries"
+	prompt "libraries"
 	default BR2_SHARED_LIBS if BR2_BINFMT_SUPPORTS_SHARED
 	default BR2_STATIC_LIBS if !BR2_BINFMT_SUPPORTS_SHARED
 	help
@@ -823,7 +823,7 @@ comment "PIC/PIE needs a toolchain w/ PIE"
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
 choice
-	bool "Stack Smashing Protection"
+	prompt "Stack Smashing Protection"
 	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
 	default BR2_SSP_STRONG if BR2_TOOLCHAIN_HAS_SSP_STRONG
 	default BR2_SSP_REGULAR
@@ -887,7 +887,7 @@ comment "Stack Smashing Protection needs a toolchain w/ SSP"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
 choice
-	bool "RELRO Protection"
+	prompt "RELRO Protection"
 	default BR2_RELRO_FULL if BR2_TOOLCHAIN_SUPPORTS_PIE
 	default BR2_RELRO_PARTIAL
 	depends on BR2_SHARED_LIBS
@@ -933,7 +933,7 @@ config BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 
 choice
-	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
+	prompt "Buffer-overflow Detection (FORTIFY_SOURCE)"
 	default BR2_FORTIFY_SOURCE_1
 	depends on BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index ff129ed5b5..4cd4d75561 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -23,7 +23,7 @@ config BR2_TARGET_XILINX_PREBUILT_VERSION
 	  Must be xilinx_v2023.1 or newer.
 
 choice
-	bool "family variant"
+	prompt "family variant"
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_PACKAGE_VERSAL_FIRMWARE  # legacy
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL if BR2_cortex_a72
 	default BR2_TARGET_XILINX_PREBUILT_VERSAL2 if BR2_cortex_a78
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index c50f22626a..c1a943435e 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -10,7 +10,7 @@ config BR2_TARGET_ROOTFS_EXT2_2
 	bool
 
 choice
-	bool "ext2/3/4 variant"
+	prompt "ext2/3/4 variant"
 	default BR2_TARGET_ROOTFS_EXT2_2r1
 
 config BR2_TARGET_ROOTFS_EXT2_2r1
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 541472d957..a5464b772f 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -45,7 +45,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 	  Build the vfs filesystem driver for Docker.
 
 choice
-	bool "support docker-init"
+	prompt "support docker-init"
 	default BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT  # legacy
 	help
 	  Support providing a minimal init process for containers.
diff --git a/package/efl/Config.in b/package/efl/Config.in
index c4f82b92e3..583c1c6f52 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -200,7 +200,7 @@ comment "Wayland support needs udev /dev management, OpenGL ES w/ EGL, threads,
 		|| !BR2_ENABLE_LOCALE
 
 choice
-	bool "OpenGL support"
+	prompt "OpenGL support"
 	help
 	  libevas can be configured to use HW acceleration with OpenGL
 	  or OpenGL ES.
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 0acc235e0a..96220cfe66 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -65,7 +65,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 
 choice
-	bool "DDR training binaries"
+	prompt "DDR training binaries"
 	default BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
 	help
 	  Choose the DDR training binaries to be used depending on the
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b11db18379..8b0069a7df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -116,7 +116,7 @@ config BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION
 endif
 
 choice
-	bool "Custom kernel headers series"
+	prompt "Custom kernel headers series"
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	depends on !BR2_LINUX_KERNEL_LATEST_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
 	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION || !BR2_KERNEL_HEADERS_AS_KERNEL
diff --git a/package/podman/Config.in b/package/podman/Config.in
index bbcb15691d..97d0a0270a 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_PODMAN
 if BR2_PACKAGE_PODMAN
 
 choice
-	bool "support podman-init"
+	prompt "support podman-init"
 	default BR2_PACKAGE_PODMAN_INIT_CATATONIT
 	help
 	  Support providing a minimal init process for containers.
@@ -68,7 +68,7 @@ config BR2_PACKAGE_PODMAN_INIT_NAME
 	default "catatonit" if BR2_PACKAGE_PODMAN_INIT_CATATONIT
 
 choice
-	bool "Network backend"
+	prompt "Network backend"
 
 config BR2_PACKAGE_PODMAN_NET_PASST
 	bool "passt/pasta"
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 13a273a960..e2fcd90669 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_XENOMAI
 if BR2_PACKAGE_XENOMAI
 
 choice
-	bool "Xenomai version"
+	prompt "Xenomai version"
 	help
 	  Make sure that the selected version has a patch for your
 	  selected Linux kernel. If it does not, download and select a
diff --git a/system/Config.in b/system/Config.in
index 46a1cf5d59..4e575e461d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -56,7 +56,7 @@ config BR2_TARGET_GENERIC_ISSUE
 endif
 
 choice
-	bool "Passwords encoding"
+	prompt "Passwords encoding"
 	default BR2_TARGET_GENERIC_PASSWD_SHA256
 	help
 	  Choose the password encoding scheme to use when Buildroot
@@ -196,7 +196,7 @@ endchoice
 if BR2_INIT_SYSTEMD
 
 choice
-	bool "/var management"
+	prompt "/var management"
 	default BR2_INIT_SYSTEMD_VAR_FACTORY  # legacy
 	depends on !BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	help
@@ -398,7 +398,7 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  password!
 
 choice
-	bool "/bin/sh"
+	prompt "/bin/sh"
 	default BR2_SYSTEM_BIN_SH_BASH if !BR2_PACKAGE_BUSYBOX
 	help
 	  Select which shell will provide /bin/sh.
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 92c1d6a37d..68acc0a1a6 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -41,7 +41,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	  as external toolchain.
 
 choice
-	bool "External toolchain gcc version"
+	prompt "External toolchain gcc version"
 	help
 	  Set to the gcc version that is used by your external
 	  toolchain.
@@ -159,7 +159,7 @@ comment "GCC older than 4.8 is not tested by Buildroot. Use at your own risk."
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 choice
-	bool "External toolchain kernel headers series"
+	prompt "External toolchain kernel headers series"
 	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
 	help
 	  Set to the kernel headers version that were used to build
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
