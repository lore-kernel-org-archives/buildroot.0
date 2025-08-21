Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DA8CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E368469C;
	Thu, 21 Aug 2025 19:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9q68uKdq_O7; Thu, 21 Aug 2025 19:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B24B384742
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B24B384742;
	Thu, 21 Aug 2025 19:21:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B519F1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B813846E1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBjABAHJXQ7C for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1EDB846D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1EDB846D3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1EDB846D3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b9e41101d4so867951f8f.2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804048; x=1756408848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLlQwhlD/JTi7Ikf11a0Ko2JTa5IcLkLx9yorV7SkVg=;
 b=oBoJjXMwvqxegVHD8c+vrJjDj15FjZujY3HyPl78pgyq0xHVLo4TM0Ws4WYs0snC3T
 7MX+pYXLr01Ycj/u2DPJ28LliXBuobM9+rOgI/VUO6E2OIMyNZyqnrtBcNbUPJ9Bj72f
 dB9Ng/oLOdiLqHmZxCS72wWdPEg/rCfOhHEIAlIPGn6augD/QKkXiA2UYCd2hclTJNrT
 KgvMbmQaDCTzy6qgj4w35bQBUsnS91T1boarQJt1j2v61lu91sUJQFEx64Uc2kD/vNfu
 EvCJL8mW4KeIf8RTPfMUTZDu3QEDcE0CB8ZsGdhSuoJ1idbLJBiTIMo0XewfP58oyFn0
 NJSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsPGbkndb2ciForY4otsqpqdSbpo2kE1qduOft/y2bW9VXzEYLt+KlJp1TBKQUrK1wYoqd+zB+V+c=@buildroot.org
X-Gm-Message-State: AOJu0YxJBiqpUtkx8i306PxgwUEdPuZx6CbGp0oUSera2sDD+6ZRtcrX
 2lGC88Bs9dz+m/ftUXDD2zhzbKdtU3+Y4mh01VsHdrTewR3wrc11zYJiNR0dpVRk44hAAY6yokV
 8vV7XdLc=
X-Gm-Gg: ASbGnct82DeHpx8BvmX20+YpU49gK0M2OnghK4aGEHkuTbnPR2Mw0kJ9ZK2Hpq1AIA6
 Ex/s6LTLfTTK0+ZHT/90Wv56PGi1EoOtVYBg0Z2rFiEWlXXLB9LnvtXhSFTBDMcCmwJX5bd050b
 5gUpl48Bt4qZXLwOfEKclIY2Dw6dQYt6d2tR2O4MX+s3orpJCB6VsD8QdgfPZV1TYUR/3Vh/je6
 5k34PhYZmuHw3B6JsC4w22PID6tXcMl5/6k6pvr9goKIx/hX63niAe9dV5zKWmZV+OQr8CZFA0b
 l4ZlIyyxoLo2n6MTigdOfZBdqTRVckPBytcF/VQkbWYKggrn4htXFH8+ChUFFB5Vrh/vpwigamh
 hK7c9FhLxTDmdTw==
X-Google-Smtp-Source: AGHT+IGCLL10obRFZHXV0v+d7afzT1zS3l5ytkVI6DWrgdB14qxIQVCMOsqq8SsbMIKQ7v5SDONSMQ==
X-Received: by 2002:a05:6000:26c2:b0:3c3:ae31:7183 with SMTP id
 ffacd0b85a97d-3c5dc734292mr94442f8f.34.1755804046270; 
 Thu, 21 Aug 2025 12:20:46 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e2534f0sm18170565e9.1.2025.08.21.12.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:45 -0700 (PDT)
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Buildroot development <buildroot@buildroot.org>
Date: Thu, 21 Aug 2025 21:20:45 +0200
Message-ID: <20250821192045.23554-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e4faa576-d8ee-4805-aad8-f19e388fa3cb@grenoble.cnrs.fr>
References: <e4faa576-d8ee-4805-aad8-f19e388fa3cb@grenoble.cnrs.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804048; x=1756408848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLlQwhlD/JTi7Ikf11a0Ko2JTa5IcLkLx9yorV7SkVg=;
 b=CpoMB2cQbhTJkGLiZQA0rMviwyNNLciHaecjo0XxFQuKBl8PQBAqkw9pBW2TBo9mGg
 mEnUB6jUZEX8PcbFCjBY/dFij79Y3AREbycYhF0ZMMvb+MLQmdXYRTjYQHl77Ul8UjM6
 l/Z+QtfeuRapdAg9T28TFSZ/yAi9Nc/d+bd2YaX8IKsz1lBISzskIWoEbfzxXRoXt0Yb
 iFVERs8eQWon55b1y0Ihzw1gWd3SsdA+IekAyVhs+AV0QyHMqI+PKdi46b/bKNckXZ6x
 Thl34Ws/JMM7X+6zsamCvTAsbx7TMGffHUBwe0WqsJTGaulgCYG3k1Bblpzq+/XbcNQQ
 62CA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CpoMB2cQ
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.12.41
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
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
>  configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
>  configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> index 7a4c4e57c9..2c86a53263 100644
> --- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
> +++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
> +sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index a50e306b1b..9e6d35a859 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index 6ae8d037e7..8e6d9774da 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.41"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
> -- 
> 2.43.0
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
