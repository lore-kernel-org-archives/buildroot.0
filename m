Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7E1E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E73F583C82;
	Thu, 21 Sep 2023 18:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E73F583C82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHiMf5UO66wq; Thu, 21 Sep 2023 18:37:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49D7F83C7C;
	Thu, 21 Sep 2023 18:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D7F83C7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A33141BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B7C94206B
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B7C94206B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvBdJrUWOYJt for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:36:57 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E904742033
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E904742033
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9a648f9d8e3so169228366b.1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695321415; x=1695926215;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rCxtZ4xXRB+LgspGCJJ7awV81b+FM/RRaAYYkLXPvzI=;
 b=UhkHdaXhr2VvqgsqkDc1KQHG+g6NvJCQa9FuacrwU6WbDVjIt5WLdruHd7ZYYmw/bV
 YIaPw6htmMMo0tMS+dAgL4cSjRsfSoneL0HdtP0lh4rxL5nVdi0LDCaO09sC32jbw1I+
 64L8EPY+TyNjJxCTAoA4pvul+cQFuQOBP3yAvytqahS2oosxOOWMfe/9rZHxkOCyI24g
 tGDf69LEjT2OGGmkvGeJEFy0Yp501s/NpmFK85fR8QLBUxMGR5vX9ghAs9o4jke3Y9+x
 Y7IuraoAXakBV/uoFHija1TlMZ4yHBvSuxHIq3EnmwCf6NdXhcfNGl2HAG5mdX7K3Db0
 aDWQ==
X-Gm-Message-State: AOJu0YzvuUbi0bEKHCm7wqlkB7Z/7wxIe9OlMrSwj2U9JgDf9w7w+Ihu
 dYj6sph39kRLIAnRcbgHTYLHiw==
X-Google-Smtp-Source: AGHT+IE7GmPurIVwbFjT2zSyqHCJo/LwNNVyKe4ZWUDfB1Z09SXdvW6lIKVcqgSXYilIq0WEBa7Rpw==
X-Received: by 2002:a17:906:3044:b0:99c:55a9:3925 with SMTP id
 d4-20020a170906304400b0099c55a93925mr5652587ejd.24.1695321414995; 
 Thu, 21 Sep 2023 11:36:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a170906444200b0099cb0a7098dsm1448696ejp.19.2023.09.21.11.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:36:54 -0700 (PDT)
Message-ID: <93a823bc-ef0f-3934-fc71-5fc3befb3c45@mind.be>
Date: Thu, 21 Sep 2023 20:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230921041518.72066-2-dalang@gmx.at>
In-Reply-To: <20230921041518.72066-2-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695321415; x=1695926215; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rCxtZ4xXRB+LgspGCJJ7awV81b+FM/RRaAYYkLXPvzI=;
 b=Zj0JSh4gQk7zuE9l7X2/3WVOWkIj7r4zFYrm+USD+cfykrkWCgxsUSTJUGIa6i+UXL
 AlX84GjL9U8dA0mKoFEhmPWe26LcL4z684fENIjOuwaG3uQxLJXn3z0+6f8UMpuJd+7q
 w5LS3PJSFpR7rHz+yWWIXk93J+8rI7HLRUlogfRWV6Ru6ex/k+De5OeR8dLWN16oItnr
 /bjba3q3E1dfnSYVVCzPtu0TBdLUHu4ljLEqfS35LqMwG/jnyj0hIU/Ni4T5FZFBuZg2
 /qV2KkKjZshV8gvMQP48/1HzGwhw0WuHejbOUb5BYzKSQ0UOfu4cPCfl1f4bzpOYNuYj
 u5Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Zj0JSh4g
Subject: Re: [Buildroot] [PATCH] package/sysstat: drop CVE-2022-39377 from
 IGNORE_CVES
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/09/2023 06:15, Daniel Lang wrote:
> As off 2022-11-22 CVE-2022-39377 is listed as affecting sysstat
> < 2.16.1 instead of < 2.17.1.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to master, thanks.

  Because of Thomas's comment, I've extended the commit message with "The text 
is not updated, but the CPE info is." Probably not enough to address his concern 
though. The thing is, the comment itself was a bit confusing: the original CPE 
info said "Up to (excluding) 12.7.1" and that has been corrected to 12.6.1. So 
indeed, the CVE info is currently correct.

  Regards,
  Arnout

> ---
>   package/sysstat/sysstat.mk | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> index eaf505dc49..377396d986 100644
> --- a/package/sysstat/sysstat.mk
> +++ b/package/sysstat/sysstat.mk
> @@ -14,9 +14,6 @@ SYSSTAT_LICENSE_FILES = COPYING
>   SYSSTAT_CPE_ID_VENDOR = sysstat_project
>   SYSSTAT_SELINUX_MODULES = sysstat
>   
> -# NVD is not up-to-date; 12.6.1 includes c1e631eddc50, which fixes the issue
> -SYSSTAT_IGNORE_CVES += CVE-2022-39377
> -
>   ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
>   SYSSTAT_DEPENDENCIES += lm-sensors
>   SYSSTAT_CONF_OPTS += --enable-sensors
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
