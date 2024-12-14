Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD203E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 04:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D615847D9;
	Sat, 14 Dec 2024 04:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irEaGqPpJBmD; Sat, 14 Dec 2024 04:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94163847C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94163847C8;
	Sat, 14 Dec 2024 04:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB60ECE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 04:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5102260796
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 04:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-xqBKlt8RIF for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 04:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9F4B606C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F4B606C4
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9F4B606C4
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 04:14:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9ec267b879so373877766b.2
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 20:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734149674; x=1734754474;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GbANwLnMtXN3yzPXTm346EC932yGY4JAXiDYL04irPQ=;
 b=lGGsW+gJYgQ0gLdCBlkK34WvPVsfN/5uXCXVXxtsznDgz5i+xLw/jS+D0Jt+z5MC+o
 8Vcw6ZgnzB5csBRWv74E9mYV8SC+VeZ87TBurRvYD1+ULN/EtDNCYHeI4rz2qlwEc16L
 1Fly8smhY++5UrJsEIuUjtiziGPUXjPuieT/hj3Zo/H7DPQ62qqKVdBk50GIzynXJNw8
 Qd4LuX5AWUpImUxHIHmzn5NllH7j1V950btMDD7zR8iaNAi0ryr358r/ubi4QvL5Y0yZ
 +OrSP9RoGrgkcJ13ua15QndFn5iJCKuODALrQnoB0V+Sqslc+jWbRTmTTJKGJY1eBO9N
 6csQ==
X-Gm-Message-State: AOJu0YzEuws8gO2Hg1NW3aIMU0p24PNKHsiwi4EF0/SoA4MJIAv7vhi/
 vizcm9rPabqAYA+/pQ2PWrO+JIy6jXecat06EA3Ila91TAWgoZ2/eEe9TQ==
X-Gm-Gg: ASbGnctmVGrkk27icH+IqFftJKuymaaIf1mm6g9HpRm5oLxZ+4HVHuWSsK/HiJZdJt0
 6K972/EGkW/sIP/hPRE5yFzqOH5UXj0ThO9Eu8O8w+TIlEcBm0rGt967/ABJBNwCRi82usxiYvh
 b09G+/bsZkSTAGXFhP/Z1AScAAPM4ArH6F0SSIzq+fwNOyBvWZlztc+3I+cnbYtORc+yQAKGNJn
 BF5UYKIZPu4taOEpSUW/WBINHlVKb4gSaPcaywfETER0enr3DylJW3leElA
X-Google-Smtp-Source: AGHT+IHnA8Ro4c79CP18GnIeaf0PG48nKtJpdhYd5eDa8j4g5rnV7hQZreVhdJWX5LuftEW08ratFQ==
X-Received: by 2002:a17:907:9507:b0:aa6:5e35:d730 with SMTP id
 a640c23a62f3a-aab7792ce8dmr410615666b.24.1734149673061; 
 Fri, 13 Dec 2024 20:14:33 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9635957fsm44727966b.109.2024.12.13.20.14.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 20:14:32 -0800 (PST)
Message-ID: <675d0628.170a0220.376522.15b6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 14 Dec 2024 04:14:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734149674; x=1734754474; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=GbANwLnMtXN3yzPXTm346EC932yGY4JAXiDYL04irPQ=;
 b=Ufx5K6ix6R0Qf0l3AYSyC+imjeY5wo5YBLhLbdcixVKz9b1S9eop9OAZUCFWCNdFn6
 LiRAN/EX9VV4nqwnaE3+0y9M6SiN4McQWs/Bn5Q7e9NoTyAzX4cZLrv8zWAIdn+fxguP
 pRdQLJr00obeowwfACiHsDQOeK6B05PtqgQHBvQYWpFL7qIp2O3oF5QSxPmjpAv7RSHZ
 zBaZBZyiZ+KCigKJyX4+L53LJBAgRoJ6NgbMKBIbHpenipDY/49mr+aAbnYv6emLidpf
 gJQXVM+i3rosssGEhULBQ6ake+NXaMbVH8ZjJvFpdjfyL5biuxdm+aoMrIU3S4wYUSWM
 o7Lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ufx5K6ix
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-13
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

Autobuild statistics for 2024-12-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  1  |  0  |  3  |
  2024.11.x  |  1  |  3  |  1  |  5  |
    master   | 15  | 301 |  3  | 319 |

Classification of failures by reason for master
-----------------------------------------------

             batman-adv-2024.2 | 21
               postgresql-17.2 | 15
             util-linux-2.40.2 | 14
             alsa-utils-1.2.13 | 11
                  linux-6.12.3 | 11
             dahdi-linux-3.3.0 | 8 
      python-autocommand-2.2.2 | 7 
                   foot-1.16.2 | 6 
  gobject-introspection-1.76.1 | 6 
               pulseaudio-17.0 | 6 
                       unknown | 6 
               alsa-lib-1.2.13 | 5 
           alsa-plugins-1.2.12 | 5 
    host-python-greenlet-3.1.1 | 5 
                  libnss-3.107 | 5 
     linux-5.10.162-cip24-rt10 | 5 
                    mpir-3.0.0 | 5 
                  ntp-4.2.8p18 | 5 
cegui-00b4e1fe174da53b7ed72... | 4 
            host-binutils-2.42 | 4 
             lirc-tools-0.10.2 | 4 
           oath-toolkit-2.6.12 | 4 
                   pcre2-10.43 | 4 
                   perl-5.40.0 | 4 
atest-9ff52ee5d7764984e21fe... | 3 
                  bcusdk-0.0.5 | 3 
                  curlpp-0.8.1 | 3 
                elfutils-0.189 | 3 
                    emlog-0.70 | 3 
         gobject-introspection | 3 
             gstreamer1-1.22.9 | 3 
         host-libxcrypt-4.4.36 | 3 
                libesmtp-1.1.0 | 3 
              libopenssl-3.4.0 | 3 
                 libv4l-1.28.1 | 3 
               linux-pam-1.6.1 | 3 
                 openssh-9.9p1 | 3 
                acpitool-0.5.1 | 2 
                  assimp-5.3.1 | 2 
  binutils-arc-2023.09-release | 2 
                   bird-2.15.1 | 2 
                cryptopp-8.9.0 | 2 
                     daq-2.0.7 | 2 
glibc-2.40-18-g564178076272... | 2 
                 hddtemp-0.4.3 | 2 
            igh-ethercat-1.6.2 | 2 
                  jack2-1.9.22 | 2 
                libdrm-2.4.123 | 2 
            libsvg-cairo-0.1.6 | 2 
                  liburing-2.6 | 2 
                  libva-2.22.0 | 2 
           libzenoh-pico-1.0.4 | 2 
          linux-5.10.162-cip24 | 2 
             matchbox-lib-1.12 | 2 
                   mimic-1.1.0 | 2 
               procps-ng-4.0.4 | 2 
                 apitrace-10.0 | 1 
                apparmor-3.1.7 | 1 
           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
                  bitcoin-28.0 | 1 
                    brltty-6.6 | 1 
                   bullet-3.25 | 1 
                 c-ares-1.34.2 | 1 
          cloudflared-2024.9.1 | 1 
                 coreutils-9.5 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
      docker-cli-buildx-0.16.1 | 1 
                 erlang-26.0.2 | 1 
                espflash-3.2.0 | 1 
                   eza-0.18.24 | 1 
                    fcft-3.1.8 | 1 
                  ffmpeg-6.1.2 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gettext-gnu-0.22.4 | 1 
           ghostscript-10.04.0 | 1 
                  gnutls-3.8.8 | 1 
                   grpc-1.51.1 | 1 
host-binutils-bare-metal-2.... | 1 
          host-gcc-final-8.4.0 | 1 
   host-mender-artifact-3.11.2 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.506 | 1 
               iproute2-6.11.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                latencytop-0.5 | 1 
leafnode2-9543ffaf82406f943... | 1 
             libargtable2-2.13 | 1 
               libglib2-2.76.1 | 1 
        liblog4c-localtime-1.0 | 1 
                  libsepol-3.7 | 1 
              libtracefs-1.8.1 | 1 
               libunwind-1.8.1 | 1 
                libxml2-2.13.5 | 1 
        ltp-testsuite-20240930 | 1 
              luabitop-1.0.2-1 | 1 
               mariadb-10.11.6 | 1 
       matchbox-keyboard-0.1.1 | 1 
                 mesa3d-24.0.9 | 1 
            netstat-nat-1.4.10 | 1 
          obsidian-cursors-1.0 | 1 
             parsec-tool-0.7.0 | 1 
                pipewire-1.2.2 | 1 
                 pixman-0.42.2 | 1 
        python-selenium-4.26.1 | 1 
                  ramsmp-3.5.0 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   sdl2-2.30.9 | 1 
                  snmppp-3.5.1 | 1 
                 uclibc-1.0.50 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/09c4987ee7acd4b1b29a246898ee42c70da1927e | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/32fb7a1fa7d19be84024ace9fd80f3650e20faf6 | ORPH
   armeb     |        alsa-lib-1.2.13         | NOK | https://autobuild.buildroot.org/results/3dc96544a62950c3e7b0e14cd362c809acb0793f |     
   mipsel    |        alsa-lib-1.2.13         | NOK | https://autobuild.buildroot.org/results/afe3683fe3a30bdebe3f44097dd15ad6ee27ac13 |     
    m68k     |        alsa-lib-1.2.13         | NOK | https://autobuild.buildroot.org/results/e37709151b655085057dab2f80cb8c286aa3e93e |     
  sparc64    |        alsa-lib-1.2.13         | NOK | https://autobuild.buildroot.org/results/5147198d3072f945cbfab58bc419eb328a947c12 |     
   sparc     |        alsa-lib-1.2.13         | NOK | https://autobuild.buildroot.org/results/c14ff494fc3246e62c8f00f32b7e673fa6bced92 |     
   sparc     |      alsa-plugins-1.2.12       | NOK | https://autobuild.buildroot.org/results/ac1f9da2274d8cf1768ce8da55f0e9bf658e01c4 |     
    arc      |      alsa-plugins-1.2.12       | NOK | https://autobuild.buildroot.org/results/dbcdbf110ba190ed031cccb0937524ba1bc0718f |     
powerpc64le  |      alsa-plugins-1.2.12       | NOK | https://autobuild.buildroot.org/results/9820219577c97ca362f9c4301f4120d463ece1d8 |     
  riscv64    |      alsa-plugins-1.2.12       | NOK | https://autobuild.buildroot.org/results/336b4ebad3947a3047a239d0e850a62c5e84bf65 |     
    arc      |      alsa-plugins-1.2.12       | NOK | https://autobuild.buildroot.org/results/3ac7f571285ae80fccbed5baffed53c227f9f617 |     
   sparc     |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/9a53d3c1411699f581e3a90d7f517fcb6b9e3de0 |     
 powerpc64   |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/7e20a63176fe7e6ec65d74ec1d016f3f623b41f9 |     
 powerpc64   |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/232b0c57fe3891fa2a04bcbf581dddee53518602 |     
   sh4eb     |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/e8f70dda81937f6e87f028d826172ccd372cd0c1 |     
 aarch64_be  |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/0f58d9089bc37f0926287589d5b3b0264bb0c346 |     
powerpc64le  |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/6adf342705e26b82f2d6a6160137173ec30e6832 |     
   armeb     |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/533f80510eda310c323adcdb3181a64eab34f7a5 |     
 powerpc64   |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/a13f56e65e0a4a6af0295df79471d4ced51dee0d |     
 powerpc64   |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/1f0481e3acee26d4bbcf459631adaf13ce4b25c3 |     
   arceb     |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/7049db447d2c9bf8adf4a2e7e2420bbc32764542 |     
    m68k     |       alsa-utils-1.2.13        | NOK | https://autobuild.buildroot.org/results/481503c2a1df2d74c7ca89eba350747c32f43894 |     
    arc      |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/5bc9c2bb1424d6617596d207fbb9f6addb829e3e |     
   arceb     |         apparmor-3.1.7         | NOK | https://autobuild.buildroot.org/results/caedcaa72cf915cb8876f200a7c8f0baef7e9c96 |     
    arc      |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/01d0cfaf3611f690b67310658c0ca1139e259f5b | ORPH
    mips     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/eae3da46ee3fc2def42737d672f70831deec54fe | ORPH
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8761c45ef2620b7816fe985d2f8a7ebfa56cbece |     
microblazeel | atest-9ff52ee5d7764984e21fe... | NOK | https://autobuild.buildroot.org/results/113151d3e76b4581a5f07d197b125278ec803e95 |     
    arm      | atest-9ff52ee5d7764984e21fe... | NOK | https://autobuild.buildroot.org/results/0d785f8678744da03173a0f806f3aef616279ada |     
  aarch64    | atest-9ff52ee5d7764984e21fe... | NOK | https://autobuild.buildroot.org/results/e7ade5e5c449aa4e2f42732d8befba851294b4eb |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/8f3a1010194f3140c6095da48b62bf85386e2849 |     
  sparc64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3f5838db99af94c331021a59bb5dd4f22a0b599b |     
    i686     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/25ef9284940eb2e363a8233b88382186753d98f1 |     
   x86_64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/2900710460d34a862414b615049152037840d3b4 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/57f030120b4e601b1a8c28c627da2e3f28477a1d |     
    arm      |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/f87856d0f2f87263c65b65e657d35f602fff2055 |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/09ba98e8b74ac1302af973445f1d90bb91504e21 |     
  riscv64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3f728e7e312cceb27cc214357498ae00150fbcf2 |     
   arceb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/acb95b75b687aeae65cbcd09e9f1e2bf3e96da50 |     
   armeb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/c43ae5915a276a02e64ef45ce4033d13658efb89 |     
 aarch64_be  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/d966e1ec8b54d25c8003cef5316828238d9fb70a |     
   armeb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/346c0cfacd010257bca8c6aaa83933facf8c6395 |     
   armeb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3d8770972af8225ae503bbb690192681ebbb9a52 |     
    or1k     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/8268985756cf8cbf888fb2cb25db8800d9568b92 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/fe378752780e8c554b71bdf20eed63f8c0d80b7b |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/fe70d61d1f61b5d66b1b82941370bb02441f87a8 |     
  sparc64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/5c926e6fe16174bef0f55bc55d367aeb56d5d1f1 |     
 aarch64_be  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/a6f20224f7ba09af73c99750698f1bba4c72272a |     
    or1k     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/5c6bec81310e46c7e45eac2b3a10c59bd4d578ca |     
 aarch64_be  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/dcd0bfb98737c6b89f393fbdbe0344c17976e897 |     
  sparc64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/dc6de6f47af0d9ec4321f1c2fb3ee6c17b1bec0a |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/05a2dec93849416d921aaa719e0b37b317825bd2 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4053badaed90c9f6836b8ce8fb457b2514c406e3 |     
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/99812ef2b8ae4f7046766b27920afe2ef366317f |     
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/7dfcf858fa247711dc70c2f8ed63c0eca668d8b8 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/acd41728d7051ac3c74d19405c9ce408922c9af4 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/42b64b24758b10652ef1852533348b58fdc21a80 |     
    mips     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/14651a5b5b55f935fce909c3d4eb77d9f5e583b9 |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6f12de47279ea8250e4a0f1feaeac3296d10835d |     
  riscv64    |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/36392ed4ea38e47fd3e49ffa6fec7e98c6350b7a |     
   x86_64    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/daf741dcfb4dba92326415e74d09bab5832495c3 |     
   mips64    |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/858a5f3006417533f5da36be3397fea7ab6e0906 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/d622a114b6ba0981d0087e05764ab465ccba6a90 | ORPH
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/ba82019930c6a5981c0b6831fee5ac6e52a9501d |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/466fea9cba3442e548ec529d135500f17c03da27 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/f3be8ad00d763693ee6fb8ce93d6cd14f97b58b3 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/ebef60886e5f61fdd1818398cf993420dbd94709 |     
powerpc64le  |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/b2f2b30ef23991f49efa651a33c16adbad7d28d5 |     
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/6b018fdd63a62f3a5edd7c8fba324539b24130bc | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/f7cbcfc5465e0fafacfe88ef28200d85a032cd51 | ORPH
   x86_64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/0e7581b3406dc556937e816720b95cd35fadfd1d |     
 powerpc64   |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/c1016b5ad29196171382fdbf5b34704af9cd9bab |     
    or1k     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/5431962c50133ea17025f16f7bf0cb15cd4a5f9f |     
 aarch64_be  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/e316e6994415639180c5e16e0754fd1f910c3297 |     
  aarch64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/3c6f26de13240eb0d352e479f6025e017a25369f |     
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b786ddabb7ca67e757ab3173fccb7f4fec55d38b | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/23f0f7386f7d430c402b24f3b58b1c20c1c8344a | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/95d214cf27985f038522aa5a3bccbe1fcce64959 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/696b464a6a92fe7ddb20646eaa27ec44933cf7a2 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a7b687904566a1e321b1e2ce35ecdb10bab0d7e7 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f0bf42b40581432bd2c000ce8053a4fac9045e59 | ORPH
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c691b20efff84dab7a2729cf142c1486addbe775 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8276257cf4402852143883ba5c4e376df50a5b39 | ORPH
    mips     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/abcde2cdaa6802c84b7f33cd1505df7ac8d4724a | ORPH
   arceb     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/96f379739b24fab32de16af10e80c6f19403db65 |     
   mipsel    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/224af0be8b52f23ad611950a83da934729900e7b |     
powerpc64le  |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/b7537257604eafcf4a2bd6bfd77b943f582c8e34 | ORPH
   arceb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/000e49f8559c29c678e8aac7379bff94eede125e | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/ac00b0e3e4d559aba9b957482cfd2bc5bf66d82e | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e4392e6f100c96c05bdc83fa7de83ed00caaa098 | ORPH
  sparc64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/c060c00ee4748db215f02d12b479ce6266730fa4 |     
  sparc64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/5ba074cb0a574868343628e481894b0e5142794c |     
  sparc64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/0fed7727262626999ba9b8b21654f9968e746a9f |     
    i686     |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/a7fca9258bf13e390ca3ea033117fb29d1b5af2c |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/3bfe6c54d5bc5e15b095e18342653918e55e2e94 |     
  aarch64    |          eza-0.18.24           | NOK | https://autobuild.buildroot.org/results/83d0af028b8d4bb5b0d6b65897554ae20e98b244 |     
  mips64el   |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/8c480903c583fdc183e9b61d50f451f88782d6f6 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/221f5f44738516a35af15bd7944f0c83590f5ce6 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/92287db4a610976905780790b23175ad13ed1b0a |     
    mips     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/51d225a958efc3183faf4730e5929f6fa1838eac |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4e4b27bb7184853e6f9d2991b803814f09ff5f95 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/62b85e0474b95949aafd911f96d0e0a5313d66be |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/dccc19e68740c1738fa686f58437217abcfc6230 |     
 powerpc64   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b773e2975f750e964b74eaa0af8e47aff8e31324 |     
    i686     | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/d7025f09e9d03e1212b1dd9d482fddd12a4eceea |     
   s390x     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/0a51b5c44607eb76c334c00a58aa1c2d837d25d2 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/0cfb0384a9ebaa915756981e467c12a5c4930fe4 | ORPH
    arc      |      ghostscript-10.04.0       | NOK | https://autobuild.buildroot.org/results/d130457af87993fc07609d50b1342bee02d23b75 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/57ac5b220c89479a10032536628f99b7499f4b65 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/2b994aa6ccd5f18aa1dc1f59a7079677cc7cf800 |     
 aarch64_be  |          gnutls-3.8.8          | NOK | https://autobuild.buildroot.org/results/3178fca15cbb2520336b0678a16a5be5a51a8702 | ORPH
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/0f7e3ae6ea9ef3009670ee98245d9acfd044e3ad |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2c9a049a34249b565e7934fdb986dd30a013a9f9 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/75a0ce57d39d79afc58fca81551a65c8fc9f94a3 |     
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/63c22c3fc81609c909f632abf85a559478a9234e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a7beeb3090e273305107acaaf125b6f78b1d3be0 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fc26997e2c5dddae02440cb8b478ba957a913f35 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/99b337e3ed8d5519a5e621c8c86b8133d81605b7 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d2176116d7fce1b900be6931d53675744b5a9e40 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9e342a812730064f6644629f77179dc099e864b3 | ORPH
   mips64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/b5a1d2127d185c963f7af0b3f81ec6b0531a85b9 |     
    mips     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/8f3ecddc291579e5a98ef616f170c19026352e37 | ORPH
  aarch64    |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/65716a1a2d6e6a31fc63b228f8b81870cf4c33f9 | ORPH
    m68k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/da4f14f32818f6d4cd719ff9f87192610cb89b21 | ORPH
   sparc     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/5dc090b902128689ae70720708f6cfb6724644af |     
   nios2     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/256749a73df81403ddcb5aafe3dda1938ce6740b |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1899ab6d7e8122500306d90981becc836236e29c |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/258a11670ab64db53ae09b1fdd280d4ea731fce0 |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5a34238ff386455f0697b20ad336ddeebc829dca |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9fa5c6b53e697b0d86317055e0504a1529251feb |     
   armeb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/476ffd11eac89419b028de026c38f77a9c7b9dc4 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/3f773d325626333e64d681df5df0c8f5cf5c613d |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/dd459c9f1b8d67ba9ceb2c67fc6c5d4ee4fcfd2f |     
    or1k     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/421f9cee463fd16458e880814215ca431a9e6191 |     
 microblaze  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/a1e51dff6a93c49e665894f3855444e98f440bca |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/9c2822dc372a8f863fbb7045c8910bc8b75f9fd3 |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/38e3a17b47f62f0556cec34042e4638da88da3be |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5040f51a1f4031a7dae5a2a2829f6ace5afdecf0 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bb4ce144eb89ed340955d13e25080a96e760cd57 |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/dac97e570233d71a008b1b9327b922fc1fb0a050 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c7c3d382023062ba044605fece6eba1bb4b1c2de |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/fc3b6f49637b495e2ab38fa91dc459c53ee4754c | ORPH
   x86_64    |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/f537a9ac61f7b42c6ec6d9cb21cf36e92e623281 |     
   s390x     |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/2454ad17907f0f509c5a52156a24f6311734ef7f |     
  mips64el   |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/bde3f14e51e3fb402fcf5f817e584998754e6256 |     
microblazeel |        iproute2-6.11.0         | NOK | https://autobuild.buildroot.org/results/9af09d91a790ca3caa392eb096491607272b839f |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/ca6aff8175af7d56ff0cc1c6a6c304d5b208850f |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/bd69d9520eab9d7efcf54409e000636a876b8bc8 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/e03e8682bd210395a34153b6e45ec4aeff9cf72d | ORPH
 aarch64_be  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/d0e51663b6e62df70a777612dcfabfbdc133105e | ORPH
 powerpc64   | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/6e0a0afae6b162dce554813b92b80fe99a6d6675 |     
 powerpc64   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/998d5d3b230abbe20709dd2debb115adb78cb1ce | ORPH
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/54130b18dd3ce0f2fae46d77847e702f25c0c214 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/ef7580dad9a4d0b397b5d930c5d1ac5a8db02c31 |     
  mips64el   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/8b18020069bffe3e522648d4a3b40d4bd865fb8f | ORPH
   x86_64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/ab01003a789aa82d0aa38f1a41e265d291f5b0f4 | ORPH
    sh4a     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/26be9402087031fd8cf9a13c23dc19209782d14c | ORPH
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/bf94258cc272afd00a4aba56a2866666176a999f |     
   sparc     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e1f2fc13935d8d04a007a8862f00f18e3a8dd1ad |     
   x86_64    |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/5145eea8bc2baae504cc71bc68661407c9fc9cdb |     
powerpc64le  |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/ba6c57fd0c8ce50e4ad48a7515f59b51037c7611 |     
   s390x     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/364a8f0a6766a33b865e86108b622330cc17f04b |     
powerpc64le  |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/ce146afd041ee2144f393cf9b09d215ad9e9fa8c |     
    mips     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/e15d609f75fbb09873d1849b01a502f666ed14db |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/49a20c4394b21a2ddbc870e34c496dd1bdafe458 | ORPH
powerpc64le  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/4aceb860fdbb2b5066d3385233e8097f32cd6743 | ORPH
powerpc64le  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a98ef4e2b929b4bea0264070b8817bcc01f8f5a0 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/071084c3c713b30ebfafac27b44f535fd83ec4fb |     
   mips64    |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/a22fe5c67b3b94a9fbdeed1d16a188ca0110cc07 |     
   s390x     |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/8546c5a2dde2cb71d5afa8b229fa751c372e903a |     
   arceb     |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/89c4fab0c064f2668793de03e1fc64f5aa337560 |     
    m68k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/9981c78aa18c35b3847d4985c14b2fcbdfa04f9b | ORPH
 aarch64_be  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/d29bcbe690bdbb00ba511dabd6c12390c689eae0 |     
    or1k     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/aca4d740c57905b14bb934d484626886f25b9695 |     
 aarch64_be  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/89a5eac9eca7fc98bb53891cb241b524714c0c83 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/1df690970ae95f69027701e8ff1d356c51efad09 |     
   sh4aeb    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/536c797ed5e64fe93a91309fe47f23c1988551a1 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/c9d9dba1e8b4a4876fe5ed8936aa9dae0616f09b |     
    arc      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/56c896c13709e3b3214b6d535053a4b6e32e60f8 |     
   sparc     |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/fadbc7000447f07959d5fd67f5504d801a6f2394 |     
   nios2     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/b7fd5d4ee9ae6632d4d27c73e742595af53f8cec |     
   s390x     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/e9995e55700037b9cda19fd6dd27a891af559467 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7f590128af3922e235c59fd8becbf632b6a6e07d | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5078a0b4880088d10ec05a90a624539593e893f8 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1a2eda2f1d376f02a8733da65063fa160b9cc3b7 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0f52a849e6b25d08ec4b2b4d00a3248bda8e84ea | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/bad3bcafe95d959e389971edf6a724d97e3c162f | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1610c33321b058426f17ddb96b77bf6e427608fb | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/82ac3ad38fc943ff3c36aaeff20a89e2416503af | ORPH
  powerpc    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/e7578eac15856d26c48da5327ef047314532cc29 | ORPH
   nios2     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/3f0ed5d76552d1711a97d2a77b617016d0c172ff | ORPH
   mips64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/6f65e04f6c4e38beaf86929e63dd2045539d3e31 | ORPH
   mips64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/52131b8abb52f81f9f77b926ba79d6a57c226293 | ORPH
   mipsel    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/70b8ce4c28135ba1f90284c28dfa75f73894fa3f | ORPH
 powerpc64   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/48086aaf04257fad5e7200bcf6db6a5961416e5d | ORPH
 powerpc64   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/6d644ed51d2bfdc037b811d477c5eec9928e9681 | ORPH
  powerpc    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/7071a86a057b71f9c3ce1ec5de1ba308cabaa3a7 | ORPH
    mips     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/b1bfb8f7960ca893bd0a67661f6593beb47f03a8 | ORPH
   nios2     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/0d827ae862de0f17d6693241ddc7e3998143cde9 | ORPH
  mips64el   |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/a575b5d09208a0578ec6535818dc92c75b709877 | ORPH
   sh4eb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/88991b85d2eddf9eb8e00fed2564f9b468b502db | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/562ffba3520fcce0418f78abfaccae44a675820e | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/be732e40ae7103a7199109f81774395132627f64 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/dc59828a10c436c2382537d416bf68259e685a3c | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/bdac82d8134a1228ade93a15cb7aaecd1d0b2563 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/dc3ba7aea995464355c52719533867e2b4550a66 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/bc6e9f904fa22caa120508b181a28f7272366eb7 | ORPH
    i686     |     ltp-testsuite-20240930     | NOK | https://autobuild.buildroot.org/results/a93c28d744dc0de7d6c5c26c379468d54067aeac |     
    or1k     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/b73c8a12379c582ac65a239b66b7b06955a0f65a |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/554b35e800b57d012b1bfb03d52055908cef1be8 | ORPH
 aarch64_be  |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/16de2269e2504230781f1e65c7b6c61eae9cd3d9 | ORPH
    mips     |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/c8fbd1617a0901cc49d7f5ef46d0be450c801147 | ORPH
  powerpc    |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/6604e599619f946c9cb6dbf28fabce06671f8122 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/3cd6127a8a22b079a781c55c2c76521b8ef4e192 |     
   mipsel    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/638a6f3c42bfbf6624c92416520f3252906131d2 |     
   mips64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/40409523d1e33e5fb7324ebf00c40121e859792a |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e1e4eb37395579906109646810590451466f1479 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d624da8587df7a9f70e7da3747da863700de2c81 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7d03e28260785bc437a0d1a20f38ef8dd85b75c2 |     
  aarch64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1ae2932b976fd2d84e30981150d9a41cbdac2b5b |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5cb5b0da3c0b0054bede38b217fc57ccd6dc79d0 |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/3584d14279a13cd21e45b62e47c7f61dde42864f | ORPH
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5af83c3186631213265888cf0ddc09b2a7355cb7 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/702c6f26f0ed37ef39ecac7ede41a19afd0a8281 |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d43eed4fb7bee4106fd9589b74804861181087cb |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/13672bd3bc318ee2a98eeecd4147c47e40921caa |     
    i586     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1002dd0d3e363f364933fc8b58966d837132d74a |     
    sh4a     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/8f25385eb59c3e83b3f0056fef324b49498233ef |     
   x86_64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e4afd32e4450e2c850dd2aa3fcb7473e73dadf8c |     
  powerpc    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b312fa88ac6679c47e081add7d6afc0753d6f630 |     
   x86_64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/59cfc10d5698c1272017bc43ca9e1eebc385b2ad |     
   mipsel    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/acd72446c089b349bf97d6ac0123da1a04eded6c | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/f7f183101a2ce5031651dfde1b4a5f421bd8dafa | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/26ab939f30aebfb53e153bfdef50cca1bb814f0f | ORPH
 powerpc64   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/965e83be468d629a64ebec5869aebada268fc55a | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/32cc8445a952abd8da7ceead785b5356ac2532bf |     
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/289b3d8b18033f8d6cf386de08b8cdac553ae7d3 | ORPH
  mips64el   |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/679c6023e83631f9cb01ecb30969947c314bc515 | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/73f1804fb20bba3e6a5365019fb306f5a0550373 | ORPH
    mips     |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/80a42ba6ebf3e2b0ff21be33fe30b98ceeed6d3d | ORPH
 microblaze  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/fddd690ee7c7106ab15bf99862e1929b795d624e |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/7f461f17209f83f9623be1b3cf940a6d548f00e9 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/c5590cf67639f1f7aa73e68ecc1eb470d46fcd86 |     
 microblaze  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/60461e42d29f50b2f24eab921c1f25f24f87a34e |     
 microblaze  |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/142493e9a1b21a737fb15843e01302351f48d8fc |     
    i686     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/cd7689068492fcf5121094f312c016b5dc847a4f | ORPH
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/594619243975be2f1bc432a1373d2b466c37b0c1 |     
    mips     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/6e06a4178898f460949aaaf8b3514d865f893d50 |     
   sparc     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/66fefd57789fffab979abfe8a92156bfaf10074d |     
powerpc64le  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/8073b6ef47f023ed6a5d9eb519239aa250c1513e |     
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/2a61328b45e7de22ba8ad9a4e93c5f797b680cb9 |     
 powerpc64   |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/3676aac0d200dacbbcdbabdc7de47b78143d3579 |     
    arc      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/7d53e2e968b063e500c8507a2b7e315f85677cf7 |     
  mips64el   |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/be1f2c96ca46bad57ab47bce6ec72a8fba81e9e5 |     
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/254dd7d12599d3a9399e4a823ec51700e6066420 |     
  sparc64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/73b53afd0053ab83e9d320ca5597b71913691a35 |     
    or1k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/248466b4339824f34b4ac736cba0eded4776f0ad |     
  mips64el   |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/085412cd755e971f24d2c223c1af6b7812b4e8d2 |     
    arm      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f114c6eb2534970c9e6223f43017835526b27b99 |     
  riscv32    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/495c85d6c5328ad71096351cca6f04bbd20330eb |     
    i686     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/a1193d8b28283e062151c65cea8a0285eddb0171 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/996a307f89d480a4b549091e4f0e9fca275026e6 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fdfe81b21a6447a7944674e327fcdc1800c639ce | ORPH
  powerpc    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/446cc403f5d0253ef9ee7dfc294ad7f91dcb126c | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/46e86741f94e5fcbd550f823ed46997214a574f2 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bdcb507ae7e4f173c672bf42d8340ea684bcac53 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7d97debf32a2ada707fc7051d3e0e2470c3af5de | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/321f9f87575330a40afead806209c8d91a77506e | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/52ba741b517ccfdaaa108a09a864d6736e182b63 | ORPH
 powerpc64   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/eebe79ceff7386d940599a76bf52ab7294ec6d5d |     
    mips     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/6dd8eb422f88623d178d890b0f5deb0cb1e45cee |     
  mips64el   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ce1ad9722d43bbdd763d74707b6a5cc9a22f9c81 |     
  mips64el   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/c38d964fb6f560f9c5852d5730b1f12d384a0700 |     
   armeb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/497f7d1c46db5de1e827e1cbc9bbc72ca2a0ad1f |     
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/4ba0edf93c896d1b4bba205fe94c03d7b0edd050 |     
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/3e023e461bb33ce2765ddc4c88116ab73aab5bf3 |     
  sparc64    |     python-selenium-4.26.1     | NOK | https://autobuild.buildroot.org/results/4384d7bb4c6310789efcf9ee438742002cbd897e |     
   s390x     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/b67c492114f3dffcb43629da3cb24b70bda0c3d7 |     
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/a5924642a2bcdec8e54c85a57124ad0f40608eda |     
 powerpc64   |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/6c2255a50634cf0dab18ab09f72549f95c8dd259 |     
microblazeel |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/c34c01294e105c16c323382016c7c656617c6843 |     
    or1k     |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/617d317a77195a4793a764bc5ea3daebd387d8d4 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/aca39c80bf051c37b1ef73f8530842b828159fee |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/bc920e56b30f1f0ee05553bc5bc067ed0b7051c2 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/7727c8f5ebc72560e57cd7955a340240d683b888 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/ce40de2fcc66c5a6bedcc85fd44c9a72cee7842d |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/465f35fd394ba4dc5a116a428166e1888ccc4195 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/fff2a30d6a80639b74db2800bd63981f408bc515 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2f5ea23a32ce6c2d6febd5b991aff8c691032951 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/58a243e8805292b7c3178131b14183cc82eb7b96 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f806cb25c44cd9f76a58c0e5219de1e51271d4d5 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cfb492340b6b99a435b43c69873247dddc1af906 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3a14c9230b8e2d15785a45f22a75fa2e289a0b22 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5526d2b4cdc62b15b7f5bc51451eda72f223b4d8 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/dc2880a263e299d22dcbb2bd591b334b8ef3a0e6 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/39bf570acd8ed1adc8ff6b9bb541274b8f8a3058 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2ac8c1b6b8e97eb51a66ae050f72eba518a2afd0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/feff61226f36446f15745002129d35edb04c92ee | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/781068fc80baebfd89793307fffb42c214bd3008 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a99377a96eb4e0d3692b07c8b47ac3407b5cde03 | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c6f8a6aadd1d9ca76c7183ba469e6db2d080ee92 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/dd2421ce7c5bc5a383f0979aa34db85c9a9b7bf6 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/a403b2c2c4cbb5e3bbeb999eaaaaaced95192d5b | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

              host-rust-1.74.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/3af6c7635a8afce207fd8323a100db565ab19cd8 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  curlpp-0.8.1 | 1 
              fluent-bit-3.1.3 | 1 
         gobject-introspection | 1 
                   libcap-2.70 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/8e6c4209e814b2ea859815dea11f6107090b9185 |     
 aarch64_be  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/b6affeca09838a931563cac69130205afab61f75 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2660332355ccca977b1e90214efa6a1eaddec84a |     
   arceb     |          libcap-2.70           | NOK | https://autobuild.buildroot.org/results/0d9d4f7bf56428a3b529a471f2b6468311d9aae5 |     


Gitlab CI results for 2024-12-13
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618810950  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618810992  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618810996  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811007  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811014  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811041  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811065  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811109  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811133  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811137  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811142  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811143  |      
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811144  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811146  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811153  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811161  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811165  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811169  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811175  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811261  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811429  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811564  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811567  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811577  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811581  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811585  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811637  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811646  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811694  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811812  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811823  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811830  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811832  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811848  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811850  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811851  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811852  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811853  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811854  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811856  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811860  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811863  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811874  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811944  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811949  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811951  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8618811955  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
