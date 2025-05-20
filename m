Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BA8C2D0CD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 03:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C695811DF;
	Tue, 20 May 2025 03:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACeO-QgW8ox4; Tue, 20 May 2025 03:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FA04811EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FA04811EB;
	Tue, 20 May 2025 03:14:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 519D6D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 03:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 378A4400B9
 for <buildroot@buildroot.org>; Tue, 20 May 2025 03:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKjPW9rFWXjf for <buildroot@buildroot.org>;
 Tue, 20 May 2025 03:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EEAA400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EEAA400C1
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EEAA400C1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 03:14:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a375888297so869545f8f.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 20:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747710872; x=1748315672;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rKyUnuE0gSiaMRB0dKcLRd2wU5ZbspGL/WiD3duDoec=;
 b=JXzBGV22vrKp0v0c4xrhDSZXQgNPd0ZW804+tf6q7v0z1xsegf/KQLcqDGVSPkNSaM
 jNVYg8aTFR8o5tEljUNBo57Y1YGhSE/LtgWndhOBCmH3jDHZ+rYaOjHtnFArjWgl5AlF
 mCnWJPqFUDDsdSMmEk7224s3+Pn9DAH9UVl4pU+ZTvXmKOYjIeI9b15oZoOM6H6WoMoy
 yDhnEF8F/07vwTBlXeouzeIE0BjJuakJpgfzgYCy3CQp7sYB6TGscCH7jZhtrBgcx4bp
 A9PE5kUDEB9muktETemCJNGQFwmVLRsKiz9PNdoORnZmVRLAOA13XhHGn18fTn3RVYwE
 ypPQ==
X-Gm-Message-State: AOJu0YzPMt4c3eMZG5jQtvqof2EAQhOgyO7qV7tDVj6Ehw2nzf7n6Cgz
 q+5Q8KEY0hIac2nwOvbeKkJgX0ZMTMZCIkdh3wvbqmbcdmN3NjCbs6wNSvfqsQ==
X-Gm-Gg: ASbGncvxd7SFVHgzzrSTC7n3kaHQyWK4wZYhVaiAl01+6nTnn7Yaxf0khMQrjC1MdkD
 lh38ay/Z+iJBJsw6lEQAFEJcswzgqJIVXQCYhNuSfCfwTxeZ6F6RHJLEnD6PAf4IN33tmUyrH9a
 5440VKKMb5EzBT7amV6nQGcHWvgRRhbX0Sao/PRTZOSe5nFdpM9BRBvvXUTtFP7Lde8wInTY+a5
 HYmb179LgjYYf0wnOhDsYYy5DOf1D+rVxxhpoqFYuVtmnydNHXsNQSFilWrXp696/Ayz1eXo/SW
 iV7kcSxuTKu45BDT0+1YaVUo45ZVFAS9xy7PTNcOsunU1A47t7HheqLbBym9BpYdJg==
X-Google-Smtp-Source: AGHT+IHOuc4E/RYhDkvUXEViw1lsRT3+p2Td5Z3Ozuo/x6ZiKfg2p1CLsfoIRbi5pUUX3NvLddYRfA==
X-Received: by 2002:a05:6000:3105:b0:3a3:64b9:773 with SMTP id
 ffacd0b85a97d-3a364b90788mr10150033f8f.10.1747710871186; 
 Mon, 19 May 2025 20:14:31 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8899bsm14678238f8f.62.2025.05.19.20.14.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 20:14:30 -0700 (PDT)
Message-ID: <682bf396.df0a0220.b2fff.68f7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 20 May 2025 03:14:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747710872; x=1748315672; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rKyUnuE0gSiaMRB0dKcLRd2wU5ZbspGL/WiD3duDoec=;
 b=R2tH4imzpazwxmpoiy+gdXhYy60xoHluLG1slflHDcfL9y74Y3UWvxycQbXJnH24W7
 XoGgQKEhN/3GjsrDKlDHRTmM+W4pXGQ+VFoOaaABlcxPduNNXKPvdg/vj6k8T+LV/wAj
 wBuviKO2Eyn3DaCEXc7j6TJlzrL9VUZ8zwHtxmqMx+j+1cVNjKu+SMgeCXj8posQci8p
 VSNgN6xY6kBKEx1EFE242v16mPWHg67RsAj/ci5o9MqU13MF64uFFltGBoY8L+PF2atY
 FNo+P6ZuBWyMYxRvkA6o38g6BDhCxBdizYJYoVVlt8e4FfRpB1Ivy1K4r3WDg8GJhbY9
 rIfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R2tH4imz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-19
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

Autobuild statistics for 2025-05-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  | 13  |  0  | 14  |
    master   | 16  | 630 |  0  | 646 |
     next    |  0  |  2  |  0  |  2  |

Classification of failures by reason for master
-----------------------------------------------

                 host-lzo-2.10 | 111
                       unknown | 81
          host-binutils-2.43.1 | 57
host-gobject-introspection-... | 53
              libselinux-3.8.1 | 34
                      lzo-2.10 | 27
                  bcg729-1.1.1 | 25
                    bmx7-7.1.1 | 22
                   avrdude-8.0 | 17
                elfutils-0.192 | 17
host-binutils-arc-2023.09-r... | 13
          host-oniguruma-6.9.9 | 12
             casync-nano-1.1.1 | 10
                 apitrace-10.0 | 9 
               bctoolbox-4.4.8 | 9 
            host-binutils-2.42 | 8 
                  libftdi1-1.5 | 8 
                 openal-1.22.0 | 8 
                  linux-6.14.6 | 7 
                     ace-7.1.1 | 4 
host-am335x-pru-package-5f3... | 4 
         host-mariadb-10.11.11 | 4 
                 libsoxr-0.1.3 | 4 
                   perl-5.40.2 | 4 
amazon-ecr-credential-helpe... | 3 
           ghostscript-10.05.1 | 3 
              host-rust-1.86.0 | 3 
              libopenssl-3.5.0 | 3 
                     avahi-0.8 | 2 
                  bcusdk-0.0.5 | 2 
             dahdi-linux-3.3.0 | 2 
  ffmpeg-n6.1.2-27-ge16ff06adb | 2 
            gettext-gnu-0.22.4 | 2 
  gobject-introspection-1.82.0 | 2 
        host-berkeleydb-5.3.28 | 2 
            host-libp11-0.4.12 | 2 
               host-vde2-2.3.3 | 2 
                libsepol-3.8.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  ntp-4.2.8p18 | 2 
                python3-3.13.3 | 2 
               asterisk-22.3.0 | 1 
                    azmq-1.0.3 | 1 
             batman-adv-2024.4 | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
               catatonit-0.2.1 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cloudflared-2025.1.0 | 1 
                   cvs-1.12.13 | 1 
                diffutils-3.10 | 1 
              e2fsprogs-1.47.2 | 1 
firmware-utils-86739f2b3ae9... | 1 
       freeradius-server-3.2.6 | 1 
              gcc-final-13.3.0 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
        gmrender-resurrect-0.1 | 1 
                 host-gdb-14.2 | 1 
       host-gettext-tiny-0.3.2 | 1 
              host-guile-3.0.9 | 1 
                host-m4-1.4.20 | 1 
               host-parted-3.6 | 1 
                      icu-73-2 | 1 
               iproute2-6.14.0 | 1 
                  jack2-1.9.22 | 1 
              libebur128-1.2.6 | 1 
                libssh2-1.11.0 | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 
         lttng-modules-2.13.10 | 1 
              mariadb-10.11.11 | 1 
                memtest86-7.20 | 1 
                 netsnmp-5.9.4 | 1 
           oath-toolkit-2.6.12 | 1 
                openssh-10.0p1 | 1 
                 pixman-0.44.2 | 1 
               procps-ng-4.0.5 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
          sane-airscan-0.99.33 | 1 
                  snappy-1.2.1 | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
   webrtc-audio-processing-1.3 | 1 
                    yajl-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/c592966e2ab906676cb96f3896db61fac2a0ce55 | ORPH
   s390x     |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/058c8d1c2bfbc3dcc91e28eea6fb5f4e4dcf44d6 | ORPH
   s390x     |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/846d459b2c0434c2d44e7f93739698cdf26ea3c3 | ORPH
   mips64    |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/70020290f551edfe82d34590bff76e5c56a760d5 | ORPH
  aarch64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/be5d646fb88954738734256afd58e85ce38f3372 | ORPH
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/22e6d027b8fc4084760736d02e7f4c6b406d80ce | ORPH
  aarch64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/80e2eb6cda50a6f1856af000ed41ec668cb380ea | ORPH
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/ae16ed0f859d26f44e089f61eba41f45a3d884c4 |     
  riscv64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/e610f4e35f1329f7151a3cd48d25790b776cd70f |     
  powerpc    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/195e3ea8089ceb58024ff687735d5bbe5dd20f55 |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/845443db92a0d02e3a11e09c0f3845771732b35d |     
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/43ca70d24f6f56c507bf9bbc10ef11b16f68e46f |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/dee853b851a628285d2bdc896208cbf67fbdf1a8 |     
 microblaze  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/99101bab17b5c2a24e9786ac3c68f29232532a9e |     
   mips64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/1ef843a72ec24eb53fa594e132496cafa3adf454 |     
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/723d7f55a68a685a1726f5168691aa344d92dd17 |     
    or1k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/17a13f7bfd81c2d003f0e61850388eaa1e1e4705 |     
   arceb     |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/abb835f735d1f40705588a4320d26e9d09f4c355 | ORPH
    arm      |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/9562b682f95793041d385f5fe5baf27cfa8a7eda | ORPH
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2b20766a3012faa3a02c65eb8502b43d37aa2312 |     
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ebc2d2c4d5419007cb0f4588d5add4a899b95c46 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2df0eca832af31dbeebd9d2cef8c036824e1da65 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6ec77b7e3ca9077d5918aa87dd457de177e4f4dc |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/661d00eb92ded4f798f8ced0266c7187058488ff |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/9dd5a5def8c3dc34198666a2d6b2c5b02ef3edc2 |     
    sh4      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/50b7bcd57fb403ff25b2d658ccd859fbfa50b318 |     
   x86_64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/ef62303ce72286558bd7436f429f09eb10df6743 |     
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/3dd4b3ee21b76f35a2a997c5fcb422194e7b85b2 |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/5c877de597e5d290ffdd97b43dbd8c0a9099a3dc |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/06a348c669a9d641338c7c70bde36c75f6a5e76a |     
    m68k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/09e9ab0e1a55d2c72801db88c402cad84f828657 |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/978821da44947ed3aea44a469caf778aa081dbfe |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c905602aded3b69f839bd5f0c7db7c149e782765 |     
  aarch64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6117939c5469748e50c771231e22702d99e7438c |     
   mips64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/c3b094cc52a843c62da84ba5c19eda14c685c31c |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/20475dbe7b0d83351182bc91397b5569ffbf3fe4 |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/1eb11801bef81f27d3f6b314efce418515f2c3e6 |     
   armeb     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/757943167aacb379098e5a7fc9bfb5b9933b43f7 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e39eee76387e341e391a3536fd402e594a044e9e |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/87951c6dee5397f47262e4ebc1c6228a70386489 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/19a7774e355b1ea51dee7a14f7bf29cab3478746 |     
  aarch64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/67e34d66b5fda4a0301f8625f72688c176c60c7e |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0e526d387df429097feeb540f0dce7a6bc525658 |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/cd1200a5a1cb67b01bed35738be5576033338fa2 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/76e813507b614319433d2200c6f17237fe965eb7 |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/278c24ce389262b7fb97c4743a814c5e1be9f359 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/84585c6e66f80d6f7e2ea5c53dea594e968fde07 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/61db539e2538b3f59fbb3d61956f6176686acd18 |     
powerpc64le  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/713a554208e4abd3ce9f91e0047b2794927e10ff |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/d7b4040f700f8e95126f5c93b92e979f8f91098a |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/90caee709bcfa487c1075d79559ab6b2fb681992 |     
  mips64el   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a36a8c673d748cef1eaee5af71bdab5ac093611e |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/dde763f309ad0f2ddb917266ed128fd0012f03ac |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e3d2363802577fc79829afe7f24590c84b1ab98f |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/1e6a6c38939018c6a9867aa8095ae06c005fe5e0 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/71ae42f790f4e95debb973684e0fd08b29c972fa |     
powerpc64le  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ffab6d4049093818ace9f84f5f1389d1017ac425 |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/990ee803f034518c25dcc9bff7bb42d47771cc01 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c8e46f50b7e7a7360d4aa877b0413ff512ec8aef |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/bd30311495f7b61dc9bd76b3fc2926b85f23636b |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/657e5e342d70c5f1225f3b6eb2b90032eb9ba260 |     
 powerpc64   |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/15b27b5cb2eb0a47c4eafff5397d9115431b8ead |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/c59308e7594a8ce09c47ff287cb3fe1a1b7e2664 |     
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e2822459029de62aff49b06eb0486072fba209b5 | ORPH
  riscv64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d3bee6a684b4331ce5b6779257ef0d8efa6efb80 | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b721aa16a7ad0d97516dd33273f55d442702773d | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4043a864877d963c8ce602a6c5e2e34b4936c675 | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/49b34b37c201bb5e8a7e54796f720086cdd98303 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/13aff2787ca0afaf302ebb603e61bbe4fcde49df | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6c1dfecefe03a2de91afc72849f6fec545e15663 | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/8810b237c047489637e832872d5714cf39aaec15 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/40bb84ace141d5fdff97449d98f47e262a812ace | ORPH
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/6391045141e408513eac92b69a306e067a452ede |     
    mips     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2ad99b642c967f26a1993cbe3778962d34936251 |     
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/65b5884f9c48a2881014051b486e53ec9fb90574 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8070321fa86b39fc7c91f1cf8b5eca7f64e5fa98 | ORPH
   arceb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1451e77eb4d9551b21efc3f7f12dc3d3c036c9cc | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/80471091e1c071af30cb219f11add47d1b6c08df | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c147649d190fdfe57b29049db39e9e260813f435 | ORPH
    sh4a     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/654484a772268710df6ceede8410c98908ebc77d | ORPH
  aarch64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/dae11c8e6c29c12284dfef41f12c55e4252cd9a0 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2463961dde94bdb50945031bba5d6a7227f2c99d | ORPH
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6a89657f0f0162914089072842a7b26ea2389a3d | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c6e733dda442c03a0d86135e792c155f236c41cf | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3b64f975562b3285f88af8541514f881b3942909 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/371fe774eba468ef3cdccad0052b268903627a78 | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/da7a54340b4c14e66d93abd4da06b64754fe61f9 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7db3b163305de7e64ab9eea7537ccf23a8179cf1 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/03a3ba9cfa19edb83155d7672909a863e0b90d2a | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5c50d713eeb122f031baa98b37f128228fa737d2 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/491591674fd6bd5bc824139af4e5e833e4ed557f | ORPH
  riscv64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e2c5b6d5bb76fe2fb6f2adac912e479e18ddddec | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/516d5ebeebec25bf016c8420558248155bb4cb75 | ORPH
    sh4a     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0121ac0e92e998fc38ba2c38d44dc92252c2ca5c | ORPH
   sh4aeb    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c6371c0c5abd940050b8b5a916102b7316afcede | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/efbbbae3c6990774eebe33cea429bdcece89a891 | ORPH
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/9630f09de7a5c8b1412156329a6db7501d4bde18 |     
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/f54d6c5a0983d15bdd3ce27fff40931ffb1ad8c2 |     
   armeb     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/83f23018b5aa98fb0fb7c10fc53455b6e531d7a8 |     
   xtensa    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/9c914b57f31c533b26372efdd1ab332be7192c5d |     
   xtensa    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/9b5beb290560412d781c4e66f95d8808b43694eb |     
powerpc64le  |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/e2be7d9e09cc6f15091e17c5cdc9159411c023e5 |     
   armeb     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/88ef196b5e37c4a53a63a1ec106f6247fc953f75 |     
 powerpc64   |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/24eeb77c7553a7dc2f673f3e640e79e72915c34b |     
  sparc64    |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/9c0d18d81b1946b9138f7852b62018f92f2bc161 |     
 aarch64_be  |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/837b0dfce56d7c4cd3dadb373f93620ab9633459 |     
   sparc     |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/e82e7d50a8ac23eb7710e00f9f8446b71a89d0ee |     
microblazeel |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/0138936320bdf506e7fd124d9748ce022f8fe71f |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/197527aad9a33c89afac0d335fc7dd66e2ac0093 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | https://autobuild.buildroot.org/results/828c9444d20bd928705a5d3d5178940c6228764e | ORPH
    arm      |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/d6d4cbc9012a9eb349e6e9817c5c79f301986d7b |     
   sparc     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ee1be4f773b8bacc11c5efab55dff42b94d77431 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e1a9e77f8ee2d7413902e2fb11fc2e1f5c6f3bcb | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7684ec9dafe4ef1bf9e3e8e08b92ca5c8e6b6026 | ORPH
  powerpc    |         diffutils-3.10         | NOK | https://autobuild.buildroot.org/results/3ca74d71f0d952c184d2d497dcd3bce7da318d8c | ORPH
  powerpc    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/495da72252b69f47805c6b17fa70188b33625933 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/35a7493878ca482d2d30266b5a220a62727461b5 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b97e9a6584887a012996d1432c3d1e346a1b0be9 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d4a80f3798af1338f7995952573dce7ad99d704d | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/122e298e0b44ae2868e9560e7faf1b8f2278df4c | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fa8482183db40c1dff46289c9e6d102955d15734 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/547015b3d987a93975203875302498d7c4080310 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/5c9bb558c17ed33e6546bc1c7821981958c834d3 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/37ee93d82472998facadc3fd65eecddf46141315 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e8cc097dd647d6b3bdde3e87b3e444596708f684 | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/f633b6567fbf33f4ae219bfaa05d080f106aa71f | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9a7a7e625b2df925b78cb54d4d2e55269bea0589 | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/0bd94e8ef7464347d96e0a3492835515b560d940 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/884d0d57d13b21b220e19e710a89e22a9f12250c | ORPH
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9edcfb195bc3b5038b9b2b7b4252c10b73ef19ae | ORPH
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/19cba243ffe0e999b500817c2d5ac5c55db5016e | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b180df5baf08c58d805b1bcfc27b518bdff1d2c9 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/eb1e1ed74b2b65498d1ebb9277e2566dfcc0ed61 | ORPH
microblazeel |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/2f40702be7723b9a1e1c157ec6bf30e4f5dfe990 |     
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/270996757adce77ee43528138c28929773279a34 |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/4c03e18b42ea161bee42f5189d4b48b5493cfddb |     
 powerpc64   |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/c52d2e64cf3145fd56dbbfd3038c92c38df5fa9d |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/9684e58c06ec2c739c83387d3616d5e2fb93a69e |     
  powerpc    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/0c9f2b6b39b61099e1e9a22910e0e9f7e4e847b1 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/9645d7f2be1196173f90068a0226284876cbddcb | ORPH
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/0077915c8faa1c80b158935a189d1562597348da |     
    arm      |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/8cb1eb40cfc695939b64069b54bd23eaf6a3a201 |     
   sparc     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/828036dd0b22d70c6fd69fffaf709252cfe51fb0 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/45a036458855f9afc46787c3077323b566d37301 |     
powerpc64le  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/f79905491a36ef92b4f5875d9626c243186944ed |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/e8ff8e8e0de6c4ddc8c3b3fbfb2e157698a861aa | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7695545b996a10e6982f5c7995c50f25fed2c1c8 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/7f499d0cb60ed443eb965334437df65f901ed56a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/556db2cace91fed6a41a0dcfde4f1611eafef165 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e3eb40dbf98dd6fbc0c1633484c2af52e9bbd025 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4c6575a6016f2fd1ffaf1e603a931cb29ac72cd8 |     
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/7f0394bdd27388abded0dc9b8dea78922c5d2c37 | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/b1138ea849c7de961ebb528c30d6e12c05f4d940 | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5db4ed12f3c69dd90d25d0d1f8ced13cfa5403f0 |     
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/eb0352403aac60b927f7524f376168118b4b768e |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/9bfa70d0a4ac41021cbc14cae7cf5ece810d2403 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ed75df5ab374e92a951882f02e3385cbb7ca355e |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6c2f1e9fe112352d860d951f984e0d1871c493df |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/920c35a68af756abc832b2d1149f62998a8aba7e |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d92a29ad6d8c6b5d555ea67c044f2d37642d9a42 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/09e8ceb13aeafa2817ee5b154024ce32876ad69e |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/093bfb2d3729160a96c95f908ed076042442ed36 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d84ba4d0e5745c5602db12a4e092e08df07f3983 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a6121f347c6ecf247efcb5fcf8922db63ceaec90 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1d046aa2fbc0aa036e5bd40f7e54718d7f11ebd4 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/89cce959c86d39e5e03897ee6567362b21a052de |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d04a85bcf14a64e32edd70a53c68457800de61e1 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9e2d795dc559f634a9d88b03946d507d12d5275c |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/12bb41e22ae5c2f092344265c41cabc47cff1f32 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6f280d5f8776e179936a6f306bc4eb54742911c1 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9d93df27b0f2740895fec80875e33833d76c3f00 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c1cbba1a019f205af9c68a659a026cb5a6baeed2 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/da10a0758d930be0f36b72fe0b1d71cb44d30fbd |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/134bf0bfd86f4b0df0c9e7c6f01edc4beb9a8b8e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a165d9cd897be761994587c1ffd60d27740289c8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ac9e6fe9ef9e2ae3ed5e811489c23a571e1d0531 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ea72463b5e0bec7f7c79590a2cbe2e4d66b206fb |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/239d306791618bb7de0fe7e39dda46ace5e06827 |     
    i586     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1f1bdeef58a9878b54c29a99369e93f6cd615669 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c29d47be728f3d1bd57c4786ebc4c73b742c9385 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9891ded18a5d6778e89dae9b93d6458de01dcdfd |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a858c63053cd1f6891fdb22851064e7e5ccbe6f2 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/489588b26ec9a00a61aacc97f87667fabbfcfaba |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/22967cdec90aee11fe7f136868fce5828ce2e604 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c16be20890a41391c5e1c5e840f4709a2b5d17af |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf1b8f8f0307c281cd1712f032493ccad04721e3 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5c27e863c6e200374d0e6451339e589cdecf9b58 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb90c61e21115bdbd83ffb079b378120efe583c3 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5da161457f51cdcd5e725abf4f5bef70cca1da65 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/65e4d164884c0dc6ce7a273ca775f11f5a489eba |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5f3db6882b0560986c1f844e227f494bd34d041f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5d9db83b8907737ce410a0bd70826a598d3dfef6 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6cb335abba25cf4b21dc74a1b793728445dc2489 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/535724e8f0801701373ef30caa6dc4335aa3cd8a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/901a3e0a25c23861ff6ae4f7dba0c5de44854330 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7e08eef31b532ef32be778e7ffc9ec721b980a18 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2d43c4723bd0a1c9be90bee6cf41d62849bb8da6 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/01df69354c4e6504263bb7bf4684a6077efe2c09 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b3aa6710e972e2ae7c84b57d92e157f7c629f6e9 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/607b888463f681ba00cf3c637045c0e073f060b0 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/36d15318237320342d788f3dcce8f9df9e3b4b7c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1bfc88c0c61597c99439f44e74f6c992ad38d946 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/251f023facc26c7167564c465a76650aae009704 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/97421dc0376ce5baaa02481d21cf90fc70c02945 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6f5b16b2d922f2a7f9fc37018cd9e4c2aa083dbb |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/71c32a9f5d4d240a052d022240aa7c6d1540f511 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/14a3846127e1daa236babb39d27440da24952ee2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bd10c6177c3d1d63c3ec88956cbede777fc44ba7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1c4a3052019553fa370894a2e48190e576b4917d |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/790c3b35210c1aae9f53ab9eadbd7e69f74c81a8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c3cc48f829af48fad69b8079dcd1d90b18ee2ab9 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/94f924cd3f16e3cc81e4d6f5aee97658ba69a286 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e2e0c98e46c80e8e613ef89f3842a7f6b7542c1f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6d649dd72b84cc994f1a8e99d30daba1b7303a12 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0a3c58b4511b864ed96ea7d5f312dd0d7ad85bc5 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b7362e5e0162d762fee63b7c6ebe4286bda1c222 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b42a2c932ca74036eece655d7f3eb1eef06c9362 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d647ee0cbdfee886748dd4fe5715d42db1efe6ce |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/892e9993970d97f362ffcfc0c0d90b3f5e90d112 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e90d975704db0d252ea03ba87ca4d110aef57e34 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/389ad8b0cdaf05b8e30bf20eca66e401d4887534 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/26515967eea087d75605a1370d9e3901bd1a1c5a |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6b96f3b327a32c3b5d7312e025122addda56b0fb |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b5e6f1279cd4a4bb70d169427af021e142a01a1d |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e31860a92d4893d211b94029165d3232f071e33e |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/25869c46e940e425828e0872ee7b8f1fede126f6 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/e09409382d219a4223a6230bc0c61e48c655af4f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9f7a7ce81a31d047decb35f15004c69da2005ce4 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/97f209305c64857c1f23b01bb59db27997b2cd75 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6ef6f9cda0e8549e02408c7ced451b75a29f4ed6 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/775318401c2a0eca0003106ac5438fd4ce78cbc9 |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9dfec08d8b6c0741ba6e1173dc02a28ca7dbdf87 | ORPH
   sh4aeb    |    host-gettext-tiny-0.3.2     | NOK | https://autobuild.buildroot.org/results/bb8a6a0f7ce873be0d7b5361a7f3ff7df6767993 |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f1a6636aa28f8fcd0747b0790aae73ab7c8e7552 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5ad825d3daf430117dfccc0185d25cfcf79ce093 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d29a601ac5b8b48cafe3981c5a75888309044c87 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0c586ddc40af2c5b38b302df727442a34a6c4766 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f1211b7a727426c514b656a960c5e70f61bdd116 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b8e25f092b171bdbe011fb800887dbbb9d9c17ea | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9efff0bbfd73ee2be909542372f03616dfd46eff | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c9ec482813afc532424a511469e1a4510ac6670 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/67c5791d7d15c1190e6a01fb0d5c71a08368f819 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6dd9d00f4471654cb6061e36bdac5119f78643a0 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3827dd6ba1765f294d52c783550f68e9e2d70af5 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/732ba06e281b63ec94758ac8f87ab784657c78c4 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a9369b0270727e519022980500b34eb39a9b6454 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/70023acc66a69427809f6bbdab17448330a56c32 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/27f6860dd0595147692816cd18693954282a23f1 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1393c8dcb81e7c0363d967fe7d025a7856152f55 | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/38c93194e5e2a53dbbfff51d14acfa9f77153936 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/10789d82c289c0c2dd9941854fd0713ab28df195 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6bb971bfa15c9531904ef77d45c2f6bf7f68b5e8 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9913c5ac54cd1e7ddb292f2fb71fe6709f2137f2 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/492a75605ec98b9325fcaadf16119dfb29d87878 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/887d400da964bf0b78174a92fe869c100fdacc15 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/49b006d705995f63602a039f1b76e1e98ccd594e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/760ffd57b7499f11e14cab99855b901a5618c3d3 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b1994b53f0419bdf53ef922402fdaee8c4d297c1 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cdc94836bc916fce68dea3acfcd1fe97c8293b5c | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e6ab344dc6e3fb9ec53fd2e0b44c18c88dde1fb0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b724db8200000b7dc2c40a4d977df00accf6ebd4 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f24ef638f4c46d429b6dc81f0944d3c6ba494765 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fba910065567f231f1856e17a8c725128f413df7 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/46c9d59811fa6f5f8a3a958b32d985588bed4888 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/415eb33de3d9b14a8db049119354a9dd83051f65 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ada9bf24bb824290760cadd283b397e47e7cadcb | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6b54878b3a3aa362d4f8d19112da909ba5e98595 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0ce59fd90d78a9c6a7c5d8ee9a5dcc07c8e53c3 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9aac9b191032d33d294fa9a9073322a88514efa6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4d560615a1f20f5dd55c7c3d4aa63c01ce87a7b0 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ac736992efd210bcf35c38656405d75cd4f47df2 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4dd346681ab900b54ef6483862816b2cd916e32d | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1cb96afe4cc31433e47764ab968029cf5e9b2170 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/883265b0bc65aa219eec92718b08e92ffcdfd9cb | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6f72a39c624b9a9563345c3bd2bb717b5dea1156 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bb86fb173b8c8aaddb3648ddd40ab0cf4dbc092d | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/42409104757280e203becfc2384bb4078268bd07 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e8d4cbcf7f8ecf20a97287d88498698b17f30eae | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c1e2211ffdf4f862729ea9ec809d88c756ab8411 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cdb7773abb00b1fe1b1f0bdab7ab0157e72a0e1f | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5a53ebfcdb1593e7dc073c9766bbe0f3b4e14817 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a9ebf2e9bc1c5dde4f09889354c321d4d058f9fa | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/187698f5d951f40dc4749494fcbd2ccd3354a544 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7d9bd8beb049df5a76e1c81f96b6eab2f24f786 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/13811b39f9cf7e7f088b83d5220f7028d6657518 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/949fc9150f2b1d2891e532042dfe37cb4147422e | ORPH
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/1e3feef5e484f8221e31847ea5b813682e9d9cdf |     
  sparc64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/1c9f6a90fd4d4610be7dbb69bb1872d7ebcdf377 | ORPH
   xtensa    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/c632051ac6099b7689b7ef5c4c8544c77b295f91 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/42af185d7ef1187e94d4629572a3df80c1dd3d00 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4367d44ff95aadf38e61bdf9a6cefc300d49d9b8 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a5f52b3d7578851e64ec8dff92474e4c80bccec8 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0ea681ed84cf91488645dc4285a97a94fe541f47 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/add6fd49bae1f329b6de427fe485233e5702f01b | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/405fb4ae7e552f8adc74469385c6330f79e0be7b | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/cc48326d39a46d9d41623ee817901c3207b392c9 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5a52a465f5ee756af8711eff8cc5c8a6b85946ab | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/64c5351e1aadcae7e6776843d477f0e44a7ed8e2 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/302d3df5eaa87e775cd74116015945612853816e | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/86dbbc622b82e6d8e19ebb0aa44d2279ca68756b | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/eb171dfdd2bea1878d0af6f3890730d6023d7c45 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8ef71ac2b2c517af90fc2857e7df0a394975aaa0 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/53bb507a4bc1846f4717bd4fbe2f34239b0bb804 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/86ea6d68d02ed2d09a92b984262638fb547c0b68 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4842678801cbb315af000c0537f9e2c70de703af | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f6ca54470b2efb2cdb51859914d86f5575c8c1de | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a795fe1c93d31cf2463c14271683b44b8ec654ec | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6fc58e7698c186167249dfd00555a18c16ba80ca | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ead9e449319a923609379295b4b1c110a00746d0 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8d09e0daf64fd565483bb3e61704c5dec4aea073 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d759c7006370cd1abe7eba05e8f69d09b65ea101 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ce86eb7ef4d6bb1802a41d03dd956dba419ab847 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/cebf91e28728d01980a468e3430540c1ee86416f | ORPH
    i686     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/735fcac34d1f52d04c5deeb27655fd0cab2b9a82 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c367f745d8c21f007b8f2c85fe80d529c231ff76 | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/93307bb91cf3d7d69f2684df93371e56bd12ddbe | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5697a16680f77540d68ab61a77c85ef61ad3bd55 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d82766a569e45aec6c0075ae6c3a3ecfd46e7154 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d903dea9db5bbc26af0d1e4177bd928693f82fe4 | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ccbc75dceb10532b0c478e9f37abbc153358e4a1 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/779f05e29a52a86a6dc34002c8c5bf26ef401209 | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6af96a3ac905ee46a327f97615c9148c530a86e1 | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/11fde7d585cd4784be809ebc4114cebf9d822f78 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/014b0eea48c94a336b8249521732d545f1ec4549 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c439b2c68806f6c859a95e0231b76a9bf08a0e3d | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e3ae88db51fcaf073423345116766600551cd30a | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/1a14c2a168c88f323a9caf5b470ebe44aecf0212 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/824820c8ffeba46df646fbfa367cdc3fa00aaa84 | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0d6527eeb72664220116d2aa19414c34110de0ad | ORPH
    mips     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/aa096df5ea30bc7a106badbb6d42ffb3c507de1f | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4f440dced601de3c46538986981511cc6ed7052b | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/05a435d6675c8369b7e84dacfa49f9fe6b130380 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ace53f1ad4e5ac936f822f7831c47a4709793eb0 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/d38b9f9e93f68459c5cf6bdca9e42e5583558fc9 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/18e66cd28f5783a73441831975ddbb45e2511915 | ORPH
    arm      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6c565a7bf33432f576a84b8f3c0cc85ff329bfae | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f5219d675a085184ad1b0a3e9fdd263632e68620 | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c6e35f38bee3058b6351c3783d8f38bf63473c28 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/80f3c242167b35ac98143f432b5e65232a0175f3 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5dd875759fd66efa1614b7874bccd0c48b35c0e8 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/7130f89350596d6ea0f23a6120cee8da7548720a | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dc414c8e532c6c44b82a07de0b683c56cbd1397b | ORPH
  riscv64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/30b143e23e6d07d7455c7fb17e176e09ecbac086 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/640796d3fa618d619ecae3df9d873dbc17c6e4ae | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/15131b3147d44882fef03c37dd43e13833970eab | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c394411e4331cde15c2cbe233ec48990831b9a67 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fadb79a05cae1722abf23683d04048cab7e17c01 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/88b401798fca77ee7eff74f7c0bd8603ed0ede66 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ab84c6b56b5e49f2a379736f3f962179dd47decf | ORPH
   mipsel    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9ebfa4a263a8924409dade19077a9f2df8e32698 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ac724e4810562b725e62f93d044d21c027f19b8d | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/40dff01a4ce1be3dce160a3f9f14bd86ccf17bc2 | ORPH
   sh4aeb    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8b8bcc65dc091e32a03e56568dbe4a3099fd7fed | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/e30f95e17d03169b07b58f1d2b981d6ec067181a | ORPH
    arc      |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/47957b066bb28d7b67495efa8a188ae9ac88587e | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9bbd4a39ea7c6cbaad576a66a12783e7382c36e5 | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/ed5759815e2aad71c3bff73d74f0fd6dd02e9471 | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8b9aba84eb9e923c230fa0e84f87d38614a6eda0 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/21b46bf68988318dbe4b202fcec4b592e0286883 | ORPH
   sh4eb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0bf9c1e958496a154e8285f15671d6b22b8ae82b | ORPH
 powerpc64   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/737f101ffca097742952f5b22ad35eafeda3b427 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/fec45b1eefa2c8368fc8903f8b60b6b48e8e1b21 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dc9367969be675421ea65f8b506655ffd4cafa91 | ORPH
   s390x     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4b47f04a257a124b6ecf789e6efe6b952c5e2468 | ORPH
   x86_64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/393d2ddb8b4b14ea0d10bb523351f2a2b551b1b3 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c867c7b2678dc85f97ecbc703e3e198291c72097 | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/310f384e809f7006c25edde136c276cf33ddb9c2 | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f1c12bb1e3399b33768f07e452d73d987b996b92 | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f93e9167ef5dddf1fec38470bae8206804a0a3c5 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0dd66e3c3eb4b3d72b343f242b320aed2f8bd930 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/63580d5c6ca27bc3940c64a006c0cfda5bf1e02a | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5e0b73d81ab77207d71eaf3b686cdbd79e430feb | ORPH
  mips64el   |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/dd167c75b40a3c6fb2fa6f19110062cbbbf0bbf4 | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/865c2ad0621fed9572b39e425f2b65afe48006cc | ORPH
  powerpc    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b5667804e1aa362ef68e2828189d659e930d602c | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/00aa5ecae2e2c4708464b0e4569b42e51d7af384 | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/cf100abe701f61f541d73d5500b3c5a3911c6e6f | ORPH
   xtensa    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/6215557fead281747431b17bf9584b95ce13f14c | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b65165e194f3e9fa307c7345dff2884f27815469 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/57313b61fb7428ef93776a610825c67e351cdb30 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a27c422c8c8de755fe7ac8c8fd33950edde62ac8 | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8040d9bec1aa6871ac0ec7d381370c475c9caa28 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/a190ed6538e5baade52c2f8912eca9b3c402c9b9 | ORPH
   armeb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f1aebb3e3f97a3a3c87f4ee34654cf56910630bf | ORPH
  aarch64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0a3daffa0e5457afd5fa9b8d254bbf91400c7d3b | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b3ecefcd1eab54923c73814abf8778541a7c3aae | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/be486b755b20d306ebcf44b9c7636f6ac394e35b | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/993b790fc040206d8b7d69d11040ea08feeced9e | ORPH
 microblaze  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/37809afb33b483b789bf08fa1d41df965cd4262c | ORPH
    or1k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f8e5dc44bf9fbd7889d39ff6d35a99cf602c3078 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/b7ef09be9def627db904add573771e09a59acf99 | ORPH
 aarch64_be  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/98bf2fbcb95c2048360bd74cd3a310278b0c8dce | ORPH
microblazeel |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/8fd63a6cf52ec6f11a8b3edcdd72e9544360a73e | ORPH
   mips64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/4571330d042f39a9e9e9931e1f07ec317376c2bb | ORPH
    m68k     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/c5b2cc706c7f77c37f4e09244223c3d05497130f | ORPH
   arceb     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/0a0e2ff8b287af6ca4be31a0a5ef019a51b2d4c6 | ORPH
  riscv32    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/f94ee317b1bb0089dfaf094226c3b8452477b8d8 | ORPH
powerpc64le  |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/9181a5c4f2b7e152b0351c72a44d82e763e44871 | ORPH
  sparc64    |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/168fbfb8a8d63db93eb4acee1f7854ffec5d0bc6 | ORPH
   sparc     |         host-lzo-2.10          | NOK | https://autobuild.buildroot.org/results/5e38dde5662521dd83be526b325c66c8dcece167 | ORPH
   armeb     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/a5ccda239282e79818ad9139ed73e601762cce9b | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b77fbd67bf6678f632767a2a8c84db7dc8d41800 | ORPH
   s390x     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/49a2c6613dbd0793dafc49c08f75eb96dc122438 | ORPH
  mips64el   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/50d7e67a724a7f88c84efdbfa01d6da26d4082f7 | ORPH
   xtensa    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/316e4f4dab6dbd98412cc4a71d90ac6553091e30 | ORPH
    arc      |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/07098791e5c0179ce60167346be15fc9b7566e87 |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/9207bcedb48d9606601bf178f8e7998f1e095f57 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/5fae656ffea67d4b8196f4110451a6071fde2ec4 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f9cad8251a2b5dd30cc7d9b4dd38f703b4940fa4 |     
  powerpc    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/1d111f4af9c9176c3bf5c0e682e28a104c294e2d |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/5187dedcbf6c76287b4e3483dd72176ca06b2ca9 |     
microblazeel |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/3f2cfdac3dd16c3cf80b71d94b6c0174afcc3a87 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/fe90cc1b5f7984e7dd93f5894a8757566d0e042e |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/d8c002acb46fae973e4e004ad325eaa177806653 |     
   x86_64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/3e65e30eb1bb9554ab390ccdef2007e688d5f57d |     
    sh4      |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/31dc09922efb4560d45d04edef1e2d642f651a73 |     
   sh4eb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/55874ec3bc1216c6689861eb22c916d93d7b3527 |     
  sparc64    |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/ee90afc5ccff80d8c9f9bff6ecdffdd15bd33d80 |     
  sparc64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/bd4d95d00aecbe900afffa6e21e83c3babc61906 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/be10197f3d008f1b65b83f789b7ee307d6ce840c |     
   armeb     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/0746b406a89f08bec1ae8385a7111240ffaefd2a |     
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c7fbd5723f0a65c26bed56f3fd2e0c5f054e0920 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/b581bed75a7bf0017025093c50e630168e5e13ff | ORPH
    arc      |            icu-73-2            | NOK | https://autobuild.buildroot.org/results/48f47a139f6d9a9373fa5b34633499ef1bf4b619 | ORPH
    arc      |        iproute2-6.14.0         | NOK | https://autobuild.buildroot.org/results/e24eb919b66e1622ea0671ee9710c074630bec19 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/97d655b732d492440c15c51eda5c5095bddeebbd |     
    m68k     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/1e845bf4337941c88dc1cc8a3a3856ad8ccbcea0 |     
  powerpc    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/2f8253d0353393047b0cb15e835a6504598474f5 |     
 microblaze  |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/6190e04c8f6ddd3cfd52100ee50e72e20718ecaf |     
  mips64el   |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/abf8f8b5a8acc037793f7af903de1ba4df8a33da |     
   sh4eb     |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/f52665906d051e4724bf59cf5c3faa5d3bc5d3b6 |     
  powerpc    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/0eabfecc7051f5b4d8aa10bbe5d657db94cc5af5 |     
    mips     |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/fa5f74da66040e33cebfc67d8d59c1b3907206c5 |     
  powerpc    |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/d96718f72b11843f26f1c678aae495806fbb1729 |     
microblazeel |          libftdi1-1.5          | NOK | https://autobuild.buildroot.org/results/7f9b59eb445a40912e3415d5882696664a340fdd |     
powerpc64le  |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/9fd52e4bac72cd00b83c85a746560d6263b1da66 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/f3bcbf9600d7bef3056ea184c42b65c5bfe75e04 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/e7e5c88d675df7930170971e0fd4b7d39a769fc4 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/18924a56d1fe24e4dadf2d7de5e9341030ca01bc |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/996a26d31511d5a67e0ead9563f9e3d82863c00e |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5e912ceb6a08428b091fc955e9d91d407ca64711 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f8b9fc9164f5eeb0779e551a3a348c87a3b4b546 |     
    arc      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f862c28521bc73275ccc1ff7f2d3d1f399ecaa72 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3120796220e78abcd2c1eadb05ed909dfa5ccc39 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bd7646d0469e258f895e1894599725c054ab0ecd |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1428e076fdac9d2fc29b8e4eed63dfe57f581aee |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/88595105d480703a7cc80243f609fa3f43ea5dff |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/11601f34d722e805c28a3e63dc75e664b3fbdeed |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2b41b009c2240b1b255e8eca4879459b2a1142e9 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d66d632a2bbe6b11af7dd56ee8a7f1ae118f4910 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e72d10b81d183c0f95d0941722f7eeff16fd9b85 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/70fccd2a04449083b8a75a0e23a6a77813d25ffc |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/35e210878dede251bc49d13679be113c8ce24c00 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8fd3662839ed53bdcbd1b3b6f022a40b6f93199c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3aefdc0610d2ff489405141ecb874cdb8e1f9c19 |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/2c7dfb4f40ef84e629512f174db386264da0d8ff |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/08071dc5d53187d2ec524e4654bf9f51d625e071 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1ae1469294527151674ac0154af2279540d2c4a6 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/df33af439104e5686e477cd269703f5467fa53ae |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5b15e89d79c56b328c7e6a00d28d3882c9946c45 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/772fdeb0e776b0c9eea145edc46c25dbcbfb13a6 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/05e45258aeb370ddb3fde0ef3ae06bf137a24a75 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fc135703595f459844b1519532863e5e965d1e55 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/22a68361042fef547a4ef02599dba6ff47f1e787 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/566ce965a47cec44517ce95b7f2fa0d69a981bb7 |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5f91f785318e197c821937c61b19ddcf83b96aac |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/607dbdeab3b77e8f8efb6dbc01edacf953197572 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6e62696297c68dd4c47592b1f9c98e2311d66a4b |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5e589ae922131d0af77a8f6c7d30d0162fbab627 |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/de949acf86f0abe0a1955ec7ea00d8a93025dacd |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ce70d3a4f282344abb2d98e05124b2431ce34352 |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a003fd6ed9b321823c5947ca9716fc6319e53fc9 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/833b6edcbe1e44620843b51b1cb3ada5d0a22060 |     
powerpc64le  |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/f78cbfdcfdf623a1f2970e5358a92a7eedd250c6 |     
 aarch64_be  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/7637c11c75e554fbfe9e29c3d87929b4d3399efc |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/64c8643187dcea343d8d917aa0c9f9ba7668139d |     
 microblaze  |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/e0b65066e183b3be097051db02b4d75a2a224aa5 |     
   x86_64    |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/7142a64081ed32ed557d790eb36512553c1d1661 |     
  mips64el   |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/64a7152358c1b88c93b9515578c062bc5093a7ce | ORPH
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/82ffda506231144e9755fc8bf1160458d9d3d27f |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/adcbae6245812a71722ef676707681d0729d9059 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5f10a192e89d268ea443ed5390c766df9443b206 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2a89a08704437b6bf63f02eca89bd461361f08fd | ORPH
   arceb     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/4de1ef3578fb187daf79e2076048f66d63e5142c | ORPH
   x86_64    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/12e70deab18a52f5dafd2dd762b29967281eb1af | ORPH
   sh4aeb    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/c09fe464b4f617cc822f73de3988a39dad118ad4 | ORPH
    sh4a     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/b805a998d69996b9b49a57d38d1f78872eefc491 | ORPH
powerpc64le  |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/fd13c6c55d9709b57e4aafc947cf3e894a13c1c1 | ORPH
    sh4a     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/0e94b9310a7df295e00fb1997606a9c755a10fd2 | ORPH
    sh4a     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/bbd7416ac1a9d49ef0cb4460978fa2fedc6edb91 | ORPH
powerpc64le  |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/ae5dd59ad69f6be4ad8ba9a6f91ee6da4d339245 |     
    i686     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/16cee30c735972d06fd7f7fe5a0f25f40dbe0dca | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3699d480ac26ecc03e0cc94a3bf645373f4023ed | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/36a475ae9162f0eca65102bd25a212b428afba9b | ORPH
   sh4eb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/57409bb488e9bf9bb65b15ebe0d96d2be2f37644 | ORPH
  sparc64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/e1645090db65f74b3499d3f37b2088a29c5744d9 | ORPH
  sparc64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0b09820eb7b8d352c1e1861b1ad63b9eafd2420a | ORPH
    i686     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3856da627d04ec82dca329736a22a0648069da4c | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/c773fa883ee25e613cb00a1198fe7d3a49805976 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/bef2d29599a8c11069deff4e4e4dcb15c4e1732d | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/359363e3cf897d56b11fdde7a8883308f9ffeed7 | ORPH
  powerpc    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/0ea7ba21ca0d809f3bfa4b34e9a5f1c261464b41 | ORPH
   s390x     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/8dd28b313cd530fb6c110c5fa5fbf0e42d348664 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/425d63deec24a7753a008d8bbee3dacdc7b8e9b9 | ORPH
   armeb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/f1494a32be912d474e939bdcd33dcf2503ff2096 | ORPH
   x86_64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3e4f4ff57fcae3df8682ae09f5499d4b005f9f06 | ORPH
   mips64    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/aec2f117203744a33af70d08ca963597ddf24c4a | ORPH
   armeb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/be902b8ef50399c69e53b12592116cc566fc2361 | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/a3c3015a8b0979d4ff6b7138a8a9e2f799577fef | ORPH
    sh4a     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/f920b5330d2af2025f0b5d48c4d47e4802738d75 | ORPH
   sh4aeb    |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/862ec6239865272cd06ea95bc3d19aadfc4af279 | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/3fabb95812e9b74332dc8f982909917ed213c3d5 | ORPH
   armeb     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/daaeb0dcd2fbe01077e803a2b06f8cc65a056d73 | ORPH
powerpc64le  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/c8ec4a0963b91a54ee446ba62c5d7d7344ebc2df | ORPH
microblazeel |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/f9c434f4aa214ffaf5767e9c78a42cc628e5bfe0 | ORPH
 aarch64_be  |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/ef85c65c66a83cbe1f1d773fb7384b5557f8acb0 | ORPH
    i686     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/c242d214c5326b04ffcd7511ed017f168713fce1 | ORPH
    m68k     |            lzo-2.10            | NOK | https://autobuild.buildroot.org/results/ec1a28cf0e92ac82a5dab6862472a2bdfcc98db3 | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/0a54b4ef060ce4bff023d3d7be66af1b2f0687ba | ORPH
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/8626d679d872e5524a59558de13cf6a8c15077b0 |     
 microblaze  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/98ace96a1c22a5207ad2c344a28e63f386c18251 | ORPH
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/19082a902ded8cafaf8212239a1d26003316a7b4 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/477734dfc1b0ad5f0bc4ba4fa821ee62983aa32b |     
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c1beb7dca157d3e92e4816890c82e2bc59e06409 |     
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/11d0b336ff0302b37658cbe4045dedc070d27e32 | ORPH
   mipsel    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5f84b0e128ab8986987275ed78e00effc271ddea | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/43a1441b7bd37b8551a7ed5db9bdd3d2290012cb | ORPH
    or1k     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/e191dd67faad1354f701e1815d7a90761a402d51 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/1cf957bcbbe093ffaa6b9cad0ff20ef13d89ea98 | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/3549f222a518237bc9db617da02cdef5ef4bb2ca | ORPH
  powerpc    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/bd0de86553fed8c69a38300a97a150fbff940a7d | ORPH
    i686     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/58920630bf19af509638fbc07fed9da940928c73 | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/c7fbd95b88860cd028f62a705a51284cdc33781a | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bd75c9250b554a2a9e9374caf8e0c704c7e9490d |     
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2b719ff4868b01f331b16a30c303affade414e31 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/0f200503daff807ef4fe96dade3fb74bbf1f5b0c |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/67c40037da90e6c9504bef814a7675d5d7c97968 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/ffc64985b3d4a2d69b19e403305b130532fe3b9e | ORPH
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/3a998e688ad3cb07b1d3a9e27f9c9405eab60e62 | ORPH
microblazeel |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ac81c0617451eed60f6466ee886aae885718f562 | ORPH
powerpc64le  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/78b2049d66a4ea432a07c3979bacb5aba8bb24da |     
    sh4      |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/aba712c015f9f7148a4458010e9a563cf6525d74 |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/589876f3df8443a9579eef181c39ff2ff9e6b42b |     
  sparc64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/ad47dcb9d263f1f621380f67d50a4e2d761f40a8 |     
   x86_64    |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/02c219e35ef318abba8aecd3d308818315c2f66e | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/877bea0fe8caab74171548bb847dc874c0933a21 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4e7cddc7e78a0fa490fc060819702555b6ab7ff8 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/d97684e12f8d09e85b083345dff50ebcf2d17580 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/afeea5bf337415761b47c7553ee2ab2ce4e2ff11 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/59c5fe03d1d4b2d9fbc50661a8c566eae006d43b |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/9c4b587ff14a36f32a8bac1af117d264195c88c1 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/59c4d16cc417ee9a7596f71c88b1abeaf55c8f53 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/23f648b372da2ddfa2c6ad10ce51069ccfe52670 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3e75adfc66db1465be035959adb4dc5aaa32bef8 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/349d17884d64f056dcb38d0c25785fec259b3bf5 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/744d48631efd9edf65b73a82696c63aa975c684e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/892ed11b5978f0f97fd151124ccd4bfc29b3353a |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/cbf323696f246c8574b3adca499be174b3d2fe41 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3423c7706b1d4ec5c5ee17b41e76700f6639fdd1 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/67315931a2d17229c80b4bba9d66a0cc68edacac |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a2eea0688abd5c9d708d2672c6ba388ce671478a |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/a27c7fd732a5debd1caca7309bec8cad247e8ac3 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e30f7ec60de84d640d2e23cb3b202945f1262884 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/5c98aaf52dcf54221ae98dee4f46fa91836d3526 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/52ee7f14f41be02f45e9fdf74aa096f96bdba33c |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/baeb076786a64b1eae1087af25116bd2d1306b07 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3daacb0b01943179552eb2fd2cee0657b1317c40 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/3288ff54f290badf34e2619fbbc65fca4d8046a5 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/92b69bc61b4b01521ea2bde9dd361e8b30ddbefc |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/35944a0731497d34db08f2eea580097aaacdf3b7 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3f6507ff6e7e195921fcc63d19f48fc30cab8257 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/0ebaaff20bf96463b84873e04cf3294f6fd44cb6 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/3781cd1514be55a9f01cfa0c8aed200f84eb657d |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/78bbe789faaea023710501030775aa8e10096b51 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a276f1fee563b49110b1d28ce3a77f25af125121 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/db5a7d90d3b8b3eaf5a89e2c617306efa265a3a5 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/560021250c334f6eaa2fff1b0d7a8d152b603e2d |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/4a9384797835f34c0baf4b76500c5e51015e8b75 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/c4d3cc13ee51582257789f60baa8f2bb614e3cbf |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/ed95bb4d2dd56f8b04346ca6d2a38ebe647c5d79 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/460e6d484066e6cea8e650c79cf8f300de74a43b |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/e2116492adf3fda22ace8c349f64f2bd02fe8bce |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/71d56120d3dec25f48976e228b3730889c08d626 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/0c410859f1f652e9c8c004c4b36f7665a87c77c2 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/1f1db03c31cd3612ee259b605248a765390801ff |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/64a751a1a848278004e535f121ff39c9abd0fe9a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0e6e79d50c15ac8ed8c1599978c3081fc29fbff7 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/6ca7c3ce46faf65ffa5336ba9fee62d70e6768ab |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b90c355b24300db196c5f93f6522bcab357e5cd9 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/aad7e8022e5cab4b9dfa635e0a3cb7705c43d3a1 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/fe2ebc5420e6fc92ccf66e4eee766b7c1d975285 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/74d64ff5cbb36ae535f431fe05e9c08db15c25a7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/4603b9c737fcc0a1fbfab3794deb3611ff55fd13 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3ec36493d396d0f9241835842a7314bf6204e2c9 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/794f0ceb78ca5378066a20d73f78e8fa61793a5c |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/1b3752f1deb2d5b3b97a87daed33beeff1c50fd3 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/672ba175ad1be885be8c219de1618146cde53b77 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/733137c0c7a9f9b022541414fcadfb76042aac66 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c25bcf9031e41de1e68c41088149396d49e1f0d0 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ab14540578398b7daea4d8f850b748ebc4d3899c |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7a69d0b0d813a9421772afc9a47fe613cd65dbb4 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9a6fd2b06ff262c61ced20ce00654b63770ff8e5 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/d3e2e35b5de7d81281892500d1241ccd1d2c97e2 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7bd077bd52501f41acf23ad8704d7e9a805a925f |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e270a836993822363dae7c1861024342f95a5081 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/abc5350df6aefc26728c09ad7c221ba3bda8f5a3 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/29c18cf1ea8462c1562b01e7abd71f59b8e342f1 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/9d654b328a2c3002fe6f9302e8528f2c3778ed68 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/7705d6c7f6c72b84e50878f47e57ef7f26e2b2c8 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/e41c8d71e8c322fbc1e8d212a1a94970ad44d028 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/bb639cf759169077ff565fb6bf0c11915f25378b |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e29ebf586938b6300a05abbfeece2e65858000c0 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/491778a78e67d82605582077527c950255e6757c |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/4c237bf069ad3a7414bad0ee13d294bdffff7fcc |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/e11e2f066d9ddcf918499c15184b2f9b467fbbb8 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/85ec5701bdf86a364763dd5782727f234d0a91fd |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e8043527d3588aef7b2d281598a7616b9508e1ac |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/3de0b81da763bf51a89736369b217f16b98fd4be |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1b78da69dd3e38250333753a75f537a5d875352e |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/d29748256d53c9fc2c7e3c9bbfcc91f7732cf4e4 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/403b175585675f91dd9759e750b84b7d6a8a4567 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c41708efa8d4b157d7f03cbef74ccc11284bcd62 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/abe6286a29feed25d786fdc5ae14bc9291695e3c |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/53784c22d00c5304f1a9570550292cf47ed12f3b |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0f447369e1c3fb1f33026fd9bf72efd08b1b6523 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/6bf07bf632500b6c433fd60aca9b0942588b72f6 |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/89b2ab867e46ef2ccda1203c60588a70fe11e920 | ORPH
  mips64el   |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/71c89206ffee0dc78419821679054dffd4733f78 | ORPH
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/2169ae45cf304acbf406948fd9fc513487252265 | ORPH
microblazeel |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/06d46a171ce9ea0f483bd58b7f45162eaef14560 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-libcap-2.73 | 2 
                   libcap-2.73 | 2 
                elfutils-0.192 | 1 
                    flex-2.6.4 | 1 
                 host-gdb-14.2 | 1 
          host-oniguruma-6.9.9 | 1 
              host-rust-1.82.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                openvpn-2.6.14 | 1 
            python-flask-3.1.1 | 1 
                    qemu-9.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a5ba3a21c06b5116d953a21755513afa1b719e50 | ORPH
  riscv64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/754fde7ac84440e17341915e8da20f7abd74ea98 | ORPH
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/8cb25d64fa58e84edd51ae19a1a2b4755abff4d4 | ORPH
powerpc64le  |        host-libcap-2.73        | NOK | https://autobuild.buildroot.org/results/1cfb62c8eac534e748afe37f94ae2291c104d345 |     
  riscv64    |        host-libcap-2.73        | NOK | https://autobuild.buildroot.org/results/3080ae53b7604e30c86e61b87d5926f98a2f6ffb |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/96e6ef3f10f290776984311b10f52b94bae1985b |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b352a0038bb8b2cd01bf841418c94df3824959d7 |     
  powerpc    |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/51d23496002583ead12459895ccf33a9bb82870f |     
   armeb     |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/e628cbc7922d56cdbabad98ccf02419d48b04266 |     
    arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/af5abc36f9b2c16f55c0c2c49b6963c3635301fc | ORPH
 powerpc64   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/97550d045096e7b868da14b890032810fe73d34c |     
microblazeel |       python-flask-3.1.1       | NOK | https://autobuild.buildroot.org/results/f35281a0fdb0d40c5ec271b598843a733671fb87 |     
   s390x     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/a223c540fa2c2d856c5eea991e3419b7c348f03c |     


Classification of failures by reason for next
---------------------------------------------

                    bmx7-7.1.1 | 1 
               host-yasm-1.3.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/dc842c022873794f49dc0d9ba1b18325464f3af5 | ORPH
 powerpc64   |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/c79a3de1b9069f48d335e7b0b8f81cd2139b4fa8 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
