Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A889AE7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 04:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C8E404A8;
	Tue, 10 Dec 2024 04:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gV2IKvhSZjFB; Tue, 10 Dec 2024 04:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B180F403C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B180F403C8;
	Tue, 10 Dec 2024 04:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1AE26F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 04:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFA7C81184
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 04:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZK-l9fDup3sL for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 04:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0308C80F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0308C80F3B
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0308C80F3B
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 04:14:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa69107179cso282552166b.0
 for <buildroot@buildroot.org>; Mon, 09 Dec 2024 20:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733804071; x=1734408871;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKK8ceICwQ/HpCxA2paU/RZDYSqXzR2f6OSfgxh4BLs=;
 b=m0XAr72WUR1WFBuFhsSZRAoTUvOPaXihmgXQM49DLbA7jdH/UD5M3I1Wa5Fm0VOm0q
 BwQiWqw/233slI3T6q5MGJb3UUAWOZPZ6K0CWFzXtbfVa4mKIabcuWHNrWh7otoI1xe0
 WQDOure56vs1T92k4RVp0DVNp5/VY5YER9I6Awb3cbgj4KoPZapCaH8lx3d/IiJ09C5o
 Uc3k3O8ndKa6qqKz32686TaNDqLJ/PUPuRwcla1hoyNHz28uO89TITFZq6e0PwF7QqLv
 NiLXek65LqSDFYhS+wQ/ktsKpfikFEkv2NCBzX7sfb++i5GRctT5P5KONB0deoIyacHJ
 /xdA==
X-Gm-Message-State: AOJu0YyAOhLPhRVc9IucHJFvYjkCRy5RkDkLUcZRLDEq2MQWgU5qR35q
 pu83Nk3aHKim4vawU43pGNrI347lqVgrza7xdrKNjjuugDc6zI2CMWME+g==
X-Gm-Gg: ASbGncub6Mecqpb0vSF3k85EnJhMN+GxUZVNCrNtXG4zEW2ZVNkJ9pv5AAZzHGeTbrV
 SN5O4TRT40kgvXAVoXX1q4SbZFoaSd8Wwtfl6kzi+2RXJUrfrWJvbqLQJeNgtHkDPJwkiPc0LR9
 sn3U88Z9fMgmvEZNVVej/j4ApAFRf23U/NENvHblJXI1qEJevmznouU91OnsueDUkyHIWHf9VF4
 +JS1oc29FtbVD0RUl1m4u+eBjsDqC5cbxAN/coEm1RvbHZCngBkqv2c+Q==
X-Google-Smtp-Source: AGHT+IEr8OhT4X1rlnivIOJRrXcV3twa51xyxEqGuKS4xGx1n8hjCDUGXb9KkNf7oEsOBVbdf9V31g==
X-Received: by 2002:a17:907:2703:b0:aa6:a732:212b with SMTP id
 a640c23a62f3a-aa6a7322763mr9954266b.58.1733804070839; 
 Mon, 09 Dec 2024 20:14:30 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692b01398sm180982666b.59.2024.12.09.20.14.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 20:14:30 -0800 (PST)
Message-ID: <6757c026.170a0220.2594aa.77ae@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 10 Dec 2024 04:14:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733804071; x=1734408871; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UKK8ceICwQ/HpCxA2paU/RZDYSqXzR2f6OSfgxh4BLs=;
 b=gpTR4gXyZ7+2ZtFWV3CWaHzHeYZzRKD1NswTvLnWhN2viOX83NXB0LtkP/fviy/gVf
 Nbpv1OmO63qpwoScFdFOWD/xuY9eky9PCEHdUprglcy5fYHuSjrNrTB+IodhKcGOQEl1
 XmnIlOmw6twxE/g9wmUL1VVVsmH1CCN+rWKH0hKjXoQvtaA2a/xaj1hf64bJA2E8SJ35
 GqquK4DiNMVEWwSOvF4yZ+stsqXRcoppp4CN6AHT+8Md541QOq2sADUobBwTZdTDb/Ry
 NM2rVJzAI61wsn6nNB/ZRSIBL1fyVwu6yiuF+e3r0Ue55/XqbmTeMLev1memO2yIjXPC
 eLPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gpTR4gXy
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-09
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

Autobuild statistics for 2024-12-09
===================================

      branch |  OK | NOK | TIM | TOT |
    master   |  1  | 106 |  0  | 107 |

Classification of failures by reason for master
-----------------------------------------------

               postgresql-17.2 | 11
             util-linux-2.40.2 | 9 
                 linux-6.11.11 | 5 
            igh-ethercat-1.6.2 | 4 
              libopenssl-3.4.0 | 4 
          linux-5.10.162-cip24 | 4 
                latencytop-0.5 | 3 
                   mimic-1.1.0 | 3 
          obsidian-cursors-1.0 | 3 
                acpitool-0.5.1 | 2 
             dahdi-linux-3.3.0 | 2 
                  giblib-1.2.4 | 2 
    host-python-greenlet-3.1.1 | 2 
       matchbox-keyboard-0.1.1 | 2 
              mosquitto-2.0.20 | 2 
                   perl-5.40.0 | 2 
               procps-ng-4.0.4 | 2 
               pulseaudio-17.0 | 2 
               valgrind-3.23.0 | 2 
              armadillo-14.0.3 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                    brltty-6.6 | 1 
                elfutils-0.189 | 1 
                   eza-0.18.24 | 1 
                  ffmpeg-6.1.2 | 1 
firmware-utils-86739f2b3ae9... | 1 
                   foot-1.16.2 | 1 
                  fwupd-1.9.20 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.40-18-g564178076272... | 1 
                  gnutls-3.8.8 | 1 
               harfbuzz-10.0.1 | 1 
            host-binutils-2.42 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
 host-softether-4.30-9700-beta | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
               libglib2-2.76.1 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.13.4 | 1 
           libzenoh-pico-1.0.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
               pcsc-lite-2.1.0 | 1 
                 rtptools-1.22 | 1 
                   sdl2-2.30.9 | 1 
          sphinxbase-5prealpha | 1 
             subversion-1.14.3 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/7d6052b104c32316a3a9c7fee857e5138eb44b0b | ORPH
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/597aeff9c5d113f8bba7883eb76c79962be61eb3 | ORPH
  riscv64    |        armadillo-14.0.3        | NOK | https://autobuild.buildroot.org/results/ef859b323fe3963052f415ad46e90979cdeb4942 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/bd3478a3893c26d479144ea3eec437953517716a |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ebd2f8b6bc28d9fc49fa11860dbb50f20fa78f8c |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/e636b705598dde50b3f625a4d30bb5bfd8fe3bcc |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/fd6697167fbe98a8aac218a8c797c679b3e3d7af |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/624f4578ed563e1e24268e5ba7f21dd2fdaf2020 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/da36de3f29682c073660309f9553a7ff08a33d09 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/57a826b0c294699f6a3174b497f5934303dae1c1 | ORPH
  powerpc    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/ee0be25c4b68a381120e6ad8b6b274add279b371 | ORPH
powerpc64le  |          eza-0.18.24           | NOK | https://autobuild.buildroot.org/results/2e77d32101170b5cf51314a170cb69760f09f0e0 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/1827f935724f7e1dee5cc2fe6aefa9d099f6d204 |     
    or1k     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/ba8e5d4a6791e44be514897e4e61a3173b32259b |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/11170ce2380b8604e3ae5f9f93b516103d9e0073 |     
   armeb     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/f8d65720c7940999dd76132ce23c2ce23df01122 |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5f761b20c81ab8ded893a78b4820a31488d53dbc | ORPH
   x86_64    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/983f1d4c01f826877c4b372713bf271412973a42 |     
 microblaze  |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/0a124034687d55bd8931fef8ef0f20bb56a631f1 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/1dfd1f0f3b299f3d65a8802e9595afbcabc63016 |     
 aarch64_be  |          gnutls-3.8.8          | NOK | https://autobuild.buildroot.org/results/1fc0635ccba0dd0593c1704598e8a12748b3d3ab | ORPH
   mips64    |        harfbuzz-10.0.1         | NOK | https://autobuild.buildroot.org/results/95b15293da9a1923643181bf09571c4b62d0b79e |     
  riscv64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f6e2b3a611e4e6691bfd9e3aadeda59d800fae72 |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/06aa0cd2e19087a65348f1bd5861cbebeb811e58 | ORPH
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/b1bb5a2755a35fdb03a0c095b96fa9b8ace668e1 |     
   sh4eb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/636b3ead0f9cd05401c01728cf2f48eb3f63650c |     
   xtensa    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/677c2583a3fec2c25fc2eb23dd4f8068f94ab1f3 |     
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/975964515c6d0020bf6b98ed3f7007a01958cf90 | ORPH
   x86_64    |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/d98febad55aa987cc420251e7b23dacec2fa340f |     
 powerpc64   |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/7a743685ed5d100f7b91c4921a998cfe6730a388 |     
   sparc     |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/17f4454708885cc649bbea0178e980ad1e802d22 |     
 powerpc64   |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/4b6bedd7f7e7699724c9eb86470a6550c85b130c |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/fd9fdf334bf164b91b934b578873b6097e5f862e | ORPH
  powerpc    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/278912dd33c3c789179134926f9cc8ff8afdce04 | ORPH
  sparc64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/2b39f6cee73c4469a97a4ccf5db962574ff6d973 | ORPH
  mips64el   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/e7b410b16572ee7451fc7b4c2ec877d93a6cd88d | ORPH
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/26a409948f3eaa9951382beb01a9ed49bbb25108 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/614a78b395acbca2783695d321be3289fc3f1402 | ORPH
  riscv64    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/44ab29d0cb16b31a6082556f0c03122eeafc91e9 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/9f1b9215fd597941e440767d094a15703284d4a2 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/08d5382e0af3eef77ff8c1a930f13720a9b1d0f0 | ORPH
   sh4aeb    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/9096fa9dadebac281f1e7d89df37eccee6e8975b |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/5b9df2d425416d905edf8260a356ee25b77980ad |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/7bc9a128ec6841270ea3e1d2f2fbbf55d11f8ee4 |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/d4e3cc87aed79edb566232d616f98eee834a2a04 |     
   armeb     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/60e6fed2585ac7f1e4e70bea5b6b40e44f211258 |     
powerpc64le  |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/cd9bf5516164c01eb707f0755c98aecb76eb2f95 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/10d001ac2e1463e14f43d0424b09e5d67d28de03 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6631162e5454f30aaa5d66d29686bdbdd411d041 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bba79a510f5079c87a4430222973b5e3adc62b5b | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c41ff0c571f288e7c3ba57aea3ef127cd37959b9 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9c4bfea791fdf4f3e6291e353a1cee936b7374c0 | ORPH
  powerpc    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/49f87021c72936c36ae78fe4b77b278a5666a6e2 | ORPH
    m68k     |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/518d53fd112e6b06a0be9819dcdd3a7ed0bfd596 | ORPH
   mipsel    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/77aca08b2c7805994677b6178a5fbd0d2f8c637e | ORPH
 powerpc64   |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/589c387e22bcff9bd9d6fbba3192830503eaeaf7 | ORPH
   armeb     |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/e3ce5536a0ac1aa7afc34a97269c784bd74ae03d | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3c53d5dc568ac9f47ac10de03cf4b34d55159edc | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/23494ab3b7af0f4c895f006d5e6dbfcf84a503a8 | ORPH
   mipsel    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/98ac6ba26420a914632d1c86199639e4387371ac | ORPH
   mips64    |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/7ed2f2d4e93cd1975c2b26dfb92e379589fcf616 | ORPH
    i586     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/6eee99eb5461de1764209f93fe3b52ba66ef2aba |     
  riscv32    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/2061d999c777c0e70e14438cb27de80948e1b27c |     
microblazeel |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/ae67d53ebd832f443e432edb9b7bc850db9f6d22 |     
 powerpc64   |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/c4e224598625b9adec3288feaa32b81036824099 |     
 aarch64_be  |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/425fd2b8b92b32e6937c64e7fe09c58098e5f4f5 |     
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/803efe50103a1fb24300c5e5db8d4c2fffa2f109 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d3cdc043026efeb03169b0b67970d9d3438e8dc6 | ORPH
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/71656d72a11a50e318e3e0265c29e46a37039505 |     
  powerpc    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/04540bffa012f7e64b4d4d2d5eaedb3ad8900756 | ORPH
    sh4      |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/6de14e89b015bc456523f1fc7151667591cdfb9b | ORPH
   sh4eb     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/d2def6dd3acaea416e98413febd923e6ba83e6f9 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/35f3e88fe4c57f0217a09eac30cdf19aa632e3c0 | ORPH
    i686     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/124b1f43a281f1193f67e2db9619e1b02932b145 |     
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/df7a321f2c25dba0c77d03add890e22218d79504 |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/739a9b2ca0361a83be28c668f8f145272838b392 |     
    i686     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/e146d9abb541058ddeb4818f2016f4f3a5556bc3 |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/cf56bb2f8f2614257573e6fda940c99d7b13043d |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/5545467671b606d8ee227354acfc98428a0e3124 |     
   mips64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/1667f366a22962250b2a327d7ce44fd84c8b5062 |     
powerpc64le  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/b061e6a68c885e47a254e66dbc073e2b548b8cd3 |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/09f80dc3ce5f6046e57f2b8c40e92dc5014ef9ae |     
powerpc64le  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/2c2bdfa03ec82ff2e5b8640d8dfabb1ddc2dbed8 |     
   x86_64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/8bd1d3445c90fc4314c9cbd604eee3df2f849449 |     
    mips     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/42b95c6f2190a9f07e7a8eb4f1892ef3a0b3abe7 |     
   x86_64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/711c101d9a4807fcb59cff2b7c89454f96cc3e2d |     
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7a20a6794e0b7dd8b4991985e1aeb3d6907e03bf | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b7f5edfd4760e3adac599d9f7dbb3d8d3322780e | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9a5d0fdb19552c4b10f5b0f561951c6eaf8e9a5f | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c5165b2d0597f11db61d1ea675a3510c21f74138 | ORPH
  powerpc    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a4459b70ebbe37cfcd23decceb862bea7539a255 | ORPH
   nios2     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/913a9d2df5185a5a512a3d584c76074cccfd7214 |     
 powerpc64   |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/2ade881fc74e590c939cb26bd46c8504c9038da2 |     
 powerpc64   |       subversion-1.14.3        | NOK | https://autobuild.buildroot.org/results/c3cefbd0e23d1ae03f77dc5c5b1b9011a3634a71 | ORPH
    arc      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f33e49a7fde7ebde21e1d6ddc7b540c27f1da5a0 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2b70d3e510c9859fbc9fcaddbcd92fb5c108ea74 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/06eac1ebb5bc23dc7d23007283558cd65df656dc | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/025a768438507a1c8c70642370095ce5f7a18e4b | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/307c8ddb253ef8dc5fb34cbd8a03ca4afa855966 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f988d9cddcf8293498bf5139d52ed73468669f06 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8fbae8b3a9cb411395c0e42cb1bd46b0a1b77e41 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/fdc88dbbdf87bf781da5138c42fecd3eb3b58b5a | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/27f01b805c3d2c975b101a887b70bbba3235dc14 | ORPH
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/ddb6dcd042144b02e3bc87b66946c4b4708ab931 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/5058308e355c0d0410c5584033b149167d00edc9 | ORPH
   mipsel    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/22c520b7ef51fb3f3ad5eac446a96453ea0bf2b5 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
