Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C53FE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA44160AA1;
	Sun, 22 Dec 2024 14:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYgnQOKmSmMe; Sun, 22 Dec 2024 14:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C2E60AC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C2E60AC6;
	Sun, 22 Dec 2024 14:12:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEC48D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E976B4138E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQDrbhvVgrzT for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:12:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCE4242B46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCE4242B46
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCE4242B46
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:12:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D88AB78034D;
 Sun, 22 Dec 2024 15:12:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53540])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:12:05 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:12:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219021624.278382-1-james.hilliard1@gmail.com>
References: <20241219021624.278382-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0dd7b984af5ea71c1c1dcf1dc589e924@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876727;
 bh=6OH2g++XWK2i8SDCP7xmRu5XrJXUd0RkLxZakZM9J98=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rBDPeeCHCgvAaEHpzwsRkY6m9aNpGYdlfvczR0pa4t+k+rYMchrAyNoNQJoS64ZMz
 Xgn83yzbzNwtDvqrnG5uTx4b8hSdIoW6/x5hsI0Rnu433e5cyqXiLTtVBcZjTCJC+A
 PW3WjznnNMCvSbriaPsYKqZIJc2AHAO2NS2nJ+x3iG7ZEPrXB/qEWRl7v2P9FNZHBU
 B96dNnuhwt2gYPY10a/j9ew8+EGfKY7nJxJLV1CzNpCbNRDDRk1q7XThoMtqHCKE8T
 KKoOBAGnNJTfPpQDJTdcMXvmO07KTaz8LPzaT49bamEc+ioqMc+iggNwhtIZ6qEzYH
 EtL8iTh1yxTnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rBDPeeCH
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.27.2
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

On 19/12/2024 03:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-pydantic-core/python-pydantic-core.hash | 2 +-
>  package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-pydantic-core/python-pydantic-core.hash 
> b/package/python-pydantic-core/python-pydantic-core.hash
> index 76e05eb20e..d908d5cddc 100644
> --- a/package/python-pydantic-core/python-pydantic-core.hash
> +++ b/package/python-pydantic-core/python-pydantic-core.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  
> c9a9e5970fbe54f24023635743dfe0f9a0adbebafb467729b674399f06a2d0b5  
> python-pydantic-core-2.26.0-cargo2.tar.gz
> +sha256  
> d7e62e6331eb4e712b83dad434926440c7c94989e20d693cfae119b8777ce777  
> python-pydantic-core-2.27.2-cargo2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  
> LICENSE
> diff --git a/package/python-pydantic-core/python-pydantic-core.mk 
> b/package/python-pydantic-core/python-pydantic-core.mk
> index 865c7d0c84..6a18421eee 100644
> --- a/package/python-pydantic-core/python-pydantic-core.mk
> +++ b/package/python-pydantic-core/python-pydantic-core.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PYDANTIC_CORE_VERSION = 2.26.0
> +PYTHON_PYDANTIC_CORE_VERSION = 2.27.2
>  PYTHON_PYDANTIC_CORE_SOURCE_PYPI = 
> pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
> -PYTHON_PYDANTIC_CORE_SITE_PYPI = 
> https://files.pythonhosted.org/packages/98/85/0ac4f8fc632fa1bb3f473e4dfb1cd520ede11179f76a028edfd2ca989ed4
> +PYTHON_PYDANTIC_CORE_SITE_PYPI = 
> https://files.pythonhosted.org/packages/fc/01/f3e5ac5e7c25833db5eb555f7b7ab24cd6f8c322d3a3ad2d67a952dc0abc
>  PYTHON_PYDANTIC_CORE_SITE = 
> $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
>  PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
>  PYTHON_PYDANTIC_CORE_LICENSE = MIT
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
