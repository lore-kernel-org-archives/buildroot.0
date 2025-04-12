Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D2DC369AE
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 14:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A8960F44;
	Sat, 12 Apr 2025 14:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWNNfrk07eq5; Sat, 12 Apr 2025 14:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCCB260F58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCCB260F58;
	Sat, 12 Apr 2025 14:21:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5733D108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D17C4051D
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEroHSKwV1Hl for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 14:21:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7681140BEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7681140BEE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7681140BEE
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:21:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 61A76780383;
 Sat, 12 Apr 2025 16:21:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Apr 2025 16:21:22 +0200
MIME-Version: 1.0
Date: Sat, 12 Apr 2025 16:21:22 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-2-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-2-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a9fb0e2f554bddf8d13ca91bf326b6ce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744467688;
 bh=+Vj+3+flEv1V5rtTwJpBTnoGTXLhP1uUC2rAQt21R48=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xt3M6m37b0g1F91OPV0kmaq001LjulYSDA2d+n7MVCgAjbnKW6EQsSlGWJXAf8tpb
 g3oXxggsERmdlQZBV3CaoUV/Q2O2QU1bbdvGCtuOBG7YTwGeMQKqGBrhOm5yQ5BXNP
 /WceUZe5KI9UqUNoRaN2TPpEH0SOgfRyUlaHQBmG0g3ZZLDADMLlUx/E5BuHaT5NUk
 ChTSUgX+F0zIARvXzFYD+w9GFHseTmnsUONlA1YeUwSf1QSkJovHam6sLDaVBJ3vy8
 e0t//fc0kvl8OfNItlOlEyNUUj+oqNiVmS+X2MjeFTS7bK6COzNxTx/n0B40xQOsQJ
 eC/Jen+0p9G/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Xt3M6m37
Subject: Re: [Buildroot] [PATCH v2 01/18] configs/ls1046a-frwy: enable the
 fmc package and dependencies
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

Hi Vladimir,

Since this series is a bit big, I'll review and apply patches in
smaller chunks.

On 28/03/2025 19:04, Vladimir Oltean wrote:
> Since LS1046A-FRWY uses the Linux Factory-supplied lsdk.config, it
> disables the upstream DPAA1 kernel networking drivers and enables their
> SDK counterparts. These SDK kernel drivers are configured using the fmc
> tool to do basic things such as apply a default PCD, so it seems a
> reasonable idea to enable this package by default.
> 
> Since fmc uses C++, we need to add the standard library for that, which
> also seems to increase the rootfs size.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks.

Note that I regenerated the patch with the "make savedefconfig"
command, in order to keep a minimal defconfig.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
