Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67592C54ED1
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 03:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF7140582;
	Sun, 25 May 2025 03:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvX6VWyQDf0u; Sun, 25 May 2025 03:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AA140585
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AA140585;
	Sun, 25 May 2025 03:15:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9F3A119
 for <buildroot@buildroot.org>; Sun, 25 May 2025 03:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABA4C40583
 for <buildroot@buildroot.org>; Sun, 25 May 2025 03:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9d5U-lTVTXw for <buildroot@buildroot.org>;
 Sun, 25 May 2025 03:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A457B4056D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A457B4056D
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A457B4056D
 for <buildroot@buildroot.org>; Sun, 25 May 2025 03:15:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so701752f8f.1
 for <buildroot@buildroot.org>; Sat, 24 May 2025 20:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748142916; x=1748747716;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4D2fBHgE9dHywPRX2BG9ukodTzcuKE7SBUJE6XSc6/g=;
 b=t4iOORdIvYTgxDqpXooXOSESUK82nsdKap9Q2BbKc2A72zcQhEYUtKuctZOKDQA7/P
 pC7VvfdGfbS54hwTpNfx/Bc/hfNlVB2m/3X55L4KlAH+FVjV+wUfiLShEQosX3W52Df8
 YsRukmP9zGAzgNk6eR6krv70bU9RVF+EIdgvkg+HakQg01Van2xuzk80bli5Rnm4wGZv
 RNke/MpYuupoP7DByUGIRAFWhXnWE0tELif/pEnAW9i4lI9eTGpUloGAA9AeSNpo/cQU
 eUVHKm061aqb39JaDYviBo1lJj9yFL/NLBFtMMVbeqcFx+tm1uBkioKNbYykrx5AhIeX
 /EMQ==
X-Gm-Message-State: AOJu0YxoV5Ac3YhSrb3/8RBBYfa9Y8pKj7Rtv9XTVyPtJrtiothZ4haD
 m/M8cPWzYScjgJtse28NBWou+vva4E8yEKOP3m4qxToqwstqf+6+lPIKLr7mwA==
X-Gm-Gg: ASbGncsVf7oRAbBZKsiLKBeyjLeOH0RPEMVrApFRloSa8Ycy3zaQUtnP2jO10vK8Es8
 YuNvRr7AGMkJc/HVtjTfbFHYa8CTAbcJSbakg48okBF4z4MIKgQERQ7bviZKGi5HBcdZzaEkNJf
 ZlvVxVYfqvr9wJYa4jl3nAS4660Y2Djdib4KwWDOg9/VFPQDRQ9YDd+gH4+88CEft8CyddZoDrK
 3Dsq76oYIPHj6fJNi0xH0IzMvxeFIcSzqV+Wep8jP6pCkgVzX2TAVbPM6QeLSADBUr6iwMo9z22
 MLMLt9SlkRVSjzXNXItj+9LlXGn3O69IVe2L/LIositsHKJ82+F4+QQ=
X-Google-Smtp-Source: AGHT+IEJyD78aVCwTU5HPst4K91Q7nYA5lr52BWRGDoSpO2TVmPEKBbU6bHKx6rFFEUWl/rgwMuUYQ==
X-Received: by 2002:a5d:64c4:0:b0:3a4:d53d:be21 with SMTP id
 ffacd0b85a97d-3a4d53dbeebmr383345f8f.20.1748142916324; 
 Sat, 24 May 2025 20:15:16 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4cf211828sm3068179f8f.61.2025.05.24.20.15.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 20:15:16 -0700 (PDT)
Message-ID: <68328b44.df0a0220.313bd8.06cf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 25 May 2025 03:15:16 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748142916; x=1748747716; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4D2fBHgE9dHywPRX2BG9ukodTzcuKE7SBUJE6XSc6/g=;
 b=eCYTi75glHrpvrmBkgvJz7zmGdSYO4Lqz8OdFAEhhsarN0sfbdD/+3AEIYn37pk2lt
 vf+OAitpH8iUIeL+CLjKFPIP/9FVVplx74lTj/PFicxw9ILwhnnLOjJdQ+XYHbKCGpDj
 1Ij11oA5fvUnlSkwHBdPMAVSvHWnpvoUlrClHrcPHC/2uPcmp5Tegq5ZInlhUgDRaakq
 5ppHzP+o+q6I7kxwH+WwtU87q/2FepjHOZ7yPo7F0MhlzkC1MA9iBf1E3i+kXg4DfgAS
 9mTzqH8v2fn9PAjTNbsMzFxLMa5Jyajop+giGEbSmOhQypELySf9eOi6nbLarhQ4rDHv
 t3Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eCYTi75g
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-24
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

Autobuild statistics for 2025-05-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  7  |  0  | 10  |
    master   | 16  | 30  |  0  | 46  |
     next    |  2  |  6  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

                    bmx7-7.1.1 | 3 
                       unknown | 3 
          host-oniguruma-6.9.9 | 2 
             parsec-tool-0.7.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
                 babeld-1.13.1 | 1 
                  brotli-1.1.0 | 1 
              fftw-quad-3.3.10 | 1 
  gobject-introspection-1.82.0 | 1 
            host-binutils-2.42 | 1 
          host-binutils-2.43.1 | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.86.0 | 1 
              libopenssl-3.5.0 | 1 
                  liburing-2.6 | 1 
              mariadb-10.11.11 | 1 
       matchbox-keyboard-0.1.1 | 1 
                 netsnmp-5.9.4 | 1 
                openssh-10.0p1 | 1 
qt5declarative-50c8def85480... | 1 
rtl8821cu-96c65c58b54424117... | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                 weston-14.0.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/a726390fd5e81361792cd22cd32e86fc2a93badb |     
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c5fe7a743893e4f186d3ccf9adfffe6642e56e84 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4d84ecc95f87fd3e087130fa5c7bb2891555469c | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/54fdd60deb069db0064ed59833d1949199a96497 | ORPH
    arc      |          brotli-1.1.0          | NOK | https://autobuild.buildroot.org/results/bb82bcfaf7ea286a7709390a5122a26b0e557a6b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/c1f0d6aec9d772eb20c94ef2e76e465cf19ae207 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/603ccb7b04014610c1ec71a9ec2a2e0f7972222f | ORPH
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/2f0868b6c9186ff39397c8d039d26f7d09c85ce1 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7b526370a8bc01b1af21f2edb7013b13a5f62478 |     
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9ccebe3e27faebe8533d025bd3d002c0db37c69f | ORPH
microblazeel |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/528c618b97d8415ade1cd1922c0156ae6d3df35c |     
    m68k     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/9b9bf9ea51323fc6981f4f95b4afc1173095d4c6 |     
powerpc64le  |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/9bb0470fd9437cfb24ea83d99b63fa06ced8db22 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/e67290e69b4e542cad24c6438d9c2daf8c1e6ded | ORPH
 microblaze  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/a8b1f242dc4dd47e860cfaecb53703927b195b76 |     
    m68k     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/e3559a8f087b3c5b3f7e35fd8fa66969de2a748f | ORPH
    i686     |    matchbox-keyboard-0.1.1     | NOK | https://autobuild.buildroot.org/results/f92b20f11e7808b8b450e953d5c0819f6df71b5b | ORPH
  aarch64    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/a195af678b1f5a0bba491c1c819a30a85eaaf69a | ORPH
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/bb6cced3015694dc63a19608237c7896ff175c74 | ORPH
  powerpc    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c239f8d02827245276a4ebf3c2dc96891b4a85b0 |     
   armeb     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/908c79d63d51616c48f1ba39dec5a0bcf5e67e80 |     
    i686     | qt5declarative-50c8def85480... | NOK | https://autobuild.buildroot.org/results/215146dab8b45fd9f69a97131c86d7c0378f8a5e |     
powerpc64le  | rtl8821cu-96c65c58b54424117... | NOK | https://autobuild.buildroot.org/results/b6aed17d0ddbedafc3249850fc0dc92cc240b956 |     
    m68k     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/f70ec152f44c2eb78a2f2aaf3861856f93858e9a | ORPH
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/f7554d4376696f14d0d9ab56d0a141773fcefe39 | ORPH
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/bd4fd39c854ba7bcc8fb3a57c9d89fd52c4f0b5f |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/173eb78170118888fdfa87d60564c4bb769a9137 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/c4d62f968784950e230c8a96f546f77a15c1843a |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/9a5ce780bf2f4aa77b2ba836d7f37b7f0d36f28a |     
  sparc64    |         weston-14.0.1          | NOK | https://autobuild.buildroot.org/results/378e05884ce018a6aed583333ef730012028e1a7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
              host-llvm-15.0.3 | 1 
          host-oniguruma-6.9.9 | 1 
     linux-5.10.162-cip24-rt10 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/31471633b45fd3e04d2ea49918931eb5e6b00c45 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/44bf74332d49039e1ef7e8e01b977cc0a2028278 |     
    arm      |        host-llvm-15.0.3        | NOK | https://autobuild.buildroot.org/results/df6facad5e2d739455c543af53c7393997ca4b33 |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/f3ec20a8685b0141f2c56dac71b3832177857dbe |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/c3f64ae7394699429862a73ef7de67c2799d6aeb | ORPH
    sh4      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/e5ebd4378023cbbe482dc2879710ba66fc72a0c1 |     
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fffe691132882475c14776f4e144becda0c5a4d2 |     


Classification of failures by reason for next
---------------------------------------------

               bctoolbox-4.4.8 | 2 
          host-binutils-2.43.1 | 1 
              host-rust-1.86.0 | 1 
                 sudo-1.9.16p2 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a4589fd5130da8caa86bc3ccb4b6d2c200379c3e | ORPH
   sh4aeb    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b87fd39892b71ffe1c01747a095c3a0585b07956 | ORPH
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8d8d850521b6b92a0cca21b4fcee95c072137a59 |     
 powerpc64   |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/7d1c55cc506d690c89d03630d92fa4f066633bee |     
   sparc     |         sudo-1.9.16p2          | NOK | https://autobuild.buildroot.org/results/1ed064b0f7ecc3a5d073d7a34626d1c6a0508c09 | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b69398dc35807ba6bcb82bd5eadba396200b1e0d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
