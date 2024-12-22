Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF45E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DFAE60645;
	Sun, 22 Dec 2024 14:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSILKtfN11BW; Sun, 22 Dec 2024 14:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D04760A58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D04760A58;
	Sun, 22 Dec 2024 14:13:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4FDB5E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 865BC829FD
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwYYZQyBaZXK for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:13:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95214829BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95214829BB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95214829BB
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:13:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B06C5780372;
 Sun, 22 Dec 2024 15:13:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41714])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:13:20 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:13:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219022920.284880-1-james.hilliard1@gmail.com>
References: <20241219022920.284880-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b988daa6e5ef66d7987ba61d97e275ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876801;
 bh=rxfdla/Vlvin7En47GdVWN0T84T1780PYxrnvlXbvHU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T5P16Flru0GE9Y0MO321l1U+Omv4BceeNnnq8wzsLugNeEt13SbD+ZdVd5/+254bm
 c+PtuALslgvdDksi3hgZY93EdiYocEWxyARkqODGwMLZxO+mUu4Gqb06idnZz84Ezw
 WNzSw0yfSzFo/BRFBOsqvHOHpE34OtMsA/+3/IpjP3kGCTakBsh9fg74QOxZ78xbdP
 NiwK6u2ycZI4apMoxNuKi/Z9SLN8NkZfi5ZktqIMGzTkWkhMl4Pt9FHvvFNUZLmVJ8
 jjDHGtjNVxoipbhLNjWajiGYHNhW3VVM+6bApVZ4PjRluQx9x7P0BibueUCIrffKUv
 YHvLPluEDx0EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T5P16Flr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.3.2
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

On 19/12/2024 03:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
>  package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash 
> b/package/python-pypika-tortoise/python-pypika-tortoise.hash
> index 5c78509af2..a353fc3b33 100644
> --- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
> +++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
> -md5  69e74ea7ee7236de921c662a3b0940bc  pypika_tortoise-0.2.1.tar.gz
> -sha256  
> 979bbb9d60fe9f6e4129a25c44ee008aab4a4e97b296350be9983dcaa2766354  
> pypika_tortoise-0.2.1.tar.gz
> +md5  356b9c058d7e6f52256057158d71a67d  pypika_tortoise-0.3.2.tar.gz
> +sha256  
> f5d508e2ef00255e52ec6ac79ef889e10dbab328f218c55cd134c4d02ff9f6f4  
> pypika_tortoise-0.3.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  
> LICENSE
> diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk 
> b/package/python-pypika-tortoise/python-pypika-tortoise.mk
> index ba4845e100..2b10e40861 100644
> --- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
> +++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PYPIKA_TORTOISE_VERSION = 0.2.1
> +PYTHON_PYPIKA_TORTOISE_VERSION = 0.3.2
>  PYTHON_PYPIKA_TORTOISE_SOURCE = 
> pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
> -PYTHON_PYPIKA_TORTOISE_SITE = 
> https://files.pythonhosted.org/packages/30/af/b4a6035611cf6f3990879385cf6d077013c1bdf7ea294d6ceebfa14c8d08
> +PYTHON_PYPIKA_TORTOISE_SITE = 
> https://files.pythonhosted.org/packages/f2/6f/d7bfc44f9d8d68e33866688f7ce9ba0785b485e4dec1590ae0a6ba73b5e2
>  PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = poetry
>  PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
>  PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
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
