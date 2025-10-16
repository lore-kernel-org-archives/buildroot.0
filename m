Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E749ACCD185
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 03:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9483D40F27;
	Thu, 16 Oct 2025 03:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xa2kb48UKrO; Thu, 16 Oct 2025 03:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8904170F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8904170F;
	Thu, 16 Oct 2025 03:24:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E37EA968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 03:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA17B40BBE
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 03:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9_xEET1Nz5o for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 03:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FCFD40BAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FCFD40BAB
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FCFD40BAB
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 03:24:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-426ff694c1fso89883f8f.2
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 20:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760585045; x=1761189845;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=to+pjQfyzfNMYHUH8u0hP0HUACQxE2+EAAG1R3Cp/DA=;
 b=m0S/168KsuPAWaaTvTqwSsGQwMqN0GndJIxz37UqLAJdWUnv8GIO7fFOrrRZB2PcPo
 pTx74wPTTCSr0bSHMI6rLX1bIYvJEHX4Ro6Rj7w8X90Y2vZlSFzvnIHbbrB/DxPQJYjO
 L/6ZjQZypQhbDzbjaUErAXNze3zI1KZ5Q3l4RHQyn2Skl8ptVhVCbnGHWFrtX9qBzXwJ
 /G8zis4u0yEcVXtVICaVZP241tGlFJ2jTlcfzicVjJGYSQnzebcxVrQ4dZsFeQOvP3O5
 9hl0KXHac2FjnvhS6IiIx9vSYj9BZIlYkgXYCfUbFmCAh98+bA5nF0Dw6+Z2NcNSeJWc
 BGlQ==
X-Gm-Message-State: AOJu0YzcV61v41u4WdmZOjZhZRtk/2enqznPkyUo0HDKS2I06fQmbw12
 Sr5mDX3IW1hd/ogKa2sKvgBI5GDJge1BlaSYPPpxISDgYo6adPQoet3i63bwWg==
X-Gm-Gg: ASbGncvSqI4JOnDo4vz3ZJOAAZEE0WJE2WprKsWWMa0r1pDQKq3L4HHnAA5PHnEDgAv
 Osz8JlScb0VEzo0x71JnSXi0ZgamBSQ/hThiGvkZKf6gYM2NUr2PCiLHRZWCXg+l0GwP32/soV9
 TWfwJpvrGhe01qT9vMwaY8+XUMZqxDUFPtNs0LaP/vzW5AdQAKXUafiGFLHh7HCdZ/MaIKfK2ui
 74j41Bu4cvivsjXVxqYJXpco1Ry0s8LHVTRd+4vxTTaEp/ildo2/6kwkf4KtQDpy8M+oE96E+zQ
 65Q47NDdvyQ/HKktGFLIXggMnxJkNKkpvx0MFX4M6dwoRbxMgFx7Y9aP/cpvqXM5RQkGMnQUucm
 osYPA1WCqkDpBMGlSoxLb3SFIoPeLMZgtsZE1i+fT32eys8EZqKqtsS7KC5nOOIfpC+v5LYUUmQ
 coUPqrOGw=
X-Google-Smtp-Source: AGHT+IGgr3VQihsuF67/ZgJB5Sz4U6rlT65AOkrrsiwpjI92j0ORfdU+2Qm3sqzt1kOZ3xiM3GrhNA==
X-Received: by 2002:a05:6000:420a:b0:3ec:1154:7dec with SMTP id
 ffacd0b85a97d-4266e6c9755mr18611072f8f.25.1760585044609; 
 Wed, 15 Oct 2025 20:24:04 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm31623569f8f.35.2025.10.15.20.24.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 20:24:04 -0700 (PDT)
Message-ID: <68f06554.df0a0220.122d07.68bd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 16 Oct 2025 03:24:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760585045; x=1761189845; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=to+pjQfyzfNMYHUH8u0hP0HUACQxE2+EAAG1R3Cp/DA=;
 b=i0uOZyKdp0la4DYxcWlXFC46oKcP09b++iuj2hmk5sWKBV+llKcTWvyvZ0eR8plE33
 YjbjHscJH2UUJjm0WE/wKZYlfu9zD+J+GfTKXmvXUX0VRI38HaBvKUSj2LQJ3/S4Lc10
 GBieQxQLvHfhCOWVHG1IGxDhds0SxNugl6Jir5rhtN1g1uiI76P9XDkNyRMzfp3kTnfu
 9re1yYOPRvoEohdGMzOxiB9/BFAHIzVE5zuZTFcB+/wZ0NoAlXzfkEsk7HC3Aofu2IYq
 2sDJznoUpw2ZhiigRLKVrKLiq16ACUZCsi7cEXNR9QW3VSaEEFqXilmnGirHfZBgGjrC
 U7ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i0uOZyKd
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-15
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

Autobuild statistics for 2025-10-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  5  |  0  | 11  |
  2025.05.x  |  4  |  5  |  0  |  9  |
  2025.08.x  |  3  |  6  |  0  |  9  |
    master   | 40  | 74  |  2  | 116 |

Classification of failures by reason for master
-----------------------------------------------

               bctoolbox-4.4.8 | 3 
               iproute2-6.17.0 | 3 
                   perl-5.40.2 | 3 
             dahdi-linux-3.3.0 | 2 
                 dc3dd-7.2.641 | 2 
                enscript-1.6.6 | 2 
               graphene-1.10.8 | 2 
    host-llvm-libunwind-20.1.8 | 2 
            igd2-for-linux-2.2 | 2 
                  iozone-3.508 | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.17.2 | 2 
                 linux-headers | 2 
                    mpir-3.0.0 | 2 
                openssh-10.2p1 | 2 
procrank_linux-21c30ab4514a... | 2 
        s6-linux-utils-2.6.2.1 | 2 
                  sdl2-2.32.10 | 2 
          aardvark-dns-v1.16.0 | 1 
                 agentpp-4.6.1 | 1 
               asterisk-22.3.0 | 1 
             berkeleydb-5.3.28 | 1 
               dvbsnoop-1.4.50 | 1 
                    eza-0.23.3 | 1 
                     fd-10.3.0 | 1 
                      fio-3.41 | 1 
       freeradius-server-3.2.8 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-15.2 | 1 
httping-a1c5fdcf289cf7d1d82... | 1 
                 lcdproc-0.5.9 | 1 
                lesstif-0.95.2 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
               libglib2-2.84.3 | 1 
             libgphoto2-2.5.27 | 1 
                 libiconv-1.15 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
               libtheora-1.2.0 | 1 
                  libva-2.22.0 | 1 
                 lockdev-1.0.3 | 1 
       matchbox-keyboard-0.1.1 | 1 
                    olsr-0.9.8 | 1 
      passt-2025_06_11.0293c6f | 1 
                     pound-4.8 | 1 
                python3-3.13.7 | 1 
                 rtptools-1.22 | 1 
         s6-networking-2.7.0.4 | 1 
                    sdl-1.2.15 | 1 
uclibc-ng-test-132c6134d691... | 1 
                  vsftpd-3.0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.16.0      | NOK | https://autobuild.buildroot.org/results/9491218eacf80e116848257f008f52e54b3d921d | ORPH
  powerpc    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/a2b869bf24b0f2f10b0ec7e26b9af73559b70934 |     
loongarch64  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/dd49d4633cfa1ea0c998f87a7527618639b3786f |     
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c8dbb9ef8c0f3823258a1f50cf048a8890df87b1 | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f475ea19bb103e33a572b93dee99eda0beaac552 | ORPH
loongarch64  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d71383f5c9ac9ee24cfbe18fc5b6c0c0d4d0350b | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/536c12e621ced4dd20e910243d5dcb01c8004e05 | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d7a3e20fe46ea58365f9b88d7e2d50f84ab5120f | ORPH
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/acf5a8b1fba6540724239ce9e49691c93eb50676 | ORPH
powerpc64le  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/caf571d795e550868b2591377e8d42845fb6fec5 | ORPH
powerpc64le  |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/4ee4e39ccf4656345bcd28fcb9a31c2169c0e890 | ORPH
    arm      |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/f3b5d4430df3b3c81fe6e354008489b4a709284c |     
 aarch64_be  |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/ece0da5039a74cce04db394d4e6cd6688e5cdb62 | ORPH
  sparc64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/8c4be4038ae7dc0a77ddc065b730234cb462048c | ORPH
  powerpc    |           eza-0.23.3           | NOK | https://autobuild.buildroot.org/results/30cc35813bc0375f9010b596037e8c6621775fbf |     
   x86_64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/7e80af1085564a1eef54d2c690954a786f972926 |     
  mips64el   |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/19a34b3535d4d39904d209c780b3574a2c45722a |     
   x86_64    |    freeradius-server-3.2.8     | NOK | https://autobuild.buildroot.org/results/4c198cab14cf8d3962180b7cba70b3f80da5c7d8 |     
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d174a170c8ac1ec668988a9ff102a2dcfd5bcf36 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/155ea2a9fbda84fae01ee0a95494349164254326 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/ddc3f52fd9c296a633c11b741a06ab01b3a160d7 |     
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/af4191fea89de544841dd90fb7cf4095cef587ef | ORPH
   armeb     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/70a74805c4415a50674b992bcec6b3b9d01a4de6 |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/a02ff3dcfe23078b1c74137d226f1ec9411f2fea |     
 microblaze  | httping-a1c5fdcf289cf7d1d82... | NOK | https://autobuild.buildroot.org/results/7402bcb1633bcdbd437c9974bd33a3c65fc81238 |     
  powerpc    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/bcc904fc06ad6ea8de825a4edd658c1ae37ac16c |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/33be64232b4fb4916c26f759ab0d58afa8f30d1e |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/5ef74d547ee95c89fb839001c10fac8bd23cf298 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f9acd07b8f8deb9aaac7795e0ddb5ff5a37865a8 |     
   s390x     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/82ec7da13e4e360a6a9bf899a675f2f49ea467f7 |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/dee92cdd10749444964473310ca5810bc56b1bc6 |     
  aarch64    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/bdcadb0cb4d5a7347df699b38e54e62504921639 |     
   x86_64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/d1cbfbd6c99567b561079a80f98492e97f3a1847 | ORPH
  aarch64    |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/73c011313e5a9c0e40b31e1dddc484dfa1275b47 |     
    or1k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/66ed7157651f4f467be14e18b34e419f43291fda |     
  aarch64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9b967e0352c0d51334378573c7602adc795a6b51 |     
loongarch64  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/d122bb08dcc25bd2846c560c0b6ba656a7075212 | ORPH
    arc      |        libglib2-2.84.3         | NOK | https://autobuild.buildroot.org/results/e3309ab2116f43c018a0c0fe80959ce093281832 |     
    mips     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/3679e00d5f4be0c391f9349fbefa224792d360fd | ORPH
   xtensa    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/7bdff487f048e1062cbe304a34f65be9503da5cf | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/7d5b5d648ca8c588f0b81c1e943fa2beee7ebeca | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/80d3d1ab3865b4aeee9ae6c6d700666529bcdfbf |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/4dca884dd1d4ca9e34abf1d9aa6ab1bce64ed354 |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/a35e225cd9597fe6732eb89e3811457cb24394e8 |     
   armeb     |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/deb925342e12a0f51529df03c7cbb9e1043ff9e4 | ORPH
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/1cf8e1e6d1e688278f873e7ce22df003e020217f |     
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bdaaf6767f8c239bbf22e4619b2d6944ef951b2e | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/78ca77854cc51fe79acb371210b2d889c531a1f0 | ORPH
   mipsel    |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/0ea186645b2ff31d148ef500de0dc24cb39c6ef8 | ORPH
    i686     |          linux-6.17.2          | NOK | https://autobuild.buildroot.org/results/ac49fc99abbe887853724ffdd0e2eb22f58c28a7 | ORPH
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/46d35621cebcac56804aeb1fb0edf4f2631101cc |     
   sh4eb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/f11847b24c37e6bcedd42af3c0874dd0573fc47a |     
  powerpc    |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/79d7aee2eb263378bbf2f87184c017958ff776e0 | ORPH
 aarch64_be  |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/e522516e5d0f502a951a0c06b7785076e0c3c01c | ORPH
    mips     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4e52998218280ae5493b47b2ab228bcbee904884 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/66c1b1633e29621ba0670ecd45b3ce98879a27a6 |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f9ae5116e7ee043529cf91ae817e553a3a9262a8 | ORPH
loongarch64  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/75876c18c5c651705049b478431bedb7211df3ec | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/59ac9706bb273950b703d1ae3d2bf8d21c103867 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8a3542f3b6e7887cc1ec305d6c360c8047d2d739 | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/69b87352473d159421abcc380774106b9adcaa7b |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f7a1f21bdb70a03684b7b8b02b119421d056eda0 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fb154d1145926d1e07e2c808f16b3e9cae87ad66 |     
   mips64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/ac28bb4fad5110baf76f185885ec9bf4027fd10b | ORPH
    arm      | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/ee4e9fa1f2716a2850aa8deb4bd2603499ddef0e | ORPH
    or1k     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/e1fd7a367779307cb11220a2eb39c6f62e5e3742 | ORPH
  sparc64    |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/9d71300d0f393d781a6f4c3c1105c237c19cbd6f |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/3529e932012ed7ad45e1178f1f1e7f60715506bd | ORPH
    m68k     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/a89802e1f143be22047cfdbb02c4487e0a6389ad |     
   arceb     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/ee9d78231ee8d0901858f43fcc4071cb6792ad7d |     
loongarch64  |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/ddd59fa174deb1fe69fa97ff6030da10797082ce |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/3b0819504983f13731e6f2b3d9bff9ef889e4aef | ORPH
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/807f665a3277524c315647c8025e29aeca49d5d5 |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/4cfba211566186ba779ed8f5adeba6c821da09da |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/d86652af729a4b55738135cd84f0ccb469bb782f |     
 powerpc64   |          vsftpd-3.0.5          | NOK | https://autobuild.buildroot.org/results/405ab6a51d51bd3a483718a7d596fd54a5621a15 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                  libbpf-1.5.0 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 logsurfer-1.8 | 1 
                openssh-10.0p1 | 1 
                   perl-5.40.2 | 1 
                       unknown | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/cbb3da642b344e342b6b08b376d78f7b5e6602a6 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/775e567b4e4f2757237989d29da99fe4bcf01abc |     
   arceb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/b6ce0cb405ac4bf8913dd5b40b230871015a3142 |     
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/19e1f033a47113393544321a27f9348c6ac1bad7 | ORPH
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/709d1ca101f83679f8e78c5e6aad872204b882f7 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/6e47d5ef61ff79c5601b12f95d3a361482d26bda |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             bmap-writer-1.0.2 | 1 
host-binutils-arc-2023.09-r... | 1 
              host-swipl-9.2.8 | 1 
               syslog-ng-4.8.3 | 1 
                tealdeer-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/f67744793285b6fea3b35e0143693b84ae78001b |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f1a885fcf9b66813ca7fae0dbe7157623cfb0854 |     
  aarch64    |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/ed5be9289e6960e3584eabaf9193481542e3dd4b |     
 aarch64_be  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/7370bbb2377b9e55e1bfac271c407f41896c76f4 |     
    i686     |         tealdeer-1.6.1         | NOK | https://autobuild.buildroot.org/results/f8988964fc30d76a809f5f7a6bdc5b9f4e5ce4c6 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                libcurl-8.16.0 | 2 
               asterisk-22.3.0 | 1 
host-binutils-arc-2023.09-r... | 1 
                  libsvg-0.1.4 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/d0c85e37849e7ed4846f704a09dbb1fe7d383185 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4693a3be53676cfd08a16f0120427b0a79976b2b |     
    sh4      |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/3cf2f527cdcb04405d344a5cd478e063640a786e |     
  sparc64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/e02d4c04278248d7d69716bd0ee2f56e430284e8 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b6b0772f4d9b54ac6a75fe2e5f6563ea20d97137 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
