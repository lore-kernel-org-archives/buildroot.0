Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4D1CA6002
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC53B406A3;
	Wed,  7 Oct 2026 08:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecWV-u1ICUGy; Wed,  7 Oct 2026 08:09:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4A121406EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791360561;
	b=DsbE5VdI+hDKjC1R9/yds+vG3gfR9BabXUFCG8y9x51NQfw/bwgbYagOhXDutN2WqgVM
	 QHdOERxwhy808n5k1s6XmrngP5Z3RSzd1O8t1N3vcTQW+6puUoZzXyrGI/IJSJk7q4ARa
	 KBEPJHZ1XCbJXgW9FcZtq8Fe22jMnYuyXNCgFcN6HncWY7ZoHXPVQj5iDR3XX+CLLoL4s
	 uXYsiSPr0iNgFFP3tt7QgYLLWVWmGUN8poQgI3rJqPGDnZlClI+3j207kjI2BXLE5CQYO
	 W2YU261P4ibL2Y2UwIVXZznp2mdytuF+qEDiXpiV2W++fkpvP64XXbRLnpgYKXu40Qw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791360561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KMHXzaROxzXjckOkLnqOPMTZjlAgUSW2kaVaOq6MpnA=;
	b=hXOAQ1LYY7I7EbumhMAN7DyhFbgSIJd6YPvA462Iff8414pabkGxC0qHVob8nORY2rLx
	 GIOgNqihj+rTZWShr/U6JFp0y+FhqWm0cXIZ+c1Mwsn0zJLAAPJlVFObggna8yoofxqUY
	 KJd9ohcWNp2JH33476h82cglJ40IfZaCfFDb61eQWn+5V4si3J23YsIbWPFWp8g4rPVp7
	 PsGvFD+RcEKDKwQIxjqvsjJO1hjyKUcIY+gNjedcMYMNJwlHAYuhnnGvfSJ8yIAQCJubS
	 00d02sm3+2L6vzBpIXDvSVzFKTLjm4CIEf1sowJLvGHCinaGKvfaYemzpE+Qg+xO5BQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791360561;
	bh=KMHXzaROxzXjckOkLnqOPMTZjlAgUSW2kaVaOq6MpnA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iyecR7fVOM9I3KHyXgJrrBAK+yCOKIyrYLt+JDqwHv5lyRj8KOtnp/FUyaJsYX2IS
	 mBuBX7BB6ULFAbtZqkBCgbqe3kv2TyFYrqp8AzjHCSRna9e/Vqg0JoWc0S68IIHlwF
	 nqo8ym5geamAi1ssgmkytUjWSKQxHpgci/NR8Lelmzj3eMNZibo8NUqakCAxDoG4VL
	 ASdSJU63XNVtxf8TIToZfL+p1IIrgZQY1FAA4Vk4jQqo3/cdBIFYiosm58g+227RJF
	 7hgSjisD/zsrX+LdbOX1qRSMMcrUJjsS5nLCGSJC54/zrQ2YPllxUi9xA+cHPxD58z
	 pCqfMTBIgQTNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A121406EE;
	Wed,  7 Oct 2026 08:09:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1769C317
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECE504032B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id topNs7P7zRxM for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 08:03:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 63B8640318
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791360198;
 b=b3SWxmYHvlZUsXmg0u2CvPZulDdZEyPwWR5K+SiU9+9HSWzRgvcU1GFoL04KlSdFACCl
 gIQwcDYU/g37gatQL1Xx5IC756kDtU6Lau2tjCIAbJjd2sI8mbCJbOmiLhdeG40zgnyRh
 wOE0DyAbSO1gA7x6WA4i3FmMp1PluR8LYg1DPlMmOTXVCXwOs0cos5sYEJLy+UlpN57ul
 iVP2ufHoUvHhqpeILHAYMroQYADYGbT8Yd8bcBJ0cnBLY2c/8adSyof1UjIUVYgDpmYFB
 Bct8DxYXiYvB68lnzfhvaMOmzIsFOXAq97l3GYswrOrmKSpRb7b0c2N1LiFUMJjPjIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791360198;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Wzo+5lu1Wj25FPVSocKoncpBGLiYmnl4ha97HFlhoNE=;
 b=MmtLhMFCrxOBtb9X7TsHEQnHWTbMvTGtGJlfnEZnq9NL4uJhKZzpfQuvXwvU7rKBzJ7L
 0Yw+H1JLC+srYsPIn/Y6BHlf1qT39WnFucEEDJScUARwTyekccMiIk/pUY6HJ6gxXcqkM
 DtlPOX62IgxvqBV6NR7X08MLXvKGte+dv2JzW3Ivhgh2O4NoTWN4rTgnuzHv2HVlhtF5U
 7sgNcyQKtqf6xK67Rx3dUkRhIPSqAmrIz5LivFHc21x+Xx0DqjGUB+xkDz99qoHl0BExg
 3I8zEwFXpumJnwWesGA19htJHs30N5U0q6Y5FY2ifSq8FuAwIaQdsMgAmTHjmlLi2Tw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=brnIkkjt; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63B8640318
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:03:17 +0000 (UTC)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CD1E44E4119A
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:57:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6CB0D6074B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A5E55103308A7; 
 Wed,  7 Oct 2026 09:57:22 +0200 (CEST)
Date: Wed, 7 Oct 2026 09:57:21 +0200
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <asX7W8r75WzGv8jv@windsurf>
References: <20261004213116.39415-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004213116.39415-1-maxime.chevallier@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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

On Sun, Oct 04, 2026 at 11:31:15PM +0200, Maxime Chevallier via buildroot wrote:
> Since v6.7 [1], the KHDR_DIR variable isn't used anymore by the kernel
> selftest Makefiles to locate the kernel headers. Instead, KHDR_INCLUDES
> is used to specify their location. It was only available between v6.5
> and v6.7.
> 
> Keep KHDR_DIR for compatibility with v6.5 to v6.7 kernels, while
> KHDR_INCLUDES is used by both pre 6.5 and post 6.7 kernels.
> 
> Let's pass it with the "-isystem" flag, as is done in the default values
> used in the selftest makefiles.
> 
> [1]: 43e8832fed08 ("Revert "selftests: error out if kernel header files are not yet built"")
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
