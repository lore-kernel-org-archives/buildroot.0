Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AA9E7718D
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 125CB60AC1;
	Sun, 22 Dec 2024 14:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekp6nyfarnkU; Sun, 22 Dec 2024 14:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CAB460ADC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CAB460ADC;
	Sun, 22 Dec 2024 14:11:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B580D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49EF560A9E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vm4uA2ROeOb1 for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:11:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A43460ADC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A43460ADC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A43460ADC
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2824519F593;
 Sun, 22 Dec 2024 15:11:35 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43048])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:11:35 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:11:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219020654.272290-1-james.hilliard1@gmail.com>
References: <20241219020654.272290-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <93fa843c926e6c0c8156f48028c2b7d8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876696;
 bh=6TN8/k/EBio7ChZoSUa951ZlWCdYepRvXJMwoKP4FEg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k3cgegOntApWoC++7S342Ipu5tQ/8krPsVa1brua+QQiULoVfLgJkoQP4dfdNpaei
 hNH8JXhvwByObMY7mmSkZjh4gXcm1icU5EjgQICtOtIIGIgGnf6QKaIsCj4/7dP6Ld
 xgd3vB5zPXcAn+0h+wgQoIrDx0mnFiDsZ/XyfGnZiMp5Zk3451Yz4nWMCym8jsDpcM
 +5YlMvae6zQkBd0/MF0sBRa+k9MiC9UIKSlVSfYQF2ugox41xMvJq4hZcWA8xIQlBe
 cFlCkIUhQOqJuqUXLHP8oOL6IzaGQSeT922dMK6uwfL61r62u+QVmknWBUNiRuj9H6
 tU6DXapFC9xlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k3cgegOn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to
 version 1.27.0
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

On 19/12/2024 03:06, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-hatchling/python-hatchling.hash | 4 ++--
>  package/python-hatchling/python-hatchling.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-hatchling/python-hatchling.hash 
> b/package/python-hatchling/python-hatchling.hash
> index b01d3df254..bb19d63561 100644
> --- a/package/python-hatchling/python-hatchling.hash
> +++ b/package/python-hatchling/python-hatchling.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/hatchling/json
> -md5  ac265366ccd17365db319dc95a9e5bc5  hatchling-1.25.0.tar.gz
> -sha256  
> 7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262  
> hatchling-1.25.0.tar.gz
> +md5  6ffb3087c9b6a9ffbfc1bb394f7ed1a8  hatchling-1.27.0.tar.gz
> +sha256  
> 971c296d9819abb3811112fc52c7a9751c8d381898f36533bb16f9791e941fd6  
> hatchling-1.27.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  
> LICENSE.txt
> diff --git a/package/python-hatchling/python-hatchling.mk 
> b/package/python-hatchling/python-hatchling.mk
> index 2ca2caf67c..57fd34530b 100644
> --- a/package/python-hatchling/python-hatchling.mk
> +++ b/package/python-hatchling/python-hatchling.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_HATCHLING_VERSION = 1.25.0
> +PYTHON_HATCHLING_VERSION = 1.27.0
>  PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
> -PYTHON_HATCHLING_SITE = 
> https://files.pythonhosted.org/packages/a3/51/8a4a67a8174ce59cf49e816e38e9502900aea9b4af672d0127df8e10d3b0
> +PYTHON_HATCHLING_SITE = 
> https://files.pythonhosted.org/packages/8f/8a/cc1debe3514da292094f1c3a700e4ca25442489731ef7c0814358816bb03
>  PYTHON_HATCHLING_LICENSE = MIT
>  PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
>  PYTHON_HATCHLING_SETUP_TYPE = pep517
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
