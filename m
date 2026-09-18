Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F404C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 12:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D4D81291;
	Fri, 18 Sep 2026 12:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f12_vLJBdpPQ; Fri, 18 Sep 2026 12:29:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8C93181285
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789734572;
	b=IQYJFcTT6cnabHE9FRO6cyl2PgOGw7hRW+J/ozVJhIrWctgeHrYmHWrqFRh4AuoD9ejS
	 Y4vgsR6v7lyvoRCXFxTG2waBfAU3EKI0u/d0kvxHXcEsmiRG8KPbQQVw5eRACuEaCPhIv
	 uggmMY1ZbB+fC7nQzlEHXeJrSJjT90iV7KK29TWtKc2qVxYcixJ9DrcO6H3HbBr5NXlyh
	 4kBu1qRn9Yh21QSzPnmuKmyD7kQjRU2JdSMc8KoU2bsDegPyWANXigOrrbyl6024CGgam
	 yJ/7Ar3JQJ88SnKMReutcI+QIfIplqC2a80b3JyL6Qke4vxxMd+nlrZPKqGhAhHA/ug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789734572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hMgPitiyCfTuLoEvCi7aNWZQiy0OHcaGRy8Xzu3+q34=;
	b=ccrrLt+XZ9eM6qsS1qgsjI1YBDu13xyGG91nBa9xT+ff51Aa2l3rXKnKwAjH0D1+kxVE
	 /aErgZ5zrusXtF2yzvZiNsN/DgJZHaMUPdh6i2HN8aPjlZM/H5jqjXSmkU9GcM38C7kJc
	 WZamE1ZRZS4qmLctzDpBIYwEwqnKKDGE2fe1Tx5PcfuVGsxpm/bLISkZZ4NjhnICKIyUm
	 qZIGQOZIg8ob9Mb28eDrFkInz+D62dh8zq28zaWXsMYPz0Qqg5T/1UcjyqNfScUbdJzcn
	 9AgS8+2Gxds1gujHD+4bWbeiAGWsb9P/s9nPHNByYWDkEAJvszmm3KZaz2dS8HcMnig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789734572;
	bh=hMgPitiyCfTuLoEvCi7aNWZQiy0OHcaGRy8Xzu3+q34=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MNvjwoVFkpfB/vvLkQ2Sv/qPLW4Y5Jy3Zpf/2iK5sbGvbwpF1Jzbg8+sqQVsJECIx
	 o1yaL4q1Wq7R6fOzJg6+RfrfnuyIj0jYmsjvMfeZm2y2vYRjtBGEI4EjSozaBg2LSO
	 vhi+Esl99SwcgR+XUePBJCpjYwU/pAXpv2F0HKG+MJFpUHfbF13ei9Q+BkPbfH37ZP
	 p8kSDo4BU+MlYYQx8jr+/4NKZcchq45di4q/I187CG0xOdletc3lCDT7octxPzrH7U
	 /LwetSMmvTEQuDZBUyU00r/emN8Fl2UuqMuQ4Ch5JZNdI4++tCzz598uJYq0KSz5bA
	 hikxjcgjXRtXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C93181285;
	Fri, 18 Sep 2026 12:29:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEF76279
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B03C640B6F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27ln0QZ65XUT for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 12:29:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3E44440B6C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789734569;
 b=GKNiXoZT7W6C8o/ZsorMYf5fSXSU24gWkb0t72kuHBoPkNxZ6ZFQCnMGd5VMTRkN9czE
 xFt+5r1OmZ35QP2kVH5t9Qu/H01r0vlG9Y6zuzhzHIxZFYy6CnjhyJHuX+Q21UTeJpF7C
 oliZdBRgGvhTH9WU9XTK0WrSNzv0HeGUxLyoSAaDEkzGYpTj6QSI3u30XJScT1dO3Yk24
 P0dhMK3Jz03l131sz5aqPZh4/Zva5C6DHKfO8XT3jvUAYeNlxQ2Zhet9I2MxMzI9Hw2Rc
 Mrk12v0xVc82Icw16n+haI9SXl/HRzSe5g/h4D4lwGraeDAgGJOSKAUuOHUuHTgB7aQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789734569;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=bLwZjXwE0D0nJ6IXQW44Hm+4iatRKdWMUTWfj7HG3cc=;
 b=M84SmU7qvj5vmhjrf6K7FLU8n7L79etFXFNCM8gmCPpW2mRg5h4r8OBcU9OpTqOrAfNJ
 fG1mLrLe5jX+oTBnRT4qqS/5ZmWh5RwTiSVw0GM97+n8H6yNjAiAyjyqB/gA9C0lnVL4w
 dHUjRvjL1DLrAneONctuaR6+zcwDHwKAG5cjQ09zwjRE+x/RxWx85UDEm1OJX3OoWsudr
 /I75klz6AiOaYsxkhq4UHxYV0V5y82qU6KXFdO/1LYjCt5eN9EGiHbh5aPDEZpGh7YTEk
 BpmeHkwBVcRl7lqlDwb7wv+BdlRHjAZkrWUS9HlIWaWO19IuGT9g2l6TQVkLRAMLPHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dXA4F6pJ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E44440B6C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:29:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C96721A0969;
 Fri, 18 Sep 2026 12:29:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9552060649;
 Fri, 18 Sep 2026 12:29:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B593C1032823C; 
 Fri, 18 Sep 2026 14:29:19 +0200 (CEST)
Date: Fri, 18 Sep 2026 14:29:18 +0200
To: Jean-Paul Etienne <fractalclone@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq0uT-ghEihRclnw@windsurf>
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
 <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com>
 <aqznoUtW4EIcK_8m@windsurf>
 <CAN7e4jochVOH9Tj19YiFeeOxix=-bn4OhferJC9Mgg=j-AVsDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAN7e4jochVOH9Tj19YiFeeOxix=-bn4OhferJC9Mgg=j-AVsDA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/brcmfmac_sdio-firmware: new
 package
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your feedback.

On Fri, Sep 18, 2026 at 01:08:35PM +0200, Jean-Paul Etienne wrote:
> Hi=A0Thomas,
> Before adding this package, I've checked=A0linux-firmware and saw that it=
 does
> not support=A0brcmfmac43456-sdio.bin firmware
> required for the AP6256 chip.
> However, while looking in the=A0brcmfmac_sdio-firmware-rpi package on bui=
ldroot I
> see it supports the firmware:
> =

> ddf83f2100885b166be52d21c8966db164fdd4e1d816aca2acc67ee9cc28d726
> =A0brcmfmac43456-sdio.bin
> 44e0bb322dc1f39a4b0a89f30ffdd28bc93f7d7aaf534d06d229fe56f6198194
> =A0brcmfmac43456-sdio.txt
> 2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1dd00c6bfac5dd6ba25e8a
> =A0brcmfmac43456-sdio.clm_blob (default_config)
> =

> But brcmfmac_sdio-firmware package has specific firmware and config for t=
he
> rockpi4b board as follows:
> 78085a816d23d9877e3ab872d8eb142646bfde18afd2c7a5b89885327a287d19
> =A0brcmfmac43456-sdio.radxa,rockpi4b.bin
> 343d1c79cfe0e10e1777e3de19a0302f748f69fa8356cab2c36ca0cf90bbcf0e
> =A0brcmfmac43456-sdio.radxa,rockpi4b.txt
> =

> And they are not just symlinks to the default=A0brcmfmac43456-sdio.bin
> or=A0brcmfmac43456-sdio.txt
> So I thought this package could be useful to the community especially sin=
ce it
> supports a lot of boards.
> =

> I'll update the patch.

In what direction will you update the patch? I guess the main issue is
that your package was named just brcmfmac_sdio-firmware, while in fact
it is specific to the rockpi4b board.

But instead of doing this, why don't you send a patch to
linux-firmware to add what's missing?

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
