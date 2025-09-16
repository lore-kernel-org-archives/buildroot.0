Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CB2CAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 03:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 158E040430;
	Tue, 16 Sep 2025 03:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBWKTKUzYvNs; Tue, 16 Sep 2025 03:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8921404E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8921404E4;
	Tue, 16 Sep 2025 03:19:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EDCB12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 03:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5089740609
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 03:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81Q5Mt8T3K8L for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 03:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9147040616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9147040616
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9147040616
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 03:19:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ebc706eb7bso713172f8f.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757992794; x=1758597594;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QBhbNbKdMK/hMyM/gqFuq/gWIIJi1tK/fgyI5P7S9+c=;
 b=UkfEcwx9eKqQkk/PseuHJldGkdcLhFt2bbCIohtnzcNgL8sa6aKEmmquIPl+cIVhqL
 SzlXYFU1o4t5MSQMDrlBUnhPf6FJ5dJHFMypdcbRFT9vfCkY3qM9DMpxcBKhj3akPXFa
 KYKKJGQCHHHWRxV1xv2wBmMcAkrh3hAtoDbMa1FHs+B42nrNrsDpCUP/DnRniMZDMCYM
 +3OjKSCK+dvu165RKC6SaNqswnM6LdBgLMYK13m8FJmyRE/flGSXv+qzyv5ahjNo4SYt
 8LlgCPYGEOPRvlQECeeNtuu41l05ABpog/QriAPNojCvbFHeSbZLqpHoXO4ONWzPuiyh
 b5FQ==
X-Gm-Message-State: AOJu0Yx1Ro4OObSOMnDF79PjNlMLTs9gTr2vsv3BEwLs0wloisB3QEZp
 qhEA/KxQbtgYKncX/mAbWNaqAzJhWW0QEssD5bjORRaU3DWey3aHlBLy/5qk6A==
X-Gm-Gg: ASbGncunqlDaNqQuCCLr4SK07u9qNEteW+JB7iKtHWX1ZH2P4oe348KomWD2XyfJTH1
 vgLWkJRkrTochUR0JBu2RWDDdHOVFU8sagWF9oPDZU+C0J7MxF6XZvA32UcwWyOGrMGBipmvbeH
 xfx5F4Se2gpm2qFWoutZIYBJyvZ9zJAAgOcC7cFOIqHiGxsSzPqNnpBfHxTNzFgiIcA5hrt6oyP
 kRoVQWM5Jx0tzJuQ/K/MKTH/HXrHMF0nMHDW5U1MUhWiBQo+4g0VmBx00rq7NrzOtXIOViQvZgI
 pnmXUB78hCfArHs+ok/SIWUyhKz0QUob5LnXSLFchvbSL/FVHW07F3/XwDQKZ2XAbRwjd+1nt05
 Vz3ctIoLPMK2Bcluf4ZZC7PjKaGGaJQ==
X-Google-Smtp-Source: AGHT+IHpUl6sPnQMUGfstjCpYpr48+oh1kdoVjbHuxyuDwJn/CEWzapv8PZjEQSwgYX/0VfVO/stQA==
X-Received: by 2002:a05:6000:40da:b0:3e5:4da4:d87a with SMTP id
 ffacd0b85a97d-3e765a050d2mr11844949f8f.35.1757992794239; 
 Mon, 15 Sep 2025 20:19:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e96dee54d8sm9966314f8f.12.2025.09.15.20.19.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 20:19:54 -0700 (PDT)
Message-ID: <68c8d75a.df0a0220.21f803.2677@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 16 Sep 2025 03:19:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757992794; x=1758597594; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QBhbNbKdMK/hMyM/gqFuq/gWIIJi1tK/fgyI5P7S9+c=;
 b=FhZeT8erbc//k3JC8y1aayOWI41xZZhHlLHkHfXRYhthOMpoV79Nz2K69/E9+jCMZ4
 zuzaof4oTn9tAvVNrAS9mZFPgnFPJ8lbn6ike2AmQUwtIPBqQ4loCb4x3j7h++S59Xik
 IAcTqSHkHb1QE0anZr7Ao+GPamsTAFZ44VGevLNttrxs8LggPYQFNtiVNhw4tow/+748
 8ACeIRjdLT6mEUGHvxjoTZvaDvKgiDqL79Sqsfc7OoLtpaXem55DSlCtoeyd3x8c7kv7
 GuS6aCTAoUV5HakEl9TF27JTRb+G1sBlVKXZtqyE8WX02HGLLRxz8om02zyHMQT/a+2y
 tJYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FhZeT8er
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-15
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

Autobuild statistics for 2025-09-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  9  |  0  | 15  |
  2025.05.x  |  1  |  2  |  0  |  3  |
  2025.08.x  |  0  |  6  |  0  |  6  |
    master   | 26  | 73  |  0  | 99  |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 6 
libdbi-drivers-0bfae6c43134... | 5 
                   foot-1.16.2 | 4 
                  linux-6.16.7 | 4 
                   perl-5.40.2 | 3 
             berkeleydb-5.3.28 | 2 
                   ccrypt-1.11 | 2 
          chocolate-doom-3.0.1 | 2 
            igd2-for-linux-2.2 | 2 
                libcurl-8.16.0 | 2 
                  libsvg-0.1.4 | 2 
                 logsurfer-1.8 | 2 
                       unknown | 2 
        vulkan-headers-1.4.317 | 2 
          aardvark-dns-v1.16.0 | 1 
                   atop-2.11.0 | 1 
               bctoolbox-4.4.8 | 1 
                 coreutils-9.5 | 1 
            cpp-httplib-0.25.0 | 1 
           crucible-2023.11.02 | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
               freeipmi-1.6.14 | 1 
                   fwupd-2.0.4 | 1 
gcnano-binaries-bbaae49a0e4... | 1 
   gdb-arc-2024.12-release-gdb | 1 
            gstreamer1-1.24.13 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
 host-softether-4.30-9700-beta | 1 
                  iozone-3.508 | 1 
                 libbson-1.9.5 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
               libglib2-2.84.3 | 1 
                 libiconv-1.15 | 1 
                 libjcat-0.2.3 | 1 
                  libjwt-3.2.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    musl-1.2.5 | 1 
                     nvme-1.12 | 1 
                openssh-10.0p1 | 1 
             parsec-tool-0.7.0 | 1 
                pipewire-1.2.8 | 1 
         python-web2py-v3.0.11 | 1 
                ramspeed-2.6.0 | 1 
                 siproxd-0.8.3 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/5f62bc55e2ce661b25971857b91d22f02c09be0d | ORPH
loongarch64  |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/80726b36f8e77f55ba515ce26affc440496c607a |     
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8675c012f3e622c634dedd4e24ca479c9334eb10 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0ee50c2da0c69975294d1b45e257a396004b73aa | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8654da5099dd8307e0170aeed702db18e36a3a2a | ORPH
   mips64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a842b876b24986087a0dd2fa867b8e4b2787fdbd | ORPH
    i586     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/98dd606085806f68a0bb752523ba8c30669d7fdd | ORPH
  sparc64    |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/e590542d0fe6d90fa88ee3b7a9ff1376c6c89055 |     
 microblaze  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/c02d41d8c76f100fd84a5501f2bc92eabdfe137c |     
   mips64    |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/6c4c54adb83ce1f6186073657b8295bbca6e918c | ORPH
    mips     |       cpp-httplib-0.25.0       | NOK | https://autobuild.buildroot.org/results/9753f3e6c62d1e72dd7b7ea0436af4edce3073dc |     
   x86_64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/edbf8add6ae50996943a5127b201464eab5969e9 |     
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8711c3c791c553b75ad55f102fd37373a0b79cff | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8eb56d2e10c0071bb92e79a6bf9b13c7bfe83575 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e056ea2dc2d35ecaf3cecf8d02152b62fb81d0e4 | ORPH
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1edf9e0ea0497039d239df60878801b99f61f993 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/43e0c522c4409daa87770fc42ad0a71d5363524c | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c27410e7852de28528b70fef0d1bbc69bcfc3ed8 | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/8505f3d18ee9e2564a273ca8c0b48e5057e937b1 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/43b47158fc2d92cca192b1ea72ce1251331da610 | ORPH
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/3c4e7ad9cf0609894fe0f3ee75d839ae60750398 |     
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/f6d0ffc68bb0f394b8610b42905a195f9d4054d7 |     
  powerpc    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/be2654e5e62b95ccef9774959aa5b8bb96125b9d |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c712b581b6006fcfee20a1a8fe61153072bb8f64 |     
microblazeel |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/b957329a49f8105bc4eaab0b504bb1eb5f1d4a75 |     
powerpc64le  |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/1bcfad53719614486fee989d582a8a7dcd89db4d |     
  aarch64    | gcnano-binaries-bbaae49a0e4... | NOK | https://autobuild.buildroot.org/results/c6626222943d443cea130bf443edc427192f1cd2 |     
    arc      |  gdb-arc-2024.12-release-gdb   | NOK | https://autobuild.buildroot.org/results/95258fff9fb6b0291175d4f565081a5f6c3e521c | ORPH
    m68k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/3eb8cc96e560a95af029299d72c97785ea434a1f | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/df1ed45dd7a7b947dc812afc635cf84d2c8a61e5 | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/650b86b35753c0cf0874ab5fdde54d919cc7cfe2 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/5a7cb1e21bc4ed992d1650fc61f7dbe345b3f269 | ORPH
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/08a154a0e680272b773893e5a4a5bdba359e3a22 |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/80a9e688a8fb730c3ee34e9c34c4741362dd3d46 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/8cefdb0b79b23e85b1e85901ab462dd8d51a6b3f |     
  mips64el   |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/e70aa48db6e9db8babb217c056e1aabe40417142 |     
 powerpc64   |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/58c96d7fa1121a6374b5bebcb88298b0869db2d3 |     
powerpc64le  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/5cf770baf9cdaad19a600267dc77b1213671a000 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6334cebe0914a3800d1358e358adaba7af178021 |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/571e630d2a96b1052f1987b2bbc86b641ba26695 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d55c78127312e65aa156318e594aca79df8ca877 |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/362a3207cb85a86b3d349973b5dff0a9ed6889ef |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/0d5d7747b70625f9b29de67b47e9118e7db09582 |     
    mips     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/4223d978037a494547d33cb8ab50619b468291ee |     
    m68k     |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/62a82d2e726026fb183fbe3d6f86747b4c4dca56 |     
   arceb     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/18f2225c7d4de6d649cd72a3217ffbda55d34ab2 | ORPH
    or1k     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/4bc99f41fe3d19a1985e254914d9f2bd07e7469b |     
    m68k     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/1a37e9892a11308413e7c570d2fa52017c83e13c |     
 aarch64_be  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/dfacea45e44899333333e1e7fe6e11460ab70a31 |     
    arm      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/9f9c7d1025f9c6b962e45b7666db613f751781ad |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4ef1a3c6530679713df217ca906bf119fec1ff50 | ORPH
powerpc64le  |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/c0094f1ae1e2656c312b00005e73f69e854a2fff | ORPH
    m68k     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/b99d6af64381955ef2609b4964ab1c773cdca161 | ORPH
 powerpc64   |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/d1b45f0f0db1ca4ce48f8af5c7cf1d54b5da22e1 | ORPH
loongarch64  |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/5281d5ca2d00e74022e2c7a4daf9c0bf044b7f46 | ORPH
 microblaze  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/a67bc9ff8ed43012ce0eff6eb2a621b5b9a158da |     
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/5a65a298f101a17c6ddefd4fb759c23071b81205 |     
    mips     |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/420b52d3c4cff3b8b0d1f71fe848460c28a6bfdb |     
    arm      |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/146c2da768a50323cd9bd3a7321143b4b21608f7 | ORPH
    mips     |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/74401f15129343958ba58259a383ad862567b597 | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/39e8c6d680f56bdab47e318f7ca6783d89d324f0 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/61e77c911d997797c43ea32bd4b89b77d7197d12 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b19d7e171df536d040abe37913028161244b35a2 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/341c36d134a4837e39d44a7f81d522538df6d7fc |     
    or1k     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/b746629c4b1c07eb552c39eeb238a41a500bda01 |     
 powerpc64   |     python-web2py-v3.0.11      | NOK | https://autobuild.buildroot.org/results/6845e1a7dfb154f8a0c2f7f5a1e9931c5e0fe5eb |     
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/4ab946012eba641690f0997847cfb2b127e98e24 | ORPH
  mips64el   |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/373e861c7eb98e5cb9ba55635195cd5c9a3b7685 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/40e7b3fbb6731133db4986f6d6b71e848061abd0 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/be3dc8177ba382b6ec8c567fd9b4ddcf9971ca39 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/5d574ef558745b0e9687cd554a79ec93f1bb2c16 | ORPH
loongarch64  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/ad2cd11d1ad35c267505d3e1a33a8ad6b47ec2bb | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/023ed6a28ce617625f399e834028edfd8bf658af | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               asterisk-22.3.0 | 1 
                  iozone-3.508 | 1 
libdbi-drivers-0bfae6c43134... | 1 
              libopenssl-3.5.2 | 1 
          linux-5.10.162-cip24 | 1 
                  xl2tp-1.3.18 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/c51aad261b20889f5ac484c5662b34f3deb238dc |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9383403402b15e371dd3d41568802cd24d87a288 |     
   sh4aeb    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c7e0f63c4ce7553f6eedd32d93c33cae61ca1777 |     
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/f330ed8d61ff15cfa44495f7ab02e1593db62ac5 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/fbeffa82c3f2bb5d91f8a8be317146139e2aa941 | ORPH
  sparc64    |          xl2tp-1.3.18          | NOK | https://autobuild.buildroot.org/results/02956d124d16d85adee7263e02bae24c987f6105 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
               bctoolbox-4.4.8 | 1 
                    brltty-6.6 | 1 
                  ffmpeg-6.1.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 host-gdb-14.2 | 1 
                 logsurfer-1.8 | 1 
       python-flask-cors-6.0.1 | 1 
              tailscale-1.78.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/3911e024d4b0c34a6f2ba47f86a0e2472b96b9f1 |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/cc01f1710077e646e13bf8078d5e5f6beedc9259 | ORPH
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/9c1c98f9a1ebb732f665328293aa7b81703718fd |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/f49e038f165a775a628eb52c362706827fa6d3fc |     
    arc      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5f11b4906d595b305055889bf08faf45b61fc97f | ORPH
  aarch64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/e4d6881c2119111b7959e331fd47b7a36b305a20 | ORPH
   xtensa    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1daf648c98cdbf08e799e15468201f082c082a0d |     
 microblaze  |    python-flask-cors-6.0.1     | NOK | https://autobuild.buildroot.org/results/1ce0a1973f9f6a5edc72a979c237e8ffd3d12c0e |     
  mips64el   |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/a2ddde54e3b98c325990460a32b33b156d9a4386 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              execline-2.9.6.1 | 1 
               libdeflate-1.22 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/321fe8e7b7b48626321aaa4a11db236a1af01547 |     
  aarch64    |        libdeflate-1.22         | NOK | https://autobuild.buildroot.org/results/e3dc47e1d9de6c2f682c1248a0d2cd129bedb4cb |     


Gitlab CI results for 2025-09-15
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350021516 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350021429 |      
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350021251 |      
                TestMdadm | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350021207 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350021205 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350021196 | ORPH 
           TestDosFsTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350021072 |      
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350021050 |      
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350020946 | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/11350020944 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
