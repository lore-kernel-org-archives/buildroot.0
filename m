Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEAAC54ED1
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 03:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 029E760DEB;
	Wed, 28 May 2025 03:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNDy3CJkUQr8; Wed, 28 May 2025 03:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3B2760DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B2760DEC;
	Wed, 28 May 2025 03:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86172DCA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 03:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C22340C05
 for <buildroot@buildroot.org>; Wed, 28 May 2025 03:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BnVCIz8XvA6c for <buildroot@buildroot.org>;
 Wed, 28 May 2025 03:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D1BF40169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D1BF40169
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D1BF40169
 for <buildroot@buildroot.org>; Wed, 28 May 2025 03:15:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso32228545e9.3
 for <buildroot@buildroot.org>; Tue, 27 May 2025 20:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748402110; x=1749006910;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dugn268bEgVOWXgNXEVIM9s9gol5sBfiR/1zyc+B64U=;
 b=lng9nGfoGW4cpk5r7KoGfyzXNt0WV63krj8iM7I64mCyUXse8p7aIU6gd3Xzlte1XK
 9Di+8NZ//m9cDL+aZAeVP+GGk4uZt4HMR75vmRXfzHcGK3KtifejXoF+WX4qmVJftc+I
 Nf5Lfhuu0bA7gTdWWLgGDws4dfojhP6bpU9SHxXSJNZdyIGfN1ymp8mbCAZRFUZt+WOF
 RxYNqj7sdvB1ijkzeWZyK5wKhRdKKCmNPN3DUtMMgmuY5a4pKn9dsKQ3XqqXj3ElE9fA
 wUwLbX0qg0qdAemPzoEbscIQcseVytXuV7SOF5IAKAFfrOoBZDO1bGxRRtlTD4Ikd8DV
 vKew==
X-Gm-Message-State: AOJu0YzBw/roE2x1Pv4BUI8wHyayGjtS3Cmz4YhhE3NnyOUJO/N5Vom5
 /CDMnJCJTC56sJNxncILQGgyAv+dIAaILneZ7MrjD8pQSmdAErpP4nul9UekDA==
X-Gm-Gg: ASbGnct7uiD84wMJxWYSyMiQB6fn8yAqE1EWnmxaaDdo2dVeLnS99c/9A0xh5HCp+N6
 CK8bVa/BYH2JFA9vS8tZhU//cDVTrUNasFkbyJH8qUV2WN6i1HIXOnr9e4KDpT5wneQas1LoO/H
 0MyBu0ullsHyKtMMiCWnR41r1ufDcVFOHJKm5oH/R6mSI3KmNPrk++QnRjwj2amzcj0pOgBR++u
 HdaLsrPEy7JXokxrH/ZZlik17wcqoiZEHKrbbeU4hljq24wU5jyYw1p+Hp9SX8Tgg10qbklt8mx
 SyGHWoDULydGOi4pK3p8R3bm5CdrSCkrl2tEA7XMMFV2p3PFWbq2dYE=
X-Google-Smtp-Source: AGHT+IHC+Ew6c8/wZIfhtBg9jdGU4QTy0ZfEr5e3gsxhamvCI6Wgkh7a4OV2TBPDdpPfOOuhBwk53w==
X-Received: by 2002:a05:6000:2504:b0:3a4:e387:c0bb with SMTP id
 ffacd0b85a97d-3a4e387c5afmr4498860f8f.59.1748402109870; 
 Tue, 27 May 2025 20:15:09 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4eace355csm226402f8f.91.2025.05.27.20.15.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 20:15:09 -0700 (PDT)
Message-ID: <68367fbd.5d0a0220.21c117.073f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 28 May 2025 03:15:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748402110; x=1749006910; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Dugn268bEgVOWXgNXEVIM9s9gol5sBfiR/1zyc+B64U=;
 b=S4/rDFXbAX1LRrUynDxACRGJBHKMqflnLem/tUBSvdpHkzVpB5EPg3seJOKU5+a9/g
 R6dxloGfV9orpUSLi5SAoxqxhuMfsVurf69THVj0or4MzO+BxAVEh+ecMiG+bfLg1bvI
 lNg4Bg1pU746L+d7vhP4kpgnToPhQ/NYqYx9jz7I+r7J1sE6LjvInDFQ9GbhbIJp4CJD
 K7ZsCEihhvRGuBAbVum6oRIznZo6d+rlpx5Vc20cLNgBYs8Pc60n+AG71mCDql5PF15d
 XKGYmHiY1w/zlai7/y/JLuRiPEIH3vzWo4FR5qrmaEsPEVrr9jKF+l1pikTQ84q9oPb5
 a63Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S4/rDFXb
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-27
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

Autobuild statistics for 2025-05-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  6  |  0  | 11  |
    master   | 12  | 39  |  0  | 51  |
     next    |  1  |  6  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

              libselinux-3.8.1 | 4 
                       unknown | 4 
               bctoolbox-4.4.8 | 3 
          host-binutils-2.43.1 | 3 
  gobject-introspection-1.82.0 | 2 
          sane-airscan-0.99.33 | 2 
                  cairo-1.18.4 | 1 
                elfutils-0.192 | 1 
                    emlog-0.70 | 1 
             erofs-utils-1.8.5 | 1 
                 hddtemp-0.4.3 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
            host-libp11-0.4.12 | 1 
                  iozone-3.506 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 libspdm-3.5.0 | 1 
                  linux-6.14.8 | 1 
                 logsurfer-1.8 | 1 
              mariadb-10.11.11 | 1 
               netopeer2-2.4.1 | 1 
                openswan-3.0.0 | 1 
package/gstreamer1/gstreame... | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
               procps-ng-4.0.5 | 1 
              skalibs-2.14.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/11e768124fa09469ec239b1e2b44b0ab1c605f45 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/144d76ea809ed56bc202939cb9e3e88c15cd23d5 | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0bb44d944dc2e59085758246163427ea74550a36 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/f5c3dc66c858feb56886864cddeca25c5fe71f08 |     
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/83d0d995d5f07a23c64a2efbe8c3cbc4d46a2d11 | ORPH
  powerpc    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/3ab8a6153bd886215926ee93de6318e8fa77873f |     
   mips64    |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/79c4bc2810744e0b9baebed3d3eee07420456478 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5e66b8b91ad91688fde75bf2162f5249a17ff42c | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/379513e449746966e969c2321d591e4fb4f5d690 | ORPH
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/020524370847d1c7e56f474d372a684ccb71e884 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dd56c9e8647d0bbfe77e8bdc9c4c54f43356c133 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/87e1d2aadf50648cd971c5135d50229322abbe15 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dffe0a4cf68b2a45068199711cfb91766caa7b18 |     
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a073a7fd8eea22530113735bf902e3e2c62ada5d | ORPH
   sparc     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/84553429927d395981336ac390a6a837bf6a57b1 | ORPH
  sparc64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/7f48f8cda1d7a8c9081a9018f44d27a60ed33474 | ORPH
 aarch64_be  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/1988ad0a05d3317bda85b4374ff57068de5d191f |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a6fed05e934b0cce9fc9bc8c3c380d4fde7879da |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/77757ae3ef749fb014f2e0207b7bba495be35937 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d892289289f27391b6128303309204bfdb0fd1be |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b548faae8a9fafa30883421eb9b70d749840fec5 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1d0a4e5f2c74d0ef3616381b44d724126dd39f09 |     
  aarch64    |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/4a0af47ffe39de91ace6316233bc61732930f3ef |     
  sparc64    |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/7ac56fce4c7d20734eb1379c07412fe403d81034 | ORPH
    mips     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/192bef1b58138d39fe08cbbebac031e5ece8618b |     
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/4b48345675401571a04fd1a0fccd3b8c7e472797 | ORPH
microblazeel |        netopeer2-2.4.1         | NOK | https://autobuild.buildroot.org/results/c28740cdfc25ccffdac8c896a88600d9dabec537 |     
    arm      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/a830116d3e5aad60f89e22a7484726dffd4ebe14 | ORPH
 aarch64_be  | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/6188f195fc2c3f6dd0b3f30b711864d7f00c70a3 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/03f0a9b6c6a1f97723fe1699028bfb356cd7249d |     
  aarch64    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/9b2d912ed1f76899af5e4401abcc04719c9c19e0 |     
   arceb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/35785ce563eacb60c61d50e53996880641438660 | ORPH
 powerpc64   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/7bd3fa64f26a403e11001db866fbc64c49f68416 |     
  powerpc    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/cf1e118b0b5c61e217d8b64e4535df6f907f7dfd |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/7cbd5eeed2a2545976b95dae7972d7dbf392874a |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cdcb8f2a737436979aa860db60a9c312e9505cb3 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/fee4f3674031a8ef5d772b7923014daab484bc16 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/35f1aa220703376453b3a49ff1ff225b74290178 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/ae24e9b5deb36cc06dfd547ecc2d11453182ba24 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            host-binutils-2.42 | 1 
                jemalloc-5.3.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
     libphidget-2.1.9.20190409 | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/839222d67ff81cfe8ea9ce48656421d635424a09 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/1762ef2f013175e3712edde5a74d326bed975ec2 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a1bcfc4e8874c21d98195a4ab93a68b39e98cc87 |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/500186298b9c0627889f647ec6a58a2e55f72b8e |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/fe9452cc40ac17e45099884ca4d9e1144cb4d39b |     
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/244ef2cf2a058a3745a55060874a4ecaaf6e5134 | ORPH


Classification of failures by reason for next
---------------------------------------------

                 hddtemp-0.4.3 | 2 
                elfutils-0.192 | 1 
                    gpm-1.20.7 | 1 
        host-berkeleydb-5.3.28 | 1 
             libargtable2-2.13 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/8cafb6a88aa447914f703fb1b4f547a33f1c08c0 | ORPH
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/b3378896ab009ef17b459dd60ebf5e73bf95f5b1 |     
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/d465f6988c5bc226b9482bdf52d4628d7c40fea5 |     
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/27c9a88bb240583129a2f48145aa2aff3d8e8ab4 |     
   x86_64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/999a6ba43025fa07935888756ca64d72bda67e01 | ORPH
    m68k     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/3840e8388223e2872e8542f378bd9b96795c6c48 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
