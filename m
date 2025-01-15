Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D14C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 04:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEC0741549;
	Wed, 15 Jan 2025 04:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxRQSCk9srV9; Wed, 15 Jan 2025 04:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B18A341550
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B18A341550;
	Wed, 15 Jan 2025 04:14:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E56D3B8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 04:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD0FA61076
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 04:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzJcqpr1ZLIZ for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 04:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D94D6072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D94D6072A
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D94D6072A
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 04:14:36 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so12198250a12.2
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736914474; x=1737519274;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YTARE8dnmR3xTJAvLSxdImUgDQ6uqCZrwPA14O5lkwY=;
 b=cSD1vnGsib2gReHVsYd3ltdvZ9j33oeL0bXlJfb4PCXWJQvNZ3xbpxXflKJUdzCEJX
 nn1qZmqZQsuGdFlBSTaE5swCdz5ncdzwzhIKRERwX4ZoRsYWr7bRPzE+gMFPkqe6XkrR
 wbVGAF8l9oB2aLsbMk5jKHMa6R8X47vtXIS0FsOl+rO7KtPIsfVnkyiYvC8+Bgeuc5v2
 MJinKkI4CtZ5PYI0PoRdphLpEWQFY6VobzERDE9R3oVrfyqbw5HnPAoBuEwH6tjCuQfV
 YEDrnLJoiHtXJ1NM/2LJ+83nwCv3o3S7Y6QKh/nV4v17Z5qKhtOPy/HNiAgYwA9V2TDJ
 K7pg==
X-Gm-Message-State: AOJu0Yy99vqmG6gQ6zR5O5bw4sFfv+wSJijgXj/OT5NkSsH3w9zJDQgF
 Ta79JaG1IlSf4LCd2Ne2Gruroi6QtxfZw+73UIkBAfAswK1g1zowBzDVrw==
X-Gm-Gg: ASbGncvyjQf0w70jnnHuQtBQqtMZE8oiUcYf8UtdzRJMGs6EhTIxU/e5/FjtJpWIgwr
 fYquZYWfUL1hs4anZZEeT+c2LTLeiSNH/p6PKtvBBqUYxihkDBIKf+n8KL1/XuDsbQiK83p3C0i
 5Piyjp53WJ3605cFL0vz6r4MpvTKcudT77OTzTOoQl02GG7OtJ7csEsNUTm4nHdC5Us6Kfqc261
 8ikIacwkVOWxnlv3ItIAbJ29+rW46tN2YLRHlY6HVz7DmYFKqGG3IH60tHe
X-Google-Smtp-Source: AGHT+IHybN0cqwiMsteKFevJ+NOGUz/69SMMCvgctGPSb4k6BdGfULlOtOAkw9uWu1Tu2nDCqTLc0A==
X-Received: by 2002:a17:906:7950:b0:aaf:4008:5e2d with SMTP id
 a640c23a62f3a-ab2aa3f4439mr2647532966b.0.1736914473943; 
 Tue, 14 Jan 2025 20:14:33 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9563ae8sm706846166b.129.2025.01.14.20.14.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 20:14:33 -0800 (PST)
Message-ID: <67873629.170a0220.369536.cc8b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 15 Jan 2025 04:14:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736914474; x=1737519274; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YTARE8dnmR3xTJAvLSxdImUgDQ6uqCZrwPA14O5lkwY=;
 b=P7lvsWWtBdsGhI8/pGbn7H5c6hCd4e49Q8d6013X11Adn7zg2yuuH6mnOK8kxe3+jy
 9uvq303JLxDoeWk+3P4pnlkssvh0rP+zzk6dYXE4go4+8V3TgVQuq9o37q3ET7ciSo/e
 VUYuhq6BEzXtO8uYqksj8kyZMPzVTEZiRQbZavTq9ChQnaq79wBQ4BXo+Gq3z1a99iRJ
 xa027RoIMQ1kYj5JTNc7UGi4K1taw/OeEzWW0HYqrjC4I56YjREmYABhxJZhDJS/jvqe
 OAHYgLqpakCeXLmGhF6lXhUaOcYo9CbmV1jGuSW5C39KT35BrjQTSx3TXhKXuYCO1k6V
 DxFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P7lvsWWt
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-14
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

Autobuild statistics for 2025-01-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.11.x  |  4  |  3  |  0  |  7  |
    master   | 24  | 134 |  1  | 159 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.40.2 | 9 
host-heimdal-f4faaeaba371ff... | 5 
               iproute2-6.12.0 | 5 
    host-python-greenlet-3.1.1 | 4 
              libopenssl-3.4.0 | 4 
                    mpir-3.0.0 | 4 
             bluez5_utils-5.79 | 3 
            gstreamer1-1.22.12 | 3 
   host-mender-artifact-3.11.2 | 3 
                   perl-5.40.0 | 3 
    python-betterproto-2.0.0b7 | 3 
                ramspeed-2.6.0 | 3 
                  assimp-5.3.1 | 2 
                  curlpp-0.8.1 | 2 
                   foot-1.16.2 | 2 
glibc-2.40-18-g564178076272... | 2 
  gobject-introspection-1.76.1 | 2 
            host-binutils-2.42 | 2 
host-binutils-bare-metal-2.... | 2 
                  jack2-1.9.22 | 2 
                latencytop-0.5 | 2 
                  libsvg-0.1.4 | 2 
                  liburing-2.6 | 2 
                  linux-6.12.9 | 2 
            netstat-nat-1.4.10 | 2 
          obsidian-cursors-1.0 | 2 
                       unknown | 2 
           v4l2loopback-0.13.2 | 2 
                     ace-7.1.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.4 | 1 
                  bcusdk-0.0.5 | 1 
  binutils-arc-2023.09-release | 1 
                  bitcoin-28.0 | 1 
                   botan-3.5.0 | 1 
             cni-plugins-1.3.0 | 1 
             containerd-1.7.23 | 1 
                cryptopp-8.9.0 | 1 
                   cvs-1.12.13 | 1 
                  dpdk-24.11.1 | 1 
                     ed-1.20.2 | 1 
                 erlang-26.0.2 | 1 
                     exim-4.98 | 1 
                  ffmpeg-6.1.2 | 1 
                 fwts-24.09.00 | 1 
            gdk-pixbuf-2.42.12 | 1 
                   grpc-1.51.1 | 1 
httping-0e26c53d5fe504eb720... | 1 
                      icu-73-2 | 1 
               ipmitool-1_8_19 | 1 
                  libdex-0.8.1 | 1 
                libdrm-2.4.124 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                   ltris-1.3.2 | 1 
          lua-cqueues-20200726 | 1 
               mariadb-10.11.6 | 1 
       matchbox-keyboard-0.1.1 | 1 
                memtest86-6.20 | 1 
                 mesa3d-24.0.9 | 1 
                  nginx-1.26.2 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
                     open62541 | 1 
               openblas-0.3.28 | 1 
             parsec-tool-0.7.0 | 1 
                   pcre2-10.43 | 1 
                 pixman-0.44.2 | 1 
               postgresql-17.2 | 1 
               procps-ng-4.0.5 | 1 
         python-remi-2022.7.27 | 1 
        python-selenium-4.27.1 | 1 
                  ramsmp-3.5.0 | 1 
                 samba4-4.20.6 | 1 
           uboot-tools-2021.07 | 1 
               valgrind-3.23.0 | 1 
                wlroots-0.18.1 | 1 
               xapp_xdm-1.1.14 | 1 
               xwayland-23.2.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/d5c222451454fabab8b1043aa5c4f24818f52d57 | ORPH
    m68k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/b4d501158ab4c3ab98cc38849f08404db89ef032 | ORPH
    i686     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/0fd38fe30da9fdd1419efb60fde7a65e93a53ef6 | ORPH
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f7a6223ab669beb438a4c82440d4be8a912c7ebf |     
   s390x     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/4ef96e7d50570f37d7e3a0c5d92a4c9480a325a9 |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/3d14beb960e282c9c270f87b63fe63107e98972c |     
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/04e9768bbe98e4cf16cf6b72d7bccbd45e4a7f50 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/bf5a89a00cd5dd29e1d4f50915827ab3f4c3a971 |     
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/aedfd7a087e13ca506f8f852e63e7d6a93781a30 |     
    mips     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/e721d82248bc538bb9b8622f17cfa729d2f380a0 |     
   x86_64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/578aa8957cb51163ab70af0e10ef92572919ed0b |     
  mips64el   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/f15224e0d1734f16a397836b99df64e7cff841ca |     
   mips64    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/bb5946b09122e50ae10106cd0030bf379fa6719c | ORPH
   s390x     |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/0433558c6388ec0aa8f8efdf102271240dcd411e |     
   s390x     |       containerd-1.7.23        | NOK | https://autobuild.buildroot.org/results/32e82d158c6ed19f657d5ec2df192dfbcb33f296 |     
    or1k     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/75433e058f1657e6430ff6234aa930a721f4f8df |     
powerpc64le  |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/b7d00bffc33c182b5f76558168b6ea5709a99b0f |     
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/27ac9110552a41ae589af1b86c76169ed9598907 |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f524875e6374b3128a62f3eac9be5838bf44ae23 | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/81378613cd974985023037fcc60ff39c4c6c8502 |     
  aarch64    |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/376b52256c706364397fb7643889ad63e21d60d2 | ORPH
    i686     |         erlang-26.0.2          | NOK | https://autobuild.buildroot.org/results/311f2e99bb5a000ebfe7d9106a6859fd6a1fe5b4 |     
   armeb     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/b5f5d9b8004fa128b8d2dcda9eadfa99dc511069 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0d6f14535d7746dce6a179476d10e2aa0a2a64c1 |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/b72980c61519bd13e18f9c0ed21bf9b69e652914 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/8d979078e02b7ddfbeba1e1e7d049cd64fee1e90 |     
   x86_64    |         fwts-24.09.00          | NOK | https://autobuild.buildroot.org/results/da6fcb10848a8712fafc49e79747eb00078cd0e6 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/aa60584dce51d16e38436d24f843496bf880a9ef | ORPH
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/4d458431bbf180fd338c659cf8c2730de635584d |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/53c6d9da4e2f669f24515ad90985b8648e8506de |     
   armeb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/13d459b210cb0103cc77b1b94696c54af52eea71 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fd66113bd72d0c1d0be1864ef2d2e8f08bf5f624 | ORPH
  sparc64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/c027af1483a9ad18030952431dc53979ed379385 |     
    or1k     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/073b8c3dc05b631dad24de341434ef311aca4ad3 | ORPH
    sh4      |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/9f64c28816c1fa6d24699e4eb095378743ae21a3 | ORPH
    m68k     |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/0c76ea2066f1ba990d61f59335c19b2255712904 | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b9d2c052c0d9850a724c79cb7dba0160f46f30d7 |     
   armeb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/7751b96db9f8c55d938d2e7042caa37330a334e1 |     
    i586     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/9702d299c37b9a201bc31359be3a45fc47e9a910 |     
   s390x     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/1072602c8b78af037a90003907659e9fd5b24403 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/c67e52aebf8ec3be9eb1e2933e10f7b2eb6e76eb | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/2884e573d8c1a84245e25ebad7e9301ba50e2ce6 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/2cc5854a93272245139426bca6a5fff8234a97aa | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/4883d24825105e1c940aa07e9cd99a38a61ad848 | ORPH
   sh4eb     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/8512f5ddf03137db3a4bb112207b2bfdc0c4162a | ORPH
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/2e0762b9d58cc0cc994fcb719926f77555a534f9 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/176792f0fe3a3e02e39a84b05dd48c5fb9fe60f4 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/ffda483e8893dbdd65993c48506af1b2d4a28855 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/f8e2689b87cd58ed6818aa868e74b178b986b6ae |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9e3d7d936edde672e64d918660ffe5e02e650c91 |     
   nios2     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/dd317570f60ca6f220663c8f60e23e059874745b |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/2bda859e0e22639b2aa1fbca6f55c77f3529dfbd |     
  powerpc    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/2ac0afdc86b9d15d12dab6b4ec1ebedd26264eb2 |     
 microblaze  |            icu-73-2            | NOK | https://autobuild.buildroot.org/results/3889f0d36d94db5d96ba4fe337402947b6c31018 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/4c34500c9678b36bfbd2a7355d0ccf1414258e16 |     
   s390x     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/a99de41897428f57ecf68b4609a6ee6aa0968310 |     
powerpc64le  |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/8f3a014ee8fd1c8c88f0e264c457c4ca047b71e3 |     
microblazeel |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/fc8df35358ecb7499c0ce771cc8e12447fbeff15 |     
    m68k     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/d395cc0ca6a6af6fc95f28873cbc0d809b490923 |     
   s390x     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/481dbdb896d801ec9bf242e32c73330d0b6eaf71 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/646bb93a60d650c1251f0d0a430fcdb84d28fcd2 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/d17768da81e30cd6f9d385ddd0a719b7d8eb1ca5 |     
    mips     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/acc30ad4ef1cbd5a7eb06bd13edfe1a328961a4b | ORPH
   armeb     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/b2fc0f5eac785d48f9abbecff2a3fb6c48dddaa9 | ORPH
    mips     |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/0723db462d2e9dd3dfc665f36c2271860b239755 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/3f01108ccf3bf06d1dd305692f39dd8c13acfacf |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/74eee564350293e71ec524342682624bb66cb1c8 | ORPH
  riscv64    |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/d90cc82d3e93316b50b448233f17e606c5b8c038 | ORPH
 microblaze  |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a833c101a5e8f11d9b9ae325a252d231f7f50e25 | ORPH
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/e13c250cf8bf198fa638a3ed0a534fa6b5c78b34 | ORPH
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/f55c639992a529ec4fc1f45a2c2bfdef9de80628 |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d2bcc9f8d804867b7307f0519e378c6fbc2c0731 |     
    mips     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/96a4f8762d1bf4905338502ecfaa2a8772532be7 |     
   nios2     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/76cc46f87ef2255f1e9fc6b4aa45b352951b6600 |     
  riscv32    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/18aa759f1ab7d39cc42a9e2f359e173a165a0a43 |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/f1fd1e9e459b93c2c71bccc852551f6a29dd8c94 |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c02ccbad03f8ad1458903d04d264d964b5e9030f | ORPH
 powerpc64   |          linux-6.12.9          | NOK | https://autobuild.buildroot.org/results/d9340dd68e6c5115588d482a787d12cda51fa383 | ORPH
 powerpc64   |          linux-6.12.9          | NOK | https://autobuild.buildroot.org/results/a830dc7ce74706ceafb162c1ef4f0b3db94c388f | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/95325545e9c844a230097d3325c83166f8c8856b | ORPH
    arc      |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/e75bb692f3d7755337a20a925fbeabba90d3de51 |     
microblazeel |      lua-cqueues-20200726      | NOK | https://autobuild.buildroot.org/results/cdb66853206f739cd307333a8cc4a3bcf278e75a |     
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d4e35185257803e45b4df4c8e4f67917b467ec53 | ORPH
   s390x     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/12b65cabfb98a00c432c6c61188c7f6fc48982c1 | ORPH
    i586     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/f73c89d8fc76888a9cc4ad6169a0aa6e24db3702 |     
    or1k     |         mesa3d-24.0.9          | NOK | https://autobuild.buildroot.org/results/1a8627d306f79b0caa1b4f901876dd91af96a8a5 |     
   xtensa    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9d6575c6c92e1774681ff2cac9921a735d2b638f |     
    sh4      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4d778b2e5d70a552421c8e3bbd8d5fd5a0667eda |     
   nios2     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2fd6d4fd5d22e5c9dee69523b4b244a7aca7c3d5 |     
    i586     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e8806022ccca7487875763bd6728322ed6900726 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/0cb35294331de61cf38c8f9edd768e6a9a9c05c6 | ORPH
   mips64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/043b2c1a9a0fa0b3bf878a35dedaf0cb8c30a3b7 | ORPH
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/d2379d843fda9767e9294da66dc78e037922f3c1 | ORPH
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3b825fa2a41cec87c08c398f662900aa1cf1b324 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/97efe3d5e51eb526040694f687163ce2e4ae1328 |     
  powerpc    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/36ee7f10fb945e676b2ad13979c73726e66d3032 | ORPH
   mipsel    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/e4e74fbe046a1fab82dbe2cfe28e162834d32473 | ORPH
   sparc     |           open62541            | TIM | https://autobuild.buildroot.org/results/ab6011555629fe9dfa68babbc0a71406452e32e3 |     
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/0656c381b66fec70e9976ad4359fb4b80cc07fa1 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/cee3dccf64578237a6569fa6b63ea0cc57a10414 |     
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/c1d7d77bde716756f64b5d1a67408a41917851d8 | ORPH
  powerpc    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/035651906d19e187b5e09a7da2167730e4400ab9 |     
  aarch64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/2abe22c7349c1cce96aa33ac176e9aa78869bc77 |     
   mips64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/3ba73da369c848065da4136abe93219ad228476d |     
  powerpc    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/2411701c072f128104111eac31f96e25ca22fa8f | ORPH
   arceb     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/249fca33cbd76beb6fd4dc82cc225eaf26542fd8 |     
   mipsel    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/84319ac9807dc63a0ee73a0f0b16dc12dc27301a | ORPH
    arm      |   python-betterproto-2.0.0b7   | NOK | https://autobuild.buildroot.org/results/c2446831a5b499fb43adc1ced1f39a7ead415f26 |     
   nios2     |   python-betterproto-2.0.0b7   | NOK | https://autobuild.buildroot.org/results/905a281dc7344a128a6bf1c847b99d1566437493 |     
 microblaze  |   python-betterproto-2.0.0b7   | NOK | https://autobuild.buildroot.org/results/429f1ee0e710c8630cf5900ecdaf8d5f23e45547 |     
microblazeel |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/1c590b33de8d89fdcfda50bd1b788e3ae257ba48 |     
  sparc64    |     python-selenium-4.27.1     | NOK | https://autobuild.buildroot.org/results/b1fdbdbeb4ae6334ebe218891db816b370df11ab |     
   nios2     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/7e58079032322e5c7bb3d2bbbbf7af845247b390 |     
   nios2     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/e2046ffc6f558977e64e42f63f98eff7529ca23b | ORPH
  sparc64    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/120d0d3b268cddc4fbea96478f71d26538fe8f75 | ORPH
   armeb     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/14f640cab14dff9c0450051153b27422a0689e54 | ORPH
 microblaze  |         samba4-4.20.6          | NOK | https://autobuild.buildroot.org/results/de05ba67c36b1106d1fe63ce8a3580b8bd69f3e3 |     
   s390x     |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/40a93ca6b5b1ee2f95f1c3730ace1b33943c1f99 | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/ccbcb2b9fca29f07140736179700a1c70433722e |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6965d258841b833a2d397f3059c29d37f8b61a93 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/840807f83138e13d8de91af36d2894c7d70c2a56 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4474d728e9e9a71a4d38e9f0f9cac39c7ed5dfb4 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/046d7364cb09a77ec5cbd821eb8b0c374d6df4b7 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/000a72ca2050250ee268338833c6d2d31975058e | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/67443c2e1e976b380981b2336ac08373e016dc40 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b72b44b0067ba514b82f8e2195bc24f0374266b9 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/faeb337a3bf074799ba76f862de1b8ea6bec47e0 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b5726675fd6ec50478b66c004b1ba8852571f3c8 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f75353f9c7f9a5a8dd751bf60ec9d13c13c82ce4 | ORPH
 powerpc64   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/0f7d27e78fdf2c16bee3a8ee7ed7cb9533f5fa90 |     
   sparc     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/908bd136b5ec195b8023ee3983fb22a52c5332ec |     
   mipsel    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/3f2cff5cf8f907bec139706bfdbcc347a96594c8 | ORPH
    arm      |         wlroots-0.18.1         | NOK | https://autobuild.buildroot.org/results/c1239e4766f2d3808f91c00c6b766adab0f79812 |     
   x86_64    |        xapp_xdm-1.1.14         | NOK | https://autobuild.buildroot.org/results/b75ad8f1159613656dce482992c800545d60ae69 | ORPH
 aarch64_be  |        xwayland-23.2.4         | NOK | https://autobuild.buildroot.org/results/c03d57ad7ed3feac008091a38ea50bfccfa62b08 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bat-0.24.0 | 1 
       freeradius-server-3.2.3 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/f437ed64f243b2f49553dc75cad37065e0f044b2 |     
   nios2     |    freeradius-server-3.2.3     | NOK | https://autobuild.buildroot.org/results/a526cd1093ea91d793f8c869ca8623b6f169e94b |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/b17dbf4d5ad4bee6648ce625eaf49d029d694a3a |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   foot-1.16.2 | 1 
       freeradius-server-3.2.6 | 1 
               iproute2-6.11.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/5883b4d293069fdce09d282b8e30f98e2001ae35 |     
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/d2dd890facd867f7db8515ed736167d8f9960b97 |     
   xtensa    |        iproute2-6.11.0         | NOK | https://autobuild.buildroot.org/results/29cd591638a605296ff02a7ad0aed7875a5f79da |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
