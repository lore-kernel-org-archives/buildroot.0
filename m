Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C39C48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BC7040242;
	Mon, 19 Feb 2024 21:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhQwLZBLHjJS; Mon, 19 Feb 2024 21:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0A9B40359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0A9B40359;
	Mon, 19 Feb 2024 21:06:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 538CD1BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D17E40359
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNV-bRaBQEvI for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A57D340242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A57D340242
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A57D340242
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:06:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6123813F8AD;
 Mon, 19 Feb 2024 22:06:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Feb 2024 22:06:19 +0100
Date: Mon, 19 Feb 2024 22:06:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZdPCywv45MguAp0g@landeda>
References: <20240219183828.1289275-1-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219183828.1289275-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708376783;
 bh=MZGBXnJherKtHacJWFCyFzYFaZWg72EpHuVXRB4nciA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G5O2mm+I6puLsVTp14n7RnBViPEitSiJIx21k7iQHvAqlbX2PQNaUwjriIntCNURY
 7Y2LQs6CDwBY8GekfxSjcakrMcDOqFokErWea7a+JeYPQ9Cz0n59c2BTmNniri4IjO
 eMvTednRES/MpFNl5h13z/SAitCiOUOd0/vM5BCPFmyOmjVhMZIAKHeXFIj8X1T3WP
 LvlWRuthOyy3Er+f52j5D5E42G1xibo13TRZENg5uWrnJyjpC2sfFjwjvRCyVmmlni
 j//9Co1KvzgJrpYykzycvGh+MX4njhTqMkkc/tNAyGglGP4fWCh+ATmD4qm4SA21LV
 f51pYkcXf3mzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=G5O2mm+I
Subject: Re: [Buildroot] [PATCH] package/systemd: needs sulogin for
 emergency target support
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2024-02-19 19:38 +0100, Marcus Hoffmann via buildroot spake thusly:
> systemd invokes util-linux' sulogin via systemd-sulogin-shell[1] via
> emergency.service/emergency.target[2].
> 
> [1] https://github.com/systemd/systemd/blob/main/src/sulogin-shell/sulogin-shell.c
> [2] https://github.com/systemd/systemd/blob/main/units/emergency.service.in#L23

I thinks that, technically, it could be content with sulogin from
busybox, but since we already select a lot of util-linux' tools, adding
sulogin is not goign to add much to the target size.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/systemd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 859332d9e4..58b4e51c6d 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -34,6 +34,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	select BR2_PACKAGE_UTIL_LINUX_AGETTY
>  	select BR2_PACKAGE_UTIL_LINUX_MOUNT
>  	select BR2_PACKAGE_UTIL_LINUX_FSCK
> +	select BR2_PACKAGE_UTIL_LINUX_SULOGIN # emergency target
>  	select BR2_PACKAGE_KMOD
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
>  	select BR2_PACKAGE_KMOD_TOOLS
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
