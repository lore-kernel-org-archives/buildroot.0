Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2165BCD98C2
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A21BA6144F;
	Tue, 10 Oct 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A21BA6144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JENdhbCiv8OX; Tue, 10 Oct 2023 20:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC84960FD4;
	Tue, 10 Oct 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC84960FD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9511BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54F1F81CDC
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54F1F81CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBAg5ONXqdRX for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:52:11 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDE5981C6F
 for <buildroot@busybox.net>; Tue, 10 Oct 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE5981C6F
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so1114858666b.0
 for <buildroot@busybox.net>; Tue, 10 Oct 2023 13:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696971129; x=1697575929;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Sw4CcxKJvwvg3G3loPzXLD4WAjpO296xYXQ2QvCSbY=;
 b=H8MTvSsHj0EdzeFw/adDAAru0XsO9h/yzxLR1OnYfSV7fUzDfkoiYM6RxT2W7ecMX/
 gwYAVRMUOM4416c+fN8rlYeyM6fYiwES5kqW7dHlmWq1geUM93HwU66FnBU2f4YIAWIJ
 SpYOwqZKN3f+Ach1vLBeFJI99cAr0rnt8RqUirViLXwMb1iXs9SK+sjnng9Vj/+fKi5R
 adC7ZMTr4LtILXj/oyjHDyEoKxP5UHiAGfVWG42rOpsuAtxj738P1VwaYW0ioPRY7/x3
 vqPRP5bafe6w+PbksaCfhVZzpIC1plBhFbARZeewc+AIs68LbqrT5JvfTQzQ6Bl8L7C/
 qwtw==
X-Gm-Message-State: AOJu0YxBwHUWXyUkSpbny15nQANNE53JAgMd0/AccT3L1hUoRg0g/8XL
 +gQBkoJMQJQMSzH/oXyae0B5PA==
X-Google-Smtp-Source: AGHT+IEtuddowPdeUNyfitB4CFXG2SUVIcQcYceSOoI+lgrFjWmV+S1t2DJLKks1NuQDQ0DlqggVPw==
X-Received: by 2002:a17:906:10ce:b0:9a1:e233:e627 with SMTP id
 v14-20020a17090610ce00b009a1e233e627mr18879226ejv.42.1696971128335; 
 Tue, 10 Oct 2023 13:52:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 pw1-20020a17090720a100b009ada9f7217asm8799707ejb.88.2023.10.10.13.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:52:07 -0700 (PDT)
Message-ID: <d6e7eef9-d013-740d-3947-ae388d15fa3b@mind.be>
Date: Tue, 10 Oct 2023 22:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20231007192214.3670075-1-francois.perrad@gadz.org>
In-Reply-To: <20231007192214.3670075-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696971129; x=1697575929; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Sw4CcxKJvwvg3G3loPzXLD4WAjpO296xYXQ2QvCSbY=;
 b=HX21SubL7gPBTjCeqGief/WxSW4a5dzGyFx3D49DAt978lOBkq2Ngba9xkXV/hrrrP
 nqpOQBj9FBH6EwdjAkqDJUVKSlcLIchkTMl9PoRvVdNgIEF1o02xJNKpTQqTEd73XdK3
 CcZgRo6RBOxNT2IIyRxGn+nZJbg7Cj6iKvKZCvOG3wm59S+elcB94K83ZTme40yNFRdk
 piVgCsA1WRckSExDK2Q6yYRhbwe3+e7JhUsM2XybUTYwfQ/BPkFSQ/FK6Dmr+mzQW9/X
 p5gmOWXk/EewAo4qX3rrrtujFiMsYdT/lWbD48AIUgOj//BnI2BMKjxDspA39T8v5+wy
 m1lQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HX21SubL
Subject: Re: [Buildroot] [PATCH] package/libsoup: bump to version 2.74.3
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



On 07/10/2023 21:22, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  It's really annoying that your Sob doesn't match your From address. Can you 
fix things up in your git config so that doesn't happen anymore?

  Applied to master, with the author changed to @gadz.org, thanks.

  Regards,
  Arnout

> ---
>   package/libsoup/libsoup.hash | 4 ++--
>   package/libsoup/libsoup.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
> index 2f44e63d7..5f687068a 100644
> --- a/package/libsoup/libsoup.hash
> +++ b/package/libsoup/libsoup.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libsoup/2.74/libsoup-2.74.2.sha256sum
> -sha256  f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159  libsoup-2.74.2.tar.xz
> +# From https://download.gnome.org/sources/libsoup/2.74/libsoup-2.74.3.sha256sum
> +sha256  e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13  libsoup-2.74.3.tar.xz
>   # Locally calculated
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
> index 026ea3a8b..81bf42cab 100644
> --- a/package/libsoup/libsoup.mk
> +++ b/package/libsoup/libsoup.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBSOUP_VERSION_MAJOR = 2.74
> -LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).2
> +LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).3
>   LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
>   LIBSOUP_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
>   LIBSOUP_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
