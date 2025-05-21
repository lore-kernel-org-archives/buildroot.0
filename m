Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACD8C2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 03:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4368180BE8;
	Wed, 21 May 2025 03:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWYRuUDSy66l; Wed, 21 May 2025 03:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44FD180B61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44FD180B61;
	Wed, 21 May 2025 03:15:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F17621BF
 for <buildroot@buildroot.org>; Wed, 21 May 2025 03:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9C1F4055F
 for <buildroot@buildroot.org>; Wed, 21 May 2025 03:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qK9e6-gnVXfZ for <buildroot@buildroot.org>;
 Wed, 21 May 2025 03:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5A6C40267
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5A6C40267
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5A6C40267
 for <buildroot@buildroot.org>; Wed, 21 May 2025 03:15:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-442f4a3a4d6so40797895e9.0
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747797348; x=1748402148;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I8Gk2gnTwajFbZh6L048GHrsGwc9Hy9Ef2WemH3Fff4=;
 b=YHNPB5tWwLyfshONtU4kdKaKeaSuPvczJMmORJ6aX9bfYJYg3Pjjk5u7CCRb1vsncG
 +7ScTIlicctufpKpdBnB1PDEQiAJ5q4XxG2EYshJHc+iQxaa1OCwNuWL0gAqDcAj0Bbk
 QpZLubkthrpaG4TFUJfuF2HQX4cdkwZjkb9cKMX8ulvkcuJcSdj5Yd+iyqj/PjR3wa1N
 vDvDq5+7c8LvASJXtLkbvXeQojYxNeNXyYjIe7s77U0fStO0ApnVfYpAt7PerT8IxYKC
 2PGfE4FIRPcXX6G/k/a+aEvVeZ5Cz67EDGzz0GAGvmnFwYqdfF82r25NqOPj8HtN4nXe
 XAKg==
X-Gm-Message-State: AOJu0Yx2tKVy4d52B+XrKztL73KY3iAjuxfbYVwOdoGJDmb8/iun4MBn
 8UMJJqDB4T0ExtBl+p2ZSWovUoEby8CiKmTX0i6JRJpt7KhJd5CxROYEzbzpOQ==
X-Gm-Gg: ASbGncvgn0NNtFk32uzeanWuYyJx+NWI2oQV33U/b3Lc9lQFdcmBQQTCK/LCdAbqUe4
 QjFRQu2Q1Sm04u+jZ6rRg6ZJuOCtQ1ilW2I3XgALJiMG1XGSxDhefat3KnDPOu/PyUCILxKgQyi
 VPhf4roimWZYsOAKjPq91sS8HI4Pn/cLa0ojNLHcJwHsKC0cClD9VXQ1RFB/7uB25BvTAC22Jlx
 GFcu2I3bPTqG8K6jsKfBGIqV6ybMKos9Ju8C8ILHEgUikfxmwO00wVsDIkXAzFXTCAshlz5/AmZ
 DlIxHwMMRiq/yrIkIbOAJurfAYL1bFn97MF8UZOXaSDaFM8BlfoOxQKrwNHZwfomOg==
X-Google-Smtp-Source: AGHT+IG0jaLiFOOiSr9xSp4uknAlLLW//ESkdWRumohy9sfVjeCXmni0TNX8wMMga1woRFknaeQLiw==
X-Received: by 2002:a05:600c:870c:b0:439:8490:d1e5 with SMTP id
 5b1f17b1804b1-442fd268c7cmr181744875e9.4.1747797346988; 
 Tue, 20 May 2025 20:15:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442eb85a8f8sm151840825e9.0.2025.05.20.20.15.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 20:15:46 -0700 (PDT)
Message-ID: <682d4562.050a0220.38d5e8.9768@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 21 May 2025 03:15:46 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747797348; x=1748402148; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=I8Gk2gnTwajFbZh6L048GHrsGwc9Hy9Ef2WemH3Fff4=;
 b=cxZzDYe97vV3MMS4qJCBVznUxmMjmLcmAt1rJKkhTIUsOoJMjYGj3rPwNhYNBD6Hsi
 WU5EstA1Pswyy4jCwf+cYdod49gW31mzXM/WdgRDYub7rcP+TWdNsQ8lsQyCup0v084t
 YMC1TWHtXngxeY/Uzh08XlsV/DUUl/FvKv1qVrRVdl647/ZdJlhpTj2kKddYIqih5jOV
 rJw5nUc+BP3M+mNKKv1+dueQSThVjnd5hjDfGVaEsw9vhUrO35RsXeD+6utpcBjG/obi
 dtnGIgvRG8ughNr1TgzVjMRYmfvKyHpZ9rNChdYlJ2HzRN7kQO49wdYvmrasavOnOPBQ
 6Mhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cxZzDYe9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-20
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

Autobuild statistics for 2025-05-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
    master   | 16  | 594 |  0  | 610 |
     next    |  1  | 10  |  0  | 11  |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 101
          host-binutils-2.43.1 | 67
                       unknown | 58
host-gobject-introspection-... | 49
                  bcg729-1.1.1 | 28
              libselinux-3.8.1 | 27
                elfutils-0.192 | 24
                      lzo-2.10 | 20
          host-oniguruma-6.9.9 | 18
                    bmx7-7.1.1 | 17
                   avrdude-8.0 | 13
             casync-nano-1.1.1 | 13
            host-binutils-2.42 | 10
host-binutils-arc-2023.09-r... | 9 
               host-vde2-2.3.3 | 9 
                 openal-1.22.0 | 9 
           ghostscript-10.05.1 | 7 
host-am335x-pru-package-5f3... | 7 
               bctoolbox-4.4.8 | 6 
         host-mariadb-10.11.11 | 6 
               asterisk-22.3.0 | 5 
        host-berkeleydb-5.3.28 | 5 
glibc-2.41-5-gcb7f206537240... | 4 
                  libftdi1-1.5 | 4 
                 libsoxr-0.1.3 | 4 
                  linux-6.14.6 | 4 
               pulseaudio-17.0 | 4 
          aardvark-dns-v1.14.0 | 3 
amazon-ecr-credential-helpe... | 2 
                    azmq-1.0.3 | 2 
  ffmpeg-n6.1.2-27-ge16ff06adb | 2 
  gobject-introspection-1.82.0 | 2 
                 host-gdb-15.2 | 2 
            host-libp11-0.4.12 | 2 
              libebur128-1.2.6 | 2 
              libopenssl-3.5.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   perl-5.40.2 | 2 
               procps-ng-4.0.5 | 2 
                python3-3.13.3 | 2 
toolchain-external-bootlin-... | 2 
                     unzip-6.0 | 2 
               valgrind-3.25.0 | 2 
                 apitrace-10.0 | 1 
           at-spi2-core-2.50.0 | 1 
                    attr-2.5.2 | 1 
   azure-iot-sdk-c-LTS_03_2025 | 1 
                    bat-0.25.0 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
           crucible-2023.11.02 | 1 
      docker-cli-buildx-0.16.1 | 1 
 docker-credential-gcr-v2.1.26 | 1 
                 gerbera-2.4.1 | 1 
                     gsl-2.7.1 | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.1.0 | 1 
               host-parted-3.6 | 1 
             libapparmor-3.1.7 | 1 
                libdrm-2.4.124 | 1 
                  libjwt-3.2.0 | 1 
libmodplug-d1b97ed0020bc620... | 1 
           libpciaccess-0.18.1 | 1 
                libsepol-3.8.1 | 1 
                libssh2-1.11.0 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
               libvorbis-1.3.7 | 1 
libwebsock-3c1615eeadb0b582... | 1 
          linux-5.10.162-cip24 | 1 
         python-remi-2022.7.27 | 1 
             python-webpy-0.62 | 1 
                   s6-2.13.1.0 | 1 
                    uftp-5.0.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/a7a83e3f9596e40a20ec1b778b2485ed07118ff2 | ORPH
  riscv64    |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/227b6781d5a597f51941a2ca6f41765f4cdf5301 | ORPH
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/520ddb519fc0bd4c10f284677d25f9213eb28664 | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/cc2a25e13a19751ae782f10c6e8fef9c0a87a80c | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/8c471c1b709a93087f26935cad9843c44d9ccde5 | ORPH
   mipsel    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/f4e69471df543e6f7ca4be5db25ab466e137bc9f |     
   sh4aeb    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/a176015b7567d727815d290f34d1a6d3817417e2 |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/d5abe7e42e6d60f79816b007b53b758cd7edc8e2 |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/b07edad826970d297cc50d27c67cef9a48583203 |     
 microblaze  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/da0a3cdc6ac8f49aa2687d4e897b2c8ed89cc351 |     
powerpc64le  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/48f375942c690270244ee4658c192aeef6a72c55 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5e6a6c5fc71d692c32cd05186c44e427e27f5742 |     
 aarch64_be  |           attr-2.5.2           | NOK | https://autobuild.buildroot.org/results/d4edadab35eb33d28f5daf491082a824348c51f5 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f370402dfba87d22d5a2fe53a5f474a9ac3e12ec |     
  powerpc    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e551bd222178e2b5e8df1536a1056e237925a8e9 |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ab7ebf15be67907ae2a42aa7a4411dd70edfbc1f |     
   sparc     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ec5ae323972a16fa7f8f43736ab1c0a2f063d898 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/056554ee63746c1a0dc84d7505c0a4af077a7918 |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/374088be2fa49e776e07b50ac7c668ff593bbf44 |     
    mips     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/026bd8bf0c3b3318fffaa1f6442d4d1a335a4b9f |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/17be582210263253cb4cb45de8589b29d7c97cf5 |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/cdde3c7fcd205943840f10f2b35c55637d3ffabf |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/081a3ed276221b00aafca4d4cd767538d53e5323 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e5eec8d765bf28276d4045a4a4359bb80205f885 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/7c1505f9b9b1adc66509c989acc8ad5a6a9aa9e4 |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/7f39d6e5d37a2271f4e0e1e6afa2a3b4d371b86c |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/3e7fc3abc7ccd53da016a23e57024b5120f3efdc |     
  mips64el   |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ef6cf83cea232ea51005cab3d310afe7177cac75 |     
   x86_64    |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/c50c1135edc0f4b147850309cfa5ea41aeac94ed |     
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/470c744c375fb63f135e89fcbb6c2f4726e7a284 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/86ea92016fe837419730f980a5d36dfc415fe035 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6205b52c47757b12bfb314df2bc98a77f203f0c1 |     
   sh4eb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/1ab5b980cc7ba6f68afa988b16cb3382af8a7859 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/cfdc25cb902d020d1f561430b91df8d952cf9e6b |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c44e4315b3d97afc6e9251fc8e0ebbe81c50af7c |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/40bd388d75393d77ddd3839e7d48b928df76ce27 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ce6ec9b5d3470fcd23b7ac45a1fd9f3f11070bdf |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/47514d8f3157f496b188866f465bf441e13418c1 |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/958ec242a94825b47b4de0f543735dbca6516474 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6c4756f91af4b1a64f029ab165062d142a1e213d |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/360ea0f12415cca2e7dd1efe833230ec9f984c4a |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/dd0a765eb0c37134f78cfed61dd0bd970743fc76 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/50e2cf32c75f59cce8027626b56072ab716cd962 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/95286a59b5c41bb658471f2a083712bd38ae2a69 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/008946626d620d75b234203106a15af6fbf86b15 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/498894184a7660f3e20dd52ef05020c8461f4975 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c25082ae6fc10cf02d4ad9c771e49c5377c9a913 |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/77387ffcc9df63425ff3adbed3ea9dd15bec2755 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/82d4da7461947117dbf777f81cf9df54f782ead2 |     
    i686     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5ec6ad1a3fcdca17e6006890e63fba0b3a27709d |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/edf68a34f23042e93d8b7c6c33f7406699d8aad6 |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c7754122a8852d8eea5e9ea5d114d8da0a36742a |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/913ed124a966f85f3fe27705a1ed9d8796d6589e |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/118349d20eae2dccdadab949065f6bc6471c825e |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6077f0d6382f21270dc7b233731c23456c3676df |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3d7fc22693ef23440e85ebc46aeeeb1c79fed078 |     
    i686     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/4bf77d78de25acf35e9e7e19e7ecaf44b3d935d7 |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0cc91fe83cff66e065cc3d09db97648cfc3b5e24 |     
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3096043ad91cce2014f585105db40dcc99abfcd0 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c103410f4ee4464cabfea8992435f4c1be28ed35 | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/31329af07076dc1eea233c7bc32ee037556cab1d | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/cbde6f6c7f220981c492b3b262fd0afe29dc3034 | ORPH
    arc      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/63b8442bfd00e06ff9dad66dcdac83901856b592 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f24b8f9530351cc4ddaf45e0919fb345a007ab22 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6dbcf28e798b9ff333866e097369f794aa1c8313 | ORPH
  aarch64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/597fa6d4502f055b4bfe423cbee824398615a74e | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/54b323a03b8a1045c188cd23c468d6357219633d | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/eb81524fdc33b23f43b2a3e77637cccea5353b81 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/49a63972b28e4abc7053f5e8b12d183adb334109 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8f694f5501d8896b5fcf229560059a77076d886d | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/ad6d770832d4489ee6b448a76fd0828b3688ad38 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/aaeddb5de8a8613485bbdfcf6daa997728b3b687 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3aa253efaee1e497b0333f02f40d3282d8978f55 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b70c3039dc5f3c9faadd1ea4273925dbaa700f52 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/05ec3ad478ee37cdc5cdc92f2d2384be6088d10c | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c43ec693bde7b8569c28f9439b1c5b6838b64873 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8645469141bd2c4cf258ae1764c7ca1ef9f142f7 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/421f0d8838bbbec5472c64ccb105474c7a564ef5 | ORPH
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/13ea120cb0814bb25cac5406dadcba0edffb5063 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/fd01282460e9165ac9325a0136d5ebfcc29ead3c | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a5cb648b97cf124fca162762a4075e3d40b66585 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4bc03ac4ed1779ec7c9ed05added3597b1250047 | ORPH
   mips64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/1e3a7c4c119fa1a8eb40a98b3c70f337a10b79ef |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/fa66802c9047b08df81a2adb79e451b379db6588 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/ad63c1cb304bb9a92e60824433771b107554b0d7 |     
  riscv64    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/a4f1de34c96113d855d850f0f2997f89cd1a2d2f |     
 microblaze  |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/6c5cf5d11334581eaa2509b96fb52f36b82ed0ea |     
   x86_64    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/88ebbba03c8367f0aae838ae1e2abfb699e8679c |     
   armeb     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/72eec0c5a25f486a61cd6b9035342e53e21511c8 |     
   sh4eb     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/f187cd8ff905eb9f0a0c443b755ba94367b80638 |     
   armeb     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/dd63b27a14f09ddbb24d3d3c1ae60e2fe9c2d254 |     
    arm      |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/c6559d4466489fa045af84d5a169c4147d8aca71 |     
   arceb     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/18b05b6e08ad37769d05efe63cde12f056a22484 |     
   s390x     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/98f40aa339819a93220e7a4758bf7b512151821e |     
   x86_64    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/a9c88df03f22dcea16375272cdf2b33676281652 |     
    arm      |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/3a2c52650c4c3fec2f62c7284750204fb63e351f |     
  aarch64    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/061e08a48cd22993dde6257ba0d8dcd82ff024e6 |     
   armeb     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/db42a7d83d072207a19fa3654641f66093862957 |     
powerpc64le  |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/22c412ac57b0a010ff5062e521d7f7854aa96b99 |     
  riscv64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/56b5807cd8e64718656eae3d674f76068706c152 | ORPH
   s390x     | docker-credential-gcr-v2.1.26  | NOK | https://autobuild.buildroot.org/results/bafea72b5a413c2addf888d2b99dc03543f89044 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5690f155ac0f0cd7997494c94eb1a21a1f1dc1e3 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/627d759642f9846fbe9166a9b06950fafde326dd | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/370c7a0ed4bf57961559c4b43564019d1609dce5 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0ebf040734015ebc37c7347f591f2d26c286be82 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f5b07b50b7b75ee10cd245a3e39e737043ac7ddf | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9dec8d070336514c20ca94a096aa8d85188c2b31 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a74a3f34869465cd26cedb509f6c9a7f8dea7a56 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/859d19f45af447eac3bf885af576692f250f403e | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9ed3ca7c3f3b630b14663cc8b44a9557785daa8b | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8cd8681188066beecbfe4f70fcc4c5402f8fc3ab | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b0a90b94c83f6833e5b3ff57fc900b6854fb3e5d | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5597bf41ab1df40a568d5c28887a65c84100fd99 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e0065d67c33706dcc58d5c31c20a6af3df373dfd | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cbe7be2c126dff99c8ede45d8bb855a96e15c6ea | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e5f424981834c0669229601562093aff6f490dd3 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f46fee7798b5969421bb0eb3cf34fea25f8485c1 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a866474012fc143ada1ef6f3a5c705280e93a763 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/63b284afe3bb43a5a9320c92e6544f56b925609a | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ae9ecf83255feb1bde03cf9487944668f408d54a | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/daad25fdf1767b3728ec8d29f209a2f133d75474 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/edd4f5b22a64e5d3d4810fe74d717623a47fb703 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ce3f7ade7fd096936884cbddd9ee02361142aec6 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/68d2e6b17e14608dc83324ecd44d2f1a407b6dd1 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4cd087273ed1ab9751a0fc6751926af74f3fbaf4 | ORPH
 microblaze  |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/ac9f6fa3978d9aac745bdd686c8c9c65a85ac05c |     
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/177e6aa4c462126c6d0d4e1d00d31ffac1dd01bb |     
  sparc64    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/b21a503897d9289a141273b34f291be482b51a7c |     
   s390x     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/f20652128cd7a822ca612c8a1264d68a588fdbed |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/497522c6bac29cd83d18efbe3307c44bd71272cd |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/78d819b96928257269842e1314ceec70c19e2acd |     
  powerpc    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/58ec8694f1f0a8f159cf5bcb8167192d9948c61a |     
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/df66cf659055163d49aabfeb03426c8c364698c2 |     
  powerpc    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/6a078e4dd218286b1d04f1b412f7ec0be5e9bcd1 |     
  powerpc    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/2f1f75dbece681b42cdf0bed003b2404288fbac1 |     
    sh4      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/52eb0e7123aabbb01d3725a48ff5f935b8eece7f |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/69979b6a83d8e9b3daefc33d6cd24dd98e9d6df5 |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/07b28b4c62aa8435a19f668ae719917837b2dc18 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/c5b6c34426766525a2bbde16dcc21accd542f0ad |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/0c7a211387e93495c8b9ea7e74034541cd646d88 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/449a53c71dcdc51d2888a0d4153b7c3daf9f1607 | ORPH
   sparc     |           gsl-2.7.1            | NOK | https://autobuild.buildroot.org/results/5bc4791c66363ab79edc1b93b3dc02f22a6e3d06 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/96f09a39ad1fc6d6e392d3e357dae49f05fd47c4 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f96e6a935b84f2dc028e14018f9890e3d6eaf845 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/cd25ef5a6a0e05cfd203e8492e2110d72c9a6baa |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/2b43ed515ff7f972aab0c4ac9fe7f6cdbff781b1 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/51a5ed91dee7cabbd2d4cc6a6247223d29d013cc |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/23de2f5acdb6b4c9e645eb92d220254697491ae5 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/90bd9a4ae47eecc3f5dfb3b7327a33f8c8f09f4f |     
    i686     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/75763c4e54fdf3cb925a123fd1e6a07d694260b4 | ORPH
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/486adf8fbbb15b486b5176135e58dcc412efb5ac | ORPH
    mips     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/7f532224550037167283394ac9171c885525de77 | ORPH
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/a6503ef94205db3b7f334e07924324c3cfb7c69b | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/89f8f828665423c888dac12eed2d508a269950f8 | ORPH
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1df6a371a90f24e2dc4e05228fb1c6b54f2317c6 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d816e32891f7f450ccc3b8f6abfcd857d8b1135f |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8409835708b4705f2fa5bd8d05b9f0b050e113b1 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/93b25bad9e93f35bc44e6cda6d321fee92e83f41 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fd65be8ec53e0776b1921c7c5b214c00eee2f15d |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ff3e19353edf8a7b78697e0c69419644d59b7c7d |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/68a45af1bb05fdcb4da379761e3040116d3d83d7 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/04b20cf60959a463a2deaedda3f13574f2db576e |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/560a5069e648d30e940bf133934c564c64537b45 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8243d1f6ca9f95e9b176fad11a5e133d760a4a88 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/14d3a9dcf5019491e548dcc010b80f5c0c2fb19b |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/09c5ad9c02b21ae472adfac93028565275d143a9 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/063a4a976da088b2389c4b99a48ce7c26e7af8b3 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d7ae5b2ea6f6606f2976cfc0df25652fe6368565 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f7934f20d55caac3ffd2f23ecda1b96469e52f59 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/62526ecd3aeb17d707d3a992606d4cea96e3e821 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9a0c4c38ceb141bdaf2c6519eb912a4c3cb2da6c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e974711357d306e89a00802a9b288549fc367170 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb18a392cd38b4b9c7ac36aca3feec3ffcf3dd6b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bcb1909eab56cd9c456eeaf37ede04149bc611c2 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4d7638586243554c4dbb57d6d3950da7e45cda2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4689d1456943007d5d72fc8d3ba97c4155f1cd9 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8af8c2d6324b2a92f3b32f2a8acb226d9f9d1901 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9d0406f29eb3751dd9114bac240595c504fa6898 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3f8699ef568ac8ee8c6d07b8ee73eb3cd0b76fd3 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/891f6cb20042450bf6ea43d3757a14e088e5b1c7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b89c1c6d96cfbdff120417bdc76fcf4ec5a447e3 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2db04f771e3255a354f93b34fcb77493fe56fa9b |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a883c688f0e5047211ca2f6fbb47918d5a1bc3b4 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a92c8ee021f30d5b701c36dbef822bfbac4a7183 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fdece7425f420a85f850df079ebd461fe0769b98 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/19fb682641c9f2e20a38d76f8954cb684dcc82d6 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9dc3b5197a92216773188b7a0ff06547046a8336 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9d45d6b6625f7397ccbd6c47a5c13c382619728d |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/df2b1f6c2e434b565e1e2adff85e639f1e37666f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4c22c79828ece32930adcc6607a26384b721f4aa |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/06196bf78dd2778b21949c0f01ebb7a335323d47 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9cc83eecc1f297ef0aadb8b4b46f4f2c6b646baf |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fd1d9e8da9fd3b745f280ce13e81266ab2937f00 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f96f7607e4f9a6ebcf4ac00e964133b06af6c238 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/29bdca1da90ad5dfbc11388b2b3a020b26967cd2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/091d2336d9dcdb6b3d67250143a827bdc73eab8b |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/68233ad734eaf76a09c1b31edd5f7ec39afca2b8 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ae102b30e7c32ccd4f2573acfc4cc2a58aaf1a4b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/14ce511b31a8bc56b4b0e3b835ebf035c23ba3d1 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b54b8da2473a4e774035e3d203383d8a3c991488 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bccf5f0c8c840dd431a326c6bbe2406512d38037 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ad4b20eed5cbf96d71b3c1265a32e7c4f394a84d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4efa2a0f8652e88c8f0909e7c15fb8c460961eef |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c58bf33aa2ba31569c131b48d01b9116be1862d4 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9a14617211d4797aa043cc19864b6e40455325dc |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5dcdfbb2763d2fc3cb9de6429938166ff85400cf |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6b952006c2ae97cb6435951709ec7e380bcf1fd7 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ed48d702c9d208ec33cc955330d41a671b161aeb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dbb7692c071b1b07142a62e4abff0bbfe6cec3e6 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bde07a1cfe954e280a0c40a7f590dae4fd17dee1 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ad261bc8f5794e58fc275f3017d883fb95a51e2f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a27a39e67d9bf3ebf6a0e806b15715fbce27b9b5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b411763909e49feae8cb5997998693285cee6bd4 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cd9cb3bfbc1940e4e36b56259e99e91a3e859be7 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf41669b34e7544bc44c239e5517c1aa0575bd26 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2b348005960dc82b8ed64cedcada4f166b576025 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b1b81b1ddecd4d5ace497909b0098cdf131d7683 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/96c24f93dc90078abd2cdf810282cb3b661d5a3f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1ed3d1f58c48f6a0ad2c035e0293521e32243502 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/472b8882ae0436bfda89151c97f3c112e26d3774 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ad2e4747e914905f7ea5497defb6d987595c362d |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3eb43d2c05d9ffc25178473c28e299a1d3988766 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0dd3e30a5298331fc9656f6075eb2e4d0fa55ebf |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a99e993ad4cbdd6bb83414bc962c7df3b6359820 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a60b70f2557a1f70493a86e849672cd15511a954 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4e41652e9169376959b8ef2269886ba98616d563 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f8fc21f0a110a1e316d62c54bf6b3a125f649d93 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/020b63ca5b4204118e635b1113bd160f8501f1ad |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d5968b563574cad506f391b55383bb8373c92d1c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f5db44a6fc19ee4839549c3fbf593beb10c67a66 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0bb06772d96fedf15fe2e68c7f585e6a717bc504 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/17bf46bbb30b3f56f371bbbd095e8fd0165475b6 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/54bca3219ef928475317aaf3882d02579fc2108e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b8718ff989b1d2c400b9840aa1ec4c716cb55f69 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/40c272480fe8079d59845cbd8791f2a6e2812823 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/11b39af0652b29c32b5b8721230df03d80178610 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b7993267d3185b025b8db6f4389ab842f18a205c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f03ab101225f9a0d3d8a047e473c03b7f7ad51b3 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a7db360bf67eeb5ecc81b21a6c36a4f6aca95478 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3c5841a21921b985950cd7efded9fb3944a950f0 |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/12cfbf54fb6726f100f43150a7e82226af794bac | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9abaa158388843d0a2a288c5000e5855a358b6cf | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/2b017b53adb44634f43ea873901040e5ab909afc | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/12cd8c04d45d422bdb859a9e27998b4cd5945e5b | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6f54476b0da3a7b35613aa97d34bc68473bcba31 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b89b877e8c3342b6ec996dbb7fb351b68e4ff62c | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7066f7d35261cdbbccc3f64caff257896426e283 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d889fed0a2dc69963f122aa3bb5add59e8446931 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/47991d9e0cf84bc5dce41e2a8ad24f2d4474b4a4 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b19f796a16e5be52e5705751d3b3197ba2c4ffac | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cd3e9362741a2813d5bd03919dce5459f5482a8b | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86fcb377538de13d46aa2dd01dbb77fd1f2819e3 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8e8ce18b94ef106c07036ce71c2e5690391476f3 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e2dee68bb53a2f676dd581c83c0eef9e00ff3f97 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e36a6fc2cb4b5a0ba6ba57e94cf7bf003003efed | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94e1f39bf51ec39d59408982f9530e7a896ee8b3 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f5851d2fc1787f3b4649ac9cfca6c1a53e58944e | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1db927c29f8d93b6158e7606e2ff1583dbcff74d | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/af31306ac264442b2c0a53d5c0d78fbae8cb2122 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/20c3f2a8e9ddfb0dfd7d8f126b6bade3236d498e | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/07964b983b9b0ead18448e15de11c3587f564361 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bde568e983257060398b895cc6a97eb1aaf79540 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9458a81d6f905b1a8af0fbbf657686921f45fb3f | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d441472c642658a2c3b205b18835aeae95c5c9d9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d8c4dd03fefe4041f3eb7f6363cfba0e60a7f41 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b178420ff69044af66856c662b0a3facc60bb669 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3194e24ad373d8e661bb48496e1d72b0e0fc786d | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d23a5f3677c0726a2b0d492b8dae07c14757604b | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/de89aed2ffa95bb6d0565600bff033b6719bb190 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4a559a4f4ed8ac66dbf3250d562d5fa67cbc8f5a | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e1970857da8a9c8956c82a064b6b564982b20d23 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/285db096cb777756b7d78f584121d46613311a31 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57d513be69b636cd29ae3063815ed0f9187931a9 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ff7c20a66656fe32686c3512f8592efcb042a065 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2b2cb749c36320563d7d58f0b63ec4083f0aa67c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15d23b55cabef6643c14b4ab7e4128966b774cfe | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a21a09c7b1967b38cc9c4824dfb760f100c24059 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b13b6ba7a5af044f001a432dcda51ac2460700dc | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/abb6e3cf5f9f7f5b9d87e2bf5a25044e0f1dbd2a | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/379abc114e7131b0f1c51ef0ffb5ff259e910f61 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/805e06685ace1cbc1aca9fec9ae86cb87917f964 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63ab5afe2814691f7179693627febbb742f33626 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a386bfb0f9847d1a187fe5294fe3357947781c43 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/47caee18f0272dbb5bac21a9635905966476434c | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2b2b5dc14e0add4e03a254f109de0d6eae56f983 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6d4557d67a32cf17203c1026cfd77eb0a7175300 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a35f9c7cc00bc8ee739e9738efc2a38868ba34ad | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f34147517bc7b002baf6956dd075dda01af700dd | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8591df3effce4c5212ff176c2ea14441d6c06d57 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8d3ff61ce58714dc434cf6d9cd7f532fb6d437cd | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/72cfd50b1da3e7bde6d117895a60717359eb97bd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fadf6166cd0b46b8ec8e76276c1577a9eeb41fdf | ORPH
 powerpc64   |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/c7ac379c0cbaed336dfb378dc8ec8ae051f8595e | ORPH
  sparc64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/566b0393e672bf79a181e731ef0774f0e329aabe | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6c6e52dff7007a2daf1739ea55eb57c26b9c5e90 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b1616c59fd135abd57b74959d79b1c2970d79407 | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3610be0f1cc135158580d89b62ee0917bb8d58d6 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/41830741bdb22b8b78eb01a4f1ccb8d3d60bf151 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c9b3471c69d01f80d3d430f459f91bb489dc336f | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8fca218a219a74eef0e4d0770901d838463b131c | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/56dc896390727926210b78be6507af0b9061c576 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ecd06e1b9c076e37ae0530869fcfb49ecc46e0aa | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5656ff48074ac9c215d16e5f043e5b66d443e4f6 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/791504fa43fc5343564b6161bd2c3f6551faae5d | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7389a70c3b00d4c1643254be1899fc35f477ffac | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4511724489825387e5010c0824aac7cd7ce64191 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/eae4737676c418510003884511f2a74c5e32fc33 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3c5beb0bfa54ae625e137bcc72717de8fdc9f2cb | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/912d7a2e6d3ca8f8cf1d674bbd1a3e428fb6fe14 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4118e9c2d3d3fcaa27e0dbc37903e4b34cda6334 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fa3495ab4747d399189e189f535d169da9363bb5 | ORPH
    sh4      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7e099fc73392d05a4836f9b12e413d20ed570c07 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/27176c99b22bb6953df25fd37d72662536af392d | ORPH
    sh4a     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/974d493201e12792b657a6bd424162e235b2ec0d | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/16b63c7fafd8d6b23e84a537e5439bfd826a7e2b | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e29abeae6fa62234886eb70dd7c10d51fb5b324a | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/11847ba56cd1999e59f7c2fea891a3434993497e | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d5654b882fd92c89b852d371ed33a643134f4d20 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4ebc54f6a2d22846b5bff03a519ed34c1ef1106b | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/182da9d29a3f5c277b99b28a53878a25582f27fb | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c2dd7e692a5648720cd34906132d66e2e8f57e6c | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7cbd1b0d7a91ffd2e21cc29428e6761e482e7a3e | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5553096eb00045d492da9171738b1aaad46d150c | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ecf730dcba58f32edb65c7a54e094444c07924ab | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f542aeb06b849e07f28fe1795fc4d3ca2c833dcd | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4bb724f016c560e3024a622c8bda5e2a19b9f5b3 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e6a9ede4b8a6587f7dc4df061668cc26470e2352 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e9e4ac4b309dd1bfd27a047855b31b1214a32987 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/655ac6a363aba60c41b5d54a3eb08bd56c46bbe6 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3c1c4e1a67733f74813f0fa304d85bb016b7259d | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8d89e7296531e1a05ebea862ba4b325420a00219 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/89add16d1354b01d14dfca4c49cf4761e4ca4d8c | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/94f486463720ca28d9fe0c4f66879e030f5da945 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1b1040d100c501ad72e16dbcbaf66e33d9b6e4e3 | ORPH
    i586     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/84b462bd8e4f6aee135771166a01d82e609142f4 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b5486567415acd5d508f8edd21f0016e4fba41f7 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/52211b5ee3e67e1a9ab7a2593b4e6f79ccd8baf4 | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/69f150cf3fad816cecefa5a64e3b1bcbb0342738 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8e4920611287714d06b99ea290338faaed486f74 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/67e492586cff3ee5cbe6ded2ba765a7e2ce5463f | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5edab6cb7ef9e6a9b182ddfa3bd0c6849ef24a2a | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/02ca80dbf1dc8fbb44a1ebdb9f407f4a801cdc6d | ORPH
   sh4aeb    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2f5ce006784d86e02f49f7b46cfff869301fa88d | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/06a58319678f7de95ec4e52b1fe7d9106dec49b8 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fa9af5076e0a0ae2f89bdb0dea090727114fe413 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a9e14950c910b6734d606b9771ecaf727e0954c9 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a487bdf5afff828e45adcd5bd66fe4cc67ab5125 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a45e0fb024902ffe368046cea31b3d8d003cf020 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9fce4e8f6daf6dfac0f408afc0c8069afa818b82 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/76ce383841b65e12f434ab8bc579c24acb1cf478 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/32004cd2b7ad2056bb684b5cfd0d42495618b6ba | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ea30026412637bc8b7bedaac768221df9825da96 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a8f2ad7b30c96b8fa63f3c6c0b0f8c815a525d2c | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9e4824211b0941073493b4279351473a17814f46 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c3796dce6396dcd2b5d12358d2fa60a92e0f4d02 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/47b74a7851e634d6c0436132f40615b7e3bcbde8 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dc6e5e7cd10d3cd2de9a0030a1254d9591bf2a7a | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a109efc9ffaedad82a4cc9e0d1ec235637bcc84f | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/34ee335a4aa1ca35ff32aa2ef28f9f9ef91d3ded | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/22ac4745ad80177bde54b2115f0aa13dc48ef64d | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/cf572f604f7ea407806d31af224cb49a49623222 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d294f72ec8a0353f4d48698c4e8457cad52a285d | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a6e11ffb1299efde2ec947e23b894c2735db72f7 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4b5ab1141956fb0e0502915d974d53d1eee0c3d4 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6d0ccf75a5b9c953a669a1350562867238fdb20e | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/74678057b92e5e47adf6ba7c597ae86c70f0468a | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/17b200c0710c3fd7bfbc6341680e48a56366e2ca | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/69fcd85ed0f786aa55e5ca3aaccf3ab92aff3b9e | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/888c92ec048c14e3e5216e12d62d8d77c25fd050 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/269fa2512711b7a31b1a0a6acd3afc043d938082 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a012c2ab1da0f3396caeae7a205d528e5309cab5 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/15d7272dcb5bd4b8029dbbe32598689edc83f48f | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8902f58133b1ac3da1c9d9a365e3fecc8aa7a1a2 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9ace824f9ca122a7deff0889ed75ef1eba58952d | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/091d22e01d604134ae335d3d2acb3f4bef7779b3 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/bc5e686fb44210f3c2bcdbf7cfe0a446cbcddff5 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/faec76aeac758d5884532c2b7d784f6a708ba8d2 | ORPH
   sh4aeb    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4329d973f1cc50e4c86d997d0bc1af0b802dadc5 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6894e384fd6ceff1164c8df2aac05ff30f2a79bc | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7ae74abbac51439536eb0617dfd63563d28f889d | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9cb3932ddebf39258c984eab9099a82027224584 | ORPH
    sh4      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/95dfed1fbfebfb1ad3def7824db85911dce298a4 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/33196b7966d60b628b266dd9419b9a8c78b7976a | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8bbcc7b19c1ccbed2cc7f69a134713413558e272 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/daad676f1f5277eacf44dd14f5ec0dc653d68b39 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0b0a157407ac79ab5ac6ed2362d2f99118138505 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/455d702d625d047aed39913073d171d232a1e41a | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a6153c76058cfa26066194ae625fe78ae5af86f4 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c61aadde0bbbdf7474f51f0a6877a0e4173f891c | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ade7aff9f43257ed3ab86487cfd939b8144c548a | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/53980dfd5e474ccfbe281a8fe110bbc134775d86 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/81fffcc335504037b58a834c22419d139fa2f809 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3ee15aa0867befda0c793454d64f35546afb6f15 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a6b7c7d8cac5233aa641473e244ec777717f726d | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/883e06ed5d531b8fed8b77e38d5cd4fc846e2d88 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/8084de8c07bbfe31c7b8aff3b6ca138d412c10b4 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/754b76a3ce00c188f036e48e9caacc39ee8ce3e6 | ORPH
    arc      |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/e4575c00455d96bc148b0be407f4685a73b7d6c8 | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/d146f1cbd551e39bcd3d1c4c8d9234099c267515 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/ef2101b8d9ddcf657b835a0f71e866195244f9b4 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/2bf060f2a33ec3489f34535c5a3a2939ee6e53ad | ORPH
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/b5cd57b8c40b96b723ecce7b0488f1ff2453337a |     
   xtensa    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c3e4ff69dc6b52f05fe93d0d84f0b08b6582a74d |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/88b2734b033fc54f0a10bd51306f7652a4cc0abf |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/1452949914ffd488843212f02be03dc066be5cdf |     
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/7a0611bf90e9ea31e946a2c2ad95c043eb27fbc9 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ade44a82fe9a91e2a0a12ca4c15e1d3ea87fa7b8 |     
   xtensa    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/3dae9d35d851a47941da5906809864f43046c0fa |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e88f0dcc647ccd2fc7d9c566d8b74d7ccdfb6ee8 |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/dcbd622b7dd6145b1b65cbc53a02af3eb578120b |     
powerpc64le  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/6a33fa33b2b4c76b8dfb2b73fbfca9ec254cad8f |     
microblazeel |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/2baafd85bc6ef51431c1759d2de44025a832b627 |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/2b828eec0aa3512d8da4ef566bc6c2405bb778f5 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/db06d99dc4f896960a018bdec471d912d0451d98 |     
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c1e276c4500f0d98a436d4421cdd4760e6f823bb |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/199e3d1e1b88579c9486d131fe03afc4b2b87e40 |     
    sh4      |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/78cc1ff08cad717a2355450695e655df29eb69e3 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/4f7b02ca47177b65ec2b9ddb2ea95942f2a6b28c |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f27207a9a0d75fe1561ab746e4c07c6e84a08d96 |     
    m68k     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/3d06559d80fbc7406a5ee5ed8c03c82c3151f97e |     
    i586     |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/ac8b0259230ddfb57b368be24a0d1a87e29b7a43 |     
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/4300b8b3fabe89af83e496b5035f376280cfa1ea | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/145d279aa68b7aab1b14b903b3224b38200c8d74 | ORPH
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e3e7859ea3fdc5c2cec4c6ee9c38fa6d195dcce8 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/0c29cdab29fdd2cfe88ef0e47c14ab563d7aeb2a | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7e96067a0c65881597a1eb3c2fb17e6ad671b033 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/919c35000142746d9b0cc5a2f2a5c2ba7acf6231 | ORPH
   armeb     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/be93d72626360df8d6818957eb482834b0e11a17 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/11c8fcb36c46a8ef27d7b6b412c9c628e98cce75 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7541adc00be6e220884bae4c77e60b763de5d0e9 | ORPH
    m68k     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/b4cff0e08f9bbaf700a7868010e9f30b13652f36 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/cfe4295bc09667b3bdf65df1d9c0ec17e852bac7 |     
   s390x     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/f5029d30f528e54eeb3d88afb1d102e4a4decded |     
    i686     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/a8a6fd8a2edc8a0a80b062d1b9b572f06681dae2 |     
 microblaze  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/03916692a0babad6ee817b531d6db065d03e51f7 |     
  aarch64    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/69a800eeda916a41d2577bdd81db04ffdaa60170 |     
 aarch64_be  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/0bcf02654afd59ac258500e732579323473dce4e |     
powerpc64le  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/37d7682fa3f360b93676590824d1b2021fe131c8 |     
  powerpc    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/a218f3a9438fc6b0328c4259464c42ab0afd08e3 |     
   sparc     | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/c98208259709f7432ebe4cbf4f411458a5909e1d | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/4460e458a8b2ccd839c6c1a455e44b29a330cc02 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/c648013bf2629454a3b66442781eceeaff277da5 | ORPH
 aarch64_be  |      libpciaccess-0.18.1       | NOK | https://autobuild.buildroot.org/results/b2a480abc873cd39e993ffa510eb003b47ac2f25 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/867e19e93fd79c06852ad10539d1f37cfb375d4a |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1866912dc9e373c156a9dbeaf31c07b99371725b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cd847dbb9dc1e3c37d08a23fbb6ec5a12cf7c2fa |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dcdd856e1a0c7ee81bd481d1052ca4c3afd1c54f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4af5c3eda184d8dcf0ea96cc676a583e8fd4a8fa |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6745ac63ade1fc9b0af67c4da1fce4eb22ad2602 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bc7ee68e2100529d48ffd2b6353ba7d74eb700d7 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a85ea0327420e75e5dad035892d39e97ce0a863f |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2c9e82c50b1c89edfcee02a33fdf6f6da8e7ba31 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4f9067d8faf03d175c986fddac2475d7184dbe25 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1749714dfd1bda973b732af890488d4dbb30da8e |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2035bbf497fecc0553a6e4ba78eb530c5078c478 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/53f479f31ca59fdbbb26c480820d53e4bfd3b8b2 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6f4c95f2f6722634f31627166c4af98fd431b2ee |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/69f021b23c022a6c5ecf83e51aeb2f27f21d9f59 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f7200922f33ef65cf8007e07c3accd36274cc17f |     
   sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/459a08c1fe5378078dcf5246462fa52ec921d595 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/86d91c3038541a65b2421c60758883903d595b5f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bd153a7494edb4df6564a5c8feb3e8d8ad98da20 |     
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c0a0143bc0e8fff0b7b9567892b44abe6477103e |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6f31bd35918bdf9bf2db55132148d6674c92b583 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/13d3e582b08a3f3ad36a9a926fc2d84e0f18c030 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/49bf9b8c1745e7b3a6e8485a0f8aa26c354661b8 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/016f55c1d269a23810dc48676f5aea60448087fd |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f6f7b1180f1513be05229c447ad3f2a22bf8a0d0 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/32076165067c76cff876380958989d6dba7993ac |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/117ac2e467628c7af58fbdf929eb57c6247d5d57 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/c81b8f52659b01cb86afe702c14ee9fb7ceac8bf |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/042abcfad05e88409f60639f58e090f5f21d1449 |     
  mips64el   |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/7e85d136e7cafe26ea80fe5415f503997fc93730 |     
    or1k     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/7a0ec3f53f5071feb223896c3da51cbeb0d70608 |     
   x86_64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/009fb8807704439475d9221185aed070e3cf2b17 |     
 powerpc64   |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/85772b733c5bb90b2984b502f88e678d0dbe89c9 | ORPH
   mips64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/52552c5e4280f2d85de33c3812462fd57ee07a8b |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/3d8be7f36b781b19f1ce8838aaaaf5defb9e01e2 |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/b2962a372dc62069113bb96ed4354ff6857958ac |     
   s390x     | libwebsock-3c1615eeadb0b582... | NOK | https://autobuild.buildroot.org/results/2075335ab12db15c750b837eb5f6867bf5f99d03 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c2db2139d21e1ac838e9ddcd5bee7c649a0e15c9 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6ed3c6c98bb6597248a297f29a3302d9045e0351 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5cceb852ebbcd9c3d694616f145a04430836ba49 | ORPH
    arc      |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/8675d8cda57a219bdc60d6af54c43fbee139ee37 | ORPH
    i686     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/06a0e9b556a0b7c9f0cb0f38d14d922a39f66e16 | ORPH
    sh4a     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/37b74a759e03b8815b46c841ab941dc14684cac3 | ORPH
  powerpc    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/c1733e61f871f699a74c167ce500d3f8e1134acf | ORPH
powerpc64le  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/8540ba2f9b16a487e8e5ff701177ebbb52406026 | ORPH
    or1k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/98a2d2a5c4b64e14bdb0273658e66989c6a77d66 | ORPH
   mipsel    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3cb95ef99b262eb54217341b1f95e61bb1ebc27e | ORPH
  aarch64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/9cbfcc8faff8e9459c3fe8b0363bcf534fc404e8 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/9214e6cfa1319ca0e89956b35f5b294c9fc73237 | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/c59bd62bc4c1d35a088cda487667ec9ce527467c | ORPH
   sparc     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/07672c867854a62c13aca83d3c0a91046eaa5dc9 | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/758d15fbc3744ef77966b095ae9f225721e5da9f | ORPH
   armeb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/bff44a88a7cd55db324a953572bf73c3628f3b64 | ORPH
   sh4eb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/2fbe9c4122b7ce3c42eb94953628318200021aca | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/789f0f633cd686cf060d3d68c9bf955ea737c3b0 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/af16fefca4784c98e147510e20c0fdb8dcdee22b | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/43e6e74f236c5d5fa351ffa5e92212bed3dd051b | ORPH
powerpc64le  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/fa65eedcdad4e650d599cd3e0e332eabe8aea556 | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/005c81668ce905bbb17792eb71e1e7cad65418f5 | ORPH
   armeb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/d27593e2f308f25cc569b7afc9b4971ead902221 | ORPH
   x86_64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/31209c4c3b6aad82fb041d87a8211112e81fb01b | ORPH
    sh4      |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/806f9147a0faa0e3922e283ef6c80f0b2b46100c | ORPH
   mips64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/68a4b1cd9db5e46cf87846656d32ff326aec7fc7 | ORPH
    sh4      |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/7338be46d122fc7f5123da5836a1fa6c1683260d | ORPH
    mips     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/3fb4208e09b94a5a18373edd890553dfe27ff976 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/888dccb5f1d2f8b5b95f162467c33c0bac39f1a5 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/d39e1beb4aa65f6da80f12e76bdc40ba06fdc78b | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/4afebea7a7c3d0e9801473578629a797a9dcd95e | ORPH
   arceb     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/ba3cca5f3c23ea4284eb361741367973e12963ed | ORPH
  powerpc    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/1c7c9578fcf59530898da8299a95d76c71f62eb5 | ORPH
    sh4a     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f8d24d988eeeee0c592528d7a82ebd639b58639e | ORPH
  powerpc    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/744474f839f611de7290a27c42572e6d980f2c4f | ORPH
   sparc     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/119ee3b89c3616d09daecf3753d695521b364673 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a4257bebfaf10b98f05c2c669021e77fb8a304d3 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d89b975126af770ac83a05a63e9b3771803f375f |     
   mipsel    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/cf26388cb84332ee6556d4a2ed3b8fd477f89cb4 | ORPH
    mips     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/4f09d693655439f0bf60de0f4afeb875cf73441e | ORPH
  powerpc    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/24b0200483b714a5f981d747efcf889028fd4466 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/87833c856b1aff63815deab0070f4ed7efceb490 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1b715f77d98c8df2b064850d13cdcc553c4e08ab | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6504494e9b290e53378ab966b5d66573d18695cf | ORPH
  mips64el   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/5b7639daecf8c9081ce0d64c1ab6a241a37b2493 |     
   mipsel    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/b70912cb187f40e617613d878b7d20e72024deef |     
    sh4a     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/9490978eb440d64d132937cdfc19bc04d82f3ee2 |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/b10f886971246fe5c75092cf1a0f3c3a9e5ad406 |     
  aarch64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/8708f6b758ac0a702d77f11f5b5989848670cfa1 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/cc18179efdef5480a07bc525f6842025f9724636 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/45b9357356322cc83957d7d90389e8ea6b83a182 | ORPH
   mipsel    |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/ec08e54e180b656491e4614180beab85f9847d5a | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b45dd118e1a5b2f38648a9ed47aa8970e9ab2200 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7244a28d8ec341ff0b71d72215be37eac903162c |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/7353e9a71ba7fac53f6f3cff0e6a0e0ff5d93b75 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c3588e8f71e80b658c846fc8ca309fa4cbcb509b |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/cbc817724e08b75b83a535d089cfddb9e8f84328 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/6a8a15746d236b0c00c96cc9092b3c6d5a342adc |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/1a2f20f3f77fc12a050094788b62b6fc0a8a87ff |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/fde36cf2e357556613c5f3d21ef7a08dc3893d42 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/93500c749ebc2c45491239ab27359867a778f2ac |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/ec668472efcf0d9a9e024439081d4c9042c6b64c |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/ae6ca8cb14b0c5854902a0fed5ef59eef006431f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f44d254990ffa1185ad4b9a3e2b054871d75f7ba |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/bb3a955dc8756764e48b0c01447018f22c501677 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/63d94b409183554af3e39b5d70c90ab8d2fa4037 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/09034bf5d7c8eff02a0a3a40260d903e6499258d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/375da4257df8846b5a32dc3dd6d769226727fb45 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/9c1d00c94b97a56f9d3331cd5caa23d18a84c6b7 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/e1427b472036d4e36f4734689df2fd20f4e40e4f |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/719568f3eb80927730bb849033605ec4b4cb25f0 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/37821b2e9f5f3022af80de0ce83f7c6f1ee35704 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/fa39e6b7714d94485cedcfdfbbc15f992e41cd94 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/296f862b801b3d95c86c86c0d6c256d247ce52b9 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8f0c8f92467ee024e452111c1bf5790be5c58add |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/93fb88a30c09dd35c2a0c1543e3be66a3fb37c20 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6ccf2e49b87af3933fa6e6b75e3375fb00613126 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/43a52ce607af4c042c42016f80ef797945ad07f3 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2745832f9fa1e6478b25060e8ffba827e0c53210 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/be609c41f880293a6fbeafaf71f72d6cb552ab04 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f2515853a3da9e423823fe5be3726a91c82b6220 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/226d53ed256595577b7f62856acf61513a9238d3 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/0d39f600734e63e625f8e682f9f69c7bf052d40b |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/68f11baf24fbf941ca0903f5c2d5672addb7b925 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e1c4a53d2c480d46ede1a429ff08fba28ab209b2 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0274b0f6ad0a1cc0a0041bf80767930fda5bb3c7 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/64eff260e4cd8eb596cd8473e48829db0985a42a |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3cc55c426fd1fe532b96c347217fcdc3c1982173 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0d20ae332ab8a1f4e05a3bd1c3d3b8f794823877 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/6a57954fb79dcd8d30c057105f9e823a20aa08f9 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/6c837a165cdc204703dcc44b8d2a5f18739a35ea |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/647a0d85c7ada41fd6f29771e96c755a612a6198 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/6b02bcea5bef160d17eb4fbb7416eb0c1f356274 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/aaa71aae7d77fe72533d6f4f4689ebb8a7f76441 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/3da7fcf8e398a9fac58488b422ab60756fa2befd |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/fb3c2d3c6aaf8c7c76e6da25ad6569c4deb7959f |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/705868367fa1984c2a21576620fa236d2f7c8c31 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/d06f01607eefba21c4ec06f05897cfc813b1e4ce |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/7c72e442d3be11a31a58c493e7b2fba3b358a1e9 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/c380c0ce4b1171935c4b7004b7c52bca6538ea36 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/a4fd7fbab79ff75b51acd3118777be56354c7695 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/24dfdda01b1431d15d57fdad07398497059dbd58 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/952c2b45e8d052f1b78a71386b19659f2911255f |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/772565f3637d60d0686b415a4ac9707d20e0bfd1 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/619c5a7f6587152cdb60f8480213d9629de3c2d0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/46c48b5bb45ddd7b249f2d881d11dab0a42fbcca |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e5cfd3534a5faee4b947cdb553a6117a9c0d911b |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/863a04fc713bd5acefc5b7b32fb5d96fd0c54223 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ce302d446b14774cbe60f6ec51120bc48dab785e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3742e03612817227175870ad140341c763481179 |     
   sparc     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/ae5ef73c19ee7197e56b517719ae5779dca9fb5f |     
   s390x     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/816893f20834af2846bb5060c29060ef275a1591 |     
  mips64el   |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/f14ce27ce83e2166e499392bdede8e88abff5bfe | ORPH
   mips64    |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/fb3b85647e8ab81b5e3cca2181feba75022aad86 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             bluez5_utils-5.79 | 1 
             fluent-bit-3.2.10 | 1 
                jemalloc-5.3.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/3c57eb92237345e1d4d68118a11a3a34e5413cff |     
 aarch64_be  |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/31ba80b94dc5c09eae78f4e7dfb7d6b60bccbe59 |     
  riscv32    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/f34d0dce333e2aae7d417a39eed907102cf8f8bf |     


Classification of failures by reason for next
---------------------------------------------

                  prboom-2.5.0 | 2 
                       unknown | 2 
                    bmx7-7.1.1 | 1 
                 hddtemp-0.4.3 | 1 
              host-guile-3.0.9 | 1 
        liblog4c-localtime-1.0 | 1 
                liboauth-1.0.3 | 1 
                   qemu-10.0.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5f10197463b690210f6f09d5efdc05ca7fb68802 | ORPH
    m68k     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/a538d4a238b8ff0ea9576094da68734d024f2a42 |     
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0a921d229ad9876425c3af4ebf44aef8fda62f2e |     
   s390x     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e0b87db71e8ba333dfe4aeee190f339143262679 |     
   s390x     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/0ab9303207ef92b93e86c84a37ed1f72243de50a | ORPH
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/285cfed0ee02599efc1fbc0121d0d4b72b4481e0 | ORPH
 powerpc64   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/4b683e242d16582d3676acdce0b536e102147373 | ORPH
powerpc64le  |          qemu-10.0.0           | NOK | https://autobuild.buildroot.org/results/f4a50283d594343170afc1c5777315367dce190d |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/06950b5b99ac5bd65ec154df7063af909e454f04 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/0eedce4a76faa5fccca3df59cf0b525607f65681 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
