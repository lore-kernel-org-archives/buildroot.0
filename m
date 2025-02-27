Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145E7C021BE
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 04:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D753860751;
	Thu, 27 Feb 2025 04:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10Ks21iKGpzK; Thu, 27 Feb 2025 04:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCC8B60752
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCC8B60752;
	Thu, 27 Feb 2025 04:14:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 999BD711
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 04:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D9DE60735
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 04:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFBVAYJdoFM5 for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 04:14:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C5E360747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C5E360747
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C5E360747
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 04:14:55 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-abf178f4cf1so7012366b.1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740629693; x=1741234493;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RywEf7JdGZERpl+Rw6eZOrzq5zyhLYaaKDPGGzoBJPw=;
 b=jToON3fg+CKKc47E1RAJC7w0V/hHkDd+GvLx3hyoP6MuC1oxN7UzGsHoH0bf6kivMC
 QMTXRAEJ93e2LvQ4izBJ7OcEAxHYBvUaxKTJGJcDF2PKvv/8fTLAzSOh5mlfEvSB/3q6
 yoKFLRDgybVYtIKJJZ8epcKGsU3hKPHW73eSdTHvf52zvtLEvGM8FjdCKea4i32OJMxE
 RMWxWUaJivk2rE/9p76xV5d2SIYDlhTjIX8sbh4C31QD9/R6/n2bb30F2zG9fiZXK2go
 OgoG4UZzuQhimW4OVGwLxzmAIRe1Z1Pm9wM4ZC4kHOZYql6ZlyDULfKRzoAYydEhOqFk
 0lQw==
X-Gm-Message-State: AOJu0YzcRAqJuuJII7b2t2PQ7BZQsW/XCynREaT+3tudSe7ocvLSxIGS
 rfV8eNkH/4LHV0pEnhvI8Uj1FJu9PXbiutDGyXvjNJYGaKDsA2dhE9OGMw==
X-Gm-Gg: ASbGncs0Ofrw2/DheOgh/vYnZ18NTvBj213ySMCS8A3yzyaQDNIVa27eszP58ClGSpL
 n/gQqwbGyMglJtz5PrZ1880KjZVo0mSiPhunoXBC/8pbJzr8sSX+nlV1c8pd1dp1qHzhwOGuX2o
 h4MyexmOJGfue9AV5rCLdWsiYCziZMf7fBS0bgV4zCBB9zSIM8PMPDrRW4LIcuCLjcqyfcLurRV
 7VAXaAhfi11kuNrOGxVqFTOOjEaxgE4vdaVxDmvFjrK3q9iR5kacbcqfZo12xt9rLkRVErRDLlc
 pWcwSPMNMHRKj4fx2VlBw0lcXe2Tww==
X-Google-Smtp-Source: AGHT+IGXqyKxFJ+QPyI4E6brKZC41RV8t/IJScCHYeUJ+vek+AWOR+xyZLRCQfFUEtiTsLgmAuaayQ==
X-Received: by 2002:a17:907:8688:b0:ab2:faed:f180 with SMTP id
 a640c23a62f3a-abc0da33a30mr3129783866b.33.1740629693069; 
 Wed, 26 Feb 2025 20:14:53 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0db46esm53196466b.38.2025.02.26.20.14.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:14:52 -0800 (PST)
Message-ID: <67bfe6bc.170a0220.35a1c2.13af@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 27 Feb 2025 04:14:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740629693; x=1741234493; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RywEf7JdGZERpl+Rw6eZOrzq5zyhLYaaKDPGGzoBJPw=;
 b=l8NKmXIEeBL7ovrQHeDs5NwKF67SwTPoYOg19wt+Rk6zt2+1Spf6ZsxixNSvQ6VRmS
 rmMw+JdvYJKxK9UwVLbvkZvzoM815mPC+ptR4ON6L4eRLZ6gHchG3aOtuOfuO0Wx24MC
 O4tPxMFM+MNIY+LIISFw2EJKcCtcFlCjcemSFEsnFjEM/iNLFFOEM0JQHI58ZfumP0lc
 UnoIHrfr9tm5/GstvBTWFMsGdxc4Fdj0skYQRH6I+K8xnge9GS2TEOlqkCDhBsf9KQfq
 ktCcqfeM4CybjAX5UZC9AIC8hkcj/Gyq24fOGp+zxN2mJ2Eyuu5lERm69pC9EU+JZ22M
 OaJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l8NKmXIE
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-26
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

Autobuild statistics for 2025-02-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  7  |  0  | 11  |
  2024.11.x  |  5  |  2  |  0  |  7  |
    master   | 12  | 129 |  0  | 141 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.192 | 9 
  gobject-introspection-1.82.0 | 9 
                 libcdio-2.2.0 | 7 
                     exim-4.98 | 5 
           at-spi2-core-2.50.0 | 3 
             bluez5_utils-5.79 | 3 
host-heimdal-f4faaeaba371ff... | 3 
                memtest86-7.20 | 3 
                  ntp-4.2.8p18 | 3 
                   perl-5.40.1 | 3 
             util-linux-2.40.2 | 3 
               valgrind-3.24.0 | 3 
                    azmq-1.0.3 | 2 
                    brltty-6.6 | 2 
                 c-ares-1.34.2 | 2 
                cryptopp-8.9.0 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
               graphene-1.10.8 | 2 
jailhouse-e57d1eff6d55aeed5... | 2 
                  libsepol-3.7 | 2 
                 libv4l-1.28.1 | 2 
          linux-5.10.162-cip24 | 2 
                   linux-tools | 2 
            netstat-nat-1.4.10 | 2 
                ramspeed-2.6.0 | 2 
                    snooze-0.5 | 2 
                       unknown | 2 
     bandwidthd-2.0.1-auto-r11 | 1 
             batman-adv-2024.4 | 1 
                   bird-2.15.1 | 1 
                cifs-utils-7.1 | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.5 | 1 
           crucible-2023.11.02 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                 dhcp-4.4.3-P1 | 1 
                   dhrystone-2 | 1 
               ebtables-2.0.11 | 1 
                  evilwm-1.4.3 | 1 
                  ffmpeg-6.1.2 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                   fwupd-2.0.4 | 1 
            gettext-gnu-0.22.4 | 1 
        gmrender-resurrect-0.1 | 1 
               harfbuzz-10.3.0 | 1 
                haveged-1.9.19 | 1 
                 host-isl-0.26 | 1 
    host-mender-artifact-4.0.0 | 1 
    host-python-greenlet-3.1.1 | 1 
 host-softether-4.30-9700-beta | 1 
httping-ffb9201042813c58d02... | 1 
                  jack2-1.9.22 | 1 
           janus-gateway-1.1.2 | 1 
                jemalloc-5.3.0 | 1 
                libdrm-2.4.124 | 1 
                   libidn-1.42 | 1 
                  libnss-3.108 | 1 
               linux-pam-1.6.1 | 1 
               mariadb-10.11.6 | 1 
                    mpir-3.0.0 | 1 
              netopeer2-2.1.49 | 1 
               openblas-0.3.29 | 1 
                 openssh-9.9p2 | 1 
                   pcre2-10.44 | 1 
          perl-net-ssleay-1.94 | 1 
               pulseaudio-17.0 | 1 
                 rtptools-1.22 | 1 
                     shim-15.8 | 1 
              skalibs-2.14.2.0 | 1 
           v4l2loopback-0.13.2 | 1 
           xapp_xkbutils-1.0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/3fbe63f843d51ef75b63f0eb432b4a4e104b7287 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/49e4da9be1aba53ded3f2bbb01590f7e82fe32d8 |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/059fcc21e0c79c131c3e189009619f4d1b4d4e79 |     
    arc      |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/83c4eedd923a5dc72c0524618338258a5d25c8c1 |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/61df6adac3432f4261af34f6471e59e451f59ae0 |     
   arceb     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/abb6c196e60143e14812ea1c0fc288eab233d297 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/f79215850d1ed0878907d119cc82104d6b7b2313 |     
   sh4eb     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c8fe9be35ee3e5c407f589a632117662b2b47fd4 |     
 aarch64_be  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/edb9b8e8a44f457b44ce573bca388a252488d42c |     
 microblaze  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/0f13ab582afb9e90a812b19d8ce5b0018c107bd4 |     
   s390x     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/2a849dbf68675ce8531e06cad32b4abd56122fea |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/035674a7135deb2ecfc77975e9afa097dfe855c7 |     
 aarch64_be  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/818e17892c61eb2475bbb7eb76cd580220cf9d30 |     
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/c4a6b4cc17101f64455f4500ec9e5cf33c931c85 | ORPH
microblazeel |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/190793a488538508f6596e4a4d3d7106e7d5bd47 | ORPH
   armeb     |         cifs-utils-7.1         | NOK | https://autobuild.buildroot.org/results/b4709e149124544681911745b14426383f2b1a5a |     
    i686     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/c8e34aef9b72471877fce8157b47c006e1e56baf |     
   s390x     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/69bed8ef170913738fd6cff1c7b0c5aeafdaa996 | ORPH
  aarch64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/da883448d1d6352d5695672b42184593bfc8b5a5 |     
microblazeel |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/7b1b90c28cbfa9dcb01ca0cc9617f80dd6b209d1 |     
microblazeel |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/08e41eed11ee9179f2833ae7022525dc7b6129be |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/46115d90b4314d2546492e6573d905ab4fbb6ccd | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f63be9dc84c910047166ca0c9b6877f2e3e22c77 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/bae06be158db81ac22d53cd603e9fa3b2914a394 | ORPH
  mips64el   |          dhrystone-2           | NOK | https://autobuild.buildroot.org/results/d2fe5b59b5f0637241f527360b8a66c397e09aab | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/b3814b3b1851c3b094678f98b5fbb0aa4ab9ca80 |     
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/67479e3ea7e9297d9f28195037ef29bdfbbcc1f0 | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3659fcf9884b7b7bbeddb2fd3ed52b81ba705b98 | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3bb5c72ec56ada6bc6fb74c2327f533f5eb1968f | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3a227486a450c95e7e8842ede5eeebf00cc45bea | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/216f7164f74c8d8797c829fce51324d4c812dceb | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/12e1d0fbcdf614dbbd0ce11b3ec073604fe6cd5b | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/717e284ec3a8e320d9dd9dc0a112b0a27b65c041 | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ad10de851dce8cf7bb44de69571650808b616801 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5f270e8fee1af5d17717f22c95044df302b5a5c1 | ORPH
microblazeel |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/6980287a4912e989159b1f07048f8b1c0754c803 |     
   s390x     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/96ba1c3707172c44babb1c8208a803a1d8ba027f |     
  sparc64    |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/b3207e3d9fc13938916a3c61b46f6def144b129d |     
microblazeel |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/832120493ed0178c344e83ef0dc0a9860c419f7c |     
   arceb     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/9264799bc1a99bc4a1ecbb79b8597a88acd10053 |     
 aarch64_be  |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/6df627b2596323305340abe787043107ad21323c |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b3c5629273276a4e4d2c3aea7b9b2cedd6be5c92 |     
  riscv64    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/0546cae10a7c01c819cac9ddbe68caf943968071 |     
   mips64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/914c07f8b40547779f10d56fbc0a8612e344b8b1 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/706d85964c8d1510663da7456720cededbb32af2 | ORPH
  riscv64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/22eba80a0e5cd31e6fef8b4f66f9982bd66626f3 |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/5989dd9b854705f9a838470fde78b9eab6dad848 |     
   armeb     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/45cb0b3fc2f1cb6d17163ff44b989b64a0fd86d3 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3dbebba6290d88f947b110e0daec5b999119ad41 | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9c1cb7dc3b2b389df11ab34d1e103728aaf39da8 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/60172b8852be49069928f755580169ca5862f8d4 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/cdf7d4695431fa77da7bdcab634d52c3390eefc4 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/45f33efcd215db85b73ff7fe31e5f1a81e8db1d7 | ORPH
   armeb     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b924a0a30b6c3c8ad3bd6fa7fa925020add97f6f | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2a2de364c78c980b0dace2f8b0fcd44ab119ce72 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7eabab8f13ce190fb0c221965196c81311b369a7 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f4ebcf8b58e5ae3cdb5b6c36f7b838301a5aeb47 | ORPH
  mips64el   |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f57996d0a509ca4a0b22b27312e92c2bee82e176 |     
   armeb     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/58995953619066df02c29a898e96cb1e7415a3e0 |     
    or1k     |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/aabdc8a0bb25deb5ca0a8ed5ce91514c41fc234b |     
  mips64el   |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/0ca7a75cfabe8aadb9145681926d41a5f473e693 |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/78c930d1975451bdbd4e6b38fe4b2352af849984 | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a1f415ce3b52d9ed5a7f987c6780359b623f9e13 | ORPH
    sh4a     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/1ca6c24aacd00daac19830fdf6b2fc81eb710394 | ORPH
    mips     |         host-isl-0.26          | NOK | https://autobuild.buildroot.org/results/8523e0aad7d477d50d427d3510d7bfc21275244c | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/9492534b9eaf07d1f0029ffaf017fe65cd40444b |     
   s390x     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/48a01e6ac09bb7f86a5c6cf841c17569e975f961 |     
  sparc64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/764db691f2bc43272b26a0834cb43e11f345c077 | ORPH
 aarch64_be  | httping-ffb9201042813c58d02... | NOK | https://autobuild.buildroot.org/results/70282d1f4ae3ff798e0ea2dbec518f42aa86cdf9 |     
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/d9859822d27a459a4e19909820108cf9f90f0ee3 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/95f7517b9244a47db1c9adaf8d943d39c9e2dce7 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/381f312ef484a87973877de0c14084701311067b |     
  mips64el   |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/9c6209d3e125b59a74a361b5c8951ec481f87bb3 |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/9f48484c153c3ab10e1d51e762cc904318b460f0 |     
    sh4      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/6df08d24000ebb8238245271763587929ab4de16 |     
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/6f99a4fec9630e13992343e4ba5a0f852cc387a1 |     
   s390x     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/4f14b4095e6704cf56bd1d01e1b5d172d02435d6 |     
 microblaze  |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/4ae08c3cba6f45bea2f1bef3c7a4dfc81350661c |     
   mips64    |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/72ebb20782d8f3c6c1a287061028313a53610a66 |     
    arm      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/88cf0b72a8b4c687bfe3b64b6ccbbf06d42d85cb |     
  mips64el   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/5e65d32e1a325429c5d27b9dff18394906b7fa2b |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/8125b25a59401f67fc3ab184d39a3b1db80ff879 |     
   armeb     |          libidn-1.42           | NOK | https://autobuild.buildroot.org/results/a48fa247486674c0825f21a17f4abeafe227387f |     
  mips64el   |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/44b79f436ae09a3ee9879292e61c58613e1117f0 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/5af0738830a57c3b7e34b117f66e7ee3da03939b |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/1e7f589031525e2b7065e37a216f2e94cb381e25 |     
    m68k     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/d0911cd7d9415886e0362794bedbc9f8133582fe |     
  mips64el   |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/1e31a5e5af262f495c535fdca091063944ead17c |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3de93152ee4db7e72a27b77ffaa786d03730f097 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/84462490e58a803ca99b5c7c0b010203905dc8af | ORPH
  powerpc    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/fc65ff5513d4337d6744c32c8dd071a4001930d4 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/26b19e970c20686f80090aea5bb8b24c0aaf5e4c | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7512f63b67d8f5a43441cdf55ebc18bd109bee6e | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/0794294fb41aec4a5e96b9094e560ae9079b33b8 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/848cfa8b4047f31ce54032c7feb124c7d28b743e |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/3b02c7755a9d88c44a870bbf6e31d6100bf56e3e |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/12f478ae052b48aade1be183ae5ad972eebea670 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/30968861c60add60931166d076c96a5f9e675706 |     
    m68k     |        netopeer2-2.1.49        | NOK | https://autobuild.buildroot.org/results/b28e3da0a1863dbe4ddf1ddbc556705758884c83 |     
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d445626eae4c88863c4719a81049878198139f0d | ORPH
 powerpc64   |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/b5b761a98bbf43556e667fee932dc33406674e96 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/27bf228e62e10108d52f9cb6f3518c21f9a3bed1 |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/478de0d913f80e94e356d4103f804f471a6bc40b |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e3ac0b01340518aee9c57fbc580177efcbb5548f |     
  mips64el   |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/712744074b62754ba5328d237949b1a61d48c4d7 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/6e870856ac7020393a4e226779bdf0dce1e3c590 | ORPH
   mipsel    |          pcre2-10.44           | NOK | https://autobuild.buildroot.org/results/cb2d7e21aa9a3615bffa4a068c5d925959f6d84b | ORPH
    arc      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/c67b7fe2e8b40dffd895f71bbd59423bd0b400a8 |     
    arc      |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/2aaf6d1bb69d0236453108a25809a66b8a4f482c |     
   sparc     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/e8e52423a597513c8df5c3d489730a45dc667351 |     
   xtensa    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/41c1acd31ab1fe77a8b125339d8875a2dbc2c317 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/78e122b948d190459a2d52b3f6d9801e6a212d1e | ORPH
  powerpc    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/116e3525e5ac16b2190c4a002d2af112456212aa | ORPH
   xtensa    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/bdb2fe43bd44f18a570d7288221a3f022ed6f52d | ORPH
microblazeel |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/086e29d257dd5de2b284b93f1b0c318bf6aa6b24 | ORPH
   x86_64    |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/34cff3b1a7890eb69c08fdce126cb413dcebbdb6 |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/fecb612046259a48bfbdc8cf871b9b55ebdc170c |     
  riscv64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/0510d8c11e7bf1a9af257ea9af73d74a95b9202e |     
    arc      |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/00335ce3d54e755b40c7d2f00abeeb3a41fab8c7 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/8e33ba2630618bf1ae4133773b5b528c9280b46e |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a8c6e5c49a60cf9c755d5effcbbc1ab510991e4b |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/1665d24dcf590acf52e09f8a29338a57a33a399d | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/3a69ef53d80169be8a10c0ebeca3595c88034b70 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/d5a99dc10957d01154c4f5f6749d7f184b87a14e | ORPH
   sparc     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/65ef78e603c137cd2b0a8a323fe1acc440584124 |     
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/ad337d29c0da824f89eaf930938cccd321acd6cd | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/ca359ae38a90f846e7e850b4b1a19732d21cd574 | ORPH
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/0bfa0edfb43e26261f26c3973786d32c49582109 | ORPH
 powerpc64   |      xapp_xkbutils-1.0.5       | NOK | https://autobuild.buildroot.org/results/c82948d57b9c8fa0dfedc17b4ee88ab06ad4b90e | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

fs/axfs/axfs.mk:32: /home/b... | 1 
            gdk-pixbuf-2.42.10 | 1 
               host-go-1.22.12 | 1 
     host-moby-buildkit-0.11.6 | 1 
                nushell-0.85.0 | 1 
                  octave-8.4.0 | 1 
                rocksdb-6.20.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/21d0efe25caa00029eeed65b92b60404f4a399fc |     
   mipsel    |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/79ff3258c5fc1f0f0ab7748cb7f4cba6b203737a | ORPH
   mips64    |        host-go-1.22.12         | NOK | https://autobuild.buildroot.org/results/ff346b9ffb8630e1043935766ad70195d57a3305 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | https://autobuild.buildroot.org/results/d68bd06fb462d8cbdf083da8a1df0bcf1d9ea918 |     
  sparc64    |         nushell-0.85.0         | NOK | https://autobuild.buildroot.org/results/59828e2a5e542d4566536900970a96cf0aaf4440 | ORPH
    i686     |          octave-8.4.0          | NOK | https://autobuild.buildroot.org/results/f99285ca270dc91285acb2c8de11d40ab675840e |     
    i686     |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/35d991a33942bf9850930998425d7ed66f8ea2b5 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  bitcoin-28.0 | 1 
          linux-5.10.162-cip24 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/f29acba18a8aee5563762967c5670d1a72229645 |     
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ee79a17a983e60032de50283884852403716b9c4 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
