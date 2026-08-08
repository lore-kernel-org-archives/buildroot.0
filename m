Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564ADC55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 13:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1323C80E34;
	Sat,  8 Aug 2026 13:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgjxC9a33d4l; Sat,  8 Aug 2026 13:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 428E780E30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786196789;
	bh=pdEHn18u3E1kEs1bS5gnLoPEe9hCXkASpy444Oq9rSk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C8qi3T8Y0MOk890bvccj0+5j57rXTzHT3d1QOOEQXjGyTnOduLjmSSbpwxcmLEQI1
	 J99DsloTbsVaNCcxC9Jq+4fzFHRilLvnCkJPGr7ezkqeBETNt9cd7p9RBeelvtQD7C
	 R3IaaF/SCZWih7H6Bj1ARUGo+WScquusYbpW4aX9Z4Y9n6u2VyGsDprAoUz+7cSPMm
	 snsIdXdBiKc7ZbO/1tSp54ZTAMs1SxWm4vOCqVMvDZBM15mkBODB7kmvaZbHQevhNx
	 0dMc++Lf2/gyp8EH3R/B7BXg1t4gpIAH8zIaTgXuqoX0nLSxal8MhGkMOP9+vDf2+O
	 XtomXu/Q+s6nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 428E780E30;
	Sat,  8 Aug 2026 13:46:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E8151AF
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 646F34013B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtGw3GBxZjks for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 13:46:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 876AA400A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 876AA400A9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 876AA400A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:46:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EBD6813F86E;
 Sat,  8 Aug 2026 15:46:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 15:46:19 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 15:46:19 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Alexis_Lothor?=
 =?UTF-8?Q?=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <20260730144541.1079191-1-fiona.klute@gmx.de>
References: <20260730144541.1079191-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <441a2eddc51f40b6bf298459b18c7b86@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786196784;
 bh=DpGAlJQx3u1k9m8l+v4lmpMb+C0cEbuwhg3A3r2UTVo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o8SXyVffhUJtGvAJM4thGHZ3x7QcU74vNEP24VDH15SykYBwaQKLPZK0yRnAEQF0x
 3czIg5NkNODvZfqqax72wJ6TzAqukvXGudbTlkRpqrALFDWOxfFTVm3MReC7+DPIyJ
 z8G7JVeBFiYJEaO8PN0vI8hD22syQ675Ew6OGuvFRFDodbzyzDAxRcswqsEGWHKS+H
 J11LESbyjNXETw1tReWj7A8wOAEYuXCn7M/63tvpPhwfhd7tsMqltatp8bIFzBuiPo
 b5NIHZPYAa5jIljy/50pkQFhTOrb6WmXOujbZktv3iaH6KZ2jgiXRPbWW2fJhZlVvO
 HSv8ZKAJLrjLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o8SXyVff
Subject: Re: [Buildroot] [PATCH 1/2] package/glibc: fix license information
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/07/2026 16:45, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
> 
> The COPYINGv3 license file was added with upstream commit
> e067e53080386e93dcf8b07e25fb6656f2c8941e, it applies to scripts used
> during build.
> 
> LGPL-3.0+ applies to sysdeps/htl/raise.c, which is used for the Hurd
> platform. Buildroot builds only Linux, so the file should not be
> compiled, but it is part of the downloaded (and possibly shared, if
> "make legal-info" is used) archive. The same applies to the manual.
> 
> Checked against the copyright file of the Debian "libc6" package (as
> of 2.42-17 and 2.43-2), note that Debian excludes the manual.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
