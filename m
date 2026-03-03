Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD8EDEBF0
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD29F606F0;
	Tue,  3 Mar 2026 20:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2dbtNKapsIA; Tue,  3 Mar 2026 20:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F10606DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568855;
	bh=Pa+RNquWp0pGfF2M/feG2D/Tgg3GCNmPBp8VkCL3xhU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rCNoJkZ+VvCLcFzskRlGcsg19pPYqxyw7Jj50UjV3Tb/sBDeY1WyA4uKBsD075L+4
	 Kl7Qr7nQoiqAYbzYEtEOYfgz7lfPkp/wIF+acvBJtB9LTc9ik5UTV8d347wSexVF26
	 K0U//Jm2EbSD+WeL32uwFoAn7VykRSi2tJA4NOrdkCcLdkmkxZfUsZ0nRiMqCxFD3Z
	 2vMGcqaeAjJdhQb4sPogRDnhUwNBY02Og751eNu4CqMAI950LC5AnoZRlRKW/wLm7L
	 1XBR46kUPHItr+kI025fj75YSd0qiRT7RyKLQcYL/CEwUNHNl8i88KLfbCFZFq5TmW
	 xHeE1o6aeR/mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F10606DE;
	Tue,  3 Mar 2026 20:14:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C440F1EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9FFC400DC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMdYrox4RZfy for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:14:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97FF14002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97FF14002D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97FF14002D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:14:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10FF0B97B552; Tue,  3 Mar 2026 21:14:09 +0100 (CET)
Message-ID: <1b273b3f-fff4-48fe-abe6-a27b2e958211@rnout.be>
Date: Tue, 3 Mar 2026 21:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
References: <20260208143604.1477756-1-ju.o@free.fr>
 <20260208143604.1477756-5-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260208143604.1477756-5-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1772568850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=v2xTb3KtvLfbQ9wDCf4Ur+gQeDMansky0RhC+IU925w=;
 b=asOinG6JRHqPj3XVls0eHz1y46+7Lho8GgPrHskJQZ5ekxa8HTplb6b0Z4i7fotcEbY64p
 gXPPOdAzSC7hW2YUcB67P7R3JJ1GnIW6PyPFTHVREkFL4uIpTm4IkCJx0RwSzsUFgLKh14
 MX8LtyweaBQQdTCL7xJJKcxnPHkkHC65Ig761KnyWL7LOqmzL+muy6z/XBcIffmPzWrMT/
 9RYA0zNSBHyjpDy2+UE4S8vVgOvqU0s1AFA3lMI15h9/MjYFBpiQUGjTe7DCrfDJ+7M3lT
 4HVrCBqv9njLAtAnowoudA9Cr9rs7nMkc7KmcIxTYIC3C50Cr5XInP4jBtbTdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=asOinG6J
Subject: Re: [Buildroot] [PATCH RFC 4/5] arch/Config.in: add
 BR2_SHOW_SECONDARY_TARGET_OPTIONS
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



On 08/02/2026 15:36, Julien Olivain wrote:
> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>   arch/Config.in | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index bdfc2b092c..e6b4fd040e 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -15,6 +15,27 @@ config BR2_USE_MMU
>   config BR2_ARCH_HAS_FDPIC_SUPPORT
>   	bool
>   
> +config BR2_SHOW_SECONDARY_TARGET_OPTIONS
> +	bool "Show secondary target options"
> +	default y
> +	depends on BR2_HIDE_SECONDARY_TARGET_OPTIONS != "y"

  Is it actually useful to have this as a user-visible option? I would simply 
use the environment option directly (depends on !BR2_HIDE_SECONDARY_TARGET_OPTIONS).

  Regards,
  Arnout

> +	help
> +	  Show secondary target options.
> +
> +	  When selected, this option shows all target options
> +	  available in Buildroot.
> +
> +	  Unselecting this option hides less common target CPU
> +	  architectures, architecture variants, CPUs or CPU options.
> +
> +	  This is primarily intended for random configuration
> +	  generation used in autobuilders. Using the command:
> +
> +	  BR2_HIDE_SECONDARY_TARGET_OPTIONS=y make randconfig
> +
> +	  generates a random configuration only using primary target
> +	  options.
> +
>   choice
>   	prompt "Target Architecture"
>   	default BR2_i386

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
