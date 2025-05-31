Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4620FC5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1061C607E2;
	Sat, 31 May 2025 16:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBptHsX96mYi; Sat, 31 May 2025 16:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37573607C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37573607C0;
	Sat, 31 May 2025 16:43:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66E7F127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58D5F401D5
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zirUVy8znGy for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:43:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E7A74004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E7A74004A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E7A74004A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:43:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 894E61C00B7; Sat, 31 May 2025 18:43:14 +0200 (CEST)
Message-ID: <fe282adb-86b8-48e2-a699-0b10482a34cb@rnout.be>
Date: Sat, 31 May 2025 18:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>
References: <20250512205758.1229300-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512205758.1229300-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1Kn8NztEs3alEiVVID87hPjbogYJ2K+36QXuYdq7f7c=;
 b=IYVvusbQySy15oBkA5+HP66xGB7aT2ou1eMXVWA02m5xJra7OQxJ0bfMTi+bnrUgSlcr/X
 8r0s89E1Nq+DluL5USuPNbzghGN1J+MvOgsbormGNsNU8Hyr6IAvzAxBAW4BIOeUM4dHTk
 wIC3ipdpsYRlzGjm9aywLnxB7RC9XDw17pp9wiGb1Sz1u/zHOuM0/V38OnlYVDBIHrhM5d
 Awd3YQSyvWUzuTlMZXTHhj2oywE5rAMq0t9RfvFibwCBalk7BGbuv+bm8GkibMk0GrAaP2
 0mcl0e0UQvCixXwItigeUZ00mI2TWiP0z+yjWWI1oB4nOGhZyqiinLE8Uu+J4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IYVvusbQ
Subject: Re: [Buildroot] [PATCH 1/1] package/connman: update homepage url
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



On 12/05/2025 22:57, Julien Olivain wrote:
> The old connman homepage url [1] now redirects to an Intel open source
> software portal which no longer contains the connman project.
> 
> The project is now hosted at [2]. For reference, the upstream
> commit [3] removed references to [1].
> 
> This commit updates the Config.in homepage url to [2].
> 
> [1] https://01.org/connman
> [2] https://git.kernel.org/pub/scm/network/connman/connman.git
> [3] https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=7d35eba0b93580c7dae5763b517ea5571dc4a273
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/connman/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index af3e1f69f6..b01cbb344c 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_CONNMAN
>   	  for managing internet connections within embedded devices
>   	  running the Linux operating system.
>   
> -	  https://01.org/connman
> +	  https://git.kernel.org/pub/scm/network/connman/connman.git
>   
>   if BR2_PACKAGE_CONNMAN
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
