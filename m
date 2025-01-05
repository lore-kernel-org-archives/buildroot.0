Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95FEE77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 04:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B2FE404ED;
	Sun,  5 Jan 2025 04:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWGlhk5FrQuy; Sun,  5 Jan 2025 04:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A34C404F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A34C404F9;
	Sun,  5 Jan 2025 04:14:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AAD19D92
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 04:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 865C980F04
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 04:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIWgXWG2o85R for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 04:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C833880BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C833880BE0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C833880BE0
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 04:14:38 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aab925654d9so2342802966b.2
 for <buildroot@buildroot.org>; Sat, 04 Jan 2025 20:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736050476; x=1736655276;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6t82lKL2jkXtgsPqpHS7GwRhDTtS7FNjS8Y5l4lplO8=;
 b=u9sL8VUBgU7krocoJlq1RbnQ0mMrtdHWi2GZtKrbwgiWvCJNnxpjWxVEP5YY2FNrbf
 Mu1GEE4D6CLZE4mCqja7tEBhrDmLCygQ0pM4ddu35X0Pyg8xLe4qWh/r2ZCDa1AxrtcE
 zb6B2ArroXCSqlbUsS4iEYl3ExvWv6gdyKS0KRNFSUh+wyVPe76SWcFd9IcmLUJ6pQJq
 /orsh9lZ6+/b1ren/v9X2Egq9kfDdD6KhEbAEJ5iVD8zejxNbpJeu1lpv/zvvcN5HFtn
 sSzZ+RsDdRgUNsn3DoXlwDmlzjZFPipliS/Atsh5NSodcU3CXx8SqBi2aPeIH2nB00uI
 xM8A==
X-Gm-Message-State: AOJu0YwyyLAdh6lTc0pN8RYUhr+xojsTgQiX8G8eYLA0KXsan1dB23ML
 2qh/uWZE8c7s976Bag/b3mOAtx1nButAlwj5Z3babfX5ziQ2FQijO6O1FA==
X-Gm-Gg: ASbGncv6TyJBBe3w/I46q0SrhDk8bu+FaLWHIMrDMaNtBz3jz4t3x/137kR2uBCmNCS
 Irvl5yrbkpKN8+9gW8Lz5iQ6JbOYfebb92tg668hBbdClHFUB8GJZrJyj3eFoOS2VJV3Z26tRVn
 bO3L+lGsrYjrtUAMTDIKb5ZyzE9XpyJdUeKnCzndrVZu6Jkdp+jofKMsTFpamzaqnxWdxde9N00
 EfrESakW/DeEgQrC8Wd6EWrKYqN2cwy4AXsTX1JbnyKkHVrZBW8fGf1jq07
X-Google-Smtp-Source: AGHT+IGjLVAI/k2gDF9DsnnsZDMO6Fs1XEylgK/SNGdw3XLlPE70KsqOLf2ooU/prG9j3rGIImnyTg==
X-Received: by 2002:a17:907:9724:b0:aa6:9624:78f1 with SMTP id
 a640c23a62f3a-aac28c14948mr4401991366b.9.1736050476413; 
 Sat, 04 Jan 2025 20:14:36 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e89641asm2070432366b.55.2025.01.04.20.14.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 20:14:36 -0800 (PST)
Message-ID: <677a072c.170a0220.1a4619.0da9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 05 Jan 2025 04:14:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736050476; x=1736655276; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6t82lKL2jkXtgsPqpHS7GwRhDTtS7FNjS8Y5l4lplO8=;
 b=gMYTMIV6B4c0nfaJfmz3kWMpmvaH+4ZGHocrC5dLT/Sm5I5G/UtRNuyR8vtE/BJvl+
 VCI8JLwrH3bC+bse3Oy7JXRCTJL4cCOfiNkeZKEOm1SB15P7+Kpbo86tTyPGQLJBOxJp
 GL0FYCp35BwGNMMkog35GjiFI4YlxN3qHIMHwYpuuNG32dEHqVHyRID+27P/qHmxKRbJ
 +YtDT4oj3trYJ8ZLrPnAVO3ej7LsGEk0uFC9iQHLbz8OV9ZdIcWEArLEGA/3ABc5w5bV
 laP2dNhKpJCUXSnmb+JPH26kbYsMSOuOoCUaqUsAY4bEONGYmoZ8GNlvo5HmejrVqOZS
 Cbcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gMYTMIV6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-04
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

Autobuild statistics for 2025-01-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  6  |  0  |  9  |
  2024.11.x  |  4  |  2  |  0  |  6  |
    master   | 17  | 63  |  1  | 81  |

Classification of failures by reason for master
-----------------------------------------------

               host-php-8.3.15 | 6 
                       unknown | 6 
             util-linux-2.40.2 | 4 
               mariadb-10.11.6 | 3 
                   mimic-1.1.0 | 3 
             batman-adv-2024.4 | 2 
  gobject-introspection-1.76.1 | 2 
httping-0e26c53d5fe504eb720... | 2 
                  ntp-4.2.8p18 | 2 
                   perl-5.40.0 | 2 
                  bcusdk-0.0.5 | 1 
             bluez5_utils-5.79 | 1 
                  boinc-7.20.2 | 1 
                 coreutils-9.5 | 1 
          cryptodev-linux-1.13 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   duma-2.5.21 | 1 
                  ffmpeg-6.1.2 | 1 
       freeradius-server-3.2.6 | 1 
            freeswitch-1.10.12 | 1 
         gobject-introspection | 1 
            host-binutils-2.42 | 1 
           host-cryptopp-8.9.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               host-qemu-9.2.0 | 1 
            igh-ethercat-1.6.2 | 1 
                   iotools-1.8 | 1 
                  janet-1.35.2 | 1 
                latencytop-0.5 | 1 
             libargtable2-2.13 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.124 | 1 
               libglib2-2.76.1 | 1 
        liblog4c-localtime-1.0 | 1 
           libmicrohttpd-1.0.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              luabitop-1.0.2-1 | 1 
                memtest86-6.20 | 1 
                pipewire-1.2.2 | 1 
                ramspeed-2.6.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/fee74e1533b961c18cd970154a2bbf34f1f6f732 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/0a16e33c2241ef1ff906a0cdce17468f623999af |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/24eefb29c51808a2085778d412ea4cd2f31c324b |     
  powerpc    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/6bf133f279e459f5c11a4299a50c3ebd3f90d6d6 |     
    m68k     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/0db527fb2489ae85f2498088046dad1cecd3d75e |     
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/2ddacee0cbdd54ede6801a20f03aa7fabe1aa64d | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/c64e7302024aa086b9f6cedec188621a13926267 | ORPH
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/61f46925f67c9e367f6764089d5ad561dc8968a0 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/182ba14c3a0b8493b7ae59b670fffae75d12a364 | ORPH
   sh4aeb    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/a120186b0f11610d45f568092a6564adba8dee75 | ORPH
   armeb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/52c11a2a7e6ec6c5ccd0d66ade82007b12090a2c |     
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/37b01a1b5a35c8415e054908eae4d2bf70ae11c0 |     
  sparc64    |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/72e7727cf6e2fd99f461e3b5c0905ac49a65fa4a |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f8e5ef74478c63c89e7b99fb928b97ac4518f943 |     
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1f2bd522f59e0affeff01f635176073029e29dab | ORPH
   armeb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/965fc0fe2c9e273d57b7d065d37c659ae40a5d95 | ORPH
   sparc     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3ca906b3b72ced9c803bf19b6e843a6cdad21948 |     
   armeb     |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/8b3a24be56526eb0b41edfcc384b1c0f320031ef |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/766cfa3713dcee21ec565841bd19224dcd7225ec | ORPH
   armeb     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/99157ad5502b9edd3478ea8dcb7c0f435fae2ce5 |     
   mipsel    |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/aecee8420b7628b73030213d69f7487273ba6116 |     
   sparc     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/583c054a564f90b8c884565070c5e17b43b89674 |     
 powerpc64   |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/b6bb0fb4a17af65fc8502b0dd9e091cfc49c2756 |     
    mips     |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/dd78d8d7d67572cc08e1dc66f5fb06722e27b254 |     
  sparc64    |        host-php-8.3.15         | NOK | https://autobuild.buildroot.org/results/70688da8a9d6193a75bcebc4d03d42bea95c4ed6 |     
 powerpc64   |        host-qemu-9.2.0         | NOK | https://autobuild.buildroot.org/results/9d5f179df6dd57c4b97189e8e2dc3ce16d46cce5 |     
  riscv32    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/e3d188f593adbfdcaf3bba697c8105fd424cccf8 |     
   x86_64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/ccfba65ca0729105d0f01e675fcb39034d410bcf |     
   x86_64    |       igh-ethercat-1.6.2       | NOK | https://autobuild.buildroot.org/results/b9e77311c8d4951dfac23581fd3fb00155cedd77 |     
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/7d7edf2b75c57f49cfd71b7e5eca93690c1aeb90 |     
powerpc64le  |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/3af41f1810cc1f25c3cdb928c45b057e2fde33fd |     
   sh4eb     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/7bb2c947b0eb4a25217cdd2c541a48dd03cf474f | ORPH
  sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/be8204fc67a8174dabdd1a3b23f6d4cd2e4c24d5 | ORPH
 powerpc64   | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/a8ce024ceffaca7e685f1e25dd5763f21695558f |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/28d40d7f6ccc35ca43a56deef4f5d56b53f73f00 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/003f2fe3950986f4fea26b92e4f3c1b8f6ca63ae |     
    sh4      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/cdba061d0cba66a6dec86b58b7b33cb8a5d35429 |     
  powerpc    |      libmicrohttpd-1.0.1       | NOK | https://autobuild.buildroot.org/results/ff5fb1ec9340fd443ecbb88cc54fd35fdad56150 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a2747426b01db4023c4117f28bd75c8f2b9ad691 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2e999973156b22736d9b68d9f69c469560ce6557 | ORPH
   mipsel    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/b68a516e9ab71bdc9c26bacb7fc2c32db7bfae69 |     
   s390x     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/688023acd9b24256e9fb0b62c056ec2a7f6e2139 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/9f8f4797e99b2828fe8acd8242c6861ff9797169 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/4391eaaf6082133818fd6b1c619f524d9e873f7e | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/d5eafe37b9684e0893bf376fd4345211bae7ced2 |     
   x86_64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/accbeb4bc34c8356ec5c4189fcaa83e945c6e71d |     
    arm      |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/76361e4f52ea0fffb42fac4d152e393468dae73c |     
  aarch64    |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/2df7abf29052eee2c836cc9b3d094ac8390a9e38 |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/09d397ea59543ddb9ed1f6b230e9ee91f6088ac5 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/dbe911d3810fb0967b44d7fbaf881ea3d5f15fb0 |     
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/997d58969aef60ba151bb159957a6cc76989ca46 |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/49591930c5a685ee2d68a7f14622799263a25487 |     
   armeb     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/51df5006e8a46b0a4828940f6986b034fc73bda8 |     
    arc      |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/5006cd98269e6d3eba35746f3e00ce2e837e6293 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5d92e809e9d4599e4262e889d46b59cc613c3fb5 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/11ca6df60769890be354731daa8274f7d84c74c5 |     
   nios2     |            unknown             | NOK | https://autobuild.buildroot.org/results/9c645b657df111692d18cc95a2715ee531153e52 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/b6063beb75fbe98c77b55064873760b46ade7766 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a11a2aa46c171b54c929bf546664b1deebd40eef |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/4f30a9f1780a5c509381b489aca2aef9c61aba72 |     
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bfd1ba5ddf6332b3e30b4044d86d724ba090bfdd | ORPH
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/709815929e53eb770bdb4971fbd553d9be159785 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/853530a0dc0dbb20c3b9abfddc4aa6b32bb15ccd | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2e82a89ab03b08dfff61d72c1803dd31385907e2 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  curlpp-0.8.1 | 1 
                flannel-0.24.2 | 1 
                   foot-1.16.2 | 1 
        host-python-lxml-5.1.0 | 1 
                  iozone-3.493 | 1 
                 opensc-0.26.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/ea0fba7ebf6e0e07bad0755ad6e0bf2bc19e70f1 |     
    i686     |         flannel-0.24.2         | NOK | https://autobuild.buildroot.org/results/16f56da741d34c00797ca1906f4249f43d9f684c |     
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e71a5a4bd2932281653885ad445e485449e8ceda |     
  riscv32    |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/8ba86f6aa08e1793855f90bf9ccafbcdf8d2c31d |     
powerpc64le  |          iozone-3.493          | NOK | https://autobuild.buildroot.org/results/bc60342b5c8b03e4feb3be910292328d5d4bc622 |     
powerpc64le  |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/6781318d86b7fdca1220556639df2e22cea8ac1d | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              host-rust-1.82.0 | 1 
                    sslh-2.0.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/3c2e24e72e526de0d1c8224b3485f86a2811a8c5 |     
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/7acae6eaa38030705d3bd2e0f41b03579746de3a | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
