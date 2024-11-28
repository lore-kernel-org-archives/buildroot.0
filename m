Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA541D70DED
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C84407DA;
	Thu, 28 Nov 2024 20:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2CaCHqo1ucj; Thu, 28 Nov 2024 20:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3EB407DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E3EB407DB;
	Thu, 28 Nov 2024 20:24:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97116712
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84C53841A1
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEmQ0cH3V-2P for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D63F84193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D63F84193
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D63F84193
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:24:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E3A485FFAA;
 Thu, 28 Nov 2024 21:23:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42404])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 28 Nov 2024 21:23:57 +0100
MIME-Version: 1.0
Date: Thu, 28 Nov 2024 21:23:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Alexey Lukyanchuk <skif@skif-web.ru>, Bernd Kuhls <bernd@kuhls.net>, Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>, Asaf Kahlon
 <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>, Julien
 Corjon <corjon.j@ecagroup.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Nathaniel Roach <nroach44@gmail.com>
In-Reply-To: <20241128035935.9453-1-fido_max@inbox.ru>
References: <20241128035935.9453-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.9
Message-ID: <ed15d1bca37b811143acd23a075d807a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732825453;
 bh=nerua3BerxHC3vdME5iPJc+fg4VDgI/fnC7wWffQCBM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gRYWnQGbD2Ng4ny8U10x98g4/NjUJptK4Pp2nTH+VV6IjB9g1OOSYiMoMFckQfmEI
 pFVEJrEZ1L8jSLj70UUp81z6knAzz8+exemkAeUxRiZhIFoPzDI5xNXT0K2eFeIha6
 BmL1/CBElt4ppdQvCCwFNMNRuEWyY2IGs6nOF+dqfMFtbrRw2c+VuE4ONyOUjvZd+b
 GhgAC/cQna8Z36E045HI+x53/bwMkusKIn1Tw0Xh80DsIaCwL2+VBcAMgzM7jwPvjy
 A/EGilJfKyJ7SVg4RpshYGSulB7yOzgbWxuGUxQ3GaNUYZMLgCbcqt6xEYO1xbq6fz
 onEp3iAe1UxQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gRYWnQGb
Subject: Re: [Buildroot] [PATCH-NEXT 1/1] package/postgresql: bump version
 to 17.2
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

Hi Maxim,

On 28/11/2024 04:59, Maxim Kochetkov via buildroot wrote:
> Changelog: 
> https://www.postgresql.org/about/news/postgresql-172-166-1510-1415-1318-and-1222-released-2965/
> 
> - Use meson build system and drop automake quirks.
> 
> - Since commit 
> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=68a4b58eca032916e2aad78d63f717dcb147e906
>   BR2_TOOLCHAIN_HAS_THREADS_NPTL is mandatory dependency
> 
> - Since commit 
> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=8d9a9f034e925568342c7ccfd8d351a3cd20e7f3
>   BR2_ENABLE_LOCALE is mandatory dependency
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Thanks for rebasing the patch! I applied on next.
I included some fixes while applying the patch, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/cc77be28fc030f8583a4a7f9f724d0fc9543dba5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
