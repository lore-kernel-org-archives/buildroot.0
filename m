Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A1AD3E788
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 04:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67447406BF;
	Wed,  6 Nov 2024 04:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-1VA7b3dX1K; Wed,  6 Nov 2024 04:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A38406AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A38406AF;
	Wed,  6 Nov 2024 04:14:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B586227F1
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 04:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A583F406AF
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 04:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6n-7ZX_qRqnb for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 04:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01981405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01981405D8
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01981405D8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 04:14:07 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso991377666b.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 20:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730866446; x=1731471246;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s71ycS9wudVNQCA/qf+POY/556OkXyh/R/taYybhUMQ=;
 b=AetGqEECvdReibHXZhvZOTOJ2lxveX6hiM7fCVi2oU/qHtIvI2nGrdawwsk3pMUFC5
 5cMCuE28i9ftnaw7Wfkjw8WVxVT5OgfiDPT9Zl1eWGdxBknyjQ6AJVAlZcsqd+w9xc5W
 Vug7qNaxrB5YQpFxUVxLYkbJ8j8V0XDUhhCOSsvPK9WmfKAp0S6NhZBXXk/LGtSCXkgk
 wpgXy8z3MTLJ/N/h9Fj4sHkLrLtngOzgPLTAYCGPjXZ49ubon/J3tC76GRsV1TSEo/p1
 nHweeSI6P+IOlU1vNxKpv2xEIus0HeyKENyq2LIKm4zcas8zYTSoD1GZynrB7soiGIxb
 zSYw==
X-Gm-Message-State: AOJu0YyNL/yvhsNd51eo4FiimFr0lqC/HU6csTkwhVE8KaX4LsUZCk0D
 Fgp2FLwuAdyqu5GzAvLD5FAPAUgwD+7bQmYgBNCz0OxQYi62Qe/4eS9TYA==
X-Google-Smtp-Source: AGHT+IERJJI/C5sXLONeZRBY+v1D+ORhF8S1tQVb3GuQOKHMmZ9IV6mrH5UpqYlAbM7wewe9HKRvWg==
X-Received: by 2002:a17:906:f90d:b0:a9e:733f:eaf6 with SMTP id
 a640c23a62f3a-a9e733fffd4mr1305305566b.6.1730866445283; 
 Tue, 05 Nov 2024 20:14:05 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d66b9sm216142366b.59.2024.11.05.20.14.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 20:14:04 -0800 (PST)
Message-ID: <672aed0c.170a0220.e7fdf.72bc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 06 Nov 2024 04:14:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730866446; x=1731471246; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=s71ycS9wudVNQCA/qf+POY/556OkXyh/R/taYybhUMQ=;
 b=iRalmDMARYkfErFJWdqJJDvaTQ89VmUUyhMyt8IYHfs9PnEmSTccmx0vO/OEK8jphw
 oLWzCHfODi7V/I2DesLKXHudojjymAt+IErWhbKSysJwD7+G9xNJ/BRtULgrCEUeRTRi
 gWWmvhYQAxzxJLCSigK8qKX9nOE123pilbwlQqO1RMYlU0SR1vZWtx1KQ9DUqRZgAy4R
 d8HzG8QyDWJJMlvNQPeqsLR+VFCRwGBcyRmXmtw6E2rM/fwqD4M921BpYoBi/olROzUR
 HuEz2pQYQvTGPyn10q1QoQQ2IXQD5tsERng2fnxC0iebm+QEVZmeFQrRDlNmOdIXErGu
 CA3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iRalmDMA
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-05
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

Autobuild statistics for 2024-11-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  5  |  0  |  8  |
  2024.08.x  |  2  |  4  |  0  |  6  |
    master   | 18  | 297 |  3  | 318 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.11.5 | 18
             util-linux-2.40.2 | 17
 ibm-sw-tpm2-rev183-2024-03-27 | 16
           host-doxygen-1.8.18 | 13
            host-binutils-2.42 | 12
               procps-ng-4.0.4 | 10
             dahdi-linux-3.3.0 | 8 
  gobject-introspection-1.76.1 | 8 
           libzenoh-pico-1.0.0 | 8 
                 c-ares-1.34.2 | 7 
                   foot-1.16.2 | 7 
              host-rust-1.82.0 | 7 
                  curlpp-0.8.1 | 6 
                  ffmpeg-6.1.2 | 6 
               linux-pam-1.6.1 | 6 
              libopenssl-3.4.0 | 5 
               mariadb-10.11.6 | 5 
                  ntp-4.2.8p18 | 5 
                  bcusdk-0.0.5 | 4 
           libfreeimage-3.18.0 | 4 
          linux-5.10.162-cip24 | 4 
                 pixman-0.42.2 | 4 
               pulseaudio-17.0 | 4 
               valgrind-3.23.0 | 4 
                  assimp-5.3.1 | 3 
                    azmq-1.0.3 | 3 
                   duma-2.5.21 | 3 
         gobject-introspection | 3 
host-binutils-bare-metal-2.... | 3 
                host-go-1.23.2 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                   perl-5.40.0 | 3 
                       unknown | 3 
                     ace-7.1.1 | 2 
           at-spi2-core-2.50.0 | 2 
             batman-adv-2024.2 | 2 
                    brltty-6.6 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
          cryptodev-linux-1.13 | 2 
              fftw-quad-3.3.10 | 2 
   host-mender-artifact-3.11.2 | 2 
                libdrm-2.4.123 | 2 
                libxml2-2.13.4 | 2 
            linux-fusion-9.0.3 | 2 
                   mimic-1.1.0 | 2 
                    mpir-3.0.0 | 2 
           oath-toolkit-2.6.12 | 2 
          obsidian-cursors-1.0 | 2 
rtl8189fs-9a82349c2c40515f9... | 2 
                wlroots-0.16.2 | 2 
                acpitool-0.5.1 | 1 
android-tools-4.2.2+git2013... | 1 
                 apitrace-10.0 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
                   botan-3.5.0 | 1 
                  brotli-1.1.0 | 1 
                   bullet-3.25 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.2 | 1 
                cairomm-1.16.2 | 1 
                  clang-15.0.3 | 1 
                 coreutils-9.5 | 1 
                 dc3dd-7.2.641 | 1 
                directfb-1.7.7 | 1 
             docker-cli-27.3.1 | 1 
                      dt-18.32 | 1 
                   dvblast-3.4 | 1 
                elfutils-0.189 | 1 
                flannel-0.25.7 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
            gettext-gnu-0.22.4 | 1 
             gstreamer1-1.22.9 | 1 
               harfbuzz-10.0.1 | 1 
       host-gcc-initial-13.3.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
httping-0e26c53d5fe504eb720... | 1 
                  jack2-1.9.22 | 1 
               libdvbcsa-1.1.0 | 1 
                 libpng-1.6.44 | 1 
                 libspdm-3.5.0 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
                 libvpl-2.13.0 | 1 
              liquid-dsp-1.6.0 | 1 
             lirc-tools-0.10.2 | 1 
            live555-2021.05.03 | 1 
         lttng-modules-2.13.10 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.20 | 1 
             open62541-v1.3.12 | 1 
               openblas-0.3.28 | 1 
                   pcre2-10.43 | 1 
          perl-net-ssleay-1.94 | 1 
        s6-linux-utils-2.6.2.0 | 1 
              skalibs-2.14.2.0 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                   thttpd-2.29 | 1 
                 uclibc-1.0.50 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/0977666aae394b40e83e115c1b26964972eb153f | ORPH
microblazeel |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/58b3c6ac07e6818ff9daba8479149096e5a1b6d2 | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/6cf368a88712aa4995270242c998ec9e63bce334 | ORPH
   s390x     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a9f9a5371d628e3b42f705b9e6f028828d3873d3 |     
   arceb     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/d62d9016e01538f85c85f68c816577363c78ebe7 |     
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/9541bd2791180e809da530d77988ec0966f303cf | ORPH
    mips     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/5b386216476cd2f0bc11ae054b4e573c12c902ee | ORPH
 microblaze  |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/41553fd1dd984eb871f426d9288e2ba6a3a9cd66 | ORPH
   xtensa    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f0998037847d2c2e0fda5064c3b2050a9f158796 |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/fa125140d40ad2c209b8394d3b12b5fd36011294 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/b13d5f70ca44bb38ff43bfa89c93563b0924357e |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/af40dcbe4b8d4c974ff82a928f254d877728a60b |     
  riscv64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/23846ba7982f11d744af19da1b5a3df94729ef59 |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/caa1d4974dec5d25a8b8be6beabcf2969391ee63 |     
    m68k     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/b899c98e022150bb0e2848ef2cb1e1553b7cc900 |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/96662f27403c073545d9ef1ffa9baec53e4a5761 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/a2fcc04e8ec36ddb5e6a41871b92ea38305baea3 |     
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5d2d70379112e51675b34d9ac94147ef78f8c1b9 |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/bb50dd518f2edb588efdd9eeec64499e057a4c81 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/ac8aef61112466e8460a606057798dc2eb12560c |     
    sh4a     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9be180b3675fa672be66de9d5b664bb0e065bddb |     
 powerpc64   |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/95afa852b4f3ac2b02ac002dee29b5a9e1268ea4 | ORPH
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/f600959ea90b67b89034a7d2a388477f7b08e70c |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/55caab9abc82e891bef36a5f7814f5412ab576b9 |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/ca1c6f9c5f0d0db09df8b98f2ba15a377b9bba04 |     
    or1k     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/adcaa25c3c91a19e89fea95aa1c496e82b33340b |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/a5d042b704b7dc595637d5cc05e4c7137ccc3d60 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/ae83a6c3ebf6f1d7484721110a1fd334f7f1377f | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/cb4c2cf8ce5a4420257ac46d6d83c57bb96a465a | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/f35cc02eea1b049483252fba08e65ce730c103c0 | ORPH
   mips64    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/1e48573b290ae14f9427900c07c1161880ef3586 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/e062c93218db5460a4fd5a4b4be4308609f2cb48 | ORPH
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/dfd906d7f75db7d51f41210caf0dcf8ad7a65f17 | ORPH
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/25159b1de47c88d99b490b3e8ad348a6690339f6 | ORPH
  mips64el   |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/49712df8c92ae3afcbdae4adc48f3a4f1d8e4574 |     
   mips64    |         cairomm-1.16.2         | NOK | https://autobuild.buildroot.org/results/9a907f0bc808a7de923411e25c02bef681fc61c8 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/0e8303a7e61880147fbeb9efab985f0738681e9a |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/cc932c92e2ea9aee0e60ce5100eebab4719efeb8 |     
   armeb     |          clang-15.0.3          | NOK | https://autobuild.buildroot.org/results/93ae2f9d6925fab9d5e3bf30c4804105ccf345e5 |     
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/45090b138b30f93c1b98c812c56c66285c2c5942 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/3b463a2b06c6e27999fcc456504eeda76bd55bcb | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/4f059570560bbe1ea448faa9e42eefd20ecc27bd | ORPH
 aarch64_be  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/cd2cdef0688495cd7c151e98d39cb9a4243f437b |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/18afa35d06e69dfa58e2a1e33200ac23446e44d0 |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/c1c89ee0e7b36786ed4056447819ff0cb4395cfd |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/53ea5974a6a72d1ec4e111c008b36cadd2193c67 |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/fd1418026eb578dc37ad3465728ff2473b144883 |     
    mips     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/8962217b6314f811baeffc232f055a47a5c20151 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f032807db96a42713175dc81a37d37903ce14fb8 |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f36d257471383f722499cb393deccc55dce4a3c5 |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1c309cc1d661110c1e4bebb9edac7f809c5828b3 |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fcfee860b18ad3f2b75e019c33683bf6315564d2 |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/86dff53099991f5742535d31c32188c1db4a73e7 |     
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1d2340a9cb138915df6fbf9cb869095515572fd0 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/368dcfb9081deb5d231130ba8a3bd403d8989052 |     
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/75fc00992d9edb48bfdab65949f5babe4fb1f4b5 |     
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/5ee10b48305673ab5619b74856b6c9ac33178215 | ORPH
    or1k     |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/042d63a40950475b1058bd54e5b7e2771dc8bfc5 | ORPH
    arm      |       docker-cli-27.3.1        | NOK | https://autobuild.buildroot.org/results/dbca95d4f19908f7b3f4c9f752c14a0ed1e3abd7 |     
  mips64el   |            dt-18.32            | NOK | https://autobuild.buildroot.org/results/4a1a65dfa94b110edc6514bcd4c4465e2eda9fd1 | ORPH
    m68k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/223a0833b7d9357ac3d6d557fa0b53bc9d0abbbe | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/1f1f0643fc4db6fac392b19a6f92ef45e7585b4d | ORPH
microblazeel |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/4fa2c45d74ae1155b1d3065cf9c35592986da582 | ORPH
 powerpc64   |          dvblast-3.4           | NOK | https://autobuild.buildroot.org/results/25339c3a678b9778138db3b125bee7f55f9b64c1 |     
    or1k     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/1c5156ed983626f3ee79e556b412804b7501eafd | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/cda344d8c1ef207b4c68f63c7b41b29f36572c63 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/6e4ed2a99c7ccdb89cfa65850dcac83778e5656c |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/c372a5dc92976584f3d344bd753dc801db4d4be6 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3a99a7af711a9ef8c163350cc2c071c0648b4d71 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/bf85eba0fa09ee1493a9021d83cbf777d954a8f6 |     
    or1k     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e2ee9211058defdc060bec79a62efa5193d98f42 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/be1facf3a607a8d70ad0df29ee0f6c9dbc03c502 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/1ae67b59bcde6b9d1a78afefea863874707e3fef | ORPH
   s390x     |         flannel-0.25.7         | NOK | https://autobuild.buildroot.org/results/fe3ae2674aceb990ff2ebd9d555daf5c843c94c3 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a7973144bfe0ea3ca535914484739a75fe7bff7d |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/725b54fa27ffa78b264362f20e06789bfc48695c |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f566c3a741a26877dbc18cfb817345846015781b |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/894dac9a38080dffe47263abfa7d4f5bf9adba85 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/16fb8ef324a4bad1bd41d04c315332c2a03e8809 |     
  sparc64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8f58e9ba35e1399e95d3cae38c20874a0981e7b2 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a1df2220ed91b5f07837a546114161870c0d581d |     
   mipsel    | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/f0a9a91091c09f2ace03478beea052f588346ef8 |     
    mips     | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/bff7b7a3cc8aa363d99e75a682cbd89a6b4f5df9 |     
 powerpc64   | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/77ea9a7fe198e6c656e9ae85b86dc5a7f13d6b71 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/0c5fd88cf7d7cea9f53f1c552ad44ed4c3cec993 | ORPH
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7faabc928e08297ac5075433ae5b3e326e82d0e1 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/25a99f2a16940acfbb370fb05833604f7c219efc |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/e319f803441a6e082d0d2ee7b1b2629082817a17 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/bde04e046eff1f4f2a213857752b5e8165a3e7b3 | ORPH
  aarch64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/0de7b81fb991f158b23c7d0375b42fbe5d80b998 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/40335cd0dfccd8c7f791ee6ddfd647b24e8446bb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6f42db29c553bfd06c8772d79a2eb28885fa0134 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a19270afdacdcd2a62ac294dc5819d9407e3fdda | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/30e59fff06c82df3611a3586ca46fb64a80bcabb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/27d4fcc3f3d880a74ca549f75adb0e09299d7e8a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1ac91667fab5754799dbc339b93114ca42d37a9e | ORPH
    m68k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/4b32e0fdbf0f816265ea6a9b4abb6cf2a1801229 | ORPH
   mips64    |        harfbuzz-10.0.1         | NOK | https://autobuild.buildroot.org/results/52c386d04773446f30503d4837be2e7e7dc12231 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/adaaa065eb9e156a653dcaedff0340e28c599ef9 |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/463f962e5370d03911c29a28288afcae0ee12292 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/45d7449a844b71c926d8fbd96070ca8ab5cdd67a |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/432cdd025cdc325373569d5b1dce3573ddfc5637 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d2a2f77cbd91cb31d2ec4aefa15892afd594feeb |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a2be345b34abd0af2869ff28f2a94d09015604fd |     
   sh4eb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/56c7e84c4b261bb0b5b0456dff4be5556050a896 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/cdde59aa5bb0edccf00bf3dd8a10f78482f15241 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/647f60f6c2f5039976bc4daaed3d0492fd863f5f |     
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9515fc11eb0153e92900a458d7bb4e416cc55908 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6e9eeeeb6a8ed16f3de674e505008854936cd60b |     
  riscv64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b263cdcdba686e21794ed70c041b8075a4062677 |     
  powerpc    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/c74bfba2a3384da059a2ddc7d7c10dfdb882d7f7 |     
  mips64el   | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/f7bb16cd2599726d99de7af09f938a96980cca02 |     
  mips64el   | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/1637d23640bfeaa01bc384aa17f2e894733a068a |     
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/d6b5bcd8b84c721ed50adf24ba900c666d8f0596 | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/16d0fa13f64dbde340ff8ce0dcb059781b758960 | ORPH
    i686     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/46b2802713b0857317bae2b0ca0ab9f09bef4165 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8944a2de3c690769590615113a5a6749f44ab671 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/59b4f8a9d51dfef72889b299dc8d212e76a970da | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/f3fdec584266af2637a7a8493fa53b5b879d7786 | ORPH
    mips     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/5563d1cbed1fd77ccb6bd2730f7ddc0cd621dd88 | ORPH
microblazeel |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8fe0a3c2f0e02adc67440bee7649d6dff7af3f7d | ORPH
    mips     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/dbcb65ca659673e9d4225840771f9ed51f56e04b | ORPH
    or1k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/307684aa2b2db71d66befa4087fbd5cf7a56fc9b | ORPH
   sparc     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/ba4a63ef18f7aa031505f1e977cb84f657eb46cf | ORPH
   sh4aeb    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2330966810dd6d45a36f765704db8b574fe40d0d | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/6b1783fbf5ad7c1a149cecc964cb5cd06a114820 | ORPH
    arm      |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/b8195e84b00ad323dc7452cdd0525ee2f582049f |     
 aarch64_be  |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/64a8e143f2daea33fe59ab41670b5351ca1ae295 |     
 powerpc64   |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/2f337b4bfd30432b1fb62d077644081eebeba282 |     
   mipsel    |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/bc80378ce634e48bd4c301d9dfcac70d2c43efeb |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/991b23c23055eaa6ae95edc1f9e96616f151cc3d | ORPH
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/5a856a1eddd6dfb4b657b9c577cccbfc2aea6409 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/53d7725e66e6cb3d429b719df998ef9102bb83bc |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/bc3fbbff5337c90d870bdf36f81da93ea936a430 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d7147a13e84028265198023108ad3a1819eb693c |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b45e7852c6dd2659644ecbb7da041746620544d2 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c4028b92a31ee4825f78cef4bc7bda375eb535cc |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e0880584c9b553084afdaf54ea786ae2fc5beca6 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b0989ea967994be732387f6f83945f5f8ebf6247 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/084a32b849cdde51cf779807a2754be75ae9ff26 |     
   armeb     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/3ef94a2155828a0d58e2ded6cdf1febf2be4c297 |     
powerpc64le  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f11e975bba326a376c0d21d93ed150ffa9186baa |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9ab98bbd17286f9064b78782531810b6f0bbe0f1 |     
   sh4eb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/78c268ff44a1b83c66ad1add0ad8201fcabcd9ea |     
    sh4a     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/71a6b7a45cfee3cc378c26112ece18f875f27314 |     
   armeb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/6eb99c57cbe68680d72eaab0cba523b2220a953c |     
 powerpc64   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/983070147f1710d7047566c18da0b52ea25c8181 |     
  powerpc    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/5dbfab174dd2203292eda56b1bd133f22311a1f8 |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3e7e1e5fa855968bb021f3a47f6680988771da6c |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/151b4715848067df23a54470b76a5ade6cfbf1cb |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c9b070472e22463977459337c68809491d87ffd7 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c3d1df70c2a0308decb3d50e24b9526333913633 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/be5442d6e3dfec04f87f10c56af90807678d9796 |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c1c759f760f45b5460bd224fb5134a96d95764e2 |     
    arc      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/7b64800d9aecb2c09e744bd1db1ac16d20fc1a68 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/c6ef31f7b330489064d767738149cdca3a536689 |     
    sh4      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/65f7cce58906bcfc8304f8cd127a1680a99cac81 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/b2a5815a33acbb8edb071fd06b9d3bc9b20fc803 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/ef7084f49c1c404c39c436eee759d857ec39c494 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/6d72d1eb903cb0f3f2ffae88aa12c6e193548adb |     
  sparc64    |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/5dd53120eac37f8af8ec341620a28d71673d0c44 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/d1c3bbd53731b55d63a43cc314be20463cfcf28e |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/a99908fe442c7ae0876a0d1d4d63513d30543a9b |     
   nios2     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/35e0d1a482c201dc39765743eaa02b645e6d4c5f |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/419123c16acd9a91d942905a15d72eeb900f1558 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/037c30b23378c922847b5e2f1328c4d4266a585e | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a5bdfa8e25e89792c44f5e55b0eb38b8e0ce8ab0 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/9ae6a2b04e7d2e94401e48935981c2e763cbed89 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/b941513867ed455ae6aa7d21f611ff723aeecac5 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/11a3e9be27bd6188ffc75ac0002e4cf1a87fc92e | ORPH
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/54d8e7741112fe278975449e7f5e751b75b8c886 |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/88cb77a2e6b46028f9fb7f0325348a1b1b8fd931 |     
  powerpc    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/972927f94d5108a5365c604c80323e00819afe96 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/a0033b370bd944a199c9c27ea12c0c2f00ac5976 |     
  mips64el   |         libvpl-2.13.0          | NOK | https://autobuild.buildroot.org/results/50d64ab2d547c70b39e2421ee2763d8309873125 |     
   armeb     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/f3c32647272e062c7699e99a511a7bb9c8548279 |     
   arceb     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/0d70313e77dfa81b77aa91d1c93e0e1d9afd7005 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/8e0da0db53834d46aab22baf716658e47a842a54 |     
   mipsel    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/6d78e15efbbe8342b9920c3e6294ee7f573ba601 |     
 aarch64_be  |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/d4f18f3f217c9745cefbeea1dab289d72a39fb3b |     
   x86_64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/8c4dd56ab653383cef35adf8eb29cad67cd2077c |     
  sparc64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/d5df60e6cb77fa8c5347c6e1990d66996fde185e |     
   nios2     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/b408d88017a7e80e908e1ba8efdade9da602a53e |     
 powerpc64   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/852a05b3a86d243515cb173b757cf6c7259e752b |     
   mipsel    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/284c629d392d7dcbc3f7be1bff85e0a0c499f07f |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/06e3cc929fd889bedb5a3729a27e7c4d5de7b08c | ORPH
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ef8ae8b17f01b9fc7eac07caa90b8626aee22c29 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f1c90427045c30dd5ed4822fff7bcc69053da7c7 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/80590da92e5b3eaf41a542cf3efd58362f65c0c3 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/67973e9c8ae8f0cee977f6896b15ec6dc46bcbf9 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/284c819880e0903fcb747071c420a80bc8e4aca1 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f26c641d77263c54a3e9a22da6fcf45fff4ae60f | ORPH
   mips64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/e34819ea0aa66693e9a2545856c2272942283076 | ORPH
   sh4aeb    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/84fc13fe8c24ad0908709a5dd8662ce8434a4901 | ORPH
    mips     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/9b3ace2b314204e492f982e6584a5cde00194399 | ORPH
   mips64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/0778b32beaee06e600275fd4606da4a9b1d0dec8 | ORPH
powerpc64le  |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/67d3c5fcf808f544b8e3bc9ef0165db96eff5a9d | ORPH
   mips64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/4419cf0e46d99ad1a02bbc80e74326bd3ade1c93 | ORPH
   armeb     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/3981951ade9c18a823af8e7a4b28b9c98c24ed4f | ORPH
 powerpc64   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/8e20e915bf95fa7b950a19cde2f6cdc4af5560b7 | ORPH
  powerpc    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/82c9fcb2e38500b8b5c15914414602117b8ebb99 | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/3c15d6487f37ea73f8615e032ce165c9ad654803 | ORPH
   mipsel    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/ac01d3674640407b1dc15addfdbc62c4c3c29ff8 | ORPH
   nios2     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/8f4779b32420b7640dcd6eef88cf0396eb8b8a94 | ORPH
  powerpc    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/91d605ca12634d160cd835d8f2e3bbf6528a35a6 | ORPH
   nios2     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/dee868fd2c93c882aad22a8e4c1c4af637ac59c2 | ORPH
   x86_64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/c980c07f1f2d767140d8158ff7fcd00576489636 | ORPH
    m68k     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/c1d3182068256233e8f5a2c96a9eddf2fe0211d9 | ORPH
  powerpc    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/fa334aaefca1acf5b20ca0dd7a0f175d6e393880 | ORPH
    arm      |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/e506c370c2a56f7cb0187f88609aa910f6f639ba | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/95ae34b189a019ded5b9b45a14a58e34c064321a | ORPH
    i586     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/16a5a77c04ad1a15565f342768f938bc74874e23 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0432d1e15946f6eebcc22ceb003f35187d9d4a3a | ORPH
 aarch64_be  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5220c31f1677851629f52d74ab16b397c63d6deb | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8aed1077dd624d2c774790f2e74f2ff8c5ddfdef | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/68f0a6a78e15f650638554e2df350757442764e8 | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d7b979d5d6e658f952f9cdd84720f87f63c5c241 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/cf9a5dc8a36a23e5d15fc6c80deb02e543690af1 | ORPH
   sh4aeb    |        liquid-dsp-1.6.0        | NOK | https://autobuild.buildroot.org/results/68b8e9c0443a26057de9d4e4baad41db3e1616a4 |     
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/604c8185ffb60e62fcaad47793cbb5b403c97e2e | ORPH
    mips     |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/39c140d5310406a2c5a120b4de928ffd0773291a | ORPH
   sparc     |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/b28c1974c3fb57bbeb18816cdddc613987d62089 |     
   nios2     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/79882e482b82f0a183d495f34b2137aaf88d17a9 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/88d2636f26f05918d25ef5cc530bb2941c421243 | ORPH
   nios2     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/9033e67e69742833509f6b8d428819b71b669727 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/a217c57b891ac915cd6d55433564abad0e5e012c | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/62eab933b270c0b511056b44bba916ad68dc0ad9 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/5e5c0448c6b21b90c026bbc75df06ac417246934 |     
  sparc64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/45c47ea117a031f2c3f973d76283aa9e46a8c4a6 |     
 powerpc64   |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/b8f595539b434edf0930e605a6b1a48e4ce934fb |     
 microblaze  |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/7f0e46a53e9a3e04e2b1c77a3d04903e4bd9b707 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/343677f596293145bdb15cf8c22bf0dadd4d2111 |     
   xtensa    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f681340063bbc7e7f66cbcec0b2926329972a0bf |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f4e45dec35df3bf21a0924f594dcc84b57edaab7 |     
 aarch64_be  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7fa420028c06ed270fb0e3f7441dcc5f9ede69c6 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/52c5293c89ddb261ed0bd47a6b9df1b33c02efd9 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/09b89caa746241db6419fd5a068e2032e6f8c848 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5fe88419f2621fc91f8cc8dc4a6281010f4eb35a |     
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/04583aecd82a825601f5c84f0cdd55e957bd472f |     
   mipsel    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/d9f85d97fb802df61a170118c2d553808bacce83 |     
   s390x     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/065b8e6163fd9abacfd2309ece8d8b6419791b1d | ORPH
    sh4a     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/2c552230619abedbe443aeefe800fbe6094513c1 | ORPH
   nios2     |       open62541-v1.3.12        | NOK | https://autobuild.buildroot.org/results/7ff676af582e4f9e69de8fdf3fabe44978eb9926 | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/72397d23ec791ea006355881e70a75cec87779d0 |     
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/5b6d273b0978b2d2f14ad67b35675abfc1819eaa | ORPH
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/746d2f368c244ef6626f375a804f8eb3b7b3b4e7 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9134014788c06fa7979a760153a71b90c6a2a68e |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/e6b73debc2dba99780e89aa0bc2b2137e8bec266 |     
  mips64el   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/62cbebdd769d99335912ddfdb85cfc49cdba55ee |     
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/fc79023cfbd4b9a1af9ec8cb84187670a645321d | ORPH
   s390x     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/6a6af8203d4c02ee06c15061799df4b41bf46b39 | ORPH
   s390x     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e779bd4950e8fb122ce4330377ca8840c174fdf6 | ORPH
  riscv32    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/5e5a5e71a835776a96d88ece8c52e63cd6202a92 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/157fe430f4b88aae5b05f5f1c4240dfaca45244d | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/866b7cff54edad9094f2a25a2f41ba92fa424f08 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f13db0fee64d32830756067fc2a262d406f2ec28 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4091d65b113d48cafadccee3e7f2ad7a056e1fb9 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/37925913a1229a2216c150256839b969dfeffbab | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d9a2655dfc6ed304e7ae49701d738afb3408aee0 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/501f8951c271872161b772c6701742c305cd0d88 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c05f9cbf38c5d916961371aa70138d84cd1e1d18 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/46957c8b9225235578f4fe83dfabe0f4d3952940 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6a6375caf6e534833cd219ebc47663d8a3c08f8a | ORPH
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0a2af258a2a1b79d9b2a7e335cfbfa7b1dee5062 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c5ceb8d8e13b552480a01872506b5c7719b8a753 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4ef6b5ee02d1335709f1b89e367cfe647eb8346d | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/dccedf52810bda5da72e5e9b4e0e85a12ca67d1f | ORPH
 powerpc64   | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/602ba8ff22ca65b201bade754665e8096fbb6305 |     
 powerpc64   | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/41745f6b3d0276f8bc69f9059126f90f1f2ed1d0 |     
   mipsel    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/8aa1dd72ec8f573997a3209851154901645acff7 |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/ff4443544a475d9ec164827ab457b7b84a2cd0aa |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/8c50c6e84c309cc5db97fcfac643148156c7ae36 | ORPH
    arc      |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/94840e9bf07995a0e964fe8c39a3230c267bc0c9 | ORPH
    or1k     |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/a651c61f9e8f98072e415f970a3b402420d82f3b |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3f67e19dab78322652491ede3b904bdfd0094042 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/bcfed6e27ebf8b44f70ce0051490a7ce6825ca6d |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/eb96970458c1f4ec450b1131480414140a7086f0 |     
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5136e504ebd9072313fd4348b5c24a0d54614ccd | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2217bd990736f45c9c5f64eb11bf89b1b91e6acb | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3622b0f32e38977592c6c410b4cad82b3d28fac6 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b3de64778954a319da340e0302850001e56ca3b6 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a7db514479b275c7f97b6449b565e85a7fff9128 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b221db532d18c29a983539abe02593751ea5b509 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2e930ce4179565246bf5c767a04ffc6ac4d63333 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/354c22ea69e9801ac118e7d1c5a92cafc3cc0db1 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d9168bae269faeae7ef36ec759d9b08b9d16835b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8d11c40e4ea36d0a2092260d94e5304ab8ceead7 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3cd54dcbfab4d497c4650391384df9e260af6071 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/de1c0ef41e31851e21f613821938caeba38ab22f | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/725073c1b3452bbccdba792dc2145a10cb768dc0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/df7c93b41f63b124582e4818f876908744353957 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b1564d255c409a7b9c32317deedf8a766073dd3d | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d6306259b0a860780f52160338c350619362519e | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a38356e9bcd88f09a9acf621718547d7f428554c | ORPH
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/4940c2384b1e6ed372218f090dddee97a9e4307d | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/9d62abbd3fbb5e7206b96de0b2cca443771adaf8 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/ab20f131ab041cced949145ac7c4ab3e61560c39 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/037dd7007128b4720b5431bfec96c914c4a13d16 | ORPH
    mips     |         wlroots-0.16.2         | NOK | https://autobuild.buildroot.org/results/4d8f2a8a06a931ad67cc6ac5281c69f58fed04a1 |     
  aarch64    |         wlroots-0.16.2         | NOK | https://autobuild.buildroot.org/results/a1c02af698067eada3ed69c4ad5241ba402252d2 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  ffmpeg-4.4.4 | 1 
           host-systemd-254.13 | 1 
               ipmitool-1_8_19 | 1 
             matchbox-lib-1.12 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-4.4.4          | NOK | https://autobuild.buildroot.org/results/1c5861e7bef7798177de3cdd83ac0ea84f44e764 |     
   x86_64    |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/99b77c56c66637ce5db3094d22c1ccba57428b68 |     
    arc      |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/40ae502d3482d2ea6fa40cc00465cf9906c53d86 |     
   mipsel    |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/83cde6725bfbe457ab51a6bbccd99f9d18d1a825 |     
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/60c23de766ea7e7f183c779299fdd1204a81fd27 | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 2 
                rdesktop-1.9.0 | 1 
                   swipl-9.2.6 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/5b1b1bcd960fdb748aa1d36bf6886e0b714b78fb |     
  mips64el   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/f6bb717900e5abd56074955a501dde62107d046c |     
    or1k     |         rdesktop-1.9.0         | NOK | https://autobuild.buildroot.org/results/e31bfae9e4ede692458bf1ac7292adec82a7862d | ORPH
 powerpc64   |          swipl-9.2.6           | NOK | https://autobuild.buildroot.org/results/5004ba44c9925bfedcb0de3e0ce3103388e3559d |     


Gitlab CI results for 2024-11-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995387  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258992621  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995647  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995668  | ORPH 
                 TestFwts | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995455  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258990697  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995977  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995962  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995416  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995427  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995478  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995496  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995521  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995597  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995407  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8258995613  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
