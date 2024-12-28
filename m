Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B776E77194
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 04:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D7A6066A;
	Sat, 28 Dec 2024 04:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiJLnvMT_esc; Sat, 28 Dec 2024 04:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 254A360647
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254A360647;
	Sat, 28 Dec 2024 04:15:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 248EC757
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 04:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F4123402FE
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 04:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kmu2p6cAvSG for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 04:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CB0A402DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB0A402DA
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CB0A402DA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 04:15:13 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso13557926a12.1
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 20:15:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735359311; x=1735964111;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTGhlvkGDfP+79LuomoX3IrBN1kQNSXLbAegj0RSByw=;
 b=eii6IImkpiwMqe8vXrcp6hRwggcUaKM7FEN9zqbaZ6O4h9zZI0Z24ZyUhQUe/1b+yP
 q8b7ZcndIC2ufGGC9WX8p1PrE+eGerumyFklGgl6kmV9jV40wMQtGNbNinuTrwX3hObV
 F10I5vv0K0BYMzNcAxmadegTzEqS1M2XCUXlJFTuRA7hOxGMkeX0UvB6vEqMfY9t0wIf
 UNTkX55uU5fpszkUqyLe33khgrmpMk1KIvTgkPhkgvHEMYH7wWp4EsXmj6nprlrO5ea8
 IxR3yEksMc0mBNiK1N9S8MJ45QUFfM0TEOueWibpfrsejL6oCr4tX+hP0YtCAvUYexoe
 l5nQ==
X-Gm-Message-State: AOJu0Yyc5l4tW1Gj8eAnIv1LZyI38v9/1ffpBFH9+Gk9GUZ0MLELjX4T
 ZBhgY4GFrcUWic5NT6g8ep8hSdgRSvjdogT4SU2gEkGJYRtrj4iUkpBilQ==
X-Gm-Gg: ASbGncveSNcSkP0wbpizoutWxtaPlDk3DpCRzUaN7xvSA6S0nqByM9W7CihYtdRNbui
 lLPAIgRBpvaQUl03Cnhw+1kZF2VJXWW9WXqx8UqtSt50qO58yYPPBa3vtiXQj+w1lm6y9M4WRJQ
 5ujND1qN+FmbpM0JEuk3J/tVSrnJwsGlOp0ehrZEV3lQJ+pEQ7oLUYRoBm3GRjoFCEZRIAYaWRr
 Kx1mHh29XlTl6KG3XrAskNl+kEhLvncXP2LmT7KNaRy5wN+OrdHoTXXvZ3f
X-Google-Smtp-Source: AGHT+IFkpkWL1bpDxMoKhX9ayTtwf1jggy1aTT5D6WkyKO2CkrVBaQM6ZkeI0/y2mLehrcPlqnPhDg==
X-Received: by 2002:a05:6402:e05:b0:5d3:e58c:25e2 with SMTP id
 4fb4d7f45d1cf-5d80238b2f5mr27032007a12.2.1735359311032; 
 Fri, 27 Dec 2024 20:15:11 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f496sm11650311a12.34.2024.12.27.20.15.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 20:15:10 -0800 (PST)
Message-ID: <676f7b4e.050a0220.19bd7d.12b9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 28 Dec 2024 04:15:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735359311; x=1735964111; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eTGhlvkGDfP+79LuomoX3IrBN1kQNSXLbAegj0RSByw=;
 b=C0+6yZVXB8WT0ULv0KDltKjg5BW1vFop24dg82Dxxt8F1FixrdiFNWxyIyP40JQDBK
 bM7OMRjnNdfHlQUzCEXUEdOdcb5e7g+tc3XM33VGXdtmhCdghM997yAUnoovxzqrXwmA
 IhcWOGQUkNCh80pzN1banqolCq4bv9CCh+kQ2j7/JOTP5nPdMlllVA5Sqc6DC6fiEVNX
 FlIUx/5nwvKh3x/vUU+rVjDqlrYNupxmqDHeiH2tpdYQjBflr/iePIUHeSYekZ64ATXo
 vsHPHZDdGzQvwyfknC8EJEpwVW8pxbq3u4cZbCEbCxOhUGxzNGz5G/nykTV4VHRxfO9S
 bLDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C0+6yZVX
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-27
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

Autobuild statistics for 2024-12-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  2  |  0  |  6  |
  2024.11.x  |  4  |  4  |  0  |  8  |
    master   | 18  | 109 |  3  | 130 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.12.5 | 6 
                   perl-5.40.0 | 6 
               postgresql-17.2 | 6 
                       unknown | 5 
             util-linux-2.40.2 | 5 
host-binutils-bare-metal-2.... | 3 
          linux-5.10.162-cip24 | 3 
               linux-pam-1.6.1 | 3 
                    azmq-1.0.3 | 2 
             batman-adv-2024.2 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
             cni-plugins-1.3.0 | 2 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
                elfutils-0.189 | 2 
                    emlog-0.70 | 2 
            gettext-gnu-0.22.4 | 2 
         gobject-introspection | 2 
                 libv4l-1.28.1 | 2 
           libzenoh-pico-1.0.4 | 2 
             lirc-tools-0.10.2 | 2 
               mariadb-10.11.6 | 2 
                  ntp-4.2.8p18 | 2 
           oath-toolkit-2.6.12 | 2 
                 pixman-0.42.2 | 2 
                  assimp-5.3.1 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                  boost-1.83.0 | 1 
                 coreutils-9.5 | 1 
                  delve-1.22.1 | 1 
                directfb-1.7.7 | 1 
                   duma-2.5.21 | 1 
        edk2-edk2-stable202405 | 1 
                   eza-0.18.24 | 1 
                  ffmpeg-6.1.2 | 1 
                     frr-9.1.2 | 1 
  gobject-introspection-1.76.1 | 1 
             gstreamer1-1.22.9 | 1 
          host-binutils-2.43.1 | 1 
               host-nodejs-src | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                latencytop-0.5 | 1 
                   libcap-2.73 | 1 
                libesmtp-1.1.0 | 1 
           libfreeimage-3.18.0 | 1 
                  libnss-3.107 | 1 
              libopenssl-3.4.0 | 1 
                  libsvg-0.1.4 | 1 
            libsvg-cairo-0.1.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
              liquid-dsp-1.6.0 | 1 
              luabitop-1.0.2-1 | 1 
                    mpir-3.0.0 | 1 
            netstat-nat-1.4.10 | 1 
                 openssh-9.9p1 | 1 
               procps-ng-4.0.4 | 1 
               pulseaudio-17.0 | 1 
                     shim-15.8 | 1 
                   swipl-9.2.8 | 1 
                   thttpd-2.29 | 1 
           uboot-tools-2021.07 | 1 
               valgrind-3.23.0 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/c44ddb0034aa47230a32466a2326557910d9e23b | ORPH
 aarch64_be  |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/52cd97f0fc3d4c789ddf7f65e82b4f069f0b4a4f |     
    sh4a     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/0a21818ec2dcab696f8ec336571b77fd47edf75a |     
   x86_64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/348376f5e535bde21691ddad315fca4a23a27751 |     
   mips64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/4fc0e61a951fb720c6b2b57ac64240a267eaec1d |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/7dd650253fc4612156247d0a0f5bc39f19c7e43a |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1aa752271a627a7546f5bfec6e04c09829dcb9c3 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/911c5b705235228dba69d246bfd0b2b93382186d |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/eac937f9549dc58c465d9be5f7ad12dfde2f3445 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/14dfdb0bd41b6cbc536b888b4501cdcb31ff7576 |     
powerpc64le  |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/fbe2d9503db5dccf63f4fa0db3b42b2ed837e05f |     
    i686     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/f221232fc96225d5ce1111df1bfb6bd86c0df7bb |     
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/439d6afeef2780259952ef009609c434477c2c50 | ORPH
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/07b2e19384d326ac67f052479209e6e727c6b306 | ORPH
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ede0108eaad737f7e19f921e11dc6f67ea8f902c | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/740f7f8c02d205af9aa1829e4ac55cf71f792dbe | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c04888a9c845cce4ce7c9693ef7dd123bef3a069 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/ecd4d7d315e3d9d8a78d70e1b74b02df05a1193b |     
    or1k     |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/f2bd18f86c435343390621644caaf487e04db6cf | ORPH
    or1k     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/f4804a4e79974334f29b5be7b7b0faeb3b7c17a3 | ORPH
  riscv64    |     edk2-edk2-stable202405     | NOK | https://autobuild.buildroot.org/results/543ec32391177a88d6cbacea0fcba593f36bf237 |     
   mips64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/8a7a7742d8766395265c1d48feac15a909033868 | ORPH
 aarch64_be  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/09740d7d3dc2527fe9dea41325059bd7758099dc | ORPH
   x86_64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/c895610999578415ff51613b6e0a5621ede68a6a |     
 microblaze  |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/4d70f62d434e2cabaa742602e633007be595ee73 |     
   armeb     |          eza-0.18.24           | NOK | https://autobuild.buildroot.org/results/aebb9736eb7b76b3e1246f4445b5c702fa4ec3aa |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/51d0e614c9e2843c3e10f9db93b5a9f69800fbb8 |     
   xtensa    |           frr-9.1.2            | NOK | https://autobuild.buildroot.org/results/1a383e481035b3454d988cfc3c8bb02880862705 |     
microblazeel |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2c25f355c622f03c953e37e7703b1845a7916c4d | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/66eb9d571551c0de05a57b4b6f6bd490a623e82e | ORPH
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/5fbfd8788bce5dd99aaef44e0036a531a9a3483e |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/2f03b8e078ff69eb94c87d7fc713522d44d233d1 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c41a122c58b535b9f7509bc0341bc5c5da5e2df7 | ORPH
    or1k     |       gstreamer1-1.22.9        | NOK | https://autobuild.buildroot.org/results/ea4546978a702a929337319490f5e1f536bae978 | ORPH
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bb95e7d7988ada8ee40d260943f9113c78e0b425 |     
    i586     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/1f47f29649082927719937da7628fea865b9dae1 |     
  sparc64    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/ff88b0287c7c1ba972cd41f8d06fc697b4ed304b |     
   arceb     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/ef47cd8f4d274d3c292070324327114d73f2bc69 |     
    mips     |        host-nodejs-src         | TIM | https://autobuild.buildroot.org/results/01d416f9be385fb826bf8451cc7a2c5f8b586488 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c74e2ccf4e5bdbead8b88b0722ac3c287138b61c |     
    sh4      | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/ed91f3e274f0429497bfd3e9b9d57015ee783145 |     
 powerpc64   |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/9b8b9922b8437e6b9a3894c0e59fdbd2116d94ac | ORPH
    arc      |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/80062046eb3b7a206b8ad4d2a605a6438b4d18b7 |     
  sparc64    |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/ab05d3f5d0423d7ebf35002cc4e9e90636d435f1 | ORPH
   mipsel    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/f15a4c5b0788539f2bfd2eefa51be993c8d13481 |     
    i586     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/98a63194d14abdbeb020e6547dc74d98a9d4c0f9 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/b15eefd530090794ac10b270d0ef9ac4ec7b39ae | ORPH
  mips64el   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/103279381400574c5ebe232c6477bed254ae6e26 |     
 microblaze  |       libsvg-cairo-0.1.6       | NOK | https://autobuild.buildroot.org/results/78c91bace5c3006af28eed054f6e6eed90364e8b |     
   nios2     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/c514c54ab7533af9d18b20f5a09629db7ea1f803 |     
    or1k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/5c29967994a097c0bf66572f282c4cc26e4ee9fb |     
    m68k     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0fa385d2e641071c8094add5ce63a92275a07bc0 |     
powerpc64le  |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/e94a65251f0ce21d5730ad05045be302160efdc6 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c129d581358ee522223dd21b44a94b6359750fbd | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4f341145b0effc8abe1d5c31c8030003d56f69e3 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/543dfc3fde5224268fce208485001a9d30e36932 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/8c05003a1f115537b3bc73503c36ad169b2a542f | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/3a7f1bd53dcef4bc2d6c374303855a1aa7e1130e | ORPH
   nios2     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/1d4c249887bdd78dab40152ad3a4fcef16458a1a | ORPH
    i686     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/f4a8ff08038a4f172e9409511c41c95a2306eae0 | ORPH
    mips     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/24bd5ae44f4097c374fe43b263254a985e2989d2 | ORPH
    m68k     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/9f1e1a79dad3ba8970f0fe23cbdf843b2795c1ee | ORPH
  mips64el   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/d18b458a600f1f4bd7008d13ad2a56cb22ce8a73 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/f52c1a287a7d86fa90e4b041eaaa4fc77f9038a8 | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/26271a8ecb702e5a1b60aa65782cc144d5abc220 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f696fddeebad98442a0161b69a031fc220b0993a | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/a9ee54817ac18d02760d44fd506da7612fbd00f6 | ORPH
   sh4aeb    |        liquid-dsp-1.6.0        | NOK | https://autobuild.buildroot.org/results/0917c42e56f5cdc0c24eccb5d8505eed9d9d1f61 |     
    mips     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/8ac0aaa171d0908fd75b81b0a8b4f5cd3332b6cf | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/f78f420a880076be811d64c68f71e987c45fdf40 | ORPH
  riscv32    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ef1755ddf276a0c153dbdfd8cfc03f83fb7e1f05 |     
 powerpc64   |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/0b8112152d459b43f8bb309bd1c1ff218e94eb01 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/de5254ffd6293634a09a13bd0657250cf0f9f269 | ORPH
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/895f8ed15944d456b707fcdc5409ad1b64fe8736 |     
 microblaze  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/f1e28fbf8b8c3a039d9e1e7e948f74cb2a97b5a0 | ORPH
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d1310901443d0855896c45d4870496be3cde9a35 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fd4842082032c62cb7168198110de2ee3e325ffa |     
   nios2     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/3f86050e018b68a53cbf2fee151cfe2ff5bf5b41 |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b18b78e52c28da7db23aada362d81b53ab765f74 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/4269686ac952c1411bfacbbbe07e9be0faab0ad2 | ORPH
  powerpc    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/4515a337edcee4d147d072d71c951c23fbc61319 |     
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/4f7170a31840b3626e3b8f33b1b69c52df1312e0 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/dfc8833e9b92b069175e36fb29d80a4cd65d770f |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/d5d59b97017a3a84218602c4b7e1d15e4748ef08 |     
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/78c61489bd69c86ad4dd4aa3b0f24b4c9af7c367 |     
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/d444239c2cf0fd155bdea296ca4ba2d1f8182591 |     
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e1ceccf44d1905a180afada7a469ac49082f6cc7 | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/6d5b70055529a57efc3ed08c1de37846c5e3624d | ORPH
    sh4      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/4725b791f254e9551f2564ce07f23f1be591120a |     
   x86_64    |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/988ab228268aaa066479ea844dcd6d7e01ce3f9c |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/637adbb0aae410546b05cad8de5774944cf189aa |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/cc054d939a688527913b3bd1d500ff79c2f5f094 |     
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/f37bf483b55f83d39b907a9e17dfa8e87b5ee8c5 |     
    sh4      |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/de8f07d6fb3f75eb03b09a39a890b6c0b337113f |     
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5e6899fd1b947f0bc3ed1bef7d3e53d50b64578a | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b40aef35b2d561bb407cc01ad26065698e7533fb | ORPH
   x86_64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/45e06499fac23c870544d6dd5bcd781f2caaeebf |     
 aarch64_be  |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/f061c1a8a8e86c4d44c603e81851fa8f632a4a03 |     
    or1k     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/db5e444f4bcb5caf7690bda9790e4ff540c18159 | ORPH
 powerpc64   |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/9eb2a9ba9a240e82675fcad01d4ed99026cfa23c | ORPH
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/aa1b36e82c234832b5f8ba7cdee2e7fe6a4893d5 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c9e3a93a219e7283d6cd6bf71eb59cf37cf7616f |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/ec350f4467dd392b4de39303b8cf3c0e5864e39d |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/4a8191921aa42c6986c51d60ae1912fcb93b50b3 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/cae197a57842b0b3f86c98477c407183e22989a4 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cc18d91caef90d60f93696967d2cae206db6034e | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/14dc752f319bc43ed537531599874b8bec41f124 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2dd9c11ebcc55a6f90bb0193a2a9c7551ded22d9 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4e766826389de3ddd73efa6a1da6066f975cbd8b | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8b2dc08d810b45aed841a93692d609ab1a366ccd | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/bd66b50eed45b723955ebfae0eeaa11b98c807a4 | ORPH
   nios2     |        zxing-cpp-2.2.1         | NOK | https://autobuild.buildroot.org/results/4d6aeb90acdad85a55afde0dc7effaaf6b46e2d3 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
                   httping-2.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/737ef6fa98e3c5953c5057598a0f9eec67bab0a6 | ORPH
 powerpc64   |          httping-2.5           | NOK | https://autobuild.buildroot.org/results/d0051a200c978268e72a2f7e84693947835d8f64 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              host-rust-1.82.0 | 1 
               mariadb-10.11.6 | 1 
               nfs-utils-2.6.4 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/3b137c1218d2e71efd990511f964bb6e4bb650ca |     
    sh4      |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/c497f99fcea9170e457d3a0105962e8bc41cd45b | ORPH
    or1k     |        nfs-utils-2.6.4         | NOK | https://autobuild.buildroot.org/results/fa65355511665ce11e76229b464b79a399820899 |     
  riscv32    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b6cdf0e283b8fb1d7cee8079e8437834dbffd245 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
