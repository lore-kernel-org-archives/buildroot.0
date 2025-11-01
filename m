Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC49BCCF9F8
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 04:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6520C84B98;
	Sat,  1 Nov 2025 04:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdixqqXXYiNF; Sat,  1 Nov 2025 04:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF5C84B28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF5C84B28;
	Sat,  1 Nov 2025 04:20:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 577842A3
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 04:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4990A84B28
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 04:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZllApECQyTDT for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 04:20:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B883884B24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B883884B24
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B883884B24
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 04:20:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-429c7869704so247598f8f.2
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 21:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761970825; x=1762575625;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lr5Qb6wI1e4CDpY2Vj9WxiUWdtYCVjfpw9EHJLasmjU=;
 b=hd8pwH/kqxm1SkIC2/qZvGDHicTJWYiujbvIY330854ZI0FGLUQmzq5ozKEG1bG0dn
 RBpWibBTC+yVdQ+Le81zmgRy32DmuquYMdwSp/Q9FtiOOACd7uu/R5tGxwin/zqlzk5J
 yvl+OdO+XQzSgd6XFb2F0fi9c4ek/hhCpplms0Eznzk8ucpj+iRSYJka37tfyJzt25Bc
 wVvytx+hCchp9iR+pu8J2MUNK4m67DPyDCQ8YGpk9+VOODn/MjwfCcxPi9rlNrcCLm0X
 IXcVLti23saIVQYbbmuMd9hZqtXYn/tRcPlf9H85Sj4Fmf8+cc8C34Cwp3QbAPisSlYP
 Znxg==
X-Gm-Message-State: AOJu0YwoqUeJ/tr0V+HutsbX3pn5T71ZIAyS3kQaO+PFhNPjnjWViWPR
 4K+nGKyVD9k2/s2ipTMUhVYy6yeqTM4QIsICNULYquLZb9GZsoL/yshFyNvEVg==
X-Gm-Gg: ASbGncsj1vr7alZbEmwXySSh2BcXQ2Bmw9fZpXU1Cw6VWQ2tS9em1RKQhda/egPm2Vi
 lpu54Cz9HWIxBevRpOuU36aYIJ+rVbujn90zkLvV8Se9vTFZXCzgX+RqHBPqhuWChoPMNvf/HBt
 Dy7syD6xmVlyF2K2vfzga3zAoBja7qF8cn32dS2Bam1YQy5+ScGVLqoUhb83abTegPrk1BmQ5xA
 92ahowVZvbRsLxxphqPjNfp+EWTX6NjLHdk3vBHlJTqhf/d06Omold4O3dhLa4BNvCm+Y0PLbCG
 IvnB9PAhV+33TKNermXii+mHNncTnPswz8aBzb3z7+AIYvx/GHBF3rzzOunmFRAuGRbOAim+m0e
 uU5SkDXU1G/uk9byoO2qNuLWKYquDf6r91aLL0dyW3xWSmEINbU2K74rHcrMkXtFpUdlCsoilVk
 K0zP0wX3vYqRlVy6Ev6w==
X-Google-Smtp-Source: AGHT+IFwIYuuH/Twi/pdaoG55MolC/7ZtfePenvX0Fje6XJKol50rae2wAmPXVAbhK4Bv7Nydpcu5Q==
X-Received: by 2002:a05:6000:2084:b0:429:b958:218a with SMTP id
 ffacd0b85a97d-429bd68ba54mr4823110f8f.28.1761970825257; 
 Fri, 31 Oct 2025 21:20:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c54efcbasm3347756f8f.8.2025.10.31.21.20.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 21:20:25 -0700 (PDT)
Message-ID: <69058a89.050a0220.873ac.a848@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 01 Nov 2025 04:20:24 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761970825; x=1762575625; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lr5Qb6wI1e4CDpY2Vj9WxiUWdtYCVjfpw9EHJLasmjU=;
 b=C/w7jI7JP3x5dKmDQLzQ75KaJrmdbG9NG9QBrmIDFuBC2wZODB7diFGViTa8B7iuNh
 FSldF6bv9g4Vs38mEqddMPdGAd375dhFCx8BBnt8NKVi2W+XW/vSI/LSbPsWl663qpdm
 +vZKwmwIiNI5tXFAcD98FgdD/iS7O+uf2nR7hkQ5LwOKRMJn3CZnn24RzLBByIJq3Zht
 Gl0RpNF8dPQykBtGSzsuZT2fIhVryIjTWyPMMCBOWI0J9kTFmgdINlYN3qroguvENszX
 eYzCb7Bc+1gFPD1sQ5wt0mo7ZDRxVzVB/okPtLAkrgtqQA/be8MJZDjpqCVtcjXUROQj
 lwxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C/w7jI7J
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-31
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

Autobuild statistics for 2025-10-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  8  |  0  | 13  |
  2025.05.x  |  1  |  1  |  0  |  2  |
  2025.08.x  |  1  |  6  |  0  |  7  |
    master   | 35  | 67  |  0  | 102 |

Classification of failures by reason for master
-----------------------------------------------

                   libiio-0.26 | 5 
                openocd-0.12.0 | 5 
               bctoolbox-4.4.8 | 4 
                netdata-1.37.1 | 3 
                 c-icap-0.5.10 | 2 
             dahdi-linux-3.3.0 | 2 
                 host-gdb-14.2 | 2 
           host-openocd-0.12.0 | 2 
             libgphoto2-2.5.33 | 2 
              libopenssl-3.6.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  linux-6.17.6 | 2 
                openssh-10.2p1 | 2 
                   perl-5.40.2 | 2 
                 agentpp-4.6.1 | 1 
                   atop-2.12.1 | 1 
             berkeleydb-5.3.28 | 1 
                   ccrypt-1.11 | 1 
                   cvs-1.12.13 | 1 
                enscript-1.6.6 | 1 
                      fio-3.41 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.16 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
               graphene-1.10.8 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                 libiconv-1.15 | 1 
             libmanette-0.2.12 | 1 
                  libnss-3.117 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
               lrzsz-0.12.21rc | 1 
                  ltrace-0.8.1 | 1 
              mariadb-10.11.11 | 1 
                      nbd-3.25 | 1 
      passt-2025_06_11.0293c6f | 1 
procrank_linux-21c30ab4514a... | 1 
           python-numpy-1.25.0 | 1 
              shellinabox-2.20 | 1 
ubus-afa57cce0aff82f4a7a0e5... | 1 
                     unzip-6.0 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/916d7a0b0826398c696590b82e42693f635564d6 |     
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/8003533fd76262705422613c0e04fd558019f300 |     
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/dea16953574dceb435c62c4e8d6f09df98050d8a | ORPH
   armeb     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0984342176f503504e65abd481e5a2212b1bcbdf | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/3a59931f5c1693af3bc54763988264b410b39d0d | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/0009675a990002a74ab7ae63f48f406a4430d2d3 | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/520e1cec7be9ce3401175c04df94ab15dbe8d364 | ORPH
loongarch64  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/2e8e348c9c4fe3ddfb749059d97298ecfa8071e5 | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/9bc467d822b3f4fe09c9ac14139edd50cae12756 | ORPH
   armeb     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d08b8ce2343e7d909545d34cf7ac7b4abb681ed9 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e86d5c2a574eb91062772dc3a91ccee842b45aa6 | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7a29c40a7b7fbe274399b72803ba0fcdf9cacc60 | ORPH
   mips64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6fcdee6a6ec46c55ee9f8dbf0cc5f608717df0d3 | ORPH
  powerpc    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/e23c59d94dae2019fac80f3d41120e8c8cc36bcf | ORPH
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/6424e396865643134be10c135afeed5e902bf167 |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/7d2519c3d939fd6ea34d3ad0610c5ce2e96f3f35 |     
  powerpc    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/cf3820830298d900e28e466540826983fb8b4224 |     
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/b816adf9983107cf94d7418089eb228dd8d1cba4 |     
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/cbdf57523c9669843e8fc55e22d03bf5854a1cb4 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/741fedff6903be534a4925b495adfc617f8dc267 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/f768eec4443efe01ee4398c72846aecb7950e377 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6749480afac095bbc43a489a5819d02bd63d293b | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/254cf40e7660bf2b6b0b6dac9d4321fc83ea6d8f | ORPH
   s390x     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/02089135c7273d9575a83f73f314ba86669df4c5 | ORPH
   mips64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/a22fc0b0997b9e351142d0ae2bb2924600fcc98d | ORPH
    mips     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/4392ede2a8cceb2a673f8d8d6bc7a8b5c852a2b6 |     
    or1k     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/6fcc3f0babdf6c55c88906c15b88a882278c3ea8 |     
   mips64    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/a661895562a4ade37553a320064b7908e130ff46 |     
 aarch64_be  |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/3b71d05a0e1f88a93b5da8c8edd505f7f1bab96c | ORPH
  sparc64    |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/e3f36c61d73f351500f769f5e0b4328410a099a6 |     
   s390x     |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/75414418243db5407e5f0615dd422842b98b25db |     
    sh4      |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/e706ad30e1f02f8cc3f73b3297301ff2d786aac1 |     
   mips64    |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/5c0fe381735c11ab2961d7668cc0afd07c625dbf |     
   mips64    |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/d2628626f661f4e1f09e91a944198fc96529b860 |     
loongarch64  |       libmanette-0.2.12        | NOK | https://autobuild.buildroot.org/results/a8822900d8322ccfd12400e9d4ef422be8d9a54e |     
   s390x     |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/212ee5a5af69e1cc5dd5dfc3e62b9c4dc7b1d649 |     
   arceb     |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/eadb6dd746636667ad0c18b65a38e44c0bc8c692 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/a12bc60299ed366df48039c3680527a92ca8ec4e | ORPH
 aarch64_be  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/6e651c586f9b2a1c9b39cafaf5bebc8b501e8369 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/0927d7cdf077af8ef1a8d9ee6adfabbd4717a2a8 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3a3e18d63f12676d3801529d1aee8694973a2a21 | ORPH
    i586     |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/da58962f180b8ad0dd1e268823ec6be110947427 | ORPH
    i686     |          linux-6.17.6          | NOK | https://autobuild.buildroot.org/results/3cb4bed3a205618c6aa3b226b30290d6b00beec3 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/6511040426506895ad2db414be36c31200a7ef79 | ORPH
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/49e1bd5ec9d3cc1437e9bb6e31d0cc0bd4b88e78 | ORPH
    i586     |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/efa3de9df71ffee5478f9a7218763c3d599b39d3 | ORPH
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/61e9741badc424aa41271ef779d490f8fdfcca56 | ORPH
   s390x     |            nbd-3.25            | NOK | https://autobuild.buildroot.org/results/88df2d980791af3a844c987937d8abf7f39132b7 | ORPH
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/9c8240b6b13c0c52ff205b708ddb66edbea33cdb |     
 aarch64_be  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/a4cdf27d151bdd653b3044918cb07ac2cc911d4f |     
  powerpc    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/acefc92d829163c832ce7ea9c60b402d957d1153 |     
    m68k     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/2fb1b5ee3f85bfd4574fe117dc026355e1a1819e | ORPH
   armeb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/556fea8a7f75768c6d922a787485db601710d29c | ORPH
 powerpc64   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/32834571c563fd9008bbc8a9769fa0c8c4384d1e | ORPH
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1d01ff023f63752bbb39a49947b939052b7a0c9d | ORPH
    sh4a     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/63a6cb289c6e65ab301fc5a866d173c6fd14433e | ORPH
    arm      |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/30d16ac49e74891488ec13c0cebbab7479fb7d07 | ORPH
    i686     |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/f84e2f880fa08685ca9140dca4fbbb358f27a295 | ORPH
   mips64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/27febe2213b4d88bab881dfd946100afacce1fbe | ORPH
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5562df8fccd22858dcbe056283f104c9387aeefa |     
    arm      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b52a089d68dcb7505637c5011bba5e9020a3ded6 |     
   arceb     | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/0d3ab8f0ceb867fcbebe6bc1bee2082907d0ddaa | ORPH
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/59e16a3d8141a02e136a223a892cdf22d09f485f |     
microblazeel |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/1460fc87c14a29b0203d616fd15f080705800d01 |     
  aarch64    | ubus-afa57cce0aff82f4a7a0e5... | NOK | https://autobuild.buildroot.org/results/27b23747ee934d597a5e1fde64e5b60f5bee122a |     
loongarch64  |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/d386f9805168592fb52aeec00d5d3b2c9d275525 |     
   xtensa    |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/64a9cbc1d0e57a576d56cc4d1dee58fb3ad6685b |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 coreutils-9.5 | 1 
                     criu-3.19 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
     libphidget-2.1.9.20190409 | 1 
      passt-2025_06_11.0293c6f | 1 
                    sdl-1.2.15 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/52b55d5328e4437c264b9f0228f6d7a52c18a579 | ORPH
   x86_64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/0226da9bf82f3c4154f8138d26c952755dabacdd |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/8a509b714c81f168b32e411fc3215e59f2530d2a |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d3b285fcbc22ab65ff469de167941e2bf83c622e |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/c3b998859e184cf2e33b8a3921a08096e6074903 | ORPH
    mips     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/96cb5bddd1a70c88085dad24dbd8f9a7665c2043 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-rust-1.82.0 | 2 
               bctoolbox-4.4.8 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
                   libcap-2.73 | 1 
                netdata-1.37.1 | 1 
           xtables-addons-3.24 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/20108a212b3f3adf4ee80b386476492c47516016 | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7a5c4132bf6f0292ae2e329f15ff2f503b1139e9 | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/117c7100e7421eaefa4acb34b3cc9a6f7fc3c498 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/abc5eaf0577bf5ac04426f4bf9e06fb464edfa7d |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/1725fbb6f27274cee874c391a63c0e7c5c8200b6 |     
   arceb     |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/e52a5da5d96abac0fa5cf6baa3f2dd6ec38592e8 |     
    or1k     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/ebf4d5d2492c97fe7d80331c7a3b149683123d7d |     
  mips64el   |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/0dcfa032b807c81483bb0bbf9944c65bdfa95311 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-guile-3.0.9 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0c5a8e7387cd586eb5818ccb8d136c79cf0318bb |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
