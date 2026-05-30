Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7109CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55FF851A5;
	Sat, 30 May 2026 08:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbgQbgaTGggn; Sat, 30 May 2026 08:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D736E851A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780129861;
	bh=UD39wk5SHgsQIYuzUJxAHtHAfoGreHXuNY/SfOZP7ss=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Z7oxtBv4AQGA5/TZ7cW6419KiqAOwGK9ij/TUOYyTQChPbzIi41nvhvUIjMgxLeQk
	 D0Ks5FsmdbzrQEhjNy+SPrd1p9/lxVtwwDVhKjMNQMR3S/dKTysq7J/WlTlPUDYDOD
	 RL8ExArImN2l3mjCisPvw3Ax4GyrBE7VaJr7BqJh//qrcxlkkF8QctO8m/pb5tve25
	 ZRUe4vd9gjvqHGnCATHl1ZtRbeO7MFnwjdo7CSn+NXN1PUNO/1Up2Fr+EWV+uhrWqS
	 NqIMqaBmkkFbwbepGZZI8CkLT9bEjMuW4wvt9TTSefaXGdOw4GvyaOBvehvXFnSWlX
	 XcUdg7VfLFmzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D736E851A7;
	Sat, 30 May 2026 08:31:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 989E2F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 876BA851A0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gS3xFVz9vPJP for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D89C8519B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D89C8519B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D89C8519B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:30:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 994EAB97C67A; Sat, 30 May 2026 10:30:57 +0200 (CEST)
Message-ID: <04aef5ee-046f-481b-8a8f-5fe9436a2a4b@rnout.be>
Date: Sat, 30 May 2026 10:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20260529184934.958274-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529184934.958274-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780129857; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ASGpEMNMTE1f8Uo+3PxLPeS3JkB4SL5c/Rq5XIM/AmY=;
 b=ZV3tzO954u9b+Dy77PkOI7dW9jPI6J3BX1VpapEzbygJqQk2JlQEG/UJaVo8/gfiHY7/5/
 eh5+QjC1S0rKzRwKeQkI5y5QAUGFC7sMODSl2ITJF5pfDVNEAQG+m6cSQr1qellZIPpI/6
 8sL1w+VSwZpMM7oTb/bbnyRKejY13NvDY4yIwO5+aOj68I+Zub2ld5CVWyJ3CrlPN+zmJp
 Yjjdd0DzEZmEOoDCRp41/5Cc78qKXTwqsjSZqG54G3UO2kZDJ18uGV1Mv/8T7mrT+sDmbp
 4RNAu6UvrTTBaCjuhfAggZTX6n6a3K2IjkWXXGntv5FHI1zkOVXphUMipfYncA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZV3tzO95
Subject: Re: [Buildroot] [PATCH] package/{aardvark-dns,
 netavark}: security bump to versions 1.17.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/05/2026 20:49, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2026-35406: netavark has incorrect error handling for malformed tcp
> packets
> 
> https://github.com/advisories/GHSA-hfpq-x728-986j
> 
> aardvark-dns and netavark needs to be bumped in sync, so update both.
> 
> https://github.com/containers/aardvark-dns/releases/tag/v1.17.1
> https://github.com/containers/netavark/releases/tag/v1.17.1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.
  Regards,
  Arnout

> ---
>   package/aardvark-dns/aardvark-dns.hash | 2 +-
>   package/aardvark-dns/aardvark-dns.mk   | 2 +-
>   package/netavark/netavark.hash         | 2 +-
>   package/netavark/netavark.mk           | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
> index b3b742089a..d0a42c2ca5 100644
> --- a/package/aardvark-dns/aardvark-dns.hash
> +++ b/package/aardvark-dns/aardvark-dns.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  bf046c3bc7bc9f1f04220a89393b9189bcab1c61c204f247b3a5415d0ac27117  aardvark-dns-v1.17.0-git4-cargo5.tar.gz
> +sha256  9742d4a31d2136028221f386cf21f377cbad129626a70813f2bedad1162174ad  aardvark-dns-v1.17.1-git4-cargo5.tar.gz
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
> index c0dc7eb2a7..3f2a32ac88 100644
> --- a/package/aardvark-dns/aardvark-dns.mk
> +++ b/package/aardvark-dns/aardvark-dns.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # When updating the version here, also update netavark in lockstep
> -AARDVARK_DNS_VERSION = v1.17.0
> +AARDVARK_DNS_VERSION = v1.17.1
>   AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
>   AARDVARK_DNS_SITE_METHOD = git
>   
> diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
> index f7ab17de3e..b53311c574 100644
> --- a/package/netavark/netavark.hash
> +++ b/package/netavark/netavark.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  9ff98fe9bcb6478ef558ae277b32aad67dbd7e7b72cac66df24084cb4f9038d9  netavark-v1.17.0-git4-cargo5.tar.gz
> +sha256  3bfc0d3bb40965ecd4908f9a03a4fcf59228bacfaf6a7b73736b5019181e8499  netavark-v1.17.1-git4-cargo5.tar.gz
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
> index d47cee0fe1..e7126e3d4b 100644
> --- a/package/netavark/netavark.mk
> +++ b/package/netavark/netavark.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # When updating the version here, also update aardvark-dns in lockstep
> -NETAVARK_VERSION = v1.17.0
> +NETAVARK_VERSION = v1.17.1
>   NETAVARK_SITE = https://github.com/containers/netavark
>   NETAVARK_SITE_METHOD = git
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
