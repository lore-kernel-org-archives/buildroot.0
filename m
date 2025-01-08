Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E9DE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 04:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1DEF607A4;
	Wed,  8 Jan 2025 04:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3RIMgCyRk2A; Wed,  8 Jan 2025 04:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1F960067
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B1F960067;
	Wed,  8 Jan 2025 04:14:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6F721EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 04:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C178040310
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 04:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEt_4lZdyiCM for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 04:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8636040313
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8636040313
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8636040313
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 04:14:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso1030148266b.3
 for <buildroot@buildroot.org>; Tue, 07 Jan 2025 20:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736309677; x=1736914477;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7GzggUDf635BDNBhQXbaOUyFdLqlEZJq4FMcvWgwMp4=;
 b=JRSbZs1x7Z5rAMd3aBagepNkc1yOdUxLHHM4n0/EDQwgvSKiSLhaOMXECdJX3fE+M3
 jhHYX4udQsUXFIt/7jAjD9p5AqUI/yHnQZ5giUEVfeCL1uJjWX3wyIohbzf2ykqMmvc4
 TnykGROACswWrZX9v+C++if1qJ4C3mC5ndGvIgpoAdZRzpFmZsqNS1MWOkpha4AgXGw1
 BibG3WJ126hwJmRYWKFI/eEitxCbXhalLdPNHRBg3L0C9DykobtBnW4LIkWhjs6NPVCb
 1yyjzgQx1uDxE6c0el37Q1vnibspLYmPBiEBAV6I7Q5djJOwxpf4/1m8+tTLy1uuGyT6
 sP+w==
X-Gm-Message-State: AOJu0YxClmlizFXQBB7P9sqcLjLIIIkSgEoue6JNHdmThSb6xVlXMikU
 2WXpan0yGCPfqA77dGkciAPggFVq0DOA+Zy2Nyc86/6iKoVF3ym5IUJK/w==
X-Gm-Gg: ASbGncukIGi95ijJhMtUb/4jBkvCB/vn48sd1o7rI6WRe5euhm7ByDtPlIm59xeBj9A
 6DpW/REBH5+lwBO97A0Pa6vF5o0g/Z60w0GGbOb1FrCtZIoAWVqj7Njn54t+MQCDeBzMjQSkGYw
 /JbILcqmGYNNWndRqGJ3QPYGJroTUhWqRd2KOlsag8W3lQT0g4F/djppfLWQRn31SLJqDs3SJLt
 wQKO0MO4g3M5SMMZasP/w/5UpcA60LTqSTbPLYTJVviFQFvnwsLdFR293Ee
X-Google-Smtp-Source: AGHT+IFzg8jdi9DTXR6EmnDizXfuXuUstnhhvkWbZgs/caA8WxiW4vsR5rBh2Sabdk99j4FX1keLDw==
X-Received: by 2002:a17:907:6ea6:b0:aac:619:e914 with SMTP id
 a640c23a62f3a-ab2ab709e32mr103913766b.16.1736309677057; 
 Tue, 07 Jan 2025 20:14:37 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aae8b802f64sm2251791166b.108.2025.01.07.20.14.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 20:14:36 -0800 (PST)
Message-ID: <677dfbac.170a0220.7b817.4b42@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 08 Jan 2025 04:14:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736309677; x=1736914477; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7GzggUDf635BDNBhQXbaOUyFdLqlEZJq4FMcvWgwMp4=;
 b=egUei38EB2O93XP9k8+/+Y7Msjq+rrqfvzZu3qZmRqRO5zxUxlWSQGfqTn79PAXm5O
 Ss5oWtDuRfpy5DwoJU50HSCKKpOxhWr89L8nC1SkpGy1RUD/OR1fxFlnu2KYLXi2xQNE
 ikm6Lfo13+l5RwI37x5KJMde/jMszcrWlqOuIOnkCbItkxxunr+XoYNyF3lhwssbjRf4
 ZhFrjM3Hcw124TvVD5FTwB+cRC+vVC81HcABZyxOC8XojTFeWpikL4hxbq6HrGQ7Mh9D
 8k2pD/ZwBBBXeEn0TVsuRZ8fI4KYNtjZb0geDEEVl8E+dty1C+XidMFuMeOgv0NcdJXs
 n3wQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=egUei38E
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-07
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

Autobuild statistics for 2025-01-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  2  |  0  |  7  |
  2024.11.x  |  1  |  7  |  0  |  8  |
    master   |  9  | 76  |  0  | 85  |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-9.2.0 | 6 
             util-linux-2.40.2 | 6 
              libopenssl-3.4.0 | 3 
                  ntp-4.2.8p18 | 3 
                  curlpp-0.8.1 | 2 
                   foot-1.16.2 | 2 
host-binutils-bare-metal-2.... | 2 
              libtracefs-1.8.1 | 2 
              libunistring-1.3 | 2 
           libzenoh-pico-1.0.4 | 2 
          linux-5.10.162-cip24 | 2 
                   linux-tools | 2 
           oath-toolkit-2.6.12 | 2 
                   perl-5.40.0 | 2 
                 agentpp-4.6.1 | 1 
                apr-util-1.6.3 | 1 
           at-spi2-core-2.50.0 | 1 
             batman-adv-2024.4 | 1 
                  bitcoin-28.0 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                 coreutils-9.5 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                 dfu-util-0.11 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                  fwupd-1.9.20 | 1 
            gettext-gnu-0.22.4 | 1 
               graphene-1.10.8 | 1 
            gstreamer1-1.22.12 | 1 
            host-binutils-2.42 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
             libargtable2-2.13 | 1 
                  libnss-3.107 | 1 
                  libsepol-3.7 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
                  linux-6.12.7 | 1 
               mariadb-10.11.6 | 1 
                    mpir-3.0.0 | 1 
            netstat-nat-1.4.10 | 1 
                  nginx-1.26.2 | 1 
                 openssh-9.9p1 | 1 
                pipewire-1.2.2 | 1 
               procps-ng-4.0.5 | 1 
                python3-3.12.8 | 1 
         s6-networking-2.7.0.3 | 1 
                   swipl-9.2.8 | 1 
                       unknown | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/0b0d2c813915d218a6334b2cad6c100667edc89a |     
 microblaze  |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/7097587568052cef61a5409cca48292710ba156a |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/63d52cf933de3c4c0c54f614b88de71acd3bf058 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/b402f419793a0c65469e672ec5319d0e5e6290f8 |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/d8e9947410cead308a983eac8f1e56a0af92bd18 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/cd77d3e9b03cb9c0a5246d981ab897cc077c6689 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/edcc6fca47e37008b194117dd71805ff4bc4b656 |     
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/8c7acbfb9371a4151683576fce7c464c33913547 | ORPH
   mipsel    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/7ce281748f111cddbb1cc2c62cda1d997e3beb62 |     
    i686     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/a4296e7c964b1871ad0f4950dce8b423989c8a3a |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/a83793c08662dac44ef79a808d9efb4b9bd22c5d |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/df845a853008f4e93f1bcb64bd3ffb303e2e572a | ORPH
   arceb     |         dfu-util-0.11          | NOK | https://autobuild.buildroot.org/results/c7bd1ffcbe9cf84270688a0f0c9582db86264d35 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ef49fbc4080b1109fe3126ef35fc769a86941458 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/d0306f5ff6fb7208ff79e2f26536d2281e54fc7c | ORPH
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/043ebf6dfd2081e5ed42cc64e5c199df17c93943 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c3326481f997a9a31f4d088c50fe73bad0f19754 |     
  riscv64    |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/b90f3fe09154df15b5c13ffdae3e34b4d1c975f8 |     
    or1k     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ffd058984355651ea8f08ae28aa1aa555e8aba03 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b36f762509d5e49555c85f2c37597c28fea8a640 |     
    i586     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/798235451973a0e1226ad62308621522dd782d33 | ORPH
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6c1f3209016436f887c43ff29f31ecff24c28387 |     
    i686     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/1ee391664db31f6677d53a3c888539006f8c02aa |     
   arceb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/9df7764cc75525d6de42c49704c738376508d052 |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/40bc10d574f687aa7a55aa95e53ca3a024ad530b | ORPH
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f283d185e782e82b7ea755b8b4484cf90e61c214 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/9cb71a3be76984125fec80b5426102d76591c21b |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/fe0d065f502925277c10fc394ac16c054188d1a0 |     
   armeb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0b9ef1ddd92ad0f72916b506cd9543f2ca4e4f29 |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/2608b7cfcedc21269f08063493fe66c0381357f9 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/4ef7d18a9efc72b2eec886d82ee297ae1eb4914d |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/d819f504ee87ea422e6e56753a3a36d35b09ba4e |     
   nios2     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/5feba19fa266b0d9aeaceafe817fabf190f387b1 | ORPH
    mips     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/c5f665d5da19fd0dc07f56fcedaf3af708d4bc57 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/e91f5786e643efcef2c1ac0f7c7446a8592fb3cf | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/8328e7c7ee910a1a9c29c27d4a1be44ecc98c1a8 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/878950a7283f0ce1024637e1ca92ea091a7cc32f | ORPH
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/20796471fa80337f18f3d99a64b1fa0e6f670e5f |     
 microblaze  |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/3ec366344c42f052d30a89fdf0413e364bb2c8fb |     
   x86_64    |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/67df3be6c69921d86f31a8e5e3a8a6ad8b3f31ed |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/eae875cbf3db619ff35271f76be8489ee2c58918 |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/7475062dd3d0317d5efebf74e59ef760e2ee11fd |     
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/8481944f3bb6dc73b5e30542628785413e580325 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/ec8e81e3c1aaddddbdd406b57285766af1464018 |     
    m68k     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/46717ecb48ea5301e80df7ac5eb6f8138f9f021c |     
   nios2     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/f68e0e6b33f3818ce5488795cbe13f17efd1a4e1 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6c23cb043bda83fd5e790a3681bd3ab59b60b90c | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a8f631e83e60cc50bace433f61a3a6b8b397e840 | ORPH
   x86_64    |          linux-6.12.7          | NOK | https://autobuild.buildroot.org/results/dd284154eb448cb9fe9c82cc6c071af714cf21ed | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/94fa4af2294f270c61a93d3311433708e11e46eb | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/12ffc8e2458557cf6bd22fe1eadd3708d5adde71 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/802608d6150d9e50730a9e52e84288e16ba349f1 | ORPH
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/55d8e9a864489092303780efb2390b8af56dacaa |     
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/83cf468fc07d002d3cf67178b583ad02528b2be1 | ORPH
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/3b8a9d233e536d84870624ac8446c8ae93bf481d | ORPH
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/bc48a944188cf4e254ad8c90f84978b4e2d29fec |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/aec4cc82aaad226efaaa95c688288af348f3923b |     
 powerpc64   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/151ab909b2ee6aa6a43c10d9d32eaf8e958696c5 |     
  sparc64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/6f0fa2da42c48690720a44f28dba4273247a382b |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1706445cc4dda43945a6a71ea63db60168b6c9ff |     
   mipsel    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/591aafe92aeb1e38f9b97d1bd1e6b896cc8bdd35 | ORPH
    or1k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/6df1ff2de0bb73912b0d4f52a9d1682cb1544253 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/2723c51314926c093f1e1dfe6dbf167258a21e80 |     
microblazeel |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/fa966b1cd4a23bc68a19de1d5e65dd57d344f2f3 |     
   mipsel    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/0911719d1d3075a3a64ae379676ffa163ad43120 | ORPH
    arc      |         python3-3.12.8         | NOK | https://autobuild.buildroot.org/results/38766332c391ce97a566c6e2255a947e6074152b |     
    arc      |     s6-networking-2.7.0.3      | NOK | https://autobuild.buildroot.org/results/c236d27388f7cca24d1ec88317274700a88976db |     
  sparc64    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/e084a833057fdf9bfcf41e66a704b7581f80ad44 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3523a2b89f1884077c056dfcf0d4f3a1e4e29b54 |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a4854a11fa1a0b2778db8962cefe2184704fecb7 | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2f58261b3893ddda1490eaefa5cded3d606f2d91 | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7cf0a5f529ae7d110185265c4e71df024ce90ffd | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/92b85dd9128163816ea87d8af897c03f4e066c81 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/71e876e491725dd3c3e30d013aabca37cb001cc2 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/895758cf3bcbdf333b7442005e0556caf03a8029 | ORPH
   s390x     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/4e1905208b277a24d1c004da095d30f6b97e295c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  curlpp-0.8.1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ff158a801bf816930707b60da374cd6f8b0aa520 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/952faa99ccbd1df67edae12fa941a8c87b95c993 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
               libglib2-2.76.1 | 1 
              libzenoh-c-1.0.2 | 1 
            netstat-nat-1.4.10 | 1 
          python-tinyrpc-1.1.7 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/809432ea87b7d87ab2464d55ac7946459eeeeae5 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/525e6676dc247e7d1bed79422ff1354e637128d8 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/b696a4d65cf325466db33ec0e895c626508b5be8 |     
    arm      |        libzenoh-c-1.0.2        | NOK | https://autobuild.buildroot.org/results/df7cd8b3844bd675e9477008570d5b62c7a109bc |     
   mipsel    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d9a73021d8a0fc9139d8672164105435ce0351fa | ORPH
 aarch64_be  |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/b3107049545cb5cc997061ed542467e94bbf2868 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d65486e882e5bbb3e093274444a636916e0a5f43 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
