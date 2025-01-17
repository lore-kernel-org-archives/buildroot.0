Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80D4C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 04:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 066BB6FADD;
	Fri, 17 Jan 2025 04:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZ34x2hzT4LI; Fri, 17 Jan 2025 04:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE0746FAC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE0746FAC5;
	Fri, 17 Jan 2025 04:14:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2CE1B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 04:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DBDA6FAC5
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 04:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-ZioeoN3Fx2 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 04:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10E72611C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10E72611C7
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10E72611C7
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 04:14:29 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so349729966b.3
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 20:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737087268; x=1737692068;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1qatoxMJBLFE5jg6xu2MXhaEAYYd2N81h1CEUgKJEzw=;
 b=bNLi/6+7f0AANo3DZnU4Ti2zTSNGtfEOnArKhn9AjV5L6uOl1KC4ju3jaZXyfTZB1M
 l1cIBRyaMuT+9qKx6VBY71vz68TUEZmjy5aUdZVG2mKU5+mT1XW/T6mBg717NFgbcwPa
 y9AG0Jk48NtfxK7xBp9cNsCV5XZ+JaoqhPzkQtAGFcqc9Rx0wAMS2Tyrgs/K3Myb4ByR
 XtATT3sVWFgRx3hvWoK1OChu/TfxiHA8LGs1H9VEpT/0UvdC+W9zgJEyUdivvjQbEy+D
 xPu0Jz8dhwI1x4whda39iiLxUp3IRxgi/0FOxs82hDlqziWOk/RK2bkVneNcYlMlSR5t
 PJ5Q==
X-Gm-Message-State: AOJu0YyAnPOxdaJSH+5wMZyb6Gs+IP2VkrjHYF60ehc/rKkY0nov/mAv
 lGHEdWeuhexha8Cz/OZOLzbAb2CR9AS2E5LFKNMhVzPFHNCxVVk81Nu/HQ==
X-Gm-Gg: ASbGnct1g63JJLkHbGOwoluFlmRH7jVIHCVPWoGLyYspmsJtPj89lGleNLolxscqQti
 hXOHEMS/xCUlwlHeLrSsrL7OhNgqKaTzbyORi4L7AchnldzwpU0EA9T7079FsgmGJJD0KkdlpEB
 sxRuEPW1woCY+eNqkpJD7T+/dKC5UKAJOaSZ4g9FlCcNP6oz1CgI6p9lf/DCsd6LvoG3A0JnxsM
 wx9g90sZJeQYMTIUuIzzIB45jWOiLQ2EOJ4byTkdQJwVGYJV0x75myfkvuR
X-Google-Smtp-Source: AGHT+IGVotlNmxeLjMQXlIcaghR4x26lFG+nveioQLDy8Ch08Z8nsS6G3c2lmwOYGXKYsOrfFZrZLg==
X-Received: by 2002:a17:907:7b9e:b0:aa6:75e1:1864 with SMTP id
 a640c23a62f3a-ab38b0ba2aamr123276266b.4.1737087267736; 
 Thu, 16 Jan 2025 20:14:27 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce105dsm100182766b.39.2025.01.16.20.14.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 20:14:27 -0800 (PST)
Message-ID: <6789d923.170a0220.ab17a.335e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 17 Jan 2025 04:14:27 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737087268; x=1737692068; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1qatoxMJBLFE5jg6xu2MXhaEAYYd2N81h1CEUgKJEzw=;
 b=nPVWgydDn4JuStXL8pTgFv2Tna4glackIMiGIgMbBEbh26v2ykBtz/3PbQNVIdwPRA
 JVa/eNWToAl2EEB3uvKz0zkxn+K4AxhaNDIeFFtyYJN+8t+gjM/07TdTqKcW/0UcYd43
 F6V8/PBCeAhfZ8tJK6f4Qw/61/bp6TJO8dMNohENSkq4Im5gmFUt01vDVuSZZTfLiLeX
 xWZDBgcJtqbDcm0phZbOtGFnprSn1hwBUgvQAu5Mqkde+Rg9TNhrLyiUL4Er+65Xxic0
 DMFsb5wvcRaVDsx6eeR4TW+IjVCCbisu9vgbkfbtEnqHBmWM3mjX5G8YcX49AgY1Xqur
 tnkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nPVWgydD
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-16
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

Autobuild statistics for 2025-01-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.11.x  |  3  |  8  |  0  | 11  |
    master   | 13  | 48  |  0  | 61  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 4 
               iproute2-6.12.0 | 4 
                  ntp-4.2.8p18 | 3 
                   foot-1.16.2 | 2 
                   perl-5.40.0 | 2 
             util-linux-2.40.2 | 2 
               aircrack-ng-1.7 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
               bctoolbox-4.4.8 | 1 
  binutils-arc-2023.09-release | 1 
              capnproto-0.10.4 | 1 
                  ffmpeg-6.1.2 | 1 
              fftw-quad-3.3.10 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
glibc-2.40-18-g564178076272... | 1 
host-heimdal-f4faaeaba371ff... | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                latencytop-0.5 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
              libunistring-1.3 | 1 
               libunwind-1.8.1 | 1 
                 libv4l-1.28.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.12.9 | 1 
             matchbox-lib-1.12 | 1 
                  nginx-1.26.2 | 1 
               openblas-0.3.28 | 1 
                      opus-1.4 | 1 
        s6-linux-utils-2.6.2.0 | 1 
              sdl2_mixer-2.6.3 | 1 
squeezelite-71c012ad9ba102f... | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                  usbutils-018 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        aircrack-ng-1.7         | NOK | https://autobuild.buildroot.org/results/2a3faea6a75ec130ab293d5737090b875f02391d |     
   armeb     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/051b1eee7f06d7b5741724faf419f76fb86d2b13 | ORPH
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/68a47526c496d00be228125b11b28e26c50addb2 |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4e287be5fc90d29758ff45d7a1d2f5fd32b142c0 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/7d6a7966243034f3a9fd81d70287060207068ea2 |     
microblazeel |        capnproto-0.10.4        | NOK | https://autobuild.buildroot.org/results/d9731098450eef5b1d05e79dc71ed0d23cabf8c9 |     
   s390x     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/61bec1679fc585a4935774535ad26d5f91f93011 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/ef6601a37e6b4003a2767861a19e267b0529719b | ORPH
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/024e0d2a9b2eb4b8e6723a6fb26374e5825579a7 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/dde4f30298c0caebde7149c1c16a7171cd3521ef |     
   armeb     | fs/axfs/axfs.mk:32: /home/a... | NOK | https://autobuild.buildroot.org/results/40281ec9fda3666809e871b85ff45c4004720376 |     
  powerpc    | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/0d803ac6c2cd25615a2a9f609c807fa09f5da709 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/7928eab9e84995c2b309194f51d0afc09f8ea5d2 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/d12ece6eca3841b085f1497582651839ebf55b41 | ORPH
  mips64el   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/def56c4333d06b772e7094e5823f422316c44bc8 |     
   x86_64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/eadca3e3940ccd480638c27ee25734a9ea239945 |     
   mipsel    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/e3b815036bd75420e172411e6e02147bd7226b81 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/64b4866d6208fe738fd4d72ab6b9d31ee9b3c686 |     
 microblaze  |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/0c6e73bfaf9ba543a61465590f59784c36a17a1f |     
  aarch64    |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/029493e02f5c2858fc987ba7a4c8fe53deb27017 |     
   armeb     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/ef7edd57342191cf19ff1cf91088948610e46968 |     
    m68k     |        iproute2-6.12.0         | NOK | https://autobuild.buildroot.org/results/1be35f438ce75074be39b42066d1281c6fdae594 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/7c2620f6bae6698335f8e79a6fadc32986d522cf |     
 aarch64_be  |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/f6b09f29abb2058135ef50648136b02ccedcd5e2 | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/f839341ae9cf3ca9f8dac5793683c72bc490511c | ORPH
   armeb     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/4cbe6df98d2e91604241b52e2e73ea223da0ac9c |     
   mipsel    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/f764bcc7963bb5f0210cd785dd990da46e9e9dbe | ORPH
   sh4eb     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/e3f4f83f02fe9f01893881cabca2c5551408e782 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bf60248538c36994d7c21c92a950367199b83b4d | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ca4deccc7dac8938cc4ca17b3f421023c497de1a | ORPH
powerpc64le  |          linux-6.12.9          | NOK | https://autobuild.buildroot.org/results/223e2e52f50a4edcf503731e20f97977b094478c | ORPH
   mipsel    |       matchbox-lib-1.12        | NOK | https://autobuild.buildroot.org/results/df5ccd64a8dea767c52a21f2f97493701b2318b0 | ORPH
  riscv32    |          nginx-1.26.2          | NOK | https://autobuild.buildroot.org/results/a3388e027c4837593176485fea7774afb9ab6abb | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/dd2dcbce2bc6c534b142538a1856e6f01567f649 |     
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/05dc084d3aa7274679d86771852b49cd2f71b522 |     
    mips     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ca82831e3596a1698fc4016f886bc79f31aec27e |     
   mips64    |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/5ede593de4a746627350c4092fd9043123a84f3e |     
   arceb     |            opus-1.4            | NOK | https://autobuild.buildroot.org/results/27b2d7be9b358ed841ea90abcd505e0358fa9283 |     
 aarch64_be  |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/8cb2d6a24e2f57530cf67bdb3a810a52a6690f57 |     
microblazeel |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/f02df1e4e4fa661b38d3093ca3869db9bf8ec98d |     
   arceb     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/ecc44f0d3cdb3db052c41942794cc047e38e8e15 |     
   arceb     |        sdl2_mixer-2.6.3        | NOK | https://autobuild.buildroot.org/results/fd0f96c2a11c57f4588d4adfed0a1bdc9669f5b3 | ORPH
 aarch64_be  | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/348c9265c5ac5349be23a1304bfc155622cff82f |     
    or1k     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/e72900c04b1f5e418322c5a37718341ff91ab4a2 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/989a8de6a281148974759c49e02412f34f51ee77 |     
 aarch64_be  |          usbutils-018          | NOK | https://autobuild.buildroot.org/results/665c064bf28a325a8bc4d9fe16f453be48472e57 | ORPH
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8585a53125e18b75c8b530f1ceb30c69d1c481b8 | ORPH
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/43736beb271732d3a62f3912e318dfaa65bfbd03 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           crucible-2023.11.02 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/fed09f01dead4bda03199fde45fd4c8f6c85e021 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/b10c92157fbf203b153c6f4698ef8ded3620c6dd |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/3eb7a7cee489398ab8e7784f748c5da6372daaaf |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                    bat-0.24.0 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
                latencytop-0.5 | 1 
               libsigsegv-2.14 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.0 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/6bc145386b973a2b099cae5e34ffee9d40aae84d |     
    arm      |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/197cc7634e35b27c7861a983d4880d131444345b |     
   sh4eb     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a44e5b3ac0ad4889012665f99b459d733101ee3c | ORPH
microblazeel |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/b2fe6583dd25797e18e32763c674091d9d6811bb | ORPH
   arceb     |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/2b45357a2e851e5bf8a4848c4ec710f503239f02 |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/3a067c6fd8e92f824c8c618082643cbdd327658f |     
   sparc     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/53ebd32bb36b7c59c4b5e9e29f5713c5f1b14e14 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f2a94d67a47f7b3fe09950a762603ca5ab6f511f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
