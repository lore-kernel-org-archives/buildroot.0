Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76F1C531DF
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 09:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E6C40585;
	Tue, 20 Aug 2024 09:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIKtxI13_bZX; Tue, 20 Aug 2024 09:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C65F40308
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C65F40308;
	Tue, 20 Aug 2024 09:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 881171BF32C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8233081147
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-rUcdbZGMKW for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 09:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 346DC81146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346DC81146
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 346DC81146
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:47:20 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-530d0882370so5461051e87.3
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 02:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724147237; x=1724752037;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4btyiElTedJsdZL0/QKoekud9FisNFQbm1tE8K+PKjg=;
 b=WvirJwwN71w/yXnLxShsF/0D04QBwzde+sEhat+2M3XOjBmJNJOiVOYz3W46K+zRUy
 M4HWhhPh2m0UPKra/BBWbuHGPeSQAG17XULDy5gT1kUDzcwgW67Kf6Q2pLL1uhwYOUHJ
 2cEMw0LoRJ4QbyQaENFvgVJZ/Dk+W22yP0LqcdPCzpeM7Vjv2nkBH77vOrHCJS3LUIvg
 IsOzG2wNIs5yPQNuZI6HBp/HRmDV2Sq7/FuonfPk9WlOlDph0PqlFkCDy8h2LWK5Lq0v
 ARD2yuRCOnU1nYcNywiig/UJTd+10vVqXi2F+S04YtgfYEIhJDnNrgar6ddx+RiHice4
 D37A==
X-Gm-Message-State: AOJu0Yyg98Tha6+V/hJFOan78GAK0JjKEVWI063BQrTrfHJpxdystWAJ
 goXDx/Eb2xEH+R7LajBA/oyeuF6NW5q7+Ga/71xWDMDQJF532gpGepiaMg==
X-Google-Smtp-Source: AGHT+IEtsnOq9KfGv0c7k1qUTJc06SSyaS1BG/aJMq68W95BfQusTXL99bMYSj4FcKYWFxHzzIsDrw==
X-Received: by 2002:a05:6512:1248:b0:530:daee:cfae with SMTP id
 2adb3069b0e04-5331c6f1eeemr8672974e87.61.1724147236859; 
 Tue, 20 Aug 2024 02:47:16 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838394880esm735413266b.185.2024.08.20.02.47.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:47:16 -0700 (PDT)
Message-ID: <66c46624.170a0220.3b1789.74da@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 20 Aug 2024 09:47:16 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724147237; x=1724752037; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4btyiElTedJsdZL0/QKoekud9FisNFQbm1tE8K+PKjg=;
 b=IVO2wBxjy1ISTFSq0whAqDY6A8owWlB+XkUx712RSKKyRq9WbPkfnHGTQzVMZQcSTo
 bUJhCPR1PsLS9d/v2WTwU3nM/cjnFxd1fE2FJi8IIuYywo/qiY01KZdEnSpyrXXkQ1Ar
 9sXP4+B7zpZrrg+ZOUS/OQVViEyUOa5u0/NdGy1GF2tqM5z71JIkWePE2rpIMBCmu/KR
 5ps+px4AD945sVIWSKm9+r32825URaz+5cz/Hpa/r8L2N+aH48KTLmqnxAi7wLdcA7Ww
 D02KpbvBMFNe3tOpZsM9gICberA4o93byTOmoHd8MzroNdfH7g8AW3zjfDA6iTzuRNCz
 ZVHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IVO2wBxj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-19
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

Autobuild statistics for 2024-08-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 27  | 22  |  1  | 50  |
  2024.05.x  | 25  | 28  |  0  | 53  |
    master   | 20  | 38  |  0  | 58  |
     next    | 26  | 44  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

                 gnuplot-6.0.1 | 3 
              fluent-bit-3.1.3 | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.79.0 | 2 
                  linux-6.10.3 | 2 
                    mpv-0.35.1 | 2 
                    norm-1.5.8 | 2 
               procps-ng-4.0.4 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                     crun-1.15 | 1 
                      fio-3.34 | 1 
       freeradius-server-3.2.3 | 1 
                gerbera-1.12.1 | 1 
            host-ccache-4.10.1 | 1 
host-riscv-isa-sim-00dfa28c... | 1 
host-vboot-utils-4b12d392e5... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
               libglib2-2.76.1 | 1 
                libxml2-2.13.3 | 1 
                lmbench-3.0-a9 | 1 
                 logsurfer-1.8 | 1 
                 nethogs-0.8.7 | 1 
                nushell-0.85.0 | 1 
      python-autocommand-2.2.2 | 1 
           python-daemon-3.0.1 | 1 
            python-scapy-2.5.0 | 1 
                   rauc-1.11.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/65b00c0d6aedba31d19a1cc073e76c92c35e439b |     
  powerpc    |           crun-1.15            | NOK | http://autobuild.buildroot.org/results/3e20da059d56bf07454fa6eba5ccd10cd8662031 |     
 powerpc64   |            fio-3.34            | NOK | http://autobuild.buildroot.org/results/b25a6b912df9f4851431a6cc15d11cc02c6033d0 |     
  mips64el   |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/8089601a89fb900b64776de54677928db7652356 |     
    m68k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/9d0660549e6c2c2ea6c526c7482b7e2b7606f8a1 |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.org/results/4365c9a5acc88c726025892a88a6b56fcdb976ae |     
 aarch64_be  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/0962c3d63cf959b08a99059cfe28492cb0d71d6e |     
    arm      |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/22fc24450ba91065c30f67f7467e8f9ccd6870da |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/d7e9a351511b39ae516ebbceaf53c01ce962f8e8 |     
   mips64    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/429196064f672572cea39210306dce322bd6ba1b |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/124308574301d01f7e37b88d7770b553cfd2c21b | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/025394dd70aad29c9719727f85ffb1ea1df8adbf | ORPH
  aarch64    |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/98941b70de3d2b33bb5ed70f476f52ddbe44ab0b | ORPH
 powerpc64   | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/f43e476c5b934b168c2e63ac32846fecddb65f62 |     
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/de3e07e3c801eacfb8f4d4a74796b15bfc85726b |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/d814e7e2662dff6a724042b865bb3dc54a264e9b |     
   nios2     | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/653d5e047d776c819cb031bda069b75a46ddec17 |     
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.org/results/3155642d16b3bfa8215ea1cbeb7bd09bdf8de771 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/198b613cb8b0a75f08d960bb9e8ade2af8b870d0 |     
   mips64    |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/4ff5c2c3f0bb7798a5b4478555c1797e7b560811 |     
 aarch64_be  |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/95016140445155c29b35af0ff07df081debb8a17 | ORPH
   mipsel    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/634e89119841c4dff244ef32ebec1ebe3d95d043 | ORPH
   xtensa    |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.org/results/f1715de95b46a1d08143e529bd4574bc7dbcfb3e | ORPH
   nios2     |         logsurfer-1.8          | NOK | http://autobuild.buildroot.org/results/a8f2c84850c078edcf64afb40edcdf8cdebe35b4 |     
  aarch64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/d5a3df5ae6a1d137db871b5e09fecc489548e81d |     
    sh4      |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/9a535db9b6ac37876ae01a49c5e4dbe09d46c48f |     
   mipsel    |         nethogs-0.8.7          | NOK | http://autobuild.buildroot.org/results/1a8a827274d86c1f4ef44714316cb80bc1e52591 |     
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/ce72c70586ba15b74593ad6a05b78030d8c7c33f | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/4c0e12a8fa4d8bfa5abbfbebda3a63e31c1ef527 | ORPH
powerpc64le  |         nushell-0.85.0         | NOK | http://autobuild.buildroot.org/results/182c28f86b3baa712ae5d692dad01056ed98797b | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/7f5557281a7a0509a5eabb2ee83bed042be4fa42 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/765ea97c445eb4ea0ce51a6a31023bdc2361bd25 | ORPH
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/5e784b080e44a9012816d619a2e91fff02ed1096 |     
   nios2     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/3048186673c5ed879a06b5b7517da9e96dbb72a8 |     
    or1k     |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.org/results/043f1ac4c0e1532d81d52c8ba7503688a42843fb |     
    mips     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.org/results/d55682f3e1d7ed8e14d77bc285d2157c5b049cec |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.org/results/517eddf0d79c6e17418349523b5192c97cbd28bb |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/8117c37dde863084868f9163965f3f0d3cd904aa |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               collectd-5.12.0 | 4 
                       unknown | 4 
                elfutils-0.189 | 2 
                     crun-1.12 | 1 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
               host-go-1.21.13 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
               libunwind-1.6.2 | 1 
                  linux-6.6.37 | 1 
              memcached-1.6.22 | 1 
                 openssh-9.7p1 | 1 
             sofia-sip-1.13.17 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/216b7a0eebb769172b4ecdc9a032b0674e711749 |     
    arm      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/ca1f83e12b79716ca6eed1aaae3eee80da9b2515 |     
    i686     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/c4f0a81b2b8b2c1afe89c5851da8d8b306e096cb |     
    arc      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/2acff2c6a3655c59c5a5a6e3b62026edbcc24c56 |     
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.org/results/d9fe367370a2e9c0bd8860483bd06eeadd41d30f |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/5af36319e6cf351155663b146d51d56c1acad061 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/cabe78a0598576fa5807e94a715a087938f881c8 | ORPH
  powerpc    | glibc-2.38-81-gc8cb4d2b86ec... | NOK | http://autobuild.buildroot.org/results/f1ec33278f18458eec1e315565288822526aebc9 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/37ea991e06071a43768f690b02408f5a1ba68a04 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/eb3698487d4b59f52ef9b8e37597bcb68c1c6130 | ORPH
  mips64el   |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/31bf9e1669eea7b8f9f55743ad73646f53f783b6 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/60a9a2564c5a14d0c52731e4e4bdea67693756f7 |     
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.org/results/9e17267a2c874297f44ec34f0d95555246e84a12 | ORPH
   armeb     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.org/results/7100fe5b8c47e81d95ebe6ce2b44760202820fda | ORPH
   mipsel    |          linux-6.6.37          | NOK | http://autobuild.buildroot.org/results/ffd9974af7ea74f227751da44b785960fb1c1a0b | ORPH
   armeb     |        memcached-1.6.22        | NOK | http://autobuild.buildroot.org/results/5ef80f711682da755928092519cfaa1345c14390 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/71e45a6c5eeb6722c030d00aa919b2e4e0fc67b1 | ORPH
 microblaze  |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.org/results/756bfaee6d6f8c58b6605a36f0ea0fa16782bf04 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.org/results/4b067730774d69b13a70e5773a5749a08c495553 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/32b9f1b22558f8ea647a81c62368d0fb13acf461 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.org/results/745e82e3ce488217c278a586ebb852da12777e75 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/ea5f65cb0b455b270a6eb7f29ebf50a6602aba92 |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.org/results/a3fb87e95fdb47d1f9abcd9dbd5483a6e5470a18 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 3 
               collectd-5.12.0 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.61 | 1 
                  bind-9.16.48 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.2 | 1 
                    dust-0.9.0 | 1 
                enscript-1.6.6 | 1 
                flannel-0.25.2 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
                host-go-1.22.5 | 1 
host-prelink-cross-a853a5d7... | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
               libbytesize-2.7 | 1 
                  libffi-3.4.6 | 1 
               lighttpd-1.4.76 | 1 
    python-cryptography-39.0.2 | 1 
                 uclibc-1.0.48 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/f426ff99ceea2eab380af535f67ee26884693d63 |     
   nios2     |         apache-2.4.61          | NOK | http://autobuild.buildroot.org/results/644d76be37874c361b967961c743c57da38993c1 |     
 powerpc64   |          bind-9.16.48          | NOK | http://autobuild.buildroot.org/results/c9269983608300c9ae9852e3614380317bb24142 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/4617ef2d41c3bc92e50ba480502e9d28638007b1 |     
   sparc     |          bird-2.0.12           | NOK | http://autobuild.buildroot.org/results/9dc0c0115e8850a5cc68b48e1a85e70d2c64e958 |     
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.org/results/bab4ed4e9c943608819515347a923dad89462818 |     
powerpc64le  |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/eb126616614b14e4e2deda97dddc566789ee3f9c |     
 microblaze  |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/2d44461d7f67ccfc122e43416462623a01b3809c |     
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.org/results/fc33a170da23799c91e644a306aa26acce46b31c | ORPH
  powerpc    |         enscript-1.6.6         | NOK | http://autobuild.buildroot.org/results/5e108255d39ec7c94be8c2ef1fdc641064d68de6 | ORPH
  riscv64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.org/results/4f9daf327289f61a18e9972d8fa608da84b0bbfa |     
   mipsel    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/7f0edc3a5df8c8e11611a756f1a93e044f8d0036 |     
  mips64el   | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/00bd0cfe9d0e0b8f5813285e2dd27182f736e054 |     
   mips64    |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/1a4b43455f7070ecfc5eff1013b1d669fd841471 |     
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/5ac45763766435fc02cf57dbf5ade089aa95c6df | ORPH
    sh4      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/f1a8079403321e86ebc91c1ad457f0d4be87ecbf |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/a1d48f35de4dcef6306da1fdfa20f9af917fe65d |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/29bc2fd73b237306b5781172e51bc91f79216f75 |     
  riscv64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/582b0461ce513a8a7c0ff720d6428a19c2d62cbf |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/f663cd54c779e25660f363b2140def0becc989ee |     
    arc      |        libbytesize-2.7         | NOK | http://autobuild.buildroot.org/results/ceeebfa3ac17d661c90871c0e5e934b497d33ea3 | ORPH
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.org/results/be2a82769c836dca5a3bac7f997687301bbec93c |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/aeb69b211801aad31139db9ca8546e4fc1f22ea1 | ORPH
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.org/results/4b87a845996e4bd95994b5c3524137db831743d3 |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.org/results/09f99e8be12305f8723e53b7ad2e2a2bd35eee24 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.org/results/49d4098b7ed63a3320ea7af70693e6a9260f5468 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.org/results/228037158c380a1ca3c75a21fe6a9f8e68c2fc86 |     
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.org/results/80f47470e336bbdceb7d06dbc4c8e4b3b3ac47bc | ORPH


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 9 
                     avahi-0.8 | 3 
                 coreutils-9.3 | 2 
         host-libxcrypt-4.4.36 | 2 
              host-rust-1.80.1 | 2 
           at-spi2-core-2.50.0 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.15.1 | 1 
               collectd-5.12.0 | 1 
                elfutils-0.189 | 1 
                 expect-5.45.4 | 1 
              fftw-quad-3.3.10 | 1 
            flashrom-1.4.0-rc2 | 1 
                gerbera-1.12.1 | 1 
                gnu-efi-3.0.18 | 1 
             host-delve-1.22.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  ledmon-1.0.0 | 1 
                  libffi-3.4.6 | 1 
                 libssh-0.11.0 | 1 
               lighttpd-1.4.76 | 1 
                  linux-6.10.3 | 1 
               linux-pam-1.6.1 | 1 
                   lsuio-0.2.0 | 1 
                nushell-0.85.0 | 1 
               procps-ng-4.0.4 | 1 
      python-autocommand-2.2.2 | 1 
    python-cryptography-39.0.2 | 1 
           python-daemon-3.0.1 | 1 
         python-remi-2022.7.27 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/80ea31a064135a7271008d0cf3d57eb51250284b |     
    mips     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/4ddddd4d6dffc3f25c08b07fa2a14dbf9faa4a5e |     
   sh4aeb    |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/0dcec8ecc387bf94a9b3148ba41929a7a91343d7 |     
    i686     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/8865c241d3a1b73d80880e1f74be707147e4b6d0 |     
    i686     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/c9db7e39033a3932b9baa4bef5b8836530014bef |     
   x86_64    |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/e85ffa29429c873f68320e9e910abeac80b539b1 |     
   nios2     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/659aa828e2542cb83a6d156874d1e8d8a5bf73c0 |     
 microblaze  |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/4ed2f6c84e7013858d13685612411844768e1470 |     
    m68k     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/ff7ccb05ebe69d89b416b1cba2633f33d9f2a745 |     
   s390x     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/612fa85ad51eda1fd74972eadfe848af1b643244 |     
    arc      |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/f2093fcae564f21efbb37ddeb05a907d08f5c333 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/35356be84bf3ad714586d9a3cf42b5e6ab9ac9d5 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/0e2d0d67d0113c403418e35a7a5234a0e2e2ebb0 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/0db8407559c73f467e1038008219eb9b3f5f6968 |     
   xtensa    |          bird-2.15.1           | NOK | http://autobuild.buildroot.org/results/f5cce12ac2a73e347ac0e3904864042bc20d33c4 |     
   x86_64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/5fb63da6eddcf9ab2e85be5b8c151b6fa507389d |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/53e0f2fc3e98294bcc79f0dd7ac5e02aec9c7f49 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/a7beff8a3925ced5e1c349ac7bccd772485ad2bc | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/b057da833803c41ede1b5a5ed2e1864981c4ad95 | ORPH
   nios2     |         expect-5.45.4          | NOK | http://autobuild.buildroot.org/results/4ac33d9aa107900c83493021473756c2a1e06fd7 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.org/results/d077ef227e2f0af2314d34bfb919b1fbb4a2d385 | ORPH
   sparc     |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.org/results/c230f451b159cdc8a9661d82083cd7998a1c0edf |     
    i686     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/b1b2f20f472d0dc92e9f01c3c1ed456287af2e5e |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/f7f3d84de120585f2c766735e06e01b96776c064 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/e144d75b00aca64ce07649a17ef56d471e30f4ad |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/08e48b1df6add34d281ea8d98d1a840b9717914c | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/1af33813e80e60f3a278dc5485915e8cd1bd357e |     
   sparc     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/e6595e442770cecc40d6f34972fcfb51e619da62 |     
   x86_64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/7ea834dd91f1e87f7b8bedd53417ae03b2e71a7e |     
  aarch64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/7d034305f24c4054983364f36e7f605cfff4ccd2 |     
   mips64    |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.org/results/1256ff22e9e5a6f0359e2d6d813d9c511d7f27aa |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.org/results/b52d8011a221f5869128660debb6da0de0146567 |     
microblazeel |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/4ea75f355d1aea83979f0e461a9e93886c90504b | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/57f878d84c9733588068974a7d98c9f6f0dfd0e6 | ORPH
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/c2681d4ce99309db82b33742b5feb3dc1c833b02 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/75b670de9bbf143bbc765d54349d66bccc754ae8 | ORPH
   mips64    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/6497d28d3f2e8a48c15ce7c60750ecffc8d23c4c | ORPH
   x86_64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.org/results/f11c62f504e9ce68ed9e3fb3533d53942cb87092 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/bf0c2a211ea9f187324dd34c8e9a218b7340ec8c | ORPH
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/4e8889f64f72a10979cc5b5cf7440f2bb229e454 |     
 aarch64_be  |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.org/results/7132b8ed5093694b1f8cb76d4d3542dd9932e88c |     
    arm      |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/7f854d7c7d3c7753cfa592b302c926e80a370557 |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/5b96cf0c8314155442fb81708038f0589384cfc5 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.org/results/0bd8be179ddaaa839c36d00fbbb9448db14b5fda |     


Gitlab CI results for 2024-08-19
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871449  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607873038  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607873040  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607872341  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607872345  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607872349  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871315  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871320  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871336  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871340  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871344  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871347  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871358  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871359  | ORPH 
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871781  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871787  | ORPH 
            TestMosquitto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871792  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607872107  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607871121  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7607872286  | ORPH 



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
