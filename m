Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903CFC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 13:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 550BB4245F;
	Thu,  6 Jun 2024 13:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URII3ebXlfeY; Thu,  6 Jun 2024 13:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB6040260
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB6040260;
	Thu,  6 Jun 2024 13:40:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8961BF32B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7897C40576
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EE478V8kJojx for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 13:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F1714021C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F1714021C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F1714021C
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 13:40:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 627BD13FA34;
 Thu,  6 Jun 2024 15:40:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 15:40:11 +0200
Date: Thu, 6 Jun 2024 15:40:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZmG8O9mW8jB1cevO@landeda>
References: <20240606122753.3028347-1-peter@korsgaard.com>
 <20240606122753.3028347-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606122753.3028347-2-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717681214;
 bh=rNLnUuCvxmvWkUGkKzJm0cu7O97HRcTtmlqRxlhajiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dcXcKfDlKlSKP1C71bLD6LtUBX6inMafLhSUgZ1oDgnHaxyfhEKl70iQKOOCVV0WT
 MyUqo/6mPjjO6T+g1Y3g46rum32A2XYlktaS4lhxUPzikkIZN4eOS1hl3aWWacpvtS
 HV1iqEr/Jk0E8rcW9n0gPQsYdnJXF3B0NIrg5YmQYZAyS4p1sjQXm4Llu+o1fW+y2B
 7iCc5ownlTO4Fsxv1WvwYjfhfBvCL7V6EIyG3MDeUSru9u9282QSvtZ4sb/7KGF0lO
 VWomxjpMEXP0xFWPyt28yXBwLLgvWvB+yTR2zXTCgyuHNiCFIjDpkxXib+9OTBe9ii
 5vAVAiepjC17g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dcXcKfDl
Subject: Re: [Buildroot] [PATCH 2/2] configs/qemu_ppc64_pseries_defconfig:
 Linux needs host-openssl
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-06 14:27 +0200, Peter Korsgaard spake thusly:
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7019514677
> 
> The kernel build needs host-openssl since commit 9982e0b5a63ca
> (configs/qemu: update defconfigs to Linux 6.6.18), so enable it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/qemu_ppc64_pseries_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
> index 350380578a..5f6f51d258 100644
> --- a/configs/qemu_ppc64_pseries_defconfig
> +++ b/configs/qemu_ppc64_pseries_defconfig
> @@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries"
>  BR2_LINUX_KERNEL_VMLINUX=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
>  
>  # host-qemu for gitlab testing
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
