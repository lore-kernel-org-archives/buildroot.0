Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828DECC6B30
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 03:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56310608BA;
	Thu, 15 Oct 2026 03:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kU73HSKkr4n8; Thu, 15 Oct 2026 03:02:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 80378607E2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792033364;
	b=sERTcahUNTJjA7cZhaqycMhVsqNTCZ8tA/cuaTHuk0e56ahfBzem/IgmZCP71jclRHe5
	 8Zx/ZRcSz85MoPuONr4FtssujBt1XbglR46TtYgBxFtbQj3xckrA6XGwKSGmFasujCwy2
	 SdeDIzEziKP8N+dIA0oxwzLj1k6D4HWgwz9QDbKdTopN6EukcCpUftG+VZ+KKqd44uIIQ
	 nvG0tqMpTEeJyqkRFFt1v8YKeMEQUd+ggiSjH7cMx4kmjDt8DYjApETjmGPk8SUntlTeS
	 OS3m6t7XTMSVDGbwM8+t91UdhUGqYuf3/Ki4np6IOU0lACoILx3bPWiDvpl6fPY6aDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792033364;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=/zz678+09Be6xwt7+hFknu0t0asPoZATHW2lZ8yOGck=;
	b=GlmLz5asR1ax2Myqi1Kwn6xG1Bf0h3f12ort+RyWki2mCR03fO6o00qDhKZULrCF5P1r
	 k15WYGUkoIHyZlbbgHkFDgV9IqIFRSdHNRo60p+XUUVUu16KBAwXCk5aQrp3ATiJauv6D
	 3qrQGQmY7d262QYGOfqkQP755FhDRlkqeNUSea9ToAZdnlAzfLfCCDQm9JRyYdboy3EIz
	 JXEsgQzWcjeVd3Jk6jIcUTQPECv92wVm5Zqsxib3V1HWmod5s+G2ACaNzw+yiwPe+Zl/3
	 4QJAfaBfijI6bOVfXAby2d/HKJhpeQtsGOsjsEPxgICY7ssu4IfHCvlD7SCWbjZ2z3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792033364;
	bh=/zz678+09Be6xwt7+hFknu0t0asPoZATHW2lZ8yOGck=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xt2eY802/wfmO+SyW/GiLOorULD3doSMZd29jC9Q1jW1M0sa7nXmfm7qcaSw4rYfx
	 rg9sgbmaUGA8JI/6FK2Sbxld+O4Aqj26nWzSIIsO1bf2X9ByrVNOUQ8YHiMfZl8dVy
	 xo9WqDP2cNCjatfPwUzurRlZbafLgkC9qNZwHwAkKJ1ai0fOuylZ6MbGItS6f7dbJ1
	 E59z53Q6ZumdkQR/qdZIzQOWASdAX5cy+ld8JRgEvvt3LFhCOlmoY3JHo0NOFHfm+b
	 YlmONo8wGqmUv2SCJbFqx7DQSlLg9y9exk6PttXZJLezTK9RycrTv7narSHy67rupu
	 KbXf04E0WONCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80378607E2;
	Thu, 15 Oct 2026 03:02:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 3A6C3E4D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 0694240223
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id toqPf2FhJRUA for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 03:02:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 494D640053
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792033361;
 b=o+pjfF0/AxSBmyG5JbU1vaP66u4apLdr/l1d0pQMwxQJVYI00seQqYgTF//vj2yRNfMO
 v5RT5By7X8s2vNVikTdDtA6hWteQI1WmTv3M+5OtLU2DrYDimWHTkeoOz5+Wgz0XcPknD
 7H+fI3Tk2GxLsLHVKybhhRmzfQ8dyy2/VIIBIEbT3PbmgDy9TUCSAZc1eB/68alKO7Iv3
 GVt2eDyBK/RfM4f1byROjVgzO2zLOjsDIOA4t4sBCTsjNwyitwDzni0ggg6ErGZiM4eqq
 h8UYqjfKA754QUS/cgaRRtx+WHathj5ZAdcBe8lUxVQ27bepQC4h1ue6ae8+Ef9SLmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792033361;
 h=Received-SPF:Received:Received:DKIM-Signature:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=+bcltG09jSpk/tjN8mToyPE6Hi/EIq1A5ekotdnEUJk=;
 b=WBlY1eAn5GfSzMqQ3V0Ed5OmAWX6qEbqrGbFbgwlscDtbt8aXBBbg/9KbachQG9p7/bi
 YiGc6mp+/RNY+Qu8t3n5c89vvgJRJsjgm1+GOhl82p4beBmQH/ZXWSCz27mXpKf1nYYYI
 l7buJ6E3U08r/mWPOObtM7uvd4lB/L/1RzDRSuhGksjgK+SD2xivSGxqYeYfiAKEhVpcn
 ppq4KPlqO+iWiZSh2m9saZv6Zw5iPUGHUTVHSRNzIfQbk3Pr/yUYqwLc6Vl/mivAkTFKX
 GplYNN74220IzCGcZJvRdZYNvmZaW/MaU4ImBFZAdbeRdB4MrCLqogrjks2ket4wUgA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=C1N2uz3W; 
 arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 494D640053
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:02:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 144A2436BA;
 Thu, 15 Oct 2026 03:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 694471F000C4;
 Thu, 15 Oct 2026 03:02:39 +0000 (UTC)
Date: Thu, 15 Oct 2026 06:02:36 +0300
To: Fiona Klute <fiona.klute@gmx.de>
Cc: stefanb@linux.ibm.com, buildroot@buildroot.org
Message-ID: <atBCTG3NFPdhhIDr@kernel.org>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
 <as_oRSUUVH8SQG-m@kernel.org>
 <b6a925a4-9eae-4193-b3aa-06f9755aeb89@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6a925a4-9eae-4193-b3aa-06f9755aeb89@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/3] package/libtpms: fix typo in
 HOST_LIBTPMS_CONF_OPTS
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 14, 2026 at 10:52:53PM +0200, Fiona Klute wrote:
> Am 14.10.26 um 22:38 schrieb Jarkko Sakkinen:
> > On Wed, Oct 14, 2026 at 06:46:23PM +0200, Fiona Klute wrote:
> > > From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> > > 
> > > --with-... arguments need two dashes.
> > > 
> > > Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448
> > > 
> > 
> > By defacto there's no new line here, and it's 12 most significant
> > bytes of the hash and short summary in parentheses. This is at
> > least how it has always been in Linux but not 100% sure about
> > Buildroot. It just looks weird to me.
> > 
> > E.g., I would instead:
> > 
> > Fixes: b2eec8c6265a ("package/libtpms: add host package")
> > 
> > And wold not add the newline. Since this is not kernel, take
> > with a grain of salt.
> 
> In Buildroot we don't have a defined style for this, but use a newline more
> often then not. Personally I find shortened commit IDs irritating, anyway.

Not recall challenging any particular convention. Listing what you know
and what you don't know and underlining that your facts could be wrong
does not go into that basket.

I.e. if you like how you do it, I'm not standing in the way, or have
not been.

> 
> > > Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> > > ---
> > >   package/libtpms/libtpms.mk | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> > > index 7bc69a50d6..0ece84ae04 100644
> > > --- a/package/libtpms/libtpms.mk
> > > +++ b/package/libtpms/libtpms.mk
> > > @@ -13,6 +13,6 @@ LIBTPMS_INSTALL_STAGING = YES
> > >   # Required because a plain Git clone is used:
> > >   HOST_LIBTPMS_AUTORECONF = YES
> > >   HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
> > > -HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
> > > +HOST_LIBTPMS_CONF_OPTS = --with-openssl --with-tpm2
> > >   $(eval $(host-autotools-package))
> > > -- 
> > > 2.55.0
> > > 
> > 
> > I'm not saying this is not right but I'm neither sure whether this
> > is bug fix or not.
> > 
> > This is a weird because I've used this almost on a daily basis for
> > Linux kernel QA since I contributed this... Stefan can you help out
> > resolving the mystery?
> I assume it wasn't noticeable because tpm2 support being enabled is the
> default anyway. But we like setting options explicitly in Buildroot. ;-)

It was unnoticeable because you did not write it to the commit message.

Honestly: I do not care what you think about Buildroot options because
I do not have an opinion. Please stop framing me. Thank you.

> 
> Best regards,
> Fiona

Br, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
