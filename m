Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067A1FC618D
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 03:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DC79411E2;
	Sat, 14 Sep 2024 03:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHbRAhd1Mjl9; Sat, 14 Sep 2024 03:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F4E040AF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F4E040AF3;
	Sat, 14 Sep 2024 03:18:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2511BF33A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 03:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E40B846F2
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 03:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RVy-a6ZqMHL for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 03:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 497CE846EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 497CE846EF
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 497CE846EF
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 03:17:57 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so162868366b.1
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 20:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726283875; x=1726888675;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BmYkHnp4e8c6IKPupkur4Fzxv4hyZZqmZG6DCz8xyMM=;
 b=V4FJ8R1hNgsm+ptgWy+z/XZOkpEEEc4WlDJmf6hRT6V+Cv3tKhfN+pU6chs4vdgvDL
 0PtjuigEi5AKZriT1RBK1EdDgY6jVWz/uQ1zY11isoNatY0055UT1ba1jtol08reI8H8
 yg1m6FgcG4kbbvLvE3hBLygD60Bg0IKCO7rB1Kd6gJKyUWvTh9HLtSsCkwZayjdj1+MH
 2Ly/0pHzFBMYeVhULkdy+vNmZUvv0qFd/td0g4tan6QuhiygejxyegugSmek4p32Gc2Z
 szkC3fOdW7A92JPZZaDu12hXs+tAiD6yhC6+R8lwOuZKxrdMxd6pNzm5B7hY40HWsYTo
 hE+w==
X-Gm-Message-State: AOJu0YwZacxtkYHu2yTh/WNwH0Pzk9+E202CajijdYyfeMFS27lcVWQ6
 e7d5jTMLzqPRx/S8sg+/ScDwYgjNfv7jNEBPlmKm/QKpxqRxD8pzaIYcfQ==
X-Google-Smtp-Source: AGHT+IGg/Q3HtWtBBKmNUPXcipcRZn8q0RwUcdmXX7XMs+a2Bo/qAsUvMD1YU13hzjQnFcXSDjfwqA==
X-Received: by 2002:a17:907:3fa7:b0:a8d:5472:b56c with SMTP id
 a640c23a62f3a-a9047ca91a1mr492262466b.22.1726283874643; 
 Fri, 13 Sep 2024 20:17:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f4400sm26410966b.84.2024.09.13.20.17.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 20:17:54 -0700 (PDT)
Message-ID: <66e50062.170a0220.3ae147.0a6a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 14 Sep 2024 03:17:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726283875; x=1726888675; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BmYkHnp4e8c6IKPupkur4Fzxv4hyZZqmZG6DCz8xyMM=;
 b=c6oAEMDj7PrGHh9wIqSAjaOQ009Tp9NoNAlJ39Vaje5DoJIOoM06aGxTXcXiDGV1KF
 CynB9J+U0UbY/w/PohaKbdONvBrTIJqInZVLi5f9k8r0hzlJxBbCLty6cALcWOmMvIy9
 Ix2/lGNOj1klBdUjLiJ+wv867FszM8LfiajW0Fqj2Q8Omrs+Lh4oiXO3iM8fUCBFeB8d
 ei7TVu3awS4qOWJB0FTDr/50LAr0KAN5/GGWdp69m9pp8wpsqeutkGCHzSmL42LqvRhZ
 hYIYdpEgQ4bVWZ1DTw3gRBuVyhIHjFIzONK9gUg0J41+rJuYJDNpsVZRKvzqr8C8HscJ
 dnJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c6oAEMDj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-09-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 17  | 11  |  0  | 28  |
  2024.05.x  | 11  | 18  |  1  | 30  |
  2024.08.x  |  8  |  8  |  0  | 16  |
    master   | 11  | 283 | 10  | 304 |

Classification of failures by reason for master
-----------------------------------------------

                 libssh-0.11.0 | 28
               procps-ng-4.0.4 | 19
aubio-152d6819b360c2e7b379e... | 17
                  linux-6.10.8 | 17
         gobject-introspection | 10
          cryptodev-linux-1.13 | 9 
     linux-5.10.162-cip24-rt10 | 9 
              libopenssl-3.3.2 | 8 
          linux-5.10.162-cip24 | 8 
               linux-pam-1.6.1 | 8 
                  bind-9.18.28 | 6 
                    bsdiff-4.3 | 6 
               pulseaudio-17.0 | 6 
android-tools-4.2.2+git2013... | 5 
           at-spi2-core-2.50.0 | 5 
                  ffmpeg-6.1.2 | 5 
glibc-2.40-18-g564178076272... | 5 
  gobject-introspection-1.76.1 | 5 
            host-binutils-2.42 | 5 
              host-rust-1.80.1 | 5 
                  ntp-4.2.8p18 | 5 
                 pixman-0.42.2 | 5 
                       unknown | 5 
               valgrind-3.23.0 | 5 
             bluez5_utils-5.77 | 4 
            gettext-gnu-0.22.4 | 4 
           host-librsvg-2.50.9 | 4 
                  cairo-1.18.0 | 3 
            gdk-pixbuf-2.42.10 | 3 
 host-binutils-bare-metal-2.42 | 3 
                 libv4l-1.28.1 | 3 
               mariadb-10.11.6 | 3 
             batman-adv-2024.2 | 2 
                directfb-1.7.7 | 2 
                elfutils-0.189 | 2 
                 gnuplot-6.0.1 | 2 
        host-sentry-cli-2.20.3 | 2 
                jemalloc-5.3.0 | 2 
             libapparmor-3.1.7 | 2 
                libdrm-2.4.122 | 2 
      python-autocommand-2.2.2 | 2 
                  acpid-2.0.34 | 1 
                 agentpp-4.6.1 | 1 
                 apache-2.4.62 | 1 
                  bcusdk-0.0.5 | 1 
                benejson-0.9.7 | 1 
  binutils-arc-2023.09-release | 1 
                  bitcoin-26.2 | 1 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cloudflared-2024.6.1 | 1 
                     crun-1.15 | 1 
                   duma-2.5.21 | 1 
               ebtables-2.0.11 | 1 
                    emlog-0.70 | 1 
                   eza-0.18.22 | 1 
                     file-5.45 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
            host-ccache-4.10.2 | 1 
           host-doxygen-1.8.18 | 1 
host-vboot-utils-4b12d392e5... | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
                latencytop-0.5 | 1 
                   libcap-2.70 | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
               libgtk2-2.24.33 | 1 
                liblinear-2.45 | 1 
                  libva-2.22.0 | 1 
                 libvpl-2.12.0 | 1 
            linux-fusion-9.0.3 | 1 
              mosquitto-2.0.18 | 1 
                   pcre2-10.43 | 1 
                python3-3.12.5 | 1 
                 rtptools-1.22 | 1 
                   sdl2-2.30.6 | 1 
              skalibs-2.14.2.0 | 1 
                sysklogd-2.6.1 | 1 
                 watchdog-5.16 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/561465f486e834c2af1eccf4f211208b512624cf | ORPH
   s390x     |         agentpp-4.6.1          | NOK | http://autobuild.buildroot.org/results/70b76302c250cb4e49ff93ee620055b5a081c4a6 |     
  riscv64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/db86b075f1d4a5ab0048f758c6521fb8a37c155a |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/af488f5338c0f09cabf210e3a56ec886430c4140 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/9df0fa01a6e0690ecb9f01b182022557822e9f05 |     
   sparc     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/dcf5995baa7c2d35dd20a2f8d9a18106034a1970 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/9685ba527ea876800ddcce6e64ba9185fefff600 |     
  powerpc    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/f17c883e2699660f97ff3d460f9cecf95b55f79f |     
   arceb     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/5812a522c17ba6794a58c769ac0c9a535209ba16 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/1dd84dd36079151345a2edf123c4d67e0f4bf94b |     
   mips64    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/0d4b6f0da6c0986fc22ef7ff43ea7c528415a292 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/7aae2e98e939747575a32a08ccd5d1c3573c405e |     
   sparc     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/b0b9caf3358278f6c0bdaefb4332053b89d86e24 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/ef0d4293e4e95a9206a99c44ac5f6480acb75bff |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a42858c68f532a92be29574ca36d73b48a1e902f |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/d5298b8d4375fd4510e43f179125dc09729aa5aa |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/d894a30d9016b7984c5188fe59b67107a49a170f |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/df2294818fd96d4b0e12eb5bd1761fbf0a4bed0e |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/d772ccbce755e6116d612741a5632ab4434b44cd |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/f40bdc38faefcaafbe62f88445c620b99c544334 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/439f9c68fdc7efa6ffcc85dbf425955c6c18eee5 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/f78ebc70154de7441df1fa0e405c703f0551d51a |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/2b44e2820a00e7c0765efa0b8acfe099ddc7d685 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/159829acd1159c8b8b5d70bbc764415a4bfa180c |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a05bf4e2b688b0d5336bdc3df4b6b6c8296da47a |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/db78dc8e59a61d1ef4095a6e50782fc99f3aa6c5 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/f4d3591922f7a65b19d9ec232d9367c9fc469255 |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/ea838a84b3714eee52e1b9be9b682b63b21a69be |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/27d49c0cd1b87fa41e19b5b804ce4b9368426388 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/f7bb9f362847d525194471924582e15aad4246d8 |     
    mips     |       batman-adv-2024.2        | NOK | http://autobuild.buildroot.org/results/fbcf3dce27a5b1a30c18fadb690c388c66b425eb |     
  mips64el   |       batman-adv-2024.2        | NOK | http://autobuild.buildroot.org/results/30b845731e5bdf1625959a5f78fbf55fe663d12e |     
   xtensa    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/3fb89c06d51da01fc05b69ff4f971787851ac392 |     
   xtensa    |         benejson-0.9.7         | NOK | http://autobuild.buildroot.org/results/9dd1a381665bdeae008e58d1c38e9fc038e1573c |     
    or1k     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/dbcec5246de57897c67c06b09a44f28dde150b36 | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/5c7a62d2d5650cd89156b46a07284981003e9e16 | ORPH
    or1k     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/e3c0c0aaee1fe78cc3254d895425f1eaae6ca3c3 | ORPH
    sh4a     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/273206bfe9a1cd2f137a79141cf1ce80f0516e68 | ORPH
   nios2     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/180ed79f8d5aadc48826552d54db6161db57fb75 | ORPH
   s390x     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/09cf3931d1572671403dba53208d5be7174636b9 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/a834dc9d8cc2d0c6f558e86235f28af844c16c24 |     
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.org/results/320d7ed907db44fe980da9aae1c00cbcfc7d36bf |     
  aarch64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/317bf4ad2593b1d1a8aec82cc0b3265285f00b7b |     
microblazeel |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/eefc92185d3a91d2ee8d4fd42d61a18bf7f009f8 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/93b6bf3748d1514f01e8cd22e05360830dff185c |     
microblazeel |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/e3aa8629b52620267ac1139326d86263637d5541 |     
   sparc     |          boost-1.83.0          | NOK | http://autobuild.buildroot.org/results/1b227989e1af8627bf0c73f23cdbcf8b85a5ff7e |     
   mipsel    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/b94dd805e383e46eaaa4c63468522f051176e1bf | ORPH
  powerpc    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/268d0615394402b5265093717dc249e3bb0f8f60 | ORPH
   armeb     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/8613fa2cd84f71674ae2bbfed485796f17e88e31 | ORPH
  riscv64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/98de3804dc77ef0b215518b3cbbd70d91a72fe52 | ORPH
  riscv64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/f703c8bb4c05f6d1a7afc3b0df7e4d3338f134c4 | ORPH
    arc      |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/462afbf1e74d4d442647f9077399162d02ea6965 | ORPH
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/b2851f7c25636874c809b5112e880a8e687fd899 |     
  riscv32    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/4fb6337b72bda95b6f641f20e1c67e224ac9e322 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/5488847b5d9e286393ef892c20d31545c96e9034 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.org/results/2122d6edef0823ba93c0e80e7e33e2d41e6c53a7 | ORPH
   s390x     |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.org/results/97f7f05a4ae29b85963b5884d23d5bddb93e7bbd |     
  aarch64    |           crun-1.15            | NOK | http://autobuild.buildroot.org/results/cb8b4652c1d110ac7c9e852f414f24b70e9652bd |     
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/a7473eec919214854f67bced608e0be1986ac668 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/ff5438e5cad36c585a49c09ea5c4ca952a4a0f35 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/27d529a82140678b006eda1f2a865f86c85e7e3c | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/e7b2b71e1e22ed2606d1bf591a8768b05775f119 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/a9e058d087b4508d8b3ed14cd9a526fcc30d7249 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/1ecb1385f7e393419b7f46da713411e9991504f4 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/6bf5309e973687896cd25faf42b0a652b353c4d2 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/aba6f2dfc373b5166ef451c97adcd457d997ed38 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/4c65d543b591cca09c534d9f12f9413bfe7bd538 | ORPH
    mips     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/003209bad94bf626b3f2a085c02d206629275049 | ORPH
    or1k     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/42cfcf7b0d1083a50ba8e4f5e8cbf6a7eb69339d | ORPH
  sparc64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/93da54fb50b7f6b6162910b615e6b370065f1b19 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | http://autobuild.buildroot.org/results/60f8f5f087111ec3f300dc7979363de5a9f64f08 |     
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/d3bcf0d78191eeffb8f447d79c3c2b61378bba9f | ORPH
    sh4a     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/a43ad3b064cfccbf7cd52eead880a2d3842d1fe7 | ORPH
  mips64el   |           emlog-0.70           | NOK | http://autobuild.buildroot.org/results/0d98b7efded047cce0e45a234532f51ebcdd996e |     
powerpc64le  |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/53a007ca563d1217b133ef93b8091d5106396fbb |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/4b31719250187be60d07beec8bec7ea7266e5625 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/54f1aad2f61a13ccb26799ad593ea2f55c83cfd8 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/fc14239a2c9a918f3706d25305ea515d799701fa |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/f9b21a918f96b73dd1147c4473a4a80c8995a32e |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/bfa0b8a370ccb04b5f189064d4e8ad3c32845a27 |     
   armeb     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/624b166299fa94841c33d13f0cbcb440686542e0 | ORPH
    mips     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/00bd1ba4e5f1906644b2b29d4e07ee0d20033d7b |     
powerpc64le  |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/24e1e43ef57d6679b11f2bf22835d891e266f3a2 |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.org/results/63d9d4efa2287c37dd8d51fd54e1781a6999e5a0 |     
    arc      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/68c41817e9eb3aa39714e73d989168b4f199aae7 | ORPH
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/b277ee5b898ea793489ea8e88f0984f7ea6204ef | ORPH
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/48d21aa4a641a87b80d24e955f978350e1f433d4 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/391fba26cbc6f1e69ebd57882fa03ae5a84d8b6a | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/bd23c9b8b9c4c7daec5556d123de0ab4de239095 | ORPH
  riscv64    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/641e3e7812c9ca7d239fa0634dda6279775a9a92 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/98f7d7978e63fdf05e229bca36f3aaeab119ace3 | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/5dec1362b8938838517249c35eb7ad5adbfcc834 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/4dc47c4e50b64ee5644de64ae1dd893ca3793fc8 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/40ff65b71926631c889862ae4c79297c4b3dde0a |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/64a8b63cd0bb23115a471192c3db648e37cb15cb |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/9c6173d43e00b136820a390c90979c409c46fff4 |     
   mips64    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/831276a2be9f4150802799fd8e04727b3d46756f |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/304d99e9a828d3908526bacf20d943b4f9b96063 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/67d2e2cd49225016de4e04a07a4122af6ee5dc8e |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/8e1e93c9d77424a9b45cb332631ea320ed5870ca |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/3dffc8f79025fba4648737258f99b7703181dbb9 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/0049f1f8349ac49d3a5aac4e0a4b683b4a0dc435 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/53a28508f4855deed92cecf07dff1b9e92c248d4 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/c1857b7ac0bb0b69330fbec4e2e4f0d774b31735 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/2450cd93e84480927fc40986cb917b401e35bac1 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/46f4d25ea771f1ae07f8e99b9b0195efbbc841a0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/849791755e065a4e692b17c5692c992d9a6014c7 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/8e9f9e727bb1318d715c851be92d3aae61784cd9 |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d56ee75c4b4096954aebe585f412f1be05f9505f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/5c86bd0c4e70903f534ea74b6406f1f83e8972d6 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/09ef3a227f6af7ff3fc17a8b6a17b6e520d3b813 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/10d486de801ff6af9243e3241574379fe53d9148 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/1f5d16249aaeeb5222f0361adce266255da558e1 | ORPH
    mips     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/8fc5b88fbd7c6ba43b1226c8fb1625443a680f37 |     
  powerpc    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/27b8a52afb14a62c93146c4f5bbc819792f1fa29 |     
    arm      |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/9beca47abe133a4f185aaad65ac18a41a17f36da |     
 microblaze  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/b2e163cbb6385d5d515441da607fae13f5299241 |     
  aarch64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/9ef6eaae9bd240be374db755b3ae9629bd4160fa |     
 powerpc64   | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/4602c782acc3d23815c52f0a34fc7d552ff7ea4c |     
  powerpc    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/afa6598ed960eb56770b3842bb95ff3e5ea25adb |     
  mips64el   | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/513495098de309cd058243eb5d287876b8b7a761 |     
    mips     |       host-ccache-4.10.2       | NOK | http://autobuild.buildroot.org/results/6f41bc5f6f2b547bdbf40268dc4a6b1370d10017 | ORPH
  riscv64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/fd853600155d4cad29d1e7861b3487114ea58fe8 | ORPH
   x86_64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/798ecdccf6ec2316f5975eb3f5a1845401b29b56 |     
    sh4a     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/6bac8594976b622f632efc4908029fe39662e471 |     
   armeb     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/68f2d108e66b00239f98f19bb2ccc2063529ad6d |     
powerpc64le  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/6bb0d1feae7eaf540737d40357abac4cb560d0fb |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/15473d50659935d651a58572b915566d9ff9c526 |     
  aarch64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/1685903445076b6e38fcb7eb034b29a1e959e293 |     
 powerpc64   |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/b04ad91616e110fea667fcd71836db491e907e54 |     
powerpc64le  |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/a57b35fbf460be75706e22721b8f91b103afca58 |     
   s390x     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/a349d4ee888ddd10755a1673d20c2f95181c41e8 |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.org/results/3dfb53bd00bd651a9fd802444d511615fb9834e6 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.org/results/42d5c91916de8c366eb75545747047b352aa77ed |     
   arceb     | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/052565ce7437a285437783a1930d0fb88b464307 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/cd0e7444cb5fd727357907034b262c6f8f4a3cd0 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/92d9f2d7bdf123309ba0d2c8a80310c1c6be1bd4 |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.org/results/f6a6ea4e4e04b6d3899d6d8255ef6fd7e991fd3d |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.org/results/f796e3f54d2c583ac4afcf32b66734bb6b382c3f |     
 aarch64_be  |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/c1d27dfc046cc61eb29f4f52141f7893d4ea048c | ORPH
  mips64el   |       libapparmor-3.1.7        | NOK | http://autobuild.buildroot.org/results/562ee45a8fc58ea9a512b7e0467a49da1a16825a |     
    m68k     |       libapparmor-3.1.7        | NOK | http://autobuild.buildroot.org/results/cb2bd277d7edb3b85dd1a741d4e21677782c979b |     
 microblaze  |          libcap-2.70           | NOK | http://autobuild.buildroot.org/results/492688d1a879e1b795f894e732ed13240d5b2426 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/936b299e791a8b9e48ee74067ba45c47ab4a98f5 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/1d59cbe943353247be1217b9bfae30e91c548cbf |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.org/results/9a30f9ef7ed4897fba21deef9aa996c67d2e374e |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.org/results/d204d530c031e05c77f613fc585b45d4972aa712 | ORPH
   armeb     |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.org/results/4d1e10e0d51db364aa84bcce1a934a6cfb760e9b |     
   nios2     |         liblinear-2.45         | NOK | http://autobuild.buildroot.org/results/6d1207d0dc9afc06a7f5213185300a8c695daa40 |     
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/1d4aea0b72838e210bae7584ee196ea5bd2311a7 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/444004e0b044a936b48186aa9a34a6eefdfb0e4e | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/2bfc905ce2eb0134fcf2caaa2fff8a65edb57685 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/1a20744615c4727fb3d81f8c218ee0d4b8f4f6f3 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/202448bfa28beb0d2a41cd6b552e980a2d1735f9 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/1d85c0dd226d41cc404985d221cb6f4745452bf2 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/ba82472afd36a74d3037608047506509ef0d9bd8 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/1bb1647f7e3e50e4694fab6c787f6ae0d1345794 | ORPH
   x86_64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/888fe0254a43b25e9484b5fe53fc8005621e6354 | ORPH
   nios2     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/4c8a1f42606d7a11c2c6394ae4ebf3b4ff40a271 | ORPH
    or1k     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/5632feb18ace91ee5b6de49fe194c21224b52bae | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/9c2dce2fedd2a1f9480ccf50fcf6b6f89ff080fd | ORPH
 microblaze  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/fafa6549a4c980b4524c62b4ddfe21211fcbd7d4 | ORPH
   nios2     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/af856d7a51e3ef63619515d4abc4f076bfa74a3a | ORPH
    i586     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/576fa4aecc28350db1751e615204f5e0d0118ca2 | ORPH
    sh4a     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/1d85e6195ece79b8021a2b90f1a2865a5d6c3bf6 | ORPH
  riscv64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/b6af10e0115513e37dbbab5897a8fd3ecb74447a | ORPH
   nios2     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/ff9e7390774f5b61d6160bf731734442714cb037 | ORPH
  mips64el   |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/14e8d5d1fe64b0fc98f6684797c4e3de1650bda7 | ORPH
    i686     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/e816380e161ea30082587b7e73aa3e46a068ce04 | ORPH
    i686     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/256a0ac88fd97a7bf2b513dabfe07307773a3cd3 | ORPH
   arceb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/a1a32eb7a3b29224df4df1a0baff7b2fe327dcb8 | ORPH
powerpc64le  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/6dc9ffe6e38671d2b90d567a458069a34cea7ca6 | ORPH
    sh4a     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/71fd82e9baa116f7c7170c37c81a2d2e04b2a57c | ORPH
   sh4eb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/11ca5e309c6f38c86991597930139e19954d493f | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/ad0968e5b653a2859814a77125e96bcceb76fa76 | ORPH
    sh4a     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/6464df822efb4bca61b113a6178759e0686a3216 | ORPH
  mips64el   |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/7e23b627e39b7c8da7c800fe18729e692e2d938d | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/c25866f36d6c9939cfb3c5a6c9f754859a2fd3e3 | ORPH
microblazeel |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/90f4ae205ac2a1aa35f947f078fd8798271b2cb8 | ORPH
    m68k     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/39f39f5e8d4856895705d72ac0a74ac0a5f12c9e | ORPH
   sparc     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/b84aecce158e4408517a0e128bdc379151a145be | ORPH
powerpc64le  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/46ea6bc4b2c1cafebb5df3842583adced4ed3c09 | ORPH
   armeb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/a05fc6e42e3d633f7195bd3ebe885743182cbdc7 | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/c28f92a2855c949e02c005f4f8d40878a6370218 | ORPH
    i586     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/aa560840a29d4d91364b71ba3b68d6c77e9e4254 | ORPH
   armeb     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/8c337b25bdac9b5d76c1caa6a76b34161c8205a4 |     
   arceb     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/be91589ad4f91899aef9ed9af213c354bf341a94 |     
   s390x     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/683a1a8b2329a62866ea632342ffeea5f8a077b9 |     
    or1k     |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/38b7c1d15d047395dc5d38ab828ce5b25c4fdd83 |     
   mips64    |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/606c5f84adb52e33902437c6846902d9f14b1bcf |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/9169d5d130f8e1e869c7c4b44c33ed760a12be9a | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/65b1021f4f5003fba7050dd49fde363686f8195c | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/fee45bd46779e119819ae4a05a2274e9125336b9 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/ba53c71faa50394d0b74bdc8737d46f43016861b | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/1a9d03f3ad684094048ca8a79433022e188d558d | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/eb563044500651f463d43388262ecc7a1a2534d1 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/2757d8dd590ffb7ea7f706bb3f82dd73f187f107 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/d5f17003efbddcc327feee9230228668a4a893c2 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/07366d0b89e1cab5a99857a1d28422ae70394b00 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/9c83bc6bbe1a2c4433c0d89c20d1cca880a71d45 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/3b92980240ec975d648500c55fc96b1fbab3914e | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/c7705e637b9ccc20e4628d3e85cdf881d05db413 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/1d926a1e444819ef4b8c7332074f8ae1b3ca4b01 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/4394619716d9a7084cadd006d892ef3d077765e2 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/3d216ce8573706601c7b0d72ad5f1d147e9f94e1 | ORPH
  riscv32    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/5ce2ca2987f61be3a27312a373be72efdcf721cb | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/2e5b66ae10dca0895902ccd8c253069f4121bc44 | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/f957fbbc963c4732d0d52db6b2627f3185fb1b48 | ORPH
   mipsel    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/9ace1e7fee0916c1455a45fc94bc30119942643e | ORPH
    sh4a     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/17448a7d48a65cd86ba084a6fa3a9e6e47fdeece | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/44e982eac56f55a5c40e8972c7bbe50f5522adfb | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/651b31dcf9aa394850454116db09b8cbfa36c589 | ORPH
    mips     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/d7141d17621b1201777340d60314425145c95eac | ORPH
powerpc64le  |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/ce4c5ebda6f3d7dc99c59dc9e51f868f9129a87a | ORPH
  mips64el   |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/93842838093b5480851f42ed141ccaf737a3c711 | ORPH
    sh4a     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/45688c4f5b93cac848e5cabf90748878f2222fcb | ORPH
   mipsel    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/30e1fa3abb1a09638cfdceb243dd745ad83ecd16 | ORPH
  mips64el   |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/66a89b35b3525b93fa124a928fc14d84166695fd | ORPH
   mips64    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/1d023cbf757347b4230d794078f36c246af46014 | ORPH
    arm      |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/3c32a757df08975efa9148c01f8b2cafe96cea1f | ORPH
   sh4aeb    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/cc70016e2fe63cc01e63fe8da852ac3e12c7e389 | ORPH
   sh4aeb    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/0598e58134bc2f28bcf9b5991cc73691c70ea518 | ORPH
   mipsel    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/e4b554619fe873a4bdc3a05b8ef3f51b6d4c2900 | ORPH
   sparc     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/8088644fc02bd556056c22ee5412040d7e3110a4 | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/d03322ab1467a0a72da7c9b62051059afec5b0f2 | ORPH
    mips     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/720e210e887555ddd5cc8027c9f8be497fe9b725 | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/e11dce4a116f824aeb24a8e0a3fd61a90f299137 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/343205b019f7d77de91bf90654c29b9aeea16f49 | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/918ed756819a1c61c890632f8adc3605c3284a2e | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/d035be431e5d0cd4cb1215e346776d8ecb5055b0 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/29f037246eb0b24330a8b604ba9a626be63ab283 | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/ba6990afc0fb65e04da825f11489d51374c606d8 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/2c6c09803b7fba8259204bab64924123f5d58e17 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/eea2e0236573aef12cc45e1383f5fecfdcd70da1 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/c1b940da3ded3b1d9715bf03477b8a35ea25c673 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/dea8f1509a31b808aec597fe88551ac620386195 | ORPH
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/ad2f6b693a51b2cc236ff9d23a9b8e8daf678199 |     
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/b520626ea7207ae7e3c097294536ce0272949868 |     
    or1k     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/7f037bd25656fcc19380902062a69ae885881615 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/38c0c872913f5713ac7ebb4a8dc7786d1658f32a |     
 microblaze  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/bfa53d3ccf39552845fb7c0da26f7f11eeba9026 |     
    or1k     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/5dc100079b0f43781917d632589f7c9c778c3c70 |     
   mipsel    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/b6ca927a372ffac4cdaa9794758ade29b3284c09 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/49a195845b2da4706f5d5f9bafe27f23dd23b998 | ORPH
 aarch64_be  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/cee9b4cd66fbbaa32eaf5d66e222b1606410936c | ORPH
    or1k     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/679b0035df51eb5c98c2b0f1ec0a79d342285b8f | ORPH
   s390x     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/79d3dbed3d8e883c02c549b31d8a67359cf0f06f | ORPH
   nios2     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/196d3094a019f089e92a285eb16da9dbf923ad6c | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/6b6d483c5ee6f8880afe4c3ea76e56e01548f007 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/04a51cafdf252710419b271a371a611a2890e2ae | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/480504142131200d96561d585e1d3c0bd7922c41 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9df569c82d6278549d1db251b56ee770322106bd | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4d08d73209177427c863e7e82f479adc4ed898b2 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c74da74391374ffc1f02ca56bdd6f8c8fb4f756d | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5358aa475614ae59187093607efc7283c49a6050 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a44011f0b7942a95c870d72bbba940211f68a434 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a432018fdf3294a9699f6720482f3a1cd74a32f4 | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1bb4766e4a8da2bced72266a74a7f659899ea1d6 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5ca040ea77a51751a7e02b4710df0b3f532b848f | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/97061e6bd47cefb638c7f73a88d9c9fbafed9cb0 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f5d699b3a46bf34a5cb12cd438c1852f434434d5 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/bf6992c1937f7fc7f01fa9ee638304fd1d30f834 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/277c33de29b500695d352bf863d95c9f13fc8794 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/e59431fd7a116a877bc9d7dc75c8ddb3d3758779 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/86454ea98d3f593acff69b8faa6260f4139b94b3 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/f9f8864dbccd2e68ab3fc51a7f802ffb0f187426 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4f423f5cabc0248b5c36a4c3c9312c9ebc8e2eb1 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/6ef3e7f95187b570010995fba0f08af31cfa010a | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/38a48cbf5459e09965fa26e79c63ef54cd56e3e0 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/dc8aed9b175bae6e29658cd4af0ca4ffed571c18 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/f42b10a3d11b63a64cf7e0d371e12e27326deedb | ORPH
    m68k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/6a5365df2522d59c6047d554349871c41bd00db3 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/468e8efc6081c1ca6e039a03c0eeb8a648f3cd0d | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/a3ea4acc5a94892413e4b8c4ed01d7e83b9baaad |     
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/9d51ad38790b15272bb36e816eca7e93ba0f4b0a |     
    arc      |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/da7855ff48c93959ec00696a284ae0a23175498e |     
  riscv64    |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/20aa64a795c1612321cc44727104312af7d0d46b | ORPH
   x86_64    |          sdl2-2.30.6           | NOK | http://autobuild.buildroot.org/results/171e83a34e5682279e66b053c65bd376239798fe |     
   armeb     |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.org/results/ef9000b73482d3a5201a01a8d7b925e3ef87b285 |     
  aarch64    |         sysklogd-2.6.1         | NOK | http://autobuild.buildroot.org/results/272befc639cbc4871ff8a99a64d5744105dad4b3 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.org/results/3fcef01b0e7bf4d3d7d38deb07419a811e180eb4 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/748ecf8e616e3311ef5dcbd84afa01121575bd7d |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.org/results/95be64d08a84b864af8e0e189f034dfd7b9dec91 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/2a6c45adee7779824631499306eea9adcb7b93f2 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.org/results/d19e13177579ac50000878592356e500e5f0bbd3 |     
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/72ba40107c9df21ce9c8e705c1e95f9678b7a50e | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/04568d6ef41eec292c2e852827d2661b9bdf89a4 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/98e7ec0b0bea818170119cbdda3cb2d45206b370 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/a689b63609d75eab10b1c12384902f9e8f6ca963 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/f9bf677b0cdb41314f532bccc7c2c915832bec4e | ORPH
microblazeel |         watchdog-5.16          | NOK | http://autobuild.buildroot.org/results/3a8e01cee9dd00f18cd05bea41c072f6b8b10dbb |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/171242908d52b7c0327ee8ae321b949f6d021ca6 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
               procps-ng-4.0.4 | 2 
                    eza-0.16.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
               host-go-1.21.13 | 1 
host-prelink-cross-a853a5d7... | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.44 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           eza-0.16.0           | NOK | http://autobuild.buildroot.org/results/103ddf90f04dc1fbb41d41d41b441aa065d123b2 |     
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/374a7edf7f321a8d67349970414c3a507e730a45 | ORPH
   mips64    |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/33fcb824986c316cbcccae5294846c61216bcf32 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/1513696dafffd82c8e9bd4c031ff752bbe33b759 | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/23029e69b4fa3ffd8bff48b79e9908b04812b213 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/c84ae3d4899cda585889632d0476a531c2325237 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.org/results/4063e4bd52fa355b3500f48b33e0be9a30d0c2e2 | ORPH
   nios2     |          linux-6.6.44          | NOK | http://autobuild.buildroot.org/results/3797e4e2dd9e960a9342bd816af4c59f8ce96352 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7be25631ddc0a8b73173fce9a7029ecfa6f09e88 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/03a4466adf75df975c68fd2edf6b73f703057382 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.org/results/72a8464a0b81796d374c337bed42da6cb75e7013 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 gnuplot-6.0.0 | 2 
              cache-calibrator | 1 
                  cairo-1.17.4 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
         gobject-introspection | 1 
         host-gcc-final-14.2.0 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
              host-runc-1.1.12 | 1 
          libcamera-apps-1.2.1 | 1 
                  libsepol-3.6 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                  mupdf-1.22.0 | 1 
                 openssh-9.7p1 | 1 
               procps-ng-4.0.4 | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/4a0c00f126e2a69eb57185d310fdf36040fbb571 |     
   mips64    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.org/results/0d7101e60d728502b113eb472c1c76ecfedd3dde |     
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/7e156c5da7163d510c0b78ec917a0aa6138cdb48 | ORPH
    arm      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/50b960764c4a7fe9a7bf0ddd58cf185747d288ea |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.org/results/f3df1fdcc6569860ebfd76cb255bf157228377ff |     
   mipsel    |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.org/results/f2406733bd022008dca426d8d5a9a091891a4ca2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/940d73d645a31aa2512596fb4253de1a8363ce90 |     
powerpc64le  |     host-gcc-final-14.2.0      | NOK | http://autobuild.buildroot.org/results/b1a8485996c6e3d3340d7478f7aa376c843355f0 |     
  mips64el   |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/d212c122ff37375b4eb7616ea8f24fee34b6f0e9 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/5fc11457b69c45193f3a20c3a53ff28a5451b46a | ORPH
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/4dfcd8ac3f7a3b7ec7de5ad6bf6334939354cf93 |     
  riscv32    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/82581115f9aac409dc92777d5f20730b98fdf8fa |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/3f9881643864cccf897df830f6ca66abe88b20b7 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/f2f0d6ef5a3908fc0dcad0233e3c8f79193335b2 |     
   mipsel    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/691cd5b81f85830ef269075544d8b2d3664a5d88 | ORPH
    arm      |          mupdf-1.22.0          | NOK | http://autobuild.buildroot.org/results/0119483f819cb779ebf1ef1d2c9b6ef4e4dd6f17 |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/cc72bc9719b69abe7b63240e66922ef69ee6368d | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b0b954ef8c2c210498346a25a836197db70511b2 | ORPH
   mipsel    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.org/results/2a8bf91bd464083cd50b2f9ad8029c779e2700ad |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 1 
              fluent-bit-3.1.3 | 1 
  gobject-introspection-1.76.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
            host-ccache-4.10.1 | 1 
                 openssh-9.8p1 | 1 
               procps-ng-4.0.4 | 1 
      python-autocommand-2.2.2 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/729a55a14ffaac0c897d06747ff2f6066a81ddaf |     
   s390x     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/6941adb6dce2c0412bfc12bc2af2f30d7b398aa9 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/36cbcbeac4f54d0cb2ee98ef62592a00261ed7ff | ORPH
  mips64el   | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/1f264e60e2f9596f9788f947ac988d040b9ebf94 |     
powerpc64le  |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/67e6d32d88674e0ca73c88bbb3797e304697eb95 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/44723f7c94606d8b8e568e28676cdf1abb29dc1d | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b488b0676cd5121b4f4740f1bd57836aff36a608 | ORPH
   sparc     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/3e6b4dff3d14594c901c4f4b211daf4e2de32816 |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
