Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1BCE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 04:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 925B860A4C;
	Tue,  7 Jan 2025 04:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_IIlFsElKFi; Tue,  7 Jan 2025 04:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF23A60A40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF23A60A40;
	Tue,  7 Jan 2025 04:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FE5DF1E
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 04:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E69E813C9
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 04:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rL4Ws7iEyiiI for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 04:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93858813D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93858813D5
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93858813D5
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 04:14:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3e829ff44so30084009a12.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 20:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736223268; x=1736828068;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eZLEkUq726YTWK1aDCamlS9I7+kuJsihZTzi/PGz0B4=;
 b=pF/mR/wW6HihPl3Frdhc5ihj9eD9thm6tbgPLcQ0fFe3oUHJTNa1u1EDGL6z2TCuG9
 1WamXlh7Lu2zSBzDhJKTSapQWstbcjOYkp9E/0BQoIBzJKv2qfzvijfqiUH1fSiGhJXn
 PXygGKXWOo2Kc/egCkLsJ8aflaFhk8TDQCPCqf3OrbZVKa+zK4Z/0dnvi8HD5JJDuoFm
 U9AZR/8xFu8Rrpair+4ifpqZEHBzIhffiKO+SJKBF48XQbbefjTY+D6E3RmpHT/JwMjm
 ZvxUKmVy7y6pTKNjmW3sZ2G+lDnFTlB3JL/ctwl7MLJiqPLGylzFaeBQCc4y/kpnCY2w
 gSmw==
X-Gm-Message-State: AOJu0YyvetbunCWtz99sbsiRsE0PfmK57ZlpybEZwc5teLydDXfmf1pq
 IanWUzMR3qlhOMXHEXa4j0+jYeIdMzNLe7bZDIxvIBL6+MZ7nx6HujWTTA==
X-Gm-Gg: ASbGnctushxH/ZkdWHZ8AOnTaGTXJEGXeAaDlExKBWkuaIyFE4wYPDP18FLBDkTYUUy
 jlwuuq3VlqTa+K65tD0W6KqOaOQs7tTvaaRq0CSplE9pJ2zRhAMraXbnUdRo3ev7QUDKEpFvbSU
 5QgVo4KSmhyxkL+aCM1yMR3alIPeJ8Kfu+EhwUs/ZH2u/FnorsKM+RAdhmg/6ZBvtBS5ri+pY4V
 BbeMY41QNEaDYiEugVYL9azgWznR/XdurPoOR2CEI5J1X7Q5iBOTKDTGoFg
X-Google-Smtp-Source: AGHT+IFfw2P/TmmALIi33aatjPC56P/tSa/1+AIqngahNMffQQlm/Dy17gXmnYz0CxstSyCj7qkffQ==
X-Received: by 2002:a17:906:c14f:b0:aab:a02c:764e with SMTP id
 a640c23a62f3a-ab290fa4e43mr97722866b.14.1736223268310; 
 Mon, 06 Jan 2025 20:14:28 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f06f942sm2337400566b.200.2025.01.06.20.14.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 20:14:27 -0800 (PST)
Message-ID: <677caa23.170a0220.1bf114.8ed3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 07 Jan 2025 04:14:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736223268; x=1736828068; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eZLEkUq726YTWK1aDCamlS9I7+kuJsihZTzi/PGz0B4=;
 b=FeFP+cwM9zPrwGsBBRD66eCVxZVyiPyyTyz1OIY/vJ/rkKq9bxDSFeaRB1FZcmZN+2
 SLybySq9jiIA9KRJyZNOF4+EFnH99hCULgEfzDC3FX4+IsGvSh8Dm4gkfMjCIxHWg8rP
 C8VkYxaPyzDbZ0bYPUXOL2cAdKSbme+FRMCuQgsviDOvVOAJHEGka16ZaCiO5b4qllLw
 xlN1Kg2dx8Op75it0QtmEs20wSigKa8MRQqGGWh/eBWAiJsIlZSMv5M2aaIxREywBIUD
 9GuxSAcvuDNwm/lk0ivZ6pPZA37/+CWkQUMX+ZcGh8S70ZPx25VNiqn0nfV9jN/hNsHc
 xfoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FeFP+cwM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-06
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

Autobuild statistics for 2025-01-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  3  |  0  |  8  |
  2024.11.x  |  0  |  4  |  0  |  4  |
    master   | 11  | 69  |  0  | 80  |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-9.2.0 | 15
                  linux-6.12.7 | 4 
                   perl-5.40.0 | 3 
  binutils-arc-2023.09-release | 2 
                   bird-2.15.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
                 openssh-9.9p1 | 2 
                       unknown | 2 
           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
                   crun-1.18.2 | 1 
                cryptopp-8.9.0 | 1 
                  curlpp-0.8.1 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
                   gvfs-1.48.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
 host-softether-4.30-9700-beta | 1 
                libdrm-2.4.124 | 1 
                  libsepol-3.7 | 1 
                 libv4l-1.28.1 | 1 
               linux-pam-1.6.1 | 1 
                memtest86-6.20 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.20 | 1 
                    mpir-3.0.0 | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
                 opensc-0.26.0 | 1 
               postgresql-17.2 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
             strongswan-5.9.14 | 1 
uemacs-1cdcf9df881440497501... | 1 
             util-linux-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/a21c736ce5cf23c614e41f61aa809d1d64f19bec |     
powerpc64le  |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/6c86d50d857ce0f5b1286c1936879c56b3ea525d |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/7fbb4164754512dab491b57ad00ae9a00297922a |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/b55016e1eb784f8fc5572ee4d94cd88f487bb9f5 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/94ba3e7f3afbd2565f9aebd867a04f0968c5ce3e |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7b583da6877f714a820f0aeed9899c81f5a31ba2 |     
   armeb     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/c1a1df08ada42508ebd1042d6eb818d76e67b7d1 |     
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/5084c6fae4bae1d7caf664a8831ecc15c1a054e7 |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/9e43c421756f7f0ca1eec15189c419ebc5ef3e27 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/4d58669d7932558ebdf25b97c149ff5feb476b5b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/fb675315599dec859dadb70ef490a115dc17c257 | ORPH
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/7b75b8ec37fc420feca95629508780af3a14c671 |     
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6f85926862fb0c72c4ee0183c71fa6d841521b8c | ORPH
    mips     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d782908c0601ecfe630e306a867ca3f87c1d4ce4 | ORPH
   nios2     |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/e13aecf2fc22b281e9a7a593f6f00925f8fb4baa | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/f5ed438f1147fc914df9ae45eab23bbbf1ef2f3a | ORPH
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/4978aa38e4751e38e0a62b8ee608d997c505349a |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/5088a4c0a5d7c0d99901d2d16800de3e538315cd |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/bff7137a3e8aec383185560cf28d74683b1f859e |     
   armeb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/ebf2e442e96056f4bcdbaf13aa9f5f854428d9d9 |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/3666ab7d64c1732c06e92b6570c01fe769b7545a |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/4cb419c83ef346f1dfc9a8778a8fd70a11fcfa4f |     
   sh4eb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/13d1fccfb228fea04ba02cbb8a6d72becd28ef96 |     
   x86_64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/ae9112c899ac4657167b511625f395693fe783d7 |     
    mips     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/773833d9b831bbaa97bc66095e8fa9901c7395d4 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a679cdc22dfad52d0491f8b0d630b7a053e1f4a9 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/50cacbdf35bc954c7be5e91a67c8dcb6f5ff0aaf |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/490eff5c53da30d6ba6cf4c5e35109913f661a1b |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/fe72f800ad27aaa5c9cd2615c378e19c5443dc8a |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/c185e0ffae489c6fbcc6c2bb63f5190fa4566f6e |     
microblazeel |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/1c87ca3fd734feea787bdb40a4280fbe517f424f |     
   x86_64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/f6b8ad5604d89c6dc7ea0b599a581cc0197983e7 |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ac1a1ff61aa1100c64d55132c63870fa8f3e5a1b | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/bf3ba10f3d36b0428460bd57f25a8c4dbfd144e9 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/451a14a4cf1ee34232a8e81ad421e3b93ed35398 |     
   armeb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/1d5b8a042e06fea1f6524ad6d5b6f18b2d5bdcb9 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d67f8369bfe512e6c6c13997d53fbacb154cf539 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b04af8801acc09cde4e8acb80d406f9a398802fb | ORPH
  powerpc    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/a01e5fa7f29a29d414b2e57a3fc6b24feb0a395f | ORPH
    or1k     |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/9681eebccfe40d57df9166a41990641f781235a2 | ORPH
   sh4aeb    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/92a3b9f183a233314687f95e54d33231a287ee4a | ORPH
   sh4aeb    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/ebd0225c637b720c5c1d7f7edc7697d130ad04db | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ae02cb45158a7e17d1775ad8da0ea457676d654b | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2ea00bae5d0e6c36744663a939b53bd2145fdef0 | ORPH
   nios2     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e420e5630f0d44656d83d6ec00719c9b12687897 | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/14004ddf1197c5c2d8743443c1e19071deb44301 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/1f9b9b6b8f91306b21857370f803c798b07d5af4 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/15fb99db3fb584fe077f89db7ce6c7b98cb25b7c |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/769c74f0e6f52289f4a332406926630dcce98585 |     
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/35054ef381934f61c1b80fb6ed6df0dce699f721 | ORPH
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/a3fbbfda37342b1ee67fb3f52316898e6651c314 |     
   mips64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/eab5bc896742f69ff875d0a61c9162f5000e7c0a | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/a48b773245d767f6957182a4630c0809d967c67a |     
    m68k     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/e01f432e542e8a46e5ba81affe990f11d5cc2dda | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/719e40130448b33c86204ecac49a934468d5788b | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/c14fe60929b7d8b5999f5c5cfa655f8237a82f60 | ORPH
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/7396f154b5d2d70643bdf57f6355abe910f4e470 |     
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/45402b0f4a3470f950aa068815572bf674de16ba |     
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f6b387be1ff3f89f9cce2cae919e6b3b0f9cd471 |     
   sparc     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/cef5d5f634079715174ebbc66b4c46671b55e341 |     
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3a937340dfa04878c2c357ffd56a0cc209df0ec8 | ORPH
    mips     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/15c7d1043a75e6056076d5e5b7834ddb9c37738c |     
    m68k     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/e9b993b7fdbf6463459b6d1627c48531fd9f44c1 | ORPH
   mipsel    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/eb1f4769fb86dbaa8c7a6ffc4d7a581135f9bccc |     
   armeb     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/73ce697b0bf540453ad0d9e824c81fbdaa693774 |     
powerpc64le  | uemacs-1cdcf9df881440497501... | NOK | https://autobuild.buildroot.org/results/f409609dcdd4bc835bf5e75c3ac8a1f141679102 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ff7cd9def017af82f50e905871077dfd134dba35 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4b974171f2d7b5a60a567ff8ec0849bbd35186d2 |     
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5574343867274e29f1f166070a92e2a0b9f28eff | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 highway-1.1.0 | 1 
        host-python-lxml-5.1.0 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         highway-1.1.0          | NOK | https://autobuild.buildroot.org/results/3c5d7b74d46ace8fbb6c102b17a640b42a5f215e |     
    sh4a     |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/ed0ad44a3adbacbb1a1b363bdb5b9b031e8e40d7 |     
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9f694b7ea3c87113ab1812b23f44efa66267f646 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 1 
               libglib2-2.76.1 | 1 
                   swipl-9.2.8 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ff2e069cc688bdeb93007e9828780131ca61ed8f | ORPH
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/3d32659b62f21313312a982f8b46c5ebb2e3a3f6 |     
    m68k     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/1709a4da0b716f9ad8abc9aa390915ad6fc55d55 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/216192caa90a0a15ac80ac9ef1493cfc1ea0c133 |     


Gitlab CI results for 2025-01-06
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269012  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772270152  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772270153  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772270193  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772270401  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772270463  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772270464  | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269229  | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269230  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772270602  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269080  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269251  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269157  | ORPH 
                TestMdadm | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269398  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269428  | ORPH 
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269430  | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269431  | ORPH 
                  TestNtp | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269434  | ORPH 
               TestParted | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269456  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269530  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269580  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269588  | ORPH 
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269599  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269614  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269688  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269701  | ORPH 
      TestPythonPy3Uvloop | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269741  | ORPH 
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269671  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269750  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269049  | ORPH 
                  TestSox | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269789  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269869  | ORPH 
                   TestXz | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269893  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269899  | ORPH 
                 TestZbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/8772269906  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
