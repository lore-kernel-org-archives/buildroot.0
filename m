Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6053D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 17:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3E9184015;
	Fri, 28 Nov 2025 17:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0rbpLMjStjR; Fri, 28 Nov 2025 17:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D16FD83A74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D16FD83A74;
	Fri, 28 Nov 2025 17:40:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA6FB708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A18DA41910
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXVRzcNxoOYy for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 17:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A98D04190F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A98D04190F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A98D04190F
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:40:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 65C8313F88D;
 Fri, 28 Nov 2025 18:40:25 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 18:40:25 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 18:40:25 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Maksim Kiselev <bigunclemax@gmail.com>
In-Reply-To: <20251127202741.2781998-1-bernd@kuhls.net>
References: <20251127202741.2781998-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <732205f6bf01ced8d4149cbe80b3e32c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764351627;
 bh=CuHohVIKk5OuZodlV/MuC64rzqgiKYsUa5HwIBy1rYg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LPgOixAjStj4HT31pjDy47jYlae/GpD4aJMFtItkOCZxFiAbRvLB1WTFzH8dC2fxW
 tvCRj2NeOhk3f9DwJQZMdV4tikckmOP+JoUowF12BkTrVcICKukCWH+BTSSmP+nd0h
 hHS8lWLrpUM0anLCGaFoF1X2vw7Sr/kAVtiosMR84CEw83wTbli5qQKbyGZ6EVVoGd
 X3PkDQdyAJ/TTZPAO60r+KczjDVv1rpKeijiHK0MxGaBJrMJOPibjrYpdfASwp6ibA
 P8U8DS7BNgyeuXdbNicLiOWUQ4CtaitWLeTpcnsWD28ePeDadJzWQzeEI9TsNveZng
 XfidTh1X6luaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LPgOixAj
Subject: Re: [Buildroot] [PATCH 1/1] package/ledmon: fix musl build
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

On 27/11/2025 21:27, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/942/942cb2dcd061b8620211b63d4be34dc414251b62/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
