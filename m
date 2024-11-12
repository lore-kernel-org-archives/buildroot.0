Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BBBD41D50
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 04:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870F1802CF;
	Tue, 12 Nov 2024 04:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vL64HWEyTQK; Tue, 12 Nov 2024 04:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B46B80401
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B46B80401;
	Tue, 12 Nov 2024 04:14:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0C84DB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 04:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB14D404BD
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 04:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeuzroRhXmOu for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 04:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35CCA4015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35CCA4015F
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35CCA4015F
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 04:14:26 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9ed49ec0f1so886867166b.1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731384864; x=1731989664;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2YZctXYuGu2zLrzGdLyWnsOQA1y6yTIwr4lkyNe+y4s=;
 b=Ncsym8qFGZItJZKs0/AVahWEhF2xE/qnrwtRvBT4RUdkHuSYPcaft/ZHvT5tF74MYt
 55UWwDwgkAAR3eNGxihLPqze+/xwn/ddl9LGdNq/5oY9Ww2bEo1l6i9nqC0XIsSa94l8
 oSWGzB+C20pHrcZJalFryvJ6K9xYaDqHwdRdcastgHvGGOFhkXQ/793GEXLGNKIgf7i2
 rVNQext9CALVA99v2Nduh73QukVDZLhBtRRiiISpgsWiVWiso4CaDUJ2XPo+c2a4x0ZI
 Hc297tY1eBO6LSVGxhDJpjRL5fiksCIbun3Nk+osJj2m+UmlCDZPBvGnHNfwjlWeBCiX
 UVMg==
X-Gm-Message-State: AOJu0YzWVvEm+3bV+Ta1sdwKm9y++hQRGArw74be+DvY9fCe0By6M/17
 gmp7azE2WgJSldR9ot9TBVwW/XmGoxXue4LHyHoAUiEW/mVP3E+yGgCT0g==
X-Google-Smtp-Source: AGHT+IHXpUMRr3h89Du31RkG7kKMFmQS/rMbpkoZKquI3cGKmtQFXKULhsz9A+JCx+sV0E7bEii22g==
X-Received: by 2002:a17:907:3e88:b0:a9a:60c1:136d with SMTP id
 a640c23a62f3a-aa1b1057c15mr110395366b.22.1731384863659; 
 Mon, 11 Nov 2024 20:14:23 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4b5cesm668131266b.72.2024.11.11.20.14.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 20:14:23 -0800 (PST)
Message-ID: <6732d61f.170a0220.c1e0b.63ed@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 12 Nov 2024 04:14:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731384864; x=1731989664; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2YZctXYuGu2zLrzGdLyWnsOQA1y6yTIwr4lkyNe+y4s=;
 b=Pov0vC4Z3So4xeNsH0heMZbpiHUUveI+2OU6ZXwokq8w7RzPMGXilreoNLjnH/Da5H
 CnMc9j2OblJOQRrBJyqK65YJaBWodEyHUFEyYeAmI3lNpH/j2AUfQDdCZWb1ZT7iICul
 UB4jox6ldh3secr0E2I4VGB4Xz+cG16td240eR7vGFX3hof6f2F/i02Ji1GNRCPmJtTK
 A1fCELfOct+cbbvn/IcGlUfdS8OKHs9iXeaeRcrt85eAZZNEIC3TLyltp9B9OXvDlUZi
 +LK3CqupncD54MAWUqpzeb6g2wSuKp5fCyVit0HZDDvsgunbi+goqWfcRWL646YSS6ug
 8VtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Pov0vC4Z
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-11
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

Autobuild statistics for 2024-11-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  4  |  0  |  8  |
  2024.08.x  |  5  |  6  |  0  | 11  |
    master   | 13  | 293 |  3  | 309 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.40.2 | 18
 ibm-sw-tpm2-rev183-2024-03-27 | 17
             dahdi-linux-3.3.0 | 15
              host-rust-1.82.0 | 13
                  linux-6.11.6 | 13
  gobject-introspection-1.76.1 | 9 
           host-doxygen-1.8.18 | 9 
                lmbench-3.0-a9 | 9 
               pulseaudio-17.0 | 7 
android-tools-4.2.2+git2013... | 5 
          cryptodev-linux-1.13 | 5 
            host-binutils-2.42 | 5 
               linux-pam-1.6.1 | 5 
                       unknown | 5 
                   foot-1.16.2 | 4 
host-binutils-bare-metal-2.... | 4 
              libopenssl-3.4.0 | 4 
                  libsepol-3.7 | 4 
                  libva-2.22.0 | 4 
     linux-5.10.162-cip24-rt10 | 4 
              luabitop-1.0.2-1 | 4 
                    mpir-3.0.0 | 4 
                  ntp-4.2.8p18 | 4 
                 openssh-9.9p1 | 4 
                   perl-5.40.0 | 4 
                 pixman-0.42.2 | 4 
                  assimp-5.3.1 | 3 
                elfutils-0.189 | 3 
            gdk-pixbuf-2.42.12 | 3 
            gettext-gnu-0.22.4 | 3 
         gobject-introspection | 3 
host-heimdal-f4faaeaba371ff... | 3 
                libdrm-2.4.123 | 3 
          linux-5.10.162-cip24 | 3 
               mariadb-10.11.6 | 3 
           oath-toolkit-2.6.12 | 3 
                  bcusdk-0.0.5 | 2 
                   bird-2.15.1 | 2 
           crucible-2023.11.02 | 2 
                     daq-2.0.7 | 2 
                  fwupd-1.9.20 | 2 
                host-go-1.23.2 | 2 
                 libpng-1.6.44 | 2 
                 libv4l-1.28.1 | 2 
                  linux-6.11.7 | 2 
             lirc-tools-0.10.2 | 2 
            netstat-nat-1.4.10 | 2 
               procps-ng-4.0.4 | 2 
           python-numpy-1.25.0 | 2 
                   sdl2-2.30.9 | 2 
             subversion-1.14.3 | 2 
           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
                  boinc-7.20.2 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                 c-ares-1.34.2 | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.5 | 1 
                cryptopp-8.9.0 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
                   dillo-3.0.5 | 1 
                   duma-2.5.21 | 1 
                 enchant-2.3.3 | 1 
                 erlang-26.0.2 | 1 
                 expect-5.45.4 | 1 
                   eza-0.18.22 | 1 
                      fd-9.0.0 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
                    flac-1.4.3 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
        gmrender-resurrect-0.1 | 1 
         host-gcc-final-13.3.0 | 1 
         host-libxcrypt-4.4.36 | 1 
    host-python-greenlet-3.1.1 | 1 
               host-swig-4.1.1 | 1 
                 libcddb-1.3.2 | 1 
                libglvnd-1.4.0 | 1 
                  libnss-3.106 | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
                libxml2-2.13.4 | 1 
            linux-fusion-9.0.3 | 1 
                   lsof-4.99.3 | 1 
                  lvm2-2.03.27 | 1 
                 mesa3d-24.0.9 | 1 
                netdata-1.33.1 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
      python-autocommand-2.2.2 | 1 
           python-daemon-3.0.1 | 1 
         python-remi-2022.7.27 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                  snmppp-3.5.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
             strongswan-5.9.14 | 1 
tremor-7c30a66346199f3f0901... | 1 
                 uclibc-1.0.50 | 1 
               valgrind-3.23.0 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/01df9fdc55ab3ce346c7f5cc118417d18eaf7986 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/c70754b77437da71e30e91e0013b30c3b383e566 |     
    arm      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/7a7a19296190a530d8a7d8e55aeceabf667bfaf8 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/4814db224ffa9f596966b43973459b527d39a366 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/1e97279560f314f1958a5a378e7fb967a23ad57a |     
    m68k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/547f3dfbd0e27405d2decaf574a058ec810a8da6 | ORPH
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/bd6a7d058345566a7157932c093653f9cc639a1b | ORPH
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/5e4f0f3fccd4899d093478cc919550701f319175 | ORPH
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/65d03f323a868bee76e1874a6476d388feaa677d |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/4e20d102cb28f84016728cfbf6a1e63465e77bdc |     
   sh4eb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b98d82964b7b75117ecc3a51d3155386c3d43c8d |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/cd85762678ff4992b98293a1c4194a9798625aa9 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/04177ce71ada35b44abc39f31b01b04eca288989 |     
   armeb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/2bb7526889d1d6329eea8f50d3f23959ab0c6bc3 |     
   mipsel    |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/d3630cd98e6c928b5557e54f27e7cdb5e1a8c1b8 |     
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/d8c76126770bfcaa159e9e69b43459af49eb2573 |     
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/b0bc2955c62cb24107df3b6a0e49e023e0341164 |     
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/059b825657fef47627b8b90528caf3876fc1a644 | ORPH
powerpc64le  |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/8180ce54cbce1a42cb8f949e6df0c9d3040532b9 |     
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/3c9626c84187e8a89f923d41c8f0c5842b8294c6 | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/3b76bce619192128e27f2e834b518ff26267c857 |     
    i586     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/175dc3fe278ca58aacdea726cf0cdad3391a9b64 |     
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/220bd8e49141a83db042ab8090adb2b2da049460 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/7eda5b02f6206fb4881a38cd4f3773572e8bcb20 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/869cac50f294be33f95e4a6c423d86db6dc43e95 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/8cba4ceac7b177dab9784b937829497fb485e5c0 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/738413e0cefda4b8ed248871f0a568f7b4ce6040 | ORPH
    arc      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/874a62c7e026b6fa09cdcff7a5c2598a17ebe5e2 |     
    or1k     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/5d9c6677d64fe209d721dd12ac8b99ace4d8a580 |     
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7cc74bdacafe42d317e6d7247e4e83a3f9b0474f | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b0f4fdccd6ef56686b1cbb08e9f2916ab8a630df |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1fe2fee07ad3cb4a3d27c175ff755835f9c9be6a |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0a0e273895a9c09165d8807a0c58800260502cfd |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/16dc348ca0d07b5294afeeacbb5456a6e2af8216 |     
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/38ca108f434f6a27bb397b48b2a0ac1a8480f474 |     
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/79c72fccdb2d274df5f2a014435761d5e9993222 |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b613f63affb2ff99d29f6932a7ad22b4d42f85da |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/439fd8f96190ac2546bd37a75aeb21b2dae5a4f5 |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/dccce5bfe4afe6d7225386bbbc0dfbde42156633 |     
    sh4      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ba9af1fa5a4e2eca86ff36208f8a1f71fd8f8573 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b6188c6e8004eb925d901e802d43e5cd88acf1c6 |     
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/76003a314d260090d27f161ae1ef6416cedfa3a0 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4a277441b9a172615d427c4412894a66c133239b |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5f0a5d64c88f4552358a23fcf39e0577761efcb6 |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/def34f77a90e6f860cd8858037acf77660af94e6 |     
    i686     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/8cf313d996835b9fecf7862351ae8714891a4d62 |     
    arc      |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/92be0a175e6afdb996dd7a420bf2d6703f5ab9e8 |     
   nios2     |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/35b4192e9d550c74c9c727cb7e9d5b7fd1327369 | ORPH
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/a2c82d836bf1cf607d4ba0db7e7a95ca6c718c07 | ORPH
  mips64el   |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/5843f7e33d5587cb7c436f31257745a851d2c82f | ORPH
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/82e0c666d7ca75dbe4e0bf5658307caf6759fe76 | ORPH
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/678e119148fedccd4f21d7ea96c619f3e76d4d99 | ORPH
   s390x     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/5dd7e692a5806ed535e654f926faaea13e1abc14 |     
    arm      |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/14adf083376d50dfa86722423f82ec114be6a94a |     
   nios2     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/89c886b025eaa71e38ea69db520d07d5035ebfb8 | ORPH
    i686     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/fe894901f2dd1ca23f3537d24b399da61505b43b |     
   x86_64    |            fd-9.0.0            | NOK | https://autobuild.buildroot.org/results/9905dd63fe60eebc657d6f6b8a49ae77421227b1 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/065490985f5cbff70eedecdb2673705b6f4bb0b4 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/6ed8eee9dbdb5047de751dd9c6750597f6426b5f | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/e09d0743f69725eeeb73f81f79a042ad9672d672 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ed1e81ba47a6edbe768bad05cee6fa14f6f36014 |     
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f30002255cb6f14af4d069fa4219c42d402c5e6c |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ab0b76fd6ca0e51a00874e15e7cdfe7f93a9baeb |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/6a5dc406fae5224d4fe45a2849ed5c1eb8fdd23f |     
   xtensa    | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/9d90cc163c3dc47d335fefdc06af0a3fb025b877 |     
  riscv64    |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/c25fd3e44023b2b5ae2ea20e10e6551b589c2795 |     
   arceb     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/537c413171967341c363d068ec010e86ac2847a1 |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/851d2c03992fe41aa3ba8b28e109d980e0eedb7e | ORPH
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/618c7c4246231f5a8149f71d51c08fe31944d3d5 | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1393611845fcc6cf6a04bcae5f3582c24ba641da | ORPH
microblazeel |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/212dd535e3770d46eaf410e3b2d577b818c418a1 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/cc057a49a1ba9809bfaa276f8ccf1bba1416c10a | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/943948a7c8b8e4d5cf21fde97d760616fbefc4ad | ORPH
   x86_64    |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/490f043cef0991ee84d62a9a2e92257eac7c8089 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/39a7b3fcee92d3f40e07f832d0ba82fc8c15bd10 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/43b4aeb17bd57e61c53504ed9063c01ad2fe34ab |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/19a5250094faa00bc21675bc4fcf07c2e31bc9ec |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1db83b7629606dc65006f1236203592e418999d8 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ff4d65260d9b2007ca7239029164384c40f3c8c1 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fd517556747f54bfbcf596ebbedb97aa99b8ea5b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/df867436fc8b7f05a76f41c3503ca4328424ccc0 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/598993ccf83b99b2222bfae1c048bd4149018a31 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1b331e369f4a6f4238ea95cfb78fa7434e8de433 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/700e18eca0f939569da9cd3fefbd152009bff8dd | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6a5cc20d0b94d16f5165bde6c8f2370074be7ec3 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3b09bda7e06dc96fb56c610017a6d21d27e87c48 | ORPH
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f0eac4258d85e594274a693c2c9b38a5030afa35 |     
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/98450676befdfb715877f04471a08e9f03f699ed |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/64acd4755cb4b6b3e17a6fb85cba8b1387535b3a |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2bdf182b04c7e3e075d3c6c16ef76a4afb45be2e |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c2ea469ed8fc647be3ef1ae15e2ec95af398e307 |     
    m68k     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/bc337fdf42077b159e526991389b7aadd20dc404 |     
powerpc64le  | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/36099f6985ebd3cd926b25dfce93d46af507720d |     
   arceb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/e41bb48da7b9706205360a9f00670fc5ab1f0065 |     
   s390x     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/b92cf9a409ff51caf4fe7c41d798925a89710fab |     
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/d59634a1db7a2820900c55e0814dcb3bac38421d | ORPH
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/f6902bfb72266c36dc8a253d3fbb989b24059a90 | ORPH
    m68k     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/8680efe6d7a3fd65c80434e05c656c0a6adb9dc4 | ORPH
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/3595bd9ffc56ca21ad2a2444a1668da87cb4da3b | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/2ebef3563c41a7d2eaf42a6dea9139bee072c803 | ORPH
   mips64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/4a77d1a974fe5b40c73f138387e19d09835fc015 | ORPH
  powerpc    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/c370e4cea53ad18fad35e11ff347c7efffad21b4 | ORPH
   sh4aeb    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/ee1c7c0605f6684ab263042be2609ab078a47b65 | ORPH
  sparc64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/43063806f52895bacb4ae37ae45a3982e9e43f75 | ORPH
   arceb     |     host-gcc-final-13.3.0      | NOK | https://autobuild.buildroot.org/results/0f259d22011cfe356874b13ba1432c79ad4db6c6 |     
    mips     |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/4563a0d9718681fc712cfe17786043d1a0dec483 |     
    arc      |         host-go-1.23.2         | NOK | https://autobuild.buildroot.org/results/c877f464e2b3d21d268c95754617ffe61cd807be |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/7454b3f5868fee66f2d9073548360eec5495ec21 | ORPH
   sh4aeb    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/428d05c03eafe871c4ac3e960bab350285a10c2d | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/4ab8de3ef80ff8200fa8809ab8e857e116f022c5 | ORPH
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/e0953d0dc9483269a9427eacc0a587333ff0aa91 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/6d7561832be0ab777f6d108462cf9a04ca190425 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/3036f1887186000d1848d6e0dee48df314956fcb |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e48848a965342dbd8534cc062bbf3b1bb970e7b6 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/6b89dde41235c33cacae0cdd879665264ddca77d |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/9ee8512054478c94bd5ef6565851bcc21feaeb14 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/7e5a3aeecbd9cba9fd88c74dea8d1ef5bb56c0ee |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/63cc3e4be1fb298882a074b1647479eaa0a34748 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d63d6c61cf9eb2a0306891a2075f36db260db9ae |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0660e93ab4ae215d0e0405e8abedd3a5b1f64950 |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/53d8252926d62d855d018a782ea2f369d95ff243 |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/8634cbbd69269f8bb581d83918bf5d8952532d69 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2d1817c65d00c6c7c4ccce45d69d0dc865f81579 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/6bf0d4c9f869089d0bda0aa22ac34f431de3418f |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2d73d1ee0da384abca78495a4202496a51303498 |     
powerpc64le  |        host-swig-4.1.1         | NOK | https://autobuild.buildroot.org/results/80a5589ed6d6f7e5e91a1efd4dcde251b7907e4f |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/91325bf1b6dc4343d543bd41e9e24cca8c1e07c5 |     
   sh4aeb    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ce69bfb078ac984c70136085859b880761c67ce0 |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/cf81e44e455ba502cc49d10ceafca6b539e1c7c3 |     
  mips64el   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/7eff3489e62c635297676bba0f5b5db15d6cd2cf |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/2b7ed2d077e30faad33f65a5a8e3c5f2d6bbb841 |     
 powerpc64   | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/df89b17bada64e811a4bc44501ca6ff8ee9feff6 |     
    i686     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/ddcd1749885a8ff8f470b18035cbfe1e84b9c8b3 |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/e5344cc2e1b1933293cd6b2ae19b373423ce9bb7 |     
 aarch64_be  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b65dda92c9ec16aa36a8cd3f73f2051ca9489e07 |     
powerpc64le  | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/535c07d87f2407c1f2494360ba088fbff4104f7a |     
   armeb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/270227054ee5fa1a8bd00b18ea10237bdea09128 |     
    sh4      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/fc2343115854f1ed56e01e01125db55993ff4e69 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9af2447d9b3d33a5a9850bfac6b9201e1c9de3dd |     
   sh4eb     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/54bcb282ea961b86bdf09a223833df539f65032b |     
   mipsel    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/2cd1b6c95c18f222a07798ccbb114c51819ede28 |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/1181ec9c8565480d5e5bb3a537ed5e908505bbd6 |     
    sh4a     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/7e9acbb430da59aa548407a17ba32ef2fefdf504 |     
 powerpc64   |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/4f1ae47d97e2a94c0787ea78f4cacb0bc1b2aa9f |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/a646a516ebf76b847bd336a9b0cdf39c527d980e |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/34757b59234ce0feb3f077a456f4d0b3c271eedc |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/e7f316c66e17d7999d67533449026a5f83048eb4 |     
microblazeel |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/842918f14c89d164cf16465a4c631ff6e5b0e8fe | ORPH
  aarch64    |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/33fcc0b54d48e623be913e79f03006522d470b15 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/b86f2c15df40cffabb95f1967bf1d659388f45c3 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c5a4cb60427c54e44c0157475e522be719a70710 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c0f770e6b17d73eae66f4e85865a9a2e3c413d59 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/27c6cb293b69545193d8a3d196d13854958ecda5 | ORPH
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/686417ad36c86127d5f30f48f1a1174c75664e63 |     
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/ea758654927f342976ae13394f61f71df770de8d |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/a72bd626415c73acb9c047b3114f678a828f0675 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/d2707b2abe067705e8f7f1887fdd0dec31848dd2 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/f4be3998ef39353173d248001bca3aa4633f35b9 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/c71a3487b6d16d146bcde9f2360885ba225fc2bf |     
  mips64el   |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/0e27d700601260151b440685ef61ec8772d144d0 | ORPH
   nios2     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/2253c73e8d4c338d3d27ecf1165ead8b5a90eccc |     
   sh4aeb    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/24ec51d8823594f79a367993e1dbb9e52b37980c |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/350c6fad416e1777d8dafb1c09c6b3a65b13c6ae |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/6be2c51648e4e843003eb63af5a6b9088bc6dd32 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/63008ce394b404fe8534552d19558bd6aa1fcd48 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/49f59200af1b9ff55a4980453bbefa0d5dd35d5a |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/cad8065ac4c34e0219b1d5e5b3c3e0d8050686a4 |     
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/2fabffdb5edbf5bf6f32d8fab9ac8171d4c3d399 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/990b8d15f2bd775bff0dcae88eb54cbd9a849be3 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3e577925f837be504314caf181cd852cd1ae3159 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4064c2b229e97bd68222ef6437bcf79f559236ac | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e135a8a0c090c4ba619e9d0b1e8efb86ae5e9462 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/37a2bc75a0980f2556689df1642cea4c87daf7c5 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/39b2c4f61085c29570dc6ac11e033c29a97ae891 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d05e470b564e0e74bf196a15b10cd49d43d02c16 | ORPH
   nios2     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/feeee3279a19277e14d665b97ccab5af95e4a5d4 | ORPH
    m68k     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/c19d76ec4e7fd4b52032708d4bb882b492b5912d | ORPH
  powerpc    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/4df7224e611f6b1e2d6d2b42c6d77208b2464c0a | ORPH
microblazeel |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/7208e218ba83d705ef8ca72d273f959dead203fd | ORPH
    sh4a     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/28fdea1bdfd177a593b614504b48fbc3b56c9ddb | ORPH
   mips64    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/3cff74a86e1f9f9ac5275ea849bbd0724c90b593 | ORPH
  mips64el   |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/a09eb74c7d24a0fbbfec1a3a43e3865c7058513f | ORPH
    mips     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/e9d5af4f790082c476c3ba0e57a42fda1e175e61 | ORPH
   mipsel    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/f9d550739c6d401eb016f016f278eb1b067cbfa7 | ORPH
    i586     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/4bea134d0dcb5f873c928f89d03417994da62a84 | ORPH
    mips     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/ec24863cfbea98fa2b9819b9846b29eff12a115d | ORPH
 powerpc64   |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/1c46c8ccddc9ec18c5b347fb8b1f9c6efc2eadd4 | ORPH
  powerpc    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/25eb8fcafa1cbb02e7b780943169caf6e8d19c9c | ORPH
   x86_64    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/caa1334652ff5f94ba231131958cb96fe58450db | ORPH
   sh4aeb    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/36282c04bb47980acb2f27ff1bb8ae061125a822 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/af6ab8075077aff0abaafe2c9a48faa1d54812f6 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/cf5d801dbc3dc3c471b156b1e7876b8dd4ec332e | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/58bd85b5847bdf04774baf49ee976a5b9501ab88 | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3289e360709302895bd28dd44c7d839a8c96d861 | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/4d47ca4fd9e3bb98c50cc5f2cddd5807c96cfe23 | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/d7920794615849d2206a2f822fcb98e7ac377181 | ORPH
    m68k     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/4160ef1a6033f2c953ed69ba898d503fb0353205 | ORPH
   sh4aeb    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/f368da7c7f6c8a0cc183a7b66e975afb834c5e67 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a5040a1c5ca23089a4212c5fde11f4697b91cb60 | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/162dab3c279180aee483b079b022f42d7bcd7e96 | ORPH
  powerpc    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/8dce56a32256fac86f23bf06f3e2007d259af949 | ORPH
   arceb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/06d090b9e24191202618f304d6b99396a8eee846 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/74140eaa066c7dd9b9da7fd5c23f8e5812638039 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/0012542e5d6a9df0636b68f23f2a67eabd22d4f5 | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/e9bafa19409aeaa300c23ad21ecd3239fb863a2d | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/792b69fa7cc3380143aa177814a481049f6a4ce7 | ORPH
   mips64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b2fc713fe2f7d753dc9ba9dc02db18e377e61c77 | ORPH
  powerpc    |          lsof-4.99.3           | NOK | https://autobuild.buildroot.org/results/9eff15e8fb94dd7623602499b33776a7d23de79b | ORPH
powerpc64le  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/b52e0b8e0d63cb146ae7259c205fea4fad9ccc5f |     
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/780a21be20b1e171838f208dd8539a4872ca265e |     
   mipsel    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ad34e7626b7bf9dbed8ad899367018d70eb79d89 |     
  mips64el   |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/e7bcf5e3c8052b4f6e84ffb7fe5d2addb7bb2867 |     
 microblaze  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/7dde172b34f62e41e3a3153d64804139d8111ecb | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/7c3c80536e223aa2e7c618ea656457150c6238c3 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/1dbd3afa070289dd5c49c5bf87fc372773d09f34 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/dc1f76800ca4919710ba4debe1217e94bb86ca16 | ORPH
  aarch64    |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/fcd82e1a7ca784631b920ddf67b8faefe1b75cc1 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a5a2778afad0f367afe5f4f6f8861bd28152a9c4 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1ec83f8290cc4fa090db7cc5a6bd9199b7b906fa |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a051986802f85f4cba10ff5bd16a682470c2fa81 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/611b0a12661ac7e206b039172d42657da9f07c73 |     
    or1k     |         netdata-1.33.1         | NOK | https://autobuild.buildroot.org/results/6b1bbfe128000a246d70ecb5568f666a2a7f045f |     
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/9056e99fde3f3deeb28aefc6ddd643df34374d41 | ORPH
  riscv64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/8d8abbcf36fac8e84f175b85641dbd361ff18471 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cd7c78b8285365ace9436a586f4ddfa46bba1a12 |     
  riscv32    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/206ab490e95c7aa5e6524646a32e7241d691b5b9 |     
    mips     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d05fac48291601c5a0a01179a103044603270500 |     
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ef517746dbd0c848856cea8d8603914ff35fba7e |     
  powerpc    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/44592f0cdac7de33b9bfb6afe871d3ed56224c5c |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/01965ba4bf8452c9dea61d80461faa0b17dfbe2b |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/04e67c218bfb3892d0d17f2ad12add329eaac0a7 |     
   mips64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/7350db135dbe58a2d6481f27b7c4b62f1697c5e5 | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/953d0898da2ef9bad8edcbbe96f8c57322382c67 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/b61ca752c16c70540544640acf0a7afbdee106a4 | ORPH
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/621c2f4cc812a7400b41bb4965ecb480e29187c5 | ORPH
   armeb     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/297cb8252007bb7b33cfe43b72fa258ba0d8637a | ORPH
 powerpc64   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/956b291a2249b0293aabb7db316604568ed37040 | ORPH
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/1f77c0cd4890cf019300bd085e69c28a1cffadd9 |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f750c70e5ba61a7440a5a4b6e53113a114b44921 |     
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/083cc4e401dddd1af75078a114cd7109b4c1bf4c |     
 microblaze  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/8a94cff6e9804bc1519113732fce7c3accae0283 |     
  riscv32    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/6692b73d9838963385e790067dffee66552a2c7c | ORPH
    arc      |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/7a26ceb408432fe848ea556002b50d2275d9141a | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/038998f04b9bf9e7798911af6a2de0fa284b0159 | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/af35305add18502def22015c62907c7a4589dfce | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c5cb4edd60ab538c1e230109813e3b4c7162a686 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d6938cc76fd1f0530c9aafe4845e7b192808ed44 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/997068eccf3b70870f42fe79f1e7d214f2049468 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/00a5281f645e8419bbd396a9f447a34f13218341 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d87a19ffd5462d51701172cc13c4c1273b12f069 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b637498c6e45c78a6c0f7a8f8cc0d9bab332a4af | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ec6a45ce6dd0f2037cf8d7cb6bbb4e6283ea3474 | ORPH
   sh4aeb    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/df25502c9a92b2f5256e22dbb8fdc59444624fac | ORPH
   sh4aeb    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/afa3cf043a4fedfd9f91341954c5c89651efb167 | ORPH
    mips     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/5c9a171526407ce963f8f1ea4b8265c2beb6cde9 |     
   sh4eb     |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/1446f2c44ca15c2c0e7987df45564467e420ad1c |     
   sh4aeb    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/767dcf8fbb3eda7f06ba1feb6a1729cd91be5eb9 |     
    i586     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/171ba8b80f8061101f34f344546fdb06224b4dbe |     
   s390x     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/bcf80ba28302e287e851aa787b190eca8d6f73f5 |     
 powerpc64   |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/2fa1ee588ac4d9399afcfc8f5055ef12fce3508e |     
 powerpc64   |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/987cd82be0e2da6ced0fcc5e33297a87e7ccaf33 | ORPH
   arceb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/5c8d0bbd443d9a0cb15be276b41b8e276abc4eb8 |     
    or1k     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/6439c7b0476c47aa506ce96913b34bc7f26eaa6b |     
    sh4      |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/537b1ae3fb474f493ef8782491ee361bc4adc8a2 |     
 microblaze  |          snmppp-3.5.1          | NOK | https://autobuild.buildroot.org/results/bfd054c29f938a5874f083f80ce1d0e6ef47f8f6 |     
powerpc64le  |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/e39b49cf4bbd9e80fca5227a8a614bd8585d1a1a | ORPH
    i686     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/d035bee88eb004fe7c117f2b7976599cb53bd77d |     
    i686     |       subversion-1.14.3        | NOK | https://autobuild.buildroot.org/results/ca6ea235c01329740134e948422eff99147235bf | ORPH
  sparc64    |       subversion-1.14.3        | NOK | https://autobuild.buildroot.org/results/5f9b7df2a85e6f16e1b1ef233c4cbeb15c4b3cc9 | ORPH
   mips64    | tremor-7c30a66346199f3f0901... | NOK | https://autobuild.buildroot.org/results/212ab37b2cb11c3366682e4cd9735fe27b6e4b3b | ORPH
  riscv32    |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/fb736621d21f9022c737731a1ffb3d7b5f29ff72 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/18c55f0809e003cb3af6d1d164d63235187b2fff |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/71514521da0e10ad0153f4fd2234a53ed6261a4b |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b2e4893f103d90afbf2fbdd117e5fc824728e19b |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/54f09963b332c464d649fadfcaeab4498c77335b |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/817e8dccbaea47366796cd41cc04213a0cc71de2 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b618b4057f06ad93f0746902d548f301f965a47c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/745bb8a6646c5fbe2bd31fadafdfff6b2bd19eaf | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/957160121d5e9f1664536a3f59ab6af5ebad793b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3e37af972a375ec6d48a28d12b2f6d3661b0d6d1 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c079a532f6ba04c2b90c779c80155500a4f921e1 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/56775eabfa7df27d9c4c0322e53cd7eedb2f9298 | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ac15ecabaadf8a29f4ca36cfadc8b3e0fdabd1f0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f4eb39bcac1e570192c9460bc09b8910e5d832a8 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/53241ee6225b75f85eafc78493daf1168375b4f3 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/56d504795f5b3187d488d66e4e8c49cf5881fd48 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/427703f7a4dabd7458c4dba6562f1eb4a1e3a1c8 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1f61340f3caed2f14267de2e228fac3d6890b233 | ORPH
    arc      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/31d8843199852d7da4ee2deb485cf6e7df9e8e5f | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/9905d904725acac55cc491d18de6c1f3e8ba2206 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d3cd386a2cbdfd19ddd5c270ab847940908bcbe3 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/01606fb67d200a982ff8ccd70fa981c21681d866 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a08a8272ef59e6094605dfa613c292de9c07a3cc | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c6f3464ca6a3a0a7eac2c71f112d4f5cdfd4ec95 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/07584495acdebaf1b11e8cf5c431711e0ea2fd24 | ORPH
    or1k     |        zxing-cpp-2.2.1         | NOK | https://autobuild.buildroot.org/results/1c49c6e82a0f7e4b5620ec7b6ddcd583371ef165 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                    bsdiff-4.3 | 1 
             host-delve-1.20.2 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/7d318a23637982329bc624a0ce47f109eb9528d6 |     
 aarch64_be  |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/ed5034fd356a564a5971c06d871f153440c2a2c0 |     
   mips64    |       host-delve-1.20.2        | NOK | https://autobuild.buildroot.org/results/9641ec8bca4b705f1d9fc1cea4b413ae6d025700 |     
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/5dcf078fede8a0015d9d1f58662dc5183fcf9fce | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
              fluent-bit-3.1.3 | 1 
                 gnuplot-6.0.1 | 1 
              host-rust-1.79.0 | 1 
           musl-compat-headers | 1 
   openvmtools-11.3.5-18557794 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2d6483ecc6f24970166a7777a8db200774794d13 |     
powerpc64le  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/707d42eac0c100fe43a2b640d6be6393e59f7978 |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/129f6fd77e0cca0214c2ceea2e681e1c9012231f |     
 powerpc64   |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/aa09e64f6a1560379b6bc67b0f7d6ddedaefeaaa |     
 aarch64_be  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/e9be242e312e49f3c955727144f123b22b69d88d |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/86bc6b00fa4d1663474a94d398ae895061ba0b8c |     


Gitlab CI results for 2024-11-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8319071917  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8319073484  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8319073488  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/8319072323  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8319072329  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8319072442  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8319071944  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8319072496  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
