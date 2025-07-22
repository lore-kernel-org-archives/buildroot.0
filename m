Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F36C83F25
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 03:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9C58209E;
	Tue, 22 Jul 2025 03:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JG1CeHVJuYTU; Tue, 22 Jul 2025 03:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3115E839E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3115E839E9;
	Tue, 22 Jul 2025 03:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3AECDA
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 03:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9CD741090
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 03:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYRO_LQT59tn for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 03:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81DA9415AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81DA9415AB
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81DA9415AB
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 03:14:57 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-607cc1a2bd8so7975925a12.2
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 20:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753154095; x=1753758895;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kSFw6+aE3TA7mXC3GGl3vQ+WAqUuWUzWLLRZdVCiGJc=;
 b=pwFFMNMYX/H74GWiAElIy+KuWXt3OZzN9SFvElO4sZfj7aIiTaBXfpHm4OjsVVvKhP
 L5EOqDNDYBwJCFDf1rhqPclgrtR2fUAB2e9KcjrZXHyZaZG9R1FwMHM0+Rbei5I1EvN8
 RlXBiMybVTEu2ngPIaCEpsZfqBTXKIF1Q7wKMp5osdh21fleRy9dK1A0ZuHzJOdjpe9E
 tnGaRhsC+6jc9Ix3cMA3n5VPNfpXK7SH6EcAePJlR6d8ZVv31RE7aUtbEiBq8dWyqHCP
 bavLJPA0OOKDAxOJaR3ydpLypmXZ2TYkRC7rOQ42C8hWvXPFbzM3e/Qv6lJbGWKfWqPB
 nc9g==
X-Gm-Message-State: AOJu0Yw3PSVx1ZSc2fkdExyOTmCFsOixhOhqrOq3gqDEgXstDeNbEgKj
 iV/kNpbWvgtauQOOS5ISrP4vRufVwYNecJzrp/phJ0Jz6nDswE7BFrjQzxgBNw==
X-Gm-Gg: ASbGncvvAbU0ji6IzbmnNU1TBG9FFTf2TSoo/CZmAMWJkuCcJc4k/THHN1Yf5vcY5ke
 TgkLeyY9xZOeFtPcwJK2uX62HzyqWpzOgnT5VHk6z2T1SMU77n91uAvbjK+c8Ak1aJ7SaeNYfnh
 TRVKw8cFT6mbOyYC2xddPpWk+oKAsNGqBPtdKl5r5zwIOVWwUltHPPI3d01I274ZM8u9R6Y49vA
 qRweN/erYY2dytrF3ufFzWf4hXTdsgjz6Y58fF5wuU2gSUdYbDJ9gBeUXF8sjz+f8Q+lpLdzW2O
 duNwuj9yMlecu1BFEjgshZOVxUKNUbVAWUgNeZ2rjl7SvL918Z2XIzwPwqx5eVV+QU2CJK4JiQW
 HhSU+OCTvR59jH5KyiD4Y4yGl0Q==
X-Google-Smtp-Source: AGHT+IENZc+j3VlzZtuPjrvo2JdUN1KaKkUTXDl02cvif2O7u6MQwIGPThMh6lSuj8wL50sFVMQOcg==
X-Received: by 2002:a17:907:2da7:b0:aec:f8bb:abeb with SMTP id
 a640c23a62f3a-aecf8bbaefemr1232326866b.42.1753154094811; 
 Mon, 21 Jul 2025 20:14:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca2f1a7sm779099966b.91.2025.07.21.20.14.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 20:14:54 -0700 (PDT)
Message-ID: <687f022e.170a0220.27888d.1e46@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 22 Jul 2025 03:14:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753154095; x=1753758895; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kSFw6+aE3TA7mXC3GGl3vQ+WAqUuWUzWLLRZdVCiGJc=;
 b=S+oYCwJbbGf88fgGw2CDNBzF8AyMB52ElcN2Q/nZKbeSOj9joH5gJzx7SXqeqfLWGh
 4fWULtqscXziTqTYQQG4L9Kln40GHuT183V3CKHYlZdJ1B0wcTlrQheBaaz3gRfD64M3
 azMXk/XAMj0IR1hxGCfXb/Aykhb03WwPE5oEI7MJlbepenYGc56xPs9pA6MxOmS2Cj72
 FGB98i3l5AdTKKx20fXO92l+3HycfiPUmI4hhD5wRLcBFPSSbFByR03N6VjMVVXhhUFq
 0WKpZmQNGcp1dNMtWj3WT5n3qKUiVk5UBqmk84qEF2+St3wFZ+bTM7vc8I+UIaa/HWZ4
 nFHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S+oYCwJb
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-21
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

Autobuild statistics for 2025-07-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  6  |  0  | 12  |
  2025.05.x  |  4  |  6  |  0  | 10  |
    master   | 18  | 424 |  1  | 443 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 41
              libselinux-3.8.1 | 20
host-binutils-arc-2023.09-r... | 17
                  cjson-1.7.18 | 13
       host-gcc-initial-14.3.0 | 13
                    yajl-2.1.0 | 13
                   avrdude-8.0 | 12
        host-berkeleydb-5.3.28 | 11
                       unknown | 10
             batman-adv-2024.4 | 9 
                   perl-5.40.2 | 8 
         host-mariadb-10.11.11 | 7 
               host-vde2-2.3.3 | 7 
        liblog4c-localtime-1.0 | 7 
        b43-firmware-5.100.138 | 6 
                   bash-5.2.37 | 6 
               bctoolbox-4.4.8 | 6 
                       cfm-0.3 | 6 
                  linux-6.15.6 | 6 
                   cvs-1.12.13 | 5 
            gettext-gnu-0.22.4 | 5 
         host-gcc-final-14.3.0 | 5 
                 openal-1.22.0 | 5 
amazon-ecr-credential-helpe... | 4 
             dahdi-linux-3.3.0 | 4 
                    gpm-1.20.7 | 4 
                 host-gdb-15.2 | 4 
              host-json-c-0.18 | 4 
              host-rust-1.86.0 | 4 
libdbi-drivers-0bfae6c43134... | 4 
                 libsoxr-0.1.3 | 4 
                 expect-5.45.4 | 3 
  ffmpeg-n6.1.2-27-ge16ff06adb | 3 
glibc-2.41-5-gcb7f206537240... | 3 
  gobject-introspection-1.84.0 | 3 
host-am335x-pru-package-5f3... | 3 
          host-binutils-2.43.1 | 3 
                liboauth-1.0.3 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                    mpir-3.0.0 | 3 
                  prboom-2.5.0 | 3 
          aardvark-dns-v1.15.0 | 2 
                   atop-2.11.0 | 2 
                    bat-0.25.0 | 2 
             berkeleydb-5.3.28 | 2 
          chocolate-doom-3.0.1 | 2 
          cryptodev-linux-1.13 | 2 
dbus-triggerd-ba3dbec805cb7... | 2 
                     ed-1.20.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
           host-doxygen-1.8.18 | 2 
       host-gcc-initial-15.1.0 | 2 
                  iozone-3.506 | 2 
             libapparmor-3.1.7 | 2 
                libdrm-2.4.125 | 2 
                 libiconv-1.15 | 2 
     libphidget-2.1.9.20190409 | 2 
                 libspdm-3.5.0 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
          linux-5.10.162-cip24 | 2 
                 netsnmp-5.9.4 | 2 
               procps-ng-4.0.5 | 2 
               pulseaudio-17.0 | 2 
                    sdl-1.2.15 | 2 
toolchain-external-bootlin-... | 2 
                 xenomai-3.2.5 | 2 
                 apitrace-10.0 | 1 
               asterisk-22.3.0 | 1 
        balena-engine-20.10.26 | 1 
                     bc-1.07.1 | 1 
                  bcusdk-0.0.5 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
                   cli11-2.3.2 | 1 
                 coreutils-9.5 | 1 
                     crun-1.22 | 1 
docker-credential-acr-env-0... | 1 
       double-conversion-3.3.1 | 1 
                   dvblast-3.4 | 1 
                elfutils-0.192 | 1 
                    ficl-4.1.0 | 1 
                flashrom-1.5.1 | 1 
              fluent-bit-4.0.3 | 1 
                    gcr-3.40.0 | 1 
                     gdbm-1.24 | 1 
           ghostscript-10.05.1 | 1 
              hackrf-2023.01.1 | 1 
            host-binutils-2.42 | 1 
             host-flatcc-0.6.1 | 1 
         host-gcc-final-13.4.0 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
                host-odb-2.4.0 | 1 
              host-swipl-9.2.8 | 1 
             igt-gpu-tools-2.1 | 1 
                  jack2-1.9.22 | 1 
                       jose-14 | 1 
                 lapack-3.12.1 | 1 
               libcap-ng-0.8.5 | 1 
                libexif-0.6.24 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
             libgphoto2-2.5.27 | 1 
                libkrb5-1.21.3 | 1 
           libmicrohttpd-1.0.1 | 1 
                libnss-3.113.1 | 1 
                libsepol-3.8.1 | 1 
                libshout-2.4.6 | 1 
                       libsrtp | 1 
libubox-3868f47c8f6c6570e62... | 1 
                     libuecc-7 | 1 
         linux-headers-5.4.295 | 1 
                   linux-tools | 1 
luajit-a4f56a459a588ae76880... | 1 
                 mdevd-0.1.6.5 | 1 
                    musl-1.2.5 | 1 
                   nanocom-1.0 | 1 
            netstat-nat-1.4.10 | 1 
                    ngrep-1.47 | 1 
                   openrc-0.56 | 1 
                openssh-10.0p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                petitboot-1.15 | 1 
                     pound-4.8 | 1 
procrank_linux-21c30ab4514a... | 1 
pthreadpool-560c60d342a7607... | 1 
            python-yarl-1.18.3 | 1 
                ramspeed-2.6.0 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                setserial-2.17 | 1 
                     shim-16.0 | 1 
              skalibs-2.14.3.0 | 1 
                  snmppp-3.5.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
               syslog-ng-4.8.1 | 1 
                   thttpd-2.29 | 1 
               valgrind-3.25.1 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/1dc240f8859286fd8fa779b2a21d6103ef7fd67a | ORPH
   armeb     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/179a9b6bccfdf94c03aa247534dd46196ce71f0d | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a5ec607c4beed516de4077e4fc5aa89425c27382 | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/2e3c9f2a9eb379ee16f1de1f8dcb3b10ba7b1cf0 | ORPH
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/711f2a0248ebd0f969d3b6da2050345d4389deed | ORPH
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/9a2dd0655f2431f1b380ecbc11b39b07e01a0f5e | ORPH
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/5f2bccbe77e33e40f3a33f7738726fcf8e158372 |     
   x86_64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/a7468f061852806d0995ce31872bed4111351777 |     
    mips     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/f0fff1270e760ae72d5e0e86e327e83ee4ae48a4 |     
  riscv64    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/58e14c444a0d0ffc5875e46fadc5d683a673f615 |     
    m68k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ca3c93a2c4b4c683b4bac50a236ec757919d07ef |     
   mips64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/5b9206334d14cf34bc9a29e06797296e7e4b6243 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/71917034f279972a596243faf11850541245f39d |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/7adc4e492ce3c87c9abcaca02bc7ee2467df3025 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6f279a94fe7f29bd50a9bfb2dbb6d9e37200048c |     
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0736bc911d94f1a9435d553ea94105f1cf1fdf30 |     
    mips     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0e0779b29ee3b385cca5fe444a9246d2b68b3ec0 |     
    sh4      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/eff4a5925ab9201f4937661737c2470f123a90b0 |     
  aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b406bc1c48358611cfa9641233d90186e647d063 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/d1133884434b923cd2905bcd6f6f9635c9b3f2ec |     
    m68k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/768a8302c6097c64bffbd02e57639a54e2865ea3 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4b8a14b69d675067a46eb9be800e13ac0928f1b7 |     
   mips64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/09bebe817c86875784dd9a4a1a2fda435008bdcd |     
  riscv64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/9b23b9446d14536aa99c6838157121e8c7b07378 |     
 microblaze  |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/4608cafb2e6b9441276444ed712f920ae157a2af |     
    mips     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/9c143437985cf776c22a8c5d2548f950c9ea5c90 |     
   sparc     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/99db50731de06715f0093fd40c6beb77aeaefcfd |     
  riscv64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/1b120e91e2af2033af88de457a02810eb0a9b1b9 |     
  riscv64    |     balena-engine-20.10.26     | NOK | https://autobuild.buildroot.org/results/fef8099c3aa06748690e1266601f10877baf3cb0 |     
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/6d9fe2f3e8c4eb6066badd7b2006e0db4d0594e0 | ORPH
   xtensa    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/c66c12a7f8ec3106b95cdfe29edc987b9df74548 | ORPH
  powerpc    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/368209fb4d03742f82e26cc08530487097986e7c | ORPH
    arc      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/793ddf3d41276001eceb0eb3bfc23db6f0ae8f4c | ORPH
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/80ae348a6fbaea487bfd3669fe729e6a55784dec | ORPH
  aarch64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b2efb28080afa73cce800e08033f7d8aa2a66a27 | ORPH
powerpc64le  |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/ccf34b3cdd7ee379b581bf18d71dbc936f00b0fa |     
 powerpc64   |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/3c7069744cf0cfa76c9b90e0505abf595a421d68 |     
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/afa96df8d2df0cf376fc5fa57aa26c207d42521a |     
loongarch64  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/0198e95319b9b04e2853c8d991d389a0ffd5b928 |     
 aarch64_be  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/3938e6014d450d9b0ebf19400bb77513117c3a38 |     
   s390x     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/13af7e5e2c157baf81112918b7db5f2b444dec21 |     
   armeb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/ef2dab913dd93e9b4268e97d03eb2c0e62b44189 |     
    mips     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/442e4ed846421936406fbcda982f1bae44977e26 |     
   xtensa    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/887b04547642c3b07a3de2cba060adf1ed8ccab1 |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8ecefe8996992ef245b4cb3fced45ec22958ed74 |     
   arceb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/ac8d461430c4f0060bffd048ce644af3f5cd47c6 |     
   s390x     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/132316c1d3d5d335285bf9bbe31a3f4ada5709b0 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c2b443b7d52520b6bd0d5266b0e787d6e2bc79e7 | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/63606349947ebd28cab43c946bebfd80bed3261b | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8ea1939c08924367dab86f6dd74ce5fe2c9cfcb3 | ORPH
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/098165023d8c5604b5346adf7360972921dc84be | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/51e81c4f65003a9068b17b12264c5d7fa5121811 | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/37c75f660da457c579d3c09164bb0516e7341358 | ORPH
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/fdc22b4d2bfacd9fcb101f855d3a3bf313324961 |     
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0421495a32cbd26b7ace0c37d0193d562263afe0 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0d6cabb7a5256e8cc85f576b25712a378aaf1822 | ORPH
   x86_64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/2ac14e9f510ce2fc1f38ed473126027b7c94ebce | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a757da22df6115244e6f00ee9861c32a63ab322c | ORPH
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d3d709635e6666b110498c0008820c57b6fb8b8b |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/82ccd9501e761d3739e79aee271444616cc66660 |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/67cc34a2e67652c11db2374c1b02e445a3d7baa4 |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/27f123c768bfc25862afe2f08ed781264317daf5 |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c01869a446f3f82038ece0604f67c1c682701a8a |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c53a5eae9046ceed51570b5f88cedd19e05e9d37 |     
  aarch64    |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/635ca83890503e3f559305bd96f738c8b8e5666a |     
   x86_64    |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/099ef3126ef24de38f9e865d52dcaab4e2cd4782 |     
    i586     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/fd5d5ad64a94aa37fe183c69c170f95f1e27da83 |     
  riscv32    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/6909e80304cb00d7d03f0a6ff1e598ed76f47b07 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/34d8812bfd53d6de9d38201cc262b265780cad46 |     
    i686     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e41b6b7d744e66bde38ba78b2f9b9acc928037c2 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c0d3b0a676a7761704ce55e67463dad7f1b58a0a |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/b8a91b2886e3ef609fa33b99b46fde5580e36525 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f8916b3cd65e216f30bc10829b10bd3809b7cd70 |     
powerpc64le  |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/9a16b1edc8101251f3ffeb0b27a5b7bf465a4257 |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/d182e923a1c59dbd44b0a286ef1a538923391070 |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f42d99356adb2e8021b8dfc6b769d3fd6f3c8b07 |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/0d4371a36ee179bc8ba12a6676249930c1de7d39 |     
  sparc64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/7120e958d0bd3fbe741ee17022b5797898c8982e |     
    arc      |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/e1fabca95516b458b945c6eebafd4ebf9f1e278c |     
 powerpc64   |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/0330afbbaa59e52ee6fe5b9e5d2fe38050e68e70 |     
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/55b53e2bce25d34c911e3c7290cc502644a1e1e1 | ORPH
   arceb     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/55a0fe2422ef89c67f748df5b64b742c98d39e32 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/9938e811e3abc1689a84a81302985452a8b0e7a6 | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/c4e362c9757dcb57701bb4e57c4090777db63ea3 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/59c8e16f29a4cee907c24069deb8f6f579d5b51c | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/64e5a510ef8d51ec02f75cb389183cfc4f446ac4 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6f4cf35c6932b815271a49316ee72192c56b42ca | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/412ddc9aca96aa37dee2b9cf71c56fc2217ddca6 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9b68ac82e34b7111b4d3c78f788988a6532df51d | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/65a0932402ce9417935833b06f5b4205b12e6053 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2e189f154156130d4fa54be3fb2893493139ee8c | ORPH
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f41e57061fde466a690e24e47b13c6f0abdedbf7 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/56d322cf92c7eaf4b30d4c4c1347dec060fc6e5a | ORPH
powerpc64le  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/79984e04c3c2beda32cbff134eb45197dbf3cfeb | ORPH
   mips64    | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/cc4fdfa50a9583119d945cc51328a5276ec3cb94 | ORPH
  mips64el   | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/3f74aa8a420d7931e83525380f201fd34a1662af | ORPH
 powerpc64   |    double-conversion-3.3.1     | NOK | https://autobuild.buildroot.org/results/df41d881fe8cbe65165a1b4e5523a74c26706213 |     
    mips     |          dvblast-3.4           | NOK | https://autobuild.buildroot.org/results/c97bc94613a41288a5fb1e714becf8bea30b9a06 |     
 microblaze  |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/dc561357a8abd99f6a5639b28618043fa3e71ba3 | ORPH
  sparc64    |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/89e6d6638b8963348ba93642b43cca735a5acaae | ORPH
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f0864fbd9019475774ef96b1ce468195a617dc65 | ORPH
    sh4a     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/263119d39e3896c04b978636afac36463cf9eff8 | ORPH
    mips     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/d8748cd530adfccf9675215d0d4c1f165ed51539 | ORPH
 aarch64_be  |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/6d31868c67bb13c9cd715168e2a612265deaf940 | ORPH
microblazeel |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/8da6546a5499185fce3e571021def2f8e12ccaaa |     
microblazeel |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/f9252b470f198d6e7f978088d0f10e1280b1503a |     
microblazeel |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/2f4964efdc1c1c6b9da4f7feb1996ffefdf8484a |     
  sparc64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/fa3343c3b28bb4c03b4a874ca9b33907bf520512 |     
   x86_64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/3d69e3c033972410df2086e8775aa485083bf441 |     
  aarch64    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/e72c9d94bb4c59b68f3e1f503563afac5e5d7d69 |     
  aarch64    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/461153133bd8ab248df387ee6f54cd2bf4fd58dc | ORPH
 aarch64_be  |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/aa3443e77b7bd1e0057f9e214ccc3b2c967a822f | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d877852741eb457a1d2e874b8dfc23957f18283b | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1bafd36bdb9d3f9b21c450c772571b885f041e8f | ORPH
   armeb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/4d4ea73972d7509ac1d2a2dbda9e5cb2743bac03 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/7e9ad3d57f5411bf970982e87d68fd425ce26145 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9e6bd3071bc87f85f2ba7dc02ecc8d05b3511b86 | ORPH
  powerpc    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/6422949386f2ae135870d0a835fad6b763cff918 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9bc53ce6e6bf3ed862de50517a35b0972048cadc | ORPH
  aarch64    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/34e6e52868995723fed1f4f53756aa21e93f5284 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/8fe89e541131bb45cf2ee338f0edad1ab6853ce1 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/c4599111bb5a9fb9b2598e6c7b83af011142992e |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/a29507cdb7e617309197b7b1612f20c448fe7d39 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0d61b6c706bb962ee0be7c6f62bd2da000403d07 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f240795a872873a50ed83f3a9d6f51c12e715042 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/01cecd37c412e7ae0d3c92349af34ead7669c003 | ORPH
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/784e09574ac40fcced3db29d652392f3271d7474 |     
  aarch64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/90df524d8ce56c981863577ffefeb8e23b319c9e |     
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/e4a1e3073cbde7e01585bf17e32c7f4470952755 |     
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/d46d0176c90418947f3a5e0f9d94d3e4359f7830 |     
   sh4eb     |        hackrf-2023.01.1        | NOK | https://autobuild.buildroot.org/results/08045f933e84e7b1ca918963b331afc074f03dbb | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d91f84f2238518326b8be2db223bb639afe0920d |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8a9ec4e8a8d6ea5b02981a8f926266e306b5059f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8cbe2e957f36ad80d6f8cb0c69be3aba67146802 |     
  mips64el   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/419b9b5b928339685fa49a04cf312c9c2c603f1d | ORPH
   mipsel    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/32b6fd7df6b866fba9acfdf388bb8667e2264d8a | ORPH
   mips64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/d7a67cd535e940e2240119cae1a39e7a2ed7a8ea | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/34a66ea03949d2af39d1a287d6679aa8fa63e86c | ORPH
    i686     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/e2d54be8cac51358e49affba9d5a5c9fca48b9f6 | ORPH
  mips64el   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/17b222efe384e0c0ba039219f2992193e4f0e74b | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/b0ced592370e90333bc0bc23bb611c6cbf391ea9 | ORPH
   mips64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/c0ee75bd28a2e67592fc563229d8433f4df9701f | ORPH
 powerpc64   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/dc4e089dbcb6132d78d3c780aef46160d27b9429 | ORPH
    arc      |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/5d938a01e958ec6e3da778346fe960bbd157b826 | ORPH
 aarch64_be  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/a4b865886c927a19b17a3c7fc6cdfce6ef87e68c | ORPH
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/60ad0dc1aeb8ded81bb4654042ac45bccfd46d7a |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/81753c3bb9ea388af54db7b512c31f59f03dec75 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e11f47ec00d9ba01ef34be700a247c7c3c2a9b3a |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/33c5c3e3ad482d27b37dcfe504255c76cba8084a |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9965109d1225cd3a360cd0cf6947a3f71cdbcb9f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/83c78199d62c090ddc8e40404d7be7978ca95ec5 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/31bef37407352e5f4f53bfa7972992b02e33084b |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/be43ca61b1e8018f0197685751a22d74ab1ac9bf |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/cffb90cefe7c2e5ea171de286aeed8e531a37e4e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/646e08c19a3509e44beef742a050207b24f20572 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/011c662725a5ec769999a83a95f48086f4e58267 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6f9cb2d23fa1ed9b35f9edfae61e628e500145bd |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/498dcbfbba4c8d61026bc038aed25d66b5fcf419 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0541ff4824d57954ab3c75224eabec2b8c0d91f8 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/999af22541a88fec9659b85690db66844615d3f6 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0196ff5ad6d75254971f0d50cb421db77151be89 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b8d7e48d3950bb2d1a5be3bf6410523f944355d9 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ddb8fc20cf050cb7c609801917c5f898accb38b2 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8566afc324838c50b0885e0d865e73a58dab8fd4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/afe4584d5311697e38a6a40a876fa601e8f067d3 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a290b072749431e05e5643d2b4e17529189a0e8f |     
  powerpc    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/905ae988d689f1ac5c6b441cb0673766e8002cad | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/56999950799edf0b3d00d506515b8f51cd7aef83 | ORPH
 powerpc64   |       host-flatcc-0.6.1        | NOK | https://autobuild.buildroot.org/results/dc0bbbb3b41f70607bac5afbea36170e043b2e40 |     
   armeb     |     host-gcc-final-13.4.0      | NOK | https://autobuild.buildroot.org/results/c4596ca18bc4f6dd260beda449ece57251e5bd12 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/c6e1de1217a8ca733acc276bc1eca097db81734e |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/4bdc3a42b834f948705e363a90c0c3b42f5f8886 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/b364dceacd6da6ed60534cb725054c39e30e3966 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/f6e4ddfd757b08daf8fa495c0d8064f5480d6f20 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/8463016d34eea88b606096d79c1121075c76a8d9 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/553c982522bc675b3cc500cc2b439fae9786a574 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/eac07fd063d877591b8509fcff642227bbe8dd92 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/53e76ed8da1d9080fe3cf7af02d5a43f8d2c7233 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/211ba584ebb6ec2a8008bc84061867759f05d741 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/9dc96d00f7c3d4d41ee80a4f0a7529c490400480 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/be618e9c0d0fd5d1177dafdffce757b0223c01c8 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/72b79d915f7158f1918bfae48ad65eea55fd3a56 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/c19c7bfffd7e8454431c9357749cfc687468a30c |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/a861c2ac0a5fcf49c54e5ba40bf4e145074a101b |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/e12029117af48e8a88f0c00f3536b7514f2e4272 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/e8515f7a983cb522dd807ae7d0cda254fedd39ff |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/22e50c5c46d3db38775821f43bcbb3d49a42b58b |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/c155a969a5fb2e88cf004c03f4d42d8fab36ad78 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/dbaf2cc1bfe1746dd56983c09bd3be30907e8b56 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/c6b3134e812a5df3a99edadb263bd7c020638dfb |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9f71f7ce23c93129f1b2bb9d60c785fc680e16dd | ORPH
  sparc64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/478d3913da6dbab2589855d08df1af9c01cb4db2 | ORPH
 aarch64_be  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/69138061f7817cbbbc6978d0bf5d33545c2881bf | ORPH
    or1k     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/1067838394a7cadf9ad40f332eb07a0981e5f4cb | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5ace0f78501f9588af89657fdf7acbd506aa26b0 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5baf8ba31e5e4b0990cf783110cfe2c1ed1278ee | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5675d1387a043fbe5a2666363d9937a4d26bca8a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/226691ae65f9bcfba6d8625bfa56ddf11d702397 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/015eccc7377c0560200198d1107c9e8d2f29cc03 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4ba22e20ea691e914f067a25cf8325dab4b0711b | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c354338328dc5c7f55dac5a02432e4147aa22be3 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2dde5cbccf774e62adf62adf9a1117061aa90d2a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d8fd49c2e1296c2a979171a16e685868a2b3859e | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4ff227265ac4093117294b71c97d4fbcde354ae9 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/54bdcb80ca8d24dc4ae59d97e84b78642ad75b4d | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/883057e26ac46bb9d778200c0016aa677b4cd16a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c4acda4b1d508163617250f6b050ea1f833efacc | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fdacea08465dbd5e2b1050ba3ac4dff7ed2e67b4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6f2802b749b9693dc7cb7d192f0e4ad618e3da63 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/853214ff1682f9ec54be9c19564a993112672405 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ed5d70cdff91a154e731936d85ce4bdec797edea | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/37757f84e3f19233c267f15deee829978df16df4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2c6433991ecf2cda5802e9e1146d4d7355256489 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5348cadf872f928d57b3283c99f277adc17d6cd6 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f527e95024db61068c4f70c710333843a7914711 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b46d40740c0565da1992e527b745ddb59b39fe88 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0574c74bcf611ba28b20850c6e8d5c3cd241d1c6 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a4981e23fcbd08c3a142dfc676308d2ab020b4fe | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f4cb6db499eefa67bb3f801f7b7c07990e362964 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/152f928342ba697c09ecfb98f3088e69843acb6d | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d4a106db120cf15d56308ce12bf6af4ac3618f7d | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/05bf3b5d44d020fa0e30e86a3725b42c6847a695 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/533a2710fdd3b07209b416d0de4cc3a9a1e37ae4 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3c8d8378e26ede5fced13418a5f107d7046ed11d | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a6decc07f14d9b11afdcc4abfb9181139982443e | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ade7b1957c36349b8001060c1f4ef98f071584ec | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3a6033d26ab52af9001beb805faa9cbeda8f35db | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cccd3a5bad6ab8d8220095f7b061579aa3de5d5d | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3c44a319bd85bbc604d799e5badff313b31a2dbc | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a22f762850cf604b5a8d9ac745b38a4ced0e9e31 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/599e61ad40f0caa8f03d775d2ef717487396a0b7 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/532fa8e2953c05d133d089e4a952537d243a0e71 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9b2bb7641f1bd890c3b2dd6dd1fd65081a929576 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eda8d40685c268711b17a580c6ad3223faf20a1e | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b3a1291588f98b3cfe690f4a3a16c2324dd77f2f | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7bd76c6c9cdc13b66399d670e002ecfb7c4ed089 | ORPH
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/69ec36e24c3490ffa74b5897c85ae393060a9259 |     
   mips64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/b0bc2a66aef6fcb7621aafc0e17ef0925150a19b |     
    sh4a     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/b61dec2d12a2f2539104dab4b3527a9a3169e1d2 |     
   mipsel    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/fcc643159f70fcd08cf16a42fc568e28ce487921 |     
 powerpc64   |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e495eeb3d3bfe6731ed18e39bf21c209108be670 |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/7d0d3ef7cb8965cbea5eff049e00b9dcdcdeecda |     
  aarch64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/e1ec19309ebb59ff2de76d43d651358d1b5733f3 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/21790a95b487f93c9e08890a5a995abda3adf134 | ORPH
    mips     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/03eff0160c9546dea07ce3a0752f4b001dc14ebb | ORPH
   mips64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/783fb64166b1e33bb8cf96f99344412c08cfea14 | ORPH
    i686     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/94df2a57210f98e175491c6590779fc1f62b5f23 | ORPH
    mips     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/20cee9a489d6491edac80e203435e9c3c78672c2 | ORPH
  mips64el   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/8a6c09ddc2e112e80bbb2cf22d0fcc4a0df0d996 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7ceba587a05f735a2f0a05f5e02bc9164b66eadc | ORPH
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/59b6dc094dbbd1ec40c41da3ca5ef70f5fc84ac9 |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/70a7a1b95025c33d4c2ad70ea30bccea98c0f92a |     
  aarch64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/b3218840bc9df284e1cfbaeae7d8a8eead9d55f4 |     
powerpc64le  |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/99b072655a664bec27e010ecf7a6d45a331b7f23 |     
   mipsel    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/c6e3ace2fd310101fd376abe0cb9398f17ac412c |     
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/88add2d9205ab360ee8d9b952328f87c1c21d3b2 | ORPH
  powerpc    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ea75cbf50c5866aaa879646e462b1969b4f8b86a | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/da26ef36d1d397d858240734364a24499ac4add7 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/5cc42e99828dafd23cef99c289cb20302aff11d1 | ORPH
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/cab4c3915e4c98beb70bbb1e09848bd34bfbf00a | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/cc55021dc23f145ff401ed4b788008f2eb89ad46 | ORPH
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/f4ecb3ee99aaf3802b96c9a8ee7bf1ab5ee1a789 | ORPH
    mips     |       igt-gpu-tools-2.1        | NOK | https://autobuild.buildroot.org/results/1a1c9eaeb6ac59d70dd81d523f68cdf399ba821d |     
   sparc     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/5e6eed4fba987931ab377f8a2a9ab1f1423fbb73 |     
    sh4      |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/23f830cb1ce10b956c90f864ddde5c018eb94954 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/95b9aebc66c2b391fa444648c6ee852bd0a5e603 |     
   x86_64    |            jose-14             | NOK | https://autobuild.buildroot.org/results/cda64eb45432fd6a737f0a3dec9f07cd61186075 |     
    m68k     |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/2f855d9d94428c6abee215fe7e700449c5bcbafe |     
    arm      |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/68b7fdd8eece60ac485027460c45798f90fd4262 |     
 aarch64_be  |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/2ad40193bb461d2b4eaf88f7560262488ae5b390 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/9464b55991fe8a87f1fdbb6d5770cdeadd6ac961 |     
   sparc     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a82f67af457420f46867d67c9c63b5435e73ee48 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/e3ad258c8817ad199b399cc50b3d9cef133af6f5 |     
    sh4      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ecb7858665d5837301d96430483b584c0815fb28 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/07f9f70bbbe5557d161978f308cb00a22d475dd5 |     
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/e273c04994185c43d4638bf92e2a175ad88840e0 |     
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/48cd09d69a073823a73820d7cefa83d4d6ab0b30 |     
  riscv64    |         libexif-0.6.24         | NOK | https://autobuild.buildroot.org/results/6ca9a06d2f3e3a409845b37e00653d5c1d3dad4e | ORPH
  mips64el   | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/c3e710d1ca62f8f39932ff5088e157dd88f74bfb |     
    sh4      |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/9f53e3dd3b0038ba1ef393a9993c670e94543038 |     
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/59ae2299a6acbbb253963304a0a141ac635a3910 | ORPH
   x86_64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/cfbda82a46463e15694362fb63c06ca185e53ca7 | ORPH
   x86_64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/aa32a417977dec74305c0f6d1a7a3ac12ccbef56 | ORPH
 aarch64_be  |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/4460089f5989277e6143f6e3d66f71371913ee4b |     
  powerpc    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/09f0fe74d82e6e4e38679d381c529414ec2de12b |     
   xtensa    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d4e02099987ba371f21ab26e9bdfff9579cb28db |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/2b0f01191b07e548dd15ae9c06495eba26cdd14f |     
   xtensa    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/0231783c1fe6491cd9382a987460a41507fd7bad |     
   armeb     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b20c8c671b2954d2bac089c0416a1706fecd1d04 |     
   mipsel    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/bc6c86aa352637f4e720b0eef4af20043220abce |     
   xtensa    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/2499edadb2a65c1be5b3ce3ef29408b538949266 |     
 powerpc64   |      libmicrohttpd-1.0.1       | NOK | https://autobuild.buildroot.org/results/f6ab45a5f6535bee66efe7826e382804afdfc072 |     
   s390x     |         libnss-3.113.1         | NOK | https://autobuild.buildroot.org/results/b58bbfa949b8960a9043611866a7a1e6d331345d |     
  aarch64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/3f38231ae32de0a0c9094728bb904b85ee26b636 | ORPH
    mips     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/3ee0bc510b0e470a42fda6b37eb5e40cabe3cf0b | ORPH
    m68k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/b44f9c86860df156a9039e3286a7c0ae5defd5c8 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cb08b384a4bef7be600e0e37f5be0abc405c177c |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/100279de8af98bde8216efadf55bc8b348d1a6d6 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/abb5172423a76e1343eac6ca6fd29f50875fc3f6 |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/45b3e91184521d52b78e03cc6c3d092a3cdac40a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/178ca6898dbc74d06b99eaca9d4d532e7ed8acf1 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c7435e3583b463a01032ed31a4a0ac6383d83e6a |     
   sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7f0fac2c915e935f868ecb62e7f2f7e91d12ca90 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e032e00f04cd0d61c99f43656261d5e7c3411d2f |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/342f0bee5cb2df44eb05a7f7f2ec8fd8cc7a9742 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fd32e7792d97b1b3750acc716f1ecc03dfaa7411 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b340d305097ad59bd24ad216001455365d783e9c |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3e43bdd27595f16e91cb76d058a934afa842c92f |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2a451357b160d53b5a374b757562c28ada726fa1 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4c267cb31f54ec5d4faefe1392ac1102155e21c6 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d067908aba830a7f68fe61aeb92dc5575d75f45b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d093ef52eb7205c3f824921ea77727d626a1e257 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4c8069a7106812363b88fc246f0fa5106785f8a3 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2b9a17679b744da7cce2f097a2a5604b770dc44c |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f079fadca9a81b25ecb66ce35292220c907068d9 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/224807162bd1ee2de6b914c1346408fe625b293c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3142f0732b418e88c573e59b075849e59b9b3556 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9b9dbbeef4246e37e29919c6e87d2beca9920503 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/9cf35238698ba53631db60158f045549e96284b8 |     
    sh4      |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/459af21672e8de67be45f8e7790410b26b2c7e18 | ORPH
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/b218539e1241cd8e6d98d23b6f59d61f6d8beb81 |     
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/0cfc2e3df8a3ce7bc48dcfe71e0c00be2641e2e1 |     
   s390x     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/40adfb981d021ed8b0643e0d4a40de2591541af0 |     
   mipsel    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/b182174cd0621a468d79d31a5980a607ac263b3d |     
  aarch64    |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/1e4581f66b68d24f4950384dea37e5cc85791086 |     
  aarch64    |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/218f6a8848e7b4e9054daa02321ae648cae73321 |     
 aarch64_be  |            libsrtp             | TIM | https://autobuild.buildroot.org/results/c217940bb995b9cc98db9f93e493029be772ded6 |     
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/474e4dcd5309da7f46bece2a8f3825c6a4f9abda | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e31b4305138d2ec3189766ab0c8d16d14799bd2f | ORPH
microblazeel | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/2ce5369a947688d3c21ea85dabb601ce8807ffda |     
   armeb     |           libuecc-7            | NOK | https://autobuild.buildroot.org/results/96b8487342ce61a38685fcd3aa0b298392f21af7 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/adafe31f97fd109455e694f3ed72cab84198046c | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/25fce738f897711ffbd44b575ec731462ed5ce80 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a2d971cfbd01a328ea3ee98da6243476ea5e8619 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a1ca51bc21641d836629e56bf452c2b6b0fed361 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/257918c1561fe814600b8b6017dea6d0b04235ab | ORPH
    arm      |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/7fc3189e9dc404da001b9a060b788b2e2bf67e0f | ORPH
  sparc64    |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/4c05c8290f787147bbc11f3e16f010952c0e430d | ORPH
    sh4a     |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/b2fc5e94b374be296525d801885fe4b77f9a0ac3 | ORPH
   mipsel    |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/0a499313d0d078d37441e3e97317c50c50b43a89 | ORPH
   mipsel    |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/e1951760d11106e2dc803466f2d7c6c87bff95de | ORPH
 powerpc64   |          linux-6.15.6          | NOK | https://autobuild.buildroot.org/results/502ff13c76d32c39baa979c26f7c1d2c902e0cac | ORPH
loongarch64  |     linux-headers-5.4.295      | NOK | https://autobuild.buildroot.org/results/70571cdd3c247a6bdd9fdc9c8d5b00df161340d6 | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3f963ae1f73f0058108bef2cfe22f35c7cd6d046 | ORPH
  powerpc    | luajit-a4f56a459a588ae76880... | NOK | https://autobuild.buildroot.org/results/e115b79100671e61f76312f6494dd527dc06f7c5 |     
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/22277be22be78c32d38cd7b63c10488ab18b3685 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/780fb07618382ba465087ca7735f28fe21836b0e |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7c285abfc787d0b9697bfec64d5222e3f49a2b78 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/330a0e281bbce1f1614e636565dc5c10c723ece3 |     
loongarch64  |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/4d198314616c8773003a7714058036e54de1dbb9 |     
   mips64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/d173ba0d80a7024107c2ef248999f33cc4816d09 |     
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/ec9017d78a187b7860814584b9384bfacbfc4d2f | ORPH
   x86_64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/8361e622daf17cec58f1ed23108359f952a78ddf | ORPH
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/798f6dc277bbe959ea29f123a9faa6f5b3903e09 | ORPH
  mips64el   |           ngrep-1.47           | NOK | https://autobuild.buildroot.org/results/26e7944a64ec9222adb79b44b47de187f8093e2b |     
powerpc64le  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/a094a9812a6f21310b0e4843ed91eda6a13352ff | ORPH
   sparc     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/937301d71707ab944a6c5a13d36c069d27f70085 | ORPH
    m68k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/d9ab69247a0e3f3ba3f08f916596373661f76452 | ORPH
   sh4aeb    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f6d71281119c895f527d380bdeca4b7fb8e8d57e | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/fb025eb5c2543020aad8fc6de59cd3cad568293e | ORPH
    mips     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/e37f61e7dc13e10276aecc09ae49671589925167 |     
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/edeecdfdf73b640fc64daee021cc39c56ce11a55 | ORPH
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/c046833541568f282de33868c81c27e12c7ce05d | ORPH
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3f376d73a5262844947c928e5fd23fbf8822ef30 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0281b14ca32c7d7e6db302aec308da786e76c02a |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/31189587054462e5b5db209ee3cbe3b1c892683d |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4617b17721b1c49569cad1bdac3ac343250881c7 |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/be42fbb9ffc7c5b35f9a23098e39b53b92f2056c |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/d11ae518897a793fa866102db26284a1d97c6261 |     
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e4c34cab221c8b8496c8378ba7b4c271b70c79a1 |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/27d395679950602d3e981963b8635715b27f97e9 |     
    i686     |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/3b7dbdc0e6577bb3116906ec91a17533f0c7275b |     
   xtensa    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/ba97c79504e8477f13b73c3c17e47fb877aa124b | ORPH
  mips64el   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/4588675fc5ebf4941d9a915e03e79b05341fa1d5 | ORPH
  powerpc    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/7be4751df3966c32cafaaa2f2aa53dc57f704712 | ORPH
 powerpc64   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/8d155479b5b1062eaa629f5d456bb454e1a9535e | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/c2ef260ee9359061f84e8d4564c88eb4600ae463 | ORPH
   mipsel    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/696b310a93d399a4d9454c931cd194ec8170fb43 | ORPH
    sh4      | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/d6b8168f4c23ff1c1321636fb31ebc0c626249ea | ORPH
   x86_64    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/72253b2b5aad8f1818ab3a9741f44eae5845c8be |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7e22ab2ee383d82089039360f16e462a0b835ac4 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/87106427e8eb80d5e3035e166c212cf9de03e6f1 | ORPH
   s390x     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/0c9ec0dd9f99485912085cedd112c4b7fb7e0688 |     
 microblaze  |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/a5ea2f3845cd42139e450cc1505701202d626310 | ORPH
microblazeel |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b05d6a357af39377ac1954ed2a46d9aaac0dc64a | ORPH
    arm      |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/709f2a1ccd650cb2819ff4f5170a4163c58f1471 |     
 microblaze  |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/51d7a8e639890b28bebbafdb6fc08cfe81af8da0 |     
  mips64el   |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/1c2317bb7dfbd0a5671ddd3b7560d2c3ad745007 | ORPH
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/e99d2a6c1aeb6416b0133f387a5145e672b1e185 | ORPH
   xtensa    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/1aea3d92280394e4706ed56ce46f6cd1a797997e | ORPH
   x86_64    |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/c9c92e776af91ae54badc3456d4ad413fe3da3ec |     
 aarch64_be  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/54dc3e4f1e67e3752ef7cc6775e46b63edd8c54c |     
powerpc64le  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/30293be1bf883d12585533addd84a1c78ccf05fa |     
   s390x     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/e0035359746ce9810ce832cd6a89865c9cb5053e | ORPH
   mipsel    |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/2eeefaaba48f835863d0c7f2c6e66a943e885fbc |     
   sh4aeb    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/f84f2b51d28a05f12d8c1281418d2fbe7e171996 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/5822a00f05b1cf6caf74c66476e93ac63c068db8 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/33ebd7a6c0a59844ae5aa692ee23fd55343c5728 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/cb23e28cd06dbe3f248a2b5c98e2e3065b832a62 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6db1c9ede95ac606aa2e77b0955c34ff7b398358 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/782b413b784d088c9efc216b9460f2f6e8452b61 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f98270478f59c82e5a32e9cf41d3d46b69752832 |     
    sh4      |            unknown             | NOK | https://autobuild.buildroot.org/results/0130731ec4e4b52f21d3dadfe2d97832feaf12b3 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/f145ae11635c3a1ba0ea893411fc06f70348e3fa |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/a4b86ea0842db6a54fdece6f3e04f1663ce3d9b0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f6d6d39fee06050595874daf75b3677ab70c9682 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c12aab7a39752d9c2843fe70ab4078b262e2a156 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/f0eb0080a95dda596985e7d9c99bfdd992b0089c |     
  mips64el   |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/e5a23c454aef4e2c8e55549c6369807df104c1ff | ORPH
  mips64el   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/e512960dcc6b98e00ae4206b6c439c9ba8857600 | ORPH
  powerpc    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/4082fcd5debadd6b7a6d71ebd4b72225f4cb236d |     
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/6e228fd9cd00b62943ff4a57163e1c5c06c9df01 |     
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a446b9719cb790a4781bf7e57d404829a8a1741d | ORPH
    mips     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a8b941898ce911551b86f78a6543002605e00787 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/2f0f37d111b151d9d689294c536fbb54f088ac99 | ORPH
    m68k     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/39f581f2ff0141d3fbc7c072188108d59c8be726 | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/745aa5c6fadce334d7eaecef6d54a9bd0973aba3 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e5651d714811be5eb0479b047050c89634e4e372 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/51b2d598df63fccf453d07e75a88b6ae430aa578 | ORPH
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a92374c3e408aed0abe437fb318a4e4487650bc4 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/df24a11ca0b0bc846237beaa34048cd98ca35439 | ORPH
   sh4aeb    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/aaf28f2de9cd20db54a594c63c960bc298d8b344 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/435bfca0c289690902f41a8604af38b63a6e033e | ORPH
    mips     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/8876bcb423cf9183ca5f0d5a824e90fcd9c76b57 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/e951b6095a0ed40af3669102f1a37ef8297a132b | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                  cairo-1.18.4 | 1 
           libfreeimage-3.18.0 | 1 
                 mesa3d-24.0.9 | 1 
python-remi-2022.7.27-37-g1... | 1 
            qpid-proton-0.35.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a64168b602c39bd67c54ee73d46490d31fea4ca5 | ORPH
   arceb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/446c7c67ce218b87ddad11d7df40b2c59fa11033 |     
  sparc64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/5e3c6d07bce6e1e6d446b082c24d4a6eefe46590 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/0ce912a8d70d38414f4186e913ae3714c91117bd |     
   s390x     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/d115e3e39920840f8ac4caecec353c1451ee0d05 |     
 microblaze  |       qpid-proton-0.35.0       | NOK | https://autobuild.buildroot.org/results/853c354b9bde4408e122046496fd3f0e7ffb0b55 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                    brltty-6.6 | 1 
          host-oniguruma-6.9.9 | 1 
              host-swipl-9.2.8 | 1 
                 libgee-0.20.6 | 1 
              libselinux-3.8.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/cebc7e49fe4ceb1497cddae8bde0f7de3b2592fd | ORPH
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/16c50bf4e60768fe4cb6b4887aa7de34b17d68b0 |     
 microblaze  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/b3ce7b87929adebbf3f11a2eef57a48361317754 |     
    mips     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/d5001d333aa7b8f1df30354bf2193c72f1a439c3 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/71402ce15c5dee9a45e40bfba6485c8957fa55fa |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8e401b3dae901a5be2d0ed000d64282cbac88f14 |     


Gitlab CI results for 2025-07-21
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749494307 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749494296 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749494292 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749494287 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749494276 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749494101 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493965 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493957 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493950 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493874 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493846 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493819 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493814 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493809 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493803 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493796 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493784 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493770 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493765 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493763 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493719 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493716 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493713 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493710 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493709 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493707 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493705 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493697 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493685 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493671 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493656 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493653 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493645 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493628 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493620 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493616 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493615 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493612 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493592 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493571 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493553 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493552 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493515 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493514 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493513 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493510 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493509 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493495 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493494 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493437 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493435 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493430 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493429 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493425 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493424 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493423 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493422 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493421 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493420 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493419 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493418 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493417 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493416 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493415 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493414 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493412 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493411 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493409 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493408 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493407 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493406 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493405 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493404 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493403 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493402 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493401 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493400 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493399 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493398 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493397 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493396 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493395 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493394 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493393 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493392 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493391 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493390 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493389 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493374 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493373 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10749493358 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
