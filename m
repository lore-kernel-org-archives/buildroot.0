Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39C1C369B1
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 03:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B2C412B4;
	Wed, 16 Apr 2025 03:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-j2SR47sEEg; Wed, 16 Apr 2025 03:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51E8E40B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E8E40B6D;
	Wed, 16 Apr 2025 03:37:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9198435
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 03:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE1BF40BBA
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 03:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhIA93qkBCPd for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 03:37:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B9BA409CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B9BA409CE
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B9BA409CE
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 03:37:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso1170691066b.3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744774646; x=1745379446;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YD1kQsBiPuFS/fYfd7bFOGWxkZWSQbwjJ8ZPiVsQ/ow=;
 b=PwME4jmxW4p7uNJYh2y8uBBnuv+M3GkyijL2VopXID0D4FA2rZgmZW3SB/t1h56Swa
 SxCp/PUsyeyEE9PuisdK3rIIsuBQ/ZTyIMVO2z6tyzIF72/6ySMqiP+ZFY/7kADBUikN
 uJEyvdNhxKaUVpQaQ/pq5uc7KSZRgtwYaTKHF+pyosdGLwHfb95uLqYwgoimzSWQ2FAm
 zz1MqgyeHkdjp0s8ZymNuX9lfjfcgGxGkgpAX8MxwU5aTumDnbPcoo1H6JE+AVBdT3Ie
 mzKvHXGhi1GuAA+iuDjwSw44iVZEeFWMLOF7ludY2GMgb+JHINmAmlYZoEyCi/2rqPAl
 NBLg==
X-Gm-Message-State: AOJu0YyFJZ2r8k+fsvq4pbmwhlK52SLB3b2xBDbQaIH+7zd6Z2+UUFez
 ThAUCEoipfqZ4EYTDqEfsDcrCUozWfl/MnHCz89sDk8KvdWKRgjrsUwuJA==
X-Gm-Gg: ASbGncvNgtVZ9rHp/su+T+ZF25PAUqRyyZnmlTxWTy1Lk8TY+8A4m5SEIXhwlaY6DIL
 RL6xcEjZEYx56Ft7vS+q+mGxyBl9TfrftM2FcRtR0h/kJyVOKvVAlgMI10EyrXGPG0+DiCZP/La
 1YB8RJFJGKr2b5EH1dlXUTjMIaSp6ZI+dvgQCkIXyLyrUIdjBA2O2Vv1Vq1NLgfGxdghkAXHXub
 qlmMV9Nu1gk8GCYcuJiHWO8ists9GN/VlgSqTxJKurRhWHo/4+svxWS2nIH76zN6kFwe11bSFnF
 XvEf13m+vSMgu/GUGW2r1hGO+XfUX3sPPZ8vYDAppSNPBjEE9tSSNl8=
X-Google-Smtp-Source: AGHT+IETs3FtxRNGul1oDZZ3CNUer0yBymR5Ae7+C/Q/AtBcm/CpBZvHqjSBx0VtlNwCpEcfUqrFQQ==
X-Received: by 2002:a17:907:7da3:b0:ac7:ec31:deb0 with SMTP id
 a640c23a62f3a-acb428780c0mr7506366b.9.1744774646009; 
 Tue, 15 Apr 2025 20:37:26 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3cdd58c2sm42046166b.42.2025.04.15.20.37.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 20:37:25 -0700 (PDT)
Message-ID: <67ff25f5.170a0220.1b60c4.0e08@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 16 Apr 2025 03:37:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744774646; x=1745379446; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YD1kQsBiPuFS/fYfd7bFOGWxkZWSQbwjJ8ZPiVsQ/ow=;
 b=gQe/J0e5tpkJYWronu8ZeJ2xvzenKDqBknPkCwIqU9th7/ywBzUtJvXOdDYTmU/j0V
 JYqPbmDGK10+xoHG/18kCE3dn3su6d+lT6Gc9tcmaCB3VAZ10UaF33NhGFF3yEpyuZUd
 5ZqCkNzwcta/Km6nCmKOxhxSLySZAubJdAuG1xeBUCxBHEt453TiMujI8P+h+ohdZxrK
 H22NAn+OZAwAiHmoj7j/nHglJR6Wy0F8TcfXhKPFQSbdrBhCIN97CZGJzhm0m3Ce3+O+
 LAPLxil2UrwquAV/uHKq99S/X0+luXG7naFVo7mroQoDJ+xbXWUpDaSsrMvrhZTpF61f
 uJOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gQe/J0e5
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-15
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

Autobuild statistics for 2025-04-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  0  |  0  |  3  |
  2024.11.x  |  0  |  1  |  0  |  1  |
  2025.02.x  |  3  | 10  |  0  | 13  |
    master   | 18  | 47  |  0  | 65  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 4 
                  ntp-4.2.8p18 | 3 
                 host-gdb-14.2 | 2 
                libdrm-2.4.124 | 2 
           oath-toolkit-2.6.12 | 2 
                 agentpp-4.6.1 | 1 
             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
                 c-ares-1.34.2 | 1 
                  cairo-1.18.4 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.2 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
           ghostscript-10.05.0 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
               graphene-1.10.8 | 1 
              host-rust-1.82.0 | 1 
          host-tipidee-0.0.5.0 | 1 
             libapparmor-3.1.7 | 1 
             libmanette-0.2.11 | 1 
                  libsepol-3.7 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.13.8 | 1 
                   linux-tools | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
               openblas-0.3.29 | 1 
                 openssh-9.9p2 | 1 
                openvpn-2.6.14 | 1 
      passt-2025_02_17.a1e48a0 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
        s6-linux-utils-2.6.2.0 | 1 
                 sudo-1.9.15p5 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/cd7cda408f0300b20035bbd4354aa6b0e919b345 |     
   xtensa    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/33a001853b488cfd50544daedd22f329e99e24b9 |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/bf6db14b34f79ce1dbb7300cb194563260c6b617 | ORPH
    sh4      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/0880dda14d4a88982d78512a27386eb762d15b3f | ORPH
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a71d921ec459ec2d8c109750d7a03cff52c8c831 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/cf267ddbbb9bf2aa3c3c7ffd396e45584e516980 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/aeeb5f6d43486e2f80d712801618e80604426ed5 | ORPH
    i586     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ff6a21ceb85325e55bc3bc820a6fd69ebc41dcac | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/30b8274e049cd03549de8768c5576bf792ccef1e | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b5b32ed0b3a080447492a1264fa24798657a4d74 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/38f9f2e3cd49d4148357be7e696fe8193878b69d | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2603fe8a252f82cf2a071c3d37db3cdb02334f5b |     
  powerpc    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/77a319e870435f06b5fde92955c07fc99eae3c84 |     
   s390x     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/cee54f6da34829fcfe7387b6c142c3b094fe81f1 |     
   armeb     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/0c1644a959dbf564bcd8a18280a679c573b0b002 |     
    arm      |      ghostscript-10.05.0       | NOK | https://autobuild.buildroot.org/results/e68ef5c99bd14a615bf45447d34b63b0a0f285a8 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/911f06114fff47bcc3f15ea24cfe333eb9886305 |     
    or1k     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/619abada5ea07b947f184484c427eeb8f9ff6a9c |     
    sh4a     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/aba1502368aa54d3797a721626ce0f99276f724a | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9c31d124e6a1ac831dd2bd01689fd12c6795d984 | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/8434eda6d8ab04b71aad34bc678f980a99278af4 |     
powerpc64le  |      host-tipidee-0.0.5.0      | NOK | https://autobuild.buildroot.org/results/e33523f97ff3a5a72f60aba7123ddd04d39608fd |     
powerpc64le  |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/586ebe080e9a85ce479c1cbdbb0a1d5e122e38aa |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/ba57f9d4c1b02cf850ff7a00c2941fc3e515a4bf |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/1b4eab5b32f0ab685cfa877b3ec7eac8c0a517f0 |     
   sh4aeb    |       libmanette-0.2.11        | NOK | https://autobuild.buildroot.org/results/91cc80f0566ad79e081a0464a98a23968eb8c1c8 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/23c6736b9edd11533ec844b8f0be5a19d3af360f |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2697e86bcf939516024ae9991878340e35edacec |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/81fc51fa79c0100d0684499c9259e2d1bc792622 | ORPH
    m68k     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/3d555b63bb81b084e247b0e1bc59fc60a31321e7 | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e7becde8f965dab0b98e631931d1c9933e0235e9 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cec44939ffaf39e84b12fd8f49c6a262c3f201e9 |     
   mips64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4929c0bb0fc8ced43ee55fb9c4c8725a29f92ec8 |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4cd3181ce2adecb98ece5d9281e6eb1d546c9492 |     
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/14ff32c6a3b38ad3d65ac611d2fc2e6181bc33cd |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/aecdd731be3f6ab58fd500ae710b6a37996eb382 |     
   s390x     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/ea3462231f808311440807668b71e3f052a91ab0 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/14448411d9e30cfaac0d243d97b03c11dd9882d6 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/5db03286548903e0c816b1855b585d1d20bed809 | ORPH
  sparc64    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/07407a65b5a20ddf2b3a6df91f5fe1523f5bba64 |     
   sh4eb     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/d47a25b654d0736bae0f46115dd243bf3a5744af | ORPH
  mips64el   | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/8b5243c7ecce8cdcd4e1a4b56c051bc1d5b22897 |     
 powerpc64   | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/fc0785ed473c0e6ccb5ef689cea9232e9396a66e |     
   arceb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/1fc7065f1c39c33a6dc7dae24908dba69e41bebd |     
   xtensa    |         sudo-1.9.15p5          | NOK | https://autobuild.buildroot.org/results/7c6be64454b5791a7615b0e6a37e069244edec9f | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/6b78d4bf6f688eca26c3329acd4157f1a067dc94 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/fca226d2f9dd6cdd2b6f6732d662340ff4cd5679 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/10fde5df89f292e62a134f4e16bdc6f8f534f20f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             bluez5_utils-5.79 | 1 
                  cairo-1.18.4 | 1 
  gobject-introspection-1.82.0 | 1 
kismet-52bcb902e36b2df1562c... | 1 
        liblog4c-localtime-1.0 | 1 
                 libmbus-0.8.0 | 1 
                liboauth-1.0.3 | 1 
                   nanocom-1.0 | 1 
                  ntp-4.2.8p18 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/61629c3d4fba128f825a3a81b8e108df34715d9c |     
   arceb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/63765abf4db481a990fb22d71c05ac5d1896f42d |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b82866de9381d43358b312f8772f7e10e62e1fb6 | ORPH
   armeb     | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/d757bc4fb9714948ddb1635302a8dd5f7aedb86d | ORPH
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/6c7bf31fbf3b7c33155900cfa8c689ebab3457a0 |     
   mips64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/90f2f0e19e08ac0411ffe75fa0292030d29c6850 | ORPH
   x86_64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/ebd7e23e75604b9793ae186777104537b5b520a5 | ORPH
  aarch64    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/fd326cf7c17c3f708dd4a7a8db98a095e0265b74 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f555b7fde564c90651206a6e6d645e7b8a4bf8b1 |     
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/7fb53a95b60831d3c768263d006831f6d299f0bc |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
