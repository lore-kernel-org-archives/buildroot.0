Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EB3C432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 13:26:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6C3961026
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 13:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6C3961026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FAA740286;
	Wed,  1 Sep 2021 13:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pT5uhUSpRBcs; Wed,  1 Sep 2021 13:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CBCE4028B;
	Wed,  1 Sep 2021 13:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB021BF3DC
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 13:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D8458291D
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 13:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHeqhGRh96VV for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 13:26:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0590E81CAF
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 13:26:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a25so6635428ejv.6
 for <buildroot@buildroot.org>; Wed, 01 Sep 2021 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pyr4lG+tQ2piXJOPlQe/5XriyneBKSqJyhukkPhbnlA=;
 b=DnXr3lhOEpBegHVVOyDsCJ5grk7dV+PuV//hv1LdqSyan85RwamvjCpaHQ3oflxS1F
 ZWYtwW5QJJja87AJha94JfowiBrjxlxlMlmoDRg6Lcw6281Dwrn5ZprfrOnWYIkgXh91
 mNZ5VIuGZ91CfAbtln7lep+KgRmLSdL3KIi7srvt9ByxXyzG9A8RMmr5JLd9NnBDMQxw
 4D085pGcv9vRut76sg90MnWwSzFpStAEBYWd6VZ4dlNC9fjtac62u0DfNIhSx7qct97g
 fLiJtbgzGMh9oPNeqyF5vcPGHHWf/7mmAWIz9WdJT9WWgr9TDF0waLttsppOJQIvxTad
 3Kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Pyr4lG+tQ2piXJOPlQe/5XriyneBKSqJyhukkPhbnlA=;
 b=gBlGW6el3joSTqob7eT63lyzAf7Bn8fG1tDvaTE21TLROhcrQ31dVCy2oBwlKKihpV
 VNv+lBMPp4EVksKqWI69hGGHw2G/thl91/HkRmatliIFmXORxAbv0iLscbSaQ/H5iqri
 yMvfrYsPMGVnCU6S1umFHbEaj7fBUzq8JQUD9sJhP66V9X0o+bATnNUjF/POqDurYbY8
 NEJsukd5qxEFtXvNsN4UxF2tHv6PjRz8QLkBO9UGfJpTzH5TDaJyfwy33GtkUg/Nv3Cd
 OMRGtBLRl7e+DRCdqVxEL2hLL1iFQCj+810fiHVjneCqCqPI9JshNcufgoYmc36FGkaU
 5HZQ==
X-Gm-Message-State: AOAM5334couGwFyzpbhXckpBnYL3beNRoiA0/aVovbMSNyI2a1+XSd7M
 gvPP64I3g6TtLZIlKnQamHDwtKucVCGjUQ==
X-Google-Smtp-Source: ABdhPJz5P/yCF/Txkffd27koWjqnF6aiNt745dv/UZ7PUTPhTEl35tkhboPOUsDMx5ODg+puSgGBug==
X-Received: by 2002:a17:907:3f91:: with SMTP id
 hr17mr36140258ejc.496.1630502786116; 
 Wed, 01 Sep 2021 06:26:26 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qq16sm2888138ejb.120.2021.09.01.06.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 06:26:25 -0700 (PDT)
To: Krzysztof Kanas <kkanas@fastmail.com>, buildroot@buildroot.org
References: <20210830201308.143849-1-kkanas@fastmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <57f575c2-ba73-a1b1-6074-88b772d1207e@mind.be>
Date: Wed, 1 Sep 2021 15:26:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830201308.143849-1-kkanas@fastmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1]
 package/environment-setup/environment-setup: add zsh
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



On 30/08/2021 22:13, Krzysztof Kanas wrote:
> environment-setup used BASH_SOURCE which is bash specific and empty
> variable for zsh (and other shell's).
> Use $0 which should be work across multiple shells(tcsh, dash, zsh)
> It won't work if other script is sourcing environment-setup.

 The environment-setup is supposed to be source'd, so how is this ever going to
work?

 I think the only viable solution is to require an argument if shell is not bash.

 Regards,
 Arnout

> 
> Signed-off-by: Krzysztof Kanas <kkanas@fastmail.com>
> ---
>  package/environment-setup/environment-setup | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
> index e9bc36fdd093..2b54e88d6689 100644
> --- a/package/environment-setup/environment-setup
> +++ b/package/environment-setup/environment-setup
> @@ -16,4 +16,8 @@ Some tips:
>  * To build CMake-based projects, use the "cmake" alias
>  
>  EOF
> -SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
> +if [ x"${BASH_SOURCE}" != x"" ]; then
> +        SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
> +else
> +	SDK_PATH=$(dirname $(realpath $0))
> +fi
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
