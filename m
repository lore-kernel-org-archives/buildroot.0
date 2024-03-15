Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872AFC54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5467460F91;
	Fri, 15 Mar 2024 19:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5z8EDcSgNyyg; Fri, 15 Mar 2024 19:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AAFB60F98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AAFB60F98;
	Fri, 15 Mar 2024 19:40:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16D421BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 002DE4193B
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3bQFCG1kRU4 for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB0014195D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB0014195D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB0014195D
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:40:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-412e784060cso21623525e9.1
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710531611; x=1711136411;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=twYLc5J+klR6tfot75h/ekCEBmbBsek/k/8//T6bwyY=;
 b=fOTWNeum6jqH7gzg/nOUdWJoTBTlK/Yk34zHYlzUwbpIAZvUZJl2LvFHsDhzxP8yP7
 EmZRswTj+BE7oprTlU5TkSF9J0F64BoyfbG542Wvw1cNd2OOJ0syHiHUjA/rokH/9kUf
 voBiqF7mBqkg/9deIQPF4nVlTeFW0LnP4q2XVCnHqtx04x0OAeigs5jRoas2e5ipFXtd
 QxGM+N50BoX0CxTk0F4lcRIqb/25ny7qPU3qs8f/YEfxY+c0/h8H39N75ceUQrGQC8ua
 FYCvoif+YyvL1nSVMYkbi9FsDjguezZdGRwus4W7+/OUGpyd5jPJc5zpPe/M67O+2h58
 2GvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+0IfJ0l3H6zYEonMweXuyNBhtVzJVyZeLpVVxkHFmEYrJzx0/4U9+FtWRtZB16r8tQmJ5t0A1Exa5UqxgF5aIUNbRZfgQ6A==
X-Gm-Message-State: AOJu0YxZo27dMxn534kGbZ56xaXp7RKLroJnhpojmhBBV35EXAFu1YOk
 ankGQS9MUivTDif0OlC/tj/zRAlI3GUhM3eSHNnqJhe2X25GGmJU6f9V1Ne2tPc=
X-Google-Smtp-Source: AGHT+IFN9g6OyvSW1KXX349ekVzyHCPAZr5G2qEGMcUI4VNwqlWDKHpB+tZi+K/pkhpUOtpoBqhfmw==
X-Received: by 2002:a05:600c:1547:b0:414:286:fd3c with SMTP id
 f7-20020a05600c154700b004140286fd3cmr2332281wmg.3.1710531610727; 
 Fri, 15 Mar 2024 12:40:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a5d69c6000000b0033e9f6997c7sm3815063wrw.66.2024.03.15.12.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:40:09 -0700 (PDT)
Message-ID: <de3a4253-0375-4b08-93af-fbcda29fe58f@mind.be>
Date: Fri, 15 Mar 2024 20:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240314214125.397970-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240314214125.397970-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710531611; x=1711136411; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=twYLc5J+klR6tfot75h/ekCEBmbBsek/k/8//T6bwyY=;
 b=fptRTRVeTEhQcV5SBGVtjZckEnf+mf3EIAPjmBXdTYKGJt6zSnBgf7ebQxsaq+LWBA
 eLGDzRaN5BiSMu/x0Evtg3GEu7kqEnHNiNE5WMx0CKABdpW2vDnm98++r361GSQTfkqf
 1fKJLWJefxxSwKVPU2LdLYo2lndwX2asb21NVkKfRMmP/GxIXNNhquJrLLsp5zZ8JQI1
 cc0YajvmCYK6w6QqNnXjgfP6U+dDLupK92bSUsuXWJRafKFjJx628AEdczIoFTMfijqX
 a2LiTd7ycuZKDMEze+wh0GXxsIvdjQPMq6aMTo/SMuIoFvtaaKhBJ9Weman5oQm4qPIN
 PUYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fptRTRVe
Subject: Re: [Buildroot] [PATCH 1/1] package/libnfs: fix pthread option
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



On 14/03/2024 22:41, Fabrice Fontaine wrote:
> Fix typo added by commit f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6
> 
> Fixes: f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnfs/libnfs.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
> index b013decfc7..19044527e0 100644
> --- a/package/libnfs/libnfs.mk
> +++ b/package/libnfs/libnfs.mk
> @@ -17,9 +17,9 @@ LIBNFS_DEPENDENCIES += libtirpc
>   endif
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -LIBNFS_CONF_OPTS += --enable-threads
> +LIBNFS_CONF_OPTS += --enable-pthread
>   else
> -LIBNFS_CONF_OPTS += --disable-threads
> +LIBNFS_CONF_OPTS += --disable-pthread
>   endif
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
