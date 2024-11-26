Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1943CD6554C
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 18:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBAC74ECB1;
	Tue, 26 Nov 2024 18:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrl0DxeJKQRV; Tue, 26 Nov 2024 18:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F214ECB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F214ECB8;
	Tue, 26 Nov 2024 18:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB0901DA8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4786853AD
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9h5jZGBwKid for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 18:39:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8154845E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8154845E5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8154845E5
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:39:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0D978B00565;
 Tue, 26 Nov 2024 19:39:18 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47346])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Nov 2024 19:39:18 +0100
MIME-Version: 1.0
Date: Tue, 26 Nov 2024 19:39:18 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241125083722.1051132-1-peter@korsgaard.com>
References: <20241125083722.1051132-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e9ca17328ad25d8f17389d2f00dff885@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732646360;
 bh=5feBoRnvPojMMF59CMMzgTlyXiHmoz9L86opFIaVhCI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pcR1gFj/sUquQdow28IvKpIquWy1zq7XH3lo7dJVqaavKYMhV5F4u23GnYEYOKe7i
 wKBW54lnKXsawnTfvjtigbNnR/ph4NNNPSKWk7hmbrWx0Zjq3C7oFvBYBVbf9iDG69
 qPXy8P7zay8iYkEjfkn7Rdy3x1MwyMmAf6gdABDRCBTJPt3vwI3IKYxOF+wMhYfAf7
 qlpE6QRAvlSgXQAmV7lO4pBnvJ0sWFsUCGes+iwK6G5xck4JPUdh6h6NDCdIKUdxEh
 muUkcSQIjfmNCvfSOahxAzgwZQr2LSTsTs71FPkeP9dNacDPpJAe8L26TwuqM9hOEf
 t4epV6XjVCdYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pcR1gFj/
Subject: Re: [Buildroot] [PATCH-NEXT 1/3] package/openocd: drop non-existing
 libhid support
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

On 25/11/2024 09:37, Peter Korsgaard wrote:
> This was added by commit aa441aa84c38a (openocd: bump to version 0.8.0) 
> ~10
> years ago, but openocd 0.8.0 (or any later version) does not contain 
> any
> libhid support, so drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to next, thanks.

> ---
>  package/openocd/openocd.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 6b9f5541cd..78f872fa76 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -55,7 +55,6 @@ OPENOCD_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
>  	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
>  	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
> -	$(if $(BR2_PACKAGE_LIBHID),libhid) \
>  	$(if $(BR2_PACKAGE_HIDAPI),hidapi)
> 
>  ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
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
