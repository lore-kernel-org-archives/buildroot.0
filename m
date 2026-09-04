Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7499C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 20:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4260D81174;
	Fri,  4 Sep 2026 20:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHtuHWJ1yNgl; Fri,  4 Sep 2026 20:11:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EC498810F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788552697;
	b=DixgQLoYOeZB55BLnvAnXi9B42cnh7n/7TBPVYL3QTUDP+D/dvu2O73q0q0vjxGPJU2r
	 y63oiPtXB67LylklDyF9mWQ4Z7EZyFe4q/NmNGMb9xk9c6LIdwBZM+lYgqkX4nGuInjgb
	 zzwK4tWUjH10PWcOnR2Ipapgrj4ddICABXQfrOlsrHCiZaL8oUnre7uk/Cet32d4eDipb
	 gAlyuUsqSOFWwKyj86BcxMIVudAkFyA6Cv1hTl6D5hS4skTzdxbDOAiK2xkkxqLcQAcOm
	 236NjA96JePzVzdpQBRm1suHrWzp7krBzE18fb+6NZtV7HYeCC9mIyX9Ep4cByJFCXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788552697;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=XgTnZ6OTmLngtLga7lh+4Uy1m7+qtIpllYAcD2zjkr8=;
	b=YhJmq/hAM7nWLmnnGBeyeyc8I6+qFVHsszqwMULmOcNUDUBicQkScrRRXn5wZOaD4FwZ
	 0qKGbdPnOg3YWO31nEZGiwshjkcfrzBoxNEGOPVO7b9sHdZZ6UWMrqSNOovDe9aTBWT6u
	 QdHQf/7TEmiDow7woJpyTlQYqQ0XF8U7ZCiWdw4x1U9ZGOAvmpCuX1xhtVD20aJSt3ipO
	 EfZ/ZfUaG5aDmE0QC1YQ9KrK1t3EB2D6lp2DZ1Yhb/FL2q8EXJbbPSGVNx5yUm3IbMb9q
	 rr0FhSkO7NMpN5hhm12iLp/QOBWqUz2kDivcK4uSp5t3Gup1nohGUd7GmaL7ya9E/Kw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788552697;
	bh=XgTnZ6OTmLngtLga7lh+4Uy1m7+qtIpllYAcD2zjkr8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ftXKJ+xJyYQnMaOpwtWZWMsGDN34t43vEHBk2yZw1J/ytkkGXqhtMj/xBej/i+wjc
	 Q9lyksoeZD9N+AphAEs+Ct5DiYyYLMnSB6ztIljO9w0UUjAKOiBOF2EOhwgHW2ZBTv
	 kYTZqbPCPt9h3Ykbuc1QDk1aCEJM+0WqyvBIXUbMroZYldknLQJGB/k+Ni14PPXQ34
	 SR5drwI4TPS4neE9UmQEq4gCNKp4SQKLArkU9tKL5yIk6EhY43QhuH4YMjOczl5n0v
	 IioHnd8yvVkdjmFir03Lpj4xoM/CXX7NByGigDrZjxo5qba7inJ47dISb1UfCPh1qr
	 8E26nVpC2NKLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC498810F5;
	Fri,  4 Sep 2026 20:11:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31D76463
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F41D810F5
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQpDoswE5OlP for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 20:11:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8F005810E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788552694;
 b=V5vfiteJETZvk422E4kEwBg6Rhb83cGYvCAhyietKTabmhdA5lYS7NuiLXjoKaqw9+oc
 WXhBGlL+VgbpNFpVQLREmXFV9qTckffmcf4rs2K00a6TDlFCbdtfPde+FzCJqPXr3wa0G
 PAYXKaAlClmEVhHosasMKj9kH9St+zlSScL3nLZOYlMJ+I6gdDDH4TkG71RqAjXYmxKcq
 aGGpsHbCwS6APrtCFPQrQGAoFT8nBg+M09a8PfYYTg7iCF+j0EA7EXKPZRYN8LZSEF/lZ
 SVnH1mhoy6Qm4jubHw+uqrxU3BUhDnYcFhYbvOZr+5Zwj4eBzvI2Yn/yQbyMLst/R0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788552694;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=GVZ9fC5biF1UVr9zOvEexQ2TBRKxoZJLTg9xe1VKI04=;
 b=YMNtyxDlkn4O0CQB2j+9hgOXYkjwFZMFyrOPHmcLiMt/0TXtnJDpaqeOD7V8jOqrVLjY
 wBiD+rr/lNbuDVkSwV4eRn68JNJobQJPJmtV2uQWJ71iVosqLklRKEcbaPu8moFsnGSlV
 bLXFcPSaocj5pvp8cElnD3P0ua1hHxpY7yps2zai4MLLSYn85oXj18ZIA5vWOcjkyxcYd
 0yljlh/sk+u6eKV8BC6wNHzVB/U3vMgqI7HgEFfzw8rroooassEWQCZ1ZShnQ3fLdCNVk
 +laBZBqD0NUjf4U+gktGdN9MmwL/d9tjH303cWmG035dA34OH6rDl1HgTZGTb3LWIrw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=cqxW3sct; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F005810E0
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:11:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mn2WF-1wcYlQ0wJb-00d7sk; Fri, 04
 Sep 2026 22:11:31 +0200
Message-ID: <dc00eeb8-cda9-456e-b191-c40f1f0a58e0@gmx.de>
Date: Fri, 4 Sep 2026 22:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Martin Bachmann <martin.bachmann@designwerk.com>,
 buildroot <buildroot@buildroot.org>
References: <ZR0P278MB0869F0D024FFA7A2E1BCA07E8B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ZR0P278MB0869F0D024FFA7A2E1BCA07E8B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
X-Provags-ID: V03:K1:YCI0vS2ChmKZyugvHoRiRwPhMApx8ATiwQL41qowOyJOpL09C/4
 eX9c907kTjuoYeCkZSjXh/PzieSSsmg4vpSeR3VdDTfgdz4g/eHMK0UoS6WpwU49U0MIeAj
 aVJicZEFs2G8lzAs6p6PPA7f5qnUclFQjqqrLAJ/mhc9Zc9nA3Losby+hrxaJNA3z7iKWW4
 uh82mlV4GYppdX3otat6Q==
UI-OutboundReport: notjunk:1;M01:P0:gmE3zGtWsjo=;MlVxjoaOPEjwHwrHlypAdcf53zr
 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
 UA8RxouxsZzmQmXt7jzMnsM49A==
Subject: Re: [Buildroot] [PATCH 2/3] package/ncurses: Fixing license
 information
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Martin,

thanks for the patch!

Am 06.03.26 um 15:10 schrieb Martin Bachmann:
> MIT with advertising clause is the same as X11
> The license text is the same as mentioned on https://spdx.org/licenses/X11.html

They are only *almost* identical, looks to me like 
X11-distribute-modifications-variant [1] is the correct identifier. I've 
marked the patch as "changes requested".

Best regards,
Fiona

[1] https://spdx.org/licenses/X11-distribute-modifications-variant.html

> Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
> ---
>   package/ncurses/ncurses.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 5e2077500a..584014c70d 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -12,7 +12,7 @@ NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
>   NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
>   NCURSES_INSTALL_STAGING = YES
>   NCURSES_DEPENDENCIES = host-ncurses
> -NCURSES_LICENSE = MIT with advertising clause
> +NCURSES_LICENSE = X11
>   NCURSES_LICENSE_FILES = COPYING
>   NCURSES_CPE_ID_VENDOR = gnu
>   NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),.$(NCURSES_SNAPSHOT_DATE))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
