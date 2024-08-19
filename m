Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5727BC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1365F80B84;
	Mon, 19 Aug 2024 20:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oL8OanxdNklR; Mon, 19 Aug 2024 20:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05F7780DB8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05F7780DB8;
	Mon, 19 Aug 2024 20:12:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEEB71BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D52060834
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3Fo5jNE8NZQ for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:12:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BF56606FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF56606FA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BF56606FA
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:12:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AD0EF13F89A;
 Mon, 19 Aug 2024 22:12:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Aug 2024 22:12:02 +0200
Date: Mon, 19 Aug 2024 22:12:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZsOnEoUSwBXVlVG5@landeda>
References: <ZsORVO5sPhPtEjSN@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsORVO5sPhPtEjSN@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724098324;
 bh=xdU55xdFYCNLmx66dYIc4cSKDlyjO/Lz5GxFeeU5JaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=umUOPxEQTWvnSgqz5ITDzun72hnbAh64QdN9J9b4s7VYhWTFF7lc+YamGJkVIj0A6
 j4FKTDgj/Kpe3IBQSCOZJDX17JNKKcheKJQffJSYC2Z/v9lIRXcQWZ1MtyOqI2sXiR
 iASpBej2mIn/gSksliL/i80dF94zewP/yZ/tWDqCTo+wVI6lLVDgPkG5SM/jPbEmKX
 ySf6zBR81wE7e9HSjmz1OBF6XX49VqYPWv8114RwwBMxCRFXv8tFptnsbN9HRfHDlL
 tlkaNvsZBQiirsqCwHRjtxnBbZNtZVA3KOUdIWrAwL7OWIdbK2SSkv0f742pnGDQo8
 pT1HoS3G178IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=umUOPxEQ
Subject: Re: [Buildroot] [PATCH] package/botan: security update to 3.5.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2024-08-19 20:39 +0200, Waldemar Brodkorb spake thusly:
> See here for complete changelogs:
> https://botan.randombit.net/news.html#version-3-5-0-2024-07-08
> https://botan.randombit.net/news.html#version-3-4-0-2024-04-08
> 
> CVE-2024-34702: Fix a DoS caused by excessive name constraints. (GH
> 
> CVE-2024-39312: Fix a name constraint processing error, where if
> permitted and excluded rules both applied to a certificate, only the
> permitted rules would be checked.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, after adding the license hash explanation you later
provided, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/botan/botan.hash | 4 ++--
>  package/botan/botan.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/botan/botan.hash b/package/botan/botan.hash
> index 37e00ea9cc..d948271900 100644
> --- a/package/botan/botan.hash
> +++ b/package/botan/botan.hash
> @@ -1,4 +1,4 @@
>  # From https://botan.randombit.net/releases/sha256sums.txt
> -sha256  368f11f426f1205aedb9e9e32368a16535dc11bd60351066e6f6664ec36b85b9  Botan-3.3.0.tar.xz
> +sha256  67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f  Botan-3.5.0.tar.xz
>  # Locally computed
> -sha256  1833cde7c7cc03296b1ef2ddc178b1cd7fd1c476840f32cf6aedb09ab0bc9004  license.txt
> +sha256  db9168bdccaaea26557094436652577cc9bf43164e8be078d88aef1342fe4fb6  license.txt
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index e0bd258f57..561e7bf702 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BOTAN_VERSION = 3.3.0
> +BOTAN_VERSION = 3.5.0
>  BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
>  BOTAN_SITE = http://botan.randombit.net/releases
>  BOTAN_LICENSE = BSD-2-Clause
> -- 
> 2.30.2
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
