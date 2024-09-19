Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ABCDD552
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 03:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56DE64068D;
	Thu, 19 Sep 2024 03:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8v5kCUVhfKD5; Thu, 19 Sep 2024 03:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA5B42661
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA5B42661;
	Thu, 19 Sep 2024 03:18:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5640E1BF3DD
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5150484435
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHBp1LC3t3U6 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 614F1843D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 614F1843D6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 614F1843D6
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:17:57 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3d2f9f896so520222a12.1
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726715875; x=1727320675;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B2mAwN6bOOjiFd1m6WDas48RPEEQp6XSBkt2EOlAdAo=;
 b=xUurLLgVX5XiulU7+/lomCqV0A0ncp4epp+HB3Ze7kIJ//K1xIVYaBkgsfCHAdg/NJ
 pCwy2W1vvWV/LDZ8EYgzFB82P5s4N+fMdOj7LJuGDZMm9yoEjNexbSNERQfRawBErAlM
 AJhCMgdq2x2KMZClA3rLKLCv42bbPDPln8M1yZFJr8BGVHmewMwjAr6Wq6DdIP2OJ3pE
 VOchTIKl3nvV46N2dxJ8wmSZMrWh84ReMdRQFQ+flomBMcgQAbZYaEIuGL6CW3CmUdGY
 hrJ3uUua6GtPurgnhsHDnVsnfy7H8eqJkTnLVh519Q7IiSz06oI/DQFSxPS6zaeJBN42
 ge4w==
X-Gm-Message-State: AOJu0YxbHX7fbOuuCowWybs3KHWOTPasxhbj+l9jmUU1J0NrbjDAMkhI
 cecgZoNqu89tTqnjb3LEwf67JY9Xv4kvjCR+Sd+o7/7bRVwI+BYXTU4/+g==
X-Google-Smtp-Source: AGHT+IE3CJl74jnzA02WIGYgR7Sdvr7TPIrbTgLRNqK0jj1Btg+SLyBYiKBhH7zb+0joLWGCTtA2gQ==
X-Received: by 2002:a17:906:c14d:b0:a8d:2d35:3dc4 with SMTP id
 a640c23a62f3a-a9047c9fb5cmr2146840366b.18.1726715874721; 
 Wed, 18 Sep 2024 20:17:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3b9csm671862266b.140.2024.09.18.20.17.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 20:17:54 -0700 (PDT)
Message-ID: <66eb97e2.170a0220.bd907.6585@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 19 Sep 2024 03:17:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726715875; x=1727320675; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=B2mAwN6bOOjiFd1m6WDas48RPEEQp6XSBkt2EOlAdAo=;
 b=LYeoTEiF6N815hq3IeBo/kLgXAUeIN4SefxzxeAVyC1oSBV6i4x/G18JeDREL2nhoQ
 z9laodz6EiTUoVgG13hUX7c77Dd3QCdYyfZ4dR4hOhVCzyfYuZ1O5lcAlWvzAJR+Na65
 vCpnY5pTn/bomSRldIRu6grtUALjC1vjQ3vIb6sb4HUxlrsDWIFzimieDKhW35r2Bbjc
 HcWlSxuHZ1L/ByYnAEe1h9txyLsZZlR+zSuLGNFwX4TQmqgC72As1nBqpOIyfBSP6b9S
 X1mhKwiW1ayiraESdRf+qxeSl1u4DJdqZFldWvAILR/KXqxK8JGmB8gC93dWL/5tT/Xa
 II7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LYeoTEiF
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Autobuild statistics for 2024-09-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  4  |  0  |  7  |
  2024.05.x  | 20  | 31  |  1  | 52  |
  2024.08.x  |  4  |  3  |  0  |  7  |
    master   | 15  | 53  |  5  | 73  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.77 | 5 
                  linux-6.10.9 | 5 
      host-netsurf-buildsystem | 3 
               procps-ng-4.0.4 | 3 
  gobject-introspection-1.76.1 | 2 
            host-binutils-2.42 | 2 
           host-librsvg-2.50.9 | 2 
                   httping-2.5 | 2 
                      iwd-2.20 | 2 
                    libsvgtiny | 2 
     linux-5.10.162-cip24-rt10 | 2 
                 pixman-0.42.2 | 2 
               valgrind-3.23.0 | 2 
                 apache-2.4.62 | 1 
           at-spi2-core-2.50.0 | 1 
                   bird-2.15.1 | 1 
           crucible-2023.11.02 | 1 
                elfutils-0.189 | 1 
                     file-5.45 | 1 
       freeradius-server-3.2.6 | 1 
glibc-2.40-18-g564178076272... | 1 
        gmrender-resurrect-0.1 | 1 
            gnuradio-3.10.11.0 | 1 
            host-ccache-4.10.2 | 1 
              host-rust-1.80.1 | 1 
libdbi-drivers-0bfae6c43134... | 1 
           libfreeimage-3.18.0 | 1 
              libopenssl-3.3.2 | 1 
                libxml2-2.13.3 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.6.1 | 1 
            netstat-nat-1.4.10 | 1 
                  nginx-1.26.2 | 1 
                  ntp-4.2.8p18 | 1 
               openldap-2.5.18 | 1 
          perl-net-ssleay-1.94 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/a9bd46cdc0d6397a79a7c7a126e575a20839842e |     
    arc      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2dd9e37a916b7abf0694a4301a3479ec63cbe2e1 |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/669eae7d2e94374d3d0348cdf28b34892bb55a0b |     
 microblaze  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7930f55da832200720f494e8b32c797df374adef |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/bf6eb0a03e92bae544abadbfd5be1a09f74cb4dd |     
   mips64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/2ff66070ce0215ebcd0a358cd686bbf7e229cd4d |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/7bf1ecbb51f94724cbd67ff409fcb883653eb0d2 |     
    arc      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a45d964ccbcb697c2f073c07733fb3d1b3170e7c |     
    arm      |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/b56d9376bd758081e27bc349c192783ece22a4fb |     
 aarch64_be  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/3a8b7719d1ee8ff61f19a3153ec176f5d7cb370a | ORPH
    arm      |           file-5.45            | NOK | https://autobuild.buildroot.org/results/240aa8642d4e7d9fe2d740ca9bb5b478fe182ae9 | ORPH
  sparc64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/a59bdb46918eaefb92086e404ae222dfdc072102 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/5bc7e352d81cfe6bcfb81f09d058f7d7a1f95924 |     
 aarch64_be  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/d6f05972a854c1d2ac4c19769be76541efd2cbfb |     
    mips     |       gnuradio-3.10.11.0       | NOK | https://autobuild.buildroot.org/results/dfda705bb1b3b975bde3d84c6b25a9b41c545c84 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/d25e3a1091a3f1ffd5f70e21516c0fdbb3296ee5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1f9c8a2c848a439a7626a5810a7da37caf6c8255 | ORPH
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e4017c2738556ec050205f9229504e03a42973ad |     
 microblaze  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c83e4e8009749b32a3ca57592a282652810f2e57 |     
 aarch64_be  |       host-ccache-4.10.2       | NOK | https://autobuild.buildroot.org/results/078ffd0ddcdf634881d00b5bca80e746c5ef5da7 | ORPH
    arc      |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/bdc5176a2590c1cb5f8aaf091a070b293a651961 |     
 aarch64_be  |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e2dd03c3d1e674e7900c02c142a9389e7e0f840d |     
    m68k     |    host-netsurf-buildsystem    | TIM | https://autobuild.buildroot.org/results/2db188e96de5ecffa5813a84f13ad9d811e24318 |     
   x86_64    |    host-netsurf-buildsystem    | TIM | https://autobuild.buildroot.org/results/ee1694e0e0f1b1ce683dc026bba9cd20475be7ae |     
   mips64    |    host-netsurf-buildsystem    | TIM | https://autobuild.buildroot.org/results/a8af69c98767aac8e4508d4790febfb819421c64 |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/5bdb62e8d4d9718e29ccde2e79070c4eb606bb6a |     
 aarch64_be  |          httping-2.5           | NOK | https://autobuild.buildroot.org/results/3401dae63bf47102908edc1c5eda94adf3de9733 |     
 powerpc64   |          httping-2.5           | NOK | https://autobuild.buildroot.org/results/57492856f8e52f5a4a9301c1f1a2eed516a28486 |     
   mipsel    |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/d3e58f4f5cf1cde2087daa7cb90bed813b34f95b | ORPH
 aarch64_be  |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/181237cf7b0fa27b491872ead2cbd5deafc9a291 | ORPH
  aarch64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4e15646b63ef8b928dae5f8a0ac786b32c19a456 |     
    m68k     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/f472d2b38dbb7ba8b08a171e26a4a6526198629f |     
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/66ccc5d7bf05a9b9ff985418453a0a42ac14a180 | ORPH
  riscv64    |           libsvgtiny           | TIM | https://autobuild.buildroot.org/results/5ea7cd8f56f7a073a77a7cf52d7c1f2d38556f46 |     
 microblaze  |           libsvgtiny           | TIM | https://autobuild.buildroot.org/results/726e1c45a0b63c9ee994348e199fe92106144ad5 |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/4b1078f83430edcc469db6fcf3d480ff248c5e6c |     
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e8fc1af104bc7a27b69ea35ce3f1f0d787298900 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/00f2879086d172f4b93c7b66484aaf66cb6f9ff7 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a092f454afd21e605e7a6930f81941dd0d5491fb | ORPH
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/14d7826ae086685f3f40cdc7315fbd1753c5d66d | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/d0a3a3e1d0485a9f42890aa1710ead37dc4c682a | ORPH
 powerpc64   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/da649742918b9b5eac5f8dc5dacdb88a8d89dbbf | ORPH
   mipsel    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/2547c3b826bfe96de097960d2601acaf7cfd654e | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/726cec9fd244c6b1d16debaf66126c6b6ea36186 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/bcba72cc45d3156925dacd876e875b5b98bd87db | ORPH
    arm      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/36e6d1f179f616094c0ed819a5b7aed848b71b2b | ORPH
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/306bd54888e93c837e0bb55ab21151dc05b38227 | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/4c8ce2133f91a1dbab00e506a469cf4f758c1276 |     
microblazeel |        openldap-2.5.18         | NOK | https://autobuild.buildroot.org/results/def2da5334da4167a539b6b71e1b7d08eaa26a7c |     
   s390x     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/e735286fe220b4213e4a129da8f9cc8e9a545dcc |     
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/217a435b75d7113e0a71abe2e40eabdfb0825201 | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e9983108d70f57b6ccbc6080381c1c0415ac7b02 | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f5b9fc5a69ceef37e87f240d47638a8058c36a1a | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/399f790ba734719ab03ed0df9305ce89b44ae627 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3cb1f814507bf000b2b91ea00c741cd3e6876333 | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/755ed1b50ad97111fd3d1d0a75880a42626d54f2 |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/41ce3b097392617eaa432fdd46d0f16a9b40558f | ORPH
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/41b9232292d79875d4db4ef6992ac0567f55764b | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

esp-hosted-6a25417fc880fd74... | 1 
          libcamera-apps-1.2.1 | 1 
                nushell-0.85.0 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | esp-hosted-6a25417fc880fd74... | NOK | https://autobuild.buildroot.org/results/31b5776bf2ee9054e0cc048f16f83c825add4797 |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/fae92e74312eede0da7a6935ba6c796e4f875075 |     
powerpc64le  |         nushell-0.85.0         | NOK | https://autobuild.buildroot.org/results/cde3a37e4ba31e2af04670a7d0038c682eb663e4 | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/06520238dd09af76dcabb3e7de944b8e39f499d8 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 gnuplot-6.0.0 | 2 
  gobject-introspection-1.76.1 | 2 
host-heimdal-f4faaeaba371ff... | 2 
      host-riscv-isa-sim-1.1.0 | 2 
                  linux-6.8.12 | 2 
android-tools-4.2.2+git2013... | 1 
                beecrypt-4.2.1 | 1 
              bubblewrap-0.9.0 | 1 
             cni-plugins-1.3.0 | 1 
                  ffmpeg-6.1.2 | 1 
        gmrender-resurrect-0.1 | 1 
         gobject-introspection | 1 
            host-binutils-2.42 | 1 
                 host-gdb-12.1 | 1 
host-prelink-cross-a853a5d7... | 1 
              host-runc-1.1.12 | 1 
                libressl-3.8.4 | 1 
               lighttpd-1.4.76 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                 pixman-0.42.2 | 1 
               procps-ng-4.0.4 | 1 
   python-pydantic-core-2.14.6 | 1 
         python-remi-2022.7.27 | 1 
             sofia-sip-1.13.17 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/40c424b357bbec55eba54115ef4e69a7a8033319 |     
microblazeel |         beecrypt-4.2.1         | NOK | https://autobuild.buildroot.org/results/2378d02e69095af0ba08a2c14261b3e8ae36dbf7 |     
microblazeel |        bubblewrap-0.9.0        | NOK | https://autobuild.buildroot.org/results/92cef84d2a13f17342295614e613f4576102dd30 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | https://autobuild.buildroot.org/results/f6475dfc8c592a4a3c0b27232a55075d10b07a7e |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/78f0125ab7f8deb165c6e2a0f832417be07c47ea |     
    mips     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/51a4054fb15629f1e0814c4540c01481cd09cc50 |     
 microblaze  |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/07c25f818ec561ddfead620ccbb31bdb62a42e72 |     
microblazeel |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/194f56f192e349ca1fc5c39409dce3b383514ea1 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/639b7c09e7127ab7c898283646ad737f49144999 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/25359d672025c39c69f91977973638b0dccf599c | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8d0587d739f64fb6d023c0ce93face3c734254df | ORPH
 aarch64_be  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/951cd2cefa34b0670eb90b1f880a36bdfa54ef7a |     
   sparc     |         host-gdb-12.1          | NOK | https://autobuild.buildroot.org/results/40dc5e7261499a4eb7fd00270007bfcfdce80751 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/0499327379ca35151305a5aefb1e334d7b2e0524 | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/9465b7397301aa4b5ee7eb21d5da4e34c8f662ec | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/6346f41c37e690f5b9ab39cd040899be30a7e60e | ORPH
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/cbf6b5156bef011ad759135f7a887e233f6be665 |     
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/4ecf3e0d346e9d818ad5e18063bb2a7acaccdbd7 |     
   sparc     |        host-runc-1.1.12        | NOK | https://autobuild.buildroot.org/results/f8c5194c7c51706da4a624b0a33d96464de26a48 |     
  mips64el   |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/acfd87e68387909f279887f4a955a1a2083e2a70 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | https://autobuild.buildroot.org/results/e8a4aff333545db4f9cf6c66dfe5648f48027c5a | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5bafdd0a35d4536a1723520d5955e3364cf7993e | ORPH
  powerpc    |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/2ca23dd6c4519ac4a1a9d390a992aa273d7b4cad | ORPH
powerpc64le  |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/043d7aa5a645eebec251ef15e54d6870c9f22d98 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0c824f7388fd0838ddb631f0192d3635a74fa18b | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/59c9b1641e98b75e95ae457be77822bf984d842a | ORPH
 aarch64_be  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e9e68591e8c3875bab9f66c64c4020fddf277777 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/537d51c80869c312bf917a6f2bf422938ba7e32b | ORPH
    arm      |  python-pydantic-core-2.14.6   | NOK | https://autobuild.buildroot.org/results/f8da7dd56f11ba9ab68fc6944e17496551acba0a |     
  aarch64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/f14800ff984ed0b94677d49892379a41411ce238 |     
   mipsel    |       sofia-sip-1.13.17        | NOK | https://autobuild.buildroot.org/results/115c6ee80b66802b0d4743b1e52d90ed9433c000 |     
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/63820f960b9ee6d88b26cfbd43f71a7d4b425465 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              host-rust-1.79.0 | 1 
                 logsurfer-1.8 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/4563f4e6d3fd5298b8fe906e142c814d1817f4bb |     
   sparc     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/452d177a8ab9e072eecb874a2399da17f11bfcd7 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/caa9fd2f0d41e5279e02c229270632b71f89837b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
