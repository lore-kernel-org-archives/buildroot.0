Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77495C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 21:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 178A340A9E;
	Tue, 19 Apr 2022 21:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFfExUG-0_6q; Tue, 19 Apr 2022 21:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16A3F40A76;
	Tue, 19 Apr 2022 21:16:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD6AF1BF3F0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB21760E48
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MSt2M7t_7wUQ for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 21:16:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9281D60E41
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 21:16:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id i27so35437387ejd.9
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 14:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sw8rQInZFmE+kNQPYrmhfvImSuyzpy+v9UKbTnb3P40=;
 b=YoJZVeaktRNQjrhORcuZ/o2dztU+r8t8x+2CCAp3ElBVqX9SgHIydnCJhS30yqrK7l
 OJJDX33/pDlVZkHhGBmhl2GC5O7QgZuWL3uc1Cbm3UPVyyf5YGa5QpNoAp52FWhlGiOx
 cGxNtucGk0wHgtwgUPXi7AVajzAnIAKnksaHt1PwLYTbGeF+gbQ3k3GRCj/mbFkEKwzu
 O2/GDq8gKVXsbm8rDKqqXV3AfJQKH5JKj7811ZbAwixYCOvuemnM63WgK6J8ICyMZuEn
 Q6huk728PuFtx8h05VtF85zUvTRKRhd6OOBvABlvRv979rH17HkKeYyiX0aoj2g+hoKw
 lqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sw8rQInZFmE+kNQPYrmhfvImSuyzpy+v9UKbTnb3P40=;
 b=dWpD+lst7SbhRKb1on8ltIys2FzBacAIs7NDHr46NvRQ373pbA+M1LaV9ovt7YQ4Po
 Nb58Up0isH9d79bdleLR65XWySXhAEj/OEFbf5R4/B5ZSWQ52/9gOAUagfFeRMNxxXUS
 unUPYulrWoH1ZIknEnafZTC4mDQJVBgKdjxgD5nTLHmOXN6wkNxqK/pzMZOYDefGXYyF
 XASqrF3VSUwGUVFGDCvfc0fMeWjIwDq2UeMUlgDOwX9cQW+cxUcTDEgk31NWU64LvVUF
 Q1hTVWAP9wmsGk87G+ipuYZeMnBG/pjrYOnTQmxbupxdDV9MF8aMyf3QP29TDJEyCh3N
 VKZQ==
X-Gm-Message-State: AOAM530MXvvbE8LzyE1rijmUwhfXjcQQg13wj5R0RODRuQ0iuiXPPtg+
 ig9xdU1S7NMt/TBnQhCN5jHKjQ==
X-Google-Smtp-Source: ABdhPJyst95t5QGjpJcs1MNcZj3DPdftyOTUSBPWDuVBdXepMoEVNz3+dXVbzu4qW/kqkxLASuBPqQ==
X-Received: by 2002:a17:907:96a7:b0:6ef:f52a:421f with SMTP id
 hd39-20020a17090796a700b006eff52a421fmr1132803ejc.752.1650403004595; 
 Tue, 19 Apr 2022 14:16:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 x7-20020aa7cd87000000b004207282701fsm8778389edv.63.2022.04.19.14.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 14:16:43 -0700 (PDT)
Message-ID: <6813316c-23f9-3521-1eca-df43f9205d34@mind.be>
Date: Tue, 19 Apr 2022 23:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20220414172857.35100-1-flaniel@linux.microsoft.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220414172857.35100-1-flaniel@linux.microsoft.com>
Subject: Re: [Buildroot] [RFC PATCH v1 0/1] New "docker" ready qemu config
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2022 19:28, Francis Laniel wrote:
> Hi.
> 
> 
> First, I hope you are fine and the same for your relatives.
> 
> In this contribution, I added a new qemu config for x86_64.
> This configuration is mainly based on qemu_x86_64_defconfig but it adds kernel
> CONFIG_ to be able to use docker.
> It also adds package related to docker like DOCKER_CLI and CONTAINERD.

  We don't like adding "demo" defconfigs that are basically another defconfig 
with some packages enabled. It's true that there is some value to knowing which 
combination of packages can provide a certain super-feature, but the problem is 
that the basic config (in this case, qemu_x86_64) is not going to be useful for 
most people.

  In this particular case, there isn't even that much "combination". Just 
docker-engine and docker-cli.

  The kernel config options do have value, but these should instead be set by 
containerd (or docker-engine, or docker-proxy, as appropriate), using 
CONTAINERD_LINUX_CONFIG_FIXUPS.


  Regards,
  Arnout


> 
> The CONFIG_ options added were checked with moby check-config script [1].
> 
> I was able to build and execute the image with start-qemu.sh:
> Welcome to Buildroot
> buildroot login: root
> # docker run --rm hello-world
> Unable to find image 'hello-world:latest' locally
> latest: Pulling from library/hello-world
> 2db29710123e: Pull complete
> Digest: sha256:10d7d58d5ebd2a652f4d93fdd86da8f265f5318c6a73cc5b6a9798ff6d2b2e67
> Status: Downloaded newer image for hello-world:latest
> 
> Hello from Docker!
> This message shows that your installation appears to be working correctly.
> 
> Sadly, the image has to a bit big (more than 300M) but I think it is fine since
> this image will only be used for virtualization.
> 
> If you say any way to improve this contribution, feel free to share it!
> 
> Francis Laniel (1):
>    qemu_x86_64_docker: add new qemu defconfig
> 
>   DEVELOPERS                             |   2 +
>   board/qemu/x86_64_docker/linux.config  | 112 +++++++++++++++++++++++++
>   board/qemu/x86_64_docker/post-build.sh |  11 +++
>   board/qemu/x86_64_docker/readme.txt    |   7 ++
>   configs/qemu_x86_64_docker_defconfig   |  49 +++++++++++
>   5 files changed, 181 insertions(+)
>   create mode 100644 board/qemu/x86_64_docker/linux.config
>   create mode 100755 board/qemu/x86_64_docker/post-build.sh
>   create mode 100644 board/qemu/x86_64_docker/readme.txt
>   create mode 100644 configs/qemu_x86_64_docker_defconfig
> 
> 
> Best regards and thank you in advance.
> ---
> [1] https://github.com/moby/moby/blob/master/contrib/check-config.sh
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
