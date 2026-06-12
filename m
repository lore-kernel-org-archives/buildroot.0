Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED3CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A0C412FE;
	Fri, 12 Jun 2026 11:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imlafzQ2T57O; Fri, 12 Jun 2026 11:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B665A41378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264310;
	bh=JqtubefG9jLjsnBSuCzjM0vC0xdGIMORwAm4VaC7F7A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NX+4hoRDr1TLj+FiVa5hfa0gr1PpYNch1mOxSv945MK5iCk9dWNytEFpG+NwqOFiH
	 l37FuH5Q5tmY4DR31SerqwUDTWcux2LK7Tl8YCDFPJ7J2MpT5saBmOaVmMVFX/FRSs
	 IIwR65sNEFnUE+mpNYHyeJEzVv5vcqOS4g1Q4pOLA5U1Ws1ebu9T1g7AXXK+0HZ7xI
	 wKPNpEdHrAbTOU2fctlDD6YVAXTSZ0I4KzTB5df/AGqf/8O4moPDpLuqnxMlPXG+XY
	 CbSK2ZwtjdB+UM+UTaxDD0ZuPhIHCfTRxTW0kQORHvIFa2e4iG3X5QcVJ3CwrrKwFg
	 8xPwXmofRCZ+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B665A41378;
	Fri, 12 Jun 2026 11:38:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACD3E237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93543412B7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWCaJSgkKcR7 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8083E412A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8083E412A6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8083E412A6
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490b915ded5so8422635e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264294; x=1781869094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r6POKBOChMX3dQN3s4rbCD4q6WFyqssvfRvkn89+OGE=;
 b=dryAgsieQfzqOVe7vGVL23oQ47YhFN0GOVhD+M/RdboUY1Wp8rzLI9AdomPs7GiMIC
 EHFIR2AkwF8kqTqd554uSlooktrkPlZpb43FKCEakFIdBEJ0mvbOBu20xM0A5IJFsXEw
 GYuyY2HSXTmfIMP94un8rP2ea6NMh4gq7AT0XUnSfglLreJtZBzNkPwp61m0G+32lcWO
 gZR+OoFz7UdFDqyp9+yl/JT4vPzRPf2Zpely8EoV1fvILhm6ipTUHOOa5rOOZ+qeOyyl
 2KtHY6GK4Iob0t1y3FaTeZNCHyqGXOyhb8kR+WaLsyJizU8G+70Hwl/wm0VfzbZUbxE5
 iquA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9rOXpBw8maisrjLUp6cjtBsl/va7wRgE5cBlMb9BTS+NLMpRVV40btSMSZ8de9LpJ8TRag6zwDA+c=@buildroot.org
X-Gm-Message-State: AOJu0YytJPFhv/1Jeky35meyepXSeePahtwD216lo+SAZpyT0o3sXmi6
 fnImjrxe3UjssvKjRkrETItL095WSXi5oNAZ0Gz6rayxomgoAjieUbv3BaBXgflOeBc=
X-Gm-Gg: Acq92OGUiXi/TkQ8JNY0KUNtLS5UP5a8sSdMSVl4QNf3sqZrQgJXCe4DdpTIm+0Ng0M
 DTwZhNR5/d0UgQvJHbx5Xj3jiLYXkyvcLpJDTPI4qx2eCHyKwA1mSK25NxQhUMwgyxXBsOSsVhD
 YxQDCSCJltJAKXoEAcgAz/MDax3GUv3HmUTowIPUxqWZfWOCrIdZIF8psJIJKIk6Lft94WtiMsc
 fOu1MeIBBKFArRu888NvByDHlIT4Fu7qin+cSvT+JDaCQj/2lz9d5lp79MRFtpsIJSeLXHN3+9a
 CaVfTBpHYSvKcPNqAjBgC6nArfSGg2fnnlAzH3wFHigbVCoT+ki3kqw/UzBWuY19pFi3hZi0+L1
 koooFIqr1Il/RV6qND02ucr7BgSZsDD+rMGcuGBIe/kAQAbkt008YcOW/227CDUFo8hVr2SE2YC
 haz8ZPcWSfgnA5HeVQytIr4weP+w==
X-Received: by 2002:a05:600c:1f8c:b0:490:4b89:535f with SMTP id
 5b1f17b1804b1-490ec4d6192mr32503845e9.8.1781264294583; 
 Fri, 12 Jun 2026 04:38:14 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2cf5d9sm4400657f8f.32.2026.06.12.04.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:13 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:13 +0200
Message-ID: <20260612113813.253291-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603180728.1392826-1-giulio.benetti@benettiengineering.com>
References: <20260603180728.1392826-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264294; x=1781869094; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6POKBOChMX3dQN3s4rbCD4q6WFyqssvfRvkn89+OGE=;
 b=Pako7/Q6N9CCjkbaN3/iuxgZuKcHdcnZjHIKy3igrdbJeSs8VSFfipwmLWtbYqqU70
 cyWKu3OvrR1fr3kH8yZ+ujYQDeXKw2OZVCHLeQ9DuXIZPQl4v8QpYLmFrMYh6vUWLXp3
 tYHpn+OnGarcOG/Xmm0JBDmuoNLBcHlK7wvgQt9yDlXVY7XzjnTr43b5r5oiYt81mfwx
 hdWVtgtrLcsuladNhYPTiYl1VeXZRTR4+kVEEJ7TJEKx1XjBwqaMIxR+7W61a4nYsjPO
 mSU0baCqc5xGPLixvBCyWpKUrtfREqA1YTa1HLFNZJ5lUFOtorJ7in26l00i8VQohuOL
 jouw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Pako7/Q6
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: don't treat warnings as
 errors
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
> This driver fails to build because warnings are treated as errors but
> this is too strict, so let's disable this behavior by setting:
> KCFLAGS="-Wno-error"
> 
> Fixes:
> https://autobuild.buildroot.org/results/df3763e74de4071331a41140fb5528523af9e374/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/esp-hosted/esp-hosted.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
> index 3de8f24123..5cf6571481 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -29,5 +29,7 @@ else
>  ESP_HOSTED_MODULE_MAKE_OPTS = target=sdio
>  endif
>  
> +ESP_HOSTED_MODULE_MAKE_OPTS += KCFLAGS="-Wno-error"
> +
>  $(eval $(kernel-module))
>  $(eval $(generic-package))
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
