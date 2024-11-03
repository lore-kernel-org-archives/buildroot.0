Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7E5D1118E
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 19:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5DA406D6;
	Sun,  3 Nov 2024 19:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1P0XXaObvoop; Sun,  3 Nov 2024 19:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F3D406F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85F3D406F0;
	Sun,  3 Nov 2024 19:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06C9EB8
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E0F406F0
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfTbyqGIrAH5 for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 19:23:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB00A406D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB00A406D6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB00A406D6
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 19:23:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E94602003AE;
 Sun,  3 Nov 2024 20:23:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:32772])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Nov 2024 20:23:22 +0100
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 20:23:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241102232248.802676-1-giulio.benetti@benettiengineering.com>
References: <20241102232248.802676-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7ffce23a396df2b237e53b0c9f14f990@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730661804;
 bh=TC286qNKKk8Ib5jKywclnpHdZDWZCyEbeIrmBUoHKFg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fMddR8EqxLwALdDc+IyqNx3yPg3fctAtJDk17duLbGtQtZXtgwHHSrRQrI+d3U7xs
 RrP7FTEKQpBtiprVdF7Waw0jQhZCIMYwiCsiDn4F6gVenw/lyv3zpjbq83GW5Df9+P
 wY02+vivKwK5LMKDL81fqE0nl1Cy8whgepNyXBS82uSxBDTFBLTcnHVp75sjUDa7RT
 ojgsSAuogUwRTylaWcMa+/q6ssD1nVx/XA8TtlEocqi4ukyLpFPQL+blFEf949cXBE
 KaTh9yujXyJTjExZOC690tikXs8pJDVVxpSbaZC0lq7aH4QiwebBGNRyGAFQEZIpVr
 ybTh7R3A/IVHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fMddR8Eq
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.11
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

On 03/11/2024 00:22, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master. Thanks!

> ---
>  package/libnvme/libnvme.hash | 2 +-
>  package/libnvme/libnvme.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libnvme/libnvme.hash 
> b/package/libnvme/libnvme.hash
> index 05727f7cb3..5c221b7dce 100644
> --- a/package/libnvme/libnvme.hash
> +++ b/package/libnvme/libnvme.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated sha256 checksums
> -sha256  
> add9efa968e8341459fcaa2d96f2594a6f871e1fb3f57c02ce1c8ba5424f3960  
> libnvme-1.10.tar.gz
> +sha256  
> f6da60036b14e0427246718a32abff442228331f9ae3853f89160cf366d83dfe  
> libnvme-1.11.tar.gz
>  sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING
> diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
> index 93de76e83e..b1039265df 100644
> --- a/package/libnvme/libnvme.mk
> +++ b/package/libnvme/libnvme.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBNVME_VERSION = 1.10
> +LIBNVME_VERSION = 1.11
>  LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
>  LIBNVME_LICENSE = LGPL-2.1
>  LIBNVME_LICENSE_FILES = COPYING
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
