Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8312F8D775
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 19:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836F86090B;
	Thu, 16 Apr 2026 19:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZXOAsLeMsz2; Thu, 16 Apr 2026 19:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C618060A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776368619;
	bh=bz1HrkFNMSmn+jbqlxqYLCTxFUOYDoJ4Zh8/xTOFgW4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZIPmd+TLaCcMdxnVPwPDBIrlRV1R6WUXZzfLhOeYtY2Fck700LR/nHS9Zu+YQ794F
	 ddH41zuha2SW+Tv/6kVNlCFZzxOTDtWOgeyU83r7LwFJPdGzSs341BsY8c0wMporJR
	 8r2ZrswWSX+yWWcxNERE0Ty+9URhvHxiEHrmTJCGIC9QKakbSpaArjazunlV/p8/5i
	 YwgNN9EOoSbM/axim8kUHLhSixkT3oYhBQa10xw0U5ODfhrF9gwqJxTmIs8O2WpP4+
	 tIoREkeNfNFrNx4+/PtSkk644h9Bo8nbGyQ4jgg8qqEQD/T+pXru64xmVk6LZAGGR7
	 uiA4v1x7g4SBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C618060A45;
	Thu, 16 Apr 2026 19:43:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF7DE2F4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A11A840409
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99gBJuItsbEQ for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 19:43:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3340403D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3340403D6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3340403D6
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:43:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D156420039C;
 Thu, 16 Apr 2026 21:43:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Apr 2026 21:43:34 +0200
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 21:43:34 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260416114256.969634-1-aperez@igalia.com>
References: <20260416114256.969634-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <cb12be541aa6a793248bf1778a756e19@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776368616;
 bh=s5M0SaDQiTCHsX8VWluHxBb4F5I3+mN3v4MCgnDBIkg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cby5N071dA4EdeBgC4r2FqiOOIAYyWXPEfYCdlRK3gfMmSxZcZvQiAfRKNzD/myPA
 sNf6xPw3d0MlJgHPZcSCk5azjzIWeGpV0zt8v29l2lwbQh0g/h25P2DTrVfvv+GD7e
 Qd9CnFWmt7UTpkDtiSThRuSIQ+7mVQi7oRXf85dzvzXFTHQx0aiz7yorNaKETqH3gj
 ScIpsXKOcsrbsBnqGGSpddT0wJlROJP3CDh+RSjN9xVuspLJ6zUfnXStT45nX0V7VO
 twsOSvE1SJnJ5bZIFMBY/q8HEZW/4ovxTXUUn/MfwRti7bgnlJCOIqg7FFrGwy32CS
 bB/DYR64NvejA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cby5N071
Subject: Re: [Buildroot] [PATCH 1/1] package/xdg-dbus-proxy: security bump
 to version 0.1.7
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

On 16/04/2026 13:42, Adrian Perez de Castro wrote:
> While there is not a security advisory to go with the release,
> it includes a patch to prevent message interception that may be
> considered a security fix.
> 
> Release notes:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
