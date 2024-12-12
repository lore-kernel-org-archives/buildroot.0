Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5FCE7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 04:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A4584380;
	Thu, 12 Dec 2024 04:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMGCr2CF_ZPy; Thu, 12 Dec 2024 04:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B05A284396
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05A284396;
	Thu, 12 Dec 2024 04:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B627B1147
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 04:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F9C0843D6
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 04:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ad1UakO-cWeM for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 04:14:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31DD984373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31DD984373
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31DD984373
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 04:14:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa69077b93fso18284066b.0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733976886; x=1734581686;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sAO8s9mq3PDjxTQIv4J9zQYDDP6KA3+63Ob4lJfPjS8=;
 b=lu5pFjviNJ16qsP45XEpg3OO/dMA2iBa9Q7/d5rNaD9Yy422Ia9Q6eBw2j6vXgcJqx
 AE6oKKSoHVb2GX1JlgaoEqHypAEw6n2+IvA2cG0WcOPEwZauzAbe6JQng++99s3OG9tE
 oww8/W+32MBDUQ1quR2axjN/3ql6FO9yHSFfUlo4YwEXAvuYgo5clTek6+BvHRuARC7d
 pTxOPSl8E34y/LsAbVJurKrDUmMdVMGclpxMc+U9LRMTi3K5q5tnKnEy3Njxeh0JEtfJ
 TdlWj02O4JXuRoezYDHXhm0pVNU22kV112TbMfLtVgP7zrzql28mGWEei0gT9PtKllx9
 AbRQ==
X-Gm-Message-State: AOJu0YxZ83jdSUbEQWfxiFgbo7zgEIE7j4qHMSAy3OrpYGoSrqByzSuP
 gSA4ioDVB1gGGBqbtZNy1oDFU88k1qv7PoWpz7Wopj1UMqQL5p1FThaHpw==
X-Gm-Gg: ASbGncso6maUo/vL6V5COCpQ0BeaCR8Nl9N3FBaRXKMuCIFZruQvRRiRK7k+YT9BcPx
 ockto86ORklU9/7taT0fjce0AiA7WzHBajwEuDPcfrS25xFtk9JiX+SEA73TLLIs0pLJSCyy5gS
 MDQbw/M2jH1r9sgmB/T6oU5oYWiQcBFb8HfnSanqjRIypyPaXn4Ms+zQ33IZrs6qKjF9WzNBcIK
 8cLEJVqmoonvPBBOdu4xriBfvsZeeB1TiE4YGidRtm1hh5K8W9DMx7PRae/
X-Google-Smtp-Source: AGHT+IFndVs2oxNfpv3nEZk6IZ+JKVbz4A9mk1kV4gMIuz2FnhzM/6S3fiZ+gb6z8blqkyti5xBO8w==
X-Received: by 2002:a17:907:82a7:b0:aa6:9ee2:f4c9 with SMTP id
 a640c23a62f3a-aa6c1ae752bmr179831566b.23.1733976885677; 
 Wed, 11 Dec 2024 20:14:45 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68770c4a4sm541673966b.163.2024.12.11.20.14.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 20:14:45 -0800 (PST)
Message-ID: <675a6335.170a0220.2029c7.7562@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 12 Dec 2024 04:14:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733976886; x=1734581686; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sAO8s9mq3PDjxTQIv4J9zQYDDP6KA3+63Ob4lJfPjS8=;
 b=KRq/BLclKL8NzE1/gFRr863OQ1XaHtFGKKWmVC4ii3guPpBs20UAupdIBnVRuPNLnE
 PuJxvjkq48N539wECEnBt0RsYBs+ump4zKfo1z8MxjWcD1/1bDmidrbND3QMfqeYBe2m
 tY4QWYKZhHrfeg1/SdjDlnMAsIMKvQRQDlOxRF3SKeHDp70+AjREt2Vs+D5jbEu/JI85
 +6Mvkj8LRJEA5XwFQuAStLH5eZZtzHgQTKHXCLu2bJQc5OPI5P7Uu/JgbYvlbKwlFuX/
 lAZuxecEiM9hPyREqbVN2RaDihei9oiDpI+wRAuRtHD65EwYup45NQ4N4wOoq6W8/4NB
 YYsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KRq/BLcl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-11
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

Autobuild statistics for 2024-12-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  1  |  0  |  8  |
  2024.11.x  |  2  |  3  |  0  |  5  |
    master   | 10  | 184 |  5  | 199 |

Classification of failures by reason for master
-----------------------------------------------

               postgresql-17.2 | 10
            host-binutils-2.42 | 8 
               pulseaudio-17.0 | 7 
             dahdi-linux-3.3.0 | 6 
              libopenssl-3.4.0 | 6 
                  linux-6.12.3 | 6 
                   bird-2.15.1 | 5 
                  curlpp-0.8.1 | 5 
         gobject-introspection | 5 
                 libv4l-1.28.1 | 4 
                 linux-6.11.11 | 4 
                    mpir-3.0.0 | 4 
                       unknown | 4 
             util-linux-2.40.2 | 4 
                  cairo-1.18.2 | 3 
                   cvs-1.12.13 | 3 
         host-libxcrypt-4.4.36 | 3 
    host-python-greenlet-3.1.1 | 3 
                  libsepol-3.7 | 3 
                  libva-2.22.0 | 3 
               linux-pam-1.6.1 | 3 
                 agentpp-4.6.1 | 2 
              armadillo-14.0.3 | 2 
           at-spi2-core-2.50.0 | 2 
                    azmq-1.0.3 | 2 
             batman-adv-2024.2 | 2 
                  bcusdk-0.0.5 | 2 
                  brotli-1.1.0 | 2 
                 c-ares-1.34.2 | 2 
                 coreutils-9.5 | 2 
                   foot-1.16.2 | 2 
  gobject-introspection-1.76.1 | 2 
host-binutils-bare-metal-2.... | 2 
   host-mender-artifact-3.11.2 | 2 
            igh-ethercat-1.6.2 | 2 
                libdrm-2.4.123 | 2 
                   linux-tools | 2 
             lirc-tools-0.10.2 | 2 
              luabitop-1.0.2-1 | 2 
               mariadb-10.11.6 | 2 
                  ntp-4.2.8p18 | 2 
                   perl-5.40.0 | 2 
                     ace-7.1.1 | 1 
                  assimp-5.3.1 | 1 
                  boost-1.83.0 | 1 
           crucible-2023.11.02 | 1 
                   crun-1.18.2 | 1 
          cryptodev-linux-1.13 | 1 
                cryptopp-8.9.0 | 1 
      docker-cli-buildx-0.16.1 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-6.1.2 | 1 
                  fwupd-1.9.20 | 1 
                    gcr-3.40.0 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.40-18-g564178076272... | 1 
                  gnupg2-2.4.6 | 1 
               graphene-1.10.8 | 1 
             gstreamer1-1.22.9 | 1 
          host-binutils-2.43.1 | 1 
             host-cairo-1.18.2 | 1 
       host-gcc-initial-13.3.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-python3-3.12.7 | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
             libapparmor-3.1.7 | 1 
                libxml2-2.13.4 | 1 
           libzenoh-pico-1.0.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            live555-2021.05.03 | 1 
       matchbox-keyboard-0.1.1 | 1 
                   mimic-1.1.0 | 1 
              mosquitto-2.0.20 | 1 
            netstat-nat-1.4.10 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
                 openssh-9.9p1 | 1 
             parsec-tool-0.7.0 | 1 
                 pixman-0.42.2 | 1 
               procps-ng-4.0.4 | 1 
      python-autocommand-2.2.2 | 1 
        python-m2crypto-0.43.0 | 1 
           python-numpy-1.25.0 | 1 
                  ramsmp-3.5.0 | 1 
toolchain-external-bootlin-... | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.23.0 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/c82a0110c5c947f75ea8f4621f47d8ff3539e120 | ORPH
  mips64el   |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/27dcd7d509f3d2c26e34d239dcde43b5f7ddf0d6 |     
   s390x     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/7f2a2d618957e623fd1f8c07338251c181ca9681 |     
 aarch64_be  |        armadillo-14.0.3        | NOK | https://autobuild.buildroot.org/results/d39ca8fa941b3aa376ae3815313613fc360f8bc5 |     
  riscv64    |        armadillo-14.0.3        | NOK | https://autobuild.buildroot.org/results/57fafbaddc7c02b37c87f9102c8849eec2eb40b0 |     
   nios2     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/ea50ece00a75737ba285949a3e22d2a699d922b9 | ORPH
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5f86679abca63aa73f6970eb4128c6c8214cb75b |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5ba55d90b52785840b8065e90edd37a52a394e73 |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/36697abb861a7a04232136624de2448c35db2721 |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/28efc636aa22957adefc4b273aec8c3c7764ac0a |     
   nios2     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/eb8b7ac29c400a358cc3608354492cb18b87fbde |     
    i686     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/45a66fa3501cc3a85c7c98d139d8f5c3704f90a2 |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d57308fa23f98fcc293dc640491be4c7fd75a552 |     
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e40ebd2f68c8bdea94dc0f854568bbb67f0d7926 |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6fbf35470dc14b724123d6fa1601f32b82673bf3 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/78fec3d7cdd54040cc6a0a4acba8d8f6ab691402 |     
 powerpc64   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/406f1cdf8f87e68edaa51afed775d18e6b2b1d83 |     
   sparc     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/975bcceb0a4c6f22670d8b6cc09d0120b4ddf5d8 |     
    sh4a     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ba013823107245528f7d249c658b2ab037a41728 |     
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/89a121988b4b4812fb016db62dd2eeb93e3111e7 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/a34868cf37e7660c813118480ca3e53188425718 |     
   arceb     |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/ad589f98f8c50a69e767486abbbb6ccdf24f152d |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/00c24ceefe3a7112191fc5d48df9c5343f5dcc79 | ORPH
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/44823e7491de59e274b37f9925e59b2dd184587d | ORPH
    arc      |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/16181ae1b3bd0266a6217dbc07be8dc029e07424 |     
   x86_64    |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/85b1f30c2c63eb8f4901882ad49417a5ce522c48 |     
   xtensa    |          cairo-1.18.2          | NOK | https://autobuild.buildroot.org/results/bff8b2b4458021f6c60a2fd42ab1c4af82b51990 |     
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/9e96fb6b04c09c5040be57cc9fccab82b8f4458d | ORPH
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/626ef4221ede325a48a20d7b17254fab266c351b | ORPH
    arm      |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/f244ac913a6560a76cc3a8ebd4ed5b2d02244252 |     
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/25627198b7ba2a11d1cac1fc877b73f3ca3f78fb |     
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/11925c6934a71a63cefda2b8d86fcd8782625f8e | ORPH
   nios2     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/fe33700c50ed9b361ea1210ced2687e8168d3223 |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/d919205b65bb4028e943df757795ed91c268ce62 |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/03831d238bd58a71b455bd8d254ae1214956df2b |     
  sparc64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/2968beb16064872f53e212e558659b7c101d7f0f |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/7f78d4ec3b08cef6c16d8e57ec9c60c9dcf4af97 |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/28d8587a7dff42485ee6f82d6e4bcca3611915ed |     
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d92a3559e7c04fa5ef98268bf67ac0f247c8fdbe | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/693be69a0442defb5596e17fe7f315b6976cce89 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2b3f4713a20d31344f7e47eb16c096cfbaf3c8da | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fe4fef702f94d6cff871fb7185de98094eb86c93 | ORPH
    i486     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9b79f7566648baea17fd0c383859f09f3cfcba56 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3dc591eade92106ad4fa5e6e743e89c805d993ba | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cba39cfee5eb70ebae9ecaad6054e95b3a509184 | ORPH
    sh4      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5a29932138cd6532562b4de10955384a9c72ac49 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/135893ef0c4f5c56c58d49a71b225a1547e933c5 | ORPH
   x86_64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/f1cb5ee5ac3169c64e560f4d425a227845a58ccb | ORPH
   mipsel    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/83ab0100ac6caf9c915704e6dd49ae5e320eaf81 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d20618747c3a2c4f631cfb7f19c843b94ee28119 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/361e218714f3fca0088e21ef43cbe6a4702a6304 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/d4d343ac140a5f5f594fc50045a3a0a1a1d85ced |     
   x86_64    |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/0e8992d330fed005281f7af1d0a1d44cb7d3eb79 |     
   armeb     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/c9ea7e1b2cf11631ae657d18bf2badfbb11431d5 | ORPH
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/b40b490947ea8fb01f18c044bffcd658372d6845 | ORPH
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/8896579991fb0bf501169657be7ff8d9f16e67c5 |     
   sparc     |          gnupg2-2.4.6          | NOK | https://autobuild.buildroot.org/results/13c3f8cd6a3ec4b494b030b8853bfebd076a4a52 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/0b7e03891bfaa449479cfa95f34ed304f0353955 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/67d696838670c238812842d67428dfdda68ef961 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f44d831a286457c2d76f9e98c8bc54e24165d8ac |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/681e29b1555aed14e30fdcf203000693b0518263 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/90ba2f289655a035c138d38d07923ce3e9aee8ac |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/664e13f7f8659796206e5ec9ea2d955e2b8ffa11 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/99d1d89775cc3b326e2a7c4aec79d21be3344c61 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/d5a2b95a761afb542e26b16d6b9b2cf825c4dcb3 |     
    or1k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/beb118e893d33111aa5ecc7f8eadfd5d98ea777b | ORPH
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/73c4ea19dd14bfe59d0cc4f409b4ec3d78da5987 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a1192eb44b453a0f566983fb49ed7b52ed6f127c |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e9117b1629ee183456aebf463b5b6aee1ee27d6d |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a8e3b06b90761a1b85849c13322d61cd76fe09f4 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bdb3971d693874fcaa332ad8e5ba0e0822f88cb0 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/97e050d95264e340f3bedec990c33674d9cace14 |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6f2f873fadc885a392a3941092051016a7740c0c |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/71856cd761e8f28ff4ff458aed22f68bf2d10f30 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c88be71f96c5d5995a84857c67621a14b7ab2375 |     
  sparc64    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/e1f5c983b7cfddfc0e8a6a5a9334b2143724e7aa |     
    mips     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/d4050ea7fe7b5a69fcf9fb9bc4c5efa8d2c2b1f9 |     
   nios2     |       host-cairo-1.18.2        | NOK | https://autobuild.buildroot.org/results/e2ee62763ee0b2a3042928f5fe3478c28213d39a |     
powerpc64le  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/503b3c0b8110143481bf2588b6f866cf8c311c0f |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/2246b595d335ba61ca933db89744299e3bebf7e3 | ORPH
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/a15f0bf9544a834e312f52f70305600e1e482a30 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/a842a1710e7d435c35890d0bfc36081ad4b50a1a |     
   mips64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d7b08fbdcbdcfeece1dfdc3c226d3a06db4e832a |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/134e96ccbc01ff5a8b09841b3a37331a4c0a14b1 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/b996fc945ced9cf3289c6297f15494bd256f9814 |     
   arceb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/334b6061a293a810e2dfb631abd350be67d9398a |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/20bcbe687d6f317a6535de70717d50692edbf4d3 |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9dbf6bacd302b5f2c26a95452e095df2fbff0d8b |     
 microblaze  |      host-python3-3.12.7       | NOK | https://autobuild.buildroot.org/results/ff24b7126c9d963337335417a5a8eef6cbeb9fb7 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/821f2c80589d424fb7535696b09a45fbfc3a2440 |     
  riscv64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/0a508f36acf6290979e98b65450bf9e2bfd510e7 |     
    arm      |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/c5d575a206e4eecb7d6bb6283499937a2851db99 |     
   nios2     |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/9a4fad3da7745f75c35db2e3d1f4a71127f061b9 |     
   sh4aeb    |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/a5d4536e01a7eefeb087bbb3bed33c57e1eacace |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/b3f88f231ef9bbb37e9bbd18e5349fe31197554b |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/167f787cc4196362ef2e4901c8caf9612573f55b |     
    arc      |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/4c3eee9b35b065f6127ca6fa88c1923e19a90688 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/b8af2dcec24e0343fd20fd8ddb964ebe623ae3a2 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/878675e7e3343cd1b88d00450608c60c9f2baad6 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/69da14a5dd47cb2ce122b3991abe6d13a0ac4484 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a8ff7f3543214af6bfc5962275aa2fcf6fa5fca9 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/574d94795dbe38f62dfd48ece9fdd9b93451a077 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/c46e26498510aee8cc92bca0004d322fa3419940 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/2a7e053089fb60eb37b0c6f505bdadec85016236 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/f54e51ea7dd0d563bd886f30b22807ac661f97e1 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/8fb7aa6f233d2d76418b371d0207b21891c89b48 |     
   nios2     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/621cfe913a2b93f8cf477faacd935047b4a59f09 |     
microblazeel |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/238af9d73c1f97eed2a5304bcf67e8173d5bae58 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/f8cda7918de6c19395cd371833a20c558a332874 |     
    arc      |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/c4721b596359ac41eab17f807b7694e1e8748a89 |     
   arceb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/799e29ed6a2c070521364323d956d3b4bf3ca741 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/5ebb82fec5d165477bd8a63e9286558b480e4c6e |     
   mipsel    |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/5f14043a20c34b0b7cd689da0a3f41effcaf98e6 |     
   s390x     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0e293481f1fbc2a280da37784f0785a7129b1934 |     
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/89034f3de5bbc5d50da9408907989d062f94e474 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/b88758c6a22a4fee194992dac7a3f90e36abaabe | ORPH
    sh4a     |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/a534cf6b87debc54264a38e69a6d443e5c81a25a | ORPH
   sh4aeb    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/9e9457e803fcc774b28889fdaeb8f05c0cc8bd4e | ORPH
  powerpc    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/0f45a0dc12aa5c0a71fb8e1b544dea1acad221d6 | ORPH
  mips64el   |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/fb6d7c8b98cc6a5b4f6b4078e4134710f9c8e853 | ORPH
    sh4a     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/132365fbcf8d65b1b78a3a5f708523ba5efe4675 | ORPH
    m68k     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/bf004563c00027631967c4ec85ae6de01e8f08be | ORPH
   sh4aeb    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/29eb9a215b646cd03f8923daaa530cf8aa8bfd27 | ORPH
   mips64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/9a8d0f3621c5df9c81a10803721a46c423d0841f | ORPH
   mips64    |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/76969f6f4c8e1ec5daa43faefef00c700368a2ce | ORPH
   sparc     |          linux-6.12.3          | NOK | https://autobuild.buildroot.org/results/86c14241b4cbb5d1926adfa2efcf230ab4f361c2 | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c7d42085e5d486c27cc7645d6d5db5a0acc256ab | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9d8460bb177e1abbf18c6f489bcc7b61c527ea96 | ORPH
   mipsel    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d863751adf9af233951d6c0c9ca6629be138ebef | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8e45b7faf4024e64319fe6d8b29853f54d91aa54 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/77d2a00eefa429876f3ef3accba885879c318a67 | ORPH
   x86_64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/3f0213cee8c54dff0763674ae94b906b0bee6edb | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/bed24a425175ac627b2caa658bf3bb2cf5f9c41c | ORPH
  sparc64    |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/a3d0f8c06bea2da34febfa0e1f72bce7a52dfc33 | ORPH
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/34b82e8c1ff37c84153b2b511d0bbc42918f654d |     
    arm      |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/132cd8c78564d98fb51a7cbb03c3aa3d8cdf3574 |     
    arc      |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/a553813b33a2619884e6d4e248ddceb5eedd23ef | ORPH
    m68k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3e9124a6996c848d7fa0c2c1e6e590a40782343e | ORPH
   sparc     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/efeae0cb04c0555ace0bac63ef50b0b2c9066e6a | ORPH
  mips64el   |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/9c92cc267774a86982c6e85ad1bcbc1e61510b6a |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/030e7848b5d225bbfd9e29183730c3a0c0e18661 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c2d2f8060a77dfbc74d9be912a72662c3c616d35 |     
  riscv32    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/75273c11e63350cbea548a109b2dbef100c3a51f |     
  riscv64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f4f3a24fd7d194233d1cc7231264dd4c4b31a26d |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/613c295e4caf226eff0bb52204dd6cae228e2ecf |     
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/34e1ff2722d7cd04c23c6f837526b94253c8344a | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a7b451c931db807a505048f5ff1ad46fb797b860 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0a9928204b8c2a4a878dc22119848fac47e8fcb6 |     
   s390x     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/c02e43ddffccebb2cbc9df278bb28efff3f98d0c | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/807ad177f7a9901e0813f109b22613dcf3ef6386 |     
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/dedbfec27d3d0b3fa7282f21e4ef46e00550906a | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/74e12775ce574992b35e95e5a23472774ec287e4 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/67340acc8399a8a83ace9c085055ed928ba8d8ef |     
   s390x     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/480a98e81e2c03f4b235d6f2f114dd0f4c005e32 |     
   x86_64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/966fea0242b6ec9c6b2c0ebd2297eca0cadab13e | ORPH
    or1k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/b025ddafb8a47a79ac16717fc0b966ca977640e5 |     
  mips64el   |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d6b9f32f0caf92b0406d1e0352b9f48bda3a801a |     
   nios2     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/420fd2290eaca8155dd0479f0c1077dad1ee41ba |     
    sh4      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/d8102f3963fd956c33834df44a9bcb477088252d |     
  sparc64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/5b87f54649a6b27acac49ef8c0e89e4d6e3d42ba |     
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/3727189cae5f415106bc154ca6cef4d2985c034b |     
   sh4aeb    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/60a6d5137605aebef38cb66eec7c0352f5149b50 |     
   mipsel    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/4871023a06c1ca96b845f7985eb68479cea47672 |     
  aarch64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/fdd1cef9131079bdefbe3854b08120733cdc6307 |     
    arm      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/ebf8ac407ae6478608cd6fe280370d1583b7ab1e |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5d1497ad92062b43ef9dc9697990756687a1a0ee | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b182231a3bea9863155bfd23269c3d09942783ba | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e67ba06086c5d06687d7c0b60d01b3b05268327d | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f720372162fc449523955c832da6977034589e3b | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fcaaeeb6df583d3ec516fbda95f076757a2ef0d1 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7c2c1ba699cd99b18e89ac2a2c624e15418354ba | ORPH
  powerpc    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/653d1b90e2057ae2451a4c3f6170f09001b3a8d2 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/28f1cb06d51ae129132c379e13c7bfd48c3e7789 | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/6af310ba0f114020781fdcf71d3169ea3083478c |     
 powerpc64   |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/f629ee4f3f8d4507c4efdfbe6c6f963e90ccb15d |     
    arm      |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/870fd152b0713c0c7619a589bff8529bcca90d91 |     
   x86_64    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/6a33972b87ec8bec0a2e6c605f12f6e54b075563 |     
  sparc64    | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/ca6fcafcd0bc99867a51e33eaf41309c40fffc73 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e094b5ba486ff46ab4bdaa5b8b642ef179ad20dd |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/dac796920abdf134ce164ba5b17f9c1180e78202 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/41b5bfcd2623576545a5cd7cd070a73ed4376fa9 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/cc3a571687fac68c8d09ef011a623ecdddf660f6 |     
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/15ba2c4a1343e1abf79bca22675167a5a9ba17ac | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c474adba77e9769433de0b1615eae69b37304a6d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/7308511718ae376ded93adebea21788bfbbd30ce | ORPH
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a86afebdbc44f9bcc0abf56009f7748ee27ad601 | ORPH
   mips64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/8e0ce1dd9f5a134011ad3d4d495da1ff076e640f | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/1bff71c8ae6f326a6cfa609111d6024362e155db | ORPH
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/028896ed3167b9893ea5fdaca2b7cf8fdad48c63 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               mariadb-10.11.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/4e9800454cad4188f1ffdbf8f54b11c937f288de | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

          cloudflared-2024.9.1 | 1 
glibc-2.40-18-g564178076272... | 1 
      python-autocommand-2.2.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      cloudflared-2024.9.1      | NOK | https://autobuild.buildroot.org/results/594419a354b0295dd94c275af6900d16469256ba |     
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/f9e39aa3b1760d877d97707c7efedca0546f0406 |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/7b9faf8ef21451df7aa4c3c04fae5c3aff55938d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
