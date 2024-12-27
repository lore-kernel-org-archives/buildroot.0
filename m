Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4119E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 04:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB5F60862;
	Fri, 27 Dec 2024 04:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUa--Pt7DHzT; Fri, 27 Dec 2024 04:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0732860802
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0732860802;
	Fri, 27 Dec 2024 04:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ACA6E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 04:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7729440278
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 04:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnKjoLszjSyc for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 04:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BAB9400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BAB9400BA
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BAB9400BA
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 04:29:16 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3ea065b79so10384623a12.3
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735273754; x=1735878554;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sPS2oPRcW3hBbtG9AfyfrbI3QmPWy3nIkYC3V411tG0=;
 b=lgLcVx3NYGiCmK51ToO+MW/V9wpB/M1q6BSKGRxROBSSGPtuh9nVbg3IRngG1Kj7s/
 07/mDiYbPMUCZkN9pvb9tGFYJNHeeCA5Szvtqb+l385rnvFQCICkr4lxh6Jyp1A5hDl0
 j6vtEvVCeEPreh7bWQ9uUfrKFejCoCFU6PgzRxdernxEATXFjfQkB8FenSKDMNgE/2++
 k6Vnlh+w4o7iWcyhHpPiXsP/sFyTSN2+zJtr2CAAkSoIx9wtBRZKzfiD290Tu/I72tp7
 ShZaX7pRRucBYnSvXivlzh5zeP+aQ7oZuzqOdfEUUR9vCu1/JDbGMfSagTwUAcaj06D/
 gUJg==
X-Gm-Message-State: AOJu0YysVUssLLPcicHkEeO2TEO582c5hJQcT/MEnlt3VIFnnkooQ7y6
 iPRwlbW9HzRXCu4YwB+tZSDXBKJWZkfkJ2mtUfnYvDJgnqCAwJMd0aWj7w==
X-Gm-Gg: ASbGncutUySPD7DqKTYQOiWlfSMPzQ0VFiCsVSKeVSPw47EiBlCcj8CKxWsw/nn5rmU
 cCUGV6Wk7VmSyDG56VkmiTkxA0hiInizLgvP3VxNz/4IvN5cdxFVvl2dsrUTSdQns2zCJptJFkb
 Y7MM6zHejMU3uWMZvU7oEUdg4Fer3nkCrMEzkQz37ZekToH0UcWa6wcxHqcKK+G4FDuAtN9KbJN
 6Iq08z4mXF5v5EM977vUOfEfP8Q4xSYqtkiOdff/YqLGLv7yvcxBb2kxysr
X-Google-Smtp-Source: AGHT+IGksysvHxWCS1c5kxQ1gG0e1bKGG8bLItjJlkGuOx9TOMPtiFWukfieztzm4AYSdCee5d0RyA==
X-Received: by 2002:a05:6402:354b:b0:5d0:ef55:8451 with SMTP id
 4fb4d7f45d1cf-5d81dd9c75emr24584634a12.8.1735273754038; 
 Thu, 26 Dec 2024 20:29:14 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80679eea6sm10157122a12.49.2024.12.26.20.29.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2024 20:29:13 -0800 (PST)
Message-ID: <676e2d19.050a0220.83784.e2a0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 27 Dec 2024 04:29:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735273754; x=1735878554; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sPS2oPRcW3hBbtG9AfyfrbI3QmPWy3nIkYC3V411tG0=;
 b=Qa6Omm3H8vRx/dewUntz1lMN0hNYZT5w8TgrVkHa3zgBnQcmQ/VkDbfJx8i3zMBh9Y
 w9EFQ517vbN4bNzmmH/3ioCkF6faf9XALDuOo+zIc/ShjBJM2yohJFINDH/pmKeD7rUG
 wuwRaxeRcDR75aYx+/6iieppq1PUIVmczXOwk8IhNNWW6F6KPRjOMl4ZTR4bKdpkD98w
 m5ODguvJCKMJPvYFiQ/3B14tTrJFbe6U/x1m5KIGmVVC1ttJS3bS/yoWykui342U4W6q
 L5CsX1ogysw9y8hyKyF7beDpUxS72UPK7Kjm+HK18Yd2M3TZFwbFUSvF2Bx2DIQ5PBaT
 naNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qa6Omm3H
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-26
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

Autobuild statistics for 2024-12-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  3  |  0  |  3  |
  2024.11.x  |  2  |  9  |  0  | 11  |
    master   | 23  | 138 |  8  | 169 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.12.5 | 10
         gobject-introspection | 8 
                       unknown | 8 
             batman-adv-2024.2 | 7 
               postgresql-17.2 | 7 
                    mpir-3.0.0 | 4 
             util-linux-2.40.2 | 4 
                  curlpp-0.8.1 | 3 
               linux-pam-1.6.1 | 3 
                  ntp-4.2.8p18 | 3 
               procps-ng-4.0.4 | 3 
                   cvs-1.12.13 | 2 
                elfutils-0.189 | 2 
                  ffmpeg-6.1.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
            host-binutils-2.42 | 2 
                libesmtp-1.1.0 | 2 
                libxml2-2.13.5 | 2 
     linux-5.10.162-cip24-rt10 | 2 
            linux-fusion-9.0.3 | 2 
                   linux-tools | 2 
          obsidian-cursors-1.0 | 2 
                   sdl2-2.30.9 | 2 
                     ace-7.1.1 | 1 
                acpitool-0.5.1 | 1 
               apcupsd-3.14.14 | 1 
                 apitrace-10.0 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                    bat-0.24.0 | 1 
                  bcusdk-0.0.5 | 1 
                    brltty-6.6 | 1 
check-11970a7e112dfe243a2e6... | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.5 | 1 
           crucible-2023.11.02 | 1 
                  delve-1.22.1 | 1 
                   duma-2.5.21 | 1 
                    emlog-0.70 | 1 
                 erlang-26.0.2 | 1 
              fftw-quad-3.3.10 | 1 
                    flac-1.4.3 | 1 
                   foot-1.16.2 | 1 
               freeipmi-1.6.14 | 1 
                  fwupd-1.9.20 | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.76.1 | 1 
                   grpc-1.51.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
   host-mender-artifact-3.11.2 | 1 
    host-python-greenlet-3.1.1 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
                   iotools-1.8 | 1 
                  jack2-1.9.22 | 1 
                       kmod-31 | 1 
                lesstif-0.95.2 | 1 
                libdrm-2.4.124 | 1 
               libglib2-2.76.1 | 1 
                  libnss-3.107 | 1 
                  libsepol-3.7 | 1 
                  libsvg-0.1.4 | 1 
               libunwind-1.8.1 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
             lirc-tools-0.10.2 | 1 
                 mesa3d-24.0.9 | 1 
                  mupdf-1.23.9 | 1 
                  musepack-475 | 1 
                 opensc-0.26.0 | 1 
                 openssh-9.9p1 | 1 
                   perl-5.40.0 | 1 
               pulseaudio-17.0 | 1 
         python-pycairo-1.27.0 | 1 
  python-pypika-tortoise-0.3.2 | 1 
         python-remi-2022.7.27 | 1 
          python-tinyrpc-1.1.7 | 1 
                python3-3.12.8 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
                 rtptools-1.22 | 1 
              skalibs-2.14.2.0 | 1 
                  usbutils-018 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/87d9ab2ca581d33daf7a0345bd007e15b67969dd | ORPH
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/ff6645481266f68013dedfa14eeeb0dd3fa4fde6 | ORPH
microblazeel |        apcupsd-3.14.14         | NOK | https://autobuild.buildroot.org/results/9e00f345040d263967fb6d73971b34a312c560b9 |     
   arceb     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/b248ed63a3fc058c41c5a5178ea1eda19ad28465 |     
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/550533cfca04aa2a745c887065ec6750ed5f08ea | ORPH
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5a2c440f85cc4298282fc59ab04b6eea956020dc |     
   xtensa    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/ed54b4b2d273db2f0a57945fbf2ea383ca81bc3c |     
   s390x     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/96ac9ca2e91b251ccec8babde0e506b4bdcb50ba |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/fba20d8aba87a953ae05af5ff8c9a9bd8087b7e1 |     
   x86_64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/f0887b825ec75bda10e364fd324b1915ec2ef129 |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/be34bb6097b7f0e71053832cfe15c59cfbd6a9c9 |     
   s390x     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/8914474a4f4eca5d560c9e93cd33178933893b34 |     
   armeb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/59f2d3205c7b272d39f564409d94170da2938152 |     
   xtensa    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/ff4554220abbdb05709ee179ad84d026f993a507 |     
    arc      |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/76613d18a0c61d730f787eb0ce7195d183628d96 |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/64ee42d1975a0087c4e9392579d0e66be175e674 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/964f2c79f39450862051f7e7685a6d7dbb32cc38 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/c713d4cd33ce3a61dc36cdfab10b9d526f0362d2 | ORPH
  riscv64    |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/1262eb169e5d4b90deafc08332809064c30fdb42 |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5fafd19fb2ed24053e72273f1fdb69d3e1ec54df | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/0f7cf6b7aa21e801250b31135f42231ced000335 |     
   mipsel    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/6bed6a6fd26163b99c2c76bf2e5c241bc531a43b |     
   arceb     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/d0a8e17e9d8ead5d062f58465cedb66138f561d7 |     
    or1k     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/fae58031d5967ad186337ea1385e44ebf52043be |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b56f057390d7a1701261279232a5b1e033159495 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e249d286f6f57224bd63be94ec3b3e5085f9f182 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/4dc3f465e13b4d138ac6f75cfec23707fb73176f |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/0e93ed785f62e27b30d8f1a5172c4e15d95c71a6 | ORPH
  aarch64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/8c8fea77ae86cfce486cff18f2de03cc18359baf | ORPH
 microblaze  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/52af3633a27cd19aa5c0e571689ded7e154f62ad | ORPH
    i586     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/3e890035f0d0bbb398fb449028a5141b45427c88 |     
    arm      |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/bc6e39b851b169663ca7059cc3cf1ad27e58d487 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3f58e05664c05c5caca2a3f807f7ae73478a7d24 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e8be280847659bdf3a67b95324212cc081715bf0 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/c204d4be7b75160463716e19ae426b1e116b846d | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/72de4c8f94ca15b85c61fac05089dae643c598dd |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e7998239d4e92a53908278aebeebc25d684dde95 |     
    mips     |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/be1f557dd80019c46b583fc82db36a027b8b2e55 |     
   arceb     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/53bd6762ae8ee8eacd386bc89493bd3110fce73e |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/34268dea83d939a6c0b7a248b06df957a04da29f | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/37ee97e1e3c1028d5c4d61cd4c602d2341064024 | ORPH
   mipsel    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2291a88c3c34d83b7dffe4fb7e0cbac041030345 | ORPH
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c6b2107c0cff2c049bd6950c89a966ed22ab0458 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/042eb9a6061da73a7531fec39bf00798901df340 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/18e4848ad917f18e2d698ad69d2496632074601e |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/d76dae2174c3a2d6d522e40767d9ca8417bcb4a8 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/894ceaed400095e226ef71766c0ac9052f0bb64e |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/d6560b12dbb116ce1a21fd308545b7c08e69069b |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/26a91ad9314c09a923497a92b743dd19acf3f25a |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/960717eb12e57fd337f4cf48f61b3d946bedbc8e |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/674632b4169ef4e37b35c3c14d2a35eadfaee288 | ORPH
 aarch64_be  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/2e5f32190a3711270eb8b568d7b291fe8a74c56c |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7a114588ce96db670a11d89f3e39d454712e5601 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/19b64478d40a096ff30d9b83360840544516a20a |     
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/2b94e7793f2ff7da9cc6e71b72925f085076d965 | ORPH
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/0a0014dbe08343753e17fff2ae6b2e2274c99031 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0e27405c37ae725db0b2a3a36a896454a004e86f |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/1121abba62c8494b9a2165edf81a37470ec10bd2 | ORPH
   sh4eb     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/0f9a084d44232ab5b6b39a966ef4b1c2f8cf7c9d |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/65126c74f3fd5d0f0b79ce793dc7203d6c25a2ca |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/972a984a217f5157d1618e1b88433ad052a1a2c4 |     
microblazeel |            kmod-31             | NOK | https://autobuild.buildroot.org/results/4355ed67ed0732458d2009402d5ddec51155cd21 |     
  sparc64    |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/87379a1d56ea85c8027fe3869dfff65044f7cf31 | ORPH
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/274e813fdf4a9a37ee3afca003103ee97831bf72 |     
  powerpc    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/b748f3e1a11cc67ea2daf17bd702f4ab8d85b674 | ORPH
 powerpc64   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/30cd8f9db81227a86f83deadd9570980d01aba66 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/960766356f849d42125d5505707f8214ac412454 |     
   mips64    |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/2aeebee0365f475c2957a66d4fdbced43eb602e6 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/b20511adac77741c668aa29e6dc7b0a54511a9f2 |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/40a90a0deb24d3d99de7e19df46c898f249d3e96 |     
    or1k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/7807205fa5711d75ec9a6acd96e8cb403eacc1ef | ORPH
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/9ff855f7205895875fda3844fa2abbf88dd77d41 |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/9e6d2540b04253bed273c70bfb7ffbc6acd9a362 |     
    i686     |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/f2bf00b159b014e1fa1d07de26d9c4e191128636 |     
microblazeel |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/c16801f987f4dbc8f5b4e0422ef6b8a35b884ee4 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/19eb63bb662c1622cc73388f111656f615ee4a4e | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/23c1f814f7d34e7492db997b4f9c7ec2b6d57133 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8f4749625aebf6ee148ab311ecd11dd2e6e1ee88 | ORPH
    arc      |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/2913e5958cd6b20dbfdcdad304a5f5a0f8030d8d | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/423de7ec69aef10b2226bfd2524d1426e1d82690 | ORPH
  mips64el   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/3ab640d1bf12b612e0c18c83fc262b527c123155 | ORPH
   mipsel    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/239b1bf5e6b7c840d2cac0cacc41f3fe07b59332 | ORPH
   mipsel    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/36e5e81531169263a6fef0758cb0af1a2fbf12aa | ORPH
    mips     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/c5ea08f5834b883061bc3fb8041616d547453661 | ORPH
  mips64el   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/94ddc9957427eba6e923bc1dc42bde353f6f9d24 | ORPH
   mips64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/7ab0753104a0ba4e776cecb2e6a5449d05c344b6 | ORPH
    i686     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/f2f32dc6ec5c92c10bb355eb3f38c86e199692ef | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/af93da781414c687242aff160215e11f39d3a7dc | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/338bee3f06fd6680d8c4499defaf9252cda11697 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/0808cc6b485aabe9497ea4f657d50251825d01fa | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a0fb511781e780f30f04b48da995b3dfde7a2f90 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/fdf8bffef2a8b1aeda228cd4cf1e33f60ce91a63 | ORPH
    i686     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6b6e40d2ad2c9baf987d7386c9431224e45357d5 | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7d10037187efbd286ec502150141cdb6980d270c | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8480416c78941d19dc4ec0a1b69bef684d4fd6b6 | ORPH
   sh4aeb    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/f791f82e22070de130265d627b5ef7dc43007d0a | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/0a55f38b507c117e19924e66a9a63ab2e27e6c7a |     
   s390x     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d6ba858c7e675f715cd99fedbfee9df0bb355954 |     
    m68k     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f3d8e22c90f5a047358c517c6cb33a44e6843419 |     
   sh4eb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/53f09a1d0fdfb9306bf7778882f5b8d933955e59 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0572c65c17ba52d5dab3f867f6c1fe0bf06cc011 |     
    or1k     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/f40b94b243ed3f71d3564fd053797dcb1b000e8f |     
    arc      |          musepack-475          | NOK | https://autobuild.buildroot.org/results/6412fc37d533dff27f18b09c668870bebff2bec5 | ORPH
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6b41cd052e9ae0810b62503f6e632f5a59d99244 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0a23588b9ae20098e50c7166c030b20c81441dec |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/af227253cafc62fd3e89a911c6587d6bce72764d |     
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/d7bff2de0e3d08e8a5370fa810c3070ee28332a5 | ORPH
   s390x     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/c412b78b10cf6aaf4a227981a0f9bcade62b8736 | ORPH
   s390x     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/03d08f423681fa66feecd8aefd6e4848e7d9aff2 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/0017b9d3fb5c30f2fa147132721dd681acbfd97c | ORPH
    or1k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/a07dd9772cf5f1b6aaec093544eaeb15d01c6e82 |     
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f492b25cee46d41e9ad49600220e714915e9592b |     
   mips64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/4ba8c746bb5efa8a0a789606be3a98b8dec0dd0f |     
    or1k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/4f3baaea28e5aa5b23ec9f9fe17e32c552772668 |     
   sh4eb     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/5ab1274604045dd14c5e8d133083eaaa96003fc4 |     
powerpc64le  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/09bb2b0ca48a1cdd9f74c7bf867ffb0600e071b1 |     
powerpc64le  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/b9adca1857f360ebfeee3d27c5256a20fb68d334 |     
microblazeel |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/65c45fc74395d6d70df9fb3402d7af0c2b79705a |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e6393838421c13b0252c33dda3c28048fd53df33 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3cd3fde92a96f6acee9610d981eeb79745a24553 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0baf4494d0f39a12f54909b34e948acefbdfc0d1 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f03d06ceee768c49b74862562e8f7f59ff030f55 | ORPH
 aarch64_be  |     python-pycairo-1.27.0      | NOK | https://autobuild.buildroot.org/results/c560fb839ac80e8345bbe9ad02d810cbf037d605 |     
  powerpc    |  python-pypika-tortoise-0.3.2  | NOK | https://autobuild.buildroot.org/results/f04e17b531b51600c7a62fe6cda4b7229107f84c |     
  powerpc    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/ba0b61e92d10b2f458de92e200a371a3824d8abc |     
    or1k     |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/c564a7fc06f7df36f9a8b2c2ccce139110ee9ca8 |     
   arceb     |         python3-3.12.8         | NOK | https://autobuild.buildroot.org/results/701e62ee00d2ba232a1f7f51baf51fc0ad7add52 |     
 microblaze  |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/ef97043e950f235093f10c20f749f2f596f5e69c |     
 aarch64_be  |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/986d4f0edb1396000d162402da091c6d6ee398fb | ORPH
 microblaze  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/95ca4ab95d82fb68e0e623358bf997f60c4d9d3b | ORPH
    sh4a     |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/a0b1a4730667ff3d43d900b3db4f0981479de90c |     
  sparc64    |          sdl2-2.30.9           | NOK | https://autobuild.buildroot.org/results/49177f77eacbc8e9b007c265086ba20e621ea493 |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/81d59f4761d5dea064b206f2a7579399f1d915f1 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/57a1de89a8ffb1447c31e88abc69cdb9133361ed |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/30dff1a5fae2f41800eba80bc545fc49f771cd75 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/d0c180593e9740a9ea5b8ffee8e0028d3b414e49 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/380c0a96ee035a96788cef191c868b688848a137 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/dbf4d12d64e19375dfb921de0b4030f72374b67d |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/ab148f330bd180e9e08ee5d86c6cd68d5eb2dee0 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3b2d91c7d33dba00980504977967ec9e16ab4d2b |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/d370bcb4b972072c747d62220d728cbae7c8c943 |     
   mipsel    |          usbutils-018          | NOK | https://autobuild.buildroot.org/results/b543a3713949571b04dbd9c94f063fa0a186765b | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/271a7945519fbe1d0a9482f0ab6ee5c50db92d60 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e496ae0df0cb0345035ec50e698592d85a5b973d | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3e27964321159c3905cee3da193cf9d35be1abc5 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d1637642eb2f5e953895bd488ed72b35bf7d4419 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 fdk-aac-2.0.2 | 1 
host-prelink-cross-a853a5d7... | 1 
                     shim-15.8 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         fdk-aac-2.0.2          | NOK | https://autobuild.buildroot.org/results/68e8c92ac4f46cab1cac98b1ed5796bb1f956526 |     
  sparc64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/1ea5030b372341d0366a51e95012af14f6a8ed65 | ORPH
   x86_64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/934ca1c0085eed0864612ca08a2b90b42e4de941 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                    chrony-4.4 | 1 
              host-rust-1.82.0 | 1 
                latencytop-0.5 | 1 
               libglib2-2.76.1 | 1 
                 linux-6.11.11 | 1 
                   linux-tools | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             util-linux-2.40.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |           chrony-4.4           | NOK | https://autobuild.buildroot.org/results/f7aa01ccec84d9d4617adb314d70a4704dd256f7 | ORPH
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e2fd1047dc1b2c6763db297969a7778e051975da |     
    mips     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/7552051c6064844a787ca697a09fdc23035fab14 | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/cc126c93aa819499feea774a9a05c541d1ae2d97 |     
  powerpc    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/f581ba8c95cc482a78df901b1ac57b85a03d202c | ORPH
    m68k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/f9e756b3f7c0c1b01c226148e8e45c755c2833c3 | ORPH
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/664c7d26d6f9bcd7ecd7b9620cdf920042922ab2 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/093ab446e5adb97ba04e62af5af364e442f6b688 | ORPH
 aarch64_be  |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/24d0276e08ba897a9ab11b6d4b40bdf866240da8 |     


Gitlab CI results for 2024-12-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483028  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483054  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483058  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483060  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483062  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483084  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483105  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483112  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483114  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483116  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483117  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483120  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483121  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483122  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483123  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483124  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483154  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483181  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483207  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483219  |      
                       nvidia_bf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483223  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483225  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483227  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483230  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483258  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483266  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483379  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483468  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483487  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483493  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483496  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483513  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483514  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483516  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483519  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483521  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483522  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483524  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483526  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483528  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483540  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483578  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483583  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483585  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8723483589  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
