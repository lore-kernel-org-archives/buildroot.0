Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D7ECCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 04:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2308D42483;
	Sun,  2 Nov 2025 04:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4En8CPaIAjK; Sun,  2 Nov 2025 04:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C59E242475
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59E242475;
	Sun,  2 Nov 2025 04:29:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40B2A222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 04:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 328CD843DA
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 04:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00nnQCVr__Rk for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 04:29:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DB3F8422C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DB3F8422C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DB3F8422C
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 04:29:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-475db4ad7e4so12130015e9.3
 for <buildroot@buildroot.org>; Sat, 01 Nov 2025 21:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762057790; x=1762662590;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTl0l+/CNXCmAf2FfkPXAbwcOcvysHM+cRD8EYHveXg=;
 b=K8EAAZrBO8lA81Zssik8E81tAfc4lWuLqf61zOmq276qiV5v3anN3LkDtBEpakFF8Z
 FAg+lJNiodeqL+m7qbfg+wMWeoWomJpNrSgUyHvMZtAJBTGjnKdZE5s0H0ou8+T3cXfi
 KpdIdyKKYZMFbY8SKJspCONbxJ+C4xFbIFb3A5ajmfyORlGHNOFEDXN10Eracp2Q3mTL
 oKLXH+DR9LXErqwvQQhzA6K2jZzK9Hhzg/DV3teTN3km1m8u/XWsTI8InTPnKex7R8vU
 8WNaivvx9aNU/KydRWawu19nTLiFwvE6Y0Nz22Y82fXTfG5jkNjIvhq3JV5mBq4RZjk1
 iegQ==
X-Gm-Message-State: AOJu0Yyk7jDpVOanx5VRAs/tj46RHAR5VB/K5XmXhdpAPnv8rOe7Zkrp
 Gcj8sm35TGLoeb/kOt6amFwa6j+0BKdBPC45kTuLlFSgq6tIbigvjHnOI1TyYw==
X-Gm-Gg: ASbGncvuX0j2AIejNeADEIstLSLdQDA1gAfqRfUbyQ3iwuKF8jZ0Ig2bjOoD3O5nTGx
 O4K0cYhcoBCjD1WfCfhwaPDTcfC6guOXOegyV2m+v/gaisjS7fiyQEBceQYaLBXloosaL56pKFy
 V36wsOeOh58kMs2hZPbMcyD5yRnzUTzOste71c7hBcgSz5KdvTKiZns9r94Tp7CqjB3NsF3Y8GF
 vtdleGEefGf0PxOTftfImGAh3Vb1YMhgUMqZm2fUYNaJitZHJbfIRkqlWYFolPOxqkRwAa9R7FF
 EKhz+Uc2esU1fE98UPce93a1RXEyfbmxi1CxcEkGe8/D0puBNcOTYScwkmL6I65Kk81SnnIjDH/
 Yp99CfOMsubDgP4OBB/eAuukOUDJC9kVGnlzXGf7WNKnbmNZt4XW55XTmkn2SJ4qPBlA595R/mC
 zYAP7V4H9DjguV96FNUw==
X-Google-Smtp-Source: AGHT+IFXmj9Glpq6nBLjVHWQiDVH2Ov4m4cw5LfkcTYazlNwgS6LDMt+VfEY0+ZtMtlMN3gCyVyO9Q==
X-Received: by 2002:a05:600c:190e:b0:46e:1cc6:25f7 with SMTP id
 5b1f17b1804b1-47730801f19mr70251645e9.9.1762057789990; 
 Sat, 01 Nov 2025 21:29:49 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13f32edsm12078955f8f.41.2025.11.01.21.29.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 21:29:49 -0700 (PDT)
Message-ID: <6906de3d.df0a0220.1d1016.debc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 02 Nov 2025 04:29:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762057790; x=1762662590; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nTl0l+/CNXCmAf2FfkPXAbwcOcvysHM+cRD8EYHveXg=;
 b=RCRJk35aVXfpPFzS+CoM1oaDfl8iJLlb/3RmOJmCdACX6ZD7169uuXHIvUu81rehXm
 T/qP7OfmN12MKMFPS+A2GeQSjbIJccHSCk/na67quJe7ElnP9/uFRsiWfK7kBtULk2pg
 lY1myD73Mu+PJo96TcVI5WWHB+VPays1gvVe3OhG9HSpPmdkw+BtjFOywyGO0MTHp2aT
 Vo4q4slA09XY/WIFiYj4SPB1nqyn3fZgVp1i/tLf9dhEMviRvK85A76fLRO/tXsU1Jwj
 BdHUT2RIhfrC0l3iZ1IprMPGZfnCtMUje/kcqpPO0A9jnf4nGufWbo/x9qUPYRCXhl6u
 zasA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RCRJk35a
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-01
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

Autobuild statistics for 2025-11-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  4  |  0  |  8  |
  2025.05.x  |  4  |  4  |  0  |  8  |
  2025.08.x  |  1  |  7  |  0  |  8  |
    master   | 36  | 72  |  0  | 108 |

Classification of failures by reason for master
-----------------------------------------------

           host-openocd-0.12.0 | 6 
                  linux-6.17.6 | 3 
                     crun-1.22 | 2 
                 dc3dd-7.2.641 | 2 
                enscript-1.6.6 | 2 
                      fio-3.41 | 2 
              host-swipl-9.2.8 | 2 
libdill-32d0e8b733416208e04... | 2 
                openocd-0.12.0 | 2 
                parprouted-0.7 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.9 | 2 
                       unknown | 2 
               bctoolbox-4.4.8 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
                   dante-1.4.4 | 1 
                 dhcp-4.4.3-P1 | 1 
                    dust-1.2.3 | 1 
            erofs-utils-1.8.10 | 1 
              fftw-quad-3.3.10 | 1 
firmware-utils-86739f2b3ae9... | 1 
  gobject-introspection-1.84.0 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
            igd2-for-linux-2.2 | 1 
                 inadyn-2.12.0 | 1 
                    kmon-1.7.1 | 1 
                  libbpf-1.6.2 | 1 
                libdnet-1.18.0 | 1 
                   libiio-0.26 | 1 
     libphidget-2.1.9.20190409 | 1 
                libselinux-3.9 | 1 
             libstrophe-0.13.1 | 1 
libuci-f3fc0b76040685829191... | 1 
     linux-5.10.162-cip24-rt10 | 1 
            live555-2021.05.03 | 1 
                     lxc-5.0.3 | 1 
              mariadb-10.11.11 | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
              netavark-v1.16.1 | 1 
                netdata-1.37.1 | 1 
                 netsnmp-5.9.4 | 1 
                openswan-3.0.0 | 1 
package/python-flask-cors/p... | 1 
          perl-net-ssleay-1.94 | 1 
                ramspeed-2.6.0 | 1 
                   s6-2.13.1.0 | 1 
           sane-backends-1.1.1 | 1 
               syslog-ng-4.8.3 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/87c6a1da210e388f578061db72de96151be0d2f7 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/e0118f179e9dc9a643ba6e43073964f533c60f30 | ORPH
    arc      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/0b7eda5a62929bcdabd1d16ecdd820295d0c1867 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/09485f7a7f02f5d959774fff90a146adcac18e27 |     
   sparc     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/f4fb970f8d4f2f7966fcbd542768a607ea7ababf |     
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b16c492b3e0872db1951b25dd0c3fe69c187a048 | ORPH
  powerpc    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f4f92f5070c04ccac0084a8539dced8da1816516 | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/b03a0e0a796aa0d7d8670061d28221b371e16094 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/f2007c675044f9765c39d94c7a2588f54e8adb8b | ORPH
    i686     |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/39ad1cdf73d38051aa44470e6cb9f84bfbd8b829 | ORPH
  powerpc    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/db3863575ccd25bd3e06612124867935da1ba82f | ORPH
loongarch64  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/ded404b533b874d7a3f4d2eed290261c01993136 | ORPH
   xtensa    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/5827995db2a805e0c8a04fde8498eff6f28aa6d8 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/db4bf873fba0f4f63744b5898076c8521883a3e3 | ORPH
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/2db77b87540254648eaeebe10a76f592f6b5eaec |     
   s390x     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/7179a3d9f9bd9910cbbc8cfcb1812355efd24660 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/726dce289aaecc40303bc8cc459be9f32580ab17 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ab0b9295ace2fded7bb371b1385c1a3475a158ee | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9e6b58664c58a39589aa235757f92360563c74e2 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/462493b9b942ae342b2471abbfa284a67345824d | ORPH
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/510227e2414d068148c8b8b7afbd55f9a1ac5d19 |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/5625ca2da414decdeff49ed85f71a7ea98cccd8f |     
microblazeel |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/cf4320cfe2a655639a107a4dbd7663dc39d61614 | ORPH
   mips64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/59f75936d7908fa9b6ac550e749847118acd9014 | ORPH
    or1k     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/3a21ecbf08b70b5c9926d9a3c274b7893c583e98 | ORPH
   mipsel    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/d7f1d79ca9c6b3ee8e951e8822f33d4368ac8540 | ORPH
    arm      |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/00b61d815425506ae5877c2431cd53cf6846280e | ORPH
  sparc64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/72276dc32c3fd160787b8e4217bab425ecb533ed | ORPH
  mips64el   |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/43aba507d64f82de8f5b5cc4ef676af6642899e4 |     
  sparc64    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/c61a1fdafd8d90876da8dec1d2eafafec7db1c44 |     
microblazeel |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ba485785bf4d28d651eabb33f5ab0f551f8d38fe |     
    sh4      |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/5300bfb70907d049d1e55a390d9f1d3bc71c62b2 |     
   x86_64    |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/65c901923f545d28f6128b275a8a4686e17ef82b |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/bbebea8f63885eb47861a96c1a12fb92a8e16ed0 |     
   armeb     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/d827c68e56b86302cd230e2356faa8033aa1c759 |     
   s390x     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/6056f2487ebf0f0b4132bf36d0771e1696181b22 |     
    or1k     |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/9340124c04c001046437da2ba58c08dc9b81c180 | ORPH
    m68k     |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/a6a183aace31e745b47b86f22b9070fa73263474 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/cc1295097d62f16ccf2b76ffea0551ab8024374c |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1a0e6491996d32f3f7996afeecf76abf2c468e0e |     
  sparc64    |       libstrophe-0.13.1        | NOK | https://autobuild.buildroot.org/results/15a5a53a175ddcd760088404faea9521b7ea804d |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/bf77821163f9eefc9ff95443ba2e05b14daabe45 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/810556491d23552d919f4ed2366dcceabfd86128 | ORPH
   armeb     |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/3409fa77858a5e86acacfe302107927a1d4a8eb0 | ORPH
 powerpc64   |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/41db61622a46081a2b3c050f397e5ef73d34e1eb | ORPH
    m68k     |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/560b0457efbe0bae0b47b217abeaf6b2f4843ddc | ORPH
   mipsel    |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/9f88c85ff6d7370819e1fd460a4a4e9218e415f2 | ORPH
loongarch64  |           lxc-5.0.3            | NOK | https://autobuild.buildroot.org/results/ecd5a4073d4bd569b6ff974c9bbf2e8ea71a3686 |     
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/807344904c6a5b073f04fc395aeee45bd6318e95 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/142f01853df48bdccd2e95ead6178c0b31b71172 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6970c2ea69ec8ec20d032745839fc90f0badfb24 |     
  aarch64    |        netavark-v1.16.1        | NOK | https://autobuild.buildroot.org/results/2a6f1edfd03db9681c7c57b8af1f0864a6cc7058 | ORPH
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/52257c051c8c91bc0518b7ed99f8a497571fd46a |     
powerpc64le  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/7fbef143b4b8a1d6b68494c6209f7c7761df23a6 | ORPH
    arm      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b3e53e4c442e5ba6d9215689a630fec608dbf045 | ORPH
   arceb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/25a0ea17e26dbc0efdaa75a50c350c53e1e1bf85 | ORPH
   arceb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/6ade6d25cd257775fe039c36c4f21ef3758e6236 | ORPH
microblazeel | package/python-flask-cors/p... | NOK | https://autobuild.buildroot.org/results/1eb9d68616793c9241bcb55bc2ea1929608c68bd |     
    or1k     |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/f8fd436ab467681f0859f9225b9a1220560ba966 | ORPH
  powerpc    |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/cb909e6c65e876010cd56dda39c53eb1639a8b4f | ORPH
   x86_64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b0e070ce7b231fa51a650a54ae9bb6fbc8490115 |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/10c552dc975c29f95d83cd4a54bf591d5523a084 |     
   xtensa    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/0fa80f7744ba816bdddf1ef72f28f0354f0cd3b7 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/610fbd2467bd572134a8833464db908577f3d943 |     
    sh4      |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/e564421d6c3e3ff0b3fd756a5bf55e550b2dfca8 |     
loongarch64  |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/babcbf749b3778d3696ff3394837d7fa67ca4697 | ORPH
   sparc     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/431c3b958b804561ac5f3ebb9eec580cb50d1ac8 |     
    sh4a     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/4e41b0df6b0d7a5a2291f829cefbeee228370947 |     
   s390x     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/093efb55d1653e7f4f21dbaa01a8a1fdac7d7df2 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/063e11e58aa7b3e7883fa4825b5e1b60c15fb6e9 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/5065ca9a6ba495941f193773614191da9c0ac44f |     
   sparc     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/8fb5cf7c0823b2384670a1c53882ad4aebc7be21 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 cdrkit-1.1.11 | 1 
                   cvs-1.12.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 logsurfer-1.8 | 1 
                    mpir-3.0.0 | 1 
                openvpn-2.6.14 | 1 
               tipidee-0.0.5.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/ef8d08d84ab2f475b17e41a1ee673b45b3add917 |     
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b2a213159863c5dba914738db65d4c3891facf38 | ORPH
   s390x     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/aeb2aa748c06e93ac8f5162754dff7da1dbde249 | ORPH
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/d618b764994ab8b516b1375ae3a577cf68367c1c |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/be294a8002a29d6fb85a1f1061dc6478889cece6 |     
   sh4eb     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/73b54ad234ddc58e6b58c5c369122623472e1efe |     
  mips64el   |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/10ad6d73d63bb5f8793ddc164776521c71f075ae |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 openssh-9.9p2 | 1 
                pipewire-1.2.8 | 1 
                   swipl-9.2.8 | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/7ee1bf53debd6ed68cb2522abe8dd6812f70038c | ORPH
    mips     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/a8f6a323a088c2412dba964fd08dfb5de46c9121 |     
    i586     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/ce113db7be974cebeb75101506f1241313332f68 |     
   s390x     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/cbef21b0475eb83d40dfda8567bb08bf07ca17fd |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 1 
            live555-2021.05.03 | 1 
             python-webpy-0.62 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d4ef68825ebbc5cbd462462b60be4d322639f320 | ORPH
    mips     |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/7af41a2774ba3ed7049e06fe290d3233e772ab19 | ORPH
    i686     |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/2d69c77003b9ef85ec1e5a1cb613e69dd9717549 |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/fa113c5b7f578145ee040dec9c4e87d9ccbefff2 |     


Gitlab CI results for 2025-11-01
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11916952973 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/11916956782 |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/11932845659 |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11932846008 |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/11932846257 |      
               stm32f746_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11932846495 |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/11932846577 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/11932849365 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
