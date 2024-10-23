Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FFDCFA45F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30DB44078B;
	Wed, 23 Oct 2024 19:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IveUERLOHAoF; Wed, 23 Oct 2024 19:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 046094078D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 046094078D;
	Wed, 23 Oct 2024 19:45:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E354960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 825B24078C
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mUlFTxR8uDr for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:45:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 362DD4078B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362DD4078B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 362DD4078B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:45:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 210B0780316;
 Wed, 23 Oct 2024 21:45:47 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41400])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Oct 2024 21:45:47 +0200
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 21:45:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Zuj3qpOmPcV0BhTw@waldemar-brodkorb.de>
References: <Zuj3qpOmPcV0BhTw@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <6bd7988f35365ff5dc9286f71f0912e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729712748;
 bh=9dH/LNrKfEfKzrskCawOA8JmgCY2+3sPOiNJyXPWiMk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A/krTbic9WAfX9+vXOWp9IlVME1pz5adxRrZQ8xCiyjZrambQeluW6OdMAIoz9+tV
 dSpMrJ2z3h68frP6rpcDNNoLVYlgxrLW6fRfi92p08ZW36qfVjGRTUH4BxbrDzgWCF
 N2Hvwi/sLpRDhDzXJnFKC4ddbkdcQRyXuuQD9lBMiNs8Ib+PFLWNAlsPWrUuDaIcqb
 Ailckbu2Tql7A9yOUD227SE6FeCH9DvuxZPOQ4h2qxcuLS+KMMLLYcqXA/uN0aK2YF
 IaGCVlsB92ir7zlnJ9IxKStaRZYl/MFGogvOJWmyVXSJuuwZlxDIA0tNzyF35vGhR+
 NACpzWOzaAsiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A/krTbic
Subject: Re: [Buildroot] [PATCH] package/bind: force shared build
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

On 17/09/2024 05:29, Waldemar Brodkorb wrote:
> We got following error with --enable-static:
> 
> checking whether to build static libraries... yes
> configure: error: Static linking is not supported as it disables 
> dlopen() and certain security features (e.g. RELRO, ASLR)
> 
> Fixes:
> 
>  
> http://autobuild.buildroot.org/results/b55/b553898381ff0fdf5dd705fbb11b469b7564c6e6
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master. Thanks!

Julien.

> ---
>  package/bind/bind.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 217c9916fd..d594ab5e39 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -33,6 +33,7 @@ BIND_CONF_OPTS = \
>  	--enable-epoll \
>  	--disable-doh \
>  	--disable-backtrace \
> +	--disable-static \
>  	--with-openssl=$(STAGING_DIR)/usr
> 
>  BIND_DEPENDENCIES = host-pkgconf libuv openssl
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
