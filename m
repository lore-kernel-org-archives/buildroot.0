Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2ABE66893
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 00:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C922761511;
	Sun, 24 Nov 2024 00:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04Y-omTe22vG; Sun, 24 Nov 2024 00:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D29936150E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D29936150E;
	Sun, 24 Nov 2024 00:41:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 821C11D8B
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 00:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 626C742C2A
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 00:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xw4BxRk68u6b for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 00:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3594942B75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3594942B75
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3594942B75
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 00:41:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EB4B15FFAA;
 Sun, 24 Nov 2024 01:41:01 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43446])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Nov 2024 01:41:01 +0100
MIME-Version: 1.0
Date: Sun, 24 Nov 2024 01:41:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241123225155.3362363-1-peter@korsgaard.com>
References: <20241123225155.3362363-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3a4e6ae025bfd288bb98c7b492ec499f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732408863;
 bh=0u8VRwiXCIdp7/RLgq6LLUHKZCcNCtdtrtiZ2Z1LRpU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qGggu3CZw8FxlMs0KUkg+pEwtPynLPG0HSBHnOVxbH0uKMCOAyIpTR5lyG9VzvyLn
 M8OHt9CuDdtN577Q/eIk1jpITfb8WeCoXnRJVGsjSLjUz++VpvL4tnZE9kc5fyRUyd
 8wcrFKlA62wiDkVGP7XbRhNmmpi0kjQZVqXZHK7ETYmqrwdZd8crN5XVkRueWO2nV0
 HKZLdflJ0H9sNbD7pbBR0ap/LxjhKX+AQG80JkHedZzCnXr3bKCxafJAVdi2XlSOyj
 xDljQhqp8I8BnNvBzL93fXDrQey4qT9SguEzO+n1oGzOkg77Yez7e9vdy1aHYCq0A0
 hAWtCDg7oqOTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qGggu3CZ
Subject: Re: [Buildroot] [PATCH] package/quagga: fetch from
 sources.buildroot.net
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

Hi Peter,

On 23/11/2024 23:51, Peter Korsgaard wrote:
> Fixes 
> https://autobuild.buildroot.org/results/54a/54a165827f536be47cd45c98da3937a1e94a7c65/
> 
> Upstream is no longer accessible, so use s.b.n instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/quagga/quagga.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
> index 5d8d52263a..dd921552f1 100644
> --- a/package/quagga/quagga.mk
> +++ b/package/quagga/quagga.mk
> @@ -5,7 +5,8 @@
>  
> ################################################################################
> 
>  QUAGGA_VERSION = 1.2.4
> -QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
> +# upstream (http://download.savannah.gnu.org/releases/quagga) dead
> +QUAGGA_SITE = http://sources.buildroot.net/quagga

Should we use https instead? The default BR2_BACKUP_SITE value
is using it:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11-rc2/Config.in#L265

>  QUAGGA_INSTALL_STAGING = YES
>  QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
>  QUAGGA_LICENSE = GPL-2.0+
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
