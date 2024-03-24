Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60417C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 045684056A;
	Sun, 24 Mar 2024 17:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrNL8Ow4YqXk; Sun, 24 Mar 2024 17:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3B9E40568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3B9E40568;
	Sun, 24 Mar 2024 17:06:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E25B1BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B50781DE7
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiXAtmoblx1q for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D7E981DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D7E981DE5
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D7E981DE5
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:06:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-341ccef5058so210539f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 10:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299982; x=1711904782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCFjj3AUXBwGXGed/kwXVFKREk3czDlm7nIRf8R8i3k=;
 b=VaUbXSYn87NgYqW0K8FIQBAlASdNoINOIV4MZGpxo+NTJjc3ExwlETIo6KhQfm0FyE
 2Q91yIqZHOOTTrVvC+qB2eEYJ2h8wc+NUzdUwxuOF4aE3HTSNwMa+WNy9ARlHtaF/miJ
 2mHALiFdH410thaZU0z0wrtc87W0POcf+B524QAfQm71O8x3+ivTJoCa/4EQjlNtirXL
 fyONsghRj6Z9frISJBK7GDVGiD9iMhd5KF/rrhsroQwa4ywvw/9/TxxfLiQ2xWhYhBXe
 GPGxIu3AFzDjNzxdUvaJC6IqVMIY6WNfy0fn64y8RvfJIoFj5xFj5IkAYYtG8PLu3Gm2
 zFEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHs+PdOqZrkAgTiB0n1mM9XoigR6Aa82npOa1yeoclzkbuIU7kJiUKd2jlIPNA9rVk4fLtLqfnsBSURK7xXfinFtgB+gwKfQ==
X-Gm-Message-State: AOJu0YwShG1y5VoZYz/iM4FCSsyK13oolsbALg9KjuefhsikurBAgbV4
 uxv7JRunQTWUI7c5VtuRfsaHX6dAOPSO//p8O94UlUs2l1pIjQ2aUUYGrjSfzVA=
X-Google-Smtp-Source: AGHT+IGSWfYLVBxDm18q4cX1VUmiT/ZFAnTjqVWFBzV9ZJmkOaRnMvEyFahnWEW4sDoNB4g3w1BSqw==
X-Received: by 2002:a5d:5341:0:b0:33e:7b3d:8efa with SMTP id
 t1-20020a5d5341000000b0033e7b3d8efamr2958970wrv.49.1711299982196; 
 Sun, 24 Mar 2024 10:06:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 y17-20020adff151000000b0033e43756d11sm7207159wro.85.2024.03.24.10.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 10:06:21 -0700 (PDT)
Message-ID: <37f5d92b-c1f4-4037-993f-026b366564b8@mind.be>
Date: Sun, 24 Mar 2024 18:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 buildroot@buildroot.org
References: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
 <20240319122344.3107639-3-javad.rahimipetroudi@mind.be>
In-Reply-To: <20240319122344.3107639-3-javad.rahimipetroudi@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299982; x=1711904782; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uCFjj3AUXBwGXGed/kwXVFKREk3czDlm7nIRf8R8i3k=;
 b=eE/8pSiFj4jWTFwsW3P9oBKEC0sFlSlzpTUJt1LJYbU6NYOiksHNxCw5JBE6h2Al4b
 5TbXBbNS3ht9Rcw34f0GZak0Z41WfydtCAF/VM0mSZZ90xT/2kEOyGeDLZWz3gq15wLE
 YGo5Qo2ujocc8+GjpT+GKK9b0SIWiSreP16I7L9+v2OI7zLkABKA1pFgcCQIM6nEgR4Y
 kiGhPqSbZG8jzp79wsS+Z8rlkLs0zkQVYzUXIsDUJbXDs/277zGK8f0DiefPfDY7PQPy
 n/FqF1PuAGV1wESY7fGGuMW5PYCaH6iCp87G1AM480sKbjeFxhFQpqBIfhqLYgW1n7wD
 iskA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eE/8pSiF
Subject: Re: [Buildroot] [PATCH v4 3/3] configs/avenger96_defconfig: bump
 ATF version to lts-v2.8.16
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/03/2024 13:23, Javad Rahimipetroudi wrote:
> This patch upgrades the ATF version to lts-v2.8.16. Please note that
> due to DTS chages from commit 51e223058fe70b311542178f1865514745fa7874
> ("feat(stm32mp15-fdts): add Avenger96 board with STM32MP157A DHCOR SoM")
> The ATF additional build variable also modified to use the new DTS file.
> 
> Furthermore, 'E=0' flag also removed from ATF additional build
> variable. As it was added by
> commit deb8d71c9285eb60bc3d28e8abcf7208f78980a7 to avoid TFA build
> fail because of '-Werror' flag. However, from version v2.6 or later,
> it is not required anymore.
> 
> The ATF patch
> "board/arrow/avenger96/patches/arm-trusted-firmware/
> 0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch" also
> has been removed. As it was not required due to using Dhcore DTS
> file for the ATF build.
> 
> Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
> ---
> Changes v1 -> v2:
>    - Upgrade ATF version to lts-2.8.16 (suggested by Arnout)
>    - Remove ATF patch (suggested by Peter)
>    - Improve commit document
>    - Modify commit title
> 

[snip]
> @@ -29,13 +28,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   # Bootloaders
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.8.16"

  I changed this from custom version to

BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION=y

Note that that implies that it was downgraded to lts-v2.8.13, because that is 
the version we currently have. So it would be nice if you could do an update of 
the arm-trusted-firmware LTS version.

  Applied to master, thanks.

  Regards,
  Arnout

>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>   BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
