Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31C4C6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C38F16066D;
	Tue,  2 Apr 2024 21:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYP8_A5x3xj9; Tue,  2 Apr 2024 21:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC72260BDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC72260BDE;
	Tue,  2 Apr 2024 21:28:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1A151BF295
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F3C9408C7
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 21:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVXWhUgbRzDy for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 21:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F41C40289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F41C40289
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F41C40289
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 21:28:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5566B13F86E;
 Tue,  2 Apr 2024 23:28:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Apr 2024 23:28:05 +0200
Date: Tue, 2 Apr 2024 23:28:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zgx4ZaqmPl8Vbv9r@landeda>
References: <20240401234013.3570820-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401234013.3570820-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712093291;
 bh=YC8Qkntb/TBZcEuL8J6jLIljTS0w6UijNxJpIWLA8uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qF//y24fvj13y2LAjwC+UYJ0quRmW4Dbfx2LEndI4WnyU50o6lNfciZopcSOtuPSc
 WP/nhOcU7J8DmvtnG1lj9pJ4ANreXXg0nSuvtD/KOLijMkULIGuN+j91TN/PIJ6k6O
 PA6eiFsi3Z4pyXVW4hcNfO044fnhlyLdkkw3FsA3S40dLBUrL66uw63uK6MA+Q4hUn
 qc4MmX1g/g3pe/8kjgxAPf5d7m/jELuvUAhHffhYBrSIDBkJ6IBo++SThLXBv2Jqj0
 gA1S6EkOKKfhV3g+5XmgpFqYkPRXH2Njot4aIrCgjzllncK2Pzi8iVA2ECeecAFeg0
 BTCd7ivFuN58g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qF//y24f
Subject: Re: [Buildroot] [PATCH 1/2] package/libxcrypt: support host package
 build
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-04-01 17:40 -0600, James Hilliard spake thusly:
> This is needed by host-systemd.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libxcrypt/libxcrypt.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
> index 9ad030fbd2..e24bc2e847 100644
> --- a/package/libxcrypt/libxcrypt.mk
> +++ b/package/libxcrypt/libxcrypt.mk
> @@ -18,3 +18,4 @@ LIBXCRYPT_CONF_OPTS = --disable-werror
>  LIBXCRYPT_CONF_OPTS += --disable-obsolete_api

You had forgotten to use the same set of _CONF_OPTS for the host
variant, so I added those.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.34.1
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
