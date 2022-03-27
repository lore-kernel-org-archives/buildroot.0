Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F64C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 789464064C;
	Sun, 27 Mar 2022 16:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lH23CPuTVl3x; Sun, 27 Mar 2022 16:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DF3C405D7;
	Sun, 27 Mar 2022 16:31:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 676721BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 568F681AD1
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TEkGJLQ-rlFb for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:31:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A03181AC4
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 16:31:19 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a8so24090829ejc.8
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VXliKQsKnso9LmWVi+hkJFDWlLylo/IEqQJ/rLtYPds=;
 b=QjHMAmw4zzCJLdGuKqMQsyiHCcifH0CAa0cNjWWOxTRzEvoNP0fBt7X2tkpdvR3GlL
 XmcCl83zAfH8jcatwtPMIp6nqVtuvT4jhjHDdOTN+grc103fI8xUb8C3JMTmaCVLTvPk
 KEaf1WkS4rw8uBe8cfwJ0rFo3sCzPKdsc02L6KFHaM0hdsSKXZUNtgzHpP+9vEWmj+Ej
 VOqemeEEEwbtUzyCk3eCkBe9cs8VjdtEb0z1tAV5qvqcs6VoWAWyGxesma3ZseFlnY0/
 M8Ewjg7vZOXbIKtjjic94vOt60l9dNVJ0Dgyad8jFKcoIRjiMk+U5vxnZU5dqn37KTSA
 onhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VXliKQsKnso9LmWVi+hkJFDWlLylo/IEqQJ/rLtYPds=;
 b=C7Xwf4JZLG3vZWuEQaEtQcoUCcvyeG9L8R8NACUP7GLYjz9fKn6Nb3t6fod8jQoB6u
 TLKqVzcxf+aM7PGd+Dq+J9M+YqbpEBdh0vVMWQ6+s00vis7rO0zZ1YWensEwgsPW8IJk
 XdaMiW3pkOcTs1mPGdL/V+VeUI/66zu5JAASnjEjA/ed7VzDxi5WfcVIsyv12DVP+5eB
 LJlzkyrbUYRWukDaFqHb7FOzRful9ZdZcqk5sjyN3dZ5Pxh4DG22kF67mOPV6o8VeVf2
 IfkSWk9irmGKf23yRj8ugI3HvfOjfy5kS1xxUt0hOHJaGwQ6qLVWcAHkYDVQAUz+gBqe
 MRjw==
X-Gm-Message-State: AOAM5329wnnQJgOitRgjYS31dpy4T8qlI8swhLpDzHP4TA96e22sTVD/
 bmO4GEHH9Tf95t9wMfHWKLAsCg==
X-Google-Smtp-Source: ABdhPJwycIUoVKISnz8Ad4zqJftjFDpsktOp6qJ1xn/YaFsRjmCQswNGhxhGRE/SmAENrIcYEcC0Ag==
X-Received: by 2002:a17:907:6d8f:b0:6e0:1512:913b with SMTP id
 sb15-20020a1709076d8f00b006e01512913bmr23370215ejc.491.1648398677524; 
 Sun, 27 Mar 2022 09:31:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jg39-20020a170907972700b006e047c810dbsm4764681ejc.56.2022.03.27.09.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:31:16 -0700 (PDT)
Message-ID: <69a2a7a8-3f06-2779-b6f9-32f7d9345bfb@mind.be>
Date: Sun, 27 Mar 2022 18:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220327142023.1477251-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327142023.1477251-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/lua-basexx: bump to version 0.4.1
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



On 27/03/2022 16:20, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lua-basexx/lua-basexx.hash | 4 ++--
>   package/lua-basexx/lua-basexx.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lua-basexx/lua-basexx.hash b/package/lua-basexx/lua-basexx.hash
> index aee636c32..447ec60ba 100644
> --- a/package/lua-basexx/lua-basexx.hash
> +++ b/package/lua-basexx/lua-basexx.hash
> @@ -1,3 +1,3 @@
>   # computed by luarocks/buildroot
> -sha256 ff5379b1f5b396103b8bb589ab3dd94d0a727c8e7a48dcfe1c73e2f07af6a8df  basexx-0.4.0-1.src.rock
> -sha256 a1826a43c9e04f9e9b2e5d26d636c656812483bcd513618eec9d72cee69d446b  basexx-0.4.0/LICENSE
> +sha256  3f6a7134a518676d73a9ba80437487de9a7d482e54859a96c0c5d8b381b0a8c6  basexx-0.4.1-1.src.rock
> +sha256  a1826a43c9e04f9e9b2e5d26d636c656812483bcd513618eec9d72cee69d446b  basexx-0.4.1/LICENSE
> diff --git a/package/lua-basexx/lua-basexx.mk b/package/lua-basexx/lua-basexx.mk
> index 5aa5ecf21..22b5a3771 100644
> --- a/package/lua-basexx/lua-basexx.mk
> +++ b/package/lua-basexx/lua-basexx.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LUA_BASEXX_VERSION = 0.4.0-1
> +LUA_BASEXX_VERSION = 0.4.1-1
>   LUA_BASEXX_NAME_UPSTREAM = basexx
>   LUA_BASEXX_LICENSE = MIT
>   LUA_BASEXX_LICENSE_FILES = $(LUA_BASEXX_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
