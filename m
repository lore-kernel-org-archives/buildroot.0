Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BD2CCF2C9
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 19:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F243B4091D;
	Sat, 17 Oct 2026 19:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMIwc-j0VkeO; Sat, 17 Oct 2026 19:44:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A7BE40910
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792266296;
	b=Qe5mJudLdh7kT0l43B2KqswGZP4NhCkj0DHQBKZpakLGumGV5Pavvc27oa8Z+gGoufjE
	 2Hdnwsme6K+0ol7gYDvLhbRtea4HGTxhcLms9XcIGz7NYkAhSPSRIJeeFC+XK0rhRGJ7z
	 JQEvuVy96RRvWuLK3kqg5fRAZO3bVgdRMl41DFiit637WIRGFhTjx4WnbkN70OH+w9M+6
	 17mgpvrh/EBS6FDRd88tANeK08Hq/wls6ZfIAok0Fm6fD2NRWfVRzAh+BE772YBW/B2bJ
	 Q+OWw0pgIb8K54eyDfRYnREU5moXpYn/Gret1eGSI/KGAQzKFgbk7kY8iA9czXylRWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792266296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hflOhgV4nqSrTan+fsdDEd2vBgg/EGTWCE4V259HjRU=;
	b=Kzf4Qqxn45wtlr5QW7b8zuM1OhI9b5Fn2u5ZcUL/+snRYitB64Gy7r81RQb3/3nAqxtj
	 OKE4TmBWq3k0PR7wVP6Xogm/1dgZlPP4wiXa4K7Qr1KSHVa2sohCi96nU1CAQ9AW6Bg+J
	 Luruv4/bTkzZ3+jBUdvq5VN5zfEoA/E4qTlgWrf83iNkoIrIsMS2VZsdFTBs9HYUMVOaU
	 hq8w9b1M5m21xJGnmMO+ofP137FwHO8Qme4Iw2Yi/NbBdfn1rlFGNdrWh7Q1r8XFE5UKf
	 zofEGoJQO8bsFPEA9GzgXNl/WMY6D+1PNMb67ebsa/6MkTwfoXB16bf6O2x9baP5r+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792266296;
	bh=hflOhgV4nqSrTan+fsdDEd2vBgg/EGTWCE4V259HjRU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Evo5It2GiBVrhAVxtvAXsvQmccZOZAY575V4bSv139D2hE4Eecfh4/mFpFWRttw3U
	 d7nS7x0P9HWWJUVPDQhnTyqr4eYk3u8mQurUkwyOsbDFDVuKnDK5OGmfODAHALVMlM
	 OZE6TFFhw3vvXVQDJRM3e4fC40RLUFF+kuqBZlhC6dbRr98mIUCwB/dqx5NlRTea5a
	 w8O0+mqmkjwiuT1Aimp77kYIX+cqx9M5Tai0N7SMMpvuEAVaVMxuEwH7RwuvJACS9O
	 f/YuwfVBty4EcdVHgXQGfTC8GUrOb3Q+NFnPNA5pe6oNBtBQZguD++aBeD1eLRgqGY
	 HxuZnWNcaKgLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A7BE40910;
	Sat, 17 Oct 2026 19:44:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 436C41AB
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35722811E0
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bts9H1IotlD for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 19:44:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8574A811DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792266293;
 b=V1d/o9sCc2nNMPriwGDkiw4jjztMuh+4dlnIK2voRB3LAKvxNtoEO6DOym7cFHRH1tWF
 mWQ1oWMCC367ttETZgp/TT87r6Hc+4/T/kb2gdnFEa/K/MUTGUt8N2i/N5+fcLCQX38ko
 f4t9Oe1jeInAJLUISkyyLpCH+HaXBnXYJwQXZdh46OQJj7UresjOFBkPiQWwD0yn8ZLPl
 Y/XRJPa6SwfNvEYSmTE2fvGuLdPDHaTqg4kgc3dZUNClHz7vKw1kBKSx568mPQkMX5A44
 3YgBFpfs8hA7MwGrVQRcmOSs5fuhSePcCrpB7okKbydr2MBfM/RFZSLe/gFjfFXPQ1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792266293;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=yRZf4OgaMBDBSWQEKqHzzWvk30Omuicnk9QofbG6CPk=;
 b=GkKDeB44G1CYWBAO000jTtFRnEA6Hw/pDPkdJ/Y6GIw8WoLOnwx3t7H3mylo03WRSdhy
 frdCSgWtVDaolBCC7cw+MCkF6seumhDbXmWfLouTjEPlT+IUaI1kPeUBmra0jxfpsObUX
 xmQcx3ZqFkr0h0nOHvorzmWMCIb4anUKZQjvtEQWq0bmPmIn7INZ6haAkPJ3FOEbZ/yO3
 ULt+KXzCTho9renf2uvnVo7KBPN+2xYTupp4Ps9DvIdW91/KThTjU+D7hwUAru+d3lTyB
 p0seiKVrO/IUH4cb3RVYAx3QExhGkMiKCEvRS26Z5Mm0D8Egx6E9UdtzaAGLv/+c3Xg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=I0KqGyvw; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8574A811DD
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzyJ-1wlK1A33Et-00muCo; Sat, 17
 Oct 2026 21:44:47 +0200
Message-ID: <eedfd352-2cfc-49b2-a890-e10a9a0cb3d7@gmx.de>
Date: Sat, 17 Oct 2026 21:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20261017131247.1572149-1-peter@korsgaard.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261017131247.1572149-1-peter@korsgaard.com>
X-Provags-ID: V03:K1:Xg9qhWIHiei6ANlKEDpGeJQMnDBzCJYOAl/FLfTr8wx2qYp58sp
 WAfQtOtv0MsgCIh1K7b3Sm/ipHwCslTGZuBqqvG5RUD8ztMnWV8v0pDd4ZdfxbHpq2f4Wwp
 fjU9XR/+Q9BWguIRPLW6sVlNX0pBzpEEq4MHPa51NfvT5evIjd0SpHJdCVENflROxN2vZsD
 84wnTPsAFgZ2znwHOh3gQ==
UI-OutboundReport: notjunk:1;M01:P0:ocO0/JIOXQM=;gZQUm3hj78MpRbMCRP9O2uYTkhL
 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
 0jOcZqfVDWwDjvYCBxKs=
Subject: Re: [Buildroot] [PATCH 1/4] configs/lafrite_defconfig: switch to
 Bootlin glibc toolchain
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

Am 17.10.26 um 15:12 schrieb Peter Korsgaard:
> As recommended since:
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thank you!

> ---
>   configs/lafrite_defconfig | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
> index 5f70706fa0..2454d2b7ff 100644
> --- a/configs/lafrite_defconfig
> +++ b/configs/lafrite_defconfig
> @@ -1,5 +1,7 @@
>   BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>   BR2_GLOBAL_PATCH_DIR="board/librecomputer/lafrite/patches"
>   BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
