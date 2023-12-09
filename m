Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B548DC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F0EA40138;
	Sat,  9 Dec 2023 21:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F0EA40138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHbsGYWcdQKS; Sat,  9 Dec 2023 21:29:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B4E140140;
	Sat,  9 Dec 2023 21:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B4E140140
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD0A01BF263
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 21:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5B3382082
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 21:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B3382082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIuJktMVUzZY for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 21:29:38 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 272E582071
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 21:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272E582071
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bfe99b6edso3836401e87.1
 for <buildroot@buildroot.org>; Sat, 09 Dec 2023 13:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702157375; x=1702762175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oXU7tamMiYQvzOKfuxLKPfIrVPeDBs08VsiegvUddYI=;
 b=YDNxPVNstJ1E3jVzM3L1AXSZwyw0cnMYUKx/hDvfja5aTMnAVYwB+0ZBr6dp5KQ/2F
 TX88/Zh5bh9a4fjZUgxis4XDO+Sw0fdX12qUMXvHRZq9TUb3saVsP/97aXWPc1MW036W
 ivyqdx1QFNhw/Pa9bsvU0w52+N+h+c650ujSks+souXws57lmk06rewr5FZ9Uew4FN5A
 JdJZLzzA06Y7tuLVje1nO1tVcT0pPdAeUltqpKAgprky2Y6O+oK3SS9efWeh98n/8sZD
 DkwnfRgItHU3bAvhATovtZU1PagsK95GKQZkyjaYOcnRK2qbykZOz/sauOal0uQZDvfO
 0RxA==
X-Gm-Message-State: AOJu0Yw5eg7n6kizzcc6WgQ5crX8FRQZr/JVeo0gRFeTjXb+D8Uj1mD9
 Pmx18+ND/kr5ycXW9VZaVFWs043MBIuwhGuq7ZY=
X-Google-Smtp-Source: AGHT+IF8W5th9uj53IZAfX9DhwsmlelD1wLm50RYImt49U03J+DLVys6w0G9SLBgxFnMLz1hY3t4Rw==
X-Received: by 2002:a05:6512:3b0a:b0:50b:e056:277e with SMTP id
 f10-20020a0565123b0a00b0050be056277emr1100974lfv.52.1702157375447; 
 Sat, 09 Dec 2023 13:29:35 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 tg3-20020a1709078dc300b00a1d6591304esm2661726ejc.133.2023.12.09.13.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Dec 2023 13:29:34 -0800 (PST)
Message-ID: <a6f09f61-573b-465a-b5a9-6d175c313f2b@mind.be>
Date: Sat, 9 Dec 2023 22:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
 <20230902094244.0251e004@windsurf> <23317020.6Emhk5qWAg@kilian-aisec>
In-Reply-To: <23317020.6Emhk5qWAg@kilian-aisec>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1702157375; x=1702762175; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oXU7tamMiYQvzOKfuxLKPfIrVPeDBs08VsiegvUddYI=;
 b=GFzAfpuZMWUgbg3OABfONqpE3Tt2rWfPJNJVEGcBCtzN0Mn0TBOLgMElwTCDVT4+ls
 BCQQnCUQ5A2p5WRyGokcyLq2iFbMd/tHn7an+rIcTQDhByhZ1QoEwDKp6x7cmXK8ekdz
 gZJYlYapygkJPRY8UYI3cujbAfqEGBx6pPRBgXw1CaGy0cjipHqvO3oGvyOuN0UXT5fO
 182t60X9dH0RQuRCvXUa1vRie/WmYwYb7o3tG+oD96tzK3j63kGDPul/ljElZUi6Zm5m
 IdjBiED32HGMzWyipyhG12LV3RcVXu+g6+FyNkBmoZnvUkc/JyK0EYYhxbAuIYTv7Nr+
 TipQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GFzAfpuZ
Subject: Re: [Buildroot] Buildroot docker image
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
Cc: yann.morin.1998@free.fr, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Kilian,

  Thanks for looking at this!

On 03/12/2023 12:47, Kilian Zinnecker wrote:
> Hello Thomas, Arnout and Yann,
> 
> [--SNIP--]
> 
>> Yann has been working on and off on a set of Docker images for
>> Buildroot. See his branch at
>> https://gitlab.com/ymorin/buildroot/-/commits/yem/dockers/. I indeed
>> shared with him recently on IRC that it would be nice to have a really
>> minimal image, separate from the image used in CI (which has more stuff
>> enabled, most notably python3).
> 
> I agree. This would for example be useful if someone has their own out-of-tree
> customized board support and wants to setup a CI for that.
> 
> I started to try to setup a docker (please note again, that I am not very
> familiar with anything regarding docker). As Arnout suggested, I tried Alpine

  In retrospect, this was probably a mistake :-) Alpine is based on the musl 
libc, and as you noticed below, there are host tools that don't work with musl. 
Clearly, nobody is using Buildroot on a musl-based build machine at the moment, 
since nobody ever complained about this (and fakeroot always needs to be built).

  So, if we do go for Alpine as the official docker image, we can expect quite a 
lot of breakage... Therefore, before going there, I think we should go for a 
"normal" distro after all for the time being. Of all the traditional distros, 
ubuntu:22.04 has by far the smallest image at 80MB (this actually came as quite 
the surprise to me... I have no idea why Fedora would be twice as large! But it 
does already include Python, so after installing all necessary packages it may 
even out again...).

  So I think it is best to have an Ubuntu-based one as the official one, and 
perhaps a "minimal" variant based on Alpine (that we can use in the autobuilders 
to scrub out problems).

> as a base. See below a patch, where I add the dockerfile to the support folder.
> It downloads dependencies, then buildroot. When running the docker it tries to
> build a board support. However, during compilation of fakeroot, it throws the
> following error:
> 
> ======
> libfakeroot.c:147:13: error: conflicting types for 'id_t'; have 'int'
>    147 | typedef int id_t;
>        |             ^~~~
> In file included from /usr/include/sys/types.h:57,
>                   from communicate.h:84:
> /usr/include/bits/alltypes.h:240:18: note: previous declaration of 'id_t' with
> type 'id_t' {aka 'unsigned int'}
>    240 | typedef unsigned id_t;
>        |                  ^~~~
> /bin/bash ./libtool  --tag=CC   --mode=link /usr/bin/gcc  -O2 -I/home/br-user/
> buildroot/output/host/include  -L/home/br-user/buildroot/output/host/lib -Wl,-
> rpath,/home/br-user/buildroot/output/host/lib -o libfakeroot_time64.la
> libfakeroot_time64_la-libfakeroot_time64.lo  -ldl
> libfakeroot.c: In function 'common_setxattr':
> libfakeroot.c:140:33: warning: implicit declaration of function
> 'SEND_GET_XATTR'; did you mean 'SEND_GET_XATTR64'? [-Wimplicit-function-
> declaration]
>    140 | #define INT_SEND_GET_XATTR(a,b) SEND_GET_XATTR(a,b,_STAT_VER)
>        |                                 ^~~~~~~~~~~~~~
> libfakeroot.c:1717:3: note: in expansion of macro 'INT_SEND_GET_XATTR'
>   1717 |   INT_SEND_GET_XATTR(st, &xattr);
>        |   ^~~~~~~~~~~~~~~~~~
> make[3]: *** [Makefile:686: libfakeroot.lo] Error 1
> ======
> 
> I tried to research this. The issue seems to be related is this patch, added

  "Related to" sounds like it is caused by that patch, but it's actually _fixed_ 
by that patch.

> to an openwrt repository, speaking about fixing the "conflicting types for
> 'id_t'" and the "SEND_GET_XATTR: symbol not found" issue:
> 
> https://gitea.auro.re/jeltz/openwrt/commit/
> a162fe9a96fc83cb890944d40dadaf1091084f98

  Why do you use a fork instead of OpenWRT's upstream repository,
https://git.openwrt.org/openwrt/openwrt.git, or its official github mirror, 
https://github.com/openwrt/openwrt ?

  Also, that commit is cherry-picked from 7a70f78fb7da4dc3e8c58e7662f4dc623274a78b.

> 
> Now I checked the current soure code used for fakeroot, an it is obtained from
> the fakeroot_1.32.1.orig.tar.gz from here: https://snapshot.debian.org/
> archive/debian/20230724T160429Z/pool/main/f/fakeroot/
> And indeed it seems to not contain the changes from the openwrt patch. 

  Yeah, OpenWRT is _very_ bad at upstreaming patches.

> So when
> I download this patch and put it into the package/fakeroot folder, the docker
> continues beyond building the fakeroot tool. However, it is slow and currently
> still building,

  Do you mean it is slower in the container than without it? That's not good...

> so I can't yet tell, whether there are other issues. So what
> do you think? Shall we then apply this patch to the fakeroot package?

  Regardless of whether or not we create an Alpine Dockerfile, it's a good idea 
to have this patch in Buildroot - and to send it upstream!


> If so,
> the raw fakeroot patch does not contain a "signed-off-by". Would that be a
> problem?

  The commit that adds it to OpenWRT _does_ have a signed-off-by, so that's fine.

  In the Buildroot patch, you should refer to the source of the patch (this is 
_not_ the Upstream: tag). You should also send the patch to upstream (i.e. 
Debian) and refer to this submission in the Upstream tag. You should also put 
the original author in Cc of the latter. I'm not entirely sure if you should add 
the original author's signoff or not - I think not though.


> And of course I appreciate feedback regarding the alpine dockerfile. The
> dockerfile downloads the fakeroot patch and puts it into the fakeroot folder
> for now. See the patch below
> 
> Best regards,
> Kilian
> 
> ====== Patch below ======
> 
>  From 7016be22cf4b32e7b359bab5e6434991e1f0d13b Mon Sep 17 00:00:00 2001
> From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> Date: Sun, 3 Dec 2023 12:10:09 +0100
> Subject: [PATCH 1/1] Add alpine based dockerfile
> 
> The dockerfile builds a docker based on alpine. The docker builds a
> board support with buildroot. It is work in progress to create a
> docker based on alpine, containing buildroot for use in CIs.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>   support/docker/alpine-latest/Dockerfile       | 62 +++++++++++++++++++
>   .../docker/alpine-latest/build-buildroot.sh   |  6 ++
>   2 files changed, 68 insertions(+)
>   create mode 100644 support/docker/alpine-latest/Dockerfile
>   create mode 100755 support/docker/alpine-latest/build-buildroot.sh
> 
> diff --git a/support/docker/alpine-latest/Dockerfile b/support/docker/alpine-
> latest/Dockerfile
> new file mode 100644
> index 0000000000..cafd069766
> --- /dev/null
> +++ b/support/docker/alpine-latest/Dockerfile
> @@ -0,0 +1,62 @@
> +FROM alpine:latest
> +
> +RUN apk add --no-cache wget

  Is wget really needed? Alpine has busybox installed, isn't its wget good 
enough? If for some reason it is not, I think we should first look if we can't 
change our wget calls to fit with busybox wget.

> +RUN apk add --no-cache linux-headers

  Why is linux-headers needed?

> +RUN apk add --no-cache which
> +RUN apk add --no-cache sed

  which and sed are also part of busybox.

> +RUN apk add --no-cache make
> +RUN apk add --no-cache binutils

  I think it's better to have a single command for all the fetches. Otherwise, 
you're creating a lot of separate layers, which is not very efficient. Also, 
keep things alphabetic, if possible.

RUN apk add --no-cache \
	binutils \
	...

> +RUN apk add --no-cache dpkg

  Why is dpkg needed?

  (Repeat for many others...)

> +RUN apk add --no-cache libc6-compat
> +RUN apk add --no-cache fakeroot
> +RUN apk add --no-cache diffutils
> +RUN apk add --no-cache gcc
> +RUN apk add --no-cache g++
> +RUN apk add --no-cache bash
> +RUN apk add --no-cache patch
> +RUN apk add --no-cache gzip
> +RUN apk add --no-cache bzip2
> +RUN apk add --no-cache perl
> +RUN apk add --no-cache tar
> +RUN apk add --no-cache cpio
> +RUN apk add --no-cache unzip
> +RUN apk add --no-cache rsync
> +RUN apk add --no-cache file
> +RUN apk add --no-cache bc

  Actually, we check for bc, but I don't think it's needed for anything... The 
alpine container is a good way to test for this kind of stuff (all normal build 
machines will have bc installed for other reasons).

> +RUN apk add --no-cache findutils
> +
> +RUN apk add --no-cache python3
> +RUN apk add --no-cache ncurses
> +RUN apk add --no-cache qt5-qtbase

  I guess this is for qconfig? Isn't there some qt5-qtgui kind of package needed 
as well?

  But anyway, qconfig is not going to work in a container (at least not easily), 
so I wouldn't bother with it.

> +RUN apk add --no-cache glib

  If anythin needs glib, it should be pulled in automatically as a dependency.

> +RUN apk add --no-cache gtk+2.0
> +RUN apk add --no-cache glade

  Same as for qt, I don't think we need this.

> +RUN apk add --no-cache cvs

  I _think_ host-cvs gets built automatically if it is needed. But perhaps we 
should kill cvs support entirely :-)

  Oh, it actually doesn't get built automatically. It is only needed, however, 
if you want to use a cvs package. So I don't think it should be in the minimal 
docker image.

> +RUN apk add --no-cache git
> +RUN apk add --no-cache mercurial
> +RUN apk add --no-cache rsync
> +RUN apk add --no-cache dropbear-scp
> +RUN apk add --no-cache openssh-sftp-server

  Why do you need this? normally you'd use volumes to "copy" stuff into the 
container.

> +RUN apk add --no-cache subversion
> +RUN apk add --no-cache openjdk8

  We _really_ shouldn't need openjdk, and definitely not such an old version.

> +
> +RUN apk add --no-cache asciidoc
> +RUN apk add --no-cache w3m
> +RUN apk add --no-cache graphviz
> +RUN apk add --no-cache py3-matplotlib
> +
> +RUN addgroup --gid 1000 br-user
> +RUN adduser --disabled-password --ingroup "br-user" --uid "1000" br-user
> +
> +USER root
> +WORKDIR /home/br-user
> +ADD https://github.com/buildroot/buildroot/archive/refs/heads/master.tar.gz /

  Don't use the github mirror, use the actual upstream:
http://gitlab.com/buildroot.org/buildroot

  However, I don't think we should pull the repository here. Instead, we should 
use the already-checked-out buildroot from which this Dockerfile is built. Or we 
shouldn't have any buildroot source in the container and just mount the volume, 
like is done in docker-run.

> home/br-user/buildroot.tar.gz
> +RUN chown -R br-user /home/br-user
> +RUN chgrp -R br-user /home/br-user

  You can do chown -R br-user.br-user to do both at the same time.

> +USER br-user
> +RUN mkdir /home/br-user/buildroot
> +RUN tar -xzvf /home/br-user/buildroot.tar.gz -C /home/br-user/buildroot --
> strip-components=1

  _If_ we put a buildroot inside the container, it should be a git clone, not an 
extracted tarball.

> +RUN wget https://gitea.auro.re/jeltz/openwrt/raw/commit/
> 7a70f78fb7da4dc3e8c58e7662f4dc623274a78b/tools/fakeroot/patches/400-alpine-
> libc.musl-fix.patch -P /home/br-user/buildroot/package/fakeroot/

  This patch should be part of Buildroot itself, not downloaded here.

> +ENV HOME /home/br-user
> +COPY ./build-buildroot.sh /home/br-user/build-buildroot.sh
> +CMD ["/home/br-user/build-buildroot.sh"]

  I think it makes more sense to use

ENTRYPOINT make

That way you can run e.g. "docker run buildroot libcurl-rebuild world"


  Also, current dir should be the buildroot directory.

> diff --git a/support/docker/alpine-latest/build-buildroot.sh b/support/docker/
> alpine-latest/build-buildroot.sh
> new file mode 100755
> index 0000000000..39d31646ec
> --- /dev/null
> +++ b/support/docker/alpine-latest/build-buildroot.sh
> @@ -0,0 +1,6 @@
> +#!/bin/bash
> +
> +cd buildroot
> +make clean distclean clean
> +make rock5b_defconfig
> +make

  This is clearly not super useful as the default entrypoint. If we can't think 
of anything useful, better make it just empty (i.e. the shell).


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
