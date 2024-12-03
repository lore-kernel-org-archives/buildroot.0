Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5744E74AD1
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 20:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 697EA84132;
	Tue,  3 Dec 2024 20:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zC87WTL8jIJW; Tue,  3 Dec 2024 20:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A79F84164
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A79F84164;
	Tue,  3 Dec 2024 20:16:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 873091DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73FEF84164
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cg2vmI2tPlYR for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 20:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82F0484132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82F0484132
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82F0484132
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:16:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 01C1F13F88F;
 Tue,  3 Dec 2024 21:16:11 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35362])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 21:16:11 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 21:16:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: LP C <lpdev@cordier.org>
Cc: buildroot@buildroot.org
In-Reply-To: <DDAD80D6-F42C-4D97-9876-FEB2021F2F02@getmailspring.com>
References: <DDAD80D6-F42C-4D97-9876-FEB2021F2F02@getmailspring.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <307706677745b3293eff3b58b6080909@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733256973;
 bh=lxlI5iKOJ+anpAgSqITW0GoIZx3K0DqPhDkMhsHA8mA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZT4nG903Ya4UynvcYL8zKzRmyrnehcEP787cmGMpbE9M4JlYyfuns23rT2ln0+tpb
 aw1Bu1xH4ReWXGnjvJtThYKIqMQTrY0fJF9mKvK9RXq8oMY3LJzcHCNs6QMwMK20ui
 Z8DaAnfwz/Cj1Im74E9N45eaJCQ9PItkwLgIWLWvKhsaNxdhnrL8mulhdfdRardjNE
 3xMTCn1RYAzcL2pF7FdiHhqiPUhLPro5nExHXImGfeuJ8n4o4OdtRQhPuqsuOXeqzi
 P/XVA+FoKMJK7e0uFON90DjVzxlwfQ4Nx6Z31rshfxmmQijhPvaNvh6r0xsFX2bgp7
 m7el4tTMs5ZEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZT4nG903
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove myself as maintainer
 of package/{intel-gmmlib, intel-mediadriver, intel-mediasdk}
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

On 02/12/2024 17:54, LP C wrote:
> Signed-off-by: Louis-Paul CORDIER <lpdev@cordier.org>

Applied to master, thanks.

> ---
>  DEVELOPERS | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d75df5cc55..c2b6b1dda5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2119,11 +2119,6 @@ F:	package/python-huepy/
>  F:	package/python-tqdm/
>  F:	package/rtl8189es/
> 
> -N:	Louis-Paul Cordier <lpdev@cordier.org>
> -F:	package/intel-gmmlib/
> -F:	package/intel-mediadriver/
> -F:	package/intel-mediasdk/
> -
>  N:	Luca Ceresoli <luca.ceresoli@bootlin.com>
>  F:	board/olimex/a20_olinuxino/
>  F:	board/zynq/
> --
> 2.47.0
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
