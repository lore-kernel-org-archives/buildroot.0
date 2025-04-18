Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C182AC369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 03:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9295846B9;
	Fri, 18 Apr 2025 03:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1AESaq6jkgS; Fri, 18 Apr 2025 03:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178EB84195
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178EB84195;
	Fri, 18 Apr 2025 03:22:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEDE122D
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 03:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C456241295
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 03:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7sfX71AlqeE for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 03:22:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CC2E41289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC2E41289
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CC2E41289
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 03:22:48 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso220564966b.2
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 20:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744946566; x=1745551366;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ocODnb9I4KPhPAeKC/SZ4SmNjnu4n7cc9YOicpUA+sg=;
 b=O+7nkdyufB9Ud4oX717IPlwWcBv0WoEkZguYovmrIet75/iLBFut+HnU3LT3SZFYA0
 d4f6nBp/xjjTpDg2N3QPoRrZuXsmy5HfT2/kbQQbWa+B1afSBpZNivv2KyzpqNB6Vq7w
 iqh9HuxlG0i+d5k8DeNSPCU9j8OkKEmS45ZCPQzYfX/Sj9IwsFTKc2dzdW8Ztjzlz0Sz
 UXXlfQanURa9rYj9qM8J36gKvxA0bE6P+fpZBMzTBblyW6vOvpUsBSLg0epW8gIA1yic
 gxh1MiBclBwWR3bYd9jA33Wv+Zxh+y3WWe0H1As/LY0959fVNLlFWMOZ7GN811OnPqAF
 30Lw==
X-Gm-Message-State: AOJu0YxGVJqILXMgVBl51g1hJggDUjRa7fKBK+STp0xYqMqMZYNCKr8T
 5CEGFYcfTPibAmUudUWsr2yXaFmFwAPqphNHd9OEFg7ahWrsAjBcii2O1g==
X-Gm-Gg: ASbGncus2e6GQv3dPAeSX9N4EMuLOUmHDqF4aOhiyyW3uXYQuyWIeWvQiYdYf6A6Tkp
 S3GeE2NHJxWazUcxeZM7wl8Z+dnlc7QcqUZsBY/b3qp2CDill3RSgBUEBl2swZtsNBuJ7juay4O
 6n26XJdR63RP+BRGWfeEUvCNWRLSn0acro4OshQTUJgXyA91vrqe6hIRRKlUIUYLalWsDlBTlzR
 5kZ+FN83D1aiq3LbqU0p0H2WHNb5nAQD8/fR6NLcuefJ/Dtggf5pie+McZ8B1fZgGJe0x7M8Anv
 ndbLbb87+moeHwnYfUaQt4IouHkWBzHXPknfwd1c+5hy
X-Google-Smtp-Source: AGHT+IHDT1sT2SZIEqnx5VWJnzTzyrA3Plz/CAF2iuK96lQbXoQtfTRfDzAz+bliYH0/C+Q0BjQGjg==
X-Received: by 2002:a17:906:d0c3:b0:ac7:b366:c331 with SMTP id
 a640c23a62f3a-acb74dde4d0mr82543566b.53.1744946566425; 
 Thu, 17 Apr 2025 20:22:46 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6efadd0asm67934266b.175.2025.04.17.20.22.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 20:22:46 -0700 (PDT)
Message-ID: <6801c586.170a0220.14e9e0.25ad@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 18 Apr 2025 03:22:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744946566; x=1745551366; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ocODnb9I4KPhPAeKC/SZ4SmNjnu4n7cc9YOicpUA+sg=;
 b=m3hHodbBp864X6nd4yUFd/QHdYDYnjKMvSNgJvUf6D9WnVZyjl1e09uJ/WtnnrgY0g
 BgHGUFb1SlPg8gaINrUrHHt6VJz+0OuZuSXyzjV4PCDkhDQrnf1NHwzOndyLjmLMqOer
 4DQeMoGAetV5XZVsYVfx468pLnVMhq4F+YnGoRLHRfaSsG7XZDtbNu9WoBKDjPeXxRsq
 aME/y9Gos42qEivt8EhrtwA0rkEas0S39Mp2n66WFCLoMlrlWa+1Ppi7NfTmc6SuFAHs
 yEoSk2BObMoG+v+S0/0IcPVqGfxs+99dc/yNi89IQM0NhtVjQW8lYo5EIS2RbEz4kR1r
 7vsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m3hHodbB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-17
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

Autobuild statistics for 2025-04-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  2  |  0  |  5  |
  2024.11.x  |  3  |  8  |  0  | 11  |
  2025.02.x  |  1  |  4  |  1  |  6  |
    master   |  4  | 47  |  0  | 51  |

Classification of failures by reason for master
-----------------------------------------------

                   libcap-2.76 | 8 
                elfutils-0.192 | 5 
                   linux-tools | 3 
                       unknown | 3 
                openvpn-2.6.14 | 2 
               procps-ng-4.0.5 | 2 
                acpitool-0.5.1 | 1 
             berkeleydb-5.3.28 | 1 
                bpftool-v7.1.0 | 1 
                 c-ares-1.34.2 | 1 
               catatonit-0.2.1 | 1 
               collectd-5.12.0 | 1 
              fftw-quad-3.3.10 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
        gmrender-resurrect-0.1 | 1 
  gobject-introspection-1.82.0 | 1 
                 host-gdb-14.2 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
                jemalloc-5.3.0 | 1 
              libunistring-1.3 | 1 
          linux-5.10.162-cip24 | 1 
                memtest86-7.20 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
                opencv3-3.4.19 | 1 
                openswan-3.0.0 | 1 
package/gstreamer1/gstreame... | 1 
                   perl-5.40.2 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/4b6923bce45e3b8b98482e9b9d3c510831320b4c | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d10055a8c2b7782e4c1dfc813de4a4af49d3fce4 | ORPH
    i686     |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/82b4036519e98bb877bb6933feb243714cb2d2ae |     
   sparc     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/c05844cb1dde8e4ec1f979e3658eb32d1e4304d4 | ORPH
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/0e3120c65850363acb5bd1a6d851a66d375b637e |     
    mips     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/4eaebe715bfd9c1c0a299de75823ee81587889a2 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4c0cd4f9c901f39da367a68c0a55e44dd8a4e295 | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d3ebf97f046e6f904ee68acd912e9d72e9fb46ec | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7ed580d01bf951556e469176908c2040399ecc75 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/87fb8c9e35e2bf02bd50ac37fb6dda2808b9d7ee | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e6206a81d497b54873fa5d077476807ebc14f983 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/b0cdb8f21f312b3a1cc20a83102f495955221f10 | ORPH
  mips64el   | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/e6cfbf8b656d6b18158f32c4dbc6053779e4dffc |     
  sparc64    |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/f581a38388d60057c08bca158b1e21341b7e9a13 |     
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/1dbebdd7007231d8b0c4ef4352567799a9f8f6e8 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/27d2add24407ed4e3704d07e513629656dc7a77d | ORPH
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/5f017fca3d708388c9f66afea39b090f0976d496 |     
   armeb     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e59be9b0615be09c078c89ae570ecb658301da39 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/74a75885bd08d0e1fc499cc2c8162c8af9d04e89 |     
    or1k     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/60fc7f5a2991eac32f9bb4e9d6c94e1ec304c1a8 |     
    arc      |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/87748813003ac5d4962a4f54ad280846799af401 |     
    arc      |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/c99f461ac757d2934a353818a302a67ef3ad5cf5 |     
microblazeel |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/8cae72f02d25a48287320d9c991f41761487e353 |     
    or1k     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/7a2a4e2d3a244880524bfd7a0e293b6337e4e037 |     
    or1k     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/c8b596899f78545ed0ac0d3bb48caac3e79d45a1 |     
    or1k     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/dabf135a8758bf037f4a27b554025e0431031dd8 |     
 microblaze  |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/4a71afd1c6b1b2df27d787ff505e1e4f2083b43a |     
    mips     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/8d739e21f17fef7931165491e301ef29fc9b87b8 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ca88163f773cb62c09dd5b7dc688cd702524440e | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a220679135be5611990d979a89db173a12382399 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8ac09b7f95e3da9c3ea557ab9dcae3d5996d9743 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/92573fa7dd2cef01b6590f00604c2bd14672caab | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/af82ce9bf05eed3ccf79f820fe7c6a081a39e31a |     
    arm      |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/4f1b4012e08001b55fdd3d14b523328ec0c3d30e |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/eaaeec69c4f0c2c78b9023702af92b348af6d9b9 |     
   s390x     |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/8c656e65ba9db016f4f2c4f9fd0dc2d3121e9d12 | ORPH
    m68k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/9a03b8c88274c66750a5e38f85d4a2e1b0c86ae3 | ORPH
    m68k     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/c92b25576774c81f552eb841b0003a4498560d72 |     
   s390x     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/2ca6b265cfdb5d0ac96cfa7e2d28b2e29c6ab14f |     
  sparc64    | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/2b83ae58b5fa544c973a81008b69bde01cdad4bf |     
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/28ea89d49e3541f4e58d7672186cc6c54b08fe5c |     
  mips64el   |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/6c053a79ba9a98a725021ddd4afef7a84ee88195 | ORPH
  aarch64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/65bb61bf12583d5f8450bb3bdd36d1f512fd6059 | ORPH
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/4400a328b77f407023121c92e30531c5b3d28005 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8610f9222516bb5a0bc14f615fa703b3a4c71db1 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/750e2387c0158cc1416d5fbc15823018e37f77fd |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/e83214ed5f155415e927dea6b3245948fca73673 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bsdiff-4.3 | 1 
host-vboot-utils-bbdd62f9b0... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/b6aec9a20e824169e96f6105648f39b5eebbcb26 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/0dba2acb84f8a3314e26691bcbc18430aec945e6 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

             util-linux-2.40.2 | 3 
                   bird-2.15.1 | 1 
                  bitcoin-28.0 | 1 
           libfreeimage-3.18.0 | 1 
          linux-5.10.162-cip24 | 1 
           python-daemon-3.0.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7c62973b4270b3732f8a0eb7fe4a2648a321cdb2 |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/7851d720f9d12ff715ad2f422963847b075e2592 |     
    mips     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/e8c2b3e026dcd72a5b2c80ac7bf5e6f35ec40c51 |     
   xtensa    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f9418bcfa927d125e2073207c2ff58c2fd941220 | ORPH
 aarch64_be  |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/4388377b240cd847c20c57b7d1e3be4fbd645601 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e75ada6e389c552fc086b37f9025b66f80393d45 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d4cf2e47820bcab14b58a5203a64e9cb0c13e8ad | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/cfcc0a22234ef2805a6a6691d22243e98821f3d1 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                  bcusdk-0.0.5 | 1 
                       netdata | 1 
           oath-toolkit-2.6.12 | 1 
                   openrc-0.56 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/e7b5653a2a6ae7533747b0c213c40588e708fa8e |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/cea5e8c2a8e70ab9f6277b43838165dfbc37d476 |     
   armeb     |            netdata             | TIM | https://autobuild.buildroot.org/results/0d8b2c33acbb26c73e054430b64aba3ad07d7b63 |     
  sparc64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1555be93602016d0bd6c2a5fd47af579019639bb |     
  aarch64    |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/35f47e406a6122b913802f3862be8c22130bf7fc |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
