Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1B0CA0EF3
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 21:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BDAD6145C;
	Fri, 30 Aug 2024 21:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVM3pS0xQv5g; Fri, 30 Aug 2024 21:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FE361483
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80FE361483;
	Fri, 30 Aug 2024 21:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACF531BF295
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98C4C844CB
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2stWP0W8nby for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 21:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A7A984252
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7A984252
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A7A984252
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 21:50:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 81B4713F8C2;
 Fri, 30 Aug 2024 23:50:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 30 Aug 2024 23:50:40 +0200
Date: Fri, 30 Aug 2024 23:50:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZtI-sDH8r7jZVqrA@landeda>
References: <20240618194001.1907396-1-fiona.klute@gmx.de>
 <20240618194001.1907396-3-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618194001.1907396-3-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725054643;
 bh=kr7vMOq10xkmdzIIxmtcYCDJH7KoEwWdmDhsBh/2o1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OywK/AZOGvIO35Z32bF6bbRIzN9g+JvRq5iTo16ibjJvTXLu6EkoYKd+Xoj0pLhfo
 YhLFGnNrt3uF6e+ir0NwdQ86yM+Sy+t/nMK6aH1NZ/9VTvFnCaxYYv1jr5c488EPfH
 FaaQy0ErJzjFJ1r0IBi6EmQT7IeGgnsOhTaUtIY5IYTpkoaeP4frSbgnOz8R4ICIrF
 cQvnHzNRJ0fsvQOrUyqPEeqfTLjVZhv6WIQyAsmRkPW/iyWw4ZoZRCRJrpdiw3tz7S
 LxSU76ylm5VKyJv1DQsgxhspO1GdtOkLgQfz6/HQzC7/NpM9aHlNswLDHsGAEOemhv
 8pssWvpgyQ4+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OywK/AZO
Subject: Re: [Buildroot] [PATCH 2/2] board/raspberrypi: Enable nullglob for
 DTBs
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
Cc: =?utf-8?B?Sm9zw6k=?= Mendes <jp.baltazar.mendes@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-06-18 21:40 +0200, Fiona Klute via buildroot spake thusly:
> With "nullglob" the post image script does not fail if there's no DTB
> directly in BINARIES_DIR. This is required when using DTBs from the
> rpi-firmware package (BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y),
> because in that case the kernel build doesn't provide one.
> 
> Using pre-compiled DTBs is discouraged, but useful for using mainline
> kernels until suitable DTS can be merged.
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
> ---
>  board/raspberrypi/post-image.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> index e4611d05dd..b7ccf5d0b3 100755
> --- a/board/raspberrypi/post-image.sh
> +++ b/board/raspberrypi/post-image.sh
> @@ -1,6 +1,7 @@
>  #!/bin/bash
> 
>  set -e
> +shopt -s nullglob

I'm not too fond of this. Indeed, when reading the glob itself, it is
not obvious what happens when there's no file, as the usual behaviour is
to expand with a single word where the glob character is not replaced.

Instead, I'd use the following:

    for i in "${BINARIES_DIR}"/*.dtb "${BINARIES_DIR}"/rpi-firmware/*; do
        [ -e "${i}" ] || continue
        FILES+=( "${i#${BINARIES_DIR}/}" )
    done

Regards,
Yann E. MORIN.

>  BOARD_DIR="$(dirname $0)"
>  BOARD_NAME="$(basename ${BOARD_DIR})"
> --
> 2.45.2
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
