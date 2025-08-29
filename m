Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0732C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 03:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C88613D6;
	Fri, 29 Aug 2025 03:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RynZnDPVZ6u2; Fri, 29 Aug 2025 03:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C7C9613E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7C9613E0;
	Fri, 29 Aug 2025 03:23:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 856236C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD0F83CF3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MrvevD8RwD2 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 03:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C070C83CF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C070C83CF1
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C070C83CF1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:23:17 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61ca9a5b41bso2234398a12.1
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756437796; x=1757042596;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hcH3UNlgbRXIE53m6eFXcWy52w7HAm/CvsxMVzUioNY=;
 b=F5emajOxVwrW+2idv4ZaKZp9ckhKUXZEqs6V1fD6CYTUAhPlYHiqkqzvlixiyuR26U
 Y+87+AV+tUnyq3qjPXgRUKlHYnL1WWBtTgFlgqFVAEeZfeQ1YAg/34iogW8LKOUXbB25
 JA/hnrc/1/vLLMzG1+0hbQlnaQvjURafAm8qH+IR8m26qWQ5YdqH3xTo4BqSU/zsQ9rG
 BzjsOnqVBabMKfYyE2RmIdTaIXcwCpQDrqzKLzVbhEY10emnPuYk+9OZbWLLBTsWUR0G
 c6GXETizwwevmZIHzw99BZpTkXyWTJz/hTUtko0y2uF/0ydCtbNAmErYaKzJ90CBp3kV
 Mtaw==
X-Gm-Message-State: AOJu0Yz/+K0SLnHV30z+vkdbaYUDSkAZpqynRa3P3zxatidVuiBxqazN
 8x4yHTQJBy6K4HHsytDwMGk5Q3eObHBtW3ggSfFy0FpDMjSITObRs4CW1EJ9Mw==
X-Gm-Gg: ASbGncujndGxVIsgAmdlr+Y/ZsgpnkFJuY+21LXRdI6vr9XOh3rsMFyg5/MSPX2fByH
 nCzsHxbT6wUyqObmrM8XvjY7P063qKakcEL3znxft7uyCG2zXmqHj5HoUP/tubNrrMLK0aPpW+b
 FzeP3vxBzgjCZxXVRdn+d2f5b4WFHtG1MVhMGi8QqBAP1at1CzszPK/8n8HEm76rIoNOiRuCHFu
 oauY316wOR4A5HRSFC6TwLZdH4Im1fBoliwxYJ18D3jCT82x0+fWr/gIYESpavCnRIFjF2uelKw
 OrTdrzDn4UE9ScbBZdQYuBvhA/FQBGYyibrKqLV/9qyTOF5BDzZn9gL3wQnFR77FRT3w7My4nH4
 1PwEJPWMp71Q4jHIp24On14PhTxN7UQ==
X-Google-Smtp-Source: AGHT+IF0pp+OlKGzLjPMXa5me1mP8n1NLXwjkTZ8HINAcJolyOCEeUGgl5XULrAf/wMR2DeFfWmtPA==
X-Received: by 2002:a05:6402:90c:b0:617:b28c:e134 with SMTP id
 4fb4d7f45d1cf-61c1b2860d4mr19229043a12.0.1756437794973; 
 Thu, 28 Aug 2025 20:23:14 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c775fsm928962a12.4.2025.08.28.20.23.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 20:23:14 -0700 (PDT)
Message-ID: <68b11d22.050a0220.2b145e.250c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 29 Aug 2025 03:23:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756437796; x=1757042596; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hcH3UNlgbRXIE53m6eFXcWy52w7HAm/CvsxMVzUioNY=;
 b=dMIDZ7UEhEkrSIMnzzI/oES93k/gSHqEw9dAvFEbOdjvAB7aITagWw90YFbugzYigy
 ozLwU7DE4f4GcQ+uBTiIQfPQ3hG83PQ+Wb2//y1oHpCaSciVX0Ul0tGFdXPU24JkMC6m
 ZCBoRDQ5N3/ieOaQtn7S1OZZSCWZtth4zM2573Ifs+hVBP0oGnqs6W8+XijzzU0AOZBm
 PQMwPSRS7fGBpiAhxpar32tdHSwNfW8J2qhZI1+NajU0QhOlJdL/Ec+Vvqf5hTg4xzph
 LfvV69e6fAib7LhC4X4gndzGIDgIMpb7OXmUIim+Ujrluajp7tHKFUeI+O274qYtDXyO
 ervA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dMIDZ7UE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-28
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

Autobuild statistics for 2025-08-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  6  |  0  |  6  |
  2025.05.x  |  2  |  2  |  0  |  4  |
    master   | 22  | 275 |  0  | 297 |
     next    |  2  |  1  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 33
              libselinux-3.8.1 | 18
                    yajl-2.1.0 | 11
                 apitrace-10.0 | 8 
                  linux-6.16.2 | 7 
              host-json-c-0.18 | 6 
libsvgtiny-ea9d99fc8b231c22... | 6 
             18xx-ti-utils-8.8 | 5 
                   cvs-1.12.13 | 5 
                 expect-5.45.4 | 5 
                 host-gdb-14.2 | 5 
libdbi-drivers-0bfae6c43134... | 5 
        b43-firmware-5.100.138 | 4 
             batman-adv-2024.4 | 4 
             berkeleydb-5.3.28 | 4 
glibc-2.41-70-g1502c248d58c... | 4 
  gobject-introspection-1.84.0 | 4 
           host-doxygen-1.8.18 | 4 
                    sslh-2.0.1 | 4 
               bctoolbox-4.4.8 | 3 
                     crun-1.22 | 3 
         host-mariadb-10.11.11 | 3 
               host-vde2-2.3.3 | 3 
               libcap-ng-0.8.5 | 3 
              libopenssl-3.5.2 | 3 
                  libsvg-0.1.4 | 3 
             lirc-tools-0.10.2 | 3 
       sp-oops-extract-0.0.7-1 | 3 
                   thttpd-2.29 | 3 
   azure-iot-sdk-c-LTS_03_2025 | 2 
             dahdi-linux-3.3.0 | 2 
                flashrom-1.5.1 | 2 
            gettext-gnu-0.22.4 | 2 
host-am335x-pru-package-5f3... | 2 
          host-binutils-2.43.1 | 2 
    host-llvm-libunwind-20.1.8 | 2 
                  iozone-3.506 | 2 
                libdrm-2.4.125 | 2 
           libmicrohttpd-1.0.2 | 2 
                libshout-2.4.6 | 2 
                    mpir-3.0.0 | 2 
            netstat-nat-1.4.10 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.7 | 2 
                       unknown | 2 
                     unzip-6.0 | 2 
                    wipe-2.3.1 | 2 
          aardvark-dns-v1.15.0 | 1 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
             alsa-utils-1.2.14 | 1 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.65 | 1 
           at-spi2-core-2.50.0 | 1 
                   atop-2.11.0 | 1 
                   avrdude-8.0 | 1 
                    azmq-1.0.3 | 1 
                    bat-0.25.0 | 1 
                     bc-1.07.1 | 1 
  binutils-arc-2024.12-release | 1 
                    brltty-6.6 | 1 
                   bzip2-1.0.8 | 1 
          cloudflared-2025.1.0 | 1 
                 coreutils-9.5 | 1 
                  ffmpeg-6.1.3 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.14 | 1 
                      gd-2.3.3 | 1 
                     gdbm-1.24 | 1 
               graphene-1.10.8 | 1 
              graphite2-1.3.14 | 1 
                haveged-1.9.19 | 1 
host-android-tools-4.2.2+gi... | 1 
             host-fatcat-1.1.1 | 1 
host-firmware-utils-86739f2... | 1 
       host-gcc-initial-13.4.0 | 1 
                 host-gdb-15.2 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.88.0 | 1 
      host-uboot-tools-2021.07 | 1 
                   libcap-2.76 | 1 
libdill-32d0e8b733416208e04... | 1 
               libdvbcsa-1.1.0 | 1 
                 libgee-0.20.6 | 1 
                 libiconv-1.15 | 1 
                libkrb5-1.21.3 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libpng-1.6.50 | 1 
                libsepol-3.8.1 | 1 
                 libsoxr-0.1.3 | 1 
libubox-3868f47c8f6c6570e62... | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
            live555-2021.05.03 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250530 | 1 
                 mbedtls-3.6.4 | 1 
                openssh-10.0p1 | 1 
                openvpn-2.6.14 | 1 
          perl-net-ssleay-1.94 | 1 
                php-yaml-2.2.3 | 1 
psimd-072586a71b55b7f8c5841... | 1 
               pulseaudio-17.0 | 1 
            python-yarl-1.18.3 | 1 
                   qemu-10.0.0 | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.14.3.0 | 1 
             util-linux-2.41.1 | 1 
               valgrind-3.25.1 | 1 
            vorbis-tools-1.4.3 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/76dbb1a9ec1d5455e2fb185fa03bbc7aea0f7d78 |     
    i686     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/f91c2f354a0837650b7eb28e25a85a927c1eb1e6 |     
  mips64el   |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/8914f727d05a4a39b27e87e179918946c71ae26b |     
    i686     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/eb3a36982a29e436b818ccc47e61ce0d05098b2c |     
    or1k     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/59f6c578f109014e743587f62f1fdc0eaa1e4444 |     
   armeb     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/54216b83fc9f01aecf05ace5ce66ec0fd3a59d67 | ORPH
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/03f0509d94757c57c51181c5e6e624df8bd23729 | ORPH
 microblaze  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/4203c2742eebecb5c838465011ad753ffed1a2b0 |     
loongarch64  |       alsa-utils-1.2.14        | NOK | https://autobuild.buildroot.org/results/ac03dcf8a35b2906b3b12897af6769a5e7fcf018 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c02ab71087eb70fc6bd5d40ecc509cfe0df36233 |     
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/728edb2779238ef09e9fa329bb0f248ac76c43c1 |     
    i686     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/6e4e841b4f0be29956fdfad43a406d2dab3003f3 |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/427a35f9fd71f40f157a74be3ed62661a3dc714d |     
    m68k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/f80ea8a4ee113c551996df4acc02dca914caac4b |     
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/fc4921ae80a59826fd786e54f1fa519845e6345b |     
   sparc     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/ce43da9024377a6f1c5453b06f4bdd2b1ac46776 |     
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/ed4245ee80e061264aabb2abd29edee40592a107 |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/6805b94f4aabc7a3afad0056265aa3abd7ff4826 |     
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/3478e8aba0dee85224b1f5019841d672bf73c736 |     
loongarch64  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/894e48dac8355e9483dec8be18885857efb54095 |     
   armeb     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/9010ea610901bbad9836d66287830be99d081c08 |     
   mipsel    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/8d0efaa707d965f5a9bd0130cf4651dff734f7ca |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/fd18e0da84d200f6f5c925a89fad5205d50fb158 |     
   armeb     |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/119acf4a0ed55bed7e2821bf2de5eed0f34fa11e |     
  powerpc    |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/30e4149117665239bcf7e4ef6b73fa839d058c0d |     
  riscv64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/69639d790ac1873352addddbc5559348df01cac6 |     
  sparc64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/9e2183d9c9419f0878292e491f0dcb4f15187a33 |     
   mipsel    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/34e0fc37b0503fa204cf7288e016063daf5a4ff2 |     
   x86_64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/367d9b049b25141b64bee837a606eebc7127affa |     
powerpc64le  |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/12468fa8702754e26bcfadef6cb24abb6e3c2090 |     
 microblaze  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/01a14ecd89a4b9edb8b1e753ce47774a147452a8 |     
   mipsel    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/01bf2c66015380df2a240407c761186c7d91e08e |     
   mipsel    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/a47331fd864352693b0e79da29385dbfecaf1e01 |     
loongarch64  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/7fc71cb45d65760f93a447cc29fa95c638b993ac |     
loongarch64  |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/77ac523bb9870325a75a60f3170c9ad721aebcda | ORPH
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e362eb30648cfaf78b1222e9d0fb7be5dad99c95 | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/09cc9d180f206c87b471ef69798a4b6ba9b97dd0 | ORPH
  powerpc    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/38e311a579e44218c4a8090ad409db4572e7a333 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5d3bab573c3532ecce34abca2fd6d8c9c00a052c | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/078691983442ee1b77b86a27091babe621771220 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/047b48d14e2dbb62f1f86fcf8d45d7588ba7b8bf | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/60a1afe8d9c9af87a1d7e7c392044904010892e9 | ORPH
   arceb     |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/2627d94d08257147879a541560118a981de7e154 |     
   arceb     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/686198f456daae43eef2d55692efd63966945023 |     
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/0342a559a788e4bcacdf8d63058ca907b48895c8 | ORPH
   x86_64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/3d4879f02f8015a1d6d9dd7ee61b36c011a23b90 |     
   arceb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/0540721aa3863ec8d22826de46837bab47d5ab97 | ORPH
   armeb     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/6fe82aa1114943725556c391a1502571d12bd981 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/9761e4655c0c5e0c6b968c5a06bcccdd412feda5 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/e5c664be569cf85bf3ad052b74b8135384a184b3 |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bbc18482df7226ac8040b45c3c26e0ae278e6483 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5f7c32ee1b97a684b3938e2a4198bd61c53fd83c | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/36bb82b5220b3669721afee82bc407456dac17af | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/effcd98a59a1f7f75935af99b85f4dacf9bb789c | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9df122452d1dccb92566006ca1dca6e38e69f751 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3ac1e2c24a2983bd6780b8a50d15f58ead2f5b02 | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/734d94d6e9e2c08d569f13bb13e7dc459a24713b | ORPH
   mipsel    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/d6d3df52fd9455610f43ae841a6b4adb3e3e4671 | ORPH
   xtensa    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/3bce0aeb5328139a6c0a90eb3314248b1c26a9da | ORPH
powerpc64le  |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/58cad2ab9982d6e1b44e158ef3ae1c22d63a43a7 | ORPH
  mips64el   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/038c5ef5ab7b5dd6fe0403de427daaeebea31012 | ORPH
    sh4a     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/6fdf23d91b88aad1e468d57bec29d985a83e468a | ORPH
microblazeel |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/30d19e0c283ff3f0afb9a30bb09c29850d6961c9 |     
  aarch64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/04ed06d9cfb0b80d4f02b376fc844afcd0715ab6 |     
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/8defc86a56460cfb1395d5dab1ca9ae92f98213a |     
  mips64el   |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/d1f60e09261bd9e23ecd0311fc032e79ddef6007 |     
   mipsel    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/5f767b4805b4cef450ab5becf6b3f8c98ad08b58 |     
   x86_64    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/8eb870cd718e6aa30ac2463c9c92d9ba2da7d082 |     
   armeb     |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/e8de801af229a651363ab7518bc91e365347328c | ORPH
microblazeel |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/bd7a34eba4620aa48dbc08fef1e8142d8aa79b10 | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/40bd059e8d73902a4f1e51e1764da17bce91a88f | ORPH
 microblaze  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/11fe419889a83e17b61dc980cfb065237c803a6c | ORPH
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/0b3394b9dd823226c10ba6e23b2a4ac6d7ef97cd |     
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/3b461c01603a5cde38cdab8d87cec3592c4490ac |     
    mips     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/e342a20a1955367a0dbe14c72cc6b6abc07fa82f |     
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/c2f070f51e5d80bdd9f2008a15b69e1009a74fea |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/618cb8ac557aa457ffe6c3d50a9a8a5174275ef2 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/290f033ae268f55a65a2610c832593cbd029c7f8 | ORPH
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/87218c45058555b0e6112f0d8486ca5833e4f4e5 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7951b54183c94ea04c7d927d7c971171c34904ff | ORPH
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7abd7f7697c046ba9409d78ba2415b17d7b99b30 |     
microblazeel |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/5d5d4f4dbed5fc6c255e73edfc27d5fbe8e989a9 | ORPH
    m68k     |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/9e7949e45ddf386126c216c1a02e2d0f3827ffdc |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4b35809d58da14e36d49346b8bc9965b60ecbd35 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a9f34a3602a7717b3b326d6f0dfc6efddffd2f65 |     
    i686     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/f5c3b6deece0f79eafe3bc3af44641575cd64688 |     
loongarch64  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c8d406ca4bde34c03e83d5308003ecc491b0bd7e |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0a5c352adf61626fe95315a4ad10282aa4a2bfd4 |     
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/132377ff715bac2651622fd59c0c724276116868 | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6680155c9ff4d816e53b95d9f77c139e73db60d7 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/31a7c28a18de925f95819c15e6b77dc881f99af2 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6ebdac4ace06a6716fbb1843a22419e9154927bd | ORPH
   mips64    |       host-fatcat-1.1.1        | NOK | https://autobuild.buildroot.org/results/9834814e8d1575525dcdf7a8a2a42a0a9e8aff3c |     
loongarch64  | host-firmware-utils-86739f2... | NOK | https://autobuild.buildroot.org/results/5a7c0cfd8114c8d4a16638b1601d9f5ca37a09a1 |     
   armeb     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/af5c07d604c4cff306c23be48450855b814e0b14 |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5cb42360ea2412b5aeabb22cfe7a65d1aef8f55d | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4ad0fbb21d6b11276cabf4a41bd086492bbc7902 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/faba8445888c5a6da74757c5c5adfdd10d8db060 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/708a61eccfe31420d56320b7b3f87b486d54f754 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/e07092b05eb7558706421aa98a56802aa5478d0d | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f01e886b2b25c265ee7709fee9f8e13c2f7b6d14 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/48fcf86036b3ccf017148b908965404f91d40f7a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bc7017b13b0251d62e69f4d77551a23812099524 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a28dcd09a8fb94ba645b667b4dace73371b64467 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e03755b2c34a9b1ef53e3367f988053b5703e031 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b6d368641d32986d142a1d1e6c6588d662a7afc1 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7fbde40293a5ea0f410a04b88a0091f4f4e3bd80 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2974f3c83a3f9c5d96abf1fabe2cb880e80068c9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2953094067a194c31bd3626ad867f9c1caf890ef | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fc9d11ce3f0327d4a95b23282d7f329da3e65580 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fc17c2971ee644cfd96bec5d16e211649451d33e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c2399c837adaeb3cf2423ec097befa353d7c41e4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4b4215d5438657913f78103a722e278abaf1d73e | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/675376cefa8403380721f7999153f29830661347 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/815529c5d908a1e72025d370d56b2443e0b3dd96 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5e8305f608c8a71c18da0ea1da3023e88f5d8213 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/22be1f246737a8091f854a0700e54588676baf8f | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/47dc01e05b8eafea3761985ffe91034361f7dbfa | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1477333a8b7d1dff125ca5bc2a9fbc23ba7cf2d5 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a0c6c784b9291c594e3768d1b9861825fec0780 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a4a95cbb69de0ea471896c30b9e6e477e8571b0b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f3c254f099629af7537927cc4d2188811b6a9a5b | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/80692477bd857815e12afa7f65850413efd62ea8 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bd7501c965677dd50c3c47b5de33234425579610 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cf638048de5a4b3d08b1ec5eac10c0f48adf081e | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3536496669e6dd1d58596ff1d5aeffc033befe4a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2dcd5a87b36cf3f9075062fb05b4cea1e8fa0be4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8f8f8aa430b624987b5f5492efcf27ae97d64b9c | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5036f8d7c35ee459060cc7e33533d0c41f9b0684 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2c192847c3556b0dadff80cae0b03c3a24a9d620 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/87cf8dc4fe197e95046b8224401ce9b42320c5ac | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c59482e38e2215be6de3c2cb3e3cb15731dadf0 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8be5196a601d48a267927decfad27cfc1c7f8521 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c1fef8fd169c504e3a3bbcbd8be6e21f925b02d5 | ORPH
    arm      |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e21a5601d4792824ef416533294af2a690e74647 |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/89f8ea4cded43ad01dbff43579a32a4e7427e1d3 |     
loongarch64  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/2b1004c2d4ab56c26628dc25f1699c629b98081c |     
loongarch64  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/3d0b8605136ccfbaa06c93e5326fc9bd26d1bbc0 |     
loongarch64  |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/2f41e5efdbd0b55a635be7b8c1c807890570490f |     
  powerpc    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/498cc50bf70bdedd3c856b350224a1ca480d840c |     
  riscv32    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/ce547d86eeca54c3c670494d688b50accdcfffd2 |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/b3c4e1e051af0b19f2ba1b665fcff9c24717bf8e |     
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/a46fc070fa3fbcdcc3f50da2efafadeb4c4eed5c | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/87752f236a3420e5fb2578f4775ff2b47048512b | ORPH
   s390x     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/790feb5465edc796be6d7f37e2448fa22fc494d8 | ORPH
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/ffd5aa8b906b1c4299dbcf8b395637ac73eb86a8 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/5f440684a80d3625fb8706172b1bf9cb396d5894 |     
loongarch64  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/dca4bdec1aa7bd199b1135c47cae8681fea9e28f | ORPH
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/42b4ef174757500103895440a3029f016669a6d9 | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/74b05b72f2fff8727380544199a5a29f430e6e8b | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/8d14173f31922a737c326be75aa24c9f9471342a | ORPH
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/0f68444afb5146a25ac2659027826386b501f96d |     
    sh4a     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/1c1807c9c89b299fb848d4a1e1a1aa66e6103083 |     
    arc      |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/2975043dd2c9d537e7a5b5634e7ad047a7a08afc |     
    m68k     |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/08b1f4c3cf4eab80dbc8c913be56e726d7828cd4 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/be9dafc9a45aff28df980de59eb0475299062585 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/9c40c86a42882a6d56eb6d6d1418781a980b6f8f |     
    i486     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ded90370f8f86d8e57e75b33fe0fd272e53f8910 |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/3957fc955aeaabe46fee5b3f2bbffc030a6b0dde |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4a0c299e3dca4a8ff1cb4996874ba86471463181 |     
    i586     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/9c6e463109c2b9afa5816abdd5ff1378554b0858 |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f0f5b64b50fba5ea6d3590c76043f7c647e53697 |     
   mips64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c6385236747520d23d70ce8fca35c7959fd0741b |     
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/e7d919e028a32c81e2fd32b204ea8db8057882af |     
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/5218fba56d2df1a08b90eb9b37ad869151d5a827 |     
  mips64el   |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/530b2f2ab4829ebde4fe1894bc30b9bb927cd941 |     
loongarch64  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/ee539bffef9b95d824c2a4119f6208fe39ac9ce4 |     
 microblaze  |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/2f51ec6c997a47df3c5942ed6da5ef195f790668 | ORPH
 microblaze  |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/d0c04deaf3e33689ab2c27a10385806718bed32b |     
  mips64el   |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/1a05380627398fd189df72536bffe48b31349a6c |     
 aarch64_be  |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/56895d101220f4aeda9bd084dc9640071d33cba4 |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/1d5fda680508a7ebd8f2c8d53b317b3de1b73695 | ORPH
powerpc64le  |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/82bc7ac973a4fcad8f355e8777306c16d090b448 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/1babec64cc169fc3a1d660d0b1ff562f3e00f4a7 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/383e6391d69fe2fcd6269cdb8d2a6a863cd39b7b |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/8253c1192c0bb300d9b37fd0ebd5fd92d8ba00ef |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dc925b3f3e67e6dc42827d9ebcb59a419b9d5d18 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6e47b3ea585fa53b14bdda7563a6af72b10e4ba0 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1708217673b5fe4d605a91e17d9a4163312ee49b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ec28c4ce2eb8dc5c61ecdce2c85baa98ff97c3d4 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ad76921de77e72a95cf7c300d17ff5f23e3db1df |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cb2925d6a994ab93e68530d3799b1d751f1560df |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e56c68d7f380501f53bb24e63aca271cfffbadae |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c30fa8c1ee8de47d342e7ea397b0b48c331cf801 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3607a7cc05e782a3a104de11aebb171c7c3546fd |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d9cbf457d211b5b5aa3097256bf24f46840e2ae6 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/00a1412a9a2b6e7a44ca8a60609b12dc8b227b0c |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a6a91c369293c2797d012046b6d9e56095efd0f2 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/aa76fa68f7f8c33c8e42587dce9d724256d999c3 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b713a40f5719d2e1bf87f03e38ecc491689b1c02 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dc8b489a52c6e25ceaec54024948bdf6a123b101 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/541eae8a8a9f838a8a62431789c937d38ebdd552 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/07361eb42fee097a9cd8a7529c9690669582c638 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ded613a7f77fbf1cef882087546e9c9347de10c1 |     
powerpc64le  |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/92160350cf9ca067383051c8c95a9cf8a8bd4981 |     
  powerpc    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/03cafe6006e73d9ec256ac7fb8cd5aa15efb4c38 | ORPH
 microblaze  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/70b657521feeb11b8dafd5666dc33be06911c55e | ORPH
   mips64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/052260c12bf8d256c820df92a2616216c235e283 |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c8dbb4be5b1a845bde0668eedbf30446218735a8 |     
microblazeel |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b9db52a5da12fa358e308d715fc12c4a1594859a |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e97755e128793a99e6f12ed38c3eea7d4dbd862a |     
loongarch64  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/9052c67bcebdf1cc5e8b03259454eec113bebc60 | ORPH
  riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/9257f0ffe0f78bef77fe1eb90aa43d7cce2f700b | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/2412fee275a075895d2a9b076bc8a747548b3fdf | ORPH
 microblaze  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e10753d0941b25d6c3cc4f8c4d47cae0eec143e0 | ORPH
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/8cf176c132afe656f1c54ddf6b1cf083a83aa2c2 | ORPH
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/fbee6cd318d3dd072fb87b8752712a4a69d24eeb | ORPH
loongarch64  | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/34481b6961c4d435e6e2e8699ade236050aee058 |     
    mips     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/1ba00c00347c30b28da7d746fb8623beaa85b098 | ORPH
microblazeel |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/d3a11d6de5870586960238f836e6d193825686cc |     
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3f6b10203b1c784a7295e6098ad46fde12090754 | ORPH
  powerpc    |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/92aeec65ceca95cc853b81bf0f339b19c57e3fa5 | ORPH
   sh4aeb    |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/a405f9566093dd50202630435c50762a33472788 | ORPH
powerpc64le  |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/9b5d07cfd59297ab0cd9a8b5fe868c829db142f9 | ORPH
    i686     |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/ebc95f66127fd284b959279c306e54f911caddcf | ORPH
  mips64el   |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/5f5626f489b42ae3fcfc2d25bdaa23fe14085afe | ORPH
   sh4aeb    |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/3ce5d366c527e6c36a012c5bdb1a0ad143fcda4b | ORPH
    mips     |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/fb5b1a46057ee57dc6f6f2d81062cb158cb67a8c | ORPH
   xtensa    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/eb03672f1f22b3ffa37edc9ab2b6394780bcf0c4 | ORPH
 microblaze  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/4eacd4159564f890c1276414bda8d76f4b798e20 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/6b10e20ecb969a382d77c92ce57ece4bce105fe2 | ORPH
   x86_64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/553bb511e1660db9800dab554076dcb5afc5671c | ORPH
  sparc64    |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/7335b36309ac1bf8a9443f9b087613fa23d3fa15 | ORPH
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/0fcdfedab0cf2801c60ef9d2e16e949e2ea4de5c |     
   arceb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/d06aa84202bec4226316b7d246eaa6abd58c6012 |     
  aarch64    |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/b17f8b714d54a68b04302a93db28d57b2f396ef2 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/be0cbdedc781ffa18d8d752e014f241955a3eeca |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b72acf43ece7c590845eccbe136b74e85c9bcf14 |     
    sh4      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/39b6cb351e3bdb2fc914173adff2341ed8742156 | ORPH
   sh4eb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/7097586583014b3fe92374a49553159e0dbce5f4 | ORPH
    i686     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/43e0557cd5118876612295c6861270a108e4de99 | ORPH
   mipsel    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/59d33084124c23798e16051b062bdef17e6e0c90 |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4fedd8cda087fa2028868cc1ebd15a696aadd448 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ec979b93a1aa499970d8ffc2312d8fd6e943fa3c |     
    sh4      |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/95372a23f2c347b126f1b99c0acf5004b3aed8db |     
    mips     |         php-yaml-2.2.3         | NOK | https://autobuild.buildroot.org/results/e6a6cd5e2f250f2b71b4ca19919c611d7f9d87db | ORPH
   armeb     | psimd-072586a71b55b7f8c5841... | NOK | https://autobuild.buildroot.org/results/11c7f6e4d13b88823d061c63ebe585622eb68c7d |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ed0185fee32652e097cdb5e3093f841a3a86dea0 | ORPH
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/48d516eb0a211c048f7d52dd58b38370b3e3c4f0 |     
   sh4aeb    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/cc8fe3f288d1fd1eee7b9ba29a5b3690cf175314 |     
    sh4      |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/bfbd6239e4e927fc93b1c6d49ad0b066167ab244 |     
    i686     |          qemu-10.0.0           | NOK | https://autobuild.buildroot.org/results/335a238497dc51daacadc08f5f00cd0fd13eb897 |     
   armeb     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/646c42ccce4c3e602555473d4868ebc6d5034fdf | ORPH
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/2fc8ef11104ec85e01f728931d4c5e8fdbddf2f5 |     
  riscv64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/1a60dc7e96220f0dcc1530d0f604710c6b7a932b |     
   x86_64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/0f76cf1bc06717666925c541808b9374fa50a29f |     
   sparc     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/9e3b3dbcec6a219fd73ac2267c6c4fb94216356c |     
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/2526c42b1c2a3369cc5e267f33e7d1670029225d | ORPH
 powerpc64   |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/2ee3fb397362720909cda30c0c8943e105ff09ec | ORPH
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/491b1ae3b2f87ee56ec260ab367edfe80cf63696 | ORPH
 microblaze  |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/587af2ccb5cc41b89a1648b0d55e2ca65af5753b | ORPH
    or1k     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/489eccd264e2bec5a0a889155e0ae7567377d829 | ORPH
 microblaze  |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/a4dd4d90dfc7ce1b510f0176248614e98fb901fa | ORPH
   mipsel    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/cdee13efe59794638ab27f1499e86a5a91e5a2bd | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b4d330fb4cba3164a718aa4455198be5a241e62d |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f1fd839ca390fca5e6848b10b5bede72efa85d20 |     
   armeb     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/f0d013de3b09702d7631786e13a26ed31fcb5988 |     
   x86_64    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/de85f35c7f2761b8d78de10a6d93663f4167914d |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/e7da7e195e06f10ac77a33e320027423c0cf437b | ORPH
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/8de638240654285632a3d1b94ef73785b936ad68 | ORPH
  riscv32    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/72068295efb114fe9d2ec4fed886436086d83edc | ORPH
    or1k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/1886b8aa86bdc6c2f405a40bc244498fee39ad80 | ORPH
   x86_64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/aa58030dee060173f5a6e62b6de354c6d571a05a | ORPH
microblazeel |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/69d1f1371fae01d4d01add28cacfcee4d0eed232 |     
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/3143d6e29944ed1645e92667e64da6419a9b153d | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/5a87a4fb5fcf6d0e21026983f25a06a44b0b8caf | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/059732397147469079f79f18c239f2f1f6f291c1 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/2e25eaf4648b8a977dcd986761c3a4258ebf93fd | ORPH
   sparc     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/cb7958fe2939386be28fa934afa99053b54aa2d5 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/531f903f96d2d037dbe5e9747beccb0b982683ac | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/3a62cec66342df23e54f6af469c006b991b259a5 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/017f0f167c166bcb032c16780f9c60101dbab673 | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/f9cdb73772794ff08c346fee3d8b22a50cb56c52 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/c7d07fbfdca499c7bee8baa51ce49a00d76c8eb1 | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/0dec7d351f7c809111ee0c5d191a9f8ef5d4ba5e | ORPH


Classification of failures by reason for next
---------------------------------------------

                 host-gdb-15.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a2f55fb375a7e276650f95e92189cc49cd06ef17 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            host-binutils-2.42 | 1 
host-binutils-arc-2023.09-r... | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.0.0 | 1 
                 libmbus-0.8.0 | 1 
                liboauth-1.0.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a7f544ecff7f30154bdaaf9d9d136fe9dcf8bfc2 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/dfd2cbc7f3e87d001e4b548f0c20f93fb229dec9 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/a16912c3330654372a8c03d151c0e346e64fe4f9 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/224cd081693c40ad0e249c1941163454ce8ddbd5 |     
   mips64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/c24672e264abb09f6ba4a400911af64ec1af2298 | ORPH
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/7a70f5836ac89670d1d3a41ae5b8e36b8a467437 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 host-gdb-14.2 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d50cf2f7a3966a712b32bdf0ebdc0b36096835c3 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/dd7eb5a66b66e0f556708d10d28048ca47449bc2 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
