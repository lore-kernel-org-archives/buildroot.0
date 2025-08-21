Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B1CCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 235EF61CCD;
	Thu, 21 Aug 2025 19:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8EyPAOFcCVn; Thu, 21 Aug 2025 19:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFAB61CA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFAB61CA9;
	Thu, 21 Aug 2025 19:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A231C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2693661C13
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-JqS4pMo3hF for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F388616BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F388616BA
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F388616BA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b00f187so7897375e9.0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804082; x=1756408882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2YfgNUUJTuRccGSoLIYJhxuw4tlcCXxuQmIZiFtlPs=;
 b=i8pFaaoj4QqFuUN53AZ0RHDqT/hMGWa4L9iBxSK+o4uIPbL0eAv5DPc1z3w88nhm7X
 yEUxQp0xuEtmdrJXJYgSSkYrRGGo9W7VJGeChZnAySWIril6LeIVfXTwBeSfzm6im/S+
 eus/VB8Hl6/8vCmDsVq6Xg9Nf7RRynr39ZfrQ9xs8Viuay3sNDuM62981ExOBt0ZDx5g
 /0SlrrakYjopPDMdeIo6ic7sbUDtWdyfau9n36KImKU6hGH9LshcaHKEvSlIxmIVjN12
 ElHbB/EgwHss2jLuqs/HlmQ9fqkMpB/ezHe9nN4OHAEUzWRz6rYay/OEa6UWWK/IVzR9
 ibpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDEQ8ertRGz/bVTRuXm+ir5X2SSIf9c6tbEchhlgDEeLHgM+u+ssfFMhEuso9tC3UGOUlTg0TXky8=@buildroot.org
X-Gm-Message-State: AOJu0YxGZusqhZWo9CuulN2LC/R8YkKAvBoofZ4tFmaaydWsWpF+Ot6L
 dG08lFgQxCt1haT0xHDCXsPrFPr1IEaT8zgEW6nht4ehJiU65D05Bvy8Zq6nuiBgCsI=
X-Gm-Gg: ASbGncvyZH0YV9s4gPXG9E7Gy9znFuTaWT08O/qSU9ehVihqc5Mk717FVN9VQRTQiZY
 Wh+Pfx7V//acMlItZkl1FbsGDB+qcqGel3OT0XtjS6kHNsCKjqYlg4n8hJL7eJwJxgXZhCgnHEV
 5iDILMAdwOohJvTKJ5AxAhIPbEHEs4p8i7XHLJQ1dte1O30i4Vw9Uxqt9IBH+hPD6FqxeZeWMZi
 V/V7gwoUXrp6V/RrlJA5NJtTIt9qVZCkYx+Aft2LGDDgGV4c8VSGKCCX9jeOqd5DAzdkkJGLcPJ
 QDm7XiAq5HqpRfndQMzJI/AGMs8iwIj41J8KuDQmz95AypBqmbJw4EjKTRp1P0NV4BI3IHRRtRk
 eRj47IPE4YrXGYg==
X-Google-Smtp-Source: AGHT+IFKqk4+kU1tXOvtpO36+QrYu0EJKQZu6gQN7moiGxmPX35/OVW5f0g/ZAdBir3MHdisFkGfYg==
X-Received: by 2002:a5d:5f85:0:b0:3b8:ff3a:86c2 with SMTP id
 ffacd0b85a97d-3c5dc7342eemr91066f8f.37.1755804082317; 
 Thu, 21 Aug 2025 12:21:22 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074d43b9asm12594367f8f.24.2025.08.21.12.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:22 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:21 +0200
Message-ID: <20250821192121.24516-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815103002.3871929-3-thomas.petazzoni@bootlin.com>
References: <20250815103002.3871929-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804082; x=1756408882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s2YfgNUUJTuRccGSoLIYJhxuw4tlcCXxuQmIZiFtlPs=;
 b=WvX9PKC6YIFFkt+m2kNlD5oNI5lKIdzwh2/yvDPiqEUc06gGWyN+10uTORvCsOaWCt
 uT1T9cgASmQDU9fzBcaGkmjlubFP6UVwymqVAm/hAy4XmtCzRnfes2Oglf4Ret0i8i+W
 8Ej2uF1VC5tOEbAtn31eOXRi/0XJ1O2JweMEAIeic4Os8J68eM/z6hhK9ChfIayrr8JH
 hxiOwUwsJTnIEP0HrmUy0Yd/IOEIq/FkUx30ev5Fhb3GGUxKOmA9/avHNyzMmlk5M3ab
 IEzovGS/tRmKLEBMJaannA8VJWbQRposegtNVHqyQ8WOKz2z/fKl4/JVEliaIW1KAfbZ
 gNFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WvX9PKC6
Subject: Re: [Buildroot] [PATCH 2/3]
 support/testing/tests/boot/test_grub.py: use glibc toolchain
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
> Since the recent bump of Bootlin toolchains in
> 947dbc92a20c5acea7882166cae7893e6ea661e1 ("toolchain/toolchain-external/toolchain-external-bootlin:
> update to Bootlin toolchains 2025.08-1"), our grub2 tests are failing
> as the new uClibc toolchains based on gcc 14.x have an issue building
> grub.
> 
> Until this issue gets fixed at the uClibc level and since anyway glibc
> is now the default in Buildroot, let's switch to using glibc
> toolchains.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858692
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858686
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858680
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/tests/boot/test_grub.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
> index 37b7c06143..7ce7066875 100644
> --- a/support/testing/tests/boot/test_grub.py
> +++ b/support/testing/tests/boot/test_grub.py
> @@ -8,7 +8,7 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
>          """
>          BR2_x86_core2=y
>          BR2_TOOLCHAIN_EXTERNAL=y
> -        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
>          BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
>          BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>          BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
> @@ -37,7 +37,7 @@ class TestGrubi386EFI(infra.basetest.BRTest):
>          """
>          BR2_x86_core2=y
>          BR2_TOOLCHAIN_EXTERNAL=y
> -        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
>          BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
>          BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
>          BR2_LINUX_KERNEL=y
> @@ -88,7 +88,7 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
>          BR2_x86_64=y
>          BR2_x86_corei7=y
>          BR2_TOOLCHAIN_EXTERNAL=y
> -        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
>          BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
>          BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
>          BR2_LINUX_KERNEL=y
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
