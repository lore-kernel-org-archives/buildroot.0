Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F4DCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4133E41E70;
	Fri,  5 Jun 2026 12:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AdWASjP6TVP; Fri,  5 Jun 2026 12:49:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 635D141E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663778;
	bh=Rl34euw5KfyLMtag6zb1epI8mXr2ffMvzfkRgqmH9ZY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dJobJexePibyhDuhd2rEDyuIWDBhPlbUl5ci4MRt6VXLI7Dj/5d6J8oXruLJ9MdMb
	 pQQGJwmeaTVUQX4o2JyGrg1qLzYKGaC4QFJ/lXer1m+dFMncpgJQdgDVRS6+yrzi5Z
	 Fpx54dRhSmPTXCHlLRsccxak9NZvfB93tOn82BRrOYbsMnhNazhjI0EEYaAI/k43DH
	 OFkmNC4mhNRmQfyznmqAZddAIqA4dSIdQkMaejcXxR3APMiKijKuFbMDqIUeI3qEsH
	 OIS6zNpenCxtADE/9lW2PWx7+ONJNAKP4abPEYMqCV15cXOg66vRv+coqYix04zcsv
	 X23pzXtYMe2gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635D141E9A;
	Fri,  5 Jun 2026 12:49:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3DCF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2389F41E70
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBqeznBc9Xim for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08473410DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08473410DF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08473410DF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso965357f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663771; x=1781268571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9LF/ZZkvVohlIIFDPeK9sbfeyDeE3UoSTteYNHkchek=;
 b=b44qNGvrf1JhTxcVKqAeGg2fsmcKTfRcXsDuGnozh2mZ9FSUh++TO3I0u/TMqZIil7
 op7LZacEq8MQx0tg9sUb3jaAYyZHUAP2y/QcCE4vDd2I4bFeySfFsZwch/zgJmDhTLf7
 fjMDdyflhvs7Kwg6C/5oLo8uuz/RvLFWsN+XzOt/K4dDDP6/JaNPt/VLhT2bueo0gWl6
 iu+EE7fdaVv07CKxsZt4MG9z10CywJ9tjpDkUJgA8mZyr+EqWtHq2nSrZEJHKPjG+ApE
 ca3iI9olSK9cDvE+qolJMxkGLNgTJ6Jxy5tuYQYwwR5e147kzrJOnzdaMis4OKBDMh3Q
 em9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8kwGTWbq7t/np10XZguUg50DHxE6QYxHhfZRCIe2mwdt7PDzlVjFFJ8eaSFph6sg+W7KbR/+o3bEo=@buildroot.org
X-Gm-Message-State: AOJu0YzaKpxaMFYr7x3hW4an+t+ZUFlr28sBWWxsnxgMXNo7eknv6HA5
 mQP7X7s2o9k+1E+PdubcvW/oUFL/OMVXWHCQQbifT1uatOf7tSrRGoTA1z+NhYbdkwnU+KYMjhr
 5Zcfc
X-Gm-Gg: Acq92OF5NtLLhZrvzEF2zBzA2NpQA3+3QPnIPPwwWNOTdiZYx+3PgDh5uO6kmQx+wak
 HBH39JoM1yjEsg0JcYYnm/BFvVvTJ3WHlVm+X7eyVh7PZg/psuRy3ktXKuXJZV+DaE4OL+DOvui
 GxKL3Yv5r0HXkjIYE/6umvhQ2bbW3cG3C4Cn5qm/2lTvRjn4rzHSYxrXMwn+97fOYvUl05KC1/g
 GlFxG2CLAKmQyGajTMgX7IYIT3jqVXlkn5f9zCv/O6o2AdprUh7NBYa1c0wwwQalIwpn6LcJlY6
 AqaY1NrpvEjVxjY1MistO8CQ7Mp+pqatu+0p5gfpnIvZXDUMPf48F4N9Ab4dy3pZCylnqGiQI9H
 p0th9YOnOCCmfrAZSq0tc2kA0E/lbxyhG8/4qUL5+r6ysUxQurJbHBRnjiX8d2AjZp1Of+wzCDe
 y1cp/8wPIYZ3egdXEYyVxh2uCSSg==
X-Received: by 2002:a05:6000:298e:10b0:45e:93ac:769e with SMTP id
 ffacd0b85a97d-460302dc502mr3932086f8f.6.1780663770928; 
 Fri, 05 Jun 2026 05:49:30 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35fd33sm27497917f8f.35.2026.06.05.05.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:30 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:30 +0200
Message-ID: <20260605124930.271416-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527184641.3533110-1-bernd@kuhls.net>
References: <20260527184641.3533110-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663771; x=1781268571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LF/ZZkvVohlIIFDPeK9sbfeyDeE3UoSTteYNHkchek=;
 b=CVifDsIquB1uhQHn6QD/HQqIBescZb2nvvI3ZuQg0vakxfR/kHLxC1DFIt5OrpCmDW
 Xkr5kfYeyj7FJU4PeX0cfyUxZlGTJcrXbfjtTTgXhZu9T7pqeGzDCj9vQB/u9gHTzbqd
 /ftErBoLVxjWQE8d6qmJGOTLFe2b5z0yJYZDIQdCg2xkt6C8bylxbFpHTBiNNYh6h8En
 hTxDgzLn/8YWwZ264yd63CvrT7XctIvTWLskjGLKfFRs+KkSSUHMZ2fiyNtkFqrnk6GI
 yCtRPzRo5/VqJm6Oexzl6nGl/Dwqi5zMTNUFKVhruKPK7RQM9zjGMKkPfNjwRcI9HExW
 N4Ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CVifDsIq
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ustream-ssl: needs OpenSSL
 ssl-trace
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
> Buildroot commit e1050a3a50886c72d3ff2416dd8db2fe3c389973 bumped the
> package which includes upstream commit
> https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=956fba242ac0a4bcfe3db103d4d1f41545c924fb
> that adds the usage of SSL_trace causing a build error when OpenSSL was
> built without ssl-trace support:
> 
> /home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:
>  In function '__ustream_ssl_set_debug':
> /home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:490:44:
>  error: 'SSL_trace' undeclared (first use in this function); did you mean 'SSL_write'?
>   490 |         SSL_CTX_set_msg_callback(ctx->ssl, SSL_trace);
> 
> Fixes:
> https://autobuild.buildroot.net/results/17c/17c88282c32f2edfa0991e0e10cb45013c947be9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
> v2: added result of Gitlab pipeline
>     https://gitlab.com/bkuhls/buildroot/-/pipelines/2556948372
> 
>  package/ustream-ssl/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
> index c328a6ea12..6fc54f3bef 100644
> --- a/package/ustream-ssl/Config.in
> +++ b/package/ustream-ssl/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_USTREAM_SSL
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
>  	select BR2_PACKAGE_LIBUBOX
>  	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  ustream SSL wrapper
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
