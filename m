Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89BBC3ABC9
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 03:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F21882301;
	Wed, 14 May 2025 03:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMnA7n9LgL5x; Wed, 14 May 2025 03:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C01382A2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C01382A2E;
	Wed, 14 May 2025 03:10:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 282F6150
 for <buildroot@buildroot.org>; Wed, 14 May 2025 03:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FA9C607A3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 03:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_9U5atxjmgZ for <buildroot@buildroot.org>;
 Wed, 14 May 2025 03:10:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32707605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32707605D8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32707605D8
 for <buildroot@buildroot.org>; Wed, 14 May 2025 03:10:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso70055085e9.0
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747192242; x=1747797042;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h84dX3jAqiwJNDHRlupIjhqf1vUMC3rX7o1VkBMi0t8=;
 b=Ig2noaKrK2NL6iXnEpySIHPFbpNt7f3B4noghENPxED0Gt2noMGjY8NnOo8+F5L403
 qKBJnM4uoS4eM0EE2wkqKQ7S+rWMxg/8II6VdIuwu8b48y4VcbAdUXhIp6FOaTFf+yYq
 lKxxbxNYHncGJu5S2LktB5nJ+yiyWAqEa4KjJgZuqcSH8KvzXS7OIk69Mxx1ihVkbO9o
 RZY2EpVm0XjfJZ4+W0/hoPo1jY/Qi77uwvi65LmctCcICuZPVFq4WdvfgErpi5Mblt50
 z2jA+S2k+MFD1icFcyVWqk7YTLGLCXzI/klqazojOXcN63MOWJjs1wUk3ITQVWasZacI
 1BIg==
X-Gm-Message-State: AOJu0YxoZ12+BmYtq39SYzhPj5IzyuYifgUNf7QF2tk0vpEFcht+uKv9
 NfJQgwETRPSYw1JjDbvFnpuSX81cwq/+1j36Er+6JvZ829x60f0YU3Nq4w==
X-Gm-Gg: ASbGncur7fvWcKuAF5XwRzUIaJr8dNPK5RZdpm/PSuQlx0Wcw+XiQtM2B6LFso9BUX/
 nwYKvTWjAwFMpuL9aRKUG6sDmLcPPlET9h+J0wldvqCevGjlK0sG576KhDH7KbHQ7A7jWthznK+
 weVpU3KIm0LujfXcjKFJSjlb2hmrPZuSz4Ca6ca66agIYMHIBv2RCUJlceopO7AUSJmKqzXkLqE
 AF5tuaDmMmWzVNImTE7YabA/biw6Vmum8li/aP07mFAf+F8rye4q93f2KLnOYOIKiIQ8Jit3lPp
 vcYrc5vFO6GzXePggyyYJO+XptKs8XOpOusU9ZwO0j6Nr5pNPRKMahk=
X-Google-Smtp-Source: AGHT+IG9zm/L6Prp9MtAP6bRi2gqrYtcDRUcdgwTIIfxvU62XIp3cOCXWfZj+AhiiTj0TNdaE4DHfw==
X-Received: by 2002:a5d:558e:0:b0:3a3:4b8a:9a58 with SMTP id
 ffacd0b85a97d-3a34b8a9ba7mr187359f8f.52.1747192241562; 
 Tue, 13 May 2025 20:10:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2fc4sm18363001f8f.56.2025.05.13.20.10.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 20:10:41 -0700 (PDT)
Message-ID: <682409b1.5d0a0220.410e.f5f0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 14 May 2025 03:10:41 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747192242; x=1747797042; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h84dX3jAqiwJNDHRlupIjhqf1vUMC3rX7o1VkBMi0t8=;
 b=MFnR3aJx92XpnpmbudVKML7rul7e4oJudeVgksCHmQMrJrr9v5GaKV72wheLWbli4p
 ePhh6PZm2WfCy68ltRr15ICPHJiMvS2PJl2dDqTo3+2U7loEo6KzEj8hqh046PDg3+05
 aE1xB+09vEUn9OMxM8sZMXnK1ugOp0VoU+JZWmVzulUTzpUz+cLZN4ARrUD1CUxWXy+h
 CEKOo4onRJnkVkCDCWSxnKhoS/WAAWsafOGTMj+8ydzKYDqz2jdjSyl3PudAzOUDagfL
 ESr5xihoFSHaimh9hMGwTp9Qx67XjGzDuHSI5CFeM5oowWxlcxpIZby+h/Nx0BYK6oBm
 jYFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MFnR3aJx
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-13
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

Autobuild statistics for 2025-05-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
    master   | 14  | 421 |  0  | 435 |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 64
            host-cdrkit-1.1.11 | 47
          host-binutils-2.43.1 | 40
                       unknown | 33
host-android-tools-4.2.2+gi... | 29
                    flex-2.6.4 | 23
               host-vde2-2.3.3 | 13
                      lzo-2.10 | 13
          host-mariadb-10.11.6 | 11
host-go-bootstrap-stage1-1.... | 10
                elfutils-0.192 | 9 
                  bcg729-1.1.1 | 8 
                  linux-6.14.6 | 8 
               libcap-ng-0.8.5 | 7 
          host-dbus-glib-0.112 | 6 
           at-spi2-core-2.50.0 | 5 
              host-audit-3.1.2 | 5 
            host-binutils-2.42 | 5 
  gobject-introspection-1.82.0 | 4 
host-binutils-arc-2023.09-r... | 4 
          host-oniguruma-6.9.9 | 4 
              jpeg-turbo-2.1.5 | 4 
                 apitrace-10.0 | 3 
               mbedtls-2.28.10 | 3 
                python3-3.13.3 | 3 
                   audit-3.1.2 | 2 
                    bat-0.25.0 | 2 
          cryptodev-linux-1.13 | 2 
host-am335x-pru-package-5f3... | 2 
        host-berkeleydb-5.3.28 | 2 
              libebur128-1.2.6 | 2 
                  libftdi1-1.5 | 2 
                 libsoxr-0.1.3 | 2 
          linux-5.10.162-cip24 | 2 
                 openal-1.22.0 | 2 
               pulseaudio-17.0 | 2 
          aardvark-dns-v1.14.0 | 1 
amazon-ecr-credential-helpe... | 1 
              asterisk-20.11.1 | 1 
                     avahi-0.8 | 1 
                  bcusdk-0.0.5 | 1 
                 cdrkit-1.1.11 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                  cmake-3.31.5 | 1 
                   cvs-1.12.13 | 1 
                  dbus-1.14.10 | 1 
            ecryptfs-utils-111 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
            gettext-gnu-0.22.4 | 1 
                 hddtemp-0.4.3 | 1 
         host-gcc-final-12.4.0 | 1 
            host-libp11-0.4.12 | 1 
              host-uuu-1.5.201 | 1 
                   libcap-2.76 | 1 
libdbi-drivers-0bfae6c43134... | 1 
              libopenssl-3.4.1 | 1 
                 libpng-1.6.46 | 1 
             libqrencode-4.1.1 | 1 
                  libsepol-3.7 | 1 
                 libusb-1.0.28 | 1 
           libwebsockets-4.3.5 | 1 
              mosquitto-2.0.21 | 1 
                 netsnmp-5.9.4 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
                    polkit-125 | 1 
         python-remi-2022.7.27 | 1 
                 sudo-1.9.15p5 | 1 
               syslog-ng-4.8.1 | 1 
toolchain-external-bootlin-... | 1 
toolchain-external-codesour... | 1 
             util-linux-2.40.2 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/71f10fac230831aba863db7ec4db529227a7800b | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4d116eb738d708e0340e5f244b1ce17c3f561df2 | ORPH
   sparc     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/8ad992de1f8ba3f56c33d29f46448ea1a2793ec5 |     
    m68k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/5f7611e9a4494f783908caf91cde7102ea2d6c8d |     
   s390x     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/679844a1bc55e7fe81547e9d6466ab07932ccfc5 |     
 aarch64_be  |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/121601ec6fc463db0b2a4ced58363ac1733be7dd |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/98ac8c284468a93488bcfd925eed6a4e70ad1599 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e3eba0981d321c13d1e0a1b782e991269b3ae463 |     
  powerpc    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/aa6a167b9905fe1bdd79162d5182654c31e3e4b7 |     
  riscv32    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b95ede0e9eabb415114a1c7ac7b8bb9daebd15b8 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/12b52756ecd48aac44807b1583b1c3f4271d907e |     
   x86_64    |          audit-3.1.2           | NOK | https://autobuild.buildroot.org/results/a9c65abce2eb7ec26f2215168e2b92d7d422574a |     
   x86_64    |          audit-3.1.2           | NOK | https://autobuild.buildroot.org/results/3e01a77c89177463a3e45e26b5af3a94a6e53dc3 |     
   sparc     |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/8d3288e5aecdeb2eb165270476f46573453960f6 | ORPH
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/8a87509409de80c893ee2612c01da39a5515d38d |     
   armeb     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/47ed64ce8feebb41a99ddd2719bd86faaec9a04d |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a819f5ebe1baf00c7f2a8968aa410c94a99e4ef6 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c1ba4b5b59781ae818f41ce7a257cead6d4d4052 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/4f2284aa93bb7781d18581601a428e62fb9dc225 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c0e9cf9f8213c69ff5adaa2f8fc6a1e91c997fd7 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/91047ccdc4866196a1fe4749558a014a5bb1383f |     
  riscv32    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f9e6f4606739ad311ac25ce46c65a6842228b68e |     
microblazeel |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/566095fbc2327f0227433faf783af0222bf4b768 |     
    sh4a     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/952599a0884f0724ee8075d930870a41bd139f3f |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/9d924c9ffb4f9834836c20b70239f72564b8ac04 |     
   arceb     |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/cdb95d57de1aa7d572921e95840235b011fd9c58 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/f29ee011e8f0231d7304f1346d2c2210ee742648 | ORPH
powerpc64le  |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/bc93b0d4ebc5b685f614dedb7b8a553b4904cd58 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/390c15eb8082479002d145f128d7ac8eaffee2bc | ORPH
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/68b49f481a9a07de0b3afbff018d47cd618114df | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/84623f2f7af3a3ed58182139e4b1f868b5fa24a4 | ORPH
 aarch64_be  |          dbus-1.14.10          | NOK | https://autobuild.buildroot.org/results/4b02a6a2bbe4955a19fb3eef3cfbd3c9a7d0d848 | ORPH
powerpc64le  |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/bc5d0b49c36177abdbbb7fc5a0c0faa494f82034 |     
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e1480662d7c465fc4c4ed9c3929578aa6c28f9e9 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a176c5a7c2b4b93a16e19e67075893ca8072d734 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3240ec9b2a67d1a6c1a2c17ec946e0937f64710e | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/990914646f441a8f450cbae014724dc6be719860 | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5c30dd4beceb354826174b56da0c067c815e8318 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b713a9c9c7e72e09b85435ef439a5292e9c44697 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b2f87be52b1f5729c461cb0f85b0b0e140750e19 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/97969f063010c8674ccf5c16f8aa2fa6e1ab4375 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/73061612e60afea1b57ca413d694a61a82e5d9c3 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/eddb1230a504ae5a6bd88d001469db86e7fd8250 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/231abc6ea0130064e68e41a1703d37d005988393 | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/808da659c6736f95791c818295c4e3a88b657403 | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/af49d5b918b6702e4024982246f1359bd7d0adbe | ORPH
    or1k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b2f6c0747de6de5f45b0e26cde81e417b55e7c6a | ORPH
   s390x     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/83154f8b2b7228a08ebd5f8ab46f5fb59b5b5674 | ORPH
   x86_64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/3d8615c86ba9c57513cd067bd5fb860f0f22dbae | ORPH
   arceb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/866432b428d6e42c386e4fcd6872c1e40a6331a3 | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/fbe8266c5ce4bfdf8eee8bbd89108b354c710b1e | ORPH
    or1k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/09067c5c64eeba881a27f9f3828f67faddf47e14 | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/dfc85742d002dd6fc6427ffd3f93faa9c3ea1ce3 | ORPH
  sparc64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/691b6c525ecf4449a5b1c545d052889913a0932c | ORPH
   sparc     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/c53aeb25120e74b413837fc13313a0913934d59a | ORPH
   xtensa    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/ba3a2dc68a73f95cb02414ce44163f51628ee0df | ORPH
    arm      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/a94dc07e78b8ac490a4595ac5765768548fd44f1 | ORPH
    arm      |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/443780bfb2b8ab5159dff6f96f6716106e85fead | ORPH
   armeb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0e5b11130d48dcf1de8ba6fa43ec1b01e0453d73 | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/12e122b99cf2437a34fda3611415b9ccb620ce3f | ORPH
    m68k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/585483a9dc74259f7afbd5c6783a0ebd22b5b72e | ORPH
  mips64el   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/fda7271c1bce3415d2bf9099284f15858c51badb | ORPH
    mips     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8b2c7309ba7c2780c297f320206d4a139b45dac1 | ORPH
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b698481e9c32c6df92517392294832186856cfcd | ORPH
 powerpc64   |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/700a6f395c5bcd417385079a4b5dcc7acb9202ec | ORPH
    m68k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/cbbd27025a104707af92202cac85670ab8a64d4f | ORPH
   arceb     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b3bfb0335933e3f2f5e40d31ef65cc5153d4aec8 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/007a630e01e3ee33b8695c30f7ecfc690b13580b | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5a17dc1b6bdab8d5eef6f39a9545fcda416597db | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/046a13bbd81af5959c6ca16fdd9ccec47370ad8f | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/6c1fe3dfb98fa606379b9d31042b529ca0dccb06 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/a2f1adb30b5eccfcb79de4c3e4862a28230b1e8b | ORPH
  powerpc    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/a7c7342ef6a7bd1ace5b604a3fb51fcf04579555 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/6a755d032578996336d7b38aaa666869675c25ce |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9495e2f78c53502022af316fae605d525ba26d93 |     
  riscv64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/12a3d3b08f7c43254636a3e2129cd64a1427849f |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/bdebacada5a7d924fbe2b004d38d92907a9e70ec |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/d280bc23efdb2ed5832a4e34186341ad6a2f9333 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/851ffea72997adfd5f19b052e8f0a3d326e6e4b7 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/c69380bd1e5314d433a1265cdf3660cac72d0ad5 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/2ba734fea3e256505a5170a6c6caf15a9933597d |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/a99ec4a0b50ea11f7226188dd383781672246ec2 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/effb4cd240d38a92a50c54cfd3a7cbecccd34a8a |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/0cbf3acc5ce2f3c6de862c3555961ce651070413 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/a8a69579432e95e364a2ff4dfba075f8d5e752b9 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/5f628ec5a6963c42b0487d6f2209dd145f71253c |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/0f5ad07c8c2e3bea6080e0ad8394fa52c148a15a |     
    mips     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/c0e2125d9d87264c97ba4b25e010f4c5ebd97d50 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/f050b59255d53330b454a90b614a8e41b7cec2a4 |     
   sh4eb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/a6743617fa4cd6ac70946e13014610842b863f17 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/f29dc5badcc0b85d0b68b340f3f9be326d65df54 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/d99fb73b5d6771d3642556158813763d611aadfc |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/2542ed592796868bc2f648c8985c3e4bc3717af2 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/7afe668ac9c7c9e96d1ed9edc16d5dedc1cec06d |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/633985c22988205218fda169bf601a05cfdb1413 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/f31062797dc2eed92445d601074006da833985be |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/1b0178606193488d8210ba0d1dec5a64faeee644 |     
    i686     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/49a376db90e4a7d6cfb15d12906ae4ab2cd6c0e7 |     
  riscv32    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/8b79d63d3a70df109e6f8c9992f0b91c4ce3a930 |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/ce7b7af15ed709bdaff2929c82ebd2288d068205 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/94a6bdaf19ccd75459240f8595f791a6bd70cb46 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/b3260309a9673206cc66abd349aafa53a3a3c88e |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/2400b6c597871514246596fbc9f81295d85c43d6 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/3a4943d076ede5caa8794177a9d956d61e849d6e |     
microblazeel |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/b8f3b618d60f99bda03ba0ef237be9ad31434275 |     
  powerpc    |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/9646a1dfcff8007a12a522bd37ab48e0f3f11fe7 |     
   sparc     |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/96ff8a61bedf62d1377c4b31847226fd01881ce8 |     
   mipsel    |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/70b481ebb4eda683dd943d15f3722777f209e5e2 |     
    arm      |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/00211f5977ce7ea1e285584c97e9fdd52f91be1c |     
  aarch64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/9999768975c2d20049e968ec6568d7aec7300d02 | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/3afeb994ba78720b99da88f21216b6d83f6ac4b1 | ORPH
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c6ea2bfe3e70f24cacc5a52c1c8512f0444ce86d |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/8c4808c77613a0176043b7afc6cf2c00fce26c58 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f024333a56c81fb8f1da9cf0de2b7d7120981b36 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/20fc367106067f22358c43be98b90e1af3fd2523 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a14a570b12df410cf1777e086f7a12eaf2a86458 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8e934c7c23d21ff200e595b03ac0a019daa9ce5f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1b8ab7f308a3756c0e365f0a3199835d41ca6461 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c5568e5538851bc8dd5d8194cceb61b70f3b4525 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/87d9a9e0ad014deb475ef72685b0ed40b75cd93c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c8d9337cedaa37180fe64d0bf494aa0a16180935 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7958f2d325026fd03426dc8e404145b2e62513d4 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/efda1d795d0518709e4fbf2b6da6092f9960b0ed |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cae0014cde7b3e7659b3072ceb59309f1f8d8840 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4c0badb0b8bea844872613b5d35476ba33104e1e |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/927ac541ad73daa4d3a5d59792d9792cfee44ce1 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fd9629aa97036da1acc1f043f138198d376a2275 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5a2d591b33eee09453f8ade5b3d1ef04ed9c539a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e8b4b716ab644fd48d7f69aee33a40b9b4047856 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/74c790c437c26c109603fd5922a7ee9cf36aa58c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9ea6454f70ad553dd16f96cd0d4af1d17f5d3dc8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4766d144bb4e577db3696df1a6313067cdf12071 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e1abc1c54ba698f7f04cc3a36c76f0a00938ce88 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/518d0cc475ae5bbff16d185b4fb7e165d49520d5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6514c2a768033fd8afdec4d84028b7db360f2119 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/18f761b641d6875294ca3f9fe045b461729dff91 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/00b2ef1a6bc06174e309714ae73bcc6e5e60ccbf |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c02c1dcdcb7b7e8b48a68084ce4539c44cca8fbc |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2f5471e0d4ec4c00e37bc04040f77d18e32d9be3 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4fdc51b6f0187958887274cfef74c989bacab0a4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/49cd6f0b6f3d07ed3f0183fd9627566b33a4552d |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9f3772e5e34e32090ee594dfef0fed05a25505f2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a87110d51d92a41060932bb5c79b2a6de18d201f |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9a8b6ea9738932f1b98e3c3bc2efeda904234b89 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f720baec2f6c0f72657f2b5ad0c359f1af2cf7dc |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/18f6f5da980b003258cd95388eef2cf4c5071965 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/713fbbe1f0a6c00cabdd443f646e9b8be58f010c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/91280d1372d3c8d8f648d8c506340c4a677c5392 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/167ef59c27701a1bdf6b241a01b05455e2d35ecd |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c9d6ff98bf4212e856e514aae1c5690fa6ba1526 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3ccc714af98ccd36b996c7544c8fcc27fe116ef2 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2b47e8c7027c6a7015b57699157a737152ee9cdf |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/14a97ebc519150e386b607b4ff8905dc599f600c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2fc23570904dba8f43a64a06af8cdd71b0d51743 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ba63c1542cc7011b4c35997cb68a483222ee6bc9 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/91b68b016f4575347c5a17483cdd02119319df4a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d1de4e44c38ba21ee7fef10dda52b082f2fd3b35 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4447887b19f97efd8719d99ba8e7a70c2b50a200 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e49e4ee83a96428b6bfce04ad9884c5dccb1c77d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ebb22a7ae4287dd57d7b2a81a2dd6809d19e5efa |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/4bfade31e155edb3d75cd86d74b2ccd4e87f33fa |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e7b218947f06c51a02b5ecb8d3267f23cc691d66 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/2e39b3eccea7f171298bef82125f296f46a9de78 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/87ac2439bccdf2acc236da2ff74c5cb1b5246558 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ba250c80831403a313d59c8248aa668e959bb097 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b08a0fdb2d14017172ddb80994d9c301a8723c24 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ca0708d0d74e7322cddb6d234c6a9ebdc7ec3560 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/62ef70e8ce57884875ac7f5064da02cf8cb7484d |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c11903b559dce765e730a203381cd3ed242605b7 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/96abd7bbf40cbd75c3492a58a3f94ef0a5643ac8 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/85976f50f8a534d6c2437b51eb8bba41df81d604 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/3fb80f9d0e73019c19f1b66748166962616ceb58 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7328e30451379bf03247bd118516fedf91287a7e |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/cd0927eb6ee386a62ead0937ef2ae1974198737f |     
microblazeel |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/6ee0f0eb4a965be94778e96bd9d9a910f5f85bc1 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ba854146fd7f0c9d2dc0c16599159a99a4cbd7cc |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9d3838d1881611f695d9d2d8b3bc9694124ce3b6 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9cc0201e8319acda6ecfbbc6d4a94576ad93f5e0 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/bf98e968cbf5e23f8ebd06e2d746c6b8a07a0a93 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/02a99505f24cf9fbb1aa0a362b642327ca922d35 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5edcf41bcd1b7d7b9d8888489b7b019106ae94c4 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f3094171f84584eddc3b89a5e746a7f54364b09d |     
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/a2f4cc1658593a20af5d81f822ebabad8f5ebafc |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ad00ac36b30a62236334e910d6eb6874a541fd15 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5fb0b130929e74046f831918e4113c90ad562e2c |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7e5e50fdf33ee0ac6962603778734ede3a617585 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/81fbf40b37c012b78ceefa5a7b9abc8c75867c48 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/edb8f0b369924dcb8ea0e88e13a3f6b6621d720e |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b302d9314e68f8d51acf9e677f071af1dfaf20df |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/a5bd08a3c4cefb82e7fc1dee68d52b3046881d15 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/ea13be4a651b0a3543a76afae9c041bc61dca088 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/485ef44c223c9be80314c686987a22316b72f715 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/27560c2d4e525804cfe34af0e29b3c4f8239e258 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/9a7f02410d0428a0dca836cea056d5b936f02b8e |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/3fcf6cf12dce6f4b55a0518ddb4a5025e5189ed0 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/cf19a1d79389df8640e783817e174c67d1830076 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7f9fd070b1edc4fd288d5ac64b2cf69ffbb23449 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/414148126bba7bc4a1d6ebf6a893aba601f8229a |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/55970658fe8b9dc55fa312238924339ec54de665 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/acca3cfec4db30b5a8f8bfaef329a36e5fd29bf0 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c71f2b7cbdd0fb8ab64908dd7a58daa8272044dd |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/5d42e3bbfd206c3e991ff55d6dd9503f7b9c000e |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/a49b268683107a1543f82c88275c88769f597923 |     
    arc      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/82fc8adaadc9ace64bb311e719165a2c3618b79c |     
    m68k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/81fc307ebc01454f9c5d95d17e72f111ad376859 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/f93d190a5e2bbfd30a566760c0f4b5aef4692371 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/7fc2bfa7ac850f28f7815dc528b7ba6e54d59a4f |     
 microblaze  |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/4da74091cfa0b614361fc4a337f29a6410e0224d | ORPH
    m68k     |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/12f81ec33d0d64d2ef98e15ecf8a025197365463 | ORPH
 microblaze  |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/4d171146d0c7e8d0d71d9a11d0e8b3765ef57b8f | ORPH
  powerpc    |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/a6998bb8d0435a718440ed394d277edf235c124a | ORPH
 microblaze  |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/650949b82e926ffa4ce4454289a479978dc8c8db | ORPH
powerpc64le  |      host-dbus-glib-0.112      | NOK | https://autobuild.buildroot.org/results/bc959464076638f1ecf7a6fbb37b050ec4da9f72 | ORPH
   arceb     |     host-gcc-final-12.4.0      | NOK | https://autobuild.buildroot.org/results/789bb59772b78202b5b2e352e438228871f1e79f |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/9723e7c07817ecfdcef5d9ba1953e21b7a4495fc |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/673422ad77200ba6f433d707d7a009fcef609f05 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/1018656ea4e12eef39115df6ef4e04e1c05067ce |     
powerpc64le  | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/a39e0f31ea43eebbbbd8e8508b75c98cafa182ed |     
  aarch64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/2213dd60e952715839f027d7e9d644c3b3d13c21 |     
powerpc64le  | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/8c1f00ef09c246db58a0af8248305461238a5b0d |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/e765d8f6adb7565c91180e329ee3eea17c45d1c8 |     
    i686     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/64cf07781fa9118fe3280562c3a1c84a58cde8c2 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/e2de3fa293e800678bd1debf8967da58d270c80f |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/fd7e47fddad472342ac6275f26b9f4d74959c434 |     
  aarch64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/824b8db719dc8a9886f93b34622d4a4bf0b374a3 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9599e940b56c62409089740d779607db9259327b | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/190dc511c20b6f9510fa116199aa6b31a83a7e6b | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fb496d4007f971ab8cbbdcf9f584ea521fbe7e01 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/89ff866a554221b02a668b0269bdc709a15ed263 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/24243013e89031f484f1f578573692dfb1f524c6 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5e038df057ed35740ff21a4c7d76743be8f216c1 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c3cda46689ffda819c0f715656aac123ddb21f2f | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7b9a2312a7658fa31facfa818f28cebdbdf61af0 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/990a109aefff41f8c3e1491b4a3a27f05d779492 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ca11b243081332608ed34b8c39fceb86e9a17c82 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/bacbfebe9da18178ee46cf97134fc3695c9dc85d | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1259e24d75d9b0d35b745f7860fa7701d853ea27 | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e25bc01d55b799a2e3b35b08b4f52f7594b27728 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/89b8761c9ce7e43787daab8ad510b80cb352a119 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1981ba343e55bb2caa0b2686b8aabd52df6be193 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8912906ac113847383a36abf4cfcaf23e9b5829d | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7e33e280dcbb64addf9030d6368effa152a3ba06 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/96ab044b39c7961563bf5ea6cef81b0e2f98315f | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3d5d3016e085b1f6eb57436ef0b0da33ac40be2a | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0a082a0593abf5917c5f38eda8fcb080218f86cb | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/971bfb7d2751410c4e3aaa5730d63559ccb64e95 | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e209aec344e0f8df3197126f0384b8489d0bd602 | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/28bb90e8deb5bde35e8b7872bb53741689317c1a | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/55f7cb58bd0d720c03e373dfced4ac1eb2a06a21 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/406ddc70c0119ec08bfec42de06ee523e57efbe2 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3075b6b8248fdfe63b4f67d4b04dd0b212682563 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7d98ea08f79977f0a39b3ad5be71fa59ed73e30e | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/43ea5159412572b4cf311db695b3521f634b79a9 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8a0f33ca0ad93950625578274064e91a34ef1398 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a80ff25f5f5c29ce638f1b3b407dc517c6e237bc | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4d06804f195f81b6a557e9de925a7db892557391 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/60ed60f95d5ddf15ab42701017c7f077dfeede70 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3c1b9dfbd23f12940422c399b2c51c062f452321 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/40b5346a7b432e876baa7a5cc08f3248ffa6aa8b | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/521d493a3ad9c57ad4ae3522393c94e9e1206d98 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2aaf4e2328c2e0b791a577969da775e4da921ab8 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/96ef391290208480caec96d62ba9b0b92cc7b485 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/998a383eb9c01104f315e76343b5e3ff09c96425 | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8a6b3e88683e8bb9bda58480c1681b8849765b93 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/2d2d8a3c7fe807d90854087e5cf913ae572fd7a3 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8e88bff3e8e9d2ac4d55e28be2fc7a0b5e8afd4d | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/263eb4bba9bafbf38a83acbd6b6579658266f00d | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e86a9d2e0c4ee5f0935e6ae6aeeaf0a332c86aca | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/38106dd45c4916522eacd2b23998cac5784858dc | ORPH
   sh4aeb    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/118d040bcb2bf808fcee215d86c59507e4f4d772 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/411651aeae2131a49644ac53e323a81e9f29fc16 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/adcafad0c78f771300c7f818e6909e396d2ba409 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a7a12971781947a43abf9769ade1b05022b4f084 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/858cd5b840f6fac9bd27ec79d38a60ebf4d87710 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8d251219cbb4b199b252596f002328f1f9623ba6 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/888468207ea7f6da0d68c8488f42d0143305f300 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/05f29fa1d483b9630a1b0fa6df36897e0d1f7e4b | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9f087cd9f41b6f1ad7271dcffec5a55cfa5880f7 | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/25357931bf1531e8e83adb7a094961141a388248 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/35515bdfd7048dd7cd9a35700fb882fee7e98780 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4609fe71b9d6beafdf31b0c6f0f880bfa8d0091e | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b190f6d97208cb6d249802664487e06fe64d3854 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/34ff65873a3fd339de7e4d37e349cb86b7a29918 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b40c0a8e274a5f635bf95db044a6717d467e30c0 | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0fcbae539bd85315058e7ed400ce3d65d5e9fd10 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a9220624e8102704f510df9f7124b1c80c780b96 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/3af084078bca7aef63a9a8fffa5d1a52544d278f | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/14c98ef28cfb198c738493b84804fe5f71ac4e70 | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9ecc0aeed9c3420a5db8d16a0910707d20e664b1 | ORPH
  aarch64    |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/bd54c1c48fca58ea8e1ebc112d01dce625f2ba88 | ORPH
powerpc64le  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/450ace08a44dd03b6625697fa585b7452aaa6b4d | ORPH
 aarch64_be  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/2c6cec0dfce4d0cc2ba7a7b817f95e3d60904225 | ORPH
    m68k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/44239436e9ab916bbc514c518880bcd6b28d0f08 | ORPH
   s390x     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/f038b85005ac24a8c4f8cdc3e3bd76ff6b3ccc8e | ORPH
    i686     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/8348a8bbe799334c185275e1923b8d0bc61aadcd | ORPH
  mips64el   |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/e89119fd84b0c0266208ef49cf92beb11ed80d4f | ORPH
    or1k     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/f44eed458d6af2876d2ccdb260d5ece1e7d427e8 | ORPH
 microblaze  |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/03fa2557e0579c094783e49a196ce5dca7f84e92 | ORPH
   s390x     |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/53aafd5ebde433f3ce941cd566cf1123eebf9b21 | ORPH
  mips64el   |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/337080042f7e2bb4bc520b6812d49053bb4b7f07 | ORPH
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e16669101f8e1513ef53f4fe519bfd13e58abad8 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/6a56110fa9df8f7e898bac87f9dad353d9bc4b44 |     
  riscv64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f7435235fb3d9d381d9de0b1eb5256a744a26f12 |     
  riscv32    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/8dd9ae5aef705ace3e9ca92a523e2aeaa1cb54ea |     
 powerpc64   |        host-uuu-1.5.201        | NOK | https://autobuild.buildroot.org/results/9edc245d0a03089812d631708a4294ff293a461d |     
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/4359e4e4d150a5133990e6d8a80bb4de17703bed | ORPH
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/bc8f340d71d62e3cbce1c7c642e79717aaf68166 | ORPH
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/0efe9c94704ec98c4cb50c4dacc4f7ad037f56d3 | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b2f7014e05790603432f7c5a6e737787dfb00d66 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/46fe48b7c0aef02d414a6b3e736f73ded7f326e4 | ORPH
    mips     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/915aa1c542d200a124f46b9af9ad677f5ff5f1b4 | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2eb3cd6ed7f351400cbd008578376a26173242e4 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/9d8ffc78393d793563e812560176f9d350b4315a | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c7721ef55d3ae1324668b8732e74098b5f1cdd16 | ORPH
powerpc64le  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/be1aea9747302bd27cf09023298d82800b3d0e70 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/79fef0b7a87151841cfad887d72efa1852fdc2e2 | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/846c0ca41da1fe6641208de69d90a9cd1acc44f0 | ORPH
   mipsel    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/eac0b2a83bb006b9e36037ef0c1853cd88ee3357 | ORPH
  powerpc    |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/9cdfb09f7d96dccb540c1e9029bc3c3a3a0f2288 |     
   armeb     |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/f365978ec34b764a9c89b93f73de8f9808a3ed49 |     
  mips64el   |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/5e25b9b925c5f5a65498dc23babb6a39ea99aeaf |     
microblazeel |        jpeg-turbo-2.1.5        | NOK | https://autobuild.buildroot.org/results/facdeec758c5b42b712d73882d2506d2ac5607b0 |     
   xtensa    |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/9ea190c4814e309cf8edd1003e07235f688f3e73 |     
    sh4a     |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/c592734205e13b42ce8190433ba37888705751a0 |     
powerpc64le  |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/95c2ef20df8421d0c103895c22990da366d37e40 |     
  sparc64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/94aadc10d3e89ac7731fc99a91190fb6bdcc99b0 |     
 powerpc64   |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/4ed8c7ae6f95e3838226df9b9cdeffa710ba4d22 |     
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/cd63dd1ff006d5fdfec780bb7668919263eb2f04 |     
   x86_64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/a79e98d2a055d6b3afcac28d37b23435c53a8924 |     
 powerpc64   |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/1b124c2a7b9739cdacd409c367365e08dcf2dad4 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/de1acf5a81c5553424b7106705886320be111954 |     
   x86_64    |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/a4a567a265d32fa1729d74003d9af8cd607d203b |     
microblazeel |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/0f0a1518ddbd467f0be2092ea2049c8ff0e8edbc |     
microblazeel |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/188811e73dd52eed3c66d7efb590165e4340fc30 |     
 powerpc64   |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/8c57ea8a2d99a7b55350ef8c997e9d765d17f342 |     
powerpc64le  |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/1a4922b561ee41c0aed77dcc015b12a840a8583b | ORPH
microblazeel |         libpng-1.6.46          | NOK | https://autobuild.buildroot.org/results/a43eb563acb10cfa0d2a57ebf7b174e2bb122e9f |     
  riscv64    |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/e55669507d29309f263a4eefaf36c4f7389226c5 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/63c9a3e71d1dfa3f98dbbef67593a7a744537dbf |     
    or1k     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/f9ba462a23d28438b3a4a41c0e68f61d8c5c0895 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/20a908d8881843792322cb7e45cc6a6a50125aa3 |     
    or1k     |         libusb-1.0.28          | NOK | https://autobuild.buildroot.org/results/ddacf9704960a7130bc117a86262a5db2bc8ffa8 |     
  aarch64    |      libwebsockets-4.3.5       | NOK | https://autobuild.buildroot.org/results/1ffdbc046502045de199f07af95ea5a6acf40b5e |     
   sh4aeb    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/2ac5f7f123b25fb5afa2341635d61589ce98ad32 | ORPH
microblazeel |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f7a06a0f67f1491537fe943360e28e0b577554c1 | ORPH
   sh4aeb    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/95271f3a489bcb81cfc3c2c171ef00b00ab60af5 | ORPH
    sh4a     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/bfbba335cff635ed667a51465d9ed197a9a0607a | ORPH
   sh4eb     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/e241d32dc6f57128d59f82376b2cc2e5c69439a9 | ORPH
    m68k     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/7cce7b28deff73cefd5a26bd7ed72bee1889acd3 | ORPH
  sparc64    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/1df90916780f841fa917c0733cc9169a8a57eb1d | ORPH
   x86_64    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/be20ad4c33e8221d356ba1e3b10c8e569e49a388 | ORPH
    mips     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/9591f82215133e0db32424dac90a4a610cc755f8 | ORPH
    sh4a     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/7f6d83f429b7aef550a3ba80f1922a89adeba5c6 | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/f546815c8eb13d576d7d3934377343696028ec56 | ORPH
   armeb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/6d0671058531c32e699b98e907db177b969594b1 | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/75107a6b18aa53b2956df55ee05401df752fe73e | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/92049d1a482678499bb134fe353852688df3cc58 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/c244f88daa22b91afd4f1e08991f7e4b82c1bb91 | ORPH
powerpc64le  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/74251c6c3f0fc889a3bbf0ee2b72eaa9b3a13d1b | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/15b3f906518ca6a0b8d906d06ebe4ba9d8a4c6c2 | ORPH
 powerpc64   |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/5a9782a3c2e66609f276075981d7b95a0ef0706e | ORPH
   sh4eb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/12c97fd324e5334387a8984624299cfd99c1c618 | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/c577f43a3e00ba62c3867e01326e6dd1a3ac125b | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/c21e56fbabe4559dfa561ec9d01880500c525c85 | ORPH
    or1k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/72e6af3a0d8bcd2efdd88f0de8068a40954ecb5c | ORPH
 microblaze  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/b67452e2f038c394e4bd9cbb96fd25c1636dd468 | ORPH
  sparc64    |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/91fa5abb5e61b4a4a59209cc770460406a3e1318 |     
 powerpc64   |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/aca25596278f9bf34840b81a2a37fbeccd38881a |     
   armeb     |        mbedtls-2.28.10         | NOK | https://autobuild.buildroot.org/results/7f13816f4ec391e9adf2a8e14569dbbfade909d3 |     
  sparc64    |        mosquitto-2.0.21        | NOK | https://autobuild.buildroot.org/results/f3530a1ad1e100766acb305177343b6a3fd191ac |     
  mips64el   |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/b3f7f3457ff69d82574afa6963c224606238bbd3 | ORPH
  sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/070205a1e1ee0da829cd350024020b04be207a57 | ORPH
    or1k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/63bf3a011b316ec72e4afd09625b67ddc7390f3e | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/d061b86881f8811873562b8f89839b871a0deb70 | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f33ca660eb220cd234f5947fb4a1c241204221df |     
    sh4      |           polkit-125           | NOK | https://autobuild.buildroot.org/results/5cce87d5cf2606355a6803d196612517a5ae2586 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9e5228e41c79d032e1f3bf7ddb7f754ea1431f91 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/13a25c95458aa4c6c12075a5975f33dd322c82f2 | ORPH
   mipsel    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/332ce8c95f2a89ab986dbc7d88c1c5e0f16dee6d |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/1aa31a767440fdb0494b9f874f7f8e4f24188ff2 |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/14d52dd175db6a7a87aa14415ba56c1ed6b5579d |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/fc5c24cd838b7680ce6a3ed83c2495019c654344 |     
   sparc     |         sudo-1.9.15p5          | NOK | https://autobuild.buildroot.org/results/86e4ce9c185954bb08b799fbe2f199626ec88df3 | ORPH
    m68k     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/5ff960b10b85c74d4b00f1a59a9663c07b2a412b |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/8a318014037f4f756564326d3a54e4896562c747 | ORPH
    mips     | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/4b22fd700d1f3e12e111b9f1e1e6864df09532d4 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/06915ac2a56ec6e1ba4b9d872b4328366fa72a74 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f18a2121caa4ae476ff3a1e6c22dbd15f7deae57 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d393232ba87dd36369ae15c840020af41e60eef3 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/dbd9a7e06e90b58cff9ef3bc873c3bbcefc952e2 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e7d899f724aaeeb2e04f1a6f62e1a750e1779cd4 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/6483604b37c81a0c101d5a2a45a28e038df8ce73 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/85c7985aa7976374d5ad712fe117e00911bedaec |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/94f7391ca24167d6867b9d857f0ef206e6716f55 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5d08e4c2c6b950bb0de4f15ac6bd29ce105cf759 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/dcab58ac38242ae7174a4693f852e3db41d4e132 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b57cf3a966e9823fdc3bb6397e4d840822e94d25 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/4a58efd21203a35efe3e3bdc2b190bcf6534e816 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a711045328832f3370aea45b2bd9f8f8c88203cb |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/0c6a846ec09722365d738d2d1e6a49a0a132537a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a140a62a72c008f8c30c7866988de9076d46967f |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/68c49d59ff8178e18e3bf7cd9daa834e32c138c1 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/f15d9821e5f7297ce4d5a5fc4fc48e8ec5f3e5bc |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/d8399410564073e7f5e1c0ad5cdac5b6941f1ce5 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ad19895e0ab4af54a5a46071e9ed7371e80a7915 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/74a854ffc275c821111d959dab534fc98500b5a0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/6549bef165c4fa3b616766a3c9973f03d92087b8 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cf1caf47020552648b20300b90a30e19be72b60c |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7f0cf66375c02d9bd9ffbe8a83440c8b5a79cd25 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/8f038b8f58664f85367f872ca660e4868f900f83 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b54e550a784c88c800f3ee41c78e08203f621d4f |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/63da0140be8fd4cb13ddf9cc06892d481155ee16 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/331b765795bffed48b3e22d74ff897e9fd1e068b |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/7c48f84f4814fce341fa3effcd2196b2892989cd |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8b4d7c4b8ebad15cbf6f17a46888fcd0817e369a |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0bacb6ba8c09701e3106d9e8019aa5927dff72fe |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b7214ac56c32b4014c725a0eb1c8814778dffb0a |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/6f88c672d81c79ea124cc2faf9d007f2cc653aa0 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b5a7cf1f738ea4d4aa13a6d6d04d401bb2d8d02f |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/aa8d1ae4665d15a7d01ea3d6fe3c85922a734909 | ORPH
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/5a8a374004b3b390b45bb9bbd478070e103f174e |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 3 
                   iperf3-3.18 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2e346e50da9431de53f8530391048079992604d2 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a21011aa695881fdf0892920e4a3cc33ad5399ed | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2cf07f07bfd7bcace865f486d2dba1eb28e53c18 | ORPH
 aarch64_be  |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/50d1c3d877b0d039fd699d5733a95bcad381e014 | ORPH
   mipsel    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/95e3e6276712134c8deb2b45513a6beecdd9734b |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/51724787d25c059fa2c025a22719bbe8cd64a2b6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
