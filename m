Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A4FCCF9F8
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 04:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C017840722;
	Wed, 12 Nov 2025 04:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8nlEZTbo8ZO; Wed, 12 Nov 2025 04:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63DFF4075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63DFF4075D;
	Wed, 12 Nov 2025 04:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01EC824D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 04:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC8124036A
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 04:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMoqsJqTIIbF for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 04:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BE9C4021E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BE9C4021E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BE9C4021E
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 04:21:40 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so2392605e9.0
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 20:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762921298; x=1763526098;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1UoLgjHVQtXo/+fT0jULcU+PSS/TFbAAHnDgf5/pDOc=;
 b=bnL/fp/MD8/zzjGmWg/D737KA6a/kiE6m2b7xPqosjpN6qYOWKag/cXv5cCW7/ZcNW
 YypydmObD+MWfoEKaaTo2ATmgPtV5Pw8rzS6tG49YZE0tv7m5hMTD5ZUprscGEpKWuvN
 BK1xg1FMz1XWxBGKnTj1X70xHDsO1QB+Fth8xThRmD6vC7a1/hK5qBWCEKkWignLVEMW
 zWRA4SNAQj3tzSB5f/T5juRxAAZn8r+J1nbe8dk+tMMR9q2U7qZWpOmU7AMSGMpRt3Hm
 6JD4wxMrjoKKqoPytNO/7DADBde1vbSbFeqvyFTYzsRkvgtSz5bCMQ1I8CUc3SL+/f+A
 w9jA==
X-Gm-Message-State: AOJu0YxPU7w5f8X2/ZzbM0Mn7cMVxxBmBAuUmT++aCM+5JVxczxtkRB8
 USwNxF+9QAq/KEiJEKuFKq3AsLoaHegu+EFRZltFeqgH77kvaDCpKzjXAb/c5w==
X-Gm-Gg: ASbGncv6vQ+Q8KNuLzkekoadxx5JylHb7v11ZSH1FHDH2OF2ZHDrucvh99Mm6XPGzXZ
 744OLG+vM1WWbcE1M5n/mNiz5G86wiPme7pA9CL5YrzM5iE+XowTGYGGk2tVcmL2M6V/QUwUai8
 N+uvSJ7v98fbtMlZpvsWHausFlJXKkpqg0kYMfOvHfuD1qiZJyJ4P9+8cglNcUPNa5OxF0HfQ0U
 9P2kUafZqVGzER2KNbNToFl+JeVCsBtmlxV2WC93VTlZZMeQ9e5jlpHEWXITh5lMdxu++nX6pd1
 jyTNqhbkMKX5X8EU02xhxYDxncVYEcJktVlodCkZw4F8gRqstqNA7bL1kpWvyXlGHr40JHCztAD
 RZaCmrGoKOCzkaT5fG3eXRiEkQMU8mYxQCxNUlS7LmSYosgL6knn2G2CrIyZbp85wd4wdq0XJsf
 39z6HrPjiAIe/Ad+RqBA==
X-Google-Smtp-Source: AGHT+IG+7pm31H0rQZbKpoWXqrRnKJoykU4J105JdkwpTSE/VeqnuARK1Yr2nu4e3A6z6JN8A8qO/Q==
X-Received: by 2002:a05:600c:4695:b0:477:5c45:8117 with SMTP id
 5b1f17b1804b1-477871eb76cmr12036605e9.41.1762921297787; 
 Tue, 11 Nov 2025 20:21:37 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2e96441dsm24108947f8f.23.2025.11.11.20.21.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 20:21:37 -0800 (PST)
Message-ID: <69140b51.050a0220.46418.082e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 12 Nov 2025 04:21:37 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762921298; x=1763526098; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1UoLgjHVQtXo/+fT0jULcU+PSS/TFbAAHnDgf5/pDOc=;
 b=WG1DP9VFxd378iJ2rsCVlMkSKju6Z/87AeBUXAQdVHAQooYwTAUBToBEY2X4617RmI
 LUG02CxAhBvx4jBOPopUnc7mwDguP42rQ2JZvomEUOWuplo9eWq2xQX6NY2ZMLdx3k8+
 qnhXmk3IxihDAolxRpg+AXRUpun6ZMIcoF9SXAKFkxeZrZi0yUPgwX6a8XoA4EKVikV9
 oV9+9hm1TBmLd3ti9nHekG10osY2Zb72fS8AfsbTbhDMxRfWUgtx3d4oAXzrd+7Ekazb
 s1HWPxc4DptR/YuDXgvG/hlQ/b6kiIGIsMBQWwb+dSYO58PCzSUEaCM3O+i4d3IQU9cK
 19dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WG1DP9VF
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-11
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

Autobuild statistics for 2025-11-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  7  |  0  | 13  |
  2025.05.x  |  3  |  1  |  0  |  4  |
  2025.08.x  |  0  |  6  |  0  |  6  |
    master   | 29  | 82  |  0  | 111 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
                   libcap-2.77 | 6 
                    mpir-3.0.0 | 6 
                openocd-0.12.0 | 6 
     libphidget-2.1.9.20190409 | 3 
                  linux-6.17.7 | 3 
                   cvs-1.12.13 | 2 
                 dc3dd-7.2.641 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
 host-softether-4.30-9700-beta | 2 
             libgphoto2-2.5.33 | 2 
                netdata-1.37.1 | 2 
                   perl-5.40.2 | 2 
                apr-util-1.6.3 | 1 
                   atop-2.12.1 | 1 
               bctoolbox-4.4.8 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
   dovecot-pigeonhole-0.5.21.1 | 1 
          esp-hosted-1.0.4.0.0 | 1 
                 expect-5.45.4 | 1 
                      fio-3.41 | 1 
firmware-utils-86739f2b3ae9... | 1 
                    frr-10.4.1 | 1 
                    gawk-5.3.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
host-am335x-pru-package-5f3... | 1 
    host-mender-artifact-4.1.0 | 1 
           host-openocd-0.12.0 | 1 
            igd2-for-linux-2.2 | 1 
              json-glib-1.10.8 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libite-2.6.1 | 1 
              libopenssl-3.6.0 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 lockdev-1.0.3 | 1 
                memtest86-7.20 | 1 
                    musl-1.2.5 | 1 
                opencv3-3.4.20 | 1 
                openssh-10.2p1 | 1 
      passt-2025_06_11.0293c6f | 1 
                 procs-0.14.10 | 1 
                python3-3.13.9 | 1 
          sane-airscan-0.99.33 | 1 
                   trinity-1.9 | 1 
             util-linux-2.41.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/d821a916353c15f0f4f118425445d84de8e4e4fd |     
microblazeel |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/6c2456ee4bd7055ee3c99df520ca85201623fd4f |     
  sparc64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/11df5c874df9df5cdd5193733f666f5f8e724f5a | ORPH
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/426370c7cb0ad9214089593cc619efdedc09baf3 | ORPH
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/8a693dd68a2b5dc67ba953163d983820cb1e31cb |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d8e9850db83ac51715b1efa28cc94ecb4742d0a3 | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/67202b934a68d13400f7f1e05f35c3369f9140c4 | ORPH
loongarch64  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f542c24224348d4e556025ac6f341d380af62731 | ORPH
  sparc64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/f11b0b9154e9979f3f2d7ea84a019f7719565e8f | ORPH
loongarch64  |  dovecot-pigeonhole-0.5.21.1   | NOK | https://autobuild.buildroot.org/results/089a75fd718ef769faec25e33dd98150f4394e47 |     
    m68k     |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/dbd2252edf0f01e72420f148c3dc9cd826c2314d |     
 microblaze  |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/b6fa2dd33da835ffe8f1970d6417c4923fb83979 | ORPH
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e48ffb13409d554cd62919b7774061ef44775689 |     
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/1c18b36ed3d8134e920f15961fd7b620211c5644 |     
    arc      |           frr-10.4.1           | NOK | https://autobuild.buildroot.org/results/550343425d769d906d43ea349339bf4a96d3634a |     
loongarch64  |           gawk-5.3.2           | NOK | https://autobuild.buildroot.org/results/51291ad94ade0f81fc5c11ce3786cd2ffb59b082 | ORPH
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7328962e4c72d7dd17c1190b0aae91ebc4a67009 | ORPH
   arceb     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/447a614ab6f84b9880d0afc7ac262b81817644ea |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/affa7c5ce632362e6583f73b89d9383ca8a32ddf |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/40aafcb98ca145d921c0d04574ffa4962f13207e | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/df1b26a3f544b425404e695653c4beba0d3267e7 |     
  riscv64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/0718df1bde33aa07fc83cae5257e730e00707d8e |     
   armeb     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/297bbe455b9a2997885363a5acfb8e05439e4d0c | ORPH
loongarch64  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7af763785fa0860d3aba4df37c7360ee09b953e9 | ORPH
   armeb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6753fd198f1bce5636fb4e033e528ed95c18e043 | ORPH
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0626797d164945f80259084e7ae00b1426cebea2 |     
    or1k     |        json-glib-1.10.8        | NOK | https://autobuild.buildroot.org/results/3f8ab8e85a63b271400bca0414277f2a3d1a12c1 | ORPH
loongarch64  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/beaf83479d4c1036d2e12a39404f2e68e983420b |     
    arm      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/c6c3629d82d31fa1387382b28fbdae25f299aca0 |     
   sparc     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/7c47ad1b3974174ead61f623ef63a27395d364c2 |     
    arc      |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/d8255ddf696b02da3026805e0f1c84f06c5f8b15 |     
    i586     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/11f14eb47c6e66504dafebc0ec6c9994eecc8373 |     
powerpc64le  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/c6e3111f501f50c61cb436dce930dc722e8bc88f |     
   mips64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/d9b5c8d552417c975a0cb3edea8f8b6b15d7b262 |     
   mips64    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/203f74aa399c2881badc02e6da48851bd2841b3d |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/fcf534ec642761834af74de9bff9d74da3eeb3a8 |     
    m68k     |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/d4bc901bca1b9960cf7b13b855c46bff2bdcbd16 |     
   arceb     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/3b0677dc78cacf767720ea5f36df8ada1a2b64b1 | ORPH
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e566366feedcc15f104225b311df936e8dee8ccd |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e168f925b56887f5beb28a27b7a8f67f1aa44aa3 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e7a80222b6eab6b96507ee0cd934ba180e0d8f48 |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/91958e4f5119a1c5a9c8a401ec70df19f8b39aa3 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e407a780be7f80e2bbd89b83a5bb4d85bacb7a91 | ORPH
microblazeel |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/60bdfdb37b8584e8286007a2d1faf84b7778989a | ORPH
   s390x     |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/b0dd31691f087817e4d1cc6f96a4e114ff8010a4 | ORPH
 powerpc64   |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/eb5d35cb1aabed42c029eb4ff12e55dfb1c8bbb4 | ORPH
  sparc64    |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/6e610eb3e8c91b25aa57c4701b04d64d4452b4e0 | ORPH
   mips64    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/9a21f90b2c6753a2b7904786d8e23512ee387b77 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/e6df73269dd545b39a752da80123dd53b79f1551 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b40674d8fdee902fa0bee56e0095a621bb811d5c |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1d58fc980f0b6dc56a99fb210e3636aa75569917 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f7e7b5f9e238e039309b1be9455e1613d42b951b |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b716b90ee87eb0cb77905e1a4d8f966a33370602 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a7f578a439eb8c294e9baa8dc61d99324806dd4e |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/04b49d9732a4eef56c317ad57c4f8ec8a4dbbd62 |     
   mipsel    |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/18bc53911cf9b898e1d210f00aa9280bda6bc463 |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/0170cc076a87f1a4c4da3ae4f8e5447dfb3d0e5b |     
   s390x     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/65d9ce1debbdcfbf284a99cbed16f747047c819b |     
powerpc64le  |         opencv3-3.4.20         | NOK | https://autobuild.buildroot.org/results/7abc08b070fa2236e2fb4f574f9e0889ee02dedc | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/2596cdb831d43b141c578fe110b562019a527f94 | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b2e7a66392bc2b930c7c2424548b185b7f467eea | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/b5e1fca243bf055755a752d95dc62b2c8e948bfc | ORPH
  riscv64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/db5cb3efc17006260b156436c2d3d01652082f57 | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/4c6a1e1e0009d0a0e3f1571184f10d2e6a77b67a | ORPH
   armeb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/9fd30daed996b485efb393cac503bd97e076cb26 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/b356a25e7693d07465063305b942ad9398c6f31f | ORPH
    mips     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/0563153966bc217c9e0f69dbecf15fb8905a0a81 | ORPH
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/deb54414fd241a552e49fad6a19495bef16db4b7 |     
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/24b357a7e75f668f0fe979a5f281ce041bd72edd |     
  aarch64    |         procs-0.14.10          | NOK | https://autobuild.buildroot.org/results/5265837ac786722093220fd537992fce91524454 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/acbc52358fbd0e032452cdbcd248351ef5ecf55a |     
powerpc64le  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/4a05fc7eb0756150a3ff32d26caafc5f3b8b2717 |     
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/c26b197a075f72bdfe355e88603a6682ca2547de | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/5850f82e55fd5c1707c4c1f546cd40bbe0c62d43 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/d4cbb7e28d70178d42350bf197b4d227605066ef |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/085b46c777dcce6699419f60863296c5ef3b3b2d |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/504fc025296ea724c24dad9bc72a5937400ac63c |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f0851e0376a575b601cf7256465bae342f94c857 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b3f50d3b01c8dbcd0f7c73301ff02f2a3f1b8148 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/33c6415a1ffe4f8253cda057834b754214cf77fa |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/51b32beaa1c0b19a76fba65aa636419398493b25 |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/4ec70ebdb99b69387dd8b5268547a589f458e9b4 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               asterisk-22.3.0 | 1 
                   cvs-1.12.13 | 1 
                 libgee-0.20.6 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
                 logsurfer-1.8 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/a4f358f1fb2bfb01f1b4608ce595cf9025ee8bc7 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/69b0472e26cda2f8202506ea23910eade56278f4 | ORPH
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/aab231bcdc66430b0501027423ebcf5ffa65a66a |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/da3708ede0ec97e1e9e548600b7e56402f131e02 |     
  riscv32    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/300cc7be81812106791f73e68bb0e2426a0f9b34 |     
   mipsel    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/c5742fc80fd61c85ede729f79956f67fe3e6abae |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                   dante-1.4.4 | 1 
     libphidget-2.1.9.20190409 | 1 
                 linux-6.12.55 | 1 
                   perl-5.40.2 | 1 
                setserial-2.17 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a19456c58f2dab231eb119ec3f9d68c6eca1d3fd | ORPH
    m68k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3051b25ae298b60af993559425aa7443b6ba27ef | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/60277e01d5c970d998f86fb2d1a1ad1839a8858d |     
  mips64el   |         linux-6.12.55          | NOK | https://autobuild.buildroot.org/results/7929afa8fdd4950b5e967ed2b3a55f59052fdd6a | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5c77afd480e4b64b70b25159a459b90258ca3ae0 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/b8379333f5973816143ea6ed0d1107ef8f03291d | ORPH
    m68k     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/4ac864ac35b10dc0f673e252ed7adcf7ca4090c6 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/cc2de10b889dfff790cc605e91960afeae9ceb8f | ORPH


Gitlab CI results for 2025-11-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/12039682762 | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/12039677417 |      
     TestPythonPy3Fastapi | https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402595 |      
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402546 |      
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402542 |      
              TestOpenOCD | https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402518 |      
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402515 |      
              TestMariaDB | https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402485 |      
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402355 |      
     TestFirewalldSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402353 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
