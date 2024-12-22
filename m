Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5285E7718D
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85E7160AC6;
	Sun, 22 Dec 2024 14:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yylXCwudG_HR; Sun, 22 Dec 2024 14:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9281460ADC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9281460ADC;
	Sun, 22 Dec 2024 14:12:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 469F5D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 244424029F
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNAanSJ2SaZd for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C50B940106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C50B940106
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C50B940106
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CC17A13F88E;
 Sun, 22 Dec 2024 15:12:21 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43048])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:12:21 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:12:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219022005.280924-1-james.hilliard1@gmail.com>
References: <20241219022005.280924-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <90a54e879d16132b967d1140c3112bbe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876742;
 bh=DaF4kypbgn8ltw44EpOGCO9g3NbXjad0MyW9rcfuM8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vOBFcc5ao5csSRKlur6cJHm5xwitJsarHhQL2E/Gm6iLCTTHGSMV8cnwaVnUcO+d0
 p6oX35G/22opNZUBCrVVTExfnWuSWO9fLZuhCkTCmSF9qkugcEcDxCzxU18Mkhb6HV
 Z0An9gDgxeE1egQaLCPBjKld327VGJO/+Ogm/OhN2qOYH1z9T1KU04DbR+W38DeShb
 YFxAYRY0GAQMr8cA3EWCOaXLIuZ2wbp8xGmcDs37Z+MX47AyHQKUPY3g01tufyDZK9
 KNi/hyvJsGamPLmdq38TTwM1l8M+Is8jWzCtlaGIDdNiC6mDcEiQ84X1/uxH42Er/w
 bZOgkZKtyqABw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vOBFcc5a
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to
 version 2.10.4
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

On 19/12/2024 03:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-pydantic/python-pydantic.hash | 4 ++--
>  package/python-pydantic/python-pydantic.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydantic/python-pydantic.hash 
> b/package/python-pydantic/python-pydantic.hash
> index b0db8ab4ef..635ae80dc2 100644
> --- a/package/python-pydantic/python-pydantic.hash
> +++ b/package/python-pydantic/python-pydantic.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pydantic/json
> -md5  84624d794e7d2b528fe1d34eeeeb481a  pydantic-2.9.2.tar.gz
> -sha256  
> d155cef71265d1e9807ed1c32b4c8deec042a44a50a4188b25ac67ecd81a9c0f  
> pydantic-2.9.2.tar.gz
> +md5  06f2a83ecaa1734954af07697bcc5554  pydantic-2.10.4.tar.gz
> +sha256  
> 82f12e9723da6de4fe2ba888b5971157b3be7ad914267dea8f05f82b28254f06  
> pydantic-2.10.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  
> LICENSE
> diff --git a/package/python-pydantic/python-pydantic.mk 
> b/package/python-pydantic/python-pydantic.mk
> index 2b9cd6c38a..622b297586 100644
> --- a/package/python-pydantic/python-pydantic.mk
> +++ b/package/python-pydantic/python-pydantic.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PYDANTIC_VERSION = 2.9.2
> +PYTHON_PYDANTIC_VERSION = 2.10.4
>  PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
> -PYTHON_PYDANTIC_SITE = 
> https://files.pythonhosted.org/packages/a9/b7/d9e3f12af310e1120c21603644a1cd86f59060e040ec5c3a80b8f05fae30
> +PYTHON_PYDANTIC_SITE = 
> https://files.pythonhosted.org/packages/70/7e/fb60e6fee04d0ef8f15e4e01ff187a196fa976eb0f0ab524af4599e5754c
>  PYTHON_PYDANTIC_SETUP_TYPE = hatch
>  PYTHON_PYDANTIC_LICENSE = MIT
>  PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
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
