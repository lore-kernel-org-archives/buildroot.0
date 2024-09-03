Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254FBCD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE5A607FB;
	Tue,  3 Sep 2024 22:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnzcVdrhDrgd; Tue,  3 Sep 2024 22:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C023B607E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C023B607E9;
	Tue,  3 Sep 2024 22:10:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 797D51BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71E8940A21
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OodpVNtPfoPW for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 102B440A1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 102B440A1D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 102B440A1D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:09:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 594C313F86E;
 Wed,  4 Sep 2024 00:09:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Sep 2024 00:09:54 +0200
Date: Wed, 4 Sep 2024 00:09:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZteJMqA7fJxzsBWz@landeda>
References: <20240903220341.1335509-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903220341.1335509-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725401396;
 bh=9B2HLYw4MHGXL9wlWPqXoLppTmTqKUSW62mT3UAVfhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gLd+keOshjkoI4EvhptyP9fSicxNb74hNADa+7WrlaJoUBqk/dBxBzxcKgYbhWiDh
 u8HdMBIs2qaZsth5c8rum0eVoMJet0YGD0thqbld/2jWoMloNiYhatG1uctEhNJQfu
 K+CjSaLC61g1z+TRK/+MdhbDe1bV6GjaVg05RpfQp56O6EQ3zGqIH6AjoGQghMf3Rq
 74cfSPUtQ8yraz5vp0i84oapdiAHSSTQvX5c4RADLNqzXfzpMHYDWrVPIVuwCJ603v
 DbPF2ioUZWAeqFk+T6z9RVKEaO46bQDc06l5lPdrMK2bHvz8NlySc9Nvb/keXe56De
 bdo/Opwuq9dNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gLd+keOs
Subject: Re: [Buildroot] [PATCH] package/mender: needs libopenssl engine
 support
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

Romain, All,

On 2024-09-04 00:03 +0200, Romain Naour via buildroot spake thusly:
> Buildroot commit 623d3bbe43e9193aa8e3395367d01af59071b859 disables
> engine support when BR2_PACKAGE_LIBOPENSSL_ENGINES is not set.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7717334889
> http://autobuild.buildroot.org/results/818/818f8c156311010d03d2f64b42231f486b543837
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mender/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index 4831548f76..c9b9d0b757 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_MENDER
>  	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENGINES
>  	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
>  	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
>  	help
> -- 
> 2.45.0
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
