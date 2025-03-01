Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56639C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 04:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C2C6072D;
	Sat,  1 Mar 2025 04:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvlN2wbPDwTd; Sat,  1 Mar 2025 04:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F3EF60736
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F3EF60736;
	Sat,  1 Mar 2025 04:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DEF268
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 04:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AACC607C9
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 04:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdCjl5dHlTTw for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 04:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BA4A60736
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA4A60736
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BA4A60736
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 04:14:36 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-abec925a135so365750966b.0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740802474; x=1741407274;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZHiCs7HtYxaWlLybwQvFhxdHJoftOpqkXaAYT7uV2Xc=;
 b=ayGRt/Tol5jwoZ4AKNFBcS5W2Y4/NQcPbmRy80kHvwRDBeUqGAmwXg72ylSuJaT6i+
 NsFqqQMaenN8x01v1c/1cT6omss8Im7gLRu9eQWW4Bsi8diELS9ruCml86YYSPvOYvo6
 FnK9McLXX7pkf9rmm0gIJI0L5gvLxQBiKVeAMl84kiTsjdw2TcVOLvPjrZbIj4VG59tz
 korIyD9NsZ91nc87EAXbBHQ8hs4GSNAXsG/OtUIvsHQkK/Zc55l/6NSmZnNYBaLQTG/E
 bXiOaL/DMgfA9a8wbSa52Hm1Jk/sPyORu8fhDUlGCZ8vNiMdSj4/zDS9R4K8iBY7/In1
 a0xQ==
X-Gm-Message-State: AOJu0YxfoY9dUi+vK7HpK/a0gwYcpjG728brGu23YVXjXJVj6DxVKNVA
 ISbzDzbImiWXHY2ym1t+Lswig8tQZ9I1qCj2HOCFhR2ABoEfC+40Qn9bNA==
X-Gm-Gg: ASbGncvbrat6bxryv+ri6/OHyggOpMnl37Dx5UtJw27b9PnJqjkZRBDD9UVDmhejhU0
 odj3VpGOZNwELiFMueBSVogyRnotuVROwDrgprro4BcQeUnyWrawfDeD02rS0TcFqmiZqnJDnYI
 mEsKZLYuXY/AJn9gJdC3PGg4nzBWTjyun3/xZjXBTQ9oDuK2taKFCY6caYmpsMAXLZEJdIeqMWM
 DrDGQe69nt19oTLSELztSl8jmsY6ZCeNQwwDQotbWVOMODaYKqmuol6HtFoyXS4L/PbG/4XCYLY
 NmGDx9BG7llIIIaz9mGEQYEKbPsG3aU0Qz50TpcbgdUxk1JB
X-Google-Smtp-Source: AGHT+IFq2Y/kfMVJ7bJnYOah3bwO412MuJ3yrgCbZgsAgAZ3X7eI554Fz16XyCauPdD9FVx2BNiIAg==
X-Received: by 2002:a17:907:6090:b0:abe:fa1a:4eab with SMTP id
 a640c23a62f3a-abf260d496dmr669016866b.25.1740802474027; 
 Fri, 28 Feb 2025 20:14:34 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c7c07b2sm403405566b.176.2025.02.28.20.14.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 20:14:33 -0800 (PST)
Message-ID: <67c289a9.170a0220.197832.c1cd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 01 Mar 2025 04:14:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740802474; x=1741407274; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZHiCs7HtYxaWlLybwQvFhxdHJoftOpqkXaAYT7uV2Xc=;
 b=WTZkzmuHy9MzSs6tcM+Fuju9I6UpyBNnbUrjUksV+KRZq4ZfiPEm0XaJuEJV8RFf3m
 svD31XIKgeHDk0VSNfgXGPCfBeQD4csuL0Pz5llY7863g8sWK1Zl/5LWGnQhUdpRr/Tm
 L3JGP3DBhgm1vBhFNTH0zf+cKW31MEoca6jFyj8VLLP8md2gulm3EimPNO7hi7QonzjQ
 i//ZW4tOwkhHSftQKrGuTgsb4unVu/dyWKS1n2YN7tPagfBtRNN33/c5Z4W3ur81YX1S
 uWIGdQfla9rk++OhA6cMmSQ9D4x6GB5wHSexFn7pZGSAwxIpMARNWqhBrHk0JhUbbAVd
 YywQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WTZkzmuH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-28
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

Autobuild statistics for 2025-02-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  5  |  0  | 11  |
  2024.11.x  |  5  |  5  |  0  | 10  |
    master   | 17  | 55  |  0  | 72  |

Classification of failures by reason for master
-----------------------------------------------

                  ntp-4.2.8p18 | 4 
                   perl-5.40.1 | 3 
              execline-2.9.6.0 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
    host-python-greenlet-3.1.1 | 2 
 host-softether-4.30-9700-beta | 2 
                 libcdio-2.2.0 | 2 
          linux-5.10.162-cip24 | 2 
               postgresql-17.3 | 2 
                  assimp-5.4.3 | 1 
                   bird-2.15.1 | 1 
                 c-ares-1.34.2 | 1 
                     daq-2.0.7 | 1 
                 enchant-2.3.3 | 1 
                  ffmpeg-6.1.2 | 1 
                    fmt-11.0.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
        gmrender-resurrect-0.1 | 1 
               graphene-1.10.8 | 1 
    host-mender-artifact-4.0.0 | 1 
imx-alsa-plugins-rel_imx_4.... | 1 
                libesmtp-1.1.0 | 1 
        liblog4c-localtime-1.0 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.2.1 | 1 
                 linux-6.12.16 | 1 
             lirc-tools-0.10.2 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20250130 | 1 
               mariadb-10.11.6 | 1 
             matchbox-lib-1.12 | 1 
                 openssh-9.9p2 | 1 
             parsec-tool-0.7.0 | 1 
               pulseaudio-17.0 | 1 
           python-numpy-1.25.0 | 1 
                   swipl-9.2.8 | 1 
                sysklogd-2.7.0 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
           v4l2loopback-0.13.2 | 1 
wilc-driver-linux4microchip... | 1 
           xtables-addons-3.24 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          assimp-5.4.3          | NOK | https://autobuild.buildroot.org/results/8cc6a7d0bbf0e377f1002b51e5885a8514be70bc | ORPH
   sparc     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/d4b300839eaa01aba50a74f618c1ee796be1fd93 |     
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/39f3b673f3d656cf04cedd49c4904d112547d316 | ORPH
 powerpc64   |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/f477689e83399edb56549a6c8084cff483ee468b |     
   arceb     |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/77a73a6c1007f5341edd5114737b215f0e45df58 |     
    m68k     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/509da9f23ed1765a5c49a335cfd6fc7384537c86 |     
    mips     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/499c0e9389d841f360c38eeb83035f38d7047176 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3ea8e4c1c0643b71d916d2a419208a9c4634e463 |     
   arceb     |           fmt-11.0.2           | NOK | https://autobuild.buildroot.org/results/f5ed725aa525d7d1c3d2f18f94ba57e65066dcb8 |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d5bca2d1c2d7f8002c187b3265e19a1b8fa6e484 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/d0f5f0531c39dee62e025e3fd6834b5710e76a8b |     
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/29b251c077b7dcdd256a7ae8646725f4fcc1a725 |     
powerpc64le  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/22236ead39ac83100b6151ecb7be52845735c4f6 |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/016b6e8bd21c8760ad831f29ef1d21c50cac36b9 |     
  riscv64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/51568c5eebaf54ae11c42ea16048e4f7bd1a7d72 |     
   xtensa    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ce81baae5461d8c805be740de4528fadd05e5475 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/9435d209c4841e0e3a7a1e164777f3172e9e7e18 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/0074a299fc9e50157af4909c5b8131c2663530bb | ORPH
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/5f384ec807b3d2dc6d264c814b1c1a0d5b836c2f | ORPH
    arm      | imx-alsa-plugins-rel_imx_4.... | NOK | https://autobuild.buildroot.org/results/52f22ad754d42eaee35e62d0e547e2bb2ddf9060 |     
   sparc     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/928d4387b16cc07142c98fcc01eb5bab548ce878 |     
    i686     |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/2440c931cc5aae87aceeba3b4577d8bcff31b47c |     
 powerpc64   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/468fac2a8594b216c9b35587d2cbfeb84d108277 | ORPH
  powerpc    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d56eff7c8b42fb5ffac35b0766bd31c8db0b966f |     
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/d51a612847bfdcc99832c9e2d13e59c2c87ca8e5 |     
powerpc64le  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/5668cbe1f8fa5abde91c1c56985dd4e26b40b50a |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c247f4efb399d489a2c964056a643c6b77d69b4f | ORPH
  sparc64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/21e3b0473f64222f6e9a025c37a533b9e5490c8a | ORPH
   x86_64    |         linux-6.12.16          | NOK | https://autobuild.buildroot.org/results/d7354cdbe1307363bf0acb9eb05fee5cbf651b85 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/312b7f5bef66c905b258a5a9e72e576c2b341e85 | ORPH
  sparc64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/3315f60eea49a64d6caf095b04eb4f39ff4d6bfa | ORPH
   mipsel    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/608311718c1052f86f5928d934582bd86458ecf9 |     
microblazeel |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/7e387131ca7eb2ede7f3c26fb886be399247993c | ORPH
  sparc64    |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/157c243d65e77266381773803c5ad9d5413cfd2c | ORPH
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c1a0fff9d3cef74bd40b90dc71ab17ddf7d63fd2 |     
   mips64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d37b2fe879a0c9155eef3ce38eeb15bca2b4e980 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/1510319136e83b2e0291a5b9fdf49df4c77543e0 |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0b984e9c04453eca316b2b2c694d14cee278db06 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/dcfc6d676db94edd800537ae375075225514b573 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/849331e9bea03b8d58bc561d04acb978d4f2d64a |     
  powerpc    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/354c28311cad20ad1286e8718aa0445c02d3b8f2 |     
   xtensa    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/89c43940e2b4515ce0e457defcbc4a8e7a2d66c9 |     
   armeb     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/e7aa3000926bcff3b01dc6c04ad516972a6ecd68 |     
   sh4eb     |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/ed60d102f7b81dce5936016293ee13d73fb64f1d |     
   s390x     |        postgresql-17.3         | NOK | https://autobuild.buildroot.org/results/09dbd0f0fc765f161fba6336b71fe295fe454560 |     
   x86_64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/6b8923b8271b681b900e4cbf35cc10862a1836ee | ORPH
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/7eb49de7a717c3a23467bdc8eba107a12552bf0c |     
  mips64el   |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/d2d3f7bf5c5f0d2bcf957f8082b41c5736be6940 |     
    mips     |         sysklogd-2.7.0         | NOK | https://autobuild.buildroot.org/results/f4fbcc78b9ce7621ed0088b3135369c463307bbe |     
    mips     |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/32968fbc33656327bead42cbc04d691ccd129773 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/eecdc3870849eedb9d26cfef24fa0e059c886132 |     
  mips64el   |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/d841161089d2533c22e731a7ee0932bb0f43f5d1 |     
  sparc64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/1d8b3e8a73fef18e04424b0ee836d28c4b3b7da3 |     
 microblaze  |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/140df24fdeff7ddc718b5e01cecac5c3160c4618 | ORPH
  powerpc    |         zlib-ng-2.1.6          | NOK | https://autobuild.buildroot.org/results/b18dcb22f9356fed83d2e0455df564908016e287 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
              execline-2.9.0.1 | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-f49c2f1a202... | 1 
               openblas-0.3.26 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/43f479b266c961c89556fca65fc85830de79ad73 |     
    sh4a     |        execline-2.9.0.1        | NOK | https://autobuild.buildroot.org/results/c60ccc9056cb39e3be624b361bd2e1df2c9f67ae |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/bb9fd47397aead74baa0a00a027beb4b43590d25 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/01a28e4513ef943b48106718f52263c73b95cc5e |     
  mips64el   |        openblas-0.3.26         | NOK | https://autobuild.buildroot.org/results/cddf45d68ded9e8040d4ad26efa234caad25bac0 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                     ace-7.1.1 | 1 
               bctoolbox-4.4.8 | 1 
  gobject-introspection-1.76.1 | 1 
                   host-go-src | 1 
              libzenoh-c-1.0.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/ec4a6c9f1f4bbc29f8ca5d038117bee9602b3538 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a3bf2458fe0cc0aa0e6e8a52468747e6bd9a1b15 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/15230313a6f61c12a3df13e39bfbda73dfce8cf7 | ORPH
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/818f1671218409330219661c27d61ac9c1d02f1d |     
  aarch64    |        libzenoh-c-1.0.2        | NOK | https://autobuild.buildroot.org/results/f2af0d119847d16c9132091dde2a10f668091741 |     


Gitlab CI results for 2025-02-28
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257060739  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257060785  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257060786  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257060795  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257060800  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257060857  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257060989  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061056  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061084  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061098  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061101  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061111  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061114  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061120  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061126  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061131  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061180  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061182  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061186  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061305  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061434  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061473  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061479  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061508  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061517  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061680  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061714  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061735  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061742  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061777  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061779  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061780  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061784  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061786  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061793  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061796  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061797  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9257061800  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9269961565  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9269962745  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9269963008  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9269964202  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
