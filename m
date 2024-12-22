Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EECE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A9B605CB;
	Sun, 22 Dec 2024 14:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40QhKCXOw_4o; Sun, 22 Dec 2024 14:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8458960A58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8458960A58;
	Sun, 22 Dec 2024 14:11:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACC745E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A5F660A58
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfcdx78CW6ee for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8755A605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8755A605CB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8755A605CB
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:11:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 89116780504;
 Sun, 22 Dec 2024 15:11:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43048])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:11:20 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:11:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219020121.268522-1-james.hilliard1@gmail.com>
References: <20241219020121.268522-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <622f52b815be17bff4d1d73a5e2e6bca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876681;
 bh=Ojlhw1cUSav/+6/knuXyuo09x+s8h8xUuXG3nhtjOjc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W/xpkAP7jEsjltir82wSKJt2tRqQRuFPm79A6y46YSQpl80JfQ2TGWSHMcylppOYh
 byZ7ZWZ/gIoDPHZjTH1lxSB9hoZIGykKbBfM1dgQzebfyObdWASzOOZIzxhha15PT2
 1WhNs36fuOgb4LNYz1san7/fZTaZ7uwOH06EV1ASaj0t00IS7+INpLORYfk/IAxtuQ
 zStNNIihNcZFjGxYvUt0wvd8DpTUXNw3GKivwPyEaefTEVY/OmCFf0Z6hC4a0tsTRe
 uJiTz5jNj/kPNQOAM47EBiIiQtuisWQ2hnEaVCW2RIqx2v//qqy0Tx8ZR2y7MbSCt/
 Xflu8K2voOB3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W/xpkAP7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-httpx: bump to version
 0.28.1
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

On 19/12/2024 03:01, James Hilliard wrote:
> Drop no longer required python-sniffio runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-httpx/Config.in         | 1 -
>  package/python-httpx/python-httpx.hash | 4 ++--
>  package/python-httpx/python-httpx.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-httpx/Config.in 
> b/package/python-httpx/Config.in
> index 592cd559cd..0d20e6ca06 100644
> --- a/package/python-httpx/Config.in
> +++ b/package/python-httpx/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_HTTPX
>  	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
>  	select BR2_PACKAGE_PYTHON_HTTPCORE # runtime
>  	select BR2_PACKAGE_PYTHON_IDNA # runtime
> -	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
>  	help
>  	  The next generation HTTP client.
> 
> diff --git a/package/python-httpx/python-httpx.hash 
> b/package/python-httpx/python-httpx.hash
> index 3ffd491c9e..b2609c9b5c 100644
> --- a/package/python-httpx/python-httpx.hash
> +++ b/package/python-httpx/python-httpx.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/httpx/json
> -md5  f29763f29da610b185d2ca33937c572f  httpx-0.27.2.tar.gz
> -sha256  
> f7c2be1d2f3c3c3160d441802406b206c2b76f5947b11115e6df10c6c65e66c2  
> httpx-0.27.2.tar.gz
> +md5  774cf32b9cd94a44189fbe5871026664  httpx-0.28.1.tar.gz
> +sha256  
> 75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc  
> httpx-0.28.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  
> LICENSE.md
> diff --git a/package/python-httpx/python-httpx.mk 
> b/package/python-httpx/python-httpx.mk
> index 21bbd48a58..aef46a33bf 100644
> --- a/package/python-httpx/python-httpx.mk
> +++ b/package/python-httpx/python-httpx.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_HTTPX_VERSION = 0.27.2
> +PYTHON_HTTPX_VERSION = 0.28.1
>  PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
> -PYTHON_HTTPX_SITE = 
> https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6
> +PYTHON_HTTPX_SITE = 
> https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956
>  PYTHON_HTTPX_SETUP_TYPE = hatch
>  PYTHON_HTTPX_LICENSE = BSD-3-Clause
>  PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
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
