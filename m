Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D436DC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 20:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5B183DB2;
	Tue, 30 Jan 2024 20:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5B183DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZzJ4rjmOv3v; Tue, 30 Jan 2024 20:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8E7283DA9;
	Tue, 30 Jan 2024 20:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E7283DA9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF17E1BF2EB
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B398983DB1
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B398983DB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWd96gNItoKi for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 20:02:56 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 895A483DA9
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 20:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895A483DA9
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33ae3154cf8so2195828f8f.3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 12:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706644973; x=1707249773;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xgDBoMPZ4TqvywDYNX+zXVOtLRasTDUZbBt8S+JjYSc=;
 b=J8UJFQckI6sxUzrAXV2bOAkq6TAO255t99Xnrg9eKm5CXXJWdjcRonI5CIj+iWmd0a
 TrgUnO3n0uba9N36UJk438hamBdzAosAwOl4MAf7Q+xStnxaHb4FRsuwgJ6Wr47x8fQX
 p5z9Kl1Az6HPvvBJfQ0yFHd4pSZCtJKUne4Dpu0nsRpyApwzpOTuvwBBTGzlWaRcVcpE
 iPnnI+wH1Eo2OZsgIlxsJDAe48LOvirtfsZVa2XK+PQK5TWMfhr50TGndOh82tyE9CDJ
 2ZQt4IDQrIQ73BNTFHYfkFhb5HEcFoZCUWC/+4YlyfBvOa878w8xnnENnvowFP9/Slww
 3tKw==
X-Gm-Message-State: AOJu0YzA3j0cQv1vNDT270OD4WXTmxfrw0FjcF+35EaspBB78bNoUryP
 UHRecku9NmCp4kQHg0KZXTpfySKJ55GSSCNT0RrcnABNj3nvLtbeD2ERH6C3KLQ=
X-Google-Smtp-Source: AGHT+IEMy+z81aaeS9+LYbnGKtxgU4UzwX+RiVWcHwIdyVE4Ljb8D59PK1APnOaAA/Tj902QTn4VCA==
X-Received: by 2002:adf:ab0d:0:b0:33a:e477:d220 with SMTP id
 q13-20020adfab0d000000b0033ae477d220mr6147995wrc.37.1706644973432; 
 Tue, 30 Jan 2024 12:02:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bp20-20020a5d5a94000000b0033af280ec84sm5296828wrb.26.2024.01.30.12.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 12:02:52 -0800 (PST)
Message-ID: <f5a4aa23-fdb0-4c06-9f18-8ea0e69cbd7d@mind.be>
Date: Tue, 30 Jan 2024 21:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Nayab Sayed <nayabbasha.sayed@microchip.com>, buildroot@buildroot.org
References: <20240124-kernel_dir-v1-1-4125408cf65d@microchip.com>
In-Reply-To: <20240124-kernel_dir-v1-1-4125408cf65d@microchip.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1706644973; x=1707249773; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xgDBoMPZ4TqvywDYNX+zXVOtLRasTDUZbBt8S+JjYSc=;
 b=Vz9Hibu9/u+OQLyI1l9TbwtMzsUnjYAJFEkQFKjVRRiQMk7e9TvkbyW/DotVKzpROt
 QRFhyFNwvzfqHycoRdVTcwHjeyndX39ipNrbufT8vSjDEjg+PSiQoRLM9RsVNpNc9K9x
 gdhtyBBSad7VJ/V+kpefvfYl/c3UUHa0goIyDeizFAC98/7SpS3vQU8gSJUFcCzNy6b5
 AgPziEPItpAhn3vQ1B4HNlfIc9Dx0/73d9uuqPFkPaG2PiG5EKqZUre8sPI8wx+GOuai
 xYMjCEGDNLRDkKldNTBJ8i8UCqllCt131962v2UAXmk71oC0QRrMUzjm6Pxyzj7cDBNH
 DmKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vz9Hibu9
Subject: Re: [Buildroot] [PATCH] package/environment-setup: replace variable
 KERNELDIR with KERNEL_DIR
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/01/2024 06:32, Nayab Sayed via buildroot wrote:
> This commit updates the host environment setup helper script to use the more
> conventional variable name KERNEL_DIR instead of KERNELDIR.  The change is made
> for consistency and to align with established conventions in the project (like
> KERNEL_HOST, HOST_DIR etc.). No functional changes are introduced by this
> commit.

  Do you have some evidence of this established convention?

  We currently have three external module packages that use KERNELDIR 
(falcosecurity-libs, ti-gfx and ti-sgx-km) and two that use KERNEL_DIR 
(kernel-module-imx-gpu-viv and gcnano-binaries).


  It has been KERNELDIR in Buildroot for more than 3 years now. If we change it 
now, in all likelihood we will break a number of scripts that rely on that 
environment variable. So I think we need quite overwhelming evidence that 
KERNEL_DIR is better before we introduce such breakage.

  Angelo, you originally introduced KERNELDIR, anything to add to this discussion?

  Regards,
  Arnout

> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> ---
>   package/environment-setup/environment-setup    | 2 +-
>   package/environment-setup/environment-setup.mk | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
> index 84a9843c24..8504a89743 100644
> --- a/package/environment-setup/environment-setup
> +++ b/package/environment-setup/environment-setup
> @@ -10,7 +10,7 @@ cat <<'EOF'
>   Some tips:
>   * PATH now contains the SDK utilities
>   * Standard autotools variables (CC, LD, CFLAGS) are exported
> -* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR) are exported
> +* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNEL_DIR) are exported
>   * To configure do "./configure $CONFIGURE_FLAGS" or use
>     the "configure" alias
>   * To build CMake-based projects, use the "cmake" alias
> diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> index 29ec5a9a95..cc058a5799 100644
> --- a/package/environment-setup/environment-setup.mk
> +++ b/package/environment-setup/environment-setup.mk
> @@ -34,7 +34,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
>   		>> $(ENVIRONMENT_SETUP_FILE)
>   
>   	$(if $(BR2_LINUX_KERNEL),\
> -		printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
> +		printf "export \"KERNEL_DIR=$(LINUX_BUILDDIR)\"\n" \
>   			>> $(ENVIRONMENT_SETUP_FILE),)
>   endef
>   
> 
> ---
> base-commit: 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2
> change-id: 20240124-kernel_dir-41a48fd97b75
> 
> Best regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
