Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C77C5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 03:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A23340189;
	Sat,  7 Jun 2025 03:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYDQ9vkIwjcA; Sat,  7 Jun 2025 03:14:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C6840439
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C6840439;
	Sat,  7 Jun 2025 03:14:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAC881F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 03:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC42040428
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 03:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW4eej88TPoP for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 03:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14E3C4044A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14E3C4044A
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14E3C4044A
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 03:14:50 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-606b58241c9so4324140a12.3
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 20:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749266089; x=1749870889;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+y2XIp9AmDHyQEpT7ssAgEbEdV1TE2ABgGF6hmHo6Ns=;
 b=P3Q7FcndHSAtEE1wCJssp0NgkYAlgk4GbX+Eaaqr56SYCQ5fOuoDI5YOc/K4LTFSuc
 wW71ulVQQR9NkrdMNm+QKpEiTYBQgj5arSVeQMe6ch82lpEF22oCdBl+s9Wd1BY9ewWw
 6rKyEC/pYxl2/AgH1OjMXPiCu9lmjzF0odkqv2mXryp7JZeerTCN5NWTlEQc04Y3BEBK
 soCCCwKQ1n1WRwj1Dooc8WIZnpHo0B5ddFFYs/58QpUYw6zuo7JXtBhfWHf5opbSEh9X
 YM07RlJVm8GeaZFTcD5AcCJ3keY62BvOJwbpC90XqTY2YqUev7MDPAg/cXRuYruP91YW
 EUvQ==
X-Gm-Message-State: AOJu0Yx/mIbzJ2YE/VSb3+ewtnBCQGEBhlStPRVWldrXYBNN1ubzbC2G
 y91zHaXfjWVMadVVxlqnEVaU5u6oDrfZUbf1jfHYc11Q8C2ChL6LnSkfMNG0bg==
X-Gm-Gg: ASbGncsrBPAHK/mQ1V2454P9Dfsxqa6vkanKXrC+1r1QOUuqsFcO+F3se5MzrfbID6M
 IC36CrVEArbhiK9CgylnWerRats0sdgaqqvk/n21WmUytfPdAnMFKn1UeqWu2bUBhvrHCNjtRSN
 F+wRnXrhlOnIlzPg0Q3eYmK3P20xLaps04ODMFFItasA2Ecar6c9xuzW8V0Cj06hDx2Ijy61lBL
 a/q2pMbKNbcpenu+7yHPikBbKnxEODpdjri5OBn+n2zh6UPTEIcaRqxDz8XdM+6PlzeKiIZDMh4
 mqOOwSki3JgWjdGzydtU2tEXq754G3eQ6Ng7X4kMdbWxzsI3FYsC10/Z2j6ZwjVoRw==
X-Google-Smtp-Source: AGHT+IFkaHWNtiiSIDWuAHlkkeTKjb8IDweT8mVjGLp2JZk0QaJqmjzC/LSs0kWrJ1i5r/XUwTbtEQ==
X-Received: by 2002:a05:6402:90c:b0:601:a681:4d5c with SMTP id
 4fb4d7f45d1cf-60774b80191mr4196701a12.32.1749266088102; 
 Fri, 06 Jun 2025 20:14:48 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6077837ed0bsm1795524a12.36.2025.06.06.20.14.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 20:14:47 -0700 (PDT)
Message-ID: <6843aea7.050a0220.cc32d.422b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 07 Jun 2025 03:14:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749266089; x=1749870889; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+y2XIp9AmDHyQEpT7ssAgEbEdV1TE2ABgGF6hmHo6Ns=;
 b=ngZzMgsdM8ZBQjVRA6ByZr7NvakUv8DteF/t6n9AOGszpNbbCg/tilP0ePMtpN32qN
 94tqUtOeQc6RM0fksgdJyv/qCFyD6Vx8fjT8Q4yW6a0AeImGDwb5ArgR5xDoAnuJJ3Xj
 tGkGBNEEEoazgP1VY49IZhcb5fSA8vlwr9qzpkx243rAAi8xrfpSq9g+Cp7A4qHRfHuW
 CgusAeXeiMQM9hTkCMO9SbX7dokeCIbHfs7MeyLxhLcYBK4BbpL/oFaZT/Py27bHHcJI
 TGxNitmbcPSxepSJct6FrBiCTg6cAOuBqd64YVcc4OVY+AsBHUE7iYc8CWLFr4qCMRQV
 WfsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ngZzMgsd
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-06
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

Autobuild statistics for 2025-06-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  5  |  0  | 11  |
    master   | 13  | 353 |  0  | 366 |
     next    |  0  |  6  |  0  |  6  |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.31.5 | 108
          host-binutils-2.43.1 | 24
 host-binutils-bare-metal-2.44 | 19
         host-libopenssl-3.5.0 | 18
            host-ccache-4.11.2 | 16
    host-gcc-bare-metal-14.2.0 | 16
                libcurl-8.14.1 | 16
       host-gcc-initial-13.3.0 | 15
                       unknown | 11
                host-m4-1.4.20 | 9 
                    bmx7-7.1.1 | 8 
     host-ncurses-6.5-20250517 | 8 
            host-coreutils-9.5 | 7 
           host-python3-3.13.3 | 6 
               bctoolbox-4.4.8 | 4 
                 host-tar-1.35 | 4 
glibc-2.41-5-gcb7f206537240... | 3 
         host-btrfs-progs-6.10 | 3 
         host-gcc-final-13.3.0 | 3 
       host-gcc-initial-14.2.0 | 3 
       host-gettext-gnu-0.22.4 | 3 
           host-libsepol-3.8.1 | 3 
              libselinux-3.8.1 | 3 
  ffmpeg-n6.1.2-27-ge16ff06adb | 2 
            host-binutils-2.42 | 2 
                 host-gdb-14.2 | 2 
host-gobject-introspection-... | 2 
               host-mpfr-4.1.1 | 2 
          host-oniguruma-6.9.9 | 2 
              host-rust-1.86.0 | 2 
                 linux-6.14.10 | 2 
                   avrdude-8.0 | 1 
                cifs-utils-7.3 | 1 
          cryptodev-linux-1.13 | 1 
                elfutils-0.192 | 1 
                flashrom-1.5.1 | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.82.0 | 1 
          host-automake-1.16.5 | 1 
            host-binutils-2.44 | 1 
host-binutils-arc-2023.09-r... | 1 
              host-bison-3.8.2 | 1 
         host-gcc-final-12.4.0 | 1 
                  host-kmod-33 | 1 
                host-mpc-1.3.1 | 1 
       host-nodejs-src-22.15.1 | 1 
              host-pcre2-10.45 | 1 
                  libjwt-3.2.0 | 1 
             libopenmpt-0.7.13 | 1 
               libvorbis-1.3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
newlib-bare-metal-4.5.0.202... | 1 
                openocd-0.12.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
             python-webpy-0.62 | 1 
          sane-airscan-0.99.33 | 1 
                 uclibc-1.0.52 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/446c55f99cbb446ff982b8a77802bf7aea4453d3 |     
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/fd677e3835e051261ec1b0262ccd71e83b793477 | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3e05a290e77a540b9a3aba7623f58382eca2a80c | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4321724141de4c3bd696bf24623c62f1f7ab7c8e | ORPH
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2a96d6ac56c7349c2db1608d7353c54a79a694d8 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/6e98f1b9f2dd7603e51c8942c7b29d7955d2a040 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/566afcfa7d57ae793b140e2b1e7470b5925f54f1 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/1f51ff0a1311553c51f068d72710324407c4e1fc | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a1eeae00e346fb2b2e9007c6c5c2d3d5a530bad4 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/413a874d228b77f54f7fe3c2fc32646fb3a3ba72 | ORPH
   mipsel    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8ae66f312822383ebb7f574e3f997bb27d42a125 | ORPH
   mipsel    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/512d4338387a8a8d87d5213fd5138ccf1cf89d7c | ORPH
    mips     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/41b660c47c1427b6b3202bf06dd267f57ca3b404 | ORPH
   x86_64    |         cifs-utils-7.3         | NOK | https://autobuild.buildroot.org/results/32fa5fc046acd0066519140be1eb6bc5f0627f2f |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/609ccd57d12255ab3bb6c1c4b6af4f6625fb7a63 | ORPH
    mips     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9c09e4533406c130d244c3161b8fe30c4f702f34 | ORPH
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/c27ffc51c898ad1ffca5a26c8a5fb65792d0c5d8 |     
 powerpc64   |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/6cc20ada0050b7adb66892a655a035a0a3639601 |     
   mips64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/057101cf8dffe2fed1d6ff9d502a78e41be0b632 |     
    arm      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/51c03a1c72d034352edee1733240ac852af6ac71 | ORPH
 aarch64_be  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/317d7bf778c6b5bfd11684ae564f8b85d9636c94 |     
   mips64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/535f5afbe1a9424a33d157b6bcce7b7d4aaaa0d6 |     
   armeb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/8857557ab8d5f4ca34ab8e9e142e791c44e8da91 |     
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9071a9ce75b2973012f05ee12558d87c7f3328fe | ORPH
  riscv32    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/1ac4cf1434b032b0c0568ecc4595dc2b450ed77b | ORPH
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2c7e127b38e8dfd345274aec0ca4c2b473d612b8 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3fd648c7908afd9e18cb352138fc57834dd76f5e |     
   sh4aeb    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/81a97f123a08cb7d99895b2946d8c1020d342a7e |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c29ca98a3aaf2dfe74ec183231a185b9c6e34c08 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2b456776d37d5a0a958e7e2907915eda77528a21 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a8656ed4c99ae382d7358247a95bc8230a86052f |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/24244e2b46b87bd4dc5100dcec18ec36df34e69d |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6dfde3bb6cb1c5377eba09d38de73936cc6658ca |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d402ee94e34b0158a7028744403a6d822f6fd1db |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9ff87acec6a71f0705cbb4fdba26011bc3b71e68 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8ed2e5e0901ec7974c61f0720ef843a720feaf45 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3db2886e43ad679d405baf863820f4ed48769002 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4d729a3ae07561a5e40649222973856d5e41db94 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2a2751f6adb05425b05c8404fdd14b3858902c35 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/446fc536da616c71dd1cd030d50eb5fd1ea6bebc |     
  riscv32    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a06564532b505203389168b8d5a8ef2213ce220a |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d4d4f165c07aedcdfec091b3928bca98f75e42ea |     
    i586     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f0bff7370f67aa92a5057f9de0ba709f08b71dd5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8bbabdfd063e90d53f47ed6c86ca019ec01e1d95 |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c68d6a34f33f2c7ffbf57b5c83358a96c72ca7a6 |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2ff99a04ccee8413bf64c81100412ed45bccab9c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0b02ca8eeca83331a3f658b6ad6092b458129d1f |     
    sh4a     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8b4f3d86fcf40a2c04645b834625e6a1b58c218f |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2d5da24ebd6214f199563fbd5633b8473ae22f35 |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b6cdeaa18236816dc8c01160ff115b4d211e6397 |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/36cdbe8eb74acefc801f727ef6fb2d4f18488c48 |     
   sh4eb     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/5589d7570e7bb9c11851a6b1a09a4359fd4c4e96 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8111ea789526be8af3701ddbea2bfa678da8e45f |     
    sh4      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/187c519d2bf84c56ea781422258d92b4fa99f596 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/95516cdbb5f0567e08781e8bfa3eed6919abad3c |     
  riscv32    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/603dd6c776dbf630f6d0ba58652dc5c55137f663 |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/daf56f8261753d9b8dfcea997b02d4a8b724bee3 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/cea0c2793eb739213f4a07e7b9c520ab876e0981 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2c7b1bd316822c6f15a68384da031e314f897589 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a3f8eac4c8542c99d73300e7bd6d86e78dfee9bd |     
    m68k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8667367803a82fc39e601102b2740ea534f6a4f2 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/9aa86c8587707b128a9d3f4de8e08fd047861ce1 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a6c772f064c9ee697c20ace6e8ce08ea576fdf90 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/66f1bf239ab7184091ec2fdf45550300ff8aab32 |     
  riscv32    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/411d4eb09acd2de6d6b2ed2762e50c468d842ddb |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b051a3e90a785a29c6ad3f10cfe04df139288a93 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6bbf88d08ef66f3b7f460405b217c86f356c7cc1 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/323d81cb60fd936d7a4d791431716a7894336a85 |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/07a2e8c92c864fc28cde9b6ba4693ed0b1dcc745 |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/cf5702ab5a751d0b7a54523808945cab616100f3 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/239c1b887b4f2f190fbba27cbf34fb47122fee44 |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/26948d3324061ed5a6d49e5813c3edc458b152bf |     
   mipsel    |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/fd6cec2d73cd8c9239e8661c0070d3ab62942c5c | ORPH
   sparc     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/91162a1d1c762c40c816b2dddcad05a1a041c64e | ORPH
    mips     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/6adfd6fc19f44ea9850d32b0a6d8e9922964c32e | ORPH
  mips64el   |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/8f481035cef6985486c4cbd3aee373589aa59afb | ORPH
  sparc64    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/649e50556b17ba6a30d7cf8bf3ceba555c383fbc | ORPH
  sparc64    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/098eac3db048d7a4f7709e5b82cf14eef029f257 | ORPH
    i586     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/e9178454700e37fa5ee7b700f24177a7cf3b5086 | ORPH
    mips     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/2609ad54179f044aa67a4c442db05ab02bab9eb9 | ORPH
  sparc64    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/4920430076afb244528637eaaf3cc4e1e195d89b | ORPH
   sparc     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/50ea1e3c0da05c448fef9bf65360e69f71c933d3 | ORPH
   s390x     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/4da900457b61b5fcb333f8e524712cc5cca0190b | ORPH
   sh4eb     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/b860bbc79441b0df1171eff9d7be9a3292388138 | ORPH
    i686     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/d097757e1682fcd5da09f6e11d8981afcfb1116b | ORPH
  powerpc    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/653cd3c493f3b34ab89795fa710678da83b7b771 | ORPH
    i686     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/3075609c09c275f5c1c80b1d087f5febd2e66024 | ORPH
  sparc64    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/d1b98a360b6904fe01ab775158e05dca55c81bcd | ORPH
   sparc     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/3289d59ca957861e902d7c4db15c786ea064cce1 | ORPH
   arceb     |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/dfc8b4e6cc0e16c9b575cf086a701e3450c4fad6 | ORPH
 microblaze  |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/d5babd75c7c8fd8966c016cc98d9ccf33fae5c6f | ORPH
  riscv64    |       host-ccache-4.11.2       | NOK | https://autobuild.buildroot.org/results/51a1712db32cddafd0c992a89e8cb5c882489b35 | ORPH
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b99e5d87d0543fdf4cba5055a30e435acfe24d4d |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1bf635b08751644ecb9ec1564cdadf4e0cbfdb6f |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c54fe39dfc96abab67691ad8f3e5a71dc58eaf87 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a0ef2865d93868803202e3db9f4382cc2398375 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e0dc0150554f472201ec0b68877bbcedb46a2cae |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c690f76085ed4cd9d5ddd6cdee6808f94ff5d096 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/36a8ad7405e1d28e7dcae998d479d35cf148e5f9 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d453c01837d529cd54e220e0c9a2485d1231b084 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3c2d6d3923897ad3f48093dcca101d1c1af8105c |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fc386c4bc80b5589ac77ff65f78c6ab50a3488ba |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7b9b1cd13c4e4c8f5bfe1dbfbcb07385b19a8d79 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bf038619a79ef1a8a5b12468bc87a5e6117fc7e0 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/43eeef0b3cbe4e30b18e1d8154420b42378329c2 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/01adc895347ba814d19ec2897f71e64b69e72cf2 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f84bded8f79f5f570e9b63bd34cda0400b1518c |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/37dc023392397daba88dc9b1eaef909d2fa14752 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9a56b1997f2c9271cad80f7105cabca7b613fbf4 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/962448ca94a9fab021444ce2121183cea410c9e8 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79e78f885c65f53e4dde37ecbab5150b79846349 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22af0d895296357a9849013b49aa316e0f60f08d |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/01da28aac9ae7f67bad15a41f40314d46b91bce0 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6b0586c5e7087ddba28b08f6b6c460179fedc887 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d8d5ed67f89e0f5dcb830be9625798ac4b51cb8f |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ac970efa7010357bfcdd061ea8a7ade8020cd917 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a2705113b32901836e4f3581b3bcafe4e20319ef |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7949a466e52fc2e80f755ad71da0005c90ab4451 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/71c3727cee0d62b8af83fba4b18ee262b84df932 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1a7fbfc475a8e784c7ccd56f9b20be2f31bbbfbf |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/404ee6ee47e04fdeb7d9481c22981187331ecbd1 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/47e5cee391edeb300caf4c132c4c319f6e30ad4b |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f4f74afca96444c76ad86552bef455a96a4128a0 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2ed151060842152465bb82e813a6c7ec7cceb110 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea3511a0d6c25e8505cc43457ced85d48bdd03b3 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9a5c8a56624e605b08a36ffda55f2dba1589f788 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/210eb3e4d5fe79f2282dac50eb73d97a85769f21 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8af0aec75ab8b6da7c239580043ea45f6ca22bee |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bf1e494da0df72d8488af8dde4b977b324146e8f |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8f180a9eccc944aaff0a4d07e1995d414340b37e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fcd7cf5589fc84cc77e8b5c99b40cb24c74468c8 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f487f164d689f2361ffe20e1172dd8124eae362e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f7bca4b3769cb8271204fa6f42595ea2f4738d71 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e94b424ef9b02d9ad1becd4b5a386176c2ffa7fd |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c88922d40e59af7b38de01bbfa3d15ef0745196a |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eef949f728b7fb684ce034c9d7dff74a0b76c85a |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c06804528db422a45af3a6c6369e1e8f9cb63b75 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f042d9df7c143c112826b833c0bed4f43dd4ebbe |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c468cf5dea9f6df87e5e5a1982aa4a62ea15d15 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6007115bdb95d031e629fbee731b2cdef3194cf2 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6a90bf68bfe8ee2ee5cb865e68cb076fbeff40c4 |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2e6fffabb875939829097430e8d049307232d63a |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2623c44dbb23f07c17a77e195bbc2f80a0f7df1a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aaafdd5f1578de2bf2e6ae2c458d9671436fa0ec |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67f84ce1fa8b2bfa4cc350dc6d7cb7a3d6e90198 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c3ed46c37a97b2ccd98266e606127cc36cc25e08 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cf1a167cfe088a30ed2065534100b162eac5e4f6 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/336fa414d50fd27b4eeb767fcf666a88b49a8d3b |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd867939eb4d19776da1ea11af84439292b7b362 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c1b04b88fda491e03f8d783179867847fa067f42 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b59ac915929f11adc7fcb8a40867ae350c4f6c9 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e39cab97fe657e5335e109716faa522be0638ad9 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/422a896cb1ffaef7deaba496bafa7d0277311fdf |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2640b10488c57e16d078c8a4206c29afa6f85554 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/acb690b0d17c589be699824b4a069bf8f8432322 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a27ea58b7b4822d328a6032bb05873c121c0c46f |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2ac5d088cf793d2a00c732cdb0c045073405c0a0 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a4a74c12c97acafb9d56de26fa5ef2a21d4f1661 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/830db8408f7992bba5562b9d9808c95281857aae |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/29230894d665a856b962a4281e0ac9fc4ca738eb |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7b15fda30c25707b05828fea92c2c0fe8ce0240c |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a11393f9001e598f54a8faf692e3981e89ea5ba6 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3185e01620de7873a92176a4322e15b4e1143892 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/05f44f84c44ce616152810043bd41bc59bf33dc0 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3187685182cf3094cf287f1e9a3b00af6b7eff80 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/639b5d118167a6fb6108970152548783ccebb88c |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b2f10894076cf9a43020c1c1f9e211985c4634ef |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a908adc9a41ba2e9ede1bbabba82cfabc19cdd34 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/39a58bb00bfd969a104f848e7c78b96c21ce86be |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fa42414b7e2e2075e591088115dddab5a001db22 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e13b3b09cbac7d8a150439193389c74d5f9c9df7 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/db130c6e6a3e39245e75f05e396b8240dcb2ab03 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c71bb9a6cfe0b15c51ab07a4aef5e37fb96e164b |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cb3e899982cfb3213c9a28261a0753127e4ef3e0 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61ed428fdb76127b0dba5dc9b186408517f537a6 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/91605a3da594db77afcfcec1435323da0a14754a |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a4228007b869e10dc1ae69118e14ba7c395a8a6d |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a7d3f5158a7f6a7a30747dcbaf0a8df05cdaf4a2 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ef5a4e0cbb6edc8c696a93191921106563aa0f5a |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f99162db1ec39f24b1f7fd9e4c49002967590694 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6844ebf17baf49774162e20cfa017850f0059e78 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0ee7a5ca322f2014e25f238dd51ce55341bd95d8 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/46dfab9ed250a947e452658a6124a27ffba8d55b |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/772802ccdf624f54a704aeeb5edfeb6247afaac5 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e0d4a7fc4888a0dbcd36fdb7b7927175aea72f97 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/009a400c229af8c15ed05a8aa5362a3a01fe5f35 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a7cb69c8e92fc83c1d054f8acab7e148409fc091 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fcfc850fc732f1d6ed4b09d99b731400305b4f03 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed877ba68a5b9f38c5119365b9bc522ab3f0f31c |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0330aa78459cd64c423d7c53655771b60499cf58 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/92497f9511635c608bd873d47b8e3c3368bc5e55 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/365174d10ec6666fc83304acf6d4b3fed4ddbfd6 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a752fd40e20bfbf4a031b8518a9766b9f80ae38 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9210de386072e9924c75922e4cc6564e0c239eff |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f8f3e4dd731678c14dd05972ff9a308b26d12dd |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cfce407eb5495b719204c3ba6701f209c75667e3 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f67746df5a2c74e5d24889a3761e40192c201c49 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c3bf0823f630fb9ab97d8e16e0988caa5baf5d8a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c054e29dfce4224dc5df3384d0bb2603e0cb541 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a1023f6782ca111017892a4a74dd1acf84585e69 |     
   mips64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/4c6cfbcf596f2d0ac1f8a546fbdc542b1a8a1c18 | ORPH
 microblaze  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/147e8473a8bdf3fa46dcaaa092db4853f977fef3 | ORPH
  riscv64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/5ddf58462d2347b1bb8adeccbdfe0bdd6cd2f552 | ORPH
   x86_64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/4d6889cfb155b8e10e9b91e4e6d8a1118830e865 | ORPH
   s390x     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/5c5f79544a59e3298139ec78057ef9d45e8a87ee | ORPH
 microblaze  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/54b3b35502278dcaccd074b0a07928628c817707 | ORPH
   armeb     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/3335686afd66fe58605266ac89e1108d4dd1373e | ORPH
  sparc64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/bbd8230ff03ebbe333efe1063f1bbae7a6b92971 |     
   mips64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/61b05489f97e4fa8683c26c5db43666a37879cbb |     
microblazeel |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/f8c48adafab432f31dad8d49b6fe919033618330 |     
   sparc     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/8897af9141c628dda7bd54f2a53cf85e336232d5 |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/08f5027a64f6e46acc25ef43bcc361b09faf4ffb |     
    i586     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/4c4acb07696daeff2defe6678952a7de5bc3d7ff |     
    sh4      |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/404adec849fe0ad8ebe632123957c7924c1fe9c8 |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/7deb7d8c3300c65862cc4bf82d65a792ea71aa41 |     
microblazeel |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/2d890cdac1c6ff0585b780b8b6fcf30c4b71179b |     
 powerpc64   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/d238bd2dde89b99a2c19e206310f0fa8eba3d39c |     
  powerpc    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/a50987c73c666849dc52e5467341fd7dcd4034f3 |     
   arceb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/06bba7e3c71be9bf541f0489d668c16153c73ff8 |     
   mips64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/665e06243194d538bb1e49405c528cc99f88862e |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/52bef71112dee805298bfcdd378d80129c090bb2 |     
 microblaze  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/89252659d404b4b81751a4a50d60c4ade9d370f3 |     
    i586     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/7d3b94a798f233af6c06a85064ff3071ecea36ac |     
  riscv64    |     host-gcc-final-12.4.0      | NOK | https://autobuild.buildroot.org/results/5853518f954fec237c12a9500fb712dfcf73daa5 |     
    mips     |     host-gcc-final-13.3.0      | NOK | https://autobuild.buildroot.org/results/5f912e9daec947a2e3e21ca6e4fd1968579e24ff |     
    i686     |     host-gcc-final-13.3.0      | NOK | https://autobuild.buildroot.org/results/fd831784d1fc0ef2b201cf9f732c2831d60a1218 |     
   sparc     |     host-gcc-final-13.3.0      | NOK | https://autobuild.buildroot.org/results/3880c648c8abfcf1f2d3830169072f863a7bdc2a |     
   mipsel    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/1bfe70a02f6bd62bd6da0d6cab4dc4f10e80a66f |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/80a9d8a52ec03b90e7f78e6ca9fb1cb8d5f24d6b |     
   xtensa    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/4950e002eba4cb77d7e777c8d522443d38a201e1 |     
    or1k     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/ca702eb9f0470475e525f203676061fbb13195d5 |     
  mips64el   |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/c9ab6f588e69be9cb94aa30e5f409f92ee9fa587 |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/22b345522e00d9a7c34c53630565ef9e3ebbe345 |     
    mips     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/e8825b205c4d56b0cbe205334341ad4d7cf4f462 |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/0e907e09f9a67247538929e0791319d93ae3e799 |     
  powerpc    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/ef993b4eb9ad5b9d05ac61a6f22e07ccc4e469a4 |     
 microblaze  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/f9b90a69ea9e4fc7588418e6a9fcdeeea2c20d03 |     
   mips64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/4663cd6e6fd1572d255afa74a889a03c9a7d6f72 |     
   sh4eb     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/f95269277e46b403df52c3fbaf52e817bce19c01 |     
   s390x     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/bc116c8c84ae7ec3b9d3cc1d79686d98b88a590c |     
  riscv64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/ae379e23ca52eeb601924627ee8bbe4f593ba440 |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/7d4b3333e34aacfebb50cfccb25af4a0bed9b04b |     
 aarch64_be  |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/5a14c5e1cc831cff50e93b2f4753c3523669c137 |     
  powerpc    |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/0b48846355b7ab1769ae8962671d255a70fa28a3 |     
   arceb     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/5d01bed01fbf67aadc765155d5eedb70fcde844c |     
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2a6a6020457c426c67f1ec19dec2ddeffa450025 | ORPH
    m68k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c8c54e5d43077e045bcf0b91640f788c42a370ed | ORPH
   sparc     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/295929d1f8ebdcf2821e0621d01f617e4b6e6758 | ORPH
   mipsel    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/4801870f6bc675309bceca04057e73709e232ca3 | ORPH
microblazeel |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/64aa85abe3400c7e2e094685f5ff7fec63dc1375 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1fba53f471287d18667b24e2c23eebac27b3ed21 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/60aa2fbb007217f539b42f1566a64ca677ac0541 | ORPH
 microblaze  |          host-kmod-33          | NOK | https://autobuild.buildroot.org/results/84393f8aef3183fb28d7182bb4ee188c9e758f81 |     
microblazeel |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/9cd820a9c07467e904c7d070589f9ba65e2fcf2f | ORPH
 microblaze  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/4738c17b201db38885ea2177cf36c75537ae6927 | ORPH
  sparc64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/1568fecd3527666e798453b052203eb803d45293 | ORPH
   sparc     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/906e82b2fd63407501653d924fd92184402d4249 | ORPH
  mips64el   |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/1d31f3068c6cbb87102ff97def97fe481a1c6e92 | ORPH
   sh4aeb    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/c719ed068e58caf786e1cb60ad07501024b2ec8d | ORPH
    mips     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/5ecf756245224aecea78645337e7bcdeaf433d07 | ORPH
    mips     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/1f0b18c0a98824af381a59e753b63581fbb12374 | ORPH
    arm      |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/23c35af44ce837ad9d87290a7ee8129d85225b8a | ORPH
   s390x     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/bdbc13c9111feee059586ecd439e6a727fee6421 | ORPH
 microblaze  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/5737a9ba7b8a3f1ba78b7a676d5beab845ca4abb | ORPH
    i686     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/5dfef30c503fd918541be60bf1a645a6297f7a64 | ORPH
    i686     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/31fe16cc945adb5f25d145c6c46b154aef841081 | ORPH
    sh4a     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/c01788df75f2cc7cdb44acd77ddafc4916c96764 | ORPH
 microblaze  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/48d7cada779fd87144e4603e68c7dbfbda025789 | ORPH
   x86_64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/8de641e1ad97c01b5c191d505b25a4ef1e179da1 | ORPH
   s390x     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/3214b77adfb6d2eae6e8b6b93e45a8254972752d | ORPH
    i686     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/7e5c9dc1a5af850e72568483b9b33cb7cd5cc8b3 | ORPH
    arc      |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/46975dce1f93a32d00dcc2d0639960faba9c0fab |     
    arm      |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/92437d69d93cef311c89d9342f647431743c64d7 |     
  mips64el   |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/5a0d6e022a353c7b2e3b0e522764560cebf8e2a9 |     
    mips     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/052a34f2937d1b8fff77c9a52b2c0543584984a3 | ORPH
   s390x     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/bc5483f661d1e4830aeb173e1c62e6706a9d8688 | ORPH
 aarch64_be  |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/3785be423adf6632433c776dde0248a4e9b969b7 | ORPH
   sparc     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/99f2245b0f7e2555a945864c0aea10c04df4973e | ORPH
 powerpc64   |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/2e680fa6313f930e394e4f5949c06b044c1e8c9a | ORPH
  mips64el   |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/eb55f5a7017acd245d7d047f5c0d9ba9d8769ae6 | ORPH
   x86_64    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/e06f46f42c702efef0e8d91746caee9bba2cc808 | ORPH
microblazeel |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/8336a767bec6646fc91e755f0509321fc7f0f8ec | ORPH
    arm      |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/1e84ab6e2a345abc7233667f52ef06958386d8e0 | ORPH
    m68k     |         host-mpc-1.3.1         | NOK | https://autobuild.buildroot.org/results/7a26adb7db196668a582bf82d315a17f879957db | ORPH
    mips     |        host-mpfr-4.1.1         | NOK | https://autobuild.buildroot.org/results/29a5e66bdfe451387888f4a521c85f5a4c0e39b6 | ORPH
   mipsel    |        host-mpfr-4.1.1         | NOK | https://autobuild.buildroot.org/results/eee02844833f49bad5cc3ea44576df36d558bced | ORPH
   arceb     |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/ea5e7620319e4b30e49095ec030780fc60e9ccb0 | ORPH
microblazeel |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/5397d54b40e86aa10a0b474512867dc5c9e246b6 | ORPH
    i486     |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/04affe7919fb95a5c29e6a5facd7c698b172cbb7 | ORPH
  sparc64    |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/fd71b7e7711cd9fa5aab83bcb646b4ae4089871e | ORPH
   armeb     |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/ed1f1a7dd496a214dd40093b019f303a327dc296 | ORPH
powerpc64le  |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/c1415a84e802f7cfcead9ed5ae59fb1b4edbdf3d | ORPH
   xtensa    |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/ee52f754a4deb1249c20874249fff7dc55ccb7f7 | ORPH
    mips     |   host-ncurses-6.5-20250517    | NOK | https://autobuild.buildroot.org/results/03d2a01037b1d95f8fb99c689601508109e0a9e3 | ORPH
    mips     |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/a21c3f8539c0f1143bd0094e6ee7fdea27e8f057 |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f31002508b0830d7bd94972d788c0ab2f42519aa |     
  aarch64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/19259f761ce44f99f754ae7e25f278547767c2cd |     
 microblaze  |        host-pcre2-10.45        | NOK | https://autobuild.buildroot.org/results/dae3856eefa2e5f87da20a3506e2973fa361c32d | ORPH
    arm      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/6e10a519b763cee12212a62f4f4c223aa9cd8074 |     
    mips     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/78d42b5eedf940296a19d7f31b155f995fd3890e |     
 microblaze  |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/36fb6f7a956087742a902f1a4c7f6f989ce08851 |     
  mips64el   |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/f1e2f9dfae5f8b23f89be0996c80dac53c8b4f11 |     
    mips     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/8cd2e7ad42b8f4f6241aa64ee3c3d84df43f3a96 |     
   xtensa    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/dead6308a552d3e725daf6e1d38e2f58ca7eb87b |     
 powerpc64   |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/acf284f22c22d507a5f75f4021c2d801874db3f2 |     
   s390x     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/99f333800ad941976598220ccc2ae13ed6b7d55b |     
   mipsel    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/632e0903cce531dfe3133016dc6a34fc4f24775c | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/0dfd0161b9b3e8a21e78b156af53c0d9544aaadd | ORPH
   x86_64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ed15a5fc191ccc5c589f014998fd86d8f58ebf3b | ORPH
    arm      |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/758332cd996b63314cc6feee86a59f2141d40565 | ORPH
    i686     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/c1bcb2630ce15b1719d6b4c3d515e1bcaf915216 |     
   arceb     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/5649e29196a711e298e986dc8410c12c42a1c00b |     
 microblaze  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/00bb88e41d3bb291e8787e4f8d9239fbade26226 |     
powerpc64le  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/8899b1dde25d079f6284565087788f76ae2cc1f9 |     
 aarch64_be  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/bf6abbcadc33d4d56c23adbb2d893ff8faa3dde0 |     
  mips64el   |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/c35608ba55f185d6ffde133da3785838e9b364bb |     
 powerpc64   |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/8481155248b82090ec1366cc671162e4b14afb50 |     
  riscv64    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/2f21a3d2eb2ead6baaf4fca23de73af7d615687d |     
  riscv32    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/7a4d0ef6965acb08d2ebfba9b4abaa00ca047820 |     
    or1k     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/ddc30eb6de546d53cfe88d09e2673e15eb104d1b |     
 powerpc64   |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/1c70f8187898c9b63394de1eefeb58eb44f09e4d |     
   sh4aeb    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/688ce292bf45bc86dde51f6492be3481581e659f |     
    sh4a     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/bfd493987c66815c419aa67d1587e290208854a5 |     
   armeb     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/680b825b93989e6aef247593c198094a6ed916f7 |     
   sparc     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/d56b9cde861248e2b7159920a63a14eab7d83543 |     
   mips64    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/e47af89ea3e759da92dae6b0a69062714aa127d1 |     
  sparc64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/97723c082db3d111391f7cb694dc645d19aefaad |     
   s390x     |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/4cfb55fe56c1cf849a16e0325b1c2d37b814d950 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/776f39f1a0c72f6f66f27483f50170654740e5ac |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/04410d086fb4164df69913c75878581f4f8a3427 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/046fadf0be65850f1977c1e87406e5553a2f9b29 |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/2dc5e661da64f99ebbebc80fd7a3ecc7bcaa6a4e |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/6768282ecee6708d6ef5bf1e4f611871e262e4c8 | ORPH
  sparc64    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/fb2a56b96ca256cb244126bb644d6989dc5941c5 | ORPH
 powerpc64   |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/34988c6f2d28eca19e87dcf118373588ca5e7ca6 | ORPH
    i686     | newlib-bare-metal-4.5.0.202... | NOK | https://autobuild.buildroot.org/results/d2e942fa8f8a5f82b37dd922b6f946efacf062f0 |     
  powerpc    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/4065004edb6f065e493658240ca3e94bccdb3363 | ORPH
  aarch64    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/f2712719ba9a28213faedbd013205f12e120b5cf | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ecdb9f23c142165b33ddefd6a42e32507d1dce64 |     
   mips64    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/f9501a2134c78cf690940999de9edf208e3880b8 |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/11670ea0425ef3d90fcff5def15674bd34ac7018 |     
   arceb     |         uclibc-1.0.52          | NOK | https://autobuild.buildroot.org/results/c39c402de4c55d16bbe843752e6a0da328c274a5 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/928bda0be9ae0bf5f71f9a01e39162b542186677 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/22ff6e7c0412c5fd0c9f199db94162aab861a3f2 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/19a8d006bfeef618b71bd0a1aa69c6d1a67f7813 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8df30c49be35d3003baf5817de0d9c552e1c986a |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2628493c5e1309365466616b1cdbf5c6a8e32866 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/cc8e8fb1c150c6da4360b38f9198ae1db19f7d8c |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c130c1dfe69844c6ebcd63ce0e423d48dc26c664 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/3f12992253b79a997a6a00b2ffa1ff0f4a632625 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe6f622aa67baa2aed94eb9be26c5291c05a01e1 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/3bf2c63ceb3f7bbfd0c754ba4da1c7b5f7abed45 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c77f3bba4b3937621198dcdbe6e9b51f7146e621 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           ghostscript-10.05.1 | 2 
                  jack2-1.9.22 | 2 
               host-yasm-1.3.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/f8e215f67020161e31eb6ecd3906587d81808fe5 |     
   mips64    |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/2a4053dc1d6ec50c2c2d7073baa91db6e2ef7dd8 |     
 powerpc64   |        host-yasm-1.3.0         | NOK | https://autobuild.buildroot.org/results/5ec3d6ca2817ee6aafa8a5c84ad716d8681ae9a1 | ORPH
   xtensa    |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/7b913e653ac0f2b7c0d00343bc4269bb3aa07cf2 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/c7263e9b93d1be96cd72f297b5c2d2c04749d542 |     


Classification of failures by reason for next
---------------------------------------------

                    bmx7-7.1.1 | 1 
             casync-nano-1.1.1 | 1 
flashbench-2e30b1968a661474... | 1 
host-binutils-arc-2023.09-r... | 1 
          linux-5.10.162-cip24 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4b30e2f66c0e864c48ec542753446d9c33cdff86 | ORPH
 aarch64_be  |       casync-nano-1.1.1        | NOK | https://autobuild.buildroot.org/results/e4a6a9c0c3d940c8ee69e2ac8db37ba33f63c78a |     
 aarch64_be  | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/2c4cf4029bfb7dcdb7bb9c76fae338d92da213fe | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c32573fe04f527eff73d75909f6e32b1ba54de57 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/60263f0745d60a62ef492cf3fa62eed1e29048fe | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/348b5d018caeb775215a7fe78ef3c85052ea2a94 |     


Gitlab CI results for 2025-06-06
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990145 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990149 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990248 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990254 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990262 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990267 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990417 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990542 | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990604 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990625 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990641 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990649 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990658 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990661 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990667 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990671 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256990676 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256991060 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256991275 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256991387 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256991396 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256991545 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256991578 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256992730 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256992760 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256992771 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256992878 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256992881 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256992884 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256992889 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10256992895 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10270241450 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10270242558 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10270242767 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10270243002 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10270244935 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10270255560 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10270255819 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10270257579 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
