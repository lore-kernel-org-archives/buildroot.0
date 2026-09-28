Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A86CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3911D4040E;
	Mon, 28 Sep 2026 21:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDHjivZOaGYO; Mon, 28 Sep 2026 21:43:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5D09C403C8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631833;
	b=m+82iyiKPF33VniEyX025dvrDIEldAL2Tw/HGbx+tBQHkHdhce+EsJWHmTE5+xkEsKBA
	 90JLsocj6eedV9B5R1zyCnuEZmcAfmzK4oApltc0OAdj/xHNFVKDq0AdpmeSPIbYkyxHu
	 yIUKwAwpLQu461vxifV3sBFoWASsMuInSugyBRjvVsXL7s6sdf4sUwW0c9j8UTEwZo3oT
	 etVdfpXLSNG4fufxjsUSVqZyy4vyfPe7MoJHOqf2PcIesbOY9wF4OJrsavxihyvKledhB
	 +1WCasrluJLwBWllF9Udp1TrK0feQ37L7uezVjGeP+mSqs3aOw0bstgVBFfi6FQUaOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1fJpnNYbMUGa5qyfSy0X/ZKOXiIOcI8YS77Ep/qgKxc=;
	b=M7m60SWOnw4gK+z9gX1FrYXca7lk5sGShKhieuR+DVl3xd0oed4GzmAY5A8QqfCPZwFo
	 JKC0zF8RIM5uLe9dtSl6LcYlvwNVJL4bv4HcS0Z3dUp/fnFQF0Pmopd86hrtLnvOLSype
	 +Gk6rl3VLPGrayyUormk3ji9scB4A+dp8RmCSNnbiIUltrYqDpSSkDytYggFUnN4mRGR1
	 FN8GfFlLwCMNhwyhsAclTRkx2O6VqHCOBDtJcULb2FiYsXU6OBdG83+3xFfDd4LRjRv64
	 v6SJ/n2tKo2J0dMBPQ73ezuxFms9J3eJOty1I5dLfFPFWlScLm0eh0lU+iBStv2uc0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631833;
	bh=1fJpnNYbMUGa5qyfSy0X/ZKOXiIOcI8YS77Ep/qgKxc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mryYLkU4vPIFpyfMXiPaBzpX4/jefdyBI9fzw2wR0lc8ZKGb+0qh9gCxpUcumZJ2i
	 cVwmHjEldqlxT3AYV48dQ3SqcRZaTDqIxvLA5sNBgGXL0Iv06ZsF51lDZpHcxqlQfR
	 k/q4RTZIiZ7tDSwuc3JXhBmZmiha1nHghdiL2a3c88Aw9Lyrdm23uBFaJPDisgZ9pQ
	 YijShRnlrSixye3cVB4mTmUW4t4nC2TXKvfaGkQ+YWbuocUZ85AHq15bdEMEJXGfj0
	 qr3uY5sUQf4e7y8EctCsro/v5RBv1+5cSSHEF3arh2MuHlP2LbWudE6liAfcc1UYRq
	 x9efSfSTiQs8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D09C403C8;
	Mon, 28 Sep 2026 21:43:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA8A72
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A373403C8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erk_yloo9m5Q for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:43:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5B69D403C7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631831;
 b=h2j1OuEQyt5B3RM8VnQGZJZehP54K6gkYWS+EKqkYBTzmp9tIswfwQv235b1HKb9gdCm
 x5Ni4lP6Dh8c8AA8x6/TNMU02rsAeDlSiyYSVY1r1Bn5CZ0osoSSYs+RbWvFaJ5RQqVvD
 /R5hFXmG4BSRflniOP8UCL8s3zqbFvtkwGRmaKi7o1kn5BJDEmOGDdqrPJmbvnphdx4AF
 kQug+Yka4Kwhhw2XvidzVrfy/cKAEaWjpr76PWeI19XejN37ODmCmltIutGjq0npC3To/
 D+uq6P8UrjG47LN9vi63c7S+MIWX6XJuTVGY64wVCb0q37253PQc8VZDLVCt+Dkp35g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631831;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=OBBQn8OdHr11hnXmgmFVkWLi63TuUWLrrdYEJOiDpRU=;
 b=WJWgW+hw7U2gCSEs0srnEfwYKo5IE04vftOuPq5ggEU/xuBe2i4PIxQR3pdAU788Vp3O
 FhZTuYuyYOmK7juzhYv/DP3iXCgVXPZF78u7DuSga7Ee6BxZTnX2mJ9duRAIspQ6lGOx6
 QFgeosFSx2hlTkCkMFrjPfX8tNOhD/uv69b6L7VH5pWZojruazYENmjq7oqeazLyUzWsL
 jIzfGmzKPTtb3JFS62hlPZjHeO7wVDlzkNONZD9lq0muXZBSqvnTwf+owmaOtxHMorwxj
 dmhovbt6rq+vSomfluU6IlkCRdK1jH89Wv68qxJwr+rtX2eZuniaIVnU+W+aPjYYKwQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qA0jcEYF; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B69D403C7
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:43:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5F7251A103E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:43:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C3E9601BD;
 Mon, 28 Sep 2026 21:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 559EF10329728; 
 Mon, 28 Sep 2026 23:43:42 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:43:42 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <arrfiEqvL4D2gIR0@windsurf>
References: <20260925133536.2642828-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260925133536.2642828-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libabseil-cpp: fix build on x86
 32-bit with AES
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

On Fri, Sep 25, 2026 at 03:35:36PM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Since the bump to version 20260817.0, the AES-based hash for long
> strings is used whenever __SSE4_2__ and __AES__ are defined. It relies
> on _mm_cvtsi128_si64() and _mm_extract_epi64(), which are only
> available on x86_64, so the build fails on 32-bit x86 for CPUs that
> support SSE4.2 and AES:
> 
>   hash.cc:115:32: error: '_mm_cvtsi128_si64' was not declared in this scope
> 
> Add a patch from a pending upstream pull request restricting this code
> path to x86_64.
> 
> Fixes:
> https://autobuild.buildroot.org/results/48198506ef76c6ebad0a802cb1fdd5270494eae1
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

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
