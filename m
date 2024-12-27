Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84774E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 12:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C2D6082A;
	Fri, 27 Dec 2024 12:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ki6KcqwGbn9n; Fri, 27 Dec 2024 12:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A3F96082D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A3F96082D;
	Fri, 27 Dec 2024 12:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DFA2F1C
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 12:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E94840141
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 12:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8K8QxFI2nDW for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 12:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F92940012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F92940012
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F92940012
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 12:14:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id AE3B12003ED;
 Fri, 27 Dec 2024 13:14:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43912])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 13:14:34 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 13:14:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Julien BOIBESSOT
 <julien.boibessot@armadeus.com>, Tal Shorer <tal.shorer@gmail.com>, Marcin
 Bis <marcin@bis.org.pl>
In-Reply-To: <adc7c8fecb8ac3010b16178bdad062132dd0d0d8.1734713054.git.yann.morin@orange.com>
References: <adc7c8fecb8ac3010b16178bdad062132dd0d0d8.1734713054.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <700bffe50d1bb2171de3695324f829f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735301679;
 bh=DcD6zOoLTkwrWk6tiM5SWtHkporV0ZWitcDSUf+IREs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OLleXZM94b/fc3K9h7vKHdqXb1xEaoSF+NYD7GXlExi1CizaYR6sn4u0jdbEzlDG+
 BBfFq+TdmEGyYq+BG8L3jbAIcgppS4HX+/QWcOTv/EuKtIS2rkvQE60tTcBA/MPe5h
 xvzQIT/uwDBbAzfFXmCVatqQwUfMGaSr9eHxPrhKUfVAB8vU312PIQr1lnQB8QNUdw
 vn4vp+VZq6WYIx5ZxYbMyU5kcesvWSLmyilvCK0yIo/fj2quhZjym1DlSrZrxgkwUl
 /yo+b0ZNVz3yKmaIDJq4AETn1zXXHXkyxfeg7Z4uqYxdIGyzwJx2heLshOuSBaa/YG
 CibRX/XQM+N5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OLleXZM9
Subject: Re: [Buildroot] [PATCH] package/usbip: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 20/12/2024 17:44, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> usbip allows configuring a client and a server, to share a USB device
> across the network.
> 
> As explained in the .mk, usbip has been part from the kernel since
> linux-3.17. This would call for making it part of linux-tools, but this
> is a bit unwieldy: usbip is an autotools package, so trying to do a
> proper integration in linux-tools would basically need a complete
> duplication of the autotools infra [0].
> 
> Instead, we decided to go with a full-blown package of its own, that
> just uses the current-latest kernel version. This makes for a nice,
> little autotools package as we like them. Nothing fancy.
> 
> To be noted, though: usbip has its own license and license file, so
> that's what we use, and we do not reference those for the rest of the
> kernel: its GPL-2.0-or-later, not GPL-2.0(-only).
> 
> Finally, we only enable the core usbip support in the kernel, and leave
> it to the user whether they should enable server and/or client support.
> 
> [0] been there, done that; that was ugly and incomplete, what with the
>     libtool patches, autoreconf, and what not.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> Cc: Tal Shorer <tal.shorer@gmail.com>
> Cc: Marcin Bis <marcin@bis.org.pl>

Applied to master, thanks.

I added a comment in the Config.in about the hwdata/usb.ids package
that is useful (but not mandatory) to this package.

Without it, usbip can show non-fatal error messages such as:

     usbip: error: failed to open /usr/share/hwdata//usb.ids

See:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/tools/usb/usbip/src/usbip_list.c?h=v6.12.6#n341

I also added in Config.in the kernel source directory as the
package homepage:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/tools/usb/usbip

I did that because searching "usbip" in search engines usually gives
the old (pre 3.17 kernel era) homepage:
https://usbip.sourceforge.net/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
