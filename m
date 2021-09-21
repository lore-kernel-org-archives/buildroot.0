Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8036AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:34:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACDF461165
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACDF461165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 710F980E78;
	Tue, 21 Sep 2021 20:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id twxJ8pcRB5AX; Tue, 21 Sep 2021 20:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD3C880F35;
	Tue, 21 Sep 2021 20:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C99D1BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B78280F35
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FomXTzRVHRp for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0D1D80E78
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:34:32 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v24so1232418eda.3
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=dIJl1HgXQYm2ZWUNiTc9nZtq2F8mEBgst/5sw4TGy48=;
 b=fSbZ2n1gHty+1ZtFwjaVB+ba527qQARK9XSGm4jSSKL2DMdWhBLPIXFVoeoTao9IqC
 4x8/vrme9RPRb3uLp6eV4sVVCSzJK+drVKRgsGy0FCxloEhL9aJcDMaDRVKxx/fLGwHn
 RQjNp/ahkkwteSgwPU3M5gtharVRDnhbqm3Z6nCT9TkG2V7Y/1x+ad9zOsx1aVfls2q4
 bt1RSBO5tuKNLla6naw/CeI1063xKSGd+5ZaTBYRxWV3bsF8wgeHQOBdg0iGRnJ155PC
 JM14lur84jTFkBrdC+6pIZM4+qD+uwNLRcB1w9dPx6OtkKyiGUDDXxI8Z5NH3W9yhq+e
 f+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dIJl1HgXQYm2ZWUNiTc9nZtq2F8mEBgst/5sw4TGy48=;
 b=IGEgBuzmroSfRvLmUh67nWFuBPhtTHxg6/lzKz8+yII5CxFcZtMG6hzjDoO0+mBJcV
 8V4La/37uTXQGVbdd1Cv8Z0yKt4pA6Or4bqB3yeOvYtg6XD+yU4euBC+v9UHAUAru2hf
 fV4dj//MpwSbpxiYM0Y43sediFIx50bMHDmDgH6n4Un7R/5atDnaAa+/qY9gPKOLHKxE
 h7t59MnuBXaUsYMRdZbCRqQ1uhntSvt6de3/a/0N8hvWzBlJt9L91bfVj+5CuQKu60nF
 CUplDpOcjmjxc9yo1C+khZCUEEIyDftT3SI0t7LbhP/IgOh54Op0SmS6MgknWVAUBxPe
 eb7w==
X-Gm-Message-State: AOAM530u7Q/8IwRay8tubK5tPrfTXfOXcRc4rttMzWX9eHRJXNLzW6hq
 RXh5FbYQyrUgCTD775xfmc7OqQ==
X-Google-Smtp-Source: ABdhPJxEuntwcPeIkGkFilr8DcHicyD03xrL3rleME8B2ni5hfjfBnkDFw1ghX8pVwW+B95Pr/DuXQ==
X-Received: by 2002:a17:906:f906:: with SMTP id
 lc6mr36105324ejb.487.1632256470766; 
 Tue, 21 Sep 2021 13:34:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m12sm4208ejd.21.2021.09.21.13.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 13:34:29 -0700 (PDT)
Message-ID: <e45fcd83-e6c1-57b5-1e80-00807f194ea2@mind.be>
Date: Tue, 21 Sep 2021 22:34:29 +0200
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

  I've applied patches 1-10 to master, thanks.

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

  Once we convert all our support infra to python3 [1], this should no longer be 
needed, right?

  I propose to just apply it without python2, and see if things keep on running. 
If not, we can still either add python2, or (better) fix the remaining issues.

> 
> [1] https://git.qemu.org/?p=qemu.git;a=commit;h=64580903c2b3aee08d74d64e6248a313b246cb69
> [2] http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=621f2ded601546119fabccd1651b1ae29d26cd38
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> The docker image must be rebuild and pushed to https://hub.docker.com/r/buildroot/base/

  And after that, gitlab-ci.yml has to be updated.

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20210915194839.22122-2-petr.vorel@gmail.com/


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
