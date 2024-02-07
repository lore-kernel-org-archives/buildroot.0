Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B178C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F04EB42203;
	Wed,  7 Feb 2024 19:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ue-N-r9vBDwr; Wed,  7 Feb 2024 19:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1287342206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1287342206;
	Wed,  7 Feb 2024 19:44:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9EFC1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D73956147E
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7aJ3BO-qzyvR for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A134960BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A134960BF5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A134960BF5
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:43:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [84.198.244.196])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6035B5FF88;
 Wed,  7 Feb 2024 20:43:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 20:43:33 +0100
Date: Wed, 7 Feb 2024 20:43:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Reza Arbab <arbab@linux.ibm.com>
Message-ID: <ZcPdZSkAFZViQ5vV@landeda>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
 <20240207175135.1532037-3-arbab@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240207175135.1532037-3-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707335021;
 bh=MsVPBPl6LTHhv4CFnRbEpkaTleBxUb/lPhwK26mATso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DqAwGWDmDsUXY0157eMFbyqLu6kN0bPVkZ45nMq+Tq+efBPFiuk9UAZyjK37OAjcr
 rC+jizhhYYRHSKE6V/81Q8mS08+bVvTVsJ8iB8T/+O3SQzgRJo4gHfwNVdqfcSYyU9
 ZQmhtOz9CFhLvM4mEPhfEkK/iI8wC0QTk+YccRz0i5hgQ5j3QYGkRGvBste5BihSux
 CQeTRkgg3mszNc+rq6NW5kjLt1Nej5jbrtstBi73cscUB3+9FTv5Er8zMydGc78R0u
 2JpFxVj9o0DKwpVBJx1zbvCPjqSWAvmgT/7BMDBJQ/qRLjdXUD9TCamWeFbPhkpZ4N
 xMjxWbY2DJr4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DqAwGWDm
Subject: Re: [Buildroot] [PATCH v5 2/5] package/petitboot: prefer UTF-8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reza, All,

On 2024-02-07 11:51 -0600, Reza Arbab spake thusly:
> The petitboot UI looks much nicer in a Unicode locale:
> 
> * Items in the language selection submenu use multibyte Unicode
>   characters. In other locales, they say "Unable to display text in this
>   locale".
> 
> * The combination of TERM=linux with a UTF-8 locale is required to
>   trigger a special-case workaround in ncurses code[1]. Without
>   this, line-drawing characters in the menu look like q's.
> 
> Turn on wchar support in ncurses, and add a reminder that a UTF-8 locale
> should be generated for things to look right.
> 
> [1] https://invisible-island.net/ncurses/ncurses.faq.html#no_line_drawing
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>  package/petitboot/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> index 6a3d476b11b3..4f3b1c1ea4d1 100644
> --- a/package/petitboot/Config.in
> +++ b/package/petitboot/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_PETITBOOT
>  	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_LVM2 # devmapper
>  	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_NCURSES_WCHAR
>  	# run-time dependencies
>  	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
>  	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
> @@ -18,6 +19,8 @@ config BR2_PACKAGE_PETITBOOT
>  	help
>  	  Petitboot is a small kexec-based bootloader
>  
> +	  NOTE: petitboot looks best in a UTF-8 locale (BR2_GENERATE_LOCALE)

    $ ./utils/docker-run make check-package
    package/petitboot/Config.in:22: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

I slightly reworded that sentence to better fit.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
>  
>  if BR2_PACKAGE_PETITBOOT
> -- 
> 2.39.3
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
