Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B749C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5381240620;
	Sun, 24 Mar 2024 15:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYnPJB3sJ9Rz; Sun, 24 Mar 2024 15:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0134A4063B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0134A4063B;
	Sun, 24 Mar 2024 15:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB33E1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7D9E81E20
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5inlO_QANS1i for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6EE381E1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6EE381E1D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6EE381E1D
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:10:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4146e9e45c8so23103755e9.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711293036; x=1711897836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KxQwOV7nlOjl2mB+n0ox3+8sPy7/HYOzNeoMzWlwoEs=;
 b=u5xi844r8vjAzY5UYxJgxHwMjq2nsRikneKZpRo/ZzNhoHQujjCLmvRfW1lEwijWuv
 W7gktY6tJccxmZT6uU9FB2hGF/ti5/ft+ZiglJ/7MfoBDsXnjnrvI8JZDxYzGZxD5Nwd
 le+WeIrqTt/G8JRc7/CyokSbUgXh1PlIXkIpDEXdohLzSpUR9fibKxSgJSseV/r1hN02
 ftOZ3wNnYVcyulQZh+zZ9bDkuief4XkHAMYc70w/8pcyhDey+UkY3gUbE2um7Z/QQa9U
 ugqfOCBm+lX+HoDIwjSFdMPTTth0kFAPKXYrnRkv2lz72qeCREOW5JaTutHzHpz/3E2d
 V9Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQhXVDEnCAGDknqWkHC/oN/2WrgGiqFq0RyQe8gSw9uowrEqJ8+wPKPGaTtlpskLi/yfdD+ysjseh+vQtb2f2Aq8z8qGojWA==
X-Gm-Message-State: AOJu0YyTpKhNYiARb9ovcKMA+bzADFLIXT7piB30UCBg8JtlVUjvdqnI
 meXn/1Xz0+n5ewxMrRLmwwqFl8zdauSu+IIFVCTAOarwq9lpvyITgOTvrqkskTqDPu5WI49yyL2
 9
X-Google-Smtp-Source: AGHT+IGtehfyInTgpenvd/qw25r7HGBRAGRfEXZVpfom6z6eTJG5IvuH7tgXWXSk29f1egIcSjayGA==
X-Received: by 2002:a5d:4086:0:b0:33e:c0fc:5e4b with SMTP id
 o6-20020a5d4086000000b0033ec0fc5e4bmr3274945wrp.2.1711293035660; 
 Sun, 24 Mar 2024 08:10:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:10:35 -0700 (PDT)
Message-ID: <84430cea-7921-449a-a7f5-c6cd497f16b1@mind.be>
Date: Sun, 24 Mar 2024 16:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240323210753.139567-1-ju.o@free.fr>
In-Reply-To: <20240323210753.139567-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711293036; x=1711897836; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KxQwOV7nlOjl2mB+n0ox3+8sPy7/HYOzNeoMzWlwoEs=;
 b=UnaBd060O6/k+2JEyjv6gibKrLLpSk6s/gCcE/d9uyxC92yhtnBTIeNRN3p4gu7+jh
 6Z0FmWLhM5nzaS2zcbkb92OLFAL1MV/FhO23Ju8lshQqLtTzbroRzrWxXbfSs3l+ra2q
 iXDqkiIEGCU3xm+l83C0QXHrt/npNuu/NldC5qEX1cOcwX+NJ4yGi2KR2Pk2IDfbr+RA
 VXd7rxWRkDu02U1/vKpcqjb6pHFHjgBvka30EAhnKm/1YsYZ4KwR6wdv2mO45gFGyJKN
 PCnlOhp9qOi79phob7exTKhrv8chzN8MY5ZOxjsZodVKVDObPkbM+mlc2h9bbU+CEnaw
 1Bvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UnaBd060
Subject: Re: [Buildroot] [PATCH 1/1] package/gnu-efi: bump to version 3.0.18
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/03/2024 22:07, Julien Olivain wrote:
> For commit logs, see:
> https://sourceforge.net/p/gnu-efi/code/ci/3.0.18/log/
> 
> This bump is motivated by riscv64 improvements.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested on branch master at commit f2846f8 with commands:
> 
>      utils/docker-run make check-package
>      ...
>      0 warnings generated
> 
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.boot.test_syslinux.TestSysLinuxX86_64EFI
>      ...
>      OK
> ---
>   package/gnu-efi/gnu-efi.hash | 6 +++---
>   package/gnu-efi/gnu-efi.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
> index 7d986509917..e059da867e0 100644
> --- a/package/gnu-efi/gnu-efi.hash
> +++ b/package/gnu-efi/gnu-efi.hash
> @@ -1,6 +1,6 @@
>   # From http://sourceforge.net/projects/gnu-efi/files
> -md5  832496719182e7d6a4b12bc7c0b534d2  gnu-efi-3.0.17.tar.bz2
> -sha1  9715285022124b231520d58b26709f5ab338e981  gnu-efi-3.0.17.tar.bz2
> +md5  0b93ad70dff96991dd87978fc4275bd1  gnu-efi-3.0.18.tar.bz2
> +sha1  4f12dc4ab3e7940070c87affea17bf8a6209957a  gnu-efi-3.0.18.tar.bz2
>   # Locally computed
> -sha256  7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4  gnu-efi-3.0.17.tar.bz2
> +sha256  7f212c96ee66547eeefb531267b641e5473d7d8529f0bd8ccdefd33cf7413f5c  gnu-efi-3.0.18.tar.bz2
>   sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
> diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
> index 8b9a6aa4c66..96caaeb9336 100644
> --- a/package/gnu-efi/gnu-efi.mk
> +++ b/package/gnu-efi/gnu-efi.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GNU_EFI_VERSION = 3.0.17
> +GNU_EFI_VERSION = 3.0.18
>   GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
>   GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
>   GNU_EFI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
