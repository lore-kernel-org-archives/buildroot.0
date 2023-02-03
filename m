Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D82C636D3
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 02:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DE474114E;
	Fri,  3 Feb 2023 02:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DE474114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjkBljuNcn_M; Fri,  3 Feb 2023 02:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC54140B8E;
	Fri,  3 Feb 2023 02:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC54140B8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27A631BF3C6
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 02:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01788812DB
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 02:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01788812DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZLbZeAD0Vqf for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 02:06:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97437812BF
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97437812BF
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 02:06:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id be12so3898789edb.4
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 18:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D7UZfU7U5Kae/94w0MyG7KEo9xn70CJKMy9zwH5JTLM=;
 b=E3ItZJP/qljJX14nhEyFfJVCcqBM5oRvQHIV5tSPd7usdT/vh94aPCG+ia2ZcPR688
 7ATrH3FMh3zkX7k5NGm+ZkCBcvu1I8AGY7bVaSHXAnMIxuxuvTrgG7ojdh6CYWZq8Ep/
 1hUF3LPIbgGhLAaxCaZGQDtxMFCKYzQ9WZ+s7RTi9l6AcLlzgJq9zvPljVRtdEJ9DwOg
 0OIFdncNiNuWosY0FUVwhxNR9Y5rv35KtdVg49y/FPsLrlrgoxZny52sH6arMDL3zxG/
 og94WSiL8VFoTbyPfV002wSoJWjd7OJM41eReppZa/AbDaRgDOYLq5ESIQrEqBTMy59g
 4zeQ==
X-Gm-Message-State: AO0yUKUehZlmR2BHoMb/wKf4HC/TOpiIAfZRPfT80qks0S3IX/sBYt1k
 RTtR+/gNjAOeSV5PwsqrDPFlHYQ4bCwV4vzAFzA=
X-Google-Smtp-Source: AK7set/oUpD2z/cmg+AvrzizFbnNQYZ5sL0SmKIMygVjEOGtHmBA4d2s668WI8/5fSyQi11clDKCfA==
X-Received: by 2002:a05:6402:3205:b0:4a2:1274:d0db with SMTP id
 g5-20020a056402320500b004a21274d0dbmr3391104eda.19.1675389971225; 
 Thu, 02 Feb 2023 18:06:11 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 y19-20020a056402359300b004a0b1d7e39csm449318edc.51.2023.02.02.18.06.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 18:06:10 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id m2so11501237ejb.8
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 18:06:10 -0800 (PST)
X-Received: by 2002:a17:906:8da:b0:88b:1344:9709 with SMTP id
 o26-20020a17090608da00b0088b13449709mr2689336eje.162.1675389970409; Thu, 02
 Feb 2023 18:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20230202131354.1193243-1-christian@paral.in>
In-Reply-To: <20230202131354.1193243-1-christian@paral.in>
Date: Thu, 2 Feb 2023 18:05:59 -0800
X-Gmail-Original-Message-ID: <CA+h8R2q_p_sY7oPnUHfg1-kAN-ZCzw7t=sQFZGJcrFOTEBdfYw@mail.gmail.com>
Message-ID: <CA+h8R2q_p_sY7oPnUHfg1-kAN-ZCzw7t=sQFZGJcrFOTEBdfYw@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D7UZfU7U5Kae/94w0MyG7KEo9xn70CJKMy9zwH5JTLM=;
 b=AIJddcHew6ds84pg1urNOStqOcSnBMCdvAfj2NF5wVrHyhM0p5ZUmRDVOsimnirJT7
 IV5+2q+pIQdubpohF49YFEIWGvvs7L3dvU0speeqJp16sJXUXWnwPZLLd/zCqKHkX/0l
 xM6lqhyYGRZj0k0kWk+cQugg/ohMvQS9/VtgS+kPFslD2/hodppwf75jpuFe42kNs7gW
 UgROv8/prv4R/zX9FdgIJmKCWP7iROWM7zNy3iGIb9Ml/VITcCXti69RGYsERti9jgZB
 anWxJadMmuOHqWD8uUWN1ArjCDFd6g7/K892SMYMH1INIDrYohnPpXN3RSoWyWYfHlcy
 qekg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=AIJddcHe
Subject: Re: [Buildroot] [PATCH v1 1/3] package/docker-engine: bump version
 to v23.0.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Upon further testing I've discovered some bugs/quirks with this new
Docker version and will need to investigate a bit further before we
merge this.

Marked as RFC on Patchwork for now.

I'd still appreciate your thoughts on dropping docker-proxy as well as
any objections to the CONFIGURE workaround to fix the Go modules
issue.

Thanks,
Christian Stewart

On Thu, Feb 2, 2023 at 5:13 AM Christian Stewart <christian@paral.in> wrote:
>
> This update requires a workaround for the non-standard vendor/ structure in the
> docker-engine repository, which has an invalid vendor/modules.txt file.
>
> Removing the vendor/modules.txt file fixes the build error.
>
> Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705
>
> The go download post-process script uses go mod init to create the go.mod file
> which specifies a language version of go1.16 on default. Use go mod edit to
> adjust the go.mod file to the required minimum version go1.19 for generic types.
>
> https://github.com/moby/moby/releases/tag/v23.0.0
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/docker-engine/docker-engine.hash |  2 +-
>  package/docker-engine/docker-engine.mk   | 15 ++++++++++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> index d15b1359cb..670cbd414b 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ee0e2168e27ec87f1b0650e86af5d3e167a07fd2ff8c1ce3bb588f0b4f9a4658  docker-engine-20.10.22.tar.gz
> +sha256  94492508260e57eb93399257d53435cd5308ca6330e173ca6e6f3dbf4c6e12f3  docker-engine-23.0.0.tar.gz
>  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 2a9b72ca78..9c193a29a5 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -DOCKER_ENGINE_VERSION = 20.10.22
> +DOCKER_ENGINE_VERSION = 23.0.0
>  DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
>
>  DOCKER_ENGINE_LICENSE = Apache-2.0
> @@ -62,6 +62,19 @@ else
>  DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
>  endif
>
> +# update the go module version to go1.19
> +# docker-engine does not use go modules
> +# remove the conflicting vendor/modules.txt
> +# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
> +define DOCKER_ENGINE_CONFIGURE_CMDS
> +       if [ -f $(@D)/vendor/modules.txt ]; then \
> +               rm $(@D)/vendor/modules.txt; \
> +       fi
> +       cd $(@D); \
> +               $(HOST_GO_HOST_ENV) $(DOCKER_ENGINE_GO_ENV) \
> +               $(GO_BIN) mod edit -go=1.19 go.mod
> +endef
> +
>  DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
>
>  define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
> --
> 2.39.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
