Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C4FCFA463
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7591180ABB;
	Wed, 23 Oct 2024 19:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8jgkZFtGnww; Wed, 23 Oct 2024 19:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C6F80DA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C6F80DA8;
	Wed, 23 Oct 2024 19:48:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50EEB4960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 307CC80D82
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdV-YEraESMR for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2943980ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2943980ABB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2943980ABB
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:48:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3DD142003AE;
 Wed, 23 Oct 2024 21:48:11 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50980])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Oct 2024 21:48:11 +0200
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 21:48:11 +0200
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Zu9vsjYJachGtBvN@waldemar-brodkorb.de>
References: <Zu9vsjYJachGtBvN@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <e6dffc6d0b999db36910577228a1dd02@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729712892;
 bh=TVAqDQkgPajaIkz2W/8C4b4AACQyPpY7+2h2LcQlic0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PgycgK3SKyE61g+ptJYD0Mb0SYpADAVM3Lx7FytNUtPyLhRWmxmgkgMXr+oZL5kQc
 W7v0iw3fyn5PY23lSMzir70RxRAFhI68sUKnuXdzTWomR/Brar5naTVdCegFQcEVGb
 gIMUP1aqhPtmZFHWCLdoQUwp8sAsp+H7/e9PB/d5Q1UZfBfxz5G5yAtdRI47s4Pbd4
 OTMI1i41ogc+7D6u0GTC6WqRDwVL5x33KICrokI2hE9RtaRunCpqLtIXb7yoHK1xjm
 A96hL7tpZCq0pS768ZG5/IBnfnrZcGXXRCyOp/VNrPLsnPSTymbh3AzivKnmJEwnxz
 zl0B1pKIgJLTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PgycgK3S
Subject: Re: [Buildroot] [PATCH] package/bind: update to 9.18.30
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

Hi Waldemar,

On 22/09/2024 03:15, Waldemar Brodkorb wrote:
> See here for a Changelog:
> https://downloads.isc.org/isc/bind9/9.18.30/doc/arm/html/notes.html#notes-for-bind-9-18-30
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> That patch is on top of 9.18.29 bump which is not yet applied.
> Should I sent a v2 which is directly bumping master to 8.18.30?

I applied this patch on master, on top of the 9.18.29 bump.
Thanks.

Julien.

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 2d4e247932..dbffff05ea 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from 
> https://ftp.isc.org/isc/bind9/9.18.29/bind-9.18.29.tar.xz.asc
> +# Verified from 
> https://ftp.isc.org/isc/bind9/9.18.30/bind-9.18.30.tar.xz.asc
>  # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
> -sha256  
> c39ce5d09a8cb10108116fa533445de9f7fdfe0063e8d7c4c46ba1fd20d7bf6d  
> bind-9.18.29.tar.xz
> +sha256  
> 9f6817640970267317e5aa143ecf70531040f2155636b1a63ea45379aa09034a  
> bind-9.18.30.tar.xz
>  sha256  
> 9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  
> COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 23687ec620..81e608380d 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -BIND_VERSION = 9.18.29
> +BIND_VERSION = 9.18.30
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
