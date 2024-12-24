Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C034E77188
	for <buildroot@archiver.kernel.org>; Tue, 24 Dec 2024 04:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3469E81118;
	Tue, 24 Dec 2024 04:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWIZXwaAHxDL; Tue, 24 Dec 2024 04:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39580810C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39580810C6;
	Tue, 24 Dec 2024 04:15:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1FAAF16
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 04:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFAA8810C6
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 04:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAQ2Pdy6lvYm for <buildroot@buildroot.org>;
 Tue, 24 Dec 2024 04:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ABD0810C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ABD0810C2
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ABD0810C2
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 04:15:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d34030ebb2so1805536a12.1
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 20:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735013714; x=1735618514;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mjP4IBFH12666gJGVTsvlFC9StzUJ4DPl9WrEEkhCVA=;
 b=dPnfJ0EFoxX+4xQuUkS5cEbspsWWaTxa+aRbqYgP4VzkO5Czi1h48pFmDKbYiQRbZL
 moI9JeciWd5wROtNWRGbcBBC3DaWMmld5Bqb6e5fotbY6T8RVwlDbOFnTkGfKFgXEIGj
 v6tlrZ9rY+pP//vu7mk+2oz9XpjVrzt3PO9dDap1lhCZoOe3KnAZ2WT2nW9q5B30hbMm
 EFKHBUzqtSKNEPANfGmi8AaVOLekyzj4ETtM1m5B4iKuD4spfud7zAHEmJyvnaxeRCqx
 CZIYhVMaf3qJw2jOhdhruTdRD/+TDTCIDb9SAC2xFcZYR590oBEXF9zYy/kVOt2Y1A9J
 qCig==
X-Gm-Message-State: AOJu0YyD/gfpAtGZ+mecPgqYOpfzMPOV7JdWA/Zn10N+dajvcZDVH5gz
 1YMStZ3FVYU5PYN/t2F800ed6npntLiBOfrBpgBS4dBQguKJd3ssH23V9A==
X-Gm-Gg: ASbGnctKI4Qb5jqdngycIGHmqwks1ZkEQGDKOJujHyE6TfxKysLfTWakC/i1d3fx1r9
 cASqJ39ift7SeEGxabJZirhsIq/cRlfsYWACyX7/BQ/Km2pOoxTa8jFTGGLZlTChRyAxH5gGJH6
 NS4sEY6HLb0FhxsGwTFhWASxuGM/DY3GdJz+m3tyh20IzzTgQDqqQN59aeA55WBhDwrTbJZ/dGP
 yrLBw22TlrNcCw/GEEYUSdwFzNkkXMTw/JZ9TQmE0dJD6WkYmhC4ekiohvd
X-Google-Smtp-Source: AGHT+IE17cdSQiEjxXq5bht2okrEA+dDaSgV0HitMNa7UsaLSh+eM4D5F4rvuabAAVcPod3+nN6YIw==
X-Received: by 2002:a05:6402:348e:b0:5d3:d9f5:bf08 with SMTP id
 4fb4d7f45d1cf-5d81dd5438cmr14596733a12.7.1735013713859; 
 Mon, 23 Dec 2024 20:15:13 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80701c89asm5611660a12.79.2024.12.23.20.15.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:15:13 -0800 (PST)
Message-ID: <676a3551.a70a0220.1f255b.3b99@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 24 Dec 2024 04:15:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735013714; x=1735618514; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mjP4IBFH12666gJGVTsvlFC9StzUJ4DPl9WrEEkhCVA=;
 b=W30eOmv95rtlAnNhJp8iAp1ebUjqVugIqrYiHLnSuIXlYB0CGUm8zmhL903nZPv8Uz
 KxfSVM0VGKlTlTTq+eg5d6oVMA3JWDqvs0Bd0b+WgtNB/PRBSA5IzdReC3ClmXebg1/2
 HPZqsePQeHbhbZMBLSAAXHFdAKlMLYXWfBTxpcTo6hXASSJC1qg0okxfBDA5DGh4V0TA
 Ei9OEpKoxPg3ffrAzvACDRNx5tLZTf/ZFTHm7Mo7+hveNnb2NMDfcGjiEiahyN2fw1Vf
 0hG3Wp23urYv1MRuA1a/lLw493+MMNa3DEn8ShvUUHSTg3qxWmLqcYN9CopSmvHg0IC7
 xMiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W30eOmv9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2024-12-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  5  |  0  | 11  |
  2024.11.x  |  4  |  3  |  0  |  7  |
    master   | 13  | 129 |  2  | 144 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.40.2 | 7 
              libopenssl-3.4.0 | 6 
             batman-adv-2024.2 | 5 
                  linux-6.12.5 | 5 
               procps-ng-4.0.4 | 5 
host-binutils-bare-metal-2.... | 4 
               postgresql-17.2 | 4 
                 coreutils-9.5 | 3 
                 libv4l-1.28.1 | 3 
          linux-5.10.162-cip24 | 3 
               linux-pam-1.6.1 | 3 
                  ntp-4.2.8p18 | 3 
          obsidian-cursors-1.0 | 3 
               pcsc-lite-2.1.0 | 3 
                       unknown | 3 
           at-spi2-core-2.50.0 | 2 
             berkeleydb-5.3.28 | 2 
                    emlog-0.70 | 2 
                  ffmpeg-6.1.2 | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
             gstreamer1-1.22.9 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                 host-isl-0.26 | 2 
            netstat-nat-1.4.10 | 2 
                 openssh-9.9p1 | 2 
                   sdl2-2.30.9 | 2 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                  brotli-1.1.0 | 1 
                   bullet-3.25 | 1 
                   bzip2-1.0.8 | 1 
                 c-ares-1.34.2 | 1 
               collectd-5.12.0 | 1 
          cryptodev-linux-1.13 | 1 
                  curlpp-0.8.1 | 1 
                 dtbocfg-0.1.0 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
        gmrender-resurrect-0.1 | 1 
               graphene-1.10.8 | 1 
                   grpc-1.51.1 | 1 
            host-binutils-2.42 | 1 
               host-gawk-5.3.1 | 1 
                   host-go-src | 1 
          host-libsemanage-3.7 | 1 
              host-rust-1.82.0 | 1 
           intel-gmmlib-22.5.5 | 1 
                latencytop-0.5 | 1 
             libargtable2-2.13 | 1 
           libfreeimage-3.18.0 | 1 
                libgeos-3.13.0 | 1 
               libglib2-2.76.1 | 1 
        liblog4c-localtime-1.0 | 1 
                liboauth-1.0.3 | 1 
              libtracefs-1.8.1 | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
           libzenoh-pico-1.0.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20240930 | 1 
         lttng-modules-2.13.10 | 1 
                 mdevd-0.1.6.4 | 1 
                   nanocom-1.0 | 1 
               openblas-0.3.28 | 1 
                 opensc-0.26.0 | 1 
                   perl-5.40.0 | 1 
                 pixman-0.42.2 | 1 
      python-autocommand-2.2.2 | 1 
                 rtptools-1.22 | 1 
             strongswan-5.9.14 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/fc595dc1808b13b4f5787808ab5d25441c882d75 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e45e416f1e4b4dee625894b5999b08e4000f67de |     
   sh4aeb    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/db5f586e4b5f5601a44ac1bd984d1c5c7ae2bf95 |     
  aarch64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/2c7d5cb4eb314331df9137d3f765636bcd311ecf |     
    arc      |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/7734b093ba3a6c4f4725fd6219c471fbc16f0b9c |     
microblazeel |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/0b8205259969ecf6ffa5f2e764ce51f375613faa |     
  aarch64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3612b5af6ce63f6c9d99e3f67aef2ced37806add |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/8efba0af2cc709169ef3edd834df4046f823f937 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0cb21d2a373435c3d5652f896ca83f389df19353 |     
    sh4      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b129b0a9fdc500db5665c9bbe7ef8c31adb0173c | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/9dfd2f48006befbe7e058f8c99d5c23a2ab0fc18 | ORPH
   armeb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7e7f086cd6ea7517a31e6d5d644562ab16358dd7 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/3c8e7d60b87aeb5105c79e238e919dd11f555ae9 |     
    mips     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/d239324f97261456cf914f1b7bdc251de0068d93 |     
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/08ee5953aa203b83f9e47493d9463d86545ba22c | ORPH
 microblaze  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/b802b5f1fefadc01daf81bb037af4f392d96c5c0 | ORPH
   mipsel    |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/7dae726cc9ea42443c9eaf69951c18205ce8cdae | ORPH
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/4af2ea98f35c2e4d45543f979e0c2aca5a84231b | ORPH
   arceb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/d81c9f8ccfaee1ba0f67936bcf0bb6b32323c8ed | ORPH
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/468344f95e908eba8bb8487ac27e798389cc4458 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/7a536d8dcfad78c0a9197d36fcc790f19a65ca5d | ORPH
powerpc64le  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/34c441045c94fa1efc7ec9de465ba887d5646ae6 |     
   mips64    |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/052fe373204193a85094ba923302c9b93d010fdf |     
   sh4eb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/905a4cc6c6535e61d300fc0d6c200552f021fa4e | ORPH
    m68k     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/c3e9e5c3751eca654d93784757977694c0c7d64f |     
   sparc     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/e8ac3698f95cd28338b782b0d7112e9103eb0862 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/655854364d28a0bc9ba6402650de5008c8b459e6 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a1bf5e93061353a7b066cbcf3c7e5230ff7ef7ad |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4da69e88693178ed5a165cb2a09ce4e25c4b99bf |     
    arc      | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/5fde2eff4cacf825159bfb7f80f696bc18b4ebbb |     
    or1k     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/eab77d770e877938a9f55ad577842d413cdfef2d |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/6a137484ce9a63fab883dda7b91c135448ae3d2a |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/97c8b8761b6c17d6eea15d040bdb85f77488e9df |     
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/90e13045f3e7ef6d8ce48141d4986e3c4c4158d1 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6c7e90865637ee488d5de86092f092e4ee51986f | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/8f080090b139993afd7c20763a1b1eedd08bfcd3 |     
 aarch64_be  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/9cd26aae3a193376c13deb98f86f866ba1dd36e7 |     
   x86_64    |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/2b835d96e53507395c76935291ccd2e24a3f4d86 | ORPH
   armeb     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/73fc061b29f0171f4d3bd32d06a89a5a437a471f | ORPH
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/24fafbfb33607e52e09af18cb7924cbccfd92933 |     
powerpc64le  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/e60bb186ff6857486d88d2037dfcae5b975a705a |     
   nios2     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/3e41c3a05cfe9ea6cbe7b6432561cde57382f11e |     
    sh4      | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/f319991fecd35d84cae7e97702753730308c2060 |     
    i686     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/8fe84800cc6271a702e9402714e8006146110f36 |     
microblazeel |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/4297c6105399cda6d654f8490fac2443a765a3ae | ORPH
    arm      |          host-go-src           | NOK | https://autobuild.buildroot.org/results/c795fb0c37003ec9eea4fe6d9beeaf69a341c258 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/493f0aae6a2df1bcfe304c27a66218face55500e | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/6bd36f4167fed9095e90a761df1e7da8ee4ca6f1 | ORPH
 aarch64_be  |         host-isl-0.26          | NOK | https://autobuild.buildroot.org/results/b0397ccc0684c954bb29f6d27f77d19486c0b9a9 | ORPH
  powerpc    |         host-isl-0.26          | NOK | https://autobuild.buildroot.org/results/39e15edde1384899ced636663cb614dcbbcb13dc | ORPH
    i686     |      host-libsemanage-3.7      | NOK | https://autobuild.buildroot.org/results/9ba7c3c7c18bd0195676544c5b543d5edf07a34d |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/08e775d728fdc475de8674c17fb86d9a8349112b |     
   x86_64    |      intel-gmmlib-22.5.5       | NOK | https://autobuild.buildroot.org/results/7546d8abd4c7e39334fe23b3b0e786a0fded59b7 |     
    sh4      |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/193441123742fdbc91c9532373cc430114cab847 | ORPH
   armeb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/3bb840c647defeca32f08479f352c22c48384eec | ORPH
   mipsel    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/7a57f0980d1f2b8007bf02a1e21651df03b4be72 |     
    or1k     |         libgeos-3.13.0         | NOK | https://autobuild.buildroot.org/results/86602010035bbbba8086a083f4cedfbed5a4bcaf |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/0210283a5415d5d162e7d0083daf7bbfbdb632a3 |     
   nios2     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/ca0df4d99ad921ca5734f9b998f70781e766ce27 |     
    or1k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/8302d1f08fb58ed7f94adf3da7b527291f425ea6 | ORPH
  riscv64    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/069f1bbe65e6514908303e974cc938e3d8303383 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/9c01c0cd77e51ada034b8e1af9d7d1d3d122cfde | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/8fd29e8760fd324b567dd15582d5ce0d256d5602 | ORPH
  riscv64    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/5b880887eccf5beff2d243aaecba5d2ee480e9ba | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a3b34badbc88b83249a30a9aeab0d08260efe7eb | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/1a6dc61463ba3abee389cf77a5585d42e6357cce | ORPH
    arc      |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/aeb5643d2a0b57e2412098ab42327ab7a22a9864 |     
  powerpc    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/4a58729a891e4356e2adf33f45048ed6df8e777a | ORPH
  mips64el   |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/9c1d1247e7a4177551573061af8092c0748ce984 |     
   mips64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/824eb74dfaf959e99af1db6f4ae4919b078f123a |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/fb2c51d64236d164498d6eb55b9ffc17fcea5b30 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b1716ad14f3447591232a3fa2801d163826a78fa |     
   mips64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/928d0725d773365095f3e7008898eb041a25027b |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f722f636b27922f5e0ec8c2a9a9e8bf2260b111e | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/11caa474c3d475797c4b244bbd311f997f4e9ec1 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/dfcebabad1f600c039e36898bac5e600b03186be | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/bc6d673edf52c4b3973cd902134d9f8446fe02a6 | ORPH
    sh4a     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/b1a6c4bb1f3cf82871ded441978009f74a7789c4 | ORPH
   mips64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/4a2cfd2e53915393b2e64b13b9b6574930806fb8 | ORPH
    sh4a     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/344dc6b98f7565a220e22ba5b313ce120f239921 | ORPH
   mips64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/7140900ceb1c1f073d1d084c6e641d881f6d225b | ORPH
    m68k     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/3f5ee53ef9e2571c42b6773d725fb9a5f12a28db | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/027f22f97441ba625ca75208c6580a161e0a39e4 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9b066abcbf5fd3c0c8507dff8bbbcc396c4f465c | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7b04cb5258a2cdb7e2e46663f15ff89ec4491645 | ORPH
    arc      |     ltp-testsuite-20240930     | NOK | https://autobuild.buildroot.org/results/5b79b88ae1d88ac74d74c681cd448657ce95433c |     
    m68k     |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/29b4bd70ba9f7d5f2195cd02698655003c79a989 |     
powerpc64le  |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/cc1a5fed774b09541f5fc9ff04038eae8ac229d0 |     
   nios2     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/3e3acba0f9afb2ad4417b9927501da5554db6495 |     
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5b59be643cf3247a1a8a433ff59df68728c6f75b | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/55a6ce00ec7ebc96f5c66e3958be625029ceca61 | ORPH
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/36857cf14c008647516ad292bc8795edcbe0e884 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7dcab6986b2a34293b9716deef64720cc7cd2f08 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/aa652f57c929d953f503d1842d965e761314938c |     
   armeb     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/696784618b1c8ec30d57ab123146272b6e959beb | ORPH
   mips64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/97b7a93ec303b9a2a06fe8cfeb65164d7409bf14 | ORPH
   xtensa    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/694b18abcba27dd4fb68b62c3568a4981cffe865 | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/e1c5a71d5722b8acd45cba96f5e8b3f7059b2da5 |     
    m68k     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/dcdd27d578f8cd6bfa635ef507139949735c984e | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/078975dba98593264d83c6d265cc57e8833e7be9 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/0becc1b95070699e49a4fb8a49793d23fe819f66 | ORPH
   arceb     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/5776bc583916b9531e5b30ebf97cda3f4f8bdd64 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/b45adc7b1255ec516b250a932fb72ca5bfec7ac0 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/020dd6808efa744dcc0acdedfdf33603458cc49b | ORPH
    i686     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/6c6b1c4eb0536bd1cd045c12b5d4c96014b5ec64 |     
    mips     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/89d91edb452cba5d1365edfdc749f12c51c5bdea | ORPH
    arm      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/da094fe60bf4e5735db5fe44d60691404eea2224 |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d4b526087ff14fd08988cb0d076fb8b6e51863ed |     
    or1k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/a1702262ddc7c71b260fea7292f4ba84543ea779 |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/ed1e4bf3b239a91af0554bb3e8f6a579c09612c9 |     
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/40dfa51db6927aec831a086dfb7dccec7322ddd0 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/617dbc8809a1559df65e37c8df738b967010ed1b | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0e5dc9c9b37f9df048cee0494e4368edab659ff5 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fed0afc17796e959f860797ae673d676829ad4df | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4cd3bf408599e39025edf75dfa2b5bae3512bb3c | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/db5e5c5d711633392973bd6426ead48226df9869 |     
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/4deea10fa255368fb8f38a13bca887601c977322 | ORPH
   s390x     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/6ed396234e2e33a9bef230f558ec5b8aecfa55d4 |     
   s390x     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/6250309cebb2009b25dd43a4c32b424e3f059e05 |     
  mips64el   |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/dd5d665d60febfa722492ee5ff8f9e87bbf35e2c |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a692681b6d0246d16986572fd8c83fe539089784 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/ba07e3bca46e213e8430ed4e04e6f369e6ac74a6 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/af614ba7ce971fb83cb3ab474da9d99eb21fd217 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c16254e054a85ba7620a8bacdd9f7f5dc7bf253d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/76cd6f194c59a39c53d6ded16fd845e6ff1620f3 | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9ce5cbfc27dfa36c12470ea9c8ba08031672d99a | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a6c19194d034a0a2e57e89b67bea001720f04e73 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1df7f6bea52985bd0b6aee4342d650e482833126 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/590041f56dc442ffffb607e18c0e47c9804df9b3 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a6e5c2fe71be95a6a409ebce0b693b14ed5dbd69 | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/e9cb62d0e124d8666d8547b5e73065a54245f15c | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
                   httping-2.5 | 1 
      libabseil-cpp-20230802.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | glibc-2.38-81-gc8cb4d2b86ec... | NOK | https://autobuild.buildroot.org/results/1e77153dbc08b8d339437096e505c8f3bc54a370 |     
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8889e99100fb9abb5c980c342057cfd9f57f12a4 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2aa883d2f97ddbfce2324abddb467102f8188bb0 | ORPH
   s390x     |          httping-2.5           | NOK | https://autobuild.buildroot.org/results/ba99f62114e8a9efb82b64a04e7af9f71a3d2ba1 |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | https://autobuild.buildroot.org/results/5b6a7465234f07d2a742a5f425bf62d28163ec23 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   foot-1.16.2 | 1 
          linux-5.10.162-cip24 | 1 
                   tini-0.19.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b1b46cb35d7d15d134f6f03f544153acfba55156 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9ac89e9e7d81cf30c4fa23b75de574cecc31e280 | ORPH
    i686     |          tini-0.19.0           | NOK | https://autobuild.buildroot.org/results/676127f6491b635c29e85da4e4bd759503588289 |     


Gitlab CI results for 2024-12-23
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708010928  | ORPH 
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011507  | ORPH 
               TestBrotli | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011513  | ORPH 
           TestBtrfsProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011518  | ORPH 
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011524  | ORPH 
             TestCoreMark | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011527  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011531  | ORPH 
           TestCryptSetup | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011537  | ORPH 
            TestDmidecode | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011544  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011547  | ORPH 
             TestDos2Unix | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011551  | ORPH 
           TestDosFsTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011556  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011559  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011560  | ORPH 
                  TestDtc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011562  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708012617  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708012618  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011291  | ORPH 
...emSystemdRoFullFactory | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011363  | ORPH 
              TestKmsCube | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011676  | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011890  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011270  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011981  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011510  | ORPH 
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708012048  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708012051  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708012164  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708012182  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708011018  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708012291  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/8708012305  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
