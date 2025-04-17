Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B59C369C2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 03:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C7FF60F39;
	Thu, 17 Apr 2025 03:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbpU1tRN46FS; Thu, 17 Apr 2025 03:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8538360BAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8538360BAA;
	Thu, 17 Apr 2025 03:20:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02445444
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 03:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7D8482FD5
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 03:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8voXP1KcFbfs for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 03:19:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 685AD83A3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 685AD83A3A
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 685AD83A3A
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 03:19:58 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac2902f7c2aso44846066b.1
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744859996; x=1745464796;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g0kT+MBqxRTeoXjfOmgSy1XOeraxbHQUQAgmEI77yyU=;
 b=d+6XX6bFXFWWcBrdRilyYUsxHnUddISQrS+Z1qgX++1zI2Khox7ICMqtcgJcA7ZKz7
 0C4Zf3LDYvhrwyMcip6yLO4QLwTJ/lkdLUzQY5YSsMmQqX31U7JlpvUlVctkZbNnI1aM
 MazlVRfrYNnY/s4vrqiuVlVOPXrNmGmj7DQkNzGm5pUO5g6uL0C5O8ONOBVZ+ZvMHsT1
 jc9/vCPbRuYeM9zst1Y1cUGT/DFOtEQ77lvf3w862xJXC55lZCeQd21jUGbuMMPpnecH
 L2STuI5AYzCypAjnooXRqHMb6MpXyNFcFAhuJoADkS/WDxTAAUFMyKp0yQ1SeDmB1DTB
 jfoA==
X-Gm-Message-State: AOJu0YwrYNh+eE9QMl34S8yGYtyNXnXd1CWLDVquWKitRh53BQ3qqgCb
 3wekpN5G8kCo5C/s601pbasrzw/w85zTpupe1vWSoENHPHWqDPHVUGwGRA==
X-Gm-Gg: ASbGncswpoyj134ltnx6GubgqC1VHWeGnuj5xrpiFoP7uR4UysbffhecboHJ+QM4vpB
 AsDkWQZ8Qb+fD6xGHb6LVVwPCi+lrbKQJB3BwIYkuiKVGR/JCgI0v0VL8Szg4CSAbQRfflDOyAQ
 TbtO6Vtt7d10/y6lxocS8p1hSMPACB4DDX+VCzCz6woxFRhjsajTDttM6/7gDCQubjhP547BiKv
 mIFTVMK1tlQ7SF7iOG5MCxexmN1XgkzC0IC/Pb0UwocEFNFCmUICXHCMYWpEQAi1z4vpFrgvxYs
 iQJFNVOfZkAwaaFqE2V/ZqQPluwtVO4461D9a3Z1vyXb
X-Google-Smtp-Source: AGHT+IGO7jCBHj+R9rDEtWia2XQbXrd+16dhR34tLN9605mAlyUOF7tA3BRqhqnl8KfJUTc7/HVahw==
X-Received: by 2002:a17:907:c16:b0:ac7:19d3:1b2 with SMTP id
 a640c23a62f3a-acb428dec40mr438856566b.18.1744859996164; 
 Wed, 16 Apr 2025 20:19:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3d128959sm217378566b.112.2025.04.16.20.19.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 20:19:55 -0700 (PDT)
Message-ID: <6800735b.170a0220.11d891.6238@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 17 Apr 2025 03:19:55 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744859996; x=1745464796; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=g0kT+MBqxRTeoXjfOmgSy1XOeraxbHQUQAgmEI77yyU=;
 b=Yqiwgdma4adCa5uPEgVnYl4PnVeRJ1yb3wthrCA3onEiE1FeWEx5yrCw5wlJXaJWcB
 ADxG+4VslAAW75qsV+84oci0s09zbN99QIq1p7sEvnK68lp/Sm+gH1qmU4mPIjHSIDZ6
 aDsnMZS+O8ziOHXZWlqmc3/2AsRoaZGXCD/MB2aw9EvaxkYHhAudmYa7Q8HWyQdN8J7t
 icIpoFQTCiRVf0Flcstrx5mq5s47vW99RMl81ILXIJG+rvg/WC4J5KwkmWjV/UPTz7dK
 8xxH2Bw0B/gwGQd0HIGKbp2daX59EqzkYig+4qVL6T0x4V2kDHXdoxxVPv58KUEtTbrv
 1Ubw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Yqiwgdma
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-16
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

Autobuild statistics for 2025-04-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  1  |  0  |  2  |
  2024.11.x  |  5  |  2  |  0  |  7  |
  2025.02.x  |  5  |  6  |  0  | 11  |
    master   | 11  | 54  |  0  | 65  |

Classification of failures by reason for master
-----------------------------------------------

                   libcap-2.76 | 8 
           at-spi2-core-2.50.0 | 4 
                   perl-5.40.2 | 3 
             dahdi-linux-3.3.0 | 2 
                   eza-0.20.19 | 2 
    host-python-greenlet-3.1.1 | 2 
              openconnect-9.12 | 2 
                openvpn-2.6.14 | 2 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
                   crun-1.18.2 | 1 
                   duma-2.5.21 | 1 
                    dust-0.9.0 | 1 
                elfutils-0.192 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
             fluent-bit-3.2.10 | 1 
                haveged-1.9.19 | 1 
             libargtable2-2.13 | 1 
                  libdex-0.8.1 | 1 
                libdnet-1.18.0 | 1 
                libesmtp-1.1.0 | 1 
             libopenh264-2.5.1 | 1 
                  libsepol-3.7 | 1 
                  linux-6.13.8 | 1 
                 mesa3d-24.0.9 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p2 | 1 
      passt-2025_02_17.a1e48a0 | 1 
               postgresql-17.4 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
    start-stop-daemon-1.20.7.1 | 1 
                       unknown | 1 
        wireless_tools-30.pre9 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b1535776c4ecc3bd3acea1e64712ed603ffc27bd |     
  riscv64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/13c8f6d4c01500b1fa251feeef86b89f2ecc167e |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/6f4d23e266adc4baf03d7c66703626e0bb9bcb7a |     
   mips64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d4d1a2501288cb23739b45ca103fda24cae991d7 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/cdc9e7d64f0eb9b8f7706742d33cfca79d8e2504 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/9c3b53d1e11613e752c5001d55c1c14804662845 |     
    i686     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/3c610410a97fab92fa0fe2f6096ef5f3fa731bca |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ce3384165663b6ca1d68257b67731290f35dd0c4 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/947e070655038c585ab3154600647a3115a302c8 | ORPH
    mips     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/a207caccacecbcbf703767d30a24192286eb873e | ORPH
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/79302ec2ba441250defc4f7d7e7701c067353669 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3338bd6bacdbb6ef0758eed0cd6387b38d44dd93 | ORPH
powerpc64le  |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/4d2d3f455767b6399997a269ea356022c4c20817 |     
powerpc64le  |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/45154aa6afcc91260edd3f8b33e4034f3204a205 |     
   mipsel    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/fe1574443acd50ca7e576bb4beb24467be1713e3 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/9bb0d6653fbfc95eae6e780e72f054d7e92d7232 | ORPH
    mips     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/b73af6e37a4706dfa894699d365cb7072d9f3f31 |     
   x86_64    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/15ad7bd9a5a2eb02b8d01ad2a3c74a49b27407f2 |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/979293157ffb1ca0fc297e9385d9b915069007fb |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/3b6d143af7dba7c440f2ea2a758734d1f54df54d |     
 powerpc64   |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/daa58019aeeb4b0ee717f274805f7c3321ea6ec0 | ORPH
 microblaze  |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/73838c96bb3da1bbc4104fc88c2391bde2f0cfaf |     
    or1k     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/74e2c4d37c5b0ae2749c7d77ca7431bd0d510971 |     
microblazeel |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/87a1a7fa1bffe9be778d05a97ac81e31ca224fea |     
    arc      |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/99e107539c1a9cfcf61c9721812e063983b55fc8 |     
microblazeel |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/03e78ccd3f2c8fb4c6ce82a8d12483845648ca18 |     
   xtensa    |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/7962bbbcc94eefe77d0e20c2c58ad1740e5d75b7 |     
microblazeel |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/cee9bc02396e0cb72a5f667e6a86b7d637ac7751 |     
    or1k     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/b18c5bbebb6cd2298999694a88fd8f931cb7081a |     
   mipsel    |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/a704e45cf2bf1ce0bf396b62259a9ddffc7737e1 |     
  powerpc    |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/37f942178fc3f50615f46e43ad94de47e4e83613 | ORPH
powerpc64le  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/9a7941a563b6a5f1f3a0eeb015b03717de0f8787 | ORPH
    i586     |       libopenh264-2.5.1        | NOK | https://autobuild.buildroot.org/results/7d3ffa7cc0fc38aa3a1602abf421d507bbf06d48 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/64a57ba56095e16c6a853bf2792497969660bf91 |     
    i686     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/6998529532f0e20866e7c182813145e964cf8e83 | ORPH
   armeb     |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/51920c83ca19044b3df3690e29004f83709d7f34 |     
   sparc     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/6a4897ae0ad10f3d789c4c33d422cbb0173661b8 |     
  mips64el   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c4ac39ba4e66068678e3583858c20cf008f9a906 |     
   armeb     |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/82a02b9cddd6a87d3fde2848be8dda665c2c6ffc |     
    arm      |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/e16da1b176c27f3c6cf79bebba58bee7028febb5 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/4d2aee9edc37fb488d346c3922e2f5ca12c55c5e | ORPH
   mipsel    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/4fd49c032f5fc07d42780046c4d36821d8afd4f5 |     
   sh4eb     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/0070e7132401273e9aa019adece181929b5b50f4 |     
  riscv64    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/5d893eea9d179023d00e9c6d81584551f56774b9 | ORPH
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/86d7dd5581d2b79eb5da46d436d9ea6851a01164 |     
  riscv32    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b960eeb72d7ea097ec968dd861804d460aa4f288 |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/93780d0653f4be7b6a3719739073137c3782368d |     
    arc      |        postgresql-17.4         | NOK | https://autobuild.buildroot.org/results/489329a0ac319b3f58894ec1f42152663bbf9d19 |     
   armeb     | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/055e01927f7dfebb2ffcecc6d15550743b1ca56c |     
  sparc64    | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/457b2374cb180b701b5f991c266f6d42def9754d |     
   mips64    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/a8b22aa30debbd675b290e54ec0adeb7a93a59ca | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b413aff0a69d88ee8045145a672b683aa114ebd3 |     
powerpc64le  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/85a4054aeb2a4ac4c0bcb5e2d0c71fc758540d24 |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/6123b9b78a49247c87b49fee9ca6a978f5308947 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               libglib2-2.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/ce91eb7171cddf73fdad0dfa4b2f46e863f0ad9c |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f2745c349fecdd6700a383ed28f98702f1026cbc | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ba76cedb4d782bbb56b41f8e25c0c57548cf6eff | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 1 
                    mpv-0.35.1 | 1 
                nushell-0.96.1 | 1 
                 openssh-9.9p2 | 1 
                 pkgconf-2.3.0 | 1 
                 udisks-2.10.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/16e6cb56d89d0b935c070c4466e70bd644c83cf3 | ORPH
microblazeel |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/58a4a20e30a42d9bc9dd27dd21e5ccafa3a3b04f |     
  powerpc    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/786cda1d8c7f8bfff5c28804c7023631962348d7 | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/03d8b681e5305e240366c1228ca07ddfe1152928 | ORPH
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/8d20a38a8d512aa91e9d3da7223ad1930fc24412 | ORPH
microblazeel |         udisks-2.10.1          | NOK | https://autobuild.buildroot.org/results/db06d19fc17da3f1598203f1270c89239f9b63e3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
