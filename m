Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A90BE8384C
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 05:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1CEE8224A;
	Tue, 17 Feb 2026 05:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-i8cNIpyu5k; Tue, 17 Feb 2026 05:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD8D822BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771307623;
	bh=i9QN7DJ11l5b2N6+o/jyTlVnU3t6kJw5KV+2587dp9U=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pV52j9DhuKMk2FSwfbHBcgmQmdKCR7SVA034zdv70cJqIQ5s3iRFuYuO6k/qvPuLy
	 9KNSo76KMHjicTQrorBe3VsFd5AzfDYBZB9YhAFazB1nyM2K87M8ObIxvv/oXqkKM3
	 15LnBJ6w2kcIB7gAzl+DpagizsLpzdnaGvbbHTiUDTUaMWhKTRUW8eh7jJWAMcy3Ev
	 Hx9QOZ24t5Z9UaOg3XbuQCwlMmULhZ/TCE2b51SqmSvbZcoX/eTvpm/cxKp8oYfmRd
	 Up7TG93re4tgIdUnn0HZzMqktPTlhpOEEl9RItIfwTH/m74gvTkXv3RS1Ihb+TgF8X
	 Zda/2D6WsIfxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD8D822BA;
	Tue, 17 Feb 2026 05:53:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26C98270
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 05:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1506E60BDD
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 05:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyZi2LxgpZV6 for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 05:53:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8600A60BB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8600A60BB2
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8600A60BB2
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 05:53:41 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-65be78011c8so518274a12.3
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771307619; x=1771912419;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yW1TmjHCj2S80o+ywC8TVbMyHqs/Paq0J8gufRseF8=;
 b=YalMWhR7kVjYmRj/BsPfW418/WUZ/IJhv4T+QOIPWAZDKJLSj/f0HRSetTRlHUC+fI
 qENKuZmYEFCjENrjcPncoYdYbz7qfArrifp8aU8ji9JHiliebD4z+EuGcQ2vL5P5Z/g8
 8lqK5f+gfkqr3YjHIMKddkhAEpAiO8h7om1DJA6VP6nSLTs2xJBIAYYTIkjrBofUgKgu
 TnK8QV8m6oVCyT78uZvobDT8mtLEq/2CnHZrchdVScuCMvEPZKiJBulWHevkjubeFt8k
 F0IPpntiqhXjbeoII6H8Z47Q2nGY5UcgZkCXU7k5AUjdr22VmtvTLnZ40swOXQFzh7LQ
 DJAg==
X-Gm-Message-State: AOJu0YxbBCTiwulYQ06/IRQbwtFchbyp2RD/bDGBV4thRmJYvsN9nmYS
 IrtX1DXymMUKXWX54ySfsLJoFSk0Md1lbMRinFSf+igX7MvEKncGsHfXiZHaEw==
X-Gm-Gg: AZuq6aLtKLwnF6LxDLPkD1ok+VzIv2pTUoPrpjg/VtWnpWHouVG/nyQRyBLUR1vUltw
 GUxOaYpzjSLjKiQyMFPLADyrdpT323eJxl3Phe5PVuMfLEwd0wdisGcMF+4Q8qj79MlOMYSgMhP
 9/pIPTUgT6kii+ybaNF2fZAASvaCvTKS0vU0cxvwUZOtpV9tkfqgVc0WM0R16tc6tetw/9vrBaC
 if3e78Dzns18qsLfy1m8ogUiMzDYM4+ESMN/th3SJrEN+ka6OCtyqsfWySP45ZDg4WubmWb7tQQ
 yT+xKaOykA1thdYL0oG/1PqLAXMyigLYAKwYb/+f4kSyax4mO+RxH3gwYTgSmxT7Wv0T4YXpxUT
 R96gTGRWkzNwFe5I/240RwGO2ArFHfPYx6mcHg5Fm5DswKX8CewoZM3eg575G7P9HJA6h1XdqTc
 9ngy/1jhdCVTxh44u1sxb6xUordT1LpQ==
X-Received: by 2002:a05:600c:1991:b0:480:2521:4d92 with SMTP id
 5b1f17b1804b1-483710858bcmr241803675e9.24.1771301916542; 
 Mon, 16 Feb 2026 20:18:36 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a74704sm33469524f8f.16.2026.02.16.20.18.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 20:18:36 -0800 (PST)
Message-ID: <6993ec1c.5d0a0220.1d242.2e6d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 17 Feb 2026 04:18:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771307619; x=1771912419; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/yW1TmjHCj2S80o+ywC8TVbMyHqs/Paq0J8gufRseF8=;
 b=G5YpUrG4szhEycJdMw9ojgXn9iN0XivVqt4mQlNKHnuNpU7ZkaFBD7ZRPPSJIv9QpU
 TUSKCI+XQyHvyqWxrzgL/YhtUytQnnSCBP1G1CmvMGSijWeccyOyDoXaP3gV9n8nb+kO
 CWaYyF7o4+wAZye5LswWf6Y8xJzuvIBOox12tJghW4kyoCVBAWBLcJSHE/odI2v5K53K
 WKmICAbnxb6nFRk0oBCnlY33br+Ykzw+4W2Efkucy9V4pxSIgG1mY/6Itx8oR+WG/Ckc
 64Md2lzh0GLZWDlMHsG6oQIJ2P37rlZEzFHhap8c+MwuEJ5upVdDqQMHCi3P6WOOYhPj
 G6+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G5YpUrG4
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-16
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

Autobuild statistics for 2026-02-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
  2025.11.x  |  2  |  3  |  0  |  5  |
    master   | 34  | 54  |  3  | 91  |

Classification of failures by reason for master
-----------------------------------------------

              libopenssl-3.6.1 | 3 
          linux-5.10.246-cip66 | 3 
               openscap-1.3.12 | 3 
glibc-2.42-51-gcbf39c26b258... | 2 
  gobject-introspection-1.84.0 | 2 
host-am335x-pru-package-5f3... | 2 
                 host-gdb-14.2 | 2 
     libphidget-2.1.9.20190409 | 2 
     linux-5.10.246-cip66-rt29 | 2 
      passt-2025_06_11.0293c6f | 2 
                   perl-5.42.0 | 2 
                       unknown | 2 
                 aichat-0.30.0 | 1 
                  brotli-1.2.0 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                    ficl-4.1.0 | 1 
               freeipmi-1.6.16 | 1 
                 fwupd-efi-1.7 | 1 
            gettext-gnu-0.22.4 | 1 
                        gnutls | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
                 host-rust-bin | 1 
                  iozone-3.508 | 1 
                  libbpf-1.6.2 | 1 
             libgphoto2-2.5.33 | 1 
                    linux-6.19 | 1 
                linux-firmware | 1 
                  nginx-1.28.1 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
               procps-ng-4.0.6 | 1 
           python-bcrypt-5.0.0 | 1 
            python-iwlib-1.7.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       sed-4.9 | 1 
             superiotool-24.05 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2025.10 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/51e8196892f87acbc36080a81d88f7806ce7a4ee |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/2b81f909a791b2f1ac215249f5a4169ba4feebd7 |     
    arm      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/1934a22c16d7062936d0d4586b9e252ec20320e1 |     
    hppa     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/02260233b29716ce9a4d27a28b5879f539d8b93d | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/bc7389a6f65547b5b8a9e0fedef15645615471f1 | ORPH
loongarch64  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/104a05bf15dae809a6d115b1e13b59e89f127636 |     
 microblaze  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/b58ae1bcfc3e43784ab874ff2a36de2cbce06717 |     
   x86_64    |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/0a1febe9e80e5baf2584619a1bb2fba58a6a0625 |     
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/b7146a5f2ac778538b90489225bbe96561d8bf6e | ORPH
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/2cd4a66628bc246cb1b68c987a2f69d40e54a3f8 |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/372392589b6ca96e8e18f82f5d792e68b756cc9d |     
  aarch64    |             gnutls             | TIM | https://autobuild.buildroot.org/results/44821d079b9ecd82264627b129fa2a35510fade9 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/503f092ccc4bcf4568cdf9c083e8ab1bdf782c4d | ORPH
   armeb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6c02cdfc51317d3e1ccbd5d0effecd9a71a7df32 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9a613b7b2779971f37d25e7fe24769a8c767c50c |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/855fc434dda3f7e238e6c94ffc600d7f6c9f082c |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a4fd5f1e13d5364afa73dc2fc87189783b2748c2 | ORPH
    i586     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/83147f0d3bec758934fc03d5279d60434aea8d6a | ORPH
   mipsel    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/dddfe27df4e43c62a07afa594f0ee7edfd5e3bb3 |     
  riscv64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/2bb2692a833c33bf794b631424f2a53b6c1bbdf9 |     
  powerpc    |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/bd586a5875371fd93dc6f41f23968dbf1f0d4f21 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9850253e2295152d1882e0f5403bfe9efae45c78 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/140d65e2c7223007689d2d630d15d954b5a4384f |     
  powerpc    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/007ab33e9b4d9fb8fb079ce4fdfb7e99748f7f32 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/8eadfd1ba5bd3cfd4db9a9eb82a864a87a10f3ee | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/0020a13988d25d61f25ed27e198758f316b539cb | ORPH
    hppa     |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/74958edb2a3f9bd6ad409554f936ef10df8369f0 | ORPH
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c3b64218e0cebc890af45ae7565defebd14294d6 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d24d2ef2c761cb969dfc93d449c3ded6b6e517ee |     
    sh4a     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/2802223d259666ce23281d9bdcead5669623bf28 | ORPH
    mips     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/33210ff21230d40feb9e59e184f15d4c2ec87b9b | ORPH
   mipsel    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/155338c325c9ac301257e9f5be749bef4a379f19 | ORPH
   xtensa    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/12d2bf22a5befefd110674daff992cf905af8b8d | ORPH
    mips     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/5687414e5acae46340146a8fe1144421be94c807 | ORPH
  powerpc    |           linux-6.19           | NOK | https://autobuild.buildroot.org/results/2a2cb34a39544ea3b0a35ca6264e1680f78801db | ORPH
 powerpc64   |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/079ceb2961391f6ecb92720ef1a736c4a250fa6d |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/8e0e5adf59968db24000546acb2ba8ea0df4f567 | ORPH
   mipsel    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/c24cfa4c467671f6d7a25d8989d93d61302783c4 |     
  powerpc    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/20816dcf70854cef6ff42289f79748322c6f84e6 |     
  powerpc    |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/58c15e146a5141315b07ed05abec513fc1206852 |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/94507aa0d4decf21e5923fd08dc327955e023a0f | ORPH
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/6142561aff62e031b0bf6c3e72264cfa83d8b1f0 | ORPH
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9055109e6bdb716429e290c2af599be163b1b5fb | ORPH
   mipsel    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/fb66d739ed37ab0d232b6738ba73decca52bf753 | ORPH
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/4b46107009914e244c340ef765fae91e816ec930 |     
   x86_64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/a4f33097d6b98f304d35a3b93b4ef75ddaece341 |     
   mips64    |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/7e160ef291f3110ada4fd026c72e2f42ccaa5aa4 | ORPH
 powerpc64   |      python-bcrypt-5.0.0       | NOK | https://autobuild.buildroot.org/results/71728d7f723139474acf7412857e6dea0de84a38 |     
microblazeel |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/ff407b6c0cb340c718f2da18cac5de4c2aa3cb47 |     
    mips     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9a815b749dacf4af875ded169a08e10e78a1af6a |     
    or1k     |            sed-4.9             | NOK | https://autobuild.buildroot.org/results/781b690d071716b8a633ba10f607baf155ec47b6 | ORPH
   x86_64    |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/974fcb4a3f81dce4fddff1f9191e8622f45aa3c2 |     
    m68k     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/ca1268e6c6ed246064e9af07b2ed2a3816bfcfc8 | ORPH
   s390x     |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/ddb1657e44f55e419c1ef9aa1a777aa1f044f3d5 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6dca56a0afae648aafe69fc8977f1fad24a4f73f |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9494e9cc16f99464fda92d44aa4f5c95616cf8b3 |     
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/024aed283690f5f4b9adcc7d6e9771d9959611e2 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                  iozone-3.508 | 1 
                   perl-5.40.3 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9d291a00f0560727d271a2884bc44589f9c20001 |     
   s390x     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/2f27ada052e19b4e86a234537ee7be840afd7082 |     
    or1k     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/384ceed97629bd8db5d96e93179c8d561dbb5b74 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                   dante-1.4.4 | 1 
host-go-bootstrap-stage3-1.... | 1 
               host-ola-0.10.9 | 1 
                  libsepol-3.7 | 1 
                 logsurfer-1.8 | 1 
                   perl-5.40.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2b7b9f0542b9aa7a6417758f0e1cda35f241378a |     
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b7a75bd698453e7311eb566c8428537fbfb4501d | ORPH
  mips64el   | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/3c1980a3fe7e987d166fc23b9628781a524d3cef |     
  sparc64    |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/90ce01b61ce100f8e2dde9287f21f9e38532d9fd |     
    m68k     |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/5f1e39cd2fd45fd18c3d23955051285f4eba069c |     
  sparc64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/4615b7e3c37993c253082e625b84276ada4213e7 |     
   mipsel    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/097efe1408659a311c17a88becd7efadec632cff |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
