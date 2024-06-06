Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D36C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 13:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 177C74060C;
	Thu,  6 Jun 2024 13:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zepDm1RqXl_l; Thu,  6 Jun 2024 13:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8DDA4062C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8DDA4062C;
	Thu,  6 Jun 2024 13:39:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49FF71BF32B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3787884561
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjElJdwELOqX for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 13:39:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC452811AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC452811AB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC452811AB
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 13:39:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 78AFB13FA45;
 Thu,  6 Jun 2024 15:39:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 15:39:48 +0200
Date: Thu, 6 Jun 2024 15:39:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZmG8JFT_IcwiPXJI@landeda>
References: <20240606122753.3028347-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606122753.3028347-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717681193;
 bh=+DJjIFrv72bb6pbLuH9ApxPg/7cwHMxHrdWP4kEM9eg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=orpNb15x3NCwK3hFEI0+oznXGc0vFA5LQ8lRL1tDe4endif1GA9cihMGahK7AcH25
 w8MoPInyljKKi1hLiVTe/pVsXRQvWsXK1MrPJrXHGUeA3SIjaaLfmtn+F+fQUuPQkX
 F9+5FpAOCp7lghVtHPPGVodvQhWKSrOsLBZAjv6HdgLpRtZOENrjX+jnoDeZzRCpgi
 MOXuPQTZqboGZLV0WczlQIA6RIuGdpTTsAxnldzhSpTlVE5Z3QL041B7mZa9tLOsSg
 XqTk9BGjl7yoeyXMH0K6aclHNjkhrtTqPm/hx+VOGCeE/uuyiQruYNlCrHPO7Pgnh7
 q6kokocPIy4pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=orpNb15x
Subject: Re: [Buildroot] [PATCH 1/2] configs/qemu_ppc64le_pseries_defconfig:
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
Cc: Romain Naour <romain.naour@gmail.com>, Joel Stanley <joel@jms.id.au>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-06 14:27 +0200, Peter Korsgaard spake thusly:
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7019514688
> 
> The kernel build needs host-openssl since commit 9982e0b5a63ca
> (configs/qemu: update defconfigs to Linux 6.6.18), so enable it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/qemu_ppc64le_pseries_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
> index ebc3b7a6fd..9c678ec1e5 100644
> --- a/configs/qemu_ppc64le_pseries_defconfig
> +++ b/configs/qemu_ppc64le_pseries_defconfig
> @@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
>  BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
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
