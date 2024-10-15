Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B45D1627F
	for <buildroot@archiver.kernel.org>; Tue, 15 Oct 2024 03:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4886140185;
	Tue, 15 Oct 2024 03:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fDOsr7Vj-Yt; Tue, 15 Oct 2024 03:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8AC400EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8AC400EA;
	Tue, 15 Oct 2024 03:18:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6C8E1BF41F
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 03:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7086340076
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 03:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jX8Of-M5c4Wo for <buildroot@lists.busybox.net>;
 Tue, 15 Oct 2024 03:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EAD97403BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAD97403BE
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAD97403BE
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 03:18:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so9298347a12.0
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 20:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728962308; x=1729567108;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IfBhIPYodcnb26wTeuSjxBE2vXtunQMnM8OIPCVBfC4=;
 b=mmhJsmjHpAbc/RARruV9M8+AnuupCf/gV/kSkHWUauR118Pn4k/CvS0w3adS7X11Nq
 eI89GQFCHmwE0df3qjNr8zCUBtD5gqjnUUUEFHsX9NzWG5QsNMwFXrkIwnrw5NMeIUJy
 mRAP1WGPRTVBuFJmxmTxFGzjCCI9t0yAdAzDbRErz8DRufick2c6zFHC0wbYvzjhGRuY
 CalsvQTVPsm+dvMV62aH7btKRYhlQkuv8ieiY+2gdryu2/K3i7KX6TpYP3ISL0QFEzeh
 bvRB7O1CjNbAVKnPqdkp41oJjf5lJzRsq5y5aXQ66aeLGd7hFywcP12052OBHQdiLyBd
 iTlQ==
X-Gm-Message-State: AOJu0Yy40Abyuj9a8IRfkgpXcGvvnhNBLienH4ktEteUyibf5wiJLwxY
 gGNszOLAQzE/ujslekYOSnJbq2qhigKqg5FJpWgv+n++lVUaPWe6lGXvMw==
X-Google-Smtp-Source: AGHT+IG8+XvWgXAZJy37WasBJTHIx7gU0MKrHC6eJgv74ZWgzJMt+aqXQp8NDJXOZpl7o6HYHc0ncA==
X-Received: by 2002:a05:6402:50d0:b0:5c8:a2b8:cab3 with SMTP id
 4fb4d7f45d1cf-5c947417730mr11377680a12.4.1728962307686; 
 Mon, 14 Oct 2024 20:18:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d7b72cesm198302a12.83.2024.10.14.20.18.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 20:18:27 -0700 (PDT)
Message-ID: <670ddf03.a70a0220.31db7a.0ca3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 15 Oct 2024 03:18:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728962308; x=1729567108; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IfBhIPYodcnb26wTeuSjxBE2vXtunQMnM8OIPCVBfC4=;
 b=Djd8JREvKqDrTvyAQedSZ4Q4uzKzsd0PlEywD5xkEHaAdJvqig6cPytDXWaByLJ/WB
 UB4xvcRlD7JyEiSzLn4uCKQux8qLpCRxb54nElLDcdZo3WKwVlOq7hZLN5OrlDgOghJA
 ar4S12XT+QqfmdftCIzfvR0O90griVZSEz0QyNkA52dke9BPW0We60nJ53pQTk67nwtt
 OhtxNDviDUOLpkYfANTOytkFSeUexc4wCALaJW0XMIurkgceD8lNtFZxwQgW+v6zGaEj
 YOocvhnfQ8gR9+S8Rz3azeSHHOaBwWKOBerZhGTmrTqmdtVm6o14UUvMG+SFP/TIzXi8
 nd9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Djd8JREv
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-14
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

Autobuild statistics for 2024-10-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  2  |  0  |  7  |
  2024.05.x  | 21  | 30  |  1  | 52  |
  2024.08.x  |  4  |  4  |  0  |  8  |
    master   | 18  | 272 |  5  | 295 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-8.10.1 | 35
                 linux-6.10.10 | 18
               procps-ng-4.0.4 | 17
              host-rust-1.80.1 | 14
                  bind-9.18.28 | 11
                 apache-2.4.62 | 9 
     linux-5.10.162-cip24-rt10 | 7 
                    git-2.47.0 | 6 
         host-libxcrypt-4.4.36 | 6 
                  curlpp-0.8.1 | 5 
                  ffmpeg-6.1.2 | 5 
            gdk-pixbuf-2.42.12 | 5 
         gobject-introspection | 5 
  gobject-introspection-1.76.1 | 5 
                  libsepol-3.6 | 4 
                 libv4l-1.28.1 | 4 
               linux-pam-1.6.1 | 4 
                  ntp-4.2.8p18 | 4 
           at-spi2-core-2.50.0 | 3 
             berkeleydb-5.3.28 | 3 
                   bird-2.15.1 | 3 
                   foot-1.16.2 | 3 
                 gnuplot-6.0.1 | 3 
               graphene-1.10.8 | 3 
            host-binutils-2.42 | 3 
          linux-5.10.162-cip24 | 3 
               valgrind-3.23.0 | 3 
                acpitool-0.5.1 | 2 
                  assimp-5.3.1 | 2 
                  bcusdk-0.0.5 | 2 
                    brltty-6.6 | 2 
              fftw-quad-3.3.10 | 2 
            gettext-gnu-0.22.4 | 2 
           host-librsvg-2.50.9 | 2 
                latencytop-0.5 | 2 
                libesmtp-1.1.0 | 2 
            linux-fusion-9.0.3 | 2 
                memtest86-6.20 | 2 
                 openssh-9.8p1 | 2 
                 pixman-0.42.2 | 2 
               pulseaudio-17.0 | 2 
           python-numpy-1.25.0 | 2 
                python3-3.12.6 | 2 
           uboot-tools-2021.07 | 2 
                       unknown | 2 
             util-linux-2.39.3 | 2 
                     ace-7.1.1 | 1 
                apparmor-3.1.7 | 1 
               asterisk-20.9.3 | 1 
                  boost-1.83.0 | 1 
          cloudflared-2024.6.1 | 1 
                 coreutils-9.5 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
                     file-5.45 | 1 
       freeradius-server-3.2.6 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
      gst1-plugins-base-1.22.9 | 1 
 host-binutils-bare-metal-2.42 | 1 
           host-doxygen-1.8.18 | 1 
          host-gcc-final-8.4.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
   host-mender-artifact-3.11.2 | 1 
       host-nodejs-src-20.15.1 | 1 
    host-python-greenlet-3.1.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
               iproute2-6.10.0 | 1 
                      iwd-2.20 | 1 
                  jack2-1.9.22 | 1 
               libglib2-2.76.1 | 1 
                liblinear-2.45 | 1 
        liblog4c-localtime-1.0 | 1 
              libopenssl-3.3.2 | 1 
                  libva-2.22.0 | 1 
                 libvpl-2.13.0 | 1 
             lirc-tools-0.10.2 | 1 
                  lvm2-2.03.27 | 1 
       matchbox-keyboard-0.1.1 | 1 
                 mesa3d-24.0.9 | 1 
          obsidian-cursors-1.0 | 1 
               pcsc-lite-2.1.0 | 1 
               postgresql-16.4 | 1 
                   psmisc-23.5 | 1 
      python-autocommand-2.2.2 | 1 
                  quagga-1.2.4 | 1 
                  ramsmp-3.5.0 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                   swipl-9.2.7 | 1 
           v4l2loopback-0.12.7 | 1 
            vorbis-tools-1.4.2 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/3bd11e3c6bb57ed25ff83f155d41331ccae4605f | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/ac90c01e382598e96cd9b7048f2f04f1b61daf23 |     
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/de42dcbe1aaa4c65668533e67b721c27b383279a |     
    i686     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/eb6d887f662b7f8220788c0da4abbd55bcfa2833 |     
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/bf15212f02c7d51c708d97164830c64d8ed80a0a |     
   x86_64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/da56681c3437687d1b5d24d02c873a1dcc431a50 |     
   armeb     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/3a70ee6d069737df0d987d8d0c68d66bb29c4f70 |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/bad171993fbf83f0f211b1d66d0ff314448fac5a |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/bb52ff18c90f4e8abc6277402bd7adeee6b1fed0 |     
    sh4      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/6e75cbf745cf97ab0634735eebaadd1dd2fba414 |     
   sh4aeb    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/fd5bb7f6ca06e71acfc33ca0b7e7659389699ee0 |     
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/6b2fd90fe7adf5a636821f32da72a73f4edf4d9c |     
   arceb     |         apparmor-3.1.7         | NOK | https://autobuild.buildroot.org/results/1857af222693ec0b3cf97fde62efcb1d426f2049 |     
   arceb     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/4be498affa94edd939cbdaf54e287f1462503086 | ORPH
microblazeel |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/f1159b9cbb524b83ab1065486d1f71dc4b370317 | ORPH
   sh4eb     |        asterisk-20.9.3         | NOK | https://autobuild.buildroot.org/results/7d3dfbedca1ed097e18285fa14f4c0e89e65fec2 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/6c96862f290d2f86d9720365e9c7251cccc5c272 |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/39ec7258993065c2625709c2b4728799e6ff63e5 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ea3d79b0aba41282eb10e8fa46bc5e526f9ceb0d |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1c0c81e1ddadac435aaf99fb9fe163729d5b344d |     
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/60531da763c63109a396eee0c149ba262cdbbf98 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/5b2a2208f463690a63b64dd46aee5a60338f4dcd | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d94893de8ca63d1aa6df5b12c394fa8cfe192532 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/90d57da0bd70306ca00601eb2f75eb25546de4ef | ORPH
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/8733173f6903e76abd497b0dbdda20b422954ac2 | ORPH
  sparc64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/077739b852c7239f2c6b1f56d8fb6d45d304841a | ORPH
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/ba2b8aebd707431fc7a301912dec47bbf5a343e8 | ORPH
    mips     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/12dd8c1791d9730d9a7ba5386dc4e515e0ae0abf | ORPH
   sh4eb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/1ec39a2fbe49a4c6f3af54c65b4d0a33ac17ca2d | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/f98bec051a417b3d0044734c1c8d2c95ce453e4f | ORPH
    mips     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/02807300d9363c6c2f6efa88af9a091cf661e0c2 | ORPH
    mips     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/f3ecb2921f4c4bcd2ae0be499c0ad0b7b580a119 | ORPH
   mips64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/5ecfabf29044bcfe8179595c88e38ae553021b57 | ORPH
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/95e0551ab177c820452998125613f276430d12bd | ORPH
   armeb     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/1c5ef3d68771cf97f61792292fa7e4e28fb92ff5 | ORPH
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4236ad8e5d211f43757a857d2c678cc116679896 |     
   mipsel    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/73daa693d01b78f8c406189e9c03465c7a0ee1a3 |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/f026d3ebf54bb50a37920ef1870bf81bdab7ce88 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/c0f0cab90877a3c85bc8f43c2a4946def24a8797 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/47c1fc72050cb6c00e2b845902322b82cd1d2b73 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/e1cc335b44f9fffe42eaf1dc943a7557c6efa3a7 |     
  riscv64    |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/a3da7b211c77031fca63b6fae486e045da2f8116 |     
   x86_64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/34f4e23e325a03ab37fd5a0a564780b9e0d631cd | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/12a20f31511bd197d85402a57258f8fc6b4eb50f | ORPH
microblazeel |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/c93d350e8c3640ef3ee326135019205a3e162f98 |     
    sh4a     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/063d6939b153693016e09010223b61a66447160f |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/7d6772e0913679534eeba53d9ad3fb6eb7a5e6f4 |     
   arceb     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/a696ab25e8465b628a1873a6362aeec3974fad91 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/0f13f64ce738d8f66322c791c1cf993bfe29e12f |     
   xtensa    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ffa5dd8f70098fef732faa46f414d060444c780a |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b37ae74f4b7b808f509f7530652614bdac2a6fd8 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/9b645d43a090df0a059db12328aa8b01dd553478 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e7b643a7af371d63ff602b2d7a8db314cf3aed2c |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0ee1728a4517626e2248bdb791ee3fc358c1b3b9 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/38c0a7fffeaf675c3b5a4569ac3eb30b4c494040 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/024d7aa69836646097e53e26d073f92ec2f8c846 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/eb2431030fa3118af501621742dade6f9527d4a0 | ORPH
    arm      |           file-5.45            | NOK | https://autobuild.buildroot.org/results/ee0d89265ea6b0750653e6be2ae053e2510fd9a5 | ORPH
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/136d3c62810a391c56003f02fcc739e43a1298b4 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/0a102268b220f27c509ca802a0a6f352fc1dbb69 |     
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/7aa4d98516c105b1a95ff0f2756075600b35e4fc |     
   nios2     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/87a4a05e7f9a86662c028e45ca12c36fdd8a25c0 |     
 microblaze  | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/4bb7588ffbfb847b0f5534f59e688f15b8757711 |     
    i686     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/4df9c4d68ca52c1165f29239d068e40dca34222f |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/caa07f1344da27798557ed51ef4ac51b2bc05049 | ORPH
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/68386f7db67a1196d158c8a837ecddf6571f7cf6 | ORPH
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fb19ffc38511db502472b73bc3fc6cef5d7ba7db | ORPH
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f47f9ca777fef3c59093c825c307e41c7e9a36df | ORPH
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9ca299bec0b8384f0eca486f0046c95b47c85dc6 | ORPH
microblazeel |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9b31891968411844bcacac19846f86b7fcf2fb1a | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ca076e1342ffa191f2da3adfc06c5767179dca5b | ORPH
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/a4f8d235c292c8615798bd71d522184a8745468a |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/ecd57c48a48e6b5d8d0e7e70f56dbde7d82c5214 |     
    sh4      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/da96a50046e8f2f0e24579cd687f3a322ce9a030 |     
 aarch64_be  |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/a48c782de08d1a162864ecfe3db03d1654e127b3 |     
  mips64el   |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/7931e126bb2e75503ea84774502e90eb06585a25 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/9a3031a7850f8f703944d3f6e6aa9d303a663b5c |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/17e725b95b790c9d709da64a0d21e0782796d00f |     
   mipsel    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/06418354ddc689c0a067240e40097ed44edc3b43 |     
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/3ff03457699571dfd69783b00034bc56df1e9cb1 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/a992ae2572f625eff126064fc1178a5a392e7536 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/764f4788395f4652ae33d7bdbd45af4eeafba22d |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/cb9bc9d7f1b79bb9d1c90a07bfcfca396be025c5 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/81467551fffae3c3fa68608f84577e6be2c6b766 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/ba8c44d704a79092d12d7282aa586c79cb37ab65 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e77f44590f5e7aee79c1e36c5ecde6226e557eb4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d718d942d1f240a6dccf5ec7614b8f4106802ced | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e9c09a01e3b0b91eb1458b5519dcc7db572794fc | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/77ce2da2ec15d5f480afbf02f8ffac2e37e41956 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c250871791768763c3bda929147cc4d4f11a4d35 | ORPH
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/fab996408df695d291eee926d82c146674d20b3c |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/749ae3d57a1353485d059650d378ca6f19cccc4d |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/5cda96383a731ec3fe391396d99b7db05ce98682 |     
   sparc     |    gst1-plugins-base-1.22.9    | NOK | https://autobuild.buildroot.org/results/22a08cbf72d93b87ffab6af0c6535a3c3b13957a | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a1da2fe3ae715d8e4d9d52a36899e1745ce8e66a |     
  riscv64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4c069dc41f1c661488b484c5ab6cc69e096a8c44 |     
   nios2     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c4fcbaaeb3c39ad22ebb17571598a11c02d8d215 |     
   xtensa    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/366b99d86d60fefb0888217ec6d50836ea790a37 |     
    mips     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/5106076865b874bcce03ff93aacd72ea500bcc82 | ORPH
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/87b924a34fc01dae04b88dc7e85491f1df5558e0 |     
   sh4eb     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/bf975358c64dd93ba044c4e34424753a6e06390b | ORPH
 powerpc64   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/d5f4f0927b5cbd571a66dc8a92662bb640509e04 |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/a6148fbd3c8c12b832234fda3307b5c15631871e |     
    mips     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/9264a2eae754dec9c1fa2b5e2e6e0916ebaaf757 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/8c26bd0cc692dc22627aee52a1f52aba5904bcd3 |     
 microblaze  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/aedf0f61918bf204abcf2ee694b491505817b6d3 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/3be1ad57f0d87b346960dcb84a2db9e6d543dab8 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/1c0cc359890d4cee6921bbe7da711fb0567f0c15 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/f4db51be9e334b4018a916a936752b74c6b0c546 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/57e0cca9aad89004d4c851caeb34b19f33197c3a |     
   xtensa    |    host-nodejs-src-20.15.1     | NOK | https://autobuild.buildroot.org/results/8d2d448fb91c5edcb7841753822857d7e1b55e8c |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/913165a8294b84905f50f9a8f3e5fe395a54e1f7 |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/94a120fc48b852802b7f7ed7e3dbda3ab17732a4 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/0a6c3c7e4019b41f340caf0b72dfee464dce4221 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/832e0200c301bba237137d31e02f19044846038b |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/ed85bd8ea367a3a555cb4b128d1d6c224b24a93f |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/0dea8e9e98eb6fc0badb0f5a0ebd3e0930e324e8 |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b917ef8d728186c27322eb3782ac25d6827767b2 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/112a358f59f55b29570335539efdafb7a51af64f |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/ad6b7bba8756fb517c06b5d39f9e6c5fd8976c77 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/8373a357e7ebecc74a98c20cc78e3039e1eb3252 |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/37b12d4f353c0d3cf0f7f86c9b3ee6f6908debb1 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/9514ae3e776298fc2d77e395d262c2db0183c413 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/dfbb9c572604c6f1122b2a2fc0bf8a9f41e7c832 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/68757e91726621844a90a66eca77a7229b830d71 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/f5428bbfdc020eb2cdee0a85a503b1c7510e0ef1 |     
  aarch64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/943ce292174f28d7e29a727686195d1514142bec |     
   sparc     |        iproute2-6.10.0         | NOK | https://autobuild.buildroot.org/results/75619c01468da93c7c9aa1ac558aea5e9768386c |     
   nios2     |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/5893e1e4e95eb9af80bb79a9c382c249bcd069bf | ORPH
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/17114a8e3f44e8c1ba1325b328ae3dba32fbd989 |     
    m68k     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/0d2a9f4e3e0df1c5bce584daf327ee4c875218ad | ORPH
 aarch64_be  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/fcf190de00222fc28b097332f7cd468ecdd5498d | ORPH
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8ebdae225615611071938ed052aa418e5ca9c5c3 |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d2fed395da95b24ed12fa3da76b0e699b2fcc70e |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f3184d70dd3992f094f0a9500be7b3ca4945786a |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/191fb75d980eac8694f544d9a79325edb3dcc248 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/bfd48ec41d427a612480ca8b193dfdcc91d573f3 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1fafc57c1b3a1fec171c3d1d09a1760028af0f68 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8be953c98f09b44a08a853076eacb7f2857acc6b |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1e682655d4f88e6cca216058a6155522db1e8580 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/450311999cda6896b92f65596b6122f4597dfa6d |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/754733920df5d98259a5b641a5ac188e415c81f6 |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/523a5090e1d52838aa5875bfe9af8753632bb166 |     
   nios2     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c0b06fec8246266e7aaa0d4c0920f26424b4894e |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/d7b848377affab7066f9a6ef4e212a0426c56941 |     
microblazeel |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7a1b0c34d83c52300d4bb31ff70d2e48fcc0b31a |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ebb57f97c7e1c833229534c8b7881d58df0a8a29 |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0aaaab1064ccfaaec8793bf7d1e39fc9f176d68a |     
    sh4a     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b56c362928fb8415fc7dc3e641fd4e7e930a1288 |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b7f79b1dbd3c83a2afec216922117e0d3af66eed |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f34302eb22eb9a24ce37000b88fb00722c765a60 |     
   x86_64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ea15a1dd3155f83a7f199a936815f1b0498c5e50 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/18a3e85b93f6eef444cd229fa027cc44108aa15e |     
   arceb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e234987b2b5a2d09c620144cafc6853569e25351 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a0421faab64df31c81f9d1140728a427314b3c76 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/aa049e0977f98f7d5f1f1da8d43ca16be6064903 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/beb5616a2195389eaf4a167c86ca39a8104e66fd |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/5066a4d06cd407b53b41551a8a54eb26c4e7d19e |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a5761abbefdce5d6293cac7b5e0972dfb61f94ff |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0ea8650b85fe231b2713dddd44a54af85d374c24 |     
    mips     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/33912d39143c8e08387718f91f87f12cb46bde63 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/18483c0bb1a66267d5a136ec61b836b215316584 |     
   xtensa    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/39e490315ec22c68bfb2a2540a6bc15ba8467962 |     
    m68k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/bbc8a5de1c1751ab94f815ccbdb6ce6002ae1189 |     
  powerpc    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/032676d425bc9da53d9616a54ebacd488482ab26 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/0cb827dd0fc4925974d375ece9c52e8a4d1d6762 |     
   sh4eb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/aaf7429783a7092a01cb7f68c99b7f81eda30610 |     
   s390x     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/6b7ca4d4cd4d06bdd697e5d50881bd9c6d93c03a | ORPH
   sparc     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/be7143e882ec7be40ea76f9e9525b81662c54b10 | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/d32d7d5ba2e66415e0a574cd007e771268ed2eda |     
   armeb     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/acca34bfd957e9bda2f149ee8978f56fd68d58e2 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/af6b227e544c5ebd032bd7d4053794cb632e61ac |     
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/93c3968d3faf41154cafeb4c6be7be5b2c38b6c0 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/405e88b36b6a19527c580918550bcdfbea3bd8e9 |     
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/5241be04b9709d1f8a553f67ca972f51ad17043b |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/9bb129b7ad620043d5f9e1ceefbb1d12a7abf806 |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/450fce091c4195cc07b51f972dac72af55375ec4 |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b07e38c0252bd9f552b8732af7fbf82c246d3330 |     
   sh4aeb    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/d4e77bb70120b960787507e75385be3f1519d8e2 |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/bba3d4b4fecc81a6149f401ee093afe14a278321 |     
   s390x     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/d602321fa1a7a9967041b958d9ad8a334ccafc9f |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/bd1d97dbee07950dc0347afb17d29630ada0b6a1 |     
  mips64el   |         libvpl-2.13.0          | NOK | https://autobuild.buildroot.org/results/2df536fab43bc5d776209272e9e7672e65e6a074 |     
  powerpc    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6314b07022e25c19bc5fabf71619ca23683b9f7f | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4bb458ac17f74d4667f93a2928e75d56c329de8f | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ce0cce198e4bfb30ba5f68eca221ed260a8fc2e9 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/383d6aa06c46d2be62b7fd635b19b5c51bdb7e51 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3b96e866c432719dcfbe49da39001f9c4926f050 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/57a65d59d3c361a9b8053125d00f6890f04852d7 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b9432e33e8357bbfa2fc4e1d0035fda0af48f50b | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/28dc6b39cb2665f6f942a9c99bd3f7b083b93d0d | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d302e136c4997a9a096aac5eed6e1587e0c32319 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/21d687cc8f36679f582c9699c5b801243323e40c | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/3ba307f30aed24cb278ad61c6b2e500f12d3a536 | ORPH
   sparc     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/9d490ed19f412d9da3791bdc91786a53073f4324 | ORPH
   nios2     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/56663e26c361fc7b432b84c398539c5f47aecf01 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/f8d4620e4c378fcacdbfbd8f00da88601182381f | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/b6b4cc63388271267d8b3ae75a01f54dba2a0b26 | ORPH
   nios2     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/5862d30fe00369ae075583e747979bc22b4e3fef | ORPH
   x86_64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/a6c8c28e8ef551e0535f423f70136a7fd90149d2 | ORPH
    arm      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/3720f53d633281d78797ef3f80f478964281cec7 | ORPH
   armeb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/a49341dfac574c5cbb12c063818abde00f6f8749 | ORPH
    m68k     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/a7c538c7e9c5727a6c6d67f5c02e013921f6168b | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/166a6ae049d69408d9b8222cc72b2c686039ef62 | ORPH
  riscv64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/85a2e37ff97b92feb6bd866e00570f550a7b245c | ORPH
    mips     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/f585ba9eef0f2f2793c0d636b290327eb5449120 | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/fc0d7f8294ea54d44ab3687c7cb229fa08b61175 | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/42590a98d73e58d5072f9928e23d5d849add71a5 | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/e1999ea3703b97375826a0a097e075ebe94a347e | ORPH
   armeb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/3cf47d5d868b062c5e2ceeab4a4832292b821f49 | ORPH
   xtensa    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/a89d8386f0d9ecdde518f32abbfc70d88c292a0b | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/8f11670e08b431f7f7ab59a9c047a84570f6a68a | ORPH
   s390x     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/8b1b75e8083c1b12148f9bf086354f00cbec00f3 | ORPH
    m68k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/fb8a7aec176e2d02e4ab84e7d2ce2396a9ef48e2 | ORPH
  riscv64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d65725852e5266e056bcdd6a037d9e5c1ed27aa8 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/96578305b9bb678220153ef002304d66df2aeeb6 | ORPH
  aarch64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/09b34aba6b24fb21828883f2dbbe86cf57176180 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/b36140dc2a3d26a817e71992b1499efa5c742042 | ORPH
microblazeel |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/70ee2a532c322ba5eedc9a98e042d2b4b934c435 | ORPH
   sparc     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/26025b1f88d128e7c96fea08dff6da1424e18eae |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/6912513838a23fb391bd0d542830323050b0c449 |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/527d3565fe45c8c8353cd56b6d0031c217df4076 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/0dde9b95c79f6928b9bf287e4116bcc716d9ae69 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/56e241775db54210085d97dbdb5523feb493e127 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/207ea018be9da856318c78c48b8abb1ec5dbc483 |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d658b247b78afdc431083390ff7daff34683f622 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2e6556ff8a3cc9e3c3ed76aad0713d1587743cfc |     
  riscv64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/8acb8dc2619c977882f4e9a4ecb0ab847889b091 | ORPH
   mips64    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/cd659f0eedd193035d674d54ca980ad4ff33a4ad | ORPH
 powerpc64   |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/624eb6a897dc184bb842f514dd5ea897b624d58d | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/881663a731e2a521f769f50ab9c50e9f86f830f3 | ORPH
   s390x     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/853f0e015a69e76fee89155473986b451c5f8ba1 | ORPH
    m68k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/b57f3908e84966c60ccacb8805ed887c808e86b8 | ORPH
 aarch64_be  |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/a2918ed4aa5751faa117b497a9a9143c42fdecaa |     
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/984f35261217c1bc181d7cb6dc53cce9884ec1ca | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c5a840b8253b0fcd4716856e2d88c371e6093997 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d08c005d4b3b6084f52a3e67a76ecb42a9447600 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b50860e44bd3100a426c4903092cd4dedbf9bcd5 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a29b50d05f9b83dfaf0845332895a516d41e1560 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/896b820d125d0f57ce960f7338fd6ebc23235d7e | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/13c214f1801c7ab346049b0daea3b46901f6c80f | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/642869a74015c995c0acb44b8f41b27e32a03322 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/75dcb2d2d2a9c0bbcf8a033cfeefc720c13993e3 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/399c0d69df91182f84ed12dedf918ca447ee7f9e | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/634b2ca7dd13b7b66595099f5cc33a3dbd88ef88 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b543198ad95314a449e5520a28f2f9ab7494b639 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ba2177e2a7361d37c9d3de3def83501af45c9332 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/89b2ec4e6fac91960c73e0f7604089184cefbb5b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e5ef9a804a6ad12100f7cdcc78f51132b1efd481 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/99690905fc1c183d932e55ec25943e9c0ea425b0 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c95ddcf892d7825821d73c491a04cbf0b07e4fc9 | ORPH
  aarch64    |          psmisc-23.5           | NOK | https://autobuild.buildroot.org/results/c1d48b5660a6255d503faaf3b952b19a042ea432 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c1bdd3ece61d856e6426d38b5d9534a692c291fa | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0202b426e0d79d7a1e921ac05cb73d245fd8b86a | ORPH
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/b5cf36ec5d3481abc695a5904aab69677ee70348 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/b5567e8355ef43a31fbba7d92181c9f0a63e8fff |     
    arc      |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/179167678095590816c8b5c7330e3d5f018de554 |     
   arceb     |         python3-3.12.6         | NOK | https://autobuild.buildroot.org/results/0a77d6cac04bed680fc6725a8edd77dc5fb601d7 |     
   arceb     |         python3-3.12.6         | NOK | https://autobuild.buildroot.org/results/c4c2b321862259eea622afd59e0af9fafb8728e2 |     
   s390x     |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/4d2ded6c12d5c3b112492e0dc2c1a1e64638f051 | ORPH
   arceb     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/357fd58ec676bcfa2e8e9a90e82d6677a74b3ac1 |     
 powerpc64   | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/08f47d4f45156ab5c67785d25b28ff22b5bef2f6 |     
   nios2     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/0bc7581de7a539bf9bce3e81f12e59b3aa9c6cb1 | ORPH
    mips     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/4d8b174a5fa597824c53dbc1198295da4479dc07 |     
 powerpc64   |          swipl-9.2.7           | NOK | https://autobuild.buildroot.org/results/ced154b16a21c525e8e1e4450b8b437877a0536a |     
  riscv64    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/596101a8a760b02fc537418cc36662fb350fe84c | ORPH
  riscv64    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/2a5d66869c568ad8f5ab09375c3ff71ac366b911 | ORPH
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/4c6c63bfe0177f07f3de20712aa024113ae7a07c |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b2b8b79dd56a37242523a22a4746f9529712934a |     
  riscv64    |       util-linux-2.39.3        | NOK | https://autobuild.buildroot.org/results/1bfb0b7acfdc95ca25f86479a01aee5b04f9f3d1 | ORPH
   arceb     |       util-linux-2.39.3        | NOK | https://autobuild.buildroot.org/results/202955932ff10a2bfccb9f0b7d77f45957eb98a7 | ORPH
  riscv64    |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/c4dd419206a6df7c43683ad8c4e8d88c13ff5f7f |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/980d034b78cf52be41ce837b673084455b7071ea | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/84515a6207e4908c5e6a33223c4415c5a68d8767 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/86e42e6f2a3e28016a43ec7c263ebbc9addf8aaf | ORPH
    arc      |       vorbis-tools-1.4.2       | NOK | https://autobuild.buildroot.org/results/729810156c9e8cb217171790d40e44455a0b2f9c | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/5a5017e848b3f4f7316c36da2eedf05f78444099 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                host-go-1.22.7 | 1 
host-vboot-utils-bbdd62f9b0... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/4c9086f3fcdeac06010db3bae6593a52e06b445d |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/cbb954d4b427163608e13906cbc12d47483aa25b |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  libffi-3.4.6 | 2 
                  linux-6.8.12 | 2 
                       unknown | 2 
                 apache-2.4.62 | 1 
                    bat-0.24.0 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
                     frr-8.5.4 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                 gnuplot-6.0.0 | 1 
         gobject-introspection | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage2-1.... | 1 
host-go-bootstrap-stage3-1.... | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.74.1 | 1 
          libcamera-apps-1.2.1 | 1 
           libmicrohttpd-1.0.1 | 1 
                   libnl-3.9.0 | 1 
                libressl-3.8.4 | 1 
                  libsepol-3.6 | 1 
                 openssh-9.7p1 | 1 
         python-remi-2022.7.27 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/08e91cb61e682d714a8c57367995b9e8f40b4279 |     
    i686     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/18ba4fd2844f2421ce5febe8f9859ade3108e40d |     
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3f1bd97931d3e902f80aa817c6fe08c6fc15d2d4 | ORPH
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/2240f1a4c46f4888dd7c272dd7507a79609c4ad0 |     
   x86_64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/5759d631785589c0deae2336683cdfc0c0f6b4da | ORPH
  riscv32    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/dac88d3d220568b839fd3735bec40bbc0178246b | ORPH
    arc      |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/acf912c0a450aa15b9dd25f6c51fe9832b29e1fd | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/a9c971d1fbfd553f1287ecd4afff6dec133ded25 |     
   xtensa    |           frr-8.5.4            | NOK | https://autobuild.buildroot.org/results/7462a26bd943ec60591a958ec9bee7bb508cf7e4 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/fc423a33f7b7b63987134815e21e13ab7aef4619 |     
 microblaze  |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/2f3e126ab480d5a36fceb17c5a8bf92c77e724ea |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/383b1106e65822cf5f2c3ea3c34ff2427ce0214b |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/4f6fda76825504d0a3ec0c4d8b1e75e734559c53 |     
   sparc     | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/3db45354bc46af9940462c4a67ce30dbda99096a |     
   x86_64    | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/beb54834dad1b597f99954a448b69fa152795971 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/b00657cb2e9b98a07d4be3a134486acc8171cee8 |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/56d0d034568ee4235029b990012b947c0bb3fe86 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/e491d5ea35fa5bac0dacec262484b49077d8efa1 |     
    arc      |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/4fa5b16e0311659835d611ba76530645954140bb |     
    or1k     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/91d0bd68f85be72f2a166d72d3247be9edf35c26 |     
   xtensa    |      libmicrohttpd-1.0.1       | NOK | https://autobuild.buildroot.org/results/10e6c39e878bb29157c8c78cedb3f64da7f17c53 |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/996037410d1850e1c7b5f8e1b4aeb052b6ef1ec6 | ORPH
   mips64    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/bea4341f82e305758a5c179b41ad2c92e2844d50 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/f43c886d5d913d7b472d3e700057a296eee995ef |     
   x86_64    |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/340b9d708a6294a52da5dc70dc8340b21122da51 | ORPH
    arc      |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/1c94cf9ff659fc83c8367a4e212b4fd821860c49 | ORPH
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/df2a5166b0938bbc0df035955d866967cd532e3a | ORPH
   xtensa    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/5ebeb9628f791c1d08d343251143a1be5029d80f |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/a54888257609ab97819df2fc00b5bd2793aec57b |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/45321336f4ca35cf0ed358bdb3253299f6840636 |     
  aarch64    |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/a611ccc252166a084841111d066c853c8cb082f8 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                libcurl-8.10.1 | 2 
                  ffmpeg-6.1.2 | 1 
             libgphoto2-2.5.27 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/db4982faf4299b1274b72fa001f4a85abc6f931c |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/2eab34842e704c4562ae85fcb23b2cd961d5cbe3 |     
   sparc     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f29aac6217169c8f2c983e8af458a8dfa032103c |     
   nios2     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/8e14038824ac6e8dbbb40c7c92f155090b215cb1 | ORPH


Gitlab CI results for 2024-10-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497765  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498007  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498632  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498633  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497780  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497781  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498061  | ORPH 
                TestGoBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498062  | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497893  | ORPH 
...yfsVarBackingMountUnit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497895  | ORPH 
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498198  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498220  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498234  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498237  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498259  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498336  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498315  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498319  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498352  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498373  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497782  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497783  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498392  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497784  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073497785  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8073498428  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
