Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58D3CA0EEB
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 03:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662A2610B1;
	Wed, 20 Aug 2025 03:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfBimR5ZVrWq; Wed, 20 Aug 2025 03:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6BFB610AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BFB610AB;
	Wed, 20 Aug 2025 03:19:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBE3CE87
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 03:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E0906109A
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 03:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3RdwGH1Lnnn for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 03:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAA7360B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA7360B29
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAA7360B29
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 03:19:45 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61a8b640e34so2090064a12.1
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755659984; x=1756264784;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bqsqwwh33HQxyV3Cx3pggNWcQtI+JyzEGoQupFNNupI=;
 b=LoSEa6gtGqnA57nUY+V2FaHhhz09j3AkXKW7/GVOn5dhDn2dogGWdBRMRjqpIFD2s2
 kheSzvwiq0voGz6KQNAPATgfJa2YrkLFb8SZ845KxuxRyZMC0vismAivZXzJv3qpfzlS
 /mL6G+4PEsP0VZ+B9Z0oSwr9IZ8lP3TYITy6oI0qHi+x//ox8PIRRqcg7YGKHbjAFHeC
 DY59SjiVexCiRKcYqnwRHo1X9F09RM2Xw7jD8sC0X7bhw0rLYWVfpoh1tHxmebR4Qy1U
 mCIme2ZpVciOTuD3DasruPZ3Grn5Syk75akLW0HnXmi6n3eORvmy08hU2d5uBzPfjxhM
 l1bw==
X-Gm-Message-State: AOJu0YwtNtZLpbeAWHWH5QVBHtmC173owyI2b4G2EOATMXfugr8BgYFS
 JRcGmkSohFuaijSKVzllYRzNMx6RwIZ94tUjjF5kVTMdJJwmlw6LCJCHrAfFbw==
X-Gm-Gg: ASbGncsdmC9zYQsmFT4skdxAjGGLHxmCRDSxsSvn3a1Xgg5LWDjLXT/ksL73dZVvpm9
 q62rgkHKZianlrvUFRZbFep5m7YHPx/rBqi8tdQlTgE2qi2lD5E34dMIpFR5kl5FRKnpAKPEzKs
 jUtD9978uyBlkoY70fGLesZdpYZvXrwvkxsWHw5R3A21dWV0OqNT1og853i4L27YMHe/tyJdPji
 /2WhZ6lZJY+5y/X7AVFEv33gnaQoOf4Y9rGpAApjZ6fmvdq26oaLNJ1BIrMUpUPHePSyc/JCHvH
 ZmWfMEV0hpwTbonNpCGPqzBAQOfzvcO23ch82MXYD/ApezQ8jqVeUDVDOfL9RE8rWZ58jVaTEEk
 UIO1R/5ar2qNvz2tL9ldCqX17ZQ==
X-Google-Smtp-Source: AGHT+IH3AtzA/uVcb1dtKUEUIr8SXwDKFNeWfGPmZihyuuGCY5oLKGACN7FAIOYiWt3GWxrt3ml3WQ==
X-Received: by 2002:a17:907:3ea0:b0:af9:38ed:5b37 with SMTP id
 a640c23a62f3a-afdf005e43bmr88032566b.6.1755659983435; 
 Tue, 19 Aug 2025 20:19:43 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf24bc40dsm45110466b.109.2025.08.19.20.19.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 20:19:43 -0700 (PDT)
Message-ID: <68a53ecf.170a0220.59dc.0c39@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 20 Aug 2025 03:19:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755659984; x=1756264784; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Bqsqwwh33HQxyV3Cx3pggNWcQtI+JyzEGoQupFNNupI=;
 b=JjFRnnSt17IxlzTpf0Rr0prSx5TwKiSGPW8fyx8ymnkFH4X+ARjK/dVhxyopuQ7VCM
 s6Ljzfj9Svk+9EASns1Spm7n/KmDOZiZE/RwIxJem4R4SR1TyQSDe538pYK+CGWQfFR0
 SFj2TasirvNCBoX/tOfTBjv3i7eCjrL4gOzk9NVp+yd35xflvjJyVaRxwe1eTf4LxDKe
 TKH0aJaLwBjTus9+vboVk9D6GxbnSyoAVYpMIYAGrydmpkNjsoUbIeskIcZxGEpFUERU
 4HEsXrMZYtiJpAJd5MaXI1JikfBtugM8d4xG6EpqcZFa1QtuADU+IGZGheXdpvIAh4ct
 zSnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JjFRnnSt
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-19
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

Autobuild statistics for 2025-08-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2025.05.x  |  6  |  1  |  0  |  7  |
    master   | 23  | 125 |  0  | 148 |
     next    |  1  |  9  |  0  | 10  |

Classification of failures by reason for master
-----------------------------------------------

host-binutils-arc-2024.12-r... | 5 
                 host-gdb-14.2 | 5 
libsvgtiny-ea9d99fc8b231c22... | 5 
                       unknown | 5 
                 logsurfer-1.8 | 4 
                   perl-5.40.2 | 4 
                   cvs-1.12.13 | 3 
                elfutils-0.193 | 3 
                    gpm-1.20.7 | 3 
libdbi-drivers-0bfae6c43134... | 3 
        liblog4c-localtime-1.0 | 3 
                liboauth-1.0.3 | 3 
                   atop-2.11.0 | 2 
                  cairo-1.18.4 | 2 
       freeradius-server-3.2.6 | 2 
                     gdbm-1.24 | 2 
                 host-gdb-15.2 | 2 
    host-mender-artifact-4.1.0 | 2 
               libcap-ng-0.8.5 | 2 
                 libjcat-0.2.3 | 2 
                    linux-6.16 | 2 
              mariadb-10.11.11 | 2 
                    mpir-3.0.0 | 2 
            netstat-nat-1.4.10 | 2 
                p11-kit-0.25.5 | 2 
       sp-oops-extract-0.0.7-1 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
                    sslh-2.0.1 | 2 
        vulkan-headers-1.4.317 | 2 
android-tools-4.2.2+git2013... | 1 
             batman-adv-2024.4 | 1 
                     bc-1.07.1 | 1 
brcm-patchram-plus-15bd6638... | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
                   gssdp-1.6.3 | 1 
          host-gcc-final-8.4.0 | 1 
       host-nodejs-src-22.15.1 | 1 
              host-rust-1.88.0 | 1 
               host-vde2-2.3.3 | 1 
            igd2-for-linux-2.2 | 1 
                 inadyn-2.12.0 | 1 
               ipmitool-1_8_19 | 1 
                       jose-14 | 1 
                 lcdproc-0.5.9 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libjwt-3.2.0 | 1 
                  libnss-3.114 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libpng-1.6.50 | 1 
                libshout-2.4.6 | 1 
                libsolv-0.7.30 | 1 
                  libsvg-0.1.4 | 1 
libuci-f3fc0b76040685829191... | 1 
          linux-5.10.162-cip24 | 1 
         linux-headers-5.4.296 | 1 
                     mdadm-4.3 | 1 
                    mosh-1.4.0 | 1 
                 netsnmp-5.9.4 | 1 
                 openal-1.22.0 | 1 
                openssh-10.0p1 | 1 
                openswan-3.0.0 | 1 
               pcsc-lite-2.1.0 | 1 
               pulseaudio-17.0 | 1 
            python-yarl-1.18.3 | 1 
                python3-3.13.5 | 1 
         s6-linux-init-1.1.2.1 | 1 
                safeclib-3.7.1 | 1 
          sphinxbase-5prealpha | 1 
                   thttpd-2.29 | 1 
                    wipe-2.3.1 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/ecaa4c7af6c9c95dc4d911ec8f92fb69ee64dcc8 |     
    or1k     |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/2f85af4140970a1bcf68ae3e5e9caa0fad72052f |     
  mips64el   |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/8e53a71dbc242b8e6e2a961c4a10eabf80bacd0c |     
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/1fcd6588a41b79b7f2884d69547ff5116b105e91 |     
microblazeel |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/5762f555068aff0a1c5656182ae22a26d5e3530f | ORPH
  mips64el   | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/1a41e41370d0c7e10aeabddb5295a3ec5f03ae6b |     
  riscv32    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/98fac06285b121de1f9c18d4d0bc8f5603fb246d |     
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/6209a5084e0109cc842aa05ec3fa93e0b6a3c5d0 |     
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/050ed88a075cf26fb1833643bb342746bcdfc4a3 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/bbc03a1d416c2fa60c631422da0904a87153d745 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4f424bbbcf1584b86010d05a8b33b63b2debd3df | ORPH
    i686     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/4a75b918faadd6db2e7c1216310d14f2e9eb093c | ORPH
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/dbb64dbd63a9702c2d99552bc1594f445863a8d4 | ORPH
    arc      |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/603d576767b944fe6566865da55efb061188125e | ORPH
    m68k     |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/ec2f0652d427e6337e9b7cc63590080f5d8353c7 | ORPH
    or1k     |         elfutils-0.193         | NOK | https://autobuild.buildroot.org/results/94588e4086193a1fb7ee3039769ebf58424393e2 | ORPH
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/9b3486126f50f2b06b1f88c8c92441974be96c7b |     
  sparc64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/cf102e9121addfd9d2bb823c324c90ae4cb240a1 |     
   arceb     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/f9585afe2a65f01ecf85204c16e88625b619903b | ORPH
    m68k     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/69b78788ab507feabaa0760e609fa5388e39a1b1 | ORPH
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f4c2d5092952f7897403a951807295cbd7939d9f | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bcf51f516f2f131b91811b81c4655fe441d2e1ef | ORPH
 microblaze  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/e62aa8d382e14482308b6a14f2344a1bece6f330 |     
   arceb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/319cdd984effee595865275de8c36ca6a70c4fc8 |     
    mips     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/bea72b6da1ca64d9c67015fefe1dee3fefbc2fa5 |     
loongarch64  |          gssdp-1.6.3           | NOK | https://autobuild.buildroot.org/results/feefcfe9a601eb2be3d8ac4d6e283910e39afc49 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/9d58b6eace215e6694c30eac29038e69eb6e8669 |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/5c33656d97a2557b1bbda3dfab25e7817c74892b |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/c02cfe0007d1aa7254a7ac019fa42ea2e8f6bbb0 |     
    arc      | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/8929e09b92e7e781613bbe32198413faca29cc9d |     
   arceb     | host-binutils-arc-2024.12-r... | NOK | https://autobuild.buildroot.org/results/3191a8422421e084ebc633c6e4b99b947f320d3e |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/73a1483c06221795c02ec364b8b44cbb94a1eb19 |     
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0f0d7268599a288312c6eb5228075da6f7c1b9a0 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2096e05689025cb34bc7b3139ad005b1f464b70d | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8b74d6703e96bc3dc4fedd554472b11c1cab8ef9 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/36c4d398d45e07c11422cf681ce59ea9828ed7e5 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/dbf2b7b0df00e9afafea827b3cb7cf62bbf78754 | ORPH
  aarch64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a91de01a24b0377532c13dc248d445a6ca7fc98d | ORPH
  sparc64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/db9d5dfc3a623a77cd6c11742d219669257f79c4 | ORPH
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/5bf20bf0c8db917c4bec62f75da428722a9d626d |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/5549d4a9f73866e72965286e2d8c1c373eced677 |     
   x86_64    |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/1995a0df1a67fb2c8e6d84c76cdd08553d3f64c1 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/b9b739ae755d07d1182dca45eb06bf3e1fd6cf27 |     
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/4a7bfffacb1fb6668e3115c9a4c749766ceb3d7c | ORPH
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/cc6e499f013412147b9d5c265c2bdde03c0e3809 |     
    m68k     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/a26b23b7137b6b8db68ab316d47128a048f76387 |     
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/6fbcced5e6be526b6ac4aa2cfc52982d9fdff2b1 |     
 microblaze  |            jose-14             | NOK | https://autobuild.buildroot.org/results/8f074a62844ea466a45e2e80429ddd0a08298980 |     
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/eeece4e6977ebac630e7af751bb015a8ff2fe6f0 | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/6f22e699deb05adb6f7da4d84d8785a68e05438e |     
  riscv32    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/6cf5ac5f7981720d97d499a9657c8e99811f4328 |     
   arceb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/340da44a7134ffb4fe1fd54f0f11b5a58837e759 |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7c6513dc3b2a6d5b8482bda245b7e8e562283c5d |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/782490534bad1e504a5e3a4ee4ac79091936e267 |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/a87c88d7233ba979ffba5c59ffb9395acd8902d5 |     
  mips64el   |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/813ab4539eba0eec83dbc947f9c39ead67624f52 |     
   arceb     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/af1faa5557161f0fb9442585d760a2a816126b57 |     
  aarch64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/0a93ee427031411bcaff8586bdf97a80e6000bce |     
   x86_64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/5bc60c99e23b767b150954a6a8a181f8dc3845aa |     
loongarch64  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/13b1de28d830e579c7157d0704e6436a821524eb |     
    i686     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/c0b3acc9a88901ef30bbde26040dad403c17aa1e |     
 aarch64_be  |          libnss-3.114          | NOK | https://autobuild.buildroot.org/results/4f223a43e50743516154a8baef4f44553c294123 |     
  aarch64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/19117ac9df286f497360e9891755236ea9c58f76 | ORPH
    arm      |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/6316195572e37d10de6ea2b23f6735d77eab20ad | ORPH
  powerpc    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/866916db184227d132530a522d89de5bebab4b6e | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/882c9bbaf32b88419a10fa14f6c68ddd561c7e85 |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/92db19026581a218bccc94230677f31e697ba9c0 |     
   arceb     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/c5ee6d41e88926217745ee2a869e1b6f116858b4 | ORPH
   s390x     |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/3a99cc369b47d1cb91ede1a521b5fb6a39e665ad |     
  mips64el   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/00086d48dba0e74e3334e73e74e11301e1895f03 |     
microblazeel | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/4406ba4e5ddefac658ea6e08765449db38938d06 | ORPH
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/4f73e0c96f130cbc6dcef881db08e625a978faa3 | ORPH
    arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/e99777f6c7356f0e3cbfd749c65f0256f59a3d3e | ORPH
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/11fb38e7e2ee25f79566a826744cf06f32dc14ec | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/8d8fcb7a8cc63c6f56c2633b5659e8cec865515e | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/c1696146b35cef20cf3ca76f8aae8e4a09b699f7 |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/14354ff81c82989387c2c7c4ea4f6266bcc3b01d | ORPH
loongarch64  |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/57db7587e48825a227c8122d355c2618f64145c1 | ORPH
   s390x     |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/80ccf0ece0c0d95be0d7e22033607a0ff585b1bd | ORPH
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/10ae2be7ec9718eabdcb2fbf8ee176f4b5360c7b | ORPH
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/91d4b4b229d1c4af43849bcc730e027da3bdc8f7 |     
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a75e72e43f5a4d538749c5a25ccdba0a79c19b6d |     
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/44432d00c3cf1ea9e6e93b301d796db81d11b2c9 |     
microblazeel |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e3b588726c4880495e77d36b0514a2976ff405ba |     
    i586     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/99e09b677fa6a074633045243a072c1fd3aa6a65 | ORPH
  powerpc    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/677bd98d78d9b5a858249518d6c8c9c6b91562ed | ORPH
  powerpc    |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/278afdab0122a966addbccf6d3b9ffafdce6d0ea | ORPH
    i686     |           mosh-1.4.0           | NOK | https://autobuild.buildroot.org/results/c1cf4568c82deb118aad0171bda356c7f59f17dd |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/62da134b42a03889336aceb1eb0a6993f2661d31 |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/14e275e28475987d63bb8878bc8f58b6968d1654 |     
   mips64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/3ca8ae12decec43738d9c1d8f2597b29a4c82b4d | ORPH
  mips64el   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/65abf4a9a024ca49f0958e4f734f4bd8ecb6a07a | ORPH
loongarch64  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/3bbeeb2086da16769780e662d519b4bdbb31538a | ORPH
   mipsel    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/020e0ecddbdda44b7f52442a6f63cc0fd641c37d | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/7b087e2d6136d33106cd1ec7fb121d6b6426d0d0 | ORPH
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/0366c60a3a49e4b2835829a239106bdbfd3f323a | ORPH
    arc      |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/78218467a5be83fc7b7c13fc6274f31212cde7bd | ORPH
   s390x     |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/760df1a8c21afa893ade5181ce797e14c1f6bdce | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/7f251a8afca9e15ddf7058fa682fad42be903db9 | ORPH
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4e57a6aac9552eae57b8b59d4d888c0cf1487f4c |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7e4e86b455aaba00e98cbd8924ed13daf8c385b0 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bbe8ca4dabe902d8c6e4ecfc8c134484a20bb7be |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/cd2c8a19afc301b4bc8ed03511d298a797d8b914 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9dcf40f6bc74ba6553e28ea54a49edd8ddbbd9c8 | ORPH
powerpc64le  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/60f7a3567f816bb86276790919699dd09819e3cd |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/8d1302d17e649b8b2b29e7e77c4dc064fb263bcf |     
  powerpc    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/560c9a9908d6d0cc8723aeddf47945d4170d738e |     
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/e6a200ae72af8898c0427f5ce79b9cfa500b95de |     
  sparc64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/b6ad6d6352ec60f4f25b885f98dac4d25ffd6974 |     
  mips64el   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/59680e6617d1f2152d15150f544f9a6740d23f46 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/235bd45aa35c7977b3a885cb8c7bf58d3982d1b3 |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/c0fb301cd608b0ec9a2858d1d577bb47ab382fd2 |     
 powerpc64   |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/496c0cb0dd3c1e64396291c3b1b309313ede3777 |     
   armeb     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/84f81337617fe09f1722dbc94351b3caccfde6cd | ORPH
  powerpc    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/a4ccb5b12a6e8d9a31a8cc9f245e750b84f32dfa | ORPH
microblazeel |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/aa31e9769e624b8daf97ca073055c4a6fcc7e0e9 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/638441e9ac23169149773a7fdd6c9f25e128448b |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/e21ba4f8004624a52b891860ac7ff2045d498c29 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/41627e0f853b0220dbb7249e5276cb43bdca638f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/c9e41f44a8f126e88f1c41f01e8d42ac58bad7ec |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3667dfff0ca9ffc9a085f642699d62cda4d678a0 |     
    or1k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/02c641dcb2a348eaefc0d892cbb2e41520abdff9 | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1220e78a922edad78ae8b9643ac51109e58ecd03 | ORPH
   armeb     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/9d4e2f156d76e2acc83e3a25adb5e5cf0705e7c6 | ORPH
   s390x     |         wtfutil-0.41.0         | NOK | https://autobuild.buildroot.org/results/e70f4eafa01173921ff154e422aac7d10f075b9e | ORPH


Classification of failures by reason for next
---------------------------------------------

             berkeleydb-5.3.28 | 1 
                   ccrypt-1.11 | 1 
                    gpm-1.20.7 | 1 
                    grub2-2.12 | 1 
            igd2-for-linux-2.2 | 1 
                liboauth-1.0.3 | 1 
               linux-pam-1.6.1 | 1 
                p11-kit-0.25.5 | 1 
            python-yarl-1.18.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/e19830bc7aaade9bb4a13f828573d25bcb06987c | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e78858d3d68406358383d24015a6d92e5606b824 | ORPH
   x86_64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/8dc97cafa96ca032b167d4a24844657fbffbf452 |     
    arm      |           grub2-2.12           | NOK | https://autobuild.buildroot.org/results/7a4d0f0571cd0cef1c87f3ef207618de72c1c78c |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/5fd89fbeafd9677ca49f330cc6d1590b3d5aebd8 |     
microblazeel |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/5e2c01a3803eea6208e78326f112567e7c219411 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/02c9d95f818bd50c73dc086a6d747dcc83691c4f | ORPH
    i686     |         p11-kit-0.25.5         | NOK | https://autobuild.buildroot.org/results/6f6e23fc3dba48236a7e6a8da71a58d05d81e2f3 | ORPH
   sh4aeb    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/e22f0096f8c81740ce5b43ade2715ee751602bef |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
              host-rust-1.82.0 | 1 
                liboauth-1.0.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e7bf521797d0e4154385e83a20e60f490eff67af | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e11b220cec6aaaf4f716a70c941d6265dbc66ce3 |     
   sparc     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/3fdcabb4d959378a0f39067f6812fc8dcb049a33 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

             parsec-tool-0.7.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/61e2ee60698945a6c92fdc80907a04cd5b608bba |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
