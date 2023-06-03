Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C6C7EE24
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F271F41DD9;
	Sat,  3 Jun 2023 19:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F271F41DD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bS-s0RPmJ1oj; Sat,  3 Jun 2023 19:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA81B41DD2;
	Sat,  3 Jun 2023 19:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA81B41DD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5431BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84AB1841F6
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84AB1841F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObUKHffQXuCp for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:22:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93AF383925
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93AF383925
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:22:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-96fd3a658eeso481177866b.1
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685820163; x=1688412163;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CnWSLInxxt0aHk3ciVso6++CJL3Uv97rebsZWOkuFgY=;
 b=PUPLL+GodmpdM/WIF8sJU5k1TRh1ALcj3CDp8LJlbBk4HtKqOsDCNHcA4AiApLXhf/
 FdVKlSsSyYlpXfWzJ03NntYTnR1KlerZ56yjcWdVk7rR5ynf4SP2MR3xPwaSEIkJgIiK
 Loy/cD1A1dTX/ZXxnCKg//kQUQOOg/rd+2R8yy3D4jpoL9YAx60Ht/5TPDMHJt0PlqU7
 pYrmpIhgS6rdzXhTadSs2UN3uHRbGMm+RfNLLb1adC5/+H4rqyXwPAd697RPiCVo0P1k
 1Ncjdc2hdotE3LYLnLaBsu0FTC5Yz5oxYplnkJyfYTPWks85EwxMLXQHsiwxw9weakxM
 k50A==
X-Gm-Message-State: AC+VfDyJyH8BpqBHhejFkoGsPYwu+AIrM2k0Y+ww1DaGqk1YPl9JIih5
 ZXEjJEiBCyL0nTBoFMqlpCie9g==
X-Google-Smtp-Source: ACHHUZ7Cjnk0QpBrv5m319DZEaM+VSRmzooqr4h3Vn8XT+lag8yra6Zvsdhp14NnvPAF5YzF5QxVoQ==
X-Received: by 2002:a17:907:26ca:b0:96a:3119:ac0 with SMTP id
 bp10-20020a17090726ca00b0096a31190ac0mr1747823ejc.69.1685820162768; 
 Sat, 03 Jun 2023 12:22:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bv2-20020a170906b1c200b009659ad1072fsm2238589ejb.113.2023.06.03.12.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:22:42 -0700 (PDT)
Message-ID: <d6699948-1f51-a5ee-4b29-779f25ebccca@mind.be>
Date: Sat, 3 Jun 2023 21:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230523162506.1279813-1-bernd.kuhls@t-online.de>
In-Reply-To: <20230523162506.1279813-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685820163; x=1688412163;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CnWSLInxxt0aHk3ciVso6++CJL3Uv97rebsZWOkuFgY=;
 b=Xk1kbxuC2fL3q+IpZur5VTMXVccbWjvJEYXR7Q5PrZEARzXVDfkVK2iuu40JwZga98
 gZplVgHinhGtDxAd/0CYzjQB2B/ppVGEvYjVL1kNZ5GkOwoFpQm2YqvfmmhHHzU6qsk2
 9iugwAqG304youkc5C8Erm1stcbC7BdxZkhr8kc69p+3SJWIvgm59C48Iyg2RFzJ2ly+
 mzPc/CQRBXeLV1h8zLYbuw2uTsfvYewEAVk1CupJ+l92OCY3tTzxFdIck0g7j/Sh6EJt
 9pBEmIolVorweCzk94q545kH8bMaADmrz15me66NYxDzMTSgj5FAdws3xjzmWdbDd/Fj
 iz1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xk1kbxuC
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-skin-confluence: bump
 version to Nexus branch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/05/2023 18:25, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> This bump was forgotten when Kodi was bumped to version 20.1-Nexus,
> please included it into the master branch as it contains various
> fixed needed for Nexus:
> https://github.com/xbmc/skin.confluence/commits/Nexus
> 
>   package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
>   package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
> index c840e5b161..449a2113de 100644
> --- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  c57b9a303ad1ebf14ad487901e5da15eba7b3a40304046974fad1d64fb7b8b57  kodi-skin-confluence-e6d31bc84eea73a04b2a23358929d5276be832b8.tar.gz
> +sha256  1d55079d2b021b16ae8494497684abab184a86302426af588655577a641074ac  kodi-skin-confluence-a155597cb6bb0f9d46b26ad881be1148929a03af.tar.gz
>   sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> index c32718fd10..43d0c4bff6 100644
> --- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_SKIN_CONFLUENCE_VERSION = e6d31bc84eea73a04b2a23358929d5276be832b8
> +KODI_SKIN_CONFLUENCE_VERSION = a155597cb6bb0f9d46b26ad881be1148929a03af
>   KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
>   KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
>   KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
