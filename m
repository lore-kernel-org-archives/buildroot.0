Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AF5E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1275280BF6;
	Fri, 27 Dec 2024 14:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDDzjyfTxmXi; Fri, 27 Dec 2024 14:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209B980883
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 209B980883;
	Fri, 27 Dec 2024 14:34:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7513BF1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 629EC60832
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kr2vVOR6mk0d for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B2CE6082B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2CE6082B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B2CE6082B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:33:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3272213F8CE;
 Fri, 27 Dec 2024 15:33:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:33:55 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:33:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223141628.1710361-1-james.hilliard1@gmail.com>
References: <20241223141628.1710361-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d9f53eb3eb791f0154d655bd4d701040@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310036;
 bh=OGqThVP7RW/BMtRPzrOp6tYbvzYkZY+4vtKjuQhUYsk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GtnIYAjq8dn4gcQ5vD/Msam0JiRCq+UFA6//zSJdpFbr1OdD6cYYaggcz2PzBN59Y
 dzwnaboim2bckZyxvjghC1Xw149NqtVlAx+sPRJ22snw/2gQDcqTM3uvjXIJa/fVO2
 fj/ZECOFD9L1WWWwprp+/PnCM9vzgwzucvAYxdx9Z71tLuHqYq9RdQAXfNKhNSFe+l
 bxxH2yklOws9Z4SaXa7EzejyqKeKaE8dGtsJw508X+l9sBR5d3Dz6qNaYAx9acUEv9
 BxD4i0jN15H5D/SEMaGfOeDXmuthz24RHodnmEE04eYPKTchMMdWPBWBG/1CFnYGDd
 UHeM7t6lOSPbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GtnIYAjq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohappyeyeballs: bump
 to version 2.4.4
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

On 23/12/2024 15:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
>  package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git 
> a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash 
> b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
> index 85938c1084..069dad89cf 100644
> --- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
> +++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
> -md5  dcc0ba52e3c350f4edc8a8475d1892d6  aiohappyeyeballs-2.4.3.tar.gz
> -sha256  
> 75cf88a15106a5002a8eb1dab212525c00d1f4c0fa96e551c9fbe6f09a621586  
> aiohappyeyeballs-2.4.3.tar.gz
> +md5  57d956f516c6558674f6248d8ba38321  aiohappyeyeballs-2.4.4.tar.gz
> +sha256  
> 5fdd7d87889c63183afc18ce9271f9b0a7d32c2303e394468dd45d514a757745  
> aiohappyeyeballs-2.4.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  
> LICENSE
> diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk 
> b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
> index 2a2c10fb37..9669b04793 100644
> --- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
> +++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.3
> +PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.4
>  PYTHON_AIOHAPPYEYEBALLS_SOURCE = 
> aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
> -PYTHON_AIOHAPPYEYEBALLS_SITE = 
> https://files.pythonhosted.org/packages/bc/69/2f6d5a019bd02e920a3417689a89887b39ad1e350b562f9955693d900c40
> +PYTHON_AIOHAPPYEYEBALLS_SITE = 
> https://files.pythonhosted.org/packages/7f/55/e4373e888fdacb15563ef6fa9fa8c8252476ea071e96fb46defac9f18bf2
>  PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = poetry
>  PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
>  PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
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
