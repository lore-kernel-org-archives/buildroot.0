Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8C0D7495A
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 04:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C0BD6081F;
	Wed, 30 Oct 2024 04:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTk-9HcCtzF5; Wed, 30 Oct 2024 04:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53CF660770
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53CF660770;
	Wed, 30 Oct 2024 04:19:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B079D4969
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 04:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DD4880F16
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 04:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yaqC__lUkMP for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 04:18:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5017880F10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5017880F10
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5017880F10
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 04:18:54 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a0c40849cso1012174066b.3
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730261932; x=1730866732;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nr6FehX1srqrJbfTSVprsdApCOy+q2fuyZSv4AAJ99s=;
 b=rbgLHeSloXk3sSPai3MN+n7Y/ARX5YBle5hOmvYxuFCXuCQWbEI50wlOc7qvgc6Kb2
 mfg4wOabF4oRKSfbdL52AQCA6DVQDi1Edbg6AKrcHWoHaAhtukryB8OmWcaUvUHQdCwA
 IWNVfLQ2RSBsMaC/BL45bsq5m/KZ9YapT6Q9GRnaRHCz+24mbK5jVui8rTLoDmhKK3nJ
 /UHiLft1OXQQ4uUI/WP3cIwkrXFfub/PQYzmC2EvUHKKCs3kR4eRin+VpKzzOcM/85cV
 BX9EgcB2p6CQc4zZJNUeXqCo+MmOSWxaRcbjsRccMrellhehwRIQBWElHWkCPSivv09y
 4Pag==
X-Gm-Message-State: AOJu0YxygmRkkNcr/3BRgudSTbMmA8zr8K963Wmc8rDrrOzk3rISfyDF
 nF0vQRkoUySYGJOkWFN3S8e9fakAj4z/5IPdWfDY6Tc+iiQF5AU0eBFQrw==
X-Google-Smtp-Source: AGHT+IEPEtqDw0CrrMwIs0rmBouRdj9zOlwPYRcRPK3oiOr9/EqpI6TNNGroN4TNWF7jfZGYDvT3Vg==
X-Received: by 2002:a17:906:6a12:b0:a9a:3718:6d6 with SMTP id
 a640c23a62f3a-a9e3a7f2373mr224092166b.58.1730261931341; 
 Tue, 29 Oct 2024 21:18:51 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f029a68sm528213966b.83.2024.10.29.21.18.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 21:18:50 -0700 (PDT)
Message-ID: <6721b3aa.170a0220.191378.0722@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 30 Oct 2024 04:18:50 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730261932; x=1730866732; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nr6FehX1srqrJbfTSVprsdApCOy+q2fuyZSv4AAJ99s=;
 b=OPfLetgwBbSSuahzi5K76PkM+yoOnsOb/Zsl6lcQre2ZNgQGGtLXUMUYyemDSeVijF
 x/Cvpx12C0YoP8WgVREB8L4NPwYfZzNbP9A9elokkRRtaCBuVad62puwCj0jSMobMMPT
 xjkRrKS7F/Y7/SKgfQ3J2OBrhSxkaByWDDglu8qzkq2RHRhTLmQnRU4Ku3jKzBfTSgwA
 5gzWr71LSo6k/09EeL9QPj8NR4Vly0n7Ui5FJL7PPLZaOmIrLtXmT7Rw30QZMPr6vt7t
 Nszn7UIQiBH4eKEthsQIdrxt6cC86yhpEORhrHtuZlyLlxaJwHX9M18NqJIF+PuwjyB6
 vUfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OPfLetgw
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-29
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

Autobuild statistics for 2024-10-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  | 118 |  0  | 118 |
  2024.05.x  | 21  | 119 |  0  | 140 |
  2024.08.x  |  0  | 82  |  0  | 82  |
    master   | 10  | 706 |  1  | 717 |

Classification of failures by reason for master
-----------------------------------------------

                 host-tar-1.35 | 441
                       unknown | 24
                  linux-6.11.5 | 12
            host-binutils-2.42 | 11
                    bsdiff-4.3 | 10
           host-doxygen-1.8.18 | 10
           musl-compat-headers | 9 
                 apache-2.4.62 | 8 
             util-linux-2.40.2 | 8 
             dahdi-linux-3.3.0 | 7 
 ibm-sw-tpm2-rev183-2024-03-27 | 7 
          linux-5.10.162-cip24 | 7 
android-tools-4.2.2+git2013... | 5 
            gettext-gnu-0.22.4 | 5 
              libopenssl-3.4.0 | 5 
                   perl-5.40.0 | 5 
                  ffmpeg-6.1.2 | 4 
                   foot-1.16.2 | 4 
                    git-2.47.0 | 4 
  gobject-introspection-1.76.1 | 4 
           host-checksec-2.7.1 | 4 
                host-m4-1.4.19 | 4 
              host-rust-1.82.0 | 4 
                 libpng-1.6.44 | 4 
                 libv4l-1.28.1 | 4 
           at-spi2-core-2.50.0 | 3 
                 gnuplot-6.0.1 | 3 
             host-cmake-3.30.2 | 3 
                 host-xz-5.6.3 | 3 
           libzenoh-pico-1.0.0 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               linux-pam-1.6.1 | 3 
                  ntp-4.2.8p18 | 3 
               procps-ng-4.0.4 | 3 
                elfutils-0.189 | 2 
                    flac-1.4.3 | 2 
            gdk-pixbuf-2.42.12 | 2 
          host-binutils-2.43.1 | 2 
host-binutils-bare-metal-2.... | 2 
                libxml2-2.13.4 | 2 
                    mpir-3.0.0 | 2 
      python-autocommand-2.2.2 | 2 
        util-linux-libs-2.40.2 | 2 
                     ace-7.1.1 | 1 
                acpitool-0.5.1 | 1 
                  assimp-5.3.1 | 1 
                    azmq-1.0.3 | 1 
                   bash-5.2.21 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                    brltty-6.6 | 1 
                cairomm-1.16.2 | 1 
          cloudflared-2024.9.1 | 1 
                 coreutils-9.5 | 1 
           crucible-2023.11.02 | 1 
                     crun-1.15 | 1 
          cryptodev-linux-1.13 | 1 
                cryptopp-8.9.0 | 1 
          cups-pk-helper-0.2.7 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
                 dtbocfg-0.1.0 | 1 
               ebtables-2.0.11 | 1 
                     exim-4.98 | 1 
                 expect-5.45.4 | 1 
              fluent-bit-3.1.3 | 1 
               freetype-2.13.2 | 1 
                  giblib-1.2.4 | 1 
         gobject-introspection | 1 
               graphene-1.10.8 | 1 
             gstreamer1-1.22.9 | 1 
            host-autoconf-2.72 | 1 
host-go-bootstrap-stage2-1.... | 1 
         host-libxcrypt-4.4.36 | 1 
   host-mender-artifact-3.11.2 | 1 
    host-python-greenlet-3.1.1 | 1 
                  jack2-1.9.22 | 1 
             libapparmor-3.1.7 | 1 
                  libnss-3.105 | 1 
             libopenh264-2.4.1 | 1 
           libsoundtouch-2.3.3 | 1 
                  libva-2.22.0 | 1 
                  lvm2-2.03.27 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.20 | 1 
                     mtd-2.2.1 | 1 
                 pixman-0.42.2 | 1 
               pulseaudio-17.0 | 1 
           python-numpy-1.25.0 | 1 
                   sdl2-2.30.7 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                 systemd-256.4 | 1 
                tpm2-tss-3.2.2 | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/ee4d4c1251644220fdd885ea73dc505102567a05 | ORPH
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/ff0a06081abd76c07a1e1fa3e6ad126e482338a7 | ORPH
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/56f47526992d6903bafefdcdb9d5b866976a1db7 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/3fd2b03d9b8a3b02e17ad46339f4a6ef437dc1fd |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/3689fa1d9069e6b1635920d0119a8b50af39d5ba |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/37fdbe8a377e893145b7e1614be6b4c370533b7a |     
microblazeel | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c88cccad95a577f0d6c35e374e724614d9505090 |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/944c5d54dd3e2d8a6afcc6e54ac0e471a856e49b |     
    i686     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/c015cf3157be73d86a9609c4f6129410918a981d |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/9d494dd3fe89a3a4cbce3c0e99ccd9bb0e544d75 |     
    sh4      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/cdf4e848661f73ef9918f1de52b95f5270c00d66 |     
   arceb     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/6f6859a72ef6d9b6b9c2a7ff1a5a41afb93e0b5b |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/2632e6a303da2c91caba076ffd60eac2481652ac |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/afb6c8195462ca4b823138c657af1504dde20d1d |     
  mips64el   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/3f3f07fcd97fec714a638be02e507677c7c04f7c |     
 microblaze  |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/3d701c21424a7fc64655c883e633c9ead833ef48 | ORPH
   armeb     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/3911080593e50c00f3327eb30fd047430e07743c |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/48538f65ab84a955c3285940484f806823b74c36 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b6a68b0df04783c8f1088c2a78547e03466a2617 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/26faacef1cbbdf19face1a5bba84ef616a27e52f |     
    i486     |          bash-5.2.21           | NOK | https://autobuild.buildroot.org/results/da22cbd1c5b53c22c816dd97dbab42d6e2adad47 | ORPH
  powerpc    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4cc197b13595ef38888300f1f9bb6dcba15b7d9d |     
   armeb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a986b5a40ce243644dd93ae2f08b43ec66565fda |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/47a65ff85002562fea8915313bb263b1815ea12a |     
  riscv64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/f2bec8a39d68c1b9bbf2f13f02199986cb1d9590 | ORPH
    i686     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/25ec43cf05cd82d7a4b20bdf9fed446b1e4d1463 | ORPH
 microblaze  |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/a5aac79c6479eb02dbadeff9f3b86ce5a6c79551 | ORPH
   armeb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/6ee484d81cb51e1ff77be00ec5b0ddf489e069ed | ORPH
   armeb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/4d5b70ca25fff04bae287f36ddaf2af0d9816a30 | ORPH
   nios2     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/dbfd85d0a1db699a2341b26c7e2503ad2c327ab2 | ORPH
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/554c7755601381ac58c885671c467ca3a3abebea | ORPH
microblazeel |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/76ea56e15cfc9d94241ae5879691e280355b0a19 | ORPH
  powerpc    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/f252b3882dbd6b70375aba332ed6a2d2163c4505 | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/23b7ddf7e2c192f368c69fd9e3af8b123074b495 | ORPH
   nios2     |         cairomm-1.16.2         | NOK | https://autobuild.buildroot.org/results/53aa6ab624eb8c922cbb45c09165b6282904076c |     
  riscv64    |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/f09e827c53d7289afa3c441a24de653b0b4a6f80 |     
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/088d4c0d52e8ea2e58809bd55e746fe71b9a0076 | ORPH
   x86_64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/ebbd051010c27f97fafc0b203b22c8b0af7e5ccd |     
  aarch64    |           crun-1.15            | NOK | https://autobuild.buildroot.org/results/355e25c347b4ea0b59a333425eadcd6537d9ab11 |     
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/ded2da4bf7c3034b746aa4ce91c347339b89a409 | ORPH
   mips64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/0d7f81b033b7ae0f36c3e1cc86e4d4c89f69bc81 |     
   mips64    |      cups-pk-helper-0.2.7      | NOK | https://autobuild.buildroot.org/results/757305842eb0ce5db87e4b65531ed0f3765dbdc1 | ORPH
powerpc64le  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/cb933e7b369e7a55a92645db5f46534fe6fcf14b |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/79e6b22426219bd4b1f5c43c586a13e4b31e1937 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2feb2ac25f172ca14f09f36b1a972d862a037ce9 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e1f744a601f056062173eefdeb04c51d65acf94a |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/85f42b4d2547c686b58feba17394567faf1b32f8 |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/883871c4cdc52eab7398a060b24177903f87c0e6 |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6a444afedee271515d287805888cce8f0e0ad69f |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/09bab171b31730c5de4743aef6077ccf7fab0d57 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2a0ac50ae401e39ab584fe1588cdb794ca1edcd8 |     
 powerpc64   |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/37b76c3b29938d733cccdce94d3876aebda26518 |     
  mips64el   |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/ca199a700a253a5eec472b448bed49e645138423 |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/d4469b1ffdd94e7c3cc531af3de00b6d8655685d |     
  powerpc    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/76520ea984c96dc725158de6685a403f1350186d | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/87a2b50b4baf607cb1f5cf304bcbf3ff4f441fe1 | ORPH
    arm      |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/6838316eaace49e5b7528b40720f3aa37139a85b |     
    or1k     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/180e3d1d038260df986b39433ca8f1e534226aae | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1b43bd6cbc80f5e30bf76874dc59456ec3834f45 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e844719e1c25374544984741afa4d8e9bcbbe5fb |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/4de571880dee51203b738c3b688c4ed7ddac4b84 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9a21b314cd76f5f5dcee0caf87094b0d30f6c75a |     
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/0f98933db25bd5f4acc0ff6811e9734c29414f67 |     
    sh4a     |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/4a2c7003a0387d149ac2eabba29f230a57879cc3 |     
   nios2     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/862d4eaa2902ebb19a09397d54db49379694ad73 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e2bd1124382880eea2a6f3cf58dcfd55a8caf664 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/761ee71510c3e6b50ece33cb1ddbc35261b0f3cd |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/2e17237433e41afa08275d557c95dec42f12e133 |     
 aarch64_be  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/10ea99fc9fba0856f56c7db5a78b97374f134d17 |     
   x86_64    |        freetype-2.13.2         | NOK | https://autobuild.buildroot.org/results/7bf3819c803f298c948e7c3c214c16f72118fce1 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4a6b246e6fdde06b4b3b20f568196ebf61d8eb1f | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8b8102f60493555a85f85268d8f46bc25021964c | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9fc330d8c370f00d74190795bf0b0f7ffcbe113f | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/55a736105af8e0ed1703194adeec21627d726b23 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9798957f2262489f564799897347083d4f6e6693 | ORPH
    i586     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/3b494daa1a51b9e0c9af44ce4c6231de59c0c9bd | ORPH
   mipsel    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/932174d1904491ed421d1414cd3803e35651aaeb | ORPH
   s390x     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/308ff01ec60a976be88d8278ffebfe27378fccf1 |     
    mips     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/9637436534598a1c8ac81ac6b34b9c8179c8bd71 |     
   arceb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/e422178c415180cf520d91dad8bfb89f27d677e2 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/41be6d9dc3121fb8146634aa6a76aaa99c88b0aa |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/5926c1ed286c91e901a07ce2f437023eb14f61a7 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/8b4bcbf9b704fd26faa25d3f81fae17a55397992 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/11c02bffb1654b74e6cd162ea2f2b7b3e3cbe785 |     
   mipsel    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/4dda52cc3dca60fe0fdd59e4bf956dc8aa6b8ff1 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/08a00916437c4cade580dc50cfb9990ec5c7c28e |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5a30afe1ab9b5897d4e62ddf736b513db34a2a90 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6891b71f10e21caaaa98e96978b7120b3d9b4784 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7e2abb12dec91407638973dc7913be0cf4323e4f | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/121228cff407becf82891a2a1f5193c1c00b2071 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/46de4d40b613f0ca4ec3b5a6f0c7c90adaf39e9c |     
    m68k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/6acb7b8c88ddde918d665e2dab729a98981a00cc | ORPH
    sh4a     |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/84a14e6b293f84e5e17a6db5f1c78900b529a77e | ORPH
  riscv64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5db32a3b84ffefa07b148be1d384a46e446fc05c |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/248f042dfd7ba1ac403fee0f6090d0bb55c1f93d |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5f7129f3a5b2f1c4f2415c13d782a441d9880d70 |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a8fff1b0a4775741428648a173bb70893945ecd5 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b3f333a25e17add6cb34bf2e6ba2f9fd481de718 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9343005976f33a8c8cdb357745dc6857ab0153bb |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a375bd9b7ac8d26f65702b1e201ae06b91b1480f |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/27d3fcbb9a45ef419d71392fecdb691a9eb33513 |     
  riscv32    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/21c7c82034cca9b6501eae4175d20cd8ff8011e6 |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5c8ecced25fb91f8c94acd36a9b2192e0ee41c15 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/279b9a98d3960d1591f2e8bac0c6e1612d5cdabe |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a8cd8829e036a1a82a499b6e40a2ab7d1edd21d7 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6c91f4261f80a43464edf4ffa9fd1f6cece901e6 |     
    sh4      | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/5cd4d387e192d94dc0703b9744932a35d4e6f4e8 |     
   armeb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/5a47a5abdd209cd77f5bc49cd34dbbc382ca9a71 |     
   armeb     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/785797053575ece6e9597a34657698ee338e2c49 | ORPH
  mips64el   |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/4a4e4ae3d7302344b85047ba117070e4501d8dab | ORPH
  riscv64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/e85cdd0ee25588252f9ac6b69de2dc5a4f80e748 | ORPH
   mips64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/a69034bae84ddcdd398b07c80634f1e10be3ce19 | ORPH
powerpc64le  |       host-cmake-3.30.2        | NOK | https://autobuild.buildroot.org/results/6fb56e599e1d5553b740b6722259d3c497d2b179 |     
 aarch64_be  |       host-cmake-3.30.2        | NOK | https://autobuild.buildroot.org/results/91343b0511bb23d0ed9a0c1a95fd24cd473f37a0 |     
    mips     |       host-cmake-3.30.2        | NOK | https://autobuild.buildroot.org/results/05a8ed35d2dfd2ae60eda0c92a1e825209158b64 |     
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/073c729b44fe524781078a253271bc17c41ed760 | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/a9638de7fef2d898e79557a234a72997ffb63289 | ORPH
    mips     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8a83220a5cd55883002447506b0a42084f390407 | ORPH
    arc      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/3f39fa0153cda4f6f58b45cd2b1a618039613ebc | ORPH
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/47c8b011014670fc923d734e5fa867257e41aebf | ORPH
   x86_64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/5ceb68f63df13ae2b5786bba11d09729ff906604 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/f82ce3857032f1f80d664816d7f11900579e864d | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c461f8e7baa4171f0b2123146bdd04e51c369283 | ORPH
   armeb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/650d7bd76fe87ffe7b17142395ebc5d0c2a24989 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/4bcdafd74a238c98a572509f2d677637f2daff5f | ORPH
  sparc64    | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/bfce1520a765a2cda01ace3a95993d7ac01a7b88 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/43a049a3644bc2ee0d8653e92d7e22cf8a0fcbf5 |     
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0f9ead543d8bb60c918a5226ddfe774ad0b800e0 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/aeef7246b20357ecd65429927f44e1c383b5b9c5 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fe8f3f7d835dedf27bdcf010150eff2584b89d0a | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/929f757bcb97435f554a0314e50cca6f6cf7dc25 | ORPH
  aarch64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/c76cef03e1ce88c131f6e569cdcbfececf0f19cf |     
   x86_64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/533dfef1bb6c17acf7554564f170634005346a44 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0d97853161d0d1699e3e6d8ed90aacb15d2889fd |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e035fdccbcb3f75001c364798022798abf9f74b1 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/fddf1b4eb42dbbdfa2b7294baaf0e6e6c71d030c |     
  powerpc    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ee757da58b17aebbf41c6af8c633d34df17d1f1e |     
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/49cc5edd1d3991ee980811dd0f9e5ec160c64e2b | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2f1e9d49f72b963e9a520d0cc4997178e5d38f5a | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/87dca1e926c37fdc8dfe89a38a08302e9994887f | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5febdb30c527013406bc3a040c3db22907df9ab6 | ORPH
    i586     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/547d08f4fa9bbac66f53d9aa1fe2924bd221a1dc | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8170dc849c03537d4041104ac7c2d33d6a9166ec | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9aa5d72ce7c24a912d3623d05f0ba0ded80af910 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/159cdc70661df5eebed1ab889143c6f913ea700b | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ed9d2bee57eb7882b833bc3c768746de10ee27d8 | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c38dd773d1362bea948a0a4e1f3ca3b1a48b54c2 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6e64dd0e8aea71f2e8bfeb1c3b877e09e1bd5a60 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4a335c871b6b25b028f5eb76371bf0cac04f5a5e | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/401bbb7b8279c706c8ad9288b5a57f5074e5503d | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/79d871d9c6b3ee6bd91a3a8248d3c837816277e9 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/336a9dd70fe667a79a5ee2aaf64e30282fddff83 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c5b22d78f3b42f6c95e38d8b336e285cbcc1af30 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5a6f61bf599b00fb45b465d516df4c75977a06c6 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b6edd220f3ee4b116b7ae7d4fde5a4e012c05724 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/157a51ac516718a7ddfec2afa228033f3ed3985f | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7f7de91c27402332a410311272023c3b688a9583 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/48ef3bfbf897b3d12b918ab9c84ebc64d3b083ca | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/417a1b00fceb24c98d879988b938b98d5fda4a76 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f517003e1feb16c59682f4939031efccf90ef542 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/581605ec605447a51ade257e56741071ff3373da | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bb0131ae353870d8672f5ec302b0a6ca2e2b6a32 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/05fd6bc2d065efa62bcbd1f2548eb9ff30facad2 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d5e75b6feb21f1e2011837fb6d995ea61e20ffb9 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9b322c4917cd8bc52bb22685b0d8c6fd6e7fd78b | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/97472acae75805f6e63fb3ee39651cd9ee34299b | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/843b0bfb8fc02d34efe8b50eade7037a1bfcf14e | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9e86a0492657dbef459440a5a3a4be01cece7c3a | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/894d2629b6854d897b1a4e1d006100ca81e52f1a | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/dbee04120dfb4e0099350383e30462672b442a65 | ORPH
    sh4a     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/28f9d10df11769a47c8190615400d8b39ecd31b3 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ecc0f4c15b44206091602b36647654675a01fbc6 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/422ee0b532c03e1007824c3c8cacfc18463c55b8 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c3350519070d918511d42b311b50142e7f0082c7 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/702accb7a560e5124a3dc4903e3a88acf4e04f36 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c77f8f832add528358fecdb316a546c4c5e6021f | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bb66b5d29c73244d22149bfe6deea6430c0ecea0 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/95a4f394539842deb4b218967137fbf7baf63c00 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/99ed303c1e27bc09675dc2fc5d699a42fc319670 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/563afd36ed68b70b830870becc5d74e329bbe497 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b889ca7ff84f0f41ee4eca712efd378299e3e0c6 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6376caec9d7ebf88492b9c190b580fceea57fdef | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9094e21189d9fc4dd584be5f4e6c70454c63db7a | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3164f76fea9c6bc7342fa298aa62549e52143c63 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e95c634e6b09077aa2cf9104b6e71028f4aec1df | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2787ad06a297b0cd412b578aa7b1daa901a94203 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b0819d62f35eb7d18ec755eb8a26c23545ad93ac | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ae2748143ac4a62bb122431c7ec9dac68bf59b2e | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6391be4974e4c6d3d4017f607fa22e917524124f | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8524783bbd150a414cb00f4a87dc4c1d573d4f32 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e7cb69284303030a649ce3a0aac522efc4cc4ef9 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b94f62dcf1c43f19570184e01c6b887d500cf203 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/067fa4ab1d630ecb6dee498e72f99768885fb393 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/07821b27a33cedb615db578369ed1f2f20331de1 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/98ec3a6fb960a97cf7f7c581fefad4765d0b9f24 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b1234b3fcacb242fd76fc6691dbea289dadb5dfe | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/10ea7fed338853db446bd523d3aa67ebd6f6427e | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/dc14540e5f70be245984db5348edc56c63cf9aab | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/172b6b8c3dcfacce56aeeb94978b520d819a8dbe | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/629b76a36fe5be154eeb33252cedb2b0dc05199a | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fdf95eb224ef1ff407e7cecd8c34928f664ef191 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c9d7f541b183110318aa9f0136d881fc407dd217 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cce87cd3a4fda32c2b7750f5fd5f36b7ce3945aa | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fb4ed892cdf8ddd622465224125ac80e41346309 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3b8d3b3d337221d5181d24be2a46b50d23d4b63d | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1bb13383d128f6f005c6161893115e497e0de01e | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/af85c4de55ca5aeeb855e3c17599b89424a85c3d | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d02dad8bc29e78ded068c9593d90b00fa10ca059 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4a80c3f50c18d96871c197e595faa61ed8986934 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4e0bbb4340d9e275668845118de1fd6af4d0d4fa | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1715bafb4d37409dc896220d3e0001674906be44 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4a6880934713b8b708920e8dda6894f64900740d | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/70f5ac05b5fe124ae35b05d37040e82692e56cc4 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b7a03c812adb924db2e58b5ee9f942e362691679 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e61db5f177d82b93299c0a612a39d6d254f1e509 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1b76f9fad704f2fb1c037b78ed812876fa3eb0e7 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d3569b515880c0b803f722ebbbc73f921c2a290d | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c2c2603a87140f5830d3de1d0e0c208f4c4e8595 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d81f3d19b7b2f6ae79b1ea8766bec57b04625c97 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/174be4e1bd92b7237c6134ed128a8d06c8d43fc8 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/901593c6c99416e912a723b9c0459af6cacc6327 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/13cdba2e3b7fa82597d8230be8863fee6286569e | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f50b1fad0fb83ae11afcaee1c043600a7aae09c5 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/00b1a63a86477e69ae6b3dfe7570a06ea834ca77 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/35473a8211a2a13ece78e0a98b0259204e99955d | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3d9c4619b6a48df8ef14d68eea9e7a76c1084135 | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7fcb22dd4ca2672e911dc41d5c93b2a5a495a80c | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/21c3e7bbf5ef7673d0fba73b2d3208915ad80785 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/597d474b84329cbd5556d96a1624ae6bc80d7fe3 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3851acb4a9d0095a75d546f7165f484740fba140 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c19fdd3ca2552a375f0631ef97af421607892781 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/282634179f7d2868f84245389d00a3fa48d689e3 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e3f614c5d75c738ce9ef1d195ba8dd5794aedc6b | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/16c0d59c608059faff530303c5c7adc1a969c1c2 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/08e39ebb8121e7da306cd3754126dfaf14e64ac4 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/97b18ee7604dbc8af572a654bd849909a32c3612 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/63b8c4b123e6f3aab8cce3a9350318eef2b855d6 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c0b4b648cbf2769e46f03505d73ad4b0f5ee467b | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/97ef870aa1284beb134ee811d1c5a994673f8af0 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/87dcc8f792dd1fc4ee2939b04b65b9439b5c5c9c | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a956a681267420cb0907d0faacdb12a6deaa7cc4 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d3ab457c3418768a55d2ef7ef2a3ec747373ffab | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/72806beb1867d52b56951657abdb3bea0c52920b | ORPH
    sh4a     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/34a0170ad99016b444ff98e4f8fd1656a1df48b9 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/154560b3d0eec89accfd47f0294c1bfaddcee0a1 | ORPH
    sh4a     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6c69411ff4437a195829d70c7a7ff71d37ae103d | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d46a56f6a999d748b8a8f55d54ca1a816c8e6d7d | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1f3690eb3ef529289e874f05f1b072c687004c1a | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2961bd22b5ed2f808a7d68e692de476456c67080 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/54b80500b08a22f9bb3c4f4ca03158487a9c9f5f | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/31507b55a8df6ff2535fde40ce24687a81795809 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/99887426cba01d75c3a10d83dfd273b12036c5c2 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f88edb1f841b8a00b6833cc473a6788e44c90877 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6b2669f17af78838c7c76144fcc3e1d93465ad0c | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e1f48ab4ef8b55648dae3ce4fd76d44553066d93 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fd68689d96a5cf9cc11e80ae4da178cfc7e49b50 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b84c1b405e0e34891b054f256efc664b9395400c | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d27b32c21fe0b2d32f4e39bf8831f856ca1419f3 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0d3f8df1d5d8d3015a7ac531f5adc3d768639c96 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8091c862eb00c0c4f8bb98d87d9c714b69511aef | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3ef21cd5bc3039c40a7bcfe30b35628f9086d0d5 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4c8a4fffa18c5030869d5f11352328650533142f | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d4a8c6e822ed2df90f529289d5c90a35300d0a8a | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7f1817fe98dee99b82db9200e58c02e4813c942c | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/28376bc561599ca1ef547382e64d148b8ac39d2c | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ce69aa0a047c72f8c7523eb7a82f03d7eab03171 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d7da976730c824fa375c71c2a3b3012ec8f18cf1 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/713089722355c66291ccf5b572938e3268c5af95 | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d971c52d6619b1607fabbde0a3bfcb1e9993a3e3 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d34c63f9789ddd4c9fb635bad8d1c6b6968c3ad4 | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a680b3f689dbfb35a73e8fa82e06c72a1d4ac809 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6dcebfc608d9833c419a3e6386b1699806c1c5c0 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f4fd5ae8c69eb2dd0e23bb1bd4b2aacc5ebfc5d8 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/998983e817ffa9d5ee8ca194bf3ced8620d04c91 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f1e41df5cf5a1bb6731995b9c2cd1c9c8295477c | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3026af17e836e0198249096b69fb30cac180e369 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ec7f852b151e1b0fe985e5dbd9460a6fd28cd64a | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1bdb45b09e40ac673bdb264bc6ea820f1960ba12 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2d19b0e2b147673794e0140b3a2c7d01c2285d0d | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/47904b610937134ee8c28fcfd25e2252b35eb601 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0d1809f461a18094564ddf1746425fd2be9ff8d4 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/398bf627fec7dca5def9bcc718a8ec0a30bca600 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/122f498d5460c04853a278d10f1d48f9c2bb3bca | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a3156059f1b1d3c473f69181a8485acdc5827bbf | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2a576069b7e16f780a514d929a60559e873ad78c | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e0b7a3c1f46245416746b9e81929a6e8d94828ca | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f3d8a9cd4d956d5d5e610edf09f8f03849c1959a | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/008dc962e8907d41b66660f254ee5c4121f1f765 | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/20f69532920be5b9c90853584f5a9b059ed2a143 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c2b1110f496784a56c94b95ed3aedfc1f2dc404b | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ab8b620dd444c67e4f118a49086c55e13c01e447 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/824c181e3027fa74105c41f07e5eadb74bdeb742 | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/384385c66d53184995b932ad8d155d15358bf3c0 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4ce9088f28b3b113ab6bc7a36eb91ae8ff142c2e | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/345865cfda502aa0f8edae7c1e62c95e6c1b2ecf | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a1f227c3ff4ee0473ab73a8cd828854824ec4e21 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b52a4d1375caef82c5077aa2bb6dcf80c60caf46 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bc4402cdbb707fcfe78a6019ae0b6ca92626c3e8 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b9987660a80b721a1feda7495d25f98fed9857dc | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e186d996bb9e54e8fdf1c69e4ad5004a9db0686a | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e8c7a911f639b982b15f71d63c10057991b0ee21 | ORPH
    sh4a     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/439345766b817188b420a4b6b80e68eb6b50e30b | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2893bbc6d7b237ddda75c9338ef65d665b141d17 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/58233aff9c13943f0668ae058f9fca8a5004bf70 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7fbf1be648cd7ac427391ee609c257c1a82a0232 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/663bc54bab6e4d175f4b7b0cf100fb05062a93be | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/88011358a4afb72b4262c677c60939f2a07b64e4 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/562c9882d09cf6c1991d4477d3f22cb95c7052c6 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/48a919fb3166aecedb40902d184e2c04518a6151 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e4646b9f2cb7fe6744633cb7920d8681d60d4502 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/016eeee3fbbd65cd939c285328659fb5217bb772 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6dba6c32c8f214830455e53eec2c5d5d1e3124cc | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9ae0053ec6f79d165a652b071d248443902a7fcf | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/108eac36f89c6b769d0d0b6ad7a17ba32d90c31b | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3393fcda36add16888406f0c93367ba253b13800 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/061ca51fcbd0bfefe79467622c591b9e7c5534d0 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7f6fca2a28225c613af21522f278b5ed99df67c7 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8dcf3909b4041973891d0394bae6b1267fe9cb37 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3dcbe62e532d7bf42f0f0a9492611b114db84de6 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a2f48e4c9d264bd8172b8264bb9f013d67fefe28 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c13cb5077c569acaeb869190c319bd4ab1b06afb | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9666c95c29a6b94a5441286afb454052cfcfcf2e | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/10721ec9bd8d3d56e433d85db91a7ae1cec967ec | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9fa2db413daa1c4f90e62b8dde6b66959e61e337 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ca6af21d34d49b990e1dc97e08ab8bf003754f98 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5bf60e9ecfa44296876c77ee2b82e7734e65ad8e | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/05287733ae48625ae493eacbefc85bbd4efc7a1d | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/29fa5515d8a526c2e011a1448a37a141b542525c | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/73ac907cded2569cc6a54357fca391257f50b287 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9805d4a729aef6801c360bc366e18a5880e951b8 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6e0d9470cfdd5dde15f7f29068b63bab50090813 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bd6f16e2919c61cde82d27ab1d593edd0d6be148 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b75397ad055f6edee33528cc3b890b6d2a0f6fd2 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ed760b30daddf36729b277e9e87c350177a51146 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/96c5b72bb8051772801342f26f25848098a16fd8 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/833c9db759d19d34f39a35300cd7822053fbf9ed | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9a39f8daa7461007cd6c24b2d26749862a35000e | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a0344c368ad3d1e8d308af3485aa984ca8668e35 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7b2013daa6792fb2ea18669cec587a8b78a2edef | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5efa77cb58ad7c3c42c1494a22e27c6d02653b72 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d659606f953920eaa88d2bbbbc031d97c0ed021c | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6526f83c174eaaa96db5ce9907869cfc243ab1a7 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b2c4e8fe04efc12677961b2e2ebd1ed347dc17c4 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d2ec78582a5f944b3cada558290b6cd9d73c8bdd | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/59716ef9167198de7fdc9ec2f68e11bbcf1ace44 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fff1799bdc63c21da8411b46dd9c777c44e0f702 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/db97375dda1fa85509fe81109f8ff3bb54bd4fa2 | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ec31bad91179380a57dc68e7f5590691e0f0839d | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fd3d6cdc4ef32bdbc544e673b7c40bd5988477e1 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/88dbeb0f4a4217f6f4c1b66ee55316dc049b3c94 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/85bfd6829dcc49fbd8da9631c0e148f6a5cbaab6 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d9eb1fff4225222fbe5d2505fb9b348fd2c29aab | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/197d624a6496ef5fdda05e8e99aca544fc9c9bb2 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/486a21e56231b4feed763a7f15dba628762d6ee1 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7895c01a5a4a6a2fbc2144a069b3eecbc6de6f96 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/65454ae9e6b65fe5341dd9cde358373d9a5c9cf9 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/65946bee2fcc401363b53da6f199a59e2d635dac | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0181166bdb14e6cc510b7dca056f5864af28c524 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/047b273ccb229d291ef9444e13ae45350ef3135a | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1bd44452c672834bb7f16fac7189d8ef5fb590b5 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ee1a538d97f5964574ddb24f1c9260f62d6cf65f | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3b3908c040c05707d5647e6c2c474c4c55ea5a58 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ebfc426568624610f255c5da8a943fda01fc73e4 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c8bb76aab277434cddc1c95558ee35335955154c | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9fa10e5ea6d54114f11834822a1002a341fe50e0 | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0e227894b99498cf5b89d87ff9ab2272674157fe | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5e45701f113bc9714a6ded91c9fd7e01ba220878 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a7a3e71d5375f68e7a7d5c24595119fa2f93f921 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8500fd1afe796f1f98a9995e2c4e592b9a9ada98 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f7db316d056690694c56abb54fbbbe1205336778 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ace5d9142bffb1734e64308e59720df70b117f73 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5978f15d4c5f21489272c3da4af28c78753abaaa | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1276038a70aed301061c1be8b6827bc7f08cba39 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/97fd49c2523cbbfeb57f0c3973ae048b54307f92 | ORPH
    sh4      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f8cf5c38bfc5c72e5fc6d9cdb27e79e7c4c23ab4 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0b9f63a264b963f9cadb663c106f0f9716f88b72 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ddc78cb573edf77584d55a909aab2f45ecf8ff6b | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1d5ce845e1d523e631c5f1c1cc44c36b3c03ffa5 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/121c914655a026306f3ad00a90bab3175eff70bb | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6333d09cfc23458548821c2e7247b8543063bc02 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/184cd409b072ebd708b286e385efe576395acc46 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/db755db6d72352b25d1b2914ba182ccb77d80f83 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/77f1820954a9b72292ca031c46f2f59366860382 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/914d9b7d44025f499f762584e377ac074b0feea9 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c1ecb15bbf22f2b680e6bedf0df4289cde967cb5 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b7912319019dea7e0b66acf6b8b12e91a931d190 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7c29e59798ff8e037fab86c8af8ce11e42f3071d | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c372ad2faccdce291390e91bcc5cd9f790466ebf | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/dbe03a060ee5cc306ae08a932c19071529837841 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a2f68d086e3859c4a97befca94086df9bafc60a7 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/df72abe75f3105063e0d91d9485483718628d1eb | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/da0dfb44f046d2b4a461b93317beaea63648a41d | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/886950dc62b7ff2c840ec2566368f0895af28e14 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9b6dabecb3d1a2b4ef8881a0346ccbcf761b209b | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7f696cc9f887a85dc25818548be8dfdf49d3a085 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f0f8036dfc0865d6f7e42ddeeca5f9a0fb190766 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/629dc4e3373c1bb7be0eb2ab88fe6b136eaf447a | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d0511ec4e598a681c28629979903ca292414221d | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/eb4b657b6247145a0711c6e7e67085300f4b3c96 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a5d8d226579b8f90247aa783b9d847a27a6b3ef2 | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/724a9b8275f22e42e3201f1d435c0cb59e52bb90 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2837207945dcbc9aa6c2a057bd2c8678ec47a3a3 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9b12a840945b9187510c704130fecd4558079e91 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bee3dba071725daa3a0b0a6cd67829c5c36c7c56 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/044051e5d48d7be829edfb91ca99042e482814c6 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/be08ae063046ba366b1dc0d6bacdcb2ed6b85d68 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/206324d1f9bb4f48482bad1ae8edd7192079ead5 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/86fcb528bbd1b08a23cdc759e964b5f22a34af02 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0455bceef21a1a01ff7878ae70855efee8235e6b | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/273bc3a1828bf7b2c91d805f68da637e24a5ac1b | ORPH
    sh4      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d38fc2dcaf3d28de15d5cabb55f2801037d1ad33 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/07ef56ba6061c305c18c10c0373182322e1948f2 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0117da9ee61fc97a8dce9cd9b572a67f72765362 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2cb105d2d7720a2053ffb81851407a05a973565a | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0f9ed81d7881bac47887c9612e9721c4bee958b9 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8589798d15b009342ca6591658fa16767f2c3136 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/364ec7dc40f0c894278430945f4e061dac48fd71 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1a4776525aabd989c12d983dc345afd66ea0d88f | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/35a219604c6193a3d90c9efa512934f39c11702c | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d92ce8cdfe83da7a95f3ced751e09ca504623416 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d27519594d3d210a7cf9dbab46c59b5a56d74c06 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2e22131482d05e57ac2c7a9dec8b583bb0f446c5 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/237b62ac3f90a20f9f027947d111d457f4bf2be7 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8995e8b5a626ccfe72cc4c2260a390d1b9fe29d6 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e1d809408ee5bcd16a282f180fe59db4dcceea53 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/39e736764a9772b58a6ada9aa480cc4ad3396e1d | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1d1c2cfd3c83ae57af323e75fa6c4105b058c514 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7b18a58def555141019595ab53b5c45522d534ee | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/953f06609c3b8e3143a7f1928fd5e494034aa09e | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/83258c9e55af754bd411cd627448386f02603359 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e06024ef343421f7e83e3a3f2023cc2a6dbb0a42 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/aec23982df414425f65f665fef38aec2e3ed7236 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c125d54a958a88670d200ea6d5e137f84ac0b7af | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d3bb8dad1aae112bf06bfb1509839c11d816a990 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e5921406606d68c2095836cff34b5fe3105c8a1a | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/94ba2dc1d8c4531b7d291026848ee679262959f4 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/67fe3387a453579a5e19ef70edfff35da8d46675 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/90bed77f28457d936177b5e8a4c9b4dc77f91c49 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4325b35fbbe9583be84c696bb7018e9c658cf19e | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cad9f1efc2ef94962e51e23d40b410d9e191a8c0 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3d7072a0b6c6c45ffaf12015f5054766af8e9f9d | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3c406717a1f255f26051451285b2a9a939eab918 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/21ef989cf92f14c3bf03e7307da5cf59e34e6d0e | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a89e75545f56397a72080358e638a12699644774 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/176cba6b25b4535106dc282879dcf578bf6591db | ORPH
    sh4      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a992315dd62a6f2ad18e1d29843d4307ec627264 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3161c689c67c7b5352c70442ee9e209e39836a47 | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0f978d308d18298a9ad4ddc6cbf9222cfdf8cdd8 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e28383cdcdb852e1963e4b10c498dd8375e2457d | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7b8a64e3759473db46c916bc18e0f6c60e62c98b | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e2748ca7a70cdd60586a2f2b6ea1ff7cb86bf73b | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e4183445a44bb3f8df7fede81420000e57645ba8 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/88dafdc9de108e851813f16389452e9d08d32d7d | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bcf39d7a04085fe44ff80f128af9c8ed9b9e0069 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b8ee112e7a6ae2625d1986a935c5195a396a58e4 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a561501a6eb7f64221ce1b9aaf58b56a234e1032 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/11bdc42d7f7690e14950d5e8633c7bc9535cbe7a | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5aa3fe90a4ec2fcd0824b91292f40805a71f36f7 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/275fad189556b2c92c04bc7bc6a1b735c85edfef | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2dc17487fae9fdd6efe31de7f68d583ff22836d6 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8512e972785c090a187854a88f8257dd5c6cc60e | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7fc399098e4ac578848fd3ebdaf1cd2fe46d5674 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ea205221828bc7201fd80cbd52e24a058326bfb2 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8af284e17797efb308c50fff15acf13cbd3019ed | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d6affd7489f21054951c5e9f108fa1293cca2555 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/106438b53b446d0551f37e8726a4407519125a57 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c011d00ec23d9afc57ad6769d7596ee934d107b9 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0851edeeb04ad015aac5431ff795dbb3c408cfa3 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f937418ef918e48b1a690b6ba1005433d8673b17 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/af81eac5836c7135be2cf24ea56f427fade34664 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bd127799eef30923bcfbc1f0652cf0d7af98a85d | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ac13ac69b0fd1845a3353db0f0a84c9dff68caaa | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c9f0d2b0d78f35c6d6ed0372983f6857d020a2ee | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/330a9313bd2a652c32c378a3be1c89d5c80ed5ff | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fb15e87af72b2a2219fa68959c73fa143ac35426 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b3d686eaca51b4d51b89650837ea423c3dce10b1 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ef6d575023717ec5609fe6dff491a755bb26eb9c | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cc3d6e48136dc315590e0b27edc80fbfd6404931 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a4829ffa6e7c7d7ff17ad67ec2d840ae523726a8 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e443d0ff71181c1fd68b6b8506d8c0cff31e088c | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5f5889307ca22f9c7736286e48e8b781e71f6b57 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/adb6ad7788a737db2c26419fb74e21c4236b1e44 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/30d47e4f521f634eb8538e761a8b6cd8b980c1cd | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/164ff39087bd3612a2f6c92005bfa915084fda04 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8f687bccea14bc80a2524799bcf31d0934c570f5 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e7f065508fcfb94950bd846f3c4b2163deaecb6a | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e07fb2bff02a6982b52baeb2e44632133c2b7d03 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/208083ab36b747e8b6c5d025ea18e7e73ac44d19 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/873939204a5f01166ce2f0c8bc651673810d7c77 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/32049b7f34f93da85fc1e18de8e8fd958309de1d | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/dad08f42bd3e01b15de93f3d0a1a2a6103478746 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cd782f9dae6b2671c8af1084b46d860586a6c902 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4bbb4bdda9fff22f43d8b364b5952a42da354faf | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fa649e433c0df44f1706eeef90e9c599b5756898 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/dec6c67b3a2478fb2b7eae6c9718e68aa9140030 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c15ab4131b3f4f63265bf20e7c5529ead325a18f | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/516465b0422d8b7f093bd348928c50b1d5ce9238 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/90c28779a7de6bfb2897abdb934989e3671ecd06 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6a1156d35a0c78e2b4f9dd69efb4207d6b83f24d | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9c5f25708e1704eaebd829b79545a11a4789b78d | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/22f817323c1303cd67df28d1e35a7a478a6c57d9 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/530b3cff8785d27d6421c8f6b04539539d71fb48 | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ce84f6c0c4ad32658267ec72de23b595bc6c4315 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c098dc169f7887f250818b50ab580f441cd9bda8 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b0ac8641961547617a9280edaba6bd0ad8183d2a | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b4374ffcb9ea329032bc276bdf7268417a7712f9 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1cabe1f0e7520f9736e9bead8f20cfb0b66832a1 | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3088a60b526b6f847c1c026050ca7f398e5151ec | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e87584e005035e3ebb0336d102137b51b91e4906 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3be10b5ef9e7211dfd54ae72ae2a32b42043c976 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3b86280ff403ee5a31812fa7e62cad93f18707a5 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b2357753861c1be09367966cd8ae16035420a44c | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/38e6928bf4ffbfa52d9a497eb1356453cb61eae0 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6a2a89c47f50e7bdcb7c1a0212b096b294ea9c2f | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1123c5ede51be982787f061f7d691c9436a8ce5b | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/100fc24016b5f6dae691d63785ca9b8eae304aa4 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/96105c2e770ad9c3e702e14de309f521363aff59 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d3401fbb41f96076aa3ee968f43f5d3894b2b42e | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/868a4bd7f738d8fbbcafe56020d3516c78d1c980 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bc5b4c4ce4a6ceb35cd392b02416105b0faf4c60 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e183da43a07f02d5e54c21ca6058a4ab5db190a0 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fad8f86038117ba928acd962ab18986a2290d79c | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0a6a1d616900bee38d1cf54745b9ddb7d266ce84 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b9247b4033b961d2f12cc23bafa5055f1eb08537 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/44f86b1d4f328be7b1340677a9d75148c822a2f3 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/26eb9ba3ceddf275e75d64536af8a4c43b245b71 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5d2e710eac778f6b7100abc3b4ae9f2cb8d69c3c | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c4bd6020de7257818ae2d5bc8ace2a0c52c90a7a | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0e4c41058efda7eb35e1db6b6b63db963735106e | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6aa545b512951e320dfbcfe9f58ea1b05b345abf | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9b5ff5961321dd228beccddfda9a690ca78c7583 | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/77e150f5f63ac053c4a29ad674442b3fa6ede811 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9ec0932f7a40b30817cb8959db84db9d34f1606e | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6a9c14c8d57df4ce808e9796555d5132a30f1fd4 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9db39c77f25faeffccfcf42525df65e8018689bc | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4e4e65fa37a470561da22aa613bff399510af271 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b150acaf35a1d872a4f8af67c64a7f98b6e54542 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/28140475d35f91aa394d4dd5f81a699bd654f2ac | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/29a85d57eee2bc0c3ac503577b3c5861d424f6e9 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5cfd247a756be3ed66112896cb2f4219f92a1b2b | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1e8fee3b9d68c04d6136f2d9cf64adfd5dfa8626 | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8733b9cab6f247b092b2627937e84f5ed3e72183 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5192edca67214941ab3da98b27f59e2a19ab2fbd | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cdecf4ea7c852a82b3e02ecd98bcfcab98a68dfc | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1c4b518c0032380eb9fce0f89f35409670f59c66 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/de3d620e64fb5d8b9fd7929be020932c7fc2858e | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/96a1bcac5507fe8189f7ca13bd58e6233675f60f | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/68d353629b6a8fae826badf880c87568bfd0f5f8 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/995352116d685fb5997fc9f3a86474b2a6b33abb | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/92f3158cbed1b029e856a26442a1c51e756f8b94 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/df1e30dc2c1f5d1e48dbd294cd97672dcc4725c4 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0c81c762b8330ae3da063ec1b719fcbd0176ee2d | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/144965b7970d6c3d69ba94643bbac08794f593e9 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f04d1385c96e93dc79b4cc34a1a2ede75a90b05c | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e8d6eb6d7effbb25da3f7695ab718c48fcaa3a97 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/373bc2713003d811433a3da1830f6e5dee0abf96 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/106df75fd0052c061d6a1978e5f4bcf7f647aa4f | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f6d62205ffef143bba2421df8f59f6860a88917a | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c5db5ced9499e3c4c0e1028625bcab04604a755a | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ec59bd445c8bce6f6965b375fe6044024ee70d20 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/61339521b8dbc0cc3e7dea2dac5cc1319a0fab09 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f941de61c0894b34278579d24355c76f16df3a12 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/48c10c34691b861ad0da83fa578a68fdf925a020 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b8fd6c2c631e0ad2a6a23b180d7d6df967717c6e | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e09ca58604d25c7e71d45a60cd2853b9874736b5 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/961d4f241cfa9439e8f76d904f61899153561334 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ae12ffb988bb8b2e03b4be54e2a9f2b14c1db55e | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c3c88663037f0cf2de5278623621a9f53b0a9a53 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b808a097c2a4a87adec26157b8b5f10a39280d5d | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0272e90f73342880d3ef544ea1f4faf1d62709ed | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/932310b8d8cb3f27bb58749d2f0bb7d96af60557 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/59ab0780f5029ec7b24d3e3d6e0957fdd73a358f | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1d7bd44819c2a227443ddc7ddb3022ed563ecb73 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/44d0ef3e49fa00d86d0e13155e1a560c64743de7 | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/39654604986a59b7f9720947736a057a25bb9a97 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/924f7783e71cbed432154c53f78add2834ea8ed8 | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bf2c19926cfbfcfa00b5b8fff6859965bbb2a805 | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/972ee0acadec00cfa92d4df18b0b8b99ae81c518 | ORPH
   arceb     |         host-xz-5.6.3          | NOK | https://autobuild.buildroot.org/results/4f1b6721be73da55851a7e294a8d4b2bdcab03e0 | ORPH
   nios2     |         host-xz-5.6.3          | NOK | https://autobuild.buildroot.org/results/c17dbaa25f779626922b0f09d774cdf3b2813af3 | ORPH
    i686     |         host-xz-5.6.3          | NOK | https://autobuild.buildroot.org/results/334cef25c8ccee849be289f4ce2832b5b8b0fdce | ORPH
   xtensa    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/8fd48413a96cdb2e10137f92356510a28772d65e |     
   sh4eb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3fa7fba04b7751ae713275276a647eb984e7b3b6 |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3cf8c5f91ab45d4e09cb5e8c136304305052bb39 |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/37bc7b00af4dcaef74f913f628f12231dc5f4e77 |     
    arm      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/15417859bdf58f94e9a3c2dbb185b40d9de58317 |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/0cb3ed4193b0e1754f730927162327fd93ac9fbc |     
  sparc64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/7c9e2c642ac1a91162ba00e6abbb2c6f1ba89877 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/965f53e7b85b9897d81bfcc4c6710ce02bd0fe4c |     
    i686     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/1a5c90406123d84970479ed4d91ff83cb88e9db2 |     
  riscv64    |          libnss-3.105          | NOK | https://autobuild.buildroot.org/results/75434e8a6da4ac5b73d305ef01f07d62539137d1 |     
    mips     |       libopenh264-2.4.1        | NOK | https://autobuild.buildroot.org/results/67f7c4314b2f033fad081c298124409be7cf3ed1 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d3b9964b8628893abcc606c03042927aabd01b7b | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/bcaa4dca506abc42fce32f5d856aa6964d9efbd0 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/8ffafe440674b5f8dc6f9d551cf82d669d01ec67 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/521632c024559c0039877a8b011f04b6584e914d | ORPH
powerpc64le  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/6ff86ab249fbdf8816fbb5e34ad867417874ad4e | ORPH
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/587d910e37b0ba302ea6ce9ac06c0937808f3185 |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/8eb0a5e05ccb0577547cd7e295929b633d207c01 |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/f752160d1895cbf50417d0fe75e60376b26f11ef |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/f09333c861c40e7dbc7eadb6fcc0f4b34f5847d1 |     
 aarch64_be  |      libsoundtouch-2.3.3       | NOK | https://autobuild.buildroot.org/results/ad3f8d5e132ab5ade6e6eb68799018df49bddb87 |     
    arc      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/23101ac7fdba43a1b6cc5ad81686a41767e84476 |     
   mips64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/f21c8ffc8da8c3e2807a6030efdd086edaef7295 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/7e619800fe8ddaa37f77489e35ffe6ab54a1b993 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/96b08078ea412b97a4719321ad0fdad4003e42c5 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/df4b29867cbfff3f97058c1ff0bc4377bd8d22bd |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/789076c95cb68243ab47df2813b21eec0a8aebc8 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/b47ee32494250c7ef9628c78321e51b64bc40688 |     
   s390x     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/9f96e11dd45868bad45816cffddb68dc5d07924c |     
    mips     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/d75988736b920355b81d6427d92ce2ae9bb0bf6f |     
   s390x     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/0123a394184cf935a07a1fafb71b1c0f41db6a95 |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a3813a1422401e8cfc751d10b0b6186d4374b660 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ec27ea4d19fe65f6f66d076babf441e7f2286d2d | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7774976dbd3f3a8b961734ab666dfdeea5fec50d | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1d9a9736fca955a051b2f5fb50d26ea74bbf3d99 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0b85118a801ec5e8782ae745a115c8d9908f595e | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/25bd44f00e6572bcdb836e9658f7e4bb6a060eee | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a3fb21e315300d6f1d7a5f4cfaf2bb71722ac013 | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c8ac33f6db9c4f1411411f3d22c7d4231fc573ff | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a72d4367a730f38c27278412ec7c09b6f43f8b7e | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4979ad1e03192b8ca5c54ee75edec3e449fb349e | ORPH
   x86_64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/dad8874805e53d5ac100fe9bc03a6010092c3c19 | ORPH
    sh4a     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/308e03f94f8684b796bf5f6d1662562ed749701c | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/9e04b3074e5d2b77f70a84ee22d7017efff1111f | ORPH
   nios2     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/35f6ce19cc8db6281b24419da758b28ffc227a36 | ORPH
 powerpc64   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/59ceca62c2fd03ff4b37803ea7d6b08774106471 | ORPH
   mipsel    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/5cefd7a02e821a760737c0e896e8cbfb923082cd | ORPH
    m68k     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/8e889516159d15ea22aa1cbd6781fc6691c6ca39 | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/3c71c73919016ccc4cf8192e2b1768722fe015ce | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/2085ed2290096b18f7c9d82884055a14997f203f | ORPH
  powerpc    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/51299877f81093e441cdfc95873874c4079d65f1 | ORPH
    sh4a     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/37b453084846ba10225245a47db4cae81275476e | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/a38a287e9a9ff38e72ae957d7996413730fbc3d7 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b96e8937e177a88f85a166f5cac653591b701d0f | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/dbcbd836d4119ed78c0390569931567238e0d6b7 | ORPH
   mipsel    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/34c6336f0dd84ee885f8629afd5b70bb87ed8c10 | ORPH
microblazeel |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/8d58bd640dea9c985add0b72946e4463ee8d9165 | ORPH
   sh4aeb    |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/9d6ba5eeac5a618f8064fce2f2361869bca3e2b4 |     
microblazeel |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/059d9e19f7f0bf3df76f184a73751d992451af2e |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8e6124480ba814673f62225aae27c74b33ca7e6b |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8592c6bd40461e0dd8d739a8b7a95cd44e890cf2 |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/1a4dc8c6cb2dceaa8103a6a57130ba0b88cf8e4c |     
   armeb     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/00bedac0cd706aed811bfe05aba012c1c9d0723e |     
   s390x     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/8ecdfa1e4d8ad2b93ef22ba0a4dccf6fd86e7798 |     
   mips64    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/3ecfb2d9ee40dd926979a9f8367f1aec69762362 |     
   x86_64    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/65e1ac7fc51a13a18c882e2db3f23164704fbd55 |     
 microblaze  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/94115fe231151fefe1e7476c7aed2f9f920eed1f |     
powerpc64le  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/fb144ab0575cadfa1a34a78ee5bacaa911dfe95d |     
  mips64el   |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/c6117e51a0702ff8e511b8dae131457da0e23cfd |     
microblazeel |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/3d96035e978f764d129434e0ec3038cb0a8eb2e2 |     
    i686     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/561f5e7e4cf6883befbd49bc1ac861929f4ce1b2 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3888651c26ba0f311734813b3ada288420c4ae60 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f2b325ae3ee6da0bd5b2335136e8c4c0b081ccdd |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/65913b16a9821ee340c1fad19ece8a6dc3220930 |     
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/4e74679dd73dc7453f043d8deabc01e84de34a73 |     
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9b423f86134f121f4a5e5d8a2127a5e6c989470f |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/ca9e5eafb052e935ca6b7aefcf8fd3883b7b63b4 |     
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/02bfe74df0b4c5eb7418d9ae1a727b4f2eedef30 |     
   armeb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/a163be544bf8c8a95fd6cbee1e8613d1738ff29e |     
    i686     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/936ca0c44b382b655dad9e5ade9b0641998139b7 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b515b151ed5df82b3824eff742bb12433d6771ab | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f35b3efe21e12682d650eb9524decd2a83793d10 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2dbf14f1c5950ec903cecd0e2b8dd68374f230fc | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5ade2f04462998cb6d849240c56e22da928cc214 | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ceaf5db7401e43e93cd7a9dcf6e194432076474f |     
    sh4      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ea5966ad693428faa012c9c4a8abcc016d32e628 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/fd6b07b73155171b1be7c895d72b1a0d9b56cdd5 |     
    i686     |          sdl2-2.30.7           | NOK | https://autobuild.buildroot.org/results/075aa310a34cb783eb984729d253fe368a8ce22c |     
 aarch64_be  |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/58ce5351ede0b47507cf3b28c680343da46aff5f | ORPH
    i686     |         systemd-256.4          | NOK | https://autobuild.buildroot.org/results/125051195e402dabe86b9ac7ce6bc436e901ec42 |     
    or1k     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/e2bcdfae6020cbf67686135364f4955ae1187958 | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/3d44491e5bdbf79658c07dfe10d9136955faa9b9 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c55edd205c8c88076659dc32ad44ad5f7588e589 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/cc2ecaa006afca50be22aa2cf6aa9a541ffc0277 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/5095b23b8ab34270c0e32f7c36d553770693aad0 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f693afcd9b1a0e4d752837b7741744985fcfeff8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f61a9adf8edc679c2f9437a34cac682a5295c72f |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/2021bb88aae1443c9cde79dee784600432f45932 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/539c5d9b8ef089c0e2a01c30b8ec444eaa89607d |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/50db6e5a03bdc9a55b76c98b7d14c81e4b07181a |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f8e6144aed5441ec8088230395cf5ec104a3b0b |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/3a6eec189da425792cd3c584133127dd4d25fb8a |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/d770404c973e89a79306217223f1235defd26815 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/919a75fea4cc9bd5948f2fb2573a4dd99e5aaf50 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/56b5acb2f7c1bd4757cc2d48e330f904e4496296 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/fe12484c894a44561a40ce3d31c641dee40af324 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5104b0b6e8f2b87b888103f15487e66fe430b6a4 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/ddbb952b4267fe56363422716076d0f97ee3c8dc |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6b88826b814e0bcbcf3e8c5c78eb97053ce1d323 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/3728fa33a51e403c06771d8735bc1a3d02924e79 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/53bd8d2ad0aea5f5fa2621d9686067ccc5030163 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ff052d2954506c4b91fd70ec63e6d173d3a518b3 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/6f553a3eef3792c114f19b8feee62101e4e42dc6 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c1e2f23c554853eec5faa06e589ab4f7ba3c9e12 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/e7a082a7b7b9a30e16a87fb766759b19c0f8cf7e |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b5576710fd30f3cf5e83cb9e01c21e04a61c467d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/25c3fb5fcb3d7f5f2cdc12d264caec0e5cc76091 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5f555da0eafa88735569967bc83c0f908dd4a2fe | ORPH
    arc      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/75c19e2e942e9cd5e6a3b879486a0a37c1cf8175 | ORPH
   arceb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6644e3623d8d55ec003ea859dd7c0fbfb21eb71b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0bcc8b5efbce0254c57e4b54a42db2ab3514842e | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c0bbd0e629115cd484e46423066cf6af5d6e065d | ORPH
    arc      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5f696a41455b887c92b083ad80cfe20fc0c9b0aa | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/c0c65738959bcf81b954377389a044c839cacb4b | ORPH
    arc      |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/85e00625e6ccfe6ae21f192185a4dcbb9fd999dc | ORPH
 aarch64_be  |       zynaddsubfx-3.0.6        | NOK | https://autobuild.buildroot.org/results/c21e18c8f9f839aa4bda78f7475ad602e66d8dea |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                host-m4-1.4.19 | 51
             host-cmake-3.28.3 | 20
                 host-tar-1.34 | 12
                       unknown | 9 
            host-pkgconf-1.6.3 | 4 
           babeld-babeld-1.9.2 | 2 
            host-binutils-2.39 | 2 
            host-binutils-2.40 | 2 
            host-binutils-2.41 | 2 
               host-gawk-5.3.0 | 2 
                  host-kmod-31 | 2 
                     ace-7.1.1 | 1 
            host-autoconf-2.72 | 1 
 host-binutils-bare-metal-2.42 | 1 
                host-cpio-2.15 | 1 
host-prelink-cross-a853a5d7... | 1 
        host-util-linux-2.39.3 | 1 
                 host-xz-5.4.5 | 1 
               ipmitool-1_8_19 | 1 
              libopenssl-3.2.3 | 1 
                   lsuio-0.2.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/50eaea23a05e8e035dcfd5919129b181e657ccb8 | ORPH
   arceb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/594bc6823ea43109021c2113aaf6164d7ea63c5d |     
    m68k     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/b9dc62f1040004d5e310cdf777aca118f7858f27 |     
   nios2     |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/89f8528dec86a256064e4309784b2e50ad29e93c | ORPH
   x86_64    |       host-binutils-2.39       | NOK | https://autobuild.buildroot.org/results/0374a1462e2d3253d9818463e5a7b42370307ef3 |     
   xtensa    |       host-binutils-2.39       | NOK | https://autobuild.buildroot.org/results/3b757804a62ee71c300dcde69b8fd1da965c5636 |     
 microblaze  |       host-binutils-2.40       | NOK | https://autobuild.buildroot.org/results/aa42a73ee60e3ba6ec2f082ce3a9ff73eceda2a4 |     
  riscv64    |       host-binutils-2.40       | NOK | https://autobuild.buildroot.org/results/c1e183b5d7caf0f5203f58e6da24560c00a2a350 |     
  aarch64    |       host-binutils-2.41       | NOK | https://autobuild.buildroot.org/results/d2e2c9304e754799c3a9b1f21396a19ad74e803a |     
   mips64    |       host-binutils-2.41       | NOK | https://autobuild.buildroot.org/results/3084910b7f382b7e3b8711dab2beca0166193220 |     
    sh4      | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/6724c4ef1a12f0800e67c293a61f3cba6b47ea33 |     
   sh4aeb    |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/9b68875ead1364cd3d22e6c685f0eef5d6d42b85 |     
 microblaze  |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/9ff0fcaf8258d4729078f2e18079d2b03280e069 |     
    arm      |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/9a476ae7b20c43d0b4f73368ca661e5af4fead4e |     
    i686     |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/a4c38c1e837b4a91d9cb6c87070fa7e46e99cb95 |     
    mips     |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/970caf7df4ab2813dcb2d9761783b70521b349e7 |     
   nios2     |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/c06c663e50d17eb673caf7120b3e140863d02c18 |     
 powerpc64   |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/5c1d028ff9fbc6eba75f1eb355fa84e08d8d6e96 |     
   s390x     |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/d86dd80a48eba4b6d6b860c4f229299b04c24af8 |     
   mips64    |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/df2a2a7eb9e2125755eed15bcb39f305246d71e0 |     
 powerpc64   |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/d34f7388f461816126448be226a9affc033f5d1b |     
  aarch64    |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/6b09e4c3e37224d0338d42ceec34111a9a8c0df2 |     
 microblaze  |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/8e16efe27dba28929cc962080531e2eca803225a |     
microblazeel |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/62df6aa3bb92a5deda49b15f580d777e57c02d90 |     
 powerpc64   |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/5d5803e1b407ccc4c0d48c6461675f9ff9518e49 |     
    or1k     |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/5357716fe655316c90e4c77f365e3e3489e08e5f |     
powerpc64le  |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/8e05f844dd4811f0242728c568e103b89b53c98c |     
powerpc64le  |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/d0bea59d9f15b01f5509cd885f3a5d4f65f04402 |     
  aarch64    |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/dec627cf319141a25a860a62431bc2d5cd00abfe |     
    arc      |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/b7165fc26343e94ea8a93f0bcbbe4863d8a61a18 |     
    i686     |       host-cmake-3.28.3        | NOK | https://autobuild.buildroot.org/results/6321f81ffe3d6d9200045253fb874a628fcb2561 |     
   armeb     |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/102b1ed818302fe53c065b79889482929e8bb9f7 |     
   s390x     |        host-gawk-5.3.0         | NOK | https://autobuild.buildroot.org/results/57fa0545faf8d7709aac7cd0f1c57f4f347c0360 | ORPH
   x86_64    |        host-gawk-5.3.0         | NOK | https://autobuild.buildroot.org/results/0fecb28075b6242d8264ac65351e3b8c4b7d77af | ORPH
    i686     |          host-kmod-31          | NOK | https://autobuild.buildroot.org/results/711a6c599da358aa0acb451f65d772f8155ae9d8 |     
   x86_64    |          host-kmod-31          | NOK | https://autobuild.buildroot.org/results/f3776435f5897160c03a9532af70c81c238bd8e1 |     
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b90c03016735ed5d7a292320aa275ec7984307b | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5fe4d0ecf31bf60174caae51f09f0350ae785fb8 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/448efa9a7932d3be01a62d8857e0f9af6b9e40a3 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/37a0dd25a679cb50846733a5d4da983a7c189d2c | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c6eb38edff5e9f2513e6966ae976ecc151ba501c | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/45da87b6e3773ae2341548324bfe802e70c281a5 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/edcf3cf67477c1be87bf43c154e6615fe4e270d0 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cd2ede801ff6609e3ac6f8e76311f5ee9cb60ae9 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ab2f86a7e99ede225cf64dda4384a4f6df3e1e46 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/383790ab09f64a0a71e317bf6ccd93b4425fbe03 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6afbb5ddfa136bb9182ead066f7e7e5a19f77224 | ORPH
    i586     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b8426f5e0ec44035a862719ae7e74298fcefb9d2 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5afff8a1598f64c2f3db80f75eef4f643f0385b4 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8db0eaae5a72044c7044851a863e58d912da5a8b | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c77515e5c3dbb1f7afa818fca59dddfca94afeb2 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e10a50c0a60ff828fe45f65f5a96190fbb1a0582 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9254efd2b606e78d5af65a89a061e1d300ea8f71 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0cf7a3ad70d6f84abf19b4d5eb3bc931ff2f04f1 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b125ce2fe2df1d1eaa319259aa49b61c334e63cc | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/09e76fc7a97f24a78907bb23ebd727fbb8ffd815 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fbee6e120dc07c728c6492fbc546a8d39b3b30ce | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/96983a064bd054fe854cf1518b957562001dcf91 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb2baba81d87f2a0413ebda5b888524bd7b2ed1a | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/92ac734ee306ab5ea2001b1215cf9bf28ec3b8dc | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5594c3ffd6d4e7e84f0cc3f004a06a2eb2bbea24 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c71b81f8c6523edd6c77a37f3c79f359dcb3e1de | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c658b00273bca1e8c313ca214c7d3a5fa2830bf4 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b5859dec19e609fce4a1a9c5685cd42c381790ab | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4c1d493591b1810a0eeee46f1260fc77d5e61d54 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/01389a023ed0cb6cec17397bbb4bf30227f588bf | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bec0c899b1350029b2db22c42809c3dac6d09fe6 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e7cdad22f7f793fd5de6df4358304d4db64798fa | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/da77361a74d44c74f848702509dfb6abdb41b34d | ORPH
microblazeel |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/87bd5597af2bbd517105c12223928d2f00b7653a | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/57506f4aa49533439cc0f68bb811cc2c68aeb59a | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/02e95dadbfbbe3ebf2b7cc0432964adcf591d080 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3b3cb5d8f0fdb39bd3f3a9186a429aad2f83a5f4 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fa629578db657ed57e7cb29df74d6ff4ab593f51 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7b2fb4cdaba862f868ad5d5618d4a9352b82daca | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/888146f5cbc0d2c8de282ea0d359b770968ae784 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a23936d849a9c768a428ef05e502e68ad8e0ff1d | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ce0472caa5bd2a1806f7c6599bf2f639303aa1a4 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a9d9226d2ea4bea353e2a1148eb0c27e70b8923c | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d8920e9ea0ff919e3ef727fbbb537ee770ca6f75 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9ec42f545b904dfb078c1a23e54dfdf1bda00286 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/c588423370ac0bb19458d6531ed6474467349069 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/490d4119b97c2f8dbc87e09bc2528c08e5507c01 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/04337191afcad2566d2d858fa2b8454322cd1974 | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cacac896ce0c50489f04513942fb464b276922cf | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9a2f0d7c5c6dc5e0a503a13958bcf1d65f8402ea | ORPH
   nios2     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a0c6952d1b136c479ce75cdd4bdb5caa9f9cb334 | ORPH
   armeb     |       host-pkgconf-1.6.3       | NOK | https://autobuild.buildroot.org/results/bbc26dbedbf351e99b03852be7e6a9af58c05f4c | ORPH
   mips64    |       host-pkgconf-1.6.3       | NOK | https://autobuild.buildroot.org/results/8b599e0baae778f4cd3bf2f5d9a77d759b566a60 | ORPH
 powerpc64   |       host-pkgconf-1.6.3       | NOK | https://autobuild.buildroot.org/results/b9dd70d1a9108535b82ba86fa863192ea3a598cb | ORPH
  aarch64    |       host-pkgconf-1.6.3       | NOK | https://autobuild.buildroot.org/results/9d95567330612d84dbfd5c38944eb35ed008e272 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/ed95b5ae06e81532f79cff8725b9cab3f7df7152 | ORPH
 microblaze  |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/cf53ecd3750bcffbf931a08bcbe36049c6ccabe6 | ORPH
  riscv64    |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/fb318671b69a107c0b37d86df477e9ec67afad6e | ORPH
 powerpc64   |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/630b98949ec32563b84945a230bffa1a2750ebd6 | ORPH
  mips64el   |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/9288ecd60c9c7b78803dc2f0034c9053099a5237 | ORPH
 aarch64_be  |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/487acc99b613b498e849212a357759bc303cf6d0 | ORPH
 microblaze  |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/ea99cc1277bd3ca65b15b79197b27269c09921e8 | ORPH
    or1k     |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/51f9525b37b17268c03e88dd2813330231d7d3c7 | ORPH
  sparc64    |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/773bd524f19be9aa4ac3f1f1425d31825c30b3cd | ORPH
  riscv64    |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/5018bb01b3dc921c65d861f022eaf5351115a465 | ORPH
    m68k     |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/139488e8acd14d361bcde300320bcd7ef0ee6685 | ORPH
microblazeel |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/81739c58715208bc43df19fb7bac315780f8f795 | ORPH
  sparc64    |         host-tar-1.34          | NOK | https://autobuild.buildroot.org/results/29b005d12abd94306a74d7a5964ecf394a914dbc | ORPH
   nios2     |     host-util-linux-2.39.3     | NOK | https://autobuild.buildroot.org/results/f2e454b4dbf0d31eee3c7f6bf3d246a3ef49f94d | ORPH
microblazeel |         host-xz-5.4.5          | NOK | https://autobuild.buildroot.org/results/44bf41659708e7c073737ac0929fef3f8d99dd6e | ORPH
    m68k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/a94ac93043ebdc26b253b419a7f8b18a4f9a8d86 |     
 microblaze  |        libopenssl-3.2.3        | NOK | https://autobuild.buildroot.org/results/7c72a8b8a10f3755da7a40e115bc7dfa99ddc82b | ORPH
 microblaze  |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/bb8dcbe372278406c05443b26b54a88afd0d5b24 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/9e582877849968374290dcaacae4c0a0ab5950c1 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/f0e7d7935098db6381f84b3667ed2f7bf0ade8dd |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/48e5ac5bd0da6339ef9c50ead99810ec0e85a39d |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8d6ef81987ad06359b8035207ca6c071f6de42b5 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/67d1a7794286eed9dd0aadf410a7dafa2975e6d4 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/35acb543b4675188c7df06d49157d40aff75b939 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3455f1ed20229b2974a9c0c3327d401d0e652637 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/2a2f57be26d4f31aefff654f3b1b5c51a9bf1fcc |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/2d4e6ec98caef321d8aae12c60f94c7fc13447d8 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 host-tar-1.35 | 88
                       unknown | 6 
                host-m4-1.4.19 | 3 
                  ffmpeg-6.1.2 | 2 
                   foot-1.16.2 | 2 
host-heimdal-f4faaeaba371ff... | 2 
android-tools-4.2.2+git2013... | 1 
                   bash-5.2.21 | 1 
                  fbdump-0.4.2 | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.22.5 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.74.1 | 1 
           mediastreamer-4.4.8 | 1 
                memtest86-6.20 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.26.1 | 1 
                  ntpsec-1.2.3 | 1 
               procps-ng-4.0.4 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c05ff2b68466ce3bcbb5ca0451f1a16993465b74 |     
   s390x     |          bash-5.2.21           | NOK | https://autobuild.buildroot.org/results/4bfa149d8162b027c6d0ae4326dc68fd1516c036 | ORPH
    i686     |          fbdump-0.4.2          | NOK | https://autobuild.buildroot.org/results/0fb9847d899d28641ae1b6da4f8cec48bf96b0e9 | ORPH
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a02a5cfda0964c56b51c2128829c1394cabb1c9c |     
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/24c38515e6aa8c84622875d7e0d44313df80cc1f |     
    mips     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/49c0c5bb4ea0beb8e89519fa796bd3ae97d2d1b4 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/46e10d39f61060c04729c4ca1078790c4d17e97c |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/50da2d702c6de2315af85ffc2b30e69c99eeb8e5 | ORPH
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/e49f788fe8332fb9a1cd8b9cd2406310b09290ee |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ba6b098a523ac4b574208ad6301a522a5ba45381 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/bfca2d9f07fa4a7d050a221d8e9683b54c48a3c3 | ORPH
    sh4a     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/707b64dfe10aa19083f6250b73cfb77f905cbab6 |     
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/98176835f296ab4a4880860e6b785a8e6e7e927a | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b13ce4c204f1d57678e753c62eba1aca7443d46e | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/188314ac25bb72c39047140e31d74db3a379b975 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/c94979b793518ca49cedb1f7bd3cab662b4fc8dd |     
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e7fb5e961e0c3ea226c161bacf466ac3407e987f | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5141fb7a16b378440564cb12953249414a115e40 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/18752f5dc96094385c876244c4f90bace9be1e1e | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2e8118ca85642821cd5faa48f0d2030a3c156b8e | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f256e5ac9e41bf6f4fe0c8f522a3dd863fa37e6f | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e7dbdcd6943af221fdf1a5d7d755e990b4e00afe | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/82c617d0d4147a54dc6d029b0a5e786062fb5091 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/53d592f549a420aea361877d25e7e57d3e619c85 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9fe316c7be1c652bb01f482b3c54507dcfa32c90 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b3e303ce5ef2cb7cc4e4e534fa1daec6a79d22a6 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a2e464a57f73aa1a36e9f437167e7ad96f40aaf2 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8e72d4a21f006650c5572587457b4a2c1c06de62 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5d60f697f22e095df0f292527eebc370a2c70e99 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/238fd93993805b1df2983a4f983eedbfd587a6bf | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3329f26f28304d5479bde5654b3f6459cb4225f0 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9def01c48fc9d37d9848574aaeb91e46ac4aa249 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/37355afc9e5fea0535703b53228260c409a5faea | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/acc4eb41fdab59b6689aafb3424c1969653e66c3 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/61f49523126ea4cf786a368cff6cb1947bda21cd | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/abfa7a55d8445cbc41efa2a54638a234c28240dc | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/090a9796ed424f7cea2154ff669659f508bd2a97 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/498300a7c227fd45c073b71f945a71ea2e68ba77 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2a01e7ab7d8ecfc55ee344521fda6f3d051a2189 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/23f40f9201bb6c654f7611d63c0e39ee7d727c00 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f0bca84a60c7507622b896c3c0e8688aae8051d8 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3871cf67bfef3174d6ca493a3859e2c33a611044 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6d1b8d21b54b331cf5ebc76447a95b5dded040d8 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/965145f25b0de24f91afaf7b45163d6531d3dcf8 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b74f2ee87f28139d410ff35535879166739dbc8f | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3727aaeb2c94d3f74080dd7130b150d9d32d4afe | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e18d824e644b23f24e3f0c116ca76cb31ac9df0e | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6ba8c7de7931087a57f3633c7b417f0c19d5c6f8 | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1870d77811605fb8d3f068fe4ee7fbe67dc4c9e2 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e1d46db8b2ca8ab774987a50ce94192e72524b73 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c2bc5ccda690ec4e5dc021f3730417a51a0b13fb | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9f31a7d2685eca005531711fa4a4557eb5a37434 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2bd1400353af3b4308d48c54013c9d301020812a | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d9eb53bfdc4332d5863e564118ae1fe92801ff66 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/98d286489c06db61abc8697cdc973061f8376eea | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/118fb0a6747ec06eb63682386cd320cda2751ef8 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e8b64826afed6c22bcf02a38b0d644bbf805a55c | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5f4a9a06a3fcbf565549839da395b9078477a216 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/dd1030f14cec45be618a559c082b07cecd6646e4 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4a9bfc85e294bdf97fbb5202f4f9d67a5a0dddff | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4d765b31cf19a9f22a6d8cacc2af2bd03d1d7889 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a02c410639c283aefea4e2e61ac82398c178b576 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/12c141bdce2c47ed1902f0310d810c5edfecf4db | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/619a0a9edf18d1963fb9ebbf9fb495eae9ee19eb | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/550aaf9be9eacf5279e15c192bd06d70a88c367d | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6b6966c121b4a9444cbba2bdc9ecad2af9cbb5e3 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cff577e5ea78bc23f5f36b3585652785120191a9 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5db3470079fd37b4d4f72636b492b7a611ecf41e | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/86dd864540d546ef15c749fd011276462b63311b | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1625c58827567e41f14909368f68dfb2373cad24 | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0a1d6731ebc7e454f8411890c901a1257afbcd13 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7533f6aba40693ad725691472230799fa4cf62fb | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c615a01f1e169afdf11ff985b75781cd0fb90263 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/91f11f982a2fb6e186dfe29fc97c2f1a647fccd2 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e59f1d65dc083e68354ab513258bd6edf21eeb6b | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/849580aaa521a36d4b1c535dc5ee634035d1f94c | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e15f0070a367d0f076162e484c3ace584bc4fefd | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7c9e0f95392ede19966e8e152cb2018c93b3f51b | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/46433f603fef743bd904d7754e61896078562d22 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/845338ba9b158cf03347cef8d8a690a9a47ff9fd | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ca57b3fede474554c0227b7a9d6f8b0878c1f4ff | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/974a6e2c649da70b7b38bcf5d75a7ea2e6cc70e2 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0b52e2f7394bca6d296dcdc60acb389c78b232a7 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e8f29cae8fa79dd5182c48d5bfe78062f9c16372 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/998db2a24815f591ed549a34abd16f81a20d5362 | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/95d33f9b917d7dedb94d809767bd969f2b399867 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b5d4270da25c3181184e179c598a9b7368269086 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7fa91de21201b06b0d0c9da64762c7ba830d4370 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cf7c2567a493acd9447d47ad257cafa15ceb9452 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5a69dd03fb2507b3af97364451a94cfaf91a02e6 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/12645d80396785ad166c4d199ba6f532218513ac | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5229d3e695476c948a60e664b0531856f87f43ad | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fa9f7bf1b57c369537f92a93e8e38479cdbfed30 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1c78f0cc11ba13178b71c51f3e06ff8e4bf78858 | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/446cecf68bdc7c5cfcd33cc35b3f64cdcccfd07d | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/789748363cbad37b600a97596956617c96d4f373 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fd6e6bbc56fc81f489352f4ed794cf3c73a195f2 | ORPH
    sh4      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c799fbe197c26823c19b2e3c76d34f625408d830 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e4172b956b418178a5389f143c49e9dd1a3690d3 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2951c66c287d7951fdfdee5b761a50df7c00d613 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e95ac700ca21e7d081bcc56fc7148ce0b2e96976 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b00d1d655e3cf94d4459dfdec51f5d31c48e26b9 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8dbddd60a33b561928c132cdae95f1baf5a16bbf | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/33e013f992b9c1362f7bc1949234fe449d10e560 | ORPH
  sparc64    |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/72f4f25f41b7f92d5c31b2b48240def18d1cc557 | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/984815a85d5a2558fab90263b00fec63abf1c61b |     
 microblaze  |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/34354e86797b1e06ca8fcb9fb7ac436d29effb8d |     
   sparc     |          nginx-1.26.1          | NOK | https://autobuild.buildroot.org/results/19b7c084e924a4f70ee3a484242356dced3edfa7 | ORPH
    mips     |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/22d08bf9e76ad70eec03583eb9e21fe92d3eb79f | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/171e2380789bc227ee1ffdfa6ebc1ed2603d0167 | ORPH
   armeb     | uclibc-ng-test-0f303c63fab7... | NOK | https://autobuild.buildroot.org/results/5980ea7833961b9a9e0ab747b6f0fc6a29b014cf |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/b3dd2cbe21042a04d15882adf36c7b1b3b3ce531 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3fcdc9dcd8d3c75b7afc650d0c2d8639f7d76e50 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/adc081e986817bf2678d3e8663313c7255178771 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/ad558face62a4c7f1320754578152ee34ff4dfd6 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/71659976aa6bca1776ebb0f9bbff7e42cf9eba12 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/561842d4f829500c965287a7d19f686bf583b3be |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7226c5498a8a4b263e3ccdad2b9c91cdd96b6cc4 |     
 aarch64_be  |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/749891cca8250a8dab4d015e3e4cc6b3a1da24fe |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                 host-tar-1.35 | 77
                host-m4-1.4.19 | 2 
                       unknown | 2 
              luabitop-1.0.2-1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2f0c34d6ffe1835c8bc848d35c59e85a0f5f745a | ORPH
   nios2     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bbdefe4c295a73dd7cd194c1ab904b95781ccc2a | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c9a6b446f777ac9edbe9d4fa87597fb451e19de5 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/14158dcbec59aec8f0a22794fbc4fa6d5b455035 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/dd1c8436518f62500abb18d16e6ad4e4e1c67faf | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/adf231d4918102f95d3364602289d52f6b445593 | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9d0228cb0042cac453c466fc5c6323ea4ec015a5 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0f99047b3be5d5835da8c06e03c95356eeb6b5c0 | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7f0af6c9289881376bf621246004c62750ec3a67 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/38f8c7b9266ed103182cd2f68d2b9b38fae5dab2 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5368d869c5f1ed65f30ce0ca591471032ea8a3ce | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/48f049d18fef14d6b857eec8a067ecdf0175c8f4 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f97bc8b5fceace28ce1400825e3c8f1c2e58e0d8 | ORPH
microblazeel |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f8c25bff27041cafe080081a374bf4f7f9fea701 | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4b64bffbfa1486ad2b76154a687f60b472a7656d | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c0ce89fb8397e458f16936d97e78d5fd7d10e56a | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/72876584ac28957263a7b4ccfd0b75fd1f6d9ba2 | ORPH
 aarch64_be  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2fa81366dccebaf9fe1026d7f92252ffbf57ffd6 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0b3a1e79422d9fa3aed21fe7ffa087cf32ae57ae | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0483c741a0c310dc96816b3e33a655b73d8a6955 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2134b64ef06a80c556a0e23a776e93190fe527e8 | ORPH
    i586     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cd707c186aa36502f51d77e3e08670e30e8cf06a | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4a9ec8b2744e6e97ef108d0cf5039d4ad2aa71d2 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0b6aab791e124e0e461fb25ce915b0fbb19f3715 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2434c2ca1a304127d99f6320438b0064267d232f | ORPH
   arceb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7aff2c67fc2afc876408d6405ceae41fce3bb74d | ORPH
    or1k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/79bd44b1a1ec1b4dcb95e649887c1cf9fd941d8a | ORPH
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/11e9df4e6a1888d1a73d1902461c8cd8aef8579f | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3eee7f5d937c4be6f9a6f86258d95a0784869bee | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c371102cc30f02be58a0da8d74d2cf98e605e81a | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/55f4673409ea248720edf575f00d7d396bce7ed5 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5dde875178205ad01a97af11446db3a29ba13213 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d4ff8d10a98e2f5cbeae500b1064c2a9b1543c34 | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3888c2d0581e823a11872fb4c0de843fbd5b6092 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b215dd0724187973f335e45d7dfeadc5b59cfb80 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/24123fc8fd46b20f9ff225154ac33efc9facc3bd | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0cd9155aaaca1eaa6d492b330f6fb4317541f001 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ba8c870bf3ea72a92459c31cb306623f8a79b929 | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/bb76f4ae0a05979f050e2116a0167d95eafd11cb | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/48b05a72a0ff5ef07921a1c7ae708acd35d4e464 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/37b8f282bf62ed6d403c82f95c011e19919374a1 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5159b8952ff0747f58819e5db23b0026c13894f2 | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5de77d5da9c4fada466ef923fd0eb36e1271d988 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e672a7b8108627e8cb441fe32ff2b528bb864949 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ecc10622cb4ec259d29f18c6e54bbc86fd31e925 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6bc3d3f5cf7ed2a353d144385c260a60c4b1f631 | ORPH
  sparc64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/deafc2fae1d98866f07b0531b1ba54c1e7ae2e29 | ORPH
    arc      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/599a82ff043c7de74e284609843232a5dd6dcbc7 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d6023236eeaac38409c8446999704877dbba24c8 | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b9cf7d4c01bad5bfaf730bb5c971adb251ef734b | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ad4dfe6081adab59e5afb5f83b900598a57d0c98 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/aa177a8f7ad263776d6de3eee2d9f87cc9e1252f | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5a1ea83fc638efb6f092e7731fd52e1f9e7e160b | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/788e68be507fb9eb9089455397360812543eb5f7 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/da89d0dffb1cd6aefea2b765db8bae5d16b162e1 | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b7f07375668c25af612a77f45c7bd5103e9f427d | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0381d8d6d02f42ae798d1c56db5956f5ccffa311 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/10ac2289d4fb294e8e445a846308e24e038f63c1 | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d17b3258552d35e2640bc4c308cbe0a5e6314747 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4c94700dd6e4cfe515820e9097c111544bf2c039 | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/c8c25f45f8fa818183dc6a3a4e592ecea95c7a4a | ORPH
   mips64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0dbf196cb2c877fdefaee897f345cfbc630fc629 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4ff073e4c3b13bf1b2f997c5c81853fe74b0cd1c | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/134f1afacb7534718d9a47a2bb4e85a73025b4de | ORPH
   armeb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/44a494e2080bc4f0dcc77cfd64ed5168602dd2e2 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/67c1b61977785b2a3ec8ff532db696a427f86303 | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/fa8531c6c438b26da301e7a04330a75d5005cfa0 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/032cb2171c2a44e1aaa754d63acc0a17f0ec01b2 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/aaecae79c92a5e27eece9780d8c3014414c1705e | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1da214e7c0dfbbc54f629d8baf5cd502946d199b | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4cb1f824013d627df3f3c35c6e9d2d0120555843 | ORPH
   sh4aeb    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/5555227bedbb52391f2eb003417b4e7a0f29dbe3 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/d145e75ebf0baa7c779bc3cfc5d92ccf4027a666 | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/92e6fcf3a6762ec0c55465fade97af8c3ce40ae3 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/9faf000ecaa80badef4234624fddaa27de9f245a | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a1db79b07ba5c93c679a304e6936958e8b4107ca | ORPH
  riscv32    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/69a48bcc237dcead68134ea5eb2e7aeb14bb1e98 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/28fd1cd627891b1d043213e8a24f5b98f6382471 | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2da9fb0bfa9a618539566e273a45e25b2eb744bf | ORPH
   sparc     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/89f814c7b22f2eaf541b4ee6671fabad981c895b |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/95cfd9e38cf5d83010797306804982d6d7f0ec9d |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/65db8326de62eada0bd7330447dd81b5f020c55e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
