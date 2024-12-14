Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C2E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 14:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 086DA844BE;
	Sat, 14 Dec 2024 14:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ueTV2qCKIZ4; Sat, 14 Dec 2024 14:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E549844C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E549844C4;
	Sat, 14 Dec 2024 14:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A6F8CE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 881F2844BE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUYO6J-_nySn for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 14:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71720844EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71720844EC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71720844EC
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:01:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0D7F25FFAF;
 Sat, 14 Dec 2024 15:01:21 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50058])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 15:01:21 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 15:01:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214134000.3224571-1-peter@korsgaard.com>
References: <20241214134000.3224571-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6aa4756c6245ba0a1e763aa4cd7ce335@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734184883;
 bh=hZfVrgJVU7JE9iwuxhbqPPcYIjS6lnqTx9/cZuiqIFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l7IcRUybC2Mww2e1BX75H7eh0vTQvZ3FI/cdWXUoUy17W/uCkewQFJ+ZzBHrWm5JT
 LZSgsGkQ6HovO/aafHs2VFMxmAXLk1Ov6x4ng17maSs58Vin4G+XMll8D7FGK/4dna
 rM9BKjxk6O6MLOAsMJU66Xxs7Vgu5If0YTZHEWZGYxviKhbheBjflUrmQYJ8tvSNqP
 4KI+71iVo76yKvd0tLHhm1dF/AZV8rI8YkYPfyxHfVc6jdV5NRR6t9AZ7eSOcZjU4r
 96gvmYeqblZGU1BkHfUBRhKmg81G6vx5bMsxylB39A93wSbH5FKaW4bg/yoV+SNQHw
 qy0s3uhHiwxUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=l7IcRUyb
Subject: Re: [Buildroot] [PATCH] package/subversion: security bump to
 version 1.14.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/12/2024 14:39, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> CVE-2024-46901: mod_dav_svn denial-of-service via control characters in
> paths
> 
> It has been discovered that the patch for CVE-2013-1968 was incomplete
> and unintentionally left mod_dav_svn vulnerable to control characters
> in filenames.
> 
> https://subversion.apache.org/security/CVE-2024-46901-advisory.txt
> 
> Subversion 1.14.4 also fixed a Windows-only vulnerability:
> https://subversion.apache.org/security/CVE-2024-45720-advisory.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

> ---
>  package/subversion/subversion.hash | 4 ++--
>  package/subversion/subversion.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/subversion/subversion.hash 
> b/package/subversion/subversion.hash
> index 2710e9e3f3..5950e9dccf 100644
> --- a/package/subversion/subversion.hash
> +++ b/package/subversion/subversion.hash
> @@ -1,5 +1,5 @@
> -# From 
> https://www.apache.org/dist/subversion/subversion-1.14.3.tar.bz2.sha512
> -sha512  
> 40b172492005fd3b0cd9e457b4444af8ea5d8ff8fc161a9a0c6dc3a7314c6ad4ff75a4676f68a1919ae6273ae03e34d04eba8c1c37b8c0b4ec70d6731b527b41 
>  subversion-1.14.3.tar.bz2
> +# From 
> https://www.apache.org/dist/subversion/subversion-1.14.5.tar.bz2.sha512
> +sha512  
> e4800564d0cc68be98f19aa58d89181de83f237f0ccff10824d9237f8c65eb0071f7176ac54e9e8f8ecbf685849bd3e94be48f678f4c23ed6a5fd7fb6edd0321 
>  subversion-1.14.5.tar.bz2
> 
>  # Locally calculated
>  sha256  
> 484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad  
> LICENSE
> diff --git a/package/subversion/subversion.mk 
> b/package/subversion/subversion.mk
> index bc0b9b45ab..b3daf013f0 100644
> --- a/package/subversion/subversion.mk
> +++ b/package/subversion/subversion.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SUBVERSION_VERSION = 1.14.3
> +SUBVERSION_VERSION = 1.14.5
>  SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
>  SUBVERSION_SITE = https://downloads.apache.org/subversion
>  SUBVERSION_LICENSE = Apache-2.0
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
