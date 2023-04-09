Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B4DC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8D260FE1;
	Sun,  9 Apr 2023 21:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D8D260FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PI03teSLRYF9; Sun,  9 Apr 2023 21:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACBC660FC1;
	Sun,  9 Apr 2023 21:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACBC660FC1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 639D71BF3F3
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A7FA81F7D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A7FA81F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJb3vTyCHv9c for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:05:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8055F81F60
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8055F81F60
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:05:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id q5so1931525wmo.4
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681074313;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJhW70SLWhg1yU/XB3b8m/txlAvVRAR+mZ24FXc9mZE=;
 b=CnES5qXWBqjuxRL5oK+kWCSM9FGN3f9zlZWvMi3vjdTM3qvx/8TmvdDXV/Etbq0xb1
 6zbSaCen2YNenDqrUKNMrUR1pDzQRK6dXf5me3NSXAz8wkC9g8FeeqPQA5Cs9ErPc6/j
 6OyvFisMnhQSq+AoLpr9f1DbILztiWkJrvBW7ToORdHUpVOIscyO0P18StyHJT33uASd
 R85LRyva37ZOT2Z1c8oO2K1Zk0wot6ZKeOcbAD/4Jcw5CxoZ95HsfXjt8mH1XG7L1Uof
 JuCMfKmkvcejkDpSBnYvnPxCsRCNP4CgKDSM/kZxHn2EjbqXrW45XcqS2OGxKUuY1COm
 ouLw==
X-Gm-Message-State: AAQBX9eoRBmZ7dTf09cX5Mur/oFjuhgNoq6Vi3VbzfH8Y+mTqIc7kMCq
 tL17jnXGAvasDt77pTFe+wp3weEJHzzoJ5oS9Tg=
X-Google-Smtp-Source: AKy350bRGtCwdDnbbZoxSf32eVQ7LobXaAfYlkTBB1zkbAiv9edMw1iLGhbT6N+jnOrZpST9/shr4A==
X-Received: by 2002:a7b:cb86:0:b0:3ed:cf2a:3fe8 with SMTP id
 m6-20020a7bcb86000000b003edcf2a3fe8mr6548013wmi.8.1681074313684; 
 Sun, 09 Apr 2023 14:05:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a6-20020adfdd06000000b002da76acfee1sm10024204wrm.28.2023.04.09.14.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 14:05:13 -0700 (PDT)
Message-ID: <f252b03a-19af-c490-0011-e978091e21aa@mind.be>
Date: Sun, 9 Apr 2023 23:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-16-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220724054912.2354219-16-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681074313;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RJhW70SLWhg1yU/XB3b8m/txlAvVRAR+mZ24FXc9mZE=;
 b=NThXcGjMx/u1/y2rADCID0VLzwrsQNwrhctUDBi6bjvwRoW0zhr6rdfl+L/cdEqhC9
 Db2/Fzcy/0Izordgbw1RqBALIPWeJmb8yL5c5oIbDKyE5ziTOOywkZMMRqksegneFZG1
 3DJamcjATqdBgD93QBwmA8hzZe9OLCcla+IzJWoDDwoOla6IxSNUIZgxN+XsOQz1OFc3
 RlJ5z1C5m5FQLFQTrqBa5dzxPMbfgIDdTof4HBXRx2wIX/Qu/NF1TSwxBWzsZ2tiKojv
 CZl6kpQVQXzvRoOtYSfI330uPVh8IBG2JaJHHusPJTisQT2lvGwof4nydsNB2422F9Jr
 mrYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NThXcGjM
Subject: Re: [Buildroot] [PATCH 15/16] utils/docker-run: fix shellcheck
 warnings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 07:49, Ricardo Martincoski wrote:
> SC2046: Quote this to prevent word splitting.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

  I hadn't noticed this patch when I applied the beginning of the series, and 
instead fixed docker-run myself (and pushed directly). Therefore, marked as 
superseded.

  Regards,
  Arnout

> ---
>   .checkpackageignore | 1 -
>   utils/docker-run    | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 8f9ab48674..6f1a838562 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1077,5 +1077,4 @@ toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-
>   toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash HashSpaces
>   utils/brmake Shellcheck
>   utils/config Shellcheck
> -utils/docker-run Shellcheck
>   utils/test-pkg Shellcheck
> diff --git a/utils/docker-run b/utils/docker-run
> index 5653764254..f42dc33d0e 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -7,7 +7,7 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
>           sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
>   
>   exec docker run -it --rm \
> -    --user $(id -u):$(id -g) \
> +    --user "$(id -u)":"$(id -g)" \
>       --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
>       --workdir "${MAIN_DIR}" \
>       "${IMAGE}" "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
