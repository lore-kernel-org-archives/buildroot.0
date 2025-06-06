Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB58C5B552
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 03:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13CC540CAA;
	Fri,  6 Jun 2025 03:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxSM1vXVD4zl; Fri,  6 Jun 2025 03:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3264117F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB3264117F;
	Fri,  6 Jun 2025 03:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D6E0C8
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 03:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B00984139
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 03:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpr3_qyvzXb4 for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 03:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CAF184152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CAF184152
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CAF184152
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 03:16:04 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-addcea380eeso249229466b.0
 for <buildroot@buildroot.org>; Thu, 05 Jun 2025 20:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749179762; x=1749784562;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tWVNYxkGa4Kcvfumtv9ivmeGi4ZS6x6XJtG/8kIui1Y=;
 b=aclCI58DOkS0yFQJn6eM3IV1u+CSF9S7QQZy4SjpUF26/zLeqlEgvvQvxSrjUQTfYS
 bg5oNIV1ULet6HN85pYGTm21zgZGHZXjpna05SHRqsgZEA5DpImGhy+YhexlAq6TyN/4
 lkLIu5DpsZ8Ue9QtXvw6TjTn4C3AmxlLj2XFPcm26gm9BOGCBM/3tlzjtlhhKmdRf62z
 Xu2o2L9mMz8d6YXmC/KERTMvPRIVcjXgHh7Khy9WTKW+O+5hPW90XLbd9e27MB99n9D4
 qa4A18E9Q2ks4tcMxTGYkcjUmtaI5ppU5L/LZ5G02Yc3jj/ONHCYhmrMf7CudbESxjLT
 sZ+A==
X-Gm-Message-State: AOJu0Yw7J6pS1zhCQosm7tYzOtLS10wtHfuqIduduPovJ++dvh/p31a8
 6IQF2s+fSonqdBlxCuSVOHnO3lGXvfNtgSwJvpg0uJM4yUzWpM7uSbywbVcoIg==
X-Gm-Gg: ASbGncu4e8dwJPm5402/cEaxjEbWL0hvr3Sgt+p4+kjp4kiPasWJTwjyqfMmBxRgIxa
 Vc8CmacqaxEuZFiUtXTw9mCGUGmu9Z8AuivoOzUd+Ld1wMw8p2twmk5q++JL6R+1EXZhluJipAU
 XB3OgAsQE4mbPEgyD9OcsfFHo/mfOCEb4RbokTphBf3nk957Pm9HDo0stUkPBmfivL8xP9EjWrz
 Et5ajxYm97Z1XPZgu7HcqP6qZp9Rq3S8pu9RjOBzfOayJTqAKuGsDIPuKAz72FPwLtxWmNmwsln
 aUR8MXRzZeib/3rhD8bETEO2LRKcb1VHzXvSYTlPFGWjYz/bi+IjYyPmM2etjs8TVQ==
X-Google-Smtp-Source: AGHT+IGXNiX/842FSvyT+57Uz5juoy8D9ALRrLcaMgDN+m8PBx3Tfs4YErZEtK0fABDESbtka6u91A==
X-Received: by 2002:a17:907:3f24:b0:ad8:a41a:3cc5 with SMTP id
 a640c23a62f3a-ade1a9170e1mr151448866b.6.1749179762238; 
 Thu, 05 Jun 2025 20:16:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d754180sm49930166b.9.2025.06.05.20.16.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 20:16:02 -0700 (PDT)
Message-ID: <68425d72.170a0220.2baf03.0e47@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 06 Jun 2025 03:16:01 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749179762; x=1749784562; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tWVNYxkGa4Kcvfumtv9ivmeGi4ZS6x6XJtG/8kIui1Y=;
 b=JbT2J3EOXxEBflF9grj8SjQY6p6FvJIAGHdFez9FXUlnC5S4lQ/8SIuJDiOuO0oAry
 JJV+YfsRio8uKMi/cqCxoDroDENrJXwxZItls5sq8pa50/chl9v3P7Z7pIgxX+wlMjzw
 pAmNkJn4tztpnxJ7uDVz3WpPUMIBvBqIC8qWtj7nOZ47eOeSX2LEDbqOXQrsAFV5FT5C
 Vx3mLbBF42neIexqjHUBHBNFYC6VZrarP46tnm97fINLgCSX+j8xsje34DPBhE7/tiKQ
 1LVoSxACtrvAx8N8helMFBYhlubnQne+xu9RQ3gJExYS+B3r7CKtFQ3jhMhSM9dQ7gcM
 zLnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JbT2J3EO
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-05
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

Autobuild statistics for 2025-06-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  5  |  0  | 13  |
    master   | 12  | 94  |  0  | 106 |
     next    |  1  |  7  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-8.14.1 | 14
                    bmx7-7.1.1 | 13
                   avrdude-8.0 | 5 
host-gobject-introspection-... | 5 
              libselinux-3.8.1 | 3 
          linux-5.10.162-cip24 | 3 
               bctoolbox-4.4.8 | 2 
                elfutils-0.192 | 2 
          host-binutils-2.43.1 | 2 
             host-cmake-3.31.5 | 2 
                 host-gdb-14.2 | 2 
             libopenmpt-0.7.13 | 2 
                 linux-6.14.10 | 2 
                  ntp-4.2.8p18 | 2 
                       unknown | 2 
                    azmq-1.0.3 | 1 
             berkeleydb-5.3.28 | 1 
             bluez5_utils-5.79 | 1 
             bmap-writer-1.0.2 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
                flashrom-1.5.1 | 1 
               freetype-2.13.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.05.1 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
               graphene-1.10.8 | 1 
            host-binutils-2.42 | 1 
host-binutils-arc-2023.09-r... | 1 
                host-file-5.46 | 1 
    host-gcc-bare-metal-14.2.0 | 1 
               host-parted-3.6 | 1 
              host-rust-1.86.0 | 1 
            igd2-for-linux-2.2 | 1 
                libesmtp-1.1.0 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                  libjwt-3.2.0 | 1 
                  libnss-3.111 | 1 
              libopenssl-3.5.0 | 1 
                libressl-3.9.2 | 1 
                 libspdm-3.5.0 | 1 
           lua-markdown-0.33-1 | 1 
                   pcre2-10.45 | 1 
               pulseaudio-17.0 | 1 
                    sslh-2.0.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4d2c0c4f24e98c5feec1429446c79d99602651d6 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6e48621b3dbcf0103b379942948b6231e48a3603 |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/711f373ad824534ec4ee0d06630e51a90842be09 |     
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2af796aeea0472807aa6c4cd70b66d78f6171812 |     
   mips64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f69caf1d28ff030f27a9fb67b5a9ddcfb1b3d0c9 |     
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/adc404e348a0e67c1d5ccce46929696d4598b7fd |     
   arceb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9a7cab57375ca2f4a9b67b61fe208e9ff82fab75 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/de794c694ceaa54ae29fa56fd787ef37a9082ef6 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d8318df657026ffdc9fb23b31df4c8ee029c8153 | ORPH
powerpc64le  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/e49bf37b6ec3e61f2408b4ba2bd1270d9c05bafc |     
    or1k     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/b9319c6cb4ff472678d031c0a943e89706760a1c |     
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1926e9c84e1423bfd5f78107cebfd7ba3c6e1044 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a979056c73df1141c04e63ffec9f293cace24fa8 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/f15b6b5b78458e32c670f61f1ee9e0a75d98af62 | ORPH
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7c055aa0bede46fa3d82f161425b3f08e76c0cfb | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c2c752acb90fc504d79ce2f87eecb026242edf96 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/af9798f071a9fa78adf070d795290f5302d34e0b | ORPH
    mips     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8cac83d5f55c0f4542aee49303620285d79bdf2e | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5cbc5e017e48886b9abd8fa3c86d820758afd8ba | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/261fd0a96340ab01c3beb00d505ecb3f19d572d9 | ORPH
    mips     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7999c66e68e292351c1f4f6e76df32aecf0805c2 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/9b6644218a63ccf0ab209bf37cbcdb6ac26cfb70 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/577196a4bd5bb23e9ecc48e4a1aba6a969a9dece | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/bd2a8fef5ffa8dd11f1e40ae170a8d77965e26be | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/15f12a10d61a888292fac820ad3e8be9b92fb638 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a14e46ea2191f35b51f425a6286cb323468c3383 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bd1672ad11e1c55510fd86380a974f66ca8ca99e | ORPH
    sh4      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/de42a36d7542a8d6137669a9fa01482dd68b6a35 | ORPH
    arc      |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/155d5b669cf9c542b4ed3395067e71cea2a5b5b6 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/054f2df9dc2a5e7436acc500c70e1ddc16366731 | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/d799fad05c63c54f58544a7cce8102a4ca89ddd8 |     
 aarch64_be  |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/8df3f7056ee2ef9a27296da84873373d672d3086 |     
   mips64    |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/1e8b9397e05cd1476eb11caca6ff48da03545613 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/473ffa165780948fc02d042d092741e28d01b13c | ORPH
 aarch64_be  |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/05fe1a15c6870405c9d19c6200017bd670e5a86f |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/ab89d01678b51ee254c75a4234e851d3bfdb332c |     
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/20eb165ea11f66f105fb9622f7c02806fac3e344 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2267b90e493185fcb8396f87a8f487ccf09296ea |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/280788c3a89d23d66c7c771afb50a8a904b8096c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/38f83b94c49017abe435df8022dfcdaedfb43bce |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f851051b9fd9352f53d54bd1a0b35b37b2a12df9 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/88a05b134340e14d4863fdc6a8ed8955b6c429cb |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c0b6965b10e4e508472355c0422ba49a1f13c6f4 |     
 microblaze  |         host-file-5.46         | NOK | https://autobuild.buildroot.org/results/ca121e6ef6364a4816ecf7264f02eb1cd665e3df | ORPH
  riscv32    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/bf9d03685d31f537a1c60153de51f557028e00e6 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/480453c1289ebc8c0019a3ea2ef67ba888e9413f | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c887dc09b2c76fa685cffc41efb3818f721d4891 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/740c21d42bc4ac2471026ec84bc6e9686e11fe84 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5c344659ac409b5ca03fb820f9df66f2dcbe627 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ecc42640435fe998d74b47d4d994969896d1cfc | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d497db0382d2826b421c99323da1aff0d47e08cd | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1a7fa9d22fde85e45d79bec8cd7b461b0a7a1b49 | ORPH
    arm      |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/92e638c467c50c2ba37ac1bbe3e30341800dfc26 |     
   s390x     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/ad883dda1c1cd81a1f44edd3a11662586970843d |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4cf2b0676618546061c994a321e49c82ab50a308 |     
   s390x     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/bdcbe6446f5f21d650c3379d0e5c15350fbe6c5c |     
    arc      |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/6e99e87ef5827a6bf3fb5985d1bd613b4b652675 |     
   s390x     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/e5d05b6babd69629678f4fb15f9402c74e00d9fe |     
  riscv64    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/8724c6e1b4b0214f8f8bc485197468d12489a56c |     
    i686     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/a8e7fd5ba68404d6c807d2d150c451aa26ab4203 |     
 aarch64_be  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/d717ad7ac1e1f3ebd25b8c31692b37044def6374 |     
   x86_64    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/b63f3bfffdcdf3f931106e72aec61800a24258b3 |     
   sh4aeb    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/537728a853b1a34a0f8729a6cef3a016252d816a |     
   armeb     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/0fc495d52c34017238a93384fba8438d531c61d1 |     
   arceb     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/d8ccc417d37a6c2bfbd3423b363366d2e455d981 |     
powerpc64le  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/c39f6b173314d6b0a6a88448d1a725f99d705a09 |     
    i686     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/9f4bfb62c170ba1b12b3ca56c5fe2ff04a8aa2ce |     
microblazeel |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/30b87611ea1cb6fea124e741ee077c9060103156 |     
    m68k     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/c27e1c3f1d9b1309deacb5eec27e71c859e91973 |     
   sparc     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/9a47bbdaf3d133af1feed7ddf3fb2eb195aef27a | ORPH
    mips     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/7f93a48a6674081a03ee8eb5a5f7a87e96686bfa |     
  powerpc    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/be83b708b187844caebf4c7229c53f8c0a749d07 |     
   s390x     |          libnss-3.111          | NOK | https://autobuild.buildroot.org/results/d3d7ed1fea15a6d2d691bcc445c1dc78c24bcd5c |     
 powerpc64   |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/475341282278a9bbfd9bbe215e3ab16fd3793ac2 |     
microblazeel |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/8f6629ba6fa76d5487fc35e9814280919b347aa2 |     
powerpc64le  |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/15fe1e2fd06cb67d07dfc48f4cf7fd9479863a5c | ORPH
   x86_64    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/abb665768d78ba1b00ae8270dc33f19f62492aff | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/30181e0a4a130f45c5a7209c2ee225fcbeb5d044 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7bc82bc4ad897ed7be564fa40f9dfea57147a123 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d427f50857f8470ee8032aee376f3865b3a07dcd |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/3a93b310aff0530de28a2e66818195c12e64cc94 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/93fe97db5360f246bf3f754d6a2efe576206f3dc | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/cc696b27f022e9de186a053311cf3451d7eb1fec | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0bdf2a1745f5c63be348d73f898ee6c89c314745 | ORPH
 microblaze  |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/92f3ddb71e91bc374a1beb4c889bd0b1a0ce5e2e | ORPH
  riscv64    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/e4ec4d0f046a318df56dfb529cd6f1afcdb51cd7 | ORPH
    i686     |      lua-markdown-0.33-1       | NOK | https://autobuild.buildroot.org/results/d01a3193951b290fe5f6ce03dbca53bed658f8c4 |     
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6a7cd5fdbf3d2182669615b75af83c5ab2aeb645 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9161cbeefbdd2eb3dfccfbb66424b1febf381752 |     
  mips64el   |          pcre2-10.45           | NOK | https://autobuild.buildroot.org/results/c6410c63c7ba0bec8ebcd49c098978ff0987d1b9 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c5b6c25413255dc9ccfb5ae771aca5d951343c8c | ORPH
 powerpc64   |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/296c0c712e1de932243015921b203d147ce35891 | ORPH
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/b220e4c31e362be596f86951c700b300e8592c57 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/10565c9493bc80ec7f62e2d9650dfb04a54f3cfc |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 2 
             fluent-bit-3.2.10 | 2 
        liblog4c-localtime-1.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/bffb1c53321ec1e81708c70715519c24984dc841 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/6d1c5d096b5e8c8edaa571ed5fb0002ceb60b8a9 |     
    mips     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/22e076e60c7c0a04788449c5542f46482e3ce579 |     
   s390x     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/4b0646e8fcc3f023ab0173ea8725f381e5055152 |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e0be4b7cd1bdfe3d73ba5837b9798c33ae115729 |     


Classification of failures by reason for next
---------------------------------------------

          host-binutils-2.43.1 | 1 
               host-yasm-1.3.0 | 1 
                libesmtp-1.1.0 | 1 
        liblog4c-localtime-1.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                  mbpfan-2.4.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a5284a9fbb9a66d7bd7b185edba064344fc1c0f2 |     
   armeb     |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/4067b458a9f204c525e61eec904e2316c46e78ca | ORPH
    mips     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/35e47a0165c87700ce00f61fb039aefb493aaae4 | ORPH
  sparc64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9349d32e4c9d65cea7f8160a6e6264b16301416f |     
   s390x     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/027e2f2373696ceaa13dd67c62d79bba0a1a6d53 | ORPH
  powerpc    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/608562e18900828c518eee2a4303d1ea2bd0d64d |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/fd9ce665f55af393833d7744d33daaf3f9c12915 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
