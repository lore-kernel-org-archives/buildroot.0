Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888F5C19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 04:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 030ED60FFE;
	Fri,  7 Mar 2025 04:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJ5ABM9pHs1o; Fri,  7 Mar 2025 04:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4107A6100C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4107A6100C;
	Fri,  7 Mar 2025 04:15:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64CBC95F
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 04:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 560C161027
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 04:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezfLM8AkTfDF for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 04:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6376E60FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6376E60FFE
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6376E60FFE
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 04:15:32 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e5b572e45cso2402211a12.0
 for <buildroot@buildroot.org>; Thu, 06 Mar 2025 20:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741320930; x=1741925730;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FB/heYLnhE/bWzh42XJFQBgsrt0fM4uDidkPsa8nfvI=;
 b=rJDR8k1WLdfDFuujjJfh4vYIGmIniKIRzad/aHJHyELQvfcGrqQ7+jw399Bhdpp97o
 sFwZ9Bm1uHUF0UP9Z1n2GRLyr3DZFYP8z6qvF43H/arqnHIgt9pPUUFm2gEYsAic2z9g
 YiATIrqgqj+BwNNQJthebYt5EmRXftzvunkvges6BBKwRohODbVQC8lsisWYlcrEQSnD
 GdDdbnBPb6BrI0UsqeLy6tR+YTvnpVlzxgqELoZzfXutoqEZ4kPZ4jMSDgEaGqvL78DA
 vIy71aohrxDwK6QTkiVGrBUFsROk8NX3Bk1Hbel0EDn6V5IiOqKfdupM1tD6eMyi6XRl
 RH+g==
X-Gm-Message-State: AOJu0YxmHEPfd7kPSr91clxtpzPf1hjT5A0uqewhiT23ya+n9iUgg1Nw
 zKi0aGuWM8Xt8jit/rrL2OOi2mg9H8KFZViAeDUiWcV3FBI6WQejDhqF8w==
X-Gm-Gg: ASbGncs7pSM6Blz8zT/cW1OmeVUGxNev96W+3NHTQ6GcLD/JK+BRFrpBFdnMJvCkM8f
 u3omiEyw/SB9McG2pMOAAeHat5ipd/14L6MKesYdYknS9+q3R6CKA0FUZHkFDQGu4NLgTXgLLK4
 hN/Smov68NiOL8Z/UipGwQ60ANxsFDNPgvNNha4idgKAxCtCUsY69LRmwVUXEc101dLrEpWFw40
 iLw9e78aO4V3+kvOexon/UxHwDYWJk/xpd/+N+8AvWJyeFBNOWW/pmnC2KN3sp3FOVkdmWcKOxt
 hT9WTi2kbqD2Ohc6+xT8gIfQeE21Z25bJ2WkDKy5ZpDkeKjb
X-Google-Smtp-Source: AGHT+IFGrh2nqMwzjsZYD4hTicsVcHDV7mZVaiQPv/B5aYmEa35rHSbMX/sZa86T5RUD2Vg7E3roaA==
X-Received: by 2002:a05:6402:2546:b0:5de:de2c:ea90 with SMTP id
 4fb4d7f45d1cf-5e5e22dbb60mr1536238a12.11.1741320929749; 
 Thu, 06 Mar 2025 20:15:29 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c74a8f3bsm1929555a12.44.2025.03.06.20.15.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 20:15:29 -0800 (PST)
Message-ID: <67ca72e1.050a0220.778b6.6bda@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 07 Mar 2025 04:15:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741320930; x=1741925730; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FB/heYLnhE/bWzh42XJFQBgsrt0fM4uDidkPsa8nfvI=;
 b=G7gHDz4Xyw/DcPKsPSvPP4TK6UNFRnkmU+1im1OGrNGkILB/kGhx5hqJFJzsG2dOPL
 UbpkRh3EwK7Nv+uvacOXn05ZECNR95DyoizkN3/DfGFMZ0C6rh7EfR681hh2Fp8oMmP6
 bhOqGF48Ej792rf77Ogii68WDGBQEOBXK4kHEjzKL3Gtgo06PefLz2LmnoWBmGn43W6x
 oL9aRffr6Bau3RFGlvFMIk/hILPicOWoApQ8xdp708c5oiQVAdqKbQE+McBF0qbL/dnN
 YyY19e4uMazoD2zajGKjIz6L9j/O1B1zy8uSLNqeUR1thCWnb2/KScEIYIqaDIISRCgR
 TzjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G7gHDz4X
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-06
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

Autobuild statistics for 2025-03-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  0  |  6  |
  2024.11.x  |  1  |  3  |  0  |  4  |
    master   | 21  | 251 |  0  | 272 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 19
                 libcdio-2.2.0 | 9 
                       unknown | 8 
                  ffmpeg-6.1.2 | 7 
  gobject-introspection-1.82.0 | 7 
           at-spi2-core-2.50.0 | 6 
             bluez5_utils-5.79 | 6 
                    brltty-6.6 | 6 
                  libnss-3.108 | 6 
             util-linux-2.40.2 | 6 
glibc-2.41-5-gcb7f206537240... | 5 
    host-python-greenlet-3.1.1 | 5 
     bandwidthd-2.0.1-auto-r11 | 4 
                 c-ares-1.34.2 | 4 
          linux-5.10.162-cip24 | 4 
                  ntp-4.2.8p18 | 4 
                pipewire-1.2.7 | 4 
               pulseaudio-17.0 | 4 
                    azmq-1.0.3 | 3 
cegui-00b4e1fe174da53b7ed72... | 3 
host-heimdal-f4faaeaba371ff... | 3 
     linux-5.10.162-cip24-rt10 | 3 
                 linux-6.12.17 | 3 
                   linux-tools | 3 
        ltp-testsuite-20250130 | 3 
            netstat-nat-1.4.10 | 3 
                 openssh-9.9p2 | 3 
                   perl-5.40.1 | 3 
                 pixman-0.44.2 | 3 
               postgresql-17.4 | 3 
                ramspeed-2.6.0 | 3 
               valgrind-3.24.0 | 3 
                  bcusdk-0.0.5 | 2 
             berkeleydb-5.3.28 | 2 
                   bird-2.15.1 | 2 
                cryptopp-8.9.0 | 2 
                espflash-3.2.0 | 2 
              fftw-quad-3.3.10 | 2 
            gdk-pixbuf-2.42.12 | 2 
    host-mender-artifact-4.0.0 | 2 
                libesmtp-1.1.0 | 2 
                libglvnd-1.4.0 | 2 
                  libsepol-3.7 | 2 
               libunwind-1.8.1 | 2 
                  libva-2.22.0 | 2 
           libzenoh-pico-1.2.1 | 2 
                    mpir-3.0.0 | 2 
               openblas-0.3.29 | 2 
               procps-ng-4.0.5 | 2 
                  rt-tests-2.8 | 2 
                  assimp-5.4.3 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.4 | 1 
                  bitcoin-28.0 | 1 
                  boinc-7.20.2 | 1 
                  boost-1.83.0 | 1 
                  cairo-1.18.2 | 1 
          cloudflared-2025.1.0 | 1 
                   crun-1.18.2 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
                  dlib-19.24.6 | 1 
                    dust-0.9.0 | 1 
                 enchant-2.3.3 | 1 
                 expect-5.45.4 | 1 
       freeradius-server-3.2.6 | 1 
                freerdp-2.11.7 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
              gcc-final-13.3.0 | 1 
                    gdal-3.8.2 | 1 
                 gerbera-2.4.1 | 1 
               graphene-1.10.8 | 1 
                   gupnp-1.6.6 | 1 
                haveged-1.9.19 | 1 
                 hddtemp-0.4.3 | 1 
                 highway-1.2.0 | 1 
                 host-gdb-14.2 | 1 
          imagemagick-7.1.1-43 | 1 
                   iperf3-3.18 | 1 
                jemalloc-5.3.0 | 1 
                lesstif-0.95.2 | 1 
      libabseil-cpp-20250127.0 | 1 
             libargtable2-2.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdnet-1.18.0 | 1 
                liblinear-2.45 | 1 
                librsvg-2.50.9 | 1 
                libsoup3-3.6.1 | 1 
             libtorrent-0.13.8 | 1 
              libunistring-1.3 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
                 logsurfer-1.8 | 1 
              luabitop-1.0.2-1 | 1 
       matchbox-keyboard-0.1.1 | 1 
                memtest86-7.20 | 1 
                    ncmpc-0.49 | 1 
                    polkit-125 | 1 
         python-remi-2022.7.27 | 1 
         s6-networking-2.7.0.3 | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.51 | 1 
        util-linux-libs-2.40.2 | 1 
                     wine-10.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                      x265-3.5 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          assimp-5.4.3          | NOK | https://autobuild.buildroot.org/results/7854dc6a1ef09c10fed87792329398592eb51683 | ORPH
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/374ccbebc7cd6f73760b22a5efa54ddffccc3513 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dff5937383a717c01191478b2050086b7be84fc2 |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/62da0d2148afe17bee2e7a841ef90570fd4b9a7a |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dbd82474547d0ddbc52b43248fd287d00543aed0 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/acee9cb2417a0b5b08f49c8b0859fb36450a5469 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/67ec84561f1f7d6dbc216bf3b1e42ff07efc2207 |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/9660255ef1ff5888f790aa5a134dab008d80fea4 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/b9b37fb92992602c81ecbba2ba3c5b5b2391888f |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/59f0737cb14a36975561b44c096827404eba659b |     
   xtensa    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/488b8f8a4eb581b54683b1bccf3ef959530e1305 |     
   mips64    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/1f450cc3b76492801d15c1473ebffe464079da07 |     
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/1de94d189765d237ee45f11d6e8b2e21b0fcf4f1 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/600edfca0a959b85a854d58f097766a2701c8c3e |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/423be6e1ab77735044ce6940397ccfb520749eb2 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/ef4924ab2bc921521353459ed5582fc6cc004289 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d283e2b32246c27751f9db78233a15179ca3e20d |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/bb67bbb539f6f558f37bc16bf7f1b253e5b0e6b2 |     
    sh4      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b240d9611ecdbc75acc7011396f7f3cfb6be3f2b | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/1beab11d3079402fcc67b19234b75537b3887a6a | ORPH
   mips64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/40b1050c268b5825f9deb946d0799d6734c8f4d4 |     
   armeb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/24a6f5d6c0953ab73b1e49d9f588f27fdd7111bf |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/1f9a0589a2ff00780c4fd42af34a22d856e6ed72 |     
 microblaze  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2b003b4f742410c91dedcdaa711fd7a3e161f980 |     
  sparc64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/7270c161228ed73a2fda6e56946698d326dd7170 |     
    i686     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/bb4041d7b215adbcd4930a72b92240ec8358dab3 |     
  sparc64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/a44b5c33ce729b6dec4fb79b1421022a29fcc5fb |     
  mips64el   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2f691f49945537984c07e6bae12f3d6b0891645a |     
    m68k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/4301d10b15bc4778411ca9cfa1874d3bcd146bea |     
   armeb     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/efba7b595c78db04f6c55a77bb093a703f5d1cff |     
   mips64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/dc2035c73c5f0dfc025bd68235e40e44bdf84d69 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/0c9c37d59fd25ac4cc9f78b8da228c4aa31d48e9 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/3e954cd5cbebc31506def86584362d8bd7930787 |     
   arceb     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/e74ed0ca2c9b765e8b6bfd30f060083f47051358 |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/17419cc826f8b80c08e79901a57edcf2ffdfb8f6 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/b1264d520dbe601d33395995e969d333e7b06f26 |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/0575b88c5f5d5eed979a70c1a995867ede893613 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/bf318577c6680242578eaa8e652da47bfdd54cb7 | ORPH
    mips     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/4ae1d739dafc4d3595aa7b3b1759ca56fb0977e8 | ORPH
  mips64el   |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/1d7f686c118e047b446f5beacd43ed8b5baaed78 | ORPH
    or1k     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/638fafc26c3f779d0144a488e085e9af7c00db98 | ORPH
   x86_64    |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/e9c8bef480ad51fbdde0a97dbf0907de3f8f19a5 |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/af30f71dd69f1f083ea6ff706d9e8a320835513f | ORPH
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/e598642e9f091e2d0befc1aa1d451f758fa81a97 | ORPH
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/c957d0b3ad76102c5dbeb5327f31638b3b8a879c | ORPH
   s390x     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/36e149eeba9924f8573fc55c5fd8702a709c0526 |     
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/4de9c7e9e5bcf6709489bc0bba2bf7445ebe64c1 |     
   xtensa    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/f7b2a264a43625e2f1c0d1fe74fcd5fac1f8ff2d |     
  mips64el   |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/322b22499ecf8a80e470e4188eef39382b41476e |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/60b447b2470db4c07a8ae3462e53212eefe744eb | ORPH
   s390x     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/9fb453495e4fbe26d6bdf10da05ccc90adba83df |     
 microblaze  |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/8018f5b5ad9c4af50a4cd88cce43701a2600bc69 |     
 powerpc64   |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/eb1896a43c603df270ea970b750d84ca3d28c966 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/360980456786470c6402815b5f02648ddfbace5d | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/71e6e658f12efaf19040b47c6bfc28a827529c62 | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/512c96f97508ba8f606f2ce44ef8183065b1eaa8 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bc35651d08456ca4755420defdc2693748401b6a | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/efcc34781b215e006ac65bb3cb4c95e65e88a959 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/34e9dabc82e38abd8414a8e901f948f008465311 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4a3a97350123e18c21ed38bdb921b5c4c1b3cd18 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ae9c2517f8804b83cce71fd1a49fd769157a4717 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/579df5e93b5a7ebf160683c1376c653d2bc411a0 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/6bde326d36c97ab5b4d614553042bd3b081f5871 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d6116adc7ad6f9e9152473ee736c98b462d1a26d | ORPH
    i586     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c910d95910e918fde36717d1b7c0f934f92e8394 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7aa4337557c938cae063e92d6f71972c6b61e606 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b2c6a60be6829127dd51728c330528e77cf8fa0b | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4c68c52ddcab69a66297d2bb8d1356474b43f4f4 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9eed671c7357756c48d9f4e416020412fa6bada3 | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3c8bc9c9f1ca6bf62c49ce17e39528496cde259a | ORPH
   sh4aeb    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5cdb720ef5960fa33c356ce07d913099c69b24f7 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/872c3e27e3df31176a1be43cd265e75d97802346 | ORPH
    m68k     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/257777517bf91d8f9b6a52a3c2b74edc159151d7 |     
   armeb     |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/73fbc3d1ca6c2df4ad89b7fa0e5b3f6e38881039 |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/8c9486785ce6746cd16561a115f8ff79684c52e0 |     
 aarch64_be  |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/1653055548defe2ace4fc2a85714beace2ca3086 | ORPH
   s390x     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/85b5d58d6a108b48f016f0ed8b7b71daf1d7c47f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/004ae0c6c0a064063c1283c18976325088e47579 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3dc723051cc79dcb25808364dd58400ae60b1d3f |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d329f146dfb726341c06c81623ffba7ab8c9b4ba |     
   s390x     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/eadfd9a075358b6ca2b00f1c03ec334f208b1af4 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/bf86255befc88364105677b3e387c39e84c60078 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2c2be5ee56f462e5784357428eeccd5e280918b2 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/af5a67ecb2bb1d88b9924cb81b2fa6cebfdc86b7 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/d1f49d311f4656e74064bdc6b4cbd2297034ede9 | ORPH
    arc      |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/c6a93a4cc642976d02600105006a6a4d116e016b |     
  sparc64    |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/e1b95b4fb0005d4e933b027b508cec9ad510bd73 | ORPH
 powerpc64   | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/5eb7ea11c58f1f52aef25d001f90de929bdcb171 |     
 powerpc64   | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/b6bc137eab60cf4bb80cdb940a3762e97ff085c5 |     
  powerpc    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/758863a53fd1bf56fa43b7e90f371afce5b98ccf |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/0834a1c41174fe6e81b0405ff986bf182b8a0910 |     
 microblaze  |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/a7f86c543d7618cb7114cc480866ea8f0395bbec |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/46a2890d674fb18594e8e7bc76614525e0721027 | ORPH
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d15736172c593584851f7c279983fcd6b508dd38 | ORPH
microblazeel |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/8aa085b3c25886d0c187bb69830b094d4716bb7b |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/84f11c5cfe70980a9862879b941d147e2542dbd2 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/3a3ea3b86821b6e66425f34f533b835dec0030d9 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/5b3917648aa2bb2b8107c0eb3af537949e07673e |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/614109f71b8fe27a4af165b4436a8c3b5f936e3e |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/11b1819764b87880971b200be521ebfa939cc35b |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c972c3267c7c320def42ffb50d5ef0c2e2ef83af | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2f1babcc3517c6e66d6e5c0011ee1083884fa5f2 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c8c6459e877856df8a392e2c17a9957ef1d2ee02 | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/dea04bff80f48860fa423f97e962e5caa25f65d2 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8c6f328e26054d386d209f9d5f538245dfe889a8 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/eecbf84f3eeb77f2d4181559d1ca65b376b59618 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/da151bb20a77384b36016e5360257f7da2ce2588 | ORPH
   armeb     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/48dc54a4ecf6dfb03fabb17735592bad1dc0a4d2 |     
  riscv32    |          gupnp-1.6.6           | NOK | https://autobuild.buildroot.org/results/6d2d7bd275ba61c37a1e2eef941d1f784c6934bf |     
   sparc     |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/2a076f087c977f6fd0d446148624669d764a07a7 |     
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/ac6ef74033b652ea9cdb7bd5ebbc888b8350b2f5 |     
   mips64    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/01affcd5dc969d8f770b09c59e21e372a0d63267 |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6fe60d33188629dbae76b6a52859ef121f1cd24a | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/0e135e4a8ab4d7f46a2207a77875d719361634aa | ORPH
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/c8da94896664e51d150f97d2243c205b169c11d2 | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/e991f33f4e7e3a611c3a22040594779bb3a31b73 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/a8c09574534a82e6ffa981253bf896d458c14d9b |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/27ddef19f0fd1eba3d620b992a8bca6ac2ddfb18 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/697f165640d42f14a7d43994034f852f35ea92b7 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/3b52cc5b5c5fcdfb1b311ec998d534a8f6c9c0ba |     
   sh4aeb    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/02bf435546d5ac7b0b7baa5042b389735d781333 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a59f9280767df10aeda9fc1abed1b795bfb2da4e |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a4fce9e043c4686c92fc8ae9bec7f212a8db993e |     
    arc      |      imagemagick-7.1.1-43      | NOK | https://autobuild.buildroot.org/results/59ba520c19c9405e987a4cd5e743e96122ac9dc4 | ORPH
    m68k     |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/9c48665c54c62692c241bb11aa3513cf041cc0a9 | ORPH
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/f7a7da82ac9815002bee8d46dde2513f7fed99aa |     
powerpc64le  |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/3a108d0a335dca43fb76523163b6f20148bf6427 | ORPH
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/7d7ba43b1e46944db886c86dceaf92087531aef9 |     
  mips64el   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/0eb37640719a764b246b18737108be81e2d98c5a | ORPH
    arc      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/cce50f2f2a79c976fb12189e9299f5c6716b94b8 |     
    arm      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/25a6625f8045e144df5959b2eac87212ce39f9cf |     
  mips64el   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/b04011982b24b37a79a5542ed43e5d6d9508698b |     
  powerpc    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/c7d4cceb1edcd34558e2152926bf4fe0c16d8d29 |     
    mips     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/147129244dc1ba751a04e92710f3b2d9266ba596 |     
  mips64el   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/7f68eef0282f862caa46ef14e416cb798339c066 |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/f16185c1b5383003195472c4ba1f51e023f06ebf |     
  mips64el   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/cb746a732c8d770c15cb7c4bf2931623599aa6c3 |     
   sparc     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/5c32ef30655df0adc77a7a660936c780a471b64f |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a9afad9fb1a615806f2b743e78560c203b21bff8 |     
powerpc64le  |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/3a1bbe83d447699510ac98d0396844457e18fbbb | ORPH
    i686     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/f8cc61d55587169ffa636895ad0f21657d44c829 | ORPH
    arc      |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/4d1a81be5eb41ae317d22b7133ac475c7db9a2cd | ORPH
    or1k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/3c5b19be6c35c9692b8f0d791bb337ba81fe8b52 | ORPH
  riscv32    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/2dcb4a47886f9d3962da6fc2d324b29cdae76f88 | ORPH
   sparc     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/d3f0eb195348dfca8c7e056a2d0740f44c991c52 |     
   mips64    |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/ae309d78cb35446324d2f7f1617b92354693996b |     
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/20ca37b7cc7931168a4c97568f5c0e005a187a57 |     
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/798d46b71cc4331385716192980fe767b4067dad |     
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/3ee8731eaa7f57e9c724b921607e62389edc9bae |     
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/cc07ebf5bb2be1c99844357fbb788d89815e8d26 |     
 aarch64_be  |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/fdb07ebc62ff01ccb74ec3732e98331cfbb94cf9 |     
  powerpc    |         librsvg-2.50.9         | NOK | https://autobuild.buildroot.org/results/7c69a06ea2dcae3305a2cc3eadc32e9a01ccf995 |     
  riscv64    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/18c6b14a2947f4b7cfb3cbe270edbb9ec40ea02d |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/b3f2c69d4a93596e93efdbd4fe9e791043286e2b |     
   arceb     |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/24023131858495c5198368aa1a96231697daacb5 |     
    or1k     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/2031a85ecefb70e986dc55bd717407929c404676 | ORPH
  powerpc    |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/770ac5653ee832a9117a7cd288a193750dfcfe29 |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/0105cb73f919d436e2b14a2b904eb4090a7a7403 | ORPH
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/af528d57640b4b42a283ebb770525cbf9a42c15e | ORPH
 aarch64_be  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/08f0e4a99787b7864485f96f1d8c8af1241270b7 |     
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/4c07cc1e60cffc8d2ef77c290e1001935369743f |     
   arceb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/f5b4277d5b23ceced75b8aa6f4e33a56699c9f87 |     
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/3158c4616481fdfe28cf7eee2830689fcae8ebd2 |     
  mips64el   |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/ced6fa69af3ec2f4fd57a5607ac80a871d059ec8 |     
  powerpc    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/6035cc5ebf09c970b0b2f3ae13e38cf5230ec637 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/848c4998c384222776d7db02eeccc3cd692c84b6 | ORPH
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/80e39471784935b523f9604cab7bc489f13f5250 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2543cd7043bba3e0e477f93d1b04aa1854be5fa2 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/470c4e4a4b79bfb0231a6d8d346eaae0ac5b2da3 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/62bd9b81ede87efedad6f2f60ae78b0bb232a4d8 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ef8827650f2f355f84a85e982c4efc4c6f6f6bb6 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6ccf52add6258c9f6ab3df77e2913a8b342cf47b | ORPH
    i686     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/12077d548e3e0f658f8a5a63e337424563c97404 | ORPH
    i686     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/9e6b7ace4cfd168a7993047fcb8e375146266589 | ORPH
   armeb     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/94cc67679edb922201105dd86517f4502c3b28f2 | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/669b9ff884944ae89b37e50e63bddbcf737e82c0 | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b10aaf97296027c47c8cc1b73dc3b9fb88b81371 | ORPH
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d96fe001f3976a07b92bb0418079fc372966d998 | ORPH
   arceb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/0b0b548b5c55eb09f100b7c384da09932aa1879f |     
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/825079d268c0dfc3a1e6e6089047a8922c41ee21 |     
    mips     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/34a3abc42d4e096ddf9488b504ced280b219611d |     
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/290677cfddf17a2d875895dc42f8548e10e19151 |     
   sh4eb     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/a46ec8e1fd702f93b1b33527208eb96365434a16 |     
   armeb     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/85398ae5bf0af420766274ecd6c7b2209d089eac | ORPH
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/163ab6b95f72b56c60643d288ca58237d8a41ec0 |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b87ad0af456d28feb135d7148104a08c3b5bb15a |     
   xtensa    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0017b820fd12cbecda353c65f7c7d691445c4bbd |     
microblazeel |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/0137ba3af4d7cf49716f8b1c80b4e1e0d84bf42d |     
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/c35daf96ab8a615afc7dec98b10bbc7daeba73f0 | ORPH
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/fff22586405c078c5340540b522bde288a3f5fcf | ORPH
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/551015049c54cd64c7933cc569c6229749993e20 | ORPH
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/29e3b664ecd288931d2a3cb713d816075af3b9ae |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a2be462a2b52d5207c845f416050073261544f62 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ce9e3dc290f417cf24e3e2b43c5a1924fae8191a |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/603d22ac8a716c08548c9b34a5a59c6ffc9c018e |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/1ad443aca5fe8395f635c062e7586eed2b40fc66 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/a76c4b58833437be0d2e33d4ba12858f6d90af85 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b23de2182a66d7cd73a549826f4e85b09104b71b | ORPH
  sparc64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/0ae5c2d847c4308563c1ec1b36ff1c3b392959e8 | ORPH
    mips     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/5cdee88fb2292f3fa6cbe2a455a12d5045b149de | ORPH
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/1a0e349319116b2af429dcdefee221ea96fc9ed8 |     
   arceb     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/5aba2df6988a8888f5212695f3fe66c018a36189 |     
    i686     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/ad3cdcddae2333e8a195a5a12c99c6496446cf18 |     
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/3ac5320a5ba7c4a9edc185cc27823eab526289da |     
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/a4f12122f7fd3d9f38692985adc26d05cb90d08e |     
   arceb     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/f47eb7ad05d47bd595f4fe42da88f3a749ccdfc6 |     
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/31f7ba31a6dafea42b8cec0185839c4c5e793bfe |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/4ff4534f463f0ab19d855c895bdbb06e8df2c7ee | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/4ecdf5320716ec8b39f09fde3fcbbdcdb557f8ab | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/92040830f79b4c270c1751efba576582a2a1bac4 | ORPH
   armeb     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/612016f510890d7996c24530bcfacbb1cf3649aa |     
   s390x     |        postgresql-17.4         | NOK | https://autobuild.buildroot.org/results/dd67a4b208ac8727bcbf782c58c8b8fc56c4364d |     
   mips64    |        postgresql-17.4         | NOK | https://autobuild.buildroot.org/results/3fe85953da01573ab199c9cc6163f861e9ba4c2b |     
  aarch64    |        postgresql-17.4         | NOK | https://autobuild.buildroot.org/results/244f154aece46d02747b875faba4c51e7b5d0dc2 |     
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/6d54f6265e7a50e5342f0efbb4d689fc1cd43a11 | ORPH
  aarch64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/92d5fcd4937f20e08276e3c8798364e7fd0bb40c | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1828a2e226621c42bc38179d47f24f2a3be51267 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/92998389bc54ca7e29575bb95df453cde64b1a54 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9c9e06e79f454cd1d5c29eb6940f053eab9f62c5 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8f39a5bdf6dcadc02f99897b70443103678c2498 | ORPH
 powerpc64   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/cd521374f18072bfff072e19f1b406b963525eee |     
  powerpc    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/2ff1f89324632e2b144a8bf47160bb819965aca0 | ORPH
 powerpc64   |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/07023499d1ae1e3314ca23f651a4c27c4d08d356 | ORPH
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/18b87c32f9192fad4f765afb3f55ff0e53bcdddf | ORPH
    mips     |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/1d2d58dd1706c7d224e19c7d67cf8de7cee0325d |     
    m68k     |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/475927ec103614b5fa5fbea7391830e673c71b55 |     
 powerpc64   |     s6-networking-2.7.0.3      | NOK | https://autobuild.buildroot.org/results/3aa81f5e4721577f723d8809003783096f994fbe |     
   armeb     |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/03a6843ab0c33757633e9a8859a7106579a143ef | ORPH
  riscv32    |         uclibc-1.0.51          | NOK | https://autobuild.buildroot.org/results/6b2b06d80cdace7f26e8fa62cae873777bec4f5d |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/10ea489bfb4f112c9043d7870656608a2fcfa747 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/65993689c711b95db7064f78820617ed933558f6 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/75e301deec87be2c646f053f93f517c9893baed5 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9e8f318a724cbb5470088ba6b95fafd45c437e98 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/746d319a0401a8bf49bbaeaaad298e68a556b606 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/0ddb35a9b365b7dc1d66feae6a1902a96fbd3038 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/094b03b9aa6979cd4b94d22d2a8a6ce8a5fb5f48 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5a9c77461fac88a0c7ab834dfb0d987c395b2866 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/04d20b0549ae8d834b654415e0cbf00217e15f12 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c270c40e3d0984e2ef9f704209f683c8aeb5d84c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/76c057807068256e8ec32f6f26f2c29947e93f58 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d078e223844f83ca43c33020b329d520cd156bb1 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d95465a8b942f7fd567999990b39e9c85e7df998 | ORPH
  riscv32    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e6dc634e62523d25dec2263fc4a4858e754e48fc | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/ec5767e909b8fe5d4b703f2107ed5c2d779b7689 | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/834f54cf786147fc33e46fb92588775891cab6b9 | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/9ad8acc3cc1bb467cca3029bc8f4ea941c6c35f2 | ORPH
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/5662b2203e05f190fcfb43415694e716eb86e03f | ORPH
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/17646e45ab98409540c021432751149d78d874e1 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/901ef56182a2887d924b54eac62838dd0231f5ee |     
    i686     |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/c270ed8f9f1c643b249f2206d76d1261abfe9a88 |     
microblazeel |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/c08d3060c785a7ebf904f580b7d818c543b2e29f |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  ffmpeg-4.4.4 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          perl-net-ssleay-1.94 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-4.4.4          | NOK | https://autobuild.buildroot.org/results/9a3e17365de91350554c690965f8d42a1ccd730b |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/0d870e88d991c834e7ceb15fa7be11fc49fccf71 | ORPH
    sh4      |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/b400c6a5c7e856a1787ad6bf4a96388a5507776e |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

            gstreamer1-1.22.12 | 1 
                 libssh-0.11.1 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/e72bb55ecd4a13673fe6988d5f0228f88327e673 | ORPH
    i586     |         libssh-0.11.1          | NOK | https://autobuild.buildroot.org/results/cf0bd9f3b738990560c553ff751618442a57ba4d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/10c3f14e050e338495c664f72b00615ceaf565ea | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
