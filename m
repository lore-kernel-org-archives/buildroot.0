Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B18D1BDED
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47F3440082;
	Mon,  4 Nov 2024 20:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IH-z3jC482so; Mon,  4 Nov 2024 20:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECDEE40090
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECDEE40090;
	Mon,  4 Nov 2024 20:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F45DB8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F95D80AC9
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uW_afzIGVdVj for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB1E980C17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB1E980C17
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB1E980C17
 for <buildroot@busybox.net>; Mon,  4 Nov 2024 20:21:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4AFDAB0055E;
 Mon,  4 Nov 2024 21:21:21 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57752])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 04 Nov 2024 21:21:21 +0100
MIME-Version: 1.0
Date: Mon, 04 Nov 2024 21:21:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20241104195835.1057296-1-francois.perrad@gadz.org>
References: <20241104195835.1057296-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <f59778b2f9ccb6c3c97dccf65059ed60@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730751682;
 bh=DXFCnNVNFTaEs31KIZ41rJ97IlqldbUeaEQR1VwsJxk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q+am6CcTA/4g5tf/hhcmbnqP30hGBq6+gmVP7gjFSkzCJiut2rC84dg56DYlqBLNF
 /6r/8/c9DzHr+url63KyVqfpkvA0knNim0oQ431ejjvOUM1af1dY+FpaTkqnt/H61u
 i5gzB+2fs46FGgh7CHDQEUUDFuWrnQiPwbkwWC76+cF/2zBcj7LrzpN2ovbSMiSDh3
 oUi9y3sIz+gKoKPErgL5KUw57FSd9c+ymYe4js1xUfwJrhQms3PYoOEAYhA4PvExJa
 JURsLAmhYYUcMNuAMl25WfIZReA/WEgBsGs3RzN6XDZU8jZnrbGhrh1d2ODic9mJyc
 Zb3NZiunXY1kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Q+am6CcT
Subject: Re: [Buildroot] [PATCH] package/gnupg2: bump to version 2.4.6
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

On 04/11/2024 20:58, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master. Thanks!

> ---
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index 8bb64c9ed..e16a3f491 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  ae0935ead29a2dfa34d6b48d70808652bc3ca73b  gnupg-2.4.5.tar.bz2
> -sha256  
> f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277  
> gnupg-2.4.5.tar.bz2
> +sha1  2d8aa2662c398d60f1f8e0bf46fd163eae703189  gnupg-2.4.6.tar.bz2
> +sha256  
> 95acfafda7004924a6f5c901677f15ac1bda2754511d973bb4523e8dd840e17a  
> gnupg-2.4.6.tar.bz2
>  # Locally calculated
>  sha256  
> bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  
> COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index d38aaeec1..f1a8e9917 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GNUPG2_VERSION = 2.4.5
> +GNUPG2_VERSION = 2.4.6
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
