Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AC3E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 687E86059A;
	Fri, 27 Dec 2024 14:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3RqmbNWVb9V; Fri, 27 Dec 2024 14:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 798A9606C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 798A9606C7;
	Fri, 27 Dec 2024 14:43:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF97E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 714E64023C
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PK_0da_VdMiY for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E7D3401F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7D3401F0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E7D3401F0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:43:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7EEED5FFB1;
 Fri, 27 Dec 2024 15:43:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:43:08 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:43:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223164853.1877513-1-james.hilliard1@gmail.com>
References: <20241223164853.1877513-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d02bf752cb142728693e4dd134931c99@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310589;
 bh=c+QgUGRr0f/qQkbzeDZCySKcZvYw3IfjiGC8BYz5iv8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rUzJR1R96pvnXfmlD10zIN5KndhGSKtVCTy2HYQ6UqD77mzdCNpilXeyV9wlCHupx
 wcdtkgUWxLmL6j5CPEhwf5JM1/EEQ3GWXHZzlP7WjZZ9RoLgK7z6k9IScsT6KDDEQq
 xaaH8fcvNxNJ6nqOIEOAlJ2GXlCGtOyUXScUt1POvTRUpFtVOdNJJXyrzEp7lDlVg9
 uc24G8hgeiTK76lc578TeRpVtrb7saCxpQ+ua7aTNByjxWo0q/nkwb6VFhiw5ENQzi
 RndyfZHhMuiZ/j7tsgAXkyjT9rl0TJLFsEESuyeDgF5Wap5zG4D4CjL4myqcnwSLaE
 EBCdNXuz2+szQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rUzJR1R9
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to
 version 2.37.0
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

On 23/12/2024 17:48, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-google-auth/python-google-auth.hash | 4 ++--
>  package/python-google-auth/python-google-auth.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-google-auth/python-google-auth.hash 
> b/package/python-google-auth/python-google-auth.hash
> index ef0ceaeb60..d71c3e36f3 100644
> --- a/package/python-google-auth/python-google-auth.hash
> +++ b/package/python-google-auth/python-google-auth.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/google-auth/json
> -md5  8dba1c171af4d945fb479ab27a0aac38  google_auth-2.36.0.tar.gz
> -sha256  
> 545e9618f2df0bcbb7dcbc45a546485b1212624716975a1ea5ae8149ce769ab1  
> google_auth-2.36.0.tar.gz
> +md5  db93ac3219d6a9b7ecc34f46637349e9  google_auth-2.37.0.tar.gz
> +sha256  
> 0054623abf1f9c83492c63d3f47e77f0a544caa3d40b2d98e099a611c2dd5d00  
> google_auth-2.37.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  
> LICENSE
> diff --git a/package/python-google-auth/python-google-auth.mk 
> b/package/python-google-auth/python-google-auth.mk
> index f2ccc2e3de..5925820995 100644
> --- a/package/python-google-auth/python-google-auth.mk
> +++ b/package/python-google-auth/python-google-auth.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_GOOGLE_AUTH_VERSION = 2.36.0
> +PYTHON_GOOGLE_AUTH_VERSION = 2.37.0
>  PYTHON_GOOGLE_AUTH_SOURCE = 
> google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
> -PYTHON_GOOGLE_AUTH_SITE = 
> https://files.pythonhosted.org/packages/6a/71/4c5387d8a3e46e3526a8190ae396659484377a73b33030614dd3b28e7ded
> +PYTHON_GOOGLE_AUTH_SITE = 
> https://files.pythonhosted.org/packages/46/af/b25763b9d35dfc2c6f9c3ec34d8d3f1ba760af3a7b7e8d5c5f0579522c45
>  PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
>  PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
>  PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
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
