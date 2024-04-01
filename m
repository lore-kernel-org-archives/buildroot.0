Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1A3CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A787281CD0;
	Mon,  1 Apr 2024 12:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFQ4PXeONeDm; Mon,  1 Apr 2024 12:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD48181CFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD48181CFE;
	Mon,  1 Apr 2024 12:27:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC7081BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B63E74031C
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCKg3d_zWkis for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94625402F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94625402F3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94625402F3
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:27:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 94E6313F8A9;
 Mon,  1 Apr 2024 14:27:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 14:27:41 +0200
Date: Mon, 1 Apr 2024 14:27:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZgqoPUwQajwlQ_-q@landeda>
References: <20240328220605.145492-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328220605.145492-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711974463;
 bh=qvkaHsHlNdt1XkSgZbeEfuw6n/Z6YsqPlN/9mFZ6hrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gvZOHVBHcL0XHrSWkIJX675RTsw2GpwynNIfhZ+kJXPC4X3l3pmFER0ywgmjQzb0F
 eR2b6Z0ndJccSf34hv6GLHnw2aHHJuBfBOjhKjEh+dvntB7KMDSZVs0lOF1Yxa9I5l
 odV3RejqPtD+m0OcsoM/DpVPaxp9IkwCipemq5P2wxcx2dBavWymphnILkVN/KL1D4
 jvCEcFsqifxuIXK8fur/n8TbKUku4e8OWQCyOvClGtKrnr3DEjWhxD21g9Bg7GM5Nq
 MjNyx3jAEf7HQmK08jDk1/6ueOwq4ZZb+LpTaE1xnoCEygxFBhTi5MU4YwQRPDFmNf
 GHmpPEfa4lH1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gvZOHVBH
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.28.8
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-03-28 23:06 +0100, Fabrice Fontaine spake thusly:
> - Use official tar.bz2 tarball
> - Fix CVE-2024-28960
> 
> https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2024-03.md
> https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mbedtls/mbedtls.hash | 4 ++--
>  package/mbedtls/mbedtls.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index 3ec151a859..5466b0e7de 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.7:
> -sha256  1df6073f0cf6a4e1953890bf5e0de2a8c7e6be50d6d6c69fa9fefcb1d14e981a  mbedtls-2.28.7.tar.gz
> +# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.8:
> +sha256  241c68402cef653e586be3ce28d57da24598eb0df13fcdea9d99bfce58717132  mbedtls-2.28.8.tar.bz2
>  # Locally calculated
>  sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index cdb4aef4f4..9757b8b080 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -MBEDTLS_VERSION = 2.28.7
> -MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
> +MBEDTLS_VERSION = 2.28.8
> +MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
> +MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
>  MBEDTLS_CONF_OPTS = \
>  	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
>  	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
> -- 
> 2.43.0
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
