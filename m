Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B073CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 03:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFB8840F63;
	Wed,  1 Oct 2025 03:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1t6H2wTIsioh; Wed,  1 Oct 2025 03:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4EDB40F64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4EDB40F64;
	Wed,  1 Oct 2025 03:22:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4168F113C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 03:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2817C61200
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 03:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWqVscMrxfoT for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 03:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 693C7611D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693C7611D6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 693C7611D6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 03:22:30 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee1381b835so5572185f8f.1
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759288948; x=1759893748;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AOUhUbkLheOFzT+5AfWjzu9cYkf+fF+mubFZXKZW6lA=;
 b=rrj17kNckHr63G/KrdjRsAOGobdmxToKo4DTMIilNqOw+EXBgZedbCqT6VleJuNaNl
 y7oM+RhwakXrz4hl2VbMR2KLfO1uV1mYoeSSvsTrj1jFBiL2ppMnj+o3gS3r2hSRoUOD
 +vbYWgZHkleMWakO7Q4l+ao/AHoUKDDYbIPCXb4jjOIm4JubQxy5xpCtoFJWNsWvXG2f
 XJjCU+M/ygDtwZ8qOyACrKjwuq009RIYH4Mps7gmf0LViIMHItYHrXEVSOi95MPJjJu3
 giYgQyUXyLFj0ltkW6UeC6aRjqG9H8w1A/cvKw1KndFcGfXq+lTR2KDSuS6bAjzmnuI5
 3qtQ==
X-Gm-Message-State: AOJu0YyUu2R7JBQz9zQoJfdx40nhsjXT01viHU8Po/Xh97NBWJtigNsF
 tjxu/u95I8/AxKX0CdXeX5ApdlXpH9sJDCuA4tRZCwmX4yB11Y1MRQQRIpoPMg==
X-Gm-Gg: ASbGncuo7c5/MDSf3NJDoMEft4XZuUYllodsvfLWHXdStsox+AQ62wEDEE3osePrhrt
 sAnvAS5+WW9YyMUDpZv+EDA3MdEWbVGwhtERzzSvkLjAOHwMv+Xaz23p3xd+dJvHzYnTxtc4uIK
 kQ1c72mb3DxYkaW2U7UzoYzHJQwRUWVyJKS4OAGflZvYvMFeEtcAvS7AR8wmZKkt8bsFBmvORoR
 X/ncnjYQkbyTgHAgspHtYJzJS9BGXzzNhD6kbvq44wk46WRNYGOQr784AxCdjiqne+bS2xHolFT
 n8dC30y+ruDuY0pIipp5aO9pawTnRuHXW0nzP/WH+97aIYTLJw5VKIofhu682YZ5MIAxU75YjFA
 9Z2RLNobM8pU5ehhpxnOAfkdXvjp+8HWRs4l2/OmUyNwx17venZxctpwqgx8Ftt/n
X-Google-Smtp-Source: AGHT+IGf+ttfufkhc1veh+k0OIVlzvzm478WfQiyDgrE2UfFvmXp9NESDEMoTTJHGcLh2lC0uGU7zw==
X-Received: by 2002:a05:6000:1ace:b0:3e3:f332:73f7 with SMTP id
 ffacd0b85a97d-425577fe211mr1394258f8f.28.1759288947893; 
 Tue, 30 Sep 2025 20:22:27 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc749b8f9sm24594601f8f.50.2025.09.30.20.22.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 20:22:27 -0700 (PDT)
Message-ID: <68dc9e73.df0a0220.2b3e39.b0d7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 01 Oct 2025 03:22:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759288948; x=1759893748; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AOUhUbkLheOFzT+5AfWjzu9cYkf+fF+mubFZXKZW6lA=;
 b=Y+3ZezZ06X0i5G3Qhcyj5mX653NYxm3t0IKl1GZkhkqCNtBhhLaQ1Ii4MNZZ98aUgk
 TkBlJkawP15jCy0jP3PceIZzWJqFxncVOHf/hDuO++Hp1deQa0ZpS8OvomdSnGC0KpCM
 2Z9nZs3uAliu/k1nthM/VUrsi7y+SwbDH0RHL72RLjoItC/+HnCq1RQZR01DNisYlgJy
 GBsfwMRXNBAN+JLnY27/iyd4ERJmeYceT3bnr1ir0BAOYbbmLpWCANMldAv0smZDO2R5
 X67taYF+35EIZ0m+Aog6mluriV3OA4koT13j3Ey0Mbbws1mF5M9TO4kL9NJb5CJ+QKjr
 UJrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y+3ZezZ0
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-30
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

Autobuild statistics for 2025-09-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  1  |  0  |  5  |
  2025.05.x  |  2  |  2  |  0  |  4  |
  2025.08.x  |  1  |  4  |  0  |  5  |
    master   | 36  | 82  |  0  | 118 |

Classification of failures by reason for master
-----------------------------------------------

                    mpir-3.0.0 | 6 
                       unknown | 5 
        vulkan-headers-1.4.317 | 5 
                   cvs-1.12.13 | 3 
  gobject-introspection-1.84.0 | 2 
                 host-gdb-14.2 | 2 
    host-mender-artifact-4.1.0 | 2 
                 libgee-0.20.6 | 2 
             libgphoto2-2.5.27 | 2 
                  libnss-3.116 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                 sudo-1.9.17p1 | 2 
               bctoolbox-4.4.8 | 1 
                   bird-2.15.1 | 1 
                  bitcoin-28.0 | 1 
                    brltty-6.6 | 1 
                  cairo-1.18.4 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 erlang-26.0.2 | 1 
              fstrcmp-0.7.D001 | 1 
           ghostscript-10.05.1 | 1 
                haveged-1.9.19 | 1 
host-am335x-pru-package-5f3... | 1 
    host-llvm-libunwind-20.1.8 | 1 
                  iozone-3.508 | 1 
                libcurl-8.16.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libdill-32d0e8b733416208e04... | 1 
              libmhash-0.9.9.9 | 1 
                  libnids-1.26 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libpng-1.6.50 | 1 
                libshout-2.4.6 | 1 
                  libsvg-0.1.4 | 1 
               libunwind-1.8.1 | 1 
                libxml2-2.13.8 | 1 
                  linux-6.16.7 | 1 
               linux-pam-1.6.1 | 1 
                 lockdev-1.0.3 | 1 
            luaossl-20220711-0 | 1 
            micropython-1.22.2 | 1 
                  ntpsec-1.2.3 | 1 
                     nvme-1.12 | 1 
           oath-toolkit-2.6.12 | 1 
                 openmpi-4.1.8 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               procps-ng-4.0.5 | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.14.3.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               syslog-ng-4.8.3 | 1 
                 systemd-257.7 | 1 
uclibc-ng-test-132c6134d691... | 1 
               valgrind-3.25.1 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/42b98b6e11447524c5316a0efa32213eb5f9196d | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/aaba334e4b0980324933f7aa24051ee995c3ee41 |     
 aarch64_be  |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/1e21a281ef7c7f883b4d36c22d5a17c771146305 |     
    mips     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/4785c7448e66736ac4cd2a89cc9038b85c550db1 |     
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/5545742728f0056b5814aec5afb47dd89fee0bfc |     
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/0eda7313b4582242028a2a32b59efad24632c409 |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a9a184e8506e11ce6f90b3fb65dfeb66b361bf23 | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d391670d485029d601f49607d73cec7641412d94 | ORPH
    arc      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/59ec8abbd4638fbea6fbcb2ee43aaae2a2fbe3b0 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/5230d1f962a2f1a5f39f92154e9b0c138e3ebaf2 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/a3f5fe54922ecc5e7fafa12c5b50ec0da9faa78b | ORPH
loongarch64  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/c7a37b9e93ea04237da66bb15edf1ea4e6195dc2 | ORPH
    i686     |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/98961c4638de35d742c230d683bfc5055d65dcd4 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/326bfc457a82327715555e77bb2fe328fedeb9b6 |     
microblazeel |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/05883e94aa3d9c3275e4e41404f74b1e94b1bf82 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d1388b23ee49e293ef4edb2ce0c288691d664dfc | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/80e2abdeb637be0cc87b7577fb3a14636b094126 | ORPH
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/cdbfa2f235f137761779d4a2caf96a9d100db35b |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b36b5f83ba6afbb373775bc48bc726ed429fbad1 |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a84d4d4ca31224d8cc272d0cffa9b5a561e55f75 | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/cdf1f3c83fe4f246c82aa20df8d360e6c66fd60f | ORPH
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/5d976120202d0b13949e08c92c6273f95f4505ce |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/290d21c0674128bdb2882094c9dac6e6e74e1b00 |     
  riscv64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/f71c87c0b890b40f87d044e59bbccbd065367272 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/66a8f651071d102e0dbce3543189553236b4e94a |     
    arc      |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/715db9ce5fc362e96144161461d2af96faafd0bd |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d31d223361c77adb51d40cc81d3718bc3f4ff233 |     
   armeb     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/197e0ae7fa92e466c3e5b3cb76e46aa48ced84a1 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/6022fb1645091ba87c2c6a7c0bb94e321b6cfef4 |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e36209d5e69422a1b83834828bc082f3396ff561 |     
microblazeel |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/e54a86db70e44be99d6b73ed68e06f0ececfe14a | ORPH
    arc      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/c4265015dcde69fc00dad7165bb475e9308c616e | ORPH
    arc      |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/44980bfd1310e9cbbe1e2071c7de632a4455a41a | ORPH
microblazeel |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/1ad537aa6dad92c020e4b24b652a66bad3f96239 |     
powerpc64le  |          libnss-3.116          | NOK | https://autobuild.buildroot.org/results/4109a334c45d575bdf67f35d0877b25955d538bf |     
   armeb     |          libnss-3.116          | NOK | https://autobuild.buildroot.org/results/55cfaa0845716516b4942b938158ba08b595e9c4 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1b5828322a6604e0c316258ce81a39b1ae869216 |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/73f906f689af2aeced3807c7994eebf565ae6920 |     
loongarch64  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/8c4054cd20a0eff0d1cc0751efa8d2edbce58afb | ORPH
    or1k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d08af8ea34c17789339051a10eb192db6cf9b7d4 |     
  aarch64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/4dded5c8ca218d8b6c3191611ab72877cb9f68f2 | ORPH
    i686     |         libxml2-2.13.8         | NOK | https://autobuild.buildroot.org/results/718fd3a49b8390a370c9be1a8a2f4a2d283cc82a |     
  aarch64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/aaa32186020e79ef871ef2ce5171eebb2696c67e | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/52e896fac985edcd924155ff99980aaf90b8250c | ORPH
   armeb     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/a363100473935c72bb2b83fc3b2050738f2d4a2b | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3b7b31c5814f7fc197f8dcf07e3e9191cc63f29d | ORPH
   mips64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/65d476b0b580eebdf121cfbe9796dee250d837d4 | ORPH
    arm      |       luaossl-20220711-0       | NOK | https://autobuild.buildroot.org/results/3bba3b2946b09ea9c7ca8ca63d2f275efa77d3f1 |     
   s390x     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/0e90a01e34d4922ff4ccc1fa1770767c8b461f4b |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7c29d424e8e00e6027923dd303bec26aab5a8023 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/52588f0aeff9d11197b80a42557ec2b6d28ba254 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/87115486d58d71b2f93447dc9bb3938a7c34c958 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f9e0ebc9188d361ddb2a3d268efd7bf97f4a1f07 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1ba7ea222ba2231a901e35f0749753398e30edcc |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/42ce00a013b72fbb3c3d4f5662b466464a4b353f |     
  aarch64    |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/a0e14fd4b5d0235141034332895a8ae21778df26 | ORPH
   arceb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/208c08df3d81779c562ed5304cdd84b76b2e9a7e | ORPH
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/75497b5f7ff0e2cb946743504d3d6b75f337a507 |     
microblazeel |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/85df933682664fc9ade4d8d90c198e2ebe2127f5 |     
   sparc     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/913fc093defb085af62f737880848cfe04baff0f | ORPH
   sh4aeb    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8607862f0d52a66bda875b9f9318aa1b10be6d21 | ORPH
  aarch64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/b7f8166d2f462653fcedeae14a345753daa32042 | ORPH
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/bef8d449177b84ef14bd7d747ba8bff0ba2c9593 | ORPH
powerpc64le  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/36027dac7c059a4c93cd330b5f53e5eea0700977 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/04683a51c6518186d354f40de3378dbd184e81b8 |     
   arceb     |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/dd284e58388c092919dd3196ebfa3a3c6fbf9f7b | ORPH
  mips64el   |         sudo-1.9.17p1          | NOK | https://autobuild.buildroot.org/results/698f1e3a6bb6342ee55128f0fc859e18476573a2 | ORPH
microblazeel |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/23948ebea56db5bea07794ecf2895d468f8bf264 |     
powerpc64le  |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/b8bfc52ecdb1eb2899ab77a906e6161890c5eac1 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/6685ce3a6da626c4b425f193c38b9e4d14549e43 |     
    sh4a     |            unknown             | NOK | https://autobuild.buildroot.org/results/592de00b56a249b54fb1265a07db6148c74b6e25 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/bf88b4569b8d55ce4a76095cb806da9480737a20 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/335a16f5c048f23b40b08cbcb6b871144d08efac |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/90ba22b14b5262095432a43d90d3d72f790746ad |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/0fb0a89b4509a5da46090058a67143424f0e3c0b |     
   mips64    |        valgrind-3.25.1         | NOK | https://autobuild.buildroot.org/results/8cf4911d3b871219ac8d7a4fa3199f240557db4f | ORPH
powerpc64le  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/606023605ebe37ec055cfb8626fb47fec6c5ca4a | ORPH
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/0099111c2d226d397437897321bdd8f923b0a8a6 | ORPH
powerpc64le  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/0deb965367e81bab7606dd094e6f2079ffb514a0 | ORPH
   x86_64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/e11cbfa4ba2b54941e67ffc345ef938a4106fc20 | ORPH
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1dfb1e316945ab6c17227eb060e4a99082b7ac68 | ORPH
    arm      |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/2e813aba3e6efafdac0708f6caec8d6d89ccb554 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 c-icap-0.5.10 | 1 
             dahdi-linux-3.3.0 | 1 
            gstreamer1-1.24.13 | 1 
              skalibs-2.14.3.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/7e773e7e082a6ad85d3c60ad4fdfdb6994857c61 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7550ec66867c12c2c121c510c13f5bce63b18569 | ORPH
    or1k     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/df670d78548095499c075c4c54e7c8ddb7b1e73c | ORPH
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/3b22dfc363ab6a2a8ffd140bfee57e60eebe6c01 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 openssh-9.9p2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/8ed0d36e7354900df94b3f19998db7e84fe8e15d | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-rust-1.86.0 | 1 
                       unknown | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/896e49a69a7c9b8962a8ee36ce67687224d36915 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bb6c84708a2b8459847093fc8c8e7a19c6a089e6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
