Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1C6C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D2540529;
	Fri, 31 May 2024 09:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e43RF9IJey1N; Fri, 31 May 2024 09:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F2564064D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F2564064D;
	Fri, 31 May 2024 09:47:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1F4B1D502A
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF1B160612
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PqBOo1ca6yB for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 974336062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 974336062D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 974336062D
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:47:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55E2A1C0003;
 Fri, 31 May 2024 09:47:31 +0000 (UTC)
Date: Fri, 31 May 2024 11:47:30 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240531114730.61f9f0fb@windsurf>
In-Reply-To: <ZkzdeFeoYMkyGv7w@landeda>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CAOf5uwkDmcxhWJUFhxjw_GJTiTEO5oEexb0Xjh6aNJx+K_9dXA@mail.gmail.com>
 <ZkwwN1NKZ2o1xMba@landeda>
 <CAOf5uwnVbowN6GCYUxFL0xh2YV9AvG2JTkuyQR6rk+56J=3DLQ@mail.gmail.com>
 <ZkzdeFeoYMkyGv7w@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717148851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9eFUk/2etC0FgbXgahBT4UaJjYiUHDidaQMSwdazPQ=;
 b=QI8vFU/HXdSP2INvWEHGCkSBDpCN0mH7yyqGB/LQXatrwLRdD1wpV+TrWCKPhhWwIMPWem
 CK4OzO2SpH9XKbVcvun9bBfz72KsM8QmsQFCHb8czsiNP16Zxt1zdqlXa5wJ22PbXucRHT
 pBGP4fnNFhr0/ThJrLwljFCOTu8jnVbUKPYvZBzx+pun21Z+yS5/ZHt1nsUHwJoBzFRKA/
 839UU7DEu6Yi792eej3TLy+9Lwisl5bJM3UzIHgnzHG9xniopoNR1YMl6xW2xqSH2nhsx7
 umw9KBNanI/WG3lzMms/vq1tWGua1crBmNaZG5hB+iZGs5fOPjQQH0yh5Tkq/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QI8vFU/H
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 May 2024 19:44:24 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I tried a bit earlier, and the genimage file is indeed sparse, but I
> could not find a tool that would report the list of holes/non-holes in a
> file, and their offset, e.g. something like:
> 
>                 size    offset
>     non-hole    2MiB    @0
>     hole        1MiB    @2MiB
>     non-hole    16MiB   @3MiB
>  and so on...

$ pip3 install sparseutils
$ truncate -s 512M file.img
$ sparsemap file.img 
HOLE 536870912

Seems like it's what we're looking for :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
