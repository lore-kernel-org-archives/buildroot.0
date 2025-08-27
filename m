Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EA2CA0FF0
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 03:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD72060A6C;
	Wed, 27 Aug 2025 03:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S45yyK892PYX; Wed, 27 Aug 2025 03:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8984360A7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8984360A7D;
	Wed, 27 Aug 2025 03:20:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F1A9D94
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 03:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CBA160A6C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 03:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOuHJ8fY0Afi for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 03:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7A3860A7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A3860A7D
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7A3860A7D
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 03:20:19 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61ca9a5b41bso966144a12.1
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 20:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756264818; x=1756869618;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EQ+J+FvK9ypt3QzZbmKMepDNNGNhVFE/+mWNQbiB5HU=;
 b=FDg8LzmaqVUJInFeY1EPEiYkW3VsXYZLxqzmSNaEOeLB/IblSccy3X3QArxR8gY1u0
 lpEjgfMXLzOvtsWiZO9gqEa+uebViGE7dwCApc9Qq8mguOMi1j+ssC02pSCRwWpgaFfI
 UU6Q3LEjGugAOqDFSoC0mJRyKT46Heb1TzQIKETO9mxGPbqedfleQrRDdqiig7QMsNm8
 4h23C98xwBD9VBIw+IlcmP05yihDFmtgjWki0HzXkscaHpTIIoh3nuts2cHggZ8Pw2ld
 EBuxGrbaByZB4+aGYQ6puntPRvF8dHBEX7mI9g0idPK01+BmmFlx207AemHE+igz6hh8
 0IhA==
X-Gm-Message-State: AOJu0YwIf+BWiPS00guujQpL1/kvmRPo4fdCyLxCGJbXTjv32haursNp
 kDAYDH9N4iyoLzA3lKg4m1jAv0+9mFXlq5EOdL0UWRd7j05Fl5V8b2vWaZD+qA==
X-Gm-Gg: ASbGncuj3XwE4KRl24JVLauj9GxYD7MVmYr+xzf/HYdSr97/LBmb3sh6bxDec69rpBl
 c+vb65Z7fvpnVp6xMCCwadkSBKGu6BYIq/rlctSNfEjzrQf68xh+g8aHMkOZfGM/9JQpaLTmROo
 h9QqmphDR3OeMTA48jFqBniwk6RjXXl7h2lMzQGZEeD4h3mlMYI2K6htStw3QvViTSxOh+qKaZ3
 OguRo2ESC5DA9OnuY7bH4ggUj0+4OX1g564SpVDJcPn9+7cNyXB4ZTzimsrImGWZBIKp3x4zci0
 7N5LFNGWYIGmXIiPHzjGwQD0AoO9ch0tSRK/CEwo0Qp91+Zgr1Qe/ZjQbd0Rfd4YnWPQhscoN5n
 DUnsUtyPQkmpXRnx3B29KvAjr5MvmcxkTtouOuBU9
X-Google-Smtp-Source: AGHT+IESoPum7+9tDWjBFU5bQJw7P80A2Dq7JMZ6brEhkcv6vBGDFPKYwGBTuLFbB/no87gUR4cHQw==
X-Received: by 2002:a17:907:928b:b0:afe:7fc2:e383 with SMTP id
 a640c23a62f3a-afe7fc2f261mr871752366b.1.1756264817488; 
 Tue, 26 Aug 2025 20:20:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe6973cc17sm705436866b.48.2025.08.26.20.20.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 20:20:17 -0700 (PDT)
Message-ID: <68ae7971.170a0220.328035.a547@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 27 Aug 2025 03:20:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756264818; x=1756869618; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EQ+J+FvK9ypt3QzZbmKMepDNNGNhVFE/+mWNQbiB5HU=;
 b=Pifb4fVQ+cKFE5jllTasfVYO1S+P0vpfgAXFASUpvMyCDnQkJ5sITkLNqA5gaK860H
 TpOZ3iyG08yj2q4iJ0WWTOa4YjcFYG3BMGgQPo1XSwXYU1gSzCoCGLI+yGXhuumGYo2c
 gve8Hdj8IgtLJOLf5Ii9IzuoXeSPqcHeaYtJto6JO79zF/6OrFCnojXbVikLlHLS5LhU
 +lgUCOZG73+R2UNqOYNOjEXCvnG+OpJ9nSMY/AnBMifBllwbapndYJsJrvV0eEHKlVRE
 IEha01w2id5R+huuqn09QTPuFf7DP12ZuZnJ9yVSb5yF9bVhUFnaJxoi8XAVcK0YsKTp
 wZTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pifb4fVQ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-26
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

Autobuild statistics for 2025-08-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  3  |  0  |  3  |
  2025.05.x  |  0  |  2  |  0  |  2  |
    master   | 27  | 86  |  0  | 113 |
     next    |  2  |  1  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 9 
               bctoolbox-4.4.8 | 5 
                liboauth-1.0.3 | 5 
libsvgtiny-ea9d99fc8b231c22... | 4 
  gobject-introspection-1.84.0 | 3 
libftdi1-v1.5-48-g22b4667a8... | 3 
            netstat-nat-1.4.10 | 3 
                 c-icap-0.5.10 | 2 
                   cvs-1.12.13 | 2 
                 host-gdb-14.2 | 2 
               libsigrok-0.5.2 | 2 
                    mpir-3.0.0 | 2 
            python-yarl-1.18.3 | 2 
                    sslh-2.0.1 | 2 
              tailscale-1.78.1 | 2 
        vulkan-headers-1.4.317 | 2 
                 apache-2.4.65 | 1 
                    bat-0.25.0 | 1 
             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2025.1.0 | 1 
 docker-credential-gcr-v2.1.30 | 1 
                  dpdk-24.11.1 | 1 
                 dtbocfg-0.1.0 | 1 
                enscript-1.6.6 | 1 
                    ficl-4.1.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
     host-python-maturin-1.9.1 | 1 
              host-rust-1.88.0 | 1 
               host-vde2-2.3.3 | 1 
                  iozone-3.506 | 1 
      libabseil-cpp-20250127.0 | 1 
               libcap-ng-0.8.5 | 1 
             libgphoto2-2.5.27 | 1 
                libkrb5-1.21.3 | 1 
              libopenssl-3.5.2 | 1 
       libpagekite-0.91.201110 | 1 
                libroxml-3.0.2 | 1 
              libselinux-3.8.1 | 1 
                  linux-6.16.2 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
                 mbedtls-3.6.4 | 1 
mjpg-streamer-v1.0.0-1-g310... | 1 
          sane-airscan-0.99.33 | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/f2a65de4013a0e40d38dec52f579f718852233c5 |     
 powerpc64   |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/4e150176405ddd66039234d480c126e9da134abd |     
 microblaze  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/2c2c7b2733341490cf465f166d4acac47c8b1b54 |     
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/427078caf23ec9d4514fa0c8cfa5f8c636c9412e | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0b59faab63b34b29d26ee03aaed69acc9f4887c8 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/62d25c287252d7316cb4402294031d342024096f | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6f54e1428f0323c28e3315510609dd598e74b44e | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2a73696365591993382edb2409ebad57ebf66c5c | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/c75f8099add666bcac511fb044a2a3f1f8f6e785 | ORPH
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/57a51e631896b63e4e9ff0b8288a4c1d002db425 | ORPH
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/b14f53072ef5e482b9e5af1f4e22a7547d627790 | ORPH
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/56805a01b9b99ae4455a5ae6f297859b242833ae |     
   s390x     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/870dd21d4c669a731f8e066e0db91de7e3d44a4c | ORPH
  riscv64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/45c485f1afb1aecb3d1cf4acaacec8a3184f60e9 |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a19bfa88b29fdafa1897c825ee7c2d997e4e3653 | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9773aec41807513a21cc067df2be9b255c0cd71b | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/96616d514a27af6b93b81d96ca55e90b32f1fe98 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/3a43c86e456273d42e92e3b18edcc756df6a4d03 |     
  powerpc    |         dtbocfg-0.1.0          | NOK | https://autobuild.buildroot.org/results/9014eba38ec8a92f5fd2130822029c7d3e54b909 |     
 microblaze  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/d6b3e9639457db2d0346339c04ceccab732db83b | ORPH
   arceb     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/66fa7f62c2dc71b4ddf71129152291a339da02a0 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/3d6bff7620f885bc4a9c3b028837590078ea4e59 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/048f3dd68b43c024810412b9f70d480e0b4a742e | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/52e72697edf57d80d4cb7bb8acebeeaf312c14f2 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1b89165d98be44d0a58541a2f04f6db8162c6bf9 | ORPH
   sparc     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/c33b221c75b66a1cf745fb7d013d113631699bab | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c75e5cc8c0f8edbc7162e1f3808774292f11743e |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4a158ade85c26c0ac2af10f7e0401221e7afbac2 | ORPH
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bdd290d32aa115653657522ec321514fb77d40e9 | ORPH
   armeb     |   host-python-maturin-1.9.1    | NOK | https://autobuild.buildroot.org/results/1e4bebaec497179436c032fe9ca8af8233270040 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/58de36e3bd83a005a05fa6ddf651d2c8212085cf |     
loongarch64  |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/493803870c7c9b25f88094715952dc22fed0ef58 | ORPH
   sparc     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/981249c3771fc898b8f64ad6956681713852fb68 |     
   sparc     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/a56784356495058b2d5d29ccbeba5d2ec01d85c5 |     
    m68k     |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/93705d72f67d72061bb377ba71e02a39f702e601 |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/21c449c78e3da904a223e2523f690bf121e29582 |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/61fe8b4ffa3982749f359d37658341e3678223c9 |     
    arm      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/36baca00f2b375edd294b9271ce1ce2e36619259 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7cd97a1b13d610c7f97d021e778336024c120c82 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/05c5b3b81ee2287d02cc4ce083ec3bec6cc251fa |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c36a61a5780e56dbd77b22ba1e327bc77b03b715 |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/56ed8b2421585d6fe4bbda7d7c57a0d6628317dc |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5417d08b141e56c1e1443e9aeb458dffd43ce0f2 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/42ef6133cb607a17d822218395b4cb2b5d48bafb |     
    arc      | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/d7b9a45ccffc1c9e3fd796c3e46ee396b7d88272 |     
    arm      | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/97266483da8f070e919a1199f4cc6e0c7a593f92 |     
   sparc     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/b27e34b2a945f35a3ca5cf3e685986e05f343f11 |     
    arc      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/c5413a5dfb5aab8588090e620b6973fed5915928 | ORPH
powerpc64le  |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/b4dcad7aca1319a70213d820a1a9aa7407bced3e |     
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f41d7b732330b919d1d629d4573059a443f10c8c | ORPH
 microblaze  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/2a282f714bdec2211d615707f4455b053cbf48d7 | ORPH
microblazeel |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/045392ada31bdca2c1a516bd20486885f2c9b65c | ORPH
    i686     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/b0788f69aba443fc012580f8abd3196c09ae0caa | ORPH
    or1k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/8685b6380550e26600209067cc7a54d292bda9b8 | ORPH
  riscv64    |        libopenssl-3.5.2        | NOK | https://autobuild.buildroot.org/results/d7d815a45addb8ea1d6fea439e3a5efecad58444 | ORPH
    arc      |    libpagekite-0.91.201110     | NOK | https://autobuild.buildroot.org/results/13fcadd8eae4464327a0a45689eb1918354da938 |     
   s390x     |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/9471410554f2004402586e7f92fce46d51a15716 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5e5c0a9a5501a133e10a86b30f541ef279b4d0b3 |     
   s390x     |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/d7aec8a6eee7e8d3362059e022072a5e0e2336bd | ORPH
   mips64    |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/e72f8c6de2a105620ad8f66b632d62a9a96239ad | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/34eb0fdaa50d5b4e6607e68d5affa7e7ba44d750 | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/6b72312bbeba1f5b2390b14b156e2ef178063ad7 | ORPH
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/d7fd83d493b78cf17bcaca1374831d281c4dedf4 | ORPH
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/89ef96d99ef54ceced00acbc51ab1d8b3aab00ea | ORPH
loongarch64  |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/2c62bc985088cfe28a6c42e33d371ad96c190d72 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/937743aca4bc9281bb218292dc707037b47753a9 | ORPH
 microblaze  |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/292f779f0c67bd120e9d84efc1124a94340b3550 | ORPH
 aarch64_be  |         mbedtls-3.6.4          | NOK | https://autobuild.buildroot.org/results/7b02d88a732aec1dddd22b48e076865a457abadc |     
   sparc     | mjpg-streamer-v1.0.0-1-g310... | NOK | https://autobuild.buildroot.org/results/3ab231ec8b2c33fa5cd75ad5a45c719dc5428316 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a5fc427b43d68352eae74647268b0bc7ed50fd97 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/03cdc3da4e0212cab4705be4d76f8c6bc23b2310 |     
   sh4eb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/2658c89e784a9416e18d51208acc24b79e476281 | ORPH
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/51f8c89ee2a6df91359028a54d3055d53f6da19b | ORPH
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/976265517da55b8dc950d3e08c390075aa0b0d89 | ORPH
    i686     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/33a16836c928037d5ca067d9098982b8ee86c972 |     
 powerpc64   |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/833bc05b69383d155ffc0c9d0a66be40fa9e9c98 |     
loongarch64  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/80be69475956bf8dce0149c6543ed13277786ad6 |     
    arc      |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/91b84e870e47994c53daeaf464d06e9856f7a984 | ORPH
   mips64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/7f5f6c95536624b9f0016cbbd9786fde2ba2cfd4 | ORPH
powerpc64le  |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/b46a21bb272718f6c74c7627b37e05c9997a699c |     
    arm      |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/a8bcb59aa4746d3a566f8370fcbc617f6b7e9f1a |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/e943071cb8279eae7a0a65ab55a51e5ac284bb77 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5816361b4ffddba6243c1503f0626c5867cd5b50 |     
    m68k     |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/4f722841c21d1533f527ceda4acb6e5457a258d2 | ORPH
 aarch64_be  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/24f334c63de1da2c876f957c4fd33a7ae55e3c08 | ORPH
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/613ed3f99b9cbbff52e763a3ddf58f3ac9b28b4b | ORPH


Classification of failures by reason for next
---------------------------------------------

                   bash-5.2.37 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f135a97fa8bd2750ffc9a10ae21524f6668888b8 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                 host-gdb-14.2 | 1 
                  liburing-2.6 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4fc8b3929779c5b4aafb4253da7325663afc8615 | ORPH
  aarch64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c2aceb823871661f320c95fd033f637ccae17dd9 | ORPH
   armeb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/6db5ecce32a8533efbc3b7c8808e5bb9b2b93662 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                flashrom-1.5.1 | 1 
                 libmbus-0.8.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/9db6bef10dc23d419b60924b01fbedefd3f29abc |     
   mipsel    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/bcff31fe7890b60d37d93f19d553fd988ba7f41d | ORPH


Gitlab CI results for 2025-08-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035546 |      
                 TestZbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035540 |      
                 TestWget | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035527 |      
               TestThttpd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035515 |      
                TestSWIPL | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035510 |      
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035454 |      
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035373 | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035339 |      
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035321 | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035304 | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035300 |      
          TestMicroPython | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035269 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035258 |      
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035249 | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035221 |      
              TestLibCurl | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035172 |      
               TestIozone | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035157 |      
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035138 | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035134 | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035133 | ORPH 
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035123 | ORPH 
    TestFirewalldSysVInit | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120035122 | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120034983 | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120034981 | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/11120034950 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
