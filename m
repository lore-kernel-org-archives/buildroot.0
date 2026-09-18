Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D6C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DE540D77;
	Fri, 18 Sep 2026 13:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAjbG93wIpUj; Fri, 18 Sep 2026 13:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8EEB840D79
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736954;
	b=d/Ms5z7cRBsnXSDiFQCPYhgFJRSuufo0GpCP+SLAfG9WEJ3vexEK3TV/c4XK9D86FsvK
	 boG90Ju6IIprIdxiICh30lJkH9jyFmvke7k4fr/iZa7AOqFUu4kBSDf43nkl4xrIXraJK
	 AD91liGFuILKZmO4QD6fXeCwgEsEIeuv6WAi8LoGtT4sNec+hX09+X9YfjAYxwRRINvA5
	 cUy2cNsdsluiydfQm4dohE0R1r79eT5iuQ15wFJtPDblRdYMkDuZ5Vbu9vYSWd7N+tEyM
	 Yme3mJ1kkTRWtgEHENzBDpRDE81KyF87w7R8FDXlxVhkfVb/Y+chdHC3XQU7oimm6DQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/iIE1Hk4rqhlKW5pguC1YjcE2t8mlfld4OvlhJeQusk=;
	b=BhHuKrU0Oz+8MlCP9QWWMCcjpXLieo+/cp9ZUpttDvd4c3H6hPkxiD2KoIeQH5BnL1IL
	 8GvCPj121hpzyE9THsn32WzO4RpXPg9LiTEneZIlguCF7CRrJAzlVwPFUyhZMprGQaxMe
	 7248FnuVp+HBKnW9xUBHm0RacwbY31cF2nTNWWeebcbOi6zOyPMVZnWvj8aQzYJ+RZjoT
	 QiSWIhpCvZy60jiEu+Vg7OkG0gUwqWeWA/h8LuNhQ+wTMHlyXmwRr9vVKcMkLNhsnKOgx
	 8+dcoLJA9O0K+y3vKDp3X+CkzbYE7MEJWkf+4P4D8LAYddte294Ugvsvy4NF8fZO2vQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736954;
	bh=/iIE1Hk4rqhlKW5pguC1YjcE2t8mlfld4OvlhJeQusk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iM2EGxOtAwLiYl7pi5Ur/Yybwk6Z2SknApGzT7CopHv0/kWXfoll4+ptRTYLTFR51
	 EuF864//bTOMMGRsx1H6M0+TggeB49DoC5XL7c+1rULm9iH112zSi2UigXqxU8goxH
	 HLFaERr4faxw0DioieGM0OigAP/pup/1EVLe+BzpBEt6EjuVtL5w5J0ECvwuQxqD5U
	 PiTd09nBopGwdgIp31siKE1BpKW/bk1qjWsSLrj8f/M/upfjHSg8eUNjMEm1ueFpAh
	 kNYH/3Ctor7+lAHT5n7Gzqo2g6LwZj6a6x6TUbOGxrRe78tQBIsFAcYV2Gv/VCxQ1/
	 XjlsQVm1J+1yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EEB840D79;
	Fri, 18 Sep 2026 13:09:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02AC129B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0026F8116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29PjbIPEn6YC for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:09:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0B737811AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736949;
 b=DZaEi6+KhTuz6lyaFoEUnPrnDiN0/bwDehRYc4j12/6zyXwxKRAvnBtrwPOiC7EX4CQ+
 lASLzj+CGK8QIXRbZEl/AsM5f4GaLhU5XTUYftiwIMl/O4AO+jocspXbIACIFnijC+bSa
 G3wjIY1EUY3wPy4+eF8bvvUS3JjA86VgcseMjzY2ebGOKDvjdtpvND4XURn6+TDp2uh9J
 4vIu9U44K5llynqlfn2FPm1QoBCineVuldXK+bIdMA2Ri1Z/WBZwfPSGtTNqWq/wp+Njf
 2XUzP2Jq7Uv7cw6ZRxFDLrEaJn3Y/pgF2w+gt+ViZeANHgY6l4rXM+UgadLNt4uJ6WA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736949;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=u9ahMYRL/bXYbQbIR9Dyw4HSjRO8ba/+ol1cyAfsfvM=;
 b=pC0qX4o2FK97/z+2wxC6hpza31hWlsnkFaIWqd1OuHZxB40nlRm3qWtOTqSBpslu+hhy
 EpInrNCWh/5I6PVBfr+YMyfxJgrFu2f4HOUhCIF8lptCA27B/r9Qb1FgQuJ60Cae5pYDy
 L098j2u3h7MDq5rVcI1FY+16P6AYKi9FZpgbrpdFAxSYjOBSq0igk6ZZHZqygOd/tqxhN
 iWMxuTRj1WGdLoi7Ah9Gaf48Xd+GUTxpWv1lSZKMw01o6MJh0OOonBGskpU1heYWU5Huv
 7RphPlfVX6UNPPLt7kr/lQaYuxzlGqvJo7W63pfJExAK5o3lMHuRCfFoFR7+61BihMg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Iju7zozB; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B737811AC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:08 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso6247055e9.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736947; x=1790341747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=u9ahMYRL/bXYbQbIR9Dyw4HSjRO8ba/+ol1cyAfsfvM=;
 b=jE3Pw1TW14dPpCHiWecqDi5pK2FWd/5BKJmlz5aBly0PsXO7KK7kSbvUgh6QG5wlyX
 aLy8qTpbYNhlfCgBwblIqB3UsyU4MTHKls2Gi0WwVcUySUD+ZVySfc3o6zwdncsuMYrj
 tuKcz7G9mMIfdQKimJ+z1tXKfmqoSx8iPMTaGpeD0PK5hg6CNalVsBCosJGSr5Ln0BZ/
 EEO7hFhItynTk6bS/yyta2aFXtZwscac5OyRn4fXBWP3GIc1+oiItBhbjo2WYrSU7xep
 IN8unhGnDobbkrXiGCJreOY/1BmHqSiP0biIQqjjuiKfQoyLapc7tvtzo+lphndky0vk
 aoog==
X-Forwarded-Encrypted: i=1;
 AKwUvBxryN6bZB1rEsli1sE2278letWpEjBM9USvA+oH7CoHJHVfo3++645FKKefnKodAJSj6e5VCaJXIEA=@buildroot.org
X-Gm-Message-State: AFuF++mZGRt2s8tHXvopNWMfnyDxD8DtHtmKNtnTr2lHHVaVka34aVOG
 kYWGwMqWSmgda5U6PW+qg2W7EwQ7pegXvozFwf/CUMvnICqYg9MtKT4YTzu9YQ88Uy4j1LCsNvn
 Rl9TO
X-Gm-Gg: AYBFou3GtC2p0HSrsQ84n/n/BFm+IXC05DTqe3Drp+dewVeLjRsoeWs+OHWH4ynQmMr
 S9lH+Dd3t/Y9zvLaSZp1Lo6nBCxoHBzsD0eAf8gVJq+2cfjKWiQUAsctnbVXLl+TY/pbp1o9yTP
 Wx/l71Sm4DRVCSD3+AvLnLP6Gc10TNrO3jY0qYqa+M6a3qTqXlaDrK66HovO7LICYLcz88rxBGr
 oN5/4seXyyWSRA1BVOkA0e8OcPnUF5rTE896Pdadno46Mi8PjB0a+Zj+vfE1ljXujD9OOkZb3jL
 M1ZYFppmLLsHyF4W9UzkNlU5vJv3yVBKkB7bqtpTFAWr41Y4P9rb1xecDytbk7jg3ritsdS+8Xx
 fMuVMXYkg0ZTw4f0uHlvWToPpgRStjp2AbqSuk3c0f/E06l4sFUldPfxttSZ/Qt+UFtK97Saqwp
 mCdXk0kVDH+AgjXtCitSdH2gm7WwtNRjxFIzswdRPwGXyQzaYEPVV1R+7HIn+6WdWHMw==
X-Received: by 2002:a05:600c:c48e:b0:49c:dcec:bd27 with SMTP id
 5b1f17b1804b1-49fc5687122mr26725725e9.8.1789736947034; 
 Fri, 18 Sep 2026 06:09:07 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc6ca43edsm54488725e9.0.2026.09.18.06.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:09:06 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:09:06 +0200
Message-ID: <20260918130906.163052-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913165418.1693180-1-thomas.petazzoni@bootlin.com>
References: <20260913165418.1693180-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/webkit: fix kernel headers
 dependency due to seccomp select
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
> In commit
> 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
> version 2.5.3"), the kernel headers dependency of seccomp was bumped
> from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
> reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.
> 
> This commit fixes this inconsistency.
> 
> Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/webkitgtk/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 3a4c3ed792..cfb05fd0d3 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -87,7 +87,7 @@ config BR2_PACKAGE_WEBKITGTK_WAYLAND
>  config BR2_PACKAGE_WEBKITGTK_SANDBOX
>  	bool "sandboxing support"
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
>  	select BR2_PACKAGE_BUBBLEWRAP # runtime
>  	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
>  	select BR2_PACKAGE_LIBSECCOMP
> @@ -95,9 +95,9 @@ config BR2_PACKAGE_WEBKITGTK_SANDBOX
>  	  Enable sandboxing of the processes used for network operation,
>  	  disk access, and Web content rendering.
>  
> -comment "sandboxing support needs a toolchain w/ headers >= 3.12"
> +comment "sandboxing support needs a toolchain w/ headers >= 3.17"
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
>  
>  config BR2_PACKAGE_WEBKITGTK_HTTPS
>  	bool "HTTPS support"
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
