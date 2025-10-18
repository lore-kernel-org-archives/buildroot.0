Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193F4CCD184
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 03:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E31AB83231;
	Sat, 18 Oct 2025 03:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iDkyZ1zqnvn; Sat, 18 Oct 2025 03:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF6081320
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF6081320;
	Sat, 18 Oct 2025 03:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9E761CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 03:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D00F681326
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 03:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwAxYgemGPAN for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 03:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 111DE81297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 111DE81297
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 111DE81297
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 03:19:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4711f156326so11054875e9.1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 20:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760757584; x=1761362384;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4qp/ZZNSMeRn9SrRYDDa3iCX4e3QzI2UtKmHeuUKnjU=;
 b=Np9jN1L7CUK4LfO00tGB4xFlRzlF1xwgDgXDOIYIs08DnL6O81O8XMFrAPfCo193y3
 aUFv6Azj4g5FhQ8FAhGNkA/+4A6PdLzfUHqz+Bvet5ULfET4BjITarb6fciDG/r9BhPA
 WrvxtrK22I7amNwj1EokvR4wIjbs9j3FgEnMuOMGzkX+Qh4y4HWXPCLWIgRaWT66D71D
 2jajlvVRhp/G4xqNt48HEUg0VYfod+aCrlLpnYh431xZOrpzJh8Cw+ajgtLkhYrvGGuf
 4QwSsDGbpwa0j7idZ7AAYYVxXnaQtFS8I65eG/0cj8m3IS5ZVK4sDWe8QXPboynHcjQn
 Cz1A==
X-Gm-Message-State: AOJu0YwX7IIw6A8PzL4yeCFruQXuVSuf7uRbYSp/KLn4IKa1uoCA5lX8
 VG8XYa9pRALUCLGZvRFIoLu3/SCvhUX3W8Wz0mS22mPmJy5sBZQSVm/KAqYZ5A==
X-Gm-Gg: ASbGncu2dozXliD1PEYHwlo1YcC7nzt64aHsvzkr8hAOKr+BRA2fSFooXhnlvBhcrEs
 pcp8JiJHDGq4KT1aKnFaRxVmKT2fi7rfxnE+OltGoVym8nHrjqIpz4pLnBVYcs/G6yyA2KFZ1TQ
 rDEPnK2SVALBBXDxSGeeN/QYAwTuu07/+mOlFl2s9vP0CXSJQTsMBStedN2xAy+pmFO+OiiNLDh
 yQV9szm1ZgMhz8WCsk22V1gqc7OMZ8oFJqkaFEvZUSCO6or02Vda3xWhgX/qLqUJ+EnR+WpgWLl
 c7YcFGCaNFrzCuvfd5QWGo4YpWx6Pv3URUZekT+9s733wRS6qFX7QtLP2nkDMCNwU+KSqpAEKj8
 zXPPHeo93xPVeYTmHA4Krb8SDBcDhvdSvEPTS6dr2fgg18vTVmiK5P8YzKxWNky+xJLuRRim+sQ
 FEVOJ5GvCT+ktYDAyA3g==
X-Google-Smtp-Source: AGHT+IEiylfxO5EIcLkdL2OCrCLDJXPTqZ/V42lZRs6v+3N75ymmqBXMN20r06bGpGZ78QSrjogZ6w==
X-Received: by 2002:a05:600c:444d:b0:46e:4cd3:7d54 with SMTP id
 5b1f17b1804b1-471178b124amr41795985e9.18.1760757583483; 
 Fri, 17 Oct 2025 20:19:43 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d9e8sm114339685e9.7.2025.10.17.20.19.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 20:19:43 -0700 (PDT)
Message-ID: <68f3074f.050a0220.3c1612.fa93@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 18 Oct 2025 03:19:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760757584; x=1761362384; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4qp/ZZNSMeRn9SrRYDDa3iCX4e3QzI2UtKmHeuUKnjU=;
 b=f3eSmaMlVuoa182WgDwlS6glhn2gkHaQ1bfo/fOSiFGUVl2Tzgi6AtkSNhm7Lkntbu
 RHS+eNqnwD/BXqPEZ2vGjGwYSd5sEyI7hsLiIkVxrGqRpr4WThG7i0AOZXEbWorRAd/o
 ZTe7iYN2t9R49cyG+7S8Hg2/b00mtyqzyQdAjUCq/2Vnkc9bSK4Eowm/Ug8z7u65z/N/
 StmmGzsnCsCtTCA2hnCqvxTrdlJJLfek/rBi5yl4iNODZHEoQT4m00vTX8xU3WGpU0OH
 /dj2jOXiW2fFdkeO75/LneTgEM3OjM3X8ov4/E065FtLENUfKcNS0x1GbCjfX2+lrGX1
 R/jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f3eSmaMl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-17
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

Autobuild statistics for 2025-10-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 14  |  0  | 18  |
  2025.05.x  |  3  |  3  |  0  |  6  |
  2025.08.x  |  3  |  4  |  0  |  7  |
    master   | 34  | 69  |  2  | 105 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
                  libsvg-0.1.4 | 3 
                   perl-5.40.2 | 3 
               bctoolbox-4.4.8 | 2 
                   cvs-1.12.13 | 2 
       freeradius-server-3.2.8 | 2 
                 host-gdb-14.2 | 2 
              host-rust-1.88.0 | 2 
               iproute2-6.17.0 | 2 
libdbi-drivers-0bfae6c43134... | 2 
                 libgee-0.20.6 | 2 
                  linux-6.17.3 | 2 
                 linux-headers | 2 
                    mpir-3.0.0 | 2 
                    sdl-1.2.15 | 2 
           xapp_xkbutils-1.0.5 | 2 
android-tools-4.2.2+git2013... | 1 
             batman-adv-2024.4 | 1 
             berkeleydb-5.3.28 | 1 
                bpftool-v7.5.0 | 1 
                    brltty-6.6 | 1 
          cloudflared-2025.8.1 | 1 
                 coreutils-9.5 | 1 
             docker-cli-28.3.2 | 1 
              e2fsprogs-1.47.2 | 1 
                      fio-3.41 | 1 
                      gd-2.3.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-15.2 | 1 
            igh-ethercat-1.6.3 | 1 
      libabseil-cpp-20250127.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.27 | 1 
                  libnss-3.117 | 1 
                libroxml-3.0.2 | 1 
                libshout-2.4.6 | 1 
                  libteam-1.32 | 1 
            libxkbcommon-1.9.2 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.17.2 | 1 
                 netsnmp-5.9.4 | 1 
                parprouted-0.7 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
procrank_linux-21c30ab4514a... | 1 
                ramspeed-2.6.0 | 1 
                     rauc-1.14 | 1 
                tpm2-tss-3.2.2 | 1 
                    uftp-5.0.3 | 1 
           v4l2loopback-0.13.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/3f64aa8ee077c98a1d791d6fc87cdf7903f583c5 |     
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/79a94cd9fba5566c835962b2e0a92af620c3dda8 |     
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/beff45364ce8714e04d4f36f0043e8299159a1cf | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f5d20fb986f11e78ec2fa0c7fdc84418e81bac1a | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/805a23b1f6607feb74b68d00627abffbeb9002a0 | ORPH
  riscv64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/aecc9b6b1daa1a8bcd90faa49615ee510d98caa7 |     
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/25c41c4c7c35bd6deba567e98a352684c6ca3f08 |     
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/49134522e028ca3ee5e6ec050c55ceee0a6d5b39 |     
loongarch64  |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/249f9fef63e5b91db100c176a399347de02eaccb | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/801e2710868534577f01af2353680e10b09b662d | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f8722a86b91cbbdb8f72283a26ef23270131f112 | ORPH
    i686     |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/a6f93a9642298c231f22cc3490de12a356931481 |     
   mips64    |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/d40c1d602868392b1337f54705a07c63673bd515 | ORPH
   sh4eb     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/a9a99e80c76c1ba3fea6e5aaa5d1ba10029dcf50 |     
 powerpc64   |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/f3a3146042f5869c21795a86d33f46b291b66b2a |     
    arm      |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/5a57a82800fb7a47731198effc15bd7044133c4d |     
    arm      |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/cd7c3c91893b6d988422c04fb942dfbeb3653f90 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0892101a0e4e6922c82ab94f4811fc971bc9529d | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d7cbac926934761dad4cb3d73e159f6210868759 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4a40d22f35148a9acdfab2619e62348e8c9fc182 | ORPH
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/83c0b8d619aa5f81c00ab434cc4e9c7d641195be | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/e1d0caf7410e532b5219795352e696691d27dc0e | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/5654f32928d0829f878838118fbb3abaeaa7f39e |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/b984c44bc5c15d367038033cd664306b2e388a8c |     
   arceb     |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/9e1598b5837d6bfa133791e4dd2807dedba23d4c |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/830df19d6eace7cfe2a5ceb423176832f8cea5bc |     
    or1k     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/f58514386557a61776b5451495aba6cf6b61ec39 |     
   mips64    |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/b78a07e0761f4b137505432070c4e90e6530b237 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8b2675484f16821999aa690576f4fd7731102a6b |     
  mips64el   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4ac0e28f3fd0bd3ba3461e0ccd88650e2dfeed03 |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/4cb22a3bb03713561107db546ba3916091dd5755 |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/88dca163f35ac766a9f666a37980b15a6225129d |     
loongarch64  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/3ed6d8bfd6877e92607bb0b90277e8ead68b21a2 |     
  powerpc    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/f53617fdc89e5915be44073538aed9415bc95d30 | ORPH
   armeb     |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/acb76f1d3b39a8ecf51b2f0b8593bf21a68a7c7e |     
   x86_64    |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/c59cd31a600194c8c4866e9278b7f395918a4f53 |     
    arc      |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/7540a94239667d1533ec24526176c60423b4233d | ORPH
    sh4a     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d7921905ab40c72e636c0a95777ca2d3a6ddd61b |     
 aarch64_be  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d512e0b3a6d1c9fef074cd0d223f4eb883e67902 |     
    i586     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/003a825d4a3b878064aa0f2385f081fb2bbd4e9a |     
loongarch64  |          libteam-1.32          | NOK | https://autobuild.buildroot.org/results/2a63c86153ad229ffa72b92c9bd1a8c09d782401 |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/c27dfa5b09851faaa5135e7c38d8fdc74ae54248 |     
    sh4      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8c399139e72d54dc3745301ce4211ab2c76da395 | ORPH
 powerpc64   |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/663830fe4b28fc4dc282646dc993914ad06949ca | ORPH
   mipsel    |          linux-6.17.3          | NOK | https://autobuild.buildroot.org/results/f36aecce3c91979e1151429cfe158d3398fe7062 | ORPH
powerpc64le  |          linux-6.17.3          | NOK | https://autobuild.buildroot.org/results/9296520fa7a9a8251c5cde1e1838b83f8348b43d | ORPH
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/ea400e1b86913d3e07ace9bbef100cd4f7a45f3b |     
  riscv64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/44ec4737ad43539bda0ef622a007583e8b2b04d8 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f6525401687665ace3319d6aa1dc69671012bb58 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/16e26490f620293fcb27e038667ec4cd53b5fd40 |     
  powerpc    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/afc48d858cb33d3224c1e395b31f24941350dafc | ORPH
    m68k     |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/1027cb873399606461654c6e6ff9f702285ae249 | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/1b143b46c9a9cb4f6ed79ab65b48197d56133b7b |     
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/cb349ded4b53e43a859679a8be42c084e5e3282b | ORPH
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b88c6ad7f67f70166d209171ccc76ddf8619afa6 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/567c7919859f22d858524fa6db632e9458e6663d |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/434141fed677c0cf65e74605c1f26ce31f3d3eab |     
   arceb     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/194ff0d3ac34ff28025fc49cefd4450cd35096be | ORPH
microblazeel |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/e6bf4847dce20db874dec9c510521535bd90109d | ORPH
    arm      |           rauc-1.14            | NOK | https://autobuild.buildroot.org/results/c6d90848c9f964d6128d8f3071b89446eab7d998 |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/11bf57c361dde175a058c093501cbed95599bfcf | ORPH
microblazeel |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/6765cd5a141e8af475f6cd44c4fb211b474f0376 | ORPH
   armeb     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/ebd1499ef205938e0d1d203f4a1d63fde0399f1e | ORPH
  sparc64    |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/1b859437fdda1b66d64497d3243762a83de6654a | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/68a457ca3e6b5b56807e7fd1ff470885dfe2349b |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/8f88beaec1a9f7685726b1a78a143b4f4b585c58 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2c4b6991d7fec96172514b23089d351d00808f6d |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/77640a581bcf05e52c98b82f415ef559bfb8655b |     
 powerpc64   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/45e8ed39901eb14a7d151626964eb82b087464ce |     
    mips     |      xapp_xkbutils-1.0.5       | NOK | https://autobuild.buildroot.org/results/cda19896626250171b56906f62cdde36dbe7e2f0 | ORPH
microblazeel |      xapp_xkbutils-1.0.5       | NOK | https://autobuild.buildroot.org/results/eb7d32e65eece403538032a9006ea2f573ea10f8 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                  libbpf-1.5.0 | 1 
                libcurl-8.16.0 | 1 
                 mdevd-0.1.6.5 | 1 
                    mpir-3.0.0 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/936ac648931836bf406f17335c7eb9ae38f09e16 |     
 aarch64_be  |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/0bb6287eed2027d23a80ffdb81d8920d872d70be |     
 microblaze  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/3c15b22ceecb3184268872e6ab003c35e02b01d2 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/95807715d677837805fe4e33a4c9ae9a4e05df47 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               pulseaudio-17.0 | 2 
               bctoolbox-4.4.8 | 1 
                     criu-3.19 | 1 
                  iozone-3.506 | 1 
libdbi-drivers-0bfae6c43134... | 1 
          linux-5.10.162-cip24 | 1 
                 linux-6.12.51 | 1 
                   perl-5.40.2 | 1 
python-remi-2022.7.27-37-g1... | 1 
                    qemu-9.2.0 | 1 
                rocksdb-6.20.3 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/52c3f8cfe50f6aca81c91bb40657ade5de897c11 | ORPH
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/e9000a68d3d16dca70f7ade7a6c8addeb3dd2eec |     
  aarch64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/9f96c6a9fe540e74f18e4cebb485c12f42f4c691 |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/2894c68eb05e426a933a29d303d51c7aac9eec52 |     
  aarch64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/10d7359afe68f40beec4d3b8b76447785bdb1fc8 | ORPH
   x86_64    |         linux-6.12.51          | NOK | https://autobuild.buildroot.org/results/7b2fa55672ae66a932af2bb4329247ba104af327 | ORPH
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f5f4f00a0c7c0cc020462a941ebaf39399cb6d7e |     
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f007bd6d679f4655d6b7c11d8bf75e2309fc0f4e | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/fac35434e82c666307d433de0844da3069265829 | ORPH
   mipsel    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/631afebf805f30d9792b38dcb1ba45b65d873a61 |     
   x86_64    |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/65e0c3cd1792f88ab2f5d49e27613a921a767053 |     
 aarch64_be  |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/2de43eb0ae4b412fe0b981900fd15d493da0aaa6 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ac960510817cde4dbfcc3ecf0dee66d2d058d152 |     
microblazeel |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/67696d2422cff4a5bf29f3ccb2f393760fa29b26 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
            host-binutils-2.42 | 1 
             stress-ng-0.18.05 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/1d3436f4dc896fcbc5e893dfe56167ea92a1b8e9 | ORPH
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/90f5bb4e708091ba23622623877ab43fe68be8dc |     
    or1k     |       stress-ng-0.18.05        | NOK | https://autobuild.buildroot.org/results/6994a614a3b1ebd4d657a1fc2476a165c9fd401d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
