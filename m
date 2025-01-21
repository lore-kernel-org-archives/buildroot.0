Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2829C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 04:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5B84148D;
	Tue, 21 Jan 2025 04:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVfG1eItljvC; Tue, 21 Jan 2025 04:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC49041465
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC49041465;
	Tue, 21 Jan 2025 04:26:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6164769
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 04:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C71660B97
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 04:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcaE34AcKLUO for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 04:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 757EF60B69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 757EF60B69
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 757EF60B69
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 04:26:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab322ecd75dso907073066b.0
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 20:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737433595; x=1738038395;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zBh+0uNmq4qOKCsxD7eTw6wqE6ERzDlVNxWyM4d+JOw=;
 b=hrVvG/wbzbYBZUEJviLRJWdCDOB0tqgQm1eCpPzLI/6FoiFNojJabkAcFvZcCVfe29
 MA6uMh6OL/G3t/TwScRDjUha2aRchFP71kPHXZyA9bQ3J5pIoPkFhrRBYAjMij77gtns
 SQJozuRTUvmQZY6f7HM03Z8l4/yXiQwzeM3BYLMXuL7pz0zcp5MOvJYb68/7DULsJBnh
 Kky7HsFjb4vMTCGt1snkvNow4ABBOBAs+xTdn1IivhjExs7zquEa/K32MQkaMrbjHFtr
 7i2Ppi+0U1fEXn0qInpXXOvo8Z0nIe5Pzn4iczsvKFC1kj1N7mfsQG5HRN1nvlT9+Mww
 Nt9w==
X-Gm-Message-State: AOJu0YyDb8FE08u4DE/H2lY4u4S/8Z+zKF+F4RcitWBCM0eJ6jDgpRs/
 C8OPcAbh/ce7oiH32rwv4dRm8gIVxHLdCyTibY/t9TVp9T9xiheBt4PWpQ==
X-Gm-Gg: ASbGncuVmZCe+/Y+4lbyRs0aLcQmMdczKSVKmYRwLl1SKrSX32n37V4+wbL3argdyKl
 Kf/mMSr5z+42cOdjdKCchCcIl9wu9Freg9zXmg0fNfCwqSvsiX/EfyLuLiiqhvLlnFYYbnBIEGS
 7Em2Vg6d6wb1IE8Al3kMoeuOCRqymddnLnxFKiPloBQ281+KrwHZGoiNa8xo1g5YR46h9LVmVx/
 nqeixCFD0yoxzrV5fMV2XXHFVctrnFnI4RP7wNdnY6zlo1RmP25rLa8F3nA6KFvKO/37p3S5Q==
X-Google-Smtp-Source: AGHT+IGrumw5m4DqOQCDuQsUtUuzKd4nMlzDXzi/zVrFgpBpS19PPOm6Bp6OhGq0F8T49W316ggKzg==
X-Received: by 2002:a17:906:794d:b0:aae:8687:c41e with SMTP id
 a640c23a62f3a-ab38cd913ebmr1422976266b.26.1737433594881; 
 Mon, 20 Jan 2025 20:26:34 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c5c465sm707510266b.17.2025.01.20.20.26.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 20:26:34 -0800 (PST)
Message-ID: <678f21fa.170a0220.3c1619.4430@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 21 Jan 2025 04:26:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737433595; x=1738038395; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zBh+0uNmq4qOKCsxD7eTw6wqE6ERzDlVNxWyM4d+JOw=;
 b=b2kr2Yj9TCdhsM+JosHSWKSDQRui0UMpIIigojHx0WE664MhnLPzFxR76PTvZ+aI7u
 cOdH9Q0Fq8otZS+PaOEAlNRhkH1hRqalLPF0pI72+VoJT5ObBH9z/tny7ni3WOQig4Vt
 XhGJymJ51wt9KWDQyBLTsWYkbaEuuAUtJwZCBUPhJwNoJwnkESbjZqDZwQkfESDBVjYk
 2a2L26yvKl4/HDPGh+/ZGZvk7DQ2hUqzoIxMsxliXpopSL92zPs4+Nxx2ltOgwwJrUMV
 rprD5tJVeUliU80he1toA7tF2zBvLuTKupnLF8P+uWSSFJFEnfO7MwWZrtPAwTWZ2pcy
 o5Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b2kr2Yj9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-20
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

Autobuild statistics for 2025-01-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  3  |  0  |  5  |
  2024.11.x  |  1  |  3  |  0  |  4  |
    master   | 13  | 57  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 5 
             util-linux-2.40.2 | 4 
               mariadb-10.11.6 | 3 
                       unknown | 3 
               graphene-1.10.8 | 2 
                   grpc-1.51.1 | 2 
               iproute2-6.12.0 | 2 
                 linux-6.12.10 | 2 
                   linux-tools | 2 
                   perl-5.40.0 | 2 
                  bcusdk-0.0.5 | 1 
             bluez5_utils-5.79 | 1 
                   cli11-2.3.2 | 1 
                 coreutils-9.5 | 1 
              fmlib-LSDK-21.08 | 1 
            freeswitch-1.10.12 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
                  fwupd-1.9.20 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.40-18-g564178076272... | 1 
            gstreamer1-1.22.12 | 1 
                  iozone-3.506 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                  libdex-0.8.1 | 1 
           libfreeimage-3.18.0 | 1 
                  libsepol-3.7 | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
                 libv4l-1.28.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                     mtd-2.2.1 | 1 
                  ntp-4.2.8p18 | 1 
             parsec-tool-0.7.0 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
           v4l2loopback-0.13.2 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/bc19db42d80630a24587d970a430557620ca4c3c |     
 powerpc64   |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/b84e6b9bef831f4749a7aebb9951d9e9cd45e86b |     
 microblaze  |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/f8a6da6995411fc5c3e78c83f756daff7bb8b541 |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/f19b3373749a4b9b559e41d8c9aab72f2b908dc0 | ORPH
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/5b01656e74ddc89be7ac6399387e1f8d9336a0f5 | ORPH
    arc      |       freeswitch-1.10.12       | NOK | https://autobuild.buildroot.org/results/9d7f8db117758f3c0639ac21246a17b0442962f5 |     
 microblaze  | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/793b2803afbc81226b2ae5aa7a6ff186d3b36d09 |     
  powerpc    | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/fc512a22042c8e2ce82be313c2bed5ef53223167 |     
   s390x     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/db947e7c5f97161784d16553a10d44b17f73c9d2 |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1f90944775069f93796f197cbb32107f9516f0a1 | ORPH
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/67c2b0a38c875bce0bd55d6be11ce6cf4c9c7ea5 | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/bdbdf9086bdc2c6ebb9b62ac51761548d694b621 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/45b43441cce7db6b02c766bf738ff5580ab65a1c |     
    or1k     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9c0f95ec4df28effc0bbc0b61153eb33f23da510 |     
   s390x     |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/f3dd1c2fa5e75cc957dbf3dd411f5df07fbbeddd |     
powerpc64le  |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/1e5cc017f57d8eeee0ba17d42f6c00a11407974d |     
 powerpc64   |       gstreamer1-1.22.12       | NOK | https://autobuild.buildroot.org/results/56b7b87fbc4713e288e16b5d7a83f5b9a62a1e58 | ORPH
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/453930ed4c11856c34c7a84e9476c8b837af4c27 |     
  riscv32    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9421fd2503d66f414ffb4691d6861d08725568a4 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/086704ba81867209dd751405370741fec7d27570 |     
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/eccc9c05337c5f02027c4423f62feaa33700e9e8 |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/bf8d0ec2ad2b987d25e85feaacecb7895c1e62e9 |     
   sh4eb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/e11aaac17c80c12ac20aef2176fe7a0dbdddf3c1 |     
    i686     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/8ad4f3a1ddd86fcdd142c75a4bd5376387c976ff |     
   s390x     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/d37c48f0709fb81f3e9666c0f57202cb92035f45 |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/ed33c12279fea56253b5087cab859999ea5a3927 |     
   mipsel    |          libdex-0.8.1          | NOK | https://autobuild.buildroot.org/results/0c59c7b7dd12cacae78a851700bedda992cf80c4 |     
    mips     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/e5add8bdf338a043a4bf4ec6ff2cbeef6e958a88 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/d2c7431496257d324c80877b59be0c3038b618a4 |     
    arm      |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/32b52b334d4abe1b502b4de25dc69b8993d12af8 | ORPH
   mips64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/80e46107539ddd9abcf0e187579a18172f36485d |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/38c5d9b075210fe507abde6d1788881d7e2a3d08 |     
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f8f58b69850d0b69a3beb3684f006e77c9f684ec | ORPH
powerpc64le  |         linux-6.12.10          | NOK | https://autobuild.buildroot.org/results/7f381acbb7f3eb4825d5847175f1f33e5e5635d1 | ORPH
powerpc64le  |         linux-6.12.10          | NOK | https://autobuild.buildroot.org/results/7b73e2eb8883ea4629353ed03df977712ea8166a | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f8ad260375663f896ede02a52d796c0724af9751 | ORPH
  riscv32    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9aed2d02788f71bb772882ff46ff09cacf96fdda | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/86b4d48f57b05fa6dcb96a03dc3e6a2e73b7bc44 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d0efeb2f238d1a879569adafcb892469b3fc26c5 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/323f015be7e76d6316480b8be9da5dac4792f075 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/8e83a47a405aec90ba7ed82ea80d734d70326fc6 | ORPH
    or1k     |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/9a67e42505ea2815cd7964c560fd55050478fef6 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/5836d43ec517b2d9318e1c96073895e44de2c62f |     
  powerpc    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/6c4ff60c33763f1df80612ec57573c186394bf25 |     
powerpc64le  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/6212195711f9f787b6012ed4d910ee94ef80f993 |     
    i686     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/489e5e3087c29209e001d25aebac99e35455dc25 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/65d2d59b23a78ae71466214b1b92e15447755eca |     
 microblaze  |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/b883933e613ae7412ed42916225a4b1a5f359917 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6aece7cfa9b6a70995aa7afcb2041d25f1b46fb6 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/aecf80c6c60e2f9d8919a4f943f2cc7f19df1d80 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/df66005149253f98fba8ef4dda8ff38333df5c3a |     
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4f2a4be0a4e8d9a164a53e1b3fff5b994e4d50a9 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e7f5291f887483133e9b56944c62a0d8ae8337b3 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/aca2fd313b45d68c16bc3167121f9dfbdad14fb4 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ef0ec43c59f591352cc2af4aa365367281760739 | ORPH
   armeb     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/dd5746de67e2861b5f050014e549d2029a1164c0 |     
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/dd10c345823f59aff1f8b3e6837b626c07a38376 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

esp-hosted-6a25417fc880fd74... | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | esp-hosted-6a25417fc880fd74... | NOK | https://autobuild.buildroot.org/results/0d46c1426464784ec8966ce40d83875a90e31a3f |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | https://autobuild.buildroot.org/results/7a73b4d2a1e9ced593b4520b0175d7178e6f9fdd |     
   mips64    |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/dea0a3dd3b4e86c34b4be9fe85710f37f0207c44 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  libsepol-3.7 | 1 
                 linux-6.11.11 | 1 
               openblas-0.3.28 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/1ed64a58799634ce057c812e1f28e8cbcdcf3541 |     
   xtensa    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/f4ed712773e9992d7c804d750fd7d9f09b5028ff | ORPH
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/4e5707ef217557df05e4a7e11e72857a402a487e |     


Gitlab CI results for 2025-01-20
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892695816  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696025  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696936  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697326  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697327  | ORPH 
...lchainSynopsysArc700BE | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697516  | ORPH 
...lchainSynopsysArc700LE | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697517  | ORPH 
...inSynopsysArcHSGlibcBE | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697519  | ORPH 
...inSynopsysArcHSGlibcLE | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697524  | ORPH 
...nSynopsysArcHSuClibcBE | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697528  | ORPH 
...nSynopsysArcHSuClibcLE | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697531  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696282  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697537  | ORPH 
                 TestLess | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696337  | ORPH 
               TestLtrace | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696358  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696406  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696489  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696535  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696658  | ORPH 
...Py3SdbusNetworkmanager | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696665  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892695909  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696840  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
