Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D754CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:11:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6265C61039
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6265C61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3417F607A6;
	Sun, 10 Oct 2021 09:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qoIq5khBT803; Sun, 10 Oct 2021 09:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90DCD60783;
	Sun, 10 Oct 2021 09:11:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94E191BF476
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9121F404D4
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSZNNuv67YgK for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 09:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8B3B404D0
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:11:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:344b:acb:d887:4b62])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A17DA780383;
 Sun, 10 Oct 2021 11:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633857067;
 bh=LNCcVTW+4rxfKz1RSZnA4ZuVSVWXob+vvWne1vKXr7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DN4bF4JPNhOHWAdgzMfeb+UNfDewcirPMkNnhQzlDElb+2sLtpbYChexucwzFaJBZ
 y5FzOriWm/sbXRNseURHl5Yh7pCXFjSmwMCo7yrwzk1giPaHmHsEG6aVjYo/miX79O
 OgpR9PFWSjgVK+eYI1wea5xrzPpSVg4Drxn5wdK5hf3qjxRMELQ/LuwQWXDf6i0PmM
 xCgbY3jQOBnthLyNN1soPXfXqKx7SjiJS5WuPB5+FTApFhfrqFdKkcXuEOCmSdTBRk
 W6kLxgKiJS1qHpKsGUw0laWMFhpAcy3Ws9BnScMmHccz0MbaiYsgkr6znxtsmKVJRG
 rN1nkXJ0ZaKPA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 11:10:59 +0200
Date: Sun, 10 Oct 2021 11:10:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211010091059.GK2081069@scaer>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
 <20211009191646.1076266-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211009191646.1076266-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/5] package/gdb: add support for gdb 11.x
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-10-09 21:16 +0200, Thomas Petazzoni spake thusly:
> From: Michael Fischer <mf@go-sys.de>
> Starting from version 11.x, gdb needs the gmp library.
[--SNIP--]
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 246748131e..d5ec5406fb 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -54,6 +54,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_sh
>  	depends on !BR2_csky
> +	select BR2_PACKAGE_GMP

This one looks a bit dubious...

If the host gdb is enabled, then the target gdb is the same version as
the host version. So, this configuration:

    BR2_PACKAGE_HOST_GDB=y
    BR2_PACKAGE_GDB=y
    BR2_GDB_VERSION_10=y

will yield a configuration that will force the target gmp, even though
the target gdb will not use it.

Or did I miss something?

I can fix that when applying:

    select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11

The reasoning is that, BR2_GDB_VERSION_11 can only be set when the host
gdb is enabled.

So, if BR2_GDB_VERSION_11 is not set, either:

  - the host gdb is not enabled, in which case the default for the
    target gdb is 9.x (with next patch, 10.x), or

  - the host gdb is enabled, and another version is selected.

Thoughts?

Of course, that will need some refinments when we introduce gdb 12.x (if
it still needs gmp). But for now, introducing either
BR2_PACKAGE_GDB_NEEDS_GMP of BR2_PACKAGE_GDB_11_X_or_later seemed a bit
heavy-handed...

Regards,
Yann E. MORIN.

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
