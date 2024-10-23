Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5717CFA462
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BF980A93;
	Wed, 23 Oct 2024 19:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18x2dsAi55bl; Wed, 23 Oct 2024 19:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 715A280A94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 715A280A94;
	Wed, 23 Oct 2024 19:46:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EDE94960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E8F94017B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIAVpXuYhB9c for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F00E40462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F00E40462
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F00E40462
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:46:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3F0CB780503;
 Wed, 23 Oct 2024 21:46:32 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:32942])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Oct 2024 21:46:32 +0200
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 21:46:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Zuj4YO+IYp/aFBBj@waldemar-brodkorb.de>
References: <Zuj4YO+IYp/aFBBj@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <821b81b6e103c70081d42a3a929140c8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729712793;
 bh=3u/9MtIVo6dLK+RMlkmzvCIwFjYQV/cP2YLLO5OD5So=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tDRnOiyxICtxq2n5Xa510TNfd4WeKs51oJ5G/CgbAKfvUyQ5N2P/DSCpHa07lQoFY
 oBfxju6kjkmc+Nlp5/kRKPo++lus6fdSJfl7SIchdC8Tt740+1UtyyO8uJAxg0yLx+
 QGkeQURqxiRfwtonWQd48goE0FHZmXudJprtr10947HxaelnqKfk0PU6cH/tp7My5+
 nZEEwzr/Y4q6F+ICROqku33waCIgWOWAliHAlvXtD283aDHsO0KQfAn1iISJ4ukTfW
 sAgfl1/jC7haAH9v7yrSM+zGE8CB/2Nsx7wwXBkCzsLXXWUwG4F8BjzCMqv1JY0SOw
 jhH5p6WCsFklQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tDRnOiyx
Subject: Re: [Buildroot] [PATCH] package/bind: update to 9.18.29
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

On 17/09/2024 05:32, Waldemar Brodkorb wrote:
> See here for a Changelog:
> https://downloads.isc.org/isc/bind9/9.18.29/doc/arm/html/notes.html#notes-for-bind-9-18-29
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master. Thanks!

Julien.

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index feb3430a73..2d4e247932 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from 
> https://ftp.isc.org/isc/bind9/9.18.28/bind-9.18.28.tar.xz.asc
> +# Verified from 
> https://ftp.isc.org/isc/bind9/9.18.29/bind-9.18.29.tar.xz.asc
>  # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
> -sha256  
> e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7  
> bind-9.18.28.tar.xz
> +sha256  
> c39ce5d09a8cb10108116fa533445de9f7fdfe0063e8d7c4c46ba1fd20d7bf6d  
> bind-9.18.29.tar.xz
>  sha256  
> 9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  
> COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index d594ab5e39..23687ec620 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -BIND_VERSION = 9.18.28
> +BIND_VERSION = 9.18.29
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  # bind does not support parallel builds.
> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
