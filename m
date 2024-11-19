Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A69D6C29A
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 21:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6444084C18;
	Tue, 19 Nov 2024 21:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFqignI4EwVD; Tue, 19 Nov 2024 21:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B3D684CA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B3D684CA9;
	Tue, 19 Nov 2024 21:03:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF4F2DB3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF11B40291
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-RPBlbxbjAv for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 21:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8128D40465
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8128D40465
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8128D40465
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:03:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 59F0819F5C3;
 Tue, 19 Nov 2024 22:03:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59636])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Nov 2024 22:03:32 +0100
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 22:03:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: buildroot@buildroot.org, ycliang@andestech.com
In-Reply-To: <20241119014601.1660159-1-peterlin@andestech.com>
References: <20241119014601.1660159-1-peterlin@andestech.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <470f75566bf2365700ea2c3733e9cb54@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732050214;
 bh=rMc+bjl/EGhU90wdq9mp9hoWaOgYK44goVW6RG6B9/g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lHKkJLBsZvLyOY7r119HCrKs8L5fZkrGNJPvrzlJ6Tsj28ey+z+fTxR7O2OUsRAOD
 M30XbmJf5nJvsf5nMKdemtANkM5eZCX33HqQuqUkh69v13y5WVkugjpauYCwiZ5MWv
 8oEQhqlgIIplHaIPtM42aRf/Ysfilv1RLzjyl73afE4UzJ0MsqqFFFStjKk2Fd3tzH
 h5pybaCbOjEKIzCaqnJ1gL8hdVGBacpFYWZilm4CnIgvcwTDdrwaqnVAjpIB8ZZWwm
 GX52iHXydw1cdbwAZkWIpwrzEl2aGwSrMz4TZ2MqZq7CfcKCReHBCJhmU1N5UKCH+p
 /nr2fRTcQ0TWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lHKkJLBs
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update maintainer of Andes
 platform
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

On 19/11/2024 02:46, Yu Chien Peter Lin via buildroot wrote:
> I will lose access to my email next week, so hand
> it over to Leo Yu-Chi Liang.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

Applied to master, thanks.

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3945803d53..0bc318811e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2527,7 +2527,7 @@ F:	package/dbus-broker/
>  F:	package/systemd/
>  F:	package/tcf-agent/
> 
> -N:	Yu Chien Peter Lin <peterlin@andestech.com>
> +N:	Leo Yu-Chi Liang <ycliang@andestech.com>
>  F:	board/andes
>  F:	configs/andes_ae350_45_defconfig
>  F:	package/andes-spi-burn/
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
