Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436A2E77183
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 04:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49AC941208;
	Wed, 18 Dec 2024 04:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7l1_ljJUQHx; Wed, 18 Dec 2024 04:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79BA3414C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79BA3414C3;
	Wed, 18 Dec 2024 04:25:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A43A5C0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 04:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EFA4414C3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 04:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zATc5C2ASW_K for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 04:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CCF541208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CCF541208
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CCF541208
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 04:25:12 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso12362804a12.0
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 20:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734495910; x=1735100710;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yejS/zc6va1kttFTTl3i9VbhvLr8kWqmpwb7kh5hN20=;
 b=luTVFTWJmvgbo8DQUvlPsp5HIi4pnfhhw7QcBk0n/Cq2ON1oGCBUibJJhdbygxf7iW
 uSupRrsRGckEP9hVjUSvKzEcqyzatlWEH8P2Kr/8pKQQeWv+53EGsOhUAk8gH8bqZ6GA
 K7AwaYOl5Bwv59CVLyQacLqTfTbEv53l+658XMykCWa0Kbp3L1QCRr2iXCMnoq7DKnKc
 V5deEfIz/JbEwNJOSfXFI8dmpy8T7Wgk6E+iLJLBhk89zVtGFAkCwDp/fLtEj8xpcrXc
 81vtre72eznK6HhZjn1jCYCskt1GBi5TSHu907qmGJH59sEFTfcWbHk8k7vomUCpTIaW
 HxUg==
X-Gm-Message-State: AOJu0YyW491tH7Epf7dK+7r31Ajg6j8JPUN+2py6ltRPkPFDQMccVoOQ
 chGNZlJj+srscXs01XmY+QIvhVn8SSPaFnDwt7s9KDzVa0CTQj7AvoYApg==
X-Gm-Gg: ASbGncv9eDi8TdIUKvV4avIo0mFMIWkYW8v2ScYw3iF1L1Wh3LxZhzjz68+k3SwMYGx
 DVNoP/dKevn21CePZjVGLPFke3T64NyLKsTpN2mtrcJ+Ez7NYYp7z+dHR/R848Xc7fY37ksn12k
 W2Hs/bViX5q9nR3jBXlhAsVr/VdS9ZZtAXg1+zeXXwpGixHVOlWHHi5PRVmKFXtKI3ACuZYrrky
 GSciqPq49Y5GlODI0SG+o9TcVoB+kkAZZv/L7f0NyCssvmCjO6Gn8NFlVEW
X-Google-Smtp-Source: AGHT+IEpz7CNX09cqh60mgTbxCXxWeeyJuZeoKJxh2sbkSBnzxAcemU0OjOvY0nFzyWtrV5McmTOcg==
X-Received: by 2002:a17:906:1347:b0:aa6:c168:8dc8 with SMTP id
 a640c23a62f3a-aabf48bfd46mr111524366b.44.1734495910274; 
 Tue, 17 Dec 2024 20:25:10 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96068a96sm515852766b.73.2024.12.17.20.25.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 20:25:09 -0800 (PST)
Message-ID: <67624ea5.170a0220.e12c8.3eb4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 18 Dec 2024 04:25:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734495910; x=1735100710; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yejS/zc6va1kttFTTl3i9VbhvLr8kWqmpwb7kh5hN20=;
 b=FB8zOAK8liU3mEXQzXvq2hljv6RDpN1lZt23ko2XcXSHFlu+Aj6GscouaDmNW5o/Jr
 hlvTKB5M4+iF/GSDKfP01GvA1njscY74eT78P+pJvV1Erf7W+yRcyZG7nfBqFmJ2OvqW
 BuKLlV4LvRLUeCFSNOhIExIO6xGUrHzlYmHLo6jJZWzdwJ7RQTTAOh6C7G/J+9QLnqLi
 NgshOnyTfv24kk/oGOqN0l7vhgCa/y9SXj6lQycXvLtH5+dW9gONs2OfCe4Q4vD8sUOu
 rBpMgQgWnHlWTHsLCbh0ctUEoFgOBLeevGmDlV6NUhAm8ZW2mAA+qLfd0rebuzfmPjrr
 yY7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FB8zOAK8
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-12-17
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

Autobuild statistics for 2024-12-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  5  |  0  | 11  |
  2024.11.x  |  1  | 11  |  0  | 12  |
    master   | 16  | 60  |  1  | 77  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.12.5 | 5 
             batman-adv-2024.2 | 3 
                   bird-2.15.1 | 3 
      python-autocommand-2.2.2 | 3 
                  bcusdk-0.0.5 | 2 
  binutils-arc-2023.09-release | 2 
  gobject-introspection-1.76.1 | 2 
          obsidian-cursors-1.0 | 2 
                 opensc-0.26.0 | 2 
             util-linux-2.40.2 | 2 
                benejson-0.9.7 | 1 
             berkeleydb-5.3.28 | 1 
                   botan-3.5.0 | 1 
                  curlpp-0.8.1 | 1 
                elfutils-0.189 | 1 
              execline-2.9.6.0 | 1 
                  ffmpeg-6.1.2 | 1 
                      fio-3.34 | 1 
                   foot-1.16.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                  fwupd-1.9.20 | 1 
            gettext-gnu-0.22.4 | 1 
         gobject-introspection | 1 
                   grpc-1.51.1 | 1 
 host-softether-4.30-9700-beta | 1 
httping-0e26c53d5fe504eb720... | 1 
                   iotools-1.8 | 1 
           libfreeimage-3.18.0 | 1 
        liblog4c-localtime-1.0 | 1 
              libopenssl-3.4.0 | 1 
                 libv4l-1.28.1 | 1 
           libzenoh-pico-1.0.4 | 1 
                   linux-tools | 1 
              luabitop-1.0.2-1 | 1 
               mariadb-10.11.6 | 1 
             matchbox-lib-1.12 | 1 
           mediastreamer-4.4.8 | 1 
          modem-manager-1.22.0 | 1 
                  ntp-4.2.8p18 | 1 
                 pixman-0.42.2 | 1 
                 pkgconf-2.3.0 | 1 
               postgresql-17.2 | 1 
                 rtptools-1.22 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/5e3de8efebc9c17a175e240951038ba7f808a32b |     
   armeb     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/40fe17d3f62e0588c837fc64fa30ee5fdd2bdda0 |     
  riscv32    |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/e51de05ccfc8f79d5bb9b3122982b562afae5d74 |     
    or1k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/84b5a0b24b060400e63e471f6fbbdf916432365c |     
  sparc64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/5984807d6dd339a89729af51ab1ba0d04a1753f0 |     
    arc      |         benejson-0.9.7         | NOK | https://autobuild.buildroot.org/results/72de0081c9088e885eeb9db68a4ce46d6e3fe1e9 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ab2343c43e169dde247545bd55ae2fa26968feeb | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/d9bdce07ec51abf3a0f9723af1bd4de500ecadfa |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/f80a84cf5c5e0780af4f6f32d15f9e7473cc63bb |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4a745786bd7a4dcb72601ef75e21f0a5806e08b7 |     
  riscv32    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9520f97ecd45f67c38f1fb54224e0d7e87eaf1ae |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4d413ee87765f0f28a19de40d4e8ff85ac5f8455 |     
    arm      |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/8d0d4ac8e581663c250f2354b838e6a89909b627 | ORPH
   nios2     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/11d6d5eb71c9a0aa071fe318a1ce40d75035035c |     
   armeb     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/22096b6caf40b6a904fa27295e186e371d9e0b13 | ORPH
   mipsel    |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/e1be6e944d1bb90c1beafe5dd23ea06d1c50feb0 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/79a4cfc7b1cd7b131d7bce352bffcdb02aa379ce |     
 powerpc64   |            fio-3.34            | NOK | https://autobuild.buildroot.org/results/344c37a2417db1905ba02bf5cde1997924153e84 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/79bc7019805f3a52e34dc3a071e7ec13e702b9e7 |     
   s390x     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/2d50dae96c9573d4ddd8703207fd3dab352742d4 |     
    or1k     |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/5c5d591e468c36e3335490e717b5d1e295bcb0b5 |     
  mips64el   |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ded3c3da42ee887502cd8d3fbee21451d6ccc8ba | ORPH
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/68fda1039e8d43133a67b54578cbb0ab0ce7afea |     
   sh4eb     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/1aa63bdf1410fbd006ea9f8e02adfe9c1ae865fd | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/b8e721de067a4fbd6710d1cdb60baf1b25a32d53 | ORPH
 powerpc64   |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/5ec18a5d0e2fc67699f852577e84e5b4d35a5c91 |     
 powerpc64   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/993c6a5bbca9bd2db9a16c61d9d04444672e7bcb | ORPH
   mipsel    | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/a96a0e4b9e562f5b7c6f0b1de7b97302d05d0307 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/368adc65d7c2a175d5f5274c2716ca0d238cab17 |     
    or1k     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/c5cd32de36f8bd8cd993b0c12ce89629cc86f566 |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e83fe98d81f30bafd2ff0c24a14882de89162fe5 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/074f198213ffbf68b3738d89790f852d43838c49 | ORPH
    arc      |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/2fdf007b2f4c7eae67229b5a849a5431dab5a2ee |     
 powerpc64   |      libzenoh-pico-1.0.4       | NOK | https://autobuild.buildroot.org/results/a77de5c871e639b42ea88099da58f891b7e49898 |     
    arc      |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/596699ede6e651163a23fa50386d84aca24c9a28 | ORPH
   sh4aeb    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/7fce5143863799c200c290d98acb11c0a2ced2e5 | ORPH
 powerpc64   |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/c3fb7f485b5a3f39d9f820564c56e0f25417a41c | ORPH
   mipsel    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/c3ea0b484470153653293b6814b3c88e04571fb2 | ORPH
  powerpc    |          linux-6.12.5          | NOK | https://autobuild.buildroot.org/results/0b71bef8dae08ea9554b4be905f5f188c31ece53 | ORPH
   armeb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a5f045c6a64de0503a4125015e37d79b254f235a | ORPH
   mipsel    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/7e0f6686e8a655fb81d1872d38122014847b87d0 |     
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e01a0f3b6ee1a6ff35a81b45214b6f22983c6755 | ORPH
microblazeel |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/30744dff7134a660a0226dcc6fcef25bc0a1ad1f | ORPH
powerpc64le  |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/6209a868f440363db615aec9f3904213f2a6cce9 | ORPH
    i686     |      modem-manager-1.22.0      | NOK | https://autobuild.buildroot.org/results/faca32787184a566d46bc4a35d63ffbc8e336a5d |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/10f17b2ab074c5126c624f7624a5bd60e898db4f |     
 microblaze  |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/19cf54a534f6491c385ea477ad6e8562d16420c6 | ORPH
   arceb     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/905f763eb8277fc62b46dd6646db3f9b8798eb37 | ORPH
   s390x     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/bc03d453994c7982b5fac3ae27ca81ed80dc2223 | ORPH
    or1k     |         opensc-0.26.0          | NOK | https://autobuild.buildroot.org/results/0d055c2f33ebd62963e261a5cd31365750eebb8f | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/e8dadbf7a436e94c0f4d48fc9a46823714f4b466 | ORPH
  riscv64    |         pkgconf-2.3.0          | NOK | https://autobuild.buildroot.org/results/dd5c50578ea17b38a368e7af06f27e3e84603d16 | ORPH
   s390x     |        postgresql-17.2         | NOK | https://autobuild.buildroot.org/results/628a587160f908e072dd1edb8111eb1ba278fa62 |     
   armeb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/270d1670cbe01c487522ed2eeec5a36f41e11ac4 |     
    m68k     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ff78940584bcc3768e5c26b3abdc84d890dad0fe |     
    sh4      |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/0ea487110640f5d907c26b1ef6f23b09023d876a |     
   armeb     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/daf3622720fd87ed24dcde774b81eb5a6ebe8158 | ORPH
  riscv32    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/ce984788ba749b15eb89292ebb985848d4328446 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/b6e90a3fcf9a4e5916c4d9c2d50aa0851c0f0d53 |     
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/efa49a35eadca9707420c606e99aac7c3ed64920 | ORPH
   xtensa    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5c29133a2dd48987d759b0a1858a9a645653c463 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            host-cdrkit-1.1.11 | 1 
              host-runc-1.1.12 | 1 
          libcamera-apps-1.2.1 | 1 
           libsoundtouch-2.3.1 | 1 
                 sysprof-1.2.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/66f7d5d2335a6b6505d09b9c3b2da617d4d5f605 |     
    arc      |        host-runc-1.1.12        | NOK | https://autobuild.buildroot.org/results/bba14eb88288a83ac5a28ae323c4ae43b134104a |     
    i686     |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/29ea39db60e73f086d51a1dedce548ce09454169 |     
  powerpc    |      libsoundtouch-2.3.1       | NOK | https://autobuild.buildroot.org/results/ed1e05db1cb457ec9615aa4e9597b0a191e7e758 |     
    i586     |         sysprof-1.2.0          | NOK | https://autobuild.buildroot.org/results/de0100a5c33d8ec3ce0c6965c92b7f4d5da5c072 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                   perl-5.40.0 | 2 
             dahdi-linux-3.3.0 | 1 
              fluent-bit-3.1.3 | 1 
httping-0e26c53d5fe504eb720... | 1 
                 linux-6.11.11 | 1 
               mariadb-10.11.6 | 1 
           python-rtoml-0.10.0 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4e9e1ec8eeba4fe3e230386496ecfa86b26afdf2 | ORPH
   mips64    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/3de83fa0df1474613565c04c586767c4ddaf1140 |     
    m68k     | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/711b76c722b458e85b22fa49c2c13515f9d75719 |     
  aarch64    |         linux-6.11.11          | NOK | https://autobuild.buildroot.org/results/c6e4c5d98656c9289ae9007ee819947f36a280c0 | ORPH
  sparc64    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/90554f731981a7a7418bcd78c3adac1f80b80b50 | ORPH
    sh4a     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/0116c03db73dd947c2c6ae1d541373dcde8029c2 |     
    or1k     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/bec0e964496d4572870c66d496c4645a5c73e02a |     
  aarch64    |      python-rtoml-0.10.0       | NOK | https://autobuild.buildroot.org/results/97d1cccff5fa146362eb0824dfb34cd25e6f43e5 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/05777c271a8c5417e01c1a0ad836039e4a0e900d |     
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/706b58cea009ba93b044f3a30dd87fb21a44c2c9 | ORPH
    mips     |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/f111ad60f42e10afe57cb8ffdb6bf541b679aa21 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
