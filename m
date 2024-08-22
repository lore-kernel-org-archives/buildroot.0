Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45289C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 03:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 774D760A99;
	Thu, 22 Aug 2024 03:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hn2Gt7MimbCW; Thu, 22 Aug 2024 03:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D076062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D076062F;
	Thu, 22 Aug 2024 03:17:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B51B31BF393
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 03:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94D7740296
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 03:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id El-nJsmKIA62 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 03:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92B0540185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B0540185
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92B0540185
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 03:17:50 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a8666734767so43954066b.1
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 20:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724296668; x=1724901468;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HZg4g3OgxXPaT4kw1wcUIeocE8+IZ4s7yTBqZvZmg20=;
 b=BADzTf5hWVQ57pS14RirQwFF0XRN4ACH2cbH7d8r0sxXhpEENuZdqmtXtv/Of7iWXP
 AlYP2jSTDV4mOw0K79PRdutOdotPr957yTX089+rvG3qogaerQLA2HyrOVpL+2uQNsJN
 1at6BzP21uL5gRIdSVA5Qyk0GGCJf4EVluCk/fmv4vYAe8opxeV0TP1EZs3zmBobKkn9
 eReNZSrL/dz/oQmRxEjRRI0YCdBIZdLcoJdJjQFz9I2nCmI36ZElNzxDR2+ihqWmLb4M
 UUtA6/5cKGojdl1uCZGIm67qkchJ9l/EgKPAstnoKV+9rkMubbsgVNTgiwsu6St/tzp+
 UaWA==
X-Gm-Message-State: AOJu0Ywv0lUFtFkZPMehdWsovijnyn/hC3JLTfYnKtej2BzR/zYYa3tr
 8IX5fd23NB76UhiaJyKPCGP63BYhspRb7TqUXT8H05eM17pDSS3RrmPIoT7byy8=
X-Google-Smtp-Source: AGHT+IG+8SFmhRYc5bAMrLr6LiTYhgCBvcDYNeqQR1WPKLSNbnVfJSKaXbOqxHd/ZATtU43kzBvgdg==
X-Received: by 2002:a17:907:1c2a:b0:a86:6fc6:f1fc with SMTP id
 a640c23a62f3a-a866fc6fbc8mr313712866b.53.1724296667434; 
 Wed, 21 Aug 2024 20:17:47 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f436607sm46653566b.105.2024.08.21.20.17.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 20:17:47 -0700 (PDT)
Message-ID: <66c6addb.170a0220.d5771.1645@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 22 Aug 2024 03:17:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724296668; x=1724901468; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HZg4g3OgxXPaT4kw1wcUIeocE8+IZ4s7yTBqZvZmg20=;
 b=RpdpWecrCW/XZt4zb/0UfiZDccmWWINxO3c7f2ocwDi6fHoEmVxyIQMphQNIMJz3kt
 X7P8SBkvNhOSMVU16N+QYHbF4ZasgcrZeswfn/9hI5OBAm7p1/gt8lwLE5lfx4afEfp9
 om8Kb+She+nJO+WuwT3wLwp+gZe1Y4I7V4Gdz1ArqYY+9hARdcYTOHORXPIwws9obxg4
 xuKZQFvnqzsux4O283euTiqEFu430AjY0wujKixZujCuHmbrPX4lCcQvj5jJD+MBfgwG
 sGl/nPwu1dEk5eLcBGFgC6DWMjOxly8IommEZO0SsL4YWf/zImEIZOpaUonwPWc7Oa0i
 LWsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RpdpWecr
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-21
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

Autobuild statistics for 2024-08-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 25  | 32  |  1  | 58  |
  2024.05.x  | 23  | 42  |  0  | 65  |
    master   | 100 | 261 |  1  | 362 |
     next    | 11  | 34  |  1  | 46  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 10
                  babeld-1.9.2 | 7 
                  linux-6.10.3 | 7 
               procps-ng-4.0.4 | 7 
                    bsdiff-4.3 | 6 
                     fbset-2.1 | 6 
                   libglob-1.0 | 6 
                  tllist-1.1.0 | 6 
            netstat-nat-1.4.10 | 5 
      python-autocommand-2.2.2 | 5 
                       unknown | 5 
glibc-2.39-74-g198632a05f6c... | 4 
                   httping-2.5 | 4 
                     libuecc-7 | 4 
                    mpir-3.0.0 | 4 
           comix-cursors-0.9.1 | 3 
                  fan-ctrl-1.3 | 3 
                    fcft-3.1.6 | 3 
                    frotz-2.54 | 3 
                gerbera-1.12.1 | 3 
            host-ccache-4.10.1 | 3 
           host-doxygen-1.8.18 | 3 
         host-libxcrypt-4.4.36 | 3 
host-riscv-isa-sim-00dfa28c... | 3 
              host-rust-1.79.0 | 3 
                latencytop-0.5 | 3 
                    norm-1.5.8 | 3 
              openconnect-9.12 | 3 
           python-daemon-3.0.1 | 3 
                    szip-2.1.1 | 3 
android-tools-4.2.2+git2013... | 2 
                 apache-2.4.62 | 2 
                  boinc-7.20.2 | 2 
                 civetweb-1.16 | 2 
                     crun-1.15 | 2 
                espflash-3.1.0 | 2 
                  fbdump-0.4.2 | 2 
                      fbv-1.0b | 2 
                  ffmpeg-6.1.2 | 2 
              fluent-bit-3.1.3 | 2 
                   foot-1.16.2 | 2 
             host-delve-1.22.1 | 2 
     host-moby-buildkit-0.11.6 | 2 
 host-softether-4.30-9700-beta | 2 
               ipmitool-1_8_19 | 2 
           libfreeimage-3.18.0 | 2 
               libglib2-2.76.1 | 2 
            libsvg-cairo-0.1.6 | 2 
          linux-5.10.162-cip24 | 2 
                   lsuio-0.2.0 | 2 
                memtest86-6.20 | 2 
                  ntp-4.2.8p18 | 2 
                 openssh-9.8p1 | 2 
                 pixman-0.42.2 | 2 
    start-stop-daemon-1.20.7.1 | 2 
                   swipl-9.2.6 | 2 
               valgrind-3.23.0 | 2 
                    bat-0.24.0 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.0.12 | 1 
               bpftrace-0.19.1 | 1 
              bubblewrap-0.9.0 | 1 
              cache-calibrator | 1 
             cni-plugins-1.3.0 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                 ddrescue-1.28 | 1 
                 dhcp-4.4.3-P1 | 1 
        edk2-edk2-stable202308 | 1 
                elfutils-0.189 | 1 
                  eudev-3.2.14 | 1 
              fftw-quad-3.3.10 | 1 
                      fio-3.34 | 1 
                   flann-1.9.2 | 1 
         flutter-engine-3.24.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
        gmrender-resurrect-0.1 | 1 
                 gnuplot-6.0.1 | 1 
         gobject-introspection | 1 
               graphene-1.10.8 | 1 
                 hddtemp-0.4.3 | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-14.2.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
            host-skopeo-1.13.3 | 1 
                   hwloc-2.9.3 | 1 
                  kexec-2.0.29 | 1 
                    kmon-1.6.5 | 1 
             libargtable2-2.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 libgee-0.20.6 | 1 
              libgeotiff-1.7.3 | 1 
                libglvnd-1.4.0 | 1 
                  libnfc-1.8.0 | 1 
                  libsepol-3.6 | 1 
               libunwind-1.8.1 | 1 
               lighttpd-1.4.76 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
         lttng-modules-2.13.10 | 1 
                  lvm2-2.03.23 | 1 
                     lxc-5.0.3 | 1 
                   mimic-1.1.0 | 1 
              mosquitto-2.0.18 | 1 
                    mpv-0.35.1 | 1 
                  mupdf-1.23.9 | 1 
                  nginx-1.26.2 | 1 
                nushell-0.85.0 | 1 
          obsidian-cursors-1.0 | 1 
             open62541-v1.3.11 | 1 
                   perl-5.38.2 | 1 
                    php-8.3.10 | 1 
               popperjs-1.16.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
                 rp-pppoe-3.15 | 1 
                 siproxd-0.8.3 | 1 
              skalibs-2.14.2.0 | 1 
             sofia-sip-1.13.17 | 1 
                    sslh-2.0.1 | 1 
             strongswan-5.9.13 | 1 
                   taskd-1.1.0 | 1 
                tinifier-3.4.0 | 1 
              tinyssh-20240101 | 1 
           uboot-tools-2021.07 | 1 
                    uftp-5.0.3 | 1 
ulog-0389d243352255f6182326... | 1 
                    volk-3.0.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                xenomai-3.0.10 | 1 
                  zabbix-6.2.7 | 1 
                  zoxide-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/d737f9f431290795f43a3c61a79253c496b837fb |     
    arc      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/b9625419d1e0e16abf37dfdfd91953256e8208be |     
    i686     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/3d5e43c064414ae4a9c1af29533979249261cb94 |     
 powerpc64   |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/66686424f3e40edf9b55ef6ad4e4b3fd24541988 |     
    arc      |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/ee9e28c0083b971f52faf5dfbe7517152b1ebdb4 | ORPH
   mips64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/00956f4dd0ff4c1ee8b18b6932165aee08d8d74f | ORPH
  mips64el   |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/83cbb848694868df833baf95fc63a86685bc5794 | ORPH
   sh4aeb    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/c34bf3c7289562e04a9204743a671aa8b1d40229 | ORPH
   s390x     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/69e25e7bc763d854564f12dcb618c14b05b51599 | ORPH
   mips64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/87f71495f1e39a61e04351083a695be9a9c43935 | ORPH
  aarch64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/f726544782d399cf2280f114bad53f3c5a8dac10 | ORPH
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.org/results/b7afcdc4a7e3341ed7a07af8292627160c68212d |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/4fdcd2ac1dd55877497d8c7c5ae16efe4d834c77 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.org/results/abb3365b27d4cb1aea881f78a9ccd756fb78f29f |     
    or1k     |          boinc-7.20.2          | NOK | http://autobuild.buildroot.org/results/79fa90a9dd9b7326d7d242153084a8d97163122c |     
   sh4aeb    |          boinc-7.20.2          | NOK | http://autobuild.buildroot.org/results/52c01b9edf2cd8bdc51021ab974772f3ed426a95 |     
  aarch64    |        bpftrace-0.19.1         | NOK | http://autobuild.buildroot.org/results/dbecf88c7edba357cee8fea31294ddb9f4d188ad |     
microblazeel |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/b8e758da9608c722b515382bac2ed56adf0d20fb | ORPH
   nios2     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/8fd59f72e1c712de4e7f7541858ec49b2fd05251 | ORPH
   sh4aeb    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/3135561f7d1287a1f8cfcb8a9700dd093fd73f94 | ORPH
  aarch64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/345b9d985cff61ff19248c9009a1bb1df3cc5893 | ORPH
  mips64el   |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/4037697f4b4ba506ed279fc566215868c7da83c7 | ORPH
   xtensa    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/f24ba9c838d5b142671fd599503989878b21ed84 | ORPH
 microblaze  |        bubblewrap-0.9.0        | NOK | http://autobuild.buildroot.org/results/c1d15c3a0eb18eff7e278d202210eef3347d8a27 |     
   armeb     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/84f6f6e6c0d1b9fa2c45d3019bec26b4249b7711 |     
 microblaze  |         civetweb-1.16          | NOK | http://autobuild.buildroot.org/results/3b9675bb24d4809592e2bf53bfd6c449ee43a7c9 | ORPH
microblazeel |         civetweb-1.16          | NOK | http://autobuild.buildroot.org/results/9b7882af21c837fedce5be88637ad3f2ce490b2b | ORPH
  aarch64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.org/results/527cf7ed93e1f8165849c607664a2b948c575aad |     
  sparc64    |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/1e385a2ac0dd360deb4f39dc70d02a5c529074e0 | ORPH
    i586     |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/ce8c6bf837cadab32c120104c4e052e58cab3291 | ORPH
microblazeel |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/8c6a99b9eb6720065c9a2e454dfea0ae15091708 | ORPH
  aarch64    |           crun-1.15            | NOK | http://autobuild.buildroot.org/results/63beece5b3068cc58c927d9b9361dc71f339070c |     
   x86_64    |           crun-1.15            | NOK | http://autobuild.buildroot.org/results/3148e9df8051da55ac1703db65cbdd370bb0d49b |     
   s390x     |         cryptopp-8.9.0         | NOK | http://autobuild.buildroot.org/results/1a6adb28e7720a669a009e8a71c1d36410e1a956 |     
   mips64    |          cvs-1.12.13           | NOK | http://autobuild.buildroot.org/results/e520c975945466a5dabac3b2ac24c9a82bb8ea4c | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/70fcae8235435c3c77c0fad944556f1b92ae8481 |     
  riscv64    |         ddrescue-1.28          | NOK | http://autobuild.buildroot.org/results/9ab2e2ab44c8f195e594fce12bb653e145414f10 | ORPH
 microblaze  |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.org/results/9db86bda1c4500ffe831a146ad35aed20d3a3688 | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.org/results/2cce6abdc387980a04b1c095eb38bfdf6ceafa60 |     
    arm      |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/aeb2e1c8a74f787885c4d1a2569bb6d7be8e3b40 | ORPH
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.org/results/749a0190719a8a5e7e0d113d3e76776906247ec1 |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.org/results/53783ec2f9bd4e0436bfcfe4f22f98ceb7f1cae0 |     
 microblaze  |          eudev-3.2.14          | NOK | http://autobuild.buildroot.org/results/45744408463faede7de36a02ab46201fb29769f0 |     
    or1k     |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/9b536d4ad83077eb052a543b0796b335d29029f3 |     
    i686     |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/df4a32474e84cb4e64e3890328452e48d0d3b492 |     
powerpc64le  |          fan-ctrl-1.3          | NOK | http://autobuild.buildroot.org/results/13cced54c9bf7ace79de092e4af7249757fe4cf4 |     
    sh4a     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/a4a94fc0a9ad8182486a36ef7f8180734407a5c1 | ORPH
   arceb     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/fcdc32617e0d32bd67a430f3aa1c972c9d01f7e8 | ORPH
powerpc64le  |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/98f955be4aedeea01fc19f99b5b168cf25a31f23 | ORPH
    arc      |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/c84a3dc3a6ad54e1957a368a325fb4a565263a2f | ORPH
   s390x     |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/6816eb60cdd72646d21574182fb84d121e879618 | ORPH
 aarch64_be  |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/669feec84797c40bc334a98a25585042d0374b91 | ORPH
   sparc     |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/2d253fae00b9ccdc80f8a6c1f3a19fed1b51e254 | ORPH
    arc      |           fbset-2.1            | NOK | http://autobuild.buildroot.org/results/7575ebf0e70ce5bee4de7cc45c807b382475795c | ORPH
  powerpc    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/a06c9faa43893cd8c9519c4996a133594d7be121 | ORPH
    arc      |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/4702076f924ca6d6a35a016747d2acefd3050b7e | ORPH
microblazeel |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/6185d306696ffdcd567e54f13e9114850e609295 |     
   x86_64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/29746d04a3b14af7b742adfe927296c1140e106a |     
    or1k     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/32827040874a778bdaf4b492c3aaae4fcead645e |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/ac6bed3d20fc5f3da82524fc0742534a47b4bfc8 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/5c681916275d5a8539099a9d1e31f52a0ff8deef |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.org/results/66cdca6f588539e59d579602912b6fa1a606c625 | ORPH
   mips64    |            fio-3.34            | NOK | http://autobuild.buildroot.org/results/9ab448d3bdffab9d4ef1f345d19cea3f94413941 |     
    or1k     |          flann-1.9.2           | NOK | http://autobuild.buildroot.org/results/b0612fa6d2b20e84deaf072d11647dd20aac7a5d |     
microblazeel |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/0f2faede8b32f293299ae7d8ace44bc152e67f0f |     
    or1k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/795b24d9ce7386d2ddf809836d4524efcde5e294 |     
   x86_64    |     flutter-engine-3.24.0      | NOK | http://autobuild.buildroot.org/results/c2782977a672d09187abe372a1c1c759f7f9d617 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/3637b8b9d82ceb5e2740aec7c2344ab837b1437d |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/e010521f3a8036c9a6ac45f685f9055c405dade4 |     
microblazeel |           frotz-2.54           | NOK | http://autobuild.buildroot.org/results/9fe262ce5280c512f3456e3d009a3b9679615f77 |     
    sh4      |           frotz-2.54           | NOK | http://autobuild.buildroot.org/results/24956a3a687d088e03c916203d5da6b4f017206a |     
  riscv64    |           frotz-2.54           | NOK | http://autobuild.buildroot.org/results/4139bf2b9ba50080a39333c8bfdeea509ed07f77 |     
 aarch64_be  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/894982dbf7d5e42fdffcf94db284080faa78654e | ORPH
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/604afa447ab18bf1b020c592fd6336d764b209dc |     
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/822c052d67c34959fdfe125c32a2c5aee1d967ea |     
    mips     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/364243f10a9d52b343867480523bcb03e709ac62 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/8f9ba86cbbe3fbe4119fed5aad947737af764c46 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/e5de00bf3b94205981c937a3d84aaf16794f717a |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/2a103f1bab33211f7533b69c4885324585efd2bd |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/cf6eb08ba19a41f91db06b2118646c2932c1d4e7 |     
    or1k     |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.org/results/18dec92acf4320bedf1672080db21395a1a507df |     
    mips     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/89702e09319a418766c03bd8a5eddbd148b24cb0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/52721ae0f2fab2a21fef4a5a2c92617cd7db4caa |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d727b90998c484e05aef4508a5db8315ae556016 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/d5c0a8a70635b7d284bd99be71ea207f0bfed794 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/0addbbaaf5d489a622521716c4661329ad181ebf | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/21ed71809174449f5b472798e0b89e517c64df9b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/51a04e93102021855bc1e6fd451911247df454b8 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/f260309ec5860a3426c0f19d717057d70ebec6b5 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/9fb0ee43ef6b8a790120074ff1c84bf4479d6631 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/f8ad84f557296c4afc1b808b8f277b58225c57c8 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/be4f8a23a6c4e8f10ebfa15d5845f8153a6e84a9 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/8648b9f2353a38d7061b06fd5359d01f590eb5f8 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/5334eb5b4653fe059a82f20b8fca2674d8173f55 |     
 aarch64_be  |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.org/results/47e6f8a1b942427a1f9dcc98559f15b588647111 |     
  sparc64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/5dd4e7bd7a4749db448c1a747a1a9cb13ebfe8dc |     
  riscv64    |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/227eab5e3454a51c76e43baa3fa871908add1915 | ORPH
   sh4aeb    |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/e54a695c5b384537f31dee82e75acdef88953226 | ORPH
   s390x     |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/78a308d3286f06d48b7b80d2dd128dc8b0203744 | ORPH
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/f74aa9764b0cfead34bd9ed4b1769704f6f44d13 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/ff3320fff1d57fb04eebc476816784fdff4b7edd |     
   arceb     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/c053e5ce7ca1ede7aa30fbb6660e1804a363b627 | ORPH
   x86_64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/d87934e9b8995b740a62f4cc81ad8dbf091744dc | ORPH
  riscv64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/96b7cf266ec2d56662b4c6135b1065c4201d0a7e | ORPH
powerpc64le  |     host-gcc-final-14.2.0      | NOK | http://autobuild.buildroot.org/results/967c4a2c7d4393ef0067647bb8c53f77b50873d5 |     
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/281e82c7e963bc599243c1bc7a2fe12449b912fb | ORPH
   x86_64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/a472527bd628c8c247ab5610266e14a6ad2c036d |     
    or1k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/6bdfdb471e1b33225b52539fc2ff6908d7fa655d |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/46c4e6812b720be800006c92ac8a23ae8beae7dd |     
    arm      |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/5e094359bf60ee04be6f03ab36a8e90bbe2987cf |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.org/results/6635f461e4bdb2ae6b18cca2e7c9c17c728ebb82 |     
  powerpc    | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/7b690271a5d8b1653be884ebe508dd8b8de9bf86 |     
    mips     | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/08b383650fd243e1c20ed4b59df80dec63a21fc5 |     
powerpc64le  | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/78ebdb24405609cdcbc739955d0cfca595f4c88a |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/9a529e7a455bb4668f7801ef755c753314047d81 |     
  aarch64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/d4d7adf408a5757a04563f318389fa4f4a7132b8 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/ac9ac9b0220e79e05dd2538fa77da6107cfa56bf |     
  riscv64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.org/results/6ae45b36508a414fc3523560e4d58cb196745c6e |     
    m68k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/170f0773a673c58326f32e23dbef8b18e17bc8c9 | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/ba4c4e0702d0fe3790a33d7ebeabd33395942ec4 | ORPH
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/0eab7add28b7215b2ffd723dfa27659aacc22932 |     
microblazeel |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/7724b36d73d99cfa8a0b1c36b31a25a6362bae76 |     
    sh4a     |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/f9d6eadcfae8185e9b171de139c76b6f84b1d534 |     
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/dbb44d6a4b7d54792374b7c72b032b34be00ec96 |     
   x86_64    |          hwloc-2.9.3           | NOK | http://autobuild.buildroot.org/results/058d606b0f6361d4ecaa16ab67992af4ed46eac3 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/81ca0a4faddba45a13044f9a6d9bf2021f0ec4db |     
  sparc64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/354717f96e9744369209c5546bba053a34c5b447 |     
   s390x     |          kexec-2.0.29          | NOK | http://autobuild.buildroot.org/results/64f179d996e9111ffe7b8ad18948066ebb1c6f93 |     
powerpc64le  |           kmon-1.6.5           | NOK | http://autobuild.buildroot.org/results/bbe3cdd8888bdfcc6bc26e9d43e8b411e452ab46 |     
   mips64    |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/83f3a0da96e7da65e0feb59171613ba08ffabb54 | ORPH
 aarch64_be  |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/596a2855c1fee158e691d270d2bf79dafd1c98af | ORPH
    sh4      |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/dc0df7d6313e085a18403d7b65a57777a162e539 | ORPH
   armeb     |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/09b180ab3d79fadc6d99ff9f7e42ab9fb611a3ae | ORPH
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.org/results/5c4ad4d39ba3c1d98f1c282566d087beb6fccdc2 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.org/results/cfb07e4055cf22c22510bb31f98b9d0eb3372d40 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.org/results/d591926919616025351f0ad5cdcb406b7f9b89cd |     
   armeb     |         libgee-0.20.6          | NOK | http://autobuild.buildroot.org/results/816d78c0653c94b70bd1939ccb9e78af8a51d021 |     
 aarch64_be  |        libgeotiff-1.7.3        | NOK | http://autobuild.buildroot.org/results/aaa80f8ab5517cfce7ffafb028479d1ed03ea3e9 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/c08f11796941f39f74924c5bd19714e5b36d4048 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/3553f3bdaaf466dced8ba0c5e47624d91ecec2f6 |     
   armeb     |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/81d5ba004ceed0fddf2c9dcb29123a1992f54c86 | ORPH
   mipsel    |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/ddbd1c602fd44896b5e0435e40faaafc143e2ac4 | ORPH
   s390x     |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/244c52c05e9ecc51afeebcb3ba0e66792171f929 | ORPH
    sh4      |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/92c697697c07f63f0e03ceb655b5d558e85c392e | ORPH
   armeb     |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/ef1e41f78e633c1ce72fa856f6e7d50759b82b20 | ORPH
   xtensa    |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/5b06e2b4c1aa756ff96d0846f9a3a85894d515b4 | ORPH
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.org/results/67f5033a3d5754160beb3ec10e5febe6c54fafc6 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.org/results/5f3a33a17ab1287db6ffc1d3ff86f27f25bd4b88 |     
   armeb     |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/7010245387ee4ab5da42baa3365e5f14aaf318f5 |     
  riscv32    |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.org/results/e84398aa13ed2db81487aa7d5c2425b1cdb1cc99 |     
   x86_64    |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.org/results/750d8a5857ae57fbab72cbb8629f7931afed4270 |     
    mips     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/5a75d0288dc73614d4e47e0bcb6171aa20d6c9b1 |     
   nios2     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/885c53bff35b02cb832925ed62e470cc823790ec |     
   xtensa    |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/cf75bbf7015eef03788a7063c0625ee4e3b38fcf |     
   s390x     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/2a6c55ee832754bfe76ef69ff4bf87090e7c5bea |     
  powerpc    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.org/results/1c664ed06713ed08c44637f1174e73c233b0b6d4 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/e983b306651d223660d485eb492d47f3889d74f9 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/c9460cc76502496f2fd9ca045cad72acb2f52e2b | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/479a0f62960cde5127d962df58b677ff19de51b6 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/414687aaeaa2fcfa31727351d12d440a9bd39025 | ORPH
microblazeel |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/61ff8c53d13fc5cf674e57b714acadf697e46bb7 | ORPH
   nios2     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/9c2e565809b6174c5b008812ad8a05da8e61b2f0 | ORPH
 aarch64_be  |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/5d3ebaa6dc0681976d8d2feafaa6aaaf02e74031 | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/56d9a0f985747c85c0f365f35c5d5fc7ff836a0a | ORPH
   nios2     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/e101eef4677d8463f8b9aa51ca8a05bf01edd236 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/1bb94496342072a81f14abb5dc7f6cc40084c809 | ORPH
microblazeel |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/e101d9ca50e64560301dbe856a0efefc38db0cd6 | ORPH
    i586     |          linux-tools           | NOK | http://autobuild.buildroot.org/results/2e5b9398417d6df60a047ec586edf092f819e411 | ORPH
 powerpc64   |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/eb2546504b18d67ce2aa20cfbf7b3b53d9b100fe | ORPH
 microblaze  |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/8ca08bf3d1a42b174df7c7ffa17ff24f48de6c50 | ORPH
    sh4      |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.org/results/6aad78a49590f7edd74f8f5523156a67a554f3fd |     
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.org/results/63eae68aa93768dd7d9595c15ac69f4b76523432 | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.org/results/68161f29632ff3fb30f7b9030c5807549e2f3a6c |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/3273151e2dfd3e2dabaa212f0b1ba8c039e23884 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/52c69dfb570f16a06abca5a9d65815ca12444e86 |     
   s390x     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/609ebdfb4c7e73522d9ebfd649a067d1bbde5363 |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.org/results/e132e98860745d34d149516eabd568e0e5be2611 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/93250727c56f4c16024f49a68cd1a7e7c2a1a638 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/27be6c0295bca32af7a78602fde19c5da36db28b |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/ccb4985cd51abf48f32b6a5e4ef291a9310c3ef1 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/5e6bb2c211ec7ac5d46fc645ba04b22718ca36c6 |     
    i686     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/cd6549a8b590c83cb5fe19d5a7081854ce4b347e |     
    sh4a     |          mupdf-1.23.9          | NOK | http://autobuild.buildroot.org/results/192b29ce7984830b74dcf121d53178e738f0902d |     
    mips     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/16290ce1cae27e10612741c9ebf7b77ccdfa6b55 | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/2ea88dc63ea052ca6ebc00deac5d481312667500 | ORPH
   sparc     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/ce225557e6f2bf83be7fd9e868aa97a3ea84bdbe | ORPH
   armeb     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/82a3cbacef6e67eca9b67e6c3d6e62103f33fe70 | ORPH
   sparc     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/e9be8b2890fdeec249a6e2550253fa6faaf9bb67 | ORPH
   arceb     |          nginx-1.26.2          | NOK | http://autobuild.buildroot.org/results/894bff37af4f22f8ced1e3b3f3da79e8e2e9fa79 |     
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/2f7adc79775cadd0abd55f4f2c44aaf60c19fd43 | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/0048ecb44f65fb5b84b242998af505fe2b63b8ec | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/be4fc73d9a236358b07a816ae5bf8c34add2558a | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/4e14e34c9b2a711982ba4f15c075f0b82d5d558a |     
   mipsel    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/27f151d94d57659d44bd87c9ed5fc0c2dfbf83e7 |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.org/results/fcaf1676e04e1108ec3c2a31844be534aa83fb4a | ORPH
   xtensa    |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/023203fe6c060d4c9943948c37677f5eafcf971b | ORPH
   nios2     |       open62541-v1.3.11        | NOK | http://autobuild.buildroot.org/results/a923216b8ab3c6599a7655932af555966b915635 | ORPH
 aarch64_be  |        openconnect-9.12        | NOK | http://autobuild.buildroot.org/results/6b7a7030966192e12846b1722eda23e88debc9c3 |     
  sparc64    |        openconnect-9.12        | NOK | http://autobuild.buildroot.org/results/d9a6a8bec4de0c6d1863e4fe279aa6d7f49bae63 |     
   nios2     |        openconnect-9.12        | NOK | http://autobuild.buildroot.org/results/7e288f5fc334ed0a23330d43fec52209df36a883 |     
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/22828de441c69187c219de94b35f7d204386158f | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/f49a089a338d2a5db2af4adaca0b9c742d290397 | ORPH
 aarch64_be  |          perl-5.38.2           | NOK | http://autobuild.buildroot.org/results/0d27b555a9cc0b3cafda689b39a957514ace76a5 |     
    arm      |           php-8.3.10           | NOK | http://autobuild.buildroot.org/results/82bf378d4c6e1c732f846e1b987901e1fc606bff |     
    i686     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/5c5e6621c66c81e7b49969868de7bd097fd02c24 | ORPH
 aarch64_be  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/42cb2add5ea9e1109ca6acb79bf93557f493ac06 | ORPH
  riscv64    |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/ac8808f36f6867a246c3188bc625f6aef1b44296 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/545d20a7835c6c7c63de485a0169c9d6e7d13000 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9ae5e76b418a3deb1caa8bb64a54ff5a8d7ab76b | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/299c7c5d3ffc4a17869b8b5731865d5f11bf7596 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/e0b4a5eced4bd409ead97afd6b396824b5aabcf1 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/04bc11ded4f61905b5f50b00714e169203aaa2f7 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/2b88b987de37c6ebcd6065e813d6201526977090 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4170f4c6fa94d077880d9a16f65abdc9dd55d851 | ORPH
    i686     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/8e37c02565ccb38975cfc8ef98072d5d2cbcc5f2 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/05edf46dd99299d574b16d601851f4e6e5240874 |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/0da71714ca818373fa806d8f8dc045750832cc54 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/c2dfa09334cb845bb478eba4031b5dfebb4f1fa9 |     
   armeb     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/3d79e25562490d38e9dd2fc2d6c212757ad8e774 |     
   mipsel    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/7355f5b0191255d70b8c08a8b297c1407fc5e55d |     
 powerpc64   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/74b1b3b6b4725f0bdbda263fa7794bc1d3747837 |     
 microblaze  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/32c56a05d67286bd997765872775f547bc136396 |     
powerpc64le  |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.org/results/e9914eb1a3b121a4c44447007c74ea3e84d5e925 |     
    arc      |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/83cd04dae897ec52b53b73b387c7a3ba23270747 |     
    i686     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.org/results/38480f7d24144a94b59a2c55d96db083595a5b5a | ORPH
  mips64el   |         rp-pppoe-3.15          | NOK | http://autobuild.buildroot.org/results/acbb36b829558f9444086f8909f5878e5b301eae | ORPH
   s390x     |         siproxd-0.8.3          | NOK | http://autobuild.buildroot.org/results/e956a20ca2611d7540ac188a09cda239b8e9a46d |     
   arceb     |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.org/results/49e8d4ec9d90f3c963d9886c0adc5a90e4bb6185 |     
microblazeel |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/6dfa18bd9fe6dc3f182cfc54b7548c6ccdc96f0f |     
    sh4      |           sslh-2.0.1           | NOK | http://autobuild.buildroot.org/results/a3fe3cf4b511c20cf292f659ffabe9677e885a6e | ORPH
  powerpc    |   start-stop-daemon-1.20.7.1   | NOK | http://autobuild.buildroot.org/results/7a764808297b0bf68d0ea6bc760aaef4689dcb3c | ORPH
  mips64el   |   start-stop-daemon-1.20.7.1   | NOK | http://autobuild.buildroot.org/results/674a4bdc98e1d50c02770d8fd9da404b6dead23e | ORPH
    sh4      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.org/results/c9f188ca4dc348690428bc012f702fda7b7458af |     
   mipsel    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/3661d6075f148fcb65e22a913de43e3eeed03f76 |     
    mips     |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/2afaf9f13db8091076c819e3da1e74d303ef47f8 |     
 powerpc64   |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/865a0f24364433d9345812ea10891b112090e01a |     
   xtensa    |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/2a893122e9079b8fc5fbd443067e2915810eee09 |     
 aarch64_be  |           szip-2.1.1           | NOK | http://autobuild.buildroot.org/results/4503426ff1cd3a39fcbfc42a93f766113c2c082f |     
    or1k     |          taskd-1.1.0           | NOK | http://autobuild.buildroot.org/results/c894367b3cfe52e2e9046104c4bcffb6a206e214 |     
   s390x     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.org/results/113492465107b3bdd1fe11e035902463a7f80717 |     
   xtensa    |        tinyssh-20240101        | NOK | http://autobuild.buildroot.org/results/87a74b4d21425c0113aadbb9762331bcc6992be5 |     
    i686     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/d67d3715bdf6557e7998f26abfc80d85e37212f0 |     
  riscv64    |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/71fd1b566f0daa6d8c4423a2b3cb3a6f930aa089 |     
   sh4eb     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/40fda5ff565588cff8058f5aa4eccd4a0e870ea9 |     
    sh4a     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/370b4d2c8e4888f6bc4704101747ea05cfb60bb6 |     
 powerpc64   |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/aae4e6da3b5f804a7fdcac543b35a17809f746ea |     
microblazeel |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/de0483c38ed3eb4e6d0f72dda0faa34dbd521918 |     
  mips64el   |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.org/results/7d3087818b3cb460c3f86879a473c8e98f51c69c | ORPH
   x86_64    |           uftp-5.0.3           | NOK | http://autobuild.buildroot.org/results/68c8f80bd6b1354017aaf1731c5aa169f8c22871 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/c68227001416dc158d9764fd521cf9c04e94c14b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.org/results/942baf049ebc0649f8fc35269e6ac50d5b198f2f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.org/results/09070897a950b16cad6c851aa530bf9ee2e0ad96 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.org/results/0650bedf001818894c97942882f2f6de34e2bcd9 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.org/results/07c7fc1ffb780ce967c5fce2af0d779c03dcd2c7 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.org/results/4a3d0242399442d7835e7a14763a785515a9a621 |     
  mips64el   |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/2acd32aa917e85670274e5fe28f60604b315cdb3 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/7084580b76adc3d213c0c411413790180debdf4d | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.org/results/b12bfd0660ce8922cca22628c2f3b6736066bc77 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.org/results/6f1ef276afda660c19c93e5f3e1fa058d792b31d |     
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/eccde5378a48077afbda3cf0d9ebdd58daddfe95 |     
 aarch64_be  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.org/results/9ffb4a9e3b2291498d0ccf3c9124bebc466860bc |     
  aarch64    |          zoxide-0.9.4          | NOK | http://autobuild.buildroot.org/results/bdbf8208be57dd6d06cfd325325fdfb756faf728 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               collectd-5.12.0 | 2 
                elfutils-0.189 | 2 
  gobject-introspection-1.76.1 | 2 
               host-go-1.21.13 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  linux-6.6.37 | 2 
                       unknown | 2 
               asterisk-20.5.2 | 1 
              e2fsprogs-1.47.0 | 1 
                    fcft-3.1.6 | 1 
                  ffmpeg-4.4.4 | 1 
              fftw-quad-3.3.10 | 1 
                    flac-1.4.3 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.17 | 1 
               gocryptfs-2.3.2 | 1 
                 highway-1.1.0 | 1 
             host-delve-1.20.2 | 1 
                   libnss-3.97 | 1 
                libressl-3.8.4 | 1 
                         linux | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mariadb-10.11.6 | 1 
                 openssh-9.7p1 | 1 
                    sdl-1.2.15 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.org/results/25e1f3e84f56989a826ae0c10561a160399faa13 |     
   x86_64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/ece2e5b67880e7f522d789700b06eaba8df9cb93 |     
   mips64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/4465fb4eccf283e4efbf8c29845a3d21e1ced0ce |     
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.org/results/357c85f0fc3641dbf2910e59a6a4bf442121c4b8 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/1a3d7141f1cb3e02a6202d1bce9328dd36a5a970 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/115d3c88aab11b976fce738f2a9a97a851384591 | ORPH
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/3243635fc7d9e73eb91fc0ed4235883255494da0 |     
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.org/results/85c26f16fc71b8711837aee5eba3fdd4a2be28e8 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.org/results/2a19d1506a5fe603dfcba399da5d6d723806b52c | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.org/results/4695ece403c38175fbc0638b9cc98a899b54548c |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/96cb6432961b0d7c2f38ad517bfd2879f474b51b |     
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.org/results/e764cf93dfed998585406ac7d290d012d0eb1c8b |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/414dd0217a3b79dbbc73695dbae210d62a50652c | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b1e1e3e129b804cbbce59bf2cf68af880ffd559c | ORPH
   mips64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.org/results/fac734612117d00975abdd630b704efc392989af |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.org/results/413b3de916e007acf6950f37cbe1d686b96dd321 |     
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.org/results/c4cb6ca35b8e10d1f4d691c7b2f81c43786206ed |     
   mips64    |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/ff455270b2da36f7792b03f8be9c4766b1a37e80 |     
   nios2     |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/0d4ad13938dca38ff95159896b0848e285d69764 |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/981f4d0bf4497f9c8af85f959f0a63e1b6d491e6 | ORPH
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/8cfc95f380b89cd7636c121543364bf3a897121a | ORPH
    or1k     |          libnss-3.97           | NOK | http://autobuild.buildroot.org/results/f07336a54f37beb544fbe668a37edc03087860b8 |     
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.org/results/3e929573f14ea81501bc3b8c56c9b87d5264ca92 | ORPH
    arm      |             linux              | TIM | http://autobuild.buildroot.org/results/7ce040fcb5992342c25a6231e19930aacaf7efb7 |     
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/f1ac3a63bba4da1dd51aeb8c99d2610136cf5e16 | ORPH
 aarch64_be  |          linux-6.6.37          | NOK | http://autobuild.buildroot.org/results/a118b02ccb4c5dc5a3ad00b0b47ea8627c51c940 | ORPH
   sh4aeb    |          linux-6.6.37          | NOK | http://autobuild.buildroot.org/results/82ce62ae513717ce1da81aa0826e52e0a23aaa22 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/82189e4f1c62a99d495760cbc876587bdc849f2e | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/3eadac37d1761a198875bf39f3ad204f103c6858 | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.org/results/3207acd23a1c045327cdf091ac8735484870569b | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.org/results/71000b3596d5ad208d343fecb2adafdfd76712cd |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/eb9234c752adc0ae54538d8484175d5ebebc4284 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/bda60385697dc5929fdcd2f69afaa0a4ab9b3600 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 5 
          libcamera-apps-1.2.1 | 3 
                  linux-6.8.12 | 3 
              host-rust-1.74.1 | 2 
                    rtty-8.1.0 | 2 
               collectd-5.12.0 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
           ghostscript-10.03.1 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                gnu-efi-3.0.18 | 1 
             gnuradio-3.10.7.0 | 1 
 host-binutils-bare-metal-2.42 | 1 
         host-gcc-final-14.1.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
               ipmitool-1_8_19 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  libffi-3.4.6 | 1 
                  libsepol-3.6 | 1 
               libunwind-1.8.1 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.6.1 | 1 
         lttng-modules-2.13.10 | 1 
           mediastreamer-4.4.8 | 1 
                    ncmpc-0.49 | 1 
                    qemu-9.0.0 | 1 
                 shadow-4.14.5 | 1 
              skalibs-2.12.0.1 | 1 
             strongswan-5.9.13 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/7b1b7fefc7342936c97664af637c7acbb75770fa |     
 powerpc64   |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/c342e9499a3b2a3427cbe7ce83decd9673f3635d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/f83cac870941a9d31696f7640fe30fa44476a690 | ORPH
   sh4eb     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.org/results/b917473dbf9f27ac31e2f3b83704660e11c70969 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/9284dbe63a88ae5b02f62c8ca3628190b2e45cf3 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/8c61a9b8fa577ba03b6725b7f2cf101519b1cd26 |     
  mips64el   |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.org/results/3aa6eb555f80ca8ea7db5188f8d1471976d4094c |     
    i686     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/9e680f6234d617bd04b312b65b6913850b95a4b9 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.org/results/69bd985d536eda51a99e872377e93f98d7ea2254 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/c0f9bf99015f2c1f820a5ff4eb3656379ccfef8c | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/3a32166cf390d87e6d9077218dba2d0b873b3497 |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/9ad2788232d939ea9499c33ef90b9df69f519cc5 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/fa40a7070380cf8d217e208e2eb637537e5cbee8 |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/21a82c9bce530ebad96b954961f38df28277a23e |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.org/results/8fdb8f619488795af9c1c88be2413217e8416dfb | ORPH
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/fd21a6793b8f95f8a159337588f73b1fc408f138 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/d47b4ffb40c6fc7bed5f5a7a8fd74b3aa00a0e52 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/48c1519deeb7f51413e393381435535117a83318 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.org/results/3d9e326bd887b69794fb09cad9eb8d0692da2d0e |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/72baaab4658254f4c5b3348298af1d5c891cacd6 |     
  aarch64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.org/results/fa3e2650491bd577d8d200a7410cc71fd5a3ec40 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/e4a8462da197cb32d4a9417e75f41d216d2aa4e3 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/fbd2c9016f145823200da244db2d3f122f0d8a57 | ORPH
  mips64el   |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/1348db1e1bf651bce31a659bf86168664576b9b9 | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/401f54d9b21a544cbe588bcbbe22dfedd1bda7ad | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/72598126d79287d891a7d1c5d1e1f0ef5279f84a | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/4cf3897fd771051de255a9561dcbb97d9cb3d3f2 | ORPH
   xtensa    |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.org/results/b4ebfd5461d2c3f1630962c45a02eddfc2f8d2e9 |     
   sh4eb     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.org/results/5cad43c76c193f71482966c780b65c51c2716a82 | ORPH
    mips     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/2619f208dd7bad7a936bea61694967f5cb57037e |     
    i686     |           qemu-9.0.0           | NOK | http://autobuild.buildroot.org/results/cf9eba0c455b96a46ce5c2ab0546bf956ca9313d |     
 microblaze  |           rtty-8.1.0           | NOK | http://autobuild.buildroot.org/results/7f71357c98fc5e66d579430205474ddb0cf506d1 |     
   mipsel    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.org/results/696a20846e98cbe97ea9f2611eeeb6b35bc91567 |     
    m68k     |         shadow-4.14.5          | NOK | http://autobuild.buildroot.org/results/524c28dcd9da5c5e6963011fe3c5acd98657d2b1 |     
  sparc64    |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.org/results/55c019f34cec9342d80c8e2d8b3a3d5ea96f1a39 |     
 microblaze  |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.org/results/d8b60af3463e9d58283faee871fa717bc09cb547 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.org/results/f0c5fe0f52f4df579567a9bbbcda4762e1166c7f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.org/results/ca17ca9b93feecbf4a3d5f9c9202b96b8fa2ffe3 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.org/results/ca1df0212f36c4eb1f3fbb966df9b02990a9c224 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.org/results/f02c7bd42e1d243693b8e43a96b24ce9b692af45 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.org/results/e0cd10467eee12cc59b539a7f04b1264839c76aa |     
powerpc64le  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.org/results/f99c94a86277edef6a25086f8b33f0f4aaa0eb59 |     


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 5 
                gnu-efi-3.0.18 | 3 
            flashrom-1.4.0-rc2 | 2 
            host-binutils-2.42 | 2 
      python-sqlalchemy-2.0.32 | 2 
                       unknown | 2 
                   bird-2.15.1 | 1 
                 cdrkit-1.1.11 | 1 
               collectd-5.12.0 | 1 
                   eza-0.18.22 | 1 
                  ffmpeg-6.1.2 | 1 
                   foot-1.16.2 | 1 
                gerbera-1.12.1 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
              host-runc-1.1.12 | 1 
                libcuefile-475 | 1 
                libselinux-3.6 | 1 
                 libssh-0.11.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                   lsuio-0.2.0 | 1 
                  mupdf-1.23.9 | 1 
ulog-0389d243352255f6182326... | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/19179faaed5077a685e7ccbe699ed002213eb81c |     
 aarch64_be  |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/c4a00c47eddae9a11fd01b728df8fc2c6f3f5868 |     
powerpc64le  |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/3ab722da46afc9d8914ece0efafad09b0a7691ae |     
    arc      |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/527ef753b6c909094b1e644596454e0af06f318c |     
  sparc64    |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/46087e5634e07c13f916dec851e592085c18b769 |     
  riscv64    |          bird-2.15.1           | NOK | http://autobuild.buildroot.org/results/8079f2a779e6f73b1f57a7fa40edf2e56d00ccdf |     
microblazeel |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.org/results/794e3f16a347e1e21b2bae46b819be7b6dd08699 |     
powerpc64le  |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/e98097243da523816bb78dd97f84c3b78e77e832 |     
 powerpc64   |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/d33bac7f00f65ef88b0a707504da4148b42e0581 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/6763e070a228183a9556340ef49512c4d8ad642e |     
   armeb     |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.org/results/faf8919216ba5dc9164bc52c34deaf2d4cf6b06d |     
  mips64el   |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.org/results/ad0ae85e00feaa8f3b757f851bf16d1d465df23a |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/0ff58d447e411ca38ed0e15ddb2e8f4dbf53080c |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/aedb54e9d16b20e47dd3c4f2503c56187a4e5742 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/c9fe8f0594031225eb32d6566bb579921c9cdb92 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/1e9a0a93882a96de7a248c511deec313bc52d22c |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/9749e95b18a822ebe0faac3a26c95513986239f4 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/6589d2061153e60533ffe892a0e4c8e8054159dc |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/fac10cbba78d4fccee8496464c73464865425b90 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/95954b4bdf24f263e1c6c661b5c90ec05ef6f175 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/ec97cfd8d8e2c22a14a5160592f13c760689cf65 |     
   mips64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.org/results/94438c1080ece9baab1393fc49fcc10a42a0d833 |     
powerpc64le  |         libcuefile-475         | NOK | http://autobuild.buildroot.org/results/28f1e34166e836bf3b984f228bb09842840de82a | ORPH
  riscv64    |         libselinux-3.6         | NOK | http://autobuild.buildroot.org/results/3076e579679a84ecc38d7c187f8015222fdf24b1 |     
   mips64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/52ac68b33144c1754cab6983f223caf276750269 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/cb23b1c71600bac437e1b8ff0782dd3289c81f9c | ORPH
   nios2     |          linux-tools           | NOK | http://autobuild.buildroot.org/results/6d70d9ccc26bc94a952f0c467198fc90e1505569 | ORPH
microblazeel |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/0d476967e2b70ec6042f46c2b4c5a2b59f95d7dd | ORPH
  aarch64    |          mupdf-1.23.9          | NOK | http://autobuild.buildroot.org/results/bb94acd84d6ad3171b7cb15edaf31ee4173cc817 |     
   x86_64    |    python-sqlalchemy-2.0.32    | NOK | http://autobuild.buildroot.org/results/167f97c2aca243dc3344ea587c02259baa6ac981 |     
    m68k     |    python-sqlalchemy-2.0.32    | NOK | http://autobuild.buildroot.org/results/6b083402b71959a95e411e9a123b6ae3098b8cb5 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/0af2ae556dd98ac5892ab3bcfcbac8c6099b83a6 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.org/results/5a1180aed6e76817a9ecbc4bc9050bf2a18e58cf |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.org/results/9e871fb9c4fa44fa5c4034d90d6eb4f5ef5eec58 |     
   nios2     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.org/results/d86e79461defd8e019b4c0cda3d703cc0a74874e |     


Gitlab CI results for 2024-08-21
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607873038  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607873040  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871344  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871781  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871787  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607872107  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871121  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607872286  | ORPH 



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
