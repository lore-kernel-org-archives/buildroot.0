Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EF3C432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 13:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9422061026
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 13:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9422061026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64CB9606F5;
	Wed,  1 Sep 2021 13:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtRGfp9pk8tE; Wed,  1 Sep 2021 13:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EB4B606F8;
	Wed,  1 Sep 2021 13:27:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 786511BF3DC
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 13:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6830B8293D
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 13:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFx_tPkkzpNC for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 13:27:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3156F8293F
 for <buildroot@busybox.net>; Wed,  1 Sep 2021 13:27:14 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id n11so3745741edv.11
 for <buildroot@busybox.net>; Wed, 01 Sep 2021 06:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rg1iJz3LKX4DFsTC7RgrczQMogtt6d+hueExKuqY/Uw=;
 b=gaYWYHqFYAEnuK/PoErHp1vkexKbDYY2FTKwxTba6KGX3nWDx8MNyFH4FJX2fHBqGa
 CAB9Z//Htjq/fnH3ploXGW7Kywh4OnVoPNf/vTnVidNowN8Hydjy+2IZuqGR+uOB3gdV
 GKgjnYarbh74F3H3lo2+74xYfBPyQE0MqW42Py4NtXFWfkK8Cj0Daid1rpTgxzMTcfPN
 hYxeGdnzntksysuBG1IvwOvGmnUSCG4R7lifkTacOmfsGIJcP+LBsuWqh0t4eTc9Y1hk
 y+1VEUDnqzqNLRiLKwkWl16LOnnC+NMGlGUeNJcgtsYGlRNB3vtdQ9hUYZYvlqfGlwxf
 EfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rg1iJz3LKX4DFsTC7RgrczQMogtt6d+hueExKuqY/Uw=;
 b=dK92MGlPl4LLJkxFkupM6vX4E7VRktNTccj+NnDKMGxhUItCY8/v21wobgOYrO5M6a
 YeHGTLEbuTJxMulPdkv8v7onNN/jNQDtUpMkVmSW90uH39qowOv1KB/dQRzpcjkG8zI/
 oNySlupfmX4tsCva4Z6vcTOF55Ofz301AlcC4V4oFoEQ+T5bNgGJ7RlGASpdAGRDVLDz
 YFxWziSWU/TuYv/cdX+x18zuNS1jrkcz5jSXnpVXveG5JJYmCwrytmNRItfPsIDuGm9L
 N8odM+qLOKmJGagsJYnExPXepG1WFEb+EqNDf9hKz0PfED5lEFXEsrYeyrAZlQ/X+fJd
 b+3g==
X-Gm-Message-State: AOAM530sQO6J45w+TiX/FAcGJ+yPgK4dvJwHVoJ6JPCPf45EUFFudxTN
 iuQnKubavXa0rzwkJPpRXvsQJgieg7YVxQ==
X-Google-Smtp-Source: ABdhPJxKQ47lkmW+aOq+5ZMKWd/lgG6bsueZgaqE0P8/hRaS1rXUXnwxxRON7wTMz9tsJAADqTPqcA==
X-Received: by 2002:a05:6402:2302:: with SMTP id
 l2mr35509537eda.13.1630502832477; 
 Wed, 01 Sep 2021 06:27:12 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x15sm9802415ejc.59.2021.09.01.06.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 06:27:12 -0700 (PDT)
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210831170030.887874-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <592f2bf4-7f2c-2727-ba91-919ccdbb4776@mind.be>
Date: Wed, 1 Sep 2021 15:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831170030.887874-1-francois.perrad@gadz.org>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: prefer stable
 version from release-monitoring.org
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 31/08/2021 19:00, Francois Perrad wrote:
> for example with libpng: 1.6.37 instead of 1.7.0beta89
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/pkg-stats | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index cc91d1316..773c90ddd 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -484,7 +484,7 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
>                  return False
>  
>              data = await resp.json()
> -            version = data['version'] if 'version' in data else None
> +            version = data['stable_versions'][0] if 'stable_versions' in data else None

 Shouldn't we fall back on 'version' if 'stable_version' is not in data?

 Regards,
 Arnout

>              check_package_latest_version_set_status(pkg,
>                                                      RM_API_STATUS_FOUND_BY_DISTRO,
>                                                      version,
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
