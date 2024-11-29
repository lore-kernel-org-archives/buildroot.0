Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16664D70E1A
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 04:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 930CC403ED;
	Fri, 29 Nov 2024 04:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_8XLt1usOVW; Fri, 29 Nov 2024 04:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C134071B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C134071B;
	Fri, 29 Nov 2024 04:18:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5976EA6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 04:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47D3E606FD
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 04:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOWfSJ9EOAyW for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 04:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D8AB6070B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D8AB6070B
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D8AB6070B
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 04:18:01 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53df1e0641fso1672511e87.1
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732853879; x=1733458679;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LxRIEsR/zv5z3mA/wWwyvG4EB7eaO21QlpiXs3O5OwA=;
 b=nwVVzVQU3fgwhc2OQtbAjA9ISj4Srvc7TQLiv+i+s/SSepqeEfsm/OnjUrRiISJMIi
 7vr0892kkpj2R4Q5tQYE2eunULcvU1ga3qK9XSniiCpF/6Dr0SqsvgbPzxukjqMAEIjc
 LznhCK00c9WQqovHjbzxf0gPp3LMpjcp1s/oZsyydbGAr9StpYwLMqK0cbmXsBRNsbyx
 j0z9t0L6iy5DFCYIRCdD/2I2h1bkcVZMb4mypYzPZ8tRTWQosRGVGvyVMX6Geeg8v+w0
 gOPj0IBmcmoF70AkN4wTg4bFZ33gKBQoKsNanlCgVmS3lsuUxV0u7zQv5hBEXsbC14S4
 huDA==
X-Gm-Message-State: AOJu0YzzGNomso7CEHH3wZmXOLMGEQLKEp+OHIhLLqKardFJ2c8FA5FO
 gmBrVI4/qD3yHM3cmYhLYGcINIFCil0tYDxd/WenS8aC1vphz4LPueoq8Q==
X-Gm-Gg: ASbGncvs7PSEVWTYuA6eCp+mmI4+DOuJOkAfMFlRr7zuUVs7BHLgoASTmbyPfOZm3kW
 2ut55Ky/mtApXaUWeOmkB1iRRBzlhnPrSk5HOmtQhJLysiP1zmIRv9WePzoukO3YV5D1R+x5UYw
 XmFrRICCI+TrGeNQDeyBg7GiVr119o+/DdLPUxoCAZkp8B+nqW8ySv6v9XdeO2it4NRdsZFyWD/
 duXF5E8qDrpGedR21o5GgJvRqc0si+qYR5KLTtecy2ixl2wFTOItg==
X-Google-Smtp-Source: AGHT+IHkPeEtonS+DwWRzMz/Gxl/LtbqhLioFF64Km/ICaZJ6fTAmhIPwAuAVthg23IrrI+14osKag==
X-Received: by 2002:a05:6512:3182:b0:52e:7ef1:7c6e with SMTP id
 2adb3069b0e04-53df01122a1mr6013225e87.51.1732853878685; 
 Thu, 28 Nov 2024 20:17:58 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599953d53sm129090566b.181.2024.11.28.20.17.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 20:17:58 -0800 (PST)
Message-ID: <67494076.170a0220.299b56.556b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 29 Nov 2024 04:17:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732853879; x=1733458679; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LxRIEsR/zv5z3mA/wWwyvG4EB7eaO21QlpiXs3O5OwA=;
 b=Lq0RyuHo1wVEqjVSzfVlPiUYhUeghMstbrhOfY4QC6VYtyy2WeEYX84bDevkkn1a/g
 3YbABnNLPg0mMqHIRhLNU3CzIrFxwJmayP1BMw++juY1OwowRuC74akZBoTQbbgJmR6X
 VAR8Mp3ckVWOkb+FC113u2zVYjrfKsb1G9+HPLcb3lOQJWf2rhW3DbAbnclziOn2eKcH
 w+wUMEUQkc/hSP7F7U9Bb5Dp/4jZChz7s/c1Ij0HTyvdYJj0ejGq9DRMfD2H6CX1mMZJ
 1BI8D5fL3NnXS70Lg5yCoIsJedm2fsSAvcnbzQxhZlwR1VRjTzTJl+uMzvjQevb1Zj7d
 DORw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lq0RyuHo
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-28
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

Autobuild statistics for 2024-11-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  1  |  8  |
  2024.08.x  |  3  |  2  |  0  |  5  |
    master   | 10  | 73  |  1  | 84  |
     next    |  3  |  3  |  0  |  6  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 6 
             util-linux-2.40.2 | 5 
                 linux-6.11.10 | 4 
                lmbench-3.0-a9 | 4 
              fluent-bit-3.1.3 | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.82.0 | 2 
                  libsepol-3.7 | 2 
                   mimic-1.1.0 | 2 
                  ntp-4.2.8p18 | 2 
                 pixman-0.42.2 | 2 
                     ace-7.1.1 | 1 
               alsa-lib-1.2.12 | 1 
android-tools-4.2.2+git2013... | 1 
                    azmq-1.0.3 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
                   duma-2.5.21 | 1 
                elfutils-0.189 | 1 
                   eza-0.18.22 | 1 
              fftw-quad-3.3.10 | 1 
                    flac-1.4.3 | 1 
                   foot-1.16.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gettext-gnu-0.22.4 | 1 
         gobject-introspection | 1 
            host-binutils-2.42 | 1 
    host-python-greenlet-3.1.1 | 1 
          imagemagick-7.1.1-31 | 1 
                latencytop-0.5 | 1 
                  libnss-3.106 | 1 
              libtracefs-1.8.1 | 1 
              libunistring-1.3 | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.13.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.6.1 | 1 
                memtest86-6.20 | 1 
            netstat-nat-1.4.10 | 1 
                nftables-1.1.0 | 1 
                  nginx-1.26.2 | 1 
               openblas-0.3.28 | 1 
                      opus-1.4 | 1 
               procps-ng-4.0.4 | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 
                  ramsmp-3.5.0 | 1 
                sexpect-2.3.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/3b9b206ea420f8633e613d618805caa597571316 | ORPH
  riscv64    |        alsa-lib-1.2.12         | NOK | https://autobuild.buildroot.org/results/a287d3eef7ea5ea9a85b5b35d14e3698df4ecd01 |     
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/898866c21912194bc295fed3f5d0c8d8f7da13e4 |     
    sh4a     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/65d9c13083ec8d1221cb502830618fdea1172b06 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/06116bee214d46b0f3f8d23a1fb11f5a70cacee2 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/ca3f22048efaa2f2555c8a969f2ebbf0221a910f |     
   nios2     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/07e8c8d0d557a43ac68ba7bf24c1deb8a53c700b | ORPH
    or1k     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/e28ad5f83935f9ba551c9f2bfd89ba185bf82096 |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/940e972574319ac02baf22ca27bba479d56a817a | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c01e3736460abeb65f89d8c3885497a51cfa700f |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b2485ac26c8f5387df1756631d592ebe3aef7178 |     
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d9deebaf86f563d6d6ad8a55be196088315e9388 |     
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1c80c3a259e22fdfb759136bcdf2727af756f909 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b58fa0cafc7b0de5ab8e233552a2830c74eba7ee |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/79e355a586393d2b28207c2f8c767effcb59ef25 |     
    mips     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/b0c1df098451c0159c009d571e40fee31f2a0e5e | ORPH
   armeb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/e872b5d614630d27981646b079b4a731822f7f1e | ORPH
    i686     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/725825fdb37729868e19cf3ff1d4b8bf282a8765 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/d36d93acbb73f7f0619cdcd884b8b4002397dc45 | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | https://autobuild.buildroot.org/results/4e19e4972054684253831eae37d219b06edb50a6 |     
 microblaze  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/1ead12b6b2245d1b286da1ab4ceb8448570b9e2e |     
   nios2     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/9818a646d23730c86b1be71d3924840e2c6b8112 |     
  mips64el   |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/90f98b06ce688d234620c27c1011ab3279d14b55 |     
    mips     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/07e63a3ae55e7c98bf02a291e4636a49d9b549ff |     
    arm      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/c716e4bc54dd874c7762378eaf19eed6b1d316ba | ORPH
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c0b582a579ec8997c7a855ab19cb7ff98c7a5969 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4649d6c15d6ee89950fd4204822819b120f4d547 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6b679f7bf6d581d9df6d00025e8669c4d464b6ee | ORPH
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b13412eaf4377088d9244123b41661f0e2661890 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7a6c0b4ad4f10d17c54874ce53d44f284003a501 |     
    i686     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/721f062d02adfec6cbcced66c8c5d6eafafbfca3 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/44a12d867033779265b4315b0799ea9cc80a0063 |     
   armeb     |      imagemagick-7.1.1-31      | NOK | https://autobuild.buildroot.org/results/8fbd4425bc949d26ba96cf83b147902f7aeb61ad | ORPH
   mips64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/e986049481314bdf9e823124c448feb8384aca50 | ORPH
   s390x     |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/ee11d0fdcbbd177a2497bf316a535dadb982a5ab |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/d1036a3f424da87397bf36868d3c9329f434612b |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/44088de82d2a7b8b601e77af144b3f3d3feff958 |     
 microblaze  |        libtracefs-1.8.1        | NOK | https://autobuild.buildroot.org/results/23732256573d2e9e0d0e4f4579f8589e5ef1da68 |     
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/3eb27d48f7163fe9db51f80c6214747ecda24aec |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/0d21ac12ea578608d16e65d5a86fc4d6cf0a7b72 |     
  aarch64    |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/4541e42a9c4cf21a8d4f3d18410811545e177000 |     
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/17a2947f34bfc70c780497b52114569d50778692 | ORPH
powerpc64le  |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/ff47779b6d03ea7ea884451fa2488b01ce06b3ea | ORPH
  powerpc    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/f146d1837c353098736a8ad68783eaf041673d81 | ORPH
  powerpc    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/25d49854094df1ebabdb2845accf6de0447e8e8b | ORPH
   x86_64    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/e4ba866e5ddbb37981f696f8d9653d1712e49c51 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/38b46678ce863dc0241adf61b281735688e6d0a9 | ORPH
    arm      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0cb0a7a6a8d285a82dc9763bf8016a3c314f26ed | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/90371a8124b253e8bde86613b16f976bc22741d9 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a97e492a1268c10150a1185dd2021a3448ae17bb | ORPH
 microblaze  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d120781a9cc238a512e34abb5094be70d5ac9d20 | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/332f55506b38ecf0059358e544b1f28c5562745d | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/5fd8b67d89054cf6f5319fd069cbd3fc4b065025 |     
   nios2     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/d9c1e05742884e7023e5053e6fff53512dde8a88 |     
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/249587f5f4f54f42d6988aca481796a234432dcc |     
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/8a1e0cc4b875a3e9b3927f05a81ed83f1c32ace4 | ORPH
  aarch64    |         nftables-1.1.0         | NOK | https://autobuild.buildroot.org/results/372993882030cc5eb8a5617a99dbf9731664faf2 |     
  riscv32    |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/2b98fda7639380c5d9bb50a7f40a11b0c85f4d2b | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ec885995f60d74170d9ac80afaeb8a712ca6755d |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3e9bad7f2c19945730d1df995cf30b2bf9f04ea8 |     
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/9c5b8ac54265f495e1e8c27491c34367c7ed2620 |     
   arceb     |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/142e2bafb8f62b6be51a890515df5f4fe52f4900 |     
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/3dd2e0ac2c7c6cc5af7671d04920acc3303505e1 | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/bc220153d90503e41dd87d9410b0be826b7de021 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/dbb83f50baa8db55a50437baf68524e8d563e2a8 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/96eebfeb2cc343e9ee99255dc65d3ee947d3178b | ORPH
  sparc64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/92f32c9c2da4767b484254700ab4c48e54acc6c5 |     
  sparc64    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/974ecc3f003d7686cfc104be6ff4b11719704a62 |     
   sparc     |         sexpect-2.3.14         | NOK | https://autobuild.buildroot.org/results/2c284d800e59e41669a5da85ca23e2923eea7997 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cb676dff7f0d47de342747cfc547565c22b850d8 | ORPH
  riscv32    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/eeed9d22e42170417f058ba8d248392adfec9d6d | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b0d780d5907397c2bfcb036fc5822c2aec1b2719 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/037b2bd1aa061658c92668b66f3919dd53a9bb1d | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a8e17055b875ccb9de9d019d2fdd91c0a2fee46c | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

glibc-2.38-81-gc8cb4d2b86ec... | 1 
         gobject-introspection | 1 
                   lsuio-0.2.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | glibc-2.38-81-gc8cb4d2b86ec... | NOK | https://autobuild.buildroot.org/results/88c56954644de7a7c233d495baa24b9cc6383ebb |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/46f22cadce6700e32c60c009aa1a4cd48dc5f6f0 |     
microblazeel |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/20123b24b9391e58600bfed26576d3fd8749a973 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/31c029a2d3939f96672263cf9af3b85e0cb387c9 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  curlpp-0.8.1 | 1 
                 shadow-4.15.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/df8427921e825ba19a198eff48b9664c61186030 |     
 aarch64_be  |         shadow-4.15.1          | NOK | https://autobuild.buildroot.org/results/bfebd05c8814d1d48f42242fae320029738506b0 |     


Classification of failures by reason for next
---------------------------------------------

                   cvs-1.12.13 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
              libopenssl-3.4.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9fb266d93db4e22affe9cbc35d1117076959339f | ORPH
  powerpc    | fs/romfs/romfs.mk:32: /home... | NOK | https://autobuild.buildroot.org/results/1b238e34ab040677715bc28e0909595dadc432a0 |     
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/c202cd19c30df2e37400281b56788384e82f935d | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
