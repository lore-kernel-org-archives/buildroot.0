Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F9EFCE5F
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 04:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EF8F60ADD;
	Thu,  5 Mar 2026 04:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-xghl2znWn2; Thu,  5 Mar 2026 04:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1726B60AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772684796;
	bh=Di4GMiQgvCi5K+UOcwzpLcT7ZRwoyfzSlsECtJf82MQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ogdZUYY1B3CF7yE/+XraQ9m8AAFrpNpmo5JFtSd/EOPEcwqTQk71JKLXYS4D9x8yZ
	 hX/YLz0iWUSnAb1bQHXodD8Kfgyn+xbEdQlppmv+Ex4x+Y3LjU3PxpxTj1RghceDNM
	 9vm4uw+jZ3+yLj/Hsu2OL72fHSpWhXp7LCKwmldLtX+9VWXLZwZ7BdJBnFDNVnQwsF
	 UE2XcjGD8+G5PYzWkfiy3hF+SOvspQGAjIgwtkZp7A4MTvAiEQQejH4QGjzhQ+Okjr
	 FynsfzXhwXXC26gDYPZyh7U3twrJiOLGxxVwJbZUNA2iQ+xeqoPxcot0iiwzdH5mia
	 6kcSVUsJqBdfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1726B60AE4;
	Thu,  5 Mar 2026 04:26:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D21625B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 04:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AA9E81E42
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 04:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nh-AFzCxMw-O for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 04:26:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA0D081E3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA0D081E3C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA0D081E3C
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 04:26:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so46867425e9.3
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 20:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772684789; x=1773289589;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjApcVZAkxvHZeoeNB3Rv2GXg2gmAeT4hJKrEqFO97c=;
 b=MaQJrvZSm/QrprG0EqE9EyvbwGzeGqG3mu9IcDGQNSAmfpnuDLyMAaU8Vy6W29nPKX
 EB25A0pqpvACJNIOqS0BQKQeLdyah0XX/0E7ev1NxOHZeIJIpMzjexwMo7EIn9z7vLm6
 89LY8/ehgUcoQVrn2ibs7gGdOffHo0U1xF0Yf9RL7dfbcqpLtGend1ioLEbLyspFYwZC
 CTk2FCyxBguKZTGuLGjPntA4YHzLBtzFnWa++OI5F1/0XlPRUrhaHO8WGrRvfPmz1xyq
 hSD/x1YTjANtkw1PEq3NePLrY0LgQevFAX+MZUQRJq3ZsmglphibbGSZxUK7x/yJEQDT
 FJ3w==
X-Gm-Message-State: AOJu0Yx9niG/q3ZTJxoNKCNNrn6c+qqdh89DfDlVwivVCkHVPQYyYszq
 qD2E3bYNnToPVTEMCHPs6krSUKDHERkAc44KERiIPoju4IBOe3hnXJJ2FCl8u7X4
X-Gm-Gg: ATEYQzzUE0ZAjMuEQTJT5Oy2yzHbzlVp4dta+/im1crfgg7OEy4ZCR1hD29TQiB7LsH
 lyCnPcL9VVzhSTgjCGrXyqM0mi7N3RbsAN9+tj8PoEPijlRJHorv1XqOn0LBPrab0K2W5ij1hC1
 tf6lK6pQSS2hB0rH03gyeHvvCBLINMbzTc2PtxNWQ9Ekaa5z6ojEIk8nHudu2ep4TYuTWBkmXjK
 paTRaKc1HLO5/QxJUIgpXGwt7LsiJIOjiSIqNJBLiBA4/lBn/iUfob1iIDuDfPPnwpiXnsnCaN5
 RGB6TWwHvpcCxW+mMVrRhsdSEOdIz5DAWpviSE2wphY5wNezlnhQ4TXPhPfRqYjfemDHP91GLtG
 3mNSDIRWcg4C4TJla+x74MiNqpvmz7XIEya5tGYL3etzPPHHw5rcTCL96RnqWZd8hikEEr1FsQ+
 y0QGMLrdZl75uelX3TtT4ILO87ArAJLg==
X-Received: by 2002:a05:600c:828d:b0:483:ad56:8d16 with SMTP id
 5b1f17b1804b1-4851983a7fcmr68771155e9.6.1772684789218; 
 Wed, 04 Mar 2026 20:26:29 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439ae0e7abasm34524013f8f.23.2026.03.04.20.26.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 20:26:29 -0800 (PST)
Message-ID: <69a905f5.df0a0220.78404.39aa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 05 Mar 2026 04:26:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772684789; x=1773289589; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qjApcVZAkxvHZeoeNB3Rv2GXg2gmAeT4hJKrEqFO97c=;
 b=jI0wXFBZ+MgaW1TDSdv4LVS6edKvDIBm8TnUXdgihEUuw9q5V98meIEG1QFMhvA3vG
 899EyX/sxvj8TBcn0rTyC2Jzu6cnVC0zs1m94GhTJyOdfTVd5fcLaH4dYcBpmlU4lAIo
 NzHVPm45C/C/mZFe7XkurhORb2f2Nl9O5b9LesOWQQOYwkk3+45ewbW0APHNOj3NEUSK
 PZbUwW8lNJPwFRdWpU8yrnBgOkXig4GQOB4mrOQZxEfve5QB6z7Qi6O15IK+pT9PF66j
 ZTaRyOXKkm2CfMX0A4GnCBF2Vz9ZA0ihiKUZt4fjTaigHhMv4k6oY2fmPwQAvJ2e9OKR
 S80w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jI0wXFBZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-04
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

Autobuild statistics for 2026-03-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  9  |  0  | 14  |
    master   | 39  | 61  |  5  | 105 |
     next    |  3  |  3  |  0  |  6  |

Classification of failures by reason for master
-----------------------------------------------

                 linux-headers | 4 
                host-m4-1.4.21 | 3 
  binutils-arc-2024.12-release | 2 
              e2fsprogs-1.47.3 | 2 
                 host-gdb-15.2 | 2 
              libopenssl-3.6.1 | 2 
     libphidget-2.1.9.20190409 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                   perl-5.42.0 | 2 
                       unknown | 2 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
             dahdi-linux-3.3.0 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-6.1.4 | 1 
                    ficl-4.1.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
  gobject-introspection-1.84.0 | 1 
                heirloom-mailx | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
       host-nodejs-src-22.22.0 | 1 
                   i2pd-2.59.0 | 1 
            igd2-for-linux-2.2 | 1 
                     kbd-2.9.0 | 1 
                  libenca-1.19 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libglvnd-1.7.0 | 1 
                libnss-3.120.1 | 1 
       libpagekite-0.91.251215 | 1 
          linux-5.10.246-cip66 | 1 
               linux-pam-1.6.1 | 1 
        ltp-testsuite-20250930 | 1 
                memtest86-7.20 | 1 
                    olsr-0.9.8 | 1 
               openscap-1.3.12 | 1 
                     php-8.5.3 | 1 
           python-brotli-1.2.0 | 1 
rtl8189fs-876e627a5b6a80217... | 1 
         s6-linux-init-1.1.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
              skalibs-2.14.3.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2025.10 | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
  wireguard-tools-1.0.20250521 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/dfc3f27d40b0d9f4635c3ceec597a18e5acbb9d7 |     
    arc      |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/8ae44fa47cd97ff28224dcb673b3aece68cabddf |     
microblazeel |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/67e468d3d116b7c3184bc0d2692b8f82dce57150 | ORPH
   armeb     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/cb234e701acc8bb7e59adea0b9100dacb1978d5a | ORPH
    or1k     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/ae6ee6e4e4cd37867c96754db09460cd47be6847 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/33c1931de5b3c6d27183c5f50060341a839e219d | ORPH
    arm      |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/a08f7cc948825193b82acc9ca5b8904613f0a9a0 | ORPH
    or1k     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/e7c312b918874175e5191b3112a3d7e217cf1a45 | ORPH
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/e91c99d9ffd6a3b8d33c5814641814711216edd4 | ORPH
    i686     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/0635c4bb50ca6b39dbe62e92ffc40b5b07d600b5 |     
  aarch64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/6ca33e65e771318834dfc26492c84f76b36e8809 |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/cb6bf84ec13e1418c22ae77b10e7fbab87b3ed24 | ORPH
microblazeel |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ed19dee93cbf491e73f28fc25512c1af57edd833 | ORPH
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/7d4a1bd6508368162807b2efd343773e417808fc |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/93049754e28b51c4b48633db81eca757679823ca | ORPH
    arm      |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/753d5c097b3a5faed8dcbd13b1a23c0d35d537a0 |     
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/851622afb9d545c0565df2b3cf3ff38052d9acc3 | ORPH
  powerpc    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/0cf0298b651b41b1f920cb3d6c5c6dcf21b327f4 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/86967ae2f56d267a3fd56e421e8b33637daade6c | ORPH
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0034f64a5bd67b2570d36cc39ecc6ccbc6e07035 |     
  powerpc    |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/d16b68e4e6674eaab7ba184608411eb996ad20ae | ORPH
 microblaze  |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/92514cb14fb3ea45500026d3634d11b68856d122 | ORPH
 microblaze  |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/b392ac18df3751b60acea83e2c130a82769f1126 | ORPH
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/c2f189e3ac8eb8a0418d355ff93910e1f8533d3b |     
 microblaze  |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/8f55e829500612ec154eb2922860cebba61902af |     
powerpc64le  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/d547240a7064191e15dc3bb3698d434b49aa54c2 |     
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2b6290a8c3d91f5f35e44a5c6656256ef8df4ea3 |     
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/d0742d14f1399bfe738bac4030c4978e27e7a75f | ORPH
powerpc64le  |          libenca-1.19          | NOK | https://autobuild.buildroot.org/results/4f4585541e281448b9c90519ca4f6136a26b464f | ORPH
    arc      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/6bcda2962e4572dd5ef07c6204e70312fe9ea607 |     
    or1k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/fe771c60e6bb15aa8a2b26c1b3fb8c8e6d4047b6 |     
    sh4      |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/6b409a4759f5968eafc76038c6941c077588176c | ORPH
    i686     |         libnss-3.120.1         | NOK | https://autobuild.buildroot.org/results/2f39943bdf84cc6a84498329161f766e49662bc9 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/c928c85dce5adb55e898baa5b35703c17f2c74a4 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/ad882b0852b1e1aa8dace9dfefb21276a8448617 | ORPH
    arc      |    libpagekite-0.91.251215     | NOK | https://autobuild.buildroot.org/results/1e89352c045ed897a094fa81416e02f3ac262858 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d942b9457a0648a1a311b90e09d8723dc3f82f8b |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/da1459d1333047f97e3ee639a8e976d29d87e1e7 |     
  aarch64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/dfcc680d7fc4e623cfeaddce11819b943dea2707 | ORPH
    or1k     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/8284e1437ce66c5aa5f7e9801f510475294e2051 | ORPH
    hppa     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/048e684a73795c066aa1b4613d222f66c200ad87 | ORPH
   s390x     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/5cfcd329b85754f04ad1cfd324102e3e2030da00 |     
    m68k     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f8aad96084d3d8c336139eabbc8b0281484c1845 |     
  aarch64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/6a978bd31c835c509d5af3a97abd0aae6dacf43a |     
   xtensa    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/58b7d5c01c1286aa04c4b0a77f21d3a92d4b7488 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/9eac3474f00338e55de147aa6daba3adde5695ac | ORPH
    or1k     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/4386314093977081ab85863855d156675ee2f0a5 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/610325b2748d135b8830133387ca88a1d53d9569 |     
  powerpc    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/122759210f4a5c5b15095b5a8499c7d879288190 | ORPH
   armeb     |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/e3c1a0f74824ca9026612fd7cbeb7bc4d07d59fe |     
  aarch64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/96e957bedb752d03e034a26c4c6e8a31a333d7a5 |     
    arc      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/6ef7127c79709160a94ca9c04c1249b726a0816e |     
   sh4eb     |           php-8.5.3            | NOK | https://autobuild.buildroot.org/results/13e029e1c043034c22353b637861b7c0db554aeb |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/4fc1f4a2209d6112cd8e5a55baa0968b341d43bb |     
  powerpc    | rtl8189fs-876e627a5b6a80217... | NOK | https://autobuild.buildroot.org/results/247ac7a64f852a6a330fe38247c5170508e998a3 |     
loongarch64  |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/b4d6175182ddeca908932ec0d36b0676c8e8c353 |     
   mips64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/c1d8a325117ad67a5f9d7420a2f6c4f7c45c0fee |     
  powerpc    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/65b876ab7a303ef12ab6ebd1ef9c6886af28ca7d |     
 powerpc64   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/1a399a4d4245473645e5e6f45bf3239b4675ee3f |     
   mips64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/b77115e234b0c6e52317d2023ba5a4f086743ce8 | ORPH
    arm      |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/2e9fdd953bc523ec237294ffd09d7c7a6fef5803 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/9dd0045ee2353f145e1ec8629886f5cdafcdc35f |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/d3ecf05d83f00142a03051a6dea56b6039c0e505 |     
 aarch64_be  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/c938cb3e7668da9781cf585a79a8fa24a24bd52a | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ed3f893164a870ffa022b20e7303dc7160fadf30 | ORPH
   sh4aeb    |  wireguard-tools-1.0.20250521  | NOK | https://autobuild.buildroot.org/results/04173da523f2be767cd4cf30262f36fc1638cae7 |     


Classification of failures by reason for next
---------------------------------------------

            host-libzlib-1.3.1 | 1 
                  libnfs-6.0.2 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       host-libzlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/445e6be122abd32ece91adcb7bb2fbd8300e5fe5 | ORPH
powerpc64le  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/4664a2c496b634082023ae30800503aaca9a6099 | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b3848de7b7ca8366c1692f6f46419b596a459dc0 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              containerd-2.0.2 | 1 
                 expect-5.45.4 | 1 
               graphene-1.10.8 | 1 
host-binutils-arc-2023.09-r... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                 linux-6.12.73 | 1 
                 logsurfer-1.8 | 1 
package/linux-headers/linux... | 1 
                     shim-16.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/c046818e0ac9e97675680d71b8d7cf06f46b6401 |     
   s390x     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/c0f3bf7ba5126b3ea51cb093eccbb142b289c33a |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/6d901ef5fe86fdbb7d22070be8ab6ec99a15cf1e | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/bea5bb3c7071258d42b5fd53fee2868f1fc680cc |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/f111817859b5abdfe06127b70ffa38a05ac7dbf6 | ORPH
   x86_64    |         linux-6.12.73          | NOK | https://autobuild.buildroot.org/results/b598be4aa5db3acca87151e646b5ddfed990f970 | ORPH
   sh4aeb    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/7f374147d124fe8d11141286afe6bceff63078cb |     
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/58174bc65148258ae93da1a47ce11857038eb2f6 |     
    i686     |           shim-16.0            | NOK | https://autobuild.buildroot.org/results/d1a292fc4714b61f4494632f1c82a1aeb65b8b34 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
