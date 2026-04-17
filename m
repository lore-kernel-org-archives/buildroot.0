Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC3CF436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5E0981C21;
	Fri, 17 Apr 2026 15:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ev84tuiO-fvM; Fri, 17 Apr 2026 15:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA4B581C20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439536;
	bh=aCcbfx+YrjuktV6XNVRED6Q1KTi1eNmQgP7ptVnaduM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pQxNhzfLtWCfX5G6N6yGBVRQxg+vYF0m6iDI4NzGGJ5l4eEEey+IJbdXczO8ezdUZ
	 imN+jfyKAKFGiGqbSyJEbOX/PedViz3eu39pPeuEZiZw2MIFkwoHVLuiIC9RHqRpty
	 c5EeOjeajWI13iqL7LLChMVa/VP2vB63XGaZBAiNzIqLXq5WLDS2bLU2yKig2er3u1
	 CUCIrE04s+97Whnc6mWUlU7oL3VKxURizsYY2o2og9zt6v9AZubQnVhF1/FBQX+IyE
	 7EBv2ATMmhbUlUxdM85IBPuxYITqUl8ZiRpOq7bbN6/R78zU2cTpH8d9kDaAiiS8Ul
	 jNwXoDYWd/yEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA4B581C20;
	Fri, 17 Apr 2026 15:25:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9F66396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9068C81B70
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLbbPnqEHJJL for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87F4080B32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87F4080B32
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87F4080B32
 for <buildroot@busybox.net>; Fri, 17 Apr 2026 15:25:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43eb012ac4fso514237f8f.0
 for <buildroot@busybox.net>; Fri, 17 Apr 2026 08:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439529; x=1777044329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4381/RKjS2XXHfZNu6VQbQyaaUDLiXQ0lkQo8xIWZNI=;
 b=JGMR8EHOhOK1xZS+cjo0pVIGHvBje1jGT+e2YsbdTsRSHcFEAgdvbIJPLD5W0BtSZY
 VLObDFRCQHKl1Mr1ZGq2rvwvl86YOIcgX6aldakzPbAaTyxcs5FbCWjqgQmDOhhWNmtk
 JxHTuQje2yF9op8aTHq4fm/7SSLr6Z+jPbqmtAO+xh2ItSF732jhS1hxKtux+uxA5lj+
 A2iRd+9ElNzoywtHg0nctFRQdqIhe0MCK/e0CSlmLkqGDPFOf+Rpvywzyxc3f6fKtM08
 cf39QgQHCZNQLtF2LH6wpPTI3E+nwrTNN7gM4XbI6gkQ4DkoASMrUBLp2tCY5/gGgJQX
 6UCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/u1uocmLkg7qt37iALpYzjjo1WhNLotg+XFGuPdx9qYS/jFcWj5ZKEUG4ljmLny1fK24kIAGLXWI4=@busybox.net
X-Gm-Message-State: AOJu0YyVS0VCbAU+JWc+d0PbyqwT5I0J6SNQoRIj0Xc85N3oN4IAGg7/
 qMMEe83ULLqlo0KCz5F0EBuL7T59Nez3eM335Vl4/bUq0Q5JEe/3JXKmEcIf20i0xfoBfkEqjma
 UpfHq
X-Gm-Gg: AeBDies8GjMb+nBE1Jj+ddDJp37gHhVWaPJZdCYSM094UvqG1G5+OKpRl+gU1TRQjkc
 i41niVnGXGjzPGJvynE21Hdp72uBgmuSCi+J5Mk0Gb247GeCgyilThDszeqtp/MlI+2BNpr4j8V
 Ifmx3qep/eU4mumgjRw23bWnGAqE/4Jg88Vscd4HnWaIIRlSc1G1hAXIb3WjDva5oPr/4IB0xTg
 idGnLHcJlC6itzNjMVwYzNQk0N/lNDTL8dNioI6yQmwZpcBtkdyhKz9gn4Qtr9mq5AGMyPBzZLZ
 8UppaM2CjjbNkSKGwKvLjlOEh+PT2Vc4remP9q7YtpAguvY7aOtTq7+E7BbTiFMUAwccwA1DUvW
 skY/9k1ipMSXqW8QJxuTKRtQBNTPSeSpnpAVPLfe/Ieli9JDeK7t+J5bM0RF3ZOjQnQogQE+cyn
 tlQehoDtHy1n4qyIqNMIDSd9rmkys=
X-Received: by 2002:a5d:5d11:0:b0:43b:8858:1146 with SMTP id
 ffacd0b85a97d-43fe3e0fe61mr5153405f8f.41.1776439529503; 
 Fri, 17 Apr 2026 08:25:29 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d112sm5687559f8f.29.2026.04.17.08.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:29 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Fri, 17 Apr 2026 17:25:28 +0200
Message-ID: <20260417152528.314181-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407072208.8583-1-francois.perrad@gadz.org>
References: <20260407072208.8583-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439529; x=1777044329; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4381/RKjS2XXHfZNu6VQbQyaaUDLiXQ0lkQo8xIWZNI=;
 b=Nt+IfIx3YyMZQW1b3LLendVD1PWoe7VIeUg+P8cxifcESNKGslzEecr52oL2m8FVNO
 Iv46Sn9Uo/XfE/5AYqj7xEl2G63QiPdAjB6t5MYxeoV3k9QG6koBJZyMI48oqa2MJ1GJ
 VYwn3Xq4EoGt7BGDkj1vHvtTOVeqKSLkIUwAGRgCS/ps/w5mrixWNDmI6Z1tRxZNAZsA
 KFLQl+/KI+iKHe3N4Dqm03DiWJNtfRIXdQM/MPDn8I3vjNZ/6hdbn7T0CkLI9Ltw0pf8
 BlE6As1tUeCh2LS6jE5toPWOrSbID+GC9Hce71DbnU3bB6zBekC9AQ/ihai4q0ITSzNW
 SBdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Nt+IfIx3
Subject: Re: [Buildroot] [PATCH v2] package/quickjs: security bump to
 version 2025-09-13
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> fixes this serie of CVE:
> https://security-tracker.debian.org/tracker/CVE-2025-62490
> https://security-tracker.debian.org/tracker/CVE-2025-62491
> https://security-tracker.debian.org/tracker/CVE-2025-62492
> https://security-tracker.debian.org/tracker/CVE-2025-62493
> https://security-tracker.debian.org/tracker/CVE-2025-62494
> https://security-tracker.debian.org/tracker/CVE-2025-62495
> https://security-tracker.debian.org/tracker/CVE-2025-62496
> 
> For release notes, see:
> https://bellard.org/quickjs/Changelog
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/quickjs/Config.in    | 2 +-
>  package/quickjs/quickjs.hash | 2 +-
>  package/quickjs/quickjs.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
> index a59d46070..0ae0389b2 100644
> --- a/package/quickjs/Config.in
> +++ b/package/quickjs/Config.in
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_QUICKJS
>  	depends on BR2_USE_MMU # fork()
>  	help
>  	  QuickJS is a small and embeddable Javascript engine.
> -	  It supports the ES2020 specification including modules,
> +	  It supports the ES2023 specification including modules,
>  	  asynchronous generators, proxies and BigInt.
>  
>  	  https://bellard.org/quickjs/
> diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
> index 798c857a1..70dfb2d19 100644
> --- a/package/quickjs/quickjs.hash
> +++ b/package/quickjs/quickjs.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  2f20074c25166ef6f781f381c50d57b502cb85d470d639abccebbef7954c83bf  quickjs-2025-04-26.tar.xz
> +sha256  6f1f322aea3bb3a90858db85c9fe717013fde4df7dfcafe2f57e78f5bb4b4a0c  quickjs-2025-09-13.tar.xz
>  sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
> diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
> index e2170b297..511f14245 100644
> --- a/package/quickjs/quickjs.mk
> +++ b/package/quickjs/quickjs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QUICKJS_VERSION = 2025-04-26
> +QUICKJS_VERSION = 2025-09-13
>  QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
>  QUICKJS_SITE = https://bellard.org/quickjs
>  QUICKJS_LICENSE = MIT
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
