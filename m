Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B74C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 04:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD36E6062F;
	Thu, 20 Mar 2025 04:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caxdLKWgcaYl; Thu, 20 Mar 2025 04:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D9FA6080A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D9FA6080A;
	Thu, 20 Mar 2025 04:14:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EEB91A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 04:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E5496062F
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 04:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFDbO4NL6Woy for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 04:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B871E60610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B871E60610
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B871E60610
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 04:14:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac25520a289so62830066b.3
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 21:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742444079; x=1743048879;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bj43aGFDdmhGoKp9z1fovCbW9Ql/V4kuFrgk0SdOVpE=;
 b=izg5tqE7S/8gTrlm3yxVZlTih2umUru96loW2IEYlFa620v3PE6D8ffPOt3qXRS21n
 BS7yaVZ5u4f5xhHEdIcInu9180QuqYP4qp59vUFlHxX2I8UZc+IrVXm3urB/ARXJR1xG
 I0vhr3PBmF9cpyJpWgIsNLbzuER4jrSxGQq+slAGwcRNSRZFV9FffpnJGq1p7kuOefTr
 UonbdHvrSGSioL6tI+FVs7aNP0M40UHPrfqkhJzySkhrdSLOU+BIZ250sVVIVuPtr4Bj
 mr8yG1R1A4R0xH4DaVwojAu93h1fyI0tpaiCOl7dotffVkUEItzFgDwU+M9v0VD2dpSu
 u8jQ==
X-Gm-Message-State: AOJu0YzjPMed7TQfY4K3dGVSljpOFbW8IwegaTeZU17p04nB4Yfl4noP
 9dfWMt04McS4lTTO7RJVl7HiHLVBIydY9liNhQ95EeIsSvBZmpyDVI1UlA==
X-Gm-Gg: ASbGncuBKj7K3gyoIZfpAsfmfFNT5XBG/I78ZgDNMf9izo2JCOCuL5YQtjZbczHZklp
 3RZgdOVzl5h+U+unEXjcH+vlgYEk4/u1RgdiVVpPUaKmeWgYE2qq9P0CKAcfgKUdpohjtH/fDOH
 fBdi2v4u7mpzs0WFx4r+9SmqN0q7RIHflHRG/M94dmYmZHly8xjTg1LAlBfUAcHGpRaPdlRtM72
 5gUhRs60U0OgtG+E2Zk+sEBXkpMexmvxJAhx43TtBhRN8Zj1JJM+ED4OpmidLAHvfGG/5VDF0NQ
 kR6P299/udgrHA031uEtXiz0eLk4NYXiWBfJ2gdUArT4qA3w
X-Google-Smtp-Source: AGHT+IHnBX6dW4KpvX+AQJuTlXWJvedtNSPVLhfKPPbYZ723B02T362N0I7A20O7cQ3OQKlLll7rMw==
X-Received: by 2002:a17:907:7e8f:b0:abf:733f:5c42 with SMTP id
 a640c23a62f3a-ac3cde7b5f6mr186509766b.8.1742444079207; 
 Wed, 19 Mar 2025 21:14:39 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3bedae240sm163717166b.34.2025.03.19.21.14.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 21:14:39 -0700 (PDT)
Message-ID: <67db962f.170a0220.239480.6c2d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 20 Mar 2025 04:14:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742444079; x=1743048879; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bj43aGFDdmhGoKp9z1fovCbW9Ql/V4kuFrgk0SdOVpE=;
 b=h2B1VljyhfhCc/M0GeKTBLTp9B5QyrBr6a/URvCpLLm0jlkUMmopYWz0d8zP5+DXjp
 wzfl6sbMlviInPUB1BmzDVRxmYFRj7hmHG8khBt+pv4WNgQxuSWR+cFd9p3NCY4lm3Hm
 CDfMBqbrTsGxVNIXWZ9wuD8VAN35Ndr9CzcAMC7+vYsD+DYMCbn1ADe/B4QDyl3B9qxR
 V/ILX5WyTcodx1wP7h9Rk2tihqNdCkpkEguAw7gO4lfe7wSGwiKf3TtBkkj9N4iP/4U3
 kxQEx58qVJBQM8mPvVM5Ehr7+x8PH4qGp8BfXqCbzlAnBjLWimwmJjX51Ih/ciXAY7R0
 w12Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h2B1Vljy
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-19
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

Autobuild statistics for 2025-03-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  0  |  0  |  2  |
  2024.11.x  |  1  |  6  |  0  |  7  |
    master   | 15  | 51  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
               cracklib-2.9.11 | 3 
    host-python-greenlet-3.1.1 | 3 
     linux-5.10.162-cip24-rt10 | 3 
               valgrind-3.24.0 | 3 
          aardvark-dns-v1.14.0 | 2 
                elfutils-0.192 | 2 
                  linux-6.13.7 | 2 
                memtest86-7.20 | 2 
      passt-2025_02_17.a1e48a0 | 2 
                   perl-5.40.1 | 2 
           at-spi2-core-2.50.0 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
             berkeleydb-5.3.28 | 1 
                   cvs-1.12.13 | 1 
        edk2-edk2-stable202411 | 1 
esp-hosted-927a34f99724bb74... | 1 
fs/erofs/erofs.mk:69: /work... | 1 
                 gerbera-2.4.1 | 1 
  gobject-introspection-1.82.0 | 1 
                 hddtemp-0.4.3 | 1 
                 hidapi-0.14.0 | 1 
                 host-gdb-14.2 | 1 
imx-lib-3f777974c0c146817e2... | 1 
                   iperf3-3.18 | 1 
                  libbpf-1.5.0 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
                  ntp-4.2.8p18 | 1 
                      poke-3.0 | 1 
                ramspeed-2.6.0 | 1 
                    sdl-1.2.15 | 1 
           uboot-tools-2021.07 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/22124364000793c8b47ed80a87ebdc2137c46941 | ORPH
powerpc64le  |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/a51498967d4e2104b0132753c0808fcf23189072 | ORPH
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/ca16c91d8568cc9ea265422fb53e16390c0e477f |     
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/079d8b3e3ecf9e2826e09801192c2a94d8121d0a |     
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8df5a1d644486e393cf7e9b26790d2a6247f6c3d | ORPH
    or1k     |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/878c58e78108d771e89453c240e6e5f6cbb3ff14 |     
 microblaze  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/b684a614370964a36f750aebadd4452259c82e17 |     
powerpc64le  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/c88bf9536afadb9a0463cea6933f3ac4e1e00249 |     
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ad02e9440c9c089da93c927d403424119df1c8bd | ORPH
   x86_64    |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/cf9ce25457250b3c8473470b1be5a632c1485bc1 |     
  mips64el   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4b24196be3032f885bcfb11f6e0f65582c0d5d11 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/61950999b6e9b66c24f2c58bd8a04d8fee3b8fd6 | ORPH
   armeb     | esp-hosted-927a34f99724bb74... | NOK | https://autobuild.buildroot.org/results/a28c82d65d79ff1d55f0cbf8c9a76c83debaef8e |     
   mipsel    | fs/erofs/erofs.mk:69: /work... | NOK | https://autobuild.buildroot.org/results/ec2e482da4d140b92a3e8686214d34694e4e8616 |     
    m68k     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/1ddabdeb3d6747e5176c3dddd57affa370fa8582 |     
    sh4a     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/ad51faea236632ed2e00b3f08915a70745fadbd2 | ORPH
    arc      |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/245f463ae670bdd44cdfb720b0d2fe11d90d9d0f |     
    arm      |         hidapi-0.14.0          | NOK | https://autobuild.buildroot.org/results/1d4b28cfcf0a58874b27e7dcf259a7fc57a6e896 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8604c54724a40f1f9fb35af7f0f2c982a3a7bd9b | ORPH
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fb43efea627a932639cfd0f3c2c8e6e8aab9ef93 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8596ee82d7e438fe08356c6f4908d93ead32359b |     
    or1k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b7adb7139ae3cf5b138dce5f2be4c0a2e58ce022 |     
    arm      | imx-lib-3f777974c0c146817e2... | NOK | https://autobuild.buildroot.org/results/5dc5552eb383b6ba8cc66e829257290c80b7e06f |     
    m68k     |          iperf3-3.18           | NOK | https://autobuild.buildroot.org/results/2a0f62d92ce22b9f3e923522feba88d06305b53a | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/5439e9b8fb499d95451d203d4dd912610b64db15 |     
    m68k     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/bf89d9d68b12276bc46e8fa87edc6415c06ee063 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/841e6c61cc716912790c88d231e0b1c9d2cf4f1a | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/4d0d5711643c45e46388c485d763f6be2dbb3575 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/96d7f5878928fd6251e323b6124fdb592eb226d9 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/08912fe6f5dc21d66ebd2850812f73a7aaf34f2c | ORPH
   mipsel    |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/dda663223d1aa0fd6925dffbdf2fabcab29089ae | ORPH
  powerpc    |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/ec78bb58aea723a8b4d1e143531218b0751140bf | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/b4f34ef57447c9d852103bc65f6e55f484ecff15 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/aa4be5cb3e60e8f0b59dc974849d509b3b1387f0 |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ab688146ce1da3e30fdcc2d42cdfc8dfde2d0183 |     
    or1k     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/e68dd669174fc2807a099226fea2fe49054eb3c7 | ORPH
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/d0367e05710841e061acc5d154fdc84d6109f71c | ORPH
  aarch64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/fb920c6dbf11c51d11b03552a6b221f917d2dd5b |     
    arc      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/bb6fb84d9712d1ca2bdfd0215de9c5875d16cb39 |     
  riscv32    |            poke-3.0            | NOK | https://autobuild.buildroot.org/results/18cdaa315eebb2f735ba67ee152df33c9c0965fe | ORPH
  riscv64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/dcfb733d99034abfee9f2fc688ee74f63b4e161a | ORPH
   mips64    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/26823907b1869c7f41bbeb3094e477fe1708928b | ORPH
microblazeel |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/615c230ac35e89347a7794ba298ba6a1f7668053 | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/b5e6441fdd0164187a871fb687d2a8cffb552cf2 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/cd97e57095278908ba139064322aa7d41656045a |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/62ace95b33b3136db78b3c81b2027a3ba55e054b |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/77e63dbb595dfc5d982336b191ba35fa2c950371 |     
   x86_64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/4964d426b138150ab3850324a2e490a8884f939d | ORPH
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/71c31c12e11600820c8115b78096bbdd55dea62d | ORPH
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/c6c4c29f896d85e5b8973146ded428eee0e512ca | ORPH
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/45f06371acb8eb3399935ed32b05657e20b6b68c | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

        python-m2crypto-0.43.0 | 2 
             bluez5_utils-5.79 | 1 
                  iozone-3.506 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/8da87ca4cf65f5093d6f6c00bace01671ab4c99f |     
    or1k     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/60c4195578e7a1871b2d354bd9af27c4e6836bb2 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/f5528928f8ea9311dd088058de7d89bbfccbb03c | ORPH
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/28a2de086058516969647d2c3d7e0aaa17448933 |     
 aarch64_be  |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/6dcee13bb0b9237616eea2817d9b0b58670ab9f8 |     
   arceb     |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/cf0ca8eaf4a3d4771d789d5cb673f748e40e9928 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
