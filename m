Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1633E65D2A
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 04:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3080606E1;
	Fri, 22 Nov 2024 04:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Rzq6J4WJtwm; Fri, 22 Nov 2024 04:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C7C460623
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C7C460623;
	Fri, 22 Nov 2024 04:18:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1D47B69
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 04:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B653984473
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 04:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ic7HdJYUTVlL for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 04:18:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE23784471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE23784471
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE23784471
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 04:18:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53dd1b4e01cso1223737e87.1
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 20:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732249111; x=1732853911;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgvu2xe6u2QOgxZEavpV7BAtgKOCN/gdzsq2Mo5C5d0=;
 b=r7LpZTUaupD6dmqW3QhlT2VBH4e0AeTb04De7/8UVVikEq/q6Ruo88a/2kZA+2RCx0
 grfJmQl5UX40Wwf7N7pv5DI25hL/z8/VYQayYz6oNSTHoyBXw+QQpGR8dGfixl9gV2p0
 a3WtWhsT91gDUJsd8Lccw4wRXiyRyIEN0J8338T4MEGUbRMOWI7ETmxwFsN5wTuY0GvC
 ZOJhbiHfv+ZcinzHlqXLRIFaT+CgxZG83q4RIsAf3IBoA26sOQ0Ip+fmjR/vvC1EhGBm
 re6ijQfR8ogPZEP9vxuQQN6wyNSothPwasbrsau1Vk39/X6pUuA4f/MCx9ONClWR1cAT
 IN7w==
X-Gm-Message-State: AOJu0YwN/v6u3OanWfrmzx8+Pe7xH9pfWy1WWFSpNAshmMmnzDaK3NPt
 7UnJ/FF3W0dQ9rI2PxI/K3hkdQpxMAcb/oLukFR+e9nyZCpjQ79yT93SFA==
X-Gm-Gg: ASbGncsatOzOgY7T6lq7bIJY/By+G//Ewkq0xOsIU7NjY7HPz5lBvjeeczyADyWj1LR
 y1y2Ht1rxM26z1b+F3y3WTinnT5ZjPwCFTX4OZPejWjxhai7lDs3jrAVV/+i4K80T9GvImzZ7Z2
 EExWg9l7BLC6zRapq5NkkXvfkE4kT4VNt50lDUoe6sKy+jEEKAo2pKXEI9ute2H+v7iYt6OA+5G
 Ym+q3dLLAQND3F0JkzvVG3L9prjoGJDxlciGZjquc/99JQuEr74zw==
X-Google-Smtp-Source: AGHT+IGZdDPkd/usEeYJC2kLqqHfKdwOSr9x6yG0t5mQz4gCq5tXPB3Zjg2B5cFCT91iv8lEiXLdJg==
X-Received: by 2002:a05:6512:230b:b0:53d:a652:d085 with SMTP id
 2adb3069b0e04-53dd39b4fafmr462755e87.50.1732249110723; 
 Thu, 21 Nov 2024 20:18:30 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b54d428sm46412366b.104.2024.11.21.20.18.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 20:18:30 -0800 (PST)
Message-ID: <67400616.170a0220.b1a32.1aaf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 22 Nov 2024 04:18:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732249111; x=1732853911; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zgvu2xe6u2QOgxZEavpV7BAtgKOCN/gdzsq2Mo5C5d0=;
 b=e9rYjlY47BnuKkHFRbubSo2tm8bD8/a/RHHmCAJWAPVv31qBRvwCcoOwJ7E+alEcto
 jHeIZYre4rHvhmaRA7BmkoiexH8xJCRQo4wAp03P30cLQccn90RwK2SdR1LC3Tgy+cSg
 76PZJ+wzWWS8Xy/qk4UG9mkyBPRUvvdMycWYu3ng95QQhVjwmM5MbkyiWNubbehE+SIH
 VVl98pnK4ZdPVQzumrOV6s1UQXptCBgCRN/Mcl7n+GqanmR3b0KgA7+f0lE9unWqWUCW
 pgIwdByQ9DFiaIz0WIrB7C7/C4rhit5Vb70WKjNo8x8q/dz1zlLI2tpuLtR/Cv4gE2JI
 H5Qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e9rYjlY4
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-21
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

Autobuild statistics for 2024-11-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  2  |  0  |  5  |
  2024.08.x  |  6  |  6  |  0  | 12  |
    master   | 18  | 269 |  1  | 288 |
     next    |  2  |  5  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.11.7 | 15
 ibm-sw-tpm2-rev183-2024-03-27 | 14
           host-doxygen-1.8.18 | 11
             util-linux-2.40.2 | 11
             dahdi-linux-3.3.0 | 10
              host-rust-1.82.0 | 8 
  gobject-introspection-1.76.1 | 7 
                lmbench-3.0-a9 | 7 
             batman-adv-2024.2 | 6 
                 c-ares-1.34.2 | 6 
     linux-5.10.162-cip24-rt10 | 6 
                   perl-5.40.0 | 6 
                  ffmpeg-6.1.2 | 5 
               procps-ng-4.0.4 | 5 
                   bird-2.15.1 | 4 
                elfutils-0.189 | 4 
                   foot-1.16.2 | 4 
            gettext-gnu-0.22.4 | 4 
            host-binutils-2.42 | 4 
               linux-pam-1.6.1 | 4 
                  ntp-4.2.8p18 | 4 
                 pixman-0.42.2 | 4 
                       unknown | 4 
             containerd-1.7.23 | 3 
                  curlpp-0.8.1 | 3 
            gdk-pixbuf-2.42.12 | 3 
              libopenssl-3.4.0 | 3 
                  libsvg-0.1.4 | 3 
                 libv4l-1.28.1 | 3 
                  libva-2.22.0 | 3 
             lirc-tools-0.10.2 | 3 
               pulseaudio-17.0 | 3 
        util-linux-libs-2.40.2 | 3 
                acpitool-0.5.1 | 2 
           at-spi2-core-2.50.0 | 2 
                  bcusdk-0.0.5 | 2 
                   eza-0.18.22 | 2 
               graphene-1.10.8 | 2 
             gstreamer1-1.22.9 | 2 
         host-libxcrypt-4.4.36 | 2 
    host-python-greenlet-3.1.1 | 2 
                  libnss-3.106 | 2 
               libunwind-1.8.1 | 2 
          linux-5.10.162-cip24 | 2 
            linux-fusion-9.0.3 | 2 
               mariadb-10.11.6 | 2 
          obsidian-cursors-1.0 | 2 
               openblas-0.3.28 | 2 
                   swipl-9.2.8 | 2 
                     ace-7.1.1 | 1 
                  acpid-2.0.34 | 1 
android-tools-4.2.2+git2013... | 1 
               arp-scan-1.10.0 | 1 
                  assimp-5.3.1 | 1 
              asterisk-20.10.0 | 1 
                    azmq-1.0.3 | 1 
                    bat-0.24.0 | 1 
  binutils-arc-2023.09-release | 1 
                  bitcoin-28.0 | 1 
                  boost-1.83.0 | 1 
                   botan-3.5.0 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
          cloudflared-2024.9.1 | 1 
                   crun-1.18.2 | 1 
          cryptodev-linux-1.13 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
                 ddrescue-1.28 | 1 
                directfb-1.7.7 | 1 
                 erlang-26.0.2 | 1 
                     exim-4.98 | 1 
              fftw-quad-3.3.10 | 1 
                freerdp-2.11.7 | 1 
                  giblib-1.2.4 | 1 
glibc-2.40-18-g564178076272... | 1 
         gobject-introspection | 1 
                   grpc-1.51.1 | 1 
      gst1-plugins-base-1.22.9 | 1 
          host-binutils-2.43.1 | 1 
host-binutils-bare-metal-2.... | 1 
               host-swig-4.1.1 | 1 
                libdrm-2.4.123 | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
                libxml2-2.13.4 | 1 
               linknx-0.0.1.38 | 1 
                   linux-tools | 1 
                  lvm2-2.03.27 | 1 
              mosquitto-2.0.20 | 1 
                    mpir-3.0.0 | 1 
                     mtd-2.2.1 | 1 
                   nanocom-1.0 | 1 
                 openssh-9.9p1 | 1 
               pcsc-lite-2.1.0 | 1 
                    polkit-125 | 1 
      python-autocommand-2.2.2 | 1 
                   sdl2-2.30.9 | 1 
                tpm2-tss-3.2.2 | 1 
                 uclibc-1.0.50 | 1 
               valgrind-3.23.0 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/2dcb666a4210a7553be42a4597fe0c02166e0385 | ORPH
  sparc64    |          acpid-2.0.34          | NOK | https://autobuild.buildroot.org/results/8edecea1028ca0fc104ac0ef4295c7f50187500e | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/d2095389da0874dc18190badcc1ba6a4deaa543b | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/cf4ddccb069cfe8d0d5eeffcfc77d08e683b32ae | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/33a75a4d3ac5da849f05be6d8de19b8c1e221a91 |     
microblazeel |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/20d281256fc7e58b8cb0189cb6ef731de956ad57 |     
   nios2     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/902747235f381436e430ac7efd935f9d01c381a4 | ORPH
   mipsel    |        asterisk-20.10.0        | NOK | https://autobuild.buildroot.org/results/15b865f9a6e0edacb5ba9bbdaa540d98abdaf1b2 |     
    i686     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/3c1d567b5a6c4b57a198d30f10b6b8959bdef37d |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/3274a6658cd6e8bbbbf7dd686d05d6b601bdafc1 |     
   sh4eb     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/b5469a00f118f2d367d89e15c20b2ae2776677c3 |     
  aarch64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/a248a6ef6e9ddf0fc358e844bfc9dbf29f379c50 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/1f84c6668504f4d9689403708bb579b866d9bf17 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/9ddc00c1ceb12bb2caf95d00db0aa0e53f674ba1 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/c9b33550d730b7e9487298855bc6fdccdd511a57 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/acad84a5b5174d412025a24411d6c5dabe7efea8 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/876b5343afa208a49a2c52bcf5f091438eff1240 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/aa6e1f9d4592adb0a456afc828756809480ca5d0 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/7874e92acc3e55950656f95777386e9c356d40a2 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b28732fdadb934a778f961728c3bae1b74f994f7 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/98c9e12a089be0680efef08c76b3388fbfc3b7b4 |     
   sparc     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7c15897f1ab07617d4e9054fda5c84dccb4fb152 |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/dddde24393d828938706900daff80e6481879443 |     
  riscv32    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e3fd41f93065594e4f8df28e1a4dec9b8cd484d1 |     
    mips     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/89e03184b1a1ddded2889889206e19e296bfc754 |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/1762d84715683773bc5ec155a07cb6bb036d0a48 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/4cfc2bd3678ea84fe6f7097561b0c93ff1902084 |     
   armeb     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/de9b076ff5d28c91b1b233b91e3da1a456160c9f | ORPH
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/6b91618c8c528331818ad67e91683a9657fb486e |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/63150ad5a991a01bb008575ace1aafe4f107be80 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/88d43b7d1b864519247aca254e2b50420470bc00 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/4bbcb42ddb86b914cb51931c593a4d085e4a09ea | ORPH
 microblaze  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/7fcc483b5faccf62515a1b890e602826568a69b1 | ORPH
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/38c0e7bbcb056fe4eb7725425a155bdb3e304853 | ORPH
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/bfb4058ca67de17cad61fc7eab0ef63fc4dc9ed6 | ORPH
   mipsel    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/b31cc8865eb2a571f6a0113c46e76f66144428f3 | ORPH
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/d4acd9d2fb78d6ac4a478b52db600494ca8ef4ba |     
    arm      |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/29f18df6916f75abffb01f5354cbca2deb7cdef6 |     
   s390x     |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/856b4ce1993acfa65d7dff9a22d7c828803fcb04 |     
  aarch64    |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/656123bd817b64e1b9cf627852e2b636d0cbc8fc |     
powerpc64le  |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/338bd97c9233ad06cc935498050e8d6eaa54353c |     
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/fdb57898441f6b5dd48b64e6aff1dcaa28f5342e |     
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/76b3cec6583b008b64d44ee1442a697aae058057 | ORPH
    arc      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/da62ac28fc9a3bdd3040efa8b89d1de507e96c05 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/efe5fc0e56e2478b5918ac838e3c990e102925f0 |     
    sh4      |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/648e773ba5932bfde87837adcfa6960a268765dd |     
   mips64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/e2c27108060bc23a1d27b8c909afdeb4b9446f8c |     
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d52bae47a47910dc11a6d9b0e4492f0988631329 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7c3f9a17308aea920f4438efa8957f355b91aee8 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4e76f2123a6c8aab68ab9794bdddcbfe8e3d83d9 |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/872ea7463091e9840ee2c8d52e661560661a9748 |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/839ab4e4143fe6780f2a9ef37ff0a14f09d81f36 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f75fe5bcd9f01d6e1d0e1665876987422c3ebc87 |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/94b64622e5586f90fa6f17b6ce6958e4bff88c0c |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/67c485b00e25d4b34de3614537e82f7ea46af1fa |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/889bbdb1e5f376ef39c9966c950c3d4f55a33d04 |     
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a24045e24c3497e8358e689d6e042c8706ad89ac |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ecf71c7c6acdf18968e5fb9915f58232d87cc360 |     
powerpc64le  |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/752bd401b1f1a4d0ff5d366cc34af4028f30fb2a |     
    sh4      |         ddrescue-1.28          | NOK | https://autobuild.buildroot.org/results/afbc1cf05f8a8fa92258afe22b60bcda364d8bf4 | ORPH
   mipsel    |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/c755f6426e865fb371a7e9983a7df63a8cf411cd | ORPH
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/aa97df15558aa77292530da556385dbb97207273 | ORPH
    or1k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/3371f9dd7a71d0873537a52c4f77a96f56a67c00 | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/c3b67dccd21c2281f2b49db50120ea5bc744dad4 | ORPH
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/292ead110c99f19d13c4b6dea9739bff045a88b8 | ORPH
   mipsel    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/795f3d5f183bb18e8cbc31466fe10c7e1c2fb3b6 |     
    arm      |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/42d992b0223cb11bed27f23a56a453c1a0ef4a5e |     
  sparc64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/876cc2d10996e3d0ed1c20b627c912c8dfe18637 |     
    i686     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/de7b0fbef408bc4e5b338c0bcefb83b399ca4e33 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2e37782211fd877f6f21c22dc44293be2c8cbf30 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f0ebb64eb590004cfa70ae080a2cbd0e851a5d30 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/58363370798495e60720d49150aaafd40ae14027 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e0a072254bd5d9a5f37a5a4332660053d4c39956 |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/eb1468201518a0629ed0de01f69a655d96884b4b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/962253d27d2e5584b4d265ddbb7dba48b027f9a4 | ORPH
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e781c3a2409073b5ad8a1042c1dbd7488ebbd788 |     
    mips     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/46acd7274d48ac1850bdd292080983c3e2da17e1 |     
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/7159bd9f54fa8b28bfcb0411896562513f7afc34 |     
 aarch64_be  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a6c7a691558aed5120ea504f4ce786568076be3f |     
   mipsel    |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/a573170289c7e3f7b7f6d292ac1a8a50a9f0f29c |     
   xtensa    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ca43703384f6dd98bbf0c5a0b71472daa794637e | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9db0d5dd34816e35e365fcd7e1067d6aa426d66a | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fcb7442e379e68bab28652e24f3bbdb90502e02c | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d68785a4207971818a213da92763bb6a2e6d8634 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/d593eb38056d8f634f91a2ec0dfcba285d412a84 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/25bcd14bef7b27b4018a0d53c64daf9058795ac2 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/976837e1201e7384e0e332c661962db74fc3a38e | ORPH
  mips64el   |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/0c43601f6e2c82947c0b7dff628d686855d3d9b4 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/fee9c854552b07a5b14c61d1936ee0d6226734b9 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/73b72ba5e8c7453766c30e7f7d14c2c0c3a8b307 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/23fde097c1102e64529617f27e1dd8f500bf47c7 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1a2cf68eada4abb4595bbf84df19a5c441aec3d6 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4d7c07c97b3692d40d4cde173d3fc434613d3e0f | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2fab5d1ee3cd85046a18fc2070cc38c1ad50b627 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a4ff2f3aec6e7618e84084645612b25a96f3b94d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f379dde330ff5d6a40ca40394a25dd487cb75991 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a852362ddaf830a9eddfc4a42cf6d4047220f884 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/143f1caa4d1cca22e923c2b8343f8f38b3723ea2 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/463a721bcaff7976adf3155812cdd658a71e2409 |     
 aarch64_be  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/8aafff574f19ebf1c9ce9bdb74f38d3902490561 |     
    arc      |    gst1-plugins-base-1.22.9    | NOK | https://autobuild.buildroot.org/results/b2b568c8c3a610aa5b4a73f01cea64140eb5aff6 | ORPH
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/e02cd4aaa4f2c34eb58688c7197648d9d6e12922 | ORPH
    m68k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/02de790e58f3e43b8bc2840c8a780145d5062728 | ORPH
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9a9a142092b73eaed4efd72fba8795547f60d15d |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2cac5cff420ac894cba82cc4942ee34e1ac541d9 |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4014a46d369a9dd7acacb0d86ec83b50ebc75477 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8441a2470582fbadd054f1125b449b721beeb854 |     
   arceb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d5ee1c28e3065b64387e0aba489c5ea2cf261b3d |     
 powerpc64   | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/66c58d36e4b1335dab112d3f708bb37666c7de8e |     
    sh4a     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/923753937abe191b654da20bc6437842e7c9aa9d | ORPH
   x86_64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/0948dddca18e3a1458260605200241d4a318ab3a | ORPH
    arc      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/582734d5edf4d63bd9f25dd53f18e9249d4f8a38 | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/25ba90a6cca812aa6e33b25967050531f8bae21c | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8cdea9b4cb04a97d160b864bfc933aaed0c13f39 | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/811f68d7f0322bbb59cdb4c7c5069a81b5b56c3d | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/9e18c04593e5a86b30427af8ebc3a1222e9d4e98 | ORPH
    m68k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/0f2988291cdb5456a8b33c41eec64b184f17f7f8 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/07f17ece51e4500ba427df0660261b63228125f5 | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/834fe4c1c280f78fbcd9f046959134b51e9b9fb5 | ORPH
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6b4dce79daaf7d7560361cb7b67d3de1f77f418d | ORPH
   x86_64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5dd024486c14e082fcc248e39bac4db8d976a649 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/9c74adf599cbc4988d802fce12adbd464c63d79f |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c7daeb0f08315c512414030040443f3d206acbee |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/75c18f879fb77ac1774b7bc15053f5e31e26b6dd |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/724bafff1d80cca5bad7dcd5f9255498f3885296 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dbb72aa4081eb7a7fc5a6595ea3c969e20d293b6 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/958def5ded4f566a34a02742172906d8cd5b8f08 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/76d67e2f24d0a37eb878948addc339097282b8a3 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/4a699831cd11e3d76a055cd3185bb406da210247 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/9faf8ea8ec2c9552ae1b4e324b6f3f7118d724a1 |     
  powerpc    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/f668bbf5cf5b3a1ba554ae0650803d69650b9470 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0918076e13ed0aec88252e4e4870c51364e1fc16 |     
    i686     |        host-swig-4.1.1         | NOK | https://autobuild.buildroot.org/results/5be00f1ab1bb3c91eea574b21ded12b9c536b903 |     
  sparc64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b5a17441893b7c68b9e3164f229e19d5deae1c16 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a99ef9bd30e3fd5bbfce6a9a3354719638a1b9e3 |     
    sh4a     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/5f9b145900bba0015eff568d52b463b133278ade |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/d779efcfd3217121568854911f2f5b5f438c2ea9 |     
   sh4eb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f7faf11c9dca0375f4d151772359ddf19813bc3c |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ae377618b15fbe22a5d442fadac87daf1d29d8eb |     
   sh4eb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e193aa76deb97ca1a01a0d988e2833588cad54f1 |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/0e77568574fab3b7bd58dc9e957bbd38f5948fc1 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/a14424d5e3f1de74a7def89609bd84f8a2eb2b5f |     
  riscv32    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b7e0fa6d6adf18285a27e7fb184b2d0de8868ebd |     
  riscv32    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/289a72b0c7fab9a7d086c4794b5ba74d12db4102 |     
   sh4eb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c29e46ac7a14bf68c8c41d15328af90257eff65b |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/0b34bf2ceca7f7815e3ce11057d41b95a523e2a1 |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/20823cd8e9b4a6891999572c5b95f4601e6cf638 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/66d5a62659319e36a839b885f6dce8af7212fdfb |     
   nios2     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/4558110033c4b60541df31ffa3fc2d260e2236bc |     
  powerpc    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/f4ff00e7315f4cf724a744f5e5f655f8bff4fb09 | ORPH
    or1k     |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/34a999ef26096c07ef235d05cc3a98a2a89517de |     
   s390x     |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/0e51a1c3b42e954f8cdcfa568a97e176a0d1ac4d |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/7d272d57e0dffea7de4614c20c927f4618a43d1a | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/90c0f9977aaba91150aace00bf95970bdfbebd1d | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d24e255785cf6f3f4637726e1ea2fb119b03e7f9 | ORPH
   arceb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/1534bcde80de0ed1ea2e013703e28530aa8c4b33 |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/7d1967b80118f009417ca0e691ee553320ab89b1 |     
    arm      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c6e3664f32a6ad4f41efc8c72e5ec823e9d5ab1c |     
    m68k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/5531d12efc160401ee17ae56718606979393d73f | ORPH
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/80ccdb787d38d795a3e90f57c87e58758e6387bf | ORPH
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/bd65381a0518a020b0b0979411150b48b0df6071 |     
    arm      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/5f88ee6767d90d317d3ccb5508e8e9c86f5a3b36 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/1ba375fd2f049af4bbc0ce6a585be52e4581c897 |     
  riscv32    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b61cc10c1757198a995fd99abbba8e3dfb6aaba6 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/bffe3ff0f318def2917d8b2604ba22b2586c5b91 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/b2788eae9846ec4e1b9327b533bdec0138b65a45 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/48086101b2e3290e4950fa9921ea7a4147546daf |     
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/e07e0dc5d975a59c0ed30de6a6ee0303bea9dbf3 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/050b761dbc551d5a69ad803bd0d75d82a804f1ed | ORPH
    arc      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/061baddc1b1255618697ac1aabf45399281885a2 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b32bce7fd57f3a0b5c3e1b444685f93a8f485152 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/79c66db160902249f37a362a4361f83eab1326fe | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8301233ce504a875328ef1f2da954c9d6300e5a4 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/25d5817220ff1d319c107aa3693eec40f89363ff | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7d7e1f1d054d61843c19e7f50b5aac5de26a2122 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1e90174c9890f8841d83f229ee9b397404b5b03d | ORPH
 powerpc64   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/00a396cca291735b80b6d73dfc8233421f2408b1 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/c417f3da60043ddbe115d2486cfcb61b6be807cd | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/93708425ab51e7a328f11d721f4cdf62ec3a1209 | ORPH
   arceb     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/3b678160b716360cce619cff8a07d7b359f5ea4e | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/fa7744d3fd1e806945c351c93f6c9f84660f1f72 | ORPH
    arc      |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/fe56c09310487731bd765b86c98e624a6e7387a5 | ORPH
   mips64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/4f30a432621d1e0dc89736fb4c29476629588568 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/07534ad428e8e58125f66c0b49a2807761d67ad7 | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/9823b872a312a4d03777d32f55679ee15a27a304 | ORPH
    m68k     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/55c2accf4bf1935e354abbcec55c2f3fad8ca4aa | ORPH
    mips     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/c471b2a222f31b489b5faaf22e836006bf88e72e | ORPH
 powerpc64   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/ba34b077b822e6505dc9b795e81a477ade593160 | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/bec923a85cf918feec2294c6f0cfd204de232923 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/7dc8f3c25729e8af21e2ef5790844382e849933b | ORPH
   sh4aeb    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/029e7f3bd589e2d0205830e0fae472db6ef12cbf | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/ede82dd977f925f933ee3fb238214a785b997b6f | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/ee176ee6c20d9c421620ff6875d4d8548c085904 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8d18fa40e9aa2004879e7c9bb5dca18f897f26de | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b16ec61ba243b67d15e1675e567d4d6822dd1663 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7d461bb8a515489273e52e74e12dcac76d31b0a7 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3e661f0a6957db7d7a388be2f8d3f9b387738a63 | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/724414831a7b156b177eac4c44796a5cc4d49a98 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/8bf5a4cf9adbcaa366913664f9d2c7fe026bdaa4 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/efb9089ad5c0b6685eea97069d59d68c6366be0a | ORPH
   armeb     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/80cdb681f3f3bec03dc7b8ca80b0c913e625c3ca | ORPH
   nios2     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/5cb0c77d326aec3ff1e2ed10305b36bb93cc91cc | ORPH
   sparc     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/2c13033b901f6f7953a6d4c2bb412c06854636e9 | ORPH
    sh4      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/7377c241b8aad61e651342e24a3de968ad1e6d92 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a456d2f5e849161553e76724b0591f699f42ff51 | ORPH
    sh4a     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/96e2a36ca102ddc89901b47576c8b0c508d13a85 | ORPH
   sparc     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d32f1a210f47e1549dda4f405b9c9d26ef6a4b1e | ORPH
powerpc64le  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/89219764ccf387d40f4c6d23fa60ad6f43b66105 | ORPH
 microblaze  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/3b03033763a7a99756748295a27bca4a294d1fbc | ORPH
   s390x     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/625cbad66226202e082098edaacebebbf5d05c1c | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/25a880b4102abd4a7cba7626e6a4b3693a2a5abd | ORPH
    i686     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/bc99836e9db816488c35c1a444f63468cf3a2994 |     
   arceb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/77050f38d21df1498cc633f65fc706913172d072 |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/457ff807012f5597f3fdeebb8d96c5cd51e7f4db |     
  sparc64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/db0aa4303f8c4a60ed22af5320902b17b67906ac |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a84e558767740b4510b8366ec2b5b8e8597cd1c4 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a607ad491ca49df36e6fb744323965c23565fc01 |     
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/146ed28d6962242d00d4a81b802e64bb1ac2bce7 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d878ec5f93a8a3371ad4e8a4556be6a5156d703f |     
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/ec190945923a28c5fa086e3fd5a88eddca965a52 | ORPH
   sparc     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/3e1ce85872c60472120480b4d570a84c74918708 | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/535ee80de292f19697339233a1a2511466d85e08 |     
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/f170ab9cf349d846631598304a1bbefebfa98cd9 |     
  powerpc    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/80f10b36b822b0633609182cce8cf2266b1f7628 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/21f37940ad24d0bcfd1ac25b5cee669324ee58be | ORPH
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/222674ddc38c5f0d9f096f04f827c879dc036a48 |     
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/76ed331d69644be91b12dd267eb6f414dcae92c7 |     
  aarch64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/54281e4444c6c4200305927f1955baada5a7ce9c |     
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/7460fa237a846098484352ef0baa1bdb86cdfa15 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/827e50db2f402102769aa69a633a8010ce759a5c |     
   sh4aeb    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3622c17e23f4b78478fe514c5a03cc21c94b80d7 |     
  powerpc    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/bc11587438540b77c1eba0f84400c47945feec05 | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/4b5955ee5a28fc791e433cb3eb7fcb1420f844ca | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/d55c421e6cb1717fb16ae92493eb438030de689c | ORPH
   x86_64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/43fd7a43df359c1f729b7aa6f31379e696119bcd | ORPH
   s390x     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/7a73f8ed9521984c01821d3834dc83a98715c7aa |     
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3e4308e3f08743a496500345c21fd7d6b78bd19b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/963923251e1a4be562b5d8138bacb2e49105e810 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0b11d1758178b30d07dd1fd324b2a3121aeff21f | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1f9451e54738389e152cce7616f07cd9da41f67a | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a8f4f9707da1ac4288ecf5a6ed1f4fe5d2ec8c89 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b82cf1a32b82acf2aac38d3f3cfb65ecb62175e2 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8685e0c3a86ea93d532ab91c523be24789c826d6 | ORPH
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2e3798bd9a78f90c5366d5e934fc896b0cc24039 | ORPH
    arc      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/a79edeca18507a8995b29b6b4cbbb8a14f587da7 |     
    or1k     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/3de998f96fd7130467185006bc0c51fb2e63dcad |     
 powerpc64   |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/be36d8080d47a2833a8ddfbda6d5fd63b540f749 |     
  mips64el   |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/58a62f794fc65bc4f48be934e5cda042cf0370a9 |     
   mips64    |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/5f358b144c17672011639e3e742ce05a1df77152 | ORPH
  riscv32    |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/79cd402c497a0fe7842969e4132641e478175a5b |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/3e79c98483c878f33c938aea22a274bbea523034 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/68681b1128c9edd9b48797106404e1e0d43fcefb |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/3e4c0f2e036b8e8a9f15f501aa62fabe029bc531 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/7d6ecf195b484383af8ba5a309e6952c98632d84 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/98166ec47aa88f182e684474b48a202a6a5f27c8 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/48936e0a5af18159879a349067d912077d924d82 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a743af91675c1f3f27be40e6883a725ff844fea2 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bf72c4fccc24d28d77507090510879441ac01a8d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0dda32792e85a58bc71932f1a3ea614477610d33 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/26b8fab5b028edee875115e528d40a28c9401199 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/eb0b98fad2661bd241f4a6fb6369d40384b31eb0 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c43b9e8b7aefb4527a51db4e3e36ef8848920193 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6f855c4bc3abcde35e023968884fb1b9cfe690f4 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2271ddc0c03cebef61689b3dc14b2fb620854522 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/65e809060f8aa99692ceadc5da11d76d725ad08f | ORPH
   arceb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/41d7c9db4b05e763491cc3c4075bfc661a1b9702 | ORPH
   arceb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/630fc287deb1cf5a684f274058b918a5d7aef989 | ORPH
   x86_64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/2b4c28f59a3569e89480a772f2e211d1af4d0bc9 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/bf7ffc4db6cda545b5eee8f03a6964f1374f21fc | ORPH
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/32ed7babf62ee0bc5cf6bcb3041036cf17ba1675 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/27d8cc10752d77a5f6215f2a1e86e886a726d63e | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/077d73c0107271303bf3643efbec7b21226354c4 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                 libpng-1.6.44 | 1 
                 linux-6.10.14 | 1 
             parsec-tool-0.7.0 | 1 
           python-daemon-3.0.1 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/29d5041f27eeaebe0b9454bf30380456d46019a3 |     
   s390x     |         linux-6.10.14          | NOK | https://autobuild.buildroot.org/results/88bc1e655fbd4254a6a4ced5f52bb6a198b1c325 | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/d58a0863c26b2ea4b8a420eacd9e2aa7db3a237f |     
    m68k     |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/f111544b78f1961096be02b7ae333cd8ad432222 |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/a0f1895b116d0f386dc2f8b3460f7686b78aabf9 | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d9e0c53c295189fd79755afeea4522321292f72c |     


Classification of failures by reason for next
---------------------------------------------

                  curlpp-0.8.1 | 1 
              fluent-bit-3.1.3 | 1 
            freeswitch-1.10.12 | 1 
               libdeflate-1.20 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/2dc12d774f5e8baf79175fcead96119a25ce75cc |     
  sparc64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/d4f8448547084d656ace208dc9f8071cf7e30108 |     
    i686     |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/781b3e9bf8e5cb4a8132c8d1e1a97386e6ddac77 |     
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/c75db0d07e8ce2c6cbfe55d96b86616ac64213b2 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/41256ed366ea5b691b0d3ce3aa7fe59abd0eb6d9 |     


Gitlab CI results for 2024-11-21
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065656  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065767  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065774  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065778  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065782  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065794  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065813  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065820  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065846  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065869  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065890  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065901  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429065947  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066000  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066087  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066188  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066212  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066235  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066241  |      
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066249  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066257  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066269  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066278  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066290  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066298  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066326  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066653  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066779  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066844  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066945  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066955  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066969  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429066979  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067105  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067107  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067117  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067196  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067220  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067304  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067363  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067582  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067651  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067676  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067693  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067741  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067749  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067754  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067762  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067768  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067775  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067779  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067783  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067787  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067803  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067808  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067889  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067897  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067904  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067933  |      


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435234344  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236947  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236948  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435235126  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236455  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236459  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236474  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236490  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236495  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236496  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236497  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236498  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236500  | ORPH 
       TestPythonPy3Evdev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236501  | ORPH 
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236502  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236566  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435234497  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8435236600  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
