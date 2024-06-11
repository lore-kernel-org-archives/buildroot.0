Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5EFC27C75
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 176F160EF4;
	Tue, 11 Jun 2024 18:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InP5hrM1FWYF; Tue, 11 Jun 2024 18:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3940360EE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3940360EE4;
	Tue, 11 Jun 2024 18:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07DBF1BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D1C81F8E
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjEIvlaA0XMs for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0303481F81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0303481F81
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0303481F81
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:02:15 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-6818e31e5baso4887638a12.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128935; x=1718733735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OvBCQY8I6yWCTPgYtQLx2cAyAcXKCqjehwm67Nkj0vQ=;
 b=lxmwS0DxSMPsELVMof/ydtXW0mS2LQKJBLWMdoRrO/4pQKiBBJHQqdjln2UfQGpDFH
 5mjLGINmhPpZTw8UGvHhPrk3qNIVKlnFwCDYzSK0MqC3rTrrhLhl0PfypTN9DWvWcJi0
 sA9AhQDXmOv0SEcR7+AebSZ8DM7DgSXEjYnlaohF5Kyl78Ot65okt0F45CEpNXLoK+H9
 hgv1jT3aVcIdbNp+8Wfk9zMU+8DExCkBbXP6Ha0nsVcoG3caSAxJc2gDpcncxQ8Q76ZV
 svqFuGRkWy/OkqkQJayusyeXhgOWmPMRZlO85Ox/z1KQ8jpbNy8N3MpoDV8iXmAS9WPt
 lOMw==
X-Gm-Message-State: AOJu0YyGACPjiuij7wglGTfYlxQ7hek1kwYv5oQ8W2pMTrKHqljcQnNx
 8fj3vZT9F+MLMJbhwuqvPR/BaV3jpA/LsomAR6F3PanMTKZI9/V/bA1JQkvu
X-Google-Smtp-Source: AGHT+IExhn0gC2hwgNCU3FBeDPFJA/iZgxq5PPsq43qNl8goL37ZQF60O0PpkndsXxxkdWjoNoomHw==
X-Received: by 2002:a17:90a:8c93:b0:2bf:ea42:d0c3 with SMTP id
 98e67ed59e1d1-2c2c3dec791mr11412366a91.16.1718128934888; 
 Tue, 11 Jun 2024 11:02:14 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c2fbde41ccsm5673927a91.11.2024.06.11.11.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:02:14 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:02:02 -0700
Message-ID: <20240611180207.2138847-4-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180207.2138847-1-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128935; x=1718733735; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvBCQY8I6yWCTPgYtQLx2cAyAcXKCqjehwm67Nkj0vQ=;
 b=DzmLhSjeuXjbqtjj3Z8EbRMdC8fbq8o5rLEDDSTMvQVW8Ou2lbeUa99lO/aTDUtTXU
 vICpXgkBftGJlcA9TtbTfHPMdBWpTNMk+tOovUJNzx5f6YT0ViwcxaZU76uMpA6hQ1Dr
 W49BnzcvzeCq3HPQL0sdYI66n0xjkkyJ0SpnCVvUFLj6Zdv33yEDThnITEnWVnSX4hge
 KihJ2pTRaLI1rEPTsXbRmDJdvN6cSCiUeEWgwb9X5dk2Sj1UJxkQ0H36174/QfXkGaG9
 L0a+Tflbyio6D3FQTrTS0C/VRRWjeyXLh3AQi50wxlrkw3JQXvFQiGOOoaaisduAUb8O
 bxAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DzmLhSje
Subject: [Buildroot] [PATCH 3/8] configs/nitrogen*: bump kernel revision to
 f789d32c
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Based on NXP 6.1.55-2.2.0 release.
- Full support for Nitrogen8ULP, Nitrogen8M Mini SMARC and Nitrogen93
SMARC (including M33 Core)

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 configs/nitrogen6sx_defconfig | 2 +-
 configs/nitrogen6x_defconfig  | 2 +-
 configs/nitrogen7_defconfig   | 2 +-
 configs/nitrogen8m_defconfig  | 2 +-
 configs/nitrogen8mm_defconfig | 2 +-
 configs/nitrogen8mn_defconfig | 2 +-
 configs/nitrogen8mp_defconfig | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index ba2c79d4a7..23d24cfa2e 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -37,7 +37,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_6.1.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/f789d32c.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index d490ec3c46..a4e8c7d6bf 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_6.1.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/f789d32c.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 429d84c1d4..4b16b3f82a 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/bo
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_6.1.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/f789d32c.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index ea5f21cb3d..d1fc0f693c 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -52,7 +52,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_6.1.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/f789d32c.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 5b7fb4a3bc..9281bbcf74 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -52,7 +52,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_6.1.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/f789d32c.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 2fc9442d9e..2ed27aab25 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -52,7 +52,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_6.1.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/f789d32c.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index c5f79c3913..1b48d6ba56 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -52,7 +52,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Latest revision  of branch boundary-imx_6.1.y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/4470b050.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux/archive/f789d32c.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
