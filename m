Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A79CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 16:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38141605FD;
	Sun, 22 Sep 2024 16:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJMohClBZFzd; Sun, 22 Sep 2024 16:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 339CB60708
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 339CB60708;
	Sun, 22 Sep 2024 16:24:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A93641BF403
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4701681165
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEF0X1czD4dI for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 16:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CB4F80F47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB4F80F47
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CB4F80F47
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 16:24:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 61B845FFAF;
 Sun, 22 Sep 2024 18:23:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 18:23:58 +0200
Date: Sun, 22 Sep 2024 18:23:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZvBEnnaBMORve0mJ@landeda>
References: <20240922091358.1031980-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922091358.1031980-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727022241;
 bh=1MDtTVZ8abETXSicJUEwo1T8HsnB4EnEQ7jmgKbbpj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N85nPiVMfe19hhoWKX+yfgoe94VFwB3dbOoTLzowXEfU8AkbC0/xkYnLA+7Q/+emn
 urkP7yP3cW4qwPuQCGMhRWWJ6uTl5L7w9ozWsC/sau4oym4VtCEZTNKXjS8ya2cYh6
 6+ufcwqtmsuUxHTovan9GZWp4DT69iG4B4ucspM9h9Mfax3+gM8XhrAtyso7A8d+I9
 25p9j/dtNDxZE1xgEN9S97/v4kZf3ahshQ6jFCIOqlFfxiUFDg3VFscyQWsKjoUNYe
 boprACNrmDkJZBw2DSdcm7OTyuoTeT9jiMcCIWq4GGNJJP8Wyn0Yr9w7lTvI0qdWSW
 hltrFf3CWWL5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N85nPiVM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.24.0
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

James, All,

On 2024-09-22 03:13 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, along iwth a bunch of hte previous cush bumps as
well, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>  package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
> index 7c59716a58..88f978a98f 100644
> --- a/package/python-pydantic-core/python-pydantic-core.hash
> +++ b/package/python-pydantic-core/python-pydantic-core.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  eff354ef5fcf428103276a2c2825962411327811866ff52eb0c2df703858ba33  python-pydantic-core-2.23.4-cargo2.tar.gz
> +sha256  9b049dd3b038da0711d06273da0a191d249fc321b0b6b25cf0d56f8925364597  python-pydantic-core-2.24.0-cargo2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
> diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
> index d1f3ab4655..acc06a9c79 100644
> --- a/package/python-pydantic-core/python-pydantic-core.mk
> +++ b/package/python-pydantic-core/python-pydantic-core.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYDANTIC_CORE_VERSION = 2.23.4
> +PYTHON_PYDANTIC_CORE_VERSION = 2.24.0
>  PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
> -PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/e2/aa/6b6a9b9f8537b872f552ddd46dd3da230367754b6f707b8e1e963f515ea3
> +PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/a0/de/104764c6eac40b580a1c4d52c7befbd24c16d409c670257ce354df6ddc1e
>  PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
>  PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
>  PYTHON_PYDANTIC_CORE_LICENSE = MIT
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
