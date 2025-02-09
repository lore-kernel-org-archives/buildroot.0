Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF52BC0219D
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 04:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5353B60856;
	Sun,  9 Feb 2025 04:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sov8MVl__z9F; Sun,  9 Feb 2025 04:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D697F607D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D697F607D0;
	Sun,  9 Feb 2025 04:25:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7F93199
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 04:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91C5C4137C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 04:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wI4u9eqcL9GX for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 04:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 904824137B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 904824137B
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 904824137B
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 04:25:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab7800d3939so485083466b.2
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 20:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739075152; x=1739679952;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BlU9/LaL3qsDcAKlZ2FTDZlorvGXNx/j83G+AUF0Lp4=;
 b=Kzl+hYOpocqtxqwXrXVHOZ7gKVHG4ANCf5kUn/vzOMF3EMqdItqyDQmri88F1O1fPm
 UzFIgeMRTDgt63rnf+4GaGQmLkOBIRoduNGYnTvXB68AJuNyshWFwQDaE/VRzgkM7Zsc
 IMwev/DG/Btcb+pzxzWUQei5/CusHbKqbMCG3JimXoZaqsf9FErkd5S3Te4e+4Tg8+63
 zkmzMCAr3xqE0qZRC5Bn5urkY75pr0ecFgtp1Ha/S07rNrZ43M7PLNH2MQLUUv7DGY6z
 xY8Op33NamQT2MZjsfVjxFZ17nm+wI7+QiawpGLft1D045v6Lrs3xe2ynBlm25ObOAve
 wjUA==
X-Gm-Message-State: AOJu0YxQ7Mmj85ERrkv8qVVnBS4EfJpG5K0lFickAkBMFE/1YnGTMn+O
 SmN3DMhmexs1HyMVUOhOsWmH+bWw+KcP5TDMnSsb0x9hCbN4w2ljkDFueA==
X-Gm-Gg: ASbGncuMcJKBkc+j6Y6dLP6Ydofh7HIE3ajcjCJhdAU74qs5XSSaqN8j+DiqMjM4ckO
 2iQm/IZR5sY+yfxOR83slVYuRub+cKyBy94e8tSdsOrMSB2EInaBuuQewEX25G8A8qbTp1wdebt
 1bIH9Vd8GYq9jViv1JFmSsWaF3zAyfy4+HK6oxsxisu1jOVXEALtVCpE0Ib/QEUFhpmEp4fu4ZI
 ceD+B/cqR3Pu5aj+mnOu1lWhoIyHpBAADvYnal23TyEunZ7IZTlBQRa5Fh+JViUbqtQlx/bKiGI
 nZZweWmJWe0A8280dw8=
X-Google-Smtp-Source: AGHT+IE2xQjhZ6LRbTo60DsmpZ48k153lBaxgNVdo60OesDspfprhnqC6xVuzOa9KF3JOhnErvQueQ==
X-Received: by 2002:a17:907:c15:b0:aab:dc3e:1c84 with SMTP id
 a640c23a62f3a-ab789ada5a2mr828672466b.17.1739075151793; 
 Sat, 08 Feb 2025 20:25:51 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78c219740sm450850466b.61.2025.02.08.20.25.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 20:25:51 -0800 (PST)
Message-ID: <67a82e4f.170a0220.2fe5ff.b21d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 09 Feb 2025 04:25:51 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739075152; x=1739679952; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BlU9/LaL3qsDcAKlZ2FTDZlorvGXNx/j83G+AUF0Lp4=;
 b=P1wBKwCEuYOTUrg0ggVaK7x41D8mS75o1/WNZZzZUILq51mLgf7zHmLsvaL/0/EOZh
 inT9gyoR4xmjffvpWMUS01r+gFTADa8t+sot6QwxR2x+3I464MMDwL1oAbZD33Q8iotA
 ze0OgNftxPJjYAPTF4VTz6Fceno4ZOagJGxVK5z/yHVKOztvE+nXqQZBxtCQlQWoacvd
 2L+6RT44BP9J5cAYAv7PFb8Y4ErgNPw7+gJGzfeXvDkJ4t37GExDrOdXNY4mHfjJozk9
 S/eCycMyDDh22kWCiqQdm5VfTjA+3o8FGZbmmUbhfmn7TNB1h6pojt+ADj1roEYSelk+
 ECHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P1wBKwCE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-08
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

Autobuild statistics for 2025-02-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  1  |  0  |  5  |
  2024.11.x  |  4  |  2  |  0  |  6  |
    master   | 17  | 323 |  0  | 340 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-9.2.0 | 68
                elfutils-0.192 | 16
                   host-go-bin | 13
                  ffmpeg-6.1.2 | 9 
             fontconfig-2.16.0 | 9 
                    mpir-3.0.0 | 9 
                 linux-6.12.12 | 8 
     bandwidthd-2.0.1-auto-r11 | 7 
                 c-ares-1.34.2 | 7 
                       unknown | 7 
    host-python-greenlet-3.1.1 | 6 
                 libcdio-2.2.0 | 6 
             util-linux-2.40.2 | 6 
 host-softether-4.30-9700-beta | 5 
                 openssh-9.9p1 | 5 
           at-spi2-core-2.50.0 | 4 
             bluez5_utils-5.79 | 4 
                    brltty-6.6 | 4 
                 coreutils-9.5 | 4 
glibc-2.41-5-gcb7f206537240... | 4 
  gobject-introspection-1.82.0 | 4 
                   linux-tools | 4 
               mariadb-10.11.6 | 4 
                  ntp-4.2.8p18 | 4 
             batman-adv-2024.4 | 3 
             dahdi-linux-3.3.0 | 3 
              libopenssl-3.4.0 | 3 
                  liburing-2.6 | 3 
           libzenoh-pico-1.1.0 | 3 
        ltp-testsuite-20250130 | 3 
                   mimic-1.1.0 | 3 
               openblas-0.3.29 | 3 
               procps-ng-4.0.5 | 3 
                ramspeed-2.6.0 | 3 
             bmap-writer-1.0.2 | 2 
                  boost-1.83.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
    host-mender-artifact-4.0.0 | 2 
              host-rust-1.82.0 | 2 
                  libsepol-3.7 | 2 
                 libv4l-1.28.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
            netstat-nat-1.4.10 | 2 
           oath-toolkit-2.6.12 | 2 
                pipewire-1.2.7 | 2 
               acpica-20241212 | 1 
                  bcusdk-0.0.5 | 1 
                  boinc-7.20.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
           crucible-2023.11.02 | 1 
                cryptopp-8.9.0 | 1 
      docker-cli-buildx-0.16.1 | 1 
                  dpdk-24.11.1 | 1 
                     fd-10.2.0 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
               freeipmi-1.6.14 | 1 
       freeradius-client-1.1.7 | 1 
                      gdb-15.1 | 1 
            gettext-gnu-0.22.4 | 1 
           ghostscript-10.04.0 | 1 
          gitlab-runner-15.5.0 | 1 
                   host-go-src | 1 
host-heimdal-f4faaeaba371ff... | 1 
httping-0e26c53d5fe504eb720... | 1 
igt-gpu-tools-0ee4074685c1e... | 1 
                  jack2-1.9.22 | 1 
               libdeflate-1.22 | 1 
                libdrm-2.4.124 | 1 
                libglvnd-1.4.0 | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.6.1 | 1 
           mediastreamer-4.4.8 | 1 
                memtest86-7.20 | 1 
                  mender-3.5.3 | 1 
                netdata-1.33.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
             open62541-v1.3.15 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.40.0 | 1 
          perl-net-ssleay-1.94 | 1 
                    polkit-125 | 1 
               postgresql-17.2 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
          python-tinyrpc-1.1.7 | 1 
                    qemu-9.2.0 | 1 
                  rt-tests-2.8 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                  snmppp-3.5.1 | 1 
                    snooze-0.5 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                tpm2-tss-3.2.2 | 1 
           uboot-tools-2021.07 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.23.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/41f2faf2d50f4094f1f9615dfa32f846155c5707 | ORPH
   xtensa    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e9b0a411c8e116dd1dad629c15cd7e1c438393f8 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1cef6374a1d7af94eb886004e17197afcbcf780f |     
    i686     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/6cd676202f9b430b3bf06dd7facb89498103728b |     
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/90e5f6c584d0efd1f96f5d68f21054bb7939d040 |     
   xtensa    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/fd07512bcc102a11fb3f79d0b3b8d44c16406a8f |     
    i686     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/781ed89db45337d7b665213c62db3b4f8eaadb55 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/31d9c03459852107489e4efb59c37bf2aba660e2 |     
    i486     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/af4b6ac8e7a1ee43c1f8122c8300cf3678d097a2 |     
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/9942c71a68f0b1108ddfeb7d3fe35253184b7203 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/53c9d353131a2d1808544a9dc7c37e801afa5165 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/3acda3e5378066b08890879a91159d9873c7ba8b |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/aceb28975ab8849a1b418e12b132ff0c2e5b2c97 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f6ee4cda1c8b8333bb6e6974e55efe718a9a9970 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/be956ec20a2c8b8f118765e3aa8304d0131bf393 |     
   sparc     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b64ae19099afa1e692dcc1e142a8eee71a4444e0 |     
 microblaze  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2afd87cf57aea2a79d0f3f249317e5c202ec37f6 |     
 microblaze  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/508a49bfbacf5f4bf90afa709e9406182ff3c0c3 |     
  powerpc    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/601ec14bc33583c64404886f4da26577fb08bbfd |     
   arceb     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/b7969896d2e493fb307ac4b4d7f35386d1dd525c |     
   xtensa    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/cdca5c8a28724d3f57f71692af686071d94641da |     
   armeb     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/f8975ce655291d45ef259ec0c81f729b535590d4 |     
    i686     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/15a22683888f74866aa61239cfa827f0dec9b408 |     
   mips64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/38ebc5161bf15737a713934f2514b16f3eab819e |     
   sh4eb     |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/219836529719a179d4486d139bffcbf69ec3fddd |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/0b6de864c95cccc15897b583183778d699394cc8 |     
  riscv64    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/f69b648df2bc89a5aa3e5fc340fe28abb6ba2aca |     
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/8b24628075955ea29da9615d796b86300d275cdc |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/f25a8d3b61d39c81905a9b9d38269d197bd5c0f7 |     
   xtensa    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/281d816f3773cc642eccd71901c62a28dadebc4a | ORPH
  mips64el   |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/a08a943f83d694c9d2d996f586856b83c05649eb | ORPH
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/82a608cd6595ddc7887a0f9a9e5bf244c636cbee | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/8d8b32086d6964929abb8b0bf001105807dcf629 | ORPH
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/4e4e69405a4cbc6f0e8a3c535e0e0a368d3fa820 | ORPH
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/6eb68ae5fabe7a5d7908fe3ab849b045e68d3c20 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/13f0fb664a21d952a51b9f06cebad1401814dd46 | ORPH
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/7008f1d0d2932aa826958376591d4c29d1207d6f | ORPH
    arc      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/99d6beeb13bc833ae04e29e1d6dc0c62ef43ab39 | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/78539ce134214d5be24b27e5c2314031a847c77a | ORPH
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/54ca76cb1995a9fe88730362258d79777b5c510f | ORPH
   sh4aeb    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/2e8f51f2f26c997123cb756e5e0a304fe6af6134 | ORPH
powerpc64le  |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/7f136dd8156bccdf27d59dc438be05f41bb3cff0 |     
    arc      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/683dd95c90d40498afd67a8ba2965348e1336705 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5e7e874ca3be0cf3b049cb7f6f96fec46f57933c | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6814783f1741b1474c94fb9d757b1d1f9609bfeb | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7f75ff1a0f3352e50ba0d0b8de41a0ab6c19e4b2 | ORPH
   x86_64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/56bf7480aa73f9a3d5f1d24529d3abed7f7c2fc1 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/b4959c50e649f06002bf3bd1bde61d657e04fb7b |     
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7a58b7ace70afb1979cf652ea46af87362921f2c | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/784532f0879b593bc5d750a1b95854d420bb107c | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f2edd74828a5ebb4edff9b9c7a66a74e4fd24aa3 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0484d41d70063fd029b330354dfbf34afdc1e632 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d35bcc5959f75d214ce45eda4f4b4aa8a0613360 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0c747095db11acabcf58e77159e7db1b690e4370 | ORPH
   mips64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4d620df39fb45d88173bdc457e31122d99c4185f | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/2d9517d4b8f0dc7cb1048a99acd8d8c2cae0c52b | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f4dac85479d8edcefc1a39b2e26ac79cdcb9a86c | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8de95987b4127c12912f1552209ae55e01c551a8 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/36f2e5d3d47100973fbac8397ac79392a46780f2 | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f8145c6a6e0c2a2947014300f84ce28877dd3ada | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/dd991d9706ecc1c11c1f1ac2e45168ae5f13ff3f | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0d337af4d2dd4685d872c3fd59c97bb6a8fa34c7 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/06aec8c645583bf17c12f2cb311ef9ce0bd2cc35 | ORPH
   sh4eb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cbbf10db99be8721a1b8331138f1948095651616 | ORPH
   armeb     |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/e9d9d9a27d59cc35ed18b10cf92ab5e0d864081d |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f388f0ba1d63df78b65f1c9ca7eef7b4b87d50b6 |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9d4848f8db0e54a55277bbcd5b72f9738aebdf63 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/4b2ac821fb447374e7b461b761e64aa5e1383b9f |     
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d5db903db5421d42358fe1a2b26bc003032e0e27 |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/fd15a21b48e2734788f8430fe084eff73f2b2459 |     
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b3d7cc7821ca78bae33ac308328f8d5a6f83b38b |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1aea51ba47289acbb1f93e3980611962d3ee9e43 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/6946a4e73d045279545e5a578191a7bf0d9d666c |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/38ddb580eb1a7282875a27f1de20c4f039506c34 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/b39675f7c957e0cb5727d9d8184871e9dd5cfaba | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/a6b57d10055ac8701156025f29d22c6ac1d9580d | ORPH
   mips64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/df240004a58e6981692e5c9bb12bf04882d2453d | ORPH
  aarch64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/27a832a1bedd86b1fcf0e86e10c55df8d5625996 | ORPH
   armeb     |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/43b12fa483ac34b2fe36d209d032cb08b0a341c4 | ORPH
 aarch64_be  |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/e6507c15f06e829cc2ebe0111a3c549487802e21 | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/472b09ceac36fb60037c9efb735d01615fcb8042 | ORPH
  mips64el   |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/d222ce5482cca0837373d22461c9a4c2aa207443 | ORPH
   xtensa    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/c388ce517ee456b7bab3cacb1e80aecf49b0a6f7 | ORPH
   x86_64    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/980bb6cbc91ecf20806efc606f97ef54f168be12 | ORPH
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/bde648c3e8f8abeb63e7d746f2fb58ea373dac04 |     
   sh4eb     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/dc6fded3dfcc552893f3fdcfadf305be32a1d2ef |     
  sparc64    |    freeradius-client-1.1.7     | NOK | https://autobuild.buildroot.org/results/5dac8c6502b88b33408b334c4f62f2f9ef1010d3 |     
   mips64    |            gdb-15.1            | NOK | https://autobuild.buildroot.org/results/10219442bce5a4cebc60193a7404f898a33d6e01 | ORPH
    sh4a     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3c3d405fe41f12598e743c24812fb5d7ff7ea560 | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fe6b815c585c21a11547a949266ce5939cb400ff | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/450a81b677d0fdd47b186c57bd4a6662afff68b0 | ORPH
    arc      |      ghostscript-10.04.0       | NOK | https://autobuild.buildroot.org/results/31b364d38ceeeb4b2f4e20a4724bca4d06770c80 |     
powerpc64le  |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/4f55e7a5460ce6a2fae666b16f9a73a29604a422 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/b5999a3a8f5d3ea9014cb2e7c3d47876aa4c7cb5 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/2641c80e78cbf3673a0f3a85c41af06e5c5eaae5 |     
  riscv64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/9bd6ea3af43a3de9709dd6211dff6db9ca47dba3 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/4c66e8deb3206c8d4ed9d4b2f780b3c35740011b |     
  aarch64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/416c1fff25be803ccf8813f63317b57dbbadf5fb | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/34a6de6d20a28c0c1bf861edba71ac469ff9102a | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/60d6e2d26ecc5e6e118ca3ae44a0d274ed744470 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/530ff1f7d8f4ef060f9f9ed325b401b12ea9db4e | ORPH
   sh4eb     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/91cd6a6d81fd18f9bf66cd2fc971ce0ad9a9cbeb |     
 powerpc64   |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/fac1402c07917649b8170ca8afd38badcfede280 |     
   arceb     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/f00a27137832d7135ca33cdde5b2cd19b887e510 |     
   xtensa    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/fe0d1b901a6afdcecab1fbcb35d7c8a403e37130 |     
   mips64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/eacf5118c5175acaadb6d31b365bf2e3b14352d6 |     
  mips64el   |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/12371b99a4979e9caf805c344f2bac63b8fa74ed |     
    mips     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/c766674bdd580488e742504689d38480f7258ece |     
  powerpc    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/e6a02ad0cdd6e6332df5779fbc88ed21564a22f7 |     
   armeb     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/5d0aab10255bbbd007c5683df56f64e0fe4e038f |     
  mips64el   |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/f8d089fcec8b3b83e12d6ff6ad21098ea3ae0764 |     
   mipsel    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/00c853734dec5e810756ef443e3f58ff1b4b35e0 |     
   armeb     |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/cbd0e38a346ffdba90de6cfaa338e8591f324a2c |     
   mips64    |          host-go-bin           | NOK | https://autobuild.buildroot.org/results/9179adf945b739c00eada492c326f3ff41e71ce9 |     
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/0b60b414f80b807e9fc1ce604f05fcd08b706a25 |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/864003e1005fcd847b4ec3bd94316638f8f56553 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/bb508690c68f3e722619c64cec4cd327e37e395b |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/7a93947813e388a7761ea623d6dcc93b7ab1c366 |     
   sparc     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/692fa6d67e66fdeeae4140b40cf2d3ce27bc590e |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ded417d6e27312c5403c5cf90cc6220bcb1ff0f0 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/1de6bd92e1e2284d90d85e293b118b3dd02f6823 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bf4176f930158b53d4eef7fa2cb00cdf429458e7 |     
   sh4eb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/96959ee12815ab3e1c8178fb68bd60aa5524e068 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7ace01d63e3a9040c1b27c9ef7e1925bf31d9b01 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/3dd28681e8cdec5881032c4df38696ef0e982a80 |     
    mips     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/14365d64fa0721bc5b7417c87d9773195ca1d407 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/bed4e1a7ff6507a79e26186799a0bdb9f31ee781 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/3ff89b2b52113e1c524ec560bad18cdbd3ebaa12 |     
    mips     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/c8fc441a785fbddcda1aadb96f3203faa5a7ff7e |     
    mips     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/72983cca7f059cbf4c40db387f87034af62aa19e |     
    sh4a     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e414962f9449e611ae4300cc0fced419c61f85e8 |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/77fb7a665a1891f1a0a97beca511fab965acb8e3 |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/31f9a64dfc873ef3934cd9fcd1efbec850731623 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/13d21f99d1f9523e86eea09ef23c935e872e46e8 |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e067e269b3acdc8518ff66ba244163b4ec1ba92c |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/d7f382532b3ca9b5e069f18a7d7b787c04ebb055 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e2689ccc0da7da20e50a0227eceeea0de5fd3c33 |     
    sh4      |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/99ca732ccedb777fab7b51d3fa96a5a7cddc6a88 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/66870370a88df3b4c30461de1b29e815d431f5b1 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0ae61355e6e11ff4222ddff5ddf1335d90da1836 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/642354dca4c309919c3a4d845d96f7d80f43db84 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/aa397aa309c781aa40e63c4e76ec3632fe205be6 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/caf8edb1c9e3927806d6cd208dfd6120326b5723 |     
  powerpc    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/f8fe2480c52dd0d7ac107b5db6707fef0bb084df |     
  aarch64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a520538708b04302a86f72cbcc04eb2cfd714966 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/32ea5f173b48f790c3c44981da6f0e3fe0759c14 |     
    sh4      |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/eb638f4af1afcfa7c8b069c964206f377490e900 |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0be2f59c3dfebcd57b0c42150d5ac96bda7b9b5a |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/c439445e0f25d12f5ca122261fec4169d740ae11 |     
    mips     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/9487b407df72a36403772644399bfa344771908a |     
    i686     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/73aa8f51cbe88f5a7b01b2dcb9ee1807ec73080e |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/81783d95ab8091577350ba2cb62960f562c0d734 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/9d693a512fabbc3d9eb88c961ef55eeb381319b1 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0f2239c44e0353c52c1502a51392bfed1f02e37e |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/7f5875b69ed8d7c6f76e71eac20fc9e7119df513 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0ac0e4d2c679a660455d7295b76ee7b224ab1d83 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/5762c26be92a292189058e4cf009b13f821d351d |     
   armeb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/60e6211ebe58f1a5d7504d7a74d19efd805eb0fb |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/5ad8b9f107d9fa68ae53ecfdc5076cb43ed6431d |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/32197b633efc1da372d545359c458daf3605ca11 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/09815c0529259e7c5dc653d2f22ae574ecd3d669 |     
    i686     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e8733bdf78d8e9448988c3d300c43a47f62375d8 |     
   x86_64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/ca2ac7ebde0b9eddbe6bf3f3599347a240ab0067 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/ecbe558f9cc3f6a833e51b4cea35e9586903d564 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/7f255c0ab218605ce564ce9abe8114c60f2e04a3 |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/ad18419b42bf8e9536346e1a31af8a7a4f5382fe |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/9844e9a23d883ff4bc96d21dfc7677df448f1d83 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/100d4a58716a03c587609a74b18e51f8f0441c6f |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/ec53c5d6e1f79786dd91bf7f183e968377599094 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/5c11eefb8975ae7b2964333ece09658fbaa21380 |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0eba90d0b6e89b8984ca642d1944c6794ea2fa7f |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a4d953417a28087a57fc0ead61f44e31787fd839 |     
    mips     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e6f536eec1a3ecba8cfdd6bedb19618190415f87 |     
   sh4eb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/1f0d1f489fcfadb3319affa054db5fd82a210ab1 |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/81905e71c34a620e71bcb19d19b856b8ee7cfcb8 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/46a98404839a3c8fdc16a63a7f8adb930bb9b791 |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/fa7ad227b3f04449bf70186a72c8f3b432ceaa52 |     
    m68k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/dc94aa7a76cabcef1118df2268e0e4ddd78ae017 |     
   x86_64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/11bfaa87058a73b6fd96c6a1bd802d2feeb725bf |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/834d0c0c00c611214097383ec9dfccf457c3955e |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/0d0f87d23f57d71e45a26b211c05e9bfcad4451b |     
  sparc64    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/cb554f0bc5eca7148961e4fb7331d7ece93dbc29 |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a79cbd646e891b5401985baa2a464362d8eaff09 |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a0537d559dd711b41742ff8387dc5aa0f1891bfe |     
    or1k     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/4107695b85b569e651b0d73afef737fc5242027f |     
   mipsel    |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/f8995f05ee24a0cdfbe6815181948c38f38fc36e |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/c4b73245be202b8cac18f993330dd3661afc9eed |     
   s390x     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/2de7f130ec4f91adb5963d639535bb142d311684 |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/a207eae26594b048b1a95cd01c7cbe3c682de567 |     
   armeb     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/e7384529708ffaab12a5e3147952a4199512a3fc |     
powerpc64le  |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/f7715b6d73f8ec66264622841ad3d49a6822876f |     
    i686     |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/3a7db80465e765aa2799e9c096b3176326cdafaf |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dba0e5e3a2984b0f50241d2bb2125d78517c14d7 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ffad028a3cef389484898a563c84d224d93874c2 |     
  powerpc    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/cc2bd1f05f1c159358cb19fc24bce11b7b1d2499 | ORPH
    mips     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/f98c28c8ae9ceec9878d7b3287d0333064fcce62 | ORPH
   sparc     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/413d7b27a859e9b68cd07f11f7bed1507978a453 | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/32efa47eb07676f4d3611028dfc116230fbe5cec | ORPH
   x86_64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/24365bb37cc47be811e041d6c56248812774a697 | ORPH
 aarch64_be  | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/407578504b0892add5021803a70e8313ccc6d31f |     
microblazeel | igt-gpu-tools-0ee4074685c1e... | NOK | https://autobuild.buildroot.org/results/64011ea9d2c85a6fdbc9164443497351e9c5acdf |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/375122ff3728c6c88ee1557c8ef0d325c2a44bb9 |     
   xtensa    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/6e20b332711380a667a066dd7a0c88d4e73cc9dc |     
   armeb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/6f435dbde41ba20182cdffff8f5c8e9e28e6e031 |     
   sh4aeb    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/5c1357e4b75934553d9fe20331b3734d12511202 |     
   xtensa    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/b6d19f6c475e1b1400f310d243259ea57f44952e |     
   arceb     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/0381aaad2b3ebb410fdbc6b5c7db34e25c9f5feb |     
  mips64el   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/d6f46b3f64a2cae23ba7c2b0f0198ddb2a99f6bd |     
  riscv32    |        libdeflate-1.22         | NOK | https://autobuild.buildroot.org/results/c4337eb0c7140946586dbe5512a19be8830cadb4 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/97760d3fe50cdb47810ea23ca31a8760ee86b829 |     
    m68k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/8a1f923f93856b8bf0fcecafdaf97ca8e367052f | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/488e8a5244c3ca0e98dbc08b702185d9649d0b97 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c447f649bd66ac2edcd07edce6505ad17a61c3f7 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/1df5e3336e391055f858b35abf83d1e9c47c69f6 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/297554a67a798c7b603dbde51a80967a90f117a7 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/2883743b6d01b64241953b8491d7bd986e3b9aa6 |     
   mips64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/23e31135402aedd6f4d327ea33f5a3c334e4856a |     
   s390x     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/d4c4d8b1557914fcf429fce15cf3e62c7eb16ade |     
    arc      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/9a6e26dfed074f703f834909658df12f5cd1f1fc |     
    mips     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/aa011228be3e31a53d9484297c1017e4a17e6987 |     
    arc      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/714bb34d40cdfdce6d5d5ee2705982e942b414bf |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/d8890864890eef49af4d9ada943ba09eeba16ce9 |     
   mips64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/aa841abf747be1cd646857da9efdc6dec1436c06 |     
   mips64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/255001c33935d207ed4c6e5c3f87a7f58b5f2f3f |     
   mips64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/c5c426f23524aeba26bc2d15b3baa1f42e682951 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5c8c6c2030168aee280f2f236086b0886869b2b8 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8a837078ceb2bc4a66e44d0acd7284e49f7afa6f | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7020a97c84d9c7d21efa7ff8ac253bb0893e6756 | ORPH
    m68k     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/187426263af6c030b4e9acf493b216e342783cd9 | ORPH
   mipsel    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/4c61d9d958a6817618525eefa525c171ada77da4 | ORPH
    arc      |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/91604d0bd0451133e19596d81b40a879c73d9c88 | ORPH
    m68k     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/16d966dda4fc60d5fba30856e082c84be0dab7e0 | ORPH
   armeb     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/97717f1f9ce915871a2e42bdb037da0f21fcf18b | ORPH
   armeb     |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/fd27624af34167bd4ba283a76e034839f24da3b9 | ORPH
    arm      |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/11dfa1070332c18920807228324e5eb8d13e7636 | ORPH
   sh4aeb    |         linux-6.12.12          | NOK | https://autobuild.buildroot.org/results/4dd946a0ffa54fdcbc1983fac889f6b742abc239 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5f2c5d0eafcc24a52f67053e3e43aefb60b076f8 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8b966bbb9b8c56024ff7e7591dadd623a3a51f2e | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e2b1e4ba633d263b1b5db99f50c12ebf1bae1a64 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/98ab94854d60b5e7c6a1629f8a5f9c6f2a3cfaea | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/fbca131b77d73280ecfca83053a88e84b9ee9aac | ORPH
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/353d45362738fac0685f908495b12e9ef2afb3de |     
    sh4      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/7abd86e24421045c9b03cb8b4d170f37eb53a6b9 |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/75def2bd98335b6611a00099e1e3896e75ea0b73 |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e37e340fa5b73e8ebcb413d5209701f6ca29e906 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/88e8a8621eefb789bae6e1a4685eecd3bb6fdb01 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/c3ce0b9a43f54f35df56d0e0e109fbcd8795de28 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/258038e5111e8efabbe6bbee37abf0a2cadd748f | ORPH
    sh4      |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/8e0f739974d823cc1656f62f2630541fa3051199 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/776a88e8487d09c90d1521b56b486fd4133543f2 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/3b9dac83c028d38a5b9d969667d1924d1939d838 |     
   mipsel    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/3cd0d4127c13c6092560942ed9b41c722d0a22ee |     
    mips     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/ea998ffda2050cd55ed3f826403e2346ba671035 |     
   mips64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/61024c00085480302b5e8f2025f5e0392139d103 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a1abc8a9e0d10b6a2736775cb74c6f9e38a31ce8 |     
microblazeel |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3435d8f457b25c186eef91dbc477bdca761c32e6 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/ad9377eacd4598f7c14a8b3dc4befbb6bb80c82f |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1a086531a0573d83f9500f30fbc6ac1406fc51ac |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f57765d426048ed76cabad6b20417812b1d365f6 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8b286da4d01e27497e8b501c3c04219659138690 |     
   sh4eb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/cbd98581bc616524a4b4893e90b64298c193ab69 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/98c06a96eb060ff22cfadb7a6e4d62bfe93f328e |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f8280adcbedb1c5fd2f8127b8e910c4427cee94c |     
    or1k     |         netdata-1.33.1         | NOK | https://autobuild.buildroot.org/results/9930b88a315f92df35e7e00541f940e058b92fbc |     
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/274c45bafdf15e1e75f8b9fb6a6036ac6d1bac1d | ORPH
   sh4aeb    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/037873a3835967ca28a0dc8f983af3ae7066b081 | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8b91f88e58a28fd6aa96a53d738d7018d70c46e8 |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a6d88973ba66878bfae60c6d4866368371ceb778 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/494558337685dab35f5b69033ec8fa6f5f76ed65 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5d07d05d9f53ea1eb87ed74a209ed3288893eb6f |     
   xtensa    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/35fe5dcdcf88cb0dfdfadb84dfb7cb3dbbd7a053 |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/2075d770cee6cccd19bd03b9aa9e3aa905204cce |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/bdbabcd599322a5aed303d5e86e820db87c39ae9 |     
  riscv32    |       open62541-v1.3.15        | NOK | https://autobuild.buildroot.org/results/dae1fba79cbed385eca2c09a11cb9d10ab416ddc | ORPH
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/8915c38c55d52ee194f39d2a13952e23876d86a0 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/f3c9783d7a128b90f70ba9e1c1b0e1639b588d5b |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/a53f7e006d06c3cbad801ad2aba1b9a58c4c99f9 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/de35547d72c0575e2549f1795b64394d74887df6 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/d9798a7b3c9c06c113daaf5814484e0e9ff17205 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/4191aa5b5ec2df1e216da35ca5e97d74875d5fa4 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/d93ca44248a7db035543d9abc7fc36704f3ce350 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/354d545278d1961fa3c6486815f8454188950548 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/75ba8c03eb465726e71ac00f4d1277ce8379731f |     
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/2c14cc241a0d58ffe4fc39abb7042ef8b2df0fea |     
  powerpc    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/1ad2ac0180790aa0bcc8ac7ac63b18da31fa6ef7 |     
   arceb     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/5e15b17e3790bc27807a91724f807f925818699a |     
   x86_64    |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/4cd79ead62d2c70048d68f10f164f20befab17da |     
    m68k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/58b9b39f490aed72591bf4d9f86df80d8c912b3c |     
    sh4a     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/8dbbcd0020124d5c8521762eea290d8b9d4a7fdc |     
    arc      |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/a98926d166049f74ae8a92af6ceaf49c7cc18d0e | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/a4386567f0953312261d4825be58e45b3807eb07 | ORPH
 aarch64_be  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/8e47efec16580887de8acb5e960086b6939e7284 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/4d60236992c5d0a1abbeb604c9eeb375469cbc09 | ORPH
    mips     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/97ae953f1eb879deadfa48421a14aaaebecb00a5 |     
 powerpc64   |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/380cfa0dbec6da4654f816d1b1e3a99fe89725ea |     
   mipsel    |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/4b5e421388c4df207738f17c1a997001f8abda06 |     
   arceb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/39521d242669fa66f8394853e66bc587eea64910 | ORPH
 powerpc64   |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/3d6570231216a0837a9c64df4886439e3ee6dab5 | ORPH
   mips64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/8ef143e8fc65624730a826a46aa26ad0f7898172 | ORPH
 microblaze  |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/a8ff3bace66ba11542200d41a5be97c68491c6da |     
    arc      |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/56d6c05d53bd6f482544387066a8f56e9c4f836f |     
microblazeel |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/dd081ca3c5746b980b0bcdf1f12b1a26c6b7ef86 |     
 microblaze  |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/177c49102f2b57a6370af475626ee16f39774de3 |     
    m68k     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/149344f08c026acfd3a33ddcef29f6712767b434 | ORPH
   mips64    |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/805f952c59a6664763080f852e5d7ec76289e1c1 | ORPH
    mips     |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/4b3d82e6d1f8025b3c6e680e3c209e3ca5b7d74b | ORPH
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e8efa18920bb209a655a887c803d03ae252885b4 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/1b33a992209f8de32e9597c4314adae1d0df728e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/92a02b7007657c74fe96f53a8536c9776e3bf41e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/7f51b554f6abd56850a2298d79cc05ad6d42eae5 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b81738634243b437e07506014ad99eee18f5f321 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2a9c028ae5b8c9e7cb6ff7b9b10b1cb19fb206f3 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/d5411827f35749bec9e0e845fe64586745757527 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f3835b35b1d09a3204bf4d163027321882193ebe | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7d4c7cf97f70bed18fc9e593c3f5b38f378fa642 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5fda9ca4bbb0bb633fb63a7e8c6d16eded7bcefa | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/81a6fe53cdaed1fc25b9a6fa294a42102e869af4 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/660a25eb7d0948bf3659923e52db3030d55aa0b6 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3eb476dcf0cac620bfc647ed6460a522b8709a1e | ORPH
   mips64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/181625be8f0cca66cc5b77d97b2d896447d7201b | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/9aeb4270192e041602dc697e549f81b05dc4853b | ORPH
    i586     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/334caf0f32ed08ada8a44114f3cd0318548c9137 |     
    m68k     |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/d886eec13f177e717771aafde49d511d1987c89b |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

rtl8812au-aircrack-ng-4a983... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | rtl8812au-aircrack-ng-4a983... | NOK | https://autobuild.buildroot.org/results/89d7ef3b95f2d721449d22e3e61eefa42978b91b |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
                   perl-5.40.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/52d639e5e97e4a98d126f0fd500968dc7df556f2 | ORPH
    m68k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/2ba735e482c2dd6bb60993e8434217da88d957b4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
