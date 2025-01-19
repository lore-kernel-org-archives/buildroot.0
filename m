Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE902C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 04:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C6441283;
	Sun, 19 Jan 2025 04:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQlJu7sor8i5; Sun, 19 Jan 2025 04:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE84141278
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE84141278;
	Sun, 19 Jan 2025 04:14:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 524DFD2
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 04:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38FC383F3D
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 04:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsMcanUCTMW5 for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 04:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E68D83F1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E68D83F1D
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E68D83F1D
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 04:14:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so554256266b.1
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737260069; x=1737864869;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eRl3VpHGGm0stcTWCnWI5o/x+a6y+Inet/UURcq/+2U=;
 b=pDPM7fWgepnxTJeK9DKbvjwg4y3A4icPJ7DwKD2XjvKq5Q6/LoYXGWm6thSXogpEWN
 RJdQnPA1KukEKuZTiDrD8gs766CqQdLXC3Qq681sOAZXnKaAnOKHioVxIdOxhMY/pNXw
 eN+qbbi22A4ee++L9hgtIn2mOkTW17lmR7s7debilQ8ox5OMcyQ2NSENPI+7IHMGYQlg
 PojO7Joto0H0xYahccCxceBU+aNaBoaYgFvFKssxnTC022OO7qJv/rSObcjnNMaSFoS9
 VzaU4XtVePGjdLT/1l7WbV+NiYCRdXBipImBrPi+jToSsmwUmwmC/5bdbcxODud1ZQt6
 /6gQ==
X-Gm-Message-State: AOJu0Yz7U+Rsvb9DCIOO3QHSXfOFavsRPFE2zYMOm+qg+DIHzQ9rQI98
 QMTn55C8/AInjFnGzQy7hi27SpLmnlUut9RlCslVBKKaAFhU+npv27IWGg==
X-Gm-Gg: ASbGncu1JDkrqt1fNN1adSe0RG50K6V2fiSIdX7BKfsqFitdwKZQt/n+eNbxnHt22F0
 6UmP8n19UDG/iBxr2IqLcfQx0N0MbxOqu14jvaovFRD9zRhvt2Xoy2BF4PupCEIf2QDM0KnWmJS
 wZizbrkhqEl8QbFwcjrsn6zNO0cD5YMlxuuLxxla/eJ38n3b1yrdZ2AztJn6PEZWblBkfLJ9vhg
 Qje0bMVZhfm+cPm2tSr4DvPKmE1mOHAmXW0Ge1nzn8qfGCgEN0RpxsWpFB/yhrZ1UXysd+2UA==
X-Google-Smtp-Source: AGHT+IHLF5CjMWn3g/CqfgVjU3NM5Etv7yd3nIqUapt3ktXSJ0cCwNsiMICx46KU5Quwo+cGgsB4dw==
X-Received: by 2002:a17:907:2d2a:b0:ab3:ed0:cda with SMTP id
 a640c23a62f3a-ab38b191674mr773572466b.9.1737260068861; 
 Sat, 18 Jan 2025 20:14:28 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73eb5b9bsm3817157a12.55.2025.01.18.20.14.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 20:14:28 -0800 (PST)
Message-ID: <678c7c24.050a0220.3677c4.a575@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 19 Jan 2025 04:14:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737260069; x=1737864869; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eRl3VpHGGm0stcTWCnWI5o/x+a6y+Inet/UURcq/+2U=;
 b=M6Rbl8cLeobftWfv/Kk7DHLiXnPvQYwPX3oo9jKsdAVw4RcvMPWJVOryvVlYooTZWX
 B2Oco+fzNzCGgBE8qS6h9J+PoC7x2YpJw17GnW4/L05j/5fsMDuFT1VyQ3tLOorMAUAN
 Xqw49s1zPfcxgoFgHWI1tvAdyIHAyhOw1S4P83bQeM1tXhMpkRcIIX/TS7Mcg0Jy3b57
 +dAZ2NHQE1QqeqJJmWWtju8O1r4uhRNtSHIiiWms3C/s8TBya/Od1fB5+sOOdVuciwSw
 QsYx2cKA/NywdFoMtpJEjDqpYdIPpLOKejT7B7vxQ5UMGVhJTil1ruxdK/ed3HHrADcm
 wjMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M6Rbl8cL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-18
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

Autobuild statistics for 2025-01-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  2  |  0  |  3  |
  2024.11.x  |  3  |  3  |  0  |  6  |
    master   | 11  | 57  |  0  | 68  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 5 
                    brltty-6.6 | 2 
                elfutils-0.189 | 2 
                   foot-1.16.2 | 2 
              host-rust-1.82.0 | 2 
                  linux-6.12.9 | 2 
                   linux-tools | 2 
                   perl-5.40.0 | 2 
wilc-driver-linux4microchip... | 2 
                 agentpp-4.6.1 | 1 
  binutils-arc-2023.09-release | 1 
                  boost-1.83.0 | 1 
                   bullet-3.25 | 1 
                  ffmpeg-6.1.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                  fwupd-1.9.20 | 1 
  gobject-introspection-1.76.1 | 1 
   host-mender-artifact-3.11.2 | 1 
 host-softether-4.30-9700-beta | 1 
                  jack2-1.9.22 | 1 
               libdeflate-1.22 | 1 
                 libgee-0.20.6 | 1 
        liblog4c-localtime-1.0 | 1 
                  liburing-2.6 | 1 
               libvorbis-1.3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   llvm-15.0.3 | 1 
       matchbox-keyboard-0.1.1 | 1 
                memtest86-6.20 | 1 
                    mpir-3.0.0 | 1 
                  nginx-1.26.2 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
                  ramsmp-3.5.0 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                sysklogd-2.6.2 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
           v4l2loopback-0.13.2 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/8a53df36f37c60cd30698a64ab066294e16e1410 |     
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/653909fd426d8da3923cc761191100b01c2dbde3 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/9581de654c89a15419e963866eb94b4e92301316 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/9227dd33aa48eff6752fbddc2c6fd964c72a43e5 |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/746a792e6470716c27e1b6febff35a5872aa7739 |     
   armeb     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/9422f9681c2329cf199aa85de597d5477b7dc303 |     
  powerpc    |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/542abee57250e809420f9ebd83f5539b9622a05f | ORPH
  mips64el   |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/4162e711ee2a7667ec1e0164738831b061b78e62 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/42dbfb67228ee6d62e946464a0c11b88a5b89554 |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/503eef80a7b6502d107b14c51052de303185f0d6 |     
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/c093db1c273e69d8803e12993970af6bd3730aaa |     
   s390x     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/005ff44dd87a7bf69d6d7ab8b0eef5b44f01bfd2 |     
 powerpc64   | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/d1521bfe5b136ac87effd27db1cf9adeb8c32765 |     
    mips     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/66d842648a18768486ff630a49759e771d2f2f64 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/5f8d2fbc2e81f8da804084ac7b25ca4fdaf6b4b3 | ORPH
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/52428fbe10a6cde1d3c0dc2c7e1b23dc257b11ab |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/d36ac58bf6e5e1ba0fecf43a500e218b1c2b4949 |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/123570906cb63da409dd2fc00bc5cb60bffeb329 |     
  powerpc    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/6d7b2a5247f04694238856a15c29a567662e019f |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/74dfd2f4c083eb59090d424a0e1724db3fe05f35 |     
microblazeel |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/505acc590ca5fb5e9875b3dc47cde061747012b8 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ecf7df514fd7eb3987a257418c53e92483f94e59 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/da4163133e4ed41cbde77e0a0fbd221f457f46ef |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b9077b145fb608faf8d9d00169a89794a303bdfe | ORPH
    or1k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/11172ab491bb8ef055ca9a62f4406b011759b9b7 |     
  riscv32    |        libdeflate-1.22         | NOK | https://autobuild.buildroot.org/results/0733f70e35e297fdc90336789a9ff6660058150e |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/dd0e2ead9c381c10c3603c662e15595aba0a959e |     
  mips64el   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/da49d6de85d516bd2941d3719879d9d18e4ef7d4 |     
   sparc     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/4a811e060e95d57e486ad6b4b5f120ab41995534 |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/429c925bfca294fabd6be658a0fbeafa27c7885c |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/a7d274e699970aaaadb6386e2e85fa10fdd4fcb7 | ORPH
 powerpc64   |          linux-6.12.9          | NOK | https://autobuild.buildroot.org/results/6ba93d7f6a8e21b920dcceaa2603c590c8899cfc | ORPH
 powerpc64   |          linux-6.12.9          | NOK | https://autobuild.buildroot.org/results/dcb8bb7011f3b8b87484011ad0024124af5a78b0 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/df2905461e182853036525b4f34b62d3aa977920 | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7b0a22863264e05d19fccf243698cb78d1e8c9ed | ORPH
    arm      |          llvm-15.0.3           | NOK | https://autobuild.buildroot.org/results/553465df111266db0b87be526e9dc7701d4ba586 |     
   sh4eb     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/5cb6bb104ae70226e966372915348c66160a1633 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/26e089fb1e995c253bfb12eb51ee82438be94499 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/72d64989521186368e7068a729b819e626d660cd |     
   sparc     |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/fe0b5928632029cb5d20df80233382c4c31b0cd6 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/663287bdbbe00e4b5baa88e9665662f31bbd3e24 |     
 aarch64_be  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e3974dc01a7c157c0e5d660d665a1462e5e04859 |     
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/703e92a1da737bf709f827fc59e4f6e5ce969118 |     
 microblaze  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/033e06ddc8ca6c183c237bf276e686b9377d476b |     
  powerpc    |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/36f22ec649ad49357dcc874f789f13b1390270e3 |     
    arm      |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/4bdc6f709fd6e6c3977f0946fc979e7b12bebc05 |     
  powerpc    |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/a96666b2c5b5a0ffd1d96ec3e5274df557742c76 |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/c17a9128103285b9d022df87cabd2bdce1421088 | ORPH
   xtensa    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/f1f198498157a1c57070007dd4c21c3a2621aa56 |     
   armeb     |         sysklogd-2.6.2         | NOK | https://autobuild.buildroot.org/results/7d1dae2f0beed13b9954b03378c02e5a0b9dab79 |     
  powerpc    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/eeaeeb26081794e4334c79441f6372806a5f21a3 | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/80b75cea90f52999a30ab5a8f91f60326a3d72b3 |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/428f85f46321f95e22244d745bf3ca5f34e43fdb | ORPH
 aarch64_be  |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/e6043cf372edab2f201b402855b0be2d587814ee |     
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/dfe2dc6536e6b5d515952e2123aef24473f2c61a | ORPH
  mips64el   | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/e1dd7bac2be21bb7df63959970b1f52708bd18ad |     
   mipsel    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/15fd5009e20c8fd6c68c5ee493297bca02a6de7e |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 enchant-2.3.3 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         enchant-2.3.3          | NOK | https://autobuild.buildroot.org/results/f0ca9e5db6a77e5a466e7d24b3ef086647506453 |     
   nios2     | fs/axfs/axfs.mk:32: /home/b... | NOK | https://autobuild.buildroot.org/results/1a533c6126b0b7358b37abb77fea1dd94b9ab87a |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 1 
                  fwupd-1.9.20 | 1 
                   nanocom-1.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/339f86a0c088b329e583752f951168b499f163e9 |     
powerpc64le  |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/eb2b01a59ff64479bb541a7a1e33493e75b49518 |     
   sparc     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/f598dabb0ae76aa7cf550716a2b1bf60c730029d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
