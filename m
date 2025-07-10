Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBABFC83F0F
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 03:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A21F831D6;
	Thu, 10 Jul 2025 03:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKay4wMCaUQI; Thu, 10 Jul 2025 03:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31AB183295
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31AB183295;
	Thu, 10 Jul 2025 03:25:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F77912E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 03:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C98D83295
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 03:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPrlbvoNOrAg for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 03:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 002C9831B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 002C9831B4
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 002C9831B4
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 03:25:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so825004a12.2
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 20:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752117948; x=1752722748;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5EMp3UIflv9wO6c4NV/NDe02qp/gLk3XysUL5Q3ZGY=;
 b=FtLiRh71cxrKJvXut73ij/qW+9bEYwOdOa3EoP2dW6op1WnLde8BaGLc1OA2z8kdtx
 9tOpd2H70WKpmM+K9fMFsY4PkIc5J0nigEAzmhbfGas+z+3PFZ2wugagXb+5x2/WzcLp
 8MucDw6i3CL6R+vnPU4a/aMRMmMZIy+8N/fZzYO8jcm5t1OcrM4jYKpUuBrz7JyegXnR
 oDc33WIj3bFls+LZlFUBtR3qp4l5CewndpZlHWwL3/BMkfBRAtpxyuYCP43E+vkXdLJT
 xrrdwoE8sMjzAy/vWydaePgd4f0+UQS6/S77wK/FmOcfuhvc8TnBU6hdLGBFP7YrLoLu
 O91w==
X-Gm-Message-State: AOJu0Yx+/eC+lBG3N4tQ6FUG5hMUESBAMaSyOmnqqkV6pd5+naoowuut
 ymYTjqMz2/65MXR+/DcmfV7Swb5Yc2PrpJp3JDcFZ1bJtaEpujZuTt6AUjU28g==
X-Gm-Gg: ASbGnctf6N8wR5Djw+kC98e+DgNseVKcph6e7/cBvYYTRFpnQowQUcQwshxZQIWUZ4j
 6+i1PIs7XUEpbD7gXocEFJ851alAOv95JgTJBzWDyvVorn+w+xDcZcTK0OG3DkDSGXTkO4Nrdsv
 dL6Wao9SepA2NpEJKmJUhXWXxgc5PPrUpDh+kV4Tbhhc6Ds4f3Xz5vtoH5JAkqwVZuNgtoUFH/g
 NmcRiswJssAYok6MZQiSvKXxq45L1I7PT13cuQbp+05+Ociyfp4dNz4wUk1dQiJ1ZQaSGdywiOc
 pt7V/nkNrpGzbcrellU4El+jT2VqwPiUOOd4ZVKO5bEZjn+JlgAyzAJ5WAMzPtgeFQ==
X-Google-Smtp-Source: AGHT+IGFTXjtsJhdGkiKY/tZ/20rI18EtEQX5DfidWKnZfc5/ff3u3NNKvE+wLZ6lqGBhOiMgPMqAg==
X-Received: by 2002:a17:906:f5a2:b0:ae4:107f:dba2 with SMTP id
 a640c23a62f3a-ae6e10b9f37mr207363366b.13.1752117947596; 
 Wed, 09 Jul 2025 20:25:47 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8264fa0sm48771766b.88.2025.07.09.20.25.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 20:25:47 -0700 (PDT)
Message-ID: <686f32bb.170a0220.bdea.0eab@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 10 Jul 2025 03:25:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752117948; x=1752722748; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=R5EMp3UIflv9wO6c4NV/NDe02qp/gLk3XysUL5Q3ZGY=;
 b=SbM2mJs9wOHzFEhsTzCv21azeR8jPy1fiQBmqJ4V6mudclhHTLdXLvVukocjU4YIf8
 bzpq91V0Q6WjKYJO9uVf742D7T1DwgxyuPWL8gcZa9B9DMs89OeFEatDEKRIAN4JzSEJ
 97IXVJxoE8z+wEtSJvF3hRacwrCCiDdekCI4xZfvUuP4xCrQO1UWt+lMYpCgFtocEUDX
 gCGwr2VIO757S/QB8Fl0kKPQXmZQcnCfxWo5lw5ysZz6VMqlnZzJMlFDv3YusyZ4+Sf0
 X/mfNcwV8nYMp7a6+i1buE6rb7nLO23+go5KETxKWouXftf/nSN/Fg6rDhw5nuPSevok
 wH2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SbM2mJs9
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-09
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

Autobuild statistics for 2025-07-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  7  |  0  |  9  |
  2025.05.x  |  5  | 11  |  0  | 16  |
    master   |  6  | 35  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
               ebtables-2.0.11 | 2 
                    gpm-1.20.7 | 2 
       host-gcc-initial-14.3.0 | 2 
                  linux-6.15.5 | 2 
                 siproxd-0.8.3 | 2 
                   avrdude-8.0 | 1 
               bctoolbox-4.4.8 | 1 
                   crun-1.18.2 | 1 
                   cvs-1.12.13 | 1 
               dvbsnoop-1.4.50 | 1 
  gobject-introspection-1.84.0 | 1 
              host-rust-1.86.0 | 1 
               host-vde2-2.3.3 | 1 
             libargtable2-2.13 | 1 
               libcap-ng-0.8.5 | 1 
                 libcddb-1.3.2 | 1 
        liblog4c-localtime-1.0 | 1 
              libselinux-3.8.1 | 1 
                libshout-2.4.6 | 1 
              libzenoh-c-1.2.1 | 1 
                   nanocom-1.0 | 1 
         openfpgaloader-0.11.0 | 1 
                 openmpi-4.1.5 | 1 
             parsec-tool-0.7.0 | 1 
               procps-ng-4.0.5 | 1 
                python3-3.13.5 | 1 
      softether-4.30-9700-beta | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/23838ce1b0fc655bbbc8d4f4090f770a7521b746 |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c212d0e42ff9cace7d25744a47ec15eeb300b059 | ORPH
 aarch64_be  |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/846567002840e694b83b06937eee7ea02f53b9f0 |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/24f5eba9f1357b796693396b1243ef5455fa9564 | ORPH
   x86_64    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/5681064c5d880a5e800dca93bed09b0c43a334df |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/ff33e0779fda83f767ec915d110e9036c6386dee |     
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/11d02a3f20e739279c2a0748b86170f6a53c02f2 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/33a5963383a514b0a7112c113a0a7771d77f6ae3 | ORPH
   armeb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/f0a30a34e208e5d01bd17091b250615e81276e02 |     
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/b00c4b889bf13fe5e298413d120ad055142c3d2b |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/f0c8293052e02e0469f2c36cc679bdd05fb56bd9 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/1593026d84fc20d65c86dca8f6fa6a6a55506b05 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/5c106ffacd450de6b325a08a2f9b68c445be8c32 |     
  aarch64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/05c32f308a4be07e411585817c1e4f3d2f825cb6 | ORPH
    mips     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/c7ce99cb8225e1540fcb8c85b243d09a632c8fcf | ORPH
  riscv32    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/3b5e69d8adb0f4be648d3448eba547e1e56fd77e |     
  aarch64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/fbd0d025ee0f5e2a8849da7456058ed694c66168 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/babc89525ae3a169e5cf7cc202e573c6a61b8f84 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5512075869fe77d1e9006a03595bf18a33061cf1 |     
  riscv64    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/ae2e2a30195689c41f9b1b87330fada482975cbd | ORPH
  aarch64    |        libzenoh-c-1.2.1        | NOK | https://autobuild.buildroot.org/results/bd016ac2d70e00a2275f07c4fbd1bb32215cb668 |     
   armeb     |          linux-6.15.5          | NOK | https://autobuild.buildroot.org/results/5ffe98b66c53fac8ed841f8408518af84baf52f4 | ORPH
   x86_64    |          linux-6.15.5          | NOK | https://autobuild.buildroot.org/results/847b3b3cfb343ffd9d904837623e9aa0d79c387e | ORPH
 powerpc64   |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/fc58487c3852d85f76503b632cf757dd8910d14f |     
 aarch64_be  |     openfpgaloader-0.11.0      | NOK | https://autobuild.buildroot.org/results/c0adb41129f533b6377ff5237b2d6108872df9a0 |     
    or1k     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/4004cf151d8dab8d5fe6f45df93fc79398ecb0f1 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/ed98d751645ef3294445a5d23649266d6774e99f |     
    arc      |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/56b76fa8a6d9798dc0cf76c07fea24246524be39 | ORPH
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/54922570fc1f8dde9f980cfbd42f368196dd847c |     
powerpc64le  |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/082efccb72ed7a2af2b90b9eed07e20a2280339d |     
   s390x     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/45fa84b5f1f6fb9e815ffa5ccef3fbba146a92b4 |     
   mipsel    |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/6be42392b8dd3e6a681486981f2edd914956d1d2 | ORPH
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/c4ea6ea0b3ea67b7e6028d5687de375be07a8452 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/6a3331680421c4b6aeb48c3e94286d974cb8732a |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/0c0a60602df57c0efd8e52ac00e27b234e0c7640 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                    bmx7-7.1.1 | 1 
host-binutils-arc-2023.09-r... | 1 
      libabseil-cpp-20250127.0 | 1 
                libressl-3.9.2 | 1 
               openblas-0.3.29 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/bd1e676f72e3779b45e2f12ae7626a71f3b4043e | ORPH
    m68k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7286980add62604a4292a951202fc123002805d9 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6824d2d1787bf2653268a5931696a0ffee713f76 |     
   mips64    |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/20ba7bf125c6843f173fde7257a9dad6b4c269ad |     
  aarch64    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/910620e74d2e29db7bbbb198206d61cfa70c9866 | ORPH
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/1b452a7c7bfc966c1a6b72fbe666c3cb774fa7d7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/0adfed54947f68edc6c514393d408bddd6af998d |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   avrdude-8.0 | 2 
                       unknown | 2 
             berkeleydb-5.3.28 | 1 
                    bmx7-7.1.1 | 1 
               host-vde2-2.3.3 | 1 
             libiec61850-1.6.0 | 1 
              libopenssl-3.5.0 | 1 
package/mender-update-modul... | 1 
             python-webpy-0.62 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/5153a806fc80cf43ecd0d65d90de28e90b319a59 |     
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/bdaba1b93c5a573e479fcd090d38925526ec32bc |     
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/d39bfd7116a663f982fc72ef62e5d5dcabb24880 | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/caf396561ea9101f6ec7524b1276f641535e8a19 | ORPH
   s390x     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/88a51f3a2b76f3223e9006e3b64509c3483d4e9a | ORPH
microblazeel |       libiec61850-1.6.0        | NOK | https://autobuild.buildroot.org/results/9d64209122bbaa5e4b8770e499ce50ffeb1b2377 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/c07dbdf9ec53ed678446bee389e10862b103dbd0 | ORPH
   s390x     | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/a4c932d06472ae8edf90bcedf69a72d60937825d |     
   mipsel    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/190c2c4edaceeef9e6ccc007a99fc89967c8ea93 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/611738da36651e3a98273949f6ab86d87005347c |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/e506c9048579228ee00a4c3c62dae968e87af459 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
