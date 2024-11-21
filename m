Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA4CE64039
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 22:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D024080EF8;
	Thu, 21 Nov 2024 22:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTFqRSSizRvj; Thu, 21 Nov 2024 22:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E65DB80EFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E65DB80EFB;
	Thu, 21 Nov 2024 22:44:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72DD3B69
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 22:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61BD680EF8
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 22:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fR0zhrCuAnYw for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 22:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50BF180A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50BF180A53
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50BF180A53
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 22:44:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C8DDBB0053E;
 Thu, 21 Nov 2024 23:44:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59004])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 21 Nov 2024 23:44:27 +0100
MIME-Version: 1.0
Date: Thu, 21 Nov 2024 23:44:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241112230536.1211360-1-giulio.benetti@benettiengineering.com>
References: <20241112230536.1211360-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7ed8eb8983853af757ebe338e9054c71@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732229068;
 bh=ZJSXgOy2XLJHhR2RGHwWGxgmWHTcgbDS3Hc0Eo2QKmw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kzPRm8xmZK/EJHyDlFTOvI9erp1HoFQAGTk7HBDaaxCOOJOnMZWwio6Gt4ESqQMHf
 JHhNvqJfln0EIvGQbekfIJxVn5/OdPuJQA971f8E4yA809HCDahQylJAP2kacbxuzz
 MiT/xPnI2KItO7o5DtxzE01CIkqI++PLRSEghuhm4CdkWODno7+sxHcbYkAtWZG1jM
 Dpc6pvl+Uip12FtfYE+yz2vDQLS2FDpYPDvkg1dbdOtz1zS7k51nbg6gujvw7Ph0+b
 91Y0+/EyZFEaMHWduYSIUNiGMjf9nCwLU8ZnQhPifnZYo2sMSvovFGYdA04O0Q3RlC
 1lZ5xs+ZjhL8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kzPRm8xm
Subject: Re: [Buildroot] [PATCH] package/libblockdev: bump to version 3.2.1
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

On 13/11/2024 00:05, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

> ---
>  package/libblockdev/libblockdev.hash | 2 +-
>  package/libblockdev/libblockdev.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libblockdev/libblockdev.hash 
> b/package/libblockdev/libblockdev.hash
> index 9cc3817870..1466c88451 100644
> --- a/package/libblockdev/libblockdev.hash
> +++ b/package/libblockdev/libblockdev.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> f2918de9ce1b54ac1aee5e5757e555947896a74674cdca9d05940a53d19e32a8  
> libblockdev-3.2.0.tar.gz
> +sha256  
> 318b9e2cedfdfe88161f28079fcb63239aeb5592223f4485b861cfc6ef11189a  
> libblockdev-3.2.1.tar.gz
>  sha256  
> 97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  
> LICENSE
> diff --git a/package/libblockdev/libblockdev.mk 
> b/package/libblockdev/libblockdev.mk
> index 6232f243b1..4cac905666 100644
> --- a/package/libblockdev/libblockdev.mk
> +++ b/package/libblockdev/libblockdev.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBBLOCKDEV_VERSION = 3.2.0
> +LIBBLOCKDEV_VERSION = 3.2.1
>  LIBBLOCKDEV_SITE = 
> https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
>  LIBBLOCKDEV_LICENSE = LGPL-2.1
>  LIBBLOCKDEV_LICENSE_FILES = LICENSE
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
