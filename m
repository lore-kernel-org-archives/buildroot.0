Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67473CA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 03:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDB7061B5A;
	Sun,  7 Sep 2025 03:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMZaYjgaXvZs; Sun,  7 Sep 2025 03:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5170661B5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5170661B5C;
	Sun,  7 Sep 2025 03:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 555E0E0E
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 03:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BC3641276
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 03:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzM5lwWeHTt6 for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 03:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C4CF41296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C4CF41296
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C4CF41296
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 03:21:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b03fa5c5a89so475770366b.2
 for <buildroot@buildroot.org>; Sat, 06 Sep 2025 20:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757215285; x=1757820085;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ATSxsfCP16942/oDi4+zhXmEx/S4Dnuyujmn3+nG8Vk=;
 b=eHRg3GMmx2Zg9Srh+Y5n9WPC8izQA+ueYHVNDJ39D44e0ZMNjF8XTZ5mVijVPUD6oe
 Ds0yM0n0UrVwSSgO+gGm+RwFJqDuiKyIfWsB0MF8NOslZfPdenjEx9xW/VlC/0KQil0l
 hQSe7CMO0jjm8VOpWYl4YLs99UsvxvWN3FsderyHbEP1R5f17PTMgcQQWi4MvvCqm/bB
 e8tUVlV4AYhhTc+uxlBuaKer2ZYginr4UkRzUMhw8KYSGuRxy4mr2D1A1fBs/pRgud7p
 AfY9FfDRC2KVGkuIfpkXzobVHyq1/yK6J2KzZ0Oke4U3kTVHAis+M8oqjMxsn79z/K4E
 PRpg==
X-Gm-Message-State: AOJu0Yxasp38TMBADia4dAsFNJHU+0W7CI9lyKC4FcGt9rC3kCPq3cZm
 qkHLL9A8NfLbjVqvDMZ6vbGXNAmzvzSgk6Jf2rMD/8XlHswOqCpdlYlwRXxQcQ==
X-Gm-Gg: ASbGncuO9yOVHGZE0hXYAAYvK9MuabfkQcfJBiPk/DBe2fA7Y+NcgO9GEHYOod1BEIh
 e58pFwMQmaNv/mQSM3YcD0MBM5Gi81AvcZEZ8D/v4dotODrBbRnGPuyjHVE7Z7h9iqrfyxdsWK5
 5CB5fNlijshoAsrOSyGPBIcPIA4wpiLFIyGZXZ1U2Ni/o5RNZ+RoB6++7KOgi3omPT1z/HLe8W8
 VjsOtQJsjmkNv1cI7hY8DioOujDCzSbelpMJnx4SMfwlcT15CGuP4hnxtQSQoMb06x+O9q8XQZ8
 g/Xynv660j2X0c/TjL7L01q1FbNV/gZKeM/t2uRGmhGIMJFa2yJeoflUsECn2ojrVTef5AXb8c2
 0uAChXwT0KhIwGoE+wHH1yWZ1Y8q0Xw==
X-Google-Smtp-Source: AGHT+IEuL33RA0bdCVVmDPwtLpa9pW3z+s2n5T3xgLKNqkbw2htV4wgyTNWAUlOHBmMzl+v8556WGg==
X-Received: by 2002:a17:907:1ca2:b0:afe:b5fa:2af2 with SMTP id
 a640c23a62f3a-b04b179c2b7mr309961566b.64.1757215284967; 
 Sat, 06 Sep 2025 20:21:24 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0476e0d61esm835106966b.53.2025.09.06.20.21.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 20:21:24 -0700 (PDT)
Message-ID: <68bcfa34.170a0220.934c9.5fdd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 07 Sep 2025 03:21:24 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757215285; x=1757820085; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ATSxsfCP16942/oDi4+zhXmEx/S4Dnuyujmn3+nG8Vk=;
 b=VugvtLb1BEqcCg0zjcj+VWF8Ngq0MaeDeEjVWENGr0NuOhvXbW/zwP26LZ907H2uar
 JOyaOSs6DT6DGvnBC/JnU1JXUfLDC/9QRK9Evdds2PfYZcM8FXo3FWY8QzqhEn45uZSh
 vUKN6gbLf00r61RifBfGdtAs0+XXkwV8TRQo5dlA75V6e3mBscQfheFqfFRN4PnTr4uV
 TBfbGICQcXfx2W/t8w55MShv8nT44NB7O4eZzKGnslJ3FA0XA/jL4R10N/kd+Avb2clt
 jgPQuzLP8CFzKmGCS9ErmH2wBuluhDguoo+7HFiwvVriywW2m58u7cCA3s0KeoP0zlYB
 4BFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VugvtLb1
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-06
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

Autobuild statistics for 2025-09-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  6  |  0  | 12  |
  2025.05.x  |  2  |  1  |  0  |  3  |
    master   | 41  | 349 |  0  | 390 |
     next    |  0  | 10  |  0  | 10  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 40
              libselinux-3.8.1 | 17
                    yajl-2.1.0 | 16
                 uclibc-1.0.54 | 14
             18xx-ti-utils-8.8 | 12
             batman-adv-2024.4 | 8 
               bctoolbox-4.4.8 | 7 
                   cvs-1.12.13 | 7 
                 libsoxr-0.1.3 | 7 
alure-14beed2a86d5a36030e90... | 6 
              host-json-c-0.18 | 6 
libdbi-drivers-0bfae6c43134... | 6 
           host-doxygen-1.8.18 | 5 
         host-mariadb-10.11.11 | 5 
          linux-5.10.162-cip24 | 5 
                   atop-2.11.0 | 4 
  gobject-introspection-1.84.0 | 4 
                 host-gdb-14.2 | 4 
              libopenssl-3.5.2 | 4 
                  linux-6.16.5 | 4 
                   perl-5.40.2 | 4 
procrank_linux-21c30ab4514a... | 4 
             util-linux-2.41.1 | 4 
          aardvark-dns-v1.16.0 | 3 
                 c-icap-0.5.10 | 3 
                       cfm-0.3 | 3 
            gettext-gnu-0.22.4 | 3 
host-am335x-pru-package-5f3... | 3 
            host-binutils-2.42 | 3 
                 libiconv-1.15 | 3 
                 logsurfer-1.8 | 3 
              mariadb-10.11.11 | 3 
                    mpir-3.0.0 | 3 
                 apitrace-10.0 | 2 
                    azmq-1.0.3 | 2 
                  cairo-1.18.4 | 2 
               ebtables-2.0.11 | 2 
                    gawk-5.3.1 | 2 
glibc-2.41-70-g1502c248d58c... | 2 
                 host-gdb-15.2 | 2 
            host-libtool-2.4.6 | 2 
    host-llvm-libunwind-20.1.8 | 2 
                host-m4-1.4.20 | 2 
              host-rust-1.88.0 | 2 
                  jack2-1.9.22 | 2 
                libsepol-3.8.1 | 2 
libubox-3868f47c8f6c6570e62... | 2 
              libunistring-1.3 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               pulseaudio-17.0 | 2 
                       unknown | 2 
               valgrind-3.25.1 | 2 
        vulkan-headers-1.4.317 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
amazon-ecr-credential-helpe... | 1 
                 apache-2.4.65 | 1 
                apr-util-1.6.3 | 1 
               asterisk-22.3.0 | 1 
   azure-iot-sdk-c-LTS_03_2025 | 1 
             berkeleydb-5.3.28 | 1 
             bmap-writer-1.0.2 | 1 
          chocolate-doom-3.0.1 | 1 
          cryptodev-linux-1.13 | 1 
                   cunit-2.1-3 | 1 
             dahdi-linux-3.3.0 | 1 
                  davfs2-1.7.0 | 1 
  distribution-registry-v3.0.0 | 1 
                   duma-2.5.21 | 1 
                espflash-4.0.1 | 1 
              execline-2.9.6.1 | 1 
                 expect-5.45.4 | 1 
                  ffmpeg-6.1.3 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.14 | 1 
            gdk-pixbuf-2.42.12 | 1 
                     gsl-2.7.1 | 1 
                   gssdp-1.6.3 | 1 
               harfbuzz-11.3.3 | 1 
            host-autoconf-2.72 | 1 
          host-binutils-2.43.1 | 1 
            host-binutils-2.44 | 1 
              host-bison-3.8.2 | 1 
                host-cpio-2.15 | 1 
             host-fatcat-1.1.1 | 1 
host-firmware-utils-86739f2... | 1 
               host-gawk-5.3.1 | 1 
       host-gcc-initial-13.4.0 | 1 
       host-gcc-initial-14.3.0 | 1 
host-gdb-arc-2024.12-releas... | 1 
                host-gzip-1.14 | 1 
          host-libglib2-2.84.3 | 1 
               host-make-4.4.1 | 1 
    host-mender-artifact-4.1.0 | 1 
        host-sentry-cli-2.20.3 | 1 
 host-softether-4.30-9700-beta | 1 
                 host-tar-1.35 | 1 
      host-uboot-tools-2021.07 | 1 
                      icu-73-2 | 1 
                   iotools-1.8 | 1 
                  iozone-3.506 | 1 
                  iozone-3.508 | 1 
                 libcddb-1.3.2 | 1 
                libdrm-2.4.125 | 1 
                 libgee-0.20.6 | 1 
               libglib2-2.84.3 | 1 
                libglvnd-1.4.0 | 1 
             libgphoto2-2.5.27 | 1 
                libgsasl-2.2.1 | 1 
                 libidn2-2.3.7 | 1 
                  libite-2.6.1 | 1 
                  libjwt-3.2.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                libroxml-3.0.2 | 1 
           libserialport-0.1.2 | 1 
                libshout-2.4.6 | 1 
               libsigsegv-2.14 | 1 
                 libssh-0.11.2 | 1 
                  libsvg-0.1.4 | 1 
                     libuecc-7 | 1 
                lmbench-3.0-a9 | 1 
                 nettle-3.10.2 | 1 
                    olsr-0.9.8 | 1 
                 openal-1.24.3 | 1 
                 openmpi-4.1.8 | 1 
                openssh-10.0p1 | 1 
                openvpn-2.6.14 | 1 
      passt-2025_06_11.0293c6f | 1 
               procps-ng-4.0.5 | 1 
                   s6-2.13.1.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
                    sdl-1.2.15 | 1 
                  snmppp-3.5.1 | 1 
                  snort-2.9.20 | 1 
                 systemd-257.7 | 1 
tremor-7c30a66346199f3f0901... | 1 
           uboot-tools-2021.07 | 1 
                     unzip-6.0 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/bfcfb6e5014e017334604ba8fdcfac2acc65d161 |     
  powerpc    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/6c69077ea076c3c28d0e8599913cde31ee27b0c5 |     
    i686     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/5c6d823e03ea0b40e94813fce7265a4f67a54cee |     
loongarch64  |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/c376b840e8e12a0470a60ec797cbc40d0b4638c8 |     
   s390x     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/afd81e0977b714ca15c997d5094983310f6b850c |     
   sh4aeb    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/4627d4747ca7792fe9ebd642e322074eb8688935 |     
powerpc64le  |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/dca7cf99bf55e29b8bb6fddde487edc7bb809024 |     
   s390x     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/fe7107feea0e1192ceb0a25dc8fc21dc65ed39e7 |     
powerpc64le  |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/097f0e7c6704718c59067ca1d0e9cc9ddf2052f2 |     
 powerpc64   |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/e4f2c71f4b8739e06e783238c8a43a8202a94a17 |     
   mips64    |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/32346494f01a15d0625ba34b1a3911acd8e6ec6d |     
   armeb     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/a879f2395902f774e0d2c84129ef6a69811dbd9f |     
  powerpc    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/e50c17d2f2c9c25f96f8bd96427be3256466b5f1 | ORPH
  powerpc    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/f14b881f2fa8bd44ed9b78dc4b19852b086a46eb | ORPH
  sparc64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/86e705754713df056bba0a57e4e4463a8ff7acf2 | ORPH
microblazeel | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/c622299b8611a3ac4b3a8da7a283871e6a7e7930 |     
powerpc64le  | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/429c25bb159a5c1dd025f29f377d7ec5c36d6479 |     
    m68k     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/0d3ec53c7c84891c2922b070e8e194f7873e94de |     
    or1k     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/26c92e0738e2475008bb59df24f31ec4ae463b21 |     
    or1k     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/57595b245cb774d4d9ca124af57e8ec795bf11f0 |     
   armeb     | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/28ec744693aaf1f8301343f95ab4f13b0505fc1e |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | https://autobuild.buildroot.org/results/479704c074bcf9019b6626b2c2db99af7837f010 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c8482f7e7353a5f475c2663da12de304469aa0b4 | ORPH
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/05e5e240c6d7afcfc681e877c943ddc0b5717329 |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b3029a37d2fb6f2955b023f7098c24a7200409fe |     
  mips64el   |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/39d84943d5b92619e62cf560ec77d8e05b88dea7 |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/651bf35a3c3643b30ce25daa3dfb5869b42a8074 |     
microblazeel |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/4da47d630859c607ca6612a6ca64b9ea2d067074 |     
  powerpc    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/2f39a9aa3bdd76e32768abba83412b1bfeda9d39 |     
   sh4eb     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/8d609f2892370cbeaba864dbd3f602339be2662b |     
    mips     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/960b21b56ed92b89286b84932022581cbcb68fb5 |     
   sparc     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/3b5dfd7b567ea065d33b3067204ef0bb2994dce8 |     
   mipsel    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ff4e2213959a83112a2c436cb689af0787b9997b |     
powerpc64le  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/aa99e65985e0aa60d6eef921cdc735340a4f3f06 |     
   sparc     |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/a597c71ff387bc154976b5978918678511d0347a |     
    sh4      |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/9743edf847f55e09cc08ea24dbf794fbdc4d1f7f |     
  sparc64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/7e2fee0f7247a3da8bf8a48df1c3bcf987cbe690 |     
   s390x     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/2f7cb005f08c3af3b34751f308234fd3c95f6675 |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/59093a07e09a3a01e0098752e06ec84e186a3f6f |     
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f41638ceab701f46f4580925d84c69ed09307767 |     
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/643661629d41ceeae0a090494b623df1f817a5f8 |     
microblazeel |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/2283d3c07b8765790ae7a1825c66dba90e99c7b7 |     
   xtensa    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/618549a922d3963500215a2a67e4b2b6c19c312e |     
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/86112ddce52a1eb755f42cef5bdf28ab46ab7067 | ORPH
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/16834e718daa81c092e6bf81dbad26997cd1caa6 | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6e9e1db53e252da38edc8b6065c0e31d4bc08d9d | ORPH
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7964ea98245d452735783635402211f3a92ac562 | ORPH
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7c16ed6157e642b06595dac2e471aa59fc4d8bf6 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a14122130ee4079ddf80e778e771c5a99a234875 | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/abe364c6f0f35e6fd1419c03d3246d6f2981bcb1 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/4f45656f27019960d8008a615256f2088935e58f | ORPH
   s390x     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/8ba0da4d282202223f615536f5c4af7ec10c1117 |     
microblazeel |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/ad9aaf744756debe3331c3afeeead464c9fef3f7 | ORPH
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/d3b0315d3dc6c3e87f673de695450d184a42af5b | ORPH
microblazeel |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e9b4d9033f0283b133b58049a03b5f0b595e30db | ORPH
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/3f911d68422f94cee40baae90ce6a56a39f66f07 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/e7537dc6b432da25552e98909d387415695996c1 |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/1560c744634c44398e809a1a5f7011f1c77a01f7 |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/df983a317d3c8b6e7588ee7b213a45c124a9278d |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/b9af0dbba4a8d03a66bd4baf5cba02a4fd3690e6 |     
   xtensa    |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/3d3b741a4a3e1867b2bd37f9be36f750c87379f4 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/b3bbecec1d3f2f18e66cce4a0d6b9f7db6656005 | ORPH
   mips64    |          cunit-2.1-3           | NOK | https://autobuild.buildroot.org/results/6cecc71bb5b03cfa867389891b15ce82c99391a3 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/412b7f04322f585d99d3f8a35f2ff8cdd28654d1 | ORPH
   sparc     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2713bffd5d19d471bb6cae46f42b73a01da5fdef | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/082c91403f40d6eb8a56f47a810c21e054acddd9 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b58655bb38fe27f74df78807203c7650740f8b4d | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c47b55a4eddf967497b072b77c451eeb99838082 | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f0b32fd1cc22b3d2d368240e9e6f4470b6767401 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c6e6598cda6d499d922f762ed66e4245a9fc5daf | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b4ba6ef1d412ab3f3788033b4e7982f05308efa2 | ORPH
 aarch64_be  |          davfs2-1.7.0          | NOK | https://autobuild.buildroot.org/results/8aac7f67f0acc98cd549521aa972dd5ca8deb5e8 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/1f7b573f92cee9f5d60c6df312fda03abdf238ee | ORPH
  powerpc    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/8b08d20189afb0466416fd820f2da7caef336078 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/9b81843d21a7e41f928b9aa59d21f3cf13739ca9 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/8096cb126e6e9568b31440b76abf328837027711 |     
    i686     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/3d896278d8799ac283d45051b1d4212061f38c41 |     
   mipsel    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/aa7e53c04cb521cc0220812f821f9bc3b987a925 |     
    mips     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/013f9f9857b6e835def3624ba9e70f2c88f3eaa7 | ORPH
microblazeel |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/3d7fb98c6f2f9028076cdce9be6e1801a253247e |     
   mipsel    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/e3d159ee02ca3123ad415357c54b1ec0ed26fdb9 |     
   mips64    | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/26c1cad3b49c84cff78944317d863796ac33f523 |     
   mipsel    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/2f995498c89fb7e6325e089fc7e5fca71ef9b014 |     
  aarch64    |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/94e0c4fe343e72aab323527e944ad18cfcc39292 | ORPH
powerpc64le  |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/4cc0f070abbc00ff95917066e39f1c1705841d31 | ORPH
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/70a257a5cf3248049038f0d703cac560bd157a87 | ORPH
 microblaze  |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2c8612cd221bf4178176f23e99ad7b296e392dd9 | ORPH
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/4d36e70164b1075eb740de865e91e75740ce9973 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/47ef64e1a3638b9e00ced2e63e75d9b19d5db2ab | ORPH
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/b5fbd83d1534ba52b1b4131e2c983d1ce751c67a |     
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/eef254193118f6f39fb9a0c8619d947fc3372961 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/770670ce497763347b367bbf19f570f5f6ff87ce | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c0ee76e68c9d4be4f84383b95e87390f3d74aebe | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7e5a1000d9c1d044310be455e22744c92f5ecb81 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/7d10b447a81cd0dfca83a05aa1d2f43a0b8fe492 | ORPH
    sh4a     |           gsl-2.7.1            | NOK | https://autobuild.buildroot.org/results/94c6a4df8a28b4e8d5a66f23004d726e3819fa1b | ORPH
loongarch64  |          gssdp-1.6.3           | NOK | https://autobuild.buildroot.org/results/0a6fefae731ed834c999d35b30b2e72b7ae76496 |     
    or1k     |        harfbuzz-11.3.3         | NOK | https://autobuild.buildroot.org/results/ddc44bf0c459a7458b92b6db154dabfd10d61337 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e112518f33b39fa907eac66c38e36a065a9ee5aa |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5687923fdb8bbd8ad9715b33ff79aca7e5adee40 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/68b3b1559ba9c707eb49fd6c0dd5f3775685cdf2 |     
microblazeel |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/dd65b41511f96779b1f14fdd258018499a80be06 | ORPH
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0f1c73dee10460ea89799a5dfbbab48546ac7150 |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ff49b7996883b8067d4e19d482fb93855831fd45 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e734f622ec62fa7d848b0f1e8419bbf6048a721a |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/90b77af7a9db00c3b6ceaa3445c77a83dec14a02 |     
 microblaze  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/a5bd6deee76e4c4904220488b82b0bb32a8ccd5a |     
   s390x     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/ae7f85134bb81f4ce3c9b774671fa2ff97cb5546 | ORPH
  powerpc    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/603196964032005e7c6e020b4be40d4bc91c0281 |     
  riscv64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/db6db308f7c63cbb41c5143eff07256c7f8ef2d4 | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/e23c18f618f0e9ced92d51e2f44f5ad731381689 | ORPH
microblazeel |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2c79c49900f041a4860067011b6f31466563dd97 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/63dd3ae51a24667689882732603fcda49d796418 | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/853ac640e9dfa193fb4ae4f64826a0b3618d63ea | ORPH
   mips64    |       host-fatcat-1.1.1        | NOK | https://autobuild.buildroot.org/results/b2909330c2ffb6da90c4a75b32184c87d8d4e04b |     
   mips64    | host-firmware-utils-86739f2... | NOK | https://autobuild.buildroot.org/results/75145bc1b1007591ee525a419a8d9caa4b4c16a2 |     
loongarch64  |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/447db070a22df55d1b1c378599aca7f2196cfddf | ORPH
  powerpc    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/4e405d85e25cafc137c9e0a2230e28748fe44950 |     
    i586     |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/7c2c8d9661d71dc820d4b167727d2181e2679939 |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3ab0152ef3f467160bd27fc15a80f1fbbdc3e53b | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f1613104b833ab8f673052c9981e76e079c4581d | ORPH
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/379fabf5ef6540aa4e3298f95423f083f18a5f39 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/144df6564e12f3d3b1ce71b62a2752bd9b26c81e | ORPH
  sparc64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c9177b58926cdecf68faff47a790e8a9047b835e | ORPH
   s390x     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/31927d4171a2f0f7e752cd86331c06dd31272f56 | ORPH
    arc      | host-gdb-arc-2024.12-releas... | NOK | https://autobuild.buildroot.org/results/ab070da2ee222f1cc3449e523f6e9c733e76c6ca | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a33914b4a52353f338f1c1f8f55236e5ae938a71 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/02449e0a0f234cf90eafd309856f576f50599b0e | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e666c52be0a9f061ebcbe017b1faedb2d6758f0 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ed96155b1dc641c49f8c68cef3b001da3050f8b0 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ff32ba50e1c0499a92279821475c2d4cae6bfbd2 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/78a8733f104359740d307b9528340a0fe5be603b | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3a920f3594a994c8c3cca2f5bdc5ba11cf687153 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/706abfd7abc8a9bb604bd7545476bf0da2003490 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/822b4edbe57cd726d77f54186bb10c996721751d | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7d2d26d52b342bd987d377eb21fe9987acf2eb0c | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e7a770c564393112a384de8f945727214e146794 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f198e176839682f72d0a7b2b19bc2eb3caee0187 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/16415e3ebbbeb3754b7242c218597ee175d48762 | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e6b3c8abee56c35b87f934fa538c70c4abdaba9b | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc2bfb28069d934ec8be2314800ac8f9953f3ccc | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d2e9e5adca65fe6297dea6097b39b5dc4f8c8243 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b82c9dd3094d0f86799e6b7342e572c72849b08d | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b32f8638a6d1bc0caadbf95a2cb1e72f442c9313 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1615c03cb90ca09f5f2fd03e15b3fe63404ab1ee | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7112a9edc9eef4d16d14bf0d0d26d41d0b3063f2 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/51005b9b530fef26b1e3fec250b3dcea1d802ade | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f05a14ed142201fb25d9719aba98e2effe7a84e7 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4c51da4b32121da8dd4752db33200eeea8d29478 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4194ac4239e0bc874723eda7b5f893eff4e37819 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cd829445a8a57af4e2cf33825cd46b496f434aa3 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eada4cda1916220de3a56a842011ea5ce95aa194 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6d59d737df8727619945c2bc21344449667fb6f4 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f12971c8e1553017932290551c3533e55a24db4f | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b96e52f4a834a2e4d4094d4e8ea83380fc149dab | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e875b158967a8a55a73f64979b20f9848547955 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d9096617959e98814b5613e4f5505de5b158a90b | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b794b629a80b22c24ea553e517c4012b9a91b417 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/455e0d2ea6cbb486732181939f628021c4588191 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c98d7af9074bc3729a619c94a2c9b7440118aab1 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b6dc2b64486f44f80abe2e247896de9d21d43389 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e2a02433854d67fbd5296f1a99d2d0526effce11 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9555389f24fcc1a723563d8c11b0e372f4c07fd1 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7f6e1c6c6750222a456dbd3b31a156a5e1007efa | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fe298cd61b708f25a3e5f0424b49b9dc90608ddd | ORPH
loongarch64  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3baef730f05b8dc33cf98a669f0640a0567f9d2f | ORPH
  powerpc    |         host-gzip-1.14         | NOK | https://autobuild.buildroot.org/results/171ec063b40d100309cba0fd680041c5f0124efd | ORPH
  aarch64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/6e4d083755d7d3abae6dc59881e646f2c4a33234 |     
    arm      |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/4259690dbc0b8ba529e0c0c0b59f446cbbc940e6 |     
    i586     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/dd9b5420137f4e3ffe0ca273ad5ef48e75f7ac10 |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/7e22f7ce89ba77c09ca3ef885069abd258c1ff3b |     
    arm      |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/860fd30a87ff0e367db1c4d0fda8232d7deabe54 |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/0f11724f9ee3ce3550da2bf5a1bdf36b075502af |     
   s390x     |      host-libglib2-2.84.3      | NOK | https://autobuild.buildroot.org/results/ee282e06907d81e24e1efe5ba10ecfff91918eb4 |     
  riscv64    |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/48aca7820f0aab03c0d9d4cc884d0bc206bdfeb6 | ORPH
  sparc64    |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/ac5684f35ab3614cbc91637c28e8ee11ecaad7b1 | ORPH
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/2654550bf244590fbd64c94abcc5d8cbf47dd1e9 |     
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/5f8a2e72422021261274c5caa9ff5a2e36935bc0 |     
   mipsel    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/6781f6c76f652b98b52fa4f404e822143ef7decd | ORPH
   sparc     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/2086d5b2bb3475487536b06efe185edd961d3562 | ORPH
   mips64    |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/8457e59829b9ff34f459181fc9fe709d6c082cf7 | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/6ca6d688f944d2fb0fb410270acb5c90ca7e3c38 | ORPH
   mipsel    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/73cdfa2ae0851fe451e0ff000bf753aaea4c4131 | ORPH
    mips     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/9e39402168c5572b8738b5889786b0589d15777e | ORPH
    i686     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/741cb66cd5b8733718aba58ed6892fc3989f5f17 | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/3087493ff1ce7ebf3a6016dc190eae3d1f8d4184 | ORPH
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/be38b48bf35b2fc8631be6b12b7ecc00e9929ada |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/4261e35f09e4b3749319c29f8c36307e1a314b47 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/036887746d6992f825b8a1385715f44ccf522d11 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/2ed7831a55c5cc84b1f08d8998cf2b7a1926a58f |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/08f15a3975a9b89e9868a389137c86f0b56c8562 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2ea55a6e69fd70a3282ecef36d39398d23cd9548 | ORPH
loongarch64  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/66033d803192f5b50c01c03c32e5eee78627ba01 | ORPH
loongarch64  |            icu-73-2            | NOK | https://autobuild.buildroot.org/results/9e17730e6e4cded8fed6a4666460d95de287656a | ORPH
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/e1e4a1e2d8e0a5d3fc0c266decd3a597f53e321e |     
    i686     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/787fe92582bd26513eb52de727db5941468859b4 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b9f493816d2e62bdb52bbe0e5e0f7e7f2c380bf4 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/eef9009224221ea8c140d624de491e694498cf58 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/26d026fa8a9f3d9bacf23aec12f258cfed616c7d |     
   xtensa    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/84e5891481cedeee92b28467a9b5ede9c1963167 |     
    sh4      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/80cfa130b446116084462ae825e65d4cacf0d406 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6c4a2f9f853d5f3c5d2049e24f9ac8bbc1f849d3 |     
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/34a703736881d0d844edde604401eae6c5b5c8ed |     
  aarch64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2beca62b85b9715296d6ca9d9340b8e669cf110f |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/daeec29e79c42a21734bdc58368fe760d1167544 |     
   sh4eb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/74dd8c405391d922d873de4a31b946f1db9a85b8 |     
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/47b70411cf06aee478764362bf04261386cfc39d |     
  powerpc    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/730e4e15b005bb14db6f58f8a4803c331636f342 |     
  powerpc    |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/de12415f33893f0c8fddc25317fe0ba0beced6e3 |     
   xtensa    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/35a7a95cd8002839dbaad47ead4604d94ddf9ba1 | ORPH
microblazeel |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/6aa6d0f2c4b61a04d2665e96591b7efba3581fb0 | ORPH
  powerpc    |         libgsasl-2.2.1         | NOK | https://autobuild.buildroot.org/results/7b1d37c2ee69e02c5bbe6c832c46b7cc6a2c234c | ORPH
 aarch64_be  |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/0bf0ae041c728800300da207121b193effdc90f0 | ORPH
    m68k     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/a590435c1cff9a2314a233d36952393834d1e9d7 | ORPH
  mips64el   |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/7091445cb89eda9315b366e0c65bb79bffec7098 | ORPH
    sh4a     |         libidn2-2.3.7          | NOK | https://autobuild.buildroot.org/results/c757de403c28be8e7ffdb812bb27eb18d681577b |     
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/5d0c2a74a3fe2578c93f8d0a0e7b85ccc8d1170c |     
    mips     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/5345dd01c5d86628d7e0ef43cc5071c3c801406c |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/d66f56598ec1c85e1fc42e4123d9961d238f56cf | ORPH
    arc      |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/bca8c80339ee2302e8f72388df0892b9446ec35f | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/36dcd1feafb0e510b0fa018173f2b7bbec691d70 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/766633aedbbba52a63dedeb63a3be8e7d9eeccc4 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3a5d90fd8f50ad32c48860c9bc98a96145ef05e9 |     
   mipsel    |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/f73269c77c07ea08635c981839e2c34748d68bc2 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/79c7cab817e134ad8de59a02ba507ba0b0a7ebfc |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0d0e9a6bbdda31fdcb6c552008122dcf151e9e99 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/168a69424db1ec9c6013a6021dbfa5ad4c643d99 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/908fc7519f1749a1a9b852d80917209b2a411015 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e0e6b3f1cf822ad52e399fbf738499cbd77f0074 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0d9e2bad87ef6178e4191d63c91631456de0d28b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/eee2bce580d17ca1def61708c268d43cafc0dae3 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/588c5c3dde0472a1f8c6075b8e2e578271a9d01f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/82f7808d1275dca14d63cb1be15a738ff9d26dd7 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3962112950d981b4b18a216a1dee82600b4eb68d |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9fb26a315ee92d78c4efb0a5df10f6e178273a34 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6b154208229aa3f379a0f72651e2f0332d81a785 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/7fa00eec68468d5705fb1c4df0ce2078690f1c13 |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5bc87ce7a9dcd742dd85f38e3fa1a405905fcb2c |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3029f5bf30a710b816f1ef964c5730b33848779f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/051ee9e47874b62b9cabdd9dc1d275ee17f20cd6 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3671c9cef3400da5c2f0259c3ab0b6b84adfd9fb |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/60911665e2639a180d815c9c4c714ae9ed73484b |     
    mips     |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/e8e78e34d6634c44de72ecc448aa5dac8a81bdcf |     
loongarch64  |      libserialport-0.1.2       | NOK | https://autobuild.buildroot.org/results/0bb6ebd52dccea1878bd6cd323a5d9f33efb4804 | ORPH
   armeb     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/bf88d31e481611822740cac74bc66a14aa5c9016 | ORPH
   mipsel    |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/8788d45f1c58c3afbdf6c91df9a82ba4dfab6b41 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/e1f29a897e2393228d49e63f066b43ee1d1f472f |     
loongarch64  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/ff9af693d005da2f3beeda60e82618ca7284954b |     
  mips64el   |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/3ed135a55081d01e36eb922118239841b0824e55 |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/5cd58602f9c0f53c225a262efe23bb13a7fe647e |     
  sparc64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/053f00002dc83f71cb91e63725ebf4dbe2d36623 |     
   arceb     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/7838f78d461394830934ad9d55b891e40b00fa54 |     
   arceb     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/52187b8aa14eb165e2979b72604c37e494fd0688 |     
 powerpc64   |         libssh-0.11.2          | NOK | https://autobuild.buildroot.org/results/4e7aa752bde68cee6bdac600faa37fe85a97f72f | ORPH
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c65b506861677f955510b17f4d09a56e6e818ff5 |     
 aarch64_be  | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/6c553aa837a5effc31f9ff08a67653d35fb9dccc |     
 powerpc64   | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/5d79196abd8b1d145bfe89979bceff1d8d472815 |     
    i686     |           libuecc-7            | NOK | https://autobuild.buildroot.org/results/9a14a65179b49e66ff013fa0e1df7ab6caae47c9 |     
   mips64    |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/74ce21fd4bbf8c47d8d4a62e91fca6f3a634d968 |     
microblazeel |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/724270674918ebb2c57ed94e6a145fd395324ec1 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/5784f111ddc83aeb05571d18ea5a6aed9c6f7997 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6f1bcae0c11631c1852b2f3d4876a72406fc0a30 | ORPH
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/aef2d038e0ea7f07d8c70e45c27881f417dac67a | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/57dd2da4740023a6d72cafa73f977cdeccc21e05 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7b2423120f79695e16cd5be86d89dd3641b0c7a0 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6ee1c5f9e4ae07e1c2cd18c79d2a85f2dbd9d7cc | ORPH
    i586     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ae5a564621fb2a088e18b5974917941bb9502059 | ORPH
   arceb     |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/26035e86bbe8fd6249c825f3cd0c3c853942ad68 | ORPH
    sh4a     |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/eec7784202caf9b886dadea45fb4b3b368006577 | ORPH
    arc      |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/6adc6cf79af984512f111a78f392056529fb79aa | ORPH
  mips64el   |          linux-6.16.5          | NOK | https://autobuild.buildroot.org/results/d94a7e93ca25852a409ebf6c6da065bd18164955 | ORPH
    i586     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a5ad75f4d5179eae585ec475d72726af63c62e9a | ORPH
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/0f3a0579cec06e4da4177d93dcdc5b5b0bf1c394 |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/6440d4032aec132df966541b3e05fb32395d143a |     
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/6d7a752043ada5062468496270ac37a4e927e9e1 |     
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/98e550665d02d5e12cd9e8e100822503b8d3f10c | ORPH
  riscv32    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/06e9b3279f5f3d159a965f9bff01c4526ab63f4b | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/75b8f21a817747721c10951b7c9b0e0ef1a87ef0 | ORPH
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/857ffa78f74057a6befbf11c24c505496704d50c |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9b1b40bdd65e6f04caf7a529dd61f44cf5cfc23e |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/95d6bc19dac28fcb7f2529305004d841fab8e114 |     
   mips64    |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/17c8911a73dd64eecd956528d9099ec3da7dad11 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/67c0440f8abd787716eaf4f85f3d305e62cfab65 | ORPH
   sparc     |         openal-1.24.3          | NOK | https://autobuild.buildroot.org/results/0a630264cd97e6e1b3eec70fb5cd0cf991a83ab5 | ORPH
 microblaze  |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/3fc10eff4ddb9d55cbb6d4e26dd45b4265476eb7 |     
    mips     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/84acdbfd972f8466a70e81c9a8782a829bf8d735 | ORPH
   arceb     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/a20eeda05d4cd6a827b3cd65dc897d0a38633c43 |     
   arceb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f0a9435b0d6c6645296694a7d5064ac957150265 | ORPH
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bb9a797d2ca7b7b87bb0aeb02fef5795e0b34a39 |     
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5b06caecd97bca6691c73874e1c277c419102565 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/265448714d492775f65438fa1b1fd072b7151c05 |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/739d2ae46abe60373932575ac0a01b47de90ebcc |     
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/c40ef17c41a46c4abe6c37ca3e8cdec427e52e21 | ORPH
  riscv32    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/00c9b917a939894aed65b2bb6e969cd490f04760 | ORPH
   xtensa    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/980f86f468e6cb33ebe50096f40aac538a5a4917 | ORPH
   xtensa    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/212ad5dd9dbc37225a59c1a43c5927fce3469080 | ORPH
   sparc     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/e6ac492ac85e9ab87a9a7ba672f129f0a0683de2 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ecac4349ccb4df659b6a40582b8d186015eb4846 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/da689b4811490c20acdcb389d7d5a374fc2d7f96 | ORPH
   mipsel    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/927a330aa5db2856637f17392b2d9706508bff31 |     
 aarch64_be  |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/a392612e009c33ce1c86aa78c2a2a65b2140106a |     
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/459073cbfc5456a663410497c766984e4663cdb1 | ORPH
loongarch64  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/4f8a0c324109fbc29362d8e63901b5365d9aea91 |     
   sh4eb     |          snort-2.9.20          | NOK | https://autobuild.buildroot.org/results/1c030e6f9664e4bf655b1f63e04ca45e36875de1 |     
    mips     |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/8e87a0d658a722a6db042e55948f2dd78e895b0a |     
   sparc     | tremor-7c30a66346199f3f0901... | NOK | https://autobuild.buildroot.org/results/69b196656ed0b8f6599b7b5359367412542e1f81 | ORPH
  sparc64    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/a9ac4ffae77f5e1d1dad34da234e1eb555008a27 | ORPH
   arceb     |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/762ff47a83750459c1d6238e0dd5524b6d6282ea |     
 microblaze  |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/c0b1cb1e6ec00c5e304cc6b4653686c83d62a902 |     
  powerpc    |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/d379129c999f082054b73f9bbed138c972dcf25c |     
  riscv64    |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/8db0a5a694dae57d1af72f36bdbd06b34c1dd68b |     
  riscv64    |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/ba8f1a47dd2793c32bcb61a3e4a048a97ed23166 |     
   sparc     |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/fa6350eb3e811097c53bbe7b7d4fcf29dbe0b114 |     
  mips64el   |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/bfe3b7a9c1be36650c7760ee81411bb8a98996fa |     
    arc      |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/6b6d44aae2a998d558aaca7a67c9c2c0561e457d |     
  aarch64    |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/70505fa13c550b1b564a194dbe57aa5a526b3f1a |     
  riscv64    |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/b28a9c7c053c71522ad740199cd71017832b76de |     
microblazeel |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/4e915d6962a72fa97cc2d6b21959537ee23e982c |     
   arceb     |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/163ea4e4aeee3b51524a3a2757012b3825ce8bc7 |     
  riscv64    |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/d8e7971d2b4d45f4666657d0e2aa311aab78e660 |     
 microblaze  |         uclibc-1.0.54          | NOK | https://autobuild.buildroot.org/results/a20d378ec80677770e8d606d847ea9ab89ffd11b |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cee5a9e0cb31b70800a95b488ec7989a0edb2c69 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/d01bc7f47c6667096156ec9cc8ec7ac61afa30c2 |     
 powerpc64   |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/d81cb9d7c9e87dd233dde350d15cb03427ba2036 |     
    arm      |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/088d1a249865a697e7c66a5ffa5a4a360744d2c0 | ORPH
 aarch64_be  |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/1d6d3c2b38bf4327585865d42d8420c008a00435 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/5daf21625bdf34da90bc6816ef98c86309d73b35 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/d3f28b14e9aa431227423d4622bcf308001730f4 | ORPH
  mips64el   |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/c1e6ca5f9b5c517f1604a890bcdbf789c1a72437 | ORPH
  mips64el   |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/aa605dae8cfab3bf34bd1757dea9cabba3b1f939 | ORPH
loongarch64  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/d4449aa386907f96a2abf9356eb62c0e1a17513a | ORPH
   armeb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/dd51061aabcc9565a1ec3349f6904d117b911057 | ORPH
   arceb     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/8162d7acb79ec15bd1752691bda6ad6a6fc6deab |     
   sparc     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/3c2edd5b56e9e9091f5cc7f67f5b98924daa0c39 | ORPH
    arc      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/1d207a85df0fb665d5e55e486eac9da458493f55 | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/4b545301514f254d9f74d52274b984fc95febc59 | ORPH
   mips64    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/42b605766cc0cb13414fa8b3b7a306e727b037f3 | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/4c8aa99278843cee30cffe8974beab2fbe5efd03 | ORPH
   sh4eb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a51a65e948a26793c1cb12d447468c3cb58ab9a0 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/51091a769d46f34dc793a006f02d2a6273d6eaf4 | ORPH
    arc      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/d2c85704fa38b7dcca28630899a4d792d54d9589 | ORPH
    arm      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/50d690f500da8de6fbb96b51fea655d51eee5e65 | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/5eca7d851d88d72e4b5a72a8773cfb905bca2b3c | ORPH
loongarch64  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/66ac40ed9719dd4a79efaf9d96db0bf60f7ae6ca | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/f85bf0e8fc3714e799c4e1fa75f2e31539215a6c | ORPH
    arm      |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/8a25985968f10f61b8e3772ee254d45ac81aec6f | ORPH
   s390x     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/0d54fc0998d37e6a7c7ef09d37a88901c1716ff2 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/113c584e60a693b9150632fbedf4d1e60a740ecb | ORPH
 microblaze  |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/a4d49536d9034c1bad55b2bc4410876cdac5613a | ORPH


Classification of failures by reason for next
---------------------------------------------

                   avrdude-8.0 | 1 
             bubblewrap-0.11.0 | 1 
                 c-icap-0.5.10 | 1 
                   cvs-1.12.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
           oath-toolkit-2.6.12 | 1 
                 pixman-0.44.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/063cec16e15a213516d0e0f3ebdf8fce24ca87cd |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/124ccb8f59691664b39be66dba79f2e2fa0edfe4 |     
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/bfabe6b79a2c8202a06bbce4bb54f334d684a0d7 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f9e4fa06cb3186680cf48f0784276db58ffbeac6 | ORPH
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/51e28897e9f7480baeb77952f6dd52dacb47764d |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/8dc7dba18c2c7d553a39ee47ed8f45f54fc583b9 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f3e4855f24d0f3292296113ac81985aa775d5aa4 |     
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/a9ab5cdd912ef87b991d046754015fd423c77bf2 |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0a9ebf5ac886b9e73dcc9b41ddc0cc9d47a934e4 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/de187240c1a96e3ec8347e308858a0c3d17802da | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    bat-0.25.0 | 1 
           host-go-src-1.23.12 | 1 
                 mdevd-0.1.6.4 | 1 
                    ofono-2.18 | 1 
                 pixman-0.44.2 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/460d363bedb1af8123a0821e0d534ae70e9bb688 |     
    arm      |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/01d59d257be73bfebfcdae35cabc149e6b76d538 |     
    sh4      |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/6466309cb46355bf8387fc63e3c68d08bd72ff3f |     
    m68k     |           ofono-2.18           | NOK | https://autobuild.buildroot.org/results/24f3bc24821ae0820f1bf11cc1f6d4b60328ecfd |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/0a8df2121b432b78228d22dc8bbf9e58df13a9a0 | ORPH
    or1k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/d4180b948cbe62ac5f1760861c9dc95bd87c45a3 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

            netstat-nat-1.4.10 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5fbf1a57e686f10937a3002d1516990169fd027a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
