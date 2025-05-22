Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A10C54E65
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 03:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B21861340;
	Thu, 22 May 2025 03:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsTNDHluB7SJ; Thu, 22 May 2025 03:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA1E60C1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA1E60C1E;
	Thu, 22 May 2025 03:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D752614F
 for <buildroot@buildroot.org>; Thu, 22 May 2025 03:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4A2D41E06
 for <buildroot@buildroot.org>; Thu, 22 May 2025 03:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpXX3_1B1Yqn for <buildroot@buildroot.org>;
 Thu, 22 May 2025 03:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDB7F40442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDB7F40442
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDB7F40442
 for <buildroot@buildroot.org>; Thu, 22 May 2025 03:15:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-442d146a1aaso73774645e9.1
 for <buildroot@buildroot.org>; Wed, 21 May 2025 20:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747883724; x=1748488524;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PibM9abLjVsjXWj7ZfH3hFmkrBgRJVgXknxWmN6ybvY=;
 b=DqabJQvOthLXH9UFeUgknHcf+xatIoV9E/3b71toeFiV+zZMkLR2onuWi9JvBBLKw1
 55PCPWz78OwET3T7kLMpzkJF3DL2+0mkIEO029xC3qtexqPPR9xvFCDfrWDDLMcnkE6C
 BAOqqWF2TCWd1MwtCYz+iWrym5oPggkNNmEnMpxM2Q95NnQYYW4wcrI/3iZQtKtQ6hT3
 PprSiK+PJYBmPN5KEwz3FytVd7SdbGyEvY+pujDI4mZlRP0MRDwtEyicCuiUPoN+tHM/
 Fgj5wn4X+xyuOBvpIiI+xdZho37+M8565vUo5sHwRpC9PE2P5NVU+QOZUhpI9EAWB+jc
 dqug==
X-Gm-Message-State: AOJu0YxORWXjuktT2aXLH5bJlhxfLqNP7inkgtP0jZQc1kIqYb/czuYD
 qOcWMm9JN069fYMjNWDr5Iz+378HyVzeRyr9nv0ltRjdl6c6a/EeQxDW3EwZfA==
X-Gm-Gg: ASbGncucUV5LCKqUCk2s31aOVzUxJrlJNGubvZ1DEtk+dXgwYFj6o5WlCFFICRsMhWN
 4ypkKrhE++PAlr9C2g3wuVcoYtz9/g8Rl6oZIDsg+ITfQybtZy+VXw6Tu1kWIdFdd8GQAT18Ybc
 g0xp3R1mNxZqMwTuOjp7eBxRpTGRdZAB53CpKonKdvhoOedQrE+HMfbZNET4wc04WgzVZfBRcMW
 FWrTlg0e1lBucTNxewbp0DZbwekBIa9Me22ZAulKwyDQjQp7xcR6QUKmLRGZrX5wUY0buvjcZWR
 l1SKupKEiXfJvZKYtW+yP2yhzzfR4tr08O74H+/49ZiVE/awcV5wV94=
X-Google-Smtp-Source: AGHT+IFhHNFIXeFKjvar9fwvl4BZiKa2fmAEknR4zTUmbGFhLgYmcxGzBnln93bFILNdJsjSQ8lqNQ==
X-Received: by 2002:a05:600c:3e10:b0:43d:3df:42d8 with SMTP id
 5b1f17b1804b1-442fefd780fmr201533435e9.6.1747883723155; 
 Wed, 21 May 2025 20:15:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1ef0ac6sm89939875e9.15.2025.05.21.20.15.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 20:15:22 -0700 (PDT)
Message-ID: <682e96ca.050a0220.2e5715.ead8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 22 May 2025 03:15:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747883724; x=1748488524; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PibM9abLjVsjXWj7ZfH3hFmkrBgRJVgXknxWmN6ybvY=;
 b=CdJKU0RttEj1q0mmvED5Uu/TY8nrQd6LQ8GmTHaNp6P0UOTo3/eRs32Cpru8YQ5nwP
 RtqcK3NcswrPPWcOE0EFskWcDR11pxQBHyQdBGFWBWdsFnZATWnIxAlTT87yuZ2I2qKg
 6iifaoQsK8G9RSpyVp79Tde6Knk1MaOD8YXK/e94AQAbe+MDgU4jMS841gPKyq9E/J56
 HUwd5yd5umJyIH/Db5MJC/oMp71pkhnaRtfOI28joa6qny0rJibXcqiEjjGVTclIVJdk
 pFgeM8FMgji6l1COYRtFU6mYkYIrfPEwDC7HrKxeA9OFkhI+p31K9Q0D2JvwgP9N4emP
 zImg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CdJKU0Rt
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-21
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

Autobuild statistics for 2025-05-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  3  |  0  |  8  |
    master   | 13  | 519 |  0  | 532 |
     next    |  3  |  9  |  0  | 12  |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 90
                       unknown | 58
          host-binutils-2.43.1 | 55
host-gobject-introspection-... | 43
                    bmx7-7.1.1 | 28
                  bcg729-1.1.1 | 25
              libselinux-3.8.1 | 22
                      lzo-2.10 | 16
               bctoolbox-4.4.8 | 12
          host-oniguruma-6.9.9 | 11
                 openal-1.22.0 | 10
host-binutils-arc-2023.09-r... | 9 
                elfutils-0.192 | 8 
            host-binutils-2.42 | 8 
         host-mariadb-10.11.11 | 8 
              host-rust-1.86.0 | 6 
               host-vde2-2.3.3 | 6 
                 apitrace-10.0 | 4 
                  libftdi1-1.5 | 4 
                 libsoxr-0.1.3 | 4 
amazon-ecr-credential-helpe... | 3 
               asterisk-22.3.0 | 3 
                   avrdude-8.0 | 3 
             berkeleydb-5.3.28 | 3 
                  cjson-1.7.18 | 3 
           ghostscript-10.05.1 | 3 
            host-libp11-0.4.12 | 3 
             libopenmpt-0.7.13 | 3 
                  linux-6.14.6 | 3 
                   perl-5.40.2 | 3 
                python3-3.13.3 | 3 
           at-spi2-core-2.50.0 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
        host-berkeleydb-5.3.28 | 2 
 host-softether-4.30-9700-beta | 2 
              libopenssl-3.5.0 | 2 
                libsepol-3.8.1 | 2 
                libssh2-1.11.0 | 2 
      passt-2025_02_17.a1e48a0 | 2 
                    polkit-125 | 2 
               pulseaudio-17.0 | 2 
                     unzip-6.0 | 2 
          aardvark-dns-v1.14.0 | 1 
                  acpid-2.0.34 | 1 
                    azmq-1.0.3 | 1 
   azure-iot-sdk-c-LTS_03_2025 | 1 
                    bat-0.25.0 | 1 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
                   crun-1.18.2 | 1 
                   duma-2.5.21 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.82.0 | 1 
                 hddtemp-0.4.3 | 1 
                 hidapi-0.14.0 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
              host-swipl-9.2.8 | 1 
               host-yasm-1.3.0 | 1 
                libdrm-2.4.124 | 1 
              libebur128-1.2.6 | 1 
                libesmtp-1.1.0 | 1 
                liblinear-2.48 | 1 
                 libspdm-3.5.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              mariadb-10.11.11 | 1 
                 netsnmp-5.9.4 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.29 | 1 
                openssh-10.0p1 | 1 
                    proj-9.5.1 | 1 
                   s6-2.13.1.0 | 1 
          sane-airscan-0.99.33 | 1 
       shadowsocks-libev-3.3.5 | 1 
                 sudo-1.9.15p5 | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/9e4134a31c918a88db18e22756efe74677aaa840 | ORPH
    sh4      |          acpid-2.0.34          | NOK | https://autobuild.buildroot.org/results/0d542f61a43c7a5344d43a0819f3e0e8b4ea61a8 | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/aeba56eed4232791aa1389238625f042ba68e2f9 | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/25302314f4af5bb09d79f96f70bb6544bb927510 | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/45d7f0cafbab7dd41deb022d288e674cde038c4e | ORPH
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/885bcb75c42cd1a16062107e9a426fba680ac195 |     
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/f0292c289e28ce9780eccc93f28de7e9fe78afa5 |     
  aarch64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/7fadea5e5782aaa578c7cc73a9f1519bb8662919 |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/4f1f6a10b5bfa4bfa747d49c84473f619481adfd |     
 aarch64_be  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/324e76542233b62c0ecacbf62839bdb64d076935 |     
 aarch64_be  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/69e2fe4002e1b410521d122e21cb950b3a262290 |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/f352ae0a53838e2bd46502e9d26886bfc7768d9d |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d94d935cf6bef1b05d2d3d819e5bfaf4b1edeaec |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e5afd922fa39abc8d1933396a33d25eabe8eb5b2 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4a7c413c6f18a8303f95e480f0108c77daa3cc82 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/a0b606ac9434aa0bb180403023ebc1f019272803 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/93ee9c92e5f4e2c00ab82fd7c3e67f6240d5ae52 |     
   sh4eb     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/5e46081034dc016289bb9ca4cc96a1758d347c31 |     
   sh4eb     |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/246acc5711b1de0a0a014b254d240f4e24ea98de |     
powerpc64le  |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/5787d299a9116ed449bdf1bbc691687a585b884b |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/07d597cde4aad0636d4a411f3be29de10985a075 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5582b701da4835a6dada0fa75a119728e3b83d79 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/74e113ef10353522f686a5bdebf28b499f4ba10a |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b42fddbe26183e9fcec29b50907b99f69d3cac2c |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f56d3954b720cce43f8064d516a0e3bfea2af6ae |     
    sh4a     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0039f325fd60ea5354923d089348255b4b070aa4 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0a3c7f16bb17d7453ae9563f38ac514a4761cd38 |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5ca73dc1a521c5c2b36187002c4306a9254009c8 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/590376a842eedaa8fb9c24cf2c072b3befb28f13 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/881d00e9f8f609a3595d4d4dec0f7408c138a0de |     
   sh4eb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/35d5c53575777faff7f27a92add80370852324a3 |     
  riscv32    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bd68f1e7d0ae3ec1536f1507e3c58d72e54617bb |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/aa32cad1d118a0ad3e08f2e104d445a1cc1afd42 |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/cf75a2e023635244966c791c11a878f111886613 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3859edd127fb0039d4ee454511e4e3c402b9f92f |     
powerpc64le  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/98d29d69d8200367ef467352b4cc9d2016906e83 |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/38780f68d383ca842ae739fc789cf160002ef11d |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5f1cc43c2d39b2fb918ad5d820d1a0d1d1b320f7 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/26fb0d3177bd4000183e81e29ea9f060f404eccd |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/fb77980c1deabc8a6d5366f655e88a6232a788d0 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/29880bbbe9de5d82fda060d66ebaeaae40214764 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ed962769f2e48fa92fb816c1fc9790db471dc68c |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0a98d4052bbb3288ba66a21b47a9ac3042f5a3a5 |     
powerpc64le  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9e3c1e832bd7d415d3bbb4ad6166968c6d4a3aa0 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9500fb8c544c4dde134da1c5311ad9b4e6757d6a |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6f2e321145aca8ba354008168767013b9a3ead0c |     
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9c9b58838803e12fcca11a1c1af4b6f6a4646574 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d9baeeef2e7d98f24aeddb9d63183b2ecf5406c5 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7e5c34b229cf81be715f0dc56e399dc57aadc255 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ff01166259846c009636e2d75c7f9da36abfe67a | ORPH
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/01d38aac52ea429f1c2fb8fd7415da6c9e8b063b | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2f50fc6f117533379b73034d786df49189efdae2 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6f422707af5037a9d599d3914e4f99582b33d076 | ORPH
   sh4eb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/162e0e49bcdb462d820242a1ee4b208d8642f4c8 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3f377eff130ec794c3442d1d42ccdaf36cc0afce | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0b50c57b10ea676492b7a9b21f7d568a5e25a8c3 | ORPH
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c8614ae85b36a48a67e73377ca242f37b662a899 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ed2c99efd5253da5463d93ce9ee6c8c44f2b1fbb | ORPH
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/9f955a2f195749ec745cc49c992a78d8f73ef33d |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/4bc1c49fa8fe33405b88c090a8593314521814ea | ORPH
   sh4aeb    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/2c7701ecd1e15fa53bf833cafd2f884fc3d9460f | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/45bc5208784dae989b6787d2dfdb2dead284bb3b | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ed73e0baea6bd5f9c17315ad2e3a65e1ecfd1150 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/86248d0c5fe95d30ad5d216b446396a5ae6ccb6c | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d064f705f129c56ecb64072b7c12df760126f4f2 | ORPH
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4f4f975fb569a44bc18e807a905efed024776110 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3ab6152299a2a7fabab45f6bfcf3b6db893b160a | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/05b9dd868f56a643cf9be02292ae01d665bb4214 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8a0359928a65a0b7b29643b3c05b323cc1064d95 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/210e244902b467102bd070057ab07475accaeba3 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8941814cdb6390ae6a14cb92611f6b348ad35439 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2800f95895950bd9ae070c34a4dd25865d42fb8a | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c66c3bf061419f89271aeaa442ae28edfd70cb45 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1abb5b0aa0829568f1c4fc0e05e369d788864a71 | ORPH
   arceb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e71f3d989168cdb83bf1cccd18cd490e59c8af41 | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f71167758a6fbf2be8cc785fe3d8ecdf817af315 | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/59011a22163ad7534168f8913429f5e7b69f0e33 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3cc7c696dda1bf65f52351607a7024f222cb8a2d | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/03c10a10c437ef86f0915b51a03f6c70e24c7b33 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/174d136372829d6ffc9b99ac0163e0b6475e4141 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ca651d0dc2c799c7af97c9bf870cb834ebf3e72f | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ef59c1f49b34b3223f47b4b12cc5e6943f60ebd8 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3e843f18bc87cd2e612ae142a4c80fc00568fbba | ORPH
  riscv32    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/39a02af18fe7392f28ff9faa77a709a68cce127b | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/67a6a36f7ec2d1a97116c87150bda5f27e8fc0fe | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4632b47fea3198789e0bc11fb81bf901091e234b | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2d95ac6a7ccc70b9e0a478e103e7ed73e7063080 | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2fcf2caccb8a4aa84f45ff6c310af115df8e47d6 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0bd9e072f5e5c8e6c62da07519964078546fe323 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/59a8556e065dc6cd0f79f737ffe89f48ac2ab748 | ORPH
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/7c75f227f37590834b51b04a3f756ca9d995acbd |     
    i586     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/bd83bb6501e36423033c6595f137ec75ad802bde |     
  aarch64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/25c6b7b113f2e1afd88aea6f8e6614be38dde681 |     
 aarch64_be  |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/2950acae40d88922040be9477e3c7d0e730b867d |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/860aba003c9eae90e704d4affe8c8a0d96d68d2e | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e5aa04bfc142d684f828717df75bd8b4dbfda622 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d418d40ce1a0e0c3892f00212a1a2a377f34ee94 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ce8e32ecf770470d55094b94381f3b931454daa9 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/17cfd673421fd3fd7605d3da7c60019432fda694 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/32b7ebdc426020bc4aab208533271859e160fc20 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0d6294b7c8ddf899d530ed95f00efcac920e7b99 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ad79e9b25c8ca6e1b1705b27bb0acde013a77869 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/52792267088353e326635bb777f0d11ce1709ada | ORPH
 microblaze  |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/8d6620cef5fccb761a88d284e56d2a98852cfc13 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2f7a33d38f61bd0e630580cbd31e09af361ede94 | ORPH
   armeb     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/1ef4e8f3e1100398bc5137ed4d93d798b4b235f2 |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/68e0fc590b8572dcf13826da3830ca71f1a2c3a9 |     
    arm      |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/fd5a2a288a88512b0b88dcab7aea3e9d0493a275 |     
    sh4a     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/12aede8686417508a814592e7276d98d34dd2d71 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/5d7a0137baa93a0a32aaa6f09a4455568e44fe01 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5a0a5982905e7d31641fb9b9b3d3a044bbe3440d | ORPH
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/a20076205fcd177b58424b18d288a84694065cdd |     
  powerpc    |         hidapi-0.14.0          | NOK | https://autobuild.buildroot.org/results/a301cfe118382417b8e4879a15f877a7a951a59d | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/53cb3b76c9ccb5b4bd69159f5e73cb43252e9c64 |     
   sh4eb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/b4c2c34f05c6cc384cbc657cb096b095fb22f3e0 | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/4df9bce7bc2dde487d1628531e03c8949157502b | ORPH
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fabfdd923794a3d3f6e524e999a2ac71a9d29de2 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9d52ba629fdca244243b3a1f5c554132ac482f9d |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/56b6ae78c9dde1583e5faa5da8869fae366ed175 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/cc6b1554427e8d57d2db787677da309dd36c1a3d |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/465fc0657079dbbefddf372615fdcbf0d27d84d8 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/55a73a145e25525fcfc4f98ac3cf279927f6bec8 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4fef705023733b5c85d47308b3b4fc323a723a0e |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2a123ff803925f7e078743b1936aa36bdc408400 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4d71b359bef758ff4681c6109f2392e0b4e30021 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/046747c9e9e379b490b3a45eee00d524913e84be |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5c39354ed2925779d2d3338b6005ae4e45b6e7c6 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7e702f6e4e573b7cf13c953ec8f1e72eb68d9246 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a9e5f46d438f8d42385904a21b20ce912b5471f0 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4340fcca51ef8e9ce22453e8c5785684d89abecf |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/989891324dd01391ea1116a6f264f8f3788fac11 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a5aebcd3017e93a4d55af24ba9e01837b9b3ab68 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/af833645a4ec6b622938b3848f11d3b4493fa9af |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/122569dfd2a0da0bd073bc1e69b21d63c5d23f2d |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cf4c0d57d3010fd0333eb0c5a1d933e1391a7f83 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4ba5baf480724c598aaa85e7c69d5c95c7dc4307 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/da99f1194e80212b48da2e7d2ecaa26dd289b283 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e805f4e788ec39ec2482dd36d7a4321486115638 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/faf0a83e11e649de3967fc3069b7acb346fa5dea |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a6ef057c6aa624c40a712649e46dce505e063b4b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6283d5bb1a04c682fb2760e376af2e7aa61165d1 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1740ef5ad7e4d17913dc2fb3bd778de47a85af5b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/165beb538e93c123c036aa9bd2183f2296d9bdfe |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/59f82554631c34c269f829a89236883b982cb006 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ec4e8b2cfa5aa14d35565ac9f52bbc359300386e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dc0c55115968fa23014825698df2247700494789 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9d1bbd34c7bf74339253091d4de031023141c551 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/86e1226f7ad4d5e36e17ff7c7c68c343f137d6ce |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fbeec3745f0d2da7dee10dfdb4a3dc7ab4414900 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aeb7f8cd48294854ef9fcb1b7946f32136c3f299 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b212bb846e863d9e14c2e4b619fc3981fd09b2c4 |     
    i586     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/74e4959ed6560b64467e974373c649f13b15ab9b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/67eb54b23ff0a30a5d3fb8eff44a17ab7e55698d |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f11743368e16ad7b8d29fb96b728ba81f3e470ca |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/808cdb388c1a142b002c0ec6e05eb5cb3d97bace |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/54c8bf0b509b17998135675269c6e3e3da10379a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fd0bb9a276fb590fbf429eb2359620bc2c744051 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/517695837b591bfef222c93f728d655593261d6b |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e3127b1563bba175b21b6f0af315ed01f5fe1c18 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7903e86d7331d46329a9549f1a3de4de816cc668 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/527ad6daadd5cea04776bdb57bc7610e0eb3553d |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/431e248f7fafad8f0f009f9cf272b9f33d26aefb |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a09099dbea2fdd811cbf875e786ca824f31d2146 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/be526a0cfd6e0aa47ab0b38384cb92da8b5a46b7 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/af75f6e80fe9d0df743efcce2fb7c7e1871d231e |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2ecb41c5eb51da4daff2c3c9cd83ad320b96ab67 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ec3469db92ba4b6f4611a30c898a87346b836e61 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5d9446db69a3c392fc85b62559e35b30eca8c6c6 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4be4002a12d068006ea14787f836376640db0411 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/87c6748d4d838c0fbba36c9381e4f3774bd9c801 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/da49cefd84c5467a6845413e7af3389caa116066 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c82f1c977c282219cd0e14d865d4599b319f4ad4 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cf0746dd24b6a7cd9cc5d70645a10162a3503750 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8adaddb1bca37ccca474eb0f3d6e420c83ba6dcc |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a3a5fb6397307a1ab9c7275ef32ccb5baca9ca21 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5c7199b2fc3e05b6c2952f8f18938dabeeec6234 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/86cff27d9900ab9f1cfa8c0c67f89c0a652f4e3c |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/328c64d262e8a74bf25b0856780d3c66d7eceb5c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e86bc26c29ebfb981b95b0e41fc029cd7b2667c9 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e3c68af64bd8d88f19a1cb3a94b405631b6f3546 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b4815d2979056feeae953e1a5e1945d7d5278791 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8516094b0193de7a7a49b968913ebe1e5437c6d6 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4f051704a982aaeef1bf80698a1930e05362dd0e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/264a1adaeccea43460e6133610a964cc97a3f434 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6b89db38414b19b279753d4cf154a5364c3837f4 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2d3f5c23c913b9e7d8243ca942276cd05bbb878e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/fa8eeb5b14797199cbad31a68df269744a42c0c1 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/7085e60df38c0406a615562832e2677a803a8251 |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/21148bcfd39ec2f62be4f9dea04beae6a075f9ad | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f51cf6375ddbb05e10f1622b138bfa6a20d681d2 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5b65a2a3c2133d450a070a4615750801429e0eaa | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/729248e9c8147023ddb26199b5562d4541611444 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/719d52461e28619ab29c439587b06adb94bb4963 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d36a4298ec3c1515ebceeb2427de60959e5e65e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/78b4b1fb9ef9fc87cea40fd2f3969c184aeab0a9 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/819e81c5e63b1970d50c62b300d20c898d1a704c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/650236c8ffa6c07cb120756891f47e4da0340578 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/454f13b9b51e37781eefb33ef6ed07c5fa5e5f1c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/49cd414a13b11a3ae210502fe03c74d759e724a2 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d374abdf3038eed4721ba03a23ca34b99f943c3 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3e6520c78fe381116977e10e900d2f923114504a | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ccef1d64fe83d9c9f8b754a641cd2671f1b1834 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d7be8b871bcea37154cf57eb4b0f02e1b6888d54 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a37997617ad61e30db0b4ca105ff45e0398a90a | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/77a6ddf98f62892f4307f7a4ef510428b523eecd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/68fbe12e37f78b78e67d8b3d79ace38866f6a135 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c48abc5ce0a33064349bfab4ee56cb4b1bec27e5 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cf222804a239e33506c4b121aa004473ba12e9d8 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ec4152c5dc3cc5a1073f2ccc7937367afbb9afe2 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/24ae2733055597fd35207c4bae2db29d8f2b1fc4 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a7aa69843adac0f5183510898d9386cbafbc2a96 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/513c1e65b2698ada81fde796b2bfa6d91b46b75f | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9efc8270d97f8e0cbaf0408a241880cca14028be | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb350c5369d2eb4118d272fa909465f9d3a49531 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6309cf23d58b2b0283c01e9307b572334590c349 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bca18f564c2c6dc0cc272a1087642381b3208811 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aa319fabd15781c3fec32a91b0e62ce15e0cbf75 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/17473152e9adc398213880aa6a71e21c4b5f9615 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63073655a60409db12ded400dcee84ef32b156cc | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c9b56ec9add0a576d1498c11eac606e025a5e144 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/101772bc03cb0e837222e24a71eb7a7fa099c1c9 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/304653ef0c8041e72e88d2e4ce15ce989fa65248 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e1dc8c9522de1f3ce99c32fa690ccbc9e3ca061e | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f09979a16b804a48a072f29398ad2ee6d8ca0691 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/013c26d31570c22fe2bc8c8733b1d4a1eb3916c3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a88a2e21e0052edd0bfe3d12ec32d4e0137c9a57 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/81165c0f1f26c111e0b0d877b39583be6b67a1af | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7222b381c590fab353bdf54d3575b631e3827d9a | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7bb60c93b3afbd435f693f79f55fc4ea801fcbe | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cd5d198949230fd75189f79f369be7a6f6fa229a | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b5c15bae8939514b6252074a1fabb48bdb0edb82 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/af6824e266e848e65dbd86cd27a24699d68440ff | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f55231c65fd0eda6f231741ba42829d00a175e9b | ORPH
   sh4eb     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/aaeb445c243c1d7e9f8bfb6911232c8ddfc04fd7 | ORPH
   xtensa    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/06208488355caf8cee5427b74612f9783b7cb34f | ORPH
 microblaze  |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/4bc031d001dcbf78aedf59bb5219de6e26b2df83 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7361ed38dddb04ae84e3f7636773c70a739f6fd3 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c266525c17be2d646871d2ce8e3ec4516be9b200 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/186e44078064a313e1a97cd8232cde6e9a5a817d | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d4e0f022d96306e6bc1e4df837b654ba8fbf5edc | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/afa16996a4f20aa1a63731a6dcd12132782d5263 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/79cfe5df09a0b51767cd599ac80113af540555a8 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a56eb61fddcb4dd1293d2a2b7d242f9b100a9790 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f46303db200932b9275e457d3912e5fb460c9316 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f18dcceafb46a624973c5f413c33ce2e0be02592 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/26f35c33d808deb6c4de400d7efccc3e33ba358a | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c81d0d47e64c164772e848b10b44c9b3c165337d | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/97f8fe10044834f71c6e0bbddcc9194d982721fe | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a2c0fba0e6b0f5389acada22c07dc1e24b494468 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1d6b668a25d60155ee7be48c0dd6690ce0f6da6e | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6751c4e2372939a45f8f83b6ca33608e1b5827a3 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e89e0f9b632f87532aeb12965c4eaffc2d6148d6 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/82cce3bb73f5935828971836070037b43a969341 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4680dba8faaca648d51bd827d240292ea10eb48e | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/af98e4dca3a50e9f10e3c2e2b78745f2f6cdfb50 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/39a75d25006c1f2f3aa0d983d88a62d4111a1927 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/35167dc8ffb46bb397e998f102fce07bbb92dbf1 | ORPH
    sh4a     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/017afda65050afa47fef0a1934cc86651d7da858 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/48e97ae099c7778339a71b1f284ec926dea65fe6 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7df63b7405791ff75fcd8b3410db43f0f4c06696 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/80d803af4c19e3a046840f19e554084b4907f063 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e4d131a20ebdb3e60d6a396cdcd15614a8b09ffb | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4dadfb01b59fcd8c21184d35ced456c424704d79 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/eac8a0935f5abcba0f6ddb25ebf10fcc34abd4c0 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3b79fc21c4d942cbb933d6024489900c318becbe | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f4c8b8c10d54a17f9c624572e0e166e3d945e923 | ORPH
   sh4aeb    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b3be96a447b1dc959677f9b8c3ad4586375eeafd | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e4cd3689b19c4df1ddd240d72d6c151a5c533201 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ca9428e6da1ec07038ea1d6e472c101b49dec370 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2e33d82c2cfcb168a9f5f98d5b4d0b93db694566 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/88a39d057e892bb362752cad356e4d217f7e0ac3 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9186e56860bebca6397fe21cdacea860785484a8 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5ee917b21aa4b06048c60241407333ac7f671ed0 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6a7887d93f0d1bc4696a6c434ab3b0a73670b4c7 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e1fb5557b469ac58f8367261311e4fff34ce51aa | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fbd039fee37f0120ea8c11363d9c3cc82612b4fe | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/91033203116db9a6e44fda84580dd5402e64e005 | ORPH
    sh4      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/494add2ac8977148d8f7d0ed1fed557af9ad2697 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8e5a40d1f8952bd927ab88a97de1b70419ae6c6e | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/185c33408697df46b5be7c3fd6ef93f00dc6891a | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b77112f6f4a60a99deaceda2fbb635fda7e94632 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0e3955e385272fb6989ccf8c9a49e9b94aa5aeff | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1abfab2546078020ded5ff55311298cae6ffd3e4 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ff204bd5ddc84adbebefcee521ff251b26b2388a | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5cdf9badc7272c99905680e63add207dc16593dc | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1f976f640bef0b3d3b01ba2d04d0cca82c5c91fb | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c748af756dd0c8dc983eb43dd1ac085f9b1034bb | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7b0865175c41908975e7101be277fed215e42f9a | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7802a348bf6f3520bb8c9e17ac49b48d1cca7ee6 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/98185214d3bafea426e50732872973176c2bdb85 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4bd2d4b5e80a4d9457f48400476ae59c74ae9b73 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/20a14fe5e9b977ae64e4338d5fceffee48853db7 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/bacc32eb95386e52fa3f7c9c62a2c215f1d0ef4b | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ac3482f7827388146684442c6c15fbe70c793c43 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2072b97f2c585a3e3d8cf761628e587947f83709 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dfa43d6cbad1a2312849d71c6dd1af5c537d9035 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c07fd7fc52682f2b547cfb77f98c352eb14c17d2 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b27278a52821c9f48b9b6699b1ce03308a2f72f6 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e8755179f929e55593df0b6c7ddcd60baed2a797 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aba68e0889b66300f87706e15ff34899d3e1e97f | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e7ba66647c16507f2d55fd67dd38ad8d63ca40e9 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5f6f1abf659e1fe6c4072b7961c2ea753189e349 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7038b349a02a93acf205940930bce1dc8e0ea198 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/014aa4fd043cf7b7c50790ae8e63b58fc491bf56 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/24edda22be0f64a69dc2a405fddb3d38de131870 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/836b4d3c3f467132fbd37976ea99e6fc15af8acd | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1fbe11161f6c6ec68bf35ac5adbc9d033dffd720 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6c903781f56794b8553e9695a03f5b87857e9b2d | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5ee96884ba5a76f9743a496838a000e1b6439b52 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e80b87a3d79b2e42c0c093888ecebc615c0d103b | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ef1501138daa905db7fd0f17ca071473fd642a5d | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/14cd67a8605e3748a554afeb541bd1bad52d768e | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4dc1d8ddafe10b9b583b4cfc4e777a09f9989b36 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/610106cbbf6a7a1205a10a6bd01130e2043c715c | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/982699bc8d6a3784f7f696d00c59a755c8d517aa | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aa764168011c079fbb9082ceead255de691d8391 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e79b55238da10534692e5f8d0e7f9df249902664 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/731f99ea3c3ab0e02c8db714cca18eb41560a1b5 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ab4586d3775b3947ee3e5e86c3521cf9606911de | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/074597e364fcccffa2a5a56f61a7b1972a298e3e | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/64ce3f0adb9770e8fe92fc5ef1ee45370126f119 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d09ac758b4328ec48b872e66036cd46f7e3e2d14 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3e4cf8c687377283ce7b45805e49517bad7a3aad | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/36a548768f8eb46b3d604db07d1ff001c2c15dfc | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e8cd9e23b8a5f0e4002c50c70ba209439a44c8bb | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/27624a1eaa6fa55a29d4bfff1aa61ff8e53611ed | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/e563787eb1f9a5e57d9701c204e8c6cc62e422e4 | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/67ea8f9048876b4809a0285d7ac9fb2dc9cdd81b | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/fdff1c8b4a3a073743ab28b6e3a8aff9b2443748 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/481f1efcfae01d8401039da4b07ea65b56720fc1 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b0cc769d3014f6476458a1d2e11ac82a11f457f8 | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/217e2094e992809b24aee2356f7a604623a9c51e | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/30284b30b42378e7df6775fbd1069d02434dd9a3 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/ccd3d810c3ab7f8eccc80e668ce0cd82b0275d22 | ORPH
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e90859f2551e06da99f041cff2b18e640f7b1894 |     
powerpc64le  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/0cc6b3442af7b39477332dfce538cecb63da6b82 |     
   x86_64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/bc473c232a923194ec5f407c938bf3826f31c925 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ba3bedbdd242df0cc202cc755f19f3b00421e0df |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/976631305c5c3f534aaa60932221979152d88112 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f3ff826887ed3d3bc738de6a1cabd0eb0a9c8155 |     
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/0274a78b8a83270a67b0e67ee578707305a2f4ee |     
 aarch64_be  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/50206b6b08965d66bddff7df035901f34afe1aa3 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/76cd7dafd364589c4490225fca406df6888355ff |     
   mips64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/b996840d48c3c0b870791939ad66d77ed5ff5387 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/69e066825d36c619f6ecedd9f0be94a17334366b |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/fe17417645809d2b2610a6d8ba4e02cd27593f28 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/e1f236e2f37c10455e5a6a2ac312b5886a0b6e6d |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/7a20e4c8389cc560234f1606ad0b2808b1b65fb4 |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/18bf4ed95fa5c7bc1653e552d843bf89dd85ddce |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/5499d4b4dd33056fca7753e426449ab3944f38a4 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/d6988dbad7380665404546903427c73588ef4e38 |     
    i686     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/ab81070345d664107820319f7cfba3050df274ba | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/8bb249c62d6af974ee2ee826b0e265fa6759cfcb | ORPH
    i686     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/fd84db1f17db63bc77b8692ea7b74ce2a950fdc9 |     
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/3442db225fadef89eaf21b69410abcbd667cb9a9 | ORPH
  riscv64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/6251020a2cfb7965f9868d51f807d5c8070d2d8b | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/14765a1ee8571423c0065e8abd88afbe4637ef4f | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2459cdb1ef44ba229c3c2e1bb8b37482e68465db | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2889ec471a1c51958aee5c6b14a32152b26dc061 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/600c5e8425f55e564432333c406ba29855068454 | ORPH
   s390x     |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/b507f9d9e2f72380faee588875d2ae014e2fe652 | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/43a7ccbb328faea9fa7f211f9093260ab0b10e52 |     
   armeb     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/44dafb444f9116e994033b04e830ef915ac89f9a |     
   s390x     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/0111e3508878b9615989a8db1da0f51bcb0c01e0 | ORPH
 microblaze  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/9a08c678986a156f4172be6db125240b168c61b9 |     
microblazeel |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/a70e7f5a0dd4f5254ecd196f1ede5521076b91aa |     
 aarch64_be  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/2a4673ff4e76e76381e9deb864867380d0a6a32c |     
microblazeel |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/e366f41467ced5297d90174f0dc2415f23d36943 |     
  sparc64    |         liblinear-2.48         | NOK | https://autobuild.buildroot.org/results/34ce97f940eb0ac4e36a62f7abef95b0ba56ccd2 |     
 microblaze  |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/52466f5c6ab43e397106a8964d75fb6e934778b5 |     
    i686     |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/73fb3e5415316d7dd782ccd51f5c4e076217b684 |     
 aarch64_be  |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/ce14b15fe764b028e0a192fd3abd6d30f3d11da3 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/ea8b6035c77504f998203df03324d4549e41f4d1 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/ec472e6190a9a375996b98589d348e72a0d2e527 | ORPH
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/eaff8954e2dc9a221f396be11368b65600b075f4 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/56863dd172488031af2571216725ac1b1e02e3f3 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e4d0d0562bfd0474662f21267727bb616a8e52ad |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3ea1ab8b919c9c6c4fc5f058fce2d2067540c7c2 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5e2a805e06b65ff94c8419471ae34c2eceaa0f16 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e57255a48634532b826e100d6321e16ff22a7e73 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1d30884baf2b0cf28ed0f7f523772c88cbf74cd7 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d7e1b05f0922dbd28ba7df2bc4915c41c98677f2 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3ab0a2b3beabf85a9ef0b9dd4e0a6df8eaf5acd0 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f89dbad4e0624373eb55fcb277f6da0a1fdac5f9 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b8fe956d04c1462a98d3bb629c1eb51c26547882 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2018c260217fdb7279587299440dca0e72e06e48 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1a90571076a6a5551108292e874df0f78246ff3a |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/07f0579d7cf88e683f8671604091b8d4ec013385 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/92bbdf796299114db999cba167e2ddf201fd96be |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c1a986583368a54545e979ba6fcfbcc901d07852 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a41bba560ec81a6776acd1075ef4274397d7f437 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bffc9e73962435b8d2f4f94aba41d22b8392433a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8d9edc7a4c43d5adff30d305dec265fd8c806a64 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c2a8677e7c319fa30025009877e95e3bbec2876d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5e3e9ff31e9d2000110e76b3948a5a8a61db4087 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fcadd9cc5635156a6257873bf3959e2fac553535 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/f25027c12d82d4b8c80c3313588b0ae384c698cf |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/0af2cc0bf46b78d10a2b57c470454aca376afe35 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/964b5badee24ceb511113589fdcddde83afe5dcf |     
  powerpc    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/1b50790fa1a74d2b77c8a8840f5f5cf14bf1ef5d |     
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/dca1428bac0582271e54d2099fd98335373a17f7 |     
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/954b80b5cadccec15fffb0088b811b2cffad51d6 |     
    i686     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/265afd1c23185c0978fdd153262bd09e5d5de4a5 |     
   s390x     |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/6ee2b77dfe839991c1579b91c1282c3db4ea5904 | ORPH
    i686     |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/30699f986c6bcd1ab247d92c4ba0999f09aa226f | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0338895347d2cbffe3dc255266209b01b95f28af | ORPH
  powerpc    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/13faa2621007a63ebad2f9bc58d2ec69a1d5e8e3 | ORPH
   x86_64    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/046038b48d99cd5b3b02462f96b275d2ff7a05cb | ORPH
    sh4a     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/ddcf36ef2af3cac5d96870f67b3f4a48dea39384 | ORPH
  sparc64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/929d08b71b9e0305c1c9ff0589def12b53398a11 | ORPH
  powerpc    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/dbd891c0035129686c8276fbf31d1eedbc37bdca | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3d953b23f7f40a7eeb4903ee0f1f4dcaacc68fe9 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/76cfcbaa7638dc349840ec3f3dd8d48cbbea923e | ORPH
   sparc     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/7414511ec11d3465d48128ada9b96d8a20e4fd58 | ORPH
    mips     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/755cda8107380e453a003235224112a35245b04c | ORPH
    i686     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/a633adb3ba3bd329c652dd2dfea1cc4599aa358d | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3f61bf389c537202892f2231541e08ee3e7f7386 | ORPH
   xtensa    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/8d9cc53d68d93432e6a7bddad0ed3fdaed913da6 | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/5f6c3dfc9da69f2a3deb8dbc2e9e2885f1736515 | ORPH
    arc      |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3106f74e549e3a7444e070e715a5893db8c128ed | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0c9319e025f5a38f3041daabdc1caa8377d77bb5 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/1ab2f9dce7f8ae7fedb8bddb890c9206d96558ec | ORPH
  aarch64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/426fab0368c99b02dec3b0c996b5a5d681e87b1d | ORPH
  riscv64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/6a354d348caac6570709d91cb38eeedb01b857c5 | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3f23a822adeae4d388450f2cebe9173031509b59 | ORPH
    i686     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/67a18cc00091eafe6cfa9629917f5d07869e96d4 | ORPH
 aarch64_be  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/8a2e77098eeb2a4bb399e99923a64a5c5fa02802 | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6b068f5dbcfa0d433f15750d57b92ccfa1c0a973 |     
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/0c7661295954ee6b84ceeebbf0c227671e203647 | ORPH
  powerpc    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/18fa195b05e10dfb25cc92ca34a125dcb40d3143 | ORPH
  sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/a297469663334d1878c552268e7e65ae6c69cb69 | ORPH
   mipsel    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/c278b246cbc15bf9e78022febcb79234ec69e38a | ORPH
   sh4aeb    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/ee1a0ef7ca5f10ac53ab59cab7b5bf4d1b80ac32 | ORPH
    arc      |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/b5be18000a6c9bc74086adbe7b840ce32766511b | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5650f6b0db786287aed3dce763be6e958a27f645 | ORPH
  sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/e3dc1a20ec52ec475305d57082a4ed128ba99695 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5e4853e346d5ffe3014fb778bd073bd8faecf476 | ORPH
   mips64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/bea15822ab3d29bbaca919d1eaa45ae15560d098 | ORPH
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/d2fa3d4fca6ff457fea076ecfdaf340923a7eccc |     
 powerpc64   |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/e960b71667e407e1a98ec15100f4865c26df0e91 | ORPH
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/112c293398d6e45e9fe9013462e24b485cec65c4 | ORPH
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/1c9f3b3f11e2797a902def5741b75d487821ede4 | ORPH
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2f6086290217c4c32bdb8dae1f44ab09a92b6cff |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e69b093ae51143a7680b6f6a547dad85349d994c |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5d26a5092b01ac4050bca31fa829929cfad87605 |     
powerpc64le  |           polkit-125           | NOK | https://autobuild.buildroot.org/results/6a33e16691306f072742ee04c58de26cfd2e64fb |     
   s390x     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/df45e9d5fbb4f11e32ac49cee042dab3991e93aa |     
    or1k     |           proj-9.5.1           | NOK | https://autobuild.buildroot.org/results/519795fd042902248f73e4d621fc0b9207ee16b6 |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8bcaa3073daa317345fb625971991a90c8143a46 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3eab18d13c347583ad5b2c2e3694482a7135e998 | ORPH
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/2b1ac053a798ad451e9735d690bcd66ff7f7c814 |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/66b6e51fa0a4ff3c71af5cf1c85ba7badaa2a3b1 |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/e7987a54c4da5be78ff6abd59639e8e3b42d986d |     
   armeb     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/ab80e50bd3152c32de121a7d32f053ea496148ff |     
   x86_64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/bb495d00407baf14ee2cd4528cdbff2ab0f3d651 |     
    sh4a     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/212e2901ef996c37f9431a12edb48917866fb8f6 | ORPH
   mipsel    |         sudo-1.9.15p5          | NOK | https://autobuild.buildroot.org/results/c77ad565634b681b43449825e23c49c131b5d8aa | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/69548dbd805bb9088587f77daa1e54f3726ff4ea |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/abaf1cc97c394276388e0403198c399287fe446d |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f14c64c96f77c143a43c7b8df6363102f614f240 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/8d31cbadd6c9471535b3e6877b5ead5902de0dd1 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4272737e11184a53bdc158e214f15667ac3781d0 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/69e9343a9c1b105600434ef6fd772075b5cd559a |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3b7dc75d5da57375669b10975a42b0ea7fbae5cf |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/70a00586e5b99f76d3e04c14ae7aafcf96659f9c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3a17aa4fee18ca33b089920e0880491b3228ad73 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fbfe35783142598f157cdaaef68d4b63103a2d23 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/19414b28b50439c2c3b9af0caf7f3dbabdff5051 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/3fd8bd01316e454d07594e08142008f82bfd07a8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c6983a82a6260bdb92226a6ae862a41c1e82703e |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/33c6d388a6cd68d10c7aca030598852c10659b20 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/4b9971fefb9c0fd867df2dba79f8664293f36a5b |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b32dbd8b3b5c39df48175c404da103d89ceeab61 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/fe3e9f083fa832c639b46fe20191158d76fee15b |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f389fc9c92adff04c90e1b55562569cc63323cb8 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a0aaf0669628586714eaa66cd381a1b872aa19b5 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e1d2b0c88b758a9adc8852eab7eb5c5627332259 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/29b44da85f1391ec9c5ff5a3d087267a3f1765cb |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/208e6ed3ab46a6f5a569196a0b939edb5394c724 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/181982e6f5a5ed2c444a85bd9ae715f6885a7f90 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/2dda5342c2fee9253cf7502e0cd9a1c9d004ecf3 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/3e403bb807f233006c5ad3b06edaf5d2b6b6b320 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/78c1cfaa297e855642df5f3da981ace999c907cf |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/85854f86fd094e7e45fc9be6790b5322cac06140 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/be263f2612b298523047273a916e1d126e88edb8 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/a45e2a3351afa8cdedd63fa8841716b47eb51877 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5c97c0bb5aed34d41407339e037c84432bb5133c |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/1706442aab98410d438f950e997fd2edf6f2e9da |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f7a9e716b778e42f0f8c4591c9406767410abc45 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/3acd8c1440c343da7f2281d6d80f5b0a7a6ff56a |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/b565baa2d4e1ce2e08c8d275450ed105d27c5c7d |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/52edd6f2056a1a3ed1216f565ab014c50d1233df |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/4b654e422159aeb7ab04db5298deaaeccdf9fcb0 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9701b96f2587836401e4f7e6d5c686831e849978 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/ba7b8e3e169dbf3c998fef80222bed01128d2dc8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7414fc39c9067c43b5c7e9df480f88bc6158b139 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/988262b25a4415ad0fdf446d37b5db5651031fae |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/6103f567837d99b28aba9a0fadb5c0d047d65b86 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/88618cfbcbc346397a67ed1ac4bbec3537ccd45c |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b80e7838401b85c910303264126f7ffdb4d57ed5 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b2de14587d86cb50d57897a4923153a3c5e286cd |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/3a79153764fe97c335a0c3f8ab1a7c97a6da8aa6 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/7baaaee5518b771c6fd48ad2acd1d1f97d6e6631 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/405f86fa49c12661052f56a80e6174c65e32e149 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c2c631f1947b38c32f47ad060265df839ac88099 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/8a2791382696630d55e0f9d16037958a3559703f |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/8ff959fb7e39fe47dd16cd9d80ead5df63c37e13 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/dad5aa620586bbfdb46676473ade685fbef7154a |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/561066157a6d652139089113d7924d3886961244 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/85245fa36f0ba1b5bd640ae432f954218332bb26 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2ff1f0d96c818e7d326320e8f75f4d8a725e13cb |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/73a1fee8449cbe3425a83604c528631dede92816 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/0c84be6ce446ec5de721c1f562a0af3c979c01da |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/dfed0473910522430a805a4692349db5c0056384 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/0adca31002994c5c5c79eb16946f84eca1e56de4 |     
  powerpc    |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/78480749dd5ddec17dd38951fcecade478453d1e |     
   arceb     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/8a3212f7a2fadbb4a73c850cef077e65e7c2d7f1 |     
    mips     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/17af102f85d8742b0f1fb7c6bc9a40625ebe96b8 | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/6fbee21a942adeea047a2eb3c1de8a6d3fb65779 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    flex-2.6.4 | 1 
          host-binutils-2.43.1 | 1 
                openvpn-2.6.14 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e8313937c9b02f875f5cc4b978c67b525277a84a | ORPH
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d4f5bac98ffd0e85edeea304d1ad1381158f279e |     
    arc      |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/c49560991bc0ebd5dce4baf2c7ff7912b3b4cabd |     


Classification of failures by reason for next
---------------------------------------------

                   avrdude-8.0 | 1 
                    bmx7-7.1.1 | 1 
           ghostscript-10.05.1 | 1 
                 hddtemp-0.4.3 | 1 
        host-berkeleydb-5.3.28 | 1 
                 libcddb-1.3.2 | 1 
                liboauth-1.0.3 | 1 
                  linux-6.14.6 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/175fedce1e8973e911c9750498753181b10eefee |     
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/788613b712a674652f260b3c4fd59cffd9086d8c | ORPH
    m68k     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/8e73bbaa59ed995b623ce994fbd7715bdc21e54a |     
    mips     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/05438206ad6d0a2658989bcc219c50557aaec3f9 |     
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/ce2d940499f171219f41a3c25861e88ba2f5dc48 | ORPH
 aarch64_be  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/58ec7db43b89ee98cd145e838839db5cfc0b9885 |     
  mips64el   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f202beda40df7a64eca20d797d5934b8706cc911 | ORPH
powerpc64le  |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/be4bba9f62fb48aba4b0c49880728313ed5c9a6b | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cf6bce01d74ec692cf4086533890118692de2e25 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
