Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1580CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB0C4607A8;
	Thu, 14 Aug 2025 20:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Gy-0NWJeEmK; Thu, 14 Aug 2025 20:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401366078B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401366078B;
	Thu, 14 Aug 2025 20:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D43E1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 127DC80DBD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTEf_r8WkwpS for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6163680DA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6163680DA5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6163680DA5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:28 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b004954so9713725e9.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203486; x=1755808286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXR61pd+psvrVJn1NkAAxkHePkov9cy0f5W5oOTlUac=;
 b=FdRVrlq/IO4tTDesoo0fb6LhcyHTR6g6NTkB/ASMI9ckb212011UEsizVitS1xUSCT
 bAkFtMAnP0TV99ZwXf7nHPGM3jqygd8WGlXKbb+jttniMvF0fw5X7Ji/erhpkRgI4qR8
 UVHUFljR/GiCP2kG2q5kPNM6NcUhU5bO80lTB5kLOfeAmTbAziqr/Huok5DFj4bWHRAo
 IPOFSkz8AdKOPhuDTM76km04S1rVf7DSC2besNvjlHImcv2JnYsPyN2BRUhbg81n3jIu
 4K8Bt/gsijL3gxpSWIDp6dC9+r+LbwhaIq9wVKsKqF+kxR99RKBfsMzh83BQa8E7ABOc
 diIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXudQBJMV2n81wuxjPke9fsNt5zEGliZr9UfEu6/1CThVR/n0gETKfoSs61xFRy45Duk+2E3HAoUKk=@buildroot.org
X-Gm-Message-State: AOJu0YzKPnThdQCjCdK665Z9N1hkyNHe6Dz5YxtIJwAfFmG/JicgaL4e
 kfYaXTvy/LRXxpNQOZtBo5h9IMqWaNuWQqvkuFKEBwnDXK1ERkFqQds/iuk62lVpig0=
X-Gm-Gg: ASbGnct3gOPQMcJnDrpfZfWgLL0gks3gqJbifD5d4etuNfs5mvanaeuZIhBBQLWMIm4
 CEKc/72VVA99f/qqVhs3wDJzgCEm6rke4BPHvaO8q+gWTZy3dInZrh7hY+I/ixCaQ2AhJfENqUH
 FsrL9Gx+xcnuDKsb7yXwGkMdjNrrc0Q8C4DasDsucvPVtd/AzPoSY7ikSMCbfa94s0Q7c2KE+QI
 8Cc6Mgk7LW7L3G63NmEvmKcQp0j+a4kjKw+Kc61kEyyXKOYhGuvXol6AM5ziqwptitFbCwcomhM
 3LRqGlhhWX0CBCCKDubY6XPmJWjvZpJg4jOuRroR1fiPUFi8XFEKvY3GGKFEZEua7j7WmiO07Ox
 OC1W6Kf4Onj05UxYUrX1WH/li
X-Google-Smtp-Source: AGHT+IGHQksW1LsR8xuNMYwTaVdmCoFLqA2YyPcT3Lca4WKChpPILCbXtY9FPMAfkCPL335mT40lXQ==
X-Received: by 2002:a05:600c:1c9b:b0:456:1dd9:943 with SMTP id
 5b1f17b1804b1-45a2126055fmr346145e9.3.1755203486406; 
 Thu, 14 Aug 2025 13:31:26 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm52272787f8f.44.2025.08.14.13.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:26 -0700 (PDT)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:24 +0200
Message-ID: <20250814203124.2814817-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803144208.195144-3-ps.report@gmx.net>
References: <20250803144208.195144-3-ps.report@gmx.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203486; x=1755808286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QXR61pd+psvrVJn1NkAAxkHePkov9cy0f5W5oOTlUac=;
 b=H+MYAe6GE2iD/SeKyDYxH0GgTCUpKp8tHAICqLpwrjgBLm5UWtzbDxszBjsSW6AUcM
 pvG4VUhe3E/+HZu0FeKPlyEvt/0572AhgxgPyA1GOuXKgdBgkam7yUhiMrr618md1ApE
 oZBcSPPEeNaVw9sFUZJi6Yie/mx2KL9GPEqqxCnqNgfbvueNfF0DHIUEh5s0/pQBVYhH
 7Kc53Bz+2HFRjUSQf4RcvT3HUjSD+OYFm5kc01xH64gkRMk35l4pOYNKQ176JYc9rE4U
 ACvj0IF5NykEOUB/A767j8zir8ksJ2NSMtzMDpHqC2q7BPObbhhL/vlQpJLaHgdMb8Nk
 ftRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H+MYAe6G
Subject: Re: [Buildroot] [PATCH 3/3] package/brcmfmac_sdio-firmware-rpi:
 bump version to 6596d33
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Changelog:
> 
>   - 4eec7f2 Sync with RPiOS 1.2-9+rpt3 bluez/1:20230625-2+rpt3 brcm80211 versions
>   - 4c1789e Merge pull request #25 from HiassofT/fw-2024-08
>   - e59476f Sync with 1:20240709-2~bpo12+1+rpt3
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.05.x. Thanks

> ---
>  .../brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash  | 2 +-
>  .../brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> index c20abfc26c..aba028ef6a 100644
> --- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> +++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185356  brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfea5.tar.gz
> +sha256  d9835b33bea65cf15f41753e215a11e5eca818a6e3bfacaa750aeac12456c24f  brcmfmac_sdio-firmware-rpi-6596d332eaadd63e2413e3937715a084f61c39e2.tar.gz
>  sha256  ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599  LICENSE
> diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
> index 95707487a9..8c04b017e3 100644
> --- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
> +++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 26ff205b45dc109b498a70aaf182804ad9dbfea5
> +BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 6596d332eaadd63e2413e3937715a084f61c39e2
>  BRCMFMAC_SDIO_FIRMWARE_RPI_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))
>  BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE = PROPRIETARY
>  BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENSE
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
