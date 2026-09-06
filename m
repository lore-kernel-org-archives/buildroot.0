Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A627DC79FA1
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87CAA60634;
	Sun,  6 Sep 2026 19:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcBfs7f0J2uA; Sun,  6 Sep 2026 19:33:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 058F0605EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788723203;
	b=oj6tdc523NZ5nygxrQ5lkd+2rLCuh8cCSKe6vtZLVp/yS3e85DP7eO9hGRIr2rtS4oYA
	 ny0EOjpg8il+a1tRSatcFkQqPM3hUVRm/TaAZbSj5xMAUrSg/7pT2j7xPzY1c4MRyKu78
	 JPyp3rvo1p+YD1xqbM5Jqomcd9aGibrIWWqSIkw+CsbOUoRf/epzuuE/NAB/gP5V0dgB6
	 xjY2aSoVQVwOL4Nq98ByqYTXQLiyoB8mCAA0qSBx1bGHZjmcOH+mYnyyWqmaIYJDGVIGa
	 qFM7qXTCRZiU4uS0VvsDv6sH7TPLY0sIEBDOJEB/rC91rU0NYhH09QtpqbbYgecrzWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788723203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=rzncg0ie/yAAyQQEV8zi/89T6Qg3JjYJluE/YFg+knU=;
	b=VYZt1a2wz6xmdxTFhaQd4uYh9UagANBLzgWJsQq6nmXOihkyV5kBgn43wIFuJLzxq1I2
	 UILfbU7tXtEo0xHYKlkKNwb1hXZ2yZ6hohRzzFxm92LmWtg6Sz3s1vJZrpzkbxmogJX7l
	 8fwfsICZW18ed/SHWi7sucMgwJq3LMh36jusEV9YD1VtlciQmqvd6XXXz4TMEDmG/GT30
	 sVOgolX6hbIAp6QlkRmzWLQ6NfzvM78O0/TDt07tDt6ElYfWaQ0DgW/dFcRcCbtuLd/MV
	 ERuytpIek+R6hKfadvoZSonL9aCvJpeLq6PQ1iNT00Hxm/zMhwZU4kKr7T2Mixe8yUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788723203;
	bh=rzncg0ie/yAAyQQEV8zi/89T6Qg3JjYJluE/YFg+knU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MYQjFllzxgidlIVj+UnlacG36tpYDJmVr6w5EnGVhJcHM8BnYilukEkZnYEsNyjy4
	 omR+sl4txnbiG4ttI067wOHZqOwJbs7y4xksSYHkGIi7ULS0VVI/KN1bh896X7xXSK
	 5G2Df/yymRU7Hry3vaxnejbwlb7jl1Yi/4RjTJgo2DtIVzzkpreHuLhJyR2qcZgODM
	 p8aRTZeNlhmz7kvHgwsNfdQZEYcCet3U09U3Vc4PsyKoAASH30oeszgPLymzFNHbqV
	 sP9+ZOZ38WNEQGSwun+Xaa7ysgH5pXIgot1YX2iAlc3vMXsij29ozvWkMDL/omkxWz
	 ER7CY6SA6nCdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 058F0605EA;
	Sun,  6 Sep 2026 19:33:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 554E7970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4702A80B5C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6TgDPg-Cw_W for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:33:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6CDDD80B11
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788723200;
 b=V/94aCZB6DQX9TgS+U5CbJCNFD2lrqXcrBwE0QDTOoXWw8V9bUCD48/8hlwI/TOoeJgG
 D0y/Fj+1hidJCAkJL6PGbvGAR6iIxNLsDb4TACgoxSA72FIByUshGQb54tNK82JuYrvmV
 CN7nGj2QRiOdnUvjZu6fWZQp8EX9IWgxj2KX3oxgFlF0lFZ6hx8VSL5CnjWxkd1KkVqLT
 K4F6bjaBRFs9EGkuCeQSBTP7gdF+pdtEpLZTzIj1IMuk7Bg6xe0s3r0gyFQMKdiAfgiYg
 6m/uxwzLNchw4khk4aZFQ2F/p8Nv29UM8o89zrAJhT8BHBuYM8DLDrN9IVZLKpu4jcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788723200;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=yLQEP5Dc6MDtSN7sBOaL3/DQWT0Nrl0PUdkTjV6DHAU=;
 b=dHj0OQsbbkBKRo4Npwg3rxEmLzlVDc1RzsPGB9Jw2mUkMxJ36J8Xl2IVo70M93KS3pld
 z53/vUkAbnUh0Lh6yyUyIbwtZHjnCFR86kIBeMtmgXwgJLkQECPxOya/ix/dzVrOmBsPu
 WUGxjCPJl8zJ2PDT3KA9sYZ4dB/6xIlqH+50FVF/r8TIAh9FqkwpjB8/3Y74sMHIQ7fNB
 XDg6h0ZX6MDz8dPdOycNei50FAt5ZCRf0F4QttTB/hL2LFqNOfDr89WQpZ/6StvggG4P0
 IOEudxEHYi8YqogMO3Wr+9YTl402rh9p8WeDYQMhS/HhgOg8SAZA4eMBTsbRlc+47iQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=XFYGZJ+I; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CDDD80B11
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:33:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1whlHi0CuI-0173XX; Sun, 06
 Sep 2026 21:33:16 +0200
Message-ID: <5c6b590a-15f1-4281-ad5b-9e8fb0351d55@gmx.de>
Date: Sun, 6 Sep 2026 21:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
References: <20260905122040.2054789-1-bernd@kuhls.net>
 <20260905122040.2054789-7-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260905122040.2054789-7-bernd@kuhls.net>
X-Provags-ID: V03:K1:hzgjormJ2by3hhlYgIEr1dx/WoK4UZSCzgnkwPE5+D+nPTZ5uA4
 NeTuXrXOx57+IwJLo6w1f3hJ5l60cRfMa+oD7rbXRlY2hKFeB7Np/0vsS+XwYjwBmzCH2rS
 1eWB4WxPJ2WhUWxhDRX+xI/zJ5tBXuMlsFrv7DmPrVt9gfZgEpbZKxYNcf1UJ2Ub3xAcBD1
 TLJR0cXvY5jbC3Vu62S2Q==
UI-OutboundReport: notjunk:1;M01:P0:dRjSBvqNpqQ=;GoDzFpEcOIRZp2esTBwe+gasPS9
 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
 r+lFNB//tMxZYcBINpb1dyK7EQ==
Subject: Re: [Buildroot] [PATCH 7/7] package/swig: bump version to 4.5.1
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

Am 05.09.26 um 14:20 schrieb Bernd Kuhls:
> https://www.swig.org/Release/RELEASENOTES
> 
> Added upstream sha1 & sha256 hashes.
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Tested-by: Fiona Klute <fiona.klute@gmx.de>  # libselinux

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/3a1e018bd92f929d1acc1882742820bbefe06800
> 
> with the exception of bootlin-x86-64-uclibc
> https://gitlab.com/bkuhls/buildroot/-/jobs/16323077584
> where libselinux caused an unrelated build error also caught by the
> autobuilders:
> https://autobuild.buildroot.net/results/684/684a779841c26499f2b28f74edf183c73d12773b/
> 
> and the exception of bootlin-powerpc-e500mc-uclibc
> https://gitlab.com/bkuhls/buildroot/-/jobs/16323077582
> where sdl2 caused an unrelated build error also caught by the
> autobuilders:
> https://autobuild.buildroot.net/results/968/968608bfd41d40ecec3c2cf9544cdcfd1693da3f/
> 
>   package/swig/swig.hash | 4 +++-
>   package/swig/swig.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/swig/swig.hash b/package/swig/swig.hash
> index 21590c422a..f3d4a1829e 100644
> --- a/package/swig/swig.hash
> +++ b/package/swig/swig.hash
> @@ -1,5 +1,7 @@
> +# From https://sourceforge.net/projects/swig/files/swig/swig-4.5.1
> +sha1  fab5ee9e27b703ea964e55abca585567ebac9bcf  swig-4.5.1.tar.gz
> +sha256  7fec50b27deddab5455a9633780b6341eddfb96215a7619e93a76eb27178f653  swig-4.5.1.tar.gz
>   # Locally computed:
> -sha256  2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b  swig-4.1.1.tar.gz
>   sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
>   sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> index 71e5e05f96..e277f5049a 100644
> --- a/package/swig/swig.mk
> +++ b/package/swig/swig.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -SWIG_VERSION_MAJOR = 4.1
> +SWIG_VERSION_MAJOR = 4.5
>   SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
> -SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
> +SWIG_SITE = https://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
>   HOST_SWIG_DEPENDENCIES = host-bison host-pcre2
>   HOST_SWIG_CONF_OPTS = \
>   	--with-pcre \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
