Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47C0CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 03:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F5D61163;
	Tue, 14 Oct 2025 03:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIK025CiwRdU; Tue, 14 Oct 2025 03:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0AF761090
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0AF761090;
	Tue, 14 Oct 2025 03:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C9CBBC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 03:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 837FC82F14
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 03:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvyd3WZvUAiu for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 03:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5F42822CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5F42822CE
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5F42822CE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 03:26:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46faa5b0372so29203365e9.1
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760412416; x=1761017216;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NfqHlNM+IK0coKA7fE5fuTM1oNHFk6q49/vHa6EK5Gk=;
 b=HZhWlVVA+DON6caojeZLgebR85dTeCaJA7Ot9dqb+P20eiIi0EJHG0ZmgFQrKdRiOe
 YLvsVBCdaTJEMHUHqsvLi+djeanbuH1KBnj/thMRp5L9V1o0taTdkEYtViOCiKLBAmXh
 fU+iGipvMiB1uUAEt1Noa3cHkQp5QezrBNYSzpKXyIjW1hMjNkWIaMdnLZDyIQiuhxiX
 dHKbcoZZOqcMea0T6JtRChk5X/ZjP2vSdi8oh5LwLmGMCwY9MREoFxth6SRfG4X1K64h
 mhdnv/Jxt6rBAWmYmidXOZ8vRPsa2hzlm3JkJ5tFNEOiRczv2X0IzcP0++W2ZQZYDHCs
 FnoA==
X-Gm-Message-State: AOJu0YzPOC+xFoFsr5UPeOOBf2TH2J/N8wCWbiMfSb8MQ0MpzGMBRuDH
 6X4yOwK2NuF2ryn/CdtMzTSZXlx74z8MUvJw1ZNX/54sR05QO4DmJv5Svbbvfg==
X-Gm-Gg: ASbGncu7OO98Sljp2gIuMKD0colvTCU0IIynurHGJjF73haDeqDW/gi4Cqf0t0OXfFT
 2CmOFF7mbVJB+y8fkR0QACyaMl98gNWOYDW+aWUoBwdEnXtJp4mBtuIUksQPdnW+bW2FYEbY7Ge
 eIfL2PgJ26WU/1PivO3t3jCstVkfHRwsLUnBJguPZtCN87XgkRY9GZ1FOkKvuju2kcU9AukWdjR
 xOD4/FVE1I1ZKTmqlWifEQ+Ga6gxQHF5nYNpzRlHxzhItYvHT57aa3fCiI/E1E3xwp1G/Km4X6K
 yqGNh4pT4z/BmLo7FOhT7k6k1/zgE0y/kNLAffdqzlivM/C2IhhXFwdLais8vAD9/EOt+37L0Sx
 DDbOUFoNh+a3Zc9P5YvTKR0yjo9XkLz4YvA1U/FL2o+fsts3Pw8pWvQd7054=
X-Google-Smtp-Source: AGHT+IH46y6QaSmswJm0ZpbPDywtncD3oIQ2RhjEukI/oSpk+8L7QkF3R6cj4Zr8z/mW8DSfNwsTaw==
X-Received: by 2002:a05:600c:4450:b0:46e:1fa1:3288 with SMTP id
 5b1f17b1804b1-46fa9b1ade1mr192714765e9.34.1760412416032; 
 Mon, 13 Oct 2025 20:26:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49c4027sm212388015e9.17.2025.10.13.20.26.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 20:26:55 -0700 (PDT)
Message-ID: <68edc2ff.7b0a0220.88909.6a05@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 14 Oct 2025 03:26:55 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760412416; x=1761017216; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NfqHlNM+IK0coKA7fE5fuTM1oNHFk6q49/vHa6EK5Gk=;
 b=mirN0XFVlaPZ59hVJwiFkeL5YrYkaYfh50KjioJeqSWqAuhZpy+nUd2GtdUQDLcNuQ
 pxSg5tbEGI8lXcqINb7YRA2F2ZV0Q7VbIaX/0kJfHTDjctdaoVLRn90czjqnzOwSrgS+
 KTzVAqH4c7vWU6x2ZrmIjgRISa/WAYYpA49FPNfMO6hxo+fnFWiZC8JXhRhMZljg3RI5
 RpG2BmRNuHG/QW2ZiT2dxY3/RdR8fwK4tp/bZkljGl0TeJUeLBRsyKc5PkAcPX8S7wY1
 queYWlwL//Zg04GPjvyiv9U5icxsN45pGUBjYobEKyM1X6Yx/I5Hy7b89RVmSqdPJZKv
 9Vog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mirN0XFV
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-13
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

Autobuild statistics for 2025-10-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  7  |  0  | 10  |
  2025.05.x  |  3  |  2  |  0  |  5  |
  2025.08.x  |  2  |  2  |  0  |  4  |
    master   | 33  | 87  |  2  | 122 |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.40.2 | 5 
                   cvs-1.12.13 | 4 
  gobject-introspection-1.84.0 | 4 
              libopenssl-3.6.0 | 3 
                       unknown | 3 
          aardvark-dns-v1.16.0 | 2 
               bctoolbox-4.4.8 | 2 
               dvbsnoop-1.4.50 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
                 host-gdb-15.2 | 2 
    host-llvm-libunwind-20.1.8 | 2 
              host-swipl-9.2.8 | 2 
                  iozone-3.508 | 2 
libdbi-drivers-0bfae6c43134... | 2 
                 libgee-0.20.6 | 2 
                  libsvg-0.1.4 | 2 
                  linux-6.17.2 | 2 
                 linux-headers | 2 
                    mpir-3.0.0 | 2 
                 siproxd-0.8.3 | 2 
             util-linux-2.41.1 | 2 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
                 babeld-1.13.1 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
                     crun-1.22 | 1 
            erofs-utils-1.8.10 | 1 
                      fio-3.41 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    gcr-3.40.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
                haproxy-2.6.22 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
               host-ola-0.10.9 | 1 
        host-sentry-cli-2.20.3 | 1 
            igd2-for-linux-2.2 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.27 | 1 
                  libnids-1.26 | 1 
             libstrophe-0.13.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 netsnmp-5.9.4 | 1 
                     nvme-1.12 | 1 
open-plc-utils-1ba7d5a042e4... | 1 
                   openrc-0.56 | 1 
                openssh-10.2p1 | 1 
              php-xdebug-3.3.1 | 1 
                     pound-4.8 | 1 
  python-magic-wormhole-0.19.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
                python3-3.13.7 | 1 
                 rtptools-1.22 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 sudo-1.9.17p1 | 1 
                   trinity-1.9 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/0bdbe947e8d39ed387e1f182d58b6ae2c0d85c44 | ORPH
  aarch64    |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/ae5d552377d49624aa5b214f87c63018f00684d0 | ORPH
    i686     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/af32a9c4d96efc1bc727a24ccf83ac0c0e623f9c |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/509242937f4d63c9ca7d34dde13bf36a588b007d |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/f3d7092a5fa1c5f50ae1394763768a2070e8a9c5 |     
  powerpc    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/71b74809d21fc9944d0741e34e5c390400004fcf | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7602ecddb6ea2302152ea75664d432cc25f10730 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/73b6ebd16d9fc4c8989ca5b36eb090d8822a3c41 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/bab4f0ce3dfed845e210b4388501751025864f38 |     
    arc      |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/1228a8d78f10f86fb4b4601d3953e568a6e98cf4 |     
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/00b0f19a3bc279ccf14be64d24199a7c12f40827 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9afd274a4d0b6d9c05a2ec44b6801ff2edaae598 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/0c18c9eab47dee47b90e9abd6aa9db9fc379a8cc | ORPH
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6bd4134f770808e1eceda95045ea0b064c92621f | ORPH
    sh4a     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/248d70a520188d922afe2eda8320bd9bd392f231 |     
 aarch64_be  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/f2e4de795f7f9e880b41a88fc3f70e9bac8d52b7 |     
  aarch64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/29eb73beb3161364aa2dfe994076b851205b2168 |     
    or1k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/3647a1c81cc6f6679c49a445755db26bb962f86f |     
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/32f8b627fb1f710f8447ca99ee4454b0462adc7c |     
   armeb     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/c5c7857e102a6044e4290969321a0cc0ce47d1a6 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/884c33539f60846d4cc2fef9b08064da652bb242 | ORPH
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/ce124cce5c69223b1e3fc39aca39f1209f1b26c9 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/a2392d23eabaf6e4aa88ccbef3a82a1610ee139b |     
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b3ca234e6b05b9d6fa62a3cd92c1465ad11b063a | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4bdb67bcbf003d206a1334cef0108a227f3bb1f1 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/32759345642f2ee4baecec229ce34f865a18ad7c | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3d07ca8dd0c1c7fb8710e2fc0fdd848b353b025f | ORPH
    i686     |         haproxy-2.6.22         | NOK | https://autobuild.buildroot.org/results/d36461885bebeff35ff4d892fce626c81e21c1b5 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/95cf60a560a930860e4150c588a71361dd2c3581 |     
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/3cf4390923c193409e5c2e33be37c09b9f1bcffc | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/404cea21a4e4294ecc5f286fcda51ca5698c0019 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/0af10e50a59b95f6d81d15ae6bb40d7d45522ec2 | ORPH
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/11d3f29af07e7fed0d13caf95bcda68e148a867c |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/4bf7150d705dc4dde2fee021277319e987163980 |     
powerpc64le  |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/82f73282faab2f7efd6283ae9875b9c5f33a8900 |     
    sh4      |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/fa0d483bb909d9ce3204ca03ec2b2dac7bf610aa |     
  sparc64    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/52aac6f9265d843964cd8702d3bc62e2b7d15ccc |     
 powerpc64   |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/4c36ef296506b6785238552461a946f5ceeb7ebd |     
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/5a6dee97b544dce1b9faaf1a2b8f7c9188692564 |     
    m68k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0e667a17ed34ddfb90161a71b31b39fb9ceb6ca3 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/64627e456eb1c000159745a0b70bd160f0fb0270 |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7f8f0e833e6a3e2cdc8a1bd0b789a22d688879b2 |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1d72e828253f14fdf0c0ac66c0a6c41daefe83d2 |     
   mips64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/17c65ee41b9c302c53a1d6c11a9d25b3f6f26198 |     
 microblaze  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/25df07d539c84c7e453b8e198da7ca707b37d34d |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/046b12c670ff9c84bc03ee3c9f361d84bbd550fd |     
   sh4eb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/35ee1840fbc95fd6b273ba9d151fd3a374a83bc4 | ORPH
microblazeel |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/edefc5a2566e7296b14a608666fde0b9ded843a1 |     
    i686     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/fba51a70a1553456988930654910137d2e78baae | ORPH
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/2fd075b4c7f8192a41215a9531fe82e785118b94 | ORPH
   arceb     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/22237e751065cbe80d520b45f94bdf356bb17a0c | ORPH
   sparc     |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/cf4e0a13be5901f0fcabeab1234e27baa8e1b8c4 |     
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/63171c8dd7b3c8afb8c5a4a9cf1abe89e3b0f8a3 |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/45b514a7cff7e093d60bb11c2e7ced80a90bfec0 |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/319c171da8322e3ee143a050fcd8e47ae6e1a963 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f83e50e825a7070f327e1ccbabf6791c840fd079 | ORPH
  powerpc    |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/f42e6dec43490f59176fef915642021c42661a88 | ORPH
  powerpc    |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/20ee38453a23fdb23f8db8af1ab9685c045f38b5 | ORPH
   xtensa    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/31c3d651cf7efa9f98f0d4e73769815aede63dab |     
  powerpc    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/bacf69e5df8337ec02b8f9a8366617a39b269958 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/c28febf722adebab0fbcc4a0dd5d403e9c497f4c |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5e11acc8671e01a5b221b3df1346312d9a0ecb36 |     
    i686     |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/1943055a552759bef856c78d7a9d9b0a4a340612 | ORPH
    mips     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/12dfb3b1dc644976d9d33352cc9240253e11fad9 | ORPH
    or1k     | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/f7560487c0f6553b658f8854263f8652ff2e3342 | ORPH
    i686     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/683aafc34d0012b717da5a2ef25db284d3e649ee |     
 microblaze  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/cd3e844d963b1b3ffbff3d3292a28abe99ef8342 | ORPH
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/9de4fb75da9daf2d7d345c9e3516bf67d4f25f0c |     
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c07444301c160483e468ad6472e3ef1905bd4781 |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b74190156c80e6be1ede32e65e32915472ec449e |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/c54c1b966d5e4f535f1b0db235da624455fabc34 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/7a7cb0888b970b16541f09f1a7f308d223a3280d |     
  aarch64    |        php-xdebug-3.3.1        | NOK | https://autobuild.buildroot.org/results/c75593aab76856d533cdd1bec88eae04b161e7dd |     
  powerpc    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/6f0b64a4b545e57378fa04d589700777912e6d78 | ORPH
powerpc64le  |  python-magic-wormhole-0.19.2  | NOK | https://autobuild.buildroot.org/results/aeceba1de3fe64724a628d62b8db95bd5ae5a723 |     
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/da1c88a0c8e23d355351be699eaa975294944fad |     
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/e23a1764f09bf87a3105804afceee18735c57bab |     
    or1k     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/d0ed111801f8c2426a92e61bb95eece14fbbe40a | ORPH
 aarch64_be  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/01ff10d8e4f36c668f7a888736e2b1f2f7d2d843 |     
   arceb     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/e4a3c04530b9b23451a5ed0df4c3f22568326f6e |     
    mips     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/17e4e3939056565760749d2f019899630982dc04 |     
    or1k     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/fd1d166c16f480fa624ef2e6a8818d16e27ca7db | ORPH
powerpc64le  |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/282e3fb7569b43c7f7117236d00a96b83531aa48 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/6076901fef0addc621a8c95b33d116854de1d9d8 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/85ec00c872cc5c67ebbbad8488eee449c74f6e20 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1417e976aaea0e72ddb73ee856561f15144377d6 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/3d0006b594e5f15a11839d241fc1e2de32a17011 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/4cfb8b1a071c9be033696647eb80d705536af1ad | ORPH
   mipsel    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/67bb9803adf09efca18a4ed4eaafecb8de4786f3 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               asterisk-22.3.0 | 1 
               dvdrw-tools-7.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/868ba3f591c543633fde02d08994d5df3a5603f9 |     
powerpc64le  |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/554fc1e6094683f7bbe40620539a1d6dc257cee2 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 c-icap-0.5.10 | 1 
host-binutils-arc-2023.09-r... | 1 
    host-mender-artifact-4.0.0 | 1 
                jemalloc-5.3.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libglvnd-1.4.0 | 1 
                 linux-6.12.51 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b4c97dfe41ff31f860d7d8aedd51d9f2cb916ff7 | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0fb08dc7e4f665f7b42a0178232bc8b00a8595a4 |     
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/780c8f3b813403f25d9d51893c39632ae1062082 |     
  riscv32    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/30574d138369e66c12db511460ceb1fa4894ae65 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a56ded5ca349c394c1e54cdde26841ff9bdd6be7 |     
    mips     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/5be0ada381decc61c3562a334fd4b0502c22199c | ORPH
   armeb     |         linux-6.12.51          | NOK | https://autobuild.buildroot.org/results/bbc9299032f6d0205f8fa6811b19cb2a3be3c8da | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 linux-6.14.11 | 1 
                 rtptools-1.22 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/7a660a692b9a23c5351a83073e017d3f92c540bc | ORPH
   mips64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/06c84b902c0cd2317ceb269af540707911240537 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
