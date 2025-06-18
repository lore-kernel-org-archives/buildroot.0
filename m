Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B873AC71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 03:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 430ED40875;
	Wed, 18 Jun 2025 03:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3TeMVx2gs0b; Wed, 18 Jun 2025 03:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFAA5404E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFAA5404E9;
	Wed, 18 Jun 2025 03:16:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4CD116B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 03:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAE8080FB8
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 03:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXr7adMZbsUH for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 03:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5810A80FB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5810A80FB3
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5810A80FB3
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 03:15:56 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6099d89a19cso2501002a12.2
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750216554; x=1750821354;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eLjwGv/ZxubvbKews+3w/G/CZb90ZSiOHuZQp0ZaHdk=;
 b=JzENNObqKz/UravQlEDDSVFXeN6vuHdB97L0tmHi5QgCnFdN3MfxdCZfXwHbrzayxe
 EpvbKioME7YG9eHKhYMN9kJvop+cSt9FAvgogAJ4rApqi+TZXQZLX+o9uQxiXWnI+ytk
 ckyw3q+BxMvwWtf14XS71teanjfUNR7P8LXIjxW/LeCyA7UTwY7XmJMBzFSMx9e7Cfcs
 Tu+TD4V8Z8GUIjJhO47BjUGfMyhLm6a8Dp3YU209ZqebfOFbiVmiX5OctFerUNjDQpT3
 kE8Yy7+O4asHYSY7q7O6tVx2P2OH8ZJm/uC+Pj8kfzNqEQ8JbAG+9m4dw6i3bCGiCMel
 ovPQ==
X-Gm-Message-State: AOJu0Yy0fLCg6HmO/Fwm9adRQyU8w3qzY9wDk7E20X/XWN0fih8QKezd
 sB+uWjDSsY/RCo/yUIrEzl+F+tRKy1pNrc/sXSud2koxmr1HgBRlpBTokAeaeA==
X-Gm-Gg: ASbGnctif5dlzcOxpjmXd5L1zqbUEiiS4ekp922CZX++fYZ7SOBjCobk7JBh3VQk1va
 eYJz3gYOy2PrPGchZEyQt0DgxflOXEpSAn2ZUHC3BlHKBStNFJXsllEzS0HyS2npRrjwsx7AKID
 oyt5zon1xVy+wf5sHUrLH8mOuhDsYPy02odgc/gz41gC0KeplpU+SWg+lY9PXnT1oIYyvOu2cy2
 7fRC1qF3LBeE4ybT2d50iacE44x4FouFqfbtRCmYEwq9Z/3Iy1Os1ppEI+x+STknwHTIyVHyb1o
 d2v8T54SnhswYqZJuvzMWKuSyOT/mNAyd9r/EUEjtEnX5NnOyLHccDM6lCLbEdrVng==
X-Google-Smtp-Source: AGHT+IFJYk8BuVemaVBVO5EXBJZ9kkyizHdSt14Tescmfjr83zUZq6V2iRq1JbYRvfvgYMK4x2EPoQ==
X-Received: by 2002:a17:907:1ca0:b0:adb:2db9:b0ac with SMTP id
 a640c23a62f3a-adfad28d3d8mr1590995966b.7.1750216553688; 
 Tue, 17 Jun 2025 20:15:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec892b63fsm950622166b.128.2025.06.17.20.15.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 20:15:53 -0700 (PDT)
Message-ID: <68522f69.170a0220.b3902.88ec@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 18 Jun 2025 03:15:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750216554; x=1750821354; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eLjwGv/ZxubvbKews+3w/G/CZb90ZSiOHuZQp0ZaHdk=;
 b=BiDGhQhwUVe6LPCuo7vOJ+RzJYTN12vNTmFAEJDvlSavw5Av5x1BFAdJi1HY04Zm19
 3NwmxazbK0yTzdZP9UXZMFzTYd0HwEkEKIO4UMRw7j9RLGh7bX+slUKQhekxcNg/xRiG
 ajSnfn3pCKYZ78wEHdA+EnrNC4SRwk9mmhzobpSv2nDpAopHF7Aua8gaOwB5+OJjYUUX
 3t6S4QCD3o/MEBtAEsQTk+ZSD7EpXN0BGBejCWsLpOkEDBZU2oEV3quBOYlCY42mOmWz
 JNZQbNWcRbaisoS+Akl+WOi9VPlso3shhtBzfqfd1gFmoryJBv6WQneHVov/YqT87Yc9
 ejfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BiDGhQhw
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-17
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

Autobuild statistics for 2025-06-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  5  |  0  |  8  |
  2025.05.x  |  4  |  7  |  0  | 11  |
    master   |  6  | 303 |  0  | 309 |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 43
host-gobject-introspection-... | 27
              libselinux-3.8.1 | 24
                    bmx7-7.1.1 | 23
host-binutils-arc-2023.09-r... | 12
                elfutils-0.192 | 10
            host-binutils-2.42 | 9 
               bctoolbox-4.4.8 | 7 
                 openal-1.22.0 | 7 
                   avrdude-8.0 | 6 
                   bash-5.2.37 | 6 
                       unknown | 6 
                  cjson-1.7.18 | 5 
                    gpm-1.20.7 | 5 
                    yajl-2.1.0 | 5 
             batman-adv-2024.4 | 4 
        host-berkeleydb-5.3.28 | 4 
                       cfm-0.3 | 3 
                 coreutils-9.5 | 3 
host-am335x-pru-package-5f3... | 3 
         host-mariadb-10.11.11 | 3 
               host-vde2-2.3.3 | 3 
                libesmtp-1.1.0 | 3 
                 libsoxr-0.1.3 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                   perl-5.40.2 | 3 
               pulseaudio-17.0 | 3 
                 agentpp-4.6.1 | 2 
amazon-ecr-credential-helpe... | 2 
                 apitrace-10.0 | 2 
                    azmq-1.0.3 | 2 
             berkeleydb-5.3.28 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
                 host-gdb-14.2 | 2 
              host-json-c-0.18 | 2 
             libargtable2-2.13 | 2 
               libcap-ng-0.8.5 | 2 
                  ntp-4.2.8p18 | 2 
      passt-2025_02_17.a1e48a0 | 2 
toolchain-external-bootlin-... | 2 
               acpica-20241212 | 1 
           at-spi2-core-2.50.0 | 1 
                   atop-2.11.0 | 1 
                  boost-1.83.0 | 1 
brcm-patchram-plus-15bd6638... | 1 
                  brotli-1.1.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
          chocolate-doom-3.0.1 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                     daq-2.0.7 | 1 
                   duma-2.5.21 | 1 
               ebtables-2.0.11 | 1 
            ecryptfs-utils-111 | 1 
                    fcft-3.1.8 | 1 
firmware-utils-86739f2b3ae9... | 1 
flashbench-2e30b1968a661474... | 1 
                     gdbm-1.24 | 1 
            gdk-pixbuf-2.42.12 | 1 
              graphite2-1.3.14 | 1 
                 hddtemp-0.4.3 | 1 
              host-guile-3.0.9 | 1 
               host-parted-3.6 | 1 
              host-rust-1.86.0 | 1 
            igd2-for-linux-2.2 | 1 
             libapparmor-3.1.7 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libjwt-3.2.0 | 1 
                libkrb5-1.21.3 | 1 
libmodplug-d1b97ed0020bc620... | 1 
                libsepol-3.8.1 | 1 
               libsigrok-0.5.2 | 1 
                  linux-6.15.2 | 1 
             lirc-tools-0.10.2 | 1 
                 logsurfer-1.8 | 1 
              mariadb-10.11.11 | 1 
               netopeer2-2.4.1 | 1 
            netstat-nat-1.4.10 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
                setserial-2.17 | 1 
       shadowsocks-libev-3.3.5 | 1 
       sp-oops-extract-0.0.7-1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/f81c783ac17a228c15b6299f3f683871f7a2782f | ORPH
powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/31e5c05de52d5c98f1cd7f9334c63b9722034f62 |     
   sh4eb     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/7b758fad432009887d7bbb4d4f04797e2845a015 |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/7f23cd3bf23ee379077e898853231a657b8fee4a | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/12cb6114edd1b133155db7587978708557a22e1b | ORPH
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/ea2f938fd2925fa2c6845edeb241a8fd4b23f58f |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/8ff3622a24182f1e5c4c24c0a13e3ec1b6bbfb1e |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dc019dd2d81fe1e960735879508e74acd89bba6d |     
   sparc     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/579946e06f54aaf035174adc48ede6db55303f0f |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2c3ffbc1d1bffe60a218261ec8eb6190ed4ca509 |     
    or1k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ee3f1138231bb7e3ac86c6694ef66643b35f220f |     
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/776deed602ac9628c920be5237b7a360a60d665b |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/07fab609ed0fd4d707c9c202f21f1fb52ec1e717 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b67b476a21e2e16ce6bbcb31934c547c67f48c5a |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f2985a14ad89dbe95ba9eafa78553a8d714f994f |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/6b8a9c17c902707e22c6eb624f4156d31af0edf0 |     
powerpc64le  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/727672e9a8e8bacd2bc73f0cd96ba2b55dceb600 |     
    or1k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/15d80df53a27c6a0ecdc694c20630230fec14879 | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/45201bc0ccd6c7a7ca41dee369bdfccb036385de | ORPH
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/a262af9b06b47289f6633463ff23133891b12b77 | ORPH
   sparc     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/5ab2f8c5a4cb52ef4a01da5ef010710bd58fd71f | ORPH
 aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/3d532c79a906f39011d562fb7955eb31ea056cc8 | ORPH
powerpc64le  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/58ac7f718764ff01ff5b9c1ee265d3a747b82d3b | ORPH
 aarch64_be  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/16a6d414b2e958afb41ad7085b72983454e89fe1 |     
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/b0b70094d5e98430cdc0b5bffe39a0ccd8da8372 |     
 microblaze  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/04d50059ea9b56c3f5442e0a5dd5f7797d3ac9bb |     
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/c3499edd1e3efa6db9e4713e38760e421c3c8f6a |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b29aef78e3470b4af431eadcd85bb42f04e9be39 | ORPH
    sh4a     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/477f750b350a544dfa07a00ac2075c4492ea310f | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/05a71ae75a77f5dc23578faa386ceb5be58b577a | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ae6bfac612dec411584a30a1545326d159af1919 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9c561b6c73fe42c0e11f480dbebe46cbce32f72a | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d4583666a0adc85a7ef57f4dfaa7e90d2321cf52 | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/5354015eb39089f9ac28927882565722c38b89aa | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/078370a88a164f12fe728209ab8f22dbad39c6c9 | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/260039229288acab32dda53c3e97de29aa878112 | ORPH
    sh4a     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/59840cd73757763c3100c6badda1fffca955966d | ORPH
  aarch64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a7ad6f4890e1a6875837602153e22ff0629ff1ef | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d291337181be331a1d77d5e3e5cef66698618a7b | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/931dbc885dfbd526aaf17c630342856a94c3fafd | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/06df6c9984e78f479cf79483303bcb7cd3110d3f | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/30872c5e23865c0251da258fe423c68aaf401554 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/84f67277af4714e51bae6f44745d3ddd431681ed | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e31d4814f37158460daa087212ec9f1e6843c772 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8e583e801687e46f0e81e185a89c0c432a0aa5fe | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/de72d0ce708f7243e0008739ba841109a3ce5dd5 | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/83be725c74c44ea289984e2354ce6438371c8286 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/39d26f427db789cd9b5465b0d7c49db7b557253d | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4a089c515c314a4ac1bc3050d81c068acb3bd41d | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5093714df7e310f6a5fcdad7b5f0b751f0caef54 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1b40832177cc5670fbde7a368d026be20eb8039d | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/429d92572bf8b94c1c384bc261b42e79724f04b5 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/76272246887d32158d1c5d042bbdb1fe5101d123 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6e5353f01592fc9ae6cb8315ffc99084ef2e7f3f | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b419913328c4e514231dad06eae126fbb6ef3581 | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b86b5632d86c48eb2bdbe8abeb19ca788598cf10 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6016df3b9ea72ce8667fd8afa5ba23ff5e255aa5 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3ca6d0c60f7a1f28533c7b5cdfaf492e6d3089ec | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d8230627fbf9bf0cf2810beb8fed0892286752f6 | ORPH
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/69303fe29cc533cd860c27b9e2ad4ae1ea9114f3 |     
  riscv64    | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/e008c428fb0677bc65f41a1bde13a72f952b7f3b |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/621e2a6683584b9a31a64fb30b2c30cf7cd31686 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/57d9288779ecc3688481c48918a63fdced47dc2d |     
    arm      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/809c40b19be808587aaf0f39278c7964c0fd0854 |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/96b5a6ec33dc03fa56dcc7f164f7d49498192f42 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/f3e5899f9d99530819c877c5b089fea267de770b | ORPH
 aarch64_be  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/ff58af6bff8e05ae9e91a5f97882868e2585e406 |     
   xtensa    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/bb3b7b62e10b02c045d3ce08539bd3b6ed5f4ef1 |     
    sh4a     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f425289f2c70b181dfd401934a4d05f4f44a6ccd |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/0ad5d0ff4ceb424947235b22aaa54e01fc3d8e56 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/1aff94dc8608eae64b7ac2d7d5abdfc96f0f67ef |     
  powerpc    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/b398e88aeb856b913deadce8dcbf443477185d36 |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/61de91d402b01714668c539a1915cf4330b6b864 | ORPH
  powerpc    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/df18bb613e7c2306b6e18338d3c8b8117dc3ea4a | ORPH
   xtensa    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/e0d893777c3ac850dd51d78164a271b4a1bd0a3e | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f5cb9ed1ba1fc4184ace8ba7fd330a24214db965 | ORPH
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6eb41cc8ff519986f05c8a6848a3a6cf1ac1768a | ORPH
   s390x     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/7a4fa398c2a0b237b70f73c532b09c32f9cef7ae |     
    or1k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/194ed9a03a1d89a9b6f8cf20bbebf0cd96ecd71c | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/4a14861af98d392d8dc96e32e6dd95d295c87504 |     
  mips64el   |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/f8dd815ee2f0e0aa5a14cd870f3b99749cea09ac |     
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/33a00aa417a8b451cbc2e175aef08a36589e51a5 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ab355e56d90d4a587d0712666b954f95d811f839 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c5c8416ae3e9b0f1c888d585f7731e75162ea009 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8df726ded9a68739c7aced93fb2d3d4f15d181e2 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/badfd4ae056d2fa6919d01e4319e9040c313e60a | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b114a5a66fc33eb4992706cd7df5fce54c59558e | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/772a23f64db6c0057ebd1563d3f1bcf679ac9af7 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a02c88baf5507087b5415ea77931158a1dc469af | ORPH
   xtensa    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f9c3103590aa29916e01210c1f46491081158653 | ORPH
   sh4aeb    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0ee793791158bea7b86be5afc64120ce4491c815 | ORPH
    arm      |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/c6d8ebf3e0d006e599d458603075bca1789a1a8a |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/109ca817d729560265525df6b9213aab3239a576 |     
   armeb     | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/6191dfe62101e3732f650d0b4e3edc0dd8eb9b6b | ORPH
    arc      |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/5146ff7da980d4f003119ba6c052b67fa3ccd9e0 | ORPH
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7247015f6443f27a6d298812837d069820322d16 | ORPH
  mips64el   | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/f1f864f49f3834d69ab7fc59032e6e24818c263a |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/9c6c92b9e80d64956a9f3395de7e6e027b82c6fc |     
  powerpc    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/cd8d15590ea20d679fc67ae2bddbcad847da3e66 |     
   x86_64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/b87a78b038a124a614b6968745722e2e73dfeaa8 |     
    sh4a     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/d9f284f37062b195c1a05120a5637bbb71285700 |     
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/e5d2d5984f6274e1e444745ef323f47f553ea357 |     
    arc      |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/0423da699a67c99334e9c0994edf6cd2c2183a48 |     
  sparc64    |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/e011045b31196838a27dbaf1ed9d96ca46edcd6b | ORPH
   armeb     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/70e21500c8b99f6347094d2a6b58d93cc9600337 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/67fe3954a8cf852148e37be5a615b658a5d00e19 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c0c2129181647c9534c7e501c23dfad7a5877de1 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/703c304bf54bdde91b82643ef9cdf7ddd5b63ee6 |     
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/36ce5326f8c03371c32e04cc89f09a5f9fb57752 | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/a415dc8f446a5abc99cfa1220fa901041fcd2088 | ORPH
 powerpc64   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/cda2abfed4888a97ac0e1c94c3a4e777b0f26f59 | ORPH
    sh4a     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/0f3fe48571bd680d1a304b897a595725aac85cb2 | ORPH
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c64d499fb9d426f92d86d93dd0d2f2111fa3cbae |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/32df5b658460244a6a1f952fa3e361418fc1e311 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4a32ce54412d76f366147112932a2a3eeccc82a9 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a69083ff0680a6f7d041230f8ece54a44d99b9e4 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/003a094ce2d53150285834b207c7a41cdb4126ef |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/58fc477183f587c913181c7020b09869eb3f5bfb |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d4b647863c29d34f1bfeff571483b418475ea045 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1004c1191d004c6280bfe8010d134d2ac82bfa3d |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6b2a9708e36508b98067121f09e798865e62b0e8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6537b45d14c01e5e726bdcd75b32d60da0900996 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7ce945340d67ce7e11a7a98d067242c1d5226e71 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ddb94ed20653d3606ca94da2e1b0ba7a5743ab24 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2307eb46be8174b69c6989474afe108dc9e84e66 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c82b8ed8dd9d10415379ee438c29713accff4402 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f970c46ca610786498c2285fbd96342137b8d9aa |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d11779ea03447c73237cd8274156a9d3926287fb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/325efe936987748a285ab14b2f66b55fab811d5e |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4b86c4b7b844fb89a8302d37191f0bdda5dae2aa |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/215fa222c7927e692b926754709e568bc7366c39 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6d4d00b249a4590e70ebe2069109df8db17c9494 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9f017988272139f765d3bb5f874e5eacada92f9b |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/76624a6fc3df0e1ae151c601232b7934e9a07272 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/64dc40634e1d8ff4290ae7b721d63f9727bb5602 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c0b78c91ec2ef71a93cb88fbf0bb8cc4759c680f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/111f8a062fa50bdb7fa0498e22434b1e3b70b09d |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f1c3ea39d846f39cf98a66c68fae2ccb3ce45d7a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/716c45ab589100ead54a9fda288d8fc2d7cd60d4 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/978e5e8aea602b9f755d8d44df52cbda9c2f0081 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b1e1dfdc7daec2801928912a717a98408dd8cce2 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/21e6500a6fc5911029fafa5c5fc268a0c37d3fde |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/21015efb37e57e68437771af1a00d05aeec99b1e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/adf162ad9c7c7571d493624e34491b006f369131 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d244682c8fa8fd7410c56b4c1de05286bc2711b7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/efda9c001f7c6a0a54931acf136a9e763509f20d |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d3f6a548705cfeb136b0b3e3493336939428ccdf |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/95d1e1d0fc2c73a8f64b705930eb63e854936d0f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7a98c27437a75e671dffdfd09a7a9834c612332c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/966c79fce532d10a12b5e6cf866f98e3f7ff959b |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f72845ddde75d08cc0e67fe6b2d5989653ecec53 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/42bdd8b410773bbc0b90163c838959e0d9e33115 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6dd0e61f38fec29d1596f13453c08c6cfdeb6ccd |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2e5394f1a50dca07fe5eb0110f7e6041cfeac1f4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/44bbb3722300ed4ef840982b97b319a5bb2f1ef6 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1300f87a69e0547d7bbe3576bef76cd3d7ab973e |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/affbae351e060fcf434f56baae8f18bdb590b7e3 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf295d95d22adc15d10cf0afb59f755af9b67604 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/26535ce477c28d7c5bcb24f9bb96379e0e7ae05a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5cbe70c614c1b5c41b86f8139e0585f57d08e7b1 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/47b9ab6ae69b2441fa16660592a8ac5b664909fc |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7ae26083667d3666a0faa8cb5cf8ddfb88cb31db |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c6dcce7841f9274ab28f1c630c04591eb78bc24d |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d83a4a2f0a99253fb8e1b0cd988ae08fe48097f2 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/76c2ad9e7b8d56f0df71ea27c2028c7a89bbfe3c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/24ecef867fe5e39bdb78f99355e263e8355878a5 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/15303173f7a7bdadf5d8722d7285eb99f799b14c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3751e0a99ef1f62fe525038f00b5ca143c48d60c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e5de63d194194749ba9eb2ec14c848f08c8b4531 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0bd477818477701477157c2dd6c7fe08aecee409 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/26f047fa40001a6d58c29da13a25269c50d34b7b |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/34d806f0c269cef0ae618cb6e9ed6bbc55e39258 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a8083b396678702e735a77a7c6a526d015d8ad5d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ab7c7e4a7c75612c548857a758042ecc0a1ef8b0 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f5ed6c6b77d2e4a1711e6cdbf1b895b92e18f435 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/85eb7c5b4e241d266fe5abe2239045ff8e962e34 |     
    i486     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/074127b8418a6a2cef39c6972d8f9aafd38888f6 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f3b95b86b575a6df17aaa010dea28ec833811f76 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7a89286c88aedfea164fe60e84ef845bfff9642b | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9c745fe86077f29f05cf2871b365a8e1c3ecd44a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fa4a89e67eb63815f7a5e96221aa3e92dadd4a81 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ab148a49dd855c8b07aa32389abf75bcfdb0db99 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e52f98d1972edaf633aab3a888821080ca21fc39 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8cd83ece16dabfaba5f017628d11b0a64a99cea6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e19bf7bcfee84b5925f73676fd2d5f80759e27ba | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4376173a81f47122a6dd748ea56bf4a4eb9da152 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d722150c623b77ba686a40b05ec162804e381383 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8fd0dd41a8105d754239b9ba5ee3970db8d093aa | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fe9f9f297a0171f0c4f042560792641833b633d9 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e2682dcbcca9fe970fec4837d7af6a9072fbe6f7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a95f2511bedd67bd65f6653747ad5ea352973dda | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/11e398d60ccad2be0b0e3cbf86c9d284b09b98d1 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ec63fa6dd364526f5b1a25a772070729435d4f75 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d89ab633a7ef3aa759c6ba218c2df643919bb59a | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a9de1d4b2baa8af60eddc8e5c29213cf7c7194b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/af497cbd21c0c38d17aa510403aa4fe6f602337c | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f29515412fa230e8831666962ad378d6279dead9 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5eff1410cb7c1ff39906bbea0a10ca37358a6de2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c47f980819b89e0a39c65ffeaa8cef203cf2ecfa | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a4c171ea44052b50c749b123d816ecfdca8f5d57 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4f2c627267226f16b6133817a9c4741b81138a5 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5465531da0b820a13f87643f8462879cb4245e35 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08b58a0fd1ba180f758e2bff391acd406e0fadc5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/97c02bf319644a7138695dcd6d6d44fe158b60a1 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d3fb9c938b74dec5b49b17250ef05c396a8f1c4d | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/40bb3243eb189781c4a1a42e86efd5cbd77739af |     
    arm      |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/5f6b3e48a1a5e4a79871b6a27f8d25f9971701a1 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/853bb256db111f6eb56fc6d2e4affa2690c1ebab |     
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/d50befbf20ce2a598265ba1bcbe300c6677c9a43 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/657222acff0ef41b40d19a4fde822c4012596d1d | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2b8cd729d6ad3317769b373c0510214d80273bde | ORPH
 aarch64_be  |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/7e7d4f6563ab5190cff48af4f5e613915ca2c5c3 |     
  sparc64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/50e21fbe1e39f7eb93f3d416f01525f633e0a09a |     
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/1d457fe0ccf048d81af4d5d23907c5425154642c | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e2d70b048b08ddd320f8216c63461fc8c71b65a7 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/03593a9b4c4b590efa51efd0097e5096d3750ca1 | ORPH
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b5847f563c7254a6616680f4ee53e7a7bf60ab44 |     
  aarch64    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/02185b26666b0d9cbad27e056fa8dfe160c4fe52 |     
  sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/9beb7497f98ac704d8cd7f7eb2f49cf581868eba | ORPH
   sparc     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/60aead4360dbad43ea2a26197bd6583dcd51af13 | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/2d0c299802897e1c906c2c77756005c631fed06a |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/60e5cb7d7c210857f99d86e01712afdadc3504d8 |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/129e3e18fdf9ded2b0fe641170d234fc787f5b53 |     
   s390x     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/a706bfa25cfcd737ed83e73c43c1a858c73fa219 | ORPH
 aarch64_be  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/d290d8b0dae91f9ef107b34a0247b193c5d0c1bf | ORPH
  sparc64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/e8c82662b16d40536c64432f71f62e39fc9a7660 | ORPH
   mipsel    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/8341c5976b0179739e2a1accfd87d74d6857fdc0 |     
    m68k     |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/717bc2632be77ed07525bae7d1e290b8536019e2 |     
microblazeel | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/c948e7bf421081e114b11e4179dc0b5bcda62481 | ORPH
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b241547a502be68ce7627f4cb6df5979e1f45098 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/224300f14ecf2b1a5b14a18382bfe66e3ba5874a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/103a6949d2dcba696c59fb87118bba390c00bf88 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9fcd448e67aa3ebf71a52aef2e0bf3f817ad8448 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cc6c848745dd0f8e2254978edd2c8cac23a4d882 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/717e61c577d783fc4bdc75a94cd77ee666c0b4c7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/883e65637f3c548e75f092f94b0592a685e7bd56 |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2a98963797f7d067df5a810d911ff0ec21614e04 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/11927960e7dd040e75df982aa447f31fda45d1aa |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8ec1c588e4ace178c76f8923225a6e827c67423d |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a5778118d63eedf80913c95a6c36a3199615a1d8 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c0ff9390dae3ce16838a4742f2bf379d99fc0e58 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bb4129f7d5f475efc0e1fc18140c57319a6912f5 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5b0b40a7afaec9ad4690047a68f419c51645a49a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/28058b22763821742616e85f1f6a8562231cfbb9 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/83088921331cdbc2a31adbf04887de10a9f99453 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ca81e05ff7fc4209748954b16baa65c7fcfd339e |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/263508842db7d6b1914a6f6edd4e0009c6b9063d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2dcc1fbfba71ee2da80cec9d1cd139f446b237da |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/118b9bb9ee9a78a1b05499891829c88a0389100d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/29bdc5e95ee3473c39bf2a6f0550bdb4dcbc88cb |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3b124d75984ae62342eedac79f4779a25e9fa46d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e5833b981a0787929de6871886afc970ef16731a |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5f74ccdd51d4880782deae00fb53e4274cc45a43 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/37facac76288943e0d6404af63261a69fa25f9ce |     
   mipsel    |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/be52acac0b95d45d7fd4da46d7189768f483149a | ORPH
   mips64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/151afd2a93deb42a61e7e5e9bf0e995241cbb840 |     
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/6d9527ed9c55609778d92b7e9bf0f7cb6765e2f9 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/dfa95900c4ba3e5e7cc72b4a50d78fe265492fc8 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/945b19177687ddcc71cdb4daca92c449bd74be92 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7feb7a6b4ef438cd397b10e3cf7c95cab59f7e56 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/344c4a9ec08d970f351255ecae594fb6f769594d | ORPH
  powerpc    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/f56235dfb519a2666d421f432e3d9b1f0c853ceb | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/86d57b0458c4119be655ae7b5ccb837baf23aeef | ORPH
   sparc     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/556a30fa69443a15e692b8f3c36d22daeec5924c |     
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/11d41bb019c5b1077459094436cde37396eef295 | ORPH
 powerpc64   |        netopeer2-2.4.1         | NOK | https://autobuild.buildroot.org/results/ff479a78f5b41a9d694b8578df2f6f64a997bf9e |     
   mipsel    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/643b339938aa08b44e35493ffb1c93e498001c58 | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a331bc54a24fe8b5718771f1bf16ef6e81763ff8 |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/56d7c40a0d4d5be3c4c11ec8f8eb1a6d5fb1c699 |     
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/9337c716de5016f4955ec8aefaeb0bd93a325bea | ORPH
 powerpc64   |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/0f791ecfb70c1a7cb06c3e14f24f58a96e6d0322 | ORPH
   x86_64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/b211b636c332ec037903f2f6c549ccc31a914bd0 | ORPH
    sh4      |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/93bc600e5356f5272e1f7497fb412871fc38b2bd | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/c322da3ea64d670ce22dcedae6a3ca12d20af8b6 | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/d799720e31c162f208ffbe1db6dba22211362cab | ORPH
   x86_64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/485c99e9805fdb0a4da833ecc1c26ebb5401472a | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/a99e3e25659d1dc512c6e2f04874c0b2774a1e5a | ORPH
    or1k     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/d75869c2e1bda32ba176c053253685fc8a3c7831 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/33cdfb63af8962fe05a33d818bac15c04c0c3b93 |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/327b1996ff057e1b6d622bf17a9f59ca6a5cfd6a |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/02c5e62b4d08464760c0f79e922350cba9b8e75d |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6822df387f9370737dd7009d988c6b762e5c32fe | ORPH
   sh4eb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ebcd41e0656a81bc5b47358e94c282f69874f809 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/28664bf871b913d089648b6ce89b2bb2872f53ca | ORPH
 powerpc64   | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/d59537da8eb27d737718885dc81ec257a2791455 |     
   s390x     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/25ca8601dd131db0fe3c1650c1d68c92592306d8 | ORPH
   sh4eb     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/7b68351c32a4725f56c2cf507ea64d1581956f0b | ORPH
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/7bc20abf2ffa1013db4cb66e0c3576d33d138c20 |     
   armeb     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/6a5ba4682a198afd10810289aace598ed45ba968 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/6b8b0cad22ce9c96de924bc8b36bd0abd340b6d1 | ORPH
    arc      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/fdccf88d3c8a683d0636772e0cf3fd70724c9c46 | ORPH
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/207c361f620905c53fcfacbecf67cdbfd1a29300 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/ff9e0d3f7c9fae185cdf3aee42901052cdd7380c |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/600c0e406f594af1efa42db4a623d85cae97fd60 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a94ff6bf48d0d1b5ac2525527a1f8764ccb49a68 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f935fc3f66d7995b5be86861d7f0621e2f96a40e |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/95e30d1031912efa200edb9c7b926a31f0abe32f |     
    sh4a     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/3e67d5b3b89d794e3f6c510803368f8b100b07a7 |     
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/d7dea24b68a0fecd146977c4dcf6a8933b593a85 | ORPH
   xtensa    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/3b867be650c9173459c0514063dc81caa386794d | ORPH
    sh4a     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/9f457ee0f6f2f3790217599cb52fcf44b5672a2c | ORPH
   sh4eb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/c454968df88ca4238cf268c0f893d2587d5db4d2 | ORPH
    i586     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/d98d66c6eec686919b2d894f16f2a2a8bb9655df | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                elfutils-0.192 | 1 
 host-softether-4.30-9700-beta | 1 
                    mpir-3.0.0 | 1 
                       unknown | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cd138c404ff1c36706264fde7e920b65ab911cd7 | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c43a9a221896d37ee8a9d34c5b8e2725351c6eb5 | ORPH
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/666ef1f0d1d0ae53301e0ca9604750b693d90ec1 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/135cff3de8513af5fd400d0b9efe31e4065039aa |     
  powerpc    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/2feab847260839297e998d06d98eeb4401697903 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

          host-binutils-2.43.1 | 1 
host-binutils-arc-2023.09-r... | 1 
              libselinux-3.8.1 | 1 
           oath-toolkit-2.6.12 | 1 
                       unknown | 1 
               valgrind-3.25.0 | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/51002540eb3b7288723614223d927c0ece8e2ecc |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9a187d64813010a0119948b713cbef6bb489405c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ceace643f012430196239017968ec97e31af17b7 |     
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/72de10d505bb2983ad19bdcef8270375e772a0d1 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/50a210847d5978186d5e47804338d3a6cb58cde9 |     
  mips64el   |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/b90bdfb978a7ffbde16bfc7f22ec1b7f9bce5f9a | ORPH
  sparc64    |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/36b8579d4517655a852a6881bb0d71cee063e2c9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
