Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B976D735F6
	for <buildroot@archiver.kernel.org>; Sat, 30 Nov 2024 04:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A6B610C0;
	Sat, 30 Nov 2024 04:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-1bA1x1zkJj; Sat, 30 Nov 2024 04:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9357261114
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9357261114;
	Sat, 30 Nov 2024 04:17:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 299AE6C
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 04:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AC388485C
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 04:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dw610ZYKSOxc for <buildroot@buildroot.org>;
 Sat, 30 Nov 2024 04:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 638068485A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 638068485A
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 638068485A
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 04:17:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d01db666ceso2755161a12.0
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 20:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732940272; x=1733545072;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O2vZ5iUpQCB4i1MmkODtaxoerdKORLgi2zNBxYGyTL4=;
 b=N5eJqw7PFO0oguqoBCkR7gI/38GM9fXaUK9dDME57E7v/ch+p1pe03fwYVBwbJWHFZ
 6bJ15vjAIkerpmOCRE0ca1D1Zwso0ob4WlPjj/YXW3+ie5xXOSCjE/mvH2LS3ANfdUv3
 9dJ2cYY40REveVYbAZBxStTVpiG2RnblfyGmLbNiJy86IKt7gCFjWGQVRPYrkVcUlNVS
 HnXlObPJET5XK8bvOhA8V7aPWXAQfpukvZpXOCNSmeMKZ99stfy8+sCXB6Ro0l+wuHz0
 Z32wCCxRYG252HaXPQvNqPERBCNVS7vLPQwLlPodtKRwYRO4kVrxKbpcxiAtvNQaNlKE
 Ezhw==
X-Gm-Message-State: AOJu0YyyOLSs/S264yEtQmntb2/X0GMn7o96F6ltZpAC7tpe33PXkU1f
 jPB9Ilsu1rmzJfjJFM4pQPIUFIqZfQ6rvy85DVOIph0D+Too+725ZV0NCw==
X-Gm-Gg: ASbGncuCgL+EL7iK5xdqRUzGQ2W4mK7b7XzxUkaVbad8TrPsuIHViToSqQa7gdgPAsb
 0r6nuEOH4Fq3lhMFSPzyU4bbc3RaqqR0mfrAPt0/lF1y9PckX1Ra7ujegZKpd7jEnMYrv9jCim+
 9nAE2hlA9XgCnnYnlmEiVp6pSPb4aX8V5TdeBgq4NAJaDisDjw8uilM/BZfGNto0npkdHqZjZXQ
 eXd1TSlylZthIsHrCh+JzZe0h9Nohs8vVt04v5FXPpOC7Qqg4vx/A==
X-Google-Smtp-Source: AGHT+IG+Snd94Hjl2Q1VxDiLpaDxPaycaCYumH4rRrvLNCB+7dWKSgumdHg1yoU2iCRVNtileYF+Qw==
X-Received: by 2002:a05:6402:5296:b0:5d0:bdc1:75df with SMTP id
 4fb4d7f45d1cf-5d0bdc1779emr4483228a12.24.1732940271950; 
 Fri, 29 Nov 2024 20:17:51 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d0bd2a485fsm921387a12.66.2024.11.29.20.17.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 20:17:51 -0800 (PST)
Message-ID: <674a91ef.500a0220.16619b.435e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 30 Nov 2024 04:17:51 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732940272; x=1733545072; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=O2vZ5iUpQCB4i1MmkODtaxoerdKORLgi2zNBxYGyTL4=;
 b=gRsYEPgleHBTA3KpDlHhZUOy6lY8qBsrAEMlX09IqpqhRCSwMrvTV7l26KzhXucCF3
 yfwNFGwmI2nHVKxKFMyvmlBjwSN924Iu+6NWiIUQfADOOnA3dQiL/+AB2hRUk1hYUh6e
 pbo8Ffe97ovtkb9q8zBn6Vxu37gECRsue4lp9oFmYmmGsgJVpI5XO2LahpcJ2fhXEVXy
 2VnPSyjpvS5Y6hu5wj0buQ40b0INBaLppu1A5zikyPjKoK/N4FyYHhWEHWDNg84h1H+b
 +O89kxnuYQT1K5ujWQmXynqoTXcIuiKV227rBVY5yh2o4uWQfwoM/079mrN0/K2htkEx
 TXzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gRsYEPgl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-29
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

Autobuild statistics for 2024-11-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  0  |  0  |  4  |
  2024.08.x  |  2  |  2  |  0  |  4  |
    master   |  6  | 64  |  0  | 70  |
     next    |  1  |  6  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

                lmbench-3.0-a9 | 8 
             dahdi-linux-3.3.0 | 6 
             util-linux-2.40.2 | 5 
    host-python-greenlet-3.1.1 | 3 
               pulseaudio-17.0 | 3 
                   foot-1.16.2 | 2 
  gobject-introspection-1.76.1 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
                 linux-6.11.10 | 2 
                   perl-5.40.0 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
             batman-adv-2024.2 | 1 
                  bcusdk-0.0.5 | 1 
  binutils-arc-2023.09-release | 1 
                 c-ares-1.34.2 | 1 
              capnproto-0.10.4 | 1 
                  curlpp-0.8.1 | 1 
                directfb-1.7.7 | 1 
                   duma-2.5.21 | 1 
                   eza-0.18.22 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
            host-binutils-2.42 | 1 
              host-rust-1.82.0 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                   libsha1-0.3 | 1 
           libzenoh-pico-1.0.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.6.1 | 1 
            live555-2021.05.03 | 1 
               mariadb-10.11.6 | 1 
                    mpir-3.0.0 | 1 
                   pcre2-10.43 | 1 
                 pixman-0.42.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/ce4a906790e4939f9a26129e4e5b9b883e0e910b |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/b86d8fdbca0b819f2aae1593ded8f65d8ba22b9d |     
   mipsel    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/930d74fc29f93810ed60cb957e1ef8d82e6089c6 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/72b01478d0913b0ffb950eb6f61da923019a1b25 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/382e5d541a8cab1e3f9bdf340aa87b6fe27ea4e6 |     
 aarch64_be  |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/53d6fd1bb745f1884547a669476c7dc3d7734eb5 | ORPH
 microblaze  |        capnproto-0.10.4        | NOK | https://autobuild.buildroot.org/results/993b9bbee54cbff875374a2ec0a4659af0fe4631 |     
   s390x     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/f998f7545f21b9904b99c56c4d33975d939766dc |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d033ae573f99a760659ae430fe116ffceb700823 |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/76fae7abfc86d17ecd727e0db5bbedd60a90ede5 |     
  riscv64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f29bc37869c4dfafb560063dbe4125a4c697316e |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1ca49f11f226f1053412223a1026566e2313009e |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0c5b1a34fe446d9b2e160c2f3f8bfe0d7e6b74c8 |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3f979dd523a58bdacd37f50aeac3ec702ecfb09a |     
   nios2     |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/e12cbe6028df6a8def50a2bd5f6fd3045caffd5c | ORPH
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/60a6032cc1d35732bfabf2d9dd2e81c0f3ea0563 | ORPH
   s390x     |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/6260ebad8e67edc52130748da25a998ada8a0684 |     
  riscv32    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/6d36cf0c8db55845c85fd63c43380972de9e5260 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/37f8f8f4dfb2e75d5f20f7d30144c0427e689b4b |     
   s390x     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/70b87650e7e7787da2292192f1dfb835cba6784b |     
   s390x     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7d569e89e4eb83d9883291f4ab8a2daf00ed8b1d | ORPH
   mipsel    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/7c66ec72e9f775654d7c489126ff44eacf817592 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/28d9a2a5188457756d631b79472e2d80d1d5f28b | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e9675b7d2c4b83fb3d85a6cba5e781881278350a | ORPH
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f16129e10e9e9ee9cc7583384ef2a23d2ef5ed84 |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/cd0ea16a3950c57d5a38dda2388e783126e3ab14 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b7274c36402953f427276e19b510082d7cc27a22 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ff777618168ab7bd1a7e78f523de7c1e956c9107 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/8d6c8d7ced424667a0e51c7392282b1a9b2f9fa3 |     
    arm      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9f84cc5c6cca7f73c42fce7bada337023ceb2e31 |     
    i686     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/14368336c892afd6af5b621bd33b1d6f77b25719 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/ab4da1797ef420f4b129b88ee36f356b2ea87906 |     
   nios2     |          libsha1-0.3           | NOK | https://autobuild.buildroot.org/results/86ca032bdfe3c975fbbda5d11acbb65e36c7c342 |     
  sparc64    |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/ffb96a8d5e1ee615ecbfc7cd1ef1724fe6c38021 |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/54422002212037709627e3f57270020fb92da2c8 | ORPH
   sh4aeb    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/4ec40c369cf98da9c8af30438762bd82f836e7cd | ORPH
   mips64    |         linux-6.11.10          | NOK | https://autobuild.buildroot.org/results/215339c6c8413f0da3ae371539f48bb5b1c5246a | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/e0108f76b12fe2bf3ce997d6670508fbfbbec557 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0fd9c4095d49ffbc18adf5af5df0d545723f4957 | ORPH
   nios2     |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/e699540fce3abddb1ab04f54e703e17ff1087afb | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9fae6317a28c591216af7df519ea5ce45e1ee9b8 | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/f9320aae2c8e1cc0e928e889208bdbbb8069c4cb | ORPH
    sh4a     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/d794269118bb15bd84b0097b4504a22529634f4e | ORPH
microblazeel |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/29405501c338fe16dd9ac72c54a6fe20d4aef940 | ORPH
   nios2     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/6d595e90985fdd68dd6df73b820beb0cf0bbfdd5 | ORPH
powerpc64le  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/2aacea9dd0442ce2af01a1a0b7db2dda8d380044 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/20cd401fd55b939f04b0d6466e5b6d785e670e0e | ORPH
   sh4aeb    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9fde5fd6ac48d05bc31550b659454d57790edb37 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3f88eaf99d1d67862e09889a0b5bae65db26158d | ORPH
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/da071e90f37e641f78b490aa19716a35140ba56b |     
   mips64    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/c5868ed5142c8e5aef4967044394aa1667ae5c54 | ORPH
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f250458ac99bfbdc5a63604c1fec53a30b7922a3 |     
    or1k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/09fffa739f56bcbfdf2d089159c2c21e5b28707d |     
   armeb     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/122b928c0944810fc8e6de2cb7272e01414db6c6 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/175a981ac831ba17e5f284094edd89b411454853 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/63d3f47d8580fb7af1b2e4bbcd6d3599de9e8935 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/39d1aa3b0bb9cbe87c60dc676f7d559289c1c607 | ORPH
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5be226270d7d1cda3f1532746ef3f8871f37f60f |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/d07fe65df25b825848692b150ed5fc9851dfa483 |     
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/998666783df5a3f406e8b9e14c3281313b259997 | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4cfe5cbf602fd12d6889e208ea80fd184e53c9d2 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/b59f4336a8648a980e9184f138f5b821a95a83d8 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/15c5815d5bdee4dfd40cebe2375d82cdddfd1e25 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/6aea866bb58aee5654614eeb18f4c8fad2a0985d | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
             host-delve-1.22.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/28bb6965a62fa5f9f18c83a0bf77e983b54bffce |     
   x86_64    |       host-delve-1.22.1        | NOK | https://autobuild.buildroot.org/results/1c57b6e4b962cdbe58b3bf035af9eecc091ccd67 |     


Classification of failures by reason for next
---------------------------------------------

              fluent-bit-3.1.3 | 1 
            host-binutils-2.42 | 1 
              host-rust-1.82.0 | 1 
           libzenoh-pico-1.0.2 | 1 
               mariadb-10.11.6 | 1 
      python-autocommand-2.2.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/b8c3a31a81845050b6727ae89c83dadde276ce03 |     
    m68k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/eb257a7cc2fdc22fb792000dd688a7e17e263981 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/6d2f5e732c5631e1a7fb13a32ad10b9bdc3b56c8 |     
    mips     |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/41166eb305bba27afc82178ae779168e96083356 |     
  sparc64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/070aeb359a85c26fb24e38edcd945b05cf800ee7 | ORPH
  sparc64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/05e5c67a827cf3a84fac8b2664c03048d3db9c4c |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
