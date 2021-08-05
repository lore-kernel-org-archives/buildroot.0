Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39648C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:47:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B180610FD
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B180610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42569401CA;
	Thu,  5 Aug 2021 20:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fkmMc520M_bi; Thu,  5 Aug 2021 20:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46C1F40264;
	Thu,  5 Aug 2021 20:47:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAD9F1BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAE2060A79
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUwEzElFEVcr for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:47:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0645607AD
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:47:17 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i6so10254015edu.1
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i6UEZtIbhxxt6RKsREqwcagUG6py9XNmR+nhCa9tHaU=;
 b=Q9HzA0PNJCpA+JLNFYDS1lkDTLTENbiobv6dtLFn/4HX8zL4Kiq8q0tbocdlvFyccl
 X47yMVANlLPMei3nHOtAzqPiUWCCjBJrwMnvzGgW4CVevEfcYxUCUe4isE8Xch+qBLTu
 kc1gLecRj4tNILK0zN782JxkTQOptRGyQdxnhOkL2xcfKBJhv7LNBTfBG6bRhTHYYnNK
 q4TKVIpszC1H2rfPJTDYIIxptwWSat4N8ooFK7wi9QJZ/jAQjub2kb96l8kIkbNvCnO+
 2rCwktdwpJAilHJ3BQfg1lisVHR3aqWuzGqVdiodZhFxOAZo8U8OZGxqBbNg7kmvCprf
 5Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=i6UEZtIbhxxt6RKsREqwcagUG6py9XNmR+nhCa9tHaU=;
 b=TpuK4tuX78t7V93CmD+aj6o4dDrzpN5l7/mxEUo7nPcLVO4Zk5awauX5RZ6IWn72Pr
 KgIe+MwHX5LDm2OZWTv1lky3VUV2APtE/CZCZls6PJPVzNBaOOs6rVYd9eTYfmrFvzzW
 EyIZKJtKdNPw7IayQAcwWapvavwazh3bkgk/lDYKY8KK/im7ciiZpxa0rGk0FQbW5939
 7aAyzIKa2g2145V+MYXLlQiVA05uRz0qxx+hK8HVg+exqv1+9hze/7D5xGhd4fTnGCAx
 wIytw1xuoRiihuytCrBQFltFn5wOath61HyfmyjIkf/2+Z8FG4kl/Qo4aEK8qS/2fNFr
 ghNQ==
X-Gm-Message-State: AOAM531NwUgm5f9NHTxQ30BiYBZw3WdS7IfSCdlYjT0DC2WXcy5Ogk6T
 tuEAy0L63DeNtDv1zkLoUF95/g==
X-Google-Smtp-Source: ABdhPJwA0bla+Yf3z0GR02520Pwo1iWROPln5XSO5NDesIMA7EiaXNcGwtumySdOSET9DXMDCaeLSg==
X-Received: by 2002:a05:6402:1766:: with SMTP id
 da6mr8836116edb.322.1628196436156; 
 Thu, 05 Aug 2021 13:47:16 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id jy17sm2063693ejc.112.2021.08.05.13.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 13:47:15 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1624911306.git.yann.morin.1998@free.fr>
 <b507b09b429bd11c2cb524055e53e9cb9c128942.1624911306.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c4af5604-9af1-7117-2dfd-d75b3ab4cc39@mind.be>
Date: Thu, 5 Aug 2021 22:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b507b09b429bd11c2cb524055e53e9cb9c128942.1624911306.git.yann.morin.1998@free.fr>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/4 v5] support/misc/gitlab-ci.yml.in:
 templatise the make command
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 28/06/2021 22:15, Yann E. MORIN wrote:
> From: Romain Naour <romain.naour@gmail.com>
> 
> In a followup commit, the make command used to log and display the last
> lines on error will be used in another job.
> Factorize it by introducing .run_make template.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 Applied to next, thanks, and  the second one as well.

 Regards,
 Arnout

> ---
>  support/misc/gitlab-ci.yml.in | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index fcfff5c6aa..1ee3772154 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -26,20 +26,24 @@
>          paths:
>              - .config
>  
> +.run_make: &run_make
> +    |
> +      make O=${OUTPUT_DIR} > >(tee build.log |grep '>>>') 2>&1 || {
> +          echo 'Failed build last output'
> +          tail -200 build.log
> +          exit 1
> +      }
> +
>  .defconfig_base:
>      before_script:
>          - DEFCONFIG_NAME=${CI_JOB_NAME}
> +        - OUTPUT_DIR=output
>      script:
>          - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
>          - make ${DEFCONFIG_NAME}
>          - ./support/scripts/check-dotconfig.py .config ./configs/${DEFCONFIG_NAME}
>          - echo 'Build buildroot'
> -        - |
> -            make > >(tee build.log |grep '>>>') 2>&1 || {
> -                echo 'Failed build last output'
> -                tail -200 build.log
> -                exit 1
> -            }
> +        - *run_make
>          - |
>              ./support/scripts/boot-qemu-image.py "${DEFCONFIG_NAME}" > >(tee runtime-test.log) 2>&1 || {
>                  echo 'Failed runtime test last output'
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
