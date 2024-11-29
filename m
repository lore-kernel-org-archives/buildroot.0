Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE26BD72A1B
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC9E84643;
	Fri, 29 Nov 2024 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2MjDhEbuKro; Fri, 29 Nov 2024 21:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8961D84BAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8961D84BAF;
	Fri, 29 Nov 2024 21:16:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FFBF71F
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 21:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 333C04EE2A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 21:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGYpYotT-fUM for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 21:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65CCF42F23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CCF42F23
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65CCF42F23
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 21:12:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F0D0713F879;
 Fri, 29 Nov 2024 22:11:59 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35254])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 29 Nov 2024 22:11:59 +0100
MIME-Version: 1.0
Date: Fri, 29 Nov 2024 22:11:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241129014954.566635-1-fancp2007@gmail.com>
References: <20241129014954.566635-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <16200f7f83eb9efa3b67e602ec0f6a8e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732914721;
 bh=i1jJJsv2hNOomCGRR0T3gyP+TwlHzHCKMUE5V14CXx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bAez00VA9pod17i7kDJVQEVNdHOVWg28z1ZGNj4xVy9wkRXvlpLWqYIvtw1KqoAZL
 sBseqPu/Ra0Gy+YVXak2g1qX4+HHhzIHYgdxzI+oABvi65VwcdPxEL9aBoszZNehJo
 ZdBKKRh4Oqgn95giI9A/m8UWr5vynkRqdzuly3uJP7DK7lXhW/QN1l1922B2ER2gHh
 DRkAl32p1+MC8ZBJQP5ws6zuAw+Gdp6LC92m/sPwzw0htcEVzrjPZDKRkqnBQxcJQm
 ofG5iRvdyd+tlvcZUaG/RkF8C7JxdLkXyJKss1gNXZMOEXRHgmr1Ix/brrApkV/M2U
 82JGH5oXz3FIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bAez00VA
Subject: Re: [Buildroot] [PATCH] package/chrony: bump to version 4.6.1
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

On 29/11/2024 02:49, Scott Fan wrote:
> Release notes: https://chrony-project.org/news.html
> 
> This commit also updates the project's homepage and download URL.
> 
> The previous homepage URL http://chrony.tuxfamily.org/ now 
> automatically
> redirects to https://chrony-project.org/.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to next, thanks.

> ---
>  package/chrony/Config.in   | 2 +-
>  package/chrony/chrony.hash | 4 ++--
>  package/chrony/chrony.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/chrony/Config.in b/package/chrony/Config.in
> index c22b756c11..453e4f6c3f 100644
> --- a/package/chrony/Config.in
> +++ b/package/chrony/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_CHRONY
>  	  Chrony is a pair of programs which are used to maintain the
>  	  accuracy of the system clock.
> 
> -	  http://chrony.tuxfamily.org/
> +	  https://chrony-project.org/
> 
>  if BR2_PACKAGE_CHRONY
> 
> diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
> index 2cf6cca031..25535e723e 100644
> --- a/package/chrony/chrony.hash
> +++ b/package/chrony/chrony.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://download.tuxfamily.org/chrony/chrony-4.4-tar-gz-asc.txt
> -sha256  
> eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088  
> chrony-4.4.tar.gz
> +# https://chrony-project.org/releases/chrony-4.6.1-tar-gz-asc.txt
> +sha256  
> 571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c  
> chrony-4.6.1.tar.gz
>  # Locally calculated
>  sha256  
> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  
> COPYING
> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index bcf69a59db..642e1d8fd6 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -CHRONY_VERSION = 4.4
> -CHRONY_SITE = http://download.tuxfamily.org/chrony
> +CHRONY_VERSION = 4.6.1
> +CHRONY_SITE = https://chrony-project.org/releases
>  CHRONY_LICENSE = GPL-2.0
>  CHRONY_LICENSE_FILES = COPYING
>  CHRONY_CPE_ID_VENDOR = tuxfamily
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
