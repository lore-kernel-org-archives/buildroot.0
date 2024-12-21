Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63319E77184
	for <buildroot@archiver.kernel.org>; Sat, 21 Dec 2024 04:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F73A41383;
	Sat, 21 Dec 2024 04:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcu6ZIe2YVSS; Sat, 21 Dec 2024 04:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 707774139D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 707774139D;
	Sat, 21 Dec 2024 04:14:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B0566C
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 04:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BE03834E3
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 04:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX2LqjSsCBLV for <buildroot@buildroot.org>;
 Sat, 21 Dec 2024 04:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D1D980B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1D980B5A
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D1D980B5A
 for <buildroot@buildroot.org>; Sat, 21 Dec 2024 04:14:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso494383666b.0
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 20:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734754483; x=1735359283;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7WCcvcTG6Sca4kp+mrIw43uJBXNlKIcRkjiOSupGtRU=;
 b=ZEq1T7f+bazq047gyNlkmNMVdrD7izrKp69Te8MEeKsxUinaxnZlUIuVkuPI8OpRSN
 1cBZ2krC6n6OMG+qh6utwO277UKCoGmh5QXksiWc5BDu3Bz8ep5xP/rf6DLmWl9NoazC
 au+DRcvslYOZ4xxdjva1DN8z//6Br1A5z/0kHV2pNJgbW0OITs75ORyEj/ZkdEo6XHqG
 EaHSMJ3jt0r6n0aQD8ISvaZYWwHUaU1Vkdp6JMtyrNjSwUul1Iw7rXqJNDkb8cfgauht
 2QYU4PFcMXbEvc+pduUZdclU/ppyLBD/E4f26MkLwc6AUY2MtEubn9l4ju8GyZr2QbVg
 PHKg==
X-Gm-Message-State: AOJu0Yw7r8bDMvNeRQ8QLYIifpNz5yJ6GDDLkutrcza3MtKQ05kxnP2X
 Sg8ypUOkDXNuG9+48SQPBAH5JpyfWh8AHxFANF188Dkrqdt9Xou5SZk2wQ==
X-Gm-Gg: ASbGncspVkJSdY4j/wKjk2GvyaPydZpQqqGg9Uzxc9hjLxOiILDXExHhC60xe21Tddp
 S0zshidBlOcYxFHp/erjlEU8EsVlQlLE+Z0SFO5ldrvAfaUrQvK6N0DxniQZfE/j2U7RVeOmpr4
 USRV73sCZ9hvJGSdBFcgvLshWLecb0CndYQHID3gE0C7Q9QS/jDEa9If6kwy42P29A8wehorpQI
 SwqRLecvCXzjZHOSLrUtwP5CUoVywomZjBlJAWwa7xvCn5cefM4tR6Ve64i
X-Google-Smtp-Source: AGHT+IFAsVernpaP6TUa/EtqU0sHwKMsfjRHkBNLlmB9sXlw3eQLFM9fOhOlFn4XHJ2PXwiOmAlx+Q==
X-Received: by 2002:a17:907:704:b0:aac:23db:af61 with SMTP id
 a640c23a62f3a-aac2874937fmr526700866b.3.1734754482723; 
 Fri, 20 Dec 2024 20:14:42 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a72asm2309910a12.8.2024.12.20.20.14.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 20:14:42 -0800 (PST)
Message-ID: <676640b2.a70a0220.31215a.95cd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 21 Dec 2024 04:14:42 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734754483; x=1735359283; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7WCcvcTG6Sca4kp+mrIw43uJBXNlKIcRkjiOSupGtRU=;
 b=BOcWK1f/OZdMgSwD7u7lHyBM+u+tlK6pqbNAeAaEvGD5eQCWjGPbZKLlXzKvxGq9jE
 zyBH08oCczihRDR5uDS+5ldktCLg7KcyjuacoLEBrBM4rvyqB82MPnZYfPbbOpBOx5hU
 +te4Gr2Md7QgY9iQ9+VCiJpwDOHqjk+C907YWtncMzlWBDrFylJWnT9vGayt0MRCQ5+V
 zH+45q+4NdNReePg3QK1mBEh7lqZ4QAG0JkOANre5e/F9V6fRSeS3N73bvKQoizHRByx
 i+VyqxtBZeiobXHnxuMj9pz9cWILavdYX0gpxh83thisu5Hr7APsq0HvSDZvPaaDvR/j
 4lbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BOcWK1f/
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-20
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

Autobuild statistics for 2024-12-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  4  |  0  |  5  |
  2024.11.x  |  4  |  4  |  0  |  8  |
    master   | 14  | 55  |  0  | 69  |

Classification of failures by reason for master
-----------------------------------------------

           libzenoh-pico-1.0.4 | 4 
                  linux-6.12.5 | 4 
             batman-adv-2024.2 | 3 
cegui-00b4e1fe174da53b7ed72... | 3 
          linux-5.10.162-cip24 | 3 
                  bcusdk-0.0.5 | 2 
  gobject-introspection-1.76.1 | 2 
    host-python-greenlet-3.1.1 | 2 
                memtest86-6.20 | 2 
                 opensc-0.26.0 | 2 
      python-autocommand-2.2.2 | 2 
                       unknown | 2 
             util-linux-2.40.2 | 2 
                     ace-7.1.1 | 1 
                   bullet-3.25 | 1 
                 c-ares-1.34.2 | 1 
                   cvs-1.12.13 | 1 
                   duma-2.5.21 | 1 
               dvdauthor-0.7.2 | 1 
                elfutils-0.189 | 1 
                    emlog-0.70 | 1 
                  ffmpeg-6.1.2 | 1 
 host-softether-4.30-9700-beta | 1 
igt-gpu-tools-0ee4074685c1e... | 1 
     linux-5.10.162-cip24-rt10 | 1 
              luabitop-1.0.2-1 | 1 
                    mpv-0.35.1 | 1 
                   nanocom-1.0 | 1 
                  ntp-4.2.8p18 | 1 
                 openssh-9.9p1 | 1 
                 pixman-0.42.2 | 1 
               postgresql-17.2 | 1 
               procps-ng-4.0.4 | 1 
                ramspeed-2.6.0 | 1 
                      x265-3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/7d0b04e360734007fbb0b0e16f7d458a9d0f31eb | ORPH
  sparc64    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/aa9ae9cb26f3538c14f1476f6e558e5dc37f7296 |     
 powerpc64   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/5f7339387b3caa550e89f2cf912a31d5f438d17e |     
powerpc64le  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/6a27dea1b1ff75d7e68abaf0e36297283aac26d8 |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/85819180b45bbc35a772c286c4addc8a756f364a |     
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ee7b6cc5a8e2f0a8d38b0d69fda033a1948d5fb0 |     
   arceb     |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/dfe7f4b47b6d94b538dfadf6ec776758fdebe9c4 |     
   arceb     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/62dd03895b06bc580d4bd71330763ffacbb1629e | ORPH
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/bdfa09dee6c243309680e5e3c847acd3e4fefe32 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/3279067c35beaabd2f63735fb13471a7fb033ac7 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/c1c47cf39b58f3ee69fa6a3cd3271d2702ba061c |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/169636208df2f564f8bcbc1b92b863edf2dd6910 | ORPH
 microblaze  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/cd1163e6e6da8619eec157a045999b33e588c832 | ORPH
    or1k     |        dvdauthor-0.7.2         | NOK | https://autobuild.buildroot.org/results/fdd325ec2f032ad356af038448112d5a2ebf6358 |     
 aarch64_be  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/29502fe97a15e4926de7cf129b641505697de9cd | ORPH
    or1k     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/93d7de9ecb6b4a964385a51758c6e496d8d9b486 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f9ec6d588f446bb9ac89838a1178e031fef7b9c3 |     
   mipsel    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/0e86c1235d34727adf20b539338478f13dd29ec0 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ae5f28363a922e95597df3df77976e2d6f26d045 | ORPH
    i686     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/247d5c0ccdf281624b28f6cd083efbf246f6cc33 |     
  riscv64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/45c8d14ecbafc78b40776b2269c65fa19b35689b |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/da83e1a5de041993cc107e42accc60f0be1a6cdf | ORPH
   sparc     | igt-gpu-tools-0ee4074685c1e... | NOK | https://autobuild.buildroot.org/results/85311ce68ae1fff771ca00b434be1c4f8453d357 |     
    mips     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/3008c373d42703cc6b05f1ade90bd9698f271708 |     
  sparc64    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/134cd794e9b0ed6ac914d8806cf5ace19dadcf5b |     
    m68k     |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/688a73727b93526872489a2cc20265ac21be40a9 |     
   mipsel    |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/4b4a41a7c19a9d1e0ecc48b4d8f0d0922afc9502 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6b76c58dec73042d034b00071dfab628f7a87111 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8765947545c8bed415391d420166d4595d7f86a5 | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/9d01ac3d639e80b832510d6538f68a290327efa3 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/58ed8111816fe0486a8eebb961d3f232fdbcc933 | ORPH
    arc      |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/b1d955ab0c1e46f1658bc1b45a6a987efd08ff73 | ORPH
    arc      |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/6f51a52703880f5bb9ab548fd53c21fae0e0ef03 | ORPH
 powerpc64   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/af3d246dbda2c4a7cbd8aef4185b2d6439892f78 | ORPH
    mips     |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/03f9c33faa5d6ca60347e5a623709a19043e402d | ORPH
   s390x     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/5b3640e631110d6e659225c3f858031ad460a27d |     
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/5a0fb97292c001dbc2ce3a8b8111d1775c02dbad |     
    i586     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/8b6d9e2007f01f2fc411fc72f3b8df620dbe9117 |     
  aarch64    |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/68d42441fc0da34e1bf2a4247726f5f4ec3b8e77 |     
    m68k     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/90d601139832d7a2b02c1de161597221cf7969e1 |     
   mipsel    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/28da7729e3023abbb3896cba36413bcded40a4b1 |     
  riscv32    |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/bd0425b9289409f54ff5f07f820bfdfdfc1fbd23 | ORPH
    or1k     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/c13e1b98651b1ba76b9c746c7ff99a4c3519940e | ORPH
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/10a18473be44a14f37c35a1b08e8d4a2ef1ba9b1 | ORPH
   nios2     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/bca6abf060b9b54fefab7dc8b9f29e3005008631 | ORPH
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/2a67ae9922173064a9e1153e28b5852049d511e2 |     
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e08ba53060f90b2823e639c9ae2c3ffb5f0dc782 | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/5b45287262133fe209bd3a62167ca5da7bd2783c |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ceeb973e7677e971eab75e3730e267e7178d9ff6 |     
   mipsel    |         ramspeed-2.6.0         | NOK | https://autobuild.buildroot.org/results/2c412b0c6b2997e6d4684056c2be07159b9f8da6 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/445e8ab3c7a84720de3984336a3d88244a041989 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/209bd4dbbd5bdfbadceab2b23c69a0e5d1344a5a |     
    arm      |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/659e4fa3268a030247d6f2095d62e8e4b717658f | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2ec4e48e28d3c1c4578acdcb687c41dad89026c9 | ORPH
    i686     |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/a3867bbc33b0526472fab37bbbbb98cd8c4a9a91 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 1 
                    gdal-3.8.2 | 1 
               libglib2-2.76.1 | 1 
                libressl-3.8.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/4718dbe7c5b1d856ec5859f620d7b1747bdf1740 |     
 microblaze  |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/5a43bfd72493e494dd2823f8ce07726d59a18cfe |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/bbe0dabb319d7aea6c3a44377a0311d02827bfbd |     
  powerpc    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/2981066c966acb88d1525e9a2735901c5bb93bff | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   bird-2.15.1 | 1 
              fluent-bit-3.1.3 | 1 
       gst1-plugins-bad-1.22.9 | 1 
      python-autocommand-2.2.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/373be96d4c3a066014dff811393103c7470f4177 |     
 powerpc64   |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/d209948cc8c5770ce036211d643201bd58a72d34 |     
 aarch64_be  |    gst1-plugins-bad-1.22.9     | NOK | https://autobuild.buildroot.org/results/b3dfc42f77e10bfbbc24a92db1269492af3b14c0 | ORPH
   mips64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/1c1701fd8148ac7cca8415d4f3c419205d1b3610 |     


Gitlab CI results for 2024-12-20
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956326  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956415  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956420  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956444  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956459  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956577  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956674  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956710  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956723  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956736  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956738  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956757  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956761  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956770  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956792  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956798  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680956992  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957066  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957082  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957229  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957234  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957241  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957277  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957285  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957336  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957481  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957502  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957510  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957515  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957523  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957526  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957551  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957554  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957558  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957559  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957562  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957563  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957565  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957569  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957571  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957579  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957581  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957629  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957636  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957640  | ORPH 
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957646  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957654  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8680957689  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
