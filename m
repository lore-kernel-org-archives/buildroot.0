Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0F0C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB6581256;
	Tue, 23 Jul 2024 10:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6YyqRU5rGhO; Tue, 23 Jul 2024 10:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DFC981259
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DFC981259;
	Tue, 23 Jul 2024 10:24:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06EC81BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00F43403B3
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QofGSbqLNrF4 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BD08400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BD08400B5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BD08400B5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:24:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDE4440008;
 Tue, 23 Jul 2024 10:24:11 +0000 (UTC)
Date: Tue, 23 Jul 2024 12:24:11 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723122411.57535f1c@windsurf>
In-Reply-To: <20240723095614.993000-1-fontaine.fabrice@gmail.com>
References: <20240723095614.993000-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721730252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rr475zzGgUDc6d523hI8NB80M/wiFzRX5tF5WqXygio=;
 b=IHuQixvi4TsB8yt6FDjGlBX+GfgGHD3lNR8KJLg/X2zXSKP2qYpFW7x6NQ1mvQWzbBJbjJ
 z5htoKADW9zyI8HCoAXMIruWVLUV3cBHCml/qisJ32AxhWSRdrP+FpTqrJgs/QDPn/rqdg
 KY2rpZwm85WzKI5erp7oZQqnl27AOtSTzUwQpyWvkS8n0tWNteNy4+3Pu5Un0j2fSIsKpV
 UqigsosLmgkGcchP1LrnIMTzFwBrEDmopm3P97UXTqOrvla4WTYNCwYBBXTK0VZt86I5jY
 kQfNzL97R+XaLL85h5xBvp9Np5MPD/2x6jB273nX430K6lygh4nPtK52taqxaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IHuQixvi
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: fix zlib build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 11:56:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f forgot to move
> host-pkgconf dependency from BR2_PACKAGE_MTD_JFFS_UTILS condition to the
> new BR2_PACKAGE_ZLIB condition resulting in the following build failure:
> 
> hecking for ZLIB... no
> configure: error: cannot find zlib
> 
> Fixes: bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f
>  - http://autobuild.buildroot.org/results/7cbeead738af6302d5f0048a443e3b57d6776bb2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mtd/mtd.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

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
