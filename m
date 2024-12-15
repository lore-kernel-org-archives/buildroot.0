Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0889BE7717F
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D0AA60860;
	Sun, 15 Dec 2024 15:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuNjcnlrylCj; Sun, 15 Dec 2024 15:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4962B60639
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4962B60639;
	Sun, 15 Dec 2024 15:18:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9C8CCE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C768960639
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSZH4n_xQUiO for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 15:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93C06605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C06605A9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93C06605A9
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 15:18:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6966719F5C2;
 Sun, 15 Dec 2024 16:18:17 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38778])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Dec 2024 16:18:17 +0100
MIME-Version: 1.0
Date: Sun, 15 Dec 2024 16:18:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241215122434.3906915-1-peter@korsgaard.com>
References: <20241215122434.3906915-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ff34af971b2ac98f05c9424474a5e748@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734275899;
 bh=KLKNy47O9YKhVXE6Xyaivx2oaV80vBFT2TFxFw8RqbQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qUAPQQWycKyrCDWI/H6wMkqzNSiwc4/BSwDrr09UPKiQD/OG9AXk3nFX/cst7pKWF
 RsFM8NLtrgeEvH4Eorx9lVFTAIIC/Q2XK3FPH2CmbmNeJdlJY8oiq+8rsEKU17h2vt
 EN1gP+lXRJ2DI/TbhCL62MlSop1G7QqCVQxh1KEv/1l0C4iXDp4lkF5JuDJySyZf79
 CbFOhxqfofYt0iDZ7jnFdmY20sk6pdlH8ufxhBCo6TqCB0pj/v8BkPMjylXmm8dA60
 Bzbj95TbcXe2ybGIOLrPaFCkvevPCIimCWLY6Lt529H0qKi2APi5yxAflaOK1VQTU+
 RYjnrpNjRvTbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qUAPQQWy
Subject: Re: [Buildroot] [PATCH] package/opensc: security bump to version
 0.26.0
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

On 15/12/2024 13:24, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> 0.25.0:
> 
> CVE-2023-5992: Side-channel leaks while stripping encryption PKCS#1.5
> padding in OpenSC
> https://github.com/OpenSC/OpenSC/wiki/CVE-2023-5992
> 
> CVE-2024-1454: Potential use-after-free in AuthentIC driver during card
> enrollment in pkcs15init
> https://github.com/OpenSC/OpenSC/wiki/CVE-2024-1454
> 
> 0.26.0:
> 
> CVE-2024-45615: Usage of uninitialized values in libopensc and 
> pkcs15init
> https://github.com/advisories/GHSA-3q68-hm47-94vg
> 
> CVE-2024-45616: Uninitialized values after incorrect check or usage of 
> APDU
> response values in libopensc
> https://github.com/advisories/GHSA-2mjg-798r-mxwh
> 
> CVE-2024-45617: Uninitialized values after incorrect or missing 
> checking
> return values of functions in libopensc
> https://github.com/advisories/GHSA-cf2w-h975-2fpg
> 
> CVE-2024-45618: Uninitialized values after incorrect or missing 
> checking
> return values of functions in pkcs15init
> https://github.com/advisories/GHSA-f2v6-mw6x-qmwc
> 
> CVE-2024-45619: Incorrect handling length of buffers or files in 
> libopensc
> https://github.com/advisories/GHSA-9vxw-3j77-cj78
> 
> CVE-2024-45620: Incorrect handling of the length of buffers or files in
> pkcs15init
> https://github.com/advisories/GHSA-9c2g-6v5v-57qg
> 
> CVE-2024-8443: Heap buffer overflow in OpenPGP driver when generating 
> key
> https://github.com/advisories/GHSA-mgc5-p43f-72pc
> 
> Release notes:
> https://github.com/OpenSC/OpenSC/releases/tag/0.26.0
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

> ---
>  package/opensc/opensc.hash | 2 +-
>  package/opensc/opensc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
> index 232222062c..e12d2d4bfa 100644
> --- a/package/opensc/opensc.hash
> +++ b/package/opensc/opensc.hash
> @@ -1,5 +1,5 @@
>  # Computed locally from 
> https://https://github.com/OpenSC/OpenSC/releases/
> -sha256  
> 24d03c69287291da32a30c4c38a304ad827f56cb85d83619e1f5403ab6480ef8  
> opensc-0.24.0.tar.gz
> +sha256  
> 837baead45e1505260d868871056150ede6e73d35460a470f2595a9e5e75f82b  
> opensc-0.26.0.tar.gz
> 
>  # Computed locally
>  sha256  
> 376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  
> COPYING
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> index 008de9d4c2..11d1507d45 100644
> --- a/package/opensc/opensc.mk
> +++ b/package/opensc/opensc.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -OPENSC_VERSION = 0.24.0
> +OPENSC_VERSION = 0.26.0
>  OPENSC_SITE = 
> https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
>  OPENSC_LICENSE = LGPL-2.1+
>  OPENSC_LICENSE_FILES = COPYING
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
