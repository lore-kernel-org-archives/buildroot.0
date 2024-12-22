Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A97EE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 04:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4AA42A43;
	Sun, 22 Dec 2024 04:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFaPKF5RlPCd; Sun, 22 Dec 2024 04:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7730442A53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7730442A53;
	Sun, 22 Dec 2024 04:14:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0F02D3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 04:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD4834026E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 04:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrF4ygaRCOn8 for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 04:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80D4A4027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80D4A4027C
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80D4A4027C
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 04:14:37 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa6b4cc7270so470524966b.0
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 20:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734840875; x=1735445675;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iWm6iKnoGvbwkZfaNmgkcG8qQcMvyOvnWbfkhPdCcuc=;
 b=Lv4+Pv9Uig7lYzcj11NE60bYzAAWlclZ+v88wIQgK5NkvAQmNpCzbO+Qr1uRscSQNL
 x0nUeIa8VKzwLcaaXO1hGl2ckfNNCjxJrbvwt7r+Mc44nhs23JpBCxYp+70yOwjZeAA9
 yEHeo9XeMC1nTfA5FRKdvQBvR9XOcWZ7+MN0t5XN7ERhrCdBBxX+ZlPmMWMaQxPuoc6U
 naRL1l9iAxbcp3kFBVQkKlcnmc0vdEcc8pUcriKjm19ZqPp2zvX2fmnXbQAv1jSjlSyS
 GvRmph1fQ/k4qm+tKFXCa4TaOGCNqA7UOpoXULPLT0vc09ZoHKJm61YE4LYX2BI/PUdw
 ErOg==
X-Gm-Message-State: AOJu0Yzqo0tXbKOkWu6LYIRYEFm3lXyg8B9joWDpUZBf0tJoDXkxQ+Rj
 OFDucY3Nnd+lre4RWvZsAguBu/vIdBbxS1OpR4ZTN8TQzSiFGZIVvTKQFg==
X-Gm-Gg: ASbGnctXYXuRWf+omgIPn/tLdS7w7l0Hpk2Q1dj1HePIBCZTpKLRjsdMIhaaHXKEfwt
 q5R7PaYDuSKn+VG5mrTDUbRbkbLV21/Ay9JNguz32nWOoSuK4PqHsTHoQdMPWSJzUNqKkr7igiZ
 qkIJBXSTJ+mnI+ZTX6tPJvxiQai68mbONR9djNmfBlhZ2Z0g+pbbhh1l4ct1r6hE8HwfulTLyJL
 YiHzdFLF7+C4WC9X4srXc0yPfZmZCIIE+X1cfJtZcC385nw9weMfqR3JLLT
X-Google-Smtp-Source: AGHT+IEEdS4g71SB2pKjpI2ZpN0MP6lXP3lUSRFr7ilAk8ErdAJFwvGKh7IoggaUIwzSzws/nIXI1w==
X-Received: by 2002:a05:6402:3884:b0:5d3:ff93:f5f9 with SMTP id
 4fb4d7f45d1cf-5d81ddd625dmr18427083a12.20.1734840875054; 
 Sat, 21 Dec 2024 20:14:35 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe48ecsm350284966b.126.2024.12.21.20.14.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 20:14:34 -0800 (PST)
Message-ID: <6767922a.170a0220.335920.d6c7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 22 Dec 2024 04:14:34 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734840875; x=1735445675; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=iWm6iKnoGvbwkZfaNmgkcG8qQcMvyOvnWbfkhPdCcuc=;
 b=XQhpPz86P4T+8EsBYe2jsb2gsE1G09pzHYUU4KOumsmUnWlGorSw/swawp3CM/M7n2
 OVdtpUIEBQ0svIRjp3+3Rs1RW+wcR3hbC2VFabOYFxbrXcHNPl6ugQ357fRf9IdYHyLx
 nS0JG0CCChdtFoYJrK5rv7szRWWtI80MPO5wTn9FJ/om0a97CeS4ly/X9jnuX8SFvum3
 pTtz1E5oTdRD+Gg/8PlnDSeQgbjCRRJ8rf4GTwH9EkUUkNlLKHYD/M6m9JKFkzVhjvIT
 XsqLYUu2yjUxCBHQ9a15hREN9Rrs2XACJDh49X3rWBV/KNskMQ721wYyrxt1AP4pCMwB
 Ob/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XQhpPz86
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-21
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

Autobuild statistics for 2024-12-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  8  |  1  | 11  |
  2024.11.x  |  1  |  3  |  0  |  4  |
    master   | 18  | 60  |  2  | 80  |

Classification of failures by reason for master
-----------------------------------------------

      python-autocommand-2.2.2 | 4 
             util-linux-2.40.2 | 4 
                  linux-6.12.5 | 3 
                 openssh-9.9p1 | 3 
                       unknown | 3 
             batman-adv-2024.2 | 2 
                  bcusdk-0.0.5 | 2 
          cryptodev-linux-1.13 | 2 
                  ffmpeg-6.1.2 | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
              luabitop-1.0.2-1 | 2 
               aircrack-ng-1.7 | 1 
                 c-ares-1.34.2 | 1 
                 civetweb-1.16 | 1 
                elfutils-0.189 | 1 
       freeradius-server-3.2.6 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                  fwupd-1.9.20 | 1 
            gdk-pixbuf-2.42.12 | 1 
        gmrender-resurrect-0.1 | 1 
host-binutils-bare-metal-2.... | 1 
           host-cryptopp-8.9.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
                libdrm-2.4.124 | 1 
               libglib2-2.76.1 | 1 
                  libsepol-3.7 | 1 
                  libva-2.22.0 | 1 
                libxml2-2.13.5 | 1 
           libzenoh-pico-1.0.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
                  lvm2-2.03.27 | 1 
               openblas-0.3.28 | 1 
                 opensc-0.26.0 | 1 
                   perl-5.40.0 | 1 
               pulseaudio-17.0 | 1 
                    qemu-9.1.0 | 1 
                  ramsmp-3.5.0 | 1 
                 rtptools-1.22 | 1 
               wireshark-4.2.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        aircrack-ng-1.7         | NOK | https://autobuild.buildroot.org/results/1d37458401684248e3c4ab57100951b518f93c88 |     
powerpc64le  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/0fadbfd3c838ec186c2d8ee7e03f833a881d1d82 |     
   arceb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/0093459e46600c4fd303d38590dd769ec22a0c21 |     
   arceb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/300131d24e127953dcdf2f6a33075c13dc8cfbdf |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/d394c6f176ab2799093fff2ed2be55671f802749 |     
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/35d2e0567e0540d8d0302a9a071dcf0ee6782955 | ORPH
   s390x     |         civetweb-1.16          | NOK | https://autobuild.buildroot.org/results/57c1f226cdc3a7b7eec2d2cfc2d09bd1aa30d05f | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/796cbd1aa25289cc5a1699995d51b706bb6462bf | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/f54adbf6113fb683d2aea0e976ed2bd0ac2d68ed | ORPH
   x86_64    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/28afbc0b217d8cfbbd52c82469effc479a767825 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/5d3e8b6ba3c66cee514d757e8aad833c2e5c962f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3e42b49fa0df7e5bcc01d314d7fb7eada57625f7 |     
  powerpc    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/87803f92fa8269bbd009870fa12d940f2003afe7 |     
   nios2     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/85c307fa76d55f7dfd8649b353d495865e6f156e |     
    or1k     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/874928f707b1260953fd764e901bbea194687b32 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4ab3aeecad54ce5ed83774a7aec596f7d8014e98 | ORPH
   armeb     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/7a80e83ee4067f0cc2d991eb1ca79ddc3bc43e74 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c4b885a4419c5381e91efea12ccd7bae2cc07f75 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f29922aede051339cd4b4b3f6c83ff2bd8370a5f |     
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8ef33872c2d7b364d02cc62103ef218b13b42368 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/c3f16d30e9011e04d79ecabee4ad9efd7bd4eb94 | ORPH
   nios2     | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/a4d40530be8b3cf0553a6583c5c8f65af42234bd |     
    arm      |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/318d8ff12a7d4bcaa8a286c26b70d4985824736f |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/1c343303f9725faa0f3753a74857f2384a656282 | ORPH
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/c6142a2b3e88e6b4b70f828add69b97deac9b537 |     
    arm      |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b3cf30ebea66ee21aaa5858a7639c85f4069c302 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/5f23a78487c3b9cabd2b4ec94d4d55570f135059 |     
    i586     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/cba6762a3cdb5a9b7ea23aad81f4bd0e8150c2f7 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/3cb65e4944fa0a0d15b34f76248c2bb3c084e1fc |     
   arceb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/2aca0e75e46a3be3a68859d2064d633d62b3793c |     
   sparc     |         libxml2-2.13.5         | NOK | https://autobuild.buildroot.org/results/6b05295f81e274f8eacb234f088de629fb392cfe |     
   mipsel    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/0867bc967a6ec09d96f96b5bf57240837fd09ef3 |     
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/43e96bd7662039db4d4cda536bb2a6bf1936854a | ORPH
  mips64el   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/d7de85dbbc3d1953e6228000c5ac3ca574a977ec | ORPH
   mips64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/ce061ef58d1cf66c1dc8a169e138da6441bccea8 | ORPH
   x86_64    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/e846d13c9f001b76a08ffb94f69c8dd26b4f5811 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/25e8fe2d025dfaf5324dbdd1c565ab5fc59a1441 | ORPH
  aarch64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/31e12114b13beaf14633359923b3c3dc195f2fe3 |     
  sparc64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/381ab2316de119ced3755f0c2712ac50fcfc10de |     
 aarch64_be  |          lvm2-2.03.27          | NOK | https://autobuild.buildroot.org/results/82c4e024eb76a14bed37acf0dc1d64c3803f7e4c | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/0e6036949b747147fad7db80c064546cbd8d1a45 |     
   sparc     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/a89110cf6555110cb67bf864e05b11d7d91daf6d | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/43f281d827dc4a484f62eddd98dd5f129fe5dfb3 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/ce576b587881a096ae385161f9b1c5276ed199de | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/e46e258a4cbbbfb59ce479480abd7b1479742602 | ORPH
   xtensa    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/771e441173df82fc1903ec7d6aad46d41289b762 |     
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/599d0b30851bc307d4ab851a8fd7071996b90cb6 | ORPH
    or1k     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/212b29fd3164044c91291cd5a46e9b14fe5755b8 |     
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/28b36f0fcb189ef85992fa5958f4f648024f2f6c |     
 microblaze  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/b35f79133864b68ab6e2ca2ee9d972dcc5203cb2 |     
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/f1dd41498cdeaa97267363e181485de1e577d2fe |     
  aarch64    |           qemu-9.1.0           | NOK | https://autobuild.buildroot.org/results/ad99ad938aafdd95fd1a0373dd1d7a4a059e2dbd |     
  riscv64    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/b5c311c01cb069558064588fb71f0f5a640f084d |     
   sparc     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/9ba43003e979e2bcfc60ade403c400ec7992075e | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/82a2e52a431489ed86b7750fce839c57dfdcbbda |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/283d899291afb02f38d57970c32a4b9277414827 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3e785ff846c171d3c9e1ccf9e3793b905295c725 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f22b4efad19a65babfdf128c7e8b278a489aea4c | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/df1c3308f12faad52dc50d94f510219a4988a864 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/fa07487e4db2194fa1d881fc414ca4dbed0e6519 | ORPH
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8d3a25b0ff1f6cc16d07eb2a0eeb80bce2e0bb54 | ORPH
   nios2     |        wireshark-4.2.9         | NOK | https://autobuild.buildroot.org/results/667a84ea85104c4d833e931855eeb00f8b065ffb | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            host-cdrkit-1.1.11 | 2 
                    chrony-4.4 | 1 
                  curlpp-0.8.1 | 1 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
         gobject-introspection | 1 
host-prelink-cross-a853a5d7... | 1 
                  liburing-2.5 | 1 
               popperjs-1.16.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           chrony-4.4           | NOK | https://autobuild.buildroot.org/results/624c01030892a75e3c64c682929995848f8311ea | ORPH
    i686     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/c838ac2b6ca0a5a25c292b64d8ec27411fd87e86 |     
 powerpc64   | glibc-2.38-81-gc8cb4d2b86ec... | NOK | https://autobuild.buildroot.org/results/f380ac53cbf84b78bd3d9d65aef3af2c79e26725 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/12372d0ad7d02133ca18114f921a53aa87b71494 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/e40e9147df7cbdbbfcec33c56b069aae13b61e3f |     
    sh4      |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c72feebe09ce028bb4ffa27e2f6bf4cf5042deb0 |     
   arceb     | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/d0a002be99b5ab843cb3d737da71a97f87cbca66 | ORPH
   s390x     |          liburing-2.5          | NOK | https://autobuild.buildroot.org/results/402c50e18873d04f47a49a5aaf51c1e8d8f4480d |     
 microblaze  |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/0b5d2e3d8e1e94dafa4c8ffa651df09430111ecd |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

          host-binutils-2.43.1 | 1 
                 linux-6.11.11 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/57c4add7e396ebc479698e9cc5590267227929aa |     
   sh4aeb    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/d724e158b3666d40611de1c67d2cdc4aff283c85 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/e22efd8738e19b99d613b3135084715eb033512a | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
