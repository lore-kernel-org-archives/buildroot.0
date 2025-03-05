Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16F5C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 04:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18756606E0;
	Wed,  5 Mar 2025 04:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0anYAig0CQVt; Wed,  5 Mar 2025 04:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 783CB608C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783CB608C3;
	Wed,  5 Mar 2025 04:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B624E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 04:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD47540224
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 04:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWphWlQ527by for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 04:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73BE1400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73BE1400C6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73BE1400C6
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 04:15:10 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abf4b376f2fso665432466b.3
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 20:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741148108; x=1741752908;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aqqGKJ91lsJ+fZq0xnyNFlW9K0AJjvQnbsachf6JkNw=;
 b=v0j4nsoKTKZDHwMYR9UEty7saq4IGcgSTYeZpIeVZSwmm7ifb6oRNozDs8byokJkUZ
 3zF6TRfV6xBP48EnHTWREaNrBmzgrWhXMLIB0byygAsx3gdGM0BxLp5W7w5YdplAtgwj
 ZACGgCKPKD8P3m/+gobnpDZmaXyCbO4U5uI6UtvwjmGQVQSPBH9mDSxESx0CbDX8fvik
 uoktSXGJh1iKfk9xN27t/nZkqGt/BWVU0ypEgTHKA/2OGvN01t5wf1e1NUeMHOhW7Q2R
 1S6ZcFgTJaN59km1d097eW3iYWBXFuLs9Q5QnhOr3kjXHeWmMNakil3RLPoft/BlYPqR
 qiwg==
X-Gm-Message-State: AOJu0Yx8hsX9Gfim6MfKbl42/Zzn0gth2kUTH8SGUidc5VwES8dugNAF
 mMJm7o7QuxxVXvpAU9rWsbQ5Xdbzr4W5QnTZ9HjKF9IuQsBG9ZI4549htA==
X-Gm-Gg: ASbGncuS0L7uPBb1CCibMyXSUehCfJLDdZhkLc34tIr6hxVXPh/XOIxiHVeCFQ4eYE9
 86SlxrQIN+LfXj5ixbrM5dljRTvfQaoprdHd5C0jbj2cWpVGbI7+92Wq79j5ps9imke1GQCRBEv
 jtLqDBLc/V7z1lqfW7Pf8cDoFp2rnUhaSzO/RXxWjM0Hxx1kGqQFGF6r2uW3erqfH5CVB3NsnRa
 PByjbuaaGNTpqM+U4/Ek9m2GzIb5DnwTyspk//KOvQE2hLXCQ8nJ/tmpMEXdZPYmGWRqM6Xa5X6
 0dGlSJfgi+DWvMdoWoMxA+RjCljFeTshu+Uldq3OndY/NkNY
X-Google-Smtp-Source: AGHT+IFvNdDPvITkU2uOg44QPazGWcTkEfDLGBYCn531MKjt85NYNKnHFhSNn+2ywJUqVmB9wmBWCA==
X-Received: by 2002:a17:907:6ea2:b0:ac1:da0c:f665 with SMTP id
 a640c23a62f3a-ac20e15350amr138680866b.42.1741148107961; 
 Tue, 04 Mar 2025 20:15:07 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf692b6b44sm561702466b.112.2025.03.04.20.15.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 20:15:07 -0800 (PST)
Message-ID: <67c7cfcb.170a0220.c2633.2186@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 05 Mar 2025 04:15:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741148108; x=1741752908; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aqqGKJ91lsJ+fZq0xnyNFlW9K0AJjvQnbsachf6JkNw=;
 b=YFGpajWLG/EQdiqjBxad8Z3FuFivapyOg65hoMxrUDnUBeYqE6YDHc6CYMLjMaYRDI
 tzP3CXZr8RxgHi04ha4rzGs6ph1sDVGKvfJaJDSWWfzgBrGB98JisQimUheTnXJUvfxU
 Wtmn0GD6bD/tSVyra9Hit7INyd3eossFV/FTk1XALwfc7k7aElAsVn6ESTmKUyG9TVUO
 t7kE6Eo1uo1Rh5bL1gDFJuCvP4RoAmp+akEcAfaBfxT8CXosqyl0kpqpSYeq9Pfv6N54
 6kVwJKeWfSNQ0zUYysgC3gr9rmUpsmdLeC0KkTv8sdcrG8T1Ev3DLcP6dJnZSBWomeCt
 feCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YFGpajWL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-04
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

Autobuild statistics for 2025-03-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  0  |  6  |
  2024.11.x  |  2  |  6  |  0  |  8  |
    master   | 18  | 83  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 11
  gobject-introspection-1.82.0 | 7 
                 libcdio-2.2.0 | 6 
                 c-ares-1.34.2 | 3 
    host-python-greenlet-3.1.1 | 3 
                 linux-6.12.17 | 3 
             berkeleydb-5.3.28 | 2 
                 coreutils-9.5 | 2 
              mosquitto-2.0.20 | 2 
                  ntp-4.2.8p18 | 2 
                   perl-5.40.1 | 2 
wilc-driver-linux4microchip... | 2 
                 agentpp-4.6.1 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
                  bitcoin-28.0 | 1 
                    brltty-6.6 | 1 
             cni-plugins-1.3.0 | 1 
                   cvs-1.12.13 | 1 
                    flac-1.4.3 | 1 
              fluent-bit-3.2.2 | 1 
                   fwupd-2.0.4 | 1 
gemmlowp-16e8662c34917be006... | 1 
                 gerbera-2.4.1 | 1 
                   gvfs-1.48.1 | 1 
host-autoconf-archive-2023.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                host-lzip-1.25 | 1 
               host-make-4.4.1 | 1 
 host-softether-4.30-9700-beta | 1 
           libfreeimage-3.18.0 | 1 
                  libnss-3.108 | 1 
                liboauth-1.0.3 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
                memtest86-7.20 | 1 
                 mesa3d-24.0.9 | 1 
                  nginx-1.26.3 | 1 
               openblas-0.3.29 | 1 
                 openssh-9.9p2 | 1 
               procps-ng-4.0.5 | 1 
                    ruby-3.4.1 | 1 
                    sdl-1.2.15 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
                 watchdog-5.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/bce3cc23b4b886ae54745576bb8f78a104ef7966 |     
    arm      |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/406feaf01c0e43b9f0668593227e3ccc5dac4cee |     
powerpc64le  |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/bba9df274d08656c0abb9a012ae775e07dd61ae9 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f121f78d79c17bb14a3ed8073a6e8520b74fbbec |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1e64d095ce69e903c777a195004b9c81cc426d9a |     
    sh4      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/7b8921c8b6994696aa007872fe29a6c9c83020b8 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/6c31e62a7b424ccfd64a817a83878ba59af4cb5a | ORPH
    i686     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/2247de2038889d2a7d6e0e301284eaf016ebd622 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/155fc34a2a94c8f5b9d5465c6f6cf61d1e7643d7 |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/0c055a2eb1bdb4cb982cc148ba44eabb5570b3c9 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/1853c2013f20f3640c8e71b46e1b51f1a41a6b52 | ORPH
    m68k     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/894bd8ecd6007ab23fc71a3991141b213cfa20eb | ORPH
    arm      |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/e65c2728c91c648fac5ec97c05cb64fbdd67e751 |     
 aarch64_be  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/0f0bb8fafbd86f3b76453b59a5d04589193a583e | ORPH
    i686     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/ed62e32c97ff31662fe06ed11f371d4cf4faa07a | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/47b1c37f31634424102a1aaddca8d3b3dfcaf56e | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d43d914e7a1a8bc7c1464fb85af21386021320a9 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c9579eea52542bae61288fe86ed38007947f3444 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/eedf53c143b65cbfb272bcc74cfae0a362e5bb7d | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/11e3460f52fa2360ec5c286f87a3ca0403e8e464 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e01189abb4d126138ab0ee433c4c05cbcfaab0a0 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/74d127572bcae3ad04919605a23137bd575e6a61 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/29f3e6e1c83b98e73452abb2acb3ed2e309d840f | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0b09b4601bc3214bbbc6bbfcfb3b02f46493699a | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bd2976522b45dff7e811e316f2b89d179a6afb48 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d84522886e4a9ad07a1b610626d2bbdba43671aa | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/dbb4a612d540ee3bf5b55c934e577f967b5ce5e7 | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/0dfa90b2cb89ccc80e67d16ef619ffd9cbb881bd |     
 aarch64_be  |        fluent-bit-3.2.2        | NOK | https://autobuild.buildroot.org/results/0b8cea5133f6e6b763de88386657c1d6ea064fc5 |     
 microblaze  |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/3ac976e2d9c54b11cf784bbeebfed941fff801e6 |     
   xtensa    | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/28f8362a2d89faf8fb9ca1511d2447e781363f2d |     
 microblaze  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/5782e714c63661e6edc25f5f03468f42522e2a35 |     
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5f9fbd9a48daae34f77cdcd4e49f2c7068b8cc58 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3760b5dc1067ddc20da4761abbe37bee23a43d9e | ORPH
   sh4aeb    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8ac9207854acff3edbeb70b7722a3a2052530b74 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f63be48b15aaf1d4d70a95a614627132ffeac846 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/fc6e872760faf4a8bfdc9ddf45859ac1c5f888e2 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3a978f6c0039059e7e9eb8175263fb845e044792 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/0e743a50839f8d4fcc3734fb7084242e2a5e85c3 | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | https://autobuild.buildroot.org/results/eeef8dc30e0e2227325c66d3b6c99e89dde2b7ba | ORPH
   mipsel    | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/9b6d1b75561efb79d895c746545a144eb91240de | ORPH
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/510d1be38bc88df81211a52946ebbc3bb73706a9 | ORPH
  sparc64    |         host-lzip-1.25         | NOK | https://autobuild.buildroot.org/results/779fe1aa6723715fe775b2f199a40950c419d65c | ORPH
   arceb     |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/bf8397a21d6023c5dff8629b2ff269cedb356e5f | ORPH
powerpc64le  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c9e15015d86137fdd7945b5a80ef1e0281b27076 |     
  riscv32    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/141052e7a2ca26ee3c6eeefbd6e2584759191401 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/174611b3e0439ac6635ecbcefc331e1670272a0e |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/28bf47c07a335e0f13535a81e976e0ede4b2d056 | ORPH
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/5166120fc57e315e855e2b4120f8dc0f0a0be662 |     
    mips     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/0b04ab2d96f7cb186a2295177c25e7f3118d7288 |     
    or1k     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/7c9ba49b6703f1b5d4b19d0c9fe7ea4cf583dce1 |     
  sparc64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/3d588041302498f294b0a0165baa5939885c03bf |     
   mipsel    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/1e62d592277f53f624721ca332924db61104ec69 |     
    mips     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/49034dc613db095885a078500ed4ef2b3089f1fa |     
    sh4a     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/ca9cdcde88629d08b079f2b57eba4e0ae34138b8 |     
   s390x     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/e256033a7436ad96fe7f2a5133b667e9c6216c68 |     
   sparc     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/538a9b73c96838ca3151fc8843b01606af247a39 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/15ff65f1e3c6338868ae7f1665713d9a7de8cedc | ORPH
    mips     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/63be0a68062eb059430cb1f7b459ec64ab42ffde | ORPH
    arm      |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/efea3099b4bd493f376caa8d0da1ae3a47ee76d6 | ORPH
   arceb     |         linux-6.12.17          | NOK | https://autobuild.buildroot.org/results/c3c208c068a9da521e3e4074b9d980d7980d344e | ORPH
    arc      |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6bb314120b4f09c2e35e6d8a6df3c9dd42d35221 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/77aa4327f313f98f3996a6e14c44d80317569290 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/dd39bb56852c01547722af4ffdfac8642f2871e7 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/65559b7f3a59a367de97ba0e7c9b61f997f3270f |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/d8c684436240948cb38f3c9f9908473128230759 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/f058c93380e6b46ea986f8b268e403061fde222b | ORPH
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8ced569a8eb8f441fe75d965110ceb79226a474d |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/71f10f5ee98b7a0c1fdf928e0c4dfd0af8415bed |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/502429d56150fbe34979debe53312f86f6bb4810 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/3f609fc4c8ef49f0a39af9d42e61940544dfd897 | ORPH
    arc      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/f63865aceca59ea6f72bda6d17065bd38f137779 |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/87c2bdb568128ff71c9b449bd524d61d4a60ed89 |     
  mips64el   |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/9897518ab625c2199087734347fa7ed3d797dece | ORPH
 microblaze  |           ruby-3.4.1           | NOK | https://autobuild.buildroot.org/results/57134c6168cce2933b1ee132008b8ab5693fb694 |     
   mips64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/5ddfc000065aec01fa67d5214d496afc14287b99 | ORPH
powerpc64le  |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/334bafb9d7d56f1bf11c55121a603523cf9be58a | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/518c8d07b5f7f58e32a142b56d261884bfa02470 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4db49bf8295f3267a26f401c2726e98a03e0148c | ORPH
    arm      |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/d2f10e89d80192bfcb99e7b997ef3a47633687cd | ORPH
    or1k     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/37b117b12f5bd5345a4f16dc82fce77274dbd334 |     
 aarch64_be  | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/0c89740ce6548c6a3b330f76feae9c652cc10a1d |     
  sparc64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/ce2bdef512eab6521846431c57ce6ff9628ab3ba |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            gdk-pixbuf-2.42.10 | 1 
               host-go-1.22.12 | 1 
host-prelink-cross-a853a5d7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/083cbbaef0a5fca047cca8ef0fa88480dcc5685b | ORPH
  mips64el   |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/044be5505acaa64a010e0451df1f4fdb6b65eaf0 |     
    m68k     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/21c451d1741ab972b4b72352392a5b7a64c88244 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  musepack-475 | 1 
package/postgresql/postgres... | 1 
          perl-net-ssleay-1.94 | 1 
  python-pypika-tortoise-0.2.1 | 1 
         python-remi-2022.7.27 | 1 
                  snmppp-3.5.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          musepack-475          | NOK | https://autobuild.buildroot.org/results/49d832de35a89c021fdb26976fa608a477b09e15 | ORPH
   nios2     | package/postgresql/postgres... | NOK | https://autobuild.buildroot.org/results/52fc2ac0908ccfee27cfe7100adfe0bf14740a41 |     
   xtensa    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/9ab44dbe07781ed8d29afabffa56d89d541212c5 |     
    i586     |  python-pypika-tortoise-0.2.1  | NOK | https://autobuild.buildroot.org/results/9cc53afccf56ac2e4d909b62f42eac9c50d0c3d6 |     
   nios2     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/965b0e3835c311f2a6f9a7e45accac7f63b702bd |     
microblazeel |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/1a66bd87b08a3fc0e824cf367058dc1534f35161 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
