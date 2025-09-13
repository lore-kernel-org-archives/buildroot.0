Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD558CAC58E
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 03:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BD7E6169C;
	Sat, 13 Sep 2025 03:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKaoJhbvTf16; Sat, 13 Sep 2025 03:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 470F96168C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 470F96168C;
	Sat, 13 Sep 2025 03:20:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A72512D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 03:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C8508322A
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 03:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gctG46gs_FvX for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 03:20:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 754BB81A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 754BB81A50
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 754BB81A50
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 03:20:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3e249a4d605so2788420f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 20:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757733620; x=1758338420;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2RNW20/Nz+HKa+Qbx9/Ci29hZBMpJ2/QCpe365EMyYw=;
 b=iddThfMh0BugZvsXVgf8eI6jLVLelHQjG3L4d6V/9VYvAwXN+50xa1sKx0tfURn18a
 ZFTcNMi5pI0eVI2de9QYGrKMuSEpnBqgEU+S5cxyb1xmST8LRPUwvswv88ShQCpvb7/n
 HUgFlZI2vYJ/c1atzf98QHc8s5kxvLgC580lF1iEE7uK/7U29MDnG0JoXQpqELjha9FM
 3X6ZHCJn6dfJy96yhVKYS3LYXmp50EeG5jXCwhZdTCiyDoW3yd0KJtrAQTed7uzjkRGp
 DROJ4ps4pZKP+SNLHx1vXJdNzIqlrL5HPgd9qHq/dwlFTQ4vQIeruzrREK0GuEu85lIZ
 QcZg==
X-Gm-Message-State: AOJu0Yyuh/Oc8tqWOb4vgnj2lWZuAaGKx3JsiPPdLS8VwqZEBfoRAE5H
 8/ZUzWmyvppuM2xuAvieJtruAsa8LT43BhO1RfCujJ0chZYUXTV2vgBgz2szPw==
X-Gm-Gg: ASbGnctKpwsBpaprXFNRoxmU/AAVkdae6VExS5nwxM2nMlV1Yf4Cm2GXAdKuEb3JVpE
 LCHJb69s+IyvPn9A5pXDxATueuHoKOtZAQWDsgBmU2dpceiYy4U8hYesFwwFWad2DXv5ZAGJbA9
 sQO+As5hJHpyOfnaXXtG2y+pWIVSSyVf4UN8Y+5JEAkfhp4oKLwcp0Lhfo/MVINRpk4iOndP/Wd
 fiVQ1BLg2bNZbIWIxHBUIqME01oEe0xf3zYPZ9ldmWFP1/fo2lj5cagduE2c3L/0IKhnK9GNLeS
 g5dqadI0M1d9P3NmPIHvwI5/W5yAd0jdP3//qlcPwngUHzCyvLQSDPQcIZOH4AJLk+ygi1MwKc3
 LpcazmLwICpYKO5dDcLtZXJVI7HWBC1RQvdQ0CPc6
X-Google-Smtp-Source: AGHT+IE8Rm6pVk+Mk7Zk2w42w9OYy3Pc9qZGz7gD7eDTDustS4skY2zIK0mKMLOddO9ph8frKEplhg==
X-Received: by 2002:a05:6000:1845:b0:3df:58c5:efd4 with SMTP id
 ffacd0b85a97d-3e765790878mr4935241f8f.5.1757733619881; 
 Fri, 12 Sep 2025 20:20:19 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e017b27b6sm85960845e9.16.2025.09.12.20.20.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 20:20:19 -0700 (PDT)
Message-ID: <68c4e2f3.050a0220.34ac2a.59cc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 13 Sep 2025 03:20:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757733620; x=1758338420; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2RNW20/Nz+HKa+Qbx9/Ci29hZBMpJ2/QCpe365EMyYw=;
 b=jgwFNxxlKG8uZcjpS80z/SPQg0HZfytFln9DQYr/kPq1MD6ZhgWrzv8YScWGUqtrT6
 TcJI0Annz6mZkm2lP1zfQUwERVs1XjnvuWsMJ82pZI/iv4xavEHFrwqNXQiheuWopkTb
 ijMF+Be+cRETVj/hMoRH3mfdlcpAvQgeT+df2BKZdiwb/ci7gVmYJzCbiEdXwZ/aqHor
 zQMkPLQDuOpYjwulYJU00wyE+tTFx2qVOgecJPm39XYwMd/lfFy6nLpBTGEE5t4HPqWy
 mbPRiH81f3IaHY9S+HlDd2h9ti/ZApkZPokNNSaxefQ1c7gVSO5kDe6L1NrSDb3vLFO1
 4u/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jgwFNxxl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-12
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

Autobuild statistics for 2025-09-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  9  |  0  | 16  |
  2025.05.x  |  2  |  8  |  0  | 10  |
  2025.08.x  |  1  |  5  |  0  |  6  |
    master   | 44  | 87  |  0  | 131 |

Classification of failures by reason for master
-----------------------------------------------

                 logsurfer-1.8 | 5 
     libphidget-2.1.9.20190409 | 3 
             util-linux-2.41.1 | 3 
        vulkan-headers-1.4.317 | 3 
                 apitrace-13.0 | 2 
                 c-icap-0.5.10 | 2 
                 coreutils-9.5 | 2 
               dvbsnoop-1.4.50 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
                 host-gdb-15.2 | 2 
    host-llvm-libunwind-20.1.8 | 2 
              host-rust-1.88.0 | 2 
                libroxml-3.0.2 | 2 
                  linux-6.16.7 | 2 
                       unknown | 2 
          aardvark-dns-v1.16.0 | 1 
               arp-scan-1.10.0 | 1 
                   atop-2.11.0 | 1 
             batman-adv-2024.4 | 1 
                  brotli-1.1.0 | 1 
                busybox-1.37.0 | 1 
                  cairo-1.18.4 | 1 
            cpp-httplib-0.25.0 | 1 
                   cvs-1.12.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    dust-1.2.3 | 1 
               dvdrw-tools-7.1 | 1 
              e2fsprogs-1.47.2 | 1 
              fluent-bit-4.0.3 | 1 
               freeipmi-1.6.14 | 1 
                    gawk-5.3.1 | 1 
          host-binutils-2.43.1 | 1 
         host-gcc-final-14.3.0 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.1.0 | 1 
        host-sentry-cli-2.20.3 | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.508 | 1 
                  kexec-2.0.31 | 1 
                 lcdproc-0.5.9 | 1 
libdbi-drivers-0bfae6c43134... | 1 
             libgphoto2-2.5.27 | 1 
                 libiconv-1.15 | 1 
                libnss-3.115.1 | 1 
              libselinux-3.8.1 | 1 
                libshout-2.4.6 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250530 | 1 
                    mcelog-194 | 1 
                    mpir-3.0.0 | 1 
                  ntpsec-1.2.3 | 1 
                     nvme-1.12 | 1 
                openvpn-2.6.14 | 1 
      passt-2025_06_11.0293c6f | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.40.2 | 1 
                     pound-4.8 | 1 
procrank_linux-21c30ab4514a... | 1 
                 rtptools-1.22 | 1 
                    sdl-1.2.15 | 1 
                setserial-2.17 | 1 
                     unzip-6.0 | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/df1e2182988df66acfee416d3e5eecf49ea41a55 | ORPH
microblazeel |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/e06318e6deea06d438e08aba2997b4d49726d8e4 |     
loongarch64  |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/5c1b7b12d3b0bfbeb0c3e2819daf564bb1af47b1 |     
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/8df314dbd2dad64e79de7366e750c2afeeb6b079 |     
    arm      |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/58c55b16c48296d9471408c3007126d6d4a9bb11 |     
   sh4eb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/226262d608b1764f2b10716f2758c75c7856e27f |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/0860df79e3e3097bd121728a553489417a899581 |     
loongarch64  |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/609be351b840ee99c55700bc82f1cdaff7718c16 | ORPH
    arm      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/af0138f4fe6fcfe78649a96d1b9f3a32d61b0413 | ORPH
    or1k     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/28de5a27b7a44082fb13382f644531cbac414a0c | ORPH
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a46ec3c949310663c880e461399972dd1723ac67 |     
loongarch64  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/486264173203dd1a6664446a41203475b4cb8386 | ORPH
   sh4eb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/0f3e8c870bd1d93266281a684990731356974a16 | ORPH
 microblaze  |       cpp-httplib-0.25.0       | NOK | https://autobuild.buildroot.org/results/5b9843089ade428997035e49817208ce9c09a10e |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7dc815a20fb0df8bfd42eb613e906b7bf2c06649 | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/30c960f35460a25bec5487603c99301611994db2 | ORPH
  powerpc    |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/806e9f7a8671dc8fdc7c29f2157afdc6b6b48b0f | ORPH
   armeb     |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/8ea6fcc836bf70309646a0ba99bb9e0594797c28 |     
    arc      |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/72a3de159c19c3cf71932b3dc743182ee7b97489 |     
  sparc64    |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/d94e62dad66570804742b48c3264c6f3d34ec7b3 |     
  aarch64    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/9aeb930371b73d7e4d7fd812c91d885f8840c751 | ORPH
    or1k     |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/47264ff7f8cce42e6c5b158973387f73b47ee817 |     
microblazeel |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/b92050c620a3c63e8871a9bc8b2eb8260d5f16c0 |     
    arm      |           gawk-5.3.1           | NOK | https://autobuild.buildroot.org/results/62f5b4ec6f0e0ad861ba0bc6b8513e5ac27cd6b9 | ORPH
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/3a37d53bb52862030cf25b8991c5333cc10afd1a |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/6fb621c1923bf4f1dd9b9d3408d446b29f11a784 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cc41ba46c4150b26de15c5c50eb8fa374dd4e488 |     
  mips64el   |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/d823d7d76620afdb345f38786a36e8a74bc8e95a |     
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c662685d3a4b663807ccb8339520f833dac8dc91 | ORPH
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/905a006e86970393eb3c43d718e5885ca3d53545 | ORPH
    sh4a     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/a166e08b2f363c455bce3498a525ee40417e8c08 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/3b5151b100d7248a6703e70df6f2b52e9f715a0e |     
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/16ed471a700fb3e72b3b46e07c91259a7e432a3c |     
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/35b5032db5f9fe56b6b911eea74159e7a5fdfb85 |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/37df65f3020765f0e8f9b1c1200bbf62fb20dbfe |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/cb85ea17fb3d2aad56d1a7cae0c878e5fef41e6b |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/0878359be7bb72a06c2752dbd3c2cbb7bb80af86 |     
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/ab8b44ac88fd9914dbd52771268e093ed7821309 |     
    sh4      |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/dccd3fb1db37d4da701443fa865054bf80efdd2b |     
   mipsel    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ba3dc0046394a0c2fa690bd477369de9e4a367b8 |     
  powerpc    |          kexec-2.0.31          | NOK | https://autobuild.buildroot.org/results/f902633471824feccfd35c6f55225a13d787c89b |     
microblazeel |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/9950440fb0f4135e418a3abc378c942c676e4ce7 | ORPH
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6e6da36eb6c96a26817f36829eff3d251291c0c0 |     
    mips     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/654f0b46b8afbab849fda54c58e001b779babb28 | ORPH
  riscv64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/240d206a82dac4bd3f89d5e82420b3ae5c360a8d | ORPH
  aarch64    |         libnss-3.115.1         | NOK | https://autobuild.buildroot.org/results/4a6fa0e54cf1507a4937060413c684d1cad7daa1 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3e15a9497af01422bf93f838a6684ad9f1a3719b |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/95a099464fd9dc61c03c688e17b233923903abbf |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e6d57d48266ad6a7e8d655a94d8e8dd11abc03d1 |     
loongarch64  |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/faca0402665a82cc89fc0f367af1b97e05a5478d |     
    sh4a     |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/4a8e114b574cb2c1db3762ce172c88dc2718a5b9 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ca9739d462187ad032bb69bc7b2cb9aa798ec7ab |     
    or1k     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/b98be8b2f4fb96ca8c695d76c99d3753cb4e00cb | ORPH
    sh4a     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/2ecb3d04751d22446be6ac2e44fe191e5836e96f |     
  sparc64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6a1c5610d0c630c095a1289b33b6f5b767bc0f60 | ORPH
 powerpc64   |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/25bc18dd6a84372b7522dc46ffeeb54f8d1f57b2 | ORPH
   arceb     |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/152b63f3e03fef67823b2b1e061dc87374e25d12 | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/930cd27531e018e4aea7ffd788353c0b12466be2 | ORPH
   sh4eb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/8300a6415bf0a2e78839c49b4cb5ea45f334afdf |     
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/b1df859717fa5e5b162c29cb9888fba676935511 |     
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/d3ff07b0eb4a23b9b5baf6d7146d180fcc936b70 |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/fde492d0af3afd868e947a415f335f69c166b90b |     
    arc      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/3e47e83392da1a151c720e55ac2062d7d790d0e0 |     
    mips     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/4ab886fcf7a73a4e675016299700e68bc8bccf22 |     
   x86_64    |           mcelog-194           | NOK | https://autobuild.buildroot.org/results/26c88187b5b9089174c772a5b2eea6f4b00ccbcb |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/258eaa17e20756a66b837e4830be0c498645e8aa |     
    or1k     |          ntpsec-1.2.3          | NOK | https://autobuild.buildroot.org/results/55a7d7570950c7f3ef69028279a7bfeec666d33b | ORPH
   xtensa    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/914ba3496d189ccbe84067b41bc2b4e876110daa | ORPH
   xtensa    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/6ad3d769d304727e1b65ffbcaa838b4481f6b6db |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7ef6ddf47d96ba5efc2634c7ac1858706f66bcbb | ORPH
   xtensa    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/8e4ef42df754709465c854c383333d19b584e80d |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ad2c66c46e45379826e5f3d639392d344011f6a7 |     
 aarch64_be  |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/d3ba5186512d90bf7ef449eb997141dff9dc71ae | ORPH
 microblaze  | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/5e9f60ba866d91164dafe12b7a471352b67a771b | ORPH
 microblaze  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/d0f3b47b8ded33a9e48de4ba749364ec901063bd | ORPH
  riscv32    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/173c72484aa2ecee3acb231b8c7cca36b79aa85f | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/1898554cb4dae54844f4616ff99ec9f6d81b499a | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/a4130cc403f8933123475a399d6c90c8ec4d53ea |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/5943bb029359b90ac4f09142ac9e0faa9cb1ec1d |     
  mips64el   |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/fce610ee7e477d33d2a3e93b5dd23b274c546fcd |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/01dc12b20bfd6f6166850a0415d2f9fad296db44 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/8213eaf85483a7541c7848cbb235c9c8969ab9b7 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/1ab7c5701eb589fa8aa1f7228bb8f78a3c88651b | ORPH
   sparc     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/a608cc1640075331004ba570dedec325c7525baf |     
   x86_64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/c9dca9d552c26b5d29892c433ed9e61fab4c8549 | ORPH
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/f8f1f2deb66aa6945f2e4e0688216afb2d47d0ca | ORPH
   armeb     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/cac398d89b8ce991bf3a527cceafa835cf7e89f8 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                     bc-1.07.1 | 1 
                   cvs-1.12.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
              libselinux-3.8.1 | 1 
                openvpn-2.6.14 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/ed173843a91d7414533270ba10a8eab703bed32f | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/72041f92814f3eb2357b596fceb47f5edadff9c9 | ORPH
   arceb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/52d23154d038f403d361e00b4a37a4bc2ee76b04 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c9802338fd7eca49aba4a732a573b1187b301722 |     
   mipsel    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/9c5b781ddb1b965aeaf02a93259d2096dcf4fbce |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   avrdude-7.2 | 1 
                   cvs-1.12.13 | 1 
  gobject-introspection-1.82.0 | 1 
              host-rust-1.82.0 | 1 
                libheif-1.20.1 | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
        s6-linux-utils-2.6.2.0 | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          avrdude-7.2           | NOK | https://autobuild.buildroot.org/results/42b0bca22b96fc47bdeb0e0bb72c849c6c3bda08 |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1c2ebc69e9e8b55fa4e28963b4728e2282b9699c | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/550c9ca0313ac88916ba809e46fa7a7ee9c814d6 | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c1498607c63bb2651e71752c54051cd45c108ece |     
  aarch64    |         libheif-1.20.1         | NOK | https://autobuild.buildroot.org/results/f691b5581010df63c7388fe32965935d92f93ca4 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/643e5ea88259cb8a7f07f989e8185d47f4734527 |     
   sh4eb     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/951634962a244c030118d383f12790df617d4760 |     
   x86_64    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/7eb6471cf1501c20a987eec92d29d06d60aeade5 |     
microblazeel |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/f86c5413f954a0d212d824a787ebcfc3904051cc |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    brltty-6.6 | 1 
                 expect-5.45.4 | 1 
                 gerbera-2.4.1 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
host-binutils-arc-2023.09-r... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                  nginx-1.26.3 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/44b82ea993ccf6ae614c10e325949d1587c89895 |     
   mips64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/b0b01e32b5d09886a71ccbf1e8288a8e0b20519b | ORPH
    i686     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/d433eb4c3581cf926cda0298d21eac5924e9ca05 |     
    arc      | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/d1893592e9cfce39f0dc82df2732d94800ccd874 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c68e095de95db71b78d92d3ea403924d140802e3 |     
    arc      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/889a9c9a6175b1c7265455b62412b9f4c77c98b2 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/f5f96aa38759ef69f138810a4fcd0ad602cedcb8 | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/7f94c0a19268741558e41f3b906d868644560727 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
