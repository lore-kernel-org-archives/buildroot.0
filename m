Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487CCC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D334054F;
	Wed, 16 Sep 2026 21:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vw8mcVfib5uq; Wed, 16 Sep 2026 21:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 74C574062C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789592766;
	b=YCtJnCmtNRX+1/g9mVefvI/yF4srCWY8Dhrdet3C5dGIR19vnVTG+SYOvPAdJcq+V8Av
	 wEojfd1B3qeECCKpN6SInmyxgsNfMZBYzZ8m1rdnRvMoSXorFit53CXpayr/nSd8Baq6q
	 pz88mdQ8iCTjVKMxRnXbkM8vo1LlIhpAiDL9PmH/6sw1iQOdhnjsbTr9B5l40SxpRAiQz
	 0EFlSYHNbh4n01NF03RIa1ZXWr4iLICBIouIb95oyTwYCzFI9yS/uIRU3o09xK13kBOWU
	 r8mruaCE8q47dz0N4lKC59WMjWCeDWMTkQaj3nvJ/372iYPwV+rFlmhWpwF0DSpX29A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789592766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ewkGHG3gasDiWKMEWC7xW9PoEFPw8ReY+C52oZkTIPY=;
	b=hXWh5n/qgD99uDZ4Ekz6rQhhknWv941a+rhsiaJdCTB+WteUvEQfcFxi34u9Rwcc7kZ6
	 oB/EA/KBOAcy6+ejc+g4qnxQNOGLIXInkpWDPWXIIxF8oe+VAyhjEzjxwMAP7Cs+5gK6W
	 rJOcHXCi1iRle2xRTWcKGBhMYPeVxBLvBeN0TxEIPQhObBMjKp4pBQQcx5c9FnqdeNZiX
	 9AssmgfA2XL5tU9BlmMe7x5wWv4axxA8gBHpCJApSADtW/eH1211Ku/NIMsz38UXBHhjV
	 mq9pS45jhsrKBEu/JnzgJsvHnXZ0mxq2Pd0qcu9FDznFuYZO1+dBqM1nbaBnbndtTsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789592766;
	bh=ewkGHG3gasDiWKMEWC7xW9PoEFPw8ReY+C52oZkTIPY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=La/nYdRERu19mH0owXdoXTcEy5j8kqEUmXf8ye1E+H63jazQCs5NqYStb1cjOrL4G
	 vnRb7Aw7Nx5SzAkRA3DquWm2F2OYIHl2meBrzG8HeV0n1ZN7LxfIDbJuypK/2MPeuq
	 MHme6Vxm4OlGlYsF9Ef2l0LuNzRwM7fLz7glCkX9H0o9JIXtp0GXbYnbWryG/zcDMm
	 wph5emozX1D8qZAtGyW76tSX8joYpkRO2Y1G98r8p74hPruIziD+IwxmynpgchsE6Q
	 tcv6bDtTUBr3hKRDGInfWLcJPo1oNC/S0qR0BJLNBi9KALv++0WbsrYIRx6mFH8aey
	 oSum1O1I3Xdxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C574062C;
	Wed, 16 Sep 2026 21:06:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE09624D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D02AD4060A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmBz8YygJrNG for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:06:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 220114054F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789592764;
 b=oqG8lQ7yaRGp8PAL3e6jh4N8rtX9fh7JfSG//CR8xoQ8vTAZwcg2T/ti5lFtRQe8HwyO
 6YdstER/bXrVtLGS/jNh6erfUigkVx9kXHxV08enQ0ID16r/fX8bGas0DUq4+JbBfMQhv
 0PogkZkWO+aWXTaahg2xxZDciCF2tPtD2XP4RoGFlDLuWLRwPkzpxbUU/l9F/j+J2UBYn
 InRrUgscSRyHZHXufcNZllENKGQXwG8f+z72TT78oAwIWmf+D98sJbOycEi2eRqbouGJU
 c7szUjTQP1F2gxYK5kr+zR+xdXTTJPOtkw5FLUK57TY+ccKT55Slz+hdwqQo600OPEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789592764;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=yHiePp37btVX+6z4EMFzkq/Vp69pE7mXeUStGhxPT3U=;
 b=kVzTafmFSSUMDzOLklna2eWPJ7s09CyKwbjq5xk8ducVebIY/gVkxbEsquVJMwAe4VNu
 GmMEslWEyqJk2he1slOxZlYsxY7xVcdtGFyhXFRIMwXxQ7FV3BJ8UjLb5fw3yogJ7vo+3
 Y61jLeAwR8h1+liLl9/6jKBvYY8v01O98ky1T7x5+QxfXl5vhWUorrnjhbEESLiY58xRI
 stRTngvH/f03IbMia4jqcFEnFrzf/7K72/hDoQBrrPU+ylOfuhB2JTbfQE4WKRT3pQcuX
 H8/bXCcHobEe6QAFdOfFmpJAPQnPrJ/+KOQnKxeW9fMtwYn+rDAsKkSKhQQgyRjJwfg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=REttY6cm; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 220114054F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:06:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2B0BC1A08EE;
 Wed, 16 Sep 2026 21:06:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E550B60337;
 Wed, 16 Sep 2026 21:06:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EDDA611C79AB4; 
 Wed, 16 Sep 2026 23:05:59 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:05:59 +0200
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <aqsEbnaZphecvrlt@windsurf>
References: <CA+h8R2oed-F_NN0s0OA2yF1+YLZCsMp2+Vnb=TR+ANTZnHLeyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2oed-F_NN0s0OA2yF1+YLZCsMp2+Vnb=TR+ANTZnHLeyQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH v1 1/1] package/rtl8821cu: bump to
 version 2026-08-21
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Aug 29, 2026 at 04:26:45PM -0700, Christian Stewart via buildroot wrote:
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  .../0001-fix-build-with-linux-7.2.patch       |  91 ++++
>  ...02-fix-cfg80211-build-with-linux-7.2.patch | 452 ++++++++++++++++++
>  package/rtl8821cu/rtl8821cu.hash              |   2 +-
>  package/rtl8821cu/rtl8821cu.mk                |   2 +-
>  4 files changed, 545 insertions(+), 2 deletions(-)
>  create mode 100644 package/rtl8821cu/0001-fix-build-with-linux-7.2.patch
>  create mode 100644
> package/rtl8821cu/0002-fix-cfg80211-build-with-linux-7.2.patch

Thanks for your patch but it is line-wrapped. Could you resend with "git send-email".

Also, why is is tagged RFC?

> diff --git a/package/rtl8821cu/0001-fix-build-with-linux-7.2.patch
> b/package/rtl8821cu/0001-fix-build-with-linux-7.2.patch
> new file mode 100644
> index 0000000000..31a0c301c7
> --- /dev/null
> +++ b/package/rtl8821cu/0001-fix-build-with-linux-7.2.patch
> @@ -0,0 +1,91 @@
> +From: Christian Stewart <christian@aperture.us>
> +Date: Sat, 29 Aug 2026 00:00:00 -0700
> +Subject: [PATCH] Fix build with Linux 7.2
> +
> +Linux 7.2 hides the PPPoE flexible array members from kernel code. Derive
> +the tag and tag-data addresses from their enclosing structures instead.
> +
> +Upstream: N/A, based on fixes from the related 88x2bu driver

Why N/A? You cannot submit to https://github/morrownr/8821cu-20210916 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
