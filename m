Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC0EC52D6F
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 03:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987C340286;
	Sun, 25 Aug 2024 03:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0evpnbQBLY1; Sun, 25 Aug 2024 03:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1541B40288
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1541B40288;
	Sun, 25 Aug 2024 03:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 540111BF322
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 03:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 388E14025C
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 03:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siNkyghHiqDh for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 03:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EDF940168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EDF940168
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EDF940168
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 03:17:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-37196786139so1861603f8f.2
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 20:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724555848; x=1725160648;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKcjisxNmdUOnrjnG7nECN/2ym7IVMV4y51mMTUVPMQ=;
 b=ZGv8jG6C5zsGrOxTzK5qN7AkgAYzsMVA2HzHOnUDFOAkxI0XTVX6ZkUnYJNpDa5970
 vTU6+KTDsZHybgq6HqTqiZCMCN9FbfNKpFjJafgQIAIhGEW+eaNthnas7Xkmov3LGdVS
 hr8rLzVtWnB5eGlKrgl9OWcr+40Xldn0ek7ng18Roe+0SEKXlH5pzbxybI9c8wYfN5+N
 7hq9Le6+oR+/DKffXszh0q5ZyxaWYz9JF4OGiI1h7Ve6KGZTNsE+/bJ09aBWMEJetP9h
 RZugQr2xpj53sQnyPpitHnUtPFKKYHNMydR8mBFk96TUTFT1BzddIpocpFPU+A4EA5+y
 hTZA==
X-Gm-Message-State: AOJu0YyP6gYPlzu9f+EM6q4a9ZmR+nslPmL9wQCJColX9Mr98agDiKCx
 xQD9VpeBtejiW+huUumVv+RVMgCJQpc6m0fiaMAxxgyzvwHt/AmoXqINsf8f
X-Google-Smtp-Source: AGHT+IFSWXDZyvI7PfzcQiRfvXVdzDgdQRiV74J4/2GDKjoUy51IuMZK7UzohPtmQ6laJkdZMwgguw==
X-Received: by 2002:a05:6000:d04:b0:368:7564:5a1d with SMTP id
 ffacd0b85a97d-3731187d5cdmr3938105f8f.35.1724555846873; 
 Sat, 24 Aug 2024 20:17:26 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ab87f26c0sm146065595e9.1.2024.08.24.20.17.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 20:17:26 -0700 (PDT)
Message-ID: <66caa246.050a0220.36e51c.85bc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 25 Aug 2024 03:17:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724555848; x=1725160648; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tKcjisxNmdUOnrjnG7nECN/2ym7IVMV4y51mMTUVPMQ=;
 b=RGP5VOgR00zw+YmJBns14VjVdY3lRZ2+8sQPKIJpJjVEhb+HrldunJtXxdPK2nRsKb
 ZN7TK97cp3jqdRUK4kTA+iONUI016vL1Anl1ZOHzj2BoP07ONURWFE9N0gJvXz03kc9j
 5aQEwrCbQ9hkAkA81E+jzFguZOVKN1QF1X0snD0VlurZQqccx9VXM4SmzCz3IjM5uHMn
 vTiD3qIKtePgOZXT8q8BLOhA87BTYGxN1lMgC00wW4d8Tkl1u2yNjbSph+8xmCYrkQ0E
 7OYh0u30onNZAX+FbZiJdIt7ldFLtxX+BjwBOEYAg5ljQNF7lKAoXW8uZNslVet9U3uc
 WFVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RGP5VOgR
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-24
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

Autobuild statistics for 2024-08-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  |  8  |  0  | 19  |
  2024.05.x  |  9  | 15  |  2  | 26  |
    master   | 133 | 284 |  7  | 424 |
     next    | 10  |  9  |  1  | 20  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 13
                  babeld-1.9.2 | 12
                       unknown | 11
               procps-ng-4.0.4 | 10
                    norm-1.5.8 | 7 
         gobject-introspection | 6 
                  linux-6.10.6 | 6 
          obsidian-cursors-1.0 | 6 
                 openssh-9.8p1 | 6 
         host-libxcrypt-4.4.36 | 5 
                   p910nd-0.97 | 5 
android-tools-4.2.2+git2013... | 4 
                 apache-2.4.62 | 4 
                   foot-1.16.2 | 4 
                 gnuplot-6.0.1 | 4 
               pulseaudio-17.0 | 4 
      python-autocommand-2.2.2 | 4 
              bubblewrap-0.9.0 | 3 
           comix-cursors-0.9.1 | 3 
                elfutils-0.189 | 3 
                      fbv-1.0b | 3 
                gerbera-1.12.1 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
        gmrender-resurrect-0.1 | 3 
               graphene-1.10.8 | 3 
             host-delve-1.22.1 | 3 
                  libnss-3.103 | 3 
                   linux-tools | 3 
                    mpir-3.0.0 | 3 
           python-daemon-3.0.1 | 3 
                  ramsmp-3.5.0 | 3 
                   swipl-9.2.6 | 3 
                    bat-0.24.0 | 2 
                cryptopp-8.9.0 | 2 
                    dust-0.9.0 | 2 
                   eza-0.18.22 | 2 
                     fbset-2.1 | 2 
                  ffmpeg-6.1.2 | 2 
              fluent-bit-3.1.3 | 2 
            gdk-pixbuf-2.42.10 | 2 
host-heimdal-f4faaeaba371ff... | 2 
 host-softether-4.30-9700-beta | 2 
               ipmitool-1_8_19 | 2 
                libcuefile-475 | 2 
                  libsepol-3.6 | 2 
                    mpv-0.35.1 | 2 
                  ntp-4.2.8p18 | 2 
                   perl-5.38.2 | 2 
                  quagga-1.2.4 | 2 
                 rtptools-1.22 | 2 
             sofia-sip-1.13.17 | 2 
                  tllist-1.1.0 | 2 
                  acpid-2.0.34 | 1 
                 apitrace-10.0 | 1 
             armadillo-9.900.2 | 1 
                  assimp-5.3.1 | 1 
                  bcusdk-0.0.5 | 1 
                   botan-3.5.0 | 1 
                bpftool-v7.1.0 | 1 
               bpftrace-0.19.1 | 1 
                    bsdiff-4.3 | 1 
              cache-calibrator | 1 
            cairomm1_14-1.14.4 | 1 
                   dillo-3.0.5 | 1 
                 erlang-26.0.2 | 1 
                espflash-3.1.0 | 1 
falcosecurity-libs-e5c53d64... | 1 
                    fcft-3.1.6 | 1 
                      fd-9.0.0 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
                    flac-1.4.3 | 1 
               freeipmi-1.6.14 | 1 
                  giblib-1.2.4 | 1 
          gitlab-runner-15.5.0 | 1 
                 highway-1.2.0 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
           host-cryptopp-8.9.0 | 1 
           host-doxygen-1.8.18 | 1 
          host-elf2flt-2024.05 | 1 
         host-gcc-final-13.3.0 | 1 
     host-moby-buildkit-0.11.6 | 1 
host-riscv-isa-sim-00dfa28c... | 1 
              host-runc-1.1.12 | 1 
              host-rust-1.79.0 | 1 
        host-sentry-cli-2.20.3 | 1 
                   httping-2.5 | 1 
              hyperfine-1.18.0 | 1 
                  iozone-3.506 | 1 
               iproute2-6.10.0 | 1 
                jemalloc-5.3.0 | 1 
                       jose-11 | 1 
                latencytop-0.5 | 1 
             libargtable2-2.13 | 1 
               libdeflate-1.20 | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.76.1 | 1 
             libgphoto2-2.5.27 | 1 
        liblog4c-localtime-1.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                libressl-3.9.2 | 1 
                 libssh-0.10.6 | 1 
            libsvg-cairo-0.1.6 | 1 
             libtorrent-0.13.8 | 1 
                     libuecc-7 | 1 
               libunwind-1.8.1 | 1 
               libvorbis-1.3.7 | 1 
                    links-2.29 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.6.1 | 1 
                lmbench-3.0-a9 | 1 
                   lsuio-0.2.0 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
              luabitop-1.0.2-1 | 1 
                     lxc-5.0.3 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
                  mender-3.4.0 | 1 
                         mimic | 1 
                  msmtp-1.8.25 | 1 
                   nanocom-1.0 | 1 
            netstat-nat-1.4.10 | 1 
                nushell-0.85.0 | 1 
                    ola-0.10.9 | 1 
               openblas-0.3.27 | 1 
                    php-8.3.10 | 1 
                 pixman-0.42.2 | 1 
               popperjs-1.16.0 | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.0.2 | 1 
            quickjs-2024-01-13 | 1 
            resiprocate-1.12.0 | 1 
                 rp-pppoe-3.15 | 1 
          sphinxbase-5prealpha | 1 
squeezelite-71c012ad9ba102f... | 1 
             stress-ng-0.17.07 | 1 
                    szip-2.1.1 | 1 
                tinifier-3.4.0 | 1 
              tinyssh-20240101 | 1 
                tpm2-tss-3.2.2 | 1 
                   trinity-1.9 | 1 
                    uftp-5.0.3 | 1 
             util-linux-2.39.3 | 1 
               valgrind-3.23.0 | 1 
  wireguard-tools-1.0.20210914 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/19152c6cff0161947b57f0e2afbb56dc8daf85ad | ORPH
   armeb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/e88cca2885e0bd2716938416d045445f196e1cb6 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/c1e85380d10ddf266fe84d3282dc9ca048e1a580 |     
   xtensa    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/8b0ddd63c58c3933fe0f1f3ce4a58e77ac43aaf1 |     
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/105d25a5c355ca52163428bd89a16a07fa0fe829 |     
  powerpc    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/8bcd85d7c0c9b1f6116acc955b00f81d82b1f63d |     
   nios2     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/d1bd4ef22451f5c8cac8cbc7317128c9d14feeaa |     
  powerpc    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/8e2d9fcdd790f70aecb5a7cfdaa68a85ec72f9f9 |     
   mips64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/70d952aa314011644b448ad2156d0a1471543fcd |     
 microblaze  |         apitrace-10.0          | NOK | http://autobuild.buildroot.org/results/32d5c4f591c3bd77ceb46f8b3cdce5eb98e7fd55 |     
powerpc64le  |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/d4e9e7b453960a4f62a199344b30b729a4f235bc |     
    mips     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.org/results/61736c7f3867b662dc45f5afcdb29d9793ab6018 | ORPH
powerpc64le  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/dd4d115ffd5ea7ddad821fc712ad1a82174cdef6 | ORPH
  powerpc    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/445c073de3bfa230c4763cca2937fc110d11e763 | ORPH
  powerpc    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/9a0e616000b1bcced8d442e409e2634c88a1e641 | ORPH
   mips64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/c50962527139fbd40f3c19f434f62a81dd06ca8a | ORPH
   mips64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/bd1d2f74e615c9990577b9f0880ceffa0e345b76 | ORPH
    arc      |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9 | ORPH
 microblaze  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/f6546be9a01b435ca0d5805956f28bace529a03b | ORPH
powerpc64le  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/659f05f75493b5f51d7371971bc8e24bfb517d36 | ORPH
    m68k     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/4aa1ae063e3b6ab1bea928b8675f80721ffce00f | ORPH
    or1k     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/d8fcc68dbca6b04f275fa7370a35a68e652212e1 | ORPH
  sparc64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/a75a2fee8a03fbfc917d542e050c46a6a6d428e6 | ORPH
 microblaze  |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/84c62571abcbe0e0cb0da6009191e8e4497a77b6 | ORPH
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.org/results/bbd3403065d327bb2c6131797b00359d8e50f0bc |     
  sparc64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.org/results/d83d2e80cdc2c625591619a47dbbe2977798e605 |     
  powerpc    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/607fce8e2b5ecfca448b16f9d7015bf717fbe194 |     
   armeb     |          botan-3.5.0           | NOK | http://autobuild.buildroot.org/results/849ad069c74c4012b0ffc9d9993e415caba81964 | ORPH
  aarch64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.org/results/c9081cf31ef2b5b81ab2f7445e83de0076f5ef37 |     
  aarch64    |        bpftrace-0.19.1         | NOK | http://autobuild.buildroot.org/results/df59e038de47f63d14e1be7bd12dd16a69636f79 |     
   sparc     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/cd7642c71d105a6d00e8a10f4b795551c9d5e74c | ORPH
    arc      |        bubblewrap-0.9.0        | NOK | http://autobuild.buildroot.org/results/160808804085accd78b2d48bddd141a8316a5933 |     
    arc      |        bubblewrap-0.9.0        | NOK | http://autobuild.buildroot.org/results/40b4a7dbb4ceff63faeabf3f2d465f335d0f1a22 |     
microblazeel |        bubblewrap-0.9.0        | NOK | http://autobuild.buildroot.org/results/d122fbfd84b4085e1aefe63cf9f9a492ae2d6e1c |     
  sparc64    |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/abdee99ecd31b503f31c874163ffd910e51d651b |     
 microblaze  |       cairomm1_14-1.14.4       | NOK | http://autobuild.buildroot.org/results/7ffe60014e7da377c2c160df4b6361f94af74447 |     
microblazeel |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/9f126c8ab00f5ab1fc94ad424a9d12448e9205a9 | ORPH
   sparc     |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/017dc2936b14b3484e5bafd1af61d9593743d586 | ORPH
  riscv64    |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/734917ff9f613f07e6995c1f333eab1ee8bc5760 | ORPH
    i686     |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.org/results/d402e630c7b2854f4750b15354cedba5e81fbb84 |     
   nios2     |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.org/results/f3b1ccf4756edffc4c544ca170cf5e7f7e5c12d6 |     
    arc      |          dillo-3.0.5           | NOK | http://autobuild.buildroot.org/results/b37a84f8d5a169cae7e2a0078eddc4df2e424b80 | ORPH
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.org/results/febfa72e40f3870d61819218f085b30250b52ae4 | ORPH
    i686     |           dust-0.9.0           | NOK | http://autobuild.buildroot.org/results/2089447a33bd7fa27577c51f86a97c8b6dfe8d4d | ORPH
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/1993d5470e8f4b66bd2b24c5307f52b560b5b101 | ORPH
  powerpc    |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/9d41eca645c3f71ec4473a994e7381996581b40e | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/fc9e4b2625ab384a1d6e143a1a9d2d106d751053 | ORPH
    i686     |         erlang-26.0.2          | NOK | http://autobuild.buildroot.org/results/416fe47151380ac9cbfcea38204bac644724b050 |     
powerpc64le  |         espflash-3.1.0         | NOK | http://autobuild.buildroot.org/results/bd93613f2741ca4f35eedafd65309b3a853a2f08 |     
   x86_64    |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/563c448d7c39f675438af6b9e5f25d384e5ae1cd |     
   s390x     |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/4e03678bb55ff66df9621a755ff81fe07292055b |     
 aarch64_be  | falcosecurity-libs-e5c53d64... | NOK | http://autobuild.buildroot.org/results/f28bbc4caed5c5b8d32e46119b05b212663444b7 |     
  mips64el   |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/83a54301e1fbc37f097282779d19c83d7a7e1314 | ORPH
   mipsel    |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/15e908809fa4ade4e4e7f0e0bd8666b661e00657 | ORPH
 microblaze  |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/cdb2846af0fe1242c0ef709e9c166c24ef462e71 | ORPH
    sh4a     |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/f750266cf0bd58b5b902f00959b1372e63ad0573 | ORPH
   x86_64    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/c513267adfcc2823b800731e9e13f9e315dcc04c | ORPH
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/e51aaaeef495120bfde6ef6a3d252c917a0dbfbe |     
   armeb     |            fd-9.0.0            | NOK | http://autobuild.buildroot.org/results/3b3460e235160dbfe1a6b6343db3171e651e650f |     
    i686     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/e16b0bb39b27eaa2e8571dd41e67f85470bd714f |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/ecbecf2560ca0d44daaf913925482a0cdabc108e |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.org/results/5e7ece4bfd93462dbe59c629c8d605d059a4e67f | ORPH
   armeb     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/f5b2e737b65ce885ff3f63b1bb43129be2b141cd | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.org/results/3440a5d647aee857f16d0de9f8df149342159801 |     
    m68k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/8d40ab2a1bd55888145af2cc0a38f9ae749103f2 |     
   sh4aeb    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/fb435c3ecb39fbdea1e97da435f4e242326b88c8 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/e74733f116307053a462b8b5503f7b50116e6115 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/c8fe130129bb4088fa3f1484a5f0765576a639f7 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/98c584eee7096473a0107738e4a181940f208db3 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/3288ca9d7745ee51ad0888a48dc362ff11bc4cf1 |     
 powerpc64   |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.org/results/0f5b83984293bf2bd883978dba0fe97fd743f62f |     
   s390x     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/a33f3e798beeec8f6a079f94522739c45efdac2b | ORPH
  aarch64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/12ab8bfcfe994dec89b9cc4616f68db5ca337b17 | ORPH
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/3041e1c1509d3bc57c2f86da098281815f989e25 |     
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/f3f7f40d4f2ff9924b2a617d303fb78fb9492441 |     
   sparc     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/d522d05c6643b7836a0628dfbd9e5fdc684c6371 |     
   mips64    |          giblib-1.2.4          | NOK | http://autobuild.buildroot.org/results/e68d961c7a092ec173d1bd94bd585d94aa72cdeb |     
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.org/results/362f6b534cec7788bf65e707aaad8d0f29205f84 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/1ebb96e744c1f1ed507f1e368bcb27f45248dfb7 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/3051a3e9e9633f854df7db697a68c4e90d429c9d |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/2fd4a391ce70dcd661e79ff588fcb5c75298dc22 |     
   mipsel    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.org/results/e63f186d294cb720d87f1d81925cc3d8b58e86a4 |     
 aarch64_be  |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.org/results/be7728b5b1885170d3bbae98619a0d6fd3a700d2 |     
  sparc64    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.org/results/e2f4580b8a6067b26e67ea1bb973a95a8b1425e3 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/9a568b5c9c91fc5784fc0d30d0eb70ba5f87dac3 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/c65584f4b3083fa0aeeedbc2b3772096d41b137f |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/4413aef187e34881094e37a70e8c5aa8cb043a1f |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/689c1742a8fb56c0bf8e76faec5e6eaeca9447c4 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/65cb435ec65ff488eed77a0cefbe51dc5bff7eb8 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/a36bd755614d424a4594c54fb9776a001cfbe3ad |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/13a36d8f054d13beff19ff72714fd82a6059d7ca |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/f12236d5b1d423df697aa762bc4f01d1e86019e4 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/e9f24ef063ed49c6b4544f3b40081fb925c65761 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/954513cc08e8e3002f5a2027fb1e9c3a43acb820 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/ce328c22acfa2fb369706f28b55c4be79c79db4e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/4a811db201016775c8df4c15323474fa8f6ecfee | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/4c105c216f6afc0c04da5c70b17e43af90322e91 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/4e685b74c81576c3fdb9f085af86e95c74109603 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/be8b3790682b22c639c23398393084601c88a8d2 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/f2a8c7c443a5f974d6c0ade2317bc2db10717e4a | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/67943f0328701c3b00d78e35af17900ead900c5f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/7c3b7aeb64a65c88efeb69aadc5b20df404e8b6a | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b43a698088c78bc2f0565ef4a7df2fee798998e7 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/369c20d762f70a3514ac304c35d005d6245cd9fc | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/1d1dbcbda129acaf348d36a36cceb4b78580fb78 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/78df85e8c7902be0e65a8cd93e792214e5a1e0a4 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/e3cf6e455906f897dee889d0286dcbb312b2d4c4 | ORPH
    arm      |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/540d732067f584d82a65a1df0729ce5aa5ff4cf7 |     
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/963c3c9e64066ebc895a2bc5302fc48853da7e43 |     
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/e0554b4bf74958291f7f022523c57bbf3e60f8dc |     
  aarch64    |         highway-1.2.0          | NOK | http://autobuild.buildroot.org/results/e2a051835ad5bfeb7bee320de06cc4a43067e943 |     
 aarch64_be  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/cf2af366ca73ba873c25c8a6ab7b9dd1e1357492 |     
    sh4      | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/ae6d331d6ddddf1b502a149d99448987f0aac5d5 |     
    arm      |      host-cryptopp-8.9.0       | NOK | http://autobuild.buildroot.org/results/fb2d7b77d37b64c17e0beca0809d5239b7a5da12 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/aadc045047da38745ebf0f92c667c4c01a7bbb34 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/2d73593d291501ba33fef9b60ee511e8da55f752 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/86a50055e3eb74c8977d826286c915cb33e6a120 |     
 microblaze  |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/084ad808438f24c0724dac173fe768ca906a4fdb | ORPH
  riscv64    |      host-elf2flt-2024.05      | NOK | http://autobuild.buildroot.org/results/44afcf05ffb3c43b3666d24709bae6953bcf6076 | ORPH
   arceb     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.org/results/4ddf5c3c2f62b7da654ae4d41e5f29d037a3c1df |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/c44b82ed25539ee625036b77add48abe7fe530ff | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/17706459ccce4e670a3448845eeb9b67be01e10e | ORPH
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/3a0e264f07282f957e2bd04ab9d9a287d553c2cf |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/d293d9ddf1d06c66d5577c54ccc754a41d827f1d |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/6c48759e9aa99e88742807f39c95851083b02c4e |     
    arc      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/d46198072cae26b064a57cc3f174f695e5dfbb19 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/e7aad9765cf5db1bcd076eb51f0c664ce69fe577 |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/a0a07a0f2f1b3dfccd52c6926d5e7320b2a99d5c |     
 aarch64_be  | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/c31208910304465c298fad54d55dee8142559bba |     
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/aab0e2a5a38ae10119492cb4e79e84df07d38930 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/41fcd14f8cc698dbba40a29f487b42e27961aa15 |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.org/results/1c9cc105901f99fca0e5ba044c5131f09964ecb7 |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/51746b33e3e648d3c82b757c82979245c1f2e9ad | ORPH
   arceb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/3c8e8bfce1df7861ea374225f56c1c912dbb1bca | ORPH
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/29558a40a462953a79bf720429c38374142f05bb |     
   x86_64    |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.org/results/f5f5dfeff92cb336c57acac2c8b4d6454dee6e7a | ORPH
   xtensa    |          iozone-3.506          | NOK | http://autobuild.buildroot.org/results/91b5a3239971e0d80df5159d0cc0732cdda5b2ea |     
    i686     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/182b5cccd744d9e1741fa6c045e4f06b17198809 |     
microblazeel |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/b50968c593aeb211ad62a123176ee0311660ff75 |     
   xtensa    |        iproute2-6.10.0         | NOK | http://autobuild.buildroot.org/results/6b8f550a0f833a6490138559928fc0bae4a30c24 |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.org/results/a354495c05a59d80dabae5061984245b0060357d |     
microblazeel |            jose-11             | NOK | http://autobuild.buildroot.org/results/4eed0db1a0eed7d685169848313916d78a647a61 |     
 aarch64_be  |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/24f3cd450d5f97e25c7b7cf6a5e5b49a33b2addd | ORPH
    i686     |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/a9b48de473dc6b9a54023a45f6d4d0556aa87d97 | ORPH
 aarch64_be  |         libcuefile-475         | NOK | http://autobuild.buildroot.org/results/78d585aadc36f77b7ddf46770fba398ed536ea3e | ORPH
    i686     |         libcuefile-475         | NOK | http://autobuild.buildroot.org/results/287f775d63e46b2849b0f3c44c900cdb9ce37db3 | ORPH
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.org/results/4f93177b67132073868dac13d77e6facad108ad3 |     
   mips64    |         libgee-0.20.6          | NOK | http://autobuild.buildroot.org/results/7d4c568aaa1feb508b20b8da821b4d798d92ee73 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/e95cdd38539dd93972aa4c44c1cbcd49fad6f4ae |     
   xtensa    |       libgphoto2-2.5.27        | NOK | http://autobuild.buildroot.org/results/86387c3df5c69e0d05ef380d7b627f0ec4ac8ba3 | ORPH
   arceb     |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.org/results/54bdfdaa722e7a414ba808ca80634dfd053bd186 |     
    arm      |          libnss-3.103          | NOK | http://autobuild.buildroot.org/results/1fc8351d30d7f47bcb85d7713b64c7ad281ec938 |     
  aarch64    |          libnss-3.103          | NOK | http://autobuild.buildroot.org/results/19159f54881c8e02aa740ce0bd2c71c950723980 |     
  powerpc    |          libnss-3.103          | NOK | http://autobuild.buildroot.org/results/3bcae177bfc2fb93032ee6e9a79e5b93e0682186 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.org/results/cb5dbe31191b314684b192660b839a89cfa7910f |     
    arm      |         libressl-3.9.2         | NOK | http://autobuild.buildroot.org/results/70fafc17420e73853bf039ef962999d8f19e9e81 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/367d91dda3ea664b258bb13a792d5f825ffd9ef3 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/fc729299a1cfbda4d0e5f7fd4ea930c32c96415f |     
   nios2     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.org/results/9f9186ac1434c94db949299e7086591aa8f17347 | ORPH
   s390x     |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.org/results/2fe069b2dcc622ed5e115bc633886c606a9ec778 |     
    i686     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.org/results/b4311d967b337c5c224c07afc85e6882d7e4d50b | ORPH
  mips64el   |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/b28c4a4fe356955d825f921077db622cf1a8a987 |     
  aarch64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.org/results/98dd3c556c2b4b8bae68029c9bb0782079b8dfc3 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.org/results/30e51743d7d626ccb86a25a36426f039594ed943 |     
    sh4      |           links-2.29           | NOK | http://autobuild.buildroot.org/results/9ff63ce4141ef0813d2df0aaddada4db500cda7f | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/db8a24865da86a96ff100256da963e3e7a7ee149 | ORPH
   mips64    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/47b2b8a7c064c387497ff15e4cab73c2c75501e6 | ORPH
  powerpc    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/47b510329f3cf3de1f73b27f0ce27eb3b5943f2f | ORPH
   nios2     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/89931d8e25dfb958ded45f3ac3e7cd5876ea7c82 | ORPH
   armeb     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/bae7da4c9ecf09eb0161bb1c773fd8fa244ea217 | ORPH
   mips64    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/6347d05e0e14d31cded18a2bc59b73e9b90b3c64 | ORPH
    sh4a     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/1b67f30226a0eb12e8c10e024df0a510b7766cee | ORPH
    sh4      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/98f9bec6bd08fa66ce2d9d1c2ee2b2676b3924a3 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/a6c1bf5b15b9e9df63649789408da13864504bc1 | ORPH
microblazeel |          linux-tools           | NOK | http://autobuild.buildroot.org/results/6d4bd9698904372fc68516317af5244227ca1ec7 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.org/results/23708c09ce4d6feb8bea4e2be65a81c4d28df116 | ORPH
    arm      |          linux-tools           | NOK | http://autobuild.buildroot.org/results/c9e8c1abd8e07732bbd844ed2b2b8307d20d6f12 | ORPH
   sparc     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.org/results/f1518986ecfa9c6aecabc4f855b6c80e6462af54 | ORPH
   nios2     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/2c58cc63915153d0eedd47d7c2b3242ed2e72f34 | ORPH
  powerpc    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/f3229bea19957ea660aa86cbaf1b818fdc17b8ad | ORPH
  powerpc    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.org/results/4e07313d6adfc7016bd6f55eee308a8027dc6b7a |     
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.org/results/8a1fc7d04c50db832700068ac3a1d88094f4c466 |     
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/6ea4480e3051ace538db1242c5c9379891754935 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/1dea9c2570268137218c289fd9c5f4a23e698564 |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/ee7e2ddf5303edd1fca83f3175b1fcef9350887a |     
  riscv64    |             mimic              | TIM | http://autobuild.buildroot.org/results/48362534b35cb2f7c7320ac015351d3fcb4071d3 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/3f58faf65cec002bb893dbd0be6c3c322fb4ce68 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/8a528d0eef7b500b1b1a0b9c61d54f360ae922e9 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/804f23e5cd553151b3859e3185069b64ea695538 |     
    or1k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/c55ad74104a480848116c54266db77799f0b24b1 |     
   mips64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/3c21f32619fad7fead38f7d6a2fa79dfe86b7a0e |     
   mips64    |          msmtp-1.8.25          | NOK | http://autobuild.buildroot.org/results/6a49db545a42a3755e7d3dc4719b0b6059b6b21a |     
   mips64    |          nanocom-1.0           | NOK | http://autobuild.buildroot.org/results/f7d9095f84269d70169d052a620fffa5c4f9a264 |     
    m68k     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/a4f01b6bbc8a13ab557a688b0ff5fa709c3360fb | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/fea318b80b28de53ec82b7c9950ed8ed0434656b | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/28fb161f994e207fe93e8f9f25927b28a1312f2b | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/c4d714d79b7118b3571134b485ef4ac7d5c2fdac | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/9dc30865d3bf9a4f6a7fa1c9aa031cd1064d2378 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/0b426b13cd810e679b5b673c0a0a154ed4281a10 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/1aab6275c925412de513fe90e9bd28246a7ca9b3 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/b17deeeb341b24af0971e6b3a461c1c74589acee | ORPH
    or1k     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/0a71c22f1552691dc22314ceb9bc59954f11f8d1 |     
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/f1415635fdfd2ae55a6c21a34fc1be48c037275d |     
powerpc64le  |         nushell-0.85.0         | NOK | http://autobuild.buildroot.org/results/8d389297d934c12e87bcf19b0a56177075d5dda7 | ORPH
   xtensa    |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/cbfb282702aaefa0f427eaaa7283db821ef4bdfd | ORPH
  riscv64    |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/5d0fa5acd41678838b1460df2b49c91791984b41 | ORPH
   s390x     |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/21cf674ac9bc7d769a1d73d40eda01d562930d00 | ORPH
    arc      |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/6abd7492e1ad56ac074d81eabad9220534201117 | ORPH
   xtensa    |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/6f0e66d0240c93a67f04dffe2affb8417747090f | ORPH
   arceb     |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/661a4d956be27ed1ab75c7fa68745920e3063cd8 | ORPH
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.org/results/26a74137c650c28c510fca631c727972edc2b792 |     
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/df3ca7f57bedcdf3400e0770aa231ead9f95359e |     
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/9a4f3c34f3b31a3e78524500095592da11d8b32c | ORPH
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/0515ff6fcdb8237d6cd20827917509760017314f | ORPH
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/2f5ab524a5a8a9ec8bb8c731610220a42332bbff | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/07838c5422a01f47a4712d82d103f61ede07a6bf | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/9f7fcc5728362ecae2ccc3086bf1f0eebabc7493 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/4ec2e3e87f9d3a088344e2286d5616671a889849 | ORPH
   mipsel    |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/9583e2e423f7b006392e6f3645a799b8444bc8c5 | ORPH
 powerpc64   |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/8d8004cbbb0e5d282c3f7216223aee5dbdccceda | ORPH
   sh4eb     |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/59884d3238b5775cdb061e3bf167760954914fc8 | ORPH
   sparc     |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/ca7bd03f9f3ce2f0e67bce9b997ef3e8de462411 | ORPH
    or1k     |          p910nd-0.97           | NOK | http://autobuild.buildroot.org/results/376fe430292ff6c9e5a6065c860f744bc165e59f | ORPH
   s390x     |          perl-5.38.2           | NOK | http://autobuild.buildroot.org/results/f6cbd22c6dbfd9c75d3dfc6a7a35433b94d19547 |     
    mips     |          perl-5.38.2           | NOK | http://autobuild.buildroot.org/results/126d063d8e92a42ff7ddde0b121e7f7f2c1910fc |     
   armeb     |           php-8.3.10           | NOK | http://autobuild.buildroot.org/results/5e8ef91d84018ccdf85f2156292feb3460bfe698 |     
  aarch64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/945ac35978ae894f1dfb8f3dee2f4dfbdc65687e | ORPH
    or1k     |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/ab1632bb3fd3b642571d48388316257469d8a316 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0b40c8d5d9ef4d95b46da5dbeda1f25d49c90231 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1e83b8be332d1eb0b23cda5bd304463885c3a89d | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/32d6cc120dc35c6f81a816129a3cd3c6724360af | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/942170661139db956d9d5bc55418b9588a7eb4a9 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ce979a0a90c787789eccfaaacd3a7dd7135c05ed | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5251c3e18ed13493c3066239122bef249b1caf80 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/36cfeac6bddfe8ef421a95341de4d1041153675c | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c69e8f68777f65ebc5ac56d9d14a4c8026f4fec9 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a37f691bdef21a8f1c3d7fce25a228a724a515c9 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1635532eec985e82afaae7697fcfbc961289e1e6 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/90b83ffd1b47b09e4ad9f5534c8e94ea30c6095b | ORPH
    mips     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/c6154c54c43e1f8db8c587e5289131009698fd14 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/72ae7ad7452c07f8e4add3ddc0d0b123d46c1d1c | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/c32f1418a8a8fe49ba426f597b6f6cfcb41245da | ORPH
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/7dfbcccc9658f457d77e7a07d8de2427ebe0913c |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/12e3d06ee9e02f743ebf5182497aab14e7a9a190 |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/a369ad070e4a75cb77e08d3a724f0bc8560366cb |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/d60e40f5516b3704dde15aa8db06caedfe90eb6a |     
 powerpc64   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/69fa4174904507c37dfb74af6ed7c049a3b6f052 |     
    i686     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/55bc0c4e8cef60774060a1d1f980da82065960fb |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/ca04f726a770df03aedc43ff7cb2778e5318e0e9 |     
 microblaze  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/a41bae17a6b998415f80377b1adaedfcc630175d |     
   mipsel    |           qemu-9.0.2           | NOK | http://autobuild.buildroot.org/results/6354006cbc2759725cb3872896d10d86f3cf9c67 |     
 aarch64_be  |          quagga-1.2.4          | NOK | http://autobuild.buildroot.org/results/43c422fbe98419ad74990156fb64c7620261473e | ORPH
    arm      |          quagga-1.2.4          | NOK | http://autobuild.buildroot.org/results/e0a7d873e2b116fec1ad6888f9e0ababc9cfcdde | ORPH
   mips64    |       quickjs-2024-01-13       | NOK | http://autobuild.buildroot.org/results/990e34d8b09e88e99e52908d6d1c287b80c7c4d9 |     
   sparc     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/2bcba5377c2f209eaa98445afc29dca7923ea2d5 |     
    sh4a     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/4a726a4e1bbc350a4541e01f1a089574f741f88e |     
    mips     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/77e2fbe08b184f557cf3839b46a6d78f2fb106dc |     
 microblaze  |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.org/results/7edff1871031f071326449a52ed163a5a9281318 | ORPH
   s390x     |         rp-pppoe-3.15          | NOK | http://autobuild.buildroot.org/results/6fd1ff5ed1a4bf03ed1416faa8bbbe43c043fc7f | ORPH
  riscv32    |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/07d75cd9f302be41943820fbe26fb942016b23dc | ORPH
  riscv32    |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/75459e015b4129a82dece4f690b32abff4e8dd4a | ORPH
   arceb     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/9fd671f97667489cbdc51c977e6b644afa324709 |     
   xtensa    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/de08bd5c68f5fcdaa5c0374a4f5051c4751ebb88 |     
microblazeel |      sphinxbase-5prealpha      | NOK | http://autobuild.buildroot.org/results/3b935916822e098f20d836040ca0711885568ceb |     
 powerpc64   | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.org/results/8457e0cee78975a2424114160f048cc97c65e5d5 |     
   sh4aeb    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.org/results/5d658675714296b6443f50444cfbf5b023d64a52 |     
    mips     |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/6305b3a7cf2590d7f3ab1fe04fbdf4c12e61cca7 |     
    m68k     |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/ec6465019bd532e76cf1d58505f143f3d75c6aa1 |     
   mipsel    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/b1b6fa7408d19306c30b5bcf1bbc2490ebcb89ff |     
   armeb     |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/515c5b1e84e5e9b5c9ceacefdc052d6fad30450e |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.org/results/07739a281b7d453bc674b5f4b199a9a67a8297d1 |     
    arc      |        tinyssh-20240101        | NOK | http://autobuild.buildroot.org/results/c61f71bd60f9140b56349d356cfec62c4fd0332e |     
  mips64el   |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/be27ce9258f07232a81c2cbe10a260aca6102122 |     
  aarch64    |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/fe5b2933ab1e3dc75b2ca4309acd3d3ff1951fb2 |     
   nios2     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.org/results/27342386c75f42168970bde61ff60cd7d8e55ddb | ORPH
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/ae919fe5d02543b84b85a7148278ad865007ce35 | ORPH
    i586     |           uftp-5.0.3           | NOK | http://autobuild.buildroot.org/results/7d9e3a8ad7bdc7e0aac283cc67e1d3872dd23736 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.org/results/b43c795f2c7bf20242c4ee23826c89426d3b6f91 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.org/results/f6f51bcaa1259003a2ff6202f9d18f3b6fa73f08 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.org/results/d2167f2ef5277b1efec46a3a4d6108eef65b0e25 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.org/results/b462a8b1a2fbe335a61e0fd4d2df037660d06b10 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.org/results/5518d08d48c0cbb1b16de88962080548a8ea6eb1 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/b9c70ad6fe09956646d064b09fb211f28f03ccbf |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.org/results/7c7dc3fb55931506d8f50fb15e871bc34c3b4035 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/de8cc0237feb41420a525a21d17ac5b260ba775c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/fe326c4ff4c08d2496544c7e6b0995bd953562d5 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.org/results/4bdcb2510581f33b45a04793acf85b879480a322 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/5811fffe79d3d9a902c718f4ae9590c87a258f04 |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.org/results/eb4f91e8a1003376fc7e409794ad353a6e5161e1 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/29fa7fb7f12933169d29e84515c18efa3566e18d | ORPH
microblazeel |  wireguard-tools-1.0.20210914  | NOK | http://autobuild.buildroot.org/results/e7f824e94ac86fababedb2e1ce4f3e6857302157 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                elfutils-0.189 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          imagemagick-7.1.1-31 | 1 
                libmad-0.15.1b | 1 
                  linux-6.6.37 | 1 
        python-contourpy-1.1.0 | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/9f5b7c1a31f68bf30ee13e4fb2c0330c3e589a10 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/7403492e9a603cd9e215c32e4d3b42cf92609478 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/f9a51a6d6a72d639646dbc70864171f12926adc0 | ORPH
    sh4      |      imagemagick-7.1.1-31      | NOK | http://autobuild.buildroot.org/results/faef9965ff83e07437a05c993025dfd599cc5830 | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.org/results/bf9e472bc111c7c78d33042d49f0c44c8a34942a | ORPH
 aarch64_be  |          linux-6.6.37          | NOK | http://autobuild.buildroot.org/results/b49e09fb31387b6f3f2ea0958dfd7f5e6ad9e4d7 | ORPH
    arm      |     python-contourpy-1.1.0     | NOK | http://autobuild.buildroot.org/results/1a76fb2188f3c92b6726c5a97be863c9469b6c84 |     
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.org/results/151bce7f3336cdded412c21b1e39f14438072bfa |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

         gobject-introspection | 2 
                apr-util-1.6.3 | 1 
                directfb-1.7.7 | 1 
                   duma-2.5.21 | 1 
                elfutils-0.189 | 1 
                    eza-0.18.8 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
host-heimdal-f4faaeaba371ff... | 1 
host-prelink-cross-a853a5d7... | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                  iozone-3.506 | 1 
          libcamera-apps-1.2.1 | 1 
                 libp11-0.4.12 | 1 
                  ntp-4.2.8p18 | 1 
            quickjs-2024-01-13 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.org/results/f2564cc024c143924c80b860bd901dc4d8746812 |     
    arc      |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/e293a4bfbee38f980b2f8a2d3f16fce58b128196 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/92ce1a25d1e063c1bc4382fdb51e1c88f9d81ac7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/03319f79a8770b17767beea91dac1b5a0575712b | ORPH
   x86_64    |           eza-0.18.8           | NOK | http://autobuild.buildroot.org/results/8eb478ddeb6da889d32f0fc4731aa36b97f5d2ab |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/fa4e4819408751bef49c20dab72c71e21715d095 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/ee3181411b1b3491bf4492716b9eb6996df2d643 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/6be71b5b9484fe3dd119fc3ed7075391f1ee8b61 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/fbea195a82bf87e1195b73d2a04cbddec988d1c1 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/f5eadc1bd5f2497bee6aa7e92f9d2c129cedb30e | ORPH
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/a308243ffc4b11eb3c88226990175ba9f30729ed |     
   nios2     |          iozone-3.506          | NOK | http://autobuild.buildroot.org/results/9ace949d295887060980f084a69fe2552a96a89d |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/57ff8d184d57c6ba8bfd014f7c284c4e540c2c52 |     
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.org/results/da7115822322b220c97325e224a49790e5f79b05 | ORPH
    arm      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/763fd2aadc03ad42e33474ef4ca4a75ec00604bc |     
   mips64    |       quickjs-2024-01-13       | NOK | http://autobuild.buildroot.org/results/8a958a191b34918b14648250827fa885f5071b4e |     
    mips     |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.org/results/07cfb0d428db193f8b37a0a07ded1e7a06858084 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 2 
                     avahi-0.8 | 1 
                  cairo-1.18.0 | 1 
         gobject-introspection | 1 
             libblockdev-3.1.1 | 1 
                 libssh-0.11.0 | 1 
                  linux-6.10.3 | 1 
                    mpv-0.35.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/41c5399cdd8e70033232c9be100c450bb6626748 | ORPH
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/7e945bdec2ff6ad509291809160ca57cec5c7655 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/f4503b79e82e6ac112c02258fcccce2bdbdcdd8c |     
  mips64el   |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.org/results/6d8ef043079a4c91fa4848c6e9ec3768df7c3319 |     
    sh4      |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/fd5596d82f659b68d5bc5f59b5f82f61bbf04900 | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/6ad9c2c5e443d3d50957ba6c346d7abfa8c492d3 | ORPH
   x86_64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/166a8c1c4985fc37d3357132e7c3b908327be2b6 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/ca74e9fc1aeaa12cfc641aeced39d1cec1338b17 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.org/results/2c4b8264a1f7ba1744deb79b7358b6564e6b4069 |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/159cc9942585e119e30e2915571720a6feb9f8a4 |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
