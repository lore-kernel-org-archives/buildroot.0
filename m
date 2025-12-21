Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C9DE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 06:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E460960A61;
	Sun, 21 Dec 2025 06:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXGoMOFlSBql; Sun, 21 Dec 2025 06:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E5960E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766297423;
	bh=DNccGhLWWQTpvLlKeMB/jPgdYGwFNA9EDQY7nxs6yDM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iu0CgfmyuQYdkC/x5Ny4z0VWPswe8onxHEVTBFw7Pc2j8Kj9Bl/cF133w/1yGzpcs
	 pneYgnYta+3LAhO+WQRhNoqL81niGH4rbsxwXoPLc6m0kyJ0dXkTHAMAOsuuQ6TCQn
	 TlHsVhX4aCzdv+jKRcGAHeJaKITq0KPV1/eW8CZf6PIylodCMDV4EL34FL3168arSz
	 YqLPZdxuz4fOGeMTQkxbUcETmWX5YGN4/VYJ/ESpVLDo/IYiBlPiXtED1d7waA2gZK
	 mAftaxAB20YH90jW0/kAw0efjVbbJjO+nTylsBeZAO7nkTn5QnJLuNlfG2/1LRT+0r
	 La6O340ndmtHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E5960E0A;
	Sun, 21 Dec 2025 06:10:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55E561A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 06:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4743060E0A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 06:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5c8_JAjK87n for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 06:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41D4460A61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D4460A61
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41D4460A61
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 06:10:17 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-64b81ec3701so4055153a12.1
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766297416; x=1766902216;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+SxLZfUmtQgDVPF0KKPA9n262cThX8Vyv55bHjNb08=;
 b=opFEctuPcFOKaBhSgCESDQ/LJNxAjUApmNcHam38IkqiVyZavisraKle9CmbhlE6iL
 PFu5zaaZUPnArn50kUbJiP0GLwlbO0Ukp5Lrd+UA3CobF9/GpY1lCUgvMCVrs5pwwJy9
 +t2WVhkXSyUUvtQ/zfQeo8jdxY7a/PEDkEEycOTSZYgdNa04nH2hXI44e9f2jHgO8hHk
 IvJqc8DXd2I/3eVNt1Debg5OteS2H28tY8XG4Icmpj6H1v9zOsQ3A7sAmbW+jevUJn/a
 Z2BdDO9XZis3bGMAxroNvEN7Sk1HgAzbqfNuXkTnqUEd4WCNYrTz4ssYgCvLBs5tbtc7
 AGcA==
X-Gm-Message-State: AOJu0YyrJA1NDQdORK7wOZ+ncAXllap3+rI7lxwNhG7Kpqxudhs1A3dD
 0tLOj6Xi47rh6+gCacyfI8XbGEKWqB4IGR65NuXYzVi5GkGpw1yINPozRXIgwQ==
X-Gm-Gg: AY/fxX4378y+SlbTMXpo+/3m0YFN6PlquqADSMfDL7RkgHrXMV5+V69A+H+shkNiDeB
 qUGYtwi9SEpL/EfKyhFZP3WePnJhhAa+2gG1XCmMpyvoPliy1savpJ8AwPO8lXrG6nza+c6R0Vz
 f0/Kyg+WBhMDlQmOsnjBjfXU7rLFjw8s+hI8G9CJUaRbPR9CpBtcmUIb9S8rLC6sIOfXBWDuHLb
 MDEmrFYvmbqG9ASCsdKwSMBOxNKjrAq3Zm5gRSo2ch94SgeGpHHVWMnByXuYdk6San7BiL0aoN5
 qB8q9LezsLeCdmuMzlFNB5Lm9vNEV/x+xqBm6wMmHiBy5hpXihJmQC/Ra8WRHBlarCIZAbjPL5H
 P5g1Q04CbrY52vkK60t5OUlR3Ci5Zm4Blu4Md9cUr4XrtlrhKFyKfsgpuBlHXGLfh6HqIFgavrb
 GsVQtxUomHkFzfYWieQw==
X-Google-Smtp-Source: AGHT+IGCLFSFEmS3rm6ItTtNr9/OEGWxt/TKLQiXnuigCgQoLmd5azg2JULGwM2OGurLOPvGLA97BQ==
X-Received: by 2002:a05:6000:2c06:b0:431:1ae:a3be with SMTP id
 ffacd0b85a97d-4324e4bf93bmr7339272f8f.3.1766290683827; 
 Sat, 20 Dec 2025 20:18:03 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1aef7sm14206979f8f.7.2025.12.20.20.18.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 20:18:03 -0800 (PST)
Message-ID: <694774fb.050a0220.99314.d33b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 21 Dec 2025 04:18:03 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766297416; x=1766902216; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h+SxLZfUmtQgDVPF0KKPA9n262cThX8Vyv55bHjNb08=;
 b=nLE34ES0FZT95fwPNFC9XiECB0trE4zEuOQjoZY71kNyLFKwVLXEgambKopa2GrCsh
 gm0Y+jaJwKkg4Dp9dIJjExprf0e5Wd2R3xObOVeDad0KROWCrzTlXj8Qa/4ZbpvfsIfs
 97RDBPS+b3GPSdFUklEIVoOwpEm3Rr5+s0AKYwI4hfCbdR7vyKKk0KI9x9oaT8sHQfxx
 1repYE3XZaXc0KSKe+v5tv51rQOvKPaLuymd4C6AUWT/yhCGIXlpvvO7OQzYY9NTjTxL
 8HwBYvK1nCnK9GtOVwOHby782JvNGFtRxB1kkNByrMmkeLL3sTc5kOVtyW0qaG6dsfnf
 oKeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nLE34ES0
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-20
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

Autobuild statistics for 2025-12-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 30  | 84  |  0  | 114 |
  2025.11.x  |  9  | 30  |  0  | 39  |
    master   | 73  | 240 |  1  | 314 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.9 | 33
                libselinux-3.9 | 30
                       cfm-0.3 | 12
                libcuefile-475 | 10
                       unknown | 10
                 jasper-2.0.33 | 7 
                 libiqrf-0.1.2 | 7 
                  libcgi-1.3.0 | 6 
                   cvs-1.12.13 | 5 
                    rtty-8.1.2 | 4 
             berkeleydb-5.3.28 | 3 
glibc-2.42-3-gbc13db7393773... | 3 
  gobject-introspection-1.84.0 | 3 
              libopenssl-3.6.0 | 3 
                  libsvg-0.1.4 | 3 
                 libuwsc-3.3.5 | 3 
               linux-pam-1.6.1 | 3 
                    mpir-3.0.0 | 3 
               nfs-utils-2.8.4 | 3 
                   cppdb-0.3.1 | 2 
             dahdi-linux-3.3.0 | 2 
               graphene-1.10.8 | 2 
    host-mender-artifact-4.2.0 | 2 
              host-rust-1.88.0 | 2 
                  iozone-3.508 | 2 
     libphidget-2.1.9.20190409 | 2 
linux-serial-test-bf865c37c... | 2 
        ltp-testsuite-20250530 | 2 
                netdata-1.37.1 | 2 
odhcp6c-53f07e90b7f1da69771... | 2 
                openobex-1.7.2 | 2 
                openssh-10.2p1 | 2 
                   perl-5.42.0 | 2 
          sane-airscan-0.99.33 | 2 
uclibc-ng-test-132c6134d691... | 2 
alure-14beed2a86d5a36030e90... | 1 
                 apitrace-13.0 | 1 
                apr-util-1.6.3 | 1 
                      atf-0.23 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             batman-adv-2025.4 | 1 
                  boinc-7.20.2 | 1 
               bpftrace-0.24.2 | 1 
                  brotli-1.2.0 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
                 civetweb-1.16 | 1 
            cppcms-2.0.0-beta2 | 1 
          dfu-programmer-1.1.0 | 1 
           dialog-1.3-20251001 | 1 
             drbd-utils-9.21.4 | 1 
                easydbus-0.1.0 | 1 
                espflash-4.0.1 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.3 | 1 
                      fio-3.41 | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
                 gerbera-2.6.1 | 1 
         gobject-introspection | 1 
             hawktracer-0.11.0 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
               iproute2-6.17.0 | 1 
kvmtool-1117dbc8ceb21abc6e8... | 1 
           let-me-create-1.5.2 | 1 
libcorrect-f5a28c74fba7a997... | 1 
libdill-32d0e8b733416208e04... | 1 
               libevdev-1.13.5 | 1 
libfutils-c326ce0cc2a735438... | 1 
              libmhash-0.9.9.9 | 1 
            libxkbcommon-1.9.2 | 1 
                  linux-6.18.2 | 1 
                   linux-tools | 1 
                   lsof-4.99.4 | 1 
                memtest86-7.20 | 1 
                   nanomsg-1.2 | 1 
                    ne10-1.2.1 | 1 
neon-2-sse-097a5ecacd527d5b... | 1 
                 nethogs-0.8.8 | 1 
                 open-lldp-1.1 | 1 
               openblas-0.3.30 | 1 
                    php-8.4.16 | 1 
         s6-linux-init-1.1.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
      softether-4.30-9700-beta | 1 
              swupdate-2025.05 | 1 
toolchain-external-bootlin-... | 1 
               trousers-0.3.15 | 1 
           uboot-tools-2025.10 | 1 
ustream-ssl-68d09243b6fd447... | 1 
        wireless_tools-30.pre9 | 1 
               zziplib-0.13.74 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      | alure-14beed2a86d5a36030e90... | NOK | https://autobuild.buildroot.org/results/f63368d444e9e26d1fdeb5be2362dcb4ed2dec4e |     
    or1k     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/864dd81512c4936eb12efc236c238ef3fdb8a374 |     
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/96802216ff1d91b7e201e668fe712a8d17fd4d87 |     
   mips64    |            atf-0.23            | NOK | https://autobuild.buildroot.org/results/8bf83eb1427b2e60a1ff09fff1fef36f95adeaae |     
  sparc64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/6e7a535227bc8d1372a5417baaace9df2b524462 |     
    arc      |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/21a12c67713b2b1cfbf7ab3aa1332a4fcf0f38af |     
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/1c8b64b5b9f10434a3f2ed61865668a55fdff873 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/3f82929e6de1993e93de62ef990b8990523a6e01 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/8aa1640ab89ee071c72aff91471640fba5b94cec | ORPH
    mips     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/d7845a09f07d9694ec6a80a440606353757491e1 |     
   x86_64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/8f7ce88a070e825ef178275a13d969349f05593b |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/4678a113ff1a28b80265e18cdc902ae6af8d4982 |     
    i686     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e0ffe3abf331da41eb62e9d16a25f11dda79d070 | ORPH
   mips64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/caf3fd03066004ca80a66f136e2d089b76aaa81c |     
    mips     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/579c00b183872341e0cb3cc7a51deeed730e4f9d | ORPH
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d7e9aaa7bf98799d7669d75ba9b1fc879b59e64e |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/a7bbafa5e8b3805f29d836ef347f825702f429e5 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/d46004fd3117138b6a3040fc05d99002d32e5c45 |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/58475d87cb64cc691788e7f706729403d9bfdbb9 |     
  riscv32    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/3e682e4dfba5ae6c24b0428f402a0890ba67115c |     
   x86_64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8015d392c95645157ca2fc4ce20cb85fa5826c2a |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/c087374104238c8ab23b859590931e1b8099d24a |     
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/22a390c31bffbcadb64c9dd0c07193aaef5abc08 |     
    arm      |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/efaf353d5fda1b09c8fbabf882215cfe0a4b33f3 |     
powerpc64le  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/08c63781d6a9181c78aa3d6cd4a3c5dbf607f489 |     
   mips64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6512c848b2a5604028a8b5315c97f552006b6a07 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/df26f2cc923d5a9fbff7d4cbf59b333c59b99de3 |     
  powerpc    |         civetweb-1.16          | NOK | https://autobuild.buildroot.org/results/07af894222e5a2e22e8a3524fb6772b95bfc5054 | ORPH
powerpc64le  |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/a01acd759d348b0f716f22fb08bf65ae976185ae | ORPH
    or1k     |          cppdb-0.3.1           | NOK | https://autobuild.buildroot.org/results/db9a706499b6adcbabbb00e3c0b475ec064754fe | ORPH
microblazeel |          cppdb-0.3.1           | NOK | https://autobuild.buildroot.org/results/f66799a28c2c30d847f14fa4505d29c37163a9e9 | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b14bebfeaaf6360f8e49974b7d2d157a8d8af3bd | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/df5b2e3d6efca2319ce506379e88436c2228325b | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a8fb0276ab895ccc120889d796081aee48e1577f | ORPH
    i586     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2cf6ba5374ca7bb4690f3910bd04aa5cfda95490 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/028bcf5a855404eda4b288ac8e0c2c203818e8cf | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8327d503a5632d9d793349b7db679c64106ea541 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ed202035e546fd0d7874a2b5fe5e6529f9817be2 | ORPH
 microblaze  |      dfu-programmer-1.1.0      | NOK | https://autobuild.buildroot.org/results/b4d2e0a063a09c728d80badc2ee2678425da9394 |     
  powerpc    |      dialog-1.3-20251001       | NOK | https://autobuild.buildroot.org/results/a668e39f913b6e1bada858a37e029361dde0a257 | ORPH
microblazeel |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/9d61b92f4fde3fcec560f32d69100d84116026df |     
   x86_64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/812eb955664ad1df2942863530f11bf0256b090d |     
  powerpc    |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/1bb135244d586dc8f4b3d46f9b0ca0ea4e6305ef |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/c185a35bf2c348c221e709757ab17aba3c6e2c51 | ORPH
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/f4f0ae6d11a57961db109ffd2c561de6b9e4558d |     
powerpc64le  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e5eb31bedef9c5373b91b0a5cf0292c0bd1c3e01 |     
    mips     | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/51365593ad059325e1164d36fff06905d1c6e8af | ORPH
 microblaze  |         gerbera-2.6.1          | NOK | https://autobuild.buildroot.org/results/71bfc036d9d2130e1c51d9555d4b6293554979c1 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/1696f7b58011ce8d9f44fd92ae038298b8e45c9c |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/30a85ffd82f242cdd8d99fc6f242191cb9b2717c |     
  mips64el   | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/1be9a46fda3c2bf21ff8754abf5d9f9e8826fb26 |     
   armeb     |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/4fd07a47a244891b3469ef98a3533734bc4d4289 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f60594d3ad1541312f5b6f70db48193b17a6c9a9 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b309059f39fbbf0ddc3e1d8b2b8942aff616e9b5 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d1517a9b820259eb90f86dad5f0603b9303e3932 | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/be33ba9843b301adc1f0803debb97305699e969a |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/8ba42f4982b88138989d913ca4b1834ed58ae278 |     
   mips64    |       hawktracer-0.11.0        | NOK | https://autobuild.buildroot.org/results/1da7e6378052f289b3704dd896146b80985b10a3 |     
    or1k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/44cd2ac4f66aeee0491ee99774981ca33156f297 |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/397427c9ed3d6363914f3a1a7d9ff8cbaec8c0c3 |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/3c08b27024997aab748adcbbf1a867ff3e3f5e4d |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/fa9bc9b2c8bc0052523c3a10a610d6a5fe355014 |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7d205057ea1f40c2161b6ebab0508c6963e0a1e6 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7477313862d604d7049727bf0ea52590e9f8b7f6 |     
    m68k     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/fbc4c91da07edd76f4c35474ed01960995f4f00c |     
  riscv32    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f94df2fb6687634df91c52b5bdad1687efd03ab5 |     
 aarch64_be  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7119959a9454650e9e99fc57527105c00aeddef9 |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/2c6b02a845fbc93e97ce987f8d640112cdedd81c |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/426b865ade54da4a04ef4201bbd7e877272cd9a4 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/b2bc442849157e5d055bb68604660266049cffe5 |     
  aarch64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/a0d85c6ba057d53acaa88791cd3a07c542417b0a |     
    i686     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/b420bd9e72f4de334deb20e575389bafc00d71ec |     
   sparc     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/13308d9f2abde22b7e6f3f3ae69a651ef22a80f4 |     
    sh4a     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/864ba765b1f5f3d36b5c56c48655169fcfecfbab |     
 microblaze  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/62fb7034f73be9ae1f2a51aafb3075f9c616a2ea |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/88c5503ace96737211000b95ad0e937140314369 |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/cd00002bb805447f79ee6116b374a48e554292e5 |     
    arm      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/375a2ac3a051668d9b5692782cff1b180d036fa7 |     
 powerpc64   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/490ae887799a221d610903adf4f30dbf3562543f |     
   sh4aeb    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/f1905fde7b9b58d45b3dabf01495d5e0af8f467f |     
   sparc     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/e25f1c48e89b3b2d68b841dc3fc8d3fe8ca0633f |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/6cfe904f74305992316ea34c3122b0e11cbc11bc |     
    arc      |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/0ab519ae4f1b5139a850c0085013c2d7d1727c9e |     
    mips     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/268fa1ed475381d653160846c7efb67b682263e1 |     
   armeb     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/33544d5536b5af608907b957210aa148a7b6aa17 |     
  sparc64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/49e39fd65a09536bc9b6cc4eed1ee1ae7edbdd04 |     
microblazeel |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/7037dae69a67e4e132e7318917d17d4e34d7c782 |     
  mips64el   |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/d1845a792527969d1d0cf30b4905cb6a9d5a5e71 |     
   s390x     |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/c68c3bd98c27b1ab5b40dec671b51c4239708db9 |     
 aarch64_be  |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/43955279ab3bef4d862f6f78111bcae6562ff8e5 |     
   mips64    |      host-libselinux-3.9       | NOK | https://autobuild.buildroot.org/results/ff214801383132166175992270bc8cf2c6176178 |     
   x86_64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/2c79887747aadc13b09f0458151dc031f750713d |     
powerpc64le  |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/5d90aa5dd0ec5c9cf9244ee9c8e3f218628871f1 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/cdce5b3c6c9802ea70fff033461f446e074151bf |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/91cd80a8d669e599fe52496786326bbb94b9b2a9 |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/bf766466f60daa4db46340636ad5cbbe469b0e83 | ORPH
   sparc     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a2ce747a6fc4dfbe304dd6da8d276a405c8b8891 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/50636f43e30aebdb1b82e3f70b131fd72dcd0523 |     
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/577d59a7fcb558aad90a4726af29b8fe808b1197 |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/6533929a1aa873839631cba8e9e779a1f54e2715 |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6b1044fe87678bc42ef9c8eec248ac5b399faab6 |     
   mips64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/22e90bf420237b3dc8804555f802e6145b1b1937 |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8c6fd7c3cf4b20cc40b5cf882b57215172f48e47 |     
loongarch64  |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8ad219ea0cd53b1ff32050bf90ef9e27cd3867e6 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/eba20906b87ace52204b825a548ac204fa3c0ae8 |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8796f71d91a0b71624d2d0e9848d624cfe44beaf |     
    or1k     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/d004d60cc9b27312a6ff7fd58dcdac635f49cb5b |     
    arm      | kvmtool-1117dbc8ceb21abc6e8... | NOK | https://autobuild.buildroot.org/results/63984d95d29bb8c08339048fb970609f73701627 | ORPH
  aarch64    |      let-me-create-1.5.2       | NOK | https://autobuild.buildroot.org/results/d10395ae1b1002f29a4e45e221ce3d6de716852d |     
  mips64el   |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/225b9be12455dee4bba0f4c7b5a7c91d35d1863d | ORPH
powerpc64le  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/a900f3f0c8c11d9dde5858dda863c5544dc3d149 | ORPH
  powerpc    |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/b15e6b8cb04ce99f16613cb30690924498eac83f | ORPH
 microblaze  |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/64f57d2c2992226957e4c131c117fc95785e82b6 | ORPH
   armeb     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/1467b653bee9522cde07b1f544760aa4d595000e | ORPH
   s390x     |          libcgi-1.3.0          | NOK | https://autobuild.buildroot.org/results/0d5482a6f8147763e584c30b9cd23cb62abe7a29 | ORPH
   mipsel    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/b5b536dd8e10294a8971b5276db7800e5c01f97c |     
 aarch64_be  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/4302514c2a480c130bf692a196aaef8cf2dfc953 | ORPH
    mips     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/301453a29a625790cf6a6d927e9fd6777c7b08df | ORPH
powerpc64le  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/c8ed11281aceb096fc3719d1d4eb677ebf5308ba | ORPH
  sparc64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/64c84d92210ea05da99aaf6a314d61709b28eb39 | ORPH
powerpc64le  |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/48c0856285805a1e14355e50b9378641417f265b | ORPH
 powerpc64   |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/96256e221401be25c0aa401ca5fe21d6ff1cf641 | ORPH
   mips64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/309b10cb13af74c6cd5f312f2a127b81959530b0 | ORPH
    m68k     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/f6d3a82e78689efacd8c1aa209f348a05b5bf269 | ORPH
   armeb     |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/587f21e9e3121432570df8dba5c7083192604df6 | ORPH
  riscv64    |         libcuefile-475         | NOK | https://autobuild.buildroot.org/results/332edf283dda34edfb80bfce7799e076f93822e1 | ORPH
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/d2818200024c63b38473b0306526aca78d1d846c |     
microblazeel |        libevdev-1.13.5         | NOK | https://autobuild.buildroot.org/results/059ceaeeba444b7b90688dd54680b677e781ebd7 |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/890472bd6f3a398770e8b647aeedc00f789ff133 |     
   mipsel    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/ccd498bcd0d5c8e008c08ba7bd9a69adb558a916 | ORPH
    arm      |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/2dd7292adb7606f6a5ac3ae3a6b086753bc0b82c | ORPH
   s390x     |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/9734d450c2557a9a383fa06965b8e4ed4aa6ecd2 | ORPH
 aarch64_be  |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/7be2704a3b50accb11792a64ed6d4f6b9ebb03b8 | ORPH
  aarch64    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/c33e91585398f44027d90c841ad043863f623a46 | ORPH
  aarch64    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/a1ea947b65aa16c7a51e9757057129687ac92ff9 | ORPH
  aarch64    |         libiqrf-0.1.2          | NOK | https://autobuild.buildroot.org/results/e3f36b77ef062df2cc2f3c4c86caf79e225dacf2 | ORPH
    arm      |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/7676e8ef081c447663691707118547044cf25f2e | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/5cf699964c441a10e2bfb41e8b8d8c97555d8635 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/dff955933b6659e3ff33696e20cba73812e1974d | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/aec43394cef5593ddb04850c986a43cd446bbf17 | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/018c140afa165d41e74bd9ec0b19e1dd74be303d |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/5788f8dfc2647dac25fa00eb95c4f269af5642ba |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/0afde86f97d4fd801420bc1f29dcdfb104997885 |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/6777af34bd2f3f5bf9e4d5f9584efe4f54710472 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/74941e243342ad23ebcd4c62f5d43bf42f4b408e |     
    arc      |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/8f463e2ef610f0036728bc84f9c3fafa453227cc |     
loongarch64  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/87fefe0b38217773dc81b56d3103e46a6f3946de |     
 microblaze  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/085e4cc958dd25278ccc4f25ae86187cef091e82 |     
microblazeel |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/01d6f92444a9a0441ad0862849b6917465a1297e |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9d16d971a5eb9043fbd7dac8facdc29700d1f7f5 |     
  sparc64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/09d942e1db66a15828093722bc3a718536289ec8 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e2592720241aa22a9902455d1c099bfecd078191 |     
   x86_64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/226311750a4f5b8112d7d0872ae1b8935662bb1f |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/515ee0d0c1b0d9dbd62b8c9424dfcadb028b3929 |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c39d6a06e090510c42a986c9427a95b32ec95cec |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/2b84389e8e2227df4ee30c8537c9f6943c7158d5 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/60abc8fa89077aa92b9011e4348d88b86c1550ff |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/147a0fdb9fd90f9575569985c4020e83e5d9cda7 |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/9f6e056d03afe0143ebcd12b3c82c2762c988b89 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f7d9c29e5e99b95175a4564b68e588d83f8185a6 |     
   mipsel    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/697ca3659e185658e3a74f99016aeba7881333bf |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/e10e3acf419aa640e6387c0d6b0f4c2c59cd1785 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/24f3b3c8b4fa04a822d471989b863fc94788b9f3 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/1a51eb3f8eaaf2b7f77d15933e98151f1f7ab90e |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/59f27cb99515e487296dfb3e09b880e508be1ec9 |     
   sh4aeb    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/46dd633973601062850d4561ed17f8f641c50d9e |     
   s390x     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/70d539474f445dd102684f8dc660616b0d705d16 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/c016e9225e91375cfb72a99d6179ec807513712f |     
 aarch64_be  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/89cc0cc649d4316573669111d87b080c399e6304 |     
    or1k     |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/5cb18d75e65171587897a26e918e89784c30b03a |     
powerpc64le  |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/7126eef1380c6f795b1f04d44bfa6b4ebc9d4f13 |     
 powerpc64   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/bd7d9389e7c74ffdd090c97d4ce768e9d55e2978 |     
   mips64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/375805fe07bc2afb45898f518eefc8d0c2e83aab |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/4ac560c34c65df0c98c560646b4aa31de0a42d50 |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/ba683fb6bf17bbeb3da66d5f74838eb4117dd7c7 |     
 microblaze  |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/e33dc499a2222c27c2ec16427f7403420b8f9757 |     
   sh4aeb    |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/abe80a506aeb0799805f19b1ba7562024a3bc395 |     
    arm      |         libuwsc-3.3.5          | NOK | https://autobuild.buildroot.org/results/a9d9622c25e9338c6c40753bfeaf783cf1df2892 |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/1529ea80dec18830114dfed55dad70f9d51c6e8c |     
loongarch64  |          linux-6.18.2          | NOK | https://autobuild.buildroot.org/results/39b68a901aff1c5b70ccb3e3afcc594f7d889b88 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ff97656fcafd814574dec7519422ab0242efae52 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/73800f552bc5ba913b59b7d085a174d311cdf893 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/58418f285af9811234de4495013191051ff19546 | ORPH
   mipsel    | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/d6eef15a0c18c402c566d1d832ab0703870c26fe |     
 powerpc64   | linux-serial-test-bf865c37c... | NOK | https://autobuild.buildroot.org/results/eb55ac55a47407d3b4a112ed05f3717c6e2e163d |     
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a2dbff58a232c8aae49eee7a43f8774a81f466cb | ORPH
   sparc     |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/86e93d40f37cd3d31b956288289cb47823146ad3 | ORPH
   armeb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/ffe59c79884c1f6acfd3a68c323cbf1f15577302 |     
 microblaze  |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/3a9940630ffc5082b1b5be2ea9777f4dd9673d02 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/bda26530f56e18f9164b161bad1a75fcf566d010 |     
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b0fd051d573cdfdb80f7dc10c96eec5a5aea9911 |     
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d0b223737182b8958357bf46d98787bd9ad0f775 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/698fb08c8263cd8a1b9be310268e1be8fd122232 |     
   x86_64    |          nanomsg-1.2           | NOK | https://autobuild.buildroot.org/results/714aae5a035ed66ed9450ba12c1817dd2bfa0e55 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/2056e676755284a4e7fbd2f4eb2aa74bfd5aae94 |     
   armeb     | neon-2-sse-097a5ecacd527d5b... | NOK | https://autobuild.buildroot.org/results/d78a79b64e2c9f3beeca24578d3cb8409ff3183a |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c75372fefc2ff48da99eae8046bf61b52b140adf |     
   mips64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/fe0f3267f70e73c900d40eee72c36ab4a427d9b8 |     
  aarch64    |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/eea5023d2732e6b8c1be0e3f4e5d9b28954f0a60 |     
    i586     |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/1e3cadf940aea61b38531495f456f639388c4ae7 |     
    arc      |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/6c492b5c7663ba0168e763b0ffc0f42c67cd7711 |     
  aarch64    |        nfs-utils-2.8.4         | NOK | https://autobuild.buildroot.org/results/b46ef3ed19d90b0b236a7bcf4759cea58dc24e46 |     
    or1k     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/b1ba87862a808df11d69e91fee55b09bc690e49d |     
   s390x     | odhcp6c-53f07e90b7f1da69771... | NOK | https://autobuild.buildroot.org/results/90b08e446a8d9b313bb8c0c40224503c2cb0deab |     
   armeb     |         open-lldp-1.1          | NOK | https://autobuild.buildroot.org/results/f08cb769d9c830098a5e1557321b8b5ef613a13a |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/370bda69d3d9e4fb439c4d74a1f08f51d0d9e2dd |     
   mips64    |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/a98b8bbe733ac4086fecd8d257e56e62dbfd7a68 | ORPH
    m68k     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/3ed4c951a980b3230cabb40794aff0bb56770832 | ORPH
 aarch64_be  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/ab73e63ad552b6775d4db6590e2ed686e6e7b875 | ORPH
    mips     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/c9b304b99733daea99394ae1f5ce62a31541f653 | ORPH
  powerpc    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/783a0e46f9baad9705748f98a7e18e6bf592e7b7 |     
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b1ff1fe76ad339c9929f07d715581d8435f784d6 |     
   sh4eb     |           php-8.4.16           | NOK | https://autobuild.buildroot.org/results/0e243b92a0f847a0971a5a3870fd2aff2c2fe13e |     
   armeb     |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/12abd1151ab76fb1f02f601d71d33c94b1b9cf72 |     
   s390x     |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/5703500f1d929ee1ceb911242e99efa9be0c842c |     
loongarch64  |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/2534c8f6b8834d11935c1359241b90e4049bea1b |     
 aarch64_be  |           rtty-8.1.2           | NOK | https://autobuild.buildroot.org/results/615ec71280703add6a846bc824069ea7df194260 |     
   mipsel    |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/0f73d97f54a5e86b3d5477219fc1022ab496b588 |     
   sparc     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/28924c30974b89e33b2151d4e9b6796b13d66a34 |     
   mipsel    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/bf850d7d58a504bb5fb7f6dabe7204033e0582d8 |     
 aarch64_be  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/8651bceab7cfaed2e9f6ac68ecf32d00075b0ce1 |     
  aarch64    |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/87736b96593912014ae79dd16a14b16ca72d0101 | ORPH
    arm      |        swupdate-2025.05        | NOK | https://autobuild.buildroot.org/results/27a5ba4210e4eb09c5bb200913649606131fd6df |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/3cedd2d2f3390b980617b9359f604e2425de5cd3 | ORPH
    m68k     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/4f41923467b995134be430aac458f4de77e328e5 |     
   sparc     |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/93cc5e0ecc0f63f39fa458335974d7117830dad8 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/9f94d81ec95fd19ad7511b4eb1ec98b406638e57 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/fba449bf87c11620f24ebecb4b99616edcecaf4a |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/13e1a8a37705bbea43534759535aef85eaf49188 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/9bdf53181e5db7223f4b8954c23ebf723b315ade |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/cba8c460b61f98ba9412c63841e6912aaf3e2f52 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6265c76176548af9f7a64ea04cdf2e0f6a1c0648 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/6c409cc86dde76b73b570605a8968fb0f73550ee |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c94c3bdf9838482cf0701b1ac32d3c9cb4421426 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5a2a5322729174173e71e8a7ca012ef2eccd5c4f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/32591d254ff84b5d32f2a9618a20bdc5966834d5 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/3ed979125bb46919c82df57a22afc5f061c74ad6 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/cc17b96ff5649a5fc7d6afc342abd9a8fa0a1e4f |     
  mips64el   | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/4a44c5f775efb6558b2de831fb927e6fea456b61 | ORPH
    mips     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/fe6644d1733adf9b7a2f20428b0fe8276a4b50ee |     
  sparc64    |        zziplib-0.13.74         | NOK | https://autobuild.buildroot.org/results/28811f38588a8968d576d942fd3de6a65fac7d17 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

     linux-5.10.162-cip24-rt10 | 3 
                       unknown | 3 
             dahdi-linux-3.3.0 | 2 
                 dc3dd-7.2.641 | 2 
                netdata-1.37.1 | 2 
android-tools-4.2.2+git2013... | 1 
                apr-util-1.6.3 | 1 
                   atop-2.12.1 | 1 
  binutils-arc-2024.12-release | 1 
                  brotli-1.2.0 | 1 
                   dante-1.4.4 | 1 
                flannel-0.26.0 | 1 
                  kexec-2.0.32 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libmbus-0.8.0 | 1 
                  libsvg-0.1.4 | 1 
               linux-pam-1.6.1 | 1 
                    mpd-0.24.6 | 1 
                   perl-5.40.3 | 1 
               pulseaudio-17.0 | 1 
                 rpcbind-1.2.8 | 1 
      softether-4.30-9700-beta | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/36ceb28cabc9176590cde79f0adcf97a482b42e2 |     
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/1ad17d65056103aac45124c0bcf3d57f580b179d |     
    or1k     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/f2d3c55e90cf0bedaad72d8ccffcdcf32692fc4f |     
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/1f08612fc01edca7737d3d7ba802e81af39797f1 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/b0fe2a59a572381ccb3a6e5121630aad46f5eb5a |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6905f014bd2c319b83126906abb95fc2d76ab3e7 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2c78d51639f9d9be3ca9176187de6a83214fe42c | ORPH
   mips64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2a79a006146bd94aec94465ac83ce0fdcbf497c1 | ORPH
 powerpc64   |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/d11192e8b75031a418e79ae62e366b8d91dcfbd1 | ORPH
   x86_64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/60813c4955f1cc583cc23c30b0a9130c613bae42 | ORPH
   s390x     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/3a1875643fdf11f5043bd9ca28591c4b82bffaa6 |     
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/98826e9fc16354aeae12c330a5130b406b37134d |     
    mips     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/393e543f0c40dfe982caaddc81102b7ef0f95cac |     
   mipsel    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/d56281479a694fbf7fa72da3c0e66c4dd7358409 | ORPH
    m68k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/70efae9b4df24e63592104e449936ba7396058e2 |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/95ee08eb5d49867c201f991f36c6e7e2e0cd8bde | ORPH
    sh4      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a498c3d5f8db1bd312a06b20b94a7ce5adb517cc | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/901388d5e3ac13e5c7008729ef849e586047a61e | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/3a54ae6b9aabc6cd47a2aff46287a8bf510c9fa1 | ORPH
   sh4aeb    |           mpd-0.24.6           | NOK | https://autobuild.buildroot.org/results/f43e357cc281a7a1fe3edf8ea7d3bc0ae0e226e6 |     
  mips64el   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/6f62fcc2cb7aef0e4498edf77faf8f1f021c00cb |     
  mips64el   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/da0b24b5fdc60baaff74f5c32be8afda20c2b6e4 |     
   arceb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/3f12367aee21ec17831b1cb81912fa4005a45e76 |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/90ae7372b8effa2fa55c1c436475138690128262 | ORPH
   arceb     |         rpcbind-1.2.8          | NOK | https://autobuild.buildroot.org/results/9a0d5c324c020693defc3adfad04378ef152ac46 |     
  sparc64    |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/63a4d742c662a06b64b9e8d6a66b0edd3ff038ce | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f0a2c251ed736880b36a72f077209cf18bb9a8b4 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/ed9df71608e3273e91e72a07febb9977be07098e |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/d8a2615476071166a361e777912349c2c0dda4c1 |     
    or1k     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/ca83758560481c7053c7713710356ade8442b45b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 28
                libxslt-1.1.45 | 19
  gobject-introspection-1.82.0 | 3 
                  ffmpeg-6.1.3 | 2 
        ltp-testsuite-20250130 | 2 
  binutils-arc-2023.09-release | 1 
                   dante-1.4.4 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
      docker-cli-buildx-0.16.1 | 1 
              execline-2.9.6.0 | 1 
                   exim-4.98.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
                 libgee-0.20.6 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libssh-0.11.3 | 1 
libuci-f3fc0b76040685829191... | 1 
                  liburing-2.6 | 1 
                  libva-2.22.0 | 1 
               linknx-0.0.1.38 | 1 
                 linux-6.12.61 | 1 
                   linux-tools | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.40.3 | 1 
                rocksdb-6.20.3 | 1 
                  rp-pppoe-4.0 | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 
                       zsh-5.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/db79ea8b796df984b1b6a616793dd88a0222faa6 |     
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/60794185c7a527dc34274ea64683f2e00f6f9164 | ORPH
 aarch64_be  | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/9fdd2943a47009d87d70f21e13ab5b275033ee90 | ORPH
   s390x     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/796cdb65d68a3d924dbd49fe8c8ce448ff584c84 | ORPH
   s390x     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/9d499f431c60118a1de0d00b391d066d1f372f71 |     
   x86_64    |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/abfdc65fa53d95a9394b2c3c30c7f6a691dcb1e5 |     
    i686     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/9ecaee30e2649888fce7018288c037d80af9dde9 |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/9d1fddf90e3768dce82826f6d3a6ceaff7bd0117 |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d46e277fdc5c8b0dc3adbeb2f400c0ac1a853c49 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9e20e935022851b866fdb8d27a9ea83250229fd0 | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/eaeac5a88e0b9865018b71e70e245417dd3bc115 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/205286eb67172b9facf03c6afbe5d31cc9e3a087 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/7a9154a4daefec1922f09770d744237625ec8501 |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/31fc8803bb11e26eb23376814ffcd0174b244f8b |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a72c443075a1f3a472fc966b6825a7bbe7f1bb97 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/4a2129fbed2cf05a641b9c15b5c40febc357335b |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/62352c85a50dcf1c2a24889604f0a2dcb55e6ab9 |     
   sparc     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/57155adae98f548a24b07e9705f154e5801aa904 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/fccca4807ecf2ea25e80055886cfeec82343b923 |     
    arc      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/cb6882584c43d995d65b62b63ccfa753bb1db533 |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/44a66df030babdad73ab3e8533b17e7291782184 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/6fc94e6abe1a98695f9d8c8ee6dbd51c76dbada1 |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/0a588354ca7ff510146c4bd48c40886d8052dc53 |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a301bd4e225be1ed4919541beade6d844090a2cf |     
    arm      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2ded55cabd1bd0e1901a9c7802da91a25a102499 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d86baa47295d65d9a7057bb04ad13952f1f1c8e3 |     
    i686     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/187461d39d352c8ad0cf02c3464ed1599b06c10c |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a65a36f13a43e05b3a90d0d57838016a7ed3e0c2 |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/13c637e577cf0d08e048811354257decc318e8f7 |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/36009ee941ead0b224a6141169387a2f7a98cd6f |     
   arceb     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f4c9a08d92e11f9dd70680722ae2b049a4102f42 |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/e5e0751f9b156c4be5e09672c50f8e6c511b18cc |     
microblazeel |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/3735cd243b0d37c55bbc44c2c1728e69331fd0ec |     
   x86_64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/5515d6d57486eeaebe9b1bc068ff2538d4641e59 |     
    or1k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2aa689779b3feb9d4e5a6594bf61565fcb7a72a4 |     
 aarch64_be  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/1c5ceb0eda188664185a2ed66cab466b967493ef |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/ce5e3c80bd3870233626d0fe547c56be4a316fc2 |     
  sparc64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/9ddfd91dbf5b8b77b1da6f86d6c70637fc8eca10 |     
  mips64el   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d8c268586c38167e39fcd1f008fb5256319a8ca6 |     
    mips     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/f72194d75cd9bc6992fe9d5981ed3aec34760b89 |     
    sh4      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/beac44b97c894d3d70037a84fb2659570e069425 |     
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/0ef57f8eb32c44ead298f813286b934ecf996f20 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c4e6b0657f7fe1b1b5cdd862a10030475149e44f |     
   mipsel    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/104075bc16784c81989903ab50a524cd96fd4fdb |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/9b4e0c25ca0e9d778821fdbbb97820dc0cce8b24 |     
   mips64    |         libssh-0.11.3          | NOK | https://autobuild.buildroot.org/results/2856632c53319028e293ed44cfe25e93602117e8 | ORPH
   arceb     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/83ec9402874446927ecb359a022d88751970a9ec |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/111a94dec5daf61d147bc384d3647006ec9f3e5d |     
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/731273df2a5bcc1ae125b3a21ea3512579bd246e |     
    arm      |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b452f124daa2dc8baa6e196fb4015dec4a31f484 |     
  sparc64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/701bf95074dfb55e2bb4292eb6e14ba2e2f37c4c |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/26d8d93fbf3a06d0a5f2aa1fa7182c1ccefe0a13 |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/420d9ea3b08990ba02b8ce7ccb282762ed837cff |     
 powerpc64   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/3110b1cedd70fa4982e3a00131702687757b6b5a |     
   x86_64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/b25b057b39cca7266bfaf9931b8ea5517e1e4e2b |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/256142b50fbf00ab11fdbe22a9c7ce32c0932e0f |     
   x86_64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/29ac7a8289c697e56c5c0d01d3395ecc6a2fda55 |     
   x86_64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/13d46973ccb35ba7cebc44ac8415630d8f1b7ac7 |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/549b1d1e00868d02931c4098bb21576bf23d2673 |     
    m68k     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/1a33815deaf2c05ba859d7c458312d2f69b693a6 |     
 microblaze  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/3b66aca9df0c7126683d72eebd2ddb8caebf5cea |     
   mipsel    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/21ae918ad8332bd1c1d9fc8e7ab065d8a8f58333 |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/833e76a43e6039d8d2e57ef433ead7d15d0b9ad1 |     
    sh4a     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/2dd9405ffe2b0275fa07567a26c14fb77926ebdc |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/a3697d345b7c936f68a320b473efd5e1f8b5d2c2 |     
  mips64el   |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/86e55ac34e2415cc5a0e3053b8ae15ae9f5477d8 |     
    arc      |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/2cf0204099104f9a2fdb53944a8378efeac87777 |     
  sparc64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/2480bf0e29bf81c3d19998047e5ff0c0891be585 |     
 aarch64_be  |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/c548cbd213000f70c0b8d9e275d689a9e4931e6b | ORPH
    m68k     |         linux-6.12.61          | NOK | https://autobuild.buildroot.org/results/4091cbac71ac00ba121293b0d3ec4aa3ed8f8506 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8959fb6e107155717fb2f33df53c521d55557780 | ORPH
microblazeel |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/660930e78546b34f3363ca02403e0af3ba84cb9e |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/e25bc354d1b7051ec49a14d5653f5d49df3a3cc0 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/0233d5469b6663e511809e51cdd8c44ecbe23231 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/93d8ee274bd654a3ae148374f8d13af2d0fc95af |     
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/085335089ae0b07ae702bac50ae32a40bb0cabef |     
    sh4      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/a78b52b3233d10fb2304df262748134a16ba1b83 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c5739667ce8e3e1cf4ad6faf633c1095e18ca9d8 |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/34378c299e7c283733b7b90af06eb2d6347ac664 |     
   x86_64    |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/27896f05ef0ff62d2ee2a164bddeedd8754f7e7f |     
  aarch64    |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/ad7031dfc5f6a77d2623ba04b64eee8832686ebc | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/071eff69dc8caa0929ecac71ab9b068a843852ac | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7fe449693b8cc06d861ad3f0945cbba5d73d7079 |     
    m68k     |            zsh-5.9             | NOK | https://autobuild.buildroot.org/results/74061bf14a3c370d15ad4dc387c45fe18d661205 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
