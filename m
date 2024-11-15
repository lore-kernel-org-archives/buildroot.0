Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95B8D6DDCC
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 04:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F261B605BB;
	Fri, 15 Nov 2024 04:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpWQxDYkBBTC; Fri, 15 Nov 2024 04:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C89E6067C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C89E6067C;
	Fri, 15 Nov 2024 04:18:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B2EFBF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 04:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 191138460A
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 04:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ah5K3j-Z-1XT for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 04:18:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D368D84607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D368D84607
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D368D84607
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 04:18:13 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa4833e9c44so46189466b.2
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 20:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731644292; x=1732249092;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5jHfhZN+8LvYPSlVJSstGl3Pq+UpYYV9xtTj8MgioZc=;
 b=gqVro37yHJ0LHvFKIaqqGvsI2mSHOMSGtJUuK0L4ZRoJ/JDE1OqLYefacPhC9IhXbh
 NcIPa7OiSOfjjCqht5qgmZiuoydvQScqhZVzrM+rP3Vb8KM5dmvGm3KUZzQFygLSh68D
 Pv24i2YDvcT74GPut3Y6QOrG0n9bz/6Ebl0UJGtCdUz23nEsj+247/M2KXxkvSpUz5Cj
 AGeNXHXqHVgK2Qk5nsRgMpfqHF6oufSum7OCBOvP9z3W6KP/R6lAekhmTmlwiCBse0F+
 clSguXXU9Cp9/momnLGxhbnfzN4b5UgJfeK5urFX1rg6/NjknlI+sQiTZs46s7pI2tcR
 WjrA==
X-Gm-Message-State: AOJu0YwwAiCcD/TeiCf6HPl4xTyXPulcKfXCE0oxKxE04Kl1+A6IBWlQ
 Z7EnNdE6WXIUPjNzyTjKrZIan8imxL1wmbFpoesjWBgn7ZwTFqtqQlxm5A==
X-Google-Smtp-Source: AGHT+IHOLE8KBrugja/GUFHeV3WluQxNR/JBXJeMPzrAGDU23/CfLP6VtlgGQa53417yeIImn9YSDA==
X-Received: by 2002:a17:907:3e0c:b0:a9a:154e:dd86 with SMTP id
 a640c23a62f3a-aa483487a67mr79325966b.28.1731644291616; 
 Thu, 14 Nov 2024 20:18:11 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e045438sm133491866b.158.2024.11.14.20.18.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 20:18:11 -0800 (PST)
Message-ID: <6736cb83.170a0220.84ec4.5644@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 15 Nov 2024 04:18:11 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731644292; x=1732249092; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5jHfhZN+8LvYPSlVJSstGl3Pq+UpYYV9xtTj8MgioZc=;
 b=gIzYWAAz1dcoi/hcD/2fZr/kJCeRI4mOmIlSiJsDCRJNqbWTGFEXLsSpQcu+ca6vrV
 u1SWrpRJmUrL6sx/K0zYN04yN/lENp6N7yAS91Qk/FYMDzhZH9L0cwIehlqtuW25byJc
 vpJgdl90Th6BqopIT9vNNEzGlblMgc4q3bCDACygNHUxQXdRkH1nBna5g8G9/ooa+/cf
 kRzAlDobuuqmqCd7haVNi+JT/dyxfUWeEnIHiXbjBkKNp0cRlnJTAXB3K4mVV6+9xEYz
 wcQ9xrfo2d2t835/1HgkAHkuV1vPkmJzqC+61zolerlP2WpwxM2qaiaF0/hvvfrFqaqO
 8mZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gIzYWAAz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-14
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

Autobuild statistics for 2024-11-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  3  |  0  |  8  |
  2024.08.x  |  3  |  2  |  0  |  5  |
    master   |  9  | 86  |  0  | 95  |
     next    |  0  |  7  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.40.2 | 6 
             dahdi-linux-3.3.0 | 4 
                lmbench-3.0-a9 | 4 
                   mimic-1.1.0 | 4 
               procps-ng-4.0.4 | 4 
                       unknown | 4 
 ibm-sw-tpm2-rev183-2024-03-27 | 3 
                  linux-6.11.7 | 3 
  gobject-introspection-1.76.1 | 2 
                 hddtemp-0.4.3 | 2 
              host-rust-1.82.0 | 2 
          linux-5.10.162-cip24 | 2 
               valgrind-3.23.0 | 2 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
                    azmq-1.0.3 | 1 
                  boinc-7.20.2 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
          cryptodev-linux-1.13 | 1 
               dvdauthor-0.7.2 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
              fluent-bit-3.1.3 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
                  giblib-1.2.4 | 1 
                   grpc-1.51.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
    host-python-greenlet-3.1.1 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                latencytop-0.5 | 1 
                  libnss-3.106 | 1 
              libopenssl-3.4.0 | 1 
                 libpng-1.6.44 | 1 
                  libsepol-3.7 | 1 
                   libsha1-0.3 | 1 
                  libva-2.22.0 | 1 
           libzenoh-pico-1.0.2 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
              mosquitto-2.0.20 | 1 
                    mpir-3.0.0 | 1 
                  nginx-1.26.2 | 1 
          obsidian-cursors-1.0 | 1 
                   perl-5.40.0 | 1 
                    polkit-125 | 1 
procrank_linux-21c30ab4514a... | 1 
      python-autocommand-2.2.2 | 1 
           python-daemon-3.0.1 | 1 
        python-m2crypto-0.43.0 | 1 
                    sslh-2.0.1 | 1 
             subversion-1.14.3 | 1 
                   trinity-1.9 | 1 
        util-linux-libs-2.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/35d2145b11f7ae346c3d9634e9853ca11826f3b4 |     
  powerpc    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/822e7981d62e0541c15e1cead758a6ad220264ac | ORPH
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/7fc43270cec8ea8c035e48420588e3deb41e354f |     
  powerpc    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/f9b0bfd663c3fa25b71711747577321465709831 |     
    arm      |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/1ca038310cc68a96bb6b47d2cc40caf53f6e5a85 |     
   x86_64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/7213c6f900ab1b25b153c20702411c8f1816772d |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/8aec247026ae5397fb7bec4a17765ea8c7400dce |     
    m68k     |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/cf0b4e27e98e8148b56850dcbabf43b529d15ca2 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/946ec7d8c396430e0a17ed06414c2f8d093b702a |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c69b21cb0befbb7e70b3f3d1034d753b9f4a3ae6 |     
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/02759c093432bca0a9515b01ac60a106e4bd167a |     
    sh4      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/22aed4d360c5a697aa0835b608a3380d46a72728 |     
    or1k     |        dvdauthor-0.7.2         | NOK | https://autobuild.buildroot.org/results/69448394360ea6b3e814ba5334a3fc6c61720c54 |     
    i686     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/6802929a818dba3e1ec21acf2d3ec905bf6faa45 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/d55fe2d642d7d2bc8ea31db98410b1d61f1c7275 | ORPH
  powerpc    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/84207de81ea8000c157cfb7c5c587ce75b1c2ab2 |     
 powerpc64   | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/43b5fd032e826ad0cd8a222224b9c4265ef346d3 |     
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/d90b9a4fec36a5fad1e7fb7e7e407d9e8d37489f | ORPH
  powerpc    |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/ff82f5b47774325b127eac424bcc33cdff46d31e |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9478430c4e82526c3239f458d81ae9c0e4db72c7 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/2d86f45e454c0976f500d2e6cd2cb0676e410d0f | ORPH
    i686     |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/885466ec3496715e1ee6bc22f9c6dc6b89d1aa6c |     
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/ca82da7b5a6c4324c61de32f0f663153ac2428c8 |     
   nios2     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/3e2fa19047cf928f46e1c438dd5924a99ce41bfd |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/7ab480e80eeaa2d057885805971842a5f2f8022c | ORPH
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e58c2136deecd46f3bc88c115bc6baf617d6a1ae |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2ac4d821855d19bba8014a3908d5124e4ea9d062 |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/2aeb327592420a4c7403d8997fbd2266dd557807 |     
    m68k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/f3680fe1cc3ae9d5ce4b3b568ee5ef1f64fe9296 |     
microblazeel | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9472c7ffd61aa53672872fe8dd9861e78d4350b8 |     
    mips     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/61a412fa75fa252266db5466783a9f49d019a318 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/00e4f7681ccbef200c66034dd424f5177a6b47a0 |     
   s390x     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/f73eed7ccb574e428b403c22370184eed0979f47 | ORPH
powerpc64le  |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/7a5c40312d5a8d5f74ba0e14cebde3759d20a519 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/48b8d332f3a4b1e10feb39fe65ef2e4fc15f37ae | ORPH
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/52c974e70f922e9d7efea4c538e4438a22faa846 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/5a57d5d0742a6042fbff174f470d06e862e713af |     
    or1k     |          libsha1-0.3           | NOK | https://autobuild.buildroot.org/results/ff88700d469a2fc63de3d84592e2baf43be0219e |     
  riscv32    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/23df03bca7c8cae550f45a5b4bde200fc713c444 |     
    arm      |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/bd157d77becbffe5a5587c8d20d87c1fe8dd44c3 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d79872c03d6576afa04c88c612e514b7d8b6ae30 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/66ffcd3c5989e3c2476805f7ae597f29f566c1f4 | ORPH
  powerpc    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/c1b0db3af868d83f88b6f53dfdca4957b4a2eccc | ORPH
   arceb     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/ece865b2617b6981d7af49afd6ba84430a3e2fcd | ORPH
   sh4aeb    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/8679784d4062c1722ae1c78b3b79ed03bd955724 | ORPH
 aarch64_be  |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f1e07843766f6a8f829789aef8f3e5ea7749579e | ORPH
microblazeel |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d38524f9deb520718eef902bc6180b1de9546ac6 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/53ca4bf1e12055be6bd5d5333acb585b031f5cb1 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/53ac5a136dc7e1477ecbbb2f10b33caa9a849549 | ORPH
   x86_64    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/148af61a4de441cfac24fb33f3e22e0d76596ce1 | ORPH
   xtensa    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/e84af9c2e75f0d3dffd6b865254c7e5e9e9acd04 | ORPH
    or1k     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/26a8bded9394a44d0d6eebce7267f6a51a60c3dd | ORPH
    or1k     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/ec98a9707b05330bff099a94fc648a6590ef729b |     
    mips     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/232a89bcab950ffaa790a0893c4ae990d1ec19c8 |     
 microblaze  |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/7cb9e72706ff520071e7a592529498101f962b7a |     
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/4dd1f900c825fbc7c8ade073724e4df2111293a2 |     
  riscv64    |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/ee8899d01b564677f463cdc7fa9125224d8af897 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/eb3c469f2cdb9d36d3cd7f98e6f778e6cbb1f645 |     
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/de1bdb8b859c6f1403a4982d8690117d74a08e8a | ORPH
   mips64    |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/6844f4d1f8a1dd30d0d14ccf4e0e5961be61f416 | ORPH
   arceb     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/db54b53b2843ffaa6a152455546e1d25f1cff9e4 |     
    or1k     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/0644544b41f47a7811449c50c0445c98537348f3 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6c30531b69766b6b92c0e190fc25e496a862a756 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9d14d765128453e7176bbf331a7be5e45cd1ef9f | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/c9c6937ab623dc4f70da2c2a894cad7550c3d628 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/38027db3888d3c934c23f15645d291a8e9cae9e8 | ORPH
  mips64el   | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/8e6241efebb166ef7eb51a6def29567bf1c1467c | ORPH
 powerpc64   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/eb02b5d10289e15e8ac125cb8ca032e4e9437405 |     
   nios2     |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/827f123624bebdb187edae08b2a8b1429012ccc5 |     
    sh4      |     python-m2crypto-0.43.0     | NOK | https://autobuild.buildroot.org/results/1d988b9463fbf52c09c60415d7c77074947650d4 |     
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/72e1de295c6870351719ae227511c608f2663581 | ORPH
    arm      |       subversion-1.14.3        | NOK | https://autobuild.buildroot.org/results/b4144d7c8e199915d3dee9410c373f5f291b6927 | ORPH
  aarch64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/7513949ed24277d87742977928016acefe336336 | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/4b40a32eabcdda837099fb3fc30081f7d16a1c67 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/704c45d0373b4d8845a81a38a834dda8e8ece904 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/cc20e2cc5a988c5d571efd63b87e5d818e9b7a43 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/036cf4caf4d6a188cf2fdd775c278dd5ae8e2b39 |     
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/ba34022f07af9a868bb801fd7f89cc72aa0f90aa | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a034aba986b377d190e4ed3d303ca2032cdd70c6 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/95d346fdd38c93aa284886375870dce27f045ee9 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/4d733b703b8d38e36ab2bdd095833ef17065b8e7 | ORPH
    arc      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2ff69ce23acffc73f8143f1c9c85881ee0258bf9 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/106c5aa6c11b08b0b0963d99ff28e06f309292e9 | ORPH
   xtensa    |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/06ddd61ff1925017a910f45d25ed4ff2b55337a4 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/5d7cc01843b495196d1dd21e42214b36cc622d8e | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/2369088ff29f34d50ca161cd4e916f20e174bf3b | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                 coreutils-9.3 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/970c24938b2d9664894a562ab09b9be40f1b037d |     
   sparc     |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/903f0dcab1e34e2a93912ab3f7b45e1d285bedca | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3e460e8849e57e6ab749dfe720e5fec4e02304ea |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

           host-checksec-2.7.1 | 1 
                 linux-6.10.14 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/bbc130fb716a859fa2523a1da48840ee2f1619be | ORPH
  mips64el   |         linux-6.10.14          | NOK | https://autobuild.buildroot.org/results/9070cabfb35767b13bb001043d71c9cc8ff8d186 | ORPH


Classification of failures by reason for next
---------------------------------------------

                    brltty-6.6 | 1 
                    fcft-3.1.8 | 1 
                  ffmpeg-6.1.2 | 1 
        gmrender-resurrect-0.1 | 1 
 ibm-sw-tpm2-rev183-2024-03-27 | 1 
               procps-ng-4.0.4 | 1 
             util-linux-2.40.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/08dd7500a19716f8f7507abc99b34739b22ae8aa |     
   nios2     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/847cf66d2974778e73f1d7afbb8e62234ce15a97 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d95926fb6a0a70260d2f35a6a48fbc7d4b1f7bd0 |     
  aarch64    |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/da0af6636b8b1ad96ec6ba8cd1854d652c3ba8cf |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/b73f2a03a403aa71fe550c5d9379f97838421f35 |     
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/8de9f72978124dd7f0bce2b30666fe3faf2d6bb7 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2cfe6c4d848fa0691256c0c436492f455a4976f5 | ORPH


Gitlab CI results for 2024-11-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849262  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849527  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849625  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849653  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849668  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849697  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849783  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849810  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849947  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355849981  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850162  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850192  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850253  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850314  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850470  | ORPH 
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850547  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850687  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850744  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850769  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850775  |      
                      cubieboard1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850785  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850794  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850804  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850825  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850857  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850923  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355850948  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851147  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851238  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851357  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851410  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851417  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851430  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851438  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851533  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851539  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851556  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851634  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851648  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355851734  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852008  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852064  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852085  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852088  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852125  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852130  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852134  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852142  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852149  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852154  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852161  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852165  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852178  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852260  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852377  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852385  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852391  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8355852397  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
