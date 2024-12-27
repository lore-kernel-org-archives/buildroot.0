Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B05E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF7B607A8;
	Fri, 27 Dec 2024 14:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8Bfq0Ee1Nuv; Fri, 27 Dec 2024 14:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F410D607CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F410D607CF;
	Fri, 27 Dec 2024 14:37:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7840BF1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58619402B5
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Omsziec6YeBX for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:37:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E70440282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E70440282
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E70440282
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:37:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 33528B0053D;
 Fri, 27 Dec 2024 15:37:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:37:07 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:37:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223151052.1726594-1-james.hilliard1@gmail.com>
References: <20241223151052.1726594-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9e605e5503fc2f1c5773da406d7f4e89@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310228;
 bh=gJHxPV8bO03xgn3OTlV8PswZrDdW4dX3U7LdgFxR9eA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MSXF0rlphhGKcvfExboA+KBUBKIKZ27zCejWSnMSNZEJ8wVNoFxmP2iqRXthEfFET
 ch29HCSnnH2nLi9WJ8Phk0LiQetdzIWDqkc71qqMYv4ZtgDqvCRkQAJI0nWh3jXZJY
 vPzQdyFw9FQxrxhpmUEgba+zQwu5F4PhG2JKm4P9AiwYluZx/2hhUPc6jip5iLAGT+
 mQtRUzOi/clCbImslYNT2IDxyxFhh7iwBxFKnJvMknICIsjY/iuJsiahggjBTmY1OZ
 6T/tkDeriJKLOQCTRSiIQI4zIwQ8K7JoHEy02UaAovSw6MqYlpwqNF+alytcjGNXOD
 VWRGR0bKWZmxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MSXF0rlp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argcomplete: bump to
 version 3.5.2
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

On 23/12/2024 16:10, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-argcomplete/python-argcomplete.hash | 4 ++--
>  package/python-argcomplete/python-argcomplete.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-argcomplete/python-argcomplete.hash 
> b/package/python-argcomplete/python-argcomplete.hash
> index 73ee60f268..82b22673ee 100644
> --- a/package/python-argcomplete/python-argcomplete.hash
> +++ b/package/python-argcomplete/python-argcomplete.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/argcomplete/json
> -md5  d41f3c39f4be81d29bb6166e8e57116a  argcomplete-3.5.1.tar.gz
> -sha256  
> eb1ee355aa2557bd3d0145de7b06b2a45b0ce461e1e7813f5d066039ab4177b4  
> argcomplete-3.5.1.tar.gz
> +md5  947144ffafe463aed8c8eb97bc981d11  argcomplete-3.5.2.tar.gz
> +sha256  
> 23146ed7ac4403b70bd6026402468942ceba34a6732255b9edf5b7354f68a6bb  
> argcomplete-3.5.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  
> LICENSE.rst
> diff --git a/package/python-argcomplete/python-argcomplete.mk 
> b/package/python-argcomplete/python-argcomplete.mk
> index 0118cbb9d6..bbf4031c5f 100644
> --- a/package/python-argcomplete/python-argcomplete.mk
> +++ b/package/python-argcomplete/python-argcomplete.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_ARGCOMPLETE_VERSION = 3.5.1
> +PYTHON_ARGCOMPLETE_VERSION = 3.5.2
>  PYTHON_ARGCOMPLETE_SOURCE = 
> argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
> -PYTHON_ARGCOMPLETE_SITE = 
> https://files.pythonhosted.org/packages/5f/39/27605e133e7f4bb0c8e48c9a6b87101515e3446003e0442761f6a02ac35e
> +PYTHON_ARGCOMPLETE_SITE = 
> https://files.pythonhosted.org/packages/7f/03/581b1c29d88fffaa08abbced2e628c34dd92d32f1adaed7e42fc416938b0
>  PYTHON_ARGCOMPLETE_SETUP_TYPE = setuptools
>  PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
>  PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
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
