Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09062C021A4
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 04:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61727404E4;
	Wed, 26 Feb 2025 04:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Lmjfjg85cpv; Wed, 26 Feb 2025 04:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDEDE40586
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEDE40586;
	Wed, 26 Feb 2025 04:14:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 564FB2292
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 04:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3915460685
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 04:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErVX5cqCN1sO for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 04:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3E31606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3E31606B4
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3E31606B4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 04:14:26 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso1246447866b.2
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740543264; x=1741148064;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STETTLECn6TgBQaDrfYdKOONKV95j3JLrYWrwk4mMcw=;
 b=MlU27OViwaufg73xFwFE4uu3iK7Byd0to452RvIY8pOhAVVRL5MGPz1hEnmkiRwo58
 nlH/1PCvledLP6/kVQq1IYdyYmom1wIcn1ucrLXmzecnROhZb+ctRYcbE5P9foFMLlvd
 ZqsjOU+vMqfmkDn2Mh9KRfpAhYZ4ee6s+hvGw8p3xeRtR1FNkYYoXMw1wafwQ8FBCpIo
 OMKZw4no6OUxFdH0zi1FaeRaC6jYv36og/J/Wsc4/jyk3Dggzni7a7YGfp4mrdCfav9b
 Y19U2B1Y01k27aBs+YBEyCGFgwoyPGFSiwyf6xnt0fu+DEobMX3NYqzwUpaQ8qgD6uiO
 /buQ==
X-Gm-Message-State: AOJu0YyQyowvzGjReQcTEvkzXZ/DRfHWKYWqqVzSBywgZOqATxlnVfl9
 olBl1Xqt6/vnelzNaNiyf6WyuhPj1X3JXwzX6eBqLN4Y/T6y61a8KGnfjQ==
X-Gm-Gg: ASbGncsN4PL7YyqlQBra2p1mKEXzTNG3NNCGzeKx8v4SARQcYbnGiic0qRO+RhNucII
 +cre+OgN80y7t7zCQK3v91byT3Cx3t5WfgvQsqNQVOw54A8PpTs3sTOrqAQhsp/fBufPWTK/sAs
 2HZ28cm1JI/CF1wPujNd/4tbOV5jjTq58x6XlrJKfR9733/ugecirCs17DkVvUiQ3zvqDtanUjj
 cgwHLKyKomdLLtpyMEOiy/XV/4AKtXtDtEHLH9LSB1f/SOnwYavXpB7rhhuVLPwVna/YM43rGKR
 neSTaAHazY8NbVz+/zOailJBjeXWlA==
X-Google-Smtp-Source: AGHT+IGlHYuqkAhxI9ZfjAePM8upZ8hQECmYbCug92eNcmZpuIcbtJjJTqaivBXLAKMemZm8IiA0Kg==
X-Received: by 2002:a17:907:7715:b0:ab6:d547:da9b with SMTP id
 a640c23a62f3a-abc0d9e8dc4mr1592320966b.23.1740543264220; 
 Tue, 25 Feb 2025 20:14:24 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cdbfb4sm252820566b.27.2025.02.25.20.14.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 20:14:23 -0800 (PST)
Message-ID: <67be951f.170a0220.db9e3.7c13@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 26 Feb 2025 04:14:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740543264; x=1741148064; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=STETTLECn6TgBQaDrfYdKOONKV95j3JLrYWrwk4mMcw=;
 b=T8KCRpNG6FiR36apZIQxKHAP3sdRLKaucr0UjAgd6CGgOkuOn8KKQOxQJf4uYc5H+w
 W2kRRjkECAo6zHdJLqXgU2kfHLrK1gJrTq9CdnSMXRIlnYJ3udPSJw2iOgA4eGp6HN0N
 hsAg8IjBatP1rtFiTLMFr5cbTDDPL9N3lZ2CQaB0nVTTYzL7PRzsMZd7iXh/z/DbstpB
 mvisnvHdw+/3cYQlQfHZrXE6TtcEcWPXx2/i3Rr+EWUt6IKeR0+0F8PFaWQTVYI9+RD1
 Df9gwiHzcyueLtMoLUnwXi1TiS+RKfwPspAYnc4ddqnFitBoXRZKwn7wLvW4FfhbgkyD
 kd5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T8KCRpNG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-02-25
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

Autobuild statistics for 2025-02-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.11.x  |  3  |  3  |  0  |  6  |
    master   | 18  | 63  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.82.0 | 4 
    host-python-greenlet-3.1.1 | 3 
                 openssh-9.9p2 | 3 
               procps-ng-4.0.5 | 3 
                       unknown | 3 
                elfutils-0.192 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
                 libcdio-2.2.0 | 2 
               libgtk3-3.24.43 | 2 
                 linux-6.12.16 | 2 
        ltp-testsuite-20250130 | 2 
           oath-toolkit-2.6.12 | 2 
                 rtptools-1.22 | 2 
     bandwidthd-2.0.1-auto-r11 | 1 
                  bcusdk-0.0.5 | 1 
                 c-icap-0.5.10 | 1 
                cifs-utils-7.1 | 1 
                  dpdk-24.11.1 | 1 
             erofs-utils-1.8.5 | 1 
                  ffmpeg-6.1.2 | 1 
              fluent-bit-3.2.2 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                      gd-2.3.3 | 1 
                 hddtemp-0.4.3 | 1 
                 host-gdb-16.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.82.0 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                  ntp-4.2.8p18 | 1 
         python-remi-2022.7.27 | 1 
                ramspeed-2.6.0 | 1 
                  rt-tests-2.8 | 1 
rtl8189fs-94cc959d56c1425fb... | 1 
         s6-linux-init-1.1.2.0 | 1 
    start-stop-daemon-1.20.7.1 | 1 
             stress-ng-0.18.05 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/3634b9a15fef239fd9703efddadf7df738d1a0ce |     
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/365fe94e23baa01b71410a7665442e2140512fe9 |     
 aarch64_be  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/ba449c0ed5b87b87195f65132b732e9c6d7a7860 | ORPH
powerpc64le  |         cifs-utils-7.1         | NOK | https://autobuild.buildroot.org/results/2c06e3167ab6b11592e7b05bf986d268e01bf60e |     
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/1cba9a2ef34b05866fed6331b11f1b5e965162d4 |     
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/112e0e94572235baf63399e95af00326107834cd | ORPH
    sh4      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3f5b950a613b63e790e19db3726d36f4e51db6c4 | ORPH
   x86_64    |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/a919802082827175ff5d3871c050906ac66eac83 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a8d5fa6d56073ce92d31f69b54170ecd17735962 |     
   s390x     |        fluent-bit-3.2.2        | NOK | https://autobuild.buildroot.org/results/0f681b3655fd4990f260a1c99995a4ba15d44fce |     
powerpc64le  | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/cacf3d6c30effca4223d7f7a00b2c94043ed413e |     
  aarch64    |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/010a979ed09f133560a6ae50010f21d9f63848c2 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/2082d271cbaa2b82dab78cff22f4625ce934f3a2 |     
  riscv64    | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/74ea785987417d5f7a56ab43a58fcf3f3caec1ef |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8546ffc7a1e08205670ae6c9a69317eb888369c8 | ORPH
    mips     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/5fec82e85e59e766ff6e4bca60df9e2ae962cc0f | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/24d7588fe18b22b9154d057a2a54e50981eeadc6 | ORPH
  aarch64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7c416aac0ee7a2d441edfb9c3c5b2e474cb90aa8 | ORPH
   sh4aeb    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/08b476202141dec55250bce3283aea37cb8b3727 |     
powerpc64le  |         host-gdb-16.1          | NOK | https://autobuild.buildroot.org/results/386ba06be0205af0577dd10053ebedd72bc6d226 | ORPH
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/cd74b7326b24d0c65496f6316e8d4e8f31089778 | ORPH
    m68k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/95f57851c327526f1a39428253055b952d44c24e |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/123f0db4f975129a289ff7ea54c2092c36295d71 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e416b71e791bc5f67d71ac5cd57b3e1af37d2632 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/7ed935524eaabd38353741f2a3f8331f7dd2ac30 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/c35120e337bf18e196c4512bfc533e027650bd65 |     
 powerpc64   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/6c64c1b92ba805b798ce0241ceebe6557dc501fb |     
    arm      |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/c5e10cf0562e6c05856e681fe430203463ea258f |     
    arc      |        libgtk3-3.24.43         | NOK | https://autobuild.buildroot.org/results/57e23a2fb402f8ea09cb21dbc251129c92a93ab5 |     
   s390x     |        libgtk3-3.24.43         | NOK | https://autobuild.buildroot.org/results/3d433ca903ea0c7c36fa57b0fb0263af7199b7e2 |     
    arm      |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/b5b9da60ba607478e2f6367be7ea448ddf59dcc9 | ORPH
powerpc64le  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/9073d283413172d6701160ef818d732f7b3c6601 |     
   x86_64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/51f3f37d51c95980af6a9b30ddad693fec59da11 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a514cc4a72fb9c7499619b9d121c6a2501f6653f | ORPH
   armeb     |         linux-6.12.16          | NOK | https://autobuild.buildroot.org/results/d0bef71269f670cf630aef931c4b984f31479598 | ORPH
    sh4      |         linux-6.12.16          | NOK | https://autobuild.buildroot.org/results/b4bd3b8c853dde66e3820118fadd1fb5b976b2df | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9e65366598c11151afc2674e25aaa6ac0b27084c | ORPH
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/b6f300e725397878ab8bfd046184d5c199ed0290 |     
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/21119cfe1b27879c375c116a36c21b9206879c9d |     
   mips64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/2b7b99a7b134da4fe5ec4ad039e373fbf2ecda7c | ORPH
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ffca5f75b6f132f432ad308a3a8ce6c490863154 |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/4d7d484aeee8101f747b73a1446ea3ab4613b268 |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/6bdbb59d91673bb79f46bb7e75da7596cff1e27f |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/d1059c7402cec6563abf56bd78de624ed28b961d | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/51e0d4d5b765924d50f7df5c040cad4cffc7ffcf | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/247d5d1c9f2e629e431ae5de2a9dc073ea2a217b | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/6a37282407d7d65595ff2621520f6da1483a2ad9 | ORPH
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/7e6ae268cea5b8710cb992819609320efce01374 | ORPH
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/35ea7427793b60eb4de4f5b85a280ab8d6806d6e | ORPH
  aarch64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/dec14ed5f7779794cea71b35ff9c6bbcfcd6bb6f |     
   sparc     |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/dfc2188641484aa8e23b027cc5d0217394426e34 | ORPH
microblazeel |          rt-tests-2.8          | NOK | https://autobuild.buildroot.org/results/f833df1651c087b66bc94c8f6f7d86d006b8fdc0 |     
 powerpc64   | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/499e0753efa9316c116bc00ce32a02c73f583647 |     
 aarch64_be  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/3e6f8eae280e450e87da7082d3dce50c04e5879e | ORPH
   xtensa    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/63a98e041f05e54e551d7b909c6b780c2e40a09d | ORPH
   sparc     |     s6-linux-init-1.1.2.0      | NOK | https://autobuild.buildroot.org/results/fbcebea798b824ca42a832be56de17e0cb2481bd |     
 aarch64_be  |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/9ea7f43a574b39baedbd2edf8de6dda7eb0322b4 | ORPH
    sh4a     |       stress-ng-0.18.05        | NOK | https://autobuild.buildroot.org/results/599acdbece0e59f872a33ec63bfcb5f06b4e2de1 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/09f47927e71fa1c21fb17900ae303bc7bf5727e6 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/7f2565e99acf107eab830e6acc6aa8b209a201b0 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/130c93b92c0d70d18e02d1a77ae8336e94378960 |     
   armeb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/52d2278f3220c6cf32778eb29c6093db7e986541 | ORPH
  powerpc    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/56fd4ae40af0d1ad237e59d47cc75f8a38f3425b | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
                   httping-2.5 | 1 
                 openssh-9.9p2 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4a25e6bf97688dc9f5089ee36c9b58c4138f235a | ORPH
   arceb     |          httping-2.5           | NOK | https://autobuild.buildroot.org/results/c04cb18a2aca25ba78a8033e519b9e15867e388d |     
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/869fbf1a42ff57f8c3c91f14c2e98f3e6e244678 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                 cdrkit-1.1.11 | 1 
                libvips-8.10.6 | 1 
                   perl-5.40.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/2fdeb9f57952a6eae36a256ba98c435c2b47abcb |     
    m68k     |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/5f556603d3379860f1c34de4a61f31a5a07b3c77 |     
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/425cfd2dfcefebbc0ede715d5d4b7c6301e8fcf6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
