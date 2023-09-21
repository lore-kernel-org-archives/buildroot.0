Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C050E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8CD881B70;
	Thu, 21 Sep 2023 18:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8CD881B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEL2a9zQsgRx; Thu, 21 Sep 2023 18:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C81B83C77;
	Thu, 21 Sep 2023 18:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C81B83C77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1C961BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77E5483C84
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E5483C84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCOGnYuSqHou for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:23:58 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2362D83C77
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2362D83C77
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53087f0e18bso1498846a12.3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695320636; x=1695925436;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YzPxUtIbHXX+ODjxNSsozzp6RRtdpR0l/xY/xT7YzV4=;
 b=HzxwFxIXymtaydG1yAgcIjk6QPbSb6GyuK6MPQj6G5VbSyH6DQQmOQGT8kApIz4Ssi
 E8HWuue105UwZ76rZOsSzBlur2qoh9K/msfAMFre1wV5wPDm6n0/sOOH+N43OaFK0maO
 k6jeqcIwBKjquQypucH4G1iI70P7duyd36UxD3jvFhb5oEKmUld6ivMe6tJ9L9BiqWDP
 eitKDX9P2ulgs/WDuOQwAmiZnGGN6yT6ybE3R6Xq2kvX4jnaSMjl4NI7dw/dBfY+G7SV
 V2NgeZe42dUT11+EvlZW82hjiUnDmqEs/PSgxn4YNAK7l20TD/EyInKlKALSMbfk1ADM
 fnHQ==
X-Gm-Message-State: AOJu0YwLwCB8WbN2QAxotSXCj9OeRTRrY166fDt+P36m8MuEqUqpJzfU
 t0NSZiDfpS52wonSn5CBYG51ig==
X-Google-Smtp-Source: AGHT+IHMEOW7owjsdqXW4albhieB6ICB/laD+yAv5gj1xxCFq4NZSwteDqPqXMFp1pHTIwDO6eKKJw==
X-Received: by 2002:aa7:ca46:0:b0:530:1bab:f78f with SMTP id
 j6-20020aa7ca46000000b005301babf78fmr6094471edt.28.1695320635973; 
 Thu, 21 Sep 2023 11:23:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y11-20020aa7cccb000000b005331f6d4a30sm1153895edt.56.2023.09.21.11.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:23:55 -0700 (PDT)
Message-ID: <059a3f4d-625d-58e2-3bd3-3c699b075842@mind.be>
Date: Thu, 21 Sep 2023 20:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20230920130754.2258-1-tianyuanhao3@163.com>
 <20230921141113.1742-1-tianyuanhao3@163.com>
In-Reply-To: <20230921141113.1742-1-tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695320636; x=1695925436; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YzPxUtIbHXX+ODjxNSsozzp6RRtdpR0l/xY/xT7YzV4=;
 b=ieS92FIv1XjagR8H0uZ+AXrEoLXod9vJwhts172pjCB9crc6TbTRtbwwPGRiUniQx5
 dKapzHnqRgQXC69VEMDPPR849swcA4BLekE6YSvyGqipEgnqpjJAUcWFf+wjWUb7AGTg
 S0Nf7CJkd0vLLsHxbwadFmW2YWXERVXu2M15O2ETGtmgcTHZE9mfewcQROeRoEA1ea4u
 C+bjmpegXFTOlxVjrVKoFRZj8kzwPUmbKN94jmDx4nyxA3zwGUz0RuD49jxtRapFtaTh
 sJ8i/IaMvaHYw3oFmCLchztzL/VNI+UwiQgHU5B73jg0CIBBl6gZBxozETT5MiIqVc6k
 vJcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ieS92FIv
Subject: Re: [Buildroot] [PATCH v2 1/1] package/nftables: install
 libnftables to staging
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



On 21/09/2023 16:11, TIAN Yuanhao wrote:
> Needed for network-config-manager:
> https://github.com/vmware/network-config-manager/blob/v0.6.4/meson.build#L119
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nftables/nftables.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> index 20a7cd07ef..9cba243372 100644
> --- a/package/nftables/nftables.mk
> +++ b/package/nftables/nftables.mk
> @@ -10,6 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
>   NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>   NFTABLES_LICENSE = GPL-2.0
>   NFTABLES_LICENSE_FILES = COPYING
> +NFTABLES_INSTALL_STAGING = YES
>   NFTABLES_SELINUX_MODULES = iptables
>   
>   # Python bindings are handled by package nftables-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
