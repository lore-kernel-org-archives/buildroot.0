Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8168C02198
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 04:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C03560F4A;
	Thu,  6 Feb 2025 04:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRFULTzHgBse; Thu,  6 Feb 2025 04:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D9E60E68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D9E60E68;
	Thu,  6 Feb 2025 04:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6BC212F
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 04:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9EA440ECA
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 04:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xyH6b-KZQ9fK for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 04:17:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 184884013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 184884013D
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 184884013D
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 04:17:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab70043cd05so105324866b.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 20:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738815428; x=1739420228;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DUfc0CWrpTQ/nJhX16uV3qWev3hO4RljjjAZ6hpLM9E=;
 b=Iuf/3bVxaduWbx+H/H5thVlqdBasUz1KbOXzDRwRDl0nFT7l/2tyS/kRVDC+gXWAUQ
 T7ivGHqA+UbL9edN0lDSbHh6IwPgGwQwoqDIhs0Uy1ZH9eoM/qbI+fSbIwN1auZDsNBQ
 CJItBacLWcew2HRwEEa995gJCt/bBJOlgooAIM5rJBRkfadGsKJtsvlDAfxMVgr5GwZt
 nIsWwccQ4afMOLaJXNew9nZ4LAcufFbbHAq2/oBS+jQ5NDlhO5TMs4y/w+zY0Ss0c36W
 csamhOwMvgsv2hnUnKbJZM+54STzGlZjcuJUZ2H0tnjcR3e7ZUNWFg9b4FfWZnDg5tce
 +cUQ==
X-Gm-Message-State: AOJu0YwR9CVfhHLrY7j+o8cRJfyeD1SkHIMmkWQ7RGqcV/LQcowI31OJ
 qqvTEodfDuuonCVnLta0PkA6rgomrrfDZ/4jLXaUqtG7gCPKLp6A3MdPug==
X-Gm-Gg: ASbGnctV5Up6m5rW2Qka8Fpzc2A7Dgy/4qCYiws9cwgA/dFkrhGeGhsIOcmkHqLd6a4
 HH22Adn83y8khYspswIS0eUNBOEnEmCGncp4T1CUE+8h8BIoC4DDYmrAca+sfjDLm4zjMZnwvOO
 Hdmt/udFiGscaHTVVXGg7XsfrGu0uUMkws26itAHA7CR7YibSMF/h/lCIm97f8e++eRfFJD8xxm
 cG7Rz5bouIpeEcBTy5M1NY8gFsyfQiFzxPLsPxbrSXWM/esPdsMXVRg8EKP45/LCULqkhRUBxfF
 Mh1/gP8LV1RyEC+3Ptg=
X-Google-Smtp-Source: AGHT+IG50Ox8pf3q19eD5f3zyMJAA6ShGAUwvIQiWW2hDQLA+FGPDY53vfNJ8BeiPk/mvN0GWORolQ==
X-Received: by 2002:a17:907:9686:b0:ab7:4631:4f64 with SMTP id
 a640c23a62f3a-ab75e24a084mr475614666b.6.1738815427635; 
 Wed, 05 Feb 2025 20:17:07 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772fdb6bcsm32837966b.86.2025.02.05.20.17.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 20:17:07 -0800 (PST)
Message-ID: <67a437c3.170a0220.2c82ae.0a1b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 06 Feb 2025 04:17:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738815428; x=1739420228; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DUfc0CWrpTQ/nJhX16uV3qWev3hO4RljjjAZ6hpLM9E=;
 b=QFxvuFvC9OWOKxDKxB2/rs2V2M/hfuuV1nwcKrQ+fmlJDf6zm7HFBXzVK3AWcHf3HD
 CV1U5CHwLzENL1K9jLMq9nV6F8cbUVBp4ZihRZHMaHlx2browY92b0iAgksKeXUocxs+
 9New73mn+UGMZG/YCEcQkK1D4KLQ4OONsf6mZQL2ytdVF9o0fUKZawMAGTv2sLffv2bG
 ohpN9tpGvfP/6quLlL3DDW3kXo/Dd4NqYOGxeK1iBWzETFzFsEZFVnThp5jUE5qgdj8m
 1lBCdVx7WzqyCMYXstRlwnwbhpnppQeD3Gj4gh5u3yxhtzuUAS1K6kuHn/E1Bw1c73Il
 M2mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QFxvuFvC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-05
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

Autobuild statistics for 2025-02-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  0  |  6  |
  2024.11.x  |  5  |  6  |  0  | 11  |
    master   | 13  | 131 |  0  | 144 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 7 
  gobject-introspection-1.82.0 | 7 
                  ffmpeg-6.1.2 | 6 
                     gzip-1.13 | 5 
                   host-go-bin | 4 
    host-python-greenlet-3.1.1 | 4 
           at-spi2-core-2.50.0 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                   linux-tools | 3 
               mariadb-10.11.6 | 3 
           oath-toolkit-2.6.12 | 3 
                 openssh-9.9p1 | 3 
package/glibc/glibc.mk:207:... | 3 
               pulseaudio-17.0 | 3 
             util-linux-2.40.2 | 3 
     bandwidthd-2.0.1-auto-r11 | 2 
                   bird-2.15.1 | 2 
                    brltty-6.6 | 2 
                   duma-2.5.21 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                latencytop-0.5 | 2 
              libopenssl-3.4.0 | 2 
               linux-pam-1.6.1 | 2 
                    mpir-3.0.0 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
                   perl-5.40.0 | 2 
                       unknown | 2 
               valgrind-3.23.0 | 2 
                  assimp-5.3.1 | 1 
             berkeleydb-5.3.28 | 1 
                 c-ares-1.34.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                 coreutils-9.5 | 1 
                cryptopp-8.9.0 | 1 
                   dillo-3.0.5 | 1 
              e2fsprogs-1.47.2 | 1 
                 expect-5.45.4 | 1 
              fmlib-LSDK-21.08 | 1 
             fontconfig-2.16.0 | 1 
                   foot-1.16.2 | 1 
              gcc-final-13.3.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
                   grpc-1.51.1 | 1 
                   host-go-src | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 libcdio-2.2.0 | 1 
                libgsasl-2.2.1 | 1 
                 libidn2-2.3.7 | 1 
                  libnl-3.11.0 | 1 
     libphidget-2.1.9.20190409 | 1 
              libunistring-1.3 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.1.0 | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.12.11 | 1 
             lirc-tools-0.10.2 | 1 
                memtest86-6.20 | 1 
                   mimic-1.1.0 | 1 
                  nginx-1.26.2 | 1 
          obsidian-cursors-1.0 | 1 
                opencv3-3.4.19 | 1 
               procps-ng-4.0.5 | 1 
pthreadpool-560c60d342a7607... | 1 
         python-remi-2022.7.27 | 1 
                  rt-tests-2.8 | 1 
        util-linux-libs-2.40.2 | 1 
wilc-driver-linux4microchip... | 1 
            xlib_libXau-1.0.11 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/e7f9a287c85fb79c2be9699b62222e3895bf4eb1 | ORPH
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/86dae2b11f58fd69e48d6c2801e337033614e8bb |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/4f293833ab2d2d963a773650b9d2d696fd55e7a2 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8acb635d4555d4ad72682a8f531656c10bc85014 |     
  powerpc    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/8dd6f4d00a7a11878f5ace9c9fdeefb8af576b04 |     
microblazeel |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/9fe0fbbc7f9ba4be736e562453431383ec7ff54d |     
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/a619d930c5a42c39397a7498190cc77451e5d782 | ORPH
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a698747c5f8c23aefd0c7179bc17f9c667f4bf0f |     
  sparc64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/240cf31d39a538ab43dce92ce2ad84828dfe1048 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/65590a5833a11b7e3157a08bcb689a6a18b42d88 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/c0edc25d11a1b51027f266b49a02c8e8f57a69b7 |     
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/cb360a4b88d7bf7ec15796eaa7a5c75c1e4c4931 | ORPH
   mips64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/b753c1c18da9b28ab331a3def81f3f45c47650d8 | ORPH
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/4db7da53650a4230a31074760150fe01864a4102 | ORPH
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/09bf1b42a293ee1e48853f35613ab8980b1cfda4 |     
 powerpc64   |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/9c33099772398ab592bf38c2f4c56c2594594695 | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/140fda439f9189e5883890b7adaa9191e2e52008 | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/74a642f01c17dfe0c978a2d8ff2f372fb6bd5f11 | ORPH
  powerpc    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/038f57b393a3bc4c3fb6aab032f98e5c0bf00a63 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/829dedef7f5b947d2c1480a06295838d011f444e | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/319b34eab095527774a5317ad22ef5b8e170857c | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e7006134ad2676df2beda73a142164f47fe93a3c | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/30e888cc140fee6cc67b55f3b85defcc78b20951 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6fd3cbc039731e24459a40d0528df50901a47b3a | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/06f37748f7ad0f469dd2e6aa42f581474ef56f9e | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/178752517d0ff9da464c4b8304c929c8608d453d | ORPH
   mips64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/dc8fb91b1635eda0cd091ae958c633887fe09c7d | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/11e9cca69216641dc19220c70b8b0a0ef2ee278f |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8b59a87fbd0c6e472a899edc7b26ac09d92e1888 |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/bcde12c987d7f37dbcfd2552a8838a33f69ea68a |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f43bb26333b88db17be8c652576808d438150402 |     
    m68k     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0e36a135bf969edff8de1d8b68f13622dcdab53c |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/99878ef9625ea9a7faee0d0d2c5a8013b865bc69 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/beed5f2e12cc62df094aaa06ebc02c57dfd8a4be | ORPH
   x86_64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/950da72d7fbd77eaf745613aebbe7d70218292f2 | ORPH
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/75c8aa1a527bae9c500093f571f08426779a55c6 |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/4c3eadddff4bb59cbe341de651540d850e73695c |     
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/389f11339d5f68e66a8dc6a5b522917275b3cdbc | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f47fa8b618331848eed083fae311f1e611fb4f05 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/abcd14294cb9338dbf67a6f217ac6ecf9ded2a90 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9e18a68e6822400d9c109ccfea1ad751bfe0d4b4 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2c6326d7939c9de0f1ed2e88b3f8129e074d17ce | ORPH
   armeb     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b0ed68ca5516020efab8973ea0155418dc7980bb | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/fb2a476b0c88d65a2e0e3f9919e6fa6b1da3a511 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/fe67dca573a6d97a8f14d23bdb9116eb6e74d98c | ORPH
   armeb     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/909f922992f08b417f94eb2fd5c95f1e9345a9b8 |     
  mips64el   |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/81362f133a837ae9a5d1733550261ea7254336c0 |     
   sparc     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/e2ae725e93c38b1d7eb1300538e72ee80ecbdf8a | ORPH
   sparc     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/1e260a5f4c498e4a7be86423da6766420eff4911 | ORPH
    or1k     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/799caf1c30d11009f8df8cfb2fc1d918827acbc9 | ORPH
   mipsel    |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/5222eb5e9a29e8a44eda99375b77c1cc45ffcddd | ORPH
   xtensa    |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/51f8dd63d6937b7591a2fef7a9df79ab4712eafd | ORPH
   mips64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/493097b17f1e6869ed2794727c05952e3869e22a |     
   sh4eb     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/dce3756d81d61ce28aaf90841fb772ecb6ac4554 |     
   sparc     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/97da8610381c9eb5830bdec6602192c22a10d823 |     
microblazeel |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/66a0d5ea390ef990eafbe4d099fb4fb4feb51eab |     
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/de3c60bae98848871840b37d6caac67d48978889 |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/c15b2bd99b66eb9d7de11078bcc021ac7c77ce8b | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/34336a4de117de1c830ee5c52e4cb6d62bf4700a | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/7232992d56b297482afbef335a1977871a12adde |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/57e81e422dfa3d34d0d4bae969d5584b98cf4939 |     
    or1k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/510ffb312a1d60847f74809a4ae46a1609a47db9 |     
    or1k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/abe8f14c656d2e42475f6ab7e91d222fc2587322 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0a48b1df966735c8154f3d99f831397ab1d0e8ee |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/f33e6eae9091fe40d31c7a804a6ce3beb96f250a |     
microblazeel | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/926ea2e71fe4a0b57dd5d7d89a411827cd5384b0 | ORPH
    m68k     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/5b7921d1b2d347995b0088ac58b29e2f01dec39a |     
   s390x     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/e043e1482d08957beff10c88b5b0f2cac0edf1ff |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/67447a80c8b7e4dd678f5262f4412f6815859fe3 |     
   x86_64    |         libgsasl-2.2.1         | NOK | https://autobuild.buildroot.org/results/2b8f09b2236df7fad31e7cabf677fd739afbb5aa | ORPH
    arc      |         libidn2-2.3.7          | NOK | https://autobuild.buildroot.org/results/b2c0747eb8d7d73a21705d43f81773024635e95b |     
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/012ee1e6e70cb7b7955561c9377808e426c33c7e | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/24e5b9379815a1bd0fcc841da4142dc8271537dd | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/1a5018dff08398914e06c6f0c43b9e27e6f676b9 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/35592bf5fa7d4ae2470c8bf2d1ab0d5513bc9d85 |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/355ba3522563af7d34f12ff91fb54c433e0f8742 |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/5bb74927dfddd0dc066933943234f52b34a600ab |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/e7475f48b73594811282722bc04c4b9f46f7b365 |     
    i686     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/62d4fa11a73ea6dd11c832b705e7d652186a872b |     
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8eef3c00a5bb933f0b2370eee4d21b44725d8376 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/923ce260efde532394815ca48f4d2ba7835c1db1 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6f3a11c3b297c14c38166e2b7eff6d8c587f3d81 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3517fe3aa4784f017005803ec2b84407f1f98ae8 | ORPH
  powerpc    |         linux-6.12.11          | NOK | https://autobuild.buildroot.org/results/e95f04c436f9d8747c70d8bc6041f0c386ab3bf4 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/80ce4ec216e8e932de63b4857de6f50add8f34ec | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9d54c0be49aa6626d3da28b0d6a44a5d5160525c | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/56404c4d70d2d37623c1f4ac666b3a6f63b607c3 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/fad44b6df2db204e3a261bbcc2e97a3c40e75986 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0a29626199e2f581a08358aaf1352fa7079405e1 | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/ddc054497bfff2235540ad1f81b76cb7691d34e9 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e5f23d852fd159a5cbb4f5c967928306cdf69fb5 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/4d194d207f9a970ba277a7d29b2afd981dc27f58 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/334b9764a6cd49e09a533a12460bc8efbc6aab3d | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/3a10fe0b59f474d8d6e0a08434670c3081dd6e0d |     
powerpc64le  |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/702610b567c9d06cd9f143cafe9aed884f87f028 |     
   xtensa    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ef6499705c3fcb53eab2776dc7290f92eba62bc9 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1ceec03c9b2d01633d3a759cbc4d33ca2a1a2451 |     
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/091d4c06162d84077fa6f91d4cb9b49a0e801cc2 | ORPH
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/c679b793d0b81e7569893a03f95b2e0b8c83e268 |     
   s390x     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/44aef9d74857d93d90cefb1d59110e857ff4dfaf |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/9e4604e61543e679a5f66e154026dfae144b527e |     
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/ac66dc48baaca6c548a9b408d08e436a45188ba4 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/eb5707a1606b712a506cf83e35b8f57bdad58706 |     
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/97ac940d6e279cfa493c6b5d9b4d318d8dda10da |     
    arm      |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/a56243f12b56c0bee2fe22cb02119a5a07b53533 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/1b25e71d600afc33bbbd7fec80baae8dabb1fa07 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/40bccaf6396f2213acd7ec18a08d38bdd9f868d2 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/b3e7dc2e00b68adc6c16d365852102e3b688c1e4 | ORPH
  mips64el   | package/glibc/glibc.mk:207:... | NOK | https://autobuild.buildroot.org/results/0ecfd8c91bc8939d5e5b6a710a9146ff8a2c2ec8 |     
 powerpc64   | package/glibc/glibc.mk:207:... | NOK | https://autobuild.buildroot.org/results/e61ff91a974536622e857fe02b23387b1325b18b |     
   armeb     | package/glibc/glibc.mk:207:... | NOK | https://autobuild.buildroot.org/results/74fb3ade56140cf8c0496f1d087f0b33ee6b6ff3 |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/a63780d0243613bdb0a9d237ff35fcefe7ce8ff1 |     
    i686     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/7ec07af9813f7502e3b3d515e019d30f2202fdc0 |     
   mipsel    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/6be627bbba02d97564a2d4dc5724112603ebba11 | ORPH
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/4d1579ea581eec8d2a126f9d5a852dd47bdace10 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6a9c8dd06ad8999eb853a9fb093a593b9a43d366 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/97957a728ee79dda00d70c64b222118b4aaa9548 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5f60bd2c2d515fa47a2495dfe17fa7c49036d995 | ORPH
  aarch64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/45bf5b5789df3005c53ca8e9f4614ae264f668ba |     
    i686     |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/8b90b9c7cf4343a33410de59ee429b482f7e9944 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/bf6f0ad8a985700dc9988564081ef81df32662f7 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/d696cb172187d21e65c0d34be70f157fe6beeb7f |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bc42b91322d2c9f3420dab336e620a21de124207 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/62f8c936977dde54df79c51cedb4ae623012894f | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b34fac6794633b4272a8481acefd55ff4d10e327 | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/9e1084db979ed9f7c8c2482aac1eb637cfc35d69 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/cb80b1165efe48cde3f2b1b8a344800ae3639cf7 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/7de233f4bef02c937f8593ab63d9b194052ef646 | ORPH
  sparc64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/0e1ef0fa619b478ec39fd88afcc84ab9554d9497 |     
   sh4aeb    |       xlib_libXau-1.0.11       | NOK | https://autobuild.buildroot.org/results/3dcc8da0c0dbf657806f2ec4aaa06abda656feb4 | ORPH
  powerpc    |         zlib-ng-2.1.6          | NOK | https://autobuild.buildroot.org/results/bcd726725bb0dad7de3e2d60e36d80318e94d479 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

glibc-2.38-81-gc8cb4d2b86ec... | 1 
                    ruby-3.3.5 | 1 
               w_scan-20170107 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | glibc-2.38-81-gc8cb4d2b86ec... | NOK | https://autobuild.buildroot.org/results/296e54c18d94c464568b760b9defa6f8fd17ccf9 |     
    or1k     |           ruby-3.3.5           | NOK | https://autobuild.buildroot.org/results/060237c2cdf92f302c88ac9d03c65af5569f31c1 |     
  mips64el   |        w_scan-20170107         | NOK | https://autobuild.buildroot.org/results/da054694f0056027e83e77a1cedff5659885f2ca |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   swipl-9.2.8 | 2 
                  assimp-5.3.1 | 1 
              host-rust-1.82.0 | 1 
                libshout-2.4.6 | 1 
                 pkgconf-2.3.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/ebd3cf10304ca1082171069afee5786f4d2ecf6e | ORPH
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ad5ce6f6fcfa88aaa7723b82a0fcc5934b3a9020 |     
   nios2     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/a5da52a1deea8f55b7645097e92aa40df43ae1ab | ORPH
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/311e4568db5cf39dc95ebb639f4e002a3446ce2b | ORPH
    arm      |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/b24a96b999676990995a466686fe1eacf6cddfef |     
   mipsel    |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/a5983ce497fa228e6634acbb4261c5bed2ea402e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
