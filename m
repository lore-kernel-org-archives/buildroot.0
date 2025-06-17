Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1E2C71159
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 03:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3780A814C3;
	Tue, 17 Jun 2025 03:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9drRD6LV3WJ; Tue, 17 Jun 2025 03:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E3081549
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51E3081549;
	Tue, 17 Jun 2025 03:16:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87DA8151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 03:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84AD3606CE
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 03:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVpji5bXqW_m for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 03:15:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D10B3606C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D10B3606C1
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D10B3606C1
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 03:15:57 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad89ee255easo959071966b.3
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750130156; x=1750734956;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RSOEiFmFXub1PXBSn7wDWQUljvj48bQa6kk+x7YXsuw=;
 b=YrIIo5H2rreufJ9s9X6PYiVwhujz82SjsOXmEVBHh7eliB9vc4my3KB4cvpxdi67/m
 MAKja4ixfwtxQOunCsUMnXVTV8u5cFfZf2lqCoe2mLEDfHadkAWS/EvKjy/HtrrLic7E
 AY7+r+cwA3iTf17Kk1wSQHEsLFhvPtG2Gpf5PdMJb6517dlp6T5mrw7qFH6+o070tFoA
 p9GsstBumBSAZaCmHHkbM2zV57wAOOvxw3mb9bjDNvreSzuDs2SRaLLVMD8hdtn27FF2
 hYdxXZRgM42NWxsKo3thLpsHB4a2rstKxIj4RHMqzEs4lzWndFIOhR5D31jVZlVhKiyF
 oqaQ==
X-Gm-Message-State: AOJu0Yx0+PqHbF+3A5Mmt9Rquu29kBYdLMcfbJbLn1uhEhK7Tcc22cdY
 d8pEZHBjRMgoUkk9UD7CcIncvujVHnABuIM7UUZmVz4RMZjLriXgCASY+6Nq6A==
X-Gm-Gg: ASbGnctgNvfgGoE1PMxfK5G8i1T2+WaUDkEPWIPuTFf3x2levDEImJOQB8Ss7rJxFhO
 XfDSpdDYPNZc9qGscresGsCcJOjYeRuErU8AYONGsGb7F5oO6Dgmnhn/zOAkyy9Nd2/aZaxmRPn
 lPkcxwo4q7puemIKSTGEhe2SAoWDCJlNIQrG8a1MgNPAMuQ4Rv/I+HAAfh4xl7EPOZPuFknFjgr
 UQiFTXXB8KeNygTWZG/Bk4mRS007mQ4aSqIPgZo+wq0rN8jvhZQZErP7OAh5+Y6WtpHs3f6WI5E
 9dAVqH3rL3rueQCFPyMemu2CG0D9/p/XLMWgA4sWu9tFxx5CHthKqqEC6zHOsS3mtw==
X-Google-Smtp-Source: AGHT+IGo6a9xEhUazVIpVcpjUvgSsBRmERdYvEYM9nlMJ2wAaMHvlmNFxfLwvcdRxU2r32wMySOnOw==
X-Received: by 2002:a17:907:3c90:b0:adb:2577:c0c5 with SMTP id
 a640c23a62f3a-adfad5c74fdmr1088002166b.38.1750130154732; 
 Mon, 16 Jun 2025 20:15:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec89794basm784528966b.149.2025.06.16.20.15.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 20:15:54 -0700 (PDT)
Message-ID: <6850ddea.170a0220.1a7509.465e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 17 Jun 2025 03:15:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750130156; x=1750734956; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RSOEiFmFXub1PXBSn7wDWQUljvj48bQa6kk+x7YXsuw=;
 b=LOhKZc86KQ7QLyETbfZDk+do4fmGT9N6INfY61Yrh0Mqv6Sg+LnDnY1RTxb8PnuC18
 udR3n9wjPYyrKFmW9dlkFs3ywrkCC4b/isBOrIhwTpWSF3EykYISsKokSs/nCS+kyjYv
 9p1gDhB5F3Ak0c6y4dEqIYgT/dELbyf2R8nqiRo/EjynlIL0QoKj4bCkV1xFpP8etgVh
 tDlkGIaT6WhaIuDD9/V2WArDmtWVHuqwD1lcHNMIsk4uewfUuKVlTqqmQpWmn9hIqHlZ
 pm6eE/kf98VM/HjuiTG1UveRcJHUYgOVthE4hS7RElnKg+pD30pUx3CrU6Er3SmS4D9C
 LvdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LOhKZc86
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-16
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

Autobuild statistics for 2025-06-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 10  |  0  | 15  |
  2025.05.x  |  4  |  7  |  0  | 11  |
    master   |  4  | 486 |  0  | 490 |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 71
host-gobject-introspection-... | 56
                    bmx7-7.1.1 | 33
              libselinux-3.8.1 | 26
                       unknown | 21
host-binutils-arc-2023.09-r... | 17
                  cjson-1.7.18 | 14
                elfutils-0.192 | 14
                    gpm-1.20.7 | 14
                   avrdude-8.0 | 10
            host-binutils-2.42 | 10
               bctoolbox-4.4.8 | 7 
              host-json-c-0.18 | 7 
                  linux-6.15.2 | 7 
                  ntp-4.2.8p18 | 7 
                   bash-5.2.37 | 6 
             batman-adv-2024.4 | 6 
                       cfm-0.3 | 6 
              mariadb-10.11.11 | 6 
                 apitrace-10.0 | 5 
         host-mariadb-10.11.11 | 5 
              libopenssl-3.5.0 | 5 
                 openal-1.22.0 | 5 
                    yajl-2.1.0 | 5 
amazon-ecr-credential-helpe... | 4 
             berkeleydb-5.3.28 | 4 
  gobject-introspection-1.84.0 | 4 
        host-berkeleydb-5.3.28 | 4 
                libesmtp-1.1.0 | 4 
     linux-5.10.162-cip24-rt10 | 4 
                 agentpp-4.6.1 | 3 
                    azmq-1.0.3 | 3 
                 coreutils-9.5 | 3 
                     gdbm-1.24 | 3 
            gettext-gnu-0.22.4 | 3 
host-am335x-pru-package-5f3... | 3 
               host-vde2-2.3.3 | 3 
             libargtable2-2.13 | 3 
                   atop-2.11.0 | 2 
                    bat-0.25.0 | 2 
             dahdi-linux-3.3.0 | 2 
                 hddtemp-0.4.3 | 2 
           host-squashfs-4.6.1 | 2 
                  jack2-1.9.22 | 2 
                libkrb5-1.21.3 | 2 
                 libsoxr-0.1.3 | 2 
                     libuecc-7 | 2 
          linux-5.10.162-cip24 | 2 
                python3-3.13.3 | 2 
                  snappy-1.2.1 | 2 
          aardvark-dns-v1.14.0 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
               arp-scan-1.10.0 | 1 
               asterisk-22.3.0 | 1 
                  bitcoin-28.0 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
                  cairo-1.18.4 | 1 
                  cmocka-1.1.5 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dmidecode-3.6 | 1 
docker-credential-acr-env-0... | 1 
                   duma-2.5.21 | 1 
          esp-hosted-1.0.4.0.0 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
              graphite2-1.3.14 | 1 
           host-doxygen-1.8.18 | 1 
host-firmware-utils-86739f2... | 1 
         host-gcc-final-13.4.0 | 1 
                 host-gdb-15.2 | 1 
               host-parted-3.6 | 1 
            igd2-for-linux-2.2 | 1 
             libapparmor-3.1.7 | 1 
               libcap-ng-0.8.5 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdrm-2.4.125 | 1 
                 libiconv-1.15 | 1 
                  libjwt-3.2.0 | 1 
        liblog4c-localtime-1.0 | 1 
                 libmbus-0.8.0 | 1 
libmodplug-d1b97ed0020bc620... | 1 
             libopenmpt-0.7.13 | 1 
                libsoup3-3.6.5 | 1 
                 libv4l-1.28.1 | 1 
                 lockdev-1.0.3 | 1 
                    mpir-3.0.0 | 1 
                   nanocom-1.0 | 1 
                p11-kit-0.25.3 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
               pulseaudio-17.0 | 1 
           python-numpy-1.25.0 | 1 
                    sdl-1.2.15 | 1 
toolchain-external-bootlin-... | 1 
                 uclibc-1.0.52 | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.25.1 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/3eb3718beab482787b3d5aa6471f9a53980480d7 | ORPH
  powerpc    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/70f41ec88dc6f8316f731a54aa556f8bef0e5dfa |     
 aarch64_be  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/48e5e3467d0a729b1dc5979386d05d9ef19e9a29 |     
  powerpc    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/049672873031dbe1e415100d0f4b2abf43436936 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/5c3465b876700a738b556112e3ed079e5c06e6c6 | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/1235865cb7991df9125c51d4d587d9d61cd7312a | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/0f10ba0c144918400cc9471c203e86c2eabe2fb1 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8bd4e8538603ee6315763143a9049259d376ffdc | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/523257edd637b11cd84e9c23f709df1fe2050b22 | ORPH
  powerpc    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/44d25b5d001fdeed853151b0ada65ae687d039e2 |     
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/5ce052771c66b4dfffa7c22be2991c5aba0aba00 |     
    sh4      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/488b3804cf2a5216b5a2ff25d10f3f63e3837012 |     
powerpc64le  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/8f3310d12f976ca718bd7aeeb4427bdb5640d963 |     
    m68k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/36b19c7ddc7704816479202f0d251c3d911149e0 |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/11e52c60f684f3de42f1539dd8f91d4d3761df40 |     
    or1k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/c8984006e4aa77da3b07dd9d4c94166a4ed05613 |     
    mips     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/d93e180f645c15eb1a3d9e8279976ff6446620a5 |     
  sparc64    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/c16a742a49d424e29f20d880ab78fb19603be824 |     
    mips     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/29a24861ce93a03f5826fa23826c7fab337308dc |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b3422ed34e200d3258236d73a71d30e82b7f5e7a |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/a6c883cc2b9a5474031dee2a3a724c814e4e5c63 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/38f7cc7f3dc803703f9b7a618c4ebe58e4634c8b |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/8a436e88e93cb8ef7e6a4f772c71a7ffac1edd64 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d7bcfd416c643fccb3788366e948840bcd3aafd2 |     
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4e6d2ecc1f845a438b3ff61d33dfa3966a652b6c |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/5a0e550311010ff47ad6da4815516d8413a7fcb3 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e65b17016a0262987af69a5774c84eaa045ed64b |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0e4e8dcc0b304134c0d396be04bf9348bd000fd5 |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/a96f90db38ff9ab86252cb3a582509fcb814a956 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/92e1d288172181b48d57b9e7b23f434a5d42e7e3 |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/213ca11d787f29bfb8e0f2f453a0d4039dc38249 |     
 aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/11ca109d424e923082426d695dfe4142f8463b5a | ORPH
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/17cc4d0139fd9a5d843596fcc32cf53db44c746b | ORPH
   arceb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e3541cc8374b75d6881162e1a5cf007fb3d85300 | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e32307f3a2c0f6ab5477cb055daf5ca4e4f0e96b | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/8622941c48a290b5cb544a29a683194dfad0161c | ORPH
   sparc     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/6631806767946f5f2d2f3f5da662da39b41ada3b | ORPH
   x86_64    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/ddcbf1bad03c4b0e9439172cd0aab5e50a826489 |     
    i586     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/8484f4c089f936dbdf9cc73c402d83b08f7b76c3 |     
    arc      |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/a68e6a70fec0cae00ed5480326346cea92bad2a3 |     
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/193e98f01b375dbe31aabf32c16897a2837fcf1d |     
  sparc64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f969bd33df7a51baa7489c1d2ceab17bed18cedc |     
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/1b3f2b1bcf519f2da28b8095c6db719ec8ac036d |     
powerpc64le  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/a2234426056dce59c9b5e99d24c0431d0dc1cdd9 |     
   sh4eb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/112bd1f5154c3cc8061251520532404949571658 |     
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1e3a0a45241f0879e1184b256dbf2401a06e162a | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/bf56c52f1d3dfe7fc4a034c77487ce704a012984 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/066c5262c70ad5297277819ca7227c03be4df4bc | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ed157321ed7993e85fe11ede20f735514c5e8702 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1ba6c5e2dcc8671ea4d90c16f841c24c051a220d | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/095be13d8aab0c12588207ada3ac547c8de86d5a | ORPH
    arc      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/dde2d9910c100d831c99096232de89721840ceca | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/42f77ea92edf9863d9004fc7a52e4fae96377f97 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/71bad97245e123ea7c695581982f030c4e60f915 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/29fd9ce704781b1ff5e0940be7255912b44ce587 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/31649a97b8850520c608fa4546d42275e23d2fe6 | ORPH
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/dfe0adc650e626ad030339ef383551dd32d2e48e |     
  mips64el   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/5bbefe1ba5e1953ca12b30abeb12e6baa43f19f1 |     
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b2bdc37592e8e73a9446e06c090d38f1bf35835a | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8802ea5c9727b57efa41c7dd102c2d9da60ed2cd | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3fb5819f5cefde3e370a8fdecedb9961b3a2cb9b | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f2b18a1ee2734c6eae5cbf452137c67ad9d96a96 | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/eea789ea44ef172ed5560659f545e8d0f1713fbc | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/fc533fc4a34e7868e51ae42fa576b5a2e750fe80 | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f6df8b3f49b5999d39835d14ec96efb4b29df182 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/50f0a4c314555475855340df6af35fed5523bd93 | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0f54ba4303ba259ad31b69ccfd6d8ce88f026636 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ecd4826635ebf08daebe7bd98cd20a482aeac21e | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/78bb711fc136ed96af477139dbb61d94a1315e42 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b84b19ec53f3409a22f7b624fa37c42b9d3fcfd8 | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/605aa7ea383574f9f44925d5f97ef943df193ada | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ccaebfbd27d3979137139c95a9f4e55f91df0fe4 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/39a01410edbd6e0572086724102dc277dc7abe4c | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/41bcd9e6f86aa90613388f03f1f8735fe6a8c189 | ORPH
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d66fbb4be6060a070764f65a35c7c6b217323e70 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4959bc1c74c3fde73eac0226cb407e6e73d45891 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/11c2423e84f56abce86b396a67a471af13b16162 | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/58e4a25fa38e011045ac22db0d40af229c112d25 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0f8c5757c031132c82323ca9d832f899322a33db | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f7a8ebb971578bf48a1ce7b4b7a7e4680a9b3281 | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f1b6cc7436cfca26242e8aae4db7d7041f3b2a0b | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ce0db686529572bd72e85b0791ee998954c20da2 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/89934fa7cddcbb09a9de1982df88a2a3fde04e1c | ORPH
  aarch64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6dc18ac00ac8b0f53f1f7979e8a6ba6f9e4d3ff4 | ORPH
  riscv32    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/54ecca08912f7598bd2a4ae343c56944b3e3ab6a | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5630b00e7002a23a37793065a7524424192dab28 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e724e57110d7f3a65f4606fdc49ec928aabfc69b | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4ca2f8f45eccbe846a99677cf3b6d6b19c18092f | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/68d4b13af05805e6dc73523c7358cf54d4f488ba | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d42cc7c9f9ab2e378d0073aef4fe5b1542e67a32 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/17b404b85dd8d1b0af45c01be2c071dd5e070512 | ORPH
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/e175821ec4d6d4dbb194dd23c418a10f54a68d59 |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/295123f5254e55b1d1ca6d598bbc9b013c8bcda1 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/813158fe44b62b6c18cb065c8eaee6bc3216c0a5 |     
    arc      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/dc4b93c5ece77402b95d7a2448b5dae40cce7dcd |     
  riscv64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/f41539296271733e0b965b90b44a2b920c1fb880 |     
   arceb     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/01c5956a36d668004e834cf1bd4a1dd73be597f1 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/7a4e9ff8fadc848bb3e2dead7bda9ca37628d71f |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/53a566211a1d0efae54264b83f9c06c1e9e79cf2 |     
   arceb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/19d06c154149e86c48bcbb727f0466d2b577f0f6 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/70cf62f4f80ba49a77c73bba0881eb877899670a |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/5251e838ea7d721c00e9eb04f7dc31ed7d1920c8 |     
  riscv64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/894a9e56166ddb33d49b22fe1cb3abaf26f1b884 |     
 microblaze  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/3a3b0977d0524d7787ff2c25d3783a422a0fbcb1 |     
 aarch64_be  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/cce4608cce5d97d5f956f381a0f7996b2738cae7 |     
 microblaze  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/907834e130b12b250bb4bfe1b9d0d628d53ad927 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/786445014549b9cf30c838c0f31bdc3588530703 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/3caabb55451aad7d03e2b4f55132f8873349ec0e |     
  powerpc    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/bb15de67553c495b399a00563f56593baa0cb9c5 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e80442852275da9ee527b6bdfcf6ecfe215812ac |     
    sh4a     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/6289213e33c3e11806312c42aa89c14cc7561da9 |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/3c1f1651ac70aa291405eb8bc29e494d3e85368b |     
   mipsel    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/302198854cb1ca8dd0df771874ee61f6fbf032b2 |     
powerpc64le  |          cmocka-1.1.5          | NOK | https://autobuild.buildroot.org/results/ae10ce2bf9e9bfd6f83225daaf2fde6e60e3da68 |     
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/87d3f1d1cf69682df4b714ea0c8f34c679680c5e | ORPH
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/f80e244fde5436e33741f2da30bc369960f22476 | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/6694717613ded9b10752d89de92f82a408474efe | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b2c8cb9ccba437462d0af806770e9041d6b17128 | ORPH
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9f7d7e5865233933e8d5a57893010d7e89ee25c2 | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a1ef2ae744fc37bd07f156fb4be1b5a0ecca30a5 | ORPH
   sparc     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/d0dd44bbe5ad144974d8d0f0785c2def95f16da7 |     
  powerpc    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/ed40f155867b29de5f6e963812dae3d63a93b1ee | ORPH
   x86_64    |         dmidecode-3.6          | NOK | https://autobuild.buildroot.org/results/e5a05d2b241675f37bed6b62dff36d5852799444 |     
  riscv64    | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/5b933ecbfb02cdbbabec7fce79f031fa0a74c28f | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/3764099e5246e8c52f93e5dd8aba4809d25d9e62 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b2f61c49bdae09c55b676bcbc4cc2b1e6da33583 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a079cd606a010dd324b0eb91d61c65838a202c45 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6d3404f37548c7735b5cbd83b8db1b4df4c61296 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ba4b8c2de6beebc0a7bdb3692fb0a38360087c15 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ef67e98ba5292fe9e59b670e4f4dbad0cff1c14d | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/75b56f347797f90be1b7d592fde5a555035abd0b | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ee3816350599d36bdb2bb9b32721099a4d0a7f92 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/63095afa5e2b324cfb50362f62c9344eba3b0a3f | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/abd78ed2834a788640810c89d8dfb64ccd2fc00b | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6b172e21e1b99bf7ee25f421a348624da70d8bd5 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/40c8aec8dcbf0e21b913849f9dc013798c878a24 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c0b0a0ea660c5ec542876477a64dc37a9a660ede | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fabffa67894451236a67fbb495d636dee0dc4dd0 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/59ccae4001c383b413bb1b0a6f6ab2aa57622cf1 | ORPH
   mips64    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/2d173e9df92478302356f6b9372b99423f7c5be0 |     
   mips64    |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/865790b60d5e51671dcbeabf5edddfa7ad6d0e00 |     
powerpc64le  |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/7ca88c3ff6c1b0fd707be86da8e84851e617ffe4 | ORPH
    m68k     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/26632e0b294a078608f498cdb4dc24aee376f639 | ORPH
  sparc64    |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/b817eae9066620a1a530ed52720ee8bd219d84f6 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/b69d81b2ac730ab686d107c54e8164b4c4dd92ce | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/76da467669a3a609de84e38b3f5bc45f189a8f0b | ORPH
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9e0df1678042798e0cf0355d2e3d71dd632ad43b | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/989c3e911793e60f5e728fe3d1dfb345b415c411 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/324285b601d887f28264e6fe2d7913a3cb1642ba | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b8c22008db51cb00b197918a018064695b5f3296 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/afc6cfe39eff9fbb9605000d27638629b2156570 | ORPH
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/e59894066acfc9d35075a9978bb00d9b0d9f57ea |     
   mips64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/5be1ccf023accbf5e69d14b75d1cf018b857183e |     
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/f62e6c9a26617687e9e620cb793f4be151e8afa0 |     
   arceb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/cc16857e6375fc04fcf3a3c603594be14296efe0 |     
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/b0264febf8634268398cfdbc2f80a1293e5eabf8 |     
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/0534c7c1d887d7709b911f619f9823c5cbbb9daa |     
  aarch64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/6e07bbca25fd2ddd14769d4e120cc068b7094ca8 |     
    or1k     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/e87babb3da08cb7ab0596dd9f717bf58fa965130 |     
   armeb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/4c69a28f9047c632797f323e3965d8c5781923ac |     
    i686     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/2e683035d48681803306bf1efa10245329d892d9 |     
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/e01512fe5ab5ae4134cd9043f04ee99a17fa4b10 |     
 powerpc64   |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/fc597eeb8e9137af2d421b0cf184706b04e4e1d0 |     
   xtensa    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/64de89851e783aa53b2fae9fb2c69948f6634679 |     
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/9f703f7942662f20cca0d6d9d99da081ca9e28bb |     
microblazeel |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/58d91d21d46e7b4e73f70435278451539d5de367 | ORPH
   sparc     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/1b915b1c5c5e3915ab251fe9d882c4cde3cf8527 |     
   mipsel    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/bce851e241f8ed879474973235efee6329a2fbe5 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b296d85160ba6ee4728ffcfb28282960066bc5e4 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5325290ba9836903b17df090ede241ed5b71cda8 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/41d2cf7769d254a9c01d7a113ab6a47bdd60e98a |     
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/e3ae2bfa5af3320aa0c142e07b20c58efdadc8f8 | ORPH
   sh4eb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/289086314fd15bebda5ac5c0079fc25011bfc376 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/27513b35bffe1e418cc1511bf9b2cfe70c83be35 | ORPH
   armeb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/109c66d06d2fbec1293f4927ac161e04264914a7 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/62bbb5e59978a5c971b165e809acfb6e2b51ffc1 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/71f8d947ddd5cbbbbb9a10a89936f8f10d97715b |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6f690cbbbc906d556b64dd0fff5b2c274ed3cbb2 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/722736a7b67a121ba28f15504b491836cb022bc2 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9849951e256e6fa8008db5bca00b467b1d805aeb |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3acb269b9f72ee9bb9c027ca7255d9721aa88090 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2225967fe5bcb4382bde2e4728d60e1ade26e431 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fd876519f810c907dd0cc1ac35849ed77c89b2e0 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/393c836353ffc0ee99155fc8b1c82eefbd9dbe60 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fc89fdc053ae2ab59af6815bca6869fc895a2abd |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/47f10cf03202f39cb53e8ed0fb6c011632286840 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ff9283e3e182bc845474573d21bfaa6f03916a1a |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fb567c23fb2a947381db22cb26aaa6456566735f |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a9cebdb450c3a215c9d66c169fb1f484c46d3818 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/41f5d83fed0585fb135406aeb516f55928c66d7f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/307930e59c8e8b8c59288c08eda6bf6e33137d4f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b3a6ea4c79edadde22a3d7a85cf9591f79464382 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/931ed787506a5109bbcf3a9cc1caa8282a2dfde7 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/94738baf9b8ffebb3b716004b8249f46d3f0c229 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/64f2ad6ca4ab5d7e07604e1c7fb764cc5f24eba8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9583867369b3ec8d271013abedaa86f372377aaf |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1b802d08e7e22a53406e5155297b248a8fd0062b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/45b65bb41a1fff1372810beff7cd6a74394f6006 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2593080af138f1246e351a8cc489e88944c01ad7 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8b1b85f7c351153e2ae7c837933e8d5abce4d7de |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/21503364f50ee7d7c383302feaf292522a4b3b91 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9a16f2b3a21ba7ab37cbb9490aba23342182d4d0 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/46dd42b5a75fb7e4f7701a0e17e7dfbb04ef4e47 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5bbdf844958983a403ce61210fc47966f348d884 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2e1029e8796a49e684385ff3f7ac7677927abb7f |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c1c31b7c74378b9e105db375b8d7d09756e8a2d8 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a2aeceb82b5c6ac9f7a282afa3b127f351929d79 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/71056295713eee88bc28f15f49ef1e4ad3259798 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/37d70250be10036e511af9466373324ce2063a3f |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b211c998c50cd924a332f1c58fd04947125257da |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a57224c607d81f8de3add7a31b29352764981783 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/61dd5f854544350b7d4ee0988445aaf635f3ab71 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fc0599f6952af2cded27d319cc8ca669b610d879 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b1bb385e6a0245c62de0fd77f751df5288860ea3 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/47a946e5c7f0960f2abae5af9cc14177f2c6d1e5 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/27060e774fcb216c2ba6dde2c44ce3da6d245971 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9544c6c7288c4805a7d00c4a76d970551626f85f |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/946ce501261b0bbb157e4923312dfc3c8bc0360c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2f77b06eaf4bd9b1d504ab19f404297df788ed29 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/602c1ba6db72f5cc1c25849aac9191f537e3c5ac |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b396e03d1af0183ae118fcc30059b95cabeb6b3b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/37da4ea331a4808202762ac9ea18df54d2726726 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dc370c96c9bce242d2e1288bfc4afa8ded6c4174 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6955b0cfc5bd3ae0a5600c5ebf430b67e2037c63 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cc8cf88add134edb709883db7e30856c7eac3ea5 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a28d05e4599e6e942bda32fd338d139649ae7e03 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0d67e1e65f7f80a03707dd731158ecceb57b2ebe |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3d554e920518e4d9abd36438167e0bae7760e8e7 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fc39eeb6ccd7ecf931cc223cb75582e45e8d1a90 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c4294b51470b8d64c32ce471d997947a1122a7e6 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bff857c902b36c808d08b5cb04f121225a56c8ce |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ccb96d9e8a2895e5f8005502c46a6cc1db0d6a29 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/95d6946fc8f076139473ff323bdd6114a334a416 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a4236ef9ededccd9f1ab829eb5554cfbdfb97a55 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/50faa33b08844a33ab8fdbf3f779b1cf5e163e0a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/83b94e0b57de9b4ff5e8f752250081aa1ba4736a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e110e35c2e8a87700083d83199658abceff01c20 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6d65d61bf729517d27c2ef4713e604026b8b3e8c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/11a70f9de6596a19d997d344dbcd3fe9139e591d |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dbc9e3ad9a896fe69801b21e050ea567326bb903 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c14474910e6064c6873725d9d96ce5717aab0e75 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f3e46466bdf90176cf751f9e9b2b648f15e6edbf |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb51dfab6d9c47153de85415a2f5fdf8fcd9a654 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/14324864d60f910a0d304223fec649cf77490418 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8371f3bab81d99780fbad348453d68e84ceb4536 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/260167649bd520ead599cf87098636adc509408a |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b39f0eafd1e8ab32ae2fa5f3b7c87cd4c69f1b6b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a4c56bbf0b6d647c7343aa7cbc16d81fd8fe5c5f |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4554b5c1aee20d664d0647915c3cdff80cdc543d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/071d3cee07b2b7a480732e0f79ee31a2622bd48f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f682038dd552bc48985dd2f233159942a960fb82 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/746491336260a8e4a738177af0ee21b3ba9f3ceb |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/89f553daf0ba22a52c56fcde77b91fa8804eb0dd |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0afc37a7f7908b5799ca267902c8464a41795106 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2b1c8a1d6ac3955019670382a46a4cba5c3af026 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/014530779851de2fcb5cd0d662b78cab1ed356df |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c2b4de54f3909ae2e766aba23c27dd435762a4c4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/14d79854b00a1baee6d34fa90315cbbdd2fa932e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4fb6901a9783a137fe3026f6d316f1bce8837f87 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/100a7610681d5a2893113fa2491b4fc1ac25b4eb |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/524cdc6b842b38df585efafdd5d4edc91f8805b4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c4d1ccfabc1c48490e423eeb2e74e43bcc2c26e2 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a9e64c30920576036cdfb61ca7ad120eece4432f |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/adaddcb93bec590c52d1aaeb55566a48269b78f2 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/abbf651c1f93eac1f85a4004222bbec138e8041f |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d51aba70cd5264c5ece1ecf896428f02a07d6bd7 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/af565e7902e591ac738ffea0e2826045f9fad5da |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/558cc1f1467b44f6eab50ea4e8b0e8b178f0a89c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3ed33c975c03003f3587437a43529bbab530dc7f |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e6a528e6adc4ef4412e48caeb732cce86f7a3a0d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/533d82229c908a6e216f4234b996d71eadaf4a39 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/97b499f7f1a732555c3aac66c57064f4b03e985c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/16bc40a007acaf7d0ba0d61f6a127b0ad1edaf35 |     
  powerpc    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8284e963dc3f6009ec19c70fdf75434dba5b22e2 | ORPH
 aarch64_be  | host-firmware-utils-86739f2... | NOK | https://autobuild.buildroot.org/results/b9993200545b316c913d55c338273d4f773d7545 |     
  powerpc    |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/e5691752ebf6a2c15f2001c260a1bd7513679cc2 |     
  sparc64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/073197c9ea8e149f257d6b6263303ca4930f95db | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0310fb36f6f1f8d7b2df7ad6c64ed6cfa0b72255 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2ebf938ecb80418f2bb7bbc13bd77d67d3eeddb1 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ff052ff9849b051b87f1fa3ab61c040624af6df8 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f0306574c156907d3b56696ed009c0075f8f3e5c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f8da5512189cfe70891265ca9edf980105bedeab | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d5b6c2437407f4f0a98036133ed644bf84f43cdf | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/caad527d6035c1f9900712068164dd48122c5a17 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/37ace0de69261801807b1c3a44e743568ff5e687 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0ca51d8485d0ccb1206d3376e8be246f47b46c6d | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cc6ff50786e7b916989aeca302003f1154753574 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c14f598322841b68e41eb5e9f1ac3040c64cba8a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c48aaee2892299cf2dcf0eeaa2ca82e6e874ff7 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c6e0e2106651fe4a29ea13a0ec334fc7d0f69fdc | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b7c366a298ed5f41fc595d4e36c1f0c0e5f0b1f3 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a83caa919a04a318d6e69222cbf6aa0f07cde6a | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4c72b7f5b1c0a100e088f7bc07f8e6cef6c97336 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9158ded9c538af3f621cc874a68a9dc1ccba31ca | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5ce709345e9d4acf62fd9319822fcfa710604248 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd051d2e6b29d6e9b46c989e0d113719f332e4ac | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3e057f6689a92efa98f29382bc38504188d1b732 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6dec560a7373206a77d769e50244b4ca09204d63 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/806f2e152281add5a752036f4240bba67124d585 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f62de361ddff7990605614ddce1bb7d37aa82980 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c423bb120585375b344c8ce1f73a97fd4ce400b3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b65619208b296a8cd9e8c6bba80f3a3c791b684e | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/467005496a22f01375429b4611163a6079c73ae5 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/202eb089605a808390c7037a9b1ae143779ea3db | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b8931ac7ce24af6142d30aa4e1f41b96f0f67d55 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a7430652086f287799a4a11c569f57d54e76a990 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c448888f6daa7e21cc1977c58545763b9c5463e1 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6b30c9025cc37b71d493cc2409858bdc02541911 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2bd55f974dc1d206000dcba9ffcac9b39c31c036 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/22deeaffd9a44833919e209ae62e08efa7e9729d | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/080fce89e727bdc1391a40aab08a2cfcf851d8ff | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f0a30e0e52a237d6c0277faa0873a623dc388422 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/899928facb2b50f1f47b295d959898607db3efd8 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/27ed34e6d8a589a3b82718861b34a7b5ab8b78d4 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ac5556177bdfe3dbd713dc6f6a118a76dedac724 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/36563161e8b804369ef9f2c72aad8f61797397be | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8b11b9d8a6a16c0b4641252bf07f60458a2ee1ea | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7869876033ef493e9143e8b0aadce0e1c42dbcaf | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/44286462c78e091ee36fcb1ab31406a30e2b070e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2aec88835539954fe0e71fae0feb3c3084430f1b | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9ae5360e65c460cd506a192992e76416e1e4e54c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ea80bfe54b28301989165ad23562faf02e26f173 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b17d69229d1a81f577f03d8bb3ade6845c529df0 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/576b1f9a48985a1698e7b2e987e9962e1c16e423 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a8e5d31de8653b9908687a86c11a61b519e16954 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8d7c501c17a73e2f647329c15eb5b072a54968a5 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7a37debe1640997dba94c4aed4a15e118c9d0823 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ece8ca515290f84b31a605e99a35deaec0c8b41 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5bd8efecbd1edad5ceee02b4679f131b4d50154 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1464c2025dbde03d196d1abe4723344cb4350b68 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cd4850273f333d98771a59c733025be1635651f5 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/72165777d3e96245bf74c5f053555aed4017e589 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2358fa39ed2a2bb51f28272244e4215cca7287f7 | ORPH
   sparc     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/28aec8ccdd5db6e6914670acc2c5a70d7c1b6fb1 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/da88b97744e473220135c06aa575c67adc507eb6 |     
  powerpc    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/c6f74a2cef15e1f896f78946d4868b75dc8158b5 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/03ec1dc098d8938a0598c381b7d664758c778708 |     
microblazeel |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/61e5622ae801ab694ef29b5d910489893433536b |     
    arm      |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/b4a0f755deb23e52b1f0b415e2a3212f870f0170 |     
   sparc     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/4ee4480b623367fccf97aee35f11d87b65e6f559 |     
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/673afef8282378904a3f9d513f61267f440c119b | ORPH
 powerpc64   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/82acb10daf9aa70dd278a84f4d45bdf753abcc02 | ORPH
    i686     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/85522dccabf2a24c87e9f470fc386160fd2b0938 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/7c85d2dce9c00bb17ad57af7adba8dc81ed20d68 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/7dfb0a74e10c7a89c603d478449f308f092474a8 | ORPH
 microblaze  |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/c1f760f0e31985e42808605a10ad32a74d88fe83 |     
    mips     |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/461091432cf0c63f47fa9092519fc5d4e70da4ef |     
 powerpc64   |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/bea9291c852749b48755def41809f0d65abf35c3 |     
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/40c5e8a600890532f2ab67c388f85978f081c5de | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/13e8ac61d25fac0a8928c6703a0e37b60c62117b | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/6820682cab2bbf77cb6ce89f029539763423eaa8 | ORPH
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/86f098b180a9755d1322248472af6d99b3118de4 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/c9b7d7d2a24740d49cfa5789aa9aab8c2b75f9a9 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/d94f7ada521455fe4f9913c1feb489a659c5b5e0 |     
  aarch64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/8fdb350ab59ece0de91b75db5f253ade95047227 |     
 powerpc64   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/925c5f77419de53357034ef4cc7c0d9a45b4d139 | ORPH
   xtensa    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/ac32a3860c2485c0da2157384af8a1ba9404ea2c | ORPH
   xtensa    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/c6f821677c76632145ebb3b52040ba06dd417574 | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/d4934c14c84b638063a57fcbf394bce5ccdc7029 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/debe716ecdadbcc9aa7648d146b62dd480b06b6c |     
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/e4dbee33c7175297092c3fbdd017547125ad369c |     
  powerpc    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/26c76e08bc9252f437453614654f085d13be80e0 | ORPH
 powerpc64   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/3feb3fb9a71244b2ef2074a27c028767fc7b9f39 | ORPH
  powerpc    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/3c8b1bcb1cb188eeeec11a056005a45f078e876b | ORPH
    sh4a     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/2ca4ec8fd321866986801db3ed0ba8c2bf86ef12 | ORPH
   x86_64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/a5a5fcc42e6d46c5bd6e9793aae81e4a40ff238d | ORPH
microblazeel |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/a5b812a57bc120e54592a305741998a1aaf732e5 |     
    i686     |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/ff9a5f09fbcffcd253d6967d75db14cf1519b392 |     
   armeb     |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/22092fd83d90f88de477a623f31ed18013c5ba04 |     
   armeb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/4d610f09dddae06be223063c192cecbe57332bdb |     
   xtensa    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/676f68223093b52bc921cfd5dabb57a06174c75f | ORPH
 aarch64_be  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/409d03610af700d1de41c3b2a86b91d62654dd82 | ORPH
microblazeel |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/fd4645c4b5e7a3d3730f68440aff5859405123e8 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/d3601472d7dea36ef9c7e930c2236a83cc5f94e2 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/b7061b278df1603ce85ecde113f75debefa51b66 | ORPH
  riscv32    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/34b912e077f160b2adc75a2aae2cf96706193aeb | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/99d575dedac216fb8f4c1ed09bf0b28dce111372 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/d1a9850d22b4467b5179431fa5c2c735be09a99d | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/88f6cd45f64d93bb7c845833089cac475f8e47fc |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/df6820d85b0fd4bab3b29dd18b6fcf6628acbea0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5ba6a76dae293fdb9d28116078d8a557486d6939 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7b2492816b7ac25098ae9260a201a75c4ce651e8 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7e31538a5cd1c490dc1393ab7d9058b13b952b4c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/214ff2c862751f838ea37698d9886a973d17a3ba |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2d52c0a9095079fe2ba56a6792e0500a254b7448 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f1ebb6de257c3b15661b0e8bb1052fb493e463e6 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ea8c56cdc5fd863bf40ae8b105671cde7f2fdbf4 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9ef63b2073bc4c718a167320851e7174bf2fdf67 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8bed80d6823905dd47cb91b73442ae4467535e48 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/93a06e188775350358915decb8d1ceae22e4f542 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e3d8ab767ea50946c93e0ce2dde9e57a5bf76991 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/aefe05c4ebc597ae09cac9edd7b772318a90d140 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/78d07a7aa69389a2fee243f2027edbf391605eb7 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9506e4579ea438d23b954fdd8db715459e68e6c7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7000bced938fae1ff007a9a3ec3cad55f03c9432 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1cc8b89714d721f727059cb6433c9bfcdd991bfb |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/85d67671cb574be47cc2f1e16e833f98d02a8d3c |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/57ff213523341c323f6a03f5d8af9b8dd11efa59 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3c1f902ca3d57e48ee650ac46415fde6d0de010a |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3aa5174bcf3112b6e83bc5e529465c12b1d12b78 |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9b9515e4f0d3c814a892f2ab71db9b5d6623f63d |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/51c442768c9b4ec69799251cdc57fb5cb993ba5f |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fd2ab624cafc3b7c6f0012a06d0e59f2d0d0862b |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fc01feae133f8105ca97f1a51fcd9dad5e89a8e5 |     
   armeb     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/65dc8d944553f0188ca1c6b504e828a9d10090a0 |     
 powerpc64   |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/e327f26bf2a037e5324ba5ecdcacb64ac466e186 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/433a19ab887ffb472ae7d3f30ce5161b5b33fe06 |     
   s390x     |           libuecc-7            | NOK | https://autobuild.buildroot.org/results/e26f7e8f4c029ad17f76f35eb6c346292a763e14 |     
   armeb     |           libuecc-7            | NOK | https://autobuild.buildroot.org/results/292fcece4f95d9548d7f166fd0ee9f6674094509 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/e42ceddac86c97dbaf3a467abe169211f5dbe148 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5815f9a83240257a1c816d2c61c512eb46e9b85d | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5eb843b08406bdbf7b76e4907caed5720fa73caf | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/34ee05ac75c1e1b66b2dd37e3b1c114e45eb5fa5 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b57c69e28a32c97fb8dc965a1d92ed581a96266e | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b0de3b295a154bb959c0163b4fffe65fdddbf395 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a4121b30b57a7a9354a778e10d956e1e5ba9dc21 | ORPH
 powerpc64   |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/f943ec60199d50d4c9560a53f726c8d0d427cc06 | ORPH
   armeb     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/86c48c560558f9d6a12329e071e52db31b966dd8 | ORPH
  powerpc    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/3efaebc54a6b452412bc31a872a3c341a1d688a1 | ORPH
    m68k     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/e12506c5e9af404a874ac953656a288e762d2ced | ORPH
 powerpc64   |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/72720238273a0afb33e50b3060dba02911ae02a0 | ORPH
   sh4aeb    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/5bb116c85aa33bfed6f61220abe8a22bbf698061 | ORPH
   armeb     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/5d7b8dff6dc56d81f33d526297d7be9149acace4 | ORPH
   mips64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/30662850e4e0b06d8d56d93715c872ef815e63d9 | ORPH
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/88abb4f2b1cf8f066337f2e004e5db84a36b4651 | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/3c2e494e7b9359e85589c065107753c3f27936a5 | ORPH
microblazeel |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/99f4e91fbba7981d51e25521222c1abff3c99692 | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/fe42fb83b2e5e72b2795e899c628099fed6d0b7f | ORPH
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/e6cec692b000d5e52e3041e9207530a334e5637c | ORPH
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/b452ba87d762bb48c197630481279639318385fa | ORPH
 microblaze  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/14f160fb01c6bdbb3eecaa68897f986f6ad004e4 |     
    or1k     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/a4fbb949483f553732076a21e274077a1c157a21 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/dbad133e915122a161cde03893a68d544e7ea294 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/114a81f216b44a00c5de830e21315df68a62987d |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/25c46b489db06616976504610bae26df65e88d9d |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0c26095cbfa95cc9c4447b68219ca2b9fd310bd8 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3eb6d4d42d7c3ea4b02a999bb19b2946b9b7cfb9 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/440550ff52bae99e2a2572519098a799503de658 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2f61032853564bbd6d1c986fb1ba8070bd4c536e |     
    or1k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/6f77aa6b9c7ca3599bb82f8885099ca94f76d946 | ORPH
    mips     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/4fd2d772840c1a96050560d01a64d87ff399504f | ORPH
   sparc     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f9a0e5284b013526af7ca6c653d9cfe238ccae90 | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/4cbd198172642b9d4a0ea7b7ba97a7bb9bb49850 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/d872df36986462b3496a1f6516594dc112a76e49 | ORPH
 aarch64_be  |         p11-kit-0.25.3         | NOK | https://autobuild.buildroot.org/results/fd51aa3aed3ae6bf9f80384e3f9508a5cf8a63bd | ORPH
    mips     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/714d0af043d3e79dc68179e142ebf8f4ad75fc91 | ORPH
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a4bc9a0b520663b333dece07894b87cd34b1c54f |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7771ca51582b98c1fbc5dd4e42a6f28ac16ee973 | ORPH
   x86_64    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/a57a4e18a833808a99843109f7ac67176b55b537 |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/059d6740b6c2567e1685dadcb1448782babb640e |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/656e22e173c08ecb337577a009e7cbb9b27ccecc |     
   x86_64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/32aec7131f0127ad13abab088e851e40a0ed1308 | ORPH
  powerpc    |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/4fa91570a5612e74d9860c75e4ea9682803675ff | ORPH
    arm      |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/d77967d5e21572a0bc5cc2b00af84d039f879f23 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/b623de069c2c95b9fe36ecb5a38e6f0c43a59872 | ORPH
  riscv32    |         uclibc-1.0.52          | NOK | https://autobuild.buildroot.org/results/bad75918a3fbca1baa367391b44cf02f46e72adf |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/84666a4f5f7e4112e9097032654053c6854ab77b |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5188429bc4a9c84851fd68bd24a6477c242e06ea |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/eb4dd3557fd6c476c4ca417ed1cc5955d05446d0 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/690d40c907fbf9ecace31b43c8d6051bbd5d9ed6 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/cb6e05055fe0d8d1a00ee8e888454a3a5b521f7f |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/5f8ce6afb1ad3f2d97b9eaa89386c15c1ec14c73 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/35f811fbf2f18b597603a14f656ed05e61c8f4d8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1cb70356ca028fca2b283012d8198cab6d0f16a |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/42340cce60c6e5cf74d15092520d2cd50fe6df6e |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/435df8278c337225d2fff1da201f93ae899fdd91 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c8a193203297dc5e98c101c1aa5c363b0790e1ce |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/a7f887ea69fc708d4e88ce85349cc62c242f4b52 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/26dec64566817959a63cd7acf323ae15c2669aa6 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/387899edd16d3e37620e006e199fb4e7216ceb7b |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/8b78df5acc73292c6636d770552e01588ee97df0 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/49120deea5f1ea3861a2e6d837d0f85cb47a9ca5 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/b5d775abdfb858a245e5de15ddbb008782be262d |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/a2acc458f7b735dc79d300c0a3bedb405e44bd94 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/c2bea363cd90fcab83c904bbe696150b6bc74547 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/4e20321ba27cdde48277c65102dbc8fdc90fa5f6 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/7fef1d494d7d7af5f62e272b50bbf8d279270eba |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ccdc193dbf53e2c88c979fc833157c97a154055f | ORPH
   x86_64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/e5182ba9fb467e6cb0d73a223714520c5b2a3a91 | ORPH
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/a35ec5893bdffea2ff03d7c3958d8f51d85002f9 | ORPH
   x86_64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/e51b9c5afe3a94968fcf90d14ea130ed8eecc019 |     
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/d365e4c9fa807957ff01e39f624693ea19843379 | ORPH
    sh4a     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/350a4031c1eaebf5d6bbf2c0962e17dddf775c4f | ORPH
    arc      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/01b6af44e44d8f42c9235c6410497990c007c78e | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/160d459387ec9fc81973838c28aac3072b93bebc | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/7b2dfa1b6c3666ac6a32b83112613b75d6f46c1b | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 1 
          cloudflared-2025.1.0 | 1 
                 dc3dd-7.2.641 | 1 
            ecryptfs-utils-111 | 1 
           host-squashfs-4.6.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.12.32 | 1 
                 openssh-9.9p2 | 1 
         python-remi-2022.7.27 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/90286825ceeec46dc134359b91baced46df2945f | ORPH
   x86_64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/522488193a6f3944e4b6b3d76b44f6695034d2cd |     
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/56848a04cda35e10247e89b15be5b306c11049f5 | ORPH
  aarch64    |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/ccae0a6a56534201c4f14123afa79bb1fea1aa05 |     
powerpc64le  |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/9392e261a380008063eb4a0b6417892c5e3e70f1 |     
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f1df1ce36f49bf0817bab8392661cee8b907edf3 | ORPH
   s390x     |         linux-6.12.32          | NOK | https://autobuild.buildroot.org/results/529b3560af2f220dc5b401e96ada54cd748468fc | ORPH
    mips     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/11ea9496e4c44c82cad57d6314836d4ec8a74acc | ORPH
    or1k     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/e7ac28e20ad92863d337e96c225463346ee6c690 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/b1d925f081651dd56e53f0566e217e35bc68dbc8 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

             python-webpy-0.62 | 2 
                    bmx7-7.1.1 | 1 
              libselinux-3.8.1 | 1 
                 opusfile-0.12 | 1 
       shadowsocks-libev-3.3.5 | 1 
       sp-oops-extract-0.0.7-1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e72301ff70c89fc3201cef826e3363332ffc71fe | ORPH
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dcb822293f61509a28053f6984ecce7866017be6 |     
microblazeel |         opusfile-0.12          | NOK | https://autobuild.buildroot.org/results/cd44aba55115bfd975c780c787b1776380e09f51 |     
   sh4aeb    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/e5b6f75a6036dc9d0ef47a73c56f9bd8146a661c |     
  mips64el   |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/8f046a2422344ed27508716877fa6211302e2f82 |     
powerpc64le  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/d410752e017275c317ef2a96e3b984c8f09e4527 | ORPH
   sh4aeb    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/cdb742b38353f06e69370ddeef61d42dd0f7d0aa |     


Gitlab CI results for 2025-06-16
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449861 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449656 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449626 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449538 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449469 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449388 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449363 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449138 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449057 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449046 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448983 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448955 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448939 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448938 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448865 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448594 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448590 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448484 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448471 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448455 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448433 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448430 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448427 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448425 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448424 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448423 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448421 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448418 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448417 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448415 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448412 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448410 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448406 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448404 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448402 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448399 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448396 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448394 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448392 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448389 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448386 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448383 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448379 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448378 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448376 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448375 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448373 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448371 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448369 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448368 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448367 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448364 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448363 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448362 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448361 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448360 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448357 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448356 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448354 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448348 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448347 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448336 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448288 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448281 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448214 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448207 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
