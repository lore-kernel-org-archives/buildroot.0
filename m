Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D7BC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB4881301;
	Fri,  7 Aug 2026 12:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSJYZaySEnZC; Fri,  7 Aug 2026 12:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D955B81326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107324;
	bh=Iv14VjV7hzJdj5yZqQF9LDpEpvYHTJlH3TNc3XlIS4M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bUtbpbVZ/yFBFF0DqvhDI/q0sXZj5fsIzsmWB0O3/jLw5xZHopi3eJrce3mF4Tl6t
	 JmnTCiwUKaJKueOEh5z52Vse5i2tZmHjyjLFyNOnWYG6dmjLxeErKTrDwEVE+NtNMo
	 WRtFIcuxwZUzwk2mix4S8/7iV7pJ788ZNTP4AADM1GYTAlzIdh95JevzbS4qa7HowY
	 WP1O4i+pBO1x8ONmnlkXHmVEiI48zuyBBHkh+G9SC8FTDIOr5/gDzbDyhGYwvJapDR
	 BzcfoJvwWSTQGLTm6g6iqfK6mnJtQP1p2qPg4HUDS+9Y/an6o3yh58MwzKHnh3HiQC
	 Z21U/opbYOJ6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D955B81326;
	Fri,  7 Aug 2026 12:55:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 808BBD3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B24608D2
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKy3hz_4zIzG for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29511606EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29511606EF
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29511606EF
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c15df0c154dso41202866b.1
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107317; x=1786712117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FIIfjjGmmcocPYmKeRRJZxNu61BO49e5jmyQsvXH3aE=;
 b=AqSYzRnLIo71QnRUSImFhnYAkJUrglrkJrlUzrHe4A2QicvMvFoHjn5PsOY8ZymaPi
 coPaDOAYVlw5gmPOIS7DSokWbjQGTNfVTtqGObLTdiz28bcHeIDgoebKXgvwqQcNaUd+
 qogm/unQRkGr3GScdn5X1qgawWy7qK7FnILZTCCd3IQMy70euVJdcRVMjfqGshdYW4NW
 45RJJL3LBxZ1Nun/ToQhmPITfMhi84eVWCafxZ4HTrNdk3/NOHadvZI8ORpe9oDnhMO4
 MQYC6gBv7L6QVFjrdMoR8ieeVKnXIkRXiRQdQncV7/o4AsKO3DrlUvFUc5DvvSmiJSax
 WqqA==
X-Gm-Message-State: AOJu0YwosmpWhkXBwgw3D3lPxdGiB6T/whHwvpF3SgfeixgSugEmXcWf
 +x1SMaetR9Yw94mFm8CBLlXXmdxpAOT5boxdeJbX4Rza2wCaEvHNI76unQGLK8f/u3rBTLiybBK
 qbkc/i8U=
X-Gm-Gg: AR+sD10W5jZKfF8fYG8vGHW1nVgNwfWhTownUxrt6NpdDamJJy9Ng3RxaMin/svdzlS
 P57tfou4PnzDC1saVio9mYBcK/AJxTXlRtjhLeEZZ83U3EWmwj2NvEZYvAZWGo43blisRJ9hU7W
 gcBDdUdcoIrq+OSAts3Nkzq1Bjxmmx9OvfobonswRPtfk9AUFbXBXJ5uZ7ugVGzoTOowHRoI9es
 cDPYnAQhJvFUdPWXF8ROD/cyOpWE5Acmr6PLyiz8p8y/mN04RLugqBKVosIVYf4wxxYuvnCHM9U
 ZC+E9MSbEi32c7ycpdIbcg6gpx0avyEylIBeEb9lHJDd7qrigaB2rte/zhhC764YnzbHKxJrKF9
 eiINk82vinu0IEzudUParmCWq2gDSOUmyuw4jPYA39WlYZPWBXaf/HFztzPwoXs4UxnEPWzgAUZ
 +hEQHjx3uPelupJufi/psDtLEA4Fx6T3vdcp7ImtolfkBlmLoCGmqMOYASGVzxSQeTgIzGN3YqE
 13hUQiHMMaNXdxFQNxSPi+yS4leHiZhkqoNHQBoHJpj2syGY1dJAQIvApVlfl2zM8OeRIKuobnk
 5wxcDAIXOPNrvqhZ14JSZvGyTO81SASLEQETOKId9Pa5Z5E15PnlwfHxqRGqGXt6
X-Received: by 2002:a17:907:a0cf:b0:c12:2aef:af2b with SMTP id
 a640c23a62f3a-c2039d63cb3mr659287366b.4.1786107316933; 
 Fri, 07 Aug 2026 05:55:16 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:16 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:05 +0200
Message-ID: <20260807125510.1285300-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107317; x=1786712117;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FIIfjjGmmcocPYmKeRRJZxNu61BO49e5jmyQsvXH3aE=;
 b=pvpIpHqe5GqmEBxREJNXdIzJmQrMwcxEGM84P0zOx7VHVl9uKAGuk0zqfNvU2tguDW
 BKdGZJl6TjLcEg0PBmBeQAg2u0maRbWleAfaVr0hYOpfKxtL6SGtiuotwUEXKUcu+fvu
 VUuyawanb252BcA/t0/3pH+N398MGx82s3sfU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pvpIpHqe
Subject: [Buildroot] [PATCH 06/11] configs/mender_x86_64_efi_defconfig: bump
 kernel version to 6.18.43
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

Also update board/mender/x86_64/linux.config by running
`make linux-savedefconfig` and comparing the differences.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/linux.config    | 5 +++--
 configs/mender_x86_64_efi_defconfig | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.config
index f17fc18edb..b758c6d45a 100644
--- a/board/mender/x86_64/linux.config
+++ b/board/mender/x86_64/linux.config
@@ -3,6 +3,7 @@ CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_EFI=y
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_NET=y
@@ -10,6 +11,8 @@ CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_NETFILTER=y
+CONFIG_NETFILTER_XTABLES_LEGACY=y
+CONFIG_IP_NF_IPTABLES_LEGACY=y
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_FILTER=y
 CONFIG_CFG80211=m
@@ -35,7 +38,6 @@ CONFIG_RT2800USB_RT3573=y
 CONFIG_RT2800USB_RT53XX=y
 CONFIG_RT2800USB_RT55XX=y
 # CONFIG_RTL_CARDS is not set
-CONFIG_RTL8XXXU=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -43,7 +45,6 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_DRM=y
 CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_FB_VESA=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_USB=y
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 219f02839c..f0a2088b8c 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -1,5 +1,5 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_INIT_SYSV=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.43"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
