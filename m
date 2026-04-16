Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91020F8D76E
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 19:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B409840A80;
	Thu, 16 Apr 2026 19:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmaAZVMhgpM9; Thu, 16 Apr 2026 19:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BA0E40981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776367256;
	bh=/kTbgCFB2Yksz1I/ZzMBx6oJefCGfYqJnlyBEqVblgQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ETngP7T//80TPi/lQwQKJCjb8FvKBSc2YNbshSIFXfzZMhCIOGDl/Odfo+MGQYvAI
	 gSvKqBgZtEBauk/EMpJideeqharGQ0LKqLPZyhhzS+RMFQ5MCe9agw8rfFIvBq2U6a
	 pDPlt3grzW++mX3HmQYpLhC2gjAow5tWq6Om28k8lNk5357xNH4HpF/txBuiEHww6s
	 JKhljjWTyaf3mxYLuR2WKXpHMKA171V012fjZtdglgN4WL8C6geFiflybCz0yWqtgX
	 BzEL80FC3dCGkpzW8CQtxXbvtCN/tzK+HU6E58QBGqef2IyoLFeqW8NFrHg3LVE4qj
	 SVB7TdGuWI86A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA0E40981;
	Thu, 16 Apr 2026 19:20:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E5DC2F4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 230D640979
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUJVvoRC-yq6 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 19:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F09CD40976
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09CD40976
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F09CD40976
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:20:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9D9F219F576;
 Thu, 16 Apr 2026 21:20:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Apr 2026 21:20:46 +0200
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 21:20:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Will Newton <will.newton@gmail.com>
In-Reply-To: <20260416073548.3605471-1-bernd@kuhls.net>
References: <20260416073548.3605471-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7dc56b3f17298f000bd9be7f7a9f20df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776367250;
 bh=aK39SJXgEhkUplFb2VzHK1qkzxELcRsOwcykYVGY1A4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=anUvH5ksnZh37yngqDOohhLN4Gyo2wZRNUl23i/MGsVW3XtOLxjXdQGgXJtN+z+IX
 TYHyO0LWrIWJmShpsK9l8a4V/yj4XTYzMeaWP7fn5/QciQ276UTOh3mLwrMHkBxDx/
 UI5D26BQoEwIglS8fUsRdpscbIkKSgXVuAyEOKy5eYOKrri/RMg683CO8xQL2ukY+f
 GDe4v7bEtsvJq+eTQw3GdRAS1UylkyhfbXUVFu79nMiVzDY25Gu3WY/90sIT4zmC6e
 mgy9rrLWXfUOzhoKWOsg0FQATgEKMSQLMXIURH3F6MUZ1DAdH0Ql13sGGey8QKM0P0
 Qu4fUpbkgUzmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=anUvH5ks
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: security bump
 version to 1.0.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 16/04/2026 09:35, Bernd Kuhls wrote:
> https://fossies.org/linux/libmicrohttpd/NEWS
> 
> Fixes CWE-444: https://cwe.mitre.org/data/definitions/444.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libmicrohttpd/libmicrohttpd.hash | 2 +-
>  package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libmicrohttpd/libmicrohttpd.hash 
> b/package/libmicrohttpd/libmicrohttpd.hash
> index bd5d0b3e8b..41b370015b 100644
> --- a/package/libmicrohttpd/libmicrohttpd.hash
> +++ b/package/libmicrohttpd/libmicrohttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  
> libmicrohttpd-1.0.3.tar.gz
> +sha256  
> d72e5cfccd62bf2f79252edbc3828eeedc088ce71fc47b7c9e3bd7246b3d54de  
> libmicrohttpd-1.0.4.tar.gz
>  sha256  
> 7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  
> COPYING
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk 
> b/package/libmicrohttpd/libmicrohttpd.mk
> index b74a7a1338..49b5d4b0f5 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBMICROHTTPD_VERSION = 1.0.3
> +LIBMICROHTTPD_VERSION = 1.0.4

There was no announce for this 1.04 release. And it seems there is
already a new 1.0.5 security bump available:
https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00003.html

Could you send a new patch bumping directly to 1.0.5 please?

>  LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
>  LIBMICROHTTPD_LICENSE_FILES = COPYING
>  LIBMICROHTTPD_CPE_ID_VENDOR = gnu
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
