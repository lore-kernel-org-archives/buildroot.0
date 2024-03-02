Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84571C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DD9407DB;
	Sat,  2 Mar 2024 22:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIsEk3qx_Ujj; Sat,  2 Mar 2024 22:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A720407FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A720407FD;
	Sat,  2 Mar 2024 22:24:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4483F1BF57C
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFD960770
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRz_tJQWqria for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:24:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DC9A6076D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DC9A6076D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DC9A6076D
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:24:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7650513F846;
 Sat,  2 Mar 2024 23:24:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Mar 2024 23:24:44 +0100
Date: Sat, 2 Mar 2024 23:24:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZeOnLF_nG5xz7Wg0@landeda>
References: <20240302212852.197223-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240302212852.197223-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709418287;
 bh=YbzJs5CW60tpCNuCnEDHq2znHz9Qn7QbLCwwinLlNQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LScWhpdohU/dLxpgzLE6fg+6+b9ckKevkAuOkik2T9q22TqoxSIVMjjL8CUrX8Wn9
 iGwaYhalNoP7t9Puv51mw7uXPJVIb/44AXjflm4ZvyfusC8BywYzBFkgEgnQ6AcTY7
 C4jGZdrbKxpmPJtIGvFwoDEAdEk50dEGGrpgAEiRsWRM3QOzaogMfVy6ISp7QsQO0u
 7BrY3g95Trs7xEihNQbHEmg+VnuEc+JAB45ChrfCddDkHtpaH/LF4DH+Xon2rOh/Er
 fxMCjsFaT/owtMnidrVO7bYeJKBHTuhviQDl5Me5vgWzLOyzy5wEDwssjfc3qSw4GC
 GKP7R1jE692lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LScWhpdo
Subject: Re: [Buildroot] [PATCH v2,1/1] package/powertop: fix gettext build
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FAbrice, All,

On 2024-03-02 22:28 +0100, Fabrice Fontaine spake thusly:
> Fix gettext build raised since bump to version 2.15 in commit
> d65b960859046be486ced6c490d3671bd1392661:
> 
> *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.20
> 
> Fixes: d65b960859046be486ced6c490d3671bd1392661
>  - http://autobuild.buildroot.org/results/bb80a7842d18651e5069f3a91f06a9c23218d260
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

See below...

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Set POWERTOP_AUTOPOINT=YES instead of patching
> 
>  package/powertop/powertop.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
> index 0481caee07..a7a57939e0 100644
> --- a/package/powertop/powertop.mk
> +++ b/package/powertop/powertop.mk
> @@ -20,6 +20,7 @@ POWERTOP_DEPENDENCIES = \
>  POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>  # 0001-add-disable-stack-protector-option.patch
>  POWERTOP_AUTORECONF = YES
> +POWERTOP_AUTOPOINT = YES
>  POWERTOP_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive

I did like it much that autopoint was added in-between the two autoconf
variables, so I moved it above but "forgot" to amend before pushing, as
there was still some discrepancies in how the _CONF_{ENV,OPTS} variables
were spread far and wide from each other.

So I pushed a followup commit that reoraganised the varialbes in a more
logical manner...

Thanks!

Regards,
Yann E. MORIN.

>  POWERTOP_CONF_OPTS = --disable-stack-protector
>  
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
