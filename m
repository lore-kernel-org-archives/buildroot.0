Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD627D3C53F
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 03:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BEB360673;
	Fri, 18 Oct 2024 03:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3ycFSAsPh-C; Fri, 18 Oct 2024 03:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E993A60677
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E993A60677;
	Fri, 18 Oct 2024 03:17:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F5D02072
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 03:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FD6E40004
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 03:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs6ILvlxT9Kl for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 03:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EA794016F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EA794016F
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EA794016F
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 03:17:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso203733466b.1
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 20:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729221470; x=1729826270;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+96RO6O8meXLJ0aZxyKDpSga3/9OO/A4fUNkgMr+lVs=;
 b=f2gJN3pqOsqrzco+Q7zYseKBKK2Y+TcvuGJKP3p4Oiy+uabWOB4OKkhCW8VALokD1b
 viW5e5FxS6bKEWkzWJcjbYpAKpeUNq2qCKUiE0bkc6QUvMdTjhi1XHfvT1lnHdM4glBZ
 bCwL0EawoeahQ99VuP3TyAwFA/XQRcaSLv83hBQ6+8AiEIR8ECuzYX5LJ/AAAlOOIgh4
 fmwMVHyXl1eJ/MRu8bQz9fQm9sylz/o4VC6gErCSyJajOXnVaLUYd3y4pGvkkrp7KQDZ
 Rbc6N9iENA/uuk0rlCydmYZq9Dg57+5I8eMAPpqrlljBlUwSfw+9An1E/jVgrCeVq9RQ
 3zEw==
X-Gm-Message-State: AOJu0YxRuk7Mh5bNlHntZi/tUh3sy+HwAEgmFvRPqDRK3wL3XXGIJ2pe
 uOU8TArgGwMPZYntiqt4YbjeeGmoSMpVWzTnH1lfernZ8/s5p+TpqBzwVQ==
X-Google-Smtp-Source: AGHT+IHD8a9v+u4uehpBD67vefxX+8PYqOxCWTtgsp7BKnVKhbpMXthI1rGp2xhAKJYD6ZSnqjPClw==
X-Received: by 2002:a17:907:7b8e:b0:a9a:6752:ba80 with SMTP id
 a640c23a62f3a-a9a69774585mr68117266b.5.1729221469846; 
 Thu, 17 Oct 2024 20:17:49 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68a8ec7fsm37141366b.26.2024.10.17.20.17.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 20:17:49 -0700 (PDT)
Message-ID: <6711d35d.170a0220.238ad2.1120@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 18 Oct 2024 03:17:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729221470; x=1729826270; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+96RO6O8meXLJ0aZxyKDpSga3/9OO/A4fUNkgMr+lVs=;
 b=gH+naARQASLrj2VGNYy+0Q6Ob6IiN9Zfw8Qs4BlIV4Y2ruLVEpIAMjUls3t2PlOtU1
 kBhsTD21QCpqHj7IY4J4KVXwBj6EDj5YW1uUg+jha4AsG9PBLp6pfvLlt4KXITDr8UYw
 9CbNqmN3yT2Ch1nr2EjvH5y3/Vwk8BKD9jFhjGmRhNE/ZQGZlJqpUGkthJhrBBhyLNyk
 Gsfp7IrTpJOV3c8DaXbH03h+ZsGYO5w4UEaTTBlJ4lwRkrLU2miPtqoo8mLO1Z1pD9dw
 TKLv38Yqk39j+J66m2POPRRA9eH9bssetuN3KvQlW/xDGIxLUvOcPcVk7ubg8nH6qXxJ
 OgRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gH+naARQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-17
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

Autobuild statistics for 2024-10-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  5  |  0  |  5  |
  2024.05.x  | 16  | 23  |  1  | 40  |
  2024.08.x  |  3  |  4  |  0  |  7  |
    master   |  9  | 74  |  0  | 83  |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-8.10.1 | 11
               procps-ng-4.0.4 | 8 
                 linux-6.10.10 | 5 
                    git-2.47.0 | 4 
              fluent-bit-3.1.3 | 3 
 host-softether-4.30-9700-beta | 3 
                 apache-2.4.62 | 2 
           at-spi2-core-2.50.0 | 2 
                  bind-9.18.28 | 2 
                  ffmpeg-6.1.2 | 2 
  gobject-introspection-1.76.1 | 2 
    host-python-greenlet-3.1.1 | 2 
              host-rust-1.80.1 | 2 
httping-0e26c53d5fe504eb720... | 2 
          linux-5.10.162-cip24 | 2 
                memtest86-6.20 | 2 
                       unknown | 2 
               valgrind-3.23.0 | 2 
               aircrack-ng-1.7 | 1 
                apr-util-1.6.3 | 1 
                  bcusdk-0.0.5 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
                  dlib-19.24.6 | 1 
                  evilwm-1.4.3 | 1 
                     file-5.45 | 1 
                 gnuplot-6.0.1 | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
                host-go-1.22.8 | 1 
                      iwd-2.20 | 1 
                  ntp-4.2.8p18 | 1 
                 openal-1.22.0 | 1 
                 pixman-0.42.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        aircrack-ng-1.7         | NOK | https://autobuild.buildroot.org/results/84b0164b1f5fb1e62ca52a4045832b19aa8cfbd1 |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/3323d0d2837c6665d94cedafb211966fbda9e77e |     
   nios2     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/255228a1b78da2f836003c05203117aca286d43b |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/28c7a267c8f6a802027a3de2486fbeca3bc57320 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/aae2f5aafdfb24d343429aa9216124d1aee690ec |     
  riscv64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/0237a297d94a6b2f9fe3059f0864683bcc854559 |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/9469ccd06d0a06e2230ed6b70b70653a3bc04595 |     
   mipsel    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/bcfdced3848ae5312333385bd7a50a2f16f4331a | ORPH
 microblaze  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/369c9320768a52c97e6ccbb48d2e0060f250dde0 | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/d4c39a7f6bfcb37236da2a800a386c8b45868dfa | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f4a474951444811cee46f9597b8e7880fbf70f5b | ORPH
   arceb     |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/caefb30a9d281d5f906a2319161afdf3483a91a9 |     
    sh4      |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/e9ff51907e5d41680c4ee5befc256dc675b33a6f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2c027abc1769ef6f09aea68cd835d376def9b5a1 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ed47208631ca4fefacd0cd2c94253e8281c46281 |     
  powerpc    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/6f1ce8f676af5349c729c774b4fa229e57bcb93a | ORPH
    m68k     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/83e67cc5e2c3c5d83ec04e9c4bc90629694def8c |     
   mips64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/4409d1f378c60a295d63fa6949312ff5780663df |     
powerpc64le  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/05a2b85afe6e16f0e40daa0930242fe9f635cf47 |     
   sparc     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/49e792110bee522948668ca4976fcd2e1a05f7dd |     
   arceb     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/0ee0fd3a8046641cf899f03364f0cbf892bdc8f9 |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/aed45e790aa304f270a6d570cb4436234db568f4 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/b7d8b737917eb8209c32ff1dd6555f75aa5523e8 |     
   mips64    |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/c3516264f8dd9f53c01bda0c4292b88ef87fbd2b |     
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/83bddb01282e3340d8fc34fd8f2ef929255f7d24 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fabc424a4295a51201bb91400a18cf67d6bff9a2 | ORPH
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ee31c422435ec02d32777e49cc7c43cc7409dbe9 |     
   sparc     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/67508934a5ae3fdebd7c9327673cdb03b851d5af |     
 powerpc64   |         host-go-1.22.8         | NOK | https://autobuild.buildroot.org/results/598f8741d91279ed0ac63bcc9d085398e9ad627d |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/05f51d5b69347ce130bad2787ae2280721951daf |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/1700740f552f8547634560b59099560fa2945dd6 |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/4215437bc0b9c8d292b12f122b6d509355f1afec |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/3b3de17927dc175beb116074c988a082e3733d13 |     
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/920377a8b70804daffdfabe5729c09cd3688e7de | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e584faa24558326f7d1c1b84d4265c735172c419 | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7917fa10773068d9890b10308d0d41bacbe3fa52 | ORPH
 aarch64_be  | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/490b985a36e96aa251c115e69142a52a6c5d2c17 |     
   mipsel    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/764951aa480a8263acc7b08bf0183e07918421da |     
    mips     |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/e3b899000505607d45a5592e7ed9007270f972c1 | ORPH
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b23625b84c90bcd2cffdad491d4ce5a35c46290b |     
    i686     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/06b5f2a71dd0db1c4f0947020ac066edf04140f7 |     
powerpc64le  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c971fa38d054db1dadfa5584b2269bd89d26ed4b |     
   sh4eb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/a6181b74414303f983cd82e850e934387718c43a |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/7b172dfe0a4a509e93cf8b6932f36824692284d0 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/95c3e09b88c378c7afaba847678edcad4c602ea7 |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/3363909abd06b005b6f2de4afda5fb417db02af4 |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/54fb070d2334334ab644e15dca40648b18a58932 |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/8f2095edb6b939e6a22915cb35ab45e5914236db |     
    or1k     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/1bb57b0687f3bbcaaf213ccb9f1e331f580c2310 |     
  aarch64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/83aa230b6e00c039598251792e05d01cfc7afd26 |     
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/41aea3eed33e71fef19f1030fa513322aa3f8006 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ac9cdcc8535f7d951ec43f36c6db1163349fc565 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/5f3e78f0867f82b3ab889549f5d7ed8105b875be | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/7fa478e2f273782cd05711d5e1643da0bed8722c | ORPH
    sh4a     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/90895744006ecdb472fd7215a4a1e8de803cfea7 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/a4082dfa89df6ce48a2ac5ba843acd3fe9e55c16 | ORPH
   sh4aeb    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/7d5c78ca1d4df5ff4bb5fdce437812f2a531da75 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/a1d3a32bc77855e0f5b7a1845ebb843fcad213ab |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/ce76ff52db32c9729543e6c350b83366660282f9 |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f07a759470df16d1d0cb1efc30b0338f491bc3bb |     
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/e93b7dee5274dbd34d11852d12771439941751f1 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/3237ad59400a56fbce302287e366c5312729eeb2 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8bbdde22dfed49619b8fdcc557560c7c133c448d | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9595e75b64e311b212faf7287c648848beeec452 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6bbd2abcc292c1f73db26437c6e06051e589ea54 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f2bda79b07080ce01c3c13bba69d829776abbb93 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/a0af225add425b114cc514b51192810b58ef0a15 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bc5c3d33fc679d7e8c5845e9cfcd89d38b2da0be | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e1da2020124e96f975ed5f70ec397e87cb5c4b9c | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5846fab821d54b0bac10fc8b1e513df1e0ac2d5c | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/59e7443adecda34dd6340e6eb149bc4bfbdd2461 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9adbffc29de816ef84a12cc40ddd14ff6c417ed5 |     
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/354afa26698f4fc49053d154239154181aa00ef8 | ORPH
    mips     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/ec55d0f3a1c0ba6ac599c4ed7a0c7c433afb5889 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                   libnss-3.97 | 1 
          linux-5.10.162-cip24 | 1 
              skalibs-2.12.0.1 | 1 
                tinifier-3.4.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/0311b599ec6902c29035ac6cefca6ea022a69a34 |     
powerpc64le  |          libnss-3.97           | NOK | https://autobuild.buildroot.org/results/709d9382f6abc9aed9e0bd7a371df9c543ea3300 |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e3d930996126d9da2120a5091c1d40459d2133c9 | ORPH
    sh4      |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/5c60506f88b554bac4cf1d7bb27eca1f255c8744 |     
  mips64el   |         tinifier-3.4.0         | NOK | https://autobuild.buildroot.org/results/62010d6fa53095f2885927a28fba5cd383b17d1b |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 3 
  gobject-introspection-1.76.1 | 2 
               bpftrace-0.19.1 | 1 
             cni-plugins-1.3.0 | 1 
         gobject-introspection | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage2-1.... | 1 
host-go-bootstrap-stage3-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
          libcamera-apps-1.2.1 | 1 
                  libffi-3.4.6 | 1 
        liblog4c-localtime-1.0 | 1 
                   linux-tools | 1 
                    ncmpc-0.49 | 1 
                     nut-2.8.2 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
             strongswan-5.9.13 | 1 
               valgrind-3.22.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        bpftrace-0.19.1         | NOK | https://autobuild.buildroot.org/results/3595d39dd53a686bbf996dd4e532ced44906b9e3 |     
powerpc64le  |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/c28d948810e8a96eaf9eb405b2a9175bca93dabf |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/ee62e4cc887f7d42262172a4493d11eb6f68546b |     
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6b480104cba5fc0b3ebcf2054c62d50381b26a74 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/3f96a6a192786cfa484135f3c3345e2ef2b57427 | ORPH
  riscv64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/6d5f3e08c29d4e9fd510de3c9b404aa54855ffb8 |     
   x86_64    | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/4256d21bd28624c135f5f37402621d8e0b9ce7dd |     
powerpc64le  | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/2aca6258b03436db7043de232c3f3a3d2b96dd6c |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/65f7dd5fb57240a8c0b100e6a96ed3b1a2d49b9d | ORPH
    sh4      |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/1124f9f8ec8e36444575f1a7afc4badeb68e3b9b |     
    sh4      |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/dbf08c54309024529c1767e4961242815fdf9e5c |     
    arc      |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/14fd517c8b4f349e72f263972ec54f7a19d5cd34 |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/837fdab8317eefbc95a26c49a9d2cbc07a954921 |     
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6812489a03be1fc23ba09ef92cad823533c13bf0 | ORPH
 aarch64_be  |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/9b0325531abbbdbb3b2f0e16ec759e8f8d19b333 |     
  powerpc    |           nut-2.8.2            | NOK | https://autobuild.buildroot.org/results/a163bbef90d11b6d4093f4b68f111048fe3e5b6d |     
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/c4c957b79ce4e71184c0eae2125010bbe45a22ed | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/2a0838ac0418ec718fe643a522f311ee9b34cb49 |     
  sparc64    |       strongswan-5.9.13        | NOK | https://autobuild.buildroot.org/results/bd345fc330c9f6a44b78ed6828ded49bb5e69b63 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/5f56fa60971376872852c5a79ba76a3f178925c0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f7227040a6aaad36dba919fb42a035c5a855cee9 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/87313a45312eab0a9e62501a1769bff082eb01d5 |     
  mips64el   |        valgrind-3.22.0         | NOK | https://autobuild.buildroot.org/results/2cb8b53ef9d514c3ee74a7e7bd7412ca825ffd34 | ORPH
    i686     |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/ba05a167b3d60ab80dd7165149755b09d3865870 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                    dust-0.9.0 | 1 
              host-runc-1.1.12 | 1 
      python-autocommand-2.2.2 | 1 
                   s6-2.13.0.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/48f400cdb12959f637d9149e220738b4a7ae8134 | ORPH
   mips64    |        host-runc-1.1.12        | NOK | https://autobuild.buildroot.org/results/51de82df4c8d2fa6c476b3e32cb9b934dea727a3 |     
  sparc64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ecc12d9678a3afe18fd43109756679461af0f169 |     
powerpc64le  |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/2155fe3cc0c5309c137a578241e4329b13091a69 |     


Gitlab CI results for 2024-10-17
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750569  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750580  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750582  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750583  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750584  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750599  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750615  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750625  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750631  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750632  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750638  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750639  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750642  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750643  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750645  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750646  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750680  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750708  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750712  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750720  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750721  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750724  | ORPH 
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750766  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750769  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750772  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750791  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750796  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750798  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750812  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750815  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750844  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750879  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750891  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750896  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750897  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750910  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750923  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750924  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750941  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750946  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750947  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8105750951  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
