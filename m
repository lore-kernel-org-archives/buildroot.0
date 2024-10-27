Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20BED1039E
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 04:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 516F9813EA;
	Sun, 27 Oct 2024 04:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QOK8iijvJkQ; Sun, 27 Oct 2024 04:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A00813D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A00813D7;
	Sun, 27 Oct 2024 04:18:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B2BF112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 04:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 627F060631
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 04:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pK3elt8zbT1 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 04:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05E0360630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05E0360630
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05E0360630
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 04:18:29 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5cb6704ff6bso4085633a12.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730002708; x=1730607508;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WgfhnMt0vn/43p4HxEajuyFVbR2CV2BoYSoZM70wGXU=;
 b=h/q9QDbMdnub1eLrxkKRfzpz6ezeYeNKAylSZraQoJ1SDqfxmxzepvXdPRI/cf5JRF
 trYMjdcujDQfP7cWH127bNjZIBnqg94hhkv1/43HGspwUGjj3VglTaze3pB4DpIE5AmU
 ujtPdkQksh/83EiTLJS9811LcKJ1+C3o2l75QTAsRC+PoVXMyidiGrR/4HdjfoDNEIRP
 cZDfEClHMmWtT07D8u85c8+jKRAJuM0i89IxzEZPdg+9BGOnHjulatiZKDTv7eVHosXR
 tWNgi+302+qWMab8onRWiNgC6MQ3K0pyOmSXjE/XmGAq6MV0wi4TK9+tzNAjOnpG8h2R
 RbtA==
X-Gm-Message-State: AOJu0Yw5omvRiDK8aYzWS7DCmPkLujfXZBMQQxRVZb1lDtTsGpu8CBWs
 nL3si5ptfR11c3hYsRFZ3zsGRE5t7WFxNEB7l4KBFYn6kiXVc5L8XytAew==
X-Google-Smtp-Source: AGHT+IFbSqvwoTaXn8ZR8T5YUEL9mCWVID6xLvwQYIrrhgQgoXYzZLcnz1tO4mHXS4oX8GrgyNKCZw==
X-Received: by 2002:a17:907:6d16:b0:a99:f750:bf79 with SMTP id
 a640c23a62f3a-a9de5d9961bmr363347366b.34.1730002707002; 
 Sat, 26 Oct 2024 21:18:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dec7b59sm238149666b.44.2024.10.26.21.18.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 21:18:26 -0700 (PDT)
Message-ID: <671dbf12.170a0220.2912d8.71bf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 27 Oct 2024 04:18:26 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730002708; x=1730607508; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WgfhnMt0vn/43p4HxEajuyFVbR2CV2BoYSoZM70wGXU=;
 b=heE24j9E8ye91wj9UkgCO0OCisYZ3P3G7Mfn1wYMc8rBzLva6bqGh4RczZtgZD/w+Z
 dFPc43lm8/V6G2xdrBUyznIQbYQOwR//EVfkMclfnxwGOZMsraRryotWMWPjOHZhoKO0
 niU0BH6ngEj5z/CBpW3eouvHYoXDmrA88SCKNgCF6ArO2h/a4MkpCOALYEV0VBAgFuNK
 uVh/Ot1eOcvtvxXlct4td+slvPVoN2TdoXS2hfStjLNyW+CrhuTG8JuXWTptMJ9LpMiH
 rS/ipn7uMTD9aIuPItrxwfa48BKTMQxtuj/BvqkMHS2hIyrbc8bBdIuQRJH+bpM6sOdT
 Mwsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=heE24j9E
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-26
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

Autobuild statistics for 2024-10-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  4  |  0  |  7  |
  2024.05.x  | 26  | 27  |  0  | 53  |
  2024.08.x  |  2  |  4  |  0  |  6  |
    master   | 10  | 328 |  2  | 340 |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 33
           libzenoh-pico-1.0.0 | 14
                    git-2.47.0 | 13
       linux-firmware-20240909 | 11
                 apache-2.4.62 | 10
             dahdi-linux-3.3.0 | 10
            host-binutils-2.42 | 9 
                  linux-6.11.3 | 9 
                  linux-6.11.5 | 9 
  gobject-introspection-1.76.1 | 7 
              host-rust-1.80.1 | 7 
               pulseaudio-17.0 | 7 
                       unknown | 7 
             util-linux-2.40.2 | 7 
    host-python-greenlet-3.1.1 | 6 
                  ntp-4.2.8p18 | 6 
                   perl-5.40.0 | 6 
android-tools-4.2.2+git2013... | 5 
                  bcusdk-0.0.5 | 5 
                 gnuplot-6.0.1 | 5 
          host-binutils-2.43.1 | 5 
              host-rust-1.81.0 | 5 
   host-mender-artifact-3.11.2 | 4 
              libopenssl-3.3.2 | 4 
                 libv4l-1.28.1 | 4 
  binutils-arc-2023.09-release | 3 
                   bird-2.15.1 | 3 
                  curlpp-0.8.1 | 3 
                   eza-0.18.22 | 3 
           host-librsvg-2.50.9 | 3 
         host-libxcrypt-4.4.36 | 3 
                latencytop-0.5 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               linux-pam-1.6.1 | 3 
               mariadb-10.11.6 | 3 
                  assimp-5.3.1 | 2 
           at-spi2-core-2.50.0 | 2 
                elfutils-0.189 | 2 
                  fwupd-1.9.20 | 2 
            gettext-gnu-0.22.4 | 2 
         gobject-introspection | 2 
               graphene-1.10.8 | 2 
host-binutils-bare-metal-2.... | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  libnss-3.105 | 2 
                libxml2-2.13.4 | 2 
          linux-5.10.162-cip24 | 2 
            netstat-nat-1.4.10 | 2 
                 pixman-0.42.2 | 2 
               postgresql-16.4 | 2 
               acpica-20240927 | 1 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
                    azmq-1.0.3 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.2 | 1 
                  boost-1.83.0 | 1 
                bpftool-v7.1.0 | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
          cloudflared-2024.6.1 | 1 
             containerd-1.7.20 | 1 
                 coreutils-9.5 | 1 
                     crun-1.15 | 1 
          cryptodev-linux-1.13 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                    dust-0.9.0 | 1 
                 erlang-26.0.2 | 1 
                 expect-5.45.4 | 1 
                  ffmpeg-6.1.2 | 1 
                flannel-0.25.7 | 1 
                   foot-1.16.2 | 1 
                   grpc-1.51.1 | 1 
             gstreamer1-1.22.9 | 1 
               harfbuzz-10.0.1 | 1 
           host-checksec-2.7.1 | 1 
         host-gcc-final-12.4.0 | 1 
                host-go-1.23.2 | 1 
          imagemagick-7.1.1-31 | 1 
                      iwd-2.20 | 1 
             libblockdev-3.2.0 | 1 
                libdrm-2.4.123 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
               libgtk2-2.24.33 | 1 
                 libsigc-3.4.0 | 1 
            libsvg-cairo-0.1.6 | 1 
               libunwind-1.8.1 | 1 
                 libvpl-2.13.0 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
            live555-2021.05.03 | 1 
                 mesa3d-24.0.9 | 1 
              mosquitto-2.0.20 | 1 
                    mpir-3.0.0 | 1 
           musl-compat-headers | 1 
          obsidian-cursors-1.0 | 1 
               pcsc-lite-2.1.0 | 1 
      python-autocommand-2.2.2 | 1 
           python-numpy-1.25.0 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
                   sdl2-2.30.7 | 1 
                sysklogd-2.6.2 | 1 
                tpm2-tss-3.2.2 | 1 
             util-linux-2.39.3 | 1 
           v4l2loopback-0.12.7 | 1 
               valgrind-3.23.0 | 1 
            vorbis-tools-1.4.2 | 1 
                  whois-5.5.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20240927         | NOK | https://autobuild.buildroot.org/results/4b160b5338ce0febcd8b7bb8601dc7370fd005cc | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/53a3b8facda6d290d55284c6fd5b6f6cc4604de2 | ORPH
    m68k     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/9b375b01b4e1f852db6e84831b51bad79d867138 |     
   s390x     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/daf5561d681cccce8cb292e0dcdf874bc0072354 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b1d6a5c648d54d74b4103919c258cf976df2713a |     
  powerpc    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c3900e9d4d3d27f5e9f6234473857b9929b9a1df |     
   sparc     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/6cc071516928bb4441f7d77b0575a801dd01aebe |     
    m68k     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/5f2ea80c6b9027a47a8585d14b05fe557a3f6c3f |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/28d9f26c2123b5f7fdfd5bd38723c92d6c850dca |     
    sh4a     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/f9d3587948d78a94f6c7ec14324d791a84e6fcea |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/e4ec235ad86ec994dbf20a0d84970e4e953f7a8e |     
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/50cee4ed493098e5c3b810d1547ad0a70fe71de0 |     
powerpc64le  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/91caa4dbd1f89773cfded6c5d98d6e223067bd7a |     
powerpc64le  |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/5baba94aa93873b79a3779922515da67d89c9899 |     
    sh4      |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/8bd314b4743f709da989dd4f7f3a4ea3e7e847dd |     
   mipsel    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/808ea9c436420215a84cc1f8426e58e3d76eafc0 |     
    sh4a     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/e88a9fcc1b71476f275bed69088cc8361a08071e |     
   mips64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/567dd2ecc2178f4e00eeffaa954e4812fdf99e4c |     
   mipsel    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/b69a4a47a11304508c86b30fd2a72a6f01bbbece | ORPH
   nios2     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/0249bab21709c37fa7199c3baea0be11724f9a9e | ORPH
  aarch64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9a87b6da479fbb5077dc14510e1ee7212a260a78 |     
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2b52feff8addba54972c644fab8de6a629c2b4c2 |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/0c079070526c621ccf8fa640a817b3713d775e43 |     
powerpc64le  |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/df7d336d7c25ae8774b0ddd22807785e7e514781 |     
   mipsel    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/a84ade91630324a46268431362a3d456554f0ac9 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0acf5a00ca3d4d0d7cb68fc157299910e8b417e6 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2a7af259c9f748fdaad72b063c84f26580f65606 |     
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0e5ee0d455d6587c267ae3013e3fce22c78965a9 |     
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/013f9f462e879d075d9d8c7c0dd76415964108b9 |     
   arceb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6176096623ac9ae4687e68d33643554a3349ed45 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/bb2710235f49fc66bad3dd13edf1431db241c20c |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/225695e874b165a091b762c6e064fbded8ca445f |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/c4f76ac3a210696a31ec41c893377b0bd645d127 |     
  powerpc    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/174eef49a6c2d90b95b1df7184cf2d33421b33d4 |     
   armeb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/01dae1e1c3c991e870a6d4e5c705a4decea0d2fd |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/82899703eb2e3258acd10899643e8fed4d4ece2b |     
   mips64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/d80f320c9654cb0db038c0e2467aef6c99f6d016 |     
   armeb     |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/d8a694c393ef4e13dce743646ea8280141ca4b4e |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/18198a95d841532a59e9408e62550ce9180b54dd |     
   nios2     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b9291c0f4f11be69e2b672c11e555fb71861a3c0 | ORPH
  riscv64    |      cloudflared-2024.6.1      | NOK | https://autobuild.buildroot.org/results/584af17d190fbb474529094ffa4a1d2876fa8ecd |     
powerpc64le  |       containerd-1.7.20        | NOK | https://autobuild.buildroot.org/results/450d65dbd58a51e0f78fd825b7aacf39667f9b8b |     
    or1k     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/1bfd26d693701178557207e67fcdcf5429e5b7b6 | ORPH
   armeb     |           crun-1.15            | NOK | https://autobuild.buildroot.org/results/eb5b673ba4dbff73ce5c7cc33ebaccbd3bf01c66 |     
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/a70808014acdbdd7093362bbb63d0deceff4b044 | ORPH
    or1k     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/d0ec9918238dadc90f1e56cdcd1181d21618be92 |     
    or1k     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/0faeb1017360bac8f9bc820cc1d9a0c176791abd |     
   s390x     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/3b6d7f50be8c54007db3b161c4d704b4b84674aa |     
   arceb     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/a765b54ca4fc21849df8c0e723e8e7188b6c1012 |     
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9b0f201ef87178c2d6b412b328fa05aff2fc2445 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9e35eaeddb17e26bd85293568ba1a4ee77083912 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d8fde995fc79b341560229ed03935782df48ec2d |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b134db18f81ae8306875e6984620d2553976257e |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5a294b078a50c5e68c76df77c61c306592e814b5 |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1340f2dfd4d2cca18c1386295e0349de9794f526 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/91e941b550b1a968965587925460f2a99ea1e28f |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e50c1d3f708a870aa90b70915f079856af124339 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0e76423a844a6f15c0cb57f09c080057896f8d4a |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7c05e43e481897fc289ff9f57b287e5fdfe97892 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/af0fa69c9d85192a49be17ed077ffaa334fabbb4 |     
  sparc64    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/6a0cc9d1a38adf6487b9a2ea85bd3153d8cfea12 | ORPH
  powerpc    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/baca232b88bd6b23a91b10417cf7069d9fc1e9c4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e5f7a5d5c898a4ebf76e8360d481ae3f797daff6 | ORPH
   mipsel    |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/ddb7fbb3af7e64090aa08c631c3a969324490c7c |     
   sh4eb     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/950d084e38414c1d09e3a6c28d82eb99d124734b | ORPH
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/6e31339311dc5a4bd022bbf434c2a916627ff0cb |     
  sparc64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/9215cf1dc06e4cb8ed0433fcd936fb784f499493 |     
powerpc64le  |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/1659d858e9d18787547e3d516fd2daf056a9f5e2 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ae98c0bf5d15be825d3a61ee34bd3370c478f1c0 |     
  riscv64    |         flannel-0.25.7         | NOK | https://autobuild.buildroot.org/results/a66c3a61a63a86440c644874b820b96ea69cee2e |     
    m68k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/af805523d0845e147d99aaf60f87c17df910c4e8 |     
 aarch64_be  |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/e4476a06bc28bf016492bc14b43d74efc52d2753 |     
   mips64    |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/f4633962535a971d86853d0aae0d48654d3a56a8 |     
  aarch64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/dbe4efa25651a308301bde85df526812dd8a0e9c | ORPH
    i586     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/bec4a121e15ee305dfa24ed27c5217c79386a020 | ORPH
   mips64    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/1076fe273da5bc6bb6f546a6cfb16866aac06ba1 |     
   arceb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/b9d3195ef3509830341fc03ee9f8ed956fdfcd2c |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/e21040f30b82ee18688cf898f6745b09d4be0659 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/aede2e665b6203de1345e54b18a5bfd7d101f20e |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/bedada6197a177ba21ace1a02fa192e2a7298d84 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/f4fd691daa1a5ce56ced671bdac5faf397762fc5 |     
  mips64el   |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/25a678deec46c55953aeb1cefa41ef640b212e90 |     
   arceb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/4ea4caaa3dbfd1f968f3e5f70d5d367a501a9ed1 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/06be55eb121822decbc9f9637b213d4027f70fed |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/7ac0a5480b6097d3cc65b836479ac045280a6ba9 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/964b707472816255ae7051f5ca0f7b5eee8fdca8 |     
  powerpc    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/d27e0a5e764d0b9404af999ce8da1af5f5c2c099 |     
   mips64    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/a61b428d029f8ffcae6e941f3f6f804e61439d17 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/28b6da56fea22c13ae7f2ea4b1f1a5489f749d6f |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/33d9dee53f1cb7a80c60d1626810a9dbb47a9e8d |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/a4936dd66f4de116321b64a3c478a5bf92238a10 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/5b1e72b46bce72ea4e188c9239574a3b1338194e |     
   mipsel    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/e95cba6abbb1bb95b4387f047cfba98f748e353f |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7f80d7b976c173d1ba9e263356b226dd82157c37 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/67b49e8debc9f16ad0b03d09216ccaf2a547e1ac |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/dad66e2634e9972c7165a9933dbb0b4cfce6abe9 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ea37b027ad4169b9178ad15b4cd637ad66cdae17 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c350c78110783c26bb601077c3178d287e9b7905 | ORPH
    sh4a     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f7fe855b0bc6542ac2ef90c2facf50be8b42bd3d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f4e8506fbec9fda76d9e0cee8049eadcfaee5c7e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/842a0923e64a0dbf0936f94b1acfcaba48b9b1b4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/beb3ae3f4d475c3d3733b5bbd1f3c9b4c9526560 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b279efe7748c1396f83efbbb0deb23d41a30a37d |     
 aarch64_be  |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/a5076ce07678273c5492e974d2ded70be5663e69 |     
   x86_64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/3263bef97780fa971931f1b167d55365a6f8b92f |     
powerpc64le  |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/c3e1afd80bf03ea598a396fff8c2c81be28f4523 | ORPH
  mips64el   |        harfbuzz-10.0.1         | NOK | https://autobuild.buildroot.org/results/bba3bdb2b997c5f4d9830f2c164bdb1b017269e8 |     
   sh4aeb    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5c274d18a0975f3f59c061bcd8434c405d4f76f9 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/df4a1b552f87dced7a31c5cc7b9c16ba0586259c |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/09e4a2579c05bff6ab78aa6e75eccbaa3a5eca65 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/afc00682badf471b652292bcb74401479849bf76 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7ea30994e1673d118180dc1977ccc5ee75a95a14 |     
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b67363c566b0af868644a0edd6fdba0e7a866a7e |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/da0060e46aa03de688fd5c705aa73924aae1994b |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2928cf48bc41863bd89a9e888047da1d579a6715 |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ed6224e0813782a1702ea8f6b8c512935f119508 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ae6ae0fca433de7c4f5b44ac2e22cfee8558489b |     
   arceb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f5584a6ba0390ff0d82bd230de9a92613a1735ba |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/38e72a20a6098960c833f792ea145161eae40b48 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/723ef96f11195b68b5657ec42b7d66472197b07b |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ae55ca5bb4c98f5faeec1bf2911b0b575247ab7b |     
   arceb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/b5bf5fa70b77533cf2560bb27948ac1ead28d826 |     
    i686     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/a1604674bbf91a53b6e83631732f49480838a3d3 |     
   x86_64    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/a022364fb59597f1ff940e20844149e5f2d31003 | ORPH
   arceb     |     host-gcc-final-12.4.0      | NOK | https://autobuild.buildroot.org/results/3dbe258da0fdf30a40dcb8f6c8164b450f680d87 |     
    or1k     |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/d529ce4e05b184e29b269067bf118a4f3cb9e912 |     
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/d67a6612cd156199c6ac8041102b80487dcba7e3 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/7ccd2029f5c305ca4f83286ba0e016e96e51455f | ORPH
   armeb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/ac8d97d1eb55b6f552dd4725ac2a5944bed1e01c |     
   mipsel    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/069dae5c4576e2fd9a3fbefeb5fcfc45af1aa061 |     
 powerpc64   |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/5365dc8c8f55533366fd606951063b11cd4dd9dd |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/5e433c52de5daff89bfed8d35ff90e1adf0d5270 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/a7ef66a069a57b8a90dc23b6459371b61a2e7dd3 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/35594bb6be33e6e7793683259d325830398bf3a8 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/d81562ab06f89c836be66655e1f8f37cf210d7eb |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/d66060a51e8f585168a34eaccb5e6cb144630f88 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/4a2a51a4633dadeae081a483ecd12e4882de5bf8 |     
   mips64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/d2925c2bb8ce7a18cd10f23beff2d7f3bc38d1d7 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/007f5f7ecc3683deeec16ccfda61496692446cab |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fd6435bda00acd7e9da9736ad62ebc02e8a39c3a |     
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/267e6f3626ce43d6961f5fdd086f1a542c476fa0 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/382fecee14429342c8831eaffb3ad2bf28207f20 |     
    sh4      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/aacd00609d4ea72261ee051f62832fc75a63a32a |     
   sh4eb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2516002ed75eff78e3c00378d73f83d6f0fefed1 |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/8c6adbfdee528bdb049036206548d83e75335507 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/e4a84e53755b71acae69ee28525d2a77a8df0eef |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/c0b67bd0b4624516b2b980894f52c6acf5094d68 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/2e2d92b4b2caf6734fb98c2de9735a8094253945 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/e76e211ed7cf9b09527ac151251cca934c1d64a9 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/2af3c8a620cee15d583e7d2a7eb53db42d85005e |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/06956fc4646afa6ee5c77273c7be1b1267cc18e1 |     
powerpc64le  |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/06be0d0088aa8f7e25cad4b3bee335132c371132 |     
  powerpc    |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/54bf8691fc5e050ba5ff8ab3eedf5554395508ea |     
powerpc64le  |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/bb22de994387495f6c82814368787400cf0e5327 |     
   s390x     |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/71823e310a92ab40e9773753fe88a204001d0767 |     
 powerpc64   |        host-rust-1.81.0        | NOK | https://autobuild.buildroot.org/results/009fd8bd2100c47f4da1e7fb726e275ffaa2bbaa |     
    sh4a     |      imagemagick-7.1.1-31      | NOK | https://autobuild.buildroot.org/results/41fb8cfc3088b27154053d26ba97f38da825e6bf | ORPH
 aarch64_be  |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/f4335a8e14a36438fff4173352c1f020668c6470 | ORPH
   mipsel    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/e0fa7e4949452c3c877ff78dd6e70797e2279a96 | ORPH
    arc      |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/aaaebddc7773443222f38c66e503c185fadd85f9 | ORPH
   x86_64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/78386d8b72436689d7a329d8d10779512a45c824 | ORPH
    i586     |       libblockdev-3.2.0        | NOK | https://autobuild.buildroot.org/results/831c85c1423584afd4da28ef1726c2a2faa0ceea |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/edb27a972c75716fdb798581e074bd9fce10f8b2 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/d21842dbc670b87f88bec5574c7883345ca066a0 |     
   mips64    |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/f102a5e9baff10e9291f38042a65e75c9b21792d | ORPH
  sparc64    |        libgtk2-2.24.33         | NOK | https://autobuild.buildroot.org/results/1b1f597a63d0ea939e9948c0a3d9cb222f2bb0c3 |     
powerpc64le  |          libnss-3.105          | NOK | https://autobuild.buildroot.org/results/add5b553d5ad1a020d460af864a046958cc6c021 |     
   s390x     |          libnss-3.105          | NOK | https://autobuild.buildroot.org/results/7158625b0f8e3c48df8ad4bfe31df9ba1ce374d2 |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/41d1bb944df320b1df885d63506301cde5342421 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/662e71c2798def742739bc8b47dd036cf1e5a209 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/b6c9626d47bf47f6c1819c6a87cbf1f3b7d4392a | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/b567025c67a322527dd470c765a2b5c179657c90 | ORPH
    arc      |         libsigc-3.4.0          | NOK | https://autobuild.buildroot.org/results/14be09b47bdfd980cf613047392cbda76c0e2c4b |     
 powerpc64   |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/b86b8ba6cafb368884100310c5749df3659eabe3 |     
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/a08a8dd0e5226545c2b34a8a09f52729a3028198 | ORPH
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/23af5eaee78f79315a694d27a4e63d6d38ea709f |     
   mips64    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/c28af8bb7d293e00771adfce3abac10ec75af249 |     
    sh4      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/b2285962ea818d926c84e321a05837625bc51b05 |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/2a790359fbe71c718f06d1d824ecd55d21b1e342 |     
  mips64el   |         libvpl-2.13.0          | NOK | https://autobuild.buildroot.org/results/23523522335fe3f38bc9ed04adab019d74620f8b |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/f2e01a58ddbf57306a38d6a8cec4962a52987deb |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/b49b926efbfe9f027c03385d5de93c592fac1e45 |     
    mips     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/495290dbfe58dcb87ff726e89c87f62767ec60f6 |     
 powerpc64   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/402239559c545653ac70fa0412a1b1e9e4cf7932 |     
   xtensa    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/06068ad1e222f0f071cf1fe6cc63ed439da0942d |     
    sh4a     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/e1765a459bd8871a08ecba7f12c5ad2720cc2ac3 |     
  mips64el   |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/a402453b41e933be4be47f64ef64e4afff8ccb6c |     
    mips     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/0469d96a4a72d6fc61f93f988f4960685310efc5 |     
   arceb     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/dc983de2b2931fe97b794cac0e106377217e622c |     
   s390x     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/af870554ab8d05aedf65bb46788528a1c242ae81 |     
microblazeel |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/2c6c0927d208d03485f1535163fd2f9d20908a9e |     
    mips     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/6cc95ce664871426e5a8c032c1c4a03dfabdfaa7 |     
   sparc     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/7b23fab6607571d086e80c2f5f77665cab8290a1 |     
   mips64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/75338cbb58b86ab14c88a36402b38da8e5bd63e1 |     
microblazeel |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/9a60fcba8e849c9e5b2dba59c41b59dc2173e411 |     
powerpc64le  |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/e98bc64bf8b65d0625d2b054225e7732021932ca |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/22eb58423669835cc5615ff05b07010bc66188b1 | ORPH
  sparc64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b5a0fbe8398b1256b6e30d665c3cf3e6e42e60f9 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/41c0cbf0f6df01711ae904f1c3faeedef78495c5 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/fc3fd0c9245d9164123b2c27f14a926e2b224877 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/856ea4b45a6fecf6e0974c98d48c34e9a336b100 | ORPH
  mips64el   |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/4237e5e7c2e6551b225c4973e29ab19e2bb73c85 | ORPH
   sh4eb     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/b37b7dcac8f5e8149aa869e5f9d77794b5fba56a | ORPH
    m68k     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/5528169ef047e08254ff17a5d2f959d8579271f9 | ORPH
    m68k     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/f1dde2c13e47b6f7f20c7ef7299ff77f36499e52 | ORPH
   arceb     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/664e7de5b58364d5fe4164b0103dbf8ccfca1f57 | ORPH
powerpc64le  |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/0bc5403099787205a918b2fe06e27fa04df6cfc6 | ORPH
  mips64el   |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/bd99be6b92cae89ecf18b74e619dcec33d52ba71 | ORPH
    mips     |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/eff88484437d06749dcc48317444c4fd035ddd17 | ORPH
   mipsel    |          linux-6.11.3          | NOK | https://autobuild.buildroot.org/results/2cab56cb9564365385bb3bda37ad56d4b473a6f6 | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/31a7ef8c2c4c3d170e9ca1f01889b835cd9560d0 | ORPH
 powerpc64   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/b9e36b3edb5f53201c0e24d5e75e0f1d4cb92821 | ORPH
 powerpc64   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/a2c3b3bd3b31a54a56ebfed567f081289a838a35 | ORPH
   arceb     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/d78dfa4adcdae17075e86cab637cc45a0e20f303 | ORPH
    m68k     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/39f7baa473b82381ce5c621d32cf21652099e03c | ORPH
   mips64    |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/d8b3c9840790f1770e9529cb5f5a98b368a6a3c6 | ORPH
powerpc64le  |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/b6c3c8c15d094bf552569aea4f3a4e38b5486b49 | ORPH
    mips     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/166376b338fc3cf8c769e4408b6ad534dd183d68 | ORPH
    arc      |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/4d937e0ce47997414567d7c1714d356ca09a46e4 | ORPH
   s390x     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/bd2344105324a8edb58563a16d07df954399e894 |     
 aarch64_be  |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/4986220be26fef6de2a49d021f951a2769ed4709 |     
    or1k     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/8a7f7bac71cfa743ed122b6ca7f6e7389bc2a4ac |     
 powerpc64   |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/629bbe8990c080cf2948ed04e0bc0da054e16fd0 |     
   armeb     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/12350b2321907d2f0a26e682e47848f50b6d5838 |     
    or1k     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/24f5246108fa0a561ae35a2f8895488b45449b2d |     
  mips64el   |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/d7245d2a7c144fc37e3be30488e71264006fba2b |     
powerpc64le  |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/b61473aa9b4390e2f9b25c1d0c7b3c4e3437f9d7 |     
    mips     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/9a76bff592fbed3ca2f2ba789e24f47d4282e181 |     
  riscv32    |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/0cb9ec59e8763882dc80d37668c4d395d0a681ba |     
   s390x     |    linux-firmware-20240909     | NOK | https://autobuild.buildroot.org/results/40b22bf0cbb8ec9c4033e077fa7f922a0d752412 |     
 aarch64_be  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/c7cddff446fd6c5f6e864845bfbf526e53c14262 | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/528f2819a51928040502ed630c1a09dba75362d0 | ORPH
    arc      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d3b3cea6800b532145a77b657e7e14e4fdc219db | ORPH
   sh4eb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/7a1de7f98aa453fd5b82915977f6a4d817dd94d7 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8b872d80ffe3003b2906c7341b8285508537a931 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/0046a705bdae2ec885b4a16be33e2b289c264c51 | ORPH
   nios2     |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/0f2854213695f11d4ac3160e79bcb6b59afbbd81 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/a042359f6b654293afba2412b52ab64d6ac83561 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/c976775a68a10fda9f4b7714f0faa07e9830a54c | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e884a63fb8b8571731bf89e8cc6234d749441487 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/2249054c15364a3c9e90bfc2da26cbfea74cdcfa |     
  powerpc    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/dbca56630b8fe35ae9f6ac13514a049197851642 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b035822f39212660737ee75bc2c0418c60a31ae4 |     
 microblaze  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/00ae9c11a12c6c19c372db5806cbd957f6564f95 |     
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/e2a3ea011f41300f198f164c6c2525ad7a650ad0 | ORPH
  riscv32    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/7850cbbcfc7e54e30f33231b19b8a58ffeb0aaeb | ORPH
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9cf9d6671af3f15c302c86ef19d9664309f3c007 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3b6130524188dfb7ba1c0edd4eeec9573775d98c |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9d5494c964b230370a760452cc7cae69d23f2951 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/341eae02bb78a8252398b8812061af21b4036667 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9b638a6ccedbe70d1f4517edfecbf5322f49fb01 |     
   sh4eb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/bf8e14e0a09869468875dcd3fbed1d8d4baba47b |     
   nios2     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/594d9eee4b8368cc853aa5df3caf0f5ee0f4ed94 | ORPH
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/4390e938bc0af0dc980006fd175e8d2bcf6db381 | ORPH
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/5100febc627dfd3b5361a541c086eb6f5a907b85 |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/4f6964c3203cad694e7ef679d903cb7a3251b6b9 |     
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f81fba48bbaba985da153309755846fbb5c1a2f2 |     
   s390x     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3c9b5595dc02db7c826af2cc5929a124ec9da47e |     
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/085c23983fa79e6a364d1edf8e32eeb9ceec3adf |     
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/59cb3070095f5ea45c62e53ceb94a834b61cfef2 |     
    mips     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/fd0861656a653f7218eec41dfa7bc9bf5f1989b1 | ORPH
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/940365d918ae924b9995611ab675780390027aa5 | ORPH
   arceb     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/2774679444906866e51c1c6000f8f192f78653e7 |     
    arc      |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/8b1a4334557794cdc2d9a59432eed4d8ca8cfb57 |     
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4b47a3cb5fcc54fb0514f0310eb904ec5d9a3fbb | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b353cfdf1f850be55f84194ac4dd3513c2ccf2fe | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ce8d0ed5dfd62586080fd77e24c6848bbe0576e5 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1fa4119d3154c94a684a061f88efd531eba112e6 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d5fe1918d76f65546a15807817efcd157071165f | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6809f03248daa0c483fc1647afab54799fb209e6 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7fa9e76dbd329406ef186dc55f791657ed2bb088 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f1e6dba281b7e3acc7fa1222555c64ad949324cd | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/364d15d710ef276f59db2ef0f10b761ca41ebced | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/cd1b6a98ed8a73d3b16577a9022010ac624aa9e2 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/036769ff001395ded27e7d04c9345e48fb82dff6 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d6876fb9a31b2eceb97df0c6871f7ae8f0fe871b | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b41730314a1b238a90d50f0c68149ac73f5bb8dd | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7e739a931f0e21ab4f291ec01c4eb206ec3657d5 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/90d9c28741c8886583c5763add337cab4fbddc7a | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5699ba37cd18cb7fc5bfb28091a77e930acf93f7 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/4393505d633b249c225d6face9785118ea6adf20 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1ee46bf5876f35ce70f712e5e9c8686bf19a2c3f | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e90c621b5c77cd19fc503533d0392cc9598a0017 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/002f1add33105ab788a56e9d68abd320057b6bdb | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7f1e0b3d99db07ea46c9cd1f51b320b461623c8d | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a3871d5c58fe6487732e249632be57fb9e742f31 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f81faa779e4f46e212059d826eb04fa7fb505d91 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ea117c41d960911a15ce204ca626a11f11e38b80 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e9bd42bd9a51eb54b3f8f6b225ec416914a95595 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/cda24ca1e74a000c04eaf44437cc6e08c7d7cf01 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8c86ad44f0919096e1284c66609d1b2001c52adc | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/20e7224d3300cf41b108f464fa8d992ac21affb5 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/131b4187ad76fa84b1f99082d853e2885e6b50cc | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/64825f4b1548e500548ddc5046dfce8f6219f743 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/cc81fcf095ccb9e2b9c2148bea54256df48d4062 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a800a720c713bf33cf699f5fe506eb2728c7ad1c | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fb193cd5b2efc3ab1d42ccc34377668b037d4eb4 | ORPH
   arceb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b7f00b65d94240229fd8986cb8586113d603e285 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ce0e40eac20c02cbb273de722b381afb2624af49 | ORPH
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/24be2f15664385c259fa5ea3180dbae72efdbc52 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/01a246111523b4616c40f0a9a5bc295ec5d072e7 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/78c6e0da26327c185f0757e825916318669fc185 | ORPH
    arc      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/249f5b070f1f30481100199e74af6df59fdc333c | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/40de5e47550d49f5f546b21d3d7cde93c6290474 | ORPH
  sparc64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/e68d728066091313636f3516c4e37aea744ea278 |     
   x86_64    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/01e2e751343d1b89e4beb06b6f5873cfd84e52aa |     
  powerpc    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/0195df62a72778633fac7a9f7c3a044d9a1b5567 |     
  aarch64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/33c4e7f24d7acdcfb947aa2f923c703f386fb376 | ORPH
    i686     |          sdl2-2.30.7           | NOK | https://autobuild.buildroot.org/results/525b54db753d82a06a4c0c040ec880ed7c62540e |     
    or1k     |         sysklogd-2.6.2         | NOK | https://autobuild.buildroot.org/results/c5773d1c48e578cb22a530c2a6d26f0d1655008b |     
  sparc64    |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/42d220f9fba4580c0acaddcebb2590c4bcc65113 | ORPH
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/77a78be0162ddb5be6aa87b73fa2b3ed0dab95ed |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/8b1b9d4a206948c4aa350fbea06e21c101d18dd0 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/ff695165990b6ea066c924572f5f5391569b52e1 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a3324383d5a9b1ccb4d7b51123367856c259eddf |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/e521af04d962671282b1ff0332dd9f163fe385d1 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/aae047bee1ea3bfc7c2bfd5f08805e89970eb55a |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/bebff9f1600528799f0b86c0218171da776bd258 |     
  riscv64    |       util-linux-2.39.3        | NOK | https://autobuild.buildroot.org/results/8dda38d1876df31711bb1d77a1b309f9ea4f08ee | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a2b4ea1151fc5bdcc296ae75c4337fc386a5ee35 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/eb2381e492d5bfe4d79b6ace6eaa0fa9d9c630ad | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/dea751620b752d729534ace9ca3cb7b708a5f69a | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/23b9e1c88d08fb297cba3dc67876f1e7391ffbb0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4aac213aa2e829472dfd300a0b843b88837454d9 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ee166ad7c90e662f7b06dc7c6b7062a5fadd49da | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6800741b28dd7a7c419f87fc603b23106ee006ac | ORPH
 aarch64_be  |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/2a5f93b61bc8b123e2a89eaa1fb02be45e28767a |     
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/150e73967b3ba1222a0fb939edbef60c69550980 | ORPH
  riscv64    |       vorbis-tools-1.4.2       | NOK | https://autobuild.buildroot.org/results/24b8382e152755dfc0a767bb83b52c24c7d5abb3 | ORPH
   armeb     |          whois-5.5.14          | NOK | https://autobuild.buildroot.org/results/63b0a25fdff7a37e4f7061b7670000eb958a7eff |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
              host-rust-1.74.1 | 1 
               lightning-2.2.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/b0f1f277859794bd2ea76ec5ab45aa4eb3dfd035 |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | https://autobuild.buildroot.org/results/1e1c928bb33f04b35b26c6cef695c3dcf12da220 |     
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/bd3ce8cae7357c040fabbf561af148981aef7ede |     
   mips64    |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/c89bd1cbb9928b1113e44ed3910c011519221588 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

glibc-2.39-74-g198632a05f6c... | 2 
  gobject-introspection-1.76.1 | 2 
host-go-bootstrap-stage3-1.... | 2 
         host-libxcrypt-4.4.36 | 2 
               procps-ng-4.0.4 | 2 
                 apache-2.4.62 | 1 
                    bat-0.24.0 | 1 
                   duma-2.5.21 | 1 
              host-rust-1.74.1 | 1 
           host-systemd-254.13 | 1 
                  jack2-1.9.22 | 1 
                jemalloc-5.3.0 | 1 
                  libffi-3.4.6 | 1 
        liblog4c-localtime-1.0 | 1 
                  linux-6.8.12 | 1 
           mediastreamer-4.4.8 | 1 
                memtest86-6.20 | 1 
                    ola-0.10.9 | 1 
                 pixman-0.42.2 | 1 
           python-zlmdb-22.6.1 | 1 
              skalibs-2.12.0.1 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/4dd12ee6f3751676884d403190b20083c4b5f911 |     
   x86_64    |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/61d4c802c1572a8ee307f2d201e476660353e133 |     
    or1k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/cfffdf1a9de481d8e66c1c4995ed1a9e441c092d | ORPH
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/e3ef5e2460c5aeb2fd93e71ed3ce5663738b79c2 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/4a83c6cda96fba9e4d8b68afbd8678cfc7d19b14 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/10be667fa3a76ff77d0d2c7bb5328d9d6911d29a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/556bb7f562653e91955a992f345e126abcceeee3 | ORPH
    i686     | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/9dc6f5de18558bc08f604516da171cea291cc26f |     
  riscv64    | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/fa7225f2573d026c1c0c8366a7ef4d437a2153d0 |     
    sh4a     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/cb371dce70d1d0cae05acf624139b1f4940e6a83 |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/72819a035aa74e17d0de060896d6d62a2fda0a2c |     
   armeb     |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/7db350210760e03716f3d14c60f0d6761a5e38fc |     
   mipsel    |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/af3e53cc236753a5530a84414fd9eadb85e5b7ba |     
   xtensa    |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/9756531f7b3a771d5f4b1b6922ad5b8e58e42ffd |     
  riscv32    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/62cfc75d01dd73050039ce8fc6e3af517859294e |     
   arceb     |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/933783b041bb3c06e9430e89daacba3d60cf706d |     
    i686     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/1384dfb4850a84996eea07f75fb472717136e3aa |     
  mips64el   |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/0492c1ddb270628522a55395463d26a0dc65d691 | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/f6560ebd67f95ba816faeefc2159a29c310d8df2 | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/43f3f96c730cef7e4b84122af144b4b31de0791b |     
  sparc64    |           ola-0.10.9           | NOK | https://autobuild.buildroot.org/results/20c42cb464bca8ac23a76ae76b5dfa4cfe17528b |     
   mips64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/164855536b122178b325b3f7ac3e24d3a94db24a | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d63a5057e5a1829b4721e639ef0022508b30213f | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/10b7a6760beb1e7eb7ce8a113c664bcde1307024 | ORPH
  aarch64    |      python-zlmdb-22.6.1       | NOK | https://autobuild.buildroot.org/results/996bfa78ed7c3b8dca602d15c25dcc696cd90707 |     
   arceb     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/2bb976df0ed92e5d7eb40ca3360b20f88b1b60db |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/104a0734bbd2d00943b62124ad005a643ae8afe5 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

             berkeleydb-5.3.28 | 1 
                   linux-tools | 1 
           musl-compat-headers | 1 
                       unknown | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/21b5fb3f8d02fe114308bf84ad2f6e5af2dd6514 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2ec6fb8dce629d9aed7ce9429fbd39e6eab5aabc | ORPH
    mips     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/589526fcbd2f0507ffed5ac32ea8bbc0c8316a2f |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a9a324ccc51666bff051471b5f052fea15effc2e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
