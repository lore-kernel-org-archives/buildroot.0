Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E769C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 04:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50C2D84B05;
	Wed, 22 Jan 2025 04:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaKhcQTi_XoN; Wed, 22 Jan 2025 04:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB73E84AFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB73E84AFF;
	Wed, 22 Jan 2025 04:15:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF472D7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 04:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AABA584A38
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 04:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGAlW8NYpLow for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 04:15:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A99784AAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A99784AAC
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A99784AAC
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 04:15:23 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab633d9582aso390638966b.1
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 20:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737519321; x=1738124121;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j1GLaJOPlRSKQxcTMNFLtqMM63xTruY0QLD6GplzONE=;
 b=e961hRZqmm3bl+Oi2dvC92FQFgXUma64T8QcnT34a/UVEWcvlentbj2xYosanFFGVI
 h+KdENQu4ZjHZHoaglAeGBH6uBneKWnLKBmFJASlSPIp45yJVGxgUOvaz8SjHa5CgiiG
 EVqHNHCZqTIdT7ex1Ed45Y9hiJDG2n1nCPiRx2clJo1DXLBkCKFTfrML+pYA7WpfsjXM
 JcEz1cywasFBpRedBr/KHGP3sxLHAuMR6Xs1CavSK/BsskWctaHE1PfgSOjSJ7mNgnTh
 QLW/diBBTjY7FZdWD6UM9zjtuw6RE3LHdwPzM3RZ1u8m2FMHzs8zsrFsII7bOQrV5QqZ
 /N1A==
X-Gm-Message-State: AOJu0Yx5w6a1WjvDPMLcUKGL8aNRWv8NysBQw7pMtKUbZNefFUaO/A5g
 dAVXcOpNaFJxTVezogyHIo74Ft2ZQR6vP47RqLKCptjGyhEJ7xMUjl3xaQ==
X-Gm-Gg: ASbGncvmVNC50PNtDOs7STJ4GaAFswo41xvxtPNUi8oZ3JDPhKFsqPdXNJDkyzks5s5
 sa2G8j3jDITbvSlIB6YNMJGKigH7QyPnZQE9nSM1KQsSCaPMgC6taYyZPkhnSBPqKGbQJFk5RbT
 w2y3eu3xm12pano2u1bTGjyscqpWj/l6em2eKogYwBOI3Fab35yiwjc5mmSFAu7SaiwwwXc5ZTa
 NCj4c9ylPx2kLngmPCETnhHTicRBKKeUmkTc8TK8Y67P4IvxOd7Cw6FQXWxAx9UeFMrBayRYw==
X-Google-Smtp-Source: AGHT+IHakY08ovACnT7olrxVty9Xxn4pwOZjGXoFle8nKPsB+D6Ly2PuNqN7fOCduW1qpWZGiELhzA==
X-Received: by 2002:a17:906:d555:b0:aa6:aa8e:c89c with SMTP id
 a640c23a62f3a-ab38b44d49emr2034442166b.39.1737519320701; 
 Tue, 21 Jan 2025 20:15:20 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f2ab60sm846563866b.99.2025.01.21.20.15.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 20:15:20 -0800 (PST)
Message-ID: <679070d8.170a0220.3033b7.b0ce@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 22 Jan 2025 04:15:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737519321; x=1738124121; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=j1GLaJOPlRSKQxcTMNFLtqMM63xTruY0QLD6GplzONE=;
 b=PTgGNYOMP+G59rK5gpgNQDUbUSZZE6KcH1Fm8w7cMlDU2jmdzjQhNPWVOJnVu+xhDH
 siPSTKOUZfyu12kdPC+y4bsknSXmMYbdUKX2ALMiM+ESjQbzr8ki+hMdYc8fWaFEGx6b
 RGs5h620VdjnvJlNpgH4WGOO6tXVrw2zZqoMZgwa1OFJqXlnFTNav4QhlXXFDyJgyMgP
 lPGQK2HDmBdlWFgMhhtQQOgpuHAiREkoyYVhruaE/Dmvkmbd3RyiFHCQ8u6kUO6LwM13
 EjSPwXudp92xCi0flS4M8KWyKohH/+TS0WJMG47uzRKlG6JokmUXH0UvgCw/iOeaCDfe
 QD2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PTgGNYOM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-21
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

Autobuild statistics for 2025-01-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  1  |  0  |  3  |
  2024.11.x  |  3  |  3  |  0  |  6  |
    master   | 11  | 54  |  0  | 65  |

Classification of failures by reason for master
-----------------------------------------------

           at-spi2-core-2.50.0 | 3 
                 openssh-9.9p1 | 3 
                       unknown | 3 
              fftw-quad-3.3.10 | 2 
host-heimdal-f4faaeaba371ff... | 2 
    host-python-greenlet-3.1.1 | 2 
           libzenoh-pico-1.1.0 | 2 
          linux-5.10.162-cip24 | 2 
                   linux-tools | 2 
               postgresql-17.2 | 2 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                  bitcoin-28.0 | 1 
             bluez5_utils-5.79 | 1 
                      fio-3.34 | 1 
firmware-utils-86739f2b3ae9... | 1 
                  fwupd-1.9.20 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.76.1 | 1 
               graphene-1.10.8 | 1 
                   grpc-1.51.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
               iproute2-6.12.0 | 1 
              libopenssl-3.4.0 | 1 
                  libva-2.22.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 linux-6.12.10 | 1 
                   ltris-1.3.2 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
                     mtd-2.2.1 | 1 
                   ncftp-3.2.7 | 1 
                     nvme-1.12 | 1 
          perl-net-ssleay-1.94 | 1 
                pipewire-1.2.7 | 1 
           python-numpy-1.25.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               valgrind-3.23.0 | 1 
           xtables-addons-3.24 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/db2116c6f7ea7acb987da0bac2b883f4dab2f20d |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/06c1a9a5e55c29dec5becbdfb10f57d35b32d484 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b603aa4a3ddead8d4c4ab21c11c17063c4f4f202 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/c61b7546dd03a87bad13becafa86baa61a69e44e |     
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/94a2884ab366bf4c8fae9b3db5d0675519694b1f |     
    m68k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/27dab51f581bf2e0afd6fcf62e235fdf31757b2c |     
   mips64    |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/eb3b03b87d62e29527da3716928ffda7b89f7437 |     
    or1k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/03c0fd637f82fb2565e6d65b661cf33c8ee88ae0 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/d85046924f77a757d131f407120c800f23cc5f6c | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/674cfe89667da1b44f43d48eb9a146b20ef6a55e | ORPH
 powerpc64   |            fio-3.34            | NOK | https://autobuild.buildroot.org/results/1c0951b807ce7e8a26e69c63022370a90508bc60 |     
 powerpc64   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/0832449004ce1795a025c7848f99662cb771c4c3 |     
microblazeel |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/7c095b6e1110ca24fbb0124b8486c54cd09fccb8 |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fca1737ea0225b462dd1f4482b06883a6542e7eb | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/385de5f4afe37f644de2376e4b00963e40e25518 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4027067b7dbabca3178c9780c9424ec4bb08c347 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/b18f145d5a0865fe329913a3f8b685b876c8a20a |     
  sparc64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/6f7f9aa0f8922b7112721f46775ed4c6836a6a46 |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/8dba2b3f5a657dc89854efe36b79d457d18e8b91 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/b1901a1bcaa74c00485e4d566df84c69c31ba065 | ORPH
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bb636ff2038da423c4d3b94fd743211098d2820b |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/24383ca7c01f45d7230a5b8ae8de99edd2d2a159 |     
  mips64el   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/e8e4ebcfa129dbd314a9f007ec6274cb12cc93e3 |     
powerpc64le  |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/e429e02c7aaf2e0c700f3dc02f9a268be32e784b |     
  riscv64    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/4b79d3c733f00d07c1d11ac3815331260f0c4c84 | ORPH
   mips64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/38fad5f06520a58d8e0c56e4e8f3ab7775eea705 |     
 powerpc64   |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/c8fae7253eaa70001e72329d7749a801e1ed9f8b |     
   sparc     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/8fe5b95ce30b1faffc910514e7c2fdf8497c4fe5 |     
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/35e62346452791b9d1d032cb9ee9eef4ce0e9771 | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0f1a215e990b13ea419a5719b008934af941ec11 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c9c8c40983f925df07739763a175b017b3dda199 | ORPH
    m68k     |         linux-6.12.10          | NOK | https://autobuild.buildroot.org/results/43a9fc397c98bea650f956f6d7c0cedee40b4020 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/300ddb267b19e1245654f70daea7bca8b7b31ebe | ORPH
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1c6f1be414447d6ea74e129071bbef39a7a7ceab | ORPH
   armeb     |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/08c1b65cc7b91ca7ead35a0bbd5cb14ef1a75575 |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/28c72b07efde19ac6abdf6b2881e0caa99f39516 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/2c03bf5799ac5f641cccea75d3a677d344ac2fd7 |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/32afd400daefb32af1ce6eca8a0b36f92017c50a |     
  sparc64    |          ncftp-3.2.7           | NOK | https://autobuild.buildroot.org/results/a926b0ba692bd93a2b70d04ce58e9f906a4538c2 |     
    or1k     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/a8d65f28cbc7ea2a07f7340c55851c8818e1c540 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/0b340e2c3cc3515ee908f19b5247311791998b3e | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/27d12b3e206eee4ffd75b46d322082da45126672 | ORPH
 powerpc64   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/42280d6ce2507a87b1c3d274117ef77dd3decdcc | ORPH
   arceb     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/4119c8202b0a19f112b9572033e260e49381e381 |     
    arc      |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/0b1933403404587192e37b7eacd1635a9cfe5787 |     
 aarch64_be  |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/900213adebad3c5ba1c6d9d51af197aa7b3776dc |     
   armeb     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/adf0375b2de9b147d77a5ab5c57342f31c559eb9 |     
    arc      |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/d108b188e6cef5b7c590821394408ad38da4caf1 |     
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/8bcb13251f00541e4fd8408a6c1995616933ef27 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/7c7fd99c914b84ddefc40e2df6a9641a11113fdf |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/4f567468f2d505ccd16f2229e745b0ff66e4c815 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/f521af0efb736b4365fa6f34eb8d11d6ebc0b67a |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/2cd0dffd9f60a1e364b15a5296fe33231482c847 | ORPH
  sparc64    |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/58a0b9b8d70205dbc5dd725f59a7dfb2a719eadb | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/d7daa71a84d83e9750578820c4d55f17736c8472 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                    dust-0.9.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           dust-0.9.0           | NOK | https://autobuild.buildroot.org/results/94c4be7c5360eeed8789ffbb7a5189fa6c1b5138 | ORPH
   nios2     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/ef6d1014e496f15b9a7252e2a9b750ffc291a786 |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/855b9cc76ff956a23370f57d9390b8d892cc364e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
