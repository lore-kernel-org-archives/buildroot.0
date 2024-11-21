Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7D6E64016
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 21:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16ED4607D5;
	Thu, 21 Nov 2024 21:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOUw-pYIIEkI; Thu, 21 Nov 2024 21:35:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D26A607DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D26A607DA;
	Thu, 21 Nov 2024 21:35:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 992F5B8E
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 21:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77DBB41981
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 21:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6QJO6WSBOaa for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 21:35:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D334B41980
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D334B41980
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D334B41980
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 21:35:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 72F152003CE;
 Thu, 21 Nov 2024 22:35:41 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43972])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 21 Nov 2024 22:35:41 +0100
MIME-Version: 1.0
Date: Thu, 21 Nov 2024 22:35:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241121182141.25658-1-bernd@kuhls.net>
References: <20241121182141.25658-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <f03f086f2ddd93ccdb07e26babf0a193@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732224942;
 bh=IeuRXlRKxgPYVC1JbhP+3KXgifhh+ujngk0kIVB2TEc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BMBSsS/AYBUMYs03sxaeDfxd9XPDm4a4/WU0Axgio+10vXBZVvacm2VVc4CKb8hJX
 +zQZew5dj9hLGpPhGK9kGhahvuBqRgB+dfq/dyf+DkRWzbnBJwG6eSZslKcRL/BJEj
 63h7DsQjTfqGWzrORJJB04VW9kuqZzOCL17L2C+GM+e1UXS6Y7YOpix7ZfKKQu+X8T
 gd4UiqZn2TsEuYKj4eXomQJJZpqjYnq9/8HZ9KKr9LTXn5SMp1XCpZKm2Kh0ad7i72
 TezCKkpZ6j7PBTGBfCK2jjnN+tkOuwqyiTetsSYEUEo0cFwFcbcV7m20MJQEtDWGGL
 lcnNePDjtPNxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BMBSsS/A
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.3.14
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

On 21/11/2024 19:21, Bernd Kuhls wrote:
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> Release notes: https://news-web.php.net/php.announce/444
> 
> Fixes CVE-2024-8929, CVE-2024-8932, CVE-2024-11233, CVE-2024-11234 &
> CVE-2024-11236.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 9cbb600c98..e3a1c6cf2f 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  
> 89adb978cca209124fe53fd6327bc4966ca21213a7fa2e9504f854e340873018  
> php-8.3.13.tar.xz
> +sha256  
> 58b4cb9019bf70c0cbcdb814c7df79b9065059d14cf7dbf48d971f8e56ae9be7  
> php-8.3.14.tar.xz
> 
>  # License file
>  sha256  
> b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  
> LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 17feb90d82..2f649dc6fb 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PHP_VERSION = 8.3.13
> +PHP_VERSION = 8.3.14
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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
