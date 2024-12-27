Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6233EE7718F
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE876059A;
	Fri, 27 Dec 2024 14:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXee9Q-qY4df; Fri, 27 Dec 2024 14:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32BA5606C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32BA5606C7;
	Fri, 27 Dec 2024 14:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4681BE0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33BA84029A
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE8KT2a6bGBK for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 005D440266
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005D440266
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 005D440266
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:38:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EF50913F8C6;
 Fri, 27 Dec 2024 15:38:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:38:14 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:38:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223153544.1838610-1-james.hilliard1@gmail.com>
References: <20241223153544.1838610-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <caa65151fc53aff17ee78d41ca3df713@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310296;
 bh=4swRfUnTt8VG6SobFZ27t4El6O6JdczzjmVGGO7e8wI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UpsJwDLcwJv19kRESZAOQjHlfUEVY9ldJTGrK/DgElI0DvYaaB2E4Jh9Rkfp75mUJ
 ENWc01/BdUf2jWBqF7/XNhDp2ohfr9+y93kd7I1tf9ZeXVaCXWUo0Uv92uPK9SCTua
 cWh559lz5yynOmn3wbDohxQAUSMz9Ja8+ZKzlV8klKQ1kcm3PyuH55y5UEcstLxODs
 4eT6B59tcvS4PtAF4l9mBkemx89/O1XYpPmsfjBhEnHEiidniYfclT3vt/IDzUjp1M
 mI0eJN6cXYi3Wp0vWGPwef0S0rvpLwahFRbh50IdkjGxfqAevJRc5/WTU68RBD0Igd
 pwDEGBGrorOUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UpsJwDLc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bcrypt: bump to version
 4.2.1
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

On 23/12/2024 16:35, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-bcrypt/python-bcrypt.hash | 2 +-
>  package/python-bcrypt/python-bcrypt.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-bcrypt/python-bcrypt.hash 
> b/package/python-bcrypt/python-bcrypt.hash
> index 6855047de6..c17ae6da50 100644
> --- a/package/python-bcrypt/python-bcrypt.hash
> +++ b/package/python-bcrypt/python-bcrypt.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  
> 2385fd07301cf6d01befc1245d9310a97790492be76e388dd7c0d8de0409806f  
> python-bcrypt-4.2.0-cargo2.tar.gz
> +sha256  
> cf7284c3284e619553116ec98036d05bdd20d44cab71f907b7cd15137a3f2ec9  
> python-bcrypt-4.2.1-cargo2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  
> LICENSE
> diff --git a/package/python-bcrypt/python-bcrypt.mk 
> b/package/python-bcrypt/python-bcrypt.mk
> index 0654ea4730..cbbc7bcecf 100644
> --- a/package/python-bcrypt/python-bcrypt.mk
> +++ b/package/python-bcrypt/python-bcrypt.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_BCRYPT_VERSION = 4.2.0
> +PYTHON_BCRYPT_VERSION = 4.2.1
>  PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
> -PYTHON_BCRYPT_SITE_PYPI = 
> https://files.pythonhosted.org/packages/e4/7e/d95e7d96d4828e965891af92e43b52a4cd3395dc1c1ef4ee62748d0471d0
> +PYTHON_BCRYPT_SITE_PYPI = 
> https://files.pythonhosted.org/packages/56/8c/dd696962612e4cd83c40a9e6b3db77bfe65a830f4b9af44098708584686c
>  PYTHON_BCRYPT_SITE = 
> $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
>  PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
>  PYTHON_BCRYPT_LICENSE = Apache-2.0
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
