Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03051C3601E
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 03:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8476341A3E;
	Fri, 11 Apr 2025 03:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLdoFmZMnmZt; Fri, 11 Apr 2025 03:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36D7A4141D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36D7A4141D;
	Fri, 11 Apr 2025 03:14:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BB12138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 03:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 184CD4176A
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 03:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCJ375uDOz_O for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 03:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B73FB403D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73FB403D4
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B73FB403D4
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 03:14:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so271166066b.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744341260; x=1744946060;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00OMx+tTL8AG5Fs+haMKU4ClHL25qe0trm4lCKTux9A=;
 b=Kj3RZYVE8Ld+UgaC7aMp8wnkm8hnvm3Mx+DOhT5rNSFn9r2KJiQpibKSEyMSztaTwe
 8ZkaN/wTAq+53PCEvDUuPhWlNon8s90YrNh7LO8ay6kYdtGfPE2+8jRpxhqYkx4wBhds
 Zxxi5VPazlv8lz9p1IbSHgwO5AMltMHm8W3WZCwNQHDYm00jrYVCbOToBeMNJMVaA6Sc
 SWVWlEjxIzmGZQja55LMqGP9lcQqacQbhNXy416GSsca64/QtGVSjZXINbyhT4PB2yp7
 iruelEZoIq0eFUFp6X4FMp85VfY78WgJa+d3i0+Eaein2n9mV+wYpw7Hk5py/xBsnxMK
 A/ZQ==
X-Gm-Message-State: AOJu0YypRvaq7XzhJu7hEEd6pHLhZXYf6JAqZkZePrpmFLU0zKTq/NQN
 GJ9nz4w9UY+Bpn+G1xhq0oZ45aYlmcP0QhivGCyTdy6lpjQKkphHFanyBA==
X-Gm-Gg: ASbGncsQ8BppRojMHSA4401ux2uH5xXuHX1LqtvoidbdqeBgFME4GskhaqzQKwnHTxu
 3O/XPziQ+7GOjsSDj9ZLpznaabmZwmEJnltQxulgFG2+dexVJ2R0mWt34ejSGzKOBJsubRa8G8l
 MAXHxmGSqQIAbZO5CzQjTodXrcml+rBnTmUj/TEXSUJWWYQYsAa5q2aUlUibP3rTxkqUe2ZLHRl
 HRevoaPM0YdWRcy68ERUePuqDgCItaO+JSZkeqrRZamtr8y3QTgs6/OZedNtx7aPlLmGSxN+M4U
 mOrqNur/xI3eLvciTu2yoxKhYuuO4dbp3iz5AJixJLw/
X-Google-Smtp-Source: AGHT+IFfu4rzxc6ZZ9SBFiTfa/MFZ+atmef1DPqgTyagzSKa1MFz7Kr3pq3cCHAeMhojqXuKJWbpIQ==
X-Received: by 2002:a17:907:3f08:b0:ac8:196f:7441 with SMTP id
 a640c23a62f3a-acad3445f48mr102782566b.7.1744341259516; 
 Thu, 10 Apr 2025 20:14:19 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb353dsm366996966b.28.2025.04.10.20.14.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 20:14:19 -0700 (PDT)
Message-ID: <67f8890b.170a0220.25295f.bdb9@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 11 Apr 2025 03:14:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744341260; x=1744946060; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=00OMx+tTL8AG5Fs+haMKU4ClHL25qe0trm4lCKTux9A=;
 b=PDLWFAdZ+cRTEKuVEkcBaRrYh35AD1+Af4bnVSnf/XtQWZH9qOwjOJqrIU8oa6sREd
 SPCNDnx9gOHmVZdHPKWQ7HjxSUvAlVo+aKstd0fNMzYckFh4jApSOv6gldWdF5EsDjmf
 yA0xckrbVzqz994GGDr0oHTVJqT9nX1IHOEDCnuuBwQP7+cqElK2/kyw69nNv2ZtLw9e
 VMkphKSz6Evjqru4ill+YgshSFYcjlrEIMbJ+5zwScTcQoxB3qbC/IEgPkAW/ICIcJnF
 lODyoVBUyha3WcZnGfjja/yovZBTrpiuKRB7g4jdWJgC+CJltB35rlPPIb139hpFcaQo
 GFbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PDLWFAdZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-10
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

Autobuild statistics for 2025-04-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  5  |  0  |  8  |
  2024.11.x  |  4  |  2  |  0  |  6  |
    master   | 12  | 65  |  0  | 77  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
               libfuse3-3.17.1 | 3 
                   linux-tools | 3 
      passt-2025_02_17.a1e48a0 | 3 
           at-spi2-core-2.50.0 | 2 
                   bird-2.15.1 | 2 
                elfutils-0.192 | 2 
    host-python-greenlet-3.1.1 | 2 
               mariadb-10.11.6 | 2 
                 openssh-9.9p2 | 2 
                   perl-5.40.1 | 2 
        util-linux-libs-2.40.2 | 2 
     bandwidthd-2.0.1-auto-r11 | 1 
             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
             dahdi-linux-3.3.0 | 1 
            ecryptfs-utils-111 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
              gcc-final-13.3.0 | 1 
            gettext-gnu-0.22.4 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.82.0 | 1 
        host-sentry-cli-2.20.3 | 1 
                  hwloc-2.11.2 | 1 
                libdrm-2.4.124 | 1 
               libglib2-2.84.0 | 1 
        liblog4c-localtime-1.0 | 1 
                  libsepol-3.7 | 1 
                  liburing-2.6 | 1 
              libzenoh-c-1.2.1 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
       matchbox-keyboard-0.1.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
                opencv3-3.4.19 | 1 
                   patch-2.7.6 | 1 
          perl-net-ssleay-1.94 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
             python-webpy-0.62 | 1 
                python3-3.13.2 | 1 
            resiprocate-1.12.0 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                   tini-0.19.0 | 1 
                 weston-14.0.1 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/5fe60226fd7866257f2b363e7427dbcbea4e07dd |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/d65738050278d4035bd4e316c83a87699c3eeddf |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/183a507f0e1e2dbbfd4d50580f219c6688a8ff13 |     
 microblaze  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/62400d1d0deddbace5332afabe141e913ff91afc |     
    or1k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1cb53b1435503a4ea4de0412d480efbab2acadd5 |     
  sparc64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/15fdc8614bc632f28aacbc12075063e70893723f |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/1fb8a879a8299826060b80af8baae0bb5a1b5486 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/95ecc538d7d81eb7bb47c09d95d8bb93f4314ab7 | ORPH
    or1k     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/a63c95a12f6b84c5cb796c469a285845b8103a93 |     
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9a850f5d8ced30011f3a8c896492c38719a8dee1 | ORPH
   armeb     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/89ba8dbe7da4518204cff4eeda7c6d960985589c | ORPH
   armeb     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/a8adda72c929404f90457080eb0e86141f1903e9 |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/6c55c05bf91a447dc3e9ab8e72b5ccfd9b2b4c25 |     
    arm      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/5231ddc21534330bb98f73f3d094f01ee15595b0 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/994124f4e5bcf17278aca455645411e489b9d3e2 | ORPH
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c28588dd6809082253f78f0e83c5dbba7cd9aa74 |     
   arceb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9e1a716dd7642e36f22e258451fc8c8525f6b6b4 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/004934101310d9b4eadfe2d99ab51ecb4a3e8f9f |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/499ef7bf2b469e196fabd480b138adaa81eadfda |     
   x86_64    |          hwloc-2.11.2          | NOK | https://autobuild.buildroot.org/results/bebd924e47a903dc3e039360031e2ffbdf7290b0 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/a5fd5cba58d42775d1a8e952e5437f5d38b626aa |     
   mips64    |        libfuse3-3.17.1         | NOK | https://autobuild.buildroot.org/results/71299a3db2660084ba362ff7c1b875bd0f71324a |     
    mips     |        libfuse3-3.17.1         | NOK | https://autobuild.buildroot.org/results/2eef6d2f08262447936ac7aae05b8a21cc7224d3 |     
  mips64el   |        libfuse3-3.17.1         | NOK | https://autobuild.buildroot.org/results/90fc6cf71d7db93d3e668d93854f2064cfbb2855 |     
    mips     |        libglib2-2.84.0         | NOK | https://autobuild.buildroot.org/results/ce926598057dfbd5aac00b93000e1dde91328a81 |     
    m68k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9eca633b7d5b27cf2e3cd12f59beb8590692e206 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/bd9d9a8c91b1bc430112587406a67242693a80b1 |     
    m68k     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/3661a63bf57922dc0355a310b00ff753d544e86f |     
    arm      |        libzenoh-c-1.2.1        | NOK | https://autobuild.buildroot.org/results/81e30aae8267871d091a9c90c1ab80bb99e7ccf0 |     
  sparc64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/deaa9445ddc6bbb15c12e1809830a1b62b16ec92 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f9c9d1e701ec9688a4162d3b3cb1b501ca538e22 | ORPH
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c0b63b3943c08014cb95ec02a4930d79de7c47da | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b00ac9f60999e7b7dd9412c3f0c8bd63557cdb98 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4e74823257808728ba4ad2d6d68502bf2f84274a | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3749411bc4fb7d0cd46afa26712edeb35dc64f23 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/1620c54178bfc6bfab180a04d3fb225cbe780eff | ORPH
powerpc64le  |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/de4ca31852896b2f71bbcf19b924598c08cf6a09 | ORPH
   armeb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/33dc0e98a745fdcb1d7b1f5df3f7f522fcbf20b9 |     
  riscv64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e93459d5319bd7bedc701e32bed7d34a5bee55fa |     
   s390x     |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/4e8c34e8a255c401b89a225972583811f3d8a196 | ORPH
  mips64el   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/23973f5aa4ef79357dfae519883bb5aacc368f29 | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/938dba8b5e45a1324dafb203e2ccba0f7d4544cf | ORPH
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/161057f60a96a155202a2da07551d5cbf461dc3a | ORPH
    i686     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/fafef1d6b5dfbd49739d8b8eb05e43734176ef0b | ORPH
   sh4eb     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/9e5cde4115dbeafc5aae985c94a11d60837bd64f | ORPH
    or1k     |          patch-2.7.6           | NOK | https://autobuild.buildroot.org/results/6d53b35384a49eb5f4e79097f6d274f45ec820de | ORPH
   mipsel    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/d9d9178ea22058b90a6923c5dfcce1609eea6877 |     
    i586     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/fee6ecd79a3d638145c4acced1165a004798cb97 |     
    m68k     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/04dda5734877d379dbb8f7df9063177a693ec0ce |     
 aarch64_be  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6a4ed2cfe70dea82191e01f59e1c407f3f7f9ec9 | ORPH
  mips64el   |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/c4557e8a25082e14b708addf3b7d75c64de3a9e3 |     
  riscv32    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/21eeb19d815caea1ac8b4e90ea46271dde0cc417 |     
    sh4a     |         python3-3.13.2         | NOK | https://autobuild.buildroot.org/results/dce3099994030c1b2e5306ae622037f6b982072b |     
    arm      |       resiprocate-1.12.0       | NOK | https://autobuild.buildroot.org/results/ace35c2987a44ed5bdfddd134aa08d9ac8aca9ac | ORPH
powerpc64le  |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/dbaf8a9e9882d3d81ef96cf1f396acd1a69f457f | ORPH
    i686     |          tini-0.19.0           | NOK | https://autobuild.buildroot.org/results/fc4ae1de5a86b97a9c1011e6f0e8807a397df3a9 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/5ac604d0297d1755df1a0133fcdd68b7995d7f45 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/57714eb62c31402c2903c0aaf4dfbac0a9bc7cc5 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/462ffc290a13ef9c9c473f6496b4f2a7fee21194 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/2b5df7caaf4bc5c292259f8618fd2afd94af1b06 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a3be50d3ca03615fa532740efdfded4e06bd9e59 |     
 aarch64_be  |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/eed79c74dfdc25bc303aa2a78fa4cb573dd96c88 | ORPH
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/fc9384c213c649337191c981cf84bb844067d9dd | ORPH
 powerpc64   |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/fa3e94ee5a2a7207f6c604e9fc9b3c03e2eddd66 |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/7700faf1c3362051d2eb839e4259ecc333122ad6 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
             host-delve-1.20.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  linux-6.6.83 | 1 
                 openssh-9.9p2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8605a287065192cc4d1e849a99f41530524156c8 |     
  riscv64    |       host-delve-1.20.2        | NOK | https://autobuild.buildroot.org/results/b527f6d8e147341fb18d10f6940f17fdf57e5559 |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/bcfc1f27af14e105f1c9c2fd27fe8ab28d10d68e | ORPH
   mips64    |          linux-6.6.83          | NOK | https://autobuild.buildroot.org/results/99d7731c38077f843b5eaddb28d4148dd60008ac | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/994142ef1711d389a3f96e91a36e7e1456d07977 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  catch2-3.7.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          catch2-3.7.1          | NOK | https://autobuild.buildroot.org/results/3a7940c559d158569fbd6113178f20a8890f5bad |     
microblazeel |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/d7c1dcdb78699eec84fdbce9e72fff3e39643e4b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
