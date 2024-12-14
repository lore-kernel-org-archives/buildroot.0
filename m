Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDD1E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 21:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DAD9409EE;
	Sat, 14 Dec 2024 21:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BL_cfB57FQFv; Sat, 14 Dec 2024 21:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21123408EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21123408EA;
	Sat, 14 Dec 2024 21:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E714CE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 21:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C4AF40168
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 21:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xId5hIBcpYyq for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 21:59:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 136694011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 136694011D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 136694011D
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 21:59:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0914F5FFB7;
 Sat, 14 Dec 2024 22:59:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48404])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 22:59:14 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 22:59:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214204456.2666262-1-bernd@kuhls.net>
References: <20241214204456.2666262-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <0a5dbe154474075385e8eab4c89e61cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734213556;
 bh=zY+s4mDfJDQa04IkUOxBfX0DPKC5MeR/21HNDZeTt0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ReNZNmJCQ6tllpWpi6XLDczOS6SDg1XdDGhhxgt5xnlF50xBe3KBnqCh8Em1rAck+
 3aSSAAVeaFw6uKIwBZV/rJYlb1q96tTAbmsfff8CgB5AvUEayNrUBkroFk0c5fWHDp
 21pLiy5I6dBQV2W9zT1tph4g0VXUWLaIYGPDv58ajDHxS9STPUY1VV3htzI2CicjUu
 MK0gi0usZL7hgYn696wfFTl1hM3kTxoOvkbLEmz8DnKmzWHBuqsTD23dHQoOZRIwh8
 dFF+rbRRwbNczn2RFR81Yrf8Q0zGXHc2esvz+jsj0a/KshHMx7fui5vrFFdvCPU9q2
 7SPsUE9XyPMSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ReNZNmJC
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: bump version to 1.22
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

On 14/12/2024 21:44, Bernd Kuhls wrote:
> Changelog:
> https://github.com/ebiggers/libdeflate/blob/master/NEWS.md
> 
> Updated license hash due to upstream commit:
> https://github.com/ebiggers/libdeflate/commit/439f30117684c7859e0b1d4d8c57306b9ad71fd4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/libdeflate/libdeflate.hash | 4 ++--
>  package/libdeflate/libdeflate.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libdeflate/libdeflate.hash 
> b/package/libdeflate/libdeflate.hash
> index 46afa96635..bb97c76c3d 100644
> --- a/package/libdeflate/libdeflate.hash
> +++ b/package/libdeflate/libdeflate.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> ed1454166ced78913ff3809870a4005b7170a6fd30767dc478a09b96847b9c2a  
> libdeflate-1.20.tar.gz
> -sha256  
> 5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  
> COPYING
> +sha256  
> 7f343c7bf2ba46e774d8a632bf073235e1fd27723ef0a12a90f8947b7fe851d6  
> libdeflate-1.22.tar.gz
> +sha256  
> 4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  
> COPYING
> diff --git a/package/libdeflate/libdeflate.mk 
> b/package/libdeflate/libdeflate.mk
> index 4597dc5a8c..823ff442fd 100644
> --- a/package/libdeflate/libdeflate.mk
> +++ b/package/libdeflate/libdeflate.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBDEFLATE_VERSION = 1.20
> +LIBDEFLATE_VERSION = 1.22
>  LIBDEFLATE_SITE = $(call 
> github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
>  LIBDEFLATE_LICENSE = MIT
>  LIBDEFLATE_LICENSE_FILES = COPYING
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
