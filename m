Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FF8D0BB56
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 03:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08BF14071D;
	Thu, 24 Oct 2024 03:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yal27CWbhtcr; Thu, 24 Oct 2024 03:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B0640728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B0640728;
	Thu, 24 Oct 2024 03:18:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E71542073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 03:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8C0E4071D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 03:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xg9y7GI5XSiF for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 03:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F240D40729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F240D40729
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F240D40729
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 03:17:53 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso52517666b.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729739872; x=1730344672;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2keUSLHeRc3/fDqduR43MScHwJ/0+euqAfMAxitzh7g=;
 b=lScLky3T7yOlLzeGpYVWWEYVvhu2hW+/vTLMqKZd3+ByV3vdcoAao2iS61tPUpdYzU
 GCtU/4p0mqoT/wh/Mvqn7AUlT8HL+0+uadRjzyce28I3n2XGTRuNbxUKhXrPuIkHk4uR
 VyBfV+wndKBHEV+SvR2E1x+gH46/WpZZzzFPV45VjRl7U6ZKdhKyidBpp687Ya3gjDM0
 yaN35vKb6gBCnTHG3/EcylOmsl/oC7v1N4ipX4sZkAUXcEMetFJvnBMX/4xYnbTbPNrC
 WIrn3jqiidk93xkFHCFwqudQPvHZfrNsSfssA4t4qC+Xxt22LnlyEvz0omY8RdQjmcwq
 LIhA==
X-Gm-Message-State: AOJu0Yyw9KU163FJkOVPYy9qLiHK7JDFRvpOJJ1AfymOA60+MmeUPsGT
 SixcnHJz3tVBrAOJpDnjaGi4CoTnmb9qhHnuoj38ZpM7D31RLEk7fIVCmQ==
X-Google-Smtp-Source: AGHT+IGCiuOlcfFRREAWEwtR7QspFxn/vfvI7MonASfr4jkVokYyX3meKtwv7PygnyeLsiZMAFmDBA==
X-Received: by 2002:a17:907:1c04:b0:a99:f1aa:a71f with SMTP id
 a640c23a62f3a-a9ad2711854mr35925366b.11.1729739871438; 
 Wed, 23 Oct 2024 20:17:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a915a114asm549520066b.222.2024.10.23.20.17.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 20:17:51 -0700 (PDT)
Message-ID: <6719bc5f.170a0220.2a2e48.5c12@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 24 Oct 2024 03:17:51 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729739872; x=1730344672; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2keUSLHeRc3/fDqduR43MScHwJ/0+euqAfMAxitzh7g=;
 b=el18D/gjUbjvmnnDabdifHOcLRMDfiaFH736TF2k1GUns3TOylJD94esvZdZLhdXCX
 jTHjuMwnFoJXrwlIHzaVryZphcQX9dzPuKKSiBi22pdyyHCDl2FlWcWGwIaCaZPoTKw9
 JRK+R9qyAnQ9GdXJ0Be+mmuJeta2JB4buUvnRhUZspr2PiJ+PyCtbTfK2/oDLyzAAogF
 IL5YJuYIXmV+HfjvuPWDMHN2B+texrb95s1s6HoIiimzEYHHxa69/ePD/B6mDLjhL77r
 WDyyJkFGjEKRD/0nZ/W9qbyXm+PtzpZfhf7ArqtgFYzeX5m69Mx83f02oBjPlgL5hpI2
 AOmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=el18D/gj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-23
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

Autobuild statistics for 2024-10-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  0  |  0  |  4  |
  2024.05.x  | 15  | 22  |  0  | 37  |
  2024.08.x  |  4  |  3  |  0  |  7  |
    master   | 16  | 304 |  6  | 326 |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 18
                  linux-6.11.3 | 14
                 apache-2.4.62 | 11
             dahdi-linux-3.3.0 | 11
           libzenoh-pico-1.0.0 | 11
                    git-2.47.0 | 10
              host-rust-1.80.1 | 9 
               pulseaudio-17.0 | 9 
                       unknown | 9 
                  bind-9.18.28 | 8 
android-tools-4.2.2+git2013... | 6 
         gobject-introspection | 6 
  gobject-introspection-1.76.1 | 6 
            host-binutils-2.42 | 6 
           host-librsvg-2.50.9 | 6 
         host-libxcrypt-4.4.36 | 6 
           at-spi2-core-2.50.0 | 5 
                   bird-2.15.1 | 4 
                 coreutils-9.5 | 4 
                   foot-1.16.2 | 4 
            gdk-pixbuf-2.42.12 | 4 
              libopenssl-3.3.2 | 4 
               linux-pam-1.6.1 | 4 
             lirc-tools-0.10.2 | 4 
               mariadb-10.11.6 | 4 
                 pixman-0.42.2 | 4 
             containerd-1.7.20 | 3 
                  ffmpeg-6.1.2 | 3 
              fftw-quad-3.3.10 | 3 
 host-binutils-bare-metal-2.42 | 3 
           host-checksec-2.7.1 | 3 
    host-python-greenlet-3.1.1 | 3 
                latencytop-0.5 | 3 
                  libsvg-0.1.4 | 3 
                libxml2-2.13.3 | 3 
          linux-5.10.162-cip24 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                    azmq-1.0.3 | 2 
             berkeleydb-5.3.28 | 2 
  binutils-arc-2023.09-release | 2 
          cloudflared-2024.6.1 | 2 
          cryptodev-linux-1.13 | 2 
                     daq-2.0.7 | 2 
                espflash-3.1.0 | 2 
                 gnuplot-6.0.1 | 2 
                 hddtemp-0.4.3 | 2 
           host-doxygen-1.8.18 | 2 
                 libv4l-1.28.1 | 2 
              luabitop-1.0.2-1 | 2 
                    mpir-3.0.0 | 2 
                  ntp-4.2.8p18 | 2 
                  quagga-1.2.4 | 2 
                  ramsmp-3.5.0 | 2 
               valgrind-3.23.0 | 2 
                acpitool-0.5.1 | 1 
                  assimp-5.3.1 | 1 
             batman-adv-2024.2 | 1 
                  bcusdk-0.0.5 | 1 
             bluez5_utils-5.78 | 1 
                   botan-3.5.0 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
                    bsdiff-4.3 | 1 
                   bullet-3.25 | 1 
                   bzip2-1.0.8 | 1 
check-11970a7e112dfe243a2e6... | 1 
           crucible-2023.11.02 | 1 
                     crun-1.15 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
                directfb-1.7.7 | 1 
                elfutils-0.189 | 1 
                  evilwm-1.4.3 | 1 
                     file-5.45 | 1 
              fluent-bit-3.1.3 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/romfs/romfs.mk:32: /work... | 1 
                  fwupd-1.9.20 | 1 
                 hiawatha-11.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
   host-mender-artifact-3.11.2 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                jemalloc-5.3.0 | 1 
                libdrm-2.4.123 | 1 
               libdvbcsa-1.1.0 | 1 
                 libjcat-0.2.1 | 1 
        liblog4c-localtime-1.0 | 1 
                   libnl-3.9.0 | 1 
                  libsepol-3.6 | 1 
            libsvg-cairo-0.1.6 | 1 
                  libva-2.22.0 | 1 
linux-headers-5.10.162-cip2... | 1 
                memtest86-6.20 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.20 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.8p1 | 1 
               pcsc-lite-2.1.0 | 1 
                python3-3.12.6 | 1 
                ramspeed-2.6.0 | 1 
                 rtptools-1.22 | 1 
           sane-backends-1.1.1 | 1 
                   swipl-9.2.7 | 1 
                  whois-5.5.14 | 1 
                xenomai-3.0.10 | 1 
               xwayland-23.2.4 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/de5b19de8a97d299122365a4a07f582090008e42 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b0ae39bcd0e09afde85cc29c5d9c3b26cc38df70 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f99e15e34aad9f8689299cb120acec0aa7ac17b0 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f28089a925bf80c2398ba9f395e2ac869eccddf0 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/ea7e736be5c147112a466ecc9b693bae2dc2916e |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/90d5ddd994ae3be31b42be66c4125b6dddb18fff |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a62a962c646f68988d2908b2f92d97669b53467e |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/23a8ad6c3d7b4f622333b744d172da99ece75269 |     
    sh4      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/681b5b0129959d91c5159de390967a4dd068a58a |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/02003b55d617879084ba9e38cc0824e68197d1d3 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/5c8a2e50ae1995faa5696a4af14cd4c7e1492ea0 |     
    arc      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/112f0575bc16f0236194efc7adcdb16f6faab54d |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/faa7f38c805c4c5758b069ee8c69671a35430753 |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/66c912dea61e7912e2a2affd19524e6cc2560b6d |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/758583d7450499f6eb880a91da1b8ed981ddc40e |     
 aarch64_be  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/bd8f23bfdad61570b7d36b540e3182d3a53ba0f0 |     
   sh4aeb    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/0c5d500cef793f53a477e8ff676b10bab7305d14 |     
    i486     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/05493a6c87cf6de89e11366317381a8c9b421060 |     
   nios2     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/b5f193d0de8e6bd7ed862f7ebf2c1dee32f2f99f | ORPH
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/51657075f1bd13188509d0365a0c18f632e5d73e |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/65223c9430320a85253b50df1c45cf72c262fcf4 |     
  powerpc    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/fbc2dcc7375e0e945ff1685a83b809d2741358a5 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8a9ec4811a523393aaad4e2de09a9b270280825c |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/caf177ebeb0e9d49d97610dac31260f43ce75b50 |     
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/8dbbd79a99c887bac90e1f85c856a8c740b6430a |     
powerpc64le  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/206a4543f7ac07a5222e6baad2339c781c0e1709 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/c7527ebc8a75a49b70bbbbecbabd5686ec46466d |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/9e011828bd4871b31a33bf7389e56d0f583ef5d5 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/9f720030474968b585bf5d127ad1c9561955dd92 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/25bdd5c3f011534c89dcc4b2059506a45d887827 | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/9855999d13c76ca69ad7e210d58f283837804c9a | ORPH
   sh4eb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/871f2fe9d5253c695348c902147297782b0fd7d4 | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/58fe656ab91080bc2a638d53784ec0ec73c6865c | ORPH
   armeb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/4f7bd8b439756a86e544233e6dcd320f421ccdae | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/fade0b034a4dd7493029d3ba8e6866cefd00fe31 | ORPH
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/52fda011641c1413ce99443d3dfa9bbd6f30d9cb | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/40a46f9e2b6b399ee278116c7d622096a61fa70d | ORPH
  mips64el   |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/66e074ee5b52c56404b28db2f82cb096cc5a6c32 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/99917faf8e8b776bf6564305416c5d89e52c95b8 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/f1ca1af27e09ca3c8d0dcaebfbe63f41d3d6d4bd |     
    arc      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7865ac1a60a4bccb802f0606769cfcf86dc5dc8c |     
   armeb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/d64d6291b8585b55dff97ced4918893d659b710b |     
  powerpc    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/bf0209306c466c42ea4c0c21194cedda9f02d0e9 |     
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a180878919b67e082702b224ba833d8c06192e2a |     
   mipsel    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/ead6983fe0cf955b28ffb427b8593dacea6b16f2 |     
    m68k     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/4292a83c65f70d8c9274c50c8789a589a0e9147e | ORPH
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/196ec1f2e821efb3f88b3cb2627900861ef05997 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/270ee47358ca6dc397671f79fc991cd360cb7670 |     
    or1k     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/bdda90690a13edae92cde768bed27c77740e628b | ORPH
   arceb     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/c35f949f5bb2159e89e12c1f400f0873d2662610 |     
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/5d2e06de7700c78f46ac5cb048fc9bbf6d6f1f38 | ORPH
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/930d520735440724c5be0f29ff24282f2e224e24 | ORPH
   s390x     |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/ac59c6ad4980578280626866fb8def39bb24ac8e |     
  riscv64    |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/3bfea52c8eb18c1008c9be9ce226bf1e98663d99 |     
powerpc64le  |       containerd-1.7.20        | NOK | https://autobuild.buildroot.org/results/074da9b950c2d1701fc884cd99d3cb3502f8a428 |     
powerpc64le  |       containerd-1.7.20        | NOK | https://autobuild.buildroot.org/results/4a2520282123161e7093656314b89538f513e07a |     
  riscv64    |       containerd-1.7.20        | NOK | https://autobuild.buildroot.org/results/b88a4c2370cbaaae95fb7df968e4d5724bd6999b |     
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/c87b26abb3c886275824fc44485885a6fa270b07 | ORPH
  powerpc    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/621f061fe7140c551ad88334e211fe3912cc9ab9 | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5b7118a5a37f4e4de8d4d44b597fe2bfde0df5ce | ORPH
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/8c7fcbcbccd3303a8ebdd0ced9ef96a049a324fa | ORPH
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/c6eb8358389025db871d9ac85e0ba0b941eb61aa |     
 microblaze  |           crun-1.15            | NOK | https://autobuild.buildroot.org/results/ab060e054a2ad4d2fb6a438c57c2e642912acf17 |     
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/8b4ea1072d44ec030c1780b5c5d6c1890ffec819 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/42ed0b8a39781859a34a62e15cfa4877a9b64a5a | ORPH
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/4a00595647133727b5a12fcc6e43388d62292158 |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/071e5a5203e29079c1418086600c7110734234af | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3bdf0892716667ff106f6ff5ed042d5c5c756a62 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1f03e94a72320c750a97211328d7f6ad430f7e49 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2094d21f85ff9e75eb0d53743cbbcc8e6f246458 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/80338b763ed6b2c370370365eb8db9f7ccd535a0 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6df8ab7ee1ebf81a427fe7a727454d4770fc3a07 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9d92fba2bd9b4f36870204e044c4dbe852509278 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8f4be184c1c3b9ab01f5be9e882fb7d46743b7c4 |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0373d22720b6c9a0a3125cc44cd67749e01692ec |     
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ef8f73ae4906404e02074735bd9971501fd0b2fa |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8b76f9b3d83800348e206b35fa15fa77c235c445 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e6b1449838dc3842d34d1ae67810189bf3944fbc |     
   nios2     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/01e7746763d9b4e4e25f5484ddc12d99d9c30c18 |     
   armeb     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/714d739210b3f91ea9d4e8ac28f640e012ccd888 |     
    or1k     |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/ff8461cc7107a2ea4bfade463d721c04709c299d | ORPH
   arceb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/4299d5539b6730daa5f1be897bca0d2fd226a5e8 | ORPH
powerpc64le  |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/51521ae6743eb65a509bc1c27a493a878c95bee6 |     
powerpc64le  |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/d40bc782d0d6e6c76a67b7774355f9b60f6b779c |     
  mips64el   |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/f5d6e86887f078b1f4a56721648aa05cc3b958a7 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e7f5f4a88c1041f5ebf5744e4c38e9e9ece424c4 |     
  mips64el   |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c8c53471da5ae066f5acad3a02f18494258468f6 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8d7363b15b794be15acb8d95146a8c8418e17a28 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/d0f7e962178fd7298633417658b4687025c16cd0 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/909ae38dba636d57f83bb9ee47da98ec3a75ffde | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/9db312d98f1f654687185ce3928494cf09e75d14 | ORPH
   armeb     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/627421419b0408d38815fcbac407f7af96577a5c | ORPH
   armeb     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/d834d7098bfeb0869e1d7faeb75359786c2e7655 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ba94041735a4979a194d31abb5ea6d14b2da64fe |     
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/879f355886933472b3031c5a38db6054d0c952af |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/9128ca379e8367300f54e6e37e2881b2ad5b282a |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/861af1ef406d06dbf37ee2d7cb21f60830d1edc6 |     
powerpc64le  | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/c5dbe9c348a4b43e8fe064b4f06bd7dd631dcc2e |     
    sh4a     | fs/romfs/romfs.mk:32: /work... | NOK | https://autobuild.buildroot.org/results/11de1851c86a7fbc810f847b2953094fed69ed0a |     
    or1k     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/fdbbac1883b00db6def88f5b434ca4edac7cf219 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ae63c3712e260e9aedcd7eee0745437e47882242 | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e1d3507c0b84d436e923c48046292f1862c792ed | ORPH
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/34bf659ec8d888ab868093d6d3c097a8fadf4fdd | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/771e1c2c7ec588023074c7d57c36be4c5baf9083 | ORPH
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/e71780245cfa60e2d289e7964277ca11e5dd90f0 |     
 aarch64_be  |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/d3961dedd53ebe4acc6ce149de7c601e363979fc |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/5d0d22d3e2784ff85a361bf02f7a9f0f7da7f199 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/369a60f0a1220d53be9881b36c3e4efbdfd06cc9 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/eb92daac3fe7b43593ad86c4342d1cf6fa4bb7d2 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/28aca518890d056b47599c36cebe1cb15832f6d4 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/fadd1d71719fe9a8a9e4e99dda9c4e6e03df4b4d |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/1f762cfd2ab2984c9f989c46aed8f69654798b75 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/925296ad3f7cdcf1dc41f2908f6851c63c4ed420 |     
   arceb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/e57d38900904e281e42e259c9650c15b9a1f224c |     
  mips64el   |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/c2b0c22772ce50684486f1c032ef78f6887cb93a |     
   mipsel    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/a2d5778776c5da3337ad1903b746d3a836a4235c |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c4f45331b80854d5217331a608cf6313724738f8 |     
  powerpc    |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/69b10ed624dcc053e478d94c934f03db421bea73 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/1e416d902e39de37f3cc4b474b4feb3d9576d887 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/1261697979fb5e10dab5bf961ff74cc031b34873 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f35a62df76caec7e0006d736b0c263fac68db46a |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/6daf5070462f083fd11b244f8803df41f168605c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1423dda2f790003b1cdecd54c297801366db7d21 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/501a6c618115a3fd6bf10709a564440da81ed416 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c5119fb800c572b40a56a8fc8fb5f6525ab289c9 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/dc1828038bf1177ff03cb955155d19d6a0736a51 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/256f0454cb09029b7ef1eb72fa407d8444def1f3 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d7a732e8f406e20f25bd94e70017d0da0f9ef08d | ORPH
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/bcb7413800c4fce0ba57b602c679100d33a4d076 |     
   sparc     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/163fed23f11ac89e66cf70b8ae21eaac74e37708 |     
   x86_64    |         hiawatha-11.2          | NOK | https://autobuild.buildroot.org/results/e9bc8cb68ab2402c2e4cac32ec130e529ef750a9 |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2c7461b5289e228041cb65bd3b044184f216be2f |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/40593cf9f5760211931071af442df58ea6c4dc04 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6f85eb99154cd18b4b8df7fe179b9382e71a0e8f |     
   nios2     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/cc8030d1dad9759dedba1500570c7d575c4e12f1 |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a3de607f30f7c68e60688951c179cdec12b09b17 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/12642a4efa84fd7e58e3dff315b68c094a05cf6d |     
   nios2     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/8a51626a045032ae2011f56a123826c2fd2e8fb9 |     
    arm      | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/36376b45989a3f0097f19b2874bf574bda7afb75 |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/cecd480a303832c3f7a63ce9fa891731eaf85a41 |     
   mips64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/a66d4734397f92ba9c12f8cec162934e2ffc0cae | ORPH
   sparc     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/8ccdf6117924d1b4ff6170e050f11b31c632296a | ORPH
   s390x     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/d1a0488344617d443f3427452d91e85691069a42 | ORPH
  aarch64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/0c67b90d5f9b64da8e0f88adc15912d9265de028 | ORPH
    arm      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a697e3f18afcfc27023a8076ce2d6b75dc4a13a3 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ffcbc1f69bd93a146e580ea1654005098e83e8ad | ORPH
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/97e396223f94a92daa625c7892a80174f1d21478 |     
   s390x     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/4abc72ee8252739cb124430e19bae7de44fe292e |     
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/f2d5873a461756e66448182bf3c9aad3c635d443 |     
    sh4      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/c4adfdc824649f886060f9a223d32d611a9b9143 |     
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/1e19570e278f9209c0bfc1ea239af739dcf3f4ba |     
   armeb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/38c65594478c976d8692f8b9fdd262a1162b9606 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f6448f483a4251c332fda6d4cc5068f0c3ff5146 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/2e15f0b7384defb52bf0f832ca3ad04284888c79 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/4225d9f415fa6d748f95036af3e273d9cc6acaa0 |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/780247292b6bdaece1390c72d1ab6f8a6f1f4c38 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/e09ca8192e5e91e2b585e77cac77f1b47ae892e3 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/80333d5900cc2da52d6b50c25b6687abb1acdaff |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/b1140fc5c74d81a451569ff9a04772159929abb0 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a14da80baa53a92a3d2d85b32a8e48741352cfa7 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c501c5656d1c3d8b0bc2062fe65ad7ab5aeedc51 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7d282b8f7881a762849bf7ae5c19d2d4965bee35 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/8bdae4718ba330df12b390e78bed88cfffb84c5a |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/452d79b3291b2056a150e601dd1cb7b3351208e2 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/61c6f24def5e69a9bf7b55482023341270b09b67 |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/2565152fe394e099f616147ec97fb385cea26eba |     
  powerpc    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b120deed2203ef2e040e452a9cf7304cd5bf1723 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/4c3edaffae504d964b98f30d88c8b294971afd27 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/fc60865f1ac158ad24d0e1ad184c1fd90cb84dac |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/97e3be7871743cce76776766077db1a5ac9ffb75 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/413988e84708e7d7a292ba47b47556df2198129c |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/092d4134e41b7998474ac186897a7bf62e14f856 | ORPH
   armeb     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/2ced3acfb3fc8a0c89b1640e14e06a0466830f9d |     
microblazeel |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/ee7d7d989d1d3f9b2b4fc4eb646a6470bfe48776 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/013f5b7a0ec457b9e6681f6e9b6d798add8aaee3 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/638b0ff47e648f98625876d6f5ed713cb2de75b4 |     
   sh4aeb    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/df9e050d6c2f04f6cd011d16d6649054340814c2 | ORPH
   mipsel    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/603343a8051d2a888f93edf99a67532dc46f0a80 | ORPH
   armeb     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/0beba2fa228478576b312783be468dabda65f92e | ORPH
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/67da5113ac526c85058a163944d25fa2b8f65f81 |     
  powerpc    |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/730f300560f0b1c57ccfd845a65388ab1c550b35 |     
    m68k     |         libjcat-0.2.1          | NOK | https://autobuild.buildroot.org/results/adcf5dd86d4ae719f4dcd88252d1ad47ecd9676d |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/0034c3148d249312d3da09fde843192b79749835 |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/0027e90b42dba0689c058e97bcaf70198773f4d8 | ORPH
    arc      |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/657c62e16967c79ae55249158086f945e5ebd697 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/c3d29658350a4fdb6c238d9262ebc081a2805f72 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/d236a473f06a0946a87355a89fcd41b17d1815ee | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/58101ee0a63cb3b38ecd943fa436d4f71297f2b7 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/7b0fc76b3fd12d6e9baaeb5100baf3a1d638dd95 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/155e7f2809bc349fc66c5b5d621cda75c2f1024c |     
  riscv64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/22ce1600ba67ecfc6528d8870302b84c6efaa408 |     
   sh4aeb    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/87d985121a0f4bdb775152cabb065f86a6d7e984 |     
   sh4eb     |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/c1be87fa7636857901d793aae651ef5ee74df595 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/74a498f96ab79bb252672073ee6b35c5c109c657 |     
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/2fb1a8532086a2b785c4b391c9a4a8e55ac3e23d |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/5e23ce67fc781c5735656587618024cf72ec55da |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/0b97ad39e778fbe90be25ffdb514513a84e5bd16 |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/60d12c605fce0b56742297b0b011bfbc23cee58a |     
   mipsel    |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/9dca5f3c4835ba91fb93ece02d0e3b050696f175 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/2ead0e5dd86a4e746b0ac8c6947a426c6ce34731 |     
   armeb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/3cb5fab5b0ebea5c2e4ae6691e94e37668fbdfa8 |     
   armeb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/1015e0cb3a5ddf908d395a3fee9ed8fce3ca9c90 |     
    i686     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/609215b343c4576ad08ba14979c7c0d76559a5bb |     
  sparc64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/e7fe81369ab614892407f5cc0db6c466a1da39e7 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/7c2b246b367cfc66d655edbf3b6cca1d979415f4 |     
    mips     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/de8d80cd0e711de3bdf5bfd2ba162cb52b30b9bb |     
   armeb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/9ff3971a77add5bfc9141d731824aca22f5e12f3 |     
   mips64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/ba1b100125e59e9d004aefcecf94ae5bfea4fc15 |     
 powerpc64   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/b3973cbf7d4f2d11a06fac8a3efc53f286f58d5c |     
 aarch64_be  |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/af67afe73cf922aba406bb28077dd1eaba6b60d6 |     
    or1k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a8ba5fd270c5f9ce9d4557c22be7bd4e6248e728 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/db0243ab2e356ba87d533221bfdb8314b3c474c9 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/20e92e66005a9974694c819ae552e56603fd6149 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f2f7a09126b22c0e72b85f694e778983b6c6c814 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3188fc1d2f373398309e67bf0296de3b89646296 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/bad3ab51b2018e7e45e3bdfb55ca922d13f4bdca | ORPH
    arc      |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/aa8249dbf969773e762dc67cd8234e83690257e8 | ORPH
  powerpc    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/c5996a253b8c76571a189440d8bf953715587d4d | ORPH
   nios2     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/896789c5d139952aeb613b348702fe6675ad29ca | ORPH
   mips64    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/3ce4fc1c353d28a9594a83dfccd42ee562d912dc | ORPH
   sh4eb     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/65ee168bfc1a865186ca6843849e36baae3cf3da | ORPH
   nios2     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/014c4c3ab09daab582902fc7a49f7345b2a99a65 | ORPH
 aarch64_be  |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/71700348cc007eeb2427d3436b2ef6a8a8ef8575 | ORPH
 powerpc64   |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/2a3201b3cc27d23bc112deea193cc8e4352bfd6f | ORPH
powerpc64le  |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/0a9635213599c49e2f4f41fd5de3df0e7259fe00 | ORPH
   x86_64    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/6bdcde80d418bd64e5fab46d4959490125e835ae | ORPH
  mips64el   |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/b0695a76660cd5f3fd37c65a2f819a07c3bfcf58 | ORPH
  powerpc    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/0e67b6d44e42a38371efed5a7fee274af5778bcc | ORPH
   arceb     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/9e49cfe3abd731b67c6fd5b46e19e4cf7f5dd68f | ORPH
  powerpc    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/221e8dccdc7461d34ec5251a3c4cc8199dca2d4d | ORPH
 microblaze  | linux-headers-5.10.162-cip2... | NOK | https://autobuild.buildroot.org/results/3829cc35d67cd08d5f0ba823b6520becc22f3d42 | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0eed14773864c93e97e8905bdeb32bdb8145d3cb | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/514aad1fe485af7ff45657d58a080c8419b6262d | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d6f138f7c7a505334c207da9543f1dd28dcf6f08 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/feeb09c5c8fad2fc19a9d8686503edf729d8d9a9 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/5373ac200b0ff1c41314be6048bc04ed6ccf32ce | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/3ab2bbdb108ced2f1f5a5833a977db4f3a29d97b | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/7eb4121df58482520d02c0f99f11b0e35ce24093 | ORPH
    mips     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/0df0fbcdc0d7da88637e02f4088ff4d9211e74d9 | ORPH
   mips64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7cc47fbd0531301fdfaabc3a31e3c775f228d072 |     
   armeb     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/fa4f4fac74a104bb5c1f3d906e2ad3d5e51a67ac |     
 powerpc64   |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/07a6b4f8fc71905159c20ce77c7905a63c6a43d6 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/4341ba501694fd3e0c8667379a1a3052159d73dc | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/11a1f1a0c17e8a2aa8a6fb944908542cd160787d | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/0bedf567602d56e41c0cd9f13be066df533bd35d | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/5b20ab714914129132e48585518d2431f014bcb5 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/9801269a5f13c191f905e9ceba942ac28b7c77ea |     
  riscv64    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/4718feab96cb58b4534a6cf4329380e9d7a3116d |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/049e93fc8a1f837b55dd9a87d10bcc157218fc8e |     
    m68k     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ef0f48d8cd455508efb3aab77bc433ffe13f3d44 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5a9cea3b7749794cc6fcb0243a8cad4766aa5ec9 |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/45354cac26f643b33132f7e9b9698c619d39b363 |     
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/224ac87f46f82d58cd5e3e17880dbd7347f52c73 |     
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/22847c1cba43e11c809278e3d43346e8dcfcc156 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/f400a7cd2d4a53fa34c101ad26e0d13991f54328 | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/36a4a4855294eb5edca374ec64634726ab8cd9aa | ORPH
   x86_64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e8ce230c965bdcc8ae53a6bb2fecd4cc2eb3097b | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/3de8531f477e015af966b21434f2701fa1cb5290 | ORPH
   x86_64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/c9f9f8d9e876debda7d44f816fab8ca3db1ae539 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/aeb6142184d19150e255449000b927760aa85940 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1e54a3ac578fa85882bb9fd374911af5c73b3b7b | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a67d1e6a7d2afb22304ace6c3c6464a603644165 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/43805f355169f052d9bfbfceb934ebe4c5c9ff04 | ORPH
    sh4a     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fca169ce475030ab4a2bf0c9f1cd876867be7674 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2ba25979da9495c76a247e7e783c0d95788ec35c | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/184d4c7a2788361a9bb80106e7f1d9915e7123cd | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a9c8f567648420f8f5545132712af7bbdd144735 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0e566b0ec8d43c31c5f92e2910068e74a1c56e4d | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ccd33f991ead39faee091b365ec13010bac3e764 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/043ba2c31c1f3d85ff443183d8fa4bad01b36b4d | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1cbcc0e0fd06a7a869d439911954876c2e7000c8 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c578d7e052ad2caddcd2c16b2edf95aa1a51ebed | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d1a7929fdd208b3905ae48ea8bb00057bc39e3df | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8ad3204da1f3814ecddc8e5d7467f46aa2a15142 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/03bcc026f23aedfa9f63f24c72f46f294daf2c76 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f73a85e88ef0c7250fe01490aa854d389b7292aa | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4d5c974a07fd0f959d4dbdd5978afdb7377189f2 | ORPH
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/de14b7e0bf30351b8bdae7347e1cbeb1bda6a8e1 | ORPH
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0787d5c302e6dd69c1cc5f9ce179f17525bf7c29 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c634ecf7dbe86f589c84d4d41a973f8edfd3bf1e | ORPH
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/da8a45a78a88196be140f96a93106283cb61a422 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7439161bc40ed48d0aaa08ae8ae0d0754550a22a | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4500646d83b2d7ab3c42abf34a8b800c72176443 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c58cf9d12a593ebd2f040a6efbef81508c1bf3b2 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e7e7defafab1bc51b75403740844aa56e74d96ad | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f7cafe4f79b4464a8ac6543b3bf83aa8675b4dbf | ORPH
   arceb     |         python3-3.12.6         | NOK | https://autobuild.buildroot.org/results/b18cace517aa0802aac8437cf1a3bf7fc62c283a |     
    m68k     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/5ff002f9513778342416a4966ff46f0a8cad182b | ORPH
 powerpc64   |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/b967293f4ea0ae01d62f002c839029fb90031756 | ORPH
  sparc64    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/32e9767579511885056646d522788934fa565500 |     
  sparc64    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/c6c6c49556776456d71a0cc45114ef6626f97ea8 |     
  powerpc    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/14b0673d21e1a10b32accffd9c68347f1c401721 | ORPH
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/4b4d77b77eee72485d8b9fb6c83bc453e492be80 | ORPH
    sh4a     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/091804e7b5dfd0accbd92de133db265970fcd31c |     
  sparc64    |          swipl-9.2.7           | NOK | https://autobuild.buildroot.org/results/e63f866f279e26e8245af2fd2afff242d8eb29ea |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5bff85fcfa4a9b3b1bb239eb2417e6a3e69e76b9 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ccfd49ff3461ba857ba0bc0f1f4ade07e4288c1e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e3a77c23c3f7a82fcdd1645c25a0eee3577a8f16 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/62873c1055f6948e915b8a41c5bca9cdee92f6f0 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/902283335922975fda43a78f0137d07fcfb95297 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/cb43406e303a653fff053fab3af4d6057432c24b |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/04d3f97c90a8128a2a9416ce80d6f3233189a5c9 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/99f5ccf412f1d99da3d038787e32ce1ac00dcb8f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/95e360fc891242a67afa0546a343f82249596035 |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/1dca71a6837f2c5d80c625a53dd09239da92704c | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/1a69c2e64d64fa45711138b777136a514594b919 | ORPH
  riscv64    |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/5b6e1108fde65aafafab818f43feb648644acb6e |     
    or1k     |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/acca09891d6b668da6f394d19f948e305071495d |     
   mipsel    |        xwayland-23.2.4         | NOK | https://autobuild.buildroot.org/results/287dba98cb76612dbd10bd98e168eab15af5d8fa |     
  powerpc    |         zlib-ng-2.1.6          | NOK | https://autobuild.buildroot.org/results/c289a719e10677a3e7375bfb2e3bb531d3cdb56b | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 2 
  gobject-introspection-1.76.1 | 2 
             strongswan-5.9.13 | 2 
                bpftool-v7.1.0 | 1 
                  dhcpdump-1.8 | 1 
                    gdal-3.8.2 | 1 
              host-runc-1.1.12 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
          libcamera-apps-1.2.1 | 1 
                  libffi-3.4.6 | 1 
                 libv4l-1.24.1 | 1 
                  nginx-1.26.1 | 1 
                  octave-9.1.0 | 1 
               pcsc-lite-2.1.0 | 1 
               procps-ng-4.0.4 | 1 
         python-pymupdf-1.22.0 | 1 
           python-rtoml-0.10.0 | 1 
            quickjs-2024-01-13 | 1 
             sofia-sip-1.13.17 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/42c8ee57a7f6fb6357d19552e3ff1b92af26ec19 |     
   mips64    |          dhcpdump-1.8          | NOK | https://autobuild.buildroot.org/results/e54cc0c75fe8d00e4cc2ec5895ac67bd8e30e562 | ORPH
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/bc4b45cf6cba1cf862a44ea69b5988b09edf0062 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/24609bf16ba3be1e5eb678233b2d3a1a17a154e2 |     
    sh4      |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/e2fa8e09f5446fc72505a64df2b5e29880ad0948 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c078b435aa2a9bad343d773cb539336cce7b56c1 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/253f7a2389f8c7d0205fe9b830da73d85f64b6ba | ORPH
    sh4      |        host-runc-1.1.12        | NOK | https://autobuild.buildroot.org/results/4729618bc52c9c9f50368b28b211b05ee5aef7c4 |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/e369d3fad68e65907f2c2d5e36df17f69cd3b5e5 | ORPH
  sparc64    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/09aae6eda8ac6b0c2ce923d26e099878574c1d22 |     
    arc      |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/df05ebfdca4cbcc66aaeb15bb6cee6a913cd17de |     
   sh4aeb    |         libv4l-1.24.1          | NOK | https://autobuild.buildroot.org/results/c9fb6a44e65c5d4c552a3f2b86c73eb3d5bdadf8 |     
  powerpc    |          nginx-1.26.1          | NOK | https://autobuild.buildroot.org/results/b99e0ca9eec10fc3984d9449a29824dc8b6c2540 | ORPH
powerpc64le  |          octave-9.1.0          | NOK | https://autobuild.buildroot.org/results/f7a2bd0824987ae6a6bf72a67eb01559138fdfa1 |     
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/864ea309708d89118f9e19950fda41a11aaf1dac | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ad5d8d317445f59b6b8581f056f0fc22fd9b029e | ORPH
  mips64el   |     python-pymupdf-1.22.0      | NOK | https://autobuild.buildroot.org/results/5d31b739fd9450275cf994cce97e295c1ab622a9 |     
  powerpc    |      python-rtoml-0.10.0       | NOK | https://autobuild.buildroot.org/results/8ff361da5aa0bb8ad974443b9eede05842130cea |     
   armeb     |       quickjs-2024-01-13       | NOK | https://autobuild.buildroot.org/results/9d3f1191659908508ab4e0321172fc0e97ec4929 |     
   sparc     |       sofia-sip-1.13.17        | NOK | https://autobuild.buildroot.org/results/f61d0102f97f0eb4e6ed4fbcdfe949acfae0f203 |     
microblazeel |       strongswan-5.9.13        | NOK | https://autobuild.buildroot.org/results/aa8480fb39ab991177c2287d20889e27a7cf5bfb |     
microblazeel |       strongswan-5.9.13        | NOK | https://autobuild.buildroot.org/results/21e919d2ef1e6a03ba8876377ba92fe4dcba7504 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                       unknown | 2 
                   rauc-1.11.3 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          rauc-1.11.3           | NOK | https://autobuild.buildroot.org/results/e2b4e7de6a243605a1fdaadedc51548068406a3a |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/88d69d72497d9643678dc3a7550e81bb07b17711 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2e5102091aa97d2d0ba14ee1e56a4deb73f6c11c |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
