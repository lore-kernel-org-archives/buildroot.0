Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA0D2ECEB
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 21:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 575C2409B2;
	Mon, 19 Jan 2026 21:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekWDte5bANLX; Mon, 19 Jan 2026 21:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71FAB409BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768856506;
	bh=13+N1d+6mFTy9wazBx0Mj2Wc78V7Fj8aYaGM5TuHjDw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=At5fjrvyt3O4Aokqg++1wZN5pMmuGMkfAPbBk5wS2O4sedmBaW9CFE/FtZv9ZmIKL
	 tzhqb1+90NnVTCicfnusAsyHcThaiGr0DLQTbpa5hhp6z6TV5SlDQeZdEQYdoMz4Cz
	 i1Ef8xbPC7JXkkytSvdgmHjEgWgauHyy7tW6nd22Y8isrxkMxpyc8CZ44H6IZ6ntYc
	 aWJjxmVUmzLiagU9FJFVy4rTe4GAm4/0bXm2Su6IQI8rV7qSPIAtNxs9WHozSe7+Xp
	 KWyel8sppXOBBJhUIVoM2Xs3svnyzbKniSm33orA8kGA3QMmBqeuBUWcfdy3hS7xSV
	 erLtXXS9NkLYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71FAB409BC;
	Mon, 19 Jan 2026 21:01:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF93B2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DC7541B23
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V83fX6lwtP3n for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 21:01:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D64140147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D64140147
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D64140147
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:01:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D544119F5B2;
 Mon, 19 Jan 2026 22:01:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 Jan 2026 22:01:39 +0100
MIME-Version: 1.0
Date: Mon, 19 Jan 2026 22:01:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260118224947.3879017-6-bernd@kuhls.net>
References: <20260118224947.3879017-1-bernd@kuhls.net>
 <20260118224947.3879017-6-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <0bc43b6270e9bd2017062af6da48fb3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768856500;
 bh=VfuOEgfuSJLElbOY0mc/J7EA2qDuoMsYe8p1kErcKz8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hZ6V3oAfdMeFxf8oRi4oaZ9Cwtxz1wT4gTyOgZYGi/MKBEL4xHZbdY67fgVMtefxl
 VAAEuhKlUKG9Ua5P90F+FacrIskWY7O8IUrF7H/fkvEBRuPLZ1L5Ny/lDjKmp3poDd
 ++15fIXKjyb58p2Ev2H8rj9l7dtwq+eJXgR4EUnS8deRL6l76PRZ1/U9kG2djI56Se
 VvL0gMsuOocryM4EapoTtwxr+Imx9/nGxMVbcVvagMe7bdOBmPW1y/JD+PwdY9qIc4
 iDWUC8cey7QmRHI4/LiBFfz/gOPo4O/1IwSN4imdrQU+BtuOkxHLWJOMYgfIUf4aLm
 QKsCIjUP7UOYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hZ6V3oAf
Subject: Re: [Buildroot] [PATCH 5/6] package/php-zmq: remove package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 18/01/2026 23:49, Bernd Kuhls wrote:
> Building php-zmq is broken with php 8.5.
> 
> Although some pull requests exist upstream to fix php 8.5 support:
> https://github.com/zeromq/php-zmq/pulls
> 
> they do not fix other bugs like broken build with gcc 15.x which was 
> the
> cause for the its removal by Debian:
> https://tracker.debian.org/news/1668817/php-zmq-removed-from-testing/
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1097580
> 
> According to various sources the package is unmaintained:
> https://pecl.php.net/package/zmq
> https://lists.zeromq.org/pipermail/zeromq-dev/2019-August/033109.html
> https://github.com/zeromq/php-zmq/pull/240#issuecomment-3684566367
> 
> so we drop the package from buildroot.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 4502963b24..6be70dace8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
> 
>  comment "Legacy options removed in 2026.02"
> 
> +config BR2_PACKAGE_PHP_ZMQ
> +	bool "php-zmq removed"
> +	select BR2_LEGACY
> +	help
> +	  php-zmq was no longer maintained upstream, broken with php 8.5,

The command "make check-package" is reporting an error here:
Config.in.legacy:153: help text: <tab><2 spaces><62 chars> 
(https://nightly.buildroot.org/#writing-rules-config-in)

Could you fix this error, please?

> +	  so it has been dropped.
> +
>  config BR2_PACKAGE_LOCKDEV
>  	bool "lockdev removed"
>  	select BR2_LEGACY

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
