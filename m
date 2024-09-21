Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AC7CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 20:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DCE740015;
	Sat, 21 Sep 2024 20:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ms-tjgjhDPyI; Sat, 21 Sep 2024 20:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A59C400DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A59C400DD;
	Sat, 21 Sep 2024 20:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51E501BF48B
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DB1340716
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZB7hrQMGgzJx for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 20:18:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC905406FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC905406FD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC905406FD
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:18:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0D4FD60129;
 Sat, 21 Sep 2024 22:18:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 22:18:36 +0200
Date: Sat, 21 Sep 2024 22:18:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zu8qHAeo6BrMKbkx@landeda>
References: <20240906181820.15261-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906181820.15261-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726949920;
 bh=37NfVyiQkup9ZqV+SpTOTaApZagee+9vcQRjGuvIWZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZzBrFcN//w92EeYSyolx1qiCxDLibrLD+1WuFVmeVmvlOemG0cztN2FUAUc0pHhM
 QJ3Ii1EkQAgQ708ySsjRnv0GqWbo0eYwF38mDLtZfQWgJYQpnI9N7ywskzRdGWIlg9
 jYRZXLrlLCK9jEEow2/rZsTjFBjlKYv3uEjTIWHxto5GJ5BsGj1ktzuSu4NXucMSEk
 gGFvhtjOZXvSiuCCzGywdvRfs5adDJkVDEGe4loOah/XuA59zcNl72nC0hPz4ycswn
 reo0KhFEvmRsqfjdL6Yyjzes653k65ZjklcdZe/v/5SMB6Y/fNet+PMfMvDHOTy0D4
 c7/mbFprqy5dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aZzBrFcN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 3.8
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, all,

On 2024-09-06 12:18 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks. As well as a few other such bumps...

Regards,
Yann E. MORIN.

> ---
>  package/python-idna/python-idna.hash | 4 ++--
>  package/python-idna/python-idna.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
> index 7b22841d88..88459b38df 100644
> --- a/package/python-idna/python-idna.hash
> +++ b/package/python-idna/python-idna.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/idna/json
> -md5  31cc572cb7a6519159c927c998c64c79  idna-3.7.tar.gz
> -sha256  028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc  idna-3.7.tar.gz
> +md5  4490e5070a3dcbf1a6cd178cb523cdfb  idna-3.8.tar.gz
> +sha256  d838c2c0ed6fced7693d5e8ab8e734d5f8fda53a039c0164afb0b82e771e3603  idna-3.8.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
> diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
> index b3c012ed0d..c9b83a5bff 100644
> --- a/package/python-idna/python-idna.mk
> +++ b/package/python-idna/python-idna.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_IDNA_VERSION = 3.7
> +PYTHON_IDNA_VERSION = 3.8
>  PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
> -PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07
> +PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/e8/ac/e349c5e6d4543326c6883ee9491e3921e0d07b55fdf3cce184b40d63e72a
>  PYTHON_IDNA_LICENSE = BSD-3-Clause
>  PYTHON_IDNA_LICENSE_FILES = LICENSE.md
>  PYTHON_IDNA_SETUP_TYPE = flit
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
