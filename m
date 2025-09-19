Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFBACAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3932F823E3;
	Fri, 19 Sep 2025 12:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-2GSgDbG7wk; Fri, 19 Sep 2025 12:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 605EE827A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 605EE827A8;
	Fri, 19 Sep 2025 12:55:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 577F1D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DD06822BC
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6gB0QB35Bm5 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AC468108C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AC468108C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AC468108C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:55:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1FC1DB9781B2; Fri, 19 Sep 2025 14:55:44 +0200 (CEST)
Message-ID: <e5df4920-0669-4c4b-9e74-27b1579569ba@rnout.be>
Date: Fri, 19 Sep 2025 14:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250917144053.350712-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250917144053.350712-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1758286546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GhSGioMpun/tNowj2bQCj9/ZvPDhWS5mf5Lpvht+OIQ=;
 b=Q31htt3xmNnjbRHlRLhYO0hLn7u4d09PA4huBvQ6coZfTMmXyvXs5aomWS29/xgVcAiiTi
 DpAHi4Rl343Hk6SL/BvHfxkXVYRpzgCPg8KqSDv1amlYrA/4FRBugsXKGvf5rq1vjrLcNh
 1Na2UIF2bAYbRBrvZUyNyX2BsQirQXYAFbn4t6GPK3qVWlHDo8EhOu+bD+4g3HjvD2yKDT
 PxbPuALDSYKjeRSgEgpw6VOs2gelzju1FqIl6697kgkab2jByY+n+CeG9tM74WK9GXiK1D
 zS34TLDfAa/eFa8QeHh3JZbiqtkN72FlAj7igrXEBc19+CRq/9nMtehFg3DaIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Q31htt3x
Subject: Re: [Buildroot] [PATCH for 2025.{02,
 05}.x] package/samba4: bump to v4.21.8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2025 16:40, Titouan Christophe via buildroot wrote:
> See the release notes
> https://www.samba.org/samba/history/samba-4.21.8.html
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/samba4/samba4.hash | 4 ++--
>   package/samba4/samba4.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 21e5b6c9e8..9fff75bcb4 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.21.7.tar.asc
> -sha256  a395414ee573ef3f5313b274d463866356a53acc7b5e48fb9b5ad83c6ad4a265  samba-4.21.7.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.21.8.tar.asc
> +sha256  e78c36653a37e9647513e5408fc8052375901560d36b8744cd21acc9e4d91fc8  samba-4.21.8.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index e5aa0ce31a..7895ec4a4c 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SAMBA4_VERSION = 4.21.7
> +SAMBA4_VERSION = 4.21.8
>   SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>   SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>   SAMBA4_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
