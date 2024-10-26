Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD26AD10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 907A280C03;
	Sat, 26 Oct 2024 13:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6TngJHCvmwK; Sat, 26 Oct 2024 13:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B820580C7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B820580C7F;
	Sat, 26 Oct 2024 13:31:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F090F5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC0594018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GI4xzGOnym-Z for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89B7D40175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89B7D40175
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89B7D40175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:31:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 236851C0002;
 Sat, 26 Oct 2024 13:31:07 +0000 (UTC)
Date: Sat, 26 Oct 2024 15:31:06 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Message-ID: <20241026153106.243e7472@windsurf>
In-Reply-To: <20241004081819.1236963-1-thomas@devoogdt.com>
References: <20241004081819.1236963-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729949467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DqI/01jkersJzpOI34xu1NPVy0rXE2fwVeOgpy1ECBM=;
 b=R7JFQkuB84CtnKtUI91mV2/C0KfZ2bNT7X4R7jLVdpxZhrBDcWXUH865AB3diJypusyehD
 PHmrgQzSxLrqBT6ocx9qA4JVrony/WgEB8nGzTcZLhbK5PnAN52dwkWG8UeN2p+iMq/pgB
 aKUqKoNlFiupk0q8Py2fsfIofrCxfgxCWxqMEGypf8aIMbHpm3u25FDU3rPiYJpu8ePBUL
 1Sv7kvpNP0ofdbuZQ78bl3v6F78KvWbNKFCZ//gX7eEohBWN1KyDHwaEKWpaPx2fzFPLsm
 VZLCrkxf298+aUmT9KUErN3WuoTFxLj96C++JPnT3rBImVWX/GDjzfnwsaKJ2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R7JFQkuB
Subject: Re: [Buildroot] [PATCH v1] package/weston: bump to version 14.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Oct 2024 10:18:19 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Notes:
>  - (14.0.0) https://lists.freedesktop.org/archives/wayland-devel/2024-September/043776.html
>  - (13.0.95 RC3) https://lists.freedesktop.org/archives/wayland-devel/2024-September/043775.html
>  - (13.0.94 RC2) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043772.html
>  - (13.0.93 RC1) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043761.html
>  - (13.0.92 Beta Release) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043758.html
>  - (13.0.91 Alpha Release) https://lists.freedesktop.org/archives/wayland-devel/2024-August/043705.html
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/weston/Config.in   | 1 +
>  package/weston/weston.hash | 6 +++---
>  package/weston/weston.mk   | 5 +++--
>  3 files changed, 7 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
