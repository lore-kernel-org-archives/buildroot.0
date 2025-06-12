Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D69C71135
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 03:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8590740692;
	Thu, 12 Jun 2025 03:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP49qXpR49AQ; Thu, 12 Jun 2025 03:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E20440694
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E20440694;
	Thu, 12 Jun 2025 03:16:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B01101F2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 03:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0E3260ACF
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 03:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXjZh8ypxtNn for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 03:16:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1B196075E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1B196075E
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1B196075E
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 03:16:03 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6077d0b9bbeso917903a12.3
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 20:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749698162; x=1750302962;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TflTXJ/snCyy5/4tzyL69zOqsj5ERfnrZLtH+R1USos=;
 b=U2Xn/UoGNVfkcIShjEZhbNxoLYlx7d/av85QkWhWDoX+O2o/FkogSmltETFwSBi6S8
 zLKbQLaqhuE8HUWhlUiwfkOwna4VOZGw4VvgIIuBRlC6LyplrB25Hw9z9KPmSpdDbzFT
 pjl7JqmXET8DXl182hGjIRaN/pb/q7/y1A86YeTZ663XIKxsp9YQUAV98YvPcQBDJN4r
 mgpOimfeXFa1TbIHlzCXOF/IZBat1yd7snhYAPSFHcq2Rzwnxkdr62RwkdXfpUCl/TtZ
 E9ygeZFVeKdGLCKR5dqMW6pu+yMAQnMpeH+tPFkPC7mZGqB6JI9XHQBdZrZrEHHXJ8pk
 jVIQ==
X-Gm-Message-State: AOJu0YzGm/Fq8ludOUJW6Er5oMI067JvTXAM8OLBmd49QuISmzegF9Ji
 mLC7X99WGalI6/9p5+1Aohk/Lgqzo8NNSDBp0Eoc5Xs99vXxsMjWkiDzrPv/3w==
X-Gm-Gg: ASbGncvZN74/Nv4veJ8xZeUqobd/dPHZy0GBMZB2l46LchT4gpoIIy0gy4g0bxCmeV8
 BrTlY1CuDzVtmOWjsIS+/J3p3h1W110IiPLObZeYUgC2ZPTxPGwr76K323+1TtIVie4TSTx9LXX
 6TruH9hIYnwICLreqiPokAsyeD1DIJ9VMjSOIqyM7vFUhRjU+ym6bzAemlj37EU5X2ftnTM3enu
 Tw/cVBoCBrnRC2COnyHH191YN9TwtVOIXi5m3N6qqQzPt5YuKBGRntOgnBTTHRTTxzkrJqD4oSv
 S+EssluevxApemP7E+FwKRZEi3Gig9HUxSuOpFBxTSZEw7ZWZU4Mrcq3LvKPjeeWrzgiT7hREls
 H
X-Google-Smtp-Source: AGHT+IEH6KRP5t7cQuyF7/Cx8tvlEhXSyOusgZb9Fnf1oaFeoA9avevHu/ccdmKfM9sBFrOg8lsZhw==
X-Received: by 2002:a05:6402:35c5:b0:607:f1c:bfe1 with SMTP id
 4fb4d7f45d1cf-60863b08069mr2158760a12.30.1749698161054; 
 Wed, 11 Jun 2025 20:16:01 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6086b298888sm497538a12.80.2025.06.11.20.16.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 20:16:00 -0700 (PDT)
Message-ID: <684a4670.050a0220.3e04f.1004@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 12 Jun 2025 03:16:00 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749698162; x=1750302962; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TflTXJ/snCyy5/4tzyL69zOqsj5ERfnrZLtH+R1USos=;
 b=eeeIdw8GZWNitpUicceyhprb2laNUN3SXyaXk0THcNd22Ir8BzkmROULzLRLmCQwL8
 hcOtWExzBAClsAGBgdG9W4zdFLVLMlPDKpeel2hNTmjQL/myiQlbUY0N74Y3RkXyfyZp
 XggMkHGUEkDQVddCMWccFX2RZnJw5GAd1xmG9XttyI9njH/eu8u8HRW6gCyjLGLj/T0Q
 Xd5ij6Oqw4mWm6koEWIV3xXU71jezAO3LbNFTTfH/5FdwNaMIJx8QECGUzZ7giicEwGf
 Kb94qwM7a5lD5rRagMCQbLYDJOmfeVrLooGa2X5K2xdbNAeWSKAZ9xd0Qua4yi3EVBhk
 DEMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eeeIdw8G
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-11
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

Autobuild statistics for 2025-06-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  6  |  0  |  6  |
    master   | 13  | 442 |  0  | 455 |
     next    |  0  |  8  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 57
          host-binutils-2.43.1 | 43
              libselinux-3.8.1 | 33
                  bcg729-1.1.1 | 30
                    bmx7-7.1.1 | 22
host-binutils-arc-2023.09-r... | 19
                       unknown | 19
                  cjson-1.7.18 | 14
          host-oniguruma-6.9.9 | 14
                elfutils-0.192 | 13
                 openal-1.22.0 | 13
                   avrdude-8.0 | 11
            host-binutils-2.42 | 11
               host-vde2-2.3.3 | 9 
         host-mariadb-10.11.11 | 8 
                       cfm-0.3 | 6 
                 apitrace-10.0 | 5 
              host-json-c-0.18 | 5 
            host-libp11-0.4.12 | 4 
              libopenssl-3.5.0 | 4 
          linux-5.10.162-cip24 | 4 
                 linux-6.14.10 | 4 
                   perl-5.40.2 | 4 
                    yajl-2.1.0 | 4 
               bctoolbox-4.4.8 | 3 
        host-berkeleydb-5.3.28 | 3 
                 libsoxr-0.1.3 | 3 
                  ntp-4.2.8p18 | 3 
               pulseaudio-17.0 | 3 
                    azmq-1.0.3 | 2 
                   cli11-2.3.2 | 2 
          cloudflared-2025.1.0 | 2 
           crucible-2023.11.02 | 2 
host-am335x-pru-package-5f3... | 2 
                 host-gdb-14.2 | 2 
                 host-gdb-15.2 | 2 
                host-odb-2.4.0 | 2 
              libebur128-1.2.6 | 2 
                libssh2-1.11.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                 pixman-0.44.2 | 2 
          aardvark-dns-v1.14.0 | 1 
amazon-ecr-credential-helpe... | 1 
                  assimp-5.4.3 | 1 
                    bat-0.25.0 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
flashbench-2e30b1968a661474... | 1 
                    gcr-3.40.0 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
              graphite2-1.3.14 | 1 
             host-fatcat-1.1.1 | 1 
          host-gcc-final-8.4.0 | 1 
    host-mender-artifact-4.1.0 | 1 
               host-parted-3.6 | 1 
           host-squashfs-4.6.1 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
             libapparmor-3.1.7 | 1 
          libcamera-apps-1.5.0 | 1 
                libdrm-2.4.124 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
                libglvnd-1.4.0 | 1 
                 libmbus-0.8.0 | 1 
libmodplug-d1b97ed0020bc620... | 1 
                libsepol-3.8.1 | 1 
               libsigrok-0.5.2 | 1 
                  liburing-2.6 | 1 
              mariadb-10.11.11 | 1 
                 mdevd-0.1.6.5 | 1 
                    mpir-3.0.0 | 1 
                     mtd-2.2.1 | 1 
                openssh-10.0p1 | 1 
                    polkit-125 | 1 
               procps-ng-4.0.5 | 1 
         python-remi-2022.7.27 | 1 
                python3-3.13.3 | 1 
       shadowsocks-libev-3.3.5 | 1 
                  snappy-1.2.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
toolchain-external-bootlin-... | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
               valgrind-3.25.0 | 1 
                    webp-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.14.0      | NOK | https://autobuild.buildroot.org/results/ee8dd77f3e3325fb4f67879809c51b05b6b3d20b | ORPH
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/63c93fc08147f745f7759bfbc79226054f0abab8 | ORPH
   sparc     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/96451cf6dc6984e774a325f91aeff834650cc62a |     
   x86_64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/38ae3eb05459d4cc71af33233bd3b0f32afbd40c |     
   mips64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/66872c6e2a295007df0fab35d80a5066070413d1 |     
   s390x     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/22c2379958de5974d56a836efcb338f734f05c6f |     
 aarch64_be  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/9950823fc2415087723f8f748aa0d589c4b88a73 |     
    mips     |          assimp-5.4.3          | NOK | https://autobuild.buildroot.org/results/08725e0f2ebc890124bd6a26e713703248ddeb09 | ORPH
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/006383f6a78937b2f5982fce6a261030bd3558bb |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b4a4e33c883a8c70b3c03c198bc430d60a0f25cd |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/518bd675e46fb1cd64c8b9d7cea23fc2db433c9f |     
 powerpc64   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4dd4be373b6d7d4e2d1d419963b2b782d54a6b2a |     
  sparc64    |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/a48d1a4b9e2a719581d8d9c1eb1569bc86949906 |     
   sparc     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2e332f337445221796dfe66034a5d2403c3a89b5 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/b51ed8c17ec412489619e83c6a81c73282736395 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0d42103f4714bac7e10728f2315f6af395863013 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2fd7b5a35a5a5562be36c7984dd48bd9ee00496f |     
    m68k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/0770e4d032db8a46c4365cec2bfa2d3a3ba81311 |     
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/4a3a0ab61b68e663aab9535da22acd2bb168946e |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e62c8958935da8b45f89ad130a64b9bd6fb48ffc |     
    or1k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/6084271c71a42d00c305784d30dac428a4c37929 |     
  powerpc    |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/cc3b4bbe7855892dce64694241fe1b66282950e1 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/53caf5caca37e86ef44351a1c150c78fcbd4cbad |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/70de7549ab72b77c0fe931a7a46ade931ff1f06e |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ab07f3cebcb2ed7ead2a3d6a32086d32aa5e230b |     
    i686     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/59f4258cac378de0857e197d8e423bda82033f21 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/49c2a082d5480a256af80c9eac5173f96a01404f |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a7d3ee0ef8a2ea0de880a7a083092b84ae61004d |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e21d4b1e9b82663f917b606c7cdcab1e280aa1d7 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e07c242c107dd1e72022778bf04cfee3591e9d54 |     
   sparc     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e5164d57764623b1d0ed69cf62c2e47c40551f1d |     
    mips     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6ca86c407040db11fb5bbe0b0b9d2db7bec87da1 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/81f544efef6e9f20c7e0db6b470b72e21ffa32cc |     
  sparc64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2a5981c14819b686e97c9f5c5be3c0da2dfd3410 |     
    sh4a     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/b9ebcc25e4e480efa9619a732592875797638319 |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f4c7d3f21c000ddda1a2c361a23761d591f529fd |     
    or1k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/797baa60db412129798617a38945853ea62c5fd0 |     
  riscv32    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/542c74f7568190366623504ef50ae61324814064 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9876161c417e383eaf1c8986679a268359f94d2a |     
    sh4      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f8a7734113a2514361bb1f298966d6c3909e2de9 |     
   sh4aeb    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2459cf0cdcee10cca904c5579156528f298f1eff |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/3a6c1eb77e870389215a9a24a346a905802b05d0 |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f773b1d4bcb70078deca8876fe04acf10f7f958f |     
  aarch64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6ec30527ef2483ac48b8535c6bc7ec3eacd1818a |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ff370734bb388d0c5c92105b31df94622f42e0b1 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ae942a39830932e33d2b6be029ed6aa5fe13aff6 |     
 aarch64_be  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/15aeb34aec672d8652eec0e67527099b10790760 |     
  aarch64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/08ac182479362e1f7ba61f736870969592ce9694 |     
    or1k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/a1b762afba10181224760cd738780549ecfd4554 |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e769b8a660817f3e0c7503f6fc17e437a2688834 |     
  aarch64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/161d02714fefb430a403219a507bb644ec3ecf81 |     
    arc      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/15ef8a96538a60e13677f2febccc161dc1f7f241 |     
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b4c8aa2f3c13116f37d8dc870b989e91f3e4884e | ORPH
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/5b90bd7c9b3089271c36bce32f750eaafb9aefe1 | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/554ee371515b268d991c2401b972b8fab2a85235 | ORPH
   armeb     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/338ca4f875bd75d4c631f99881ae6322bda44571 |     
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d2602c9110f0f812300361e2ecbf7755b0a31b54 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/064f0ee5baabb248e538b7da02ce3b6add5252bb | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5ef84336d693e6ca0135ea9b367b4b5130f83f2d | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0302d72f7ba4854b10dc4daab5f90ec78fca8433 | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/40adeb9ddafdfa0cf69df758ecdd11979401d4bb | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4e6be8be78a69a21b87504c4f11236bec644825e | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/baac5525a2b83f0019ef8ea6d957fdb9d4e0ea7e | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2d677c5ec105bc09bf0466470b95deeec199bce0 | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/9ca246d01ff43cd0cdbaf83999b06e267614d909 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7719a860516d1949ef98555131d0f00816118958 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d70be97f9c5e78cb35fd7667bc4e3344666481cc | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0d3e3c4ce4df179d95e898b1ac67f3e398bacaf3 | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/96e568faa4944de748862ec8e66812bcf28c9a47 | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0e7fc2bbac8de32c929683e70045735e6dde8315 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/521a8fd67ca7aed3eaf60c5a7e5454f9eff8117d | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/33d1b9338d43d9c4b4a2baf471b59fd006331509 | ORPH
    mips     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/556652fe376fa5d2504ad182d1b32b808fb3b350 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e00a00a9a141c7c6672204831df0f8212d325fe6 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a708673040a51f4972ce3e11bc3a0119b1580ca4 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/bdd698639271de845edd1c98e87902b5e5f09699 | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3f6ec48fd77ce25599d8aab836321b5e0a1336e3 | ORPH
   sh4eb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c7d3f372988ae9426d141da2090b9e353b054e6c | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/84fb1061c0fe35d2c7cde6b6e863ecaeae74bbed | ORPH
 aarch64_be  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/0d1bafee277234a16835912b95c0b5822972eeb4 |     
  riscv64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/f982f670d1e15532a074e46ea10d0c4f201ee9c3 |     
microblazeel |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/70f93ccc0e17ec55fc0a98239876e73d17829541 |     
  mips64el   |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/74ca1563135bced834d46995e4d9a6e16d4fe66d |     
    mips     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/61627570e54e07a4c288dc2541ae2869f2c3adc1 |     
   sh4aeb    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/4647841e79cd61906ae869caaca9871b847d6ee8 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/de266c494a76e59eb3d08be4c1052667efb10920 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/7e5f4b46316c9d417161cd556158f9a22e5fd8c8 |     
  powerpc    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/00b970df87ef4a9384a040977f24b90b3cfba452 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/71052e0196ab072d27b0b8b0ab30b4605d65ea0f |     
  sparc64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/b5c18644d19dcbf594160a87ffc115699f95a8ba |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/15991d5c1a71b365575974f247b2e92159f7510d |     
   sparc     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/4b390a5968588d8b44afbec163611d1e7d86e5dd |     
  riscv64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/c479fc2ecc1cc8b94db68370454d93666ca5f520 |     
  riscv64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/4be08e68dd04c54ca862c1a622c3eace36fd18bb |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/d07450b38f3304dc9b217eb6efdc57c66f6358dd |     
microblazeel |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/8efe04cd16249e86fee275c3df77a29e1fa3caeb |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/430894b4bbff60afa568d7510dac182826aa6a12 |     
   s390x     |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/f04edab9e5ca782f6e223c662ef86fab85c248c5 |     
 powerpc64   |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/831062dc1afb318f90b9974ee1d08706bc8f024b |     
 powerpc64   |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/8a0d361736dcd212326a969a91b63a8261a1eb2f |     
  riscv64    |          cli11-2.3.2           | NOK | https://autobuild.buildroot.org/results/03bc29979e8bb9ed979f58893fc036bf473bdde8 |     
powerpc64le  |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/acce74569bab50be3ca450a584adbfd89fc8fe3e |     
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/d26e81640e670540c41adb73ff3bc621dd136a26 |     
   s390x     |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/b3bd3dd1616ef6b233c2847acdee8648f84a6a9e |     
  riscv64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/d9c373080fdf6dda7283795bc82e1959ab6cc7ae |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/0712fb07bddb2760cbde7865828539e26a033d91 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6f68165eca71b913a212fc778f761810e24ccb48 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c22cedef256143edf2bae7bee3d5088019165b1d | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/e22e5ad9d364021a709311034320a6c0e14ac91b | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/96b48c8250bbeea30dcb30e97581805869c663c9 | ORPH
   xtensa    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/10ab6ad959f9dd294b956a5e6569a63ba9bb3883 | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/256b8af7e53cd3f00539b79c2af501889e507e40 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c03ef700ddb0b1fd6dc84a03b5f01f02f593e868 | ORPH
    m68k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/76e6c42503c5ef2e5dfcec9d211750703dc6804e | ORPH
    or1k     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/bd1255707a8dc160da8c81c5f68a262348664c92 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/47e43ac7de3734b0ae80eaeab9a796483973355c | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/2d3c2b1af5eca8945b63591da6154f69ef4af229 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9f61684132e2f3fc2a8fa85fbe166ad109afe44e | ORPH
  powerpc    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/ce8ffbd1683c86892676b604b55ea73eb26afa23 | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/3d9284411c19def84c65848601d2b5cdf2dd97a0 | ORPH
   armeb     | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/4ad51ba688d84ed54a802b784ec7fb0132b9b607 | ORPH
powerpc64le  |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/d75e3284e58b5fd687b8700f0d63e59bba3fdc85 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/29467b84476287e91b8623e5d3835a75e30587e4 | ORPH
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/2af9cd0f3f675a7042320a1ba5bf4ee4a4b39874 |     
    mips     |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/6b9b7762529ec0d3af928b783d7c8cd7507a9826 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/1fe5474dc3697d6c0f087c78ac84fe49d9985e1d |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/1603c0c09ea0abcb353eab6e0378af7c46e318ce |     
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/3a4ed94bbf5d17bdc576c9c20a170fa762beecb7 | ORPH
   armeb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/167075465da96724c90f236389b67ba5bea283c9 | ORPH
    sh4      |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/0e0c34fd7f883b7c6b8044dd5bfc95f6de3b7611 | ORPH
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3aa21a8bba4ead7b3c42c75b119823d277578d11 |     
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/60f228975d1f1c4f8392a063cf567bd9663dc6b6 |     
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ae7eb7e7bd62d2694829432e83399b6dae7e26a6 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/73926fabb4eedf0bf1e18668e5d97eb8e62a56f2 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/dd67dbe6cd6b72bcab88d75df1009cbf9feea5ae |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/ebdffe92b3c9db87fdcc7a745cd9bb23ad766997 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/82a02e50a1a51a2766133bd65dc061b9488fe064 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0ca08f673fd1764dffc1bc8280cbbb47548c0333 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c09f89775fa9294d41ea7522ed14dac89e010681 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f3e9e315ceb956bd09de1ac5a8f8035d529a67e0 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/60e87312c84285cc3e3d376c46adcedee3a98ee2 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b0a67c08c7755efaf7d36d8078bbce4f08e4ae59 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3516c728085bb2b0f3e196b0118885cc91b39d0e |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/74058eeb1959ad8f0f259ec60559faa4fbcebf3c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e59c16c9ee27ef5b657e95942271cad98c1a3698 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/67aa3ec8fe7be9f8bd0d0f00451124b4d2baeb5f |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fb38ae0843553e8f3bc42f5b76812a48fb09bbe6 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ea954c9e2135cf48608a56fa39afc3001b22bf36 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ae83f32069bd50a6997ec50557eb7f48cce304d3 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8a549330e01fffcbf5604905ae71635bfd8e7832 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4da41f09e13714455a265a111c291bc7ebcc7abb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3cc58a2bbcb6ac23b0bee06752cdea0c0df1726e |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0de49d5661aabc51ddad60a1e194675184c4ab48 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/084e0134f3a3346626932b3bcc1c4429651af1e7 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/327895f9ef96467f6577a309b0d0736e79f78a27 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5d35816d979330f8d725edbc825954aab299463b |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ec5bc3fd7d03a89507475ac62bd2ef4da8160693 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/71793a696438a55e2ab02c8588d1cde6883441b8 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d176e3d26b017c0958989612b4dfc68789173b68 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8443e243b26972a995b3779b8767ef28d22563f3 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f6a091b959cd7cdb05406bc7ce80d3c5b621ae9a |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c3608de67ad60cbc3c2790826323f2b06ab32179 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b0038ac6e14e4b3fcf21179c3ba986f9b6ea3794 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cc38dfa90e6bf51fb62869cbae2b9b52459d8026 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e5ad6e1c28832aa575dfb0030da89447c9240305 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/79b47189c1523cf885f272b50b3393b4c5efbd03 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/21b4081ed2916c45e2066ea01b325db63428647a |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e927870c4a8d500a3e4a2b1ace30bae3c8812a82 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1c35359729ee285b616dd054fb0a285f76333e11 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b03c4d9c818013a2f827fabd16f3ce3a486e0d75 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c3f1b7a654ee5a6bd6ff9d77a2d58a16846d7be8 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9970bb57ef14325ec7bcd34fbd395e1009501e3c |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4b7aa3e475963590a8c10235067f0eb588570cd7 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a9d1db1e1c7e670894d69c6d712cae142c7dfcc6 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fba827e418e7f86124f43e3c560a42d877205670 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b40d529c47c02529b1ba554c88be6b166e2faa49 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d23ce856ea5f0b967631f5615895ccc9452afd25 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/da9474d08986d6fd545bb4fdae07c77deb33926d |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf66af013a3cc39bd3c708151f5c4342fcf43d08 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/87c927c2a89485947b241f41ef32092d247a13b3 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cb3a91653d89357627a0437f279095924c8300f5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9e6db0d3cecaa5d3c69e7d1274db9f119c9fe8fb |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e58de943a96f2bd95be48cfcf5b1b1e174c39adc |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a9c4fa458c9e058b7e7eadd210c9bc742b81e68a |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2cf59f4c15b3efba3b2d51c0bb4277bbd3270a09 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/03d37ef1a2b4d7021418f09e799f150896d2affb |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8a122791f5092134256a96eb81c6295d04e6f50c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/a03c1c52211be9d4a64fe03b18db90fb75b06ae6 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4a371faba9b1913cbe7a69ae64aeb961c7829957 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9ab6de27709436d5f97cfff2fdbbcde54f4df4fc |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2210068ac762653d405b3455d9b2bc32c69553ec |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/97e385904d780f8c6e5dcaaf7b0787d764952909 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/5d4081851f6f1fdbd23348f2c3e120e3f3ccceb9 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/20fc60e5c375ab37c05e5d91f0a51f204aef33c5 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/8c2bcc9a85cbb25fd54df2513a5066ec47d41c8c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0067a89f838608789b5860e14bb7c982c532d6a5 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/26a9308b6d42cd87964cfca9a8796a7c43be72d9 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f79bc36210e05965813b197b3e51b0f115790b30 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d6f0d4f4340b3e8af1bd6b3f64f0fd41ca4ec9b4 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/cf17577156c87beb019f7148aa2ba72862d8839e |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/2965c1925a2f99afb721d5fc36e56e87e93fb27c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f16e36ddf30b722140a1f5e750db11da445962ed |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6cd7296ca32388abd9c0f0667ddfe820be89da3c |     
  riscv64    |       host-fatcat-1.1.1        | NOK | https://autobuild.buildroot.org/results/21dbe6d0161843e83111d4e5743346e5cd135951 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | https://autobuild.buildroot.org/results/f06bba52f61a9f4c0b601d4e44e4fe47227c52de |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ad71b028f08b87949fc42c54d0ddca0ebbb2e78e | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/984ccffd1e4bda0dc70894715f4817d282d58ead | ORPH
   sparc     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/270a9afe11fce3ae804cb66d245e4066c87bd02b | ORPH
    m68k     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c659fc78c682480be65ca7fae41a83c734b0a62f | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/276dfbd72b3278ea1b4eb83f974e276730ff281c | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5dd5e96b3f910e84a2781e9561a90b65542c04b0 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc9e1d762fe6e25e1223b157cd9eb7c6144601fd | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/58b3fb494c49c6cc71c9dd3b397a1711485dd166 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fd771bde68e3a162eb6abdbd7c09618375733f16 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/43d8135cacec87ecf06ff384fed6804e9a889b06 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f5a21c42d5f1a75acc4170427742a97107c96752 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/88ac969d15ded9ca0cc8a307bb8f46e547fcdac7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0da5709b880447621e64263ea407d1e4302e3e0 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/546daaad4365ccd9d926ae6481ccc27002e51e98 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/57864d2eda568fc5af8e12557bf984df22c553e3 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4fb657a9707f6434946ad8f1ea7451908687c816 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a96f62d646399984c3c757c356cb9a264d412c14 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/761372bb38dc087d597c05c0764b8623d3063ca2 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/03aaa0788ffceed12225e97a06a24a3d420765a5 | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8ce06814436ad31da5f1721a6a4aa544b5dcbcd2 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0b8584beee981260e1ca056234752c897b9468da | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84442890e07512127369c126c2620addcc09c1bc | ORPH
    sh4a     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/19d0cbc456fc05214c99bfa6c0e4c201e1dd6df1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5f929580265f7082068d8a573661a6a17f3233e7 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9ee7dd6300d410c55c792826c35f3291bd356c6c | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15504fd148220f0e062a8936bb4e5180586b034b | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5fd30f6a4c876b5687494e706dd3ca18abe59264 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e923839579586e25b2f703cd31a2db1ed5ade90 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1cfef62e55bdc605487336956c102d22cd54bddd | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2488fe04165e5562bfae1f2c9e3ceddada3fdcfa | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/af97d03ecd862e82bebe847af997cd9bac18983f | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/485e77b0e2708d664140fbcf28e9c0a25918f00b | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/22b729739767a51cc95e8490d3aa85f4e971be1c | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ea6ff7b117c56feac61593d9999cdf24a2eb2819 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f7d8eb6f4a983251f6a20cdb80e42cae3e229839 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1192754e6d75c60f87ca7c8ba482d5ff53faa182 | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/46f9e40722865498204944f3fe0b651be70de89f | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1c8ae1c9fa7e65bdaa5d433b6381009742383bae | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7c7a826083f8cf356fb4a9cf90b96e63daede654 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84053d720e6cb84238e6371126effdef38c24a2c | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/717127f5d964a53ea3f1041c7c84811823ea77f4 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c8cec3dc5d33f019deea43a0faa61c71f29b2033 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a456c5a86eab577e02430e4d009e16a36a339133 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9942665f01b0f7e61782d38ee05dc8b0dd3893fb | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4ff137b0c0894ec1a9f59f6160cf611cac9f750e | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aa71ca35183d2db05d526d24ac8ca37b7dc04f6d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1066972939f7485a00a2e54d64fc05b68dd1f6f1 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a30b79e1b9546d9deb748e530f039cc1e91c944d | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4fc5f6c1359d04effb8f4fea9aa508ad16c89ed8 | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4a6ae0c33a5686d8e441bc3332ec1fe8b5cb92bf | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/42f33047ade01c88b142fb5c452555cfd44b928c | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ae812dae68e440dd9e92f7875ec060595c5747c6 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4ffca1158f8fe56a33933aa831b80197ab4d95ad | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/082a2bc0df71fa0669fdc6373118095ce989be42 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5fc36425f3428a3d8a70aacd734e12597dd4b587 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3b0c0855781e08d4a962a5eba310142790f65bcc | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ee45c6acdb34f12548b823502b2536be24a1e3ce | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9b04d3d5b633de791792007a50342bfaa922a569 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/11aafa211bca413e04b830e2416b0fc34457f16b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fbbb87e86b13387c0ef0fea5061637286eea6b17 | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/be841338506ae79e4b1a2f13c89033c9813e6b0e | ORPH
  powerpc    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/275b67a3edd9c6374cb823a3cf92b36f1f3ea955 |     
   s390x     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/0090b53c243787e30c8f84e7829584eedc3e8243 |     
   sparc     |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/c2318dbc5c5cd6487616e22055b3bbcb33dbc738 |     
  sparc64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/becfc037bc3f07fffe085d4053bcb68f2ad0d86b |     
   x86_64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/3a130342019c41475980473975845745712694b0 |     
   s390x     |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/4c999fb3f17ce8e5db6e8b42d6bd543861182080 | ORPH
  sparc64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/aec1d7a13a7eb9d3e33f0fff6a98901173f79ae0 | ORPH
   xtensa    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/d20b4d0d7e0429553b58761eeffaa8a95d4df0a3 | ORPH
  sparc64    |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/1145cf84ecd0fde4ddcd3953d8657d67989e2155 | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/4c14afdacd2d947aa1cc8f4a11215e46455f7448 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c3bffadac1426391a44b16fe62635e967c773a51 | ORPH
  sparc64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/3972908f1954f821409ff6734ad91ed78ae1b386 | ORPH
 aarch64_be  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/b30e53e728a86552bc754a3eb8260281a1ddd88a | ORPH
 powerpc64   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/f002575e35cbc15948e131dd1f557b84267159b6 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/15f08aadddfaf2354af304f53de475506b3cea40 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/c9d9a98afe2ee3e36ee16536785f626610130130 | ORPH
   sparc     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/a6c919ce382ba1f873ed33467c4f35c80c68754a | ORPH
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/1cb14ca6456d2716b7f859a816af069e36aafa6c |     
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8139fc82df362c9f1c2335abdb00a5b553a587cb | ORPH
   armeb     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d23d8a81abd8cb43970543c7fa281b1fcc7a6c02 | ORPH
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/58b65b00b2822947604c72dc63d801dc509819e6 |     
    i686     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/5228090ef1b963675427a981979e702267ad1fcb |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c39e0b3b447415e2747cbc0901409cb6ec67d7fd |     
   sh4aeb    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/cfeddd5a4fc2e884ac99adc44e3efe817877a3e8 |     
   sh4aeb    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/33a47d69f0cfd9710464fddc8f5758dc9741a138 |     
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e26017453d91afa9218d01b2c7b314a71117c4cb |     
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e92f488522f90249152d763aa71408e388c8906a |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/6cb5edfbd6d5ee827ebaef79ba27aa6d55ed3202 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ff4b24083e702cd8d7d13393fd6dae7effd580cb |     
 aarch64_be  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/1db4831144e07cbebf8caa99fe84327b5f9d713c |     
   arceb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/e583eebe82bf12fbe445ef0945fedef233676e6b |     
 microblaze  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/99565a2683ec02d77d867419774ca468d9a2ae36 |     
   xtensa    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/1f8d08c3f2308d5eedbaa3b060d2d45e2606ee1d |     
  sparc64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/b92230fbd3ef411182ec735d2ed911241665b86c |     
   sh4eb     |        host-parted-3.6         | NOK | https://autobuild.buildroot.org/results/589eecaae47c00fa7ee2a8908290cc3e3e46337b |     
  riscv64    |      host-squashfs-4.6.1       | NOK | https://autobuild.buildroot.org/results/3d96811fd9e126850827bc0bf88bfe023a16dc3e |     
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/71748a1eea11edb7c546af313fd8539d9fd0cf4c | ORPH
 powerpc64   |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/a94284380f5b7589445fd634a6be6b3230a09f1b | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/e44cad6726edb2afffcd49d3289af9bc83bdae0f | ORPH
    i686     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/7d0401918e44ed6aea0b5ebda30e55fbe1580317 | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/dc2b488549f5f678e2238478de6bae7e2ceff6ae | ORPH
   x86_64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/2792df7b94bc9824c8526cdf13b8f4f023d666d2 | ORPH
    m68k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/fc088a43b115b0ecd63a238076afda9edb25c001 | ORPH
  powerpc    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/f8b73f2b27d456fbe3f94922ebec80befa9b7bf0 | ORPH
    sh4      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/78d689c79c09e3e1b024f4fb14fae470ac2cfde5 | ORPH
   armeb     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/1bee12064266fd1f17ee0547c521aac3ad96877c | ORPH
    i686     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/5891f1a97af8559391adb00f4c12997f1e4427ca |     
powerpc64le  |      libcamera-apps-1.5.0      | NOK | https://autobuild.buildroot.org/results/00963d121b8cf00cfcb49ab93ee54721e357d777 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/c6b7cc89242b3bddd377f7fed5773a5defcd7058 |     
   sparc     |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/202524bb6faff3bd67037b6a6780a63dc1309153 |     
microblazeel |        libebur128-1.2.6        | NOK | https://autobuild.buildroot.org/results/32e5212e49633b97ac54f808fdc03011f68644df |     
   arceb     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/85a6fcd78f862ef86508d71c829f4ec116e3e495 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/c38b0c115c48dae2e5fc32ab05465ccdd8fc7114 |     
    m68k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/3b822d5ce8634cc02be3babb7984a3bcacf53b1d | ORPH
    i586     |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/7fac4ad3080c25dc15b3564734e2fe908cc0c42a | ORPH
powerpc64le  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/dc10202ce477bc8d201c582ba533167c7783fa81 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/addd6259c9826a79afb178f686d7a4124a0faaec | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/5f7aeb3dd152855c30a608879d17b8c42d3932ec | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/7c4074f650ba00718a4047c3741cd872a38be6eb | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/9bc6163fe67aa383c71f1634603e19d49f183a86 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/582f4b1bf6263b76cb224035eae0f9f81b4171f5 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fdcbb0822013733ceee3e0118de9d7a75d7bf098 |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4d7d17a0ff5f24f5d4d7c92917a912760da4d2f3 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c255bed31373a2da61e06f984fd88274589d8be1 |     
    sh4a     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/115ef65d20837c372db6fa6f7e7af1cc3075d7de |     
   sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8f4767717cfa4c7e6b947e51bb8ce679cdee83a1 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cc34168c9cae6b8d790752b33b39e5fa5b4e65ff |     
 microblaze  |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/559684af8a8e68a109ad6f330bd4652e67243cab |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1a673a8c723ea83b10224ebf24659ac2ea0db5ab |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a8f4359ef274165354c128ba36cfb13f159252cb |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/77450a13baaffe68da74c942ff1fa7ca5f379fbd |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8da5c001d01a9869d2c04083090246882cb5c56c |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/024ba072e2fce59ff9b65cac7247b271c32a6c4b |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/75247171863f5d9ebb17a2031f1606e2939fe876 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/280051b33998edcf9b7f8855787391da4597cd10 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/d81c81ba787fe8b080dff06a0fd0e1b4f518720f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/39343f0686d30f2e4723a00be2c176353b85af2f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ce4c685e6bf718bdb16d1e813eaa8cbc0d3fa083 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1674936630da5b32f51ab0e80b1b877a65d5927c |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/8b28ff2be765a1d3096553b091b6ef0720b645eb |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/dab17374d9b50ace0f6d547d99c3d18ebdbb100a |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/4ec025e50c15b6099ba1828118313851e8a1a253 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/6718d9dedf9a3b3ac0edcb3d5b9c4e60b8745790 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ee30d7a2c6f4273c683956fde88a3303f9e5625b |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/26195b24c97af309b316a8639af960aefe31e38f |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/12d721995becf57d3488ad7902710e31e54d882f |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f8652b7a2b60024a9fbf4299124e63fede07e617 |     
   mips64    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/9be622be4f6d01e0c6f059a3bf4bf07a22edf2cc |     
   sh4aeb    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/b1b219e4422d3bd4ab546c426d35d0bc896d31e2 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f8e1e01cfa5e7af32a338523e72c97b53fb9b6f5 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/62732d76661aae43ce56770f4f2cbaa96320f579 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/72c467ae44ff344e59bbd2301621d405c1ee4e98 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/33a2b6018453c537aa006258990808b52faa98ad |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/68fd44727945949532368fec4fc8d4db0b99af56 |     
microblazeel |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/205a1cc78278a0c5ad233092b7ced52d1dcd89f4 | ORPH
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/513f3742218467459d677e16c457d2db3902d684 |     
microblazeel |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/44860c11f65d186978aa385a2a326c6f786da51e |     
 powerpc64   |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/c90884ca4bd2124f3d21c4c70dafcb9568b30883 |     
powerpc64le  |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/45c599d6ee71e4cbff27f38464083b42dda6b4b5 | ORPH
   s390x     |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/ca161ea43ec982e5a5ac1155f972a16388a266ed | ORPH
 aarch64_be  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/27267c69c3d0921721b67038df8e6ba606822729 |     
   sh4eb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1fe6461f90342f923283ca8333b9e331df96a23e | ORPH
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/99a7e2b52214f90ec6c9acf3391223e5f7a15498 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a36130b703eff6980a956d8e42a5c9e0cc03707a | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/660f658b463e175d0424a59544d79b7b7164010e | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/54ef75121f7a36cffef623a09b6c0cf3ea7de898 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1f3ad1ca6919b1ee89878fe5e75514bd542ad109 | ORPH
    i686     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/44d20717690aacc7a6c1521b9f075d69e93c7244 | ORPH
    m68k     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/0167b636e3573bacf2d64736b49fe2e871d5b0d1 | ORPH
   xtensa    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/b0781fba59840b732f0fad028485a1c2eb1cdc72 | ORPH
    sh4a     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/690e0d8a3335087307b19e19bbe6fca172b69683 | ORPH
   x86_64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/fb5ebf168c1589b5fb9bdad3ff84b3cd15598b53 | ORPH
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/ede1dd4b141e0c5fb98f1e89974110a58452118a |     
    arm      |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a99207e84692aa27d79c99d11652ebdeeb8c91a2 |     
   xtensa    |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/68d10754b5bd3c376f8720dd54325623cf1c3443 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e02d0820f50b8b7681f17ffd41df0415ce9b4287 |     
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cda771a7d27cd81200a24683c20f137daf00e9a1 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/90c66c02da053852482d912b7c02d653cad4d3fe |     
    arm      |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f89023389a2e892cd6529fea0001157dca64d0bc | ORPH
   sh4aeb    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/f5ef5c33fa4642761a33c291dd4561836819d092 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/8093a1788f26332df37fe096ed40f96aab687d3a | ORPH
   s390x     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/5275d6e96d256a2ada0e0cbc402a4ce8e6cdb1a8 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/2e0f35bc1d9a47d05f91b152b433a0100bbe2ed8 | ORPH
 aarch64_be  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/3773486894573ba8eb636224d3ca09e8b8926665 | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/1b35ab63cce8d3bc204461e84042dfd70b120148 | ORPH
 microblaze  |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/3306efeb370f570266e918999954a52bef6e892e | ORPH
   x86_64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/59243a4a32e6d3b00406ccff8ea6a6bb8df0ff3b | ORPH
  sparc64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/4dc14cc19d18f40d52fb15ed4f928c9bdfa4916a | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/4d6f5d9c6333ffa3618eb6cd00dbd39966c032f1 | ORPH
   x86_64    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/ac0e75c744107cef56031619564e89393cc5e3fc | ORPH
microblazeel |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/006c665076d1b99acbf56fe36fa7fbb4eaa39f6f | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/206be4d6570efafd585c19df4d639a6b7ca2ab8a | ORPH
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b302f674a2f229483561c2c1b301ef6be7ce94c1 |     
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3657509214178b6c2c0eaf32578fae67e8a3251a |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/61f5f42ea0eccead4f5a610b8981fd986fcbc17d |     
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f74e96b3669f4bcf244d512422842d7bc1679418 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/70e3e1353af7d5be1f685efc5158ba4854913e20 | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/f9d87bfaa4e4d0686954165b26be9fe8ac923a19 | ORPH
 aarch64_be  |           polkit-125           | NOK | https://autobuild.buildroot.org/results/54e4cc6b6069abef19e6a0da4e535bbb4cb5797a |     
  riscv64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/621fdc814e0042d1bf737fddb19e73b762dede4d | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/85e86adfe3a0915904dc61688de5dada6c3233a4 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/be7939a6962abb86803bd786a4202a157582e548 | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/63f17b702932497bd38e86ec1d1a09cefde485e1 | ORPH
    m68k     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/f0409533ebdc31e522f2ee2ea8a5acc11dbc7430 |     
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/25739152f42363d0e550b8f7b28f0335ebeaafc0 |     
powerpc64le  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/36d6e6c5d9cf1266b34279c56008e37d95bde4da | ORPH
  sparc64    |          snappy-1.2.1          | NOK | https://autobuild.buildroot.org/results/899abc7b3efa21708a60fe22bf063e77ce8e7ecf | ORPH
powerpc64le  |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/0c1b9962267739926c5be91babc852f68614d1ed | ORPH
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/3d7e406962ebf262570d90fdf7636f9f4f3f8019 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/b01a3f0308788979517239da4b357257779b0454 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/3043dbc4c1c9ec72289e1c432f89e17673ca390f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/29fcf5fda603fcce7040450e335bb233fbd4e3e8 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/0f1f8df4142a219150fdd75774bb4beeadf816a7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/e3316282c767cd0b47773bf59e723e3ce0097a52 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a8e22e1d7bab84b1e46f3a901a7b6428b30f4551 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/7dbe0eff2553254f92f15141168e874a7df9b3cb |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/93ede81f6008772de9f82b07680c953e22ef3664 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/2418413275ae245db2df72b440ecf2ee40b9e4b4 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1fae4a116561a9465765c5c33c983375992555d2 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/db9251e0e126331ee4e35d4bc14a0d7fefbc854f |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/70977fb14588835f6d787518b029861853c975f5 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c91c0ec3eac502ed10acd9463de4f2c39f94b4a4 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/406efd2797e35d9cb51634927088fb8f694fb72f |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/4151c8b4ae6bf01ba5576423bc5881c5593d997b |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2755e877f522aafb5f8cd949c7e17564a3a413b2 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/a63be2f523e3489e519b4910023c5e4104f9e469 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/7d4c8d8b912efe187e69655771290958f088585a |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/6973f0ff06a100bc86ba911a58936af2d2783ab9 |     
  aarch64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/bc0ddf46d0e3d2eac293b8c2bf7c164210ec6371 | ORPH
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/d9625f0dc8502fc3cb0c6c39836dd512e9ba2e56 | ORPH
    i686     |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/e3f74c26999062b00216aa726c8a895fefb8125a | ORPH
  powerpc    |           webp-1.5.0           | NOK | https://autobuild.buildroot.org/results/21719bedabbe473440bde98cb39c9ddb0160167e |     
 powerpc64   |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/39552edbd042a97fc609a9d3cd442a627eb570a4 | ORPH
    or1k     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/9441778579e25148250940b2aede8ed4d0f59aee | ORPH
    sh4a     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/fd6b81cec5c682e6a2854c1a27e9397e15558cc9 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/b5d9392618e7304ef0ce6dd8e26cabee8251f5c6 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 host-gdb-15.2 | 1 
    host-mender-artifact-4.0.0 | 1 
                libshout-2.4.6 | 1 
           oath-toolkit-2.6.12 | 1 
package/gstreamer1/gstreame... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6082d3055de7f94a2e415d98e35ca8d87d55b473 | ORPH
   mips64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/35a91b8807105f8a3e0407ed1c72dd0283b4884d |     
  sparc64    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/2607ad0424d83455f9d0e0fc554a01f29d0b289e | ORPH
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/b44313adf78213ac4728d427508701bef681d3ef |     
 aarch64_be  | package/gstreamer1/gstreame... | NOK | https://autobuild.buildroot.org/results/cbe52ad3ce3a2eaab230c2bff51de0b4073ba4f6 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b242303e48b8a6be82aab43d3847c95470127059 |     


Classification of failures by reason for next
---------------------------------------------

                  linux-6.14.6 | 2 
                  cmake-3.31.5 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
                libshout-2.4.6 | 1 
      passt-2025_02_17.a1e48a0 | 1 
               syslog-ng-4.8.1 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/34df6c819a5e872e64ad518171fc88a45d6d9b4f |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/b0b66482586290b913896f2565712af41ee71d46 |     
  riscv64    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/16cfabe63dc5c82f4abf097875139809f819954b | ORPH
    i686     |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/1fb626ad387407abacf6414c4c029ba55d753ba5 | ORPH
   x86_64    |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/6a9509bc4e5fcbebe3127efc02b6f1589e97a5e1 | ORPH
    mips     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/2a53fdcfa3dd05799be5fee11cb026f912b25e71 | ORPH
   mipsel    |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/afe64b1c55247d1935928f2d89d3e606df4d8152 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/bd119d29545b5ed0b2f5645a89c806c56e8ea97b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
