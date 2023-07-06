Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABB7EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 20:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCC9160AEC;
	Thu,  6 Jul 2023 20:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCC9160AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdeUL0TgqdpY; Thu,  6 Jul 2023 20:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2968B60A4F;
	Thu,  6 Jul 2023 20:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2968B60A4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E000B1BF4DB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B891A402F2
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B891A402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfJDAgXqDVaI for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 20:13:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 812044019D
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 812044019D
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 20:13:40 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so1599986a12.1
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 13:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688674418; x=1691266418;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BhiVQtyF83aDb0ZmSS8b8VjIAiarbjvGZf9MSnTN6EQ=;
 b=Q7QwmPWbabsMlkmPwEIlF5XGVQAmsvIk+GQoGH6bWF06s98B5MDobmHnR1hDUO5Iot
 4JwkEz/8WT8/7n3Y7QlvMAx6hfmnueayy+v2TnjYXpWRpSFWzc4X/R9KqjrKrsV8fC9/
 b4CUEbS3OAsYX8CN4NOy/zpR33V/+NogTM15CfC9o9/1mmoSEDvr2OeJTj1bs7X+e724
 YE3wSbj/EgAYPFdbxs4Et7iGRwRkMG7kTmwkmjF260Xhdo/cGEc58orB3EWVDU7GzMeM
 hbFPrdj/B4G3bH8ejdy07okf/0eVE3lBTVjpJ+ilNFDzg7vRzKHVxGdYDaGSdsVDFaFq
 5b4Q==
X-Gm-Message-State: ABy/qLZaiDxutiNYalIdOFG2kfv36TRy5G1Xzrjxd9kmdVPFhYErnmwz
 AFalmpLwh+dO7lOVDeEel8VkiNOCwtqZHleoEgU=
X-Google-Smtp-Source: APBJJlGOUrnMYqLUcWaWIzLaw/FQNzwT3Ao+FzRlr3TwAZBU5HkB0s5+fzdyXfReU7+s19+4BHxsAw==
X-Received: by 2002:aa7:ce18:0:b0:51a:5c1d:5c06 with SMTP id
 d24-20020aa7ce18000000b0051a5c1d5c06mr2001767edv.42.1688674418287; 
 Thu, 06 Jul 2023 13:13:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a056402180700b0051d9ee1c9d3sm1140554edy.84.2023.07.06.13.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 13:13:37 -0700 (PDT)
Message-ID: <7edfb1fe-2690-fb6d-6858-1f3e20974b42@mind.be>
Date: Thu, 6 Jul 2023 22:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230706191912.3008144-1-bernd@kuhls.net>
In-Reply-To: <20230706191912.3008144-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688674418; x=1691266418;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BhiVQtyF83aDb0ZmSS8b8VjIAiarbjvGZf9MSnTN6EQ=;
 b=IsPOrz4iVvI+PnWHNLtCcRTt7LCGQcjjHYTZ/XoSesacrEWg5oxCly4+RfhNz2ehvO
 ogRJF7pd4SWbwsHLuP0K1peZ+R9LcICA6RQGzf0A5hcSYet9wjjGXHxv/PBmXuInZlld
 CCK+Ub37S/4TT4RLoYSa3mtPSwSRL1OIBSvIeFSPaGZAITxOaHKyncFvjXnU2tZBSh1w
 +sj3+ppE5uTuCoxMkmh2iZicTBZDIHNzKIjZoBYmVktC5fOvhNmF9mhQqpXfg+2wGco0
 zKSO77WxFn4cBIT0R+0ru3Mx6lJzq4j1VzhkQJ/JSoBk+BMD8v5cBuudhB7ZBU1UunAW
 W7Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IsPOrz4i
Subject: Re: [Buildroot] [PATCH 1/2] package/ocf-linux: remove package
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



On 06/07/2023 21:19, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/88b/88b5d14b315af1669fff04f8c11c321cc4c107c7/
> 
> The package seems to be unmainted, asking for support of kernels >= 5.6
> a year ago was unanswered:
> https://sourceforge.net/p/ocf-linux/mailman/message/37662698/
> 
> This patch follow Thomas' suggestion to remove the package:
> https://lists.buildroot.org/pipermail/buildroot/2022-November/654688.html
> 
> Remove the virtual package cryptodev which is not needed anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   Config.in.legacy                           | 14 ++++++
>   package/Config.in                          |  2 +-
>   package/cryptodev-linux/Config.in          | 14 ++++++
>   package/cryptodev-linux/cryptodev-linux.mk |  2 -
>   package/cryptodev/Config.in                | 50 ----------------------
>   package/cryptodev/cryptodev.mk             |  7 ---
>   package/libopenssl/libopenssl.mk           |  6 +--
>   package/ocf-linux/ocf-linux.hash           |  2 -
>   package/ocf-linux/ocf-linux.mk             | 26 -----------
>   package/openswan/openswan.mk               |  3 --
>   10 files changed, 32 insertions(+), 94 deletions(-)
>   create mode 100644 package/cryptodev-linux/Config.in
>   delete mode 100644 package/cryptodev/Config.in
>   delete mode 100644 package/cryptodev/cryptodev.mk
>   delete mode 100644 package/ocf-linux/ocf-linux.hash
>   delete mode 100644 package/ocf-linux/ocf-linux.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d3a67aba83..5b4a55aac1 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,20 @@ endif
>   
>   comment "Legacy options removed in 2023.08"
>   
> +config BR2_PACKAGE_CRYPTODEV
> +	bool "cryptodev virtual package has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_CRYPTODEV_LINUX if !BR2_microblaze
> +	help
> +	  This virtual package is not needed anymore due to the removal
> +	  of ocf-linux.

  I think we don't need legacy handling for the virtual package.

* People who had selected cryptodev-linux already don't need to be bothered - 
nothing changes for them.
* People who had selected ocf-linux already have the other legacy prompt.

  Regards,
  Arnout

> +
> +config BR2_PACKAGE_OCF_LINUX
> +	bool "ocf-linux has been removed"
> +	select BR2_LEGACY
> +	help
> +	  ocf-linux is incompatible with newer kernels.

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
