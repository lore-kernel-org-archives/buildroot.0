Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB4EC71157
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 03:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE5D8113F;
	Thu, 19 Jun 2025 03:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRv6mScyz-Sl; Thu, 19 Jun 2025 03:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D742F80F4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D742F80F4B;
	Thu, 19 Jun 2025 03:17:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5575181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 03:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA92140699
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 03:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1_j8z4GgC-b for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 03:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2116640691
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2116640691
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2116640691
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 03:17:04 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ade4679fba7so55499766b.2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750303023; x=1750907823;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=azjmrokm4H2+PUjhNVhqQMl2UpxyzYjDFhApfEm1US0=;
 b=cvEEQ1aTui6v6hqw44DDwQKtGPO8IBhpl5Z9/fkaHqPpYnIMcSlKiHO2GXleIpAtok
 QwGZNltqZyitO02GU+kg8spzbhU2KNbky+SPX6xd8D1haYBPJgniFttxLzIFwBTSwvCR
 lGKqCiCKL6mXRwDGP3TmRVKJi68C67USy/81CdDxCZYnXE8VYVn2UUtxT3CXCbDYDzqH
 p+HKhL4JHE5LsJK4/U3gZdka1HXHgvalbPSU0/Eghxmc5P2hkD7bkjUKb/2uxclvZXSC
 tFVgpOUBjdUJqDaNwJFMKJZ3hHzrCtjschS6cP6XNOO7UFg2Er9nm74JzZT/TXonqSK2
 4hQQ==
X-Gm-Message-State: AOJu0Yy/mmpvEe8WR47vSFT7uTgQ+r0O5PiOy9b50eK0VEddv2HibmYx
 iTF+P7l9FhSdYokMCEjgWHDafG96FsfdmyXwh7EOp60OuzsngRm392HcmScBuQ==
X-Gm-Gg: ASbGncsLcYZbYlVX8vpT5vz1Rps4uEiIxLQriIryUP8vk8PLhp+eRlkL7jbwlTjS5/R
 mjfi4Bdbv/fyswWB8aDpMY1PpMF/ya0cocH0Wzwun7E5KcSFO7c35xxud/GVZdNaEy426rLHYTt
 AYYyWopeKozsbwuLvHsO14NSYZxVPIGuPGVKudf78Mj2g6kjgUhK00xVHTnFUEHNA7uOpiHmrA5
 mwhq0+hWHW6TXqbvsyeKCFs/psWJ++l1tjRPrBOy+x1LJbIKJz++X7Edq6miJVb7PL56EMq51ey
 str0rFF+IOhNsBYQE06+6YCAVE84GA6fcQ+n7mMgjAOJSehpKlFLGrxaROzgfQ2wHA==
X-Google-Smtp-Source: AGHT+IG1VhBF2CGaR/sI+Efhqtc5cdxnjrH5FM2Igd+wLRHrP3On+zUhWzumPtAeeG9H6h68Lf+ryA==
X-Received: by 2002:a17:907:961f:b0:ad5:6928:1492 with SMTP id
 a640c23a62f3a-adfad5991bbmr1859491866b.45.1750303022887; 
 Wed, 18 Jun 2025 20:17:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec88fe514sm1162984966b.79.2025.06.18.20.17.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 20:17:02 -0700 (PDT)
Message-ID: <6853812e.170a0220.3ad91.ea8e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 19 Jun 2025 03:17:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750303023; x=1750907823; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=azjmrokm4H2+PUjhNVhqQMl2UpxyzYjDFhApfEm1US0=;
 b=JC5ZAcGIpgxRdu3/WWoXLyTn8DpAKA+BbrW0IUFpVAHCMIRNHQptLRzHUJ/CIb78/I
 R2bBd0XAnzfUJW5Y7wLdqk3sHy1z9hlErTv6wJG25DqX2Ifjv16Zao7NYm/ALFuL8+fi
 IFgUDoMfThtfs/7/J1X3BUHJDRgsP+bvBFGXkH3tCYX/hQIjH9vQYC3yrkpaHILOC594
 pulqA/y5gcPg4I/u2/ptiZnYs9w0Wty8pVHX24hzEV2i3nxqfIzeb4R0/cJ0hvQKXkRy
 JYrPyBgUxhxSbT2FSmet9Z8tMU/gJ4CQCOo7vQRXUoOjInYpWmrfXGoPajufVh5esyTd
 U+SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JC5ZAcGI
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-18
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

Autobuild statistics for 2025-06-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  4  |  0  | 11  |
  2025.05.x  |  1  |  9  |  0  | 10  |
    master   |  7  | 38  |  0  | 45  |

Classification of failures by reason for master
-----------------------------------------------

                    bmx7-7.1.1 | 4 
          host-binutils-2.43.1 | 3 
             batman-adv-2024.4 | 2 
               bctoolbox-4.4.8 | 2 
                 hddtemp-0.4.3 | 2 
        host-berkeleydb-5.3.28 | 2 
              host-rust-1.86.0 | 2 
                libesmtp-1.1.0 | 2 
libftdi1-v1.5-48-g22b4667a8... | 2 
                  linux-6.15.2 | 2 
                 agentpp-4.6.1 | 1 
                     bc-1.07.1 | 1 
                     daq-2.0.7 | 1 
                 expect-5.45.4 | 1 
            host-binutils-2.42 | 1 
host-binutils-arc-2023.09-r... | 1 
               host-vde2-2.3.3 | 1 
             libgphoto2-2.5.27 | 1 
                liboauth-1.0.3 | 1 
     libphidget-2.1.9.20190409 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
              mariadb-10.11.11 | 1 
                   nanocom-1.0 | 1 
                   s6-2.13.1.0 | 1 
                    sslh-2.0.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/0c9b5f99c0a9f0699a52c4fb7573a577c51f35ce |     
    or1k     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/54f6c23624bb623aaa7a44fd8f520628cf97f359 |     
    arc      |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/8253ac8415ccb068f04cfca0b486a76bebf8c1e8 |     
   x86_64    |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/c2baf66057fcc7b5efc718f9ab5695dd38e232aa | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/699ac1cbd8a99751d8af4016ef210e52ea5b3a4c | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9473057ffee85a3f2165dd1059b93bfb771ce1fd | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/74bc4e8d028d6689175cb200d07dbdcd91a157f7 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b8634a635b4b564cddb050c20462b54500104ef1 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/bede2e729f0c3fa1ca42be112cce5f60e2924aa0 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c1e4424b8d3677b84d4c8067e5670f071d2333cb | ORPH
  aarch64    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/f04cc65584441b70b0f984536beb22b059297812 |     
    mips     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/6cf7d08966928f7d84e227768ab3a7c7c7f21449 | ORPH
 aarch64_be  |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/5b8fbf5226ae62a43e3aeb1a9ca832b4f307eaff |     
 aarch64_be  |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/efad88f28e264768e6e70707ebc62f53bce76fac |     
   sh4eb     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/4573a68636bf54038b26046c4b8807cf34d0a284 | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/40cc4320eadbb44948e28e74a0c6e90bf509f9f5 | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c8cf1c98d35d48c83b0627313850443bfbd2704a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/da96dae7011aa3817f3bd1762adefd3bbf04c6f9 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2a065e0c8197adf8c699156f8434a474f362d6ab |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4300caa521eb420e42c9508fc80f450a051c70ba |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d09238b6a5dc0028266912aa3f0e1a16d93c3bd2 |     
  powerpc    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/9f776059bdde0652784b417bd230ff6cc1a1f5ac |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/bf40d65eeb0ba816f3d28eb0b1960f3797852680 |     
    or1k     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/bb47d1c598510f8110f2a081935d1fc4a865d0f4 | ORPH
 aarch64_be  |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/ff71caf8775bf8ef6c66f10737d11b75b826f94b | ORPH
    or1k     |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/5cbeebd314eb407dd955e2857c5fcecb87d5343a | ORPH
  riscv64    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/8381d26a27a1ed87fd497ae14ce309a2b91d8929 |     
 microblaze  | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/58d9cc5eff9cf15c0f23d895e3419d31b52fafbe |     
    arm      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/8cd6adb8814d16be50ab0e8708aedaf0e853a8fa | ORPH
 aarch64_be  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/cd180e821f75b9f47b5b2f2b845f65957f8ab6c0 | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4adb5bac06db3f78dc885d61a639198bd51610cc |     
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/053e16e7a94dd0e7f255189ad6e6e5c2790e8a68 | ORPH
   mipsel    |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/3835311a5f206c2da297c13716e9e38d529b2231 | ORPH
    sh4a     |          linux-6.15.2          | NOK | https://autobuild.buildroot.org/results/ea746c7ff5d3cc33c8d37adbb0ee07350a34d47c | ORPH
   x86_64    |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/9d6d719335370499b43bc83ac22cd5209a7d447b | ORPH
    sh4a     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/c9accac7c2715d2cea64ea7323f13d3809ee9aed |     
 aarch64_be  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/5b88c028994c9e32b63e586a7da0268842a2e591 |     
    i586     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/dbf9aec76209d5c3fb60fca7a02df37aa7475d00 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                elfutils-0.192 | 1 
          host-binutils-2.43.1 | 1 
               host-ola-0.10.9 | 1 
                 openssh-9.9p2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4ea197021743e86f7c9758a664437b45e74c7867 | ORPH
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b6560d5be95355ec7d590fb0691a9e144c5be136 |     
   armeb     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/37c43b6f6a5b6cc1d5724e2e787a276e9d7b74d1 |     
  mips64el   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/66f1aa5d1d071357f5e4e0bcad2f4533ae558226 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    bmx7-7.1.1 | 2 
                flashrom-1.5.1 | 1 
    host-mender-artifact-4.1.0 | 1 
             libgphoto2-2.5.27 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                openssh-10.0p1 | 1 
                pipewire-1.2.7 | 1 
              skalibs-2.14.3.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7744e36c8f9c367a5df0e274f5f7724e681a92f2 | ORPH
    i686     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7d7141746ae31d888285945d6b3d3f530d6f6448 | ORPH
   mips64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/8e45e943dd4b126e2d43c8ebcc35a93c7ae01e97 |     
  mips64el   |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/0aa66ed2cbfe2204093425e124291a89bc688647 |     
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/d9b136ef4a8f518b130cb8153b3862a290631d8d | ORPH
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c094b1ee68003d711d2276e6633daa0407b08107 | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/c93c835cb3c9001c179f15e21822585ee33fb6c9 | ORPH
    arm      |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/89cbcc54dc87f904c0bd7368b18a1d0d79c49880 |     
   s390x     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/fcd088075f8be9b1ece44873075798add6fed881 |     


Gitlab CI results for 2025-06-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449861 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449626 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449538 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449469 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449388 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449363 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449138 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449057 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355449046 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448955 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448939 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448865 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448594 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448590 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448471 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448433 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448430 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448427 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448425 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448424 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448423 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448421 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448418 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448417 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448415 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448412 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448410 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448406 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448404 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448402 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448399 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448396 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448394 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448392 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448389 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448386 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448378 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448376 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448375 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448371 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448369 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448368 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448364 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448356 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448347 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448336 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448288 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448281 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448214 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448207 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
