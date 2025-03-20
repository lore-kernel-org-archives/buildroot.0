Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8B8C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA84404E2;
	Thu, 20 Mar 2025 21:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90KaAMc4zHlu; Thu, 20 Mar 2025 21:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7314039A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7314039A;
	Thu, 20 Mar 2025 21:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 849DD12F
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A8FC835D9
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liHUrM89Hqjz for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 21:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3381A835D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3381A835D3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3381A835D3
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 21:36:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B35795FF95;
 Thu, 20 Mar 2025 22:36:27 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 22:36:27 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 22:36:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250319101645.1387015-1-adam.duskett@amarulasolutions.com>
References: <20250319101645.1387015-1-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7a574ea0f01f2bd1152b14ae84c1a1c4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742506589;
 bh=vubKCp8czMAGEAwm4jdnrEj17r8t8q3ydKwf6R+zGw8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=irJ/ds508MmfUxK1jV1J3YjJlOw3Wdfhf0uDgoF/KhVAGNjhGFSkfaM7anwcok3UD
 lFIN3zaFFOA7VSaE1WNeorvuUFCqvtKeTxEjPMBPLwzvsI8pewCQAM7iK1aBXdBkE7
 CRxcmOE9BT4+FGUs4cd5vgotMmvFXPlqSlVB5B9bbYNpdeKQezxQZA+rn+9U9Y50Gp
 uluLd1LfDQlBgcZZx+BwtkECpkNrOAldIdWveAfex7z67j5nln6qBYDKhWzJ0a0/7t
 X3Oz8G2fHsuxE/swm7iZkPMkA5EB/wgA94S41nW0OeDKGJ6Mi30A88143waUAeOTcZ
 nItzPZP8baN2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=irJ/ds50
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: bump to version 4.0.0
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

Hi Adam,

Thank you for the patch!

Could you add in the commit log a link to the release note, for ex:
"""
For release note, see:
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.0.0-relnotes.txt
"""

On 19/03/2025 11:16, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[...]
> diff --git a/package/libressl/libressl.mk 
> b/package/libressl/libressl.mk
> index 7e92ea3a11..e4d22ce82c 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBRESSL_VERSION = 3.9.2
> +LIBRESSL_VERSION = 4.0.0

Also, this bump seems to introduce build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1727272934

As a reference, the previous version works fine (at least
in "test-pkg -a"). See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1727267801

Having a quick look at the release note, we can see:
"The mips32 platform is no longer actively supported."

>  LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>  LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original 
> OpenSSL code)
>  LIBRESSL_LICENSE_FILES = COPYING

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
