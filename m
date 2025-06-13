Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F34C71148
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 03:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1854403DF;
	Fri, 13 Jun 2025 03:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgN0IN2jPaHU; Fri, 13 Jun 2025 03:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C2E403E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C2E403E8;
	Fri, 13 Jun 2025 03:15:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E55A81E0
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 03:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB265606EF
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 03:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0Tvk6a-5zLE for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 03:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29CC6606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29CC6606F1
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29CC6606F1
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 03:15:18 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so269679066b.3
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749784516; x=1750389316;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DZS7l0uNidpseXgdP+JmUaA/0Ty6mpULWiKd6jx6qHE=;
 b=LUkdglYyIBhsPxawfPh6TsHrMdPpCteQb1qYGTvLb3s9w0bYKCFKVn6IG+HrWi9Jec
 UAa3gB8tZkNWMDXrJ66cndrG9l8zPYRYU22QDU1yn41iy/niHvc2NB3rbOkB/dTosC3Z
 +f/RpRa6bde2ymJE7SR+jD+uyZ1P580jy2azowrZ/FMpjrdo8xL/OWWazFrWaSDEuEBO
 KhRrA9cqDQGSH2OHfvHDf8rwzh7BLJpbm1g9oqpGbUsvvyCB21ALhxxCcJeF7peBKBWp
 sQfpDBFeijuJUyDioAB2LuyC89V7LS1k5dKCLWazxgdZcYwaVNmsZFgOCqm1fXkF1tE8
 Gkyg==
X-Gm-Message-State: AOJu0YzILNgfDD+wBghYgl090mo/Q65/IGXJlk8eydITsNXEMxZAoSmf
 Vln0eB3RV4QYpNEV4uFot70BKkdvREvWY7GLCpoQ3PuXtlqsh0B3OhKSh7R3+Q==
X-Gm-Gg: ASbGncvpiafptU4kQpt1Cl779h48SM5T5FxR+/H5iVDqTmGo/k8M7whieEgoPTW8h8l
 032QOhzqiS1j23CiGIwDUej43nRMeGyP7XsC3pPsUUWRtHjS24tbAJk35zZ2CSakR/NJE4209AK
 z/V36HhOBR7xkxL6AlUMfDyAoC3R/7tKZc1MuGlgAqQB+45lNukQKKSs6eV/aQc/mIxt8sQU4nt
 +wVEZzMweklh0swogUT1wGPPysyDCLLg2Ukk74ZNtu7XF0E//xxnhPupCOYN7S1mzXHHJrVtyNt
 G1HVXMcQcj9kDmc7dCf8cx/VI2YYZvp2WgooBlXo7QQ+QQSsLotIhKG0nyUOMxz0Wg==
X-Google-Smtp-Source: AGHT+IGkMAkz/unfHKkCRymHDvLEtUT7QZE+pIPPltE4SOnWKgPVcIB2eT1Sf4Vs8nsBeNdE5uvYjA==
X-Received: by 2002:a17:907:3c8a:b0:ad8:99cc:7749 with SMTP id
 a640c23a62f3a-adec56a64aemr131575866b.47.1749784515315; 
 Thu, 12 Jun 2025 20:15:15 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8159377sm58493566b.9.2025.06.12.20.15.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 20:15:15 -0700 (PDT)
Message-ID: <684b97c3.170a0220.385f90.152b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 13 Jun 2025 03:15:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749784516; x=1750389316; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DZS7l0uNidpseXgdP+JmUaA/0Ty6mpULWiKd6jx6qHE=;
 b=hm0xXjg87JnDeNz1YsDocVqljcmswJ1s4h9bUygMbdiPA6jO/ns+R/0uPIh6rd8N2f
 CnFPqKfFC20beGOZYja9FnULFyVgjpFMJr1zGeBmWQBmb0+ttTe3BoP4EvbhAyL07v6Q
 GwA/s1/zDm0LWoiVZevesa75Y/mH0Lmb/8kfqxPjR/hc2/ozZSbZycituC/eGzja9Iih
 TIlW8t19g8zzEwMuRt8hQag3aRry2k4OosFvMw5frQhl+NBZJH7c7Kg2206MboHGjrce
 /3hKyjLESQOz0Oixw9Jw5cQKpQXrnidyb7bJBJW2c7OlfmiGHLWjZWAUFlvnVoW+hGG3
 l5Cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hm0xXjg8
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-12
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

Autobuild statistics for 2025-06-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  4  |  0  |  6  |
  2025.05.x  |  3  |  5  |  0  |  8  |
    master   | 13  | 441 |  0  | 454 |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 41
                  bcg729-1.1.1 | 30
host-gobject-introspection-... | 28
                    bmx7-7.1.1 | 27
              libselinux-3.8.1 | 22
host-gobject-introspection-... | 21
                  cjson-1.7.18 | 15
                       unknown | 14
                elfutils-0.192 | 13
                   avrdude-8.0 | 8 
            host-binutils-2.42 | 8 
host-binutils-arc-2023.09-r... | 8 
   host-bootgen-xilinx_v2025.1 | 8 
         host-mariadb-10.11.11 | 8 
               bctoolbox-4.4.8 | 7 
          host-oniguruma-6.9.9 | 7 
                 linux-6.14.10 | 7 
                       cfm-0.3 | 6 
glibc-2.41-5-gcb7f206537240... | 6 
               host-vde2-2.3.3 | 6 
                 openal-1.22.0 | 6 
               pulseaudio-17.0 | 6 
amazon-ecr-credential-helpe... | 5 
     linux-5.10.162-cip24-rt10 | 5 
                    azmq-1.0.3 | 4 
host-am335x-pru-package-5f3... | 4 
                libsepol-3.8.1 | 4 
                 libsoxr-0.1.3 | 4 
                    yajl-2.1.0 | 4 
                 apitrace-10.0 | 3 
                   bash-5.2.37 | 3 
             berkeleydb-5.3.28 | 3 
                   cvs-1.12.13 | 3 
            gettext-gnu-0.22.4 | 3 
  gobject-introspection-1.84.0 | 3 
                    gpm-1.20.7 | 3 
            host-libp11-0.4.12 | 3 
                libesmtp-1.1.0 | 3 
libmodplug-d1b97ed0020bc620... | 3 
          linux-5.10.162-cip24 | 3 
          aardvark-dns-v1.14.0 | 2 
                 agentpp-4.6.1 | 2 
                  cairo-1.18.4 | 2 
                 coreutils-9.5 | 2 
             dahdi-linux-3.3.0 | 2 
                   duma-2.5.21 | 2 
  ffmpeg-n6.1.2-27-ge16ff06adb | 2 
           ghostscript-10.05.1 | 2 
        host-berkeleydb-5.3.28 | 2 
              host-json-c-0.18 | 2 
                  iozone-3.506 | 2 
                 lapack-3.12.1 | 2 
             libargtable2-2.13 | 2 
                libdrm-2.4.124 | 2 
                 libiconv-1.15 | 2 
                libssh2-1.11.0 | 2 
                  ntp-4.2.8p18 | 2 
                p11-kit-0.25.3 | 2 
                python3-3.13.3 | 2 
             util-linux-2.40.2 | 2 
               asterisk-22.3.0 | 1 
           at-spi2-core-2.50.0 | 1 
                   atop-2.11.0 | 1 
                    bat-0.25.0 | 1 
                  bcusdk-0.0.5 | 1 
             bmap-writer-1.0.2 | 1 
                   cli11-2.3.2 | 1 
                     daq-2.0.7 | 1 
              gcc-final-13.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
gemmlowp-16e8662c34917be006... | 1 
                haveged-1.9.19 | 1 
                 hddtemp-0.4.3 | 1 
           host-doxygen-1.8.18 | 1 
               host-efl-1.26.3 | 1 
             host-fatcat-1.1.1 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.86.0 | 1 
                  jack2-1.9.22 | 1 
             libapparmor-3.1.7 | 1 
               libcap-ng-0.8.5 | 1 
                 libcddb-1.3.2 | 1 
              libebur128-1.2.6 | 1 
               libglib2-2.84.2 | 1 
                libkrb5-1.21.3 | 1 
        liblog4c-localtime-1.0 | 1 
                  libnl-3.11.0 | 1 
              libopenssl-3.5.0 | 1 
                libressl-3.9.2 | 1 
                  liburing-2.6 | 1 
                    mpir-3.0.0 | 1 
            netstat-nat-1.4.10 | 1 
                openswan-3.0.0 | 1 
                     shim-15.8 | 1 
                    sslh-2.0.1 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/af81d4caecebd5072fd4552cbd92f6f205e26883 | ORPH
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/83949bcb800e8d092da32d776c1d219e38f6c7d8 | ORPH
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/6c0aeb77b54bdf2382283d42fbe01766ee58bd08 |     
  riscv64    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/ee36e1f5de7fffaceaaf1b0dcca4831e02e95451 |     
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/0512176c263cf6d0a5930acbcf7d498306c053ad | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/b9bf01e577c72f4d35e804952069a5105c13cf22 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c16136f3f1c74d4ecec5dc553bd14e16eb4ffb3c | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/d10cf8b97f76a6f5542ff1b4714d89fd8b1a6280 | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8a8542adaa2f922049e1a48a3a2d352472bfbce4 | ORPH
    i686     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/58c58e59d0b89495deeaeb1a099d2befc654f9b1 |     
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/8611cdceea4d675ef10534bb702ebf3ac055a30b |     
 powerpc64   |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/f5e2fc8e3783dac0a20d10dac47bae8df596843e |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/1a9f2762f12f8a836a66b99029f1678a9d128ffd |     
  riscv32    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4e63d81baf25e6fcf810fcef03eb1f45e8b7a662 |     
   s390x     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/9819325c844d2e14b2fd18f5be0e84f61f992139 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/39325116b00d2c47cf0f4ed66c3300817b270c35 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/35e859c351af77c2f89b5a8b7bcb4ce98e86dc96 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/3426c4bb85e261a8f5ac3ebe0abae899dc2ab543 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b0346343d6115c29b398edd72d0735f95a3bc06c |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b824c52417017dc29605ffd3c06c6619e5901cfa |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/3b60bbffdac0e74074be9eedccf2ce3e7ef69f14 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d26f9fb88bff4ebb9075126db0bd712f91edb72f |     
  aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e6322447231361669678b54cade4b0c19d82705c |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/7543795494b7827f0f1a0350a38758f622426201 |     
   x86_64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/9bcd5c53e67d48c38cd771815643ee80b5385c6a |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/10e4d7e9b5fb6a2a7a55cd7c5eeaea66af178567 |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/d5d68d61e6badf4aa457e75dad3e5ef0254fddcf |     
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/56f3b84feeaeb3a4b181bad6213628dd276fd1c6 | ORPH
    mips     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/4dccc5c8ac9128ace89898c4995a6d024d64e815 | ORPH
    m68k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/82492adb8bcae61206a219904cf8467e0cf1d380 | ORPH
powerpc64le  |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/e468935cbaac279efa79f343bc8516ef3de469d5 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9def795067d7710b87e08d9d8062215cd6b3c7d0 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/dbfb21a50e05cce7620c8e9354988660eac352f3 |     
  aarch64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/20de46f4de0a355ef99bb6027611c1b8ed500397 |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5641015c860670f405f10da0b300e1db1d48b791 |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/82600cf6fdce834d957d51d10c68553b4f2f42a0 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/65477d7df65cd17795216be46668dc48dca2a024 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/955e846150b86da9d6149e396ddc30d873cf9bb6 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/576b4f81ed5c2cd9e43fc032693e115b7ed0505a |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b95b478f05fcca8e5afef4affb069266b738c60f |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/925502ce8faeff196a4a769ad946d10a33b5dae6 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b6b963bf15229c040914b809252f64da556b776d |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6fc4215f086a682cfa244d0209f138597d8d1203 |     
   mipsel    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/7710312846083752eba283193cfdc020000deae7 |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/599ebd0f06efbe945c0793b24f5caf3ebb857b7c |     
  riscv32    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0d20633b082a7c1272e158ae42a2dfa08182a293 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/8a2b2168850b295cc34c2b3f8e272a0f59370afe |     
   sh4eb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/464ebc10439dfdd4aa054f85cd13c08bb422f0d8 |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c8992182c5a90d72acb305a4dc818a17fa0525be |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/eef50965fceaa387b615c30ba72fc88bc9350cce |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/d0256e8fc66e40b41535f9de1ed5becf21049b2c |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3163cccde2fcd1ac860a3b78d07c7a61743af32a |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/456db0530f38794a65b8e4818d4494c3e63e4405 |     
    i586     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/fe177ead53b1b9cd1c285ff34203a1bdb188768d |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2c7a6546a61ffcef71c50280a14aa54624ee7658 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f3727a77a6f799de5253621123651c40a6d79bd3 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/1bcd2c514fcfc53ffe66a78a31d5a3e89179dd6a |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2ca36eb11739b1b9c242a027c7de91c81b73a121 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e83520040474d8b6ed04279021a31de79eaeabd4 |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/51b8eb2f8edfcfee6de23dbd5379ae9bc864f2ff |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e4f88e7013ba1504634d1561d3d0356bbc3bb479 |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/478d4daaf2726f27db0a8a4767275a3943f4a6ed | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8f9088b839ec2ebb7c44d89c2caaefaf25c6d135 | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9ac6ba9bfef79a80ba31441ac47441db720058b6 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6256b812b587fbf761fafeae1e26814e8dfd05fd | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6096be91932ed7d9adb63857259e7dd49436d159 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/88f58f3d99e4f8a0e08bc1ca9437fc25ede35863 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/cdd10b55fbd22f17f8748b57e6d2b954053d99d8 | ORPH
   mips64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5fedc49fd410ea1eaecd435045b807d08472ca69 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/cb589ee622f67da74a3fe1c4d862e9a7b5c321e3 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/2616ef1a4bdb421e618e94185226044839ce1495 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/06f772dd5b28665c7e8f425dc632c0788713e2e4 | ORPH
    arm      |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/e1b675ec3415767fe3731ac39dcd299ad2f3612e |     
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6399ce611c5970f7a94931155198f25051a514c3 | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/962e31533899c2de02c823d3c7d9be5aa3896c43 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/739cddf41362a18d83c136de7889ddf56b92580b | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/263e4291124af0f069b5ce8515c51fd212141318 | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6c73b8c79aff43b9328c46edc10d49369fc95f6a | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ac49f42e858c024df747ce560bd5860b6ac11a09 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1c36e84401a4d69956506f47905a12908e3b0b31 | ORPH
    sh4a     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1828c462db91bd5c1b89e2c004c2c745e4ffe54a | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c6edee71cf3509183ed17280d8b40c39cc6feeff | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/839e9abc256aad4e3c57def3cdbc31fbdfaaeaf2 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/abdb61114a98d812a6645c537ddf5d4ec9112b5e | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d9ab16524da7dad06ddb9ef117a268a20c3d724b | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/001879b9f42b3f69b3fcd194b5bdc32c15b388b3 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f6430bed75857560d6b422a22b7184c073c84a3a | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3b4df9855bf6d1c6c4d0ea9d91b0aec22c8a00f2 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/9bb74a3d29f057508ab9aead6901f6fa3971e3af | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/62a092290de900fb85986c2f5dc9ccf7d0d7e3e0 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/aae813a362d7beba314d83cae920e2e289c07987 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7f83cba4a11b6d207f77f5c9e2bd624e73fced13 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/52d357d38f262b790a727e8f3fc8a788de5afe8a | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/caa7d402fa53d40b210755d9b76065b117705c85 | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/fabf7b0e66d21cdc4c3d52ae2dd8742a7b12a7db | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f51a8b500ae9c9b074c77f8e48abe0ecc0723238 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6962ca4a082f3b0fe97a9f48014ac38e83226988 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2f9345465e7ab42b28bb59ea260488791ffcac39 | ORPH
    mips     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7f2a6857c542c9848d1921657b33fddf07a46e6d | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b96f1d6e0bd272ac353af5ad2f44f8eb62f7b9a3 | ORPH
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/9ab9dbb94144606c4fd6c23fb4846c411adbd339 |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/90f24c003e45303dcfe5923aa9e3d03113691471 |     
   mipsel    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ed66ae6d9578065d78d6aee76b5c1aadee08acba |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/59b42052c362da58214ad455a76b893ed22f13b6 |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0ce639303f1b8937e94df1e32e997200873149b2 |     
  powerpc    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8350e3023dc7511d218325f5b0b643c529eebb94 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8f5551621677a8ba28a5f3a2638b9d89cf9d8091 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/fbc4b46d4aa95dd347869f60a8043bb167f5f23a |     
 aarch64_be  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/78a1bd5da4bee233c4d55e6c1f319bb754bd363a |     
powerpc64le  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/38dc177e76588439dadbfea2b93dbcb392075c06 |     
  aarch64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f7093824ccf1bab89bb5c533acc586f87fe11829 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/bbea9964142c847e7eda5fb625f16298135353f9 |     
    or1k     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/753d58b7795237a0229973bd09dc8d04aaea04af |     
   arceb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/fc73bde89336a9fdd446e2cfbdf81b335faedae6 |     
  powerpc    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/acd8826184e2864ac1866a86208163d2400e829f |     
  powerpc    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e0f4c7d9adbb67c8c4c312b18f7d9596c3fb3036 |     
  powerpc    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e146a6add277b5e34c13f3d093bd2f87c3d04146 |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/9f7574ee1a08a28a38ab9c01d4e0d1bb7ee66b8b |     
   xtensa    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f05f9bb72c529c7caf9b0781734534e2b597521b |     
   armeb     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/6f27434bb40a02d7dde9a327218745eedb7481cb |     
    m68k     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/73d9ec7c0f055b4079a33fc3fd33ac2a5e98d0ba |     
    i686     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/d185c01a2a5bc7883145b059a181b59e6db71e4d |     
   xtensa    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/57b590ceb7eae2acd9881b7567c53ee0d4f69a77 |     
 powerpc64   |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/667f0c1351c31d2340f96cdcdc8f234854ab409f |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/12b6d1f1fdec080268bd9d71dd8dce856ceb26e0 | ORPH
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/52e196ba8151293fc05841d099b18571d2fc4969 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b3d0a0ecbafed0365ec1c0ff43e41502db65ff20 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0475ba838c2d1f73041d11d4ee9fa3b79a28b58b | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a7f4875a6c40b04c90d36afacc1b34534e6b769e | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c8e908a78805afa899293949976af8c2dd9369aa | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/537564501398c8f410355e42e3a65bbf69aed378 | ORPH
  powerpc    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/fc093ad4735498ab44b52578021234cbba8ac7a1 |     
   x86_64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/cf49a21d2b6103521eeaec11cf1b4d7023ad487e | ORPH
   x86_64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/5ba13cdcd22275f3d0284f6bb413e0a44118c510 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1027183d2e269b321b6e8c4096993835d809e816 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/feb2c5f49708de800fa76f8b5b5fd2647caba457 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fe3e5f2c9823f6057f52aed18713f55eb745428d | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8123b37c075b2fa5a53cdd16d09f7077cae4c32d | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/63164c9daecd9a30b09042968a92cb7812661388 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f45455050d86372e8b185bd4511950a6a384f271 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/71eec85c95ddfc81fd7fa3b6a70e5d4de3b0b102 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c51ffca4e6cff92dbc1eba0fc3427394f417b4d2 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7137a74045786f1af2d0d8944f3ca624fd5ab3f7 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e26b32a00ae3e3a2111b43152e1ca5125abc3f67 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bc9095f34843047fcdd25c68c08f26d5bdb30e62 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1902eab3d2b31856bc25628cd6e63229b21e55a3 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f089ecfddb0f9a72420b87e5c172d94fb6e6dc2f | ORPH
    arc      |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/62a0b8df784502dcd9ed11ca317d8537f59f6a9b |     
microblazeel |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/5b95f41ff0407e240727926f2ca292223c2bf05f |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/4bdf0d8d8ba24067da8a6b5077a0249e24ad79b9 |     
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/deb21d2a599d5ae8f2b53b072f649e95b9b0205a | ORPH
  mips64el   | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/be3f2b4d5790585da47e9c534e1f557a08c0b86a |     
   mips64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/14a527b8716cec6760eda7251ee1e539accad35c | ORPH
    i686     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2971dde2f7ce00ffaf0416e347d95eaeddf3074a | ORPH
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/633e66620ae3a98d39234c5ff3e8aee0d4c34397 | ORPH
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/8bdbb070087656dce21c94586280b0cb136b9942 |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/db3e43d6fd55125108f88d74d4d7b28829b00ed4 |     
  mips64el   | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/9402fedd68df36599cf3d7811c757fbe73b97535 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/0bc47cde075b8ab4260a122cd1e639cfdd307a81 |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/2d6d2c41c948af0bbf88287280c061573d083950 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/1941c2004d818963380392a8cc2f6f1d40a152f5 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/07d9647c9faebdff6984f5b2282e3d4a206b2527 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/8bdb12770670e8e2ff55bd130e2feba6dbe5fe50 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b46d5679303032e3edecd10d21fe9d2ebb322e29 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f593bf5c8fe885c0a2e5de9f3e64cfffa17fd667 | ORPH
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/efbbec1ed47f19c4abda740b42f450fce1714743 | ORPH
    or1k     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/37f6fe73bd39ff7b2210089408f314b608e53658 |     
   sh4eb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/933a4add0ec2d4a1c42b445531dc56637adce011 |     
   mipsel    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/994740b000448c9fb73c80c44d5dacb15fcb2a7d |     
  aarch64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/7b0c377b3b443b00e48f22e5522ed30f2e78f325 |     
    m68k     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/40f4bc5410a236125fe1b756a8816718e3f07500 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4ec17fa01d24d46f809f383c4a9b2d48094cc759 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5e6777b8f248b88c2c5afbb1e381d6ba3242fef1 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/25a56b321701c6dc5408c11b34f6923a26854e6f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a7d2eb5ac94367974c85df72a9e809ee37dd99a2 |     
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/f118f74b2c805ddba2c55dbed055304f1af6f8da | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/56e3451e294b4a178fa1de45146215d3bfbac996 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/402ffcb55d51e37be57ef456261181a83cac2636 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/44d30d9aa736d6c7d5320b885ba697fae751bab4 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e9a3829871f16ec45797fe7ecb2a534bd47ea431 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4c6e9ead4585bc785949ac87896e52e1b6a20e18 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bc3933e4e4af3593bfc0e75facea6d4dbda3a744 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f11e0b5028f89a3bbdc43a9f9e000157d161177f |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8e9efc1fd1ad1708894c7dc42bbdba95f68d6123 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bc91f653a60bbe85dd257926d543d588032621e2 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/29bd61243ec16cd2806a59f84641c67373af46d0 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9cfde568ab68ea1ff4a1e18887542343c78e595e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c1c34044427958e45d601105d9c50c13143990c0 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/37f5ee3bd455fedea103568f752744ec4af3b229 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/124ba6505ec62044b2cca4f93e09e7dc56e1442c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/27bf8106530268a57be3e452ae790c892e8269b7 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/255dfaee01c8826c177ca3081efed26cfea9123c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/893c3c9d3ebdcc66fbc94ce0227dab2838673f6e |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2953b68c9258afe5c21dacbc77f75cc5e911b7c8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d8a27a62d7b3add3d1d850033fe3a91e75ab2dda |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9f5cd81427a21534a868540889f04f442e55582 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f7a0c39aca742fb6ee6cd46aa88ccfdb3b77b510 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/af78246185835af8df382ef3952994bb51f8df17 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3bf328c51232721948b0cc7ea147810e0cdd7e7c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a303a25f122054d9c1e8bf6a35e7be99fb3ad802 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d63e33acdc098ccd6a7ea7952147cb0536a63405 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0948bf09a5065f1ff27769eb2353ef7d9b555b4d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/75a48960c529637b34979acc05f4f1bec8c33e40 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b34f3e9b7bb68fa6556f4df6234be99eaaca93c2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/054f4ba078cb19b720e90061b49b08f7275227fa |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ee6a987c7b8aa451b39ec14dc9327267115e75b0 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/23393655c5b3a5ba5a05317811f0cf4cf6c68399 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1598412ae7a3108faeb0d56d916733fc4dfc1a53 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/67d57c647b75c1e8e7c557c57bf533e3659937e4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8f1f6159f283dfd44930dc8880f10aa60ec6fbf7 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6b7c6543da48e00a11e8a8c94ad5701edd407fc5 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/401ff65a746feec274885eabbbb9fec5d35d782b |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4e84624747d3e17aca0101d69bef9b874dd5cba9 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fd345e9fe04dab2b934be97499b68b75fec7c08c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/277089f820903c99bed04034f19696cedd76b619 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6afe094783aa8e4507d1c44046546035a5641dac |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0d6fa20a4c683a0a8778c42e8dbad1203c2b1f44 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0926266bccd759196548795f4eac25d5e49c82c4 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/161a5e2bb9c404dbb6b62f2020566d035024c4af |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f59526e97b4398f97961b3efe5ada19640b64914 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2b9004e501fa01e3e6bd06cdb95d0484c3d25aa5 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8278439edbc1350ce60724b16b338e527dbb6541 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/52d2b230284a97ac5f1c65745ab091230d059a38 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a708d9ed965b452da9b2dcf762cebe0151e5b36a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dc544b929f17115b243d74cd8d7c39d5caea8837 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/66ad9a606a1d672a9d25751760778f59a5901906 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e7c740c0e856d2a7702752699723ebb586601e8e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/190b6e85196b1bff8abf0cdd277af78785e3d8c7 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/cf0db2d1864649691ab0c7396f2f530ef99d1be7 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d19b7679b98416778d0ce2d319b5af4198b12c79 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9494db5b503a64bdc9193247abc6f0ab885fe576 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f695bd46d11cf5930febbf57992f6b7a679696e0 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/fc837a6043f1384ab8f41c2d10fc96c774147fb7 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/5111119673fdd5bb21920d5e9948670991c6985a |     
   xtensa    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/60220f94cca1bcca5667afcb2acffb5aacae048b |     
  riscv64    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/26d7d1056aa7fd2f2b0ac7255fb1178f69f897b3 |     
   sparc     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/59260f425e25a2f22b71eb3f2d9047c649fb1413 |     
  riscv64    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/06d70d9128a9b10c8b70b643971c4fc87a167852 |     
   mipsel    |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/99a46b851723f8f401a6e89cd711060cb14075cc |     
    arm      |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/5df50ee747638582bbfd83e8c8948b8b623fa43e |     
   sh4eb     |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/e44fb9ba68744d530fb4529ccd7bf421413ad5fe |     
    arc      |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/6277cca09821f6fae3b4b32243973459f4e11b31 |     
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a1e684e07950e73015a4adafb863fa57603a82af | ORPH
   x86_64    |        host-efl-1.26.3         | NOK | https://autobuild.buildroot.org/results/fd20a14a1ce256b88d7febd467a29618d3cf6c5d |     
  powerpc    |       host-fatcat-1.1.1        | NOK | https://autobuild.buildroot.org/results/897891e2560f1409d6556daf775dcd0eab313f4f |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bc5b237a7684c95e68149c09e6db9827e5c5e65c | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/334560f812b335e152f8cee2b03f8387f503fc3a | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/43b50f2404a30f893382b0494f04df79606fdd72 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1720075e62ff5bd94499cdde3775ff85e93cfce6 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/921d259f94cd98b9328d6835f9384d053a5b6c68 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3256fd66f5612555c28a5f4a9e0f4a523adc5060 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b63c48d67a09f4e3a094c873fefa320e2f394836 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/51cee698010fe926e9cb6f0feff25a4b196e03b8 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ad72875a0506fd31c0fee11e60ca487f4825bd55 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6c414e202a2bde43af47ad303ba510cf695acb43 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bd835c280cac42bda514168451052a97669c076f | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fdc05c6c93cbeced0ad862e6c23e646844d5f23b | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/19d3dab26cc69ca47f742aacd483113148f43b03 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1341fc4120fdce3da137597b7690b30d359fb8c0 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/91101375c6ee895674d255bca4670f2de9a0a862 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/29038f9ff54eaaa79eb6a646d77795c16fd02e6e | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5fef82be43fad8588b636b2dc3047da92ee72c9 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d329c0e6570520f3caf7535ba29cbf3490e768a2 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fbb16e60167aea7750b131c1e47b0671ae87490c | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/73a6819d0cac7b18bf42486c179697059eaaf36b | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/451ebdf8152280e1a78913ddd08a1a35d403e31c | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ffb7fdb95b6119d690c92685c07572c1c58b8d83 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8a8abd78a2daa8bab13715cdb4d4037912d9daac | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1e24ffe765db79381b401c86306c05af1d77c2f9 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/53ca3a8b21f0beed695d2e4b962645aa7c3f6c5c | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d403af725e6ae822a8072364f8e854d3a9fe3f7a | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d812c3618c831178a5555629f5f2e05762a61153 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d7cee9996b9245cd8cf0f0b52a6f928dcd8cb4ea | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0aa3cc2f5a2ac404572ce642eec930ed2b8e75ab | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9eb8271b2749c2c1d2ca333c428b09f2ad6e16ca | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d90c59eba50343e4dfe33abd4cc48ddc92b180b1 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8c9d6393904faab786003f93aee86df191239da4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e91a980c01541d0f2d521265fa499a99f98cbc52 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6d0233e40f6b6967dff1cb4b52a4639e3c0e074c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7f4affa39d7fb29460ef5ef3f7c961f441c4819d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dddd0aa433bd9de77613808650e244e12d88e485 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1e3f048efd60de9f7f4e444b5d5a22d426c96fe6 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b3c71f7898c1e5d900b41de96bfc412a71f99cdd | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ee889deb05de281443a9a91fd0d7dc18f90f8db6 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a85c0ba184db300777e8c6d101afc3b56621c7e0 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f646666cb9d805aff3110897b9284215fafb775a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f52baf02c7feb0c40d7b96b2d90d1cd4c07cb9d6 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8f1838535d13740cc741a111026226069932d84d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c8479db1be30effc1bf2f3624cfc35cb65762c93 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c5331ba3f5a3dbf9001f6197546f16c9f99f2b5 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d7df6686f9ba7f9e3aea9a5d11a784a8c6477c79 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d823e640c9a1b45a89f5f23ab2fc6b4ee331bc80 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1c11bc5769b0643a1f54c9bd29a6b41d715a4c76 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b15e92fb280f4c84bb7e6d5634496317f6e65ee4 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/272a7806ccaf8497018aa65404acebc2c785c29d | ORPH
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/cd7f1f6c87e4ce73a01fbf043a75c55c69901e6a |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/fb79781c1fb8c9f3affd7369d8c0a5abeebe0684 |     
   s390x     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/0f095d44e8fd3f06e5a7696c61ecdbefa2ab6e2a | ORPH
 powerpc64   |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/14dff0e788980adb40ce49327a94e15454ecf4fa | ORPH
 powerpc64   |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/f5f0f00e5a4fc998252777db2b5a7a335aa73916 | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/4a3dd0a94e21457d981fc28bd8854b1b26c87ab4 | ORPH
   mipsel    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/cd2f668f32dd5fdd215bb37b6625316a7c317e17 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/84da052cd1fbfa62f2d43228918a04c2b26c151a | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/102a6f8ebcc3d87d30768149e259f4ae50b4370a | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/cfdc4e5fcfc54182e456c2805cb9735d71770aab | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/8841b3b815d8584d5f5c4326805e97a4bf90c96c | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2f9e0421520ed6c5a3359332088c886996985f4c | ORPH
   x86_64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b620bb2ed960fffee758bd22a39043bd990dacf4 | ORPH
 aarch64_be  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f01a47d1cc8bea264c245733c8c4a1f4cbe14df3 |     
    arm      |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/085054999ab1a7fc6f4b9e0ead663b395118b2ef |     
    mips     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/520be999464f1aee2dadf7c1294325351e79c149 |     
   sh4aeb    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/7ecb313a505295f82cb91585bdcea22c596a58a0 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/0057c56002548940a0e49e656a481f5df083f8b9 |     
 microblaze  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/bf1ee0c00eb43301112c1e133bb4062761cb1b9c |     
 aarch64_be  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/44a0f4c2dfd97b44e714ccae570dfee336ad6127 |     
  powerpc    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/a06ab72210f3fa5558f95b219225f9e8cef005d7 |     
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/387baa9e5f7d2f11a23c7c4cc4a4e1b86c798758 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c1b5bab2863938dbf2929928601a9cc9ce9a9cf9 | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/746586c36fbf33723ff409007e455c83a3b66f76 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/860cea214609d07cf0a58cb99741720d9cf623f5 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b26807bd581d8434c61f5fd02fbcef514e5fcd80 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c256346a1e61c2b8f9380d46d198b0ca05d2276e | ORPH
   mipsel    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/9d96af15f2f193a5442edfea7e3a49b69c4d8f30 |     
 aarch64_be  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/c4221e60b4a703b172ccd43327e85d3cb1eea6d3 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/f31ebc4ac0b67274e2762002854160964cf0b5b3 |     
   xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/1abece9604419f446867c38365b59f08a1745027 |     
   xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/6899af5f64d94b98317db34aaa10d4524d0b88f7 |     
    arm      |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/55d919614655b14771c1ab1c430b5c6ee2ef9dd2 |     
   armeb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/532d0d3957c8f00da3a2c3f130c24476bb29ea61 | ORPH
    sh4a     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/2ac15ff5f5ed035f3c1b8bc43c0e1855346549ab | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/93c8d912e95b339ef3209b526617fc84c2f0e253 |     
 powerpc64   |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/91f9a717147ad1797cce9261a6de14ba9d3cbbbc |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/5228e558d48d5c1a301151277d6d8363478f7d8d |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/916b7bb60595ce29d110a0ed4b6ac108074c91db |     
microblazeel |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/b2830f214c01b7ae3343c3096a8e435769acb3ee |     
    sh4a     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/42ce04571d61fc5b348732a83b2f6830b431d217 | ORPH
   sparc     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/8aaf9fb5a4d94d338c0af4d8fcb0b64563424bb7 | ORPH
    m68k     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/4640227d22878eed7761d5cd920c9c156b51480a | ORPH
  powerpc    |        libglib2-2.84.2         | NOK | https://autobuild.buildroot.org/results/e7bf4c852cab48b83ea518b70ea0fcc953a48e16 |     
   sparc     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/3005378c491d416e912de683919ec2b404b89a69 | ORPH
    or1k     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/80e55c3777d3524472fd4812f09dd3b4cad72adf | ORPH
  sparc64    |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/a90c44ec4a407db04037f118632c728f77716179 |     
   xtensa    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b72d2ed9c44a7cd48b23a137214a3d7aa7c5f222 |     
   sh4aeb    | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/61f0bc17da564d7bd29f0b94e94c688658e2ceb0 | ORPH
microblazeel | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/8609b7cf1085ff44ec677cfa9df21b2c7c8f4170 | ORPH
 aarch64_be  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/8a59002e2bbda3f349fdcdae6a31395080683781 | ORPH
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/89883e08ff9d09c329cd47c7eeeef85efd0288e3 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/995219e7d3b4cfa95a0597196104bc1551702cb3 | ORPH
   mipsel    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/e717d67151e895914932c6b830a270cd4c2834e8 | ORPH
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/17b6be0d376147574fb910a871394c75e5f91c79 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c4213401d815f816052af155a0c633e30dbae1b6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d664aca11ca464a60327a1981fc52df67070e8ee |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3a18cd5a5f25fe963d199472dfc0dfb14b90eca0 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4e5165a8cf2d0103b2e38118e64ee2afdbf50892 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4a47221e5ed31ff962da30eccdf1c8e82e674ebe |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ee7ed7360722e1ccef61d1240ab0389e8d357953 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5ca96312cc14ff1de655724a100cff8e1d7501aa |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6213d2833acd7a89f89184ccc45e17a67fdb60db |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9f0b769d79b76f49dd5798b9e9f62e9b6caf1921 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9d45bcabadd1caf6c9304013ec8647a3c51a93bd |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/35006c5c6db41c891dd3af88c4e5179a6541c40a |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/715ae4e790167b997a8d9ad94ccaded060c0c2f1 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a8180528ab959a46b64b56e8455df536b8776463 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a16a20af953abd6ff79cb930e34d37c455ed7b00 |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cab135bd69ccaa62e40288af79034ba21a7a7613 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/49e8d000ae770dde8a585d0ac805c328c935d560 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0193bbce51e4e84f60303789449141825e20f5bc |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4062882191de94d61a3d4cc908ae2e4038dd6799 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/60e94935f69b0d511187a18cc92900ceeb9af5b7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a465f4f0150e2a8716738a276e1692171c56ddd1 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c26c9eb48a27e4ecc93daffd5e2dbe8d196a7420 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/f3708cb41744d27bc96d8c3b8f9e1a36add68495 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/1c16183d374c1e0fbd5f3f8dd158f805bf59fd73 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/2ad4353db20c8c9a963738d08d3696a03107cc32 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/7752d377c3fb7ae3088bf1e86b2523281ea7f963 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/9a70434ce9f0c4879ab5563ce8329ece31c26455 |     
   x86_64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/63f952e64a92422e62c064a5899ec140e29db771 |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/faf6548116aeddd71a8a5517341c9d4d94d6e2a0 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/a5309518393a35974c69ed576c47267be855d960 |     
 powerpc64   |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/131057357591281642180464ff2b5cb81050b668 | ORPH
   sh4aeb    |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/82102d5e8611800058eb713385979e43045a19c3 | ORPH
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/305dfb0134eb0c44305243f0de3da110f53d574f |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/89d57545e42a91fed0cbf923318ad584d705dbf7 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f99becd8c17f81f1978b699860e773a7ebfc1510 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3d80eb29224ab02bc1fe87d2ec9d900258a9fa80 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5f841d6eb6e1e80f5e5e90a565e947077c27910f | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4dda2d8163f93064ac03097d68170dd602eaf9be | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3f7383658c7f56b46e9814ece794a37193d6baba | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0ca163bade1414054d0cc292b1f810dec81491da | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/22026fd915f98e69fedf9f7161a1a75f20c0b252 | ORPH
    sh4a     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/20d8e7df941b12f14168d78032dd94321411280c | ORPH
    i686     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/58af6cce7b359fe313b0948d9bd3af500ba86e48 | ORPH
  sparc64    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/803b6ef905bb5eb9fc480db0870f8cafc993f652 | ORPH
 powerpc64   |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/00e3e4de7db9b07936bd3a1ccf10e986f950f940 | ORPH
   sh4eb     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/c5b4780985198873b119af629d4efdcfcb3658fc | ORPH
 powerpc64   |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/e74fe503c4f9c4696510dd1078a6ea285724fbb6 | ORPH
   mips64    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/027135f03653915bd8eeda7f61aac189fe28e91a | ORPH
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4328c75071f6a8aea8dd423475eb5abb6118061f |     
   xtensa    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/28483ef4775cf531318d1e2cbada406120b0a0d3 | ORPH
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c1203e9bbe2aafa1e343c264ba86ea0ebf918384 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e6798672352e5bcd144336c73e7d33b54171e5d9 |     
  riscv32    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/adbfc3ce74e9a6b5c91177bd9e55188fd94d79b2 | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/9d67d6d4d10c3516d0aa00aca626e5518a03bb4a | ORPH
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/deb8a573710b820f5a3a74abe65649ed5609d14e | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/a5d6ee2fe96ed19f93446d5395d533209052f253 | ORPH
    i686     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/42be8ce3f52053df31971cb41b9ea687317d64e3 | ORPH
  mips64el   |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/c9aee0b7f870225480ec666e0168856be9761e68 | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/e34fdf05743db5a5f212a318e187788de373a789 | ORPH
 aarch64_be  |         p11-kit-0.25.3         | NOK | https://autobuild.buildroot.org/results/691023df26d4bcce5a0dc2cf679400cfe36a004f | ORPH
 aarch64_be  |         p11-kit-0.25.3         | NOK | https://autobuild.buildroot.org/results/a69cf1107a3b16bf1acd6a80d36c450e580bf38b | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/63f079349a09007a871ba9a12159d2ac25db1fd1 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1d53ce24d6c78f9330df8ec502500b35386714fe | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e9848b4af0fb138ab8248e714c899ac3cc8b63d8 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6560fc40919f87ff5ca83fc7f72966b1e38fbc2c | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/23fa3bee204314ea6fc7a62aceb2de83b0ae7b03 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0297a04aba9cdcb6bd25b428e14271cc11c2b2d9 | ORPH
   sh4eb     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/eef114589e5d5911af6ccc24ce24edd9ff4b98b3 |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/f340c99bc399ff77dfb7c7b5a705ca2ba62a6c96 |     
  aarch64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/1a943b1969fd73359b4120047056b8eaad72a76b |     
   xtensa    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/61a7d84c7728a2e94bccda87df63aca1734ec2e3 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/802944ac66002292e0a14b9c840cb1752dbe4f97 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/280dfb92c35e458b628fc0cf7f42eb8f0c3afbfa |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/ec7ab209d275944d56695c97f05c51e6ebac526e |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/fe9f1ece1329295a9ef7accc253028f6b4a41356 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/290531ad8a698c9d3ed94cfb9329755dfaca8370 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/ac8eb64a3734a7e4e492915860617e213f14e9e4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dfddfca517f054280f9300bdfa21ff48a29d7637 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/3af812b113fb759c289585fed9c9c23b6346f75f |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/14b7fc63e3b18f2426346fa29ef3b4c01eaf696a |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/6d242a07d6a11f254be687bf14a6b249625f0f33 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/3c8b1f897bf5c5c428f2974af98388430eb66512 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/417a3829efdbbcb26f127474b972c8c8db3b5f95 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9190ed2d77473c0caea8dad26b18c1a7d31af0cc |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/09d861af0cbe3a322fbdad66e4060b2dbe52c050 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0fad512c61b6e52829d17db37091342ee278bfed |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cf9221e36ba9ce044cf2379483bfd6c54cc801a6 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e2ecd64cb5ae27cf9cf8d7331712f8be71ab3bad | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/2863076585b3e7013d5c84e59c57cf2d37931fc5 | ORPH
   sparc     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/fcf00d5826960cfa44c60e36168d73e860c453be | ORPH
microblazeel |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/c3d542491b8c60ce3e61da8de855f31ae0214fa0 | ORPH
   sh4eb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/075888e728b97e89730b0c074607153654fb2a4b | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
          host-oniguruma-6.9.9 | 1 
                libressl-3.9.2 | 1 
    start-stop-daemon-1.20.7.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5ac35bac377da34a857f877c98de0a1636402768 |     
 microblaze  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/200de9d411de040d007a506bbac838b7ec4ea4e2 |     
  powerpc    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/30bc623e70b40b13de28a520050872dbfd2dc1d4 | ORPH
   s390x     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/4392ace8d5aeab206e453026abd4b2fa9bec7a24 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                elfutils-0.192 | 1 
                 hddtemp-0.4.3 | 1 
              host-rust-1.86.0 | 1 
                 linux-6.14.10 | 1 
package/gstreamer1/gstreame... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/75a6150546ef0438935b32905b588fe5ee4aa00c | ORPH
  mips64el   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/d343004ba4fd9ec8a2b5964f768a4494d447d024 |     
powerpc64le  |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/ee3cf29513e0d2f6ea4df45eb4a8d3c0b6efc5a6 |     
  mips64el   |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/0aa6c7386d27a244c6fbe34fca162c865510db79 | ORPH
  aarch64    | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/4bd95c7a208caa7d5e9f23aed6feb1bf14dcd283 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
