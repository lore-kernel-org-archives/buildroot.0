Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954EAEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1E4409A1;
	Sun, 25 Jun 2023 15:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD1E4409A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NZU9iAEFJgM; Sun, 25 Jun 2023 15:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C995D40998;
	Sun, 25 Jun 2023 15:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C995D40998
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFF671BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A298881CA0
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A298881CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwRdwggSgyLA for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:00:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78BE481C46
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78BE481C46
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:00:50 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51d7f350758so2128366a12.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 08:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687705248; x=1690297248;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ainNYivVqdJBcYzFUWfS9OocncJnXiko1MQuyqjj20=;
 b=cJUF9QZ1h4Z9eMT7EqYOTdzbhLfu/mQQfAFsV5Xj5nTBEmlA8UYVvHHeNr7spW6sIx
 Ok/xVfz7nLKinbm7XUqwPSah3QTwhXAoqSxKH1cWsbtCuUrL2YVbCJ0PzG0tWdbYPImm
 z8ohNr1cBjamCpWpiMpekueZSK9IERYS+bL9D36jgdixysqCeF3BxfXoQrT31QTG+x7F
 kS+iSHhTmQu745TyIW+VNQcUQKIRscpBM4+4JHLHhlmPyFiH2AExK9cSnYwvAWC0SPOQ
 ILS6AB3SkouQd1rf8QRAKZGdDQ8S6GpFxSSwtITgT1YiW2NkJUDzweYdiWFwHXGwfxPe
 mkUw==
X-Gm-Message-State: AC+VfDxrsT8qIEQ4X9Adxf3YPAY/1UETVlU8NmY3+GuSjQ3j8Jc5XOvN
 j4HqisaO69knAhhPvem5RRx1Eb8q3esm4iT22hI=
X-Google-Smtp-Source: ACHHUZ7mxPViFpiNiqF//BB9ZkDlJgpZo5H3RKAyL3hX6xOOQulIqYS8/9EvyFVKHIJeApD0Z4PuRA==
X-Received: by 2002:aa7:c9c5:0:b0:51d:98d1:5337 with SMTP id
 i5-20020aa7c9c5000000b0051d98d15337mr318982edt.37.1687705248410; 
 Sun, 25 Jun 2023 08:00:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 s22-20020aa7cb16000000b0051bed498851sm1888035edt.54.2023.06.25.08.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 08:00:47 -0700 (PDT)
Message-ID: <3cccb350-e207-f0fe-c24b-431517d49b5f@mind.be>
Date: Sun, 25 Jun 2023 17:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687705248; x=1690297248;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ainNYivVqdJBcYzFUWfS9OocncJnXiko1MQuyqjj20=;
 b=AVfe3G7qtiWUCBe73tmJOk8mzj9mK73v+GcRs8QjZbWuuxzqH4EeZ8bMLWEsWP3Hb8
 66wA73RJLjZJAtc92g3ae+Ur+3qRJ8+MyK873RSrbxLiwOXWNvufQHAX+kQ+04bMOqnN
 QWSu3NFAArLI+G7b4TB/HnHUVNGgSP7yYOSszW1mjLaDzO6OlN0vPliApCLPffdDzUHI
 mGPJc3CfUC0tcr0zAxqYTb7yBCb9hJRsVJqF+//9DM8VYasGES+DkewfVlTo/YTQSrhW
 2C/mk997SOp7gBY7JJUBtVH7R9/GXsYp9Ych2IyRAVJyHxh3FJK34JAZiW5vAXwt5Ag8
 g+lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AVfe3G7q
Subject: Re: [Buildroot] [PATCH 01/12]
 package/x11r7/xdriver_xf86-video-dummy: bump version to 0.4.1
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



On 11/06/2023 16:56, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-May/003394.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  All 12 applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash  | 6 +++---
>   .../xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk    | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
> index eed28d3fde..6d7d0b4bc2 100644
> --- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
> +++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2022-April/003155.html
> -sha256  e78ceae5c8c0588c7cb658f2afc3a9fac9ef665b52a75b01f8e9c5449a4e1e5a  xf86-video-dummy-0.4.0.tar.xz
> -sha512  1150a84c4f17215b9c579d8ce9399d547a01970bf7b5396653f14beb13a62deefe3008bf3ad6a2c5c0f46da4cbc0b840c18a7dff339e3b882d108183fa1d30d9  xf86-video-dummy-0.4.0.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2023-May/003394.html
> +sha256  351920a7fd0f759a3ac972a5999b3ffed46f07fb52a99f319bfb5b6a59d3dfaf  xf86-video-dummy-0.4.1.tar.xz
> +sha512  ff7fd8b668e5e9f40a5d27f82599b7a455a8162fc1a247195335c17980f00ce10ae6b2c062239cbaa67d8684c86174f85b398dd7f7065d36f69294bd6f2469de  xf86-video-dummy-0.4.1.tar.xz
>   # Locally calculated
>   sha256  e29aa81e74563d14e5633963107c030e74e8352ea7dafee1a9d7e19b7d0e887b  COPYING
> diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
> index e863b1e506..f7f05c7c41 100644
> --- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
> +++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.4.0
> +XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.4.1
>   XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.xz
>   XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
>   XDRIVER_XF86_VIDEO_DUMMY_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
