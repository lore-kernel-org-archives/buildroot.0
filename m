Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4994C4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 13:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F98E404A5;
	Wed, 12 Oct 2022 13:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F98E404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7S7h2kWRGTfE; Wed, 12 Oct 2022 13:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AAF740334;
	Wed, 12 Oct 2022 13:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AAF740334
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19FC41BF421
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E906560797
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 13:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E906560797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKrup-3MNTVe for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 13:40:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 355496068F
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 355496068F
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 13:40:19 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 78so15518268pgb.13
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 06:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UuG6pGUCvNRdyCJCaOrWwP0eLpMSjDh48iLw83HGV9M=;
 b=RAh0fMyFWPQt9R5ppcrnhZ8IUKrnr3Nzli+g/HSz4Kr9OqH+cf3aRwlaLBq0NZ/r3l
 Qpkw/627kPkDJ4xJqSUu2D2KlXZsC+UM0UeI5tYXjDzSyfETTlbXQDsTqcx0wG2fPLtn
 aZ/HkpmUp30ZHLIyaeFpvqUWjGTDz1pwHS8rjgNQ1dcmFMuXVGyCcWDJRx3I76agQwCy
 XV+wmq+nix/H6NUMJT5N84jlpeMsh0a54ODsmsDcOHdYdFIZaYezuojVXQN3oymbikIO
 C0UF02J5hy2XQvCFzwd9L6AlK5l9uxbpftW4ckDEveGAanidJ4pBNSbzW0VLfx/0BKsq
 dmcQ==
X-Gm-Message-State: ACrzQf2wKuWWjsA0krFVNVKNnBIJbwpOcHlXq/7/PLGBucTlHdjZIkU1
 Fj+wyx4TlJmsd/0jkglqI6CEZM9d3S8KvopPJJmxtrnuXMctqA==
X-Google-Smtp-Source: AMsMyM72CyIxxe7iyNBS7NoZH+7pRKsWxOpa7MF5QdCRYoOBn2mIh1/G9LqHzT89FNHqi8R6BkrrTM727mkAj+2QN1s=
X-Received: by 2002:a63:df03:0:b0:462:cfa2:2871 with SMTP id
 u3-20020a63df03000000b00462cfa22871mr12427336pgg.225.1665582017666; Wed, 12
 Oct 2022 06:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221012053648.B5A9540519@smtp2.osuosl.org>
In-Reply-To: <20221012053648.B5A9540519@smtp2.osuosl.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Oct 2022 09:40:05 -0400
Message-ID: <CADvTj4qvsfU=-dmwfvqwJxVubYYvgfSgTS=xCeDmMfF26t_bFA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UuG6pGUCvNRdyCJCaOrWwP0eLpMSjDh48iLw83HGV9M=;
 b=GQI6ZkUrmeCwjYQo0A3RYeNGhi8Jd04xASAzU0n3EisU+yy+h0kicxGFpotJucRWDv
 kdGu4tu6UUR6Byz0rzY7P9bpbsjZxQ34NGXxl0P4cC/yD7UOcRAROR1jwm5OAL6xQrfx
 rNg84YlFUD/+5acKIs8QeWMyGbZ2Uqrhj2q7RCJV/X1M27Q8HGLQEQoKPuC0ufizm2QN
 elQ10Rmh68NRfX2E23uS10wCy8WhaL8sQ+f0lBnOv/tRc5xCFfSou/J5ngK5BC5PKMyR
 BHWgGxD5QoqjgQL8ccUQC11kC5EObZ2YvoTf80/Ei+o4jfpSxjQ1ofg65f03oYeFVx80
 DjrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GQI6ZkUr
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-10-11
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 12, 2022 at 1:37 AM Thomas Petazzoni via buildroot
<buildroot@buildroot.org> wrote:
>
> Hello,
>
> Autobuild statistics for 2022-10-11
> ===================================
>
>       branch |  OK | NOK | TIM | TOT |
>   2022.02.x  | 10  |  3  |  0  | 13  |
>   2022.08.x  | 12  | 13  |  0  | 25  |
>     master   | 100 | 752 |  9  | 861 |
>
> Classification of failures by reason for master
> -----------------------------------------------
>
> glibc-2.36-44-g2628500f5dff... | 375

Most of these are due to a glibc make 4.4 compatibility bug, started showing
up after I updated make on my autobuilders, it should be fixed by:
https://patchwork.ozlabs.org/project/buildroot/patch/20221010003515.796446-1-james.hilliard1@gmail.com/

>        host-gcc-initial-11.3.0 | 32
>                    bearssl-0.6 | 30
>             host-binutils-2.38 | 23
>       ca-certificates-20211016 | 20
>                       crun-1.5 | 14
>          coremark-pro-1.1.2743 | 13
>         host-f2fs-tools-1.15.0 | 13
>         host-sentry-cli-1.59.0 | 12
>              berkeleydb-5.3.28 | 11
>                         brltty | 8
>                libglib2-2.72.3 | 7
>               dieharder-3.31.1 | 6
>                      flite-2.2 | 6
>        host-gcc-initial-10.4.0 | 6
>        host-gcc-initial-12.2.0 | 6
>                    slang-2.3.2 | 6
>                      efivar-38 | 5
>             host-binutils-2.37 | 5
>          host-gcc-final-11.3.0 | 5
>             igd2-for-linux-2.1 | 5
>                    libnss-3.83 | 5
>                     sdl-1.2.15 | 5
>                  sysvinit-2.99 | 5
>                   autofs-5.1.8 | 4
>             btrfs-progs-5.16.2 | 4
>                 gerbera-1.10.0 | 4
>                  dash-0.5.11.5 | 3
>                      fbset-2.1 | 3
>                   gensio-2.5.5 | 3
>             host-binutils-2.39 | 3
> host-pahole-73383b3a39afe86... | 3
>       host-riscv-isa-sim-1.1.0 | 3
>               host-rust-1.64.0 | 3
> libsvgtiny-ea9d99fc8b231c22... | 3
>                      linux-6.0 | 3
>                  musepack-r475 | 3
>             ocf-linux-20171122 | 3
> dahdi-linux-5c840cf43838e06... | 2
>            dmraid-1.0.0.rc16-3 | 2
>                    duma-2.5.15 | 2
>                 elfutils-0.186 | 2
>           gitlab-runner-14.5.1 | 2
>       gmrender-resurrect-0.0.9 | 2
>                 host-go-1.19.1 | 2
>          host-protobuf-c-1.4.1 | 2
>               libarchive-3.6.1 | 2
>                 libcurl-7.84.0 | 2
>              libgpg-error-1.45 | 2
>                    nanocom-1.0 | 2
>                    perl-5.34.1 | 2
> pistache-3ec9d7c4f8b828fdd3... | 2
>           refpolicy-2.20220106 | 2
> toolchain-external-codescap... | 2
>               traceroute-2.1.0 | 2
>                  uclibc-1.0.42 | 2
>                        unknown | 2
>                 xenomai-3.0.10 | 2
>                  zlib-ng-2.0.6 | 2
> /home/buildroot/autobuild/i... | 1
> /home/buildroot/autobuild/i... | 1
> /home/buildroot/autobuild/i... | 1
>                     4th-3.64.1 | 1
>                      ace-7.0.6 | 1
>                apcupsd-3.14.14 | 1
>                     bat-0.19.0 | 1
>              batman-adv-2021.4 | 1
>              bluez5_utils-5.65 | 1
>                   botan-2.19.2 | 1
> casync-4ad9bcb94bc83ff36cfc... | 1
>                   check-0.15.2 | 1
>               dropbear-2022.82 | 1
>               erlang-22.3.4.22 | 1
>                   exempi-2.6.1 | 1
>                  fdk-aac-2.0.2 | 1
>                   ffmpeg-4.4.2 | 1
>              fontconfig-2.13.1 | 1
>        freeradius-server-3.2.0 | 1
>                     frotz-2.54 | 1
>                      frr-8.3.1 | 1
>                     gpm-1.20.7 | 1
>                    hdparm-9.63 | 1
>               host-delve-1.8.0 | 1
>          host-gcc-final-10.4.0 | 1
>          host-gcc-final-12.2.0 | 1
> host-gcc-final-arc-2020.09-... | 1
> host-gdb-arc-2020.09-releas... | 1
>                 jhead-3.06.0.1 | 1
>                libmdbx-0.11.11 | 1
>              libopenssl-1.1.1q | 1
>           linux-5.10.145-cip17 | 1
>               liquid-dsp-1.4.0 | 1
>               memcached-1.6.16 | 1
>               micropython-1.19 | 1
> mmc-utils-d40ec535b9d4e4c97... | 1
>                     musl-1.2.3 | 1
>                      php-8.1.9 | 1
>                     pimd-2.3.2 | 1
>                poppler-21.12.0 | 1
>               procps-ng-3.3.17 | 1
>             quickjs-2021-03-27 | 1
>                       rauc-1.8 | 1
> sdl_mixer-d1725fcb7c4e987ae... | 1
>                  systemd-250.4 | 1
>                 tealdeer-1.5.0 | 1
> uclibc-ng-test-0844445e7358... | 1
>                     wampcc-1.6 | 1
>                  wavemon-0.9.4 | 1
>                      znc-1.8.2 | 1
>                     zstd-1.5.2 | 1
>
>
> Detail of failures for master
> -----------------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>    xtensa    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/790fd9637c8bbd353e6d859db64c854fe2a4fad9 |
>    arceb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/84d2518c75cbb6a617eadfc40f9ffa042aec0989 |
>   aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/143430b6f17256fce77453ba6e24c7d26517cb11 |
>   mips64el   |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/ca03fa3bb1cf32ff8154b382d5c4dd5f9bd71939 |
>     mips     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/9b7d88d647c151df2c8888ccef4c2681d9540534 |
>    sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/562031e3a06287ed544072b3b40e1e98460ea53c |
>  microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ad184e25dee469d5573b0fa208da3fa888100e27 |
>     arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/151970c0dd2b244a1983dc08033581342c787e9e |
>     sh4a     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a3203ad10ddc5a382590635e005401f54469f0c4 |
> microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/17ffbb1cc5b104c9a090e999cbb91b2648b60369 |
>     arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c539423c3f79298e0ccd32f6d0dda7ebad376638 |
>  powerpc64   |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/de42234cdcfc5310bffdbc9c46d05f6a3e5586a3 |
>    mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/99205c6394261837a42dc30c488a3b25c4d0a44a |
>   aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/921a75548209405ac869c600fb5afa67968cac47 |
>    sh4eb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/4f41594b362de9d1c51534c91ba8b9d60703c5d6 |
>  microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b6bf0f2c716091e3503200a2d4ba7475b021a58f |
>    armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1831be6c2a55e4ec9ed0cfda464f9ccfbeb96e53 |
>    mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/85fe224a559e9cca3abcbeb018988d342183f8ac |
>  powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/295ecd7d8630bf4ee77814873f0cd413bc4b77d8 |
>    sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b6d9dac7e28093a40596baef54de42eb770e1ea3 |
>     arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/5ee2e174a7635d90395603289675432df00b5075 |
>   riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0d9a69a014a3deb4e6caa879d2b0224f100b6414 |
> powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/703d2dba1767f94150bb36333adaaba2cefec1c6 |
>   powerpc    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ab5fe6b3fd7cfe71e961b330b027995d834a5ea1 |
>    nios2     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a08032c678483768ab0839c176134c29838052fb |
>    xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b354baad99fda87f88318abed8cfe93435f8c2b5 |
>     i686     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/389a7e8dd448e01c5088793e59be1354864a3a8d |
>   sparc64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ae510ca630a71b9f459783ea0901c8bbe9efddef |
>    arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6b8cfcb36bc32e39fa9f6ee539915e3fb430cd2e |
> microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/4f1f1810cca2f7deb5b311bb19668adcc301c8e1 |
>   aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/317820f04974e3a712808385c18a82c15af36431 |
>  aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e79e9ad340a043f09f9e0c891250bbe04ca343dd |
>     arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/34a33d647e7e23d8640368fa20a87d5d318e5f9e |
>     or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8a4ac22c7fe2377a338b4a5e0e607f4ee9dc7067 |
>    mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8cea6e3c052768f2a58baf1a389d9b1cc3430943 |
>    sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c786e3a89b930480e60b14377b2a01261604dccd |
>   aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a597c19fb8cdb2acaaa9cf0721741ada3e874e12 |
>     mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/35d0f632942150edd040e17389199ba04d92beed |
>     or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/56bb0b11b0c18c2f6cd93f5714db69098532dff5 |
>    mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/dfd85db7add2ae8f5568b8c5eb96c7d5ebefcb99 |
>     arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/23fbed310b2e18db46677c919f37a4f980410ff9 |
>   aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/56be9856023e6526c33cfc8244c91cec8de7ce41 |
>    mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/feb913606e115edb5031619d3c419e2d4a379961 | ORPH
>     arc      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/1006246752ac677682c2438c506854aa64db5a10 | ORPH
>    mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/99928f58d16b54b42f3f6bd5280d0e43e6359cc5 | ORPH
>     mips     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/19679a8648dff153b728df3936bd0dccad376c5c | ORPH
>   aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/921a0fa9b981e74c658f5e1f48fe5ac31e57a0e7 | ORPH
>    sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/780c30d345a0540c4cf473bc9b17f3844530d23d | ORPH
>     arm      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/13df746762d022684d37bfddb4114dee3bdc1987 | ORPH
>     m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f63738733d11095a358d63567299827c08662083 | ORPH
>     or1k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/b7c6b02b1afdf2b9f4c4182bee9d17cca8a6c775 | ORPH
> powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/fb9310781efa54fefbc55b1a62e0aac606047869 | ORPH
> powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e4a5e4b469fa0086e57f0cc9add62c77e147e3eb | ORPH
>    sh4aeb    |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/deb27089f2c94969383d3acddb6e4d8e5e66c16a |
>   aarch64    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/1d886c3089d67e8907dcd61075c0904e93e55f01 | ORPH
>    sparc     |             brltty             | TIM | http://autobuild.buildroot.net/results/cc51db61d23c5553ab8489c241154ef4dbffdc3d |
>   mips64el   |             brltty             | TIM | http://autobuild.buildroot.net/results/f37b7d3826505699989f833e08494e5e5ff8e834 |
> powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/0346a2fa4ecf51196b2c3570362affa30f1f2b24 |
>  aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/4dd2d28f946cdaa83d0d5acb4795f260424a578b |
>     i686     |             brltty             | TIM | http://autobuild.buildroot.net/results/0d810013e82d88e7e052a913103462aa7b9a3388 |
>    armeb     |             brltty             | TIM | http://autobuild.buildroot.net/results/3a7fcc06550a3bdf902d0aeafcc7de93d50f358a |
> powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/329e426588507e977a329ab9013d8cc1268dbeac |
>    x86_64    |             brltty             | TIM | http://autobuild.buildroot.net/results/261ffa03a739ce689fff825b355a36b20a2f0145 |
>  aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/1ba1c19c2e5e8630c8633f326073eef8b6ede5e8 | ORPH
>    x86_64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/97f96b4e026c6165cb41238a5d5f92fc70020ecf | ORPH
>     arm      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/24ce03d937582846b93500a86baa10e6e1aa8e25 | ORPH
>  aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/b7f2827712a35b78039bf556aeded9f6dabaa796 | ORPH
>  microblaze  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bac3dccfbc9bf3048e7c551b30a0e1a4302e8152 |
>   sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/97701df77fc1dbc7ab7dba521a76ca3e38dd8912 |
>    mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/93767e568b51622ea3d4a95afb411384a578a5f2 |
>  aarch64_be  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a2f5f4d7bd6cdff954672c79a1611edf15265a0f |
>     arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a72f7e0dccbd469fd51d377f645efe366e5a3df0 |
>     arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e9fc3111c5ef6d606c14c109d82a845cf51d5965 |
>     m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e79f9b6d2a4a94ef933c77abf781a0a31ae46813 |
>    x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/edefc59ddb4cd65509f6ae2cb9f6fee5ba6837ef |
>   aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/537da7f95f7b37031d7143d13b36fbd3a4f97acd |
>    arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4e717e47839dfb34487c7b186636e03efb1544de |
>    xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9b7935e00f3494cd16bbf6461a4f87eb0b27ce59 |
>   mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ae35248b608d6ca5ddec053090eba4d61813cc78 |
>    arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bdd3bfe442562c59c7ef9792715fa6d1b4017f66 |
>   powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8b1b1a3f32ccb4bbad188034142b10bfb73bfe18 |
>     or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a06264c8fd1cc718ea0e4fe9f876f27831d8c765 |
>   aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/fd8aff30a8e5d726b6d2d2ef532bf412df8f58e5 |
>   mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d7206649f7beef443c5c063e76d1d9aa07420ad8 |
> powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c9fab74d89d42e448f4a047d5e485533bf32cb0d |
>     mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2ac539fec76900f7e1bd3bbc7ecd04348cbaf309 |
>   riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1c68f8e1067f90ca9f44788f6d5c701d298010c3 |
>     i686     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2aa328c22ea6ef21a8f8a6716bf92c47b49fa685 |
> powerpc64le  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/3272f3c49d9d078c9e9ad4ae3c57476fde30d52b | ORPH
>  powerpc64   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a4ce2bf5da54beb72064b143a75050a439208d33 |
>    sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a393838e5bde026441d3283c1463dade0983e56b |
>   sparc64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/b6112a60828ac6c8765f9f93603ee30c928c2037 |
>    s390x     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/e7583a8e6feb62737b229ad5a09e2c1baee01baa |
>   aarch64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a1b0462bc20f791245d0b47051a9a478b94455e3 |
>     arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/2b8e33beead0c006b3d2b2264fe125d6ae670940 |
>    arceb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/62ccf8eb674edd2bdd5e39f37bc7c17cc94e3ab6 |
>     arm      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/d67adb8ae6b8696173544d9bea097013951c3cc6 |
>    arceb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/69b525ffbbbfefc6d5f8b51bc1e5cff64e99e7f7 |
>    sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/d55fa9f049882c33c2bbb977b919c3ea70f33a91 |
>     m68k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/01c3cffa50d7ab7cb6dfe4480a921785a021e7f7 |
>    arceb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/7e4c74c23cc44326e817aa49591158edb0ae09f3 |
> powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/cb071dc01a3013177f61d42df091c989d1bdb60f |
>    armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/839a08988aad929fdc913372eda4cb87b4835ace |
>   mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/80de4548e9f67521282fd613fdc03ffd3b3ae6a8 |
> microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c20e2e5527bcb40f3abda961c66a0061ef3c4e82 |
>     arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d865eaea5fd7065770edc925e96c825538fb5ef8 |
>   powerpc    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2f3adef20f6e97ce847b89341a4072d054287c75 |
>    sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/aa6a1b08eabdbb785ecda23b835c27d5ddd6a696 |
>     arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8fb51bd98aada4fa235509f0cb01a53db24860fb |
>    xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/29a152c67e14984621088524ba3bbdfa7ccfeb76 |
>    xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/18fcc3777a162bc13e296b5dba76288b084ebfca |
>    armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/fb53c8cb6ad0143acc60ab67d4f42410f0ad27c4 |
>    mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b51c6e7b1c07129ec291a90b6414b640a3243a77 |
>   riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3cf4eb323c8898426b209b638fd9a16799cf9579 |
>     or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/484127fdc4bc9a83456e72a88fdabb89454b919c |
>    s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3a8f09086d881d6462b8ca2746a502d6bc1846e2 |
>    xtensa    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5c2d0b6493ffbf52e9627e5d65f7b80681d5869a |
>   riscv64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/8a957e8aeef0400a49f057d0587d3d5fdb771849 |
>   powerpc    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a2bcaf4556ed797dd8c5b622bb0c33c17da4afe9 | ORPH
>    x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e4c6830e947fc9a01bf03fcc85490e15864bb0a1 | ORPH
>   mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/045a4049ae7bb2e7000feda1a3afb17b69f0d2e8 | ORPH
>    arceb     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/ea7b9e130c7c82933365e66ba7a511731b71beff |
>     m68k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/7be8b87cae2f75f5fe836a04df54b72a95be780a |
> microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/d8a62b292b68076f4ee1032d6ff58ff5b6fe1013 |
>     arc      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/2df0e815574d5b1e228a4854d502599a5523c757 |
>     arm      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/e832f4c0e39fb879d243a908630af9ec6d6eae4a |
>    xtensa    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/3170cf77eed465ed6078be52b08e2c90bc326732 |
>     arc      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/99522bdfcc195585aafb40d738b95d1e5c9e5980 | ORPH
>    mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/0ef821cc9f725d0812bb08f5c28a5c486688cd02 | ORPH
>   riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/50a6580fa85f87ddc6b4ba69dde0c7ced2ce6d71 |
>  aarch64_be  |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/e9527fda55c5aede1a998f87077314f5436793b9 | ORPH
>     arc      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/e4504eb874b6327efc587b0ccab9ea9a0b3baa34 | ORPH
>    mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/afb2d3014e60410a5c08cf02ff1a959bc8ff4ef3 |
>    x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/9ff45e12e4be0f4254aa7034ddfbc2ca0cc91956 |
>     i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a9e8b584fb65ac475db9ccd362323ac74b49e1f4 |
>     arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/b45c7b3c6d15a37846165f14a14ae95e8ba1bc25 |
>   aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/72004e0791681dc8beacf60cde1056a1a83af177 |
>  microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6f440ca4d36579026ea8d1fd45d8f80dd17f093e | ORPH
> microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2582d40ccefd446fc347bd1388ce92c99a0f82ac | ORPH
>    mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/b227bf90f6b7c9fe3c779045f8cefcaf3c152fb2 |
>    mips64    |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/53d17d65c80dfcc1799592de7aca618cca2c3e20 |
>    arceb     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/3f5d5e7fbc07e534918d0109953ed7a9c458243a | ORPH
>   mips64el   |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/993a2397c4ec92d2c751efa9d115dd9b2c43fe19 | ORPH
>     or1k     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/709e7c4025d027766bf65d1195baf49072a87750 | ORPH
>    x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/11a56833280bb781a175746977a1fc5ab59d5499 |
>   aarch64    |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/789215d1a24ee66cd8ec1e74eafe155838b668e1 |
>    nios2     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/a5069e0c7dbf4d74d8c2395ce874bbb5e106eb25 |
> microblazeel |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/ed0a326f68c429ea95da0b8b0376454b7e39947d |
>     or1k     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/a17130de81e242eb9fd34a95b5e27b834021da6f |
> microblazeel |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/4e3962cbcd7ccb22f8b6093ce6ed7fc7e0c2f139 |
>     or1k     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/c06b42efcd0da915da740fef3fce0fea1f05aef2 |
> microblazeel |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/eeeae56a9723bef13b397167ca433cdd2cf933bf |
>   riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/16f0f845d3f84823c0e7e9fa9743f0f3d8a97adc | ORPH
> powerpc64le  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/a24f98091db6bb0e890feb72638b96d3c32cda07 |
>     arm      |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/d0332c6b8d3253214e0c912a36dc68d56d0b5eb0 |
>     arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/d30d43a9cb694555e79f8bc646ea8dc9ea2851dd |
>  microblaze  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/8ed57e6ba7354cb8dc2ef9bacc81f82ffd0dc59c |
>    mips64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/afb47a30e019eb171851ece2c2c1b4cdfd96cf33 |
>  aarch64_be  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/d0f1bf9784436978f0fc3abe30ba43f6cccafc30 |
>  powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/96e40521e06da675e1b3bcd8452d169b6f5309bd |
>  aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/926a4ee20ea69e45156c78a7f78bac962ef9d55b |
>    sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cd7b1f3b5fb868a85dbcf8af0ffdd75674bb5f2a |
>   sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/252716069f100a0e8161beb909ea303d47526b73 |
>    x86_64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/aec701e2328411817b19b6c85c2e04f5bf0e9cc4 |
>   riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/a5f06c86470af298491e359a1c667a8677dd2e54 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9b8449ce4a0701d6b6853f0a684985d4c6abfa97 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2d3ab471b470540dfb0055f3942002bcf697624f |
>    sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bab8058e8a6ad545e0a85f19a6521287b3b6eda8 |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9e79a959c4c81dd0cc660d3c82f36fd84003e1c1 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/be0f3a99ca1135d1d64971b71051e7c686866497 |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6100b93bd310d24df7b9f5f1091a767ae666f427 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d14af6bf6cc3cf219fcdce86e19d92cb4a757e50 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6bc19f452dc73039467420ac47c01b776fdd36e1 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5ec083468463bc4fc50a21066018cbc73fd54503 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0f41e97f808785401b708e795b8423b21d19991f |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7994d0025251175e4243701171a6b7210b8dbc16 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/197760dbbe212de2206e842c152a3eae100611ef |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/579408bf8be26c705ee623603f4cdfd650286957 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a5426e18f67c88eb70fb3d1188c876a9c28da995 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/227b55f86346bb802e07be5f3be1f3a4060481b6 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f7e191fd726ab704cb572a9aa235aa93eb87403f |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/824fd54cb9fd6809164860da9838a86389283e5b |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fc0cd8fd99099e557ef941d0b62b890d99cb073b |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b5a755d5edbb57adb4bfe390bb2d18b10fe910ea |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/869daf57e80d3d3cde4b8696e7b6e63f635dc06b |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ce5a7463d1b835868a3dbad0e41069afc3f9ba79 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0043357ab7ac15e35f70613f7cd0229e472023b7 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/09e49a679e03b5ab3bf1ed01fe4780854ef84bc8 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3fbcdb0dcf52094181b1d69be7735b04e3d30d3c |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b9f1f1f080ac92b67dac4265121a702bf01d606f |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d10d8baf5ba6599fa65f1811d832519336e91bcc |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/97eca688cd177f750c3cadca2ad1a0dacd41d80a |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f46d1496ae8da5f85c4fcaf1b4e41a0fa58387cb |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ea2409526df5c15a6c13158bd0f5babcaec9f0be |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/00ca0eb3c2dd1b12fab4f584b082013cb907f056 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e03d82c56e8c43448290aa15df69dce3453aec41 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a0a0eb08a321860784e995c5fb2909cc3def409d |
>     sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18f58b9f6a351519c81d2c3c774f6bba7ab7c981 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6877a9cb7e989ac24c771e21e13afb26bb1410f1 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e5bffb780721763b384e84538c436d3f68e61c2c |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3e67f1a5c5afe559d43686b9005158d5d5bbb30c |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6544f70979d3e542eff1e34c33e41c5c80c3231c |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fbd5d5877126e102098247265e05901b8ec8fdf4 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/132a75774fe8cf15a94861da3ecdd2d3909d13dc |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/37e17c3af02d4f6bec452cdb9a783d54178fd983 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/13a8a904b51b5537f3ee6d94905bbc81a6638e6f |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4ac8095e3a920e561ae71513fabda6766546065b |
>     arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c7ee3b7a9aab40f8c26042879524b52facc49437 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8b2cf8bb94cedc078c482e7fb711bae8a9e3c60a |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9fc0da2baa6227b56e1577df80222bcbaecdf95 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/72efc20d3df70bb90aa2a7d1502309162211f692 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a984cca0c7633d6240e5385236298a06d56ce636 |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b1132401325aea012031c704cfb125140881817c |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e061bb7a5a013c12491375ec0f47c8824d5ba8ce |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/92cc31862fdb127a2e037bd57f0b8980d4dfbcc9 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fe9c676aaa7b32c3373e52fea0f81d5b5c42e6eb |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5b7ca2e836f7f735af00da34ec556948e9754ee4 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/753d83439e284aee147f43ce65ef36a9789c5fce |
>     sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/169c25f3d5c72ab53e50ba874ceb10807eb63771 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1eb5dd02f46fb07aff26abc50bd3f59dedf5fefc |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0bdb0dd286fab729e28658222330f8a06df2ddbe |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8f099f608ef9e9fd42fe528baacafac72218b50b |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8d0d3ab0b8ea3b79f5bdddc9fd1aeca5482f2662 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e517fff50e0402309f8b143991f972bc41b9a26a |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/844c28be7f81cec0288242efdf66b7feb3b10934 |
>    arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4357f40408a1efe90f126a7f4784af1c153629ca |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2592df306b91d3e1115efd026cd32173bcc20413 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/92adf732c43cb97b96ba7a4bf383a3fcc4d83a2f |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9657daa044fd9404e4067e1419d6f5b68153d1f5 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/15402c37f18d5283676b77b085489ddde6d6017b |
>    x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18062b80dfd9d3822e3ba2c440d2fc87b22d9ba4 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/32071db54d552586b87b340af2083ad884429553 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3b792116457696a4ba6ffd2b461cc3b81af991e6 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/13c87c2db1cfcd46fdbb364eb3ed1bb053d783a8 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ca918494d0ce5445f41f7f51f9bea31a5e81b2da |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7b4346a4f91849f6599ee531fe789dedf88bdce0 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/93da532f18bfe66025ea12e7aa225a347c43d790 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bae14c6e7ae9bbb495ac4f58abfd1e76236d85b3 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0d865c91be2760b3de130790c9a03003e3444d6 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/290aa1bb2d3ff882ed7b673d559a2fbe3f99dec4 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ae3a5db26357700cae260639c6a6d018d8a513f0 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5175dc0c2476bc3505b9d2c36150c319b49d9c84 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/811a77851fc77577c8b64a3aa383833ff23006dc |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8556b25bb120790eaf470826b74f155d80468bf7 |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2e8b67631dad47bceb27980653d9aa6cd33756e5 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dfa641b1f45cd45893b0237ee8d7acac530155a4 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5a5b6e22f567f2652fe12c667c1458d907dca008 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dd197803491828ecd255f178ab359dc758b6d551 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/90f7fbc896d78e5db954be1a0662eec9f94efaff |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b2eb56b509940eb2db2084a597cc4b3a7b889ddc |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/62ff8be7c0942dce808bc3d8911b589930d62003 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/932b53100fb00ca419512b1a527d52c1a97d4060 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e6556d0e82f8a07867624c7492e94608c6338927 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/59e2cc31fa7583f5a88637a1b55894387a14aff2 |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a1e63364e83486dfa37fc53fec2ae1365b6df821 |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/93012f360497d909f401972dcbcd7373ef956650 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9dfaa1ef64cd1b35f469c76b91c701a2f640d42d |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4ea7803178d80cf14d6d54944e2e01727434f5cb |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ba4aba9ea2ab12569869179cd24ada8bba3c509b |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5e2498666801200e7b614250e8077afc3aca86b3 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7ea1e8ae07860af9af27797d0dad07a3718101af |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/320d81f4e574af1fc3d2ca03e1fd013f946cd8fb |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7ed4163fff6eecf41f2adb67ebbb0ff46c4ee067 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/abbc4e64ba2a3dd11a9712bc42d17067bfd09bec |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/34084d48682ba7b3ffe3795eb7d9c9d6021d2106 |
>     i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/80346009ac641bfbb1b3b84a9dbd673e77f43aa7 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18a5982e523d3ab1b594692d1b90ab45b5499e1b |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/638c11b8feb97b4a848591f01d441e1bc77320fb |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fed2af45405686f7a1d916c4a468e8dd934c0559 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fadf874a3b909dbda16e5a5ef9e740b6c841e06e |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/69dbc2472d1265ba8757310766f5cc505ed10a7a |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f5e8b7a6bb748491716a8239fdfe20d28732ca0c |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/769b94b93bd26d200ab5a2dd0294c1592dabbb00 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7e2119de0ef22de0c8294b7e3a2d9e58f8d76db1 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/647d5376a2b18bb0cd7b0f22d4f9b496c13cd2be |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2695ca219a4cec71b520959ee970cfd187fe2cd5 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9679b9f2c651365426d6a3caec76ba537b42dbc1 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/25f62bc40d7ada1032992878696519e515bfe9f2 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b9696e19fcb9d238dadea69c807d66bc8b18ebf3 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5fc22e5fb104308ab032b921b41a6bbbe7429cb4 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1e3f063015514b2e47745be6977a07e67475bc1 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0851e64d360ba5d17d328dcbf228e92d5e1dc306 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/243f0a394df612342146b23c70dcab33f31c1d24 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2209845634d2f0c5a1531cf4a259edfe04409633 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9fa211a6540003c246f5e21da5f1506021e0ba8c |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f0ae2ecbd536714a38d60407085d28c2b4f16fb6 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8997c4b28c37f81d6c88f1ef7d71af6e1621e94f |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b35b50e5d333e926122b42affc57ada1f444ce53 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/97e5c04cd297638fce8d0c8c23f28f6e204f096e |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cfa28ba84a15f414799c14e0a885cb1eeb03bb2e |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9617020b9699f196d5bba18b195fef6978a30220 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/97d2f1349e8e9575c1c71c9b6932960fb88d88a6 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0b9252a98271edc5aeb33d8f0fb6f780f40bfff1 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/72280c51159770f90830d9c0ed5816dd6a35c386 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a327039176014894f7eb5dfd3788750b3fe7c502 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bc418cdd590dd65dbeb201acd9f71cc0fcd24c5f |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bdeea5facf85e2c5923760599aa64233ef9eaf70 |
>    arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/61629cabf7625216807d74b7bf514dc6a0d47baa |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d544107673411caf20dd11e43126d2ac07a322b0 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6d2166a12faee9992cb28207b03660d614a49bf6 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/216b43be158a798ec5b42c7c0a0ebfd29a0c384a |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0e7bd38d61b830b8e213e399e28175dd00c5d3a6 |
>    x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/77f6a5f97f1001706eb7062f2fd57a3e57a6ba57 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1d11cbb2353d750e1b864d02b74df278382edb64 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8e73d84ade8030478428277c4b97aecfc2522fa8 |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ca018cdc7e4523788ac0aa01233c09543ebde770 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0b215925e91813db68fa600bf1d6896e55b02dbf |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bd82425aa0f9b0e25cf4425e08401a905311e8fa |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5406b5d32a64ee82a4db1e884553e08727dd98a0 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d4930f9145d6f393ac9bead727aaa9bf2a8d167d |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ccf0903e529fd2820f00376ae136c60cf4ca523 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6f8f7cd96ce9cf39e344deb178dee02d062f0ca4 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3db806c0cf126018292d3d83d81410cee6379f59 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/45bbe47d649018f8f156ae46d2092c4c090072a4 |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/253c6b5bb66f54d5707f9a39ec3ca589d27aaab1 |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e3760520241b05c858c6a31c7bfc08d6f700eec4 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/28897f3ada83ec56b8780a5b3fcb158968421075 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/62e35a296840d2ddba7fdcabb16672b0d823e458 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/990f379b53c1166e158db161b7b13104378104b1 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0357b9f08e50108cb61b9189df77e649ba0c846d |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5dcdb2193cb5aa9cb7ba8edce0e3b1fd2de32eec |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/875e7b7b234f232d02188582db5566722b7be80a |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c690cfb07c2ef73880b558524d4a9280869eab26 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/49ad59c3202f95607e0621ed8d88d4ce212a207c |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/10e1aa871ced8acc2075b2df25d4f5f6a2d10156 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/75fd8a9234691dd1d44bbfa0042313f1b68b8936 |
>     arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/89ac8837710a4df60c222509fb423f4458efba54 |
>     sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9e6bfd5ec65df0286efe0c89dc703431b558bfae |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cbd98e2fe401c1337fd9c0754b7dabdd220d36c1 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f0c775a5a6ffbfe083974d2d3a31b8bafe2868af |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/86545991d4f7d82948e21c5873b10704c3012a20 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b99875abadc907ba1d41991a423549627304a2fe |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ec93abd1ef29c281ccc75e177be6740134359708 |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/33ac614be44a5f65bd7b9f879104991dd3e5544f |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4849fa1599c1ab0fa3886c0a4af57708ff4fa081 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8508fd20d6119c62a6bb8cdf24a927e63d31629 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c305439077dd6aa173b5ceb7b6286112284b825e |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cbfc701cd352f1e8c98d92575d38f4307259f44a |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bd335c2c6e7bf83de0ad36896189be0738b45a13 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/10be76c03ceafd9413395ef5f82ab1828788df5a |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d7c14e01ac5dba53ca4599549547a07b63806fe3 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/eee1f579ee3f28c54c10c20d5f7b5818a391fba9 |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/344c0c2fd584c7c1a2a0a14eaf443d2e7d2289af |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3f553f2232214162253c5895e56dae90f30767c4 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5bc54dbe6567c1a723babffa7a19f4a62edb8a28 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4333ec208784c95d2006ddf58d67395d0f357b03 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fe9b5b424506bc24b47add6c8b6a9f4297c9f5f7 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/180a9eac416b5f7042c62e6c69aaebb356895a07 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0b8b8f7de679bc5f38472a43bdd6ea2e2360e63a |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d2395eee36661fc62d46d98404469feaaca0b2b |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f33acbbdf0661e4e559a2e4f8d89ed7f4234d473 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e92cb0a382e6152ea0fb259031c9855061da07f4 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a58bb073af3dd7d00dd379139b4f76d9904c3ca8 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d47d8caaea168256e17c104acbbaa33da0932331 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/48ee582a4fb7b6a4cd5fa66460c689d2aa25c23b |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a36467004d2b4795851ccb306f28a3f532c3039f |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7b9c8c6f2c250a892468c03be626336b635e52bf |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c64cf6c663371a28b6b11596ed6603ad870fa387 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/63e7b35aef8f9d982a5c64d384582655cc9773fb |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d457f6bef1d38038a30a034416f40a68a18c695e |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/016bc1e129b882999032e88b738dd93a3b29af8c |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/09d96d593a6d19b751c89dc150e98f41bda0dbf7 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dc78641f5f48c6b4924102ff65863a98f8f0a75a |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9d6c247bc4b76e28067e215f2aa79be3fa805db6 |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9a454eda7bcec41f6f3622b9a0abc30c7130daff |
>    x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ec9680834ee7249d7d67f195d7fb6907b8576a31 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f6fc663bb77eec235d82269591bf8f22ba681011 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8433a6dd64879a71d995099674da505fe5db5a5f |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/026144a41cc5311b462465d3fe7f89a797206ef5 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c2697b36c09706721c3e8d2fa3da87177c50b64a |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cd4d671d859f1f342c9baaabd998a384471b29aa |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ec7639c854910f1c93b65d1eaeb73860daae29d1 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3a5f0dc13b581916b7c8170324e61a38994ac4bc |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bb53571923f4c519b0a55166d626468a03d1f368 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/770d7b4de2eceefd95da021ae216fe09aee75c92 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/808a818ad85830e76846db03c5bedd7e726921b9 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9d7a2d30030198d9d78482fd6542d0bd6146b22e |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ffb78b9a703d40f6d10ffeee5a8dfae55607200a |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/884df5432d1b1d06eb3f9be1b0450a169d94c6af |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/459d0fbe4dabcbf94e321e3c28c3969d4f4d7769 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2b3d7c46fdf2b2809be1a2bb622ac374d84b5938 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b43193f19fe9d155f60edf3aac8ae269cf7d3fbb |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/75c6c863c607ac4590f760ec7f98e15bc11184cb |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bed79811171c010dc2994550cb0405f6f92e2ead |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c2b1f509a2c2dd6ced12f81a46e1c2bead590e24 |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/032166dc4714176a69fe15b63155fa42b1dbff34 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/58e92c248e7bb244b4328b7b82452066ca12f62c |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6e5b04a4214f7ac3603b293cf0c0a04abf426b5d |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c1f81af6151a2049217a088be007c28457df4733 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9847d269914997664cba94a4c636cac44fb3a7e6 |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ceede7520e8df238c9c34a8243afcce4120971cf |
>     arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ee725f47ba28f49fbab234c7d6227d00159b32a1 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b903e5647accb5432c0a494107698c10c9e62f28 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f75b58b0a2e40e8c47c6e21355173b4930291d57 |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1d4eea76d6ffd50e3f7f38e91b85e7c1fc449304 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/41d076a6fad75a9d698ba334af1e8feb3899a9c6 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/00ca61886ee747878071aed7fe6a55200bae382e |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a0c09d6aa6b5c594f264d35f0565441555916061 |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/14e66b7039afa6229f4af7da10fcbb4f9e4a954f |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ced681a6e4ddd0a7720926241aa8906cabeb0616 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c1e518a42495d23caf8af81461dd51915a8a26d1 |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4e609064e0cef578ea9571ec64861e1c2fc28d8e |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0445b79cf03d39a85251cbd152656f1a9baafc8 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/43970fc116801205e40f1fccace2651689baf222 |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/882984b7dac01d31179bd5af3365a16ea3486101 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/31c55f997dab1c58caf32729b2c97ff19bdf2f5b |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f5117b26637e191f7ba23dd8d9c01e6732ec937c |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/049c92068485afc0c7d248a798931f52e6e401a8 |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/769f694603c1cf80dcb6b1302624982a8c1adf0e |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/888d2bab0c2e352f04ee76e7f12f4632ca07cb1f |
>     sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bdff0db6c799e5b079e6414d86dd95b767442176 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da2830c648efb5fd6e3871c5be4a1a72d90008e5 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8716d1e50c828494ec37e6a2ad0a038fda2cbb48 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bb5ca785b41c04f0d210d51f36b587db867bdc71 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ef65ff32b03c12a80c3abe4559afe354ca0b070 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c9b789130b3bccf2d95b7131ebdba0c30a6ed6a9 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d4a198d9ec80370fbe1f64d079942166fee04708 |
>    sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9f7f177b633a021cf7d3054f3f6f5bead0a0ce43 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/157af5e6b5ae30f1f5d1e1302d3e3932968e1321 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3feb51541fb82204300fbe4971ed08757d54866e |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7d0483b954f75c4212149101fef44ca0a4148351 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95aab551f66289e146c034f878145bc4b83fdfc6 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6d73c08783b507e3934363782b8d17bcbd17246d |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/675857450f360a598570b1485c944ae1e5acb5dc |
>     i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2e30934fa0bc715641967c0d799eb2a5b09e67ec |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dafde5108a995e51f9d4fb735599a5f46803db27 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/558e564f0716183d79140f0fc35075f4b422923b |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0f7194bc7d23fc87d49e7108ee130471a3a737d7 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/61c3a8cd16b83af35d0e06fbb339c116614ad888 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c4d336a1b1847ee9188c2f8d1871f7e130baa4e6 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1a45ec466ee0217b92b6d2d32ad64584683b0630 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/22f121fdc4ad9f4c1e192eec23cd385a7dee0cce |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fa3704162680d5f2fdc1130027f0935d0c6a983d |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e07e52aad6282c35a38add0a1cb9009b4d634abe |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/714f7a6eb03169893f4bf6adda8ef80f6b493868 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f901a2098a63a0e3a7e580c963f219637d2db680 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3a92243bf390f9beb2e23a8408971313e039a0cf |
>     i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1c77abf4034eb74e99e0e7ba8fe86e3fc797aadd |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1c4e19e5f83e4cd990ca49dc0e5b5675f34414c5 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/31f6c9ed0070a156050af4e7bae6997378ca5132 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/07751664b5050850e248a1519c91b4d443dcca2a |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/827680dbadaac87c79d4144b7e3ed886cf46da44 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/69a44d30ac31f8ec2862d1da45d0b3efd6f79042 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/39525562eecc21bb1da2ec0aa596cd52207d66a5 |
>     arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1c33315d339a7e97e86d7384df6c4478d4b4426c |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ed521f1aad450c0b85cdabf51f4ec3e52738981f |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/70ad30eed7f49d40cea72987db017a09258fe1f0 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fa305b931f8800253625a24461a9459764bff625 |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8b313d509ae32a8920f7dbbd69110d1811d9d2bc |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ecae3edcc38b4d2465d71234eb067d27eb90b7b6 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/070f992e4adaa7f6e65c6cd3498137616f9ce398 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/044a809a02b8168ba379e0b658894003d7f524ac |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/890d413e7b788725e72a8bfbdb020f76410d05d1 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ba4b4fe4945c7dbb3d174897d73c9036d40011d6 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0e11e849f245a968825dc755989ecea621f4c0df |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5c8ea6f531626f9fef4a56fb88626900edd69070 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ea928938fc6c43aa16a86b41dd7c7026a8313f45 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c88c32c98a2d839eccbe05fc509e31f0e7295e19 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4e90e9e7612fc5964737a39dcfa3133ba3ad2a70 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ad1b4736eb8f6d23b094534100a65b3f16242953 |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/478b24fd23d07f835fd70f199dadd7cbd15aac00 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/000979ccc0f49698558facf6d771bdef3f07a32f |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c86e2e58b20f60476e5f37a35d3e5be1b426b643 |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9550f5080c0bae5d4dc2f2aa41aa716748bf5e41 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/85a45a1026d97c9ab54ca4fefc6effb3ebbbbb07 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9b0b6257786142166a8837fdac3660c63b506395 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/de125da38e98d14e68ae60e05addcac2e073971c |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2e41bbb45e47515e730439088e773202dc17d322 |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6a3a0d1ab972bb4adbba53d043267888012d829a |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5580aa0fab057a92144b7ca6b22efe4d808e2536 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/25c231d153641761b25aeb85200c0d184dbb64cb |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ef2083b4dcc07b1584b65f825130b1b4c722069f |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8977b2abd8aa97143f5da28a3565f16af0043c6f |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/df6433ed6c9a856dec041b11b90db0c237b2b0cd |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/150aabc1234a501ef9840f4c18f5ebc61885ba77 |
>    sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d0f143af5b865adaf60260ed21f799ad3139dee |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f4e815076f74fd69b1db896bd670e269ad64d7ec |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f2658fd9e7e6d359cbd5fa9f3c40496ff4bc7be7 |
>    mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/be8c682951058e53a2826e338818832978d645a9 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0905bfac7d59a07c9196a990114d20f657d547bb |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5cef718e3b6eb91a22c78c0acb9646ffc7812c36 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6fb207fb56d53c0719ee2016482eee1aa17d4beb |
>     sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/01acde1187f04be43d0f328f1d4c4bc670d3afac |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/306c87695db5dc7c3d99851992ec6c56f4094938 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/db654ed3d59e36ca82b21372ac6da1aa8afc4b1b |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/791b9a3367973bc8cf1cc059704710cbd2bf7495 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2a69d9c406159f4b4ad083233963ceb24c30a28c |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bb42d2c661dd11ae04b8484f50f20deda00da41a |
>   mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5e374d405a76fca8534c62c9214116ac6279feb6 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/82b87c55f1b8c8df513b88de60915f319f5fd837 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/45dabf7f9510d2cea58c4bb45a9c0625c054f003 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1806f7367e1fb1a0bd6b808802aabcca60b14229 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9d6f36f0e9c2925d31c75b61ea4bb16a7bc6cc5e |
>    sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d388416f8a02c02ee3328801feb154b9a234b123 |
>    mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5d30bcaf6aa45faed866aa6cb3c4d25082d303d2 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a5d4af272395720bf08eef90b314676c378cc1ae |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8561ad167e708ebb61648c6dbd311682f1f457a4 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fe1df7b41183eb76c1a38625582063c96c8b6428 |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fb7f3f978e2bd08bcc64b7369ef9d5d6f88be16a |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d7ca3d0897a99842dc46b58421b5de2653da902b |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7cecdaa9328caa22fa8dec1c8921503ca2b759c9 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6497e333090c48555d60f0a14c59fd9ba3190dce |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9227e1c5f45ff53568c02aa17a924bc88e50cd7 |
>    s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ce814cac8e6a203c6e05982f854bc97162a5dd14 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e8690bc4baccce8ed6ff5ebe842dc469aac331ba |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/777dad3e3fbbfae93157211293554ee197ef2839 |
>  powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a0a5a1c4be8dc4368c4e57d437587be361fe55f8 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d42345fcfd6199cfe2ed76e14497fa7756bbb44f |
>    sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ff47e341aca679752ced8e9d643f57c9b92c21d3 |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7a72ad4af3ade0a5e72d711ddbf985ccbf5c4d02 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9ecb835113576e2794e325b6797c13fcac4e234d |
>    sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9c44408801a75967c190372a8847a92198fd2de1 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a71b63b7a8a1da178c39875fa93c7f06ac0ab0bb |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/598f356442d08d7c00a4acd24e68db0b673883e4 |
>   riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/502eeca97ab6c488e945317a13dc9589ae61f9f5 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b0c4bda25d3fd6bec0d4c5f88d03a461885f7f89 |
>  aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/490e14ecdcf2d78ab6451d9183a13de2879e31fe |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/27cd6ff074cc441db880d2bdc1332a564bd71fc8 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c53c48337f4e38e8beea0eff924fb45b3e75cd19 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/97e8c9b49b3f76d9949aaac9fda6eec915f61801 |
> microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/79dec87fc8d6129679b2c96eb4fa503c7aeeb42f |
>     sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cf7f0dd0f6edc6f976a439637c863582f87bfe7b |
>    sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f28baba18fa9c4307c9e864a22a913bbc11ac840 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/22f12084e6d631d3786a99e7e098f608502c2307 |
>   riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9ca20ca94a7aea072b283e85cb313d9de86f1ea2 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b81f44065baf9f52d3502767bf1cca97f3907861 |
>    armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d9505b3633819fc03924ea82a6fadbd23d8b5095 |
>    nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e6f898e4cee21a4033557e562a553286c8bae791 |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a4ecf06d27ebb1f17076204649d176aff2a7f5e6 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b609e4f8922abe5adef2898b48ceb72629d0c021 |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/22ccfb7dccae7e74c9ae79e54ba35ef1666352f6 |
>     or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e8552d71670019ba7490da0ccfe793f476e6e137 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/23716cf9f9c0d7b569237f6d245fbfd0ec033a21 |
>  microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/38ce1bf94b51f6fda0423d175fe591166e606b8c |
> powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f0e0fd407e7045e396cd2cdf13d05c27dc39658f |
>   powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5eee1b3d8454bf051090afb94df0923938afe287 |
>     mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2fe42fc166006b2f4d12430b27f6bfdd223ed305 |
>   sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95ff358906ade7aff787d9db6f4e701e09763457 |
>   aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0d41946f2997e7e81032dc9c8f74fd7ce4e9b4b0 |
>     arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cd59fe8f9a9a7f6a19abe0863dd380a3bcee70d5 |
>  aarch64_be  |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/748303e81411ce4dcc7ef9b42ed8c76f346494fe |
>     arc      |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/d6a0bc684f72414b62cb0cf40c2cb8598b47ebb2 |
>    sparc     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7dc350d1c2f1857d27be59183b8bf37177f88dd6 |
> microblazeel |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/0ee89d616333ceeda4f82c262c57ddcf6b0bc8c0 |
>  powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/388a2cc92398a09a6b720dba89fe9c394cef8023 |
> microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c7d6dffe47e0cd162492db9b7564b303f8949f50 |
>    nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/dd62aa0dda0be9bfd846de98df99d8fefdb75e7f |
>    mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8d8410044fef08b253c92716c7f0bf0058fd380c |
>     arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bcc5369e90f371550ecf823acddc3dce1604616d |
>   mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0a72c5e5b2de0278f697de2e665a6c7a0a4523f9 |
>    mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bd70f21e42ff392d3b7e0f7a4b803c9b8cf2ec33 |
>    sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3733d0ed2a2f424fdb28550c11dc010022d845a1 |
>   aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f188862d6c9c118bd0561902a217179c2d559744 |
>     or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6d9b67a6f3b0317db346ba6cd2879c8f4fd72853 |
>     arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1ad6890cebeea960e7477f7ea22974a4704270b5 |
>  powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2d6cf40e8bfaeb8d394ade22fb5a48689419a208 |
> powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/56c021dd6259d89b8dd0e3fcb51e8a091dbc8447 |
>   mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1fb290058831b2db96375c738b935f83f5d65b0b |
>    armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e23c72590aefc67aefa317f840e2f9d4ede025bd |
>  microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/486188cba4946c091f8af46f2acf0ad57c852fe2 |
>    mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f34336f467aaa7a0e660e5f513b8fa563eb7437e |
>    x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f6321d542aa92d4485d715ba2fb5c4b5c2874d89 |
> microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d5ce458e8757364d779539ea7389ab47b967b913 |
>    mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7458482d1f6c8e6bb870d9e0ebaa16fc18fdaf60 |
> microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2a0c42592fca2dc183ec4285cc55eb5726a08057 |
>   powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cdd651addad4b7ca4a27be3d3a2fb1aadc845008 |
>    mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/172d8471e1da235d5ca30994319fb39fb356ffe3 |
>    s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/21cff6b9fb25ddbeed4629758697ef4be9ad97bf |
>    mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ea370641200774482e29558fe5f63e3dc979091e |
> microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b017d50007c7503eb7e1faed639a226ec27f1aa5 |
>    s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b989f6ae80ddcf75940d468af1dfbe40cc55e310 |
>   mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4316df7c08f041bcb736f017af05441f5a4f5106 |
>    arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/fac2d1e88c1f8a5078281233c80f03caa294e9e5 |
>    armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5c2b113b82394b670e018d32a4c115fe82aea319 |
>     i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b946c368514012026ed82ce10e1d2c86a576a1dd |
>     arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/f6067a50340b7ced67cdb67de9125c8a4e20bfd2 |
> microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/fc425437fd4c832ab30a37b2b42a297ca01ac219 |
>   sparc64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c9eb9521c037cc5034c1eb1a3c6b0a45f7257b83 |
>     or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a34c1636d93198a38209a87d026f992abc60d05b |
>  aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8b7ee5e650269fe32c9b6eee2bcc43bf70f03fdd |
>    s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/50a2f9c10e3e25f84c2c46fec9436553369c39a1 |
>  aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/7b2d5978befa17d782267407ee699387204dbdaf |
>     arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d7e834f031eb30389a8984ada51f91b84635b043 |
>    arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/676a4a02be934202b3928bf1671c5d131ed1da04 |
>     or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/7b0f4c776b4d9eae0913d404c0eeec874fdb1701 |
>    mipsel    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/632cbdde3987e23d5665fdc1c8dfb06a5eb74474 |
>    armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1731e7da6dab2932efb0daba345f3e7e140980bc |
>     arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b826d612a32280256c5998275f31287de2fdf87a |
>   riscv64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b833b5200dff6377ccde9fecb87cffb9f371a9c0 |
>    x86_64    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/fb73187885a1cbda134ad4e6e7dab434d2b797a0 |
>     i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/08172ba68beee0c92e93149910f6c90bd552fe37 |
>    x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4d90f695b2ecef59f6829e5ad0cf0978f8c86b33 |
>    s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e1bba6be441eb028bbc2b997b5caf52b13b1e582 |
>    x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4a63ce609ecc0d0812cbf2e3126fb3aeb3c30506 |
>     i586     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f1e3c89f8c5b23c9600f3695c4287783f0d0949f |
>     i586     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/fd7503469bb31b03dfe24f9c117d03969d8e7475 |
>    arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/096e12e3247538ce451cc933494de27a66bc3989 |
>    x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/9f64f9495878521f957769de4626bbd60f955e1e |
>     i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/4e1100dcbecf3b1cb1e55a5433deb7387dca1264 |
>    x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/093a7d7a619f53c0bc7c9dac0bd3fecccd513559 |
>     i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/d48c50d5ea0ab438840724982e58f50ce4abb83c |
>     i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/81903f96e5f480b742587bd7426f028d37f13819 |
>     i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/e08feceabc2795819d666596de0bce1e11aa64b7 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/a5c51d014cdc6178371cdffab2d962bdfea85064 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6e2b88661bf06ccc907113bba2adc32c19e71b4c |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/a2562f5fa404e6a2970c57458eace161f775010b |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2aabd863c02f16e5b7255856c4649cd2033fb77c |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3f1e3d34926d4ecbfd5a972d193e50cefbff44d7 |
>     i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d377427b65236cd08a7e86efead21dc0510cfabf |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1ca13f99e08e4c2903e29371e550356b443e84f8 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/aaa2b845b252ad746d28c22c326b70723568df31 |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9c27f2146e4adee4fd1d8a18402e8dce47742e1e |
> powerpc64le  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/76f66889efc8f88728d060d949293b18fde16e3d |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/a6b475a351da1de294958d9da5f65f13430b541c |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ef94c214e5e78f43ad1b68d7743ce3fd9d8c1c85 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c186cadf6d7590c38ad581e317523368b8687e25 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7ed928c3ece5c03d912871ec83ec2d7619b2b995 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/25b9da3e15e3cf076376f297d266dcb0fbb60c95 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/35b73bfbea83de50f87abeb9dc650252b8568e33 |
> powerpc64le  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/dc9c8df47ec2d772d48319fd105281578e3d5356 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/13801a386bffad30948a822dfb7699f29ccb3e75 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ad18af624123050ec81be35e18378d6e9419a9ba |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/8c4ee5d40cd2cf5b842d630a278402dbc1ed8ffb |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fc0f9741aebc71446c969a94bb59d31bd8d2917d |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9bb4ea4fbc658153329aebfd9e3eb458f84b1f13 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d680b706839365738d04b6bd2347f68b6a2d5561 |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/42a27598d9269c97a332988d86a90eddb70c3904 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e1eb8a2c09992f7c2fc2462fae78cb4603fa7b0c |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/9ea243d4ff5f8bc329fde80c10ef3aedf2f4746e |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2c11b6afe3ab2613d384480652d64f11e513ff44 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/95cd84fae3d2c0e8b843cee38d0c816e7b9c620f |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0459a388204c3740499bdca526136c4ee2a0272b |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ce8ab4721766b1b304449e77fac273019daf1368 |
>    x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b2aac6306692bdc81736ff181c3b82b51d22741b |
>     i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b379a3db0367552b8e3a48edb66cc18ebd3a87b5 |
>    x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/163fccbd172ea444d949603f932e343a65e3fdb1 |
>    x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/64960f055177b1758581a84bbe1a16b3d0ae3c44 |
>    x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/ea30a9e1a82916667ff5ed36bfad749d8f899db9 |
>    x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/1e17607b4d7b87130147380b9871f208c3022d71 |
>     i586     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/4f122e4d4d22b8baaec09ed80e869b7a4310d37d |
>    x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/4a043f2ffeb3a73270f1d01e0d1ba4f0cfde167f |
>    arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e7055723d25ed69dd99e925a89245a1b813d1278 | ORPH
>   mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e05f664a29362616f9627dd68546761697072cfa |
> powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/382003ef07a97aeb0bb7d7ef121a75d4d2c2cec5 |
>   mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e4ab3057ed2e04810f7dd39fc7bd93ab394c81e2 |
>    x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d8f16746519e9cd8d7f78ee1ae349d708cfb7ca7 |
>    sh4eb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8b04e4bb08458f011581e5b8bd762d82dfa2502e |
>     mips     |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/9e4cfcf9bc9060dc75928ef3d05b0618763bd9f6 |
>  aarch64_be  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/6b11a0c296b322478379b6429ee8cec11365278e |
>    mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/465ad5639207eea66d34d54c9e784107ebfa15ef |
>    sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/cf1f26cbcda0cc4eb77841be2bd2c6e5e457411b |
>  microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/313106b9deabb7e022452611c1668a037f19d1ed |
>   aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f91d910fd96a904c319dfd10001bdba4df7786e1 |
>    mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/003b1d284a677cb048909eeee840065b3f5a87da |
>   mips64el   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/29dbc9b703e4d260676a7d0133a8ee0055dc2279 |
>     arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7d1e0b1c31d04d195b96259c0f00ca3baa9211f0 |
>    mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/fa37ef3155d81a4e0143354fcb977fd3517e409b |
>     m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/64cba89d4b9653330204e3ad62457a8ef255204b |
>   powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/717da370cbf802e64500834c98c40a963823198e |
>   sparc64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/960d3ab3b9fd6dd5f296290c96e7e1a4e1237031 |
>   mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b74a446feb70cd317e3436adf27c081c8c01baca |
> microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/3661325262b9ef47c6987d6a157b9411c46be73d |
>    mips64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bd4604b79cdc41c25275fd69308ad3d5a65d5ae5 |
>     arc      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4e8e4a30dc307b4e39f1eccf6eacd53d499384ba |
>  powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/365bc57a3c005e9ef95941bdbee536c90351037c |
>     arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1c54ba9526ecf692c0b4211d1333e38b0be0235e |
>    arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f3f9a2e51c3490d2af17a45382e7a0b2700078b7 |
>    x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/347c2ead3bc4c65bace3d24a78be0418ee9c6fc4 |
>     arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/11d5768ee6ed410a52eeb31109d6c951bca75e24 |
>    xtensa    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/790c56ba756f7b2727dc42cbefdc4ce1ad73aff7 |
>  aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/70b8d82e70a7189a371b61c2e5b004a3eb90bc3b |
>     arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/634cdfe13c3732cd50fdbf6da77e64f42eeb3d80 |
>   sparc64    |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/0d0bc6318ba9bc7effabdb7297f3e8023b3d3806 | ORPH
>    sh4eb     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/539f930a2b118b6ebd278b1012b39b8efaacffed |
>     arm      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/cc116876aef07804bfa0d080cc834ecf605de191 |
>   riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f2e80095a7897cbc77fcf4158744dfcd58a0f40a |
>   riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d2d9b9f2d5f54bf6c8efc472c1ecf5528248a3a4 |
>     arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/bd2985ff1abd7c2e87901eb3ae48a3cd55a753e6 |
>     arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/49d337e820aec5753b8354ddc311ad36679140fb |
>    arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9b4fc62db244d5e5717b3c0ceb5f08dd65a43255 |
>     arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ec2d5cc354c78d44b3d54258a38f73cbe23342e3 |
>    arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cd5b18af08d3904c48b70c27978cb14fc0cfb457 |
>     arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/578a8ec0c70d9bfa6e55ab30bac97ef9e9b47483 |
>     arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3f4ce666e21572b9be30b274db062488f9598d21 |
>  aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2507575c2748dc37bf93f050e6538cd10b8ac8a5 | ORPH
>   aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/5037854bcbc6bb911746497fc425a9fd60413da3 | ORPH
>     sh4      |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/84ae0e835458b620061480a1cee6d7073662fd3e |
>    sparc     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/3d6268c1f192b1c77032a668083f59e05f8913d0 |
>    sparc     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/82f93f6c46d80ae83f3b6b8c8d619f66287a7db6 |
>     or1k     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/27165bbd6f26db75f81bf8bb503acb49b8886c91 |
>     mips     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/d81739b9a6dcbfab1a6b8d9ca53cf1b01e9804fe |
>    sparc     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/5cf6ec0a439e24a6233243571b5e5be8ffe78725 |
> powerpc64le  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/d81e1a753bd5f58ca5bc13e4e98494bf60f08ba3 |
>   powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/79b4abda6f11028dfdc98aa75ccf45cf0f2dbc16 | ORPH
>     arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/ced239a117dde440a860a810bb41711cbe0f6aec | ORPH
>   mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/48627c5f6c60270c397e475147c492575ea2a355 | ORPH
>     m68k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/6ab211eda5c44f8874d5dcf870dc3aa84d7f3522 | ORPH
>   powerpc    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/92c5bcd037e2db08f4235efe32b81ca19f1f717a | ORPH
>    mipsel    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/91bd438628c90501ae09620a11e94023f2b310d3 | ORPH
>    arceb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/2cc4bf8840065d44d17cb5d839b3755002ac53e3 | ORPH
>     arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/82ae6de2b3bc229842f6e0a2998c898e089220fb |
>    sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/66df85003589bcd46a02114796b1e2379df3ff18 | ORPH
>  aarch64_be  |        micropython-1.19        | NOK | http://autobuild.buildroot.net/results/268774989beaca5743def80ce537e78d541bfcda |
>   riscv32    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/01f78081a50743d1faa50a090c00b7e90a17fa39 |
>    sparc     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/d5393ebd89661d828e4b49419dc3243fea942dd1 | ORPH
>    sparc     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/5e73f06d67648d4509f360f9d554d7c8a8a9c06c | ORPH
>     arc      |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/98792a0d9c7bdee7cf69496a72c0755163ea672d | ORPH
>   powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/4a463c951a104bad8713300fd194241e7ab0400c |
>    xtensa    |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/b39191876e8ea0871c811e3124c02f2c8fa93d50 |
>  microblaze  |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/485de47b0b5705fd536e41ef39cac1ea0cc580c5 |
>   sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4f8b3e84866682b55de9158da0fee181f8f7bd8e | ORPH
>    xtensa    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4cd768ae7816f0f013a52b5e767b51bd96128953 | ORPH
>     arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/39bd45498d0f77ace2051e7e8efd31dded8483df | ORPH
>    x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cf1eeccf63591e723967dbc559fa803b24087520 |
>     m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2bc4a5cce9ff3c648a2869639cc9bc1ac4bedfd0 |
>     or1k     |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/ec4ea4cd308ec0c7b255f82139d98dc8881b04b0 |
> powerpc64le  |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/3718e26cfdeccd5944ad597317410670b9d06906 |
>     m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/70fa54bfd4f3fed1c81f975b1ba096f9801f2841 | ORPH
>     m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/16cf60497350567e6ee572351ad7873420b5dfb5 | ORPH
>   riscv32    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/01802ca182687fb2bb543872780672fe64dc93dd |
>   sparc64    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/d72a9529429e83f69d8c7764865b989216f82b74 | ORPH
>  microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/8a904d8a2fe4dfd2c5ed05a56d6b02a287b0a0ca |
>     arc      |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/f605a8f96e0ed6a012334fd1bc670be66f7c5ce3 |
>     arc      |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/56a699cb30d8e5e289458941fa31cc005b0a2a71 |
>     or1k     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/c813606c590d73d2129a8b646e4b939bd9dd9660 |
>     arc      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/134087dbff1b34db48ab750143b525d9a0383eee | ORPH
>   powerpc    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d17d696d92876910d10785bbc10ead714d9800e0 | ORPH
>     or1k     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/9b4a6d7473f9e66d93451cdc957ed9d21a759dd7 | ORPH
>    xtensa    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/3dc8eb0cbf842b57acac32a6903db67d19be7f41 | ORPH
>    xtensa    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/4ae8c2b6fb85ede0441f26060b41e2e165c9c229 | ORPH
>    mips64    | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/32d32af179bb65d5b1e6a0ffe10b424766201147 | ORPH
>    armeb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/8f497a06ce2f0490a0392ecc61241f16f8ca25b2 | ORPH
>    sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/6aaf002b7ae46f34bdbef2ac270abc3498c54164 | ORPH
>    arceb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/59febc8843f821d9ef05ebb9d0d73d8a8fd47f7f | ORPH
>    sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/8fca67980583f55333c451b2649141c5501cb7dd | ORPH
>     mips     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/88c9fa4a638eb68b3532b60fac8a8131da0a417f | ORPH
>    sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/022c5748bf45d8d0b7bb3989b10582cc466f5af5 | ORPH
>  aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a665c3ffc25ed125bc3ce945a66ba0ce89a87290 |
>     mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7a258b4c8833bbd824d51bf3142ca93413677b53 | ORPH
>    nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/bd26fdf3163cc517c5e1b577a69d236eb21509ec | ORPH
>    armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/44004a01a7f51b923ad43aa4dafbfc0ab2403e67 | ORPH
>   sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9e75c0a861c1573213f02f32a151772e60cf88db | ORPH
>     or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ad1ef855350a6fee35517e945efdda30746da690 | ORPH
>   sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/76047421e7d9c79b02586b7d045a8e2eb747c9de |
>    mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/5d67dcb26bebd0b0feedd9b676d005a25a3b7476 | ORPH
>     mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/a3eb12f4658027f54b8d8a725319241cc8252e2c | ORPH
>    mips64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/cfbf5165e398749ad8d1fd458aae0f7c69d28a50 |
>    mips64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/b20980176ad32312a9655f9929bc0d720d3591c4 |
>   powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/47cc493eb1421a4de6dfff7dfb7dfb3f30a0e702 |
>   powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/d543de55a4fabdf59497b293dee2f6d22084fe85 |
>    mips64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/94c25fcd43176197cc30b2a9a513598fe19da472 |
>    mipsel    |            unknown             | TIM | http://autobuild.buildroot.net/results/6945d36c9d3cf73a011e8cf6f96153ff8d847f53 |
>    sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/09ea50a1ef10edb8a5e6a6890e9945e81b1aff7e |
>     or1k     |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/83efdd2c0b14d89e6304986cd26716be680723a0 | ORPH
>    mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c9aabe19e7c3f048f4a11cdffd6a44d24f444c05 | ORPH
>    mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/281e35a765b87334d51e268a2b9a475ba134de68 |
>     i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/614ccdd145a34245b4709fd123275de7a4469c5d |
>     arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/886953ea2c98983b9a46660e4975b1837b18804b | ORPH
>     arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/68c23c82c647e333df9fbdcc762158454cf052ef | ORPH
>  aarch64_be  |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/5f4569df073779ebf8e975a45db1dc36f20742f5 |
> microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/09d720ffc4f204a28f0f8f9bdaaaefebfd15a07e |
>
>
> Classification of failures by reason for 2022.02.x
> --------------------------------------------------
>
>                     bat-0.19.0 | 1
>             igd2-for-linux-2.1 | 1
>                  wavemon-0.9.4 | 1
>
>
> Detail of failures for 2022.02.x
> --------------------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/cb9acba896fa13752389d12f19cbb66f0a02ecb6 |
>     arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/30881ec6d4fc9f89085322b48da8e5a0da0073ff |
>     arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/db0ec450302f68c9296df20413199aa67a7f040e | ORPH
>
>
> Classification of failures by reason for 2022.08.x
> --------------------------------------------------
>
>               host-rust-1.62.0 | 3
>                  dash-0.5.11.5 | 1
>        host-gcc-initial-12.1.0 | 1
> host-pahole-73383b3a39afe86... | 1
>               memcached-1.6.16 | 1
>               open62541-v1.3.2 | 1
>                pcsc-lite-1.9.8 | 1
>             python-sip-4.19.25 | 1
> toolchain-external-codescap... | 1
>                        unknown | 1
>                   xxhash-0.8.1 | 1
>
>
> Detail of failures for 2022.08.x
> --------------------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d665ea8ab6268e005771265c2624c4043904db02 | ORPH
>    x86_64    |    host-gcc-initial-12.1.0     | NOK | http://autobuild.buildroot.net/results/4348a0689297f08acb892fb2f2a08e8ed5e63498 |
>     i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/895f6959611517f8d99ee65f7e3ecc4ba7517402 |
>   sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a2b720a935fafc7ad1b8489b5eddf167f73e7e62 |
>   sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/98ff904509a1ba8b798a528a98ba927a9a377efc |
>   sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/67ca94f3febfb66f70638878e0d9f5f0c56de08c |
>     m68k     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/ddbd4c53aaa695c29803da1ac139d780bf2819a5 | ORPH
>   sparc64    |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/c90412a1debbaa80dc57054f30b1768d48e14412 | ORPH
>     arm      |        pcsc-lite-1.9.8         | NOK | http://autobuild.buildroot.net/results/bb5e7d4021c58d7a357ce39338ba317ab893f3a9 | ORPH
>   riscv32    |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/521e5f6becebf76d5319125ae674c11d19c27636 |
>     mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/891c0be7bb164c0f03ef0b6bf59300293d5ec3de | ORPH
>   sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/07a9b305257eb99fb60538a74134927d36ad7356 |
> powerpc64le  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/475d838916ea743f390f365e13acb87d1a27eefd | ORPH
>
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
