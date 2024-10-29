Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7224CD5B870
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 04:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C708C40677;
	Tue, 29 Oct 2024 04:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUMuR9Tn0fCf; Tue, 29 Oct 2024 04:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2727640679
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2727640679;
	Tue, 29 Oct 2024 04:19:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F8ED4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 04:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53A7D810F4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 04:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KD_50b9_TK1L for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 04:19:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE02380BBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE02380BBE
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE02380BBE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 04:19:09 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a0472306cso685087966b.3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730175548; x=1730780348;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hZmQVLpgIMoeDB8d3U1qHWYbePgmUbMImDC0rYV2I4=;
 b=sueuuD2xjzJUBNCiGCon/I34TPZLhlS9YekVcyuZImL/Bou4H5GG7aqu32dGRTZG/t
 BpaXlA//4Q1NMaWGCmiY1rT0PQeAiiXmT3IKlpSgYRyJZIY8paWrRaA4HYyJhvdEbEHp
 z261YSG1xKQNhz4OlJUIgv+g6WqppRK6t+JhCi37qXAh/aJSQF+1LgMbLmJyFOOHBuBp
 l+x/Iej3EH3uL2Zvz+cEtt1HNZ9026n8I5fTD4t8F4Rw3Hi3wwMmGyb4ebdgxJ9F3mHA
 FbtDC2i7CzFekas2HmRgu1qsJ1FG+lUPFzgobV/HXCkN5DcS6NvIDda6wCbqSRORWJXp
 HUVQ==
X-Gm-Message-State: AOJu0YzkHg/C/7IK2JqqSa+6mA+tL99ujt0HSWyqeXHfwRXOrPQV/CND
 7DWoUioUggAGA7nXtA9Ip7TQ75L1vvU45QIJ8/gY1dRvPZcywyO8S4Sqjw==
X-Google-Smtp-Source: AGHT+IGPUckw7CUjUUWoeaiNdARXhWVVr9pgXJK4DjHSaLR2Z0wIjReoFVx4UZ3ULPZl/UDI7gI24Q==
X-Received: by 2002:a17:907:7f87:b0:a9a:67aa:31f5 with SMTP id
 a640c23a62f3a-a9de5cfea51mr885746966b.10.1730175547051; 
 Mon, 28 Oct 2024 21:19:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0887eesm430986366b.219.2024.10.28.21.19.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 21:19:06 -0700 (PDT)
Message-ID: <6720623a.170a0220.1f1480.cf41@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 29 Oct 2024 04:19:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730175548; x=1730780348; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/hZmQVLpgIMoeDB8d3U1qHWYbePgmUbMImDC0rYV2I4=;
 b=NSbz4eAfnLYXWuN5MrFhiuTzSX8w7cPs0iBDTT6au6STXr8zefZAYydQeAtwG8c9aX
 Dp1tJe4d28oD73hHWy7aC3D8fW76Xzc1uR+l3h1/za8Q5JWw7H79qjYqh1i5AHRhhXkC
 Dho1FT0x7CgeqUCRDxheA4IDq/+sxRoQCTCfKjQ/tGPxodlH29JukiEoFSIzkqzbtbck
 mXnWImcRALAVrJL39xYhzRNy4yaMejmQLflmhVVu1EB1aOaaNeYoo3unIPi8fw6aes5Q
 Iowscg9z7NWf+IyytjWcl36A75k+x2RA8mb5sI1peCuR7FpMyY2YN/lQNkqQ1gR+Oq/0
 pRXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NSbz4eAf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-28
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

Autobuild statistics for 2024-10-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  5  |  0  | 13  |
  2024.05.x  | 22  | 23  |  1  | 46  |
  2024.08.x  |  4  |  3  |  1  |  8  |
    master   | 12  | 272 |  3  | 287 |

Classification of failures by reason for master
-----------------------------------------------

           musl-compat-headers | 17
               procps-ng-4.0.4 | 16
                    bsdiff-4.3 | 15
                  linux-6.11.5 | 12
             util-linux-2.40.2 | 10
                  curlpp-0.8.1 | 9 
                 apache-2.4.62 | 8 
           host-doxygen-1.8.18 | 8 
                 gnuplot-6.0.1 | 7 
 ibm-sw-tpm2-rev183-2024-03-27 | 7 
            host-binutils-2.42 | 6 
host-binutils-bare-metal-2.... | 6 
           host-checksec-2.7.1 | 6 
             dahdi-linux-3.3.0 | 5 
                  ffmpeg-6.1.2 | 5 
  gobject-introspection-1.76.1 | 5 
                 libpng-1.6.44 | 5 
               linux-pam-1.6.1 | 5 
                 openssh-9.9p1 | 5 
                       unknown | 5 
              host-rust-1.81.0 | 4 
              libopenssl-3.4.0 | 4 
           libzenoh-pico-1.0.0 | 4 
               pulseaudio-17.0 | 4 
android-tools-4.2.2+git2013... | 3 
             batman-adv-2024.2 | 3 
                   eza-0.18.22 | 3 
glibc-2.40-18-g564178076272... | 3 
         gobject-introspection | 3 
                latencytop-0.5 | 3 
               mariadb-10.11.6 | 3 
                  ntp-4.2.8p18 | 3 
                   perl-5.40.0 | 3 
                  assimp-5.3.1 | 2 
           at-spi2-core-2.50.0 | 2 
                   foot-1.16.2 | 2 
            gettext-gnu-0.22.4 | 2 
                    git-2.47.0 | 2 
               graphene-1.10.8 | 2 
                host-go-1.23.2 | 2 
         host-libxcrypt-4.4.36 | 2 
    host-python-greenlet-3.1.1 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
              mosquitto-2.0.20 | 2 
        util-linux-libs-2.40.2 | 2 
               valgrind-3.23.0 | 2 
                     ace-7.1.1 | 1 
               arp-scan-1.10.0 | 1 
                   bcc-v0.31.0 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.2 | 1 
          cloudflared-2024.9.1 | 1 
             cni-plugins-1.3.0 | 1 
             containerd-1.7.23 | 1 
                 coreutils-9.5 | 1 
                     crun-1.15 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
                    dpdk-24.07 | 1 
                elfutils-0.189 | 1 
       freeradius-server-3.2.6 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
                  giblib-1.2.4 | 1 
        gmrender-resurrect-0.1 | 1 
                   grpc-1.51.1 | 1 
host-firmware-utils-86739f2... | 1 
   host-mender-artifact-3.11.2 | 1 
              host-rust-1.82.0 | 1 
               iproute2-6.11.0 | 1 
                  jack2-1.9.22 | 1 
             libargtable2-2.13 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.7 | 1 
             lirc-tools-0.10.2 | 1 
                 mesa3d-24.0.9 | 1 
            netstat-nat-1.4.10 | 1 
                 pixman-0.42.2 | 1 
        python-m2crypto-0.42.0 | 1 
                  quagga-1.2.4 | 1 
           sane-backends-1.1.1 | 1 
                   sdl2-2.30.7 | 1 
                 sqlite-3.47.0 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/adb701719ede37fc76007969e6f39843b20c8a39 | ORPH
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/906bae6bb9cd630ffe66e3fe562f776a215a8ac8 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/1f4b00884cf180ef79a78128b4703cee1fcb4b59 |     
   s390x     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b16f0a8f9d80f5065a6b655fcc5553c84e561fdc |     
    mips     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/370d27dd96817356ac0dca99dc2b53fd25e028ad |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/9187d8328e2f2949e52be656ffb37cf178e3c298 |     
 powerpc64   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/7ead1085e18c11294335cd82f282feb6da8b34f3 |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/6e6b4f433cc944499570e19704cff8e104a3ddf7 |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/2f6b7bbb4c97e4c91b3abd6bb205e237e57045fa |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/cb94488625c7c055e077ed79f36a33c3298846ac |     
    mips     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/0a417421d3857a6d58dc77db242a91998db41430 |     
  mips64el   |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/d0288ababfa62fb6bc3126167f91c602cb2d7129 |     
   arceb     |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/f2d0b13b93c369cf9b77a7425b1ed27d6d556842 |     
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/b4a9a5b1fc59cf043abfd517156e87a76bd00971 | ORPH
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/90e847575920fa20b73176b90cfd59df9fdacc68 | ORPH
   nios2     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/baebfef1729a93a91a9096de410f1815ef6ac9d6 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/52fb1cba78c4a1d2f68e1fdb1799932a2cff097b |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/3716c0353a2eaa994ca40e0ccd039e7c41ccf54e |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/26e45af4268bea589c00ad8095f3a1dab89ccb4c |     
    m68k     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/bec7264c1e96651ee4ead35b4a784c038522b6ff |     
   x86_64    |          bcc-v0.31.0           | NOK | https://autobuild.buildroot.org/results/41b8a8801c6eee2ec691d15674d3d7e19ed31dbc |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/eeb8a1fea62c0d5c61284f5e7eb2a2100206dbe6 |     
microblazeel |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0f078895bb1dce8137ca065882a178533e33b287 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/41f372b4c8d86796193fc252fada1a73b0d34388 |     
    sh4a     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/25c41a909298965fdb4fe8f88ec1d87025c67b63 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/20dc38dcce83c16f5bcd34fb354f711b842053c2 |     
   s390x     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/33a2c3b8ad031be359b68616aad3476a9ecf563c | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/cbae3c9f27200106efccd10ea8f1adc8339aa3dd | ORPH
   sparc     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/421d1efc6a0936d85a50ad8f93b2af925c2dc81f | ORPH
 aarch64_be  |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/9861c57fc001d1849c4e01d689f41c322c6ff825 | ORPH
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/7cccd0a8620097f7d4a93323c85f381ce5b68853 | ORPH
  sparc64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/e67e44c714bac7399d4ee294a266617f138d8615 | ORPH
  mips64el   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/f71f4f2bfa9d2500c68bb83a3715d0e05f1f3922 | ORPH
   s390x     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/0bd5f5af092351c2d67765aab274507898dd98ce | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/cca04df62144edce64f74f79f23ddf6b949f81f2 | ORPH
    sh4      |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/b57a56089c7c26d90ec80c953d54facdb726edd0 | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/f100c82e11d7cf4462804d7673aec85d95aded68 | ORPH
    sh4      |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/82091ff434b43b55d086ae551ac114d4fc413c35 | ORPH
    m68k     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/220eb4573e056a2cec36a258407b10ee0f35494b | ORPH
   x86_64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/d1f9d8836d59cd08185d39a9c07a460ac4e7eac1 | ORPH
  mips64el   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/fd9e938768fa6bc7fae95fad454334a42bd04d35 | ORPH
   nios2     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/ece92c898c254c293508fb51adb97d24febc9d8f | ORPH
   s390x     |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/05dccbef3a2aa95fb2c9bff95fb53f7c3e0a8ccf |     
   s390x     |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/2afbba7561abf5f820ec3ca3780a8e42346d33c5 |     
    arm      |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/9e6aaa01da98bf20d68e317a165a9b5c31e0de17 |     
powerpc64le  |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/b912d8efa4e2bbad4bd6de756099dddf4f300160 |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/6b0b70fe7734423cbfbd41f12985e286c57c4b81 | ORPH
   arceb     |           crun-1.15            | NOK | https://autobuild.buildroot.org/results/a7b7da7df74384028e6cd2d27be75da1c3619848 |     
   mips64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/f9d0bf2165c67ef26c9ed28ca67416c77d0a2990 |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/9ee435ac981c94aa634e9e3a760779304e77094b |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/511c6814800ad72e1059ebd18f9f9beaf350e679 |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/9251717c111ed51c19ac232ef5d6720d5a036961 |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/3cf833b3d9b1e0f381d19b4813e4d14367961399 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/4734646fd05d443b980606cc3e5dea2a86939f9c |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/595daf1257f6f44307f10b8859ff7d37c3bace24 |     
   mipsel    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/9e56d5cda4e66008057edb3cee065ce150284e19 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/fdaffce7896028a4e656f7bbca4232eddc9ec0a5 |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/cde9cdd67c6aba33fe85ce6e5dc961b3a4776b69 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7df8075f72e79ae81665aa3edd912bf5e3c0dc8d |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fbe47bc66117fd706cffe62b607fa1d97fbcebb4 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1c90f40c1a037b01b6ba234a973a50538d6667be |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/51f0b397ecee8deba35cd3720e964a984d67e437 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0b3e245fa262a3590445edb40ba8bf54080957c3 |     
  sparc64    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/b632afd5367225803501b868d773100a7152f9b4 |     
   x86_64    |           dpdk-24.07           | NOK | https://autobuild.buildroot.org/results/c095bbad7c05bb81aea44c0d5c992670f7db7410 |     
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/aa211e1979f102b8c2eb02d8a3950be1b2d24af1 | ORPH
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/0098bb1c4a3dc50681b03efee770fb866fb979ca |     
    i686     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/3b68bad9a834428c0ff6dea6280ac7ae68707db2 |     
  sparc64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/45c41a0c623662ef45d3824d922f513fbeb7f2da |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/795a4a51f748720dcdafb57b4c8bde073356f893 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ca0d8c5be5a08c80ae4cdaaad5770af0ca990b60 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/691ab50435592a7402a6e1a0b0e2a3ddda29118f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/822b9db66e02b185481502763abb626f14b5b0b4 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ed78fcbbf9878d97034e461580d756cba08a3506 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f5e9d1e6bf82d54aefa79e6e7bed4297f7334dde |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ec6d6c42c26eb78e5575ee6c2cf9d5d9aea82910 |     
  mips64el   |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/001eab87a313ce2d1366f006f97b3f22c3a59723 |     
  mips64el   | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/91a38ec3e7e50006898bc8a1dd7b0ee3e814bfd3 |     
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/031ad0441691cfa6a215779a815ff06caeb38a9c | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/7945a65e3e241c6f82b2909415f164e83234a063 | ORPH
   x86_64    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/8b27a4eb18ca4478bbd05bf48a695235f12820e0 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/d715dc53cf9b85dfcd02222685a5b51c62a92392 |     
   arceb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/54f877edb7ae7121885a681c82162bb78186a203 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/a962b52c1748dceff2a3958946f241cae8ccd409 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/f7097fb801d8f05a28b839995f413ef258bb67c5 |     
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/be72ecb1c5d8f5a821fcb9b5a09a103e03712397 |     
    sh4a     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/986f7ba3d111740485ee3d9df117aa4180d93d0f |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/3565fa1da27e310bc11ccb983af7ae275fefe572 |     
   mipsel    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/375e202db66f8040d6adc32ffa51f393392a4f34 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/a26ed86f0384744e18d48e83495d43102299cac0 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/6cb1ccfd4d950eb719d2e66f9ba016e107cc12fa |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/4dd0a6bb44c1a9c7e2a113eb71098965f65fe76d |     
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/13e81af628ba1d6ff7497c6ac4c9da5beccdd29c |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/014036b390dad85c4ae5af771f9edb2c80ca74ff |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/07836d31c9ac4ce2e243face081d554e52d365eb |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/9de7dd4080f1892bb3182a72a7a2135cb49c1bcb |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/bb1135104bd49588749074797e183c91a5462bae |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b8ea0395139e753ab4204b7f194cf50ce922633d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8873e431530d1da9524886cadf90362023fa9c70 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/54739d72e4c67280902e21c5a29891d1236d8228 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5a35713e0ee8dd87f07d3bccc9fee36d84633d5a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2680456387fd1ad7412959006934950447b18e36 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7ba2bd378b671b05f3f442f8133ce9e33ce81e13 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/cc40b8479a16204e5ee82a84151ab4aded488173 |     
  aarch64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/d79f64449d6f80eaf00ddb29bb665313626f53a2 |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8057de7d5db46e76ece7ca908f0f0556eae25112 |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ef76f725d81a2fbfc806beb3d76a4ff4aa135fde |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e36b3da22638207f3c557a4b2c0711014b50b659 |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b51e315897c0cb2ee2a899b79d554f3cb54dc1f1 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c6030183f3ea101d0ba49641adbcd21eae9c2a14 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/298025ef7084d1142285fb92d0c66a10343f0a51 |     
   xtensa    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/93012af9bf66ba4d8bbed0679b00966d2edf4250 |     
 microblaze  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/4e059377f7a97f66486723d337298004d78c1688 |     
 microblaze  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/bce7216617a6a1da3b8cb5e3c28e1adad64b81f8 |     
    arc      | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/3a6fb81d3e5257b757f83f3b557b01ed9fa31359 |     
powerpc64le  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/efe72f363223e46c3d4568d09aa88b1800c282a5 |     
    mips     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/a16794142625c9d81f4a43f6361278f617fb1a81 |     
  sparc64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/e46c7de37bbf253b8109c8245c0cf47b7a71f1b1 | ORPH
microblazeel |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/3271d4d3361a3f567207fd3b47c6b8671d2f87e0 | ORPH
    m68k     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/dabe99a4cac4b0e4ae5e9dbb670d004968c8406f | ORPH
    mips     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/bfe95d17e9df64bd3ddf682b70c823fd5ddfe9c2 | ORPH
powerpc64le  |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/a2d0af9c824b0cf1bf4702f2591786d3b4942723 | ORPH
  aarch64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/3ca73b3a09a7e493e8ecf92e16c9173fba6a3dd6 | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2eefe4ff6321d82de1050dee37b0b9ef44257f3c | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/42e4fe4c7b6984efec44ed9346b39159adaf25a3 | ORPH
 aarch64_be  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/4c65cf1e7aed8a1f1e1bf6bf09bf4cd9ec96b31e | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/0f353bfc0b64530e05cb40e1e60d33e90c8c6d10 | ORPH
   arceb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/afe49d0ed488e9fbcd28edd859d247478933acb3 | ORPH
    arm      |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/9d5dc018c31ccaa62a4d8bb1e48152205e0516c8 | ORPH
  aarch64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/1196e6a7333d0b23b172dfbe31197367a1be4fc6 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/02273d10db4729501285a5228d39f4466c868c36 | ORPH
    mips     | host-firmware-utils-86739f2... | NOK | https://autobuild.buildroot.org/results/61926823415aede5d7840c8d01b882acdbb8c2e7 |     
 powerpc64   |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/81b53a33ea7ed42898f3085fbff2663738d774a6 |     
    mips     |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/3dc6272d17c57834e632a0737df56e4385a6fe0c |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/afc1dc48aba9c5bcd4b2f5dbbf952f0e4132f54d |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/c72d6678feea36d713085a3a6a1c2788d58b0b91 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/ac4e81738efea411bcd02901d577af15555fa126 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/eb1b65c9efe741aa5dd45cd514eff5a0e055b096 |     
   sh4eb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0b9900dd4cd252a0069dbd1636b93bbf50e40119 |     
   s390x     |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/d519b02a86ff972df3e0e3a09a145be2de5806b1 |     
powerpc64le  |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/d2bc25d22e1ffc06ed3f76b7b086c5d6ab42de4f |     
   s390x     |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/88e225cae165cce6b6e8c707458df06480272fc5 |     
    i686     |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/10796e04d4577032061ec731db1af3a866ec7aba |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/44070272c82a911b5309cb9ec30a1df0f5ae7236 |     
    or1k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ca4f67111b2d2cb592862dcd9b4f023cc8bc6300 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/6934c25d8af672db0ffb7b9f12c9028a74f3b546 |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e7a11cbe59afe2422c5d30c2d4c21a4be7c7762e |     
    sh4      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b72c3a5d68d3aa5961e9ce0e42d53ad1ea7750dd |     
powerpc64le  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/cccd57c7033d1944930d7abb78c8f2141e3f3ea7 |     
  riscv32    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/6e50645b679d84411cc246dd684c3601990f5c12 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f3e4c1bee6358c4778e3f50d8799f82a0cdb08a5 |     
   sh4aeb    |        iproute2-6.11.0         | NOK | https://autobuild.buildroot.org/results/5b09ee46f9ebd7884b914326051a71d22a84a903 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/aabc92c90b2b022b36300f2ef6e86d02949659e8 |     
 microblaze  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/da647d5ce532ee9a348d58007ee11caff236692e | ORPH
   sparc     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/9a6035975a7a394eea24d67f788c66de8106c020 | ORPH
  powerpc    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/40d227ba7c0f30afbd8c1a85a1823b5e1148dd47 | ORPH
   arceb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/6a1faf1e62a7d8400c91ecafa4f552e5fb9bd47c | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/0ab61127f3a71b69a28f006ed98de0f08d714445 | ORPH
powerpc64le  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d5b2814c895b34603059ded3793649ffa1ea20f7 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/dc9de5158e8887442eb5bc855daf62513369a329 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/7d1045bbe96c709aab6394a4767349714cd35b2b | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cc2f877a6d2ad60b9859373f6873a56dc68c6dc8 |     
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/02158525203d8c7f16a4a32637d44d6c87b7f333 |     
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/9cf48ac9d0becddb56ec297c9ed6502804a53117 |     
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/d933f72f7a131303df5b33018a62b281d5a83170 |     
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/3b9e9e0c9cee1837bf9b06269079741b808c67e6 |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/a0d83f784ec741fdbb14e52915f948e004cd8b88 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/b495166d23767acd2f33ac4200c3d08c1492607e |     
   s390x     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/60860c45a0da7a1b3f8b486b8f663264e124cebf |     
   mips64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/c8656d3dc6f2cc0a2be7bf3b5ee5d0cf72b8ced9 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/8f897f5ab26f482e7156d0a31f082f09936ec738 |     
    sh4      |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/84338fc72c28bcb6a0d5e68926dde40b7a5688f6 |     
   arceb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ca060d46fc6c427b76d3ce82aff615c915c5f8d5 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/dbc6e3c6aa793f6a1e70cd03f3de4a98cd54f29b | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6d0fe4e6c4bf637aa3abb45db2095ae81a5b59d0 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/70a6e191d029d362c6fb8e58fab3ba6306e448f8 | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/0592e97679f0070b42d29314d276363ab2473b7d | ORPH
   xtensa    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/5064109f5fc7c0c6968a15597b643b30e536c5bd | ORPH
    sh4a     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/8812cf9148c7ecbc35a395fbb3e25530f87cfb5c | ORPH
    sh4a     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/6ed2de87a2663a3ed4c0d974b122fdf4eaa30604 | ORPH
  sparc64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/ae28c495434e9855117cc0cdc08d171dbd0c1301 | ORPH
    sh4a     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/8e2d0d2a76479b3bea77f29b8d45ed8f3fd5b07f | ORPH
    mips     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/854c2e16087181f1c183c374ce2058707222574a | ORPH
    mips     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/31a53294041fedd43823b4ee0ce28918362cc983 | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/9d854fe514ba6ad2fde5113d0be7ec1544821f71 | ORPH
  powerpc    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/25b24c8121c48c5cc67734394e4a261c7cae642f | ORPH
   arceb     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/677edf611aae48466a7666db13731c144994e1c0 | ORPH
    i686     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/e7e3eb89abd859b0281b13502f8b0a3463c97d81 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/b6d9e50e17dab36026b3cb5cd6fe230da74b968c | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/98ab1346d5a37cc25dd67b6108b11b0d5386545a | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/67992ad77512ec49d9ab3a5a55324b3baccf6ab8 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/cc61a633bcc8be9d246565da7957a8abaf123852 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0b8e946390039c24add5a9f4b4727ef3b2d6e0b5 | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/558760c1cb66543249ddfcbb3963555b0f465377 | ORPH
  sparc64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/58fec7fc7e562f39bf9880627facbecf81968bfe | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/662cf451fe2048394f690dcec3194d3b9032e632 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/9e74414ebac9d6c762415223dfac93e86726088b | ORPH
   s390x     |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/48296fecbd580d5c6a2cc11e92e06d98858aea99 |     
 microblaze  |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/4e902dc02b25c19302ad929e8bcbfc953037b1e0 |     
 microblaze  |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/863b5cb23c260b42abe69d547804befa083d8131 |     
    or1k     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/c4e14e0cf0e973e8fa80350a35853a0421b05037 |     
   s390x     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/ce6aa2212e4f6c860923c45be1fe5bc03532b3b6 |     
   s390x     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/57c8078f382f74859076512425b2f1c52f44e95a |     
powerpc64le  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/da0b24addfb636cc85a936b968fdbb96ef4ed2e7 |     
   armeb     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/532122b76311c46f247e9f9358912818b611644e |     
  powerpc    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/5b1f5df21c08160bace58133d077e29d96404ad8 |     
    i686     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/1e084af8c07b8078c4f07b0f78cdda81a5b5d7e5 |     
   mips64    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/cb0d0f0b46cd396c59f28814434e9a757dcd024f |     
powerpc64le  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/2028dd3176a4aa0516785cf18518d958bac3809e |     
microblazeel |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/d76926123e4d17ef3a9d2ccd08fe6c75f397c2d7 |     
 microblaze  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/d0ee4797b0e46882b71646c33074d2f5cc1364c7 |     
  powerpc    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/b45ccae9adbbd36dd89ae2822b2fa1c4a33052b8 |     
powerpc64le  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/73acc55b970b25446b43a70a6003c80e9012336b |     
   sh4aeb    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/88a575b0df3ea98aa89cb4915eb0945712a57b44 |     
    i686     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/a4a91c46292751a1d5afd23b305989065be9823d |     
 microblaze  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/ffaaa208a4409b785fda59ef249a2c5a33ba68cf |     
  aarch64    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/0292f5b7436025bb65a9999cbacba710a20969eb |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/9a2b5f444db71dc93fcd66db9e676c208ecb4c0b | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/619f2daab5af9384d6fa61afc945a513c73ef754 |     
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fb4a011f14e87d348a53695868bb5f3b69496fc8 |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d45fffbd619fd4314223df28fe98f0bf7ad04d50 |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/55d887f29b818daa312a7cc11b241d7e0e41466e | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/03d9e7eb4fdbbda5a4436bb6713d98119008a5d2 | ORPH
   sh4aeb    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/1e651724373f32e45d122d05fa3a10ac88fe29dc | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/aa5402aa7186198bb227df3303a72a2a899eba42 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/7dec610025140dc2153ebd056192b42e5cfb8f9a | ORPH
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/73c6b317458a4e54d8e32f868ad0214d7e357f9b |     
    m68k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/746f82818f91c406572bb80fd85a6d9f45f7f3ba |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/6965dafbbd9163325fe1016b11a18a7690e285b1 |     
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/740d155ea68d445b4edf316185d1a71898b1b25e | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ba9a05b6bf2de9692fd208af1d191ee93f047648 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9cb8db6c376dbc8fe38d14d536114484ccf2e30a | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/805107772d03a9c5732ee94462ca0f7892d61aa4 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e1f388b95dcd502e56ea2e5a5d404311389ef103 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0ef93f9768eca86cd73c27e6a664a53167862b9c | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/872268f3a292965b266c63b9c4a7440eedb71e33 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ab6e583bd9061347f3cca705397359262d1cbaee | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9e5acb35a970ad3d0fdc80d3726fac941d3fa575 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3e125d0d5d7cdc6a2194b3c1a57e5b9a9d8b76dc | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ee629c4448c1e527fa9ba32c9c3f37e1215933d4 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/098c4afdc1ef72728418c9a50734669c6b4951ae | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0e653dfc82c33a27121f134888c4b9af7d9f876b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a63afa4ebf9db70292ca387ad7567f2bca9a968a | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d04a2b42814580859e25e25fad7f13822517574b | ORPH
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7c652eba9b69183e09df7f59180e0f71b356ae59 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/21a6dacda2a5f3c6c0eb75b84ba69d0e77e137e3 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5fa7186619be1381fa47383b77b09d220b530dcf | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f34ec152209fa8eed19dc9853cad3cbad8d8c6a2 | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c60c757022a69b3b8c2153d62430b8dcd64c6c45 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/8a958547bcf7ee2a779aad152dfe0d84d8c216d0 | ORPH
    i686     |     python-m2crypto-0.42.0     | NOK | https://autobuild.buildroot.org/results/e1b9686689a3a6ad670b2f3a62a0138f0b4dfe3d |     
  powerpc    |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/f053eb6f7175e99ac729290369889d0d710f961d | ORPH
    sh4a     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/6b9d40ba044c7e6e81ca1ce3a61f8e66e86f9238 |     
    mips     |          sdl2-2.30.7           | NOK | https://autobuild.buildroot.org/results/db9e9758ec5973c8095a05233b19edcc0e60a33f |     
   mips64    |         sqlite-3.47.0          | NOK | https://autobuild.buildroot.org/results/0e19b1bc33916f1ed8ea98796972694ad21d96e0 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/10e156e0b6996340f0582c676d5742db6a072f21 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ea2db33c2c9af66ed25ec9f2421a6e645f240d62 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2c3786d2dfd1377afa24460d05998dfe297aac2b |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/63d54895bfa16258a152d2b850421466cf978aec |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/f900a3ef61f9948d978c1884c573d44faa717844 |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a4a1214f6039420ba0cf70ddb81dd611c521e565 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3801d09a1f646755fbf3286080b681278438a974 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5976338ae8110f1cbbb20f22a53f634f10108d40 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/62c33804838baa78a83663d6114a4b124f34fb40 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/108e872c32b1b72f4ff1724334435bda32801854 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/480754f15d942b9660f8284d55632cb9120b61b3 | ORPH
   arceb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2c89b919d7dfb1859935b3dba3716edc8fbb2bb2 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/26939cab28b2ffbdd1dbb0e05dbcbd34f448b9ca | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/15284b70218172c91624f782239af69a0124f7da | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4125236a13cc216312f67e496c58b86017d870d1 | ORPH
 aarch64_be  |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/7eae16cd6c89200cf3f6f0cc40b5f3e9be4ed0c4 | ORPH
   arceb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/88dbb8b3c8854927a385a1e4854139e9562a5a1e | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/08f075817bde15d0dcb3bfbdd5a1257a5a4754d1 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/554a28721420ed0b8fab78f3a98ba80832469a57 | ORPH
   mipsel    |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/dcc4c1f5b555ac52e1f3e2adba77bc5209440215 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 3 
host-prelink-cross-a853a5d7... | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/230c4c97402e48fe515f708648fecc1f23ed82c3 |     
 powerpc64   |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/e8c710992181aa444f18791e897558d9ecd86689 |     
   arceb     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/b23dbf0ec9bf937f9a6fbb7d1441794e5db3035e |     
   nios2     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/fd52b9d71bd8d236164ec5e68b23b3bbb20cea15 | ORPH
  mips64el   |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/a50ba834e701cf061a6830887ddf600ceda4ca1c | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 2 
                 coreutils-9.3 | 1 
                  ffmpeg-6.1.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
             host-delve-1.22.1 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
      host-riscv-isa-sim-1.1.0 | 1 
               libglib2-2.76.1 | 1 
            libmemcached-1.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.8.12 | 1 
               linux-pam-1.6.1 | 1 
               pipewire-0.3.81 | 1 
               procps-ng-4.0.4 | 1 
                 rrdtool-1.8.0 | 1 
              skalibs-2.12.0.1 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/9891768c8607ae6a3012fa9db6bca66cd53c74b4 | ORPH
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e44c09dab14339d397637c4893db15023ded555f |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/3011b018ac64a021f8830fe6e35029d0a5c56a21 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/cb846612bb610320d2ddf51d88d78c81548d7789 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7f441174100aedae13d288f9072db4799ee9ba21 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6133a50ac54456e705aaf30f2f0a2ea89512aa39 | ORPH
    arc      | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/67bf98a59f2fad8e69ac21ffc11c5809c9c23187 |     
    arm      |       host-delve-1.22.1        | NOK | https://autobuild.buildroot.org/results/c819a6f4383cf16764e7349d540f77ffd8221aea |     
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/ccc024b9421463b9b5368e969f0314c6465b9012 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/03fe114ef50bd7ebe2ce940c03fb9876c32e1b76 | ORPH
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/3a951474523523e144e9f001f53c993903d0bb4f |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/63ce5511ebc52a5d67f09a037bd7b4ac76e38513 |     
    m68k     |       libmemcached-1.1.4       | NOK | https://autobuild.buildroot.org/results/0700392b84e0902473096009a056b1d200dfe286 | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/39d9001304f01cf389f6a0a7fbea7b64b6aafab3 | ORPH
   x86_64    |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/af7d3673d5e37d5ac26cea3af5442880344e7db4 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/bad72cb1f34d4bc7a56038263f60aafbfbd2accc | ORPH
    arm      |        pipewire-0.3.81         | NOK | https://autobuild.buildroot.org/results/8942de654d4dfcb2b8f924a1e1c281413f30b2c3 |     
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/54b51c1c317bef44203675f7a4b3307c04593703 | ORPH
   sparc     |         rrdtool-1.8.0          | NOK | https://autobuild.buildroot.org/results/f7994e6ef72cd168827cd4fb7c1ea807eef103ff |     
   mips64    |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/a24d8a2a676fd0015353500f1d0de1ff3bc34ea9 |     
    i686     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/72cdbd1786eb7e46401795b599b066e189c93368 | ORPH
   mipsel    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/04d11933b40d347262030a994dad7152b7d4e91e |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b929f41f6017dc5b617476eaa58f010b8dd70373 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/959d3716302c7c80b2fc2e911bb7f16ff8e72e16 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

               procps-ng-4.0.4 | 2 
         gobject-introspection | 1 
          python-grpcio-1.60.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/ed1825c199a2f4d59bde6e2231d5fe2f39294e7b |     
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8ff7b55e7800c0618495950096df1a4ff15f679f | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/660cc1ebfd0ed76d63df3672790d2b8f91f8839d | ORPH
 aarch64_be  |      python-grpcio-1.60.0      | NOK | https://autobuild.buildroot.org/results/05acb7f41bea6695c6752f3ab5e0dc0948a29bdd |     


Gitlab CI results for 2024-10-28
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992244  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992746  | ORPH 
               TestApache | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992389  | ORPH 
                  TestBcc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992397  | ORPH 
               TestBrotli | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992401  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992310  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992311  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992759  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992760  | ORPH 
...ch64beMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992765  | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992766  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992778  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992779  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992784  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992785  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992790  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992792  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992797  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992798  | ORPH 
...k68xxxMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992805  | ORPH 
...linM68k68xxxMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992806  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992813  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992814  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992819  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992820  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992825  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992826  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992831  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992832  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992837  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992838  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992843  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992844  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992849  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992850  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992855  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992856  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992861  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992862  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992869  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992870  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992875  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992876  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992883  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992884  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992887  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992888  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992891  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992892  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992895  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992896  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992901  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992902  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992907  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992908  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992914  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992915  | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992920  | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992921  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992925  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992926  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992931  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992932  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992939  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992940  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992945  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992946  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992952  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992953  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992958  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992959  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992969  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992971  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992981  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992982  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992988  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992990  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992748  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992751  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992267  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992269  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992328  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992335  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992337  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992338  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992340  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992341  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992571  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992597  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992600  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992400  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992642  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992675  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687  | ORPH 
          TestPythonPyQt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992664  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992271  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992274  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992700  | ORPH 
 TestSquashfsMinBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992346  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992276  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992278  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992257  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992259  | ORPH 
                 TestZbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992735  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992740  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
