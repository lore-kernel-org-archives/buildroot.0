Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13838E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80CD605A2;
	Sun, 22 Dec 2024 14:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRd2XOIvIRUE; Sun, 22 Dec 2024 14:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E407F60630
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E407F60630;
	Sun, 22 Dec 2024 14:14:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30A8D5E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F2B8605F9
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLBIAbX_Ewrr for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F316960645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F316960645
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F316960645
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 19510B0055E;
 Sun, 22 Dec 2024 15:14:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56276])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:14:32 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:14:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219024130.291876-1-james.hilliard1@gmail.com>
References: <20241219024130.291876-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0e1fe9e07f9e7a8c81b26792f2fbba6c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876873;
 bh=MHngymi1xfKrcbjR/LJcSGD+Rq6vlqw4GdzI0kkrieA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kx9jdErpWqA69O5G7TAde705OHjVFYwlKck/tuLnRYVSVZ57VA/sBCoADgs/YkVXm
 nu5YGpFO75MJj4te6Y5IQiBvkbotPj/2m+QsR3hQMOP1AjdztETnZlZpyMPuoomR42
 OKVfWMjgkMI854es07oo0NaygQMZV5Y1IYFs3NRAKs6xcbxWnuOqsj86j3aa2IJwZD
 7ZMfbHWmixEyewwX2RRFd1AI2m/tegC9nmeH1pmLhbMdx9FGoqygj/dyahj55npXon
 SLegX/WKj7ai+3KQlhNXGjiO1+Khr7LKWJMT3XazjKXR5NJWj3KMvIjx+M92nnaMZc
 T/jzZ7IOuQKNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kx9jdErp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-starlette: bump to
 version 0.41.3
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

On 19/12/2024 03:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-starlette/python-starlette.hash | 4 ++--
>  package/python-starlette/python-starlette.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-starlette/python-starlette.hash 
> b/package/python-starlette/python-starlette.hash
> index f422e6cfe0..1542e565f9 100644
> --- a/package/python-starlette/python-starlette.hash
> +++ b/package/python-starlette/python-starlette.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/starlette/json
> -md5  97321ad76438c1106ddd817baddcda06  starlette-0.41.2.tar.gz
> -sha256  
> 9834fd799d1a87fd346deb76158668cfa0b0d56f85caefe8268e2d97c3468b62  
> starlette-0.41.2.tar.gz
> +md5  ccdbb470d005b83cc8f808e6dc25f890  starlette-0.41.3.tar.gz
> +sha256  
> 0e4ab3d16522a255be6b28260b938eae2482f98ce5cc934cb08dce8dc3ba5835  
> starlette-0.41.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  
> LICENSE.md
> diff --git a/package/python-starlette/python-starlette.mk 
> b/package/python-starlette/python-starlette.mk
> index 3caa136987..0a4e5f3f17 100644
> --- a/package/python-starlette/python-starlette.mk
> +++ b/package/python-starlette/python-starlette.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_STARLETTE_VERSION = 0.41.2
> +PYTHON_STARLETTE_VERSION = 0.41.3
>  PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
> -PYTHON_STARLETTE_SITE = 
> https://files.pythonhosted.org/packages/3e/da/1fb4bdb72ae12b834becd7e1e7e47001d32f91ec0ce8d7bc1b618d9f0bd9
> +PYTHON_STARLETTE_SITE = 
> https://files.pythonhosted.org/packages/1a/4c/9b5764bd22eec91c4039ef4c55334e9187085da2d8a2df7bd570869aae18
>  PYTHON_STARLETTE_SETUP_TYPE = hatch
>  PYTHON_STARLETTE_LICENSE = BSD-3-Clause
>  PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
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
