Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E56FEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B7CA612CC;
	Sun, 25 Jun 2023 19:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B7CA612CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tl4Mj-Wxyf8N; Sun, 25 Jun 2023 19:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F73B612C6;
	Sun, 25 Jun 2023 19:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F73B612C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02A4F1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE5B981DFC
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE5B981DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fPAxJfB82cT for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:25:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1CC581A27
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1CC581A27
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:25:06 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51cb40f13f6so2725835a12.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687721105; x=1690313105;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iA+boUlMuuUinvZcyU5Va3vCRw3h0EZ6lDZPr7E1pbI=;
 b=PEEteLRhlRWa1FuTQDhgZ7PVXl/qcxXZ02Hb/BeSwqvVw8yzeH8/pBez7mrK+5vxFf
 LceqGvAwxtf30HPCEZ8L/5dxxitYxOfikBu2Jcn1TSzv1MHF3vYplP/zpgWqs3+iif1P
 y5Ez8WDqXHgZxyin3HX4Q59N11iWLg/UQeV2OWmi09nkv20GWT7gSzJ7bqHzNGakq/OI
 JZ7qSQzsvKA0uV91ZtLBzkJdrl96F6zbRZFc74LSLJiO2byPps2TViWqGKmMj7XMoC0e
 FwucZ4SH8zPoXtx/bYDTflQ6xgtooY8911Y4SL8SSBiYtm8bYplLZjJkmJxGBn7VDKng
 FeyA==
X-Gm-Message-State: AC+VfDwlQA3DvmEL3ac8noK7uIBKAHfQILvTjjqMl8J1FeW3QH2AM/Fw
 0JuNBfm/+Dw85MjEcGoXjnlzylgUV4yxhboSi/I=
X-Google-Smtp-Source: ACHHUZ6xnfz6NAGXhXp8wGYaluECto7b+2eIBS9WtqBQfFpbeWtX3BTcxWS7CEaN5X2QhyfIWH/jIA==
X-Received: by 2002:aa7:db8d:0:b0:514:9929:1b01 with SMTP id
 u13-20020aa7db8d000000b0051499291b01mr18645888edt.8.1687721104974; 
 Sun, 25 Jun 2023 12:25:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056402515200b0051d9580b00esm887060edd.11.2023.06.25.12.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:25:04 -0700 (PDT)
Message-ID: <f05d9676-8c51-a78f-b451-b4f84665bb1b@mind.be>
Date: Sun, 25 Jun 2023 21:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20230625174707.1688088-1-peter@korsgaard.com>
In-Reply-To: <20230625174707.1688088-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687721105; x=1690313105;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iA+boUlMuuUinvZcyU5Va3vCRw3h0EZ6lDZPr7E1pbI=;
 b=bjO1cgsbNbN2VO3XU50sjcqpYzTjhfGRhzwjZxq1+g6I3S3kLufV1AxcoQ249TWwgQ
 3/m3ry/Gl99MSIWZFwgA5i88lheKnld/YoYgkzP8r7GWKPwWAJfJfRxS+I1O+2inAxCS
 Y9bY+DmHQi1u7eOwCHsE1GKvty8NQaeMCMYS3d9tOzYJ0b+SwCJ2sLSx8gTvpDm+pcm2
 L2atkEW2C7Yn3utKFeWW/+vEs/xl4uACtQ1XY4mBKQdylWQEdQaDpqd8+S6iby/U8FKD
 9+5+wcv12uVsOwm+DMGspjb8p43uOmt4Jaw1MxWyNEhU2zWoHSejl+bqGa0Wyuxe5RLq
 87Ng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bjO1cgsb
Subject: Re: [Buildroot] [PATCH] package/dbus: security bump to version
 1.2.28
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



On 25/06/2023 19:47, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2023-34969: Fix an assertion failure in dbus-daemon when a privileged
>    Monitoring connection (dbus-monitor, busctl monitor, gdbus monitor or
>    similar) is active, and a message from the bus driver cannot be delivered
>    to a client connection due to <deny> rules or outgoing message quota.
>    This is a denial of service if triggered maliciously by a local attacker.
> 
> - Fix an incorrect assertion that could be used to crash dbus-daemon or
>    other users of DBusServer prior to authentication, if libdbus was compiled
>    with assertions enabled.
> 
> For details, see the NEWS file:
> https://gitlab.freedesktop.org/dbus/dbus/blob/dbus-1.12/NEWS
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dbus/dbus.hash | 4 ++--
>   package/dbus/dbus.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
> index 17c70004ba..0e48d4dafd 100644
> --- a/package/dbus/dbus.hash
> +++ b/package/dbus/dbus.hash
> @@ -1,7 +1,7 @@
>   # Locally calculated after checking pgp signature
> -# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.24.tar.gz.asc
> +# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.28.tar.gz.asc
>   # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
> -sha256  bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38  dbus-1.12.24.tar.gz
> +sha256  9da1e3f2b73f75eec0a9e4509d64be43909d1f2853fe809528a0a53984d76420  dbus-1.12.28.tar.gz
>   
>   # Locally calculated
>   sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index b3a79c431d..99d2c4301c 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating dbus, check if there are changes in session.conf and
>   # system.conf, and update the versions in the dbus-broker package accordingly.
> -DBUS_VERSION = 1.12.24
> +DBUS_VERSION = 1.12.28
>   DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
>   DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
>   DBUS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
