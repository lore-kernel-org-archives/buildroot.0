Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913D4C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55C5E606D6;
	Wed, 21 Feb 2024 17:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-CWJeXeZ7at; Wed, 21 Feb 2024 17:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB8860EDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB8860EDE;
	Wed, 21 Feb 2024 17:14:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 471D11BF384
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 419C841771
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8kLmHCgCltL for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D457B41753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D457B41753
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D457B41753
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:14:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B90B313F8AE;
 Wed, 21 Feb 2024 18:14:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 18:14:06 +0100
Date: Wed, 21 Feb 2024 18:14:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Frank Vanbever <frank.vanbever@mind.be>
Message-ID: <ZdYvXmci-R4HOSkd@landeda>
References: <20240217092413.288309-1-frank.vanbever@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240217092413.288309-1-frank.vanbever@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708535648;
 bh=CnDVaQ7pSswBQkKm7Tx/ldDvGeN0my50yV6Tfbti6QI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e4ZBFgxT/maiD/jtY9+TA1QBnW3pgWz7eMagbsiP/xZoNyx0ush/TOVmsqetyGQ0H
 UBGrV7lGsJ9A+9v64Te+ax6AJh8VMFuQSRS+uE/ALUvzj+2mNmn83EpW1kZUlJLIGh
 3ft3lM3uhWPwV95W3eFSZfMn8++YKzEN2f49f3uPqv7ZQvuow6b8GilIIZ4KeuMy0B
 kZLsRatFBa+ekcnG5e/pv7ojgqlXhl7p0rEU0vrtZBTuyWjlUyQfWMItGSQq/8mn3N
 lzjUHPOpHQdRSNIMUhBYySGUT1pqvL0aw52lNdWsHY3/6b+e9wtWVm2g7rrydWHInl
 KRGQyMSqk1Ghw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=e4ZBFgxT
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 to 3.0.12
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

Frank, All,

On 2024-02-17 10:24 +0100, Frank Vanbever via buildroot spake thusly:
> The project has been transferred from Trustwave (SpiderLabs) to OWASP, hence the
> change in URLs. The upstream CPE vendor ID will likely also change in the future
> but the upstream is still working on this [1].
> 
> - Fixes:
>   https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-1019
> 
> [1] https://github.com/owasp-modsecurity/ModSecurity/issues/3083
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libmodsecurity/Config.in           | 2 +-
>  package/libmodsecurity/libmodsecurity.hash | 5 +++--
>  package/libmodsecurity/libmodsecurity.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
> index 69bb0494cc..da14b21669 100644
> --- a/package/libmodsecurity/Config.in
> +++ b/package/libmodsecurity/Config.in
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBMODSECURITY
>  	  SecRules format and apply them to HTTP content
>  	  provided by your application via Connectors.
>  
> -	  https://github.com/SpiderLabs/ModSecurity
> +	  https://github.com/owasp-modsecurity/ModSecurity
>  
>  comment "libmodsecurity needs a toolchain w/ C++, threads, dynamic library"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
> index b0a1bf33f3..2221a8a37d 100644
> --- a/package/libmodsecurity/libmodsecurity.hash
> +++ b/package/libmodsecurity/libmodsecurity.hash
> @@ -1,4 +1,5 @@
> -# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.11/modsecurity-v3.0.11.tar.gz.sha256
> -sha256  070f46c779d30785b95eb1316b46e2e4e6f90fd94a96aaca4bd54cd94738b692  modsecurity-v3.0.11.tar.gz
> +# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.12/modsecurity-v3.0.12.tar.gz.sha256
> +sha256  a36118401641feef376bb469bf468abf94b7948844976a188a6fccb53390b11f  modsecurity-v3.0.12.tar.gz
> +
>  # Localy calculated
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
> index 548eeb8602..d8c10b98b2 100644
> --- a/package/libmodsecurity/libmodsecurity.mk
> +++ b/package/libmodsecurity/libmodsecurity.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -LIBMODSECURITY_VERSION = 3.0.11
> +LIBMODSECURITY_VERSION = 3.0.12
>  LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
> -LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
> +LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
>  LIBMODSECURITY_INSTALL_STAGING = YES
>  LIBMODSECURITY_LICENSE = Apache-2.0
>  LIBMODSECURITY_LICENSE_FILES = LICENSE
> -- 
> 2.40.1
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
