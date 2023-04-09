Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F0C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BD38403A7;
	Sun,  9 Apr 2023 14:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BD38403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzHMsIhHbJQh; Sun,  9 Apr 2023 14:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C1F94032A;
	Sun,  9 Apr 2023 14:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C1F94032A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AAC11C2C89
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EF9E4032A
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EF9E4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiwHH6JI2_Ti for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:00:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FE34015E
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27FE34015E
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:00:37 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50489c109f4so802698a12.2
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 07:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681048835;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oDQsiaGeR0rNcvBpWSaji189bZ07QwzqPfRlcD9dl5k=;
 b=WY45dWr9rJDRdLsAGNMCHNDZK14PSxrhvYKjGCYsHZEWLW8zfSxc0tiRsYLL2b00dv
 7iuftHbK3tnJBz3JBRRQFAMLQmg7z8mPckDrHGd32qtJkX6E3s7f5uNmx5zZEzwedGgL
 JVSB/NHliUXe+RuSz9l/aZFx6lRYyblE9gKzt1a4wSP7Xekkt3g2davjWvyK8ckgl9qA
 1r7hFrVyP9vHX3VL0HZS1F9dG8MlrcLfSDk9ea5Uhow9hdMMx7cigHHpx0dyzniP82D5
 ly3tJqKKo5aSdW+Cp90B2PsmZwCEKeCtsa5wcfFWk9SCVexdFOrLsuRsnvOA78slu+og
 iVcA==
X-Gm-Message-State: AAQBX9ebTXdiMABNvr7SdHUzFaH+D1yc3VcvekqrEyLKbNGObLEdPzIW
 aYiyFE5abWde9VzoY53Cvu+417XxinZscTFwR0E=
X-Google-Smtp-Source: AKy350Y16zzHUf865NSSHaZZnrvUPRCMgXGre2uIodp87Bwnw+aJWMGof3d5f4gGrzHTXLfRSTkf8g==
X-Received: by 2002:aa7:db51:0:b0:502:709e:fc41 with SMTP id
 n17-20020aa7db51000000b00502709efc41mr6870763edt.33.1681048835266; 
 Sun, 09 Apr 2023 07:00:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a509503000000b004af720b855fsm3930263eda.82.2023.04.09.07.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 07:00:34 -0700 (PDT)
Message-ID: <57ffe44f-3428-6c29-5ab9-2bf525ced0b4@mind.be>
Date: Sun, 9 Apr 2023 16:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
References: <20230405202149.1411245-1-pevik@seznam.cz>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230405202149.1411245-1-pevik@seznam.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681048835;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oDQsiaGeR0rNcvBpWSaji189bZ07QwzqPfRlcD9dl5k=;
 b=SWzeQJVtVsQHUeGaRntdbhXtMeUNFPRkesOB6nHYmNNlyTsU2Xq3Z8/zrt1/6iy17o
 WSdjjJelEEHtlK60QLlw/bVttv3rZajT8ZEtvL/ON6fbZM+bLzMFXjzGjTOGPqhbOEzW
 OuwrTTyYg5hdFHtumHwjf3UI72przlyaVd6zNw6+JUstLiw4/4WvwqI3hUkHtc/6zuZm
 mC61nMsZ6+2NAn1mMWO3vjELGHQyeOLgEMxmoys8Gwov2iH/D86JX7yMkwoqsBtyLf7+
 pTzxqGhXMyOCD4dTMwaZQSd3hvIy6/cf1m8pwmCkQeMOiquj7cU7BSVZBah6ReWR+ZLC
 15cQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SWzeQJVt
Subject: Re: [Buildroot] [PATCH 1/1] ima-evm-utils: bump version to 1.5
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

  Subject line should be package/ima-evm-utils: ...

On 05/04/2023 22:21, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Project primary git repository moved to github.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied to master, thanks.

> ---
>   package/ima-evm-utils/ima-evm-utils.hash | 5 ++---
>   package/ima-evm-utils/ima-evm-utils.mk   | 5 +++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
> index 56d830e54c..9777c7f213 100644
> --- a/package/ima-evm-utils/ima-evm-utils.hash
> +++ b/package/ima-evm-utils/ima-evm-utils.hash
> @@ -1,4 +1,3 @@
> -# sha1 from sourceforge, sha256 locally computed
> -sha1  f23d8a406759a469b0223b0bfb302ada4407a1d1  ima-evm-utils-1.4.tar.gz
> -sha256  fcf85b31d6292051b3679e5f17ffa7f89b6898957aad0f59aa4e9878884b27d1  ima-evm-utils-1.4.tar.gz
> +# https://github.com/mimizohar/ima-evm-utils/releases/download/v1.5/ima-evm-utils-1.5.tar.gz.sha256
> +sha256  45f1caa3ad59ec59a1d6a74ea5df38c413488cd952ab62d98cf893c15e6f246d  ima-evm-utils-1.5.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
> index 01984402ce..fc20df0441 100644
> --- a/package/ima-evm-utils/ima-evm-utils.mk
> +++ b/package/ima-evm-utils/ima-evm-utils.mk
> @@ -4,8 +4,9 @@
>   #
>   ################################################################################
>   
> -IMA_EVM_UTILS_VERSION = 1.4
> -IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
> +IMA_EVM_UTILS_VERSION = 1.5
> +IMA_EVM_UTILS_SOURCE = ima-evm-utils-$(IMA_EVM_UTILS_VERSION).tar.gz

  This line is not needed, as reported by check-package.

  Regards,
  Arnout

> +IMA_EVM_UTILS_SITE = https://github.com/mimizohar/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
>   IMA_EVM_UTILS_LICENSE = GPL-2.0
>   IMA_EVM_UTILS_LICENSE_FILES = COPYING
>   IMA_EVM_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
