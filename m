Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00298C35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 04:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8246E4076A;
	Tue, 25 Mar 2025 04:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgKQlM8lycL4; Tue, 25 Mar 2025 04:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1270E40714
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1270E40714;
	Tue, 25 Mar 2025 04:27:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ECEA1B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 04:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D62060D55
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 04:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsKyhyayJVGQ for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 04:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 574D96083A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 574D96083A
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 574D96083A
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 04:27:10 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso134936666b.3
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742876828; x=1743481628;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=St3l/3E8vSJx+04up+qnIPNos9hXrXvaHy/ukQFVLOQ=;
 b=vEeCS2WEQx3m/CeiQCyOEbibBvKXnH4wRP9R3TKBplQguf8bNwVK4hoXo3Dkt0aX2Z
 EQs/vis027NeNMwHVNW9jc7fWBcdP2eSzxxhjYfAUhfCA24sd/x9jgyeLARnPBf66FXt
 9xGupwHY9mlv++t3LtGOy1qKCv+hXLCJGcGEcoAf9FuNa0ZrPQaxAl4e22s8acb/ghiV
 BeGPu5WOa3LjTy6jVIVjr8UNiMUPWQ0vcAc4zdZYpQlc6Dfx5A8pjTyW/+n8qoJF+2m8
 vYU0OGE6RTntTmvXP2+JCkEsWzBHbBF4GzD7cRV/YHdkT4hQJFysh2AYx2XHhmArcFxs
 TIiA==
X-Gm-Message-State: AOJu0Yw41vuoM8S4fRsZf/A5Efb7HSBG178EeqK8ye9K7qxGBuJ8xpdJ
 hAvnebINJhC5mME4u0vDwENSdfjh0A6cOizL5A8CE17OzES3x0ixSx2C2Q==
X-Gm-Gg: ASbGncs+mNWCjDEE0GgSe/qc4I0Iy5+K0foLP8TUgeMjMf0nAVCEa/GOW0g6/8gTXDG
 95ggvR/clLaTI2D2GCQgCL3KgBTHyYL4a+X50n7XeSIgU5JBLAQpGsDAgRhQAn28JN5QTSCI6fZ
 yyrS6NqUFSXadeDoo+bxl96miM9+KD5zyfweAu/MDiCGS4RldxTU7t4b6mv89FgY6YVNp/CmVCN
 66813tB5Ljnw38gVprZFaXfjWPWES4+TFX529K8KgEo1Lzxogl+mEU3myjmWMTt5HU1lm9GaDzu
 pnaRCNjEm4egNp76RyzGze73mV4RJz4BNaspQuG24csFd30BsdompIHyBds=
X-Google-Smtp-Source: AGHT+IE5laPOTosfxmXQthkheKQ+WYY//FbtiD0SUNXeT2it7x8pGMiSYDdGLZlqY01VOpl8JaeF0Q==
X-Received: by 2002:a17:907:7f22:b0:ac3:ed50:7ca7 with SMTP id
 a640c23a62f3a-ac3f251f326mr1581194366b.36.1742876827901; 
 Mon, 24 Mar 2025 21:27:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd24e7fsm775599366b.153.2025.03.24.21.27.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 21:27:07 -0700 (PDT)
Message-ID: <67e2309b.170a0220.2aaec3.8a53@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 25 Mar 2025 04:27:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742876828; x=1743481628; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=St3l/3E8vSJx+04up+qnIPNos9hXrXvaHy/ukQFVLOQ=;
 b=JYeYrIJJOLLD0N8eYna1og6Ge47ADoh+lRCF8oMDXegd3TEj93hrk3tazphk3ZUi6u
 ZxUCNw6vcAc9cL/nTube8rY9Vx2q7lVFZ9Ar3MlfF/C5iCH6LHI0U4Z4lWLpvTrtq3mC
 Z5ArnFnnIo+AQ3kB2ipMbWDIrh5S+x3tsgDC78aOzijKQ0n8OjbbZlmvM5tyW1h2Y5tM
 Xio1MPxXgL6dpsDGnAtUeSqI7hm9YJQZAPvSAhtqCoQ1BsN9XV7u5y8Kk802MQzS7sqq
 oRMqxdODXykbciE9wQxjpGBZiqLrMsnaZSgy5WOJdJWI9tds5qiWnRx3zqcZkCqGJWxH
 3yAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JYeYrIJJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-24
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

Autobuild statistics for 2025-03-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  3  |  0  | 10  |
  2024.11.x  |  5  |  5  |  0  | 10  |
    master   | 16  | 64  |  0  | 80  |

Classification of failures by reason for master
-----------------------------------------------

               cracklib-2.9.11 | 8 
    host-python-greenlet-3.1.1 | 4 
                       unknown | 4 
             util-linux-2.40.2 | 4 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.82.0 | 2 
                 host-gdb-14.2 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
      passt-2025_02_17.a1e48a0 | 2 
                python3-3.13.2 | 2 
          aardvark-dns-v1.14.0 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
             bluez5_utils-5.79 | 1 
               catatonit-0.2.1 | 1 
          cloudflared-2025.1.0 | 1 
                elfutils-0.192 | 1 
                  ffmpeg-6.1.2 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                 host-gdb-16.1 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 libcddb-1.3.2 | 1 
                libdrm-2.4.124 | 1 
           libfreeimage-3.18.0 | 1 
              libopenssl-3.4.1 | 1 
                  libsepol-3.7 | 1 
                libsoup3-3.6.1 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.2.1 | 1 
               linknx-0.0.1.38 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.13.7 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
                 openssh-9.9p2 | 1 
   openvmtools-11.3.5-18557794 | 1 
                pipewire-1.2.7 | 1 
                  prboom-2.5.0 | 1 
         python-remi-2022.7.27 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/807a8eb334318f81a9353869ae416d97e9878656 | ORPH
    arm      |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/5f36cb52da0efb77bc42379f0f2f9f57d4c2f81c |     
microblazeel |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/ee155eaba681656bd9d3c41f871a7c66b9d05efb |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/ab14ec41bdd84d6c17cbd680ce16bb7cc6ce6797 |     
   x86_64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/2e6f85d8a5ab63ec1ad1c186e57a866b61e19c8c |     
powerpc64le  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/4d54524dcff5f55f62953fa3beab0206a9200c91 |     
 powerpc64   |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/046500268874a5ec0308ae03759991250a410d14 |     
 powerpc64   |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/cba70aefc6f15371175f6ef69cc53b30defc8e66 |     
   x86_64    |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/13622a6844f06400b1c941c81338bdd3737b5810 |     
 powerpc64   |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/5e7d2b55ead826816f64d52dbbd5c9c208ea6262 |     
    arm      |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/654d71d56081994aa56a923a205d0ef198130920 |     
 microblaze  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/e95dcab2629200070fa1d8e08dfc74fa3478b79a |     
 aarch64_be  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/5438ffd95abb2478cd914e92d9745d032f95b922 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/db93c53c7472f0ad28c1bf565b05c83f22af43e9 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/9c4d21fbacd62e4d1a05f8a778880e12bd1878dd | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4fe8b2835089275504238e093d1ef820556708f4 | ORPH
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/4e73d1e32027119cf2d8124a8cb9d788951a8e7a |     
    mips     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/69fa98358cc9764ff82463766c22339c26998637 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c2399ad47234ca48d7579f01cc992cf70108c131 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8cbc0810db19803c2f02b6ded55fbed65f05f670 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2a2b66a2368cedd19fe78d55e57670fa80dbf7da | ORPH
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/197bad9cc04f501b558beabf0dc84d432801718b | ORPH
    i686     |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/882d598529e09950d19566fc0377aeddaf20bcd3 | ORPH
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0bfef102a083c9502635390d048c58557901eeea |     
   sparc     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/fb7c384353d72257056384a26cb6f1a273b28318 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/6069a5fff76d1cc766c03e6de4689760e1c2210e |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ecceff1da82c60d0441ca4be49eed401af2e415c |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0014c721382765539e796f4d95446c1a1853b856 |     
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/5d012433efc59b472bb90f92ca42baa2f4063fe0 | ORPH
   x86_64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/50d173cdad4a8899caecfd2953e243e735eeca48 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/ace948f975da6b7e2055a330c2ec650233e40165 |     
    i686     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/c50722803f1874536efdb0f7d8b17cf1de5b404c |     
    arc      |        libopenssl-3.4.1        | NOK | https://autobuild.buildroot.org/results/6db4922fc5b2d8ea56c8cd8df33a8ef676351117 | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/d05a87458c752d9f2c89af3901d4678c560a4a74 |     
 microblaze  |         libsoup3-3.6.1         | NOK | https://autobuild.buildroot.org/results/f43b8a81c5f51be28a6919c059e4c6d24afff737 |     
  mips64el   |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/347f6b7568dd7e67da5678bb61d9c9a217bdcb20 |     
   s390x     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/7fdff26a45736c632ef3bc5538c56cff0195e9d3 |     
  sparc64    |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/98e0cabeabc794f72e4e25ed9eef3ee6bf77d671 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/eb5d124eda7d4ab244f85d9f75e9a54c066e0624 | ORPH
 powerpc64   |          linux-6.13.7          | NOK | https://autobuild.buildroot.org/results/e2811cbb942be2b6fd710d960eaed27201608da8 | ORPH
  riscv32    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7ac6731f0f712168c3afdab10d5a9c1f9f90f60f | ORPH
    sh4      |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d12ac8f835d17f6bb99c4d8da7bdc49fd96f238c | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/4de7d202ffd5028881eac4c817d751afbd1774d7 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b3327ca2aecb4bdba36d7a2412a3f5bbbfc63a07 |     
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/bae9274a75cbb45712fc7767d37707e9ea4270af |     
   sh4eb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/90a654d94ad9381e18fec6563a50406341072709 |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b8d5b166730b40ea0eb91c6519b3c5459b46b336 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/982f02216e91ed3bc761fe06345fccda912f9a50 |     
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/1fb235910b6f65500096799fb3f8555ada9f57d7 | ORPH
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/744c3c5a8ff00ac6f38c722ed79b6a64670139de | ORPH
   sparc     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/91556212aecbaad9c9a605b4ac0737700e930806 |     
  riscv64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/77c3f0e446c326dc92c854828a4dd53e5f752121 | ORPH
microblazeel |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/2b24ddb8fad24c2db1e11b3685d9fa8a4bbf8197 |     
   armeb     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/c0b592969b67e0a6454ab0714ca9540d7bae498d |     
   sh4eb     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/44c6e033660ca7abaed97b6893ea2ffacffdfa6f |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/bc40b4e7b345f978e969c5264c7dd8042fceb932 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/2772837af0280a30e49e3adc695ede94e6bb6e44 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/d5bc2e6ae849968015827c6512da4ef37ce29cb7 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/aeacb8b7090c81d8987bd8fe9482758527296ccc |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e495e934c5e878a37d32fb6644fc47956aa5317a | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1e1bb5795dc1a17d21fd748687e59b97f1637d3c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d7a0bd89feeb8dbd9d1a46ceab8d96964f10e42d | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ce1a24c1465b82686ae375ac688a553fb65df5ea | ORPH
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/f9774f38c2284edeef2b438c40efa331f131dbf4 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

dvb-apps-3d43b280298c39a67d... | 1 
                  linux-6.6.81 | 1 
               popperjs-1.16.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | https://autobuild.buildroot.org/results/d865afddc52d8e53af551e7f4bfd722b162f02a2 |     
    sh4a     |          linux-6.6.81          | NOK | https://autobuild.buildroot.org/results/4cde5e81d48bf3e4afb56838e8ed470ca533c283 | ORPH
   armeb     |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/89c3c585d08e9d1c965c429453ff0637277fe91a |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   crun-1.18.2 | 1 
                  dpdk-24.11.1 | 1 
  gobject-introspection-1.76.1 | 1 
                   perl-5.40.0 | 1 
                   swipl-9.2.8 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/f6b9a3c4585e850a5d81fd6c4e936dd4d6675c45 |     
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/2acd3e21057074b0571491bf8cefc25cb13b52a3 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e92d8f9dccef0217228fa551100e9954ce0380ae | ORPH
   armeb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/0ba1e8fb333f8a0f1c4465012265f570fe9f0ecb |     
powerpc64le  |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/01740bbc56e1c4488a71ad0723f5e1585a1585aa |     


Gitlab CI results for 2025-03-24
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160212  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160207  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160203  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160190  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160185  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160173  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160168  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160159  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160157  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160136  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160121  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160115  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160107  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160085  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160083  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160076  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160072  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160048  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160041  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160040  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495160009  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159999  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159998  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159996  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159995  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159990  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159989  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159988  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159983  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159974  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159965  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159962  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159961  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159950  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159946  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159942  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159940  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159937  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159928  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159915  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159904  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159876  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159870  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159856  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159849  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159846  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159835  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159801  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159776  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159768  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159759  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159755  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159745  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159743  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159724  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159716  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159713  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159712  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159707  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159693  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159690  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159688  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159685  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159680  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159603  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159595  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159448  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159389  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159333  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159219  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159132  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159080  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495159071  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158968  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158915  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158911  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158888  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158874  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158836  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158793  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158784  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158773  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158764  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158756  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158737  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158730  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158684  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9495158670  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
