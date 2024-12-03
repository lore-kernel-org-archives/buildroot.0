Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08000E74AD2
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE72B41EA4;
	Tue,  3 Dec 2024 20:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUqA2IGZTGpN; Tue,  3 Dec 2024 20:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B4A42399
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B4A42399;
	Tue,  3 Dec 2024 20:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91620236E
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB5E61132
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oL2ufBauq609 for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 20:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D7FF6112C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D7FF6112C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D7FF6112C
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:59:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id ECAC413F88E;
 Tue,  3 Dec 2024 21:59:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44398])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 21:59:25 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 21:59:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Bernd Kuhls <bernd@kuhls.net>, Dario
 Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20241202215731.409503-1-petr.vorel@gmail.com>
References: <20241202215731.409503-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9430a7088c8bc251d267e5b18e15dd4c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733259570;
 bh=xDPAVjFFtDC/936GCtEJhTePYQTSe7pAHRa2a+EjKsk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l9/xMf7pfC8qNjSC8MOH7ohom/dC1/QAxbphXSUkMwFEvk2rh6FfXVleMxxy0/bE9
 Y5zGnYUvuOhTM7ehgVnRwfOeKPBVESc+RQtjkDvxnMJAb9/N17LkvfSHCb/uNTu791
 XD6Nti8UjaD9f2mWlDbcGU+qW0E+L28qWnH9OlkUWS9V4lsZhJgbxxu9cDNZVj9pdp
 eYV6ND7T2PdyN3vnXx7xxsW1lezHbn43c3TmhWJq1CkRcZ9oOTzI2OFFHhJ6vdyPwh
 ehrOOmLPX3vQUVxYVuxbMHRbbXA5UgY4thE1egl1wytSCzC+HJkeFXr/ZUk4Iy132c
 iUV/+GzyRvcLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l9/xMf7p
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: bump version to 2.73
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

On 02/12/2024 22:57, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to next, thanks.

> ---
>  package/libcap/libcap.hash | 2 +-
>  package/libcap/libcap.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
> index dd9bc75a02..ec59f224bb 100644
> --- a/package/libcap/libcap.hash
> +++ b/package/libcap/libcap.hash
> @@ -1,5 +1,5 @@
>  # 
> https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
> -sha256  
> 23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f  
> libcap-2.70.tar.xz
> +sha256  
> 6405f6089cf4cdd8c271540cd990654d78dd0b1989b2d9bda20f933a75a795a5  
> libcap-2.73.tar.xz
> 
>  # Hash for license file:
>  sha256  
> 68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  
> License
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index a1b2636c5d..5a6ed5b494 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBCAP_VERSION = 2.70
> +LIBCAP_VERSION = 2.73
>  LIBCAP_SITE = 
> https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
>  LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
>  LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
