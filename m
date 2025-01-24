Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDCFC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 04:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D39306FABB;
	Fri, 24 Jan 2025 04:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eYrOkUCj0sh; Fri, 24 Jan 2025 04:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74C846FAC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C846FAC0;
	Fri, 24 Jan 2025 04:14:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22669B88
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 04:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDE326FABB
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 04:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aq67iSHn3HI for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 04:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C4FB6FAA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4FB6FAA5
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C4FB6FAA5
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 04:14:47 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa69107179cso350970266b.0
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737692085; x=1738296885;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Etsj1ilmo3SPBZGTydSHtdT+IHr7kPblOWfnn787Vas=;
 b=fPko8kXA7sn7wd1X2WdOpyH35fwCttrF2DWNyUiAuOHPXWAdDUyuh+/LtuGzOttP3s
 fQH183xCzp2Rz8/Ay+nEPgQUk444J/84OtgxgDygAig1q3sHZQWbNwp51C5zZTgofoXR
 72HF8oCHA36gdZnvKIGxx8Ln77PZ5MXdpqES32USxqV34RTCJF3u9LDw1OLkVM8o0M7G
 AfT7SnpngOjifGrAqlj74Mi8fw5K9/hxMFpWQzSU2gtyu3H8l3z5/rNPeK5nxbe9rhiv
 mHF54RTFcZAglzg7rdTYyyYp5HJXOM1kG6kzZOXPJ/do2x7h73WJxDpY8xl2PItiXDK/
 0Wfw==
X-Gm-Message-State: AOJu0YwxMKRpheHU7i0KHBfqX5AeGF3l3Tg4gOFa8oxh7n1L+VRQFBii
 h+2cCUYRBkkwvCb1cv51f+IhBoqFIFOlus9R3pNaO3NBbnz5lDgsLtaxTA==
X-Gm-Gg: ASbGncswCrE6+Peyy8kUTIh0ZiEChdjBXGZJda53h4WG/DlLO2r/zg/BVRbeg5NbVNZ
 LF+WkDM5+vEuIP9vXY/KEcRr1mbCYbtROO6TrxEw2zUnd/x5IkK7OLwHdohPd6dIB3QvbCHaPmU
 H/YZVfHkIVe+iZidoAUxf6OXXDx1I3txwjd1J9qTJWdr806xqRIPgfh/nGbY8vSZbybHyX08g8E
 I0IRNbt/7dkHquRA0q21zyZ2e+NRtAIpfqqWquDTSJx02Mu0lk57r5YZW5ag4WWoGmnZeZb07Ry
 C8K7pN/G
X-Google-Smtp-Source: AGHT+IGL5O9PQwqC+kYU3kVXqOu3xiDt+MQqP+JQ9wINZ7AR8dKnbOl80GaV5gSIMWQ81dXIffhM8A==
X-Received: by 2002:a17:907:2da7:b0:ab6:5413:fb14 with SMTP id
 a640c23a62f3a-ab65413fbcemr975592766b.38.1737692085085; 
 Thu, 23 Jan 2025 20:14:45 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fbf43sm58187266b.154.2025.01.23.20.14.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 20:14:44 -0800 (PST)
Message-ID: <679313b4.170a0220.db31.1f73@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 24 Jan 2025 04:14:44 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737692085; x=1738296885; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Etsj1ilmo3SPBZGTydSHtdT+IHr7kPblOWfnn787Vas=;
 b=MOFLA6QSBWgXf4tlvWKJjPP858LKURcYo31BSehcgrWABGNheZwRgIrKCv9KHoN8y1
 mGLhCjhA8oGZJjfMKW7Ho5Epq2akKneDiqV//OFjNjDBPvEYapsvCcLMXCryltKJho49
 9Zy+pZCwxYuhqPDPEVWtdS0a9+OB6XuWi0h/iMZiNdxjEh0uwCFhANFuVOfmGFa/CUDx
 gQwVai8lbPnybIXggbbYInNT+3eenbAqiLxuPpFk4nv4CwGV3AHX0UTPVGqMawmNn4s0
 h3Ojhpeor9YlgN9wJ7Bd73UgIUTwTlqQfULPk+TVua69R1lYXSCM798khDbyhngujDMI
 UsuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MOFLA6QS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-23
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

Autobuild statistics for 2025-01-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  0  |  6  |
  2024.11.x  |  4  |  6  |  0  | 10  |
    master   | 15  | 60  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 6 
                  ffmpeg-6.1.2 | 4 
                 openssh-9.9p1 | 3 
                  bcusdk-0.0.5 | 2 
             bluez5_utils-5.79 | 2 
                    brltty-6.6 | 2 
 host-softether-4.30-9700-beta | 2 
httping-0e26c53d5fe504eb720... | 2 
                   linux-tools | 2 
                   perl-5.40.0 | 2 
                       unknown | 2 
             util-linux-2.40.2 | 2 
                   crun-1.18.2 | 1 
                   cvs-1.12.13 | 1 
               freeipmi-1.6.14 | 1 
                freerdp-2.11.7 | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
                  fwupd-1.9.20 | 1 
  gobject-introspection-1.76.1 | 1 
               gocryptfs-2.3.2 | 1 
              host-rust-1.82.0 | 1 
imx-lib-3f777974c0c146817e2... | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
             libapparmor-3.1.7 | 1 
              libcamera-v0.4.0 | 1 
                libdrm-2.4.124 | 1 
                libglvnd-1.4.0 | 1 
                  libnfc-1.8.0 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.1.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              luabitop-1.0.2-1 | 1 
               mariadb-10.11.6 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
               postgresql-17.2 | 1 
                  ramsmp-3.5.0 | 1 
              skalibs-2.14.2.0 | 1 
                 weston-14.0.1 | 1 
                  zoxide-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/7317f67c1a28af744dddab1e2f1dbdfaddaaa8ae |     
   mips64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ddd193d46e78929d19b97db8a3da02a1510ceecd |     
microblazeel |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/d6149115621ddbb9acfab7de17957ec2e703ab74 |     
   x86_64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/e43b1cd61d78eccafde62fb4ff1842e244bd947d |     
   mipsel    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/db771f88599118903f7429f54f496e6c636dcc3c |     
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/12453b6dca8b0e74b1c6863b4c03f584c3aa0dce |     
    i686     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/be3d9b9171d9a48bad0a5dc4d24c5b42e3b89b11 |     
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/10704cb4e3487734e6792b0bf5a059da3b3724ac | ORPH
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e23de2ffa3b0f8696cedb1e145e96807130372ab |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f5061ca50c86ca40badbf4d1f4fc044d7213a85b |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/570adc1455eb358c1c5ecba26f41c30a23e9323a |     
    arm      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/7413f6442b5a5b8103ead1128b9e7f30834d2010 |     
  powerpc    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/b824a251dc70a345ec47ef164d6d149bb158a034 |     
  mips64el   |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/ca44a02cab0ef748d6720e01d404d79555431a46 | ORPH
   s390x     | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/31fc715eb827f45cf7d4e0a2055730bf8109f58e |     
powerpc64le  |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/fe93b5d184550a7fe60162fd78f922d006ee2a16 |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/812f2da426eca7b92c4ade8cd8625bd661e99031 | ORPH
    arm      |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/f28ac8d887d0a7adb8e5ff23ea5700b1155b0ec2 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/00744ec97c67ba7e24edd03627131504d68c5c46 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/3397841da1a929d11ccb92d6a0e1a5f0df5f1b4a |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/945643f2a35d2cdbc92f0963e856e9b5dd0e70c1 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d8247133aecba24a5dfe9523bfc3e2453d91b289 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b87ffb4c57fb98b86cdbcbc4345728d92f5edee7 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/39478cdb3f9dd26f7948d67d9f32d9c89409bed4 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/8caf1f450647ba3b097c21ac75d186c3d675d1cb |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/235555d1f71fac34f5e1fe459cfae00268f58048 | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a9b0e5de82c20a457900f36d1a7850ac15426a4d | ORPH
  aarch64    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/dbec6490592220a0733db6b7858d8605a5665603 |     
    mips     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/28162836747e75db80292e42954d678a81e1cbe3 |     
    arm      | imx-lib-3f777974c0c146817e2... | NOK | https://autobuild.buildroot.org/results/7bef285da9aff6a5d044bc7479cd7931410e3622 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/7c377535e87bfa32a039a865d891aa8d1aebe187 |     
    or1k     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/bf287169b6f4809a7fb5c2ea7d91def95a2c7a5c |     
 microblaze  |        libcamera-v0.4.0        | NOK | https://autobuild.buildroot.org/results/19d3a4df220c34bac9d27a1e6e3bcecde1762499 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/3d789346c5e694e386f4fff89b2a6a245ef59751 |     
microblazeel |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/a4b14fe308db170fdf19c2514f34e16dc3c8f01c | ORPH
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/55a1f66f5d5dd1d1824985fb1faab983dc323cbe |     
   arceb     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/016bc29da4dd50f2e79860134587b54bac2dd24e |     
   x86_64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/bc6ad6fa8b45668e709aa5a0ed89f8c58ec5f241 |     
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1db0c507a3c82810877c86e025de7539bb3d8a36 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2f3f5b5d2c05edb588a914648f3c1318f7fde81d | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/8a8598d786b7868d07756951bd1bb4afdf667424 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ea49b10eda0fd9122cd379b96f41db5d5771300b | ORPH
  sparc64    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/5df44bcbb2b016e5e7c333df2100ceadc56c6a0c |     
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/555eb30b56d4240a716290631fdf550596bf22d3 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6f97bc64f13ae8b8f4fb97a852bd2d2d3101badb |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/4fd48127144f6ccbfe65cc303f4b2cb74a06da78 |     
    mips     |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/59ebcf3bd807c0911b74ef244330a8ced33f7d23 | ORPH
   mips64    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/f118846510a68e0ba000adb1abc2f8177642e614 | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/45b396d9e035ee31b598f794341b8b0d9a316833 | ORPH
   mips64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/60d3ca9d458c586bf748067eff37aaa955485d58 |     
   x86_64    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/b817014d9c8f598a0700cb01d193277b34a1ccf3 |     
    m68k     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/c47b4867278a6f6f41a41a74d7dff39da10593a8 |     
 aarch64_be  |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/b1780eee509e7e35a5469e6246d32f861ad7f818 |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/3acf270e8a49869e2bebc4bedbffe46fff90ad30 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/7f464321706d3e5a06a0d2ac50ab61839fcfe9b1 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1a04259f25feb3b515a8bbbf342bd49538e079d7 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0d6da8efd6af1a4de4ca55fd927676c44f938533 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/82e81ca4fcf99755042e13d5eef7cd1b2987e330 | ORPH
   mips64    |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/2d51b1d6bc7bb693c025f4322baf5daf447d48db |     
   armeb     |          zoxide-0.9.4          | NOK | https://autobuild.buildroot.org/results/4d63a770b33a91402c4d96ad0fdb01bc615d92c0 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

              skalibs-2.12.0.1 | 2 
host-prelink-cross-a853a5d7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/37ecab6c114d206964d4090fc5cefda6630d5e68 |     
 powerpc64   |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/d4a254e256248096a4aa9c6e7cedb1a62cb963b8 |     
   sh4aeb    |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/cd89c8263667ec2bf13752e8596d61ecb1af531b |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                    chrony-4.4 | 1 
           crucible-2023.11.02 | 1 
            gdk-pixbuf-2.42.12 | 1 
            host-binutils-2.42 | 1 
                 linux-6.11.11 | 1 
                   swipl-9.2.8 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |           chrony-4.4           | NOK | https://autobuild.buildroot.org/results/d228158c1b1516cac5dc3ef59f69b040c7716738 | ORPH
    i586     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/925d0b083fd459018523e888f1074a49efe493c0 |     
   arceb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/43296fec9ae4395f2dc07680fa39e914a1065245 | ORPH
   arceb     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/198758b00496983a5a0b91b56d3dc6e7bc36ecff |     
 powerpc64   |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/a76a9619bd556b94e667124e27d998ebda02d4fa | ORPH
powerpc64le  |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/104076f44af0888e62c04761a35dde97db5a1e42 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
