Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8315C369DC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 03:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7539160AC9;
	Fri,  2 May 2025 03:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsZShJpj20as; Fri,  2 May 2025 03:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A9E7607D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A9E7607D3;
	Fri,  2 May 2025 03:10:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAED822A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 03:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDF6C83294
 for <buildroot@buildroot.org>; Fri,  2 May 2025 03:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CK0ptym3893 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 03:10:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7035B83D06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7035B83D06
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7035B83D06
 for <buildroot@buildroot.org>; Fri,  2 May 2025 03:10:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso13994845e9.3
 for <buildroot@buildroot.org>; Thu, 01 May 2025 20:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746155412; x=1746760212;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W5LkuGSv6G1RbyUs14zyD6T9WuroAsLE5dIW6l/eOt8=;
 b=ptS8deXi5ItpF6Tf044n53ANbNlbs7lRWUtInj94zafcr9fsjBp/n4t4UOQqz0h3fG
 P8D57ntF49EeA3ek3aQSztzTJnziiFAx2/AQ9S4HQ/Q/xr3/c13CsqW3ryzLeQ9pG2h5
 aK0WRS4bgz58QoMBtfhinkNBlyT33z48mtCTKrEdSxXNkS36+41n3GHHMotTUjI0wsi5
 xc9snh2zafRnKDZYfCAtBa/D4TNc4u2Xhmj44aeNhXq0/GtL7d2xXdRJlFRxTxVI91h4
 lXA2YN6N7kAyJvBfEaJAyr6fo6+r9tcY6NbllY0IOJu8gcVpd8gq5vWIypBvKsePcR/D
 Es+Q==
X-Gm-Message-State: AOJu0Ywy87qUwsqdPuLdcqnaFIFUgvIHuW6LJ7p++vQiRgj6R2DWQg2d
 TzvgaziFr2pwpvozA0s6YgJ2NBdQFk4Fikhgw4o+V4v2JQ/GvPr/izglwg==
X-Gm-Gg: ASbGncuQisRoAzbem0ej6E9IlQ7MsTC0js1CUSB07WlYMxdGgoyjVFwdjDALH0I5cVF
 xTSGv6IDHAsDNAZ/hm3vPQdmi59U6PbmmTqazPlQ+6V33vgsaxJAdSUeAE3ZSQTtaK1ifrmwK3d
 r6eKG67x+DhYU3lzLXhJkmKSey1iQfiEql4iqAvYnKQ86n9mgZwr04X11TONW5hobTx2ZVeiQfx
 w/A/AnIlGZycEu3VINlfFFkriCLTruwAXuwqVn7HSkN7NGLqbV3uPoF+GVUyMRVRhS2LvyIKLz/
 UV1Ywt2i8fnWZq1P7CHx5RjUXTCdxgOgzNPsf0BdvCeA
X-Google-Smtp-Source: AGHT+IGbmxWAbp9vd2/YJ9sMPzmxsngiMIquvfaTbBdGreZbJQc45udVNBvkpd9HlszbYAsVdSRHOQ==
X-Received: by 2002:a05:600c:3e10:b0:43c:f895:cb4e with SMTP id
 5b1f17b1804b1-441bbedbc5amr8086475e9.17.1746155412198; 
 Thu, 01 May 2025 20:10:12 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89d15dasm29337925e9.16.2025.05.01.20.10.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 20:10:12 -0700 (PDT)
Message-ID: <68143794.7b0a0220.35b317.b07a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 02 May 2025 03:10:11 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746155412; x=1746760212; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=W5LkuGSv6G1RbyUs14zyD6T9WuroAsLE5dIW6l/eOt8=;
 b=Fnw2NR9jZVl15ACIEQw3v7yboULdJqnQc5c8L8z52CWCNi0lh4YosO4Iy9H39a3FaO
 LJQCyF0U05oM/Vo7QAA5za7mBR+XUyPWqpCwNQvH0+qI71zHXpZPVp6K6pE2OnRyuuJG
 p5F+MddJzAi8plIZyAUpOr2d8TwmuAF1WOtLYniJHfra2hpXf1fOGnqtEWJKwg3FUe29
 4fV1JkZO7lNlE8tSr7YbgDp7XAjA8RWRHNmpdp4+DoVquPOOUmYBFof4KDslPzCii4ju
 aKkxsEEA7c6FMnl76+0G3Q2E8d+QtxvgkSAPuDK6jca+YJSuRMwpzHz9A0fcXHT/G1Cx
 KC5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fnw2NR9j
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-01
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

Autobuild statistics for 2025-05-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  5  |  0  |  6  |
    master   | 17  | 69  |  0  | 86  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 9 
          sane-airscan-0.99.33 | 5 
             dahdi-linux-3.3.0 | 4 
                elfutils-0.192 | 4 
                 libmbus-0.8.0 | 4 
             libqrencode-4.1.1 | 4 
             libopenmpt-0.7.13 | 3 
           at-spi2-core-2.50.0 | 2 
              dropbear-2024.86 | 2 
                  ffmpeg-6.1.2 | 2 
                openvpn-2.6.14 | 2 
              asterisk-20.11.1 | 1 
                     avahi-0.8 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                cifs-utils-7.3 | 1 
                 coreutils-9.5 | 1 
                   cvs-1.12.13 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
                   fwupd-2.0.4 | 1 
                    gdal-3.8.2 | 1 
                 hddtemp-0.4.3 | 1 
                 host-gdb-14.2 | 1 
               iproute2-6.14.0 | 1 
                 lapack-3.12.1 | 1 
                   libcap-2.76 | 1 
                 libgee-0.20.6 | 1 
     libphidget-2.1.9.20190409 | 1 
libuci-f3fc0b76040685829191... | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
            netstat-nat-1.4.10 | 1 
newlib-bare-metal-4.5.0.202... | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.29 | 1 
               procps-ng-4.0.5 | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/688faded5f6d6898f545b07d6e08ad55199dab8c |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/05ae4c0dc41ebd61b6e9e9d62f10637c535e5110 |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/a1c4ac1329c9becfdce3bf2ed52705db4829264b |     
   sparc     |           avahi-0.8            | NOK | https://autobuild.buildroot.org/results/f7e617d8c8d7098114363ee5c34821b7694718f6 | ORPH
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d6b8f7992fbfbe175b58b3dcfc016b51f8f57344 |     
 microblaze  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5d7cd83ef8bbddba90accc37e20e0c76be87dd51 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/8b1064ed2448aa16fbb93dfc7c58b1e767e8aa04 | ORPH
   s390x     |         cifs-utils-7.3         | NOK | https://autobuild.buildroot.org/results/dc1091ddf5a7ea33d58dafa12470110479e6c022 |     
   sparc     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/85b93a894181b40fce8889519f096d9e880277e0 | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/673cae9454c24936bf702d0904e409c6831aac1a | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8855fefc4665f6c3319c25bfb99c49845fdb5b32 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ed33135c134ea159f0f9fb26b1f9f296019a3cab | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/ad98d2a353665b5631b284ec78b424cecf42d09a | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cf1178a08be03ac167a6796f5cbb5662561bba76 | ORPH
   sparc     |        dropbear-2024.86        | NOK | https://autobuild.buildroot.org/results/93d9769a7affdafb84bb514b2040f1779e45c4d8 |     
 powerpc64   |        dropbear-2024.86        | NOK | https://autobuild.buildroot.org/results/21a77582d8a40f8c45e332d199ad591aecb57c7b |     
  riscv64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bfa9a6961825f5a69bf30f8f96e8bf4ba1359987 | ORPH
   mipsel    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fc750441e82640482b0fc9aa3670220cb7d27913 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/1409db03671909e1f1754db651d98050c94b75a5 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a31d74da007bb29ba25d0db97b094d9464f56e5b | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/6261437561bb9f68756ff25ad44d59fcc7de97bb |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3825394717e109315419a5008cec71860e3b3b91 |     
microblazeel | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/8931f775827e7c1134dd2bc1ae0675ccbbe5c529 |     
microblazeel |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/2b4fdbf5ab4ec9902fe3f07c220441ce5113825b |     
microblazeel |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/8065a8b2592e5e1dd39abeb1c239325909da21bc |     
 aarch64_be  |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/1bd7861c3d15597e82dc040ba5d6b7d88ad37698 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/16ae87dcd5d66fca81026fe52a792ace10297a0b | ORPH
    arc      |        iproute2-6.14.0         | NOK | https://autobuild.buildroot.org/results/1b8092db1e2e43343cd1342555825075152fe157 |     
   xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/1b197cbd498dc252ccd99e3b3d60fc69945c64ea |     
   xtensa    |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/0246ce6b979ae8556d2a09f39fcf01fa2421a2dd |     
    mips     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b5b0a9f4f67465b8c34503dfae83c3f577609877 |     
  sparc64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/de1d43c304f0965fecf08367f039b8704f2b45a3 | ORPH
   mips64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/256a48dd785c47f983abe33b2f7686d5165a43aa | ORPH
   mips64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/e9fa045f4962d2f7050f848c7360078777d4e167 | ORPH
   x86_64    |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/d72072496555119d5a487c40267ee91158dde5a2 | ORPH
   s390x     |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/e8cc1eca3e76648405a470b6f388d69b06ca033d |     
microblazeel |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/6df3b4d5aa4832b3fceac8b098bfc2e341c7f296 |     
  aarch64    |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/3a5aae2ab7e7f12cf0c839c22b176a7ddc7836ec |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6d17923665f192e06802d1c2ec415d66ab1d8ff8 |     
   mipsel    |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/4c117c6cd35575de44cb7518783ad05ff99d59fe |     
   mips64    |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/fc6eab65325ef97e59f3a68645dcfd8dadce50f4 |     
 powerpc64   |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/8eab11868e2bb9aeabf4ab19a9ebb5343f40fd97 |     
 microblaze  |       libqrencode-4.1.1        | NOK | https://autobuild.buildroot.org/results/307112be781b2f2d82b50ffff52eb58518303843 |     
   arceb     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/e2b689ae6f65fb392bda6840b4b970b502c488e5 |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/882897361d46d7898c591bc5f47ac2eb7fb4b339 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/20525c2cd02fd4535111cd77fbc81c615605d635 |     
   armeb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/35e18e24a26e40a8d20a0390cec193d2db78bbcb | ORPH
 microblaze  | newlib-bare-metal-4.5.0.202... | NOK | https://autobuild.buildroot.org/results/a76d01ae5fe5173f1b99bb7c4c5495f65fa6a3a7 |     
   sh4eb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/6d44d06e7a1338df8787bca9e10ced55362237d4 |     
    m68k     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/70cc0b3cb35a95a7e6076c328bd3db6871f99ee3 |     
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/cbafd4c44aeab3dafaf19535184343534a9e3c20 |     
    sh4a     |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/b8b0ca78e0d8e7da9198880ecb57cec3603c6bf6 |     
  mips64el   |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/ed3d4f4a60cecbe10dc4c317819e001e7ad88047 |     
   arceb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/af8d0a23e8b54ea17ac06a9d794a4ab143f4c3c2 | ORPH
    arm      |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/6475be35c497f566fc7bd051e5fcb18ef35e5010 |     
   armeb     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/71ee3f5569b93c43d284c89f046f0e4f872863b0 |     
   mipsel    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/81c1ca5bfb251913dbed2be33259fed6ab9d4cbd |     
  riscv64    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/45458b80c3a2fc95ee7e6989e0133a3054a2bebb |     
  powerpc    |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/04ceeb2b6f46bddf03521f8ef15906e0a1f143b2 |     
    i686     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/96f66f96ab12a5c5935aab62133f28053c6feddb | ORPH
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/3a1a0e8664fbf4e5e8d21a8c0fc702b5376bbfc1 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/27dda2a5759401f9758486a4e0c8e7786bd23887 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/dc0ed9a1639c452b5c42ba03294c0b1d537b3a8d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/256ae4a496ce0bcae34f2c5e7e0c2626f8578938 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/7b22e0a2094da88f2e9eded6c10fa890a55be7e8 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/7af12674aa2fc5554872786bbc905c98e3803f51 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8e2089c48a907e2c199dbaf265a6aa0eae34c631 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/898a49e2bc4e5c4a5d5d353296f5ebe4c699b7fd |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/c402dc5820b017fda0fccba9fb79563d2c6334c3 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
                elfutils-0.192 | 1 
            netstat-nat-1.4.10 | 1 
              tinyssh-20240101 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ffb145a0b1bd8132ce793070b6d9c4fe55136138 |     
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cc29ce1bab9b7f0722fa50c592ed456e8a601990 | ORPH
   arceb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/3540c7e9e74105ba530fff15f534c7b334d6d61a | ORPH
  sparc64    |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/5d435ee9ed16a7db5a00dd0dee060b85c111697e |     
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/ff75cbdc328cfe9ebb28e39c98be3950a19c264f | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
