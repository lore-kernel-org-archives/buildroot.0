Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A36FD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6419460615;
	Thu, 26 Feb 2026 20:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kabcnp7jNbVB; Thu, 26 Feb 2026 20:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8006160719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138829;
	bh=8F3aF57ZE6iuv/4qGz71NQeSGurjk9cxqkK6Drk4m7g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XmWyE468X5ZN5kw6A4qiuY4MtM0p9WhxYRwJl7RoWAhTuO0JuofPiEMNAVFolnPd9
	 7gQ2ZTE8LY+9iuXqwKSPBbHJHFrVDYNSSzlkTt8vfTbPidJ9xQfTmXEu0ME4YDytuG
	 Ztfl2h3L39kRo7eLoY80KDb2EGyKNOvGq94V1UdxqK0sz5Omv20EUHNXvCnY6kDp4E
	 N2HeDXra4EUUIfS/9dw9mK2s0MJdHViMmfxP5IXVnyRIF4kEfSghPUaKMx7yG17LsE
	 MX7bj4e28IqMeF6xdQt9qWfBdGaVyoP3lFVy+seZ5dkJYCGCp7SvC3bydAQrj0pfY5
	 HiqceMYvrsPvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8006160719;
	Thu, 26 Feb 2026 20:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAE5323D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A099440467
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XxtztZpicOb for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 373B2404C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 373B2404C8
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 373B2404C8
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso11502735e9.2
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138825; x=1772743625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ssXhvHwYbuYkbHZ3rKYcTxrlLZAY0rEVahFBvr+8ioQ=;
 b=o5XHZUHClmO/JmxOo2BffrKs8UtetWtwEXjYJ2oDi7yfGLNVl72XiFlr5OsW1swPN4
 o9ymgX8FmS/+NOVySlquMefiKIWoNhJbxEkcXDqoEveeyNfvORrlH4co/UIP6fED47WF
 n1el8RZU93vzD8HUm+6g7rSbyZBPaj4KgLqekmC1ui7tsXYwDd9j7UyC4tRH+e2pMYWH
 ExwTKdSmiUBWMRNH8RcU/XLFhGqWpWSAaGixi8vGyxZpOAdBwB1QxQ3DFldX5YZcuyQO
 IVdBgvQw4FYKxCELXLqaoKiIp1Q6zDPU5Tlz9d9s/Q3lhWOHTbA7+Vs2phB/82rJkZzc
 FDhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy6AGIgVaCbKnSOoY9PaFh07CSf2idQKxt3Zb4srrI5wFdXUpcaG9pF8za/y8buV+2cNNagmRhbv0=@buildroot.org
X-Gm-Message-State: AOJu0YwxKT2VJufOoIUZHDv3i/anPU35AuqUkTskiBDEu6KQCAZi2Hef
 dF1i1aD+OcpKGEWmhBujRtRtPvVeUJJbr9xwHqb3NBEXnoc8HGQxq6yUOGoxxuMARpM=
X-Gm-Gg: ATEYQzwEV7+wD3qdB739I6DbzOsOR3BevwqPCwBVzd59nyIM9kTd2CO4dZFLdE/8ww6
 qC2Hg9tehN46eIJswWS6WBScTlK4ows96CwcNDP3IZNg79cw7sDXlEVqO4KBFPV914sRC3jmpVJ
 Qhve45/KsBmhJZC/vN5IXFw9uqOGTGRw91MMLYx3kgUscwu/vfBDwwnY9Ahj2LWRq3f40iSjdBt
 6d0HUjsM3L7N/u3BpH3+OeK8s5jX2y7LtJ8tdBCanhq3m400JP5SsBwgNiCsKySjOZsai8TqHOz
 ZG2NgHLGy4X6TE0VQ53WTzVdzDk3MeModIUU7VVQRUUGc6/6kFNJa0hZKT6CI1dZ7mGhj+XquK0
 tqFlkcnEm7nZVFTQwZU6oXEKKWsnSSh0sFLn8T9ozgToT8Y9i7ZjLkW9lHZH0Sya6e3/OXNQOkP
 SnanHNdYGeN5W5LJ8=
X-Received: by 2002:a05:600c:b90:b0:483:abeb:7a5c with SMTP id
 5b1f17b1804b1-483c9bdb600mr3149695e9.12.1772138825120; 
 Thu, 26 Feb 2026 12:47:05 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcd0b14sm42801445e9.27.2026.02.26.12.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:04 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:04 +0100
Message-ID: <20260226204704.253680-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215105358.2089856-2-peter@korsgaard.com>
References: <20260215105358.2089856-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138825; x=1772743625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ssXhvHwYbuYkbHZ3rKYcTxrlLZAY0rEVahFBvr+8ioQ=;
 b=AvrCARcwEO/XpSbZjE5GSNDlokUPXff+83EON9twfL80oFyRq5auYwSHjPJ2OrNJM8
 gLHvAFqki2A5b4s3Cks1+TrJ81nYXAHAfHwk4n6e08uHkFGzJdf3Jy6riPHjf2ipgeVZ
 yAYIo60q8iRBCUj/5m1bUuePgJ8K9oG9YqaaXYdZxRx3zYrKX56cPSHV1OMRkreB/zDd
 FA24UGZJhU4xozyJNcM+Rg9WASanpDnuBQbxGhZaRfXz0toZthLT9VEv8PnpoZnFAmfK
 7eAg3Kv2D2KEOfJGG3Xqf4T9oMSWauUHBcdqLAJUy/Siyz+mfBHgGvsJ9ZF8eDvw64Ie
 8VIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AvrCARcw
Subject: Re: [Buildroot] [PATCH 2/3] sheevaplug_defconfig: specify Linux
 license file
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
> The used Linux kernel (4.14.336) does not contain the default license files
> as those were only added in 4.16 with commit e00a844aca ("LICENSES: Add
> Linux syscall note exception"), so specify the correct license file to fix:
> 
> make legal-info
> ..
> cp: cannot stat '/path/to/output/build/linux-headers-4.14.336/LICENSES/preferred/GPL-2.0': No such file or directory
> 
> And add the sha256sum to the .hash file.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/sheevaplug/patches/linux/linux.hash | 1 +
>  configs/sheevaplug_defconfig              | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/board/sheevaplug/patches/linux/linux.hash b/board/sheevaplug/patches/linux/linux.hash
> index b207306a2b..aa432012b0 100644
> --- a/board/sheevaplug/patches/linux/linux.hash
> +++ b/board/sheevaplug/patches/linux/linux.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
> +sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
> diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
> index 855efedafa..a6a324213c 100644
> --- a/configs/sheevaplug_defconfig
> +++ b/configs/sheevaplug_defconfig
> @@ -7,6 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.336"
> +BR2_LINUX_KERNEL_LICENSE_FILES="COPYING"
>  BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
>  BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
