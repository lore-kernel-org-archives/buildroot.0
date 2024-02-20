Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B1BC48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0783660D6D;
	Tue, 20 Feb 2024 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38zG6pbNPzfs; Tue, 20 Feb 2024 21:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF277605FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF277605FE;
	Tue, 20 Feb 2024 21:00:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 186631BF3A7
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60966407E8
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhGIOu_7I8p9 for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:00:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C27F4088E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C27F4088E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C27F4088E
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:00:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 666AA13F86E;
 Tue, 20 Feb 2024 22:00:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 22:00:27 +0100
Date: Tue, 20 Feb 2024 22:00:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZdUS66d104aL8Iew@landeda>
References: <20240220180708.55442-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220180708.55442-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708462830;
 bh=BVomc5Y61T7cg1rDHJtu9YEKNIxuUVd/9Dw/g2NJFHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iXEfm5leipw6dltVwcqsB2ivZsN9+SZj37C5yJU5+PFBziDm/N0EXkj/tapLmwjLz
 uC87z+NGuSYN8ZmOIn1qqztYyTCHmmeg+z+SXQ0DiXQ1i44whP7D0h7Qnsigh90ZSK
 LH++Uc9G9eJT/7yge0hB9n1mxJxnuZ8yRWZ8u+fiff7ac0JKhgq2B+WHOilh1J8gK2
 FuY+Lq9SOofuRZdVkqG0X5+HKqPw7zvv8ncE3oFH270PtgxBvlZVog7Si2xzaC9mxi
 wUUNAQucvXN+8UG8qoZcVhU3Ew0fC8sX506TnKBXVOWRqkqcf2mOGlsgn7hCayptI3
 3Pd17c6LsIDzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iXEfm5le
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: security bump version
 to 1.19.1
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
Cc: Stefan Ott <stefan@ott.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-02-20 19:07 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://nlnetlabs.nl/news/2024/Feb/13/unbound-1.19.1-released/
> 
> Fixes CVE-2023-50387 & CVE-2023-50868.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/unbound/unbound.hash | 4 ++--
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index 91e1d82dd2..843026abc7 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,5 +1,5 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.17.1.tar.gz.sha256
> -sha256  ee4085cecce12584e600f3d814a28fa822dfaacec1f94c84bfd67f8a5571a5f4  unbound-1.17.1.tar.gz
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.19.1.tar.gz.sha256
> +sha256  bc1d576f3dd846a0739adc41ffaa702404c6767d2b6082deb9f2f97cbb24a3a9  unbound-1.19.1.tar.gz
>  
>  # Locally calculated
>  sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index fa7884e937..5128d0e420 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UNBOUND_VERSION = 1.17.1
> +UNBOUND_VERSION = 1.19.1
>  UNBOUND_SITE = https://www.unbound.net/downloads
>  UNBOUND_INSTALL_STAGING = YES
>  UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
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
