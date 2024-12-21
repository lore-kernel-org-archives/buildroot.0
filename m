Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0954E7718C
	for <buildroot@archiver.kernel.org>; Sat, 21 Dec 2024 18:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F84542C1B;
	Sat, 21 Dec 2024 18:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuOb2WHnMcSn; Sat, 21 Dec 2024 18:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F0342D2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69F0342D2A;
	Sat, 21 Dec 2024 18:37:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA5E3757
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 18:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D79674130E
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 18:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNoISFoNHu8V for <buildroot@buildroot.org>;
 Sat, 21 Dec 2024 18:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6ACCA4F1CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ACCA4F1CB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ACCA4F1CB
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 18:36:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CACAA13F880;
 Sat, 21 Dec 2024 19:36:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48816])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 21 Dec 2024 19:36:53 +0100
MIME-Version: 1.0
Date: Sat, 21 Dec 2024 19:36:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219013631.258264-1-james.hilliard1@gmail.com>
References: <20241219013631.258264-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <75935f935f21574c188a40f6c310374f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734806214;
 bh=2vlbSHRPJh5OKJwI+oDKltZU4SV6Mso4intvsRPfWgM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jw2StZ4u4thcH/AjSMJqrH9KBsXH2TIvfsdChxIPXzBuprwXxARxuBtx98BeyBt/F
 t1mi9WgMK/HGpuuR8iIS+EMUHMuT9OZNem36RDluH68wkZBAbUJF3W8yAoJlEW8Lno
 Ri5xkrmXytdBzZJZ/cJonkdFWTmU+oNuhN0OvDneVBhsvkn5TorlZs4tg1UomMuAdZ
 f78WeahoUBvEt8WkhquzXmQko3RiP1rGbbjjq6WLNSWcnBzIDK6+YEOC3amPgTYttK
 bPHo14XLi31oBGPifgNMBfNXd+RGPV2sfGHKWElrSfU76gywgOZUll9uxRq1ULfMXb
 2BcgmL/FXVy+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Jw2StZ4u
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 44.0.0
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

On 19/12/2024 02:36, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-cryptography/python-cryptography.hash | 2 +-
>  package/python-cryptography/python-cryptography.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-cryptography/python-cryptography.hash 
> b/package/python-cryptography/python-cryptography.hash
> index 61d9ca598e..aa7e16a043 100644
> --- a/package/python-cryptography/python-cryptography.hash
> +++ b/package/python-cryptography/python-cryptography.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after vendoring
> -sha256  
> 72c5686ee70cf37075e2fdea332066e4e2351fab8beaa4a22268983f092bca4e  
> python-cryptography-43.0.3-cargo2.tar.gz
> +sha256  
> 09a765af8da172785de52631fe6c626508fdc8e451b7fb01d52f58b7841a813b  
> python-cryptography-44.0.0-cargo2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  
> LICENSE
>  sha256  
> aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  
> LICENSE.APACHE
> diff --git a/package/python-cryptography/python-cryptography.mk 
> b/package/python-cryptography/python-cryptography.mk
> index 7feb4076cd..9ae1fdbd83 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_CRYPTOGRAPHY_VERSION = 43.0.3
> +PYTHON_CRYPTOGRAPHY_VERSION = 44.0.0
>  PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = 
> cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> -PYTHON_CRYPTOGRAPHY_SITE_PYPI = 
> https://files.pythonhosted.org/packages/0d/05/07b55d1fa21ac18c3a8c79f764e2514e6f6a9698f1be44994f5adf0d29db
> +PYTHON_CRYPTOGRAPHY_SITE_PYPI = 
> https://files.pythonhosted.org/packages/91/4c/45dfa6829acffa344e3967d6006ee4ae8be57af746ae2eba1c431949b32c
>  PYTHON_CRYPTOGRAPHY_SITE = 
> $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
>  PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
>  PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
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
