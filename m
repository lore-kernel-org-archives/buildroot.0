Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AFBCFA741
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 03:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB0A481EE6;
	Fri,  4 Oct 2024 03:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJYeIedTjftY; Fri,  4 Oct 2024 03:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC4E84150
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BC4E84150;
	Fri,  4 Oct 2024 03:18:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B290B1BF2AA
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 03:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A438B6078E
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 03:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ALt5cNlZyLA for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 03:18:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 137C160789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 137C160789
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 137C160789
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 03:18:27 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso275411566b.3
 for <buildroot@buildroot.org>; Thu, 03 Oct 2024 20:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728011906; x=1728616706;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZroMXGmqVXYzJve82xRBBK2/bhltLQW94AUCJ1QI7Y=;
 b=w73XeOd26kuuveRoBfuIu5BkPS7zs/ZyUxJ+UHwWlbIbsceMJD29Q4P/Al9m2g5KJN
 h6WnbWcbhWtY49tXjSS0HosWEWeWqOzAm8vMEUSfTSqzlxL6MasgiJSNqBz9ankh55vW
 IAGfWDRgdjrFthx0YdNR0oo4SQ4qjoSGQdv9Av8lvPS9ZqoWmGnF9Bm4xbtK+a0usu8X
 PeEsU1fgIr5Jo2pMAjqcfWoYR/ZekbQPau0dic18/8AV8c5tw4ebduPlOKXcRWNXNDRW
 f9+TIcSQ5bYhTI2+3pYe8el0tWMqyWx94dbDAAU42EXBR/QXcRycurFE1q644NeBE935
 XRGw==
X-Gm-Message-State: AOJu0Yw5y2/kz68yY4Ax0PngZTf/t0mDHenPtWyekOetevNHVGFoutqy
 RRtxc3eMSYQsDW21km7kYk7b654z0rQ1QWFVt4JMxuhlVsaA+Y6lzpMOhA==
X-Google-Smtp-Source: AGHT+IHpSvsDhtHSBuYsAt39VmUIduMzvZVOiUk5uKV84EZwCnltq1o9iRq7jxYmdfPlJd0ztGRHFw==
X-Received: by 2002:a17:907:e6c5:b0:a8d:4845:de57 with SMTP id
 a640c23a62f3a-a991bd0d398mr112878466b.26.1728011905167; 
 Thu, 03 Oct 2024 20:18:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047314asm161045866b.188.2024.10.03.20.18.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 20:18:24 -0700 (PDT)
Message-ID: <66ff5e80.170a0220.1a1347.64be@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 04 Oct 2024 03:18:24 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728011906; x=1728616706; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TZroMXGmqVXYzJve82xRBBK2/bhltLQW94AUCJ1QI7Y=;
 b=BzVwPh1mfXpjs2BrCJPZNQ8wJorGr/+M6Y2XpSTx/6X2oHfQqLjnyxV16wRWz+l9h/
 Gj3gQ9jrCNCmlpLaKYCZXBLaqcQf6QbkiqSlqU2ItpuvAbUjPtHDp+1/7U+B0WC0/mCA
 wpbUCnH6KdgvZNkUws5nhKjC6+oKWxB+715P3CMlyEy0lR21g3LkWgNNvph72Bkr2pXn
 pDHUexkxdPIk0TV4mYfES5f8HnA8ndPOmUJKUsAA993gVou/cmkfx/eUQSP4MfICa4Cm
 ERc8/DD7jbHhyf7qPrDSBkIKN8ArN0FBMWiw8lwOzYOFyrAchV8fDH1HlUQ06jUEOrDW
 Bvpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BzVwPh1m
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-03
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

Autobuild statistics for 2024-10-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  5  |  0  |  8  |
  2024.05.x  | 23  | 29  |  1  | 53  |
  2024.08.x  |  2  |  6  |  0  |  8  |
    master   | 20  | 354 |  0  | 374 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 69
             bluez5_utils-5.78 | 42
                    bsdiff-4.3 | 21
                 linux-6.10.10 | 15
               procps-ng-4.0.4 | 14
                libcurl-8.10.1 | 13
           host-checksec-2.7.1 | 10
              libopenssl-3.3.2 | 10
                  bind-9.18.28 | 7 
          linux-5.10.162-cip24 | 6 
android-tools-4.2.2+git2013... | 5 
 host-binutils-bare-metal-2.42 | 5 
                 pixman-0.42.2 | 5 
           host-doxygen-1.8.18 | 4 
           host-librsvg-2.50.9 | 4 
    host-python-greenlet-3.1.1 | 4 
               linux-pam-1.6.1 | 4 
                       unknown | 4 
                 apache-2.4.62 | 3 
                 coreutils-9.5 | 3 
                  ffmpeg-6.1.2 | 3 
       freeradius-client-1.1.7 | 3 
            host-binutils-2.42 | 3 
   host-mender-artifact-3.11.2 | 3 
     linux-5.10.162-cip24-rt10 | 3 
              luabitop-1.0.2-1 | 3 
                  ntp-4.2.8p18 | 3 
           at-spi2-core-2.50.0 | 2 
                    azmq-1.0.3 | 2 
          cryptodev-linux-1.13 | 2 
                     file-5.45 | 2 
                      gdb-14.2 | 2 
            gettext-gnu-0.22.4 | 2 
                 gnuplot-6.0.1 | 2 
            host-ccache-4.10.2 | 2 
              host-rust-1.80.1 | 2 
httping-0e26c53d5fe504eb720... | 2 
                libglvnd-1.4.0 | 2 
                liblinear-2.45 | 2 
            linux-fusion-9.0.3 | 2 
                   linux-tools | 2 
                    mpir-3.0.0 | 2 
               postgresql-16.4 | 2 
                python3-3.12.6 | 2 
                  whois-5.5.14 | 2 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
               alsa-lib-1.2.12 | 1 
           alsa-plugins-1.2.12 | 1 
               arp-scan-1.10.0 | 1 
              atkmm2_28-2.28.3 | 1 
             batman-adv-2024.2 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                  boost-1.83.0 | 1 
                  cairo-1.18.2 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                 dhcp-4.4.3-P1 | 1 
                   duma-2.5.21 | 1 
                elfutils-0.189 | 1 
                espflash-3.1.0 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
glibc-2.40-18-g564178076272... | 1 
               graphene-1.10.8 | 1 
                haproxy-2.6.15 | 1 
          host-binutils-2.43.1 | 1 
            host-coreutils-9.5 | 1 
         host-libxcrypt-4.4.36 | 1 
               iproute2-6.10.0 | 1 
                  jack2-1.9.22 | 1 
               libdeflate-1.20 | 1 
                  libsepol-3.6 | 1 
                 libssh-0.11.1 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
                  lvm2-2.03.23 | 1 
            netstat-nat-1.4.10 | 1 
                  nginx-1.26.2 | 1 
             open62541-v1.3.12 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.28 | 1 
                openntpd-6.8p1 | 1 
                   pcre2-10.43 | 1 
               pcsc-lite-2.1.0 | 1 
               pulseaudio-17.0 | 1 
                  quagga-1.2.4 | 1 
                   thttpd-2.29 | 1 
                tpm2-tss-3.2.2 | 1 
                 uclibc-1.0.50 | 1 
                 watchdog-5.16 | 1 
wireguard-linux-compat-1.0.... | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/b83cce6f0f748063dcacea1bd67825c16fa315a7 |     
    mips     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/ad9bd2a10676e2eeca1adc0d8d4c2b14da95f062 |     
  riscv64    |        alsa-lib-1.2.12         | NOK | https://autobuild.buildroot.org/results/2df8164cf938b116442c847d57c70805d1649793 |     
   sh4eb     |      alsa-plugins-1.2.12       | NOK | https://autobuild.buildroot.org/results/932d1931ec8d89985032b0e47e0059cd0b90a25f |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/5c64c14e25bd77e551acfe6aabb357602806642e |     
    mips     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/5ece4298cd9dda9c0d19a60ffc3de44fffc385cd |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/a179879ddabcda709a25c13e2641c84f6b66dd19 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/fc4cd0978a0dfdf5976005c512d1d7fc1ad145eb |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c9dd75f8c862170f82babad1dfd45f4204020a0d |     
 aarch64_be  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/4dc1683c5513fa49db83917cfca5199c09ed336d |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/de36b155a4f3ef8337c0cd3741bdd334ee4293c7 |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/a3c9cda829ae9f6c9f02662e106198c3d8f00d9d |     
 microblaze  |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/159e880ebc95937d8c57d0461f2f84a49f44f294 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/385dbac42b3efd0dd732bf750cac998f43d7e7e6 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/85388f01a8bd02d5bf08df758cea31d025a2e6bc |     
 powerpc64   |        atkmm2_28-2.28.3        | NOK | https://autobuild.buildroot.org/results/4793c0f842357b24f3ee17aa539c874076ee3b55 |     
powerpc64le  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/17c2d818d0021e4186dfe70511e74831b102f496 |     
   xtensa    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/04a731858f205ed72a72c69fc659ac19e5f977f5 |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/323c9f8e1404cbacf16bf72e0c16620d0205c8b5 |     
 aarch64_be  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/1f16555d8e1d5bdf6d121001d01eaaf646811605 | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/0bad8d01dd5b6bc5dd81f8b7156ae8ae40ef3c2c | ORPH
    sh4a     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/ab27441bb893548b4be4fde3dbac9453273db610 | ORPH
   x86_64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/68a9b390724abf567537d9e52964062cc3056860 | ORPH
   armeb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/59b7b8e06205db10c6b7f1b2afdc8eaf3de5feed | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/af8888a67063950e1ff8d54cd82765e66ee21194 | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/d575e1d9220543ee047bcb840e9971cf9ee2e8ad | ORPH
   sh4aeb    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/755572dd019876df3d91acc3c184b36b48018c1a | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/8e64844a891ef64276e67c302c2523a037bc3f5f |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/e418ed3dde47a4d576ea364c2213175c96b9885d |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5fc6c3a79d3c4196c9a156fd8a632f31d5febdf5 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/197c1c885186e385d3af10c5c5ed8257b84221e3 |     
   mipsel    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/1f4ae8836f193a1ad7bf361849f51de4f04f36b7 |     
  mips64el   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/a9f1df8764b560d7bd7f45ebf348bac7349f07c4 |     
    sh4      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/6960e9b691c04c09194a8474d618049de9765142 |     
microblazeel |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/9ea583d83600f378866b67ff3630f130a5ecc364 |     
microblazeel |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/59bd374952467ceac72059049ec1ebc83cd3c5d7 |     
powerpc64le  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/387fdab9ca6c29481e0494ed05b10b2e9f6aaf37 |     
   mips64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7b0634ccca979308455f507045d99fe0e5db6db7 |     
   armeb     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5d9f3585dd83f1d7189eb197d08ce38872ec8800 |     
   sh4eb     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/1ab596b6848308159b1c9134d8f0ff69fabb940b |     
    or1k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/fe89c68f1f7af01aea6c66fb57d86ceba28f89ba |     
  mips64el   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/a26b8f1e8c58cb827da31125d7eba79953e8b934 |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/777ee2f99a339431907133376825d40021481339 |     
    i686     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/fe5fd12e49b9d6294d3ce4c2f65b304b667a0cb7 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7bdeed1c344bf306485124c199140622a7e84c06 |     
   mips64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/1567adf482c2750cd51c08e75e994a81c5334198 |     
microblazeel |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/faf45800a246c8101dc63c5882533a7395ccb9b4 |     
  riscv32    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/737bc1ba5b0257b542548d6cd02bb68973a9fbfb |     
    sh4      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/4a345e9b615a744184ef0d7cb20c4ee6634e40fb |     
  mips64el   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/6a7fed6f64dc53d7e106a43d3724a5c554d50030 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/7007d151680b54484fc71c49b9127b5ade333af3 |     
   nios2     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/11b312634a0c0ba1fc250ff4e43fe0ac0efa079b |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/c968b26a115688fa9965d086df79d5fe06f4f6f5 |     
 microblaze  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/3af732ee4cb83f45d70b31a5989162549f03f95b |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/eda4b3f02e3075226072c313780e0f33158a8845 |     
  powerpc    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/31ccc842e225b891c86e54f8631102ab7f5796c5 |     
   x86_64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/54dc9bd7d9cec3c54ded08c82203e82f60d9ac02 |     
   s390x     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/d1303ac45a212a93476353cd67d1915c09cda0d1 |     
  powerpc    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/d25d41338e0f418a2b0a0f23bef03607ea423626 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/20df4a4d0c2fef7ea997cd8c13d0530b76df3853 |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/cd49589679dd22cab20545ad358aa9bfbd5b4204 |     
    mips     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/b3e477642fa1c66c95c6337b3048e75e20a2d0d4 |     
  sparc64    |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/6df56695de244011a5b66414d931560b285265ba |     
    or1k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/f2d06075903514832dd6e5d8f73e12f72fdafc88 |     
    m68k     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/12f60beea5f01829f960e886d2c411c9bf9d9f8b |     
 microblaze  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/ebf23bc486d6248f4bfef6238e68da50f86cca9c |     
 aarch64_be  |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/3539c83deaa45a3548bcd488659148c62af3fc73 |     
   s390x     |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/607555ba6fc3bb033dd671e191ff53d4c096468b |     
  mips64el   |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/5a306356f5f190a14a0a2294a4428544b1a018bb |     
    arc      |       bluez5_utils-5.78        | NOK | https://autobuild.buildroot.org/results/12f91e90c9421d791d2cc1db548a0c26b8845d13 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/bf66fad0a20e4351ea62a234984e7f44b27ee9e1 |     
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/3a40731ddba5d078b0ac2e0059cd142f2caa85e4 | ORPH
   arceb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/c5a1e79cded3ee8364a3bb249fa6703afdc69966 | ORPH
    mips     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/a2d8674c3f3e5beecca8214cdde3a47415b8d216 | ORPH
   x86_64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/a1475ad5bee1db867a07ae1e5c69ecfb33d353e8 | ORPH
 microblaze  |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/e39027a8e6f5b24da439ee7728c885202e734567 | ORPH
   mips64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/b18c996e3248ffa82ec213200bb00a23ec4b4007 | ORPH
   sh4eb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/3c0059f6eaea9e70e7ead5388c31ac2ec70683c7 | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/ac8d880098331e08f5e0470a40eff24c04120de5 | ORPH
  riscv64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/9c67aaf41bc72e20e55d7c68b8b41e60e33d7ba0 | ORPH
   mips64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/f40354746f4bf3e6c9e247c95acaeb73fff99030 | ORPH
  riscv64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/d2831bb5dde811e5ea033522072197a759e42501 | ORPH
   sparc     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/00033bd9787874cec63e204b310eb352e87123aa | ORPH
   mipsel    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/076f606fb731179085290c9b61af377daa1545de | ORPH
    arc      |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/f058e2d1e3e62edca84f71c3b05f7674d99b3952 | ORPH
powerpc64le  |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/b00b6ceb19640943245c721f28eade715e5cfa7c | ORPH
    i686     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/1168efc25572b63bef975cfecb7d0cad72d1889f | ORPH
   armeb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/413e54f9dbee90ee24191b7cdfe02666fbe9909f | ORPH
   armeb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/5edb148dbaf16257a537ae90fedd9db28c252d82 | ORPH
   mips64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/480eb2c351cc51711a34287cac1630c07b9b30cd | ORPH
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/71a74117e9f0e8f57669f0f0979370fcc0b11127 | ORPH
  mips64el   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/b2781295e6a8822edbb4513d38e3db999e4bea25 | ORPH
   mipsel    |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/a1e3f65dd42bdaca83268c9b4bfd327c1e51f95c |     
   mips64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/f5aa154be83d4a16c1ae4d855c937054fab7733a |     
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/20b8ff6d8fd1dbe743ac24b65c737b591df65d78 | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/2472eba9e65bb615a0e9c1c28b6146df2355a11d | ORPH
    arm      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/07801d9f6762d0d06df6c2cbc361c3395b02cf0f | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/4b4beead772c92ae5b278e7ee7ff56dd362fd112 | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/685ccdeeb3b67b16570bb5473dc1bb8ca61f40c5 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4924cd1145be9144d1ee6c5f92ea416ed1207f3f |     
   xtensa    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/dea779bbbbc08c7192f89073b93db768c41832f4 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/e7781321083b73c134d6999f10aa736d8bf0a543 | ORPH
powerpc64le  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/fbd882ef7d9a8305c59b4e58d13c31062c7313d4 | ORPH
  aarch64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/8c51b93f7810516d3dcb6c6c9cdbe64a16786b76 | ORPH
  sparc64    |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/cde65f49fb78be8623a1811368cd9ccc7ae12cb7 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f7154bc57905ee8556cbd3b687a8f1fa5b42c0cd |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/af7db143a56fb48265abdb7c1923320af7bc562c |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/68ff407efbfd55ba360ccce305d34d4e06bd5410 |     
    i586     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/3406bc4363b486789395fb6c455af1ca531ffda0 | ORPH
   armeb     |           file-5.45            | NOK | https://autobuild.buildroot.org/results/6105e27c68814d933b302256c554617c1f2ce6b9 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | https://autobuild.buildroot.org/results/b5d9a74097bded1584ea4bacf92c4bb10bd6b22d |     
   s390x     |    freeradius-client-1.1.7     | NOK | https://autobuild.buildroot.org/results/73929d0025546c66accf3621dd815cd81e4b2493 |     
    sh4      |    freeradius-client-1.1.7     | NOK | https://autobuild.buildroot.org/results/de6b8d0666dd457d717b46c3cc79d671f2b54bc3 |     
   x86_64    | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/1758af82badce232a39b269fcfe52e35e55d3ec1 |     
    i686     |            gdb-14.2            | NOK | https://autobuild.buildroot.org/results/e4a85fc51cd48d4e318c71460bc9ec61fd800477 | ORPH
   sparc     |            gdb-14.2            | NOK | https://autobuild.buildroot.org/results/205f5f3cbb4953370ab6b16233a01a51be4719d6 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/a2d225ee76974cb32fabfb3b5e169c2634381c03 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/cb27eb11dea6a0ff23334449f825943eacf59500 | ORPH
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/e12b071177cda9c9d83b2fdc2b84c9912bb70677 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/6c1a19c978972792c9161b5d893a88baec6dc824 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/48d65a4deb92880b7265bed09a1270b73c7bd5be |     
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/44a14648c7b51f34187065eb0cd8a26215465180 |     
    i686     |         haproxy-2.6.15         | NOK | https://autobuild.buildroot.org/results/65f78af461d5a2e2c469714910ae35d721d74741 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/84057181747b39bbf56bdc3b873b7aa1aefdfea3 |     
  riscv64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/fc10b3fb63568ab93d542b32c04f1fba02ad1814 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5674df8cbd85859ca08c0fd4da9eb175c537aae7 |     
    arc      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4bba6e60a6ecb9510f5de4a7d633b74483a23363 |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/81b22b061165d7772d8b7bce276c13890ae258b6 |     
    m68k     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/9b28568ae5cb08febd9361581360fd7f7d864a70 |     
   nios2     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/92988c26a802113d2789ba855b95d7d4a98824ea |     
   s390x     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/b1a41ed35aba1df55a3048cc31a79160ce61bbc5 |     
    i686     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/c7bed5b436697e239cc9117d68cc6724d517b23f |     
   arceb     |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/b1b3d1a30b2faa0cc778eeeff8de2afe1a4e8d50 | ORPH
powerpc64le  |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/fd0a849b5f0c2d8832aee857815ce77fb2abfbd7 | ORPH
  powerpc    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/16e0a19b4a1a4042b435837573b9bf2afe00756c | ORPH
  sparc64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/5250a14f28fee770f718409f3e9344c36da1a9b3 | ORPH
  riscv64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/02b091e8f0eef72437452691c295a8f6b3a8393c | ORPH
  riscv32    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/965692d5c85d97669c542744215449e07c8245e3 | ORPH
    or1k     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/304d38a658cdbd33d9b4f590afbc61fd33362a66 | ORPH
   mips64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/148236954ba7d98d384bb5b22861c2231ea8ad76 | ORPH
 powerpc64   |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/8d10bb76124b060f5d4a2ed90795ec1edf1394a4 | ORPH
    or1k     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/4b46024dca0460b5a7c0062414cd81fb40805791 | ORPH
    mips     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/84818ad7c5815abef2c1f0593f03d13d906f982a | ORPH
  riscv64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/0c804ce46df324b4c6f22e2042eb7e3be5c5889b | ORPH
microblazeel |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/885f024eca08099323bc2d39cbfcd9bc0b04be43 | ORPH
    arc      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/819cbe117478f819269fcbbf256405ed5e1b1e55 | ORPH
 microblaze  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/58d8bc3215544c480d603e8e453a81568365b11c | ORPH
  riscv64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/16dd75fe5fd1f9c964ac5fc613774249bf3a90bb | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/361204b3c51a377712cf487a28d4c7aba4d9a37a | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2d2629853c98cbded8ce7ebf18a75169f50612cd | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e38652b8bbd3015555ec7c3ccf0879eab1a5d40 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4fc47b21bce192d489d5e3aa813a24f23f365bea | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/802d3ad52c87c05e292fd1757687942d73190dfb | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57c360240438cd9652fba9587d15053e4b3a12f9 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ffdd4c939fa9ea07012a539f619860c7179afdb5 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eb93bae2f2e413d454c7d7f736238ccee4ddb180 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f28e1188e23139b3a733c877e17f237d2134c18f | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/34be82a1f795d848673668ae9ad265903858c7f0 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7f20e897bbf3e1fbbaad3edc9dcb33d989be3fab | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f08fb475c277d422071805aea0a9f21f2cd420ed | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/256c1f86829000598ecd99c4d70c22653670d678 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7b10cb87f2c33ed0a9cb754191f831395fb9a9cd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b1ffd72163d99d46ac3d420ff82dcf52a37e2e64 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6e8b15c68c78b392b3681fda50f4bc0f30a67191 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/17e7ad19236c4aa360fdd56622bbbad31a2c4763 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/29b56a54e0273444dfd6d1722120110cd85095c2 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9df9824acdcca221f4cec94fd2b3e2f70e93971a | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c84afb002634948b9c86e7b7fb389dbf2598bbde | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/03e9ab3366366a574f7e78b2745e1886e0eaf5bd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/86cc3262cd11f663f86abd079083f7728ee6d985 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2f3484b1903e9dccc0e197604a1eab3f8a77ab34 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6c665a8fe52f320946837454477f026459c2e285 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/796e420e260df0769defad2852cadc521f4e496a | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/94fcc9e730dbf4bb9e583881e2c211a3f30a87cd | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4686d30683f74959195014ba883bb89c3ca0b58a | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8bacb95eee77f844d30d97cc25af9fd8ba2aea0c | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2711042e11039cc0db70cf38ad1ca1add4d9c5a6 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/12289193063e588dc0a063947852783d20d31525 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/032a77dc88496e6f1e41195d22fb250ded5a058f | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0efac7a8a9c94db822fb5e3b07213244e453c2e3 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7246e0a4ae920a60dfc8ae1f31dd30e1d19008d1 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5fe742a7c60e274a50bc60f3162bff0b07bde800 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e9182204fb72c8e510069bf70f103d733bd904e4 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0dc4c3b99f7395e516acd42a5595f32fd8a44a4d | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84bb04f8058573a53d920006c8043a41a1cdf5ef | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4be5af34ce38fc4a1580c3a3adec7ae65cddfc21 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb20103376767bfa29c69a2f0fefa945dfa33d5e | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/074c1807fac1a55e9fc3751fae0d401bc077ad04 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e04852d5c69937fe55caa1989dac6569d88255d | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f94298bc9ae0118346fa03e8d6f1db2303a7e3e6 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a7798ee9c8911b0140fb5e1fb34c117b72272813 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e4113b908ee064889e22cdbc012797ca4a904b93 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/92ce5cf9c8a0281bbcc191e568a8747433354c47 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a0725c965f2e19b5c2e16af897a6e92b3ffbe0c9 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7bd374b6892a608318c4bc29de06b072200cb295 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1d36653d841172701d6f40f1bdb8c224bc73ecbd | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/36b2974ab6147b43d7e828dad934f8d33063fefb | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8a1cab6d77f41788eaee69336da870725802a85c | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d8db2657fd267783d65fa924078d833a8e82c873 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/59e0ff4a09cb2be9221cc9e88c81df2aab2ae9c3 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a0f56d5ac5a6a778b2315823cf021f6805338ecb | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/196f700fa2c223b2f59237fc75fab05dbbdce70d | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ad1168465824eb55c6b3ed06d8f1a072a7e10a3e | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5d5f8ee71739719cd4354732405d624fe79d09f9 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d6c1f64b811302eb7f7b05d0e2f26f8cb5c50010 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ec765a705c282e8f39cc9776d29312075c81acaf | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a13a8f82333fb23166337d0e263742ab3f6c958b | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a3a4d04cab8805c917634d351d39489af7d5fc5c | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/79fea8acc1b317d7bfba7d25ea1599fd19b6bbf2 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/02abd250a41518e89d8f4f6be2d471f5f6162623 | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d8cf452c58f0eaa2f99f8162f5f30f83216ee470 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a2ee68acc90643f6c79ffe5547831e6e3dfec489 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5e5420014a22478c114e4c1240b0f500cc3985df | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d727c218f217462edadb790d1196b65a28489fc6 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/33d0f6ad571b0cee21ced03cb3b746bca631b55d | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/932eb1e4aafb87f9e8dba648310eb600e8ff61c5 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/341f785ef14276df0e48c0b57125a4f49b09c0bd | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a521df2165cbe1b234d90c9d527a6d7cbac0d78e | ORPH
 powerpc64   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e2c955181527d015a051d3337b723df07ca53e70 |     
  riscv32    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e2789aa7ed62108a80aa307cab8b3413e21b38ad |     
 aarch64_be  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/987ebd73e639b96f2b45d5a60409992745b0fc0a |     
  powerpc    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/776178856154a587ee302a0e6d2c29bd2b2f3417 |     
    arc      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/6b7a95d9247ef6e572784672beb2a96303e21654 |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/5a5dfeafe511ba0d4d2438a0e1b76fcb063c6040 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/c821f3293c2695ced3c427f61b0d727af8dbd67e |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/8363d021690044570cbec8070db387abf250eac9 |     
    sh4a     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ca1da0eaa98606b64f5101253889361adbcb1668 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/492e5f03dccb68d0e9a1c9cdffdad7b8bf642b10 |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bbadfcc83ea3fa852df961a3998f974208d97a86 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c3de45df63ed5ba28712ee62daaf7a5f54eab1f8 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/773a319ba38118516f1a2cc2690fd25f13c28832 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/533f3f83d78b5d07cac55fbb42667420ef81c51a |     
  powerpc    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/318d51539d346179173f56f00f6577db9a11ddda |     
   sh4eb     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/8abeea8a03d0a00bbb45912cd3b7b19e7c60cfce |     
   xtensa    |        iproute2-6.10.0         | NOK | https://autobuild.buildroot.org/results/143f8bb333c443a5c4fbbe981a00fa43e26df088 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/7fda7d4e017a77f1ad9f8fa92908394030cb3cb7 |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5b3c6c6087c5144929b18d2108f8e441b7f99f3d |     
  riscv64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c36b294ee74d02d3620e09b4aa549542d2a01a07 |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5d5445175617fca4dac300e55a9d6d2ac5688806 |     
    i586     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3d62dddfb46f18fd59e55f7222721cf4efb88762 |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0782f3124fc64e356f4c69f81d89e7f529da8268 |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/124c3f6c0e3eee4903103d1cfd35ebfc1f017d1b |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f303337fe5e0ff3febfd1f586c322f3bc54cf80c |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0028e9a9de1500f973e5d54787655705b5574ea2 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1a4e822fbfa4e0307e7c312eb64ee7d4f34bb0bb |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5fdad0607656fac5539d63ddbee4e02c52d7b8fd |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e8aaf8058dc43bcbdbf3230db193728bad14c66f |     
    arm      |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/4cca95800a4f17b0146993fe275909c97eb1fad1 |     
   mipsel    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/64e3f5b74573b2b42dfb564cc89ca39cba057460 |     
  aarch64    |        libdeflate-1.20         | NOK | https://autobuild.buildroot.org/results/cfbe0ce070b3601dcd97ca79de22a832eb5166f8 |     
   armeb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/f6a7ee6a3ce4f8acb4035396b90f768a5527f31f | ORPH
    mips     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/999d7ff680f11503212cab2bbfcc4db8249ba791 | ORPH
   sh4eb     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/ae37f54d23c5c52a0e08cb0bb7f6e70d1b9ea7d5 |     
microblazeel |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/48c8ec69256edd6e0017bc32062a08bc1f7e71b7 |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/b7c85bb479491c15e6ad45f62b5e3bfa61ab5212 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/9d7320d4cb059e278c80858f2b26e930b464dbc2 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/956f7b4d77a5f59261959cd15d26711df199de36 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/11411a0e9a5e77a1f19c33c61df0c4dd497ad2ff | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/1450c1a8f071a360d56e9ef87cfa872e6e6d93e4 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/9b374176c3e8d3dba0317376495555da20b5d71d | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/36179257627e3af4d50bdec859c1f2b10b06cb46 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/d34349f99725b1ebdb9468d3e1202ae7e23e1936 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/549bc916ce753898c82ae9054837dc0bc56f1359 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/6e35c362849d52c0cac2053e7a2ab5b087927af5 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/dd058205aa294616d690104bc2c7eff639e1ad33 |     
  mips64el   |         libssh-0.11.1          | NOK | https://autobuild.buildroot.org/results/eb7e4caece4d9d494e11e52f4d8c566dde975b0c | ORPH
 microblaze  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/bc56c1683488b072615f464036625864d3c103b7 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/a432a3e97ab391b4edff144d1092390b75d4243d |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f704fca96c9325158d705c7aa9903912b5d89f0e | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0d5c16272517c2bcb76df53909091bd8d5313fdf | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2f742dcba986bc20f39ef1046038ca9062e9441a | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/26ce55d4cdd2cbf8e733564dcdce3eba8c05c4f9 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f038ce956caba29436fd36d3ed40e0e01b8cbc55 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/22f3bd3cf07c2f034ee341b5a794ff353a8e1b9c | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1384af766bc638ff26f82db3e5565466e26b0270 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/7316741ae027f70e32b82b856d44173c6be5c3f2 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/fab56b12e01f9a7cf13c9c1dada88a75a587e277 | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/8c1cafd0e49c049321939d60a33b94ef8a1489ab | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/c0785df9d741fddb7cd2d4f159dc3fdf294f2e72 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/546c3c77cfa18f9f4094417e2265390cddffa062 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/655e555fbe6930ffb3fef118fb10ba40b28451ba | ORPH
    arm      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/6efd2733dd0fc26a5f15c7f5a01f7569d12032b2 | ORPH
   sparc     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/e18f728f22892431bd377a0c7e1430d021d98b29 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/57938296542a01604e93d6bc66d39d6a45d67053 | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/75e0715bf53a64888013c5d2060b1068f6683026 | ORPH
   sh4aeb    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/4c6377c0127d00ae6c7777a8460fde168fc2c557 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/c1b2ea288495d41589b78b74216b5ab21f2ccc6a | ORPH
   sparc     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/114b684a3f3a1d87752d53a502c29de9454febf0 | ORPH
   arceb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/a52a76d122578b7e4628d709da7202834742cb38 | ORPH
   nios2     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/00ca5dc052c63f5b4145e98e287db72610274ddb | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/eed92a8c3c7b1b21adce6d9f1ae15bd3582132ff | ORPH
  sparc64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/fd35d0355af8b45a1cfb8955f5b18b8a968f84a8 | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/88dcc4c61bf7b35daa6ab803f1b48fd79a754f30 | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/264c054af8df55bef8359204c30592b878ab093e | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9fef457f77c7c1c89cb4912986738f25568389dc | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9afc46c71879434030354d57802a538d1edd6ad7 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/59fb200102bb9a65fc22f70133a27a88c88daed3 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/18cecd966d5a96a67dc596a58e69a9602552cf4c | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/aa7b7bbc4c17080b15f279431d7a40e84b5df061 | ORPH
  riscv32    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c393a8fb29e5baefff1abd4a596cf7d161439e3a | ORPH
    sh4a     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/f29c151af6485cba4435342b68cfdd2fc372823e |     
    arm      |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/5db20c1975fde48be89bfe300f7cec99550ac5fd |     
powerpc64le  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7d8da654f83b3b4b6b9dbcebb4e529b0a2e6402c |     
microblazeel |          lvm2-2.03.23          | NOK | https://autobuild.buildroot.org/results/b62dcbb6d2f160539ed8b70ea96db8ae1b7ab7ec | ORPH
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e2a84d7afec5e579e8581f74ec20ad8b061aaa38 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fd2146b291618d81b9ff2ba7cfeffd3a49f128f9 |     
  mips64el   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/cd03afb2b16ec359cd17d0e3bed7e8abe0f520d6 | ORPH
   arceb     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/258f1d78f70a24291cc53acebfc871717456336c | ORPH
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6d8e5005b826b3ca5ef75fb7e3388bf66ee4b3c7 |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/efc9662c00a28eaa806112b3fe44aeec7db1b5bf |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a1fc7825c263ab7bdf9f3560176b4a522598f07f |     
   nios2     |       open62541-v1.3.12        | NOK | https://autobuild.buildroot.org/results/a6bc3b2386941abe3b2de7313466ca18ffec2ad5 | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/6cd41cfd7293e4573f1f10357bb1022fc2ec3778 | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/5c43034781c31e90f1af67b2b675caec4b6fccab |     
   arceb     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/31009d1aaf262c061c22ed7d575ac147412fd909 | ORPH
  mips64el   |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/04a674d716b5a3dfa97d82efe74b5a7d59a76149 | ORPH
powerpc64le  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/a940ab18c39539f14be78a767dc3c4ec95f1103d | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/43d2e30d8b0705394850114f9fe7562974b6d7c8 | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/44830be1ca6131eb407b76558126444dc6c3fef0 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/1cc10473dc017ea50192e16f75e69df0a4b16884 | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/76b0fba05454c9870136f6884dc7e9e6cafd112a | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/7f89ff15d5e936f0ea9e127d975742ee6604a1a1 | ORPH
microblazeel |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/3a3c03121d4f565cc9508f7f7647adf823d2ed95 |     
    or1k     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/e4894e3cd110d41d795660673e0dde02edfd1c8f |     
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/940eca3a77a02152bd6bad915161f29afe142df5 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/07a72717af70daeda183591b7e2259e685a7a787 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/01803c46558e5277c006921e4bc5a12c33d70bf7 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/eae44a429a78dbf984c20de3a5436588a20a1768 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b073b77a5fe47eacbfb2005a0e007db34bb7316c | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5f2211272f9cdd7cf5745946fef1ee613acb20aa | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/961b7ab943b66dd9297ce67e214d12d6375594d5 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8a39c79d761c0e0d910c22dad595aa6b2d91f365 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9cc9794d8add1965dae65e5b781814b10327049b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1a0ba34e21f6b540045d720437d8765e2d7d0ed3 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b77da126d0cb417f108e299a8b7841a15aa8e419 | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/585996236098832a8c49d57cc49dec4cf2cbf14c | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ab2a03be5bec9d82d02e7754b04ef089c89917c0 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4963a751c2442e139cf6b9dd6a221990f09d466c | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5b3bfdcef8533de222e83e892b5a9f0e85e1b4bc | ORPH
    arc      |         python3-3.12.6         | NOK | https://autobuild.buildroot.org/results/551acd8c43bb6594a1ad445357848582db6599ab |     
    arc      |         python3-3.12.6         | NOK | https://autobuild.buildroot.org/results/0e763f23f76c94a50e27a0ee6e14069060cea77a |     
    i586     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/88c3d1dab9d1a2c35d955c60f86e44494079f083 | ORPH
    arc      |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/798a59d18c668bdac8252644ece81591ab829a57 | ORPH
   nios2     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/2c89059bb128ffe89ac1f54b55bd9f11213146bc | ORPH
    sh4      |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/c148afb09573fb066f9166f06d7a1c38f0063c59 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d5beb3ee851cc344625e118b6adc5a04fde40ab0 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6dcb5adb2a4350490d6b74be1346b22be30ec00f |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/196a9305288be764cbc0a1f508348fd455b095dc |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c3c1109e9d3ffcfe51b048c4735fd3766cdc8bbe |     
   mips64    |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/6e4a84a35996ad02560c9a1c7fd3a96e3d33e391 |     
    or1k     |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/b023bd74cf359e727772e8eb48f93f065fbd8681 |     
    arc      |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/6d080019cd54318b6ef4d5c50bf0f83c085e892a |     
  riscv64    | wireguard-linux-compat-1.0.... | NOK | https://autobuild.buildroot.org/results/6b1646757e19eb08c7c3c09d82aef570a7b40943 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/662ea6e0f1916e8aef484be371b1af26e6234450 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bind-9.18.28 | 2 
host-android-tools-4.2.2+gi... | 1 
           python-numpy-1.25.0 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/66c5c0d579e249d0d2d9cfa584ffa0926490efd9 | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/c69b9dcc5a25a4264de28e16cfa91034e29a1325 | ORPH
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/5e45e3b2d727810f27e03fde4cd785c1521ab441 |     
  aarch64    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/1dbea1497850d183b7c49e57048c7ba2e5d78fce |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8142573a822f56dca9fd715bf241444ff8eac5a7 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 5 
                host-go-1.22.5 | 3 
                 openssh-9.7p1 | 2 
               procps-ng-4.0.4 | 2 
                  bcusdk-0.0.5 | 1 
                  dhcpdump-1.8 | 1 
                dos2unix-7.5.2 | 1 
                   foot-1.16.2 | 1 
                    gcr-3.40.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
          gitlab-runner-15.5.0 | 1 
         gobject-introspection | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                   i2pd-2.50.2 | 1 
             libgphoto2-2.5.27 | 1 
            libmemcached-1.1.4 | 1 
              libopenssl-3.3.1 | 1 
           mediastreamer-4.4.8 | 1 
           python-zlmdb-22.6.1 | 1 
              skalibs-2.12.0.1 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b6a93312f12d371a9ab82ce6e6beb7ef6b2a8977 |     
   nios2     |          dhcpdump-1.8          | NOK | https://autobuild.buildroot.org/results/39c29297e289f2959ceb09db49b7c5ae530ca934 | ORPH
  riscv32    |         dos2unix-7.5.2         | NOK | https://autobuild.buildroot.org/results/43e2a7623374d935ad7f8a7ab50a0f58c85483ca | ORPH
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a21e40e6cb856a382c0324defa70f12f8c947b9c |     
   sh4aeb    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/34f02e646cc2a88ae455ce9075ed7e44d3257dd5 | ORPH
    mips     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/1dede530b528ac567e50d02e4bad24df1771d664 | ORPH
  riscv64    |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/5ee23806525de2af8a16bc8502ce074ffddbbb69 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2f780f4f663ecd2736f40e61f3aea0580470e645 |     
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/7451d423618f2f028f16fc632a511ebd555b159b |     
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/82319a40714550704d1b753cf6cf1b6d80375704 |     
  mips64el   |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/3a86e36fee70b6327edd63c34c72a891781149e4 |     
   mipsel    | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/e10891735b85fc4e1762669b4e9aa32c3fa0eb36 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/7233bf228855f1229554d26f09772d91b590af82 | ORPH
    or1k     |          i2pd-2.50.2           | NOK | https://autobuild.buildroot.org/results/468907c461b372ccb0d343102a298c03eef7fc5c |     
   sh4aeb    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/f7c6cd7058f9dcbc9e6bdbf5d58762775d9ee9da | ORPH
    sh4      |       libmemcached-1.1.4       | NOK | https://autobuild.buildroot.org/results/3d9efd6fccb1497652b441917f6a0915bf265027 | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | https://autobuild.buildroot.org/results/92ae1a3f26615287894e552a469851fdde197853 | ORPH
 aarch64_be  |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/15307d7c52c34266823f6a36ea11c20944e83c5e | ORPH
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/313fd7e475759c5e017fc41a54ecd9f5bd4eccb4 | ORPH
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/0216f2292b16f1da2ae641d024a751d0c2b3331e | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0c17cdeccfb67a81e325a933a756d1981d39fd43 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d56966020fac9d5a6e760aec7821485a7dfb7ffd | ORPH
    arm      |      python-zlmdb-22.6.1       | NOK | https://autobuild.buildroot.org/results/8117f8e3e7d2237b3198677cbce9098143e4fe1a |     
   sparc     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/ef248e74a38537207c8f267eef4d8973d1a60f07 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3adac9e02242f38433f69734a0bbb9df7b3e6853 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/99beb955a0a27233f8b9f32c230625420b3b2346 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1f14e2c7a1b2e01fbf51073f88ddbd0f5175e78d |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/5c8618273066f3440369a48f62059d1b0eaf488f |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/83d9c3f1756dfed4e3f94e21ee2f4a2b34ad940c |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/b37ceb231a0e1b88bf4a4f51b2793b756b59b715 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

 host-binutils-bare-metal-2.42 | 2 
aubio-152d6819b360c2e7b379e... | 1 
                elfutils-0.189 | 1 
            host-ccache-4.10.1 | 1 
                       unknown | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/3782314a0cdb9fb4f43edb4c28c455970c05dc4e |     
    i686     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/396c3fdb288386e56c4fdd67668dee9b06e7cc8d | ORPH
microblazeel | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/84305159a245bddf439b4c2e8e31ed3ba782ebbd |     
  riscv64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/dd05f402cd5d240b32f5d1640665f050d66d0717 |     
microblazeel |       host-ccache-4.10.1       | NOK | https://autobuild.buildroot.org/results/d2ba3fd264b8a055b5d93cbe27fc12a06f501b75 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/10798d737782b80b1b6b67edc539aca0c7a52745 |     


Gitlab CI results for 2024-10-03
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364596  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364623  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364624  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364629  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364630  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364632  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364635  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364637  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364642  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364647  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364652  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364655  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364664  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364670  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364681  | ORPH 
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364682  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364696  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364714  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364716  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364720  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364724  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364725  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364726  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364727  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364728  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364759  |      
               imx6ulz_bsh_smm_m2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364778  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364793  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364797  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364801  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364803  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364806  | ORPH 
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364811  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364815  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364819  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364824  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364870  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364872  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364877  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364913  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364922  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364956  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979364964  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365078  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365099  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365103  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365106  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365121  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365125  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365144  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365146  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365167  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365173  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365175  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979365179  |      


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006646  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007528  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948009145  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948009149  | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007534  | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007537  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006789  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006805  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007574  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007585  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007871  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948007901  | ORPH 
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/7979495977  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008076  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008089  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008240  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008442  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008248  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008277  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008287  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008273  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008300  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008312  | ORPH 
       TestPythonPy3Evdev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008332  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008353  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008375  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008388  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008394  | ORPH 
     TestPythonPy3MsgPack | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008414  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008422  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008430  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008446  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008448  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008450  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008459  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008475  | ORPH 
       TestPythonPy3Sdbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008476  | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008478  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008484  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008488  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008502  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008507  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006818  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006828  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008528  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006838  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006849  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
