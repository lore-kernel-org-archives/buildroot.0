Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9896FC54ED1
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 03:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46CB882169;
	Sun, 29 Jun 2025 03:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTNqQ6x5Bxgw; Sun, 29 Jun 2025 03:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A9CF8217C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9CF8217C;
	Sun, 29 Jun 2025 03:15:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 204D2DF
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 03:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 060F4405E7
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 03:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYFWeQCjalxk for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 03:15:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D91E3405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D91E3405A3
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D91E3405A3
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 03:15:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-607434e1821so1542232a12.0
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751166921; x=1751771721;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SUZvfs9LYdMB9EWN7OwxrG/PbikA+4i3nImARhtQB7c=;
 b=kFkzbqo2CbIQ/V0qPJT84qEhw3Raa3MxZgfBSCTFV1NRmsIILyXp5q5+taNfc2d6Ak
 s/472AGlT1fXhrif/7RucCPH7vqi7wLRtFVN15nBEhACWKwQeB9nGivCLnPae8aKLX7+
 mIpOSffJMKt4+emmL2dQZKbvNCnDYo56EsC25M4XyooquS2CTtcXgOcQODN1tdOrt5/a
 vJVXVac2ZjNlsVnF/w1UPBQPZAjlgXpkJIuDfaOcYcilx1Lxby49VgN4sY6wVjwmSaS5
 vjtEqkTtMJ6HDIhiqPfJPmAZOlYcH4R75t32DB0J7tcAKiPSYa/F0gBEz6fGcWP7k3se
 tMoA==
X-Gm-Message-State: AOJu0YzM6x9vBC5DHVL3RInlup291TL0UTffQNwTpk14cwYAF46piIg7
 VK3DsCoNrvjB2Pb1KmF2wpPjjAuPywd+PhsoSVuUNPrD96yGpf+001+BZeoCSg==
X-Gm-Gg: ASbGncvZaBzH9GPpOFFvKzVkaBhKhO367Q1PhcqhYvMd/MIHCpNmJfxu9DBFQbi2Gc5
 W2Z5A5sWyh6dwItv4u0Mc3PUjhDepya30ASYH5vLAsAuLHSHFbafC6BKYITWA/SZmzO8koNFfQy
 3o+Z2hAqpBU6hcRrbk5yjKHL/mJklobyftmoG+0LBODQD+JaoXU76GoZQyJKUg7FzbKXCKmcKIz
 hwkcL3QngPOcH7Wyi9yx5yZYFQ67mPtLOhgs0toYDLjS8T+LL0BRbps7f3fIVfo43l2dU/pAosP
 j8dcshhWryMb9OuA6/tK3017a7SGGdcvbPJFJaQkw1GLp7yBB345wFDTopeoMg997Q==
X-Google-Smtp-Source: AGHT+IHub1wT5A7rDeBi+1h5J2ELEZKJmyqqWz1QJQ1FQzhpoCNTj60KoVaxD1z/qPfMnffnv28cGQ==
X-Received: by 2002:a05:6402:5246:b0:60c:421f:1357 with SMTP id
 4fb4d7f45d1cf-60c88db6d90mr7156654a12.13.1751166920597; 
 Sat, 28 Jun 2025 20:15:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c8290eaefsm3663293a12.34.2025.06.28.20.15.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 20:15:20 -0700 (PDT)
Message-ID: <6860afc8.050a0220.247c76.a21a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 29 Jun 2025 03:15:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751166921; x=1751771721; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SUZvfs9LYdMB9EWN7OwxrG/PbikA+4i3nImARhtQB7c=;
 b=Sv86uwX/nTIyo7UUaVSs6HmI3yThHvYpb8AYCMAsS3PQ2eZlrZl+VwN2aUoOh5PAo0
 9tsedVe8ZDIKIT6BL+3tbmr64Sop9wk9YDtryE3FyRTs147gRnmzPUsJZuLoMa4TZRz/
 kXCqwVIwtkcD43P1CITnezDYq2ElDIB2z+cAC9SLMYzysis4FQVobvV52AHu4ukPnG/f
 P42vefr8dR2i2XuImNwgAEsEnumlstdEF0dh4fpgUK61p72XG+mUKaU5FaZbNJq/n+n4
 OB605Vytt0+7EHVWZza9IjNJ8gqVO6Zb6S5jXsZtl2F7F7YZ6hcC2zpFkwYmBV8uLGuh
 dAvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Sv86uwX/
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-28
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

Autobuild statistics for 2025-06-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2025.05.x  |  3  |  9  |  0  | 12  |
    master   |  8  | 41  |  0  | 49  |

Classification of failures by reason for master
-----------------------------------------------

                 hddtemp-0.4.3 | 3 
                libsoup3-3.6.5 | 3 
               bctoolbox-4.4.8 | 2 
                    bmx7-7.1.1 | 2 
        host-berkeleydb-5.3.28 | 2 
          host-binutils-2.43.1 | 2 
      passt-2025_02_17.a1e48a0 | 2 
                   bash-5.2.37 | 1 
             erofs-utils-1.8.5 | 1 
       freeradius-server-3.2.6 | 1 
               host-parted-3.6 | 1 
                  iozone-3.506 | 1 
             libargtable2-2.13 | 1 
                 libgee-0.20.6 | 1 
                  libjwt-3.2.0 | 1 
                liblinear-2.48 | 1 
                  libnids-1.26 | 1 
                libressl-3.9.2 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.15.3 | 1 
            makedumpfile-1.7.5 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p18 | 1 
                oprofile-1.4.0 | 1 
                p11-kit-0.25.3 | 1 
                petitboot-1.15 | 1 
                setserial-2.17 | 1 
       shadowsocks-libev-3.3.5 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
          sphinxbase-5prealpha | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/c29d4278ba0c0459c3da118e8c1d05558e886359 | ORPH
    sh4      |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c5adb992da8655d873e6e0b9c91c3a9232a715b3 | ORPH
 powerpc64   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/846ffcfde8277425ce6051447aecd3a2c63e2c86 | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b5466d55e8f999eaaf4271f5a7bd9d37ef63ab37 | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/75253d56a157e666acb326681f72f6e38fb5222d | ORPH
   x86_64    |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/5f9e64e55bc69941b59cfbb9ca34e37f768d3bb6 |     
    m68k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/8faf6267f6402a49b718b3715d5445e85e9af290 |     
powerpc64le  |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/ef0046bb6a60d47911baba8e1067d8528fff6eda |     
  mips64el   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/a2801ff0dffd42a04e3a472629cf4729c543d035 |     
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/02cb026f75da880f85a58b851e067b5d2f7baea9 |     
   mips64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/30ab1bd5f7a74faad331d824914fd52991a6e445 | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/79235b52e90096e9eda284f57ce5f7f9dcb62ea0 | ORPH
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/32ab6348f65d7648ee4837bdcce1ced0174836a7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cf8cc2ca835ab88ad6c3aa169025e5dea2325f4c |     
   armeb     |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/ab315eb029526dc156d17d947369232e8644aa37 |     
  sparc64    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/941ae7b122af2a3183420a7de39e8dc5b480736d |     
    m68k     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/c3b90c731d7e8f0a2d027d436867b25649bc3da1 | ORPH
    mips     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e4ec9cae996bf856b613c84ea01880c20930bdab |     
   armeb     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/7fbf15bf561f6104dbfc6a3792938ae4fa0e2452 |     
    mips     |         liblinear-2.48         | NOK | https://autobuild.buildroot.org/results/cb68b228de61ede8677bda9437b9d22810db2764 |     
   mipsel    |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/8743aa07172b654c107714a86b05a90663e41d14 |     
  powerpc    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/78e1ef11923a1c7cbf265e85b526b1ccd55120ee | ORPH
    mips     |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/13e89c53397cdb261e51ce225c7e237f6703a1dc |     
 powerpc64   |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/e78606d8c516824157d5dc95fc05c1437fc206e3 |     
powerpc64le  |         libsoup3-3.6.5         | NOK | https://autobuild.buildroot.org/results/60b9874cf7bff213af4d883389013b47c2a40110 |     
   armeb     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/fb292d511c287adf709f3cb480cddc70df084565 |     
   s390x     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/433f928b3ec04bb193ff0d14a37b9da55f6945e6 | ORPH
   xtensa    |          linux-6.15.3          | NOK | https://autobuild.buildroot.org/results/2bfc2da7a89e13dfdae039e768091c1f09f1b980 | ORPH
   s390x     |       makedumpfile-1.7.5       | NOK | https://autobuild.buildroot.org/results/77822d5b10adef85ed577782d9c6db28d25b210e |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3169afbb01dede7e3fdd1b6b7d3899a6b4322c4e |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3f23ec689d53f992ef331fa7a85e47243f3ec2b2 |     
powerpc64le  |         oprofile-1.4.0         | NOK | https://autobuild.buildroot.org/results/cfc9c6f3dd3c35dcc1f7d171f12fa4d53945ed49 |     
   armeb     |         p11-kit-0.25.3         | NOK | https://autobuild.buildroot.org/results/4b8f5fbb6585cbf3fe274accd802d38dd55abd9c | ORPH
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/1f66a4ea42e0cde65ae5f510ff60443be0756d84 | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/11ad294d386c7e803796e775fcbd75ab70dbd40d | ORPH
  mips64el   |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/bf173e1e0f8ad3f40534aaa358dc40993cd14ac4 |     
  powerpc    |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/38774ddb216e6229b5f8773bfb2f6dc2e44c40b4 | ORPH
microblazeel |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/55615749be16f22040d4ed90458a55af63ecb676 | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/ad5f3eb477e67cf72f8471a2c97dba2e64e6cd8b |     
    or1k     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/b5533f9c42ceb7431bbf11d5b853a572c46d8715 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/1463ed5624f8813dbe2e62beaf21cca1f58734ba |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          host-binutils-2.43.1 | 1 
                pipewire-1.2.7 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7e61e0a8b9d1d209ef691935fabd6327e29f8748 |     
    mips     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/e4c78f8349147e9fab2042211294b340cd133499 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/6792042d958ae44beccdc6325c3b7330fd23b5de |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    bmx7-7.1.1 | 2 
                   cvs-1.12.13 | 1 
                  libbpf-1.5.0 | 1 
              libselinux-3.8.1 | 1 
                  mbpfan-2.4.0 | 1 
                  ntp-4.2.8p18 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/47cda6c35a0da59de7cae1e5eb44304be14aaf8c | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/03293afde6b8bfe0b5f1cf9063dc9690755d42f8 | ORPH
   sparc     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c3ca43a6f302513c9c614d0924cf64d5e2d0cc80 | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/a1c7b5deb52ef577848e67941a702c97d411be15 |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ddfbb43f74cab7032e1251aa51dc9e2542eeeb13 |     
   sparc     |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/19d5545d86497d058a9bc3f210210e96ff108c2d |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a0c24403b70ab7ae9d4265339f0125787504021c |     
   s390x     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/356bd3a0eb31dbefb0dc4a270635a12b4c4920e7 |     
   x86_64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/d1965420ed3da6a9bf21779ef71c0a878bd035b5 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
