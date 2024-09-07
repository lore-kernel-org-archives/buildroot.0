Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24DEB64CA
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 19:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7D5A400D2;
	Sat,  7 Sep 2024 19:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X__vNByRDkmd; Sat,  7 Sep 2024 19:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62D93400F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62D93400F2;
	Sat,  7 Sep 2024 19:42:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C76EA1BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3FE7403F9
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 19:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asQqzZpZeqoX for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 19:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20249402C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20249402C2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20249402C2
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 19:42:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 59FC013F88E;
 Sat,  7 Sep 2024 21:42:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 21:42:38 +0200
Date: Sat, 7 Sep 2024 21:42:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZtysrvrjZ6EEwuyc@landeda>
References: <20240906184756.1166732-1-james.hilliard1@gmail.com>
 <20240906184756.1166732-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906184756.1166732-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725738162;
 bh=zuLUd2kyBZRp34wxRYUYZuZrX9tTagIJA3EkrUQz4hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g6XDc4d/v6Gc5+Dz3jbmj9AojPS0ZomeTWssJjYgjJdib+cK4OKhegf/aA90Ry3FQ
 4O549mIdwqpP6CDGwPokCnmB/ZWjEiLNfgKzBcFG5OY/1A0OlJjBOnEdYWfiMGO7jm
 mZD1FS9t31mwYXejo5Grssgf0gqGBt7qnqWpHfmrmX0W4PBDVVc2EOs9prKR2QIkSq
 CDalWFmo/FJzim69jWBFeKWJTAyWzh5Mb8p631Ap4yB6LXYX8EGqn+mctMEpv9xUNr
 DPHElDW89Xk/nte+lE8E0FXmdD8xgG+A5Ug5ubG9Ippo1lh7h0cT2S+ToUOAVx8mBK
 fhyUvKqwjtZBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g6XDc4d/
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to
 version 2.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-06 12:47 -0600, James Hilliard spake thusly:
> Add new python-tzdata runtime dependency.

This is weird that it is needed, because the dependency is written as
an optional dependency, specific to win32;

   57 [project.optional-dependencies]
   58 email = ['email-validator>=2.0.0']
   59 timezone = [
   60     # See: https://docs.python.org/3/library/zoneinfo.html#data-sources
   61     'tzdata; python_version >= "3.9" and sys_platform == "win32"',
   62 ]

So, how come it is needed on Linux?

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pydantic/Config.in            | 1 +
>  package/python-pydantic/python-pydantic.hash | 4 ++--
>  package/python-pydantic/python-pydantic.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
> index e9cd2e6780..029f86450e 100644
> --- a/package/python-pydantic/Config.in
> +++ b/package/python-pydantic/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC
>  	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
>  	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
>  	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> +	select BR2_PACKAGE_PYTHON_TZDATA # runtime
>  	help
>  	  Data validation and settings management using python 3.6
>  	  type hinting.
> diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
> index 6127dcaf37..fd8d16dbb1 100644
> --- a/package/python-pydantic/python-pydantic.hash
> +++ b/package/python-pydantic/python-pydantic.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pydantic/json
> -md5  940d760de174d3567d4f5be28fd215f5  pydantic-2.8.2.tar.gz
> -sha256  6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a  pydantic-2.8.2.tar.gz
> +md5  f328e2d6c3d511a81e358aac6a8636b6  pydantic-2.9.0.tar.gz
> +sha256  c7a8a9fdf7d100afa49647eae340e2d23efa382466a8d177efcd1381e9be5598  pydantic-2.9.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
> diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
> index c549970db9..828658af19 100644
> --- a/package/python-pydantic/python-pydantic.mk
> +++ b/package/python-pydantic/python-pydantic.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYDANTIC_VERSION = 2.8.2
> +PYTHON_PYDANTIC_VERSION = 2.9.0
>  PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
> -PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8c/99/d0a5dca411e0a017762258013ba9905cd6e7baa9a3fd1fe8b6529472902e
> +PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/f6/8f/3b9f7a38caa3fa0bcb3cea7ee9958e89a9a6efc0e6f51fd6096f24cac140
>  PYTHON_PYDANTIC_SETUP_TYPE = pep517
>  PYTHON_PYDANTIC_LICENSE = MIT
>  PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
