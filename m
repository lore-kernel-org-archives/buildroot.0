Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300EDC6379F
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5F074059C;
	Thu,  9 Feb 2023 20:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5F074059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIlLqRnh1EOc; Thu,  9 Feb 2023 20:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E48D2401D2;
	Thu,  9 Feb 2023 20:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E48D2401D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B82C71BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 908F860F80
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 908F860F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rezLbYRLY5VP for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:30:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B018360F4D
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B018360F4D
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:30:48 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id m2so10047656ejb.8
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XtsqMp8aDoMuP/gbe6hQiPwplZSxGkJ++RE11GQL368=;
 b=esrFmnWwuYaBPwfSDVLfda8D/eszxpvREI37N2peTmjzUSZyjMKXIC0w5axcBYE8jN
 0gOagR5LCVk7QdGJkzmQYJFkit++ipHAm6CW2kYdGS3XwEEQaQquoMMw8UN+2WJBpyDD
 MlTgZBqnhn9Iqa8+tD1ZgmH3QTQWGzagZcGyEjdpLtLvPIFT9+0Fo1l0FN+PCU0t4YL4
 HfIzLK0SEvIk1bkpxPcd2apw4FC/lf73hEKRBt7y44n4pp8KL56sEm5dxImshh3FUD0Q
 lnCkxDq/d+/fEIYtwPUEKZ/fqsPOYmRsGJwi0ol7AP1jeRXbAujDL6JDZSrVbhnSUDFY
 LKLg==
X-Gm-Message-State: AO0yUKVDvxxpykPQUrObhbOQK59jRIA6F8YmFX0qMKmk24bm4sBHm5vZ
 ICttLmjpbKuF6r5edbgMjsawpA==
X-Google-Smtp-Source: AK7set8wd84pD6v1Ur/b4EU6Fl6QoxpPdrDHjmfCPmnLAl2buwoyeTuAtyG1f8tbbDn+FLR83xW7zA==
X-Received: by 2002:a17:907:9844:b0:888:9693:fb18 with SMTP id
 jj4-20020a170907984400b008889693fb18mr14487607ejc.37.1675974646905; 
 Thu, 09 Feb 2023 12:30:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170906660f00b00871075bfcfesm1315217ejp.133.2023.02.09.12.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:30:41 -0800 (PST)
Message-ID: <6a74619e-1750-d295-c6bc-ca93a5b47473@mind.be>
Date: Thu, 9 Feb 2023 21:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20230208094543.474237-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230208094543.474237-1-fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XtsqMp8aDoMuP/gbe6hQiPwplZSxGkJ++RE11GQL368=;
 b=gjNkYfzT/MzCwXttdlrf9fq9slAYr4RMbFlSOnJI0Lj51tlxO0hB5hN0YRuK27RaSY
 eWRvsNcq1yODcgt/arFW27392G6unEpOKD3ZwR/4n09wST7L+JlYKGmDzzG3DiyZ89De
 ioqAJbNd9qkz6TqInpa0wGkRd/McXyDJXi0LpI8M03QouKgzojTBjHGYOES4KcLZmcQJ
 KyJU+LXVCxXmg2kF+dskTCIpJgen5SNN/y2UvFhUboLLarm5jHEoDjw/mQVgUIMvmHMX
 YJeembmy6o95Bor1CXdXf6mHI8kAabhf5bXGYZiPIWY0jTjtz6GvM4dxqdAm2kzgKuiW
 33Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gjNkYfzT
Subject: Re: [Buildroot] [PATCH 1/1] lksctp-tools: bump to version 1.0.19
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/02/2023 10:45, Maxim Kochetkov via buildroot wrote:
> Release notes: https://github.com/sctp/lksctp-tools/blob/v1.0.19/ChangeLog
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks. Thank for testing, Maksim.

  Regards,
  Arnout

> ---
>   package/lksctp-tools/lksctp-tools.hash | 4 ++--
>   package/lksctp-tools/lksctp-tools.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lksctp-tools/lksctp-tools.hash b/package/lksctp-tools/lksctp-tools.hash
> index fb892fdc3b..b3a1f59d86 100644
> --- a/package/lksctp-tools/lksctp-tools.hash
> +++ b/package/lksctp-tools/lksctp-tools.hash
> @@ -1,6 +1,6 @@
>   # From https://sourceforge.net/projects/lksctp/files/lksctp-tools/
> -md5  68e9b8fa4d4e331029b247b72d46d7a5  lksctp-tools-1.0.17.tar.gz
> -sha1  941b0b5c39e364a971f514bba66120435660e518  lksctp-tools-1.0.17.tar.gz
> +md5  0fbb288c9f9625b88d3ab21c9ed9f011  lksctp-tools-1.0.19.tar.gz
> +sha1  d410a596485c38464177a38ae7c7081444e6589e  lksctp-tools-1.0.19.tar.gz
>   # Locally computed
>   sha256  dee5f35e583183abb9212938643ecb2d858fd89e2e286f4b1d903f65d49d6c76  COPYING.lib
>   sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING
> diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
> index 5ac794e842..af86a28516 100644
> --- a/package/lksctp-tools/lksctp-tools.mk
> +++ b/package/lksctp-tools/lksctp-tools.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LKSCTP_TOOLS_VERSION = 1.0.17
> -LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
> +LKSCTP_TOOLS_VERSION = 1.0.19
> +LKSCTP_TOOLS_SITE = $(call github,sctp,lksctp-tools,v$(LKSCTP_TOOLS_VERSION))
>   LKSCTP_TOOLS_INSTALL_STAGING = YES
>   # configure not shipped
>   LKSCTP_TOOLS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
