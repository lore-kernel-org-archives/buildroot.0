Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63632C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:13:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9902361100
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9902361100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D6AC84072;
	Wed, 22 Sep 2021 20:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJmchztKk3yw; Wed, 22 Sep 2021 20:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78B5A84073;
	Wed, 22 Sep 2021 20:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2F281BF37F
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF9D9614E7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sq3YA9TgN_uO for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 20:13:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EE53614E3
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 20:13:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c22so14260296edn.12
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 13:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=HX+YyHwhdNtnmp4quP6vEzM26mRvSXYZvqiAHdLTDng=;
 b=epYojJYWDK56rWDU6z9kDfG79hh1uMhMVb8N0vC5lCxHqyERWk7smxzZw+tZz8w7Ow
 u5kOFD7ZKc0Xb3jRRPeDQLAQEnPO7j/jwIc+/wXx6HDrCqB+6u/NsYkQk0ZBpfnEt8wl
 JwFTGYWQRs8QOjbR14xbsSBxH8cjlGQ79Dpk6BnhxDI3okSmLtWrdhJBDCJLnu7r3wjX
 eHWCsPo+L6HOPSXaTw9oJ+qIZOW53gMEVF2tErb6cjmiA9DhQFaax6HwFv7EsqAHqh8I
 kSBbxyUKg+uhQXjMB2lPR9jJJCsVup1IJPCM6HBmDKP1Bn3YZV9oXRS2dJh0w6GFCpJU
 i4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HX+YyHwhdNtnmp4quP6vEzM26mRvSXYZvqiAHdLTDng=;
 b=037J3Z/UdZb0toF+1ozb4jqhtbmKD9k9l99mcVMJ19Hz4JvEdMnGchcC5Gv6gYPT7V
 QctgrSY4mONIi1sszbLVVk4aUuYY7/4mejAVJQPtWpBDDlY7ATol5QtiG9XxXGxL/6AB
 0cgR83uKWZD3bLQVytA+MH7WchRxC9ZwYLl5ga8ZyFHULHMgrpLR9j+mq7KIksnfImqQ
 /orWYwkW0gkAN2Is8GDghZBJo3JBSQ9yXAg06sulS5dqwsAjFzpPWYMP6e6S+KQVqHgd
 i34zeI9l7Ypw38cAOjk5dfda4RaZ0JqjmgAONDSMii57w+C4OFGdbbkP21AMJ4WcDQpD
 jwNQ==
X-Gm-Message-State: AOAM530pcOnogZ8nOz51exxD3EyA+tITrwCNApHvZzRRX59Cz0JPr3bL
 9Ld2lX/P5b6BZmlwGiTk3dWxDemiTQ9MGQ==
X-Google-Smtp-Source: ABdhPJxw1E7QdwVALw3xL2El4DSft/A0cVcBHlJCPL7/FzTf0yUFkEGoLKxFKcYZ4MhISWtnfjgOWw==
X-Received: by 2002:aa7:d619:: with SMTP id c25mr1303815edr.365.1632341588723; 
 Wed, 22 Sep 2021 13:13:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t19sm1500313ejb.115.2021.09.22.13.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 13:13:08 -0700 (PDT)
Message-ID: <d70bb907-428e-ba30-ed79-9700113e00fe@mind.be>
Date: Wed, 22 Sep 2021 22:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210912141140.253778-1-romain.naour@gmail.com>
 <20210912141140.253778-9-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210912141140.253778-9-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 11/16] support/docker: bump docker image for
 the gitlab-ci to Debian bullseye
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 12/09/2021 16:11, Romain Naour wrote:
> Starting with Qemu 6.1.0, gcc 7.5 is needed to build.
> Since we build host-qemu package for qemu defconfig, we have to
> upgrade to (at least) Debian buster that provide gcc 8 as host compiler.
> 
> While testing this upgrate, the test_edk2 failed since it actually
> requires Qemu >= 4.1.0 to support arm SBSA reference machine [1].
> Debian Buster only provide Qemu 3.1.
> 
> Finally, upgrade to Debian bullseye but it requires some linux
> kernel version bump in several defconfigs since host gcc is based
> on gcc-10 [2].
> 
> Add explicitely python package in the Docker file to install python2
> on the host.
> 
> [1] https://git.qemu.org/?p=qemu.git;a=commit;h=64580903c2b3aee08d74d64e6248a313b246cb69
> [2] http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=621f2ded601546119fabccd1651b1ae29d26cd38
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> The docker image must be rebuild and pushed to https://hub.docker.com/r/buildroot/base/
> ---
>   support/docker/Dockerfile       | 4 +++-
>   support/docker/apt-sources.list | 8 ++++----
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index a9bacca3a0..795b26c276 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -6,7 +6,7 @@
>   # We use a specific tag for the base image *and* the corresponding date
>   # for the repository., so do not forget to update the apt-sources.list
>   # file that is shipped next to this Dockerfile.
> -FROM debian:stretch-20171210
> +FROM debian:bullseye-20210902
>   
>   LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
>         vendor="Buildroot" \
> @@ -36,6 +36,8 @@ RUN apt-get install -y --no-install-recommends \
>           libncurses5-dev \
>           locales \
>           mercurial \
> +        python \
> +        python-six \

  As discussed, I applied to master without these python changes, pushed a new 
docker image to dockerhub, and sent a patch that updates .gitlab-ci.yml.

  I believe the rest of the series can only be applied after that update is 
committed, right?

  Regards,
  Arnout

>           python3 \
>           python3-flake8 \
>           python3-nose2 \
> diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
> index 789fb8fc17..0f872fd398 100644
> --- a/support/docker/apt-sources.list
> +++ b/support/docker/apt-sources.list
> @@ -1,4 +1,4 @@
> -# Latest just before 20171210T000000Z:
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch-updates main
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20171209T224618Z/ stretch/updates main
> +# Latest just before 20210817T000000Z:
> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye main
> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20210902T193650Z/ bullseye-security main
> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye-updates main
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
