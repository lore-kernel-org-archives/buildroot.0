Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCEBE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE5E60630;
	Sun, 22 Dec 2024 14:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 809lKmEOXLdV; Sun, 22 Dec 2024 14:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4052C60ACE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4052C60ACE;
	Sun, 22 Dec 2024 14:14:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B2BD3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98B4E4032E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-qNOrY7Qvqw for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6928A40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6928A40106
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6928A40106
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:14:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7A27760128;
 Sun, 22 Dec 2024 15:14:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52362])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:14:47 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:14:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219024610.293582-1-james.hilliard1@gmail.com>
References: <20241219024610.293582-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a6c8f8ef1342dfafc1e5a6aa752ae38c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876888;
 bh=1MDNKcuW0x/RUSCe3vyB/IZmQyDLrkh7utygBinj4fE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GLVtE90qXNDE4r5Ao9xaMCyJ3Op8dAHKu2T6mPnr0QxW8CKE8UA23OEqTsF/MqTsP
 eyI9+UyxgOYjEYA/uYT5J0I/48Ix7D7KYf1up+zOynIRY5kHtRqYXMnpSFjjSc2wmS
 X/PC2GsKLsWAJ92ANbr/Amd9LByTRJ+CNdHKexSFgWwju6s/Avz66K0CIK4WuZ3Nga
 QBJVXALuCsnEu8xBacw5KpNl8bWziyJyO/VPEN5Hurwl8n+poNCNVXeivbivjz+NFp
 ZgmVOT1EGZNKHhAiRqnzTEQIPfoZBjMYE2Tpta86a6xSXCIkYJCfFhVqSWMAUS0R9H
 qMjab3WcjmxGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GLVtE90q
Subject: Re: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to version
 0.34.0
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

On 19/12/2024 03:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-uvicorn/python-uvicorn.hash | 4 ++--
>  package/python-uvicorn/python-uvicorn.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-uvicorn/python-uvicorn.hash 
> b/package/python-uvicorn/python-uvicorn.hash
> index 42f29766db..bbaf98dfff 100644
> --- a/package/python-uvicorn/python-uvicorn.hash
> +++ b/package/python-uvicorn/python-uvicorn.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/uvicorn/json
> -md5  ec8e5bbfecd14029c81730c0a42ed731  uvicorn-0.32.0.tar.gz
> -sha256  
> f78b36b143c16f54ccdb8190d0a26b5f1901fe5a3c777e1ab29f26391af8551e  
> uvicorn-0.32.0.tar.gz
> +md5  9944ee2becd37cb1c1e804a96c34a9e0  uvicorn-0.34.0.tar.gz
> +sha256  
> 404051050cd7e905de2c9a7e61790943440b3416f49cb409f965d9dcd0fa73e9  
> uvicorn-0.34.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  
> LICENSE.md
> diff --git a/package/python-uvicorn/python-uvicorn.mk 
> b/package/python-uvicorn/python-uvicorn.mk
> index 35eb6f42c0..fbb3937af1 100644
> --- a/package/python-uvicorn/python-uvicorn.mk
> +++ b/package/python-uvicorn/python-uvicorn.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_UVICORN_VERSION = 0.32.0
> +PYTHON_UVICORN_VERSION = 0.34.0
>  PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
> -PYTHON_UVICORN_SITE = 
> https://files.pythonhosted.org/packages/e0/fc/1d785078eefd6945f3e5bab5c076e4230698046231eb0f3747bc5c8fa992
> +PYTHON_UVICORN_SITE = 
> https://files.pythonhosted.org/packages/4b/4d/938bd85e5bf2edeec766267a5015ad969730bb91e31b44021dfe8b22df6c
>  PYTHON_UVICORN_SETUP_TYPE = hatch
>  PYTHON_UVICORN_LICENSE = BSD-3-Clause
>  PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
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
