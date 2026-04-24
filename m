Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B297CFF8855
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 22:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16137812EC;
	Fri, 24 Apr 2026 22:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xifviVUQU3B; Fri, 24 Apr 2026 22:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 274E9812E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777069313;
	bh=4ohREdlCEiocEXdinRQ/VahDP35047N3gQat43w2ArE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=em6su/lLqPgKqc8yZOgPEMkrtzwXR9+hMbZrc1jFTfWlrQZU6Yvick97oNJgTxjh9
	 khbTUNQD/ikL98cg9OfppctR+TTPDwMphz52MWm4p5SOdCDqPwZA+8amNLZXLVH32N
	 fZK2rX1SRVr9aAZV6wmqQCsiR36cSdAWN7G+J1KRsHM/fleR3s3A53wyKOTOoxP3tE
	 /W2DIKUexfHQTV0ARwRRA24UKqd6GlRmtu2eCn5cYbnUzb8NGk+/cQDppAUxueMJvR
	 PSUNxIrys0v6YCUSpRM94Bq+jck8GfZi9DIL2lwbxp+RLplVaH3GrfcBew22yyIHbM
	 9S6YGxp2szYDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274E9812E6;
	Fri, 24 Apr 2026 22:21:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2205231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 22:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA5B840073
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 22:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Up03T825WN6p for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 22:21:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D181C401D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D181C401D2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D181C401D2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 22:21:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E46E813F89C;
 Sat, 25 Apr 2026 00:21:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Apr 2026 00:21:46 +0200
MIME-Version: 1.0
Date: Sat, 25 Apr 2026 00:21:46 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260412180902.86006-1-chakrabortyshubham66@gmail.com>
References: <20260412180902.86006-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <2db3b0332f053a90f0dff9717aa62359@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777069308;
 bh=M0H7uBrK3Iggx6B7cepuQkMN31a0VyuXheFZXzhF8uc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J+8/B5MxMbhkvDtACzk/SBaMAy4+N35KFzj+Q71xw0/i6OzGRTYU931teJPBYuB2U
 kCKx63/HOnoDv8bH3rnfYqcgUEgPb2/O9q9mQrJF8JRf9Mj2J0Zob/W/EdQc8tr21V
 c8fvYrvAw2ZCllKE+ClVGWX2YaBt4Kn/Zog+ZBbL39K3iHdrarU1Ogn/7S152bBnlk
 NAq82VnBuihqL8AvY8OhdI/7c3f3pTFq0W/lgTFKN+S6DZZmQi01n4AWbILvRFRJ+f
 8cgYiFOYM/yD+gRwxttvB/C5Dq+obABEkgxi6DtxvqY6UVF9Fnq6bu4GEWUvAx8IKb
 uSnUeA8Uk4xuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J+8/B5Mx
Subject: Re: [Buildroot] [PATCH] package/inotify-tools: bump to version
 4.25.9.0
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

Hi Shubham,

Thanks for the patch.

On 12/04/2026 20:09, Shubham Chakraborty wrote:
> - Fix crash on >=1024 watched files
> - Add recursive watch with --include
> - Add static compilation flag
> - Fix fanotify-only options when disabled
> - Fix man page reference formatting
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
[...]
> diff --git a/package/inotify-tools/inotify-tools.mk 
> b/package/inotify-tools/inotify-tools.mk
> index b410ade33d..75deddb697 100644
> --- a/package/inotify-tools/inotify-tools.mk
> +++ b/package/inotify-tools/inotify-tools.mk
> @@ -4,10 +4,11 @@
>  #
>  
> ################################################################################
> 
> -INOTIFY_TOOLS_VERSION = 3.20.2.2
> -INOTIFY_TOOLS_SITE = 
> https://github.com/inotify-tools/inotify-tools/releases/download/$(INOTIFY_TOOLS_VERSION)
> +INOTIFY_TOOLS_VERSION = 4.25.9.0

This new version is introducing build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2478551252

For reference, the previous version is fine:
https://gitlab.com/jolivain/buildroot/-/pipelines/2478553249

You can reproduce with the command:
utils/test-pkg -a -p inotify-tools

Could you have a look please?

> +INOTIFY_TOOLS_SITE = $(call 
> github,inotify-tools,inotify-tools,$(INOTIFY_TOOLS_VERSION))
>  INOTIFY_TOOLS_LICENSE = GPL-2.0+
>  INOTIFY_TOOLS_LICENSE_FILES = COPYING
>  INOTIFY_TOOLS_INSTALL_STAGING = YES
> +INOTIFY_TOOLS_AUTORECONF = YES
> 
>  $(eval $(autotools-package))
> --
> 2.53.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
