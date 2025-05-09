Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958B5C3ABBE
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 03:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB1D582ACD;
	Fri,  9 May 2025 03:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bTEeD3Nhw67; Fri,  9 May 2025 03:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B028182253
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B028182253;
	Fri,  9 May 2025 03:09:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69405E2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 03:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A1944188B
 for <buildroot@buildroot.org>; Fri,  9 May 2025 03:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0uUtRIkgXfi for <buildroot@buildroot.org>;
 Fri,  9 May 2025 03:09:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B179C42273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B179C42273
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B179C42273
 for <buildroot@buildroot.org>; Fri,  9 May 2025 03:09:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a1f5d2d91eso373946f8f.1
 for <buildroot@buildroot.org>; Thu, 08 May 2025 20:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760190; x=1747364990;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eC9flGT1BNQ12qd5Dl5J3H4HWLe1h2vfEYA5auIN1Bk=;
 b=rbHmTgaUSey8LZq9lz4vtaM0x2ADFZX3XUBU2VWrfgIfzYZG/RcESx0Aj0EFSrfPbe
 iHU7agshp6+Lg+9phlyObsQD3PmAtXfJbvk2xLpT+yGPx8cTnceCEqeIKBSPwxWQG1sP
 Ob10aeoKKC7J0Bp2LK5E6hVAdiR7GnW8bWLad/bbNJHkknIR1REVWGX4O9RMwwK+q90C
 6LKckn428UTTo+JI6do6mCO6fCj7MFp56fXnn8LnM9ardsybIopW1nyQzmyyX2LCrspf
 2ttnaGr98hyk1VAk2I1tqd/43H5xX3OMgv6IJgYjEPSUC6Ia4rduGayr9jtaTQH7N/Ei
 zXtQ==
X-Gm-Message-State: AOJu0YxYcHvRfMhM7wguIOagjo0pNmzGo+5Po3w1PFY/8l7dYD7GMC41
 CmhLrDNIL/4N4JmgEtziMx1Na9V/1wyxmQFk/a2tcnTzmjh9EX04WZkl6A==
X-Gm-Gg: ASbGncupbrnV8cFTGgPmx2KrF1HEHEgSK1kiyTzsfLFmG17RTxP12SOKPRqFtgC/Aew
 EbPzmVnnr8173P20v5RUzfQzM96dAIN1CTZsVhUlFjErX59GmPS/4FcSnZOFcqWjkkmzWMuKwLX
 fxXSF37p7Zj9Nk8X5OD8V5/V43aFhIbhrr+ZjK0TqDcwCDR9uufq11FME0BNXEXkwyD/HeIHFcd
 VKhOdXxDsyR4GHp56cVG2r0TFsLG9XhhxewinlfpWSk7+wUgKTeZkudIvqxNpemsutg8ubc38nj
 I/U7uLeiMN8Pw+gaR/BQCd7/Czsfr0xCMcp/ZhVczh7U
X-Google-Smtp-Source: AGHT+IGWcQMmyY6nNyT3+S2U1idVRIdRgHT/3r/0i601AkBm0c4I2f/0v1q5wMWXxA90z3CVgy8pkg==
X-Received: by 2002:a05:6000:1acc:b0:39f:e7b:2c87 with SMTP id
 ffacd0b85a97d-3a1f6448380mr1267784f8f.29.1746760189433; 
 Thu, 08 May 2025 20:09:49 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5d6sm1723222f8f.83.2025.05.08.20.09.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:09:49 -0700 (PDT)
Message-ID: <681d71fd.5d0a0220.38d8e2.4bbe@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 09 May 2025 03:09:49 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760190; x=1747364990; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eC9flGT1BNQ12qd5Dl5J3H4HWLe1h2vfEYA5auIN1Bk=;
 b=BDD8MSAeGE/thXO0uRgrhLoxcBUwR8ZORQVV9qDDhCww740L6o6DwnbRA5KXICj6ph
 in5lwPmo0lCVgK5c6xeVd37/0JBP6KR6BkrXxhIsMO6lQVjfc8o3bzmWKdDQ5MOcvnkl
 rUdd/454gBb+zcSgQH/aS7C/3j4I73fsZXHx9d9clAhvUQAy1LYDn2D1nB96/cn7lGA1
 XNTCCtslEil51peQ5yQzbIbZvDYLIDp75ua5yuCjbH5P2d4ro4oH8LyKNpmVQDaK3Cc3
 P9kJLT3t5q6CGyUUUw9E36nt8sAQ/MsBgEEX9fwPNam2veJAweeWrNnSWfzPU3VscLnn
 HsVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BDD8MSAe
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-08
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

Autobuild statistics for 2025-05-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  | 14  |  0  | 15  |
    master   | 13  | 105 |  0  | 118 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.37 | 7 
  gobject-introspection-1.82.0 | 5 
                       unknown | 5 
          host-binutils-2.43.1 | 4 
      passt-2025_02_17.a1e48a0 | 4 
host-go-bootstrap-stage1-1.... | 3 
     linux-5.10.162-cip24-rt10 | 3 
                openvpn-2.6.14 | 3 
          sane-airscan-0.99.33 | 3 
                elfutils-0.192 | 2 
              fftw-quad-3.3.10 | 2 
           ghostscript-10.05.0 | 2 
            host-binutils-2.42 | 2 
        host-f2fs-tools-1.16.0 | 2 
                 libusb-1.0.28 | 2 
                memtest86-7.20 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
                 openssh-9.9p2 | 2 
               pulseaudio-17.0 | 2 
    start-stop-daemon-1.20.7.1 | 2 
amazon-ecr-credential-helpe... | 1 
              asterisk-20.11.1 | 1 
           at-spi2-core-2.50.0 | 1 
             bluez5_utils-5.79 | 1 
                   botan-3.5.0 | 1 
                   bullet-3.25 | 1 
                  cmake-3.31.5 | 1 
                   crun-1.18.2 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                     fd-10.2.0 | 1 
                  ffmpeg-6.1.2 | 1 
                    flex-2.6.4 | 1 
fs/erofs/erofs.mk:69: /work... | 1 
                   fwupd-2.0.4 | 1 
                      gd-2.3.3 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
              host-audit-3.1.2 | 1 
host-binutils-arc-2023.09-r... | 1 
                 host-gdb-14.2 | 1 
          host-mariadb-10.11.6 | 1 
              host-rust-1.82.0 | 1 
              host-swipl-9.2.8 | 1 
igt-gpu-tools-0ee4074685c1e... | 1 
                   iotools-1.8 | 1 
                lesstif-0.95.2 | 1 
             libargtable2-2.13 | 1 
                 libmbus-0.8.0 | 1 
                  libnss-3.110 | 1 
               libpthsem-2.0.8 | 1 
             libqrencode-4.1.1 | 1 
                  linux-6.13.8 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
               mariadb-10.11.6 | 1 
            micropython-1.22.2 | 1 
                    mpir-3.0.0 | 1 
                     mtd-2.2.1 | 1 
                  ntp-4.2.8p18 | 1 
                 pixman-0.44.2 | 1 
         python-remi-2022.7.27 | 1 
              skalibs-2.14.2.0 | 1 
               syslog-ng-4.8.1 | 1 
                   thttpd-2.29 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/7b0d9bc1aac8c87a3f9995f32bcd60f2f154b57f | ORPH
  mips64el   |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/8faf9b4c3bfcf1d8585b8ca7bfd67a9e13d9625c |     
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/71fb672cdb58d601b383c6b39875be2bf3dc1a1d |     
    i686     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/a1e4477e7cdcccae8fbad0c12c8bf65c8869f01f | ORPH
   armeb     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/0519255b83c03d70c89221633c40455dce4aabc9 | ORPH
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e2aa0415d870759f86ec4eafa8d1f37ce61067aa | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/6ed531b07838369602141f18113e3b01a57c06a7 | ORPH
   xtensa    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/8f92e406244d59da9a29bef6221e9991fce5ce5a | ORPH
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/f45ac3b1696388ebeda031b40448848eab1acfcf | ORPH
  aarch64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/466ef12a7dcc9c70d44c43ca59e04d6d91b12249 | ORPH
   s390x     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/721ebe9e2bc1c42ce3fd85fffa73a25da557f0b7 |     
  powerpc    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/53c4f47fa6ba472c9e3cefa658e76c41dff04739 | ORPH
   arceb     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/f26dc49f7358bf94a67c968de196207122de2175 |     
   s390x     |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/2d45e6f73f50224862bba9909a2981789e4e6378 |     
powerpc64le  |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/efd0f0a24aee110546c075439017e141e9018ad0 |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/354178ecae16789943980526580983d95e135061 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/80222afde7f57d39d067a598354410be82f59bba | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0c4742a738871159c2b3c06a54be9b79305fa92c | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/81f4ecaa63d5dd25bd0d188e63c1f426000cdc93 | ORPH
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/a0fca38cb0d51ce696c3a4be8768618893e27209 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/549e7ccc4aa56631536e77cde40c22eaddb73d79 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/4dc7a32e34918506a2964401ef6c62eca6f78f34 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/6d855c74da2d060aa6d78cb33b9a67659da88078 | ORPH
 aarch64_be  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/8b66a4430b5b040a15040a2a63608bcd7ab9229c | ORPH
 aarch64_be  | fs/erofs/erofs.mk:69: /work... | NOK | https://autobuild.buildroot.org/results/e0c64e519075fb37bc49bc8d72ebc48ac5f83655 |     
 microblaze  |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/6ae8455708d372ed91c0163d1ca6af186560d9ea |     
  riscv64    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/62d7bdada2c52809cef3e759c69b2dd969f6929c | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/fed6748437b4dfb191dc3f927916165f15037dfd | ORPH
   armeb     |      ghostscript-10.05.0       | NOK | https://autobuild.buildroot.org/results/925eccc5594b37f4a43a20b0698977ed19f48034 |     
    or1k     |      ghostscript-10.05.0       | NOK | https://autobuild.buildroot.org/results/60c605650bb4c57bec2f04bfba448eb095312c67 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/ab208443b25f54b970e2c20194e9ddd89fa2b84f |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e1654246ac020238e78412bc1dc8588833d65cb9 | ORPH
   mipsel    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/303f32ddbfbfa7378d004b8aaf930058f42328b4 | ORPH
    sh4      |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/bb0dd72b81d659e7c5e56aa509c19412c11db2ea | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/c8d97126150af2c9a0d1a2123f042abe4816d335 | ORPH
    arm      |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/05eadc4f620602e381af510a3f0cc859381b4489 | ORPH
   mips64    |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/e3332a988138a8bad50bf3274d5ecad89956f3b7 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/22b2dc8ee808b7f71262a2c07817b8cb965db087 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/31726775cff009fee758d3e83e0634a009acb741 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/155b6ac52911535f0d2e3e63b32bc3c344f077a7 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/73d01cd04a154c78ac2593176f2937d04dcf793a |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bd0dc65d774289b53ac7d9e59b236f22a9fe57df |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/78f14c77f29ae9da80ba91616cb36e660233ce99 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/35c7f33064cca1f63364c4f4ac13ce11aa754b72 |     
 aarch64_be  |     host-f2fs-tools-1.16.0     | NOK | https://autobuild.buildroot.org/results/5498585fcd6530afd49472777fac94ad750a5d2a |     
    arc      |     host-f2fs-tools-1.16.0     | NOK | https://autobuild.buildroot.org/results/6d18961deeb2defb851513b9da664b7d92ee0d70 |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/112f8899010c97161c2190cd8a10437ad18fa8d9 | ORPH
  aarch64    | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/fe377803881c6756edbfb0088fcffa1f62f62d6b |     
    arc      | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/3d7f48ed343d2c3a6837a5f28582225bbe7c852f |     
 aarch64_be  | host-go-bootstrap-stage1-1.... | NOK | https://autobuild.buildroot.org/results/9e163ac7d08b33831fbbe14de3780866594b5c0d |     
    arm      |      host-mariadb-10.11.6      | NOK | https://autobuild.buildroot.org/results/0e91b01dd8cab98a520aac03f2234e948753becc | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0d5f00f0f167609cced3a95bd8774f8113497f9a |     
   s390x     |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/87548834b0b7daf3c8e8a895d635a9ab6f8c2582 |     
    arm      | igt-gpu-tools-0ee4074685c1e... | NOK | https://autobuild.buildroot.org/results/4cf963e02573121a85ee82154f638e8ebc4ff94e |     
  powerpc    |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/2a0bbd6752e83f4e0be22bc7ec35c139dd669155 |     
   x86_64    |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/f5ed80d99318b37d65d7079eb71380ba5069dc35 | ORPH
   arceb     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/64f4ec24ed0511be0b31b679d69be76069381413 | ORPH
   armeb     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/cd32e874bb0390b7246e8472f461ddfb6c186088 | ORPH
powerpc64le  |          libnss-3.110          | NOK | https://autobuild.buildroot.org/results/abd0e32d87ea9e4cefe00e4f91d54714420e5fa0 |     
   s390x     |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/01fda8d64b16464e554c08c455096899f85045bf |     
    i586     |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/b7811455b1e5e740b74d3684d28b1e26953d8a96 |     
    mips     |         libusb-1.0.28          | NOK | https://autobuild.buildroot.org/results/69e23464fed40a37131fb6515d1fd0195b815282 |     
microblazeel |         libusb-1.0.28          | NOK | https://autobuild.buildroot.org/results/7654ae849972da47ec1ec0e2bc2d642369983a39 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e1a109711862abd2e065a10a5547ca230c7ffc71 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3327e3bcdd7f7ef2d4bc3ff092f6c3dd0e167436 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/085d2e2996599c1b7b6c227729001e378fe78fc9 | ORPH
  riscv64    |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/20904a5c9525c6d470744e532c1986f50ae5cc1c | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/f0864941656ea72146af7945671daeefb8b7e2a6 | ORPH
   s390x     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/83d2adc586bc52b63603cdf63fca80467568a607 |     
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/edae0b79c944736bf4c4f83d5cf708996302c762 | ORPH
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/19f3e8c5736f2589e171549e820788b84cb195d1 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/e40a39f6056620b4baa02fbe0c6502c5d36731a4 |     
   sparc     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/fdf1d7c3e3a51e6fc7fa5abea57de6c9ce792015 |     
 microblaze  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d5e8ffe504f202ecef98069077e48dd27459e78e |     
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/d084571ca3080db1d09af3ad76ef12c43e273d8e |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c130659a33d249d2a916cf644f9c908f4bd4355e |     
    mips     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/faed45ef401d292d87493cd8e78811949a31e8b6 |     
 powerpc64   |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/2d407109220dcbb1f6373e23fead625e453310af |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/f846bace14380fd0be329b4e9cec1ef7e0af1802 | ORPH
    mips     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/7d78c53da593a8c86c87f106237b21c6d7c66bba | ORPH
  mips64el   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/3e8ab9861f8cdb26cbaee1e5833fa1baff48b641 |     
 powerpc64   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/05a1cb7108a3d9a996ebb091b96f6323addb5249 |     
    arm      |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/7ec95d5cbb355e8d5fec8e7203575fd465b834f0 |     
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/1b6dae6116441477a1d8fa04f1b0bfcbed248616 | ORPH
    or1k     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/302da1922a154d47b2a8f10e971cbdd1cc583ca2 | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/c6554c8d1db53876726a184505ae3ea887aed6c9 | ORPH
   xtensa    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/021cde592f225a65ea886e9e0d81f5c95c899c56 | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/2c508dd8a66cd26db0368f9886a4a0428038dc32 | ORPH
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/d96be2af4ecf054c2e7ef0f066b0637904fce625 | ORPH
  aarch64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2632992b16b0019fae753c9d86a11080e46b7c00 | ORPH
    i686     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/e0eb07041e05bdd85a534e362725c2c10b2f6ef9 |     
   armeb     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/f814f3e77b6c31a93067d410226df3eceb8d9246 |     
  sparc64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/ca01aaa5bf7a4ee0c0b60e70b6eb3862f8e504c2 |     
   s390x     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/61aa9577a1843da3488e997032b8233074d0a0d1 |     
    arm      |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/796d39c360b004a14f12b7d5f211e04ed383b573 |     
   armeb     |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/28f86fd41d353c6a12d679b0bef2f9bee8c115be | ORPH
  powerpc    |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/a5115a178b8ef567f68de1f1cbd53297ff03ca4e | ORPH
    mips     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/775ea5bb6e206411f08c0771130461e402290725 |     
   sh4aeb    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/91234e3da9b23892326a2db91cf4c73150d212ec | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c4eaafe313f84870cb989744e4f1d9e00c5d7edc |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/daa8cb7941c88b1f1cc51889a8351ed232ae9bb5 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/1bde54245d3b6c8141052044cdf1c48031f3f4ef |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/79f223afeae9b3ee9329fac04a1416d02c084e05 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/38cf26bc8913ec53620e9dacd69f440da124783e |     
   x86_64    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/6cf516ed19a147a37fe5beb2c13d0dfaa4362eba | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-m4-1.4.19 | 9 
                bpftool-v7.1.0 | 1 
                     daq-2.0.7 | 1 
            gdk-pixbuf-2.42.12 | 1 
                    mpv-0.35.1 | 1 
                openntpd-6.8p1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/23907b15b2b4f47ce4453bef6fbc2d1d3ee40531 |     
powerpc64le  |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/ada9dcb5ccaaabaf191a992153a466ba50976fa4 |     
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e4d529b027d0918ae44c28d50dfc2ec2ef97d6f4 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a7b306b87fea26452e55c5c28e5520fc555308b2 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/86d141e7b098624ea2c572dd724407cb0ca49461 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f9a9619f42b8ece196069007f0d37aa9cd8a31d8 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e35f57402c8ecf7c715456b001d18f00602b759a | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d733d79b4320de29ea86a01bf5c87fbe84d97d4d | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/226959b6ff5d7df9b2b1899e2ce308cdfb639b3d | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ac3ce35283f0436244990d59517775bd9560a185 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/17c9786e00e639e36aff9b44382913c4bf04eeba | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5c2801521d255ed642b618e191f6e71514d21967 | ORPH
powerpc64le  |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/d5da1e1f6a70101ebb0ae5e61186c2359640acba |     
   sparc     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/645e5035520799857a0eaee84be5499edcd7b3fc | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
