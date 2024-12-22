Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF16EE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA1760A50;
	Sun, 22 Dec 2024 14:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X08UpLyXg115; Sun, 22 Dec 2024 14:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51E2605CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51E2605CB;
	Sun, 22 Dec 2024 14:08:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F5D5E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DB174029F
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtmeA6mED2Zt for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:08:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1425440106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1425440106
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1425440106
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:08:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8DE8013F899;
 Sun, 22 Dec 2024 15:08:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52994])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:08:19 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:08:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219004921.229845-1-james.hilliard1@gmail.com>
References: <20241219004921.229845-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3eeb9e8efc16bf0b596b12ad3b6856ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876500;
 bh=MHDNJW1l5VxUeT+b0FbXAqkS5rx0R9LFbZwyTVqlIdg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j3zVxUJm254iyZLqca9nWsl9dcwAHw6kO3kDz65a6Ge5iOV4jD0E4/gyWPewJ4nKN
 gc4PCoXrJNnSwscsq2yFVLM/5laEla+WNmeR7qKDuJdtYorBoOk/RBr+6qK+VXpMRm
 siAWTg14Pt0OXxXz7e2MFLFCxv4y9GH9csuhXgbedNn4fK02htDLiPXNpAyy8TLQa8
 qvdYBUrzcgtNgmpxysRoohtHZhXwUwEbsTrpgEP7e9lqauuGAH4gy9giq5Cs9nrdYR
 ahvzj+t0KmJavYGNA2tQk4dH01WC0hgsr31Vn5t7bj5WTHolhDt28K10w+JrFiTFo6
 idhKiN3RNJnsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j3zVxUJm
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.22.2
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

On 19/12/2024 01:49, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
>  package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash 
> b/package/python-tortoise-orm/python-tortoise-orm.hash
> index 5e97c6302f..2297290616 100644
> --- a/package/python-tortoise-orm/python-tortoise-orm.hash
> +++ b/package/python-tortoise-orm/python-tortoise-orm.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
> -md5  328373e7e6112eab38984d6c1c7caf41  tortoise_orm-0.21.7.tar.gz
> -sha256  
> 8a790a931828aa37ac364b344c561e603422aced2af5e403f6790575da0f19c5  
> tortoise_orm-0.21.7.tar.gz
> +md5  21f9f3624ef82b3b9c23ed1fb7d70766  tortoise_orm-0.22.2.tar.gz
> +sha256  
> f1e808bc27265b3e4682dae89b725a66d8311cc20c206d512c57dd8a1c78096b  
> tortoise_orm-0.22.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  
> LICENSE.txt
> diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk 
> b/package/python-tortoise-orm/python-tortoise-orm.mk
> index 0a8f173c86..6bd1276bd1 100644
> --- a/package/python-tortoise-orm/python-tortoise-orm.mk
> +++ b/package/python-tortoise-orm/python-tortoise-orm.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_TORTOISE_ORM_VERSION = 0.21.7
> +PYTHON_TORTOISE_ORM_VERSION = 0.22.2
>  PYTHON_TORTOISE_ORM_SOURCE = 
> tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
> -PYTHON_TORTOISE_ORM_SITE = 
> https://files.pythonhosted.org/packages/e8/0e/ad8e7554b0259072887d602617a67ef21055e1d8aa061936e381ecc1a9a5
> +PYTHON_TORTOISE_ORM_SITE = 
> https://files.pythonhosted.org/packages/5c/19/c32752a3042580b40300aeffa48859e087a023114f50a2846ba95c26c87d
>  PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
>  PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
>  PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
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
