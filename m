Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDFDD10C0D
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 04:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD3461B3C;
	Sun,  3 Nov 2024 04:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gl6smYf-u4c; Sun,  3 Nov 2024 04:17:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B4861676
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B4861676;
	Sun,  3 Nov 2024 04:17:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 341D9723
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 04:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 140634100F
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 04:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAZHApewu2Uj for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 04:17:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B47A4412F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B47A4412F2
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B47A4412F2
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 04:17:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cb6ca2a776so4587480a12.0
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 21:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730607473; x=1731212273;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yUOg+pGiB5qglPegDXRGZEHdm4XT0R03pzSM6uNaKNM=;
 b=cDkCNjSOHr/WgaeHcDkBAfoQeGSsydgu/hkdy75ageayYL6xoNGXq0+UbbjbxHPVUx
 WVyzaxkFdkBBwghWcyc49kJP5RHW6nwq48ppJc846ZYmKnQzFqRfbNa3LoMS6qYg9JYh
 wTLawyav62B1s9R2Zl8/tlheWHxeWaI98rCnrWr3WodyC+KvCx/6t2XtD459b+c8MxLL
 9d2dRjucYY3xxvf+TwoPM6LP1QnN+zFffEaLhXFzB4214g4qWDlzaCVCbPS9MTbF9qfg
 IrtXb313eWC/3n3iEIfjB9RTAr9QLYFPUZgGdNWCopq0i+0PWCyfcHEHltrQpbUkSeur
 33wA==
X-Gm-Message-State: AOJu0YxfB3EjUE0cJliyH4uR1Y1Cxri9i+0RbHLcPEEN0rILVTafGee2
 6E9+MgzoPSajHgHIG24excMYW0klQ8ANy0KXL/lldh6QiYLzXPphxLMpBw==
X-Google-Smtp-Source: AGHT+IFziaUZHQf1Pa35zKtxwl1VQcaxugg0LBNSBHYXgOSAThUIGwqDxuuycKp3xQzHPX6YqNjRBg==
X-Received: by 2002:a17:906:dc8f:b0:a99:374e:f3cb with SMTP id
 a640c23a62f3a-a9e3a6c8e6fmr1452052766b.46.1730607473102; 
 Sat, 02 Nov 2024 21:17:53 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5668499esm378302566b.219.2024.11.02.21.17.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 21:17:52 -0700 (PDT)
Message-ID: <6726f970.170a0220.1ece6.b7c2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 03 Nov 2024 04:17:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730607473; x=1731212273; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yUOg+pGiB5qglPegDXRGZEHdm4XT0R03pzSM6uNaKNM=;
 b=QjKoAZhK6mGhAZL5CEl0MIar5C6O9QRTNNPJfRSiQD/xMHkNh2Tlm7+A1knMZh4HYK
 S5uFVSZkKZZuRZJFNvTpnLt95jHybKSrAEJa5GmbW5dv4juj29Zkb8RDCCAsnyevISZv
 oV04zrBQflWhARjuKxapEMHysvBUhaM/Igv7yIY5K0+obIBhpekYcjovO+QbYJviT3Qx
 vGhhUK40gSBQx96gbYUPG5UCI+66SvF/NGVw+tk4zpqnU4v+65KUGX7TLQNhieA/rAFz
 MOYULqEmALN/e89eB/uVvmy50IgkJ21WplaR7kcnjcDBntwOHjg9dorRK0b7u9sijLG8
 Ghtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QjKoAZhK
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-02
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

Autobuild statistics for 2024-11-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  6  |  0  |  7  |
  2024.05.x  | 24  | 18  |  0  | 42  |
  2024.08.x  |  2  |  4  |  0  |  6  |
    master   | 14  | 75  |  3  | 92  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 4 
                  ffmpeg-6.1.2 | 4 
               procps-ng-4.0.4 | 4 
         gobject-introspection | 3 
           libzenoh-pico-1.0.0 | 3 
                  linux-6.11.5 | 3 
               mariadb-10.11.6 | 3 
                   perl-5.40.0 | 3 
             util-linux-2.40.2 | 3 
                  assimp-5.3.1 | 2 
              fluent-bit-3.1.3 | 2 
  gobject-introspection-1.76.1 | 2 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               linux-pam-1.6.1 | 2 
               pulseaudio-17.0 | 2 
                       unknown | 2 
               valgrind-3.23.0 | 2 
           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
             batman-adv-2024.2 | 1 
                  bcusdk-0.0.5 | 1 
          cryptodev-linux-1.13 | 1 
                   foot-1.16.2 | 1 
          gitlab-runner-15.5.0 | 1 
                   grpc-1.51.1 | 1 
           heirloom-mailx-12.5 | 1 
          host-binutils-2.43.1 | 1 
           host-doxygen-1.8.18 | 1 
    host-python-greenlet-3.1.1 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                 ifenslave-2.9 | 1 
                latencytop-0.5 | 1 
             libid3tag-0.15.1b | 1 
                 libpng-1.6.44 | 1 
                  libsepol-3.7 | 1 
                 libspdm-3.5.0 | 1 
                  libsvg-0.1.4 | 1 
                 libv4l-1.28.1 | 1 
                libxml2-2.13.4 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
          obsidian-cursors-1.0 | 1 
                 openssh-9.9p1 | 1 
                 pixman-0.42.2 | 1 
    python-cryptography-43.0.3 | 1 
             subversion-1.14.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/4d6f2b24e00584d3b24d89c4eafb2b761c341d32 | ORPH
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/6e6c9a6c50593a8273ba31d191c7cc386d708d53 | ORPH
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9311cb495b44175271fd9bd1cbf264ee67d7df6a |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/2e4d65902e35eba7eb052b38ab0ad6573e146856 |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/1abd765115349d9004e7e50a0a3f219515d879d4 |     
   nios2     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/91e72011b04f582a336c114d56a21ce3420dafb6 |     
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/e1950393fda906103cb5ed395914e770f02ab917 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/17562c24407c867f6fa891e6e8dbe7c4b06ee46e |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/351f72cdbf1221d055dae38a2dbbe5ebf2a0c9e2 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/024dbd88f2f14cb0a7494f72a05e6af5479bfbe4 |     
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/00938f8e433cf5c308409d0938cfcb28d9cae512 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/ac3382035f5c6f09411fc8765fbbacd8e9aadadf |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8a7082a0f24ebcf264aeac5e0fea704dc6a6bb1c |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/15f5a05bb7959fbadaa0fccdfd273ba53c617186 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/3484f64441cae8dc02c855c64d96ae153237d242 |     
    arm      |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/a20788e128a99e20dc40b32d1a1c5c89245c2685 |     
   s390x     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/a780a4d75235de223e90357a930abcb7d6b73664 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/aa87de2181b81a9b228d17c1081b92d74385ea92 |     
  riscv64    |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/fdcf9d0981cdda6442a05d9aa35eccfe3859575a |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/f89a9dc00a75ba21cb315890473e33e7922044e5 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8077e69cd10e9962da821c900860074b0d3b2af2 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/b3052d1cec89cc647b0258bda8c73f49e6717f9c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/7ff4845b5112bf853b21f275f818ffca124dbae5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/65d942041c9efeb211d08a8952b035378d60c881 | ORPH
   x86_64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/b2dfc13dcac8396bc7510a4d992558a01d3c9f22 |     
   s390x     |      heirloom-mailx-12.5       | NOK | https://autobuild.buildroot.org/results/38d7dbdd22040e4faf23cc1d67387bda2198bc58 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/370287b5bd6ad5c0e5e644bf9f4ef0284aa33982 |     
   s390x     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/86e550f5a152ef08ea82e317cd6b83950416ce76 | ORPH
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/89cafabe26217eab162d3efdc1b18cd6beada2ac |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b1916f7e3c95dab506af06b0a9c47ecb338b4f1d |     
  riscv32    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/5ae78ca59708db747706a472100d1f320f14ebaa | ORPH
   sparc     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9f2c11f65ce093b934a5e1b2c14a05ed969bdf08 |     
   x86_64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/5644991262bf1634334d8a17149cbe0d8dfe9318 |     
   s390x     |         ifenslave-2.9          | NOK | https://autobuild.buildroot.org/results/b5b4564c31e8f8d59d826c9e0da0d0211455f78d | ORPH
   x86_64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/ceb790518a377371589b6032844834a1a52c579e | ORPH
microblazeel |       libid3tag-0.15.1b        | NOK | https://autobuild.buildroot.org/results/825d00babf67bbccad288d1ddb425edc5021a1c6 | ORPH
   armeb     |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/bdd4af0919b7d313c5ecba8c101a52e1bdfd5790 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/81c085a9b038bb4ff49e826dbed10ac1c258c087 |     
   x86_64    |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/57116749d49d075e5e7109dd514214212f49e6c2 |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/94d6cee7aab9a8a2eb5fc6f94621d674ea0cb4a9 |     
   arceb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/315aeef80bf4a8838d94725fcff5ee70beb63a65 |     
   xtensa    |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/a8880695a87ac7a3974f0570da9a64f8b51ee483 |     
   nios2     |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/8a5dba60032d0aac8263407857a59bc47328e602 |     
    sh4      |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/1f52141ee9a3c484502f178b35844c2dfe210a7a |     
   x86_64    |      libzenoh-pico-1.0.0       | NOK | https://autobuild.buildroot.org/results/a23256eb102e9c93a3556436cf89734de7c6989c |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/018c1a88ffa8960b634cd24ff1a63139b7e94f8f | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/e15b174c3ec17163c05e3e761d15dfff2ec2f2b6 | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/900e4b55c467c3d685e51c9fbaba6f8cbadda5c7 | ORPH
  mips64el   |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/f5784209acce4ae94a83898f145bbd5a51063e54 | ORPH
    mips     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/9800cfdc809751c6a1e7aaff79256951c2c8c3cd | ORPH
    arm      |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/df5eab313f449a48f9f3da9af7ceb96d0170055a | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/09698bb708dce6cd518f5303c9303ddb246038c7 | ORPH
    arm      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/5a52febbf4214dc2e1897dd1c3d375536f0388f9 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/24041ef832e76a3e8d1563095b9842904ef75616 | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3033626364e051d340f819b27f1806c7332638e3 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/e9f88563913cd70b65f3f509f14859879f1acc90 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/252b4fa28f10e11bb539116cd1fd3c327873f8ae | ORPH
   nios2     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/a03b14444e31672d9ae0298e3d8cae8551acc1de | ORPH
  powerpc    |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/bf02bc5c57d5e9fe47a408500abf619d367bfee2 | ORPH
   mipsel    |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/c523ebae94c2a1e9ad4fb0aad8c65ff88ba08420 |     
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/ed1353e4a9b72568ea633bb749c04d34395206a7 |     
    arm      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/367d6f715ef821658ea6b45dcb26dfbd19e6e053 |     
 powerpc64   |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/3f79a2be39c10a876123c31d10d7559bb2ef7431 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/38b468e9aeba73f640f3946c8b2f669b59f6c28b | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1b56f84fa64a0c20008dc6c5efcb4a08c7f71c5e | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e78d79ecd5a91b39420e140e42216621580a2c23 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/019f8b26c32c076ec01ae53374b044e8703d1f41 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/94323b6cb1e9246e25af5571c15615357f22906d | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e02817b572618372e5e7c2c35e4528b4777cff43 | ORPH
   x86_64    |   python-cryptography-43.0.3   | NOK | https://autobuild.buildroot.org/results/a4f606aa8430fb1bb0160243d8a258f82a45bc38 |     
 microblaze  |       subversion-1.14.3        | NOK | https://autobuild.buildroot.org/results/010f586885b1167c45f22e64a8814490d4533cdb | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/79dd424fb743a6a30b4ba26697bc057bc8fa3a2e |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/36c8b6b6e348c7bfddcbe49dffcb0cd02aec77b7 |     
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/93150a47737aa6f80fc0e2d63ff8f67251939046 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/854e38cb8655e91bf9e9c0f7d05cb29b13fa2ab1 | ORPH
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/5051288b4bd205a98b03e1f55d926d5c3a9816d6 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/81c143660010727e709c9adb1c10d048060d8d74 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/0f4b325d3bd7c6d1f88478a5369f23bc1ea012a6 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   foot-1.16.2 | 2 
host-android-tools-4.2.2+gi... | 1 
           host-systemd-254.13 | 1 
                 libart-2.3.21 | 1 
                    vlc-3.0.21 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e758bd53be53ba596ef1114670b3710be1403703 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/ae1db2f175be56c3784bcd87ab75c4cad4676101 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | https://autobuild.buildroot.org/results/b95c6187afaf7df8ceca9d7b2228403479306e5f |     
   nios2     |      host-systemd-254.13       | NOK | https://autobuild.buildroot.org/results/d247fb223791dc73eb9017f1d93e133caeb3879c |     
    sh4a     |         libart-2.3.21          | NOK | https://autobuild.buildroot.org/results/1787cb68db833b14fe393b3a4f040e209eff7d8f | ORPH
   sh4aeb    |           vlc-3.0.21           | NOK | https://autobuild.buildroot.org/results/3cb7fcfa821c4abd64d5678bdb28dcc192c30425 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 coreutils-9.3 | 2 
         host-libxcrypt-4.4.36 | 2 
             berkeleydb-5.3.28 | 1 
                   bzip2-1.0.8 | 1 
                 gnuplot-6.0.0 | 1 
host-go-bootstrap-stage3-1.... | 1 
           libmicrohttpd-1.0.1 | 1 
                  libsepol-3.6 | 1 
                  linux-6.8.12 | 1 
               mono-6.12.0.182 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.7p1 | 1 
         python-pymupdf-1.22.0 | 1 
         python-remi-2022.7.27 | 1 
             stress-ng-0.17.07 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ee612672a035580190ed0386da9b2e02c534fa1f | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/a25e91791a3c29b58fd1da049847c902d418b24e | ORPH
    arc      |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/206cd6ccad79c2e8142c4be20d83e9f0c036077d | ORPH
    m68k     |         coreutils-9.3          | NOK | https://autobuild.buildroot.org/results/60a431daf31bd5bc58f3abf0a05dece7590968ac | ORPH
 microblaze  |         gnuplot-6.0.0          | NOK | https://autobuild.buildroot.org/results/5ff46cfd09e560ec2aa332ea78fb61be89c35443 |     
powerpc64le  | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/763ac50df73f75e5c5f2e1d5c78d98e99958f77c |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/c716129cec8f925af75d968efbaa194e338f0c9e |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/26a5bd5ce1d295b8359ec0dc2dc83f4a64c946eb |     
   xtensa    |      libmicrohttpd-1.0.1       | NOK | https://autobuild.buildroot.org/results/e15d008fd7f9cffede988281c3e687009ed74d8c |     
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/9ff34f05d25886b29624169d03e98e9a1a431c07 |     
   arceb     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/73160639bedeb1243b02bef252cf91bd94af8e53 | ORPH
    arm      |        mono-6.12.0.182         | NOK | https://autobuild.buildroot.org/results/b6aa7c8f8194274c16cff70b542f847e63056957 |     
    mips     |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/86a19e52fae8a17a997041fc2589ced626a1a95e | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/e8087cf8f3376481ff2dfbfdb9ac4a7ea47a4e27 | ORPH
    arc      |     python-pymupdf-1.22.0      | NOK | https://autobuild.buildroot.org/results/36ce098554c602ce7d04a2b6b5d667f9c03f633d |     
   nios2     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/ec613ae23db674d80ffea4401f677e194d1631ca |     
    sh4      |       stress-ng-0.17.07        | NOK | https://autobuild.buildroot.org/results/a20722e7b81c8d522155a89276dfd8d738521436 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/5a8f814e0cffe7c9cb7ca0c24931b4392a61b17d |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                 gnuplot-6.0.1 | 1 
               graphene-1.10.8 | 1 
            host-cdrkit-1.1.11 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/44c4fb44470e8c01ce0c2669b94e1bc00d85efb5 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/335ae1b7cb63b914040d8cf3f11b977900c02db5 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/40b8eba1b5634f6e47ba0db637411c05e6604617 |     
    i586     |         wtfutil-0.41.0         | NOK | https://autobuild.buildroot.org/results/985ed533e8035dd430efd10356e442caa53eb06d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
