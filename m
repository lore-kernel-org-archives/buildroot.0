Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F1BC9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DEBA80D97;
	Mon, 28 Sep 2026 11:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwrCw3JhMbnl; Mon, 28 Sep 2026 11:51:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 43FE380D74
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790596261;
	b=UxlokMue6cplC2oUK/XYvyq/1Lh4cX9thrXm4jJ/+G7wJngRZPFsRtf0oUMPF29/FZ1b
	 O57lJbjiFmhxqaMfjR6ZB0CowvIQaux/DeEzCp7+m4ECphRc08gU4sP21SYqnvBaMRjdL
	 t8p4pZj5xOPn8ZzoE0RogpSZ0l6vUxVg84grlWRa/gv9A84sv5ICDwdMcFWC+oFD9kOpx
	 q4mOdjDHxHiDR7X/c0vMJcxJZ2S5MFx/KNDlcxWId9RbuYK3VTe8/XHT4NUJQOXVUrvgI
	 p0VLu3SJyxtSqkCcz2DWOAUg2sXHBdxphyfL+vxysMg0+Pyury7WHoyRLdKtWR7AaDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790596261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zHtp+lrmPXz18ZxIuGlo2KhxUJ/pUfxzaEw5zp0xk+E=;
	b=RIyH+u385az40R2M0A0JS6iDFP3F60s+mkoOxe+O1ld/gLPYlucWtzCVFZTjSYWGNagI
	 Zbnn/SJJ+xJJqSpM+gTtXVVnNePlaJK/Nz73P1obK5rtuIGOkKRIGKgi4DDtNXiKzzsFG
	 4pRPY1AbgM19ZF7mZfiQPbihU56CviybCNkX05rzJkfLikU2tey6DwGbDkAVdHx2XJqhT
	 WkFHqeD70Fw+5KjqrUd4EBjA2vMCHOirvgldbCp/teSD9mGDsfT9P4BPhFDzQT9p7b1uw
	 h3iFb8Y8FjfyPfnr9kC/fC84hmuPl7fc07hR94sWEP48L7B3vTkglgdcASNrmBYr5Ww==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790596261;
	bh=zHtp+lrmPXz18ZxIuGlo2KhxUJ/pUfxzaEw5zp0xk+E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PnqPf10JS/6RI+d/UmuxjOyktSGrZo0u9//pLxa6UYj1Phlf4kiT9nrmTO0fLhGJK
	 Z6Lw8tbshkvxznqTkljFsul9ZM2UiHHC96o/OuGDnmRxUZM8fBihmKzIrEtH8aoTWm
	 g3cO5wvyyZhZKtJTMf/JA9X+8HQSvfVBvftXsiXvbocIwZ+VHTJ6DrrTL/g3jcRMCr
	 8C3TJBHovxlsQlxBFkPVzeNuPhOFMbZhdPKhy8YU11FNKK0wFPgljlF1vkEWWEsapL
	 lzxv9YCY344QnVeIX5KReCAHZ2bAifP5LCgxC5GZx2KCZLgYTkK7EJiaNt4KJMu8KT
	 zBjw+rmCU/BvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43FE380D74;
	Mon, 28 Sep 2026 11:51:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81F593D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F87E60631
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-ikGVOT-rq3 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:50:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 86942605EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790596259;
 b=SLvfE/vd/3Bxt8PwDIP0Br4yv+Se4bjHpDz0m/VVPZzXUcBpl5EVsWWHWXdz6iSSFv7x
 DCpPDKl6A/kuwnuQk7ig6hJNRR5nggctajotp3clRWTYse4gxT+4ClgUV43C34HQo7lWI
 vX1riXehi29oeCrQjb9sZzIZjSo7c8mDddVRp8btl44WuyitvxBHxYEnIH4bs0qo5pKAK
 jgvv7il/q3JQcS9GEL0C0D83xaZpEjr7MB1YHxtbk9HszLQea8+qzKLb05ZT48oAp++x9
 +X072hFyl5izAL5veEyylB84XftOuy8lzOPp1XeJp3wqkkeu8hDZ6ZBUgxiR8ubmqkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790596259;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ipVqzwJILrH99+U1VtbvOkzkS2ukkcyzDsYNrFtLVfk=;
 b=G/vCmIGfV4/moNwTf4ypA40FxmeNsWLew6QT7STvpRyCg8K/rC1JGDur2NaUNulciqt4
 bFFn9nlEVz+MTSPm5sIeUmqZg+VNb/QsyCuNDkgCvaE5miYnUFe9tBDVbvU8lUtk4gNyJ
 X8ITQu0cdqBs+ycR4VMFm8C6km/Pq/H1URlVxQRxMq/54VPGi8zn/ux0iqsRb3knXFZgk
 QGYcA0pdleUTuD/haq9KOsnbePBJnp6YNClH02H1T/5oY1+wEBno1APxhn8b3VlAh0qTS
 /PyBA9GAJ7okLcV3hkwnnGuq2y7HRYKz9FZkwvV7RY2pCpH3SaDVSi0xXe/S5UMqrPA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bCKIwxXW; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86942605EE
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:50:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2D4D74E410A4;
 Mon, 28 Sep 2026 11:50:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F1D7E601BD;
 Mon, 28 Sep 2026 11:50:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C854C102F1ECB; 
 Mon, 28 Sep 2026 13:50:50 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:50:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Bis <marcin@bis.org.pl>, 
 Robert Rose <robertroyrose@gmail.com>, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>, 
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>, 
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Sen Hastings <sen@hastings.org>, Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arpUlvCOAcj5Ks-_@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-59-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-59-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 58/82] package/netsnmp: Fix build with
 OpenSSL 4.0.0
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

On Sun, Sep 27, 2026 at 12:42:36PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
