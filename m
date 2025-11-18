Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225ADCCD19A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 04:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B75340567;
	Tue, 18 Nov 2025 04:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmUfF3bmmQUm; Tue, 18 Nov 2025 04:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A24E405D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A24E405D7;
	Tue, 18 Nov 2025 04:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF8CD5
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 04:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1368460ED5
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 04:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQFOC8mNqtET for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 04:21:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 523E060EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523E060EC5
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 523E060EC5
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 04:21:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b38693c4dso2190586f8f.3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763439668; x=1764044468;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qix68Na9sWTRs6f0h71eeCrI5vpuwCGj1zvwrPzusDc=;
 b=MreynqyPowwK2KOrnOOBEcHySZhlgvhbCZqpAnHW5tuQHCoKdGohXKRlVpd+TIfJus
 JocIkXAdmLXlrnlCFQ74gCxGPu72zFzalcsIH6aTX0i4dNkieYu2ZwqJh9M206sNL0qC
 fYDxLK36A0IdpP/sJGsMlDmp2/jYHZSMRWXmXDuoLKM8oMGYIbMcoeVm0ObkYdYhuS0t
 /L1sFAKBO16MiNkI1ay69FPVg7FMiiuXa1p0fVVbb/ONuvbrzncwcbQ2AdgDkoNli5H3
 /NWEutai8BG+LFonK+Gb44Xl+y0YRcghYhButhyvkhmzVqo+RMm2VrisbEIMPMG8ndk7
 gZNg==
X-Gm-Message-State: AOJu0YwLJ/MmyM/TQe6VRQsVBRQzOyk2L64oCh3rXX8B7wgZ7bC+IJF0
 z/c0dwSBK/suR0uNEXRSDHO8FQXDHZay+54Nd2RDW0ubALsD3bMZnQ7GC0z2yg==
X-Gm-Gg: ASbGncuKUaC416sSSSlRHdAYcNeTWflOWCYaZzb7Muwa1PhdyootXmOL2Y+DOVyOOoB
 S0Ucg/yX8+Os41K1Kj6DeGiKderNl1fFOVRHg9Y9qIFf6C867gJgb3gbDhdfA6hfdDeY/oS47dB
 ht5t8weKM3SBhPijDvwt6kPsOGbSf0S0hvKBiW4M+LXFXGtU6RbbEB9HnhdbRgVFzm8ZI9SFist
 tbh483UsUR7Axvkmg0YcAeSDsoiuG7nOr3hvqy6HVPiVaj53s4EOeBER7/0yj1xb9gWj3RAQylK
 9xFbHjEr8FAag8XJZvy9hYO77uf5VbsK/E+4loZylk/kJTl2lchito8ehfksECljnJuwIT+Z9yn
 C08aAGfZxPSqskZZX1qPvBBuTRgOK3jsG/1YbTjX+4sTEYVEsDg2Imupnk9Z+XOk8nH3NFmbmJJ
 WE8y/Cxd5gZNBJmy/0XA==
X-Google-Smtp-Source: AGHT+IFAvJoZkPx3fY/MgmaMvnz2GOYAatR6aItcnBwPP05e96ivZhvosE+khRQ5e7BS73+oJUQARA==
X-Received: by 2002:a05:6000:2a0e:b0:42c:a506:9dad with SMTP id
 ffacd0b85a97d-42ca5069ed0mr4334987f8f.39.1763439667932; 
 Mon, 17 Nov 2025 20:21:07 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f1fd50sm29444915f8f.38.2025.11.17.20.21.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 20:21:07 -0800 (PST)
Message-ID: <691bf433.df0a0220.caf54.b308@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 18 Nov 2025 04:21:07 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763439668; x=1764044468; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Qix68Na9sWTRs6f0h71eeCrI5vpuwCGj1zvwrPzusDc=;
 b=nbqU63csSetXnuZokPkKETqLBfolnodcqe2xris7kL+Gm7UmMcKsY5fiNU940lTV6V
 i+y7HOb/SJc0L3TVLERj/JO/a+w0+F5JtwGd1vqbGbXI2QAbDhtakFH/3Mx3BXvXkvoe
 BocjQNHUnpS8eUU09fh4dWfBzEvcYwRqCOSbInU6Rbo/tO7kfBT0jN2iXH5gA/Vz162Y
 otNDnzBU87fF+YpWHUmF33J0pJOepBxjdhvjBwD/XFqcs71fV4GRFBvWaCwY6ZV/nNTs
 hU28JY1hFWEgores3f+5nQYD5JfpMEvU85w9OWhf3CsFh2tNKYHngbytJC+Si4HtVp07
 BAtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nbqU63cs
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-17
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

Autobuild statistics for 2025-11-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  6  |  0  |  9  |
  2025.05.x  |  1  |  3  |  0  |  4  |
  2025.08.x  |  3  |  7  |  0  | 10  |
    master   | 25  | 83  |  2  | 110 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 4 
          aardvark-dns-v1.17.0 | 3 
                  brotli-1.2.0 | 3 
  gobject-introspection-1.84.0 | 3 
              host-guile-3.0.9 | 3 
             libgphoto2-2.5.33 | 3 
                  linux-6.17.8 | 3 
                   perl-5.40.2 | 3 
                       unknown | 3 
                    bat-0.26.0 | 2 
                 c-icap-0.5.10 | 2 
          esp-hosted-1.0.4.0.0 | 2 
                      fio-3.41 | 2 
           host-openocd-0.12.0 | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                memtest86-7.20 | 2 
                netdata-1.37.1 | 2 
open-plc-utils-1ba7d5a042e4... | 2 
                openocd-0.12.0 | 2 
      passt-2025_06_11.0293c6f | 2 
               syslog-ng-4.8.3 | 2 
amazon-ecr-credential-helpe... | 1 
                  assimp-6.0.2 | 1 
                   atop-2.12.1 | 1 
                 coreutils-9.8 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
        edk2-edk2-stable202508 | 1 
                        ffmpeg | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
          gitlab-runner-15.5.0 | 1 
                   gvfs-1.57.2 | 1 
                   host-gnutls | 1 
                     kbd-2.9.0 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                 libbsd-0.12.2 | 1 
                   libcap-2.77 | 1 
libdill-32d0e8b733416208e04... | 1 
                 libjcat-0.2.3 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.9 | 1 
                  libsvg-0.1.4 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250530 | 1 
              luabitop-1.0.2-1 | 1 
                    mpir-3.0.0 | 1 
              netavark-v1.17.0 | 1 
           oath-toolkit-2.6.12 | 1 
                openssh-10.2p1 | 1 
                 pixman-0.44.2 | 1 
          sane-airscan-0.99.33 | 1 
               tcf-agent-1.8.0 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/aa51f39105d0bbab136ea8302eaabbb0a6f4a86f | ORPH
   s390x     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/fee96742ccccc77495084c8da244ae6ca8329c9b | ORPH
  aarch64    |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/e3fcb5e11f2ebe282dc5b3acda90c372b2cd07f5 | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a8790c60373ea1014d2b15698768d120df08e167 | ORPH
    or1k     |          assimp-6.0.2          | NOK | https://autobuild.buildroot.org/results/e0d3f8ebabe01acedf43e6816d8f5be32e4c64c3 | ORPH
    arc      |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/b832c666b45e25705cc72df39f6531fab5357eac |     
powerpc64le  |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/14ede092e918b3929ee8257a0ed03833dbed58fb |     
 powerpc64   |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/41d2fb558a7539e426b979ee6bda64066392a52d |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/3476ec7732cf30cbe3950a5944470d19b8e46b75 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/a273939f1fdbd0a8a2a18ac198a6b676c1028437 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/8cba2f3e992524eec49ba073b5cbe1b3855de830 |     
  aarch64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/096dd92f21055ada2a39226b099df7ca6a4f5c84 | ORPH
    mips     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/c3979f3f462add9918e8281f16fb57593db285b5 | ORPH
   sh4aeb    |         coreutils-9.8          | NOK | https://autobuild.buildroot.org/results/f50157211c649fcf6f65a6a9dda3d84dd3475915 | ORPH
   armeb     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/a5b584282db5c71d9ef555a505d11c2a8932d07d |     
    sh4a     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/591d3de8248024f74d5e81d155c0f9f67334fbdf | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2e903f599e57be1a4ce29169e70e05f34b5fe2b1 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/74fdd20b3cffd7ae5420092b0c8ed154a55ecd1f | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b6e37c9b81232fa843bc5ac102c414cad7d13731 | ORPH
 aarch64_be  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0148fd98fdd352c8040054a51d31726fa516e068 | ORPH
   x86_64    |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/7b41cc1ce005b5c5153a366fdc65b24578e4ebe2 |     
    arc      |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/3c28421241fc1b228410ee93b30d8cf68d03f826 |     
  aarch64    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/ab3fe4acd24b6c187141db9ce515521bf93f1eba |     
  riscv64    |             ffmpeg             | TIM | https://autobuild.buildroot.org/results/b7d3691f90cd4a7e14e6b65a355ee7aa44cea54c |     
    or1k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/260138bab7d88ac8e4c3dd1818cd20728bcd55b6 |     
    or1k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/b8c60002958650b8a2ec9492a0afca0f9aa7eb75 |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/aca6fc19ce66bbe7f7303e483527e90dd971128c | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/34c94f97b67315573498240d4570cc1bf244c2fc | ORPH
    arm      |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/00ea272b92c5759e1c8a1e79766b41926e06414b |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/881965f4f4837e17e4bbdab7fbcd92483bd3d57c | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b040ac32e8819bc9b77cb779d67418d72d4139f1 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/be6cf368bbea6d424ff99e8db6bb562060e29502 | ORPH
    sh4a     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/5a1b2fe3a60d1704e315e01ff045554d5f76b7a5 | ORPH
microblazeel |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/150c3349783f6fec0ed423adf2dca6ba56968c99 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/dc00cef33ad8bdf92b1313a59464f86e0ab766c0 |     
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/4dc83a509e4baaa3912289276b17b53598cb7ad1 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/ff8d1bbe168286f73219f0cfc4d2062a1890158d |     
    or1k     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/9f7c87bca0ba1a0e66c8e84a60903f36ef45e4f7 | ORPH
    m68k     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/25e2718f2c51b6848277ecf0b9cf0c1e8fcb100a | ORPH
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/57f13fe4a1287eb5cb45f3339c976b15dcedd502 | ORPH
 microblaze  | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/3fecdd6919126a302d8f35d7e371201d3211cde1 | ORPH
   sparc     |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/4e3d462a7069264c39494952e0b6d2833c4064a9 | ORPH
   mips64    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/ffd6818bd701ae5593cd76845792545b8b5bda7c |     
   x86_64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/e6d2a7a2908aa68c61b9edf552a2f45fd5b4e4c7 |     
   mips64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/651b9b619fbb44953008c555354b3181f8d43953 |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/ccf34795c0fa2b7453cee1c44bf018e5eee3853d |     
   sparc     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/553529ee470cb517bbde7010a77d48a2f2723c3f |     
   mips64    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/9a1cee490a57c192e341b62b4d96641d10bb5dcb |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/f565cfe6d7887aae09b2c9c432fefacd827557d6 |     
    or1k     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/3f1c192cb1e5df392789d09f4f7ef4ed712480bf |     
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/75be8f3edf97484cd3897a21ce56a485bad11926 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/26e2044813846f88d22704b86bb7fa6442ceebef |     
 aarch64_be  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/052681c04362b90a536825db7b84022d0cdf1e0d |     
    mips     |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/fd26a6225bf3545ad44a38b084a6a3af530f1fe3 | ORPH
   sh4aeb    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/8a62a1c220c248554d1d026129fe2cb6b19e44d6 | ORPH
  powerpc    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/56a86360f7194f103e9fbf805916ce7cce5bf8c3 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/fd43f3797834192db16b134eae49de68ac76d7c4 | ORPH
   x86_64    |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/af03fe15f6c14f28bd0ae4ca824b397bffe2c6e0 |     
 microblaze  |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/270f55f5bbb710ffb42bd786c465b741bd88e476 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/bb9ac257e1cb78fa55fb0e8703ba0200bf7bee88 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/5d9b292f7590593eff4cba8a5473e8deff5a2dbd |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/63054397010cd101e1d12f92005933deac0e2d24 |     
  aarch64    |        netavark-v1.17.0        | NOK | https://autobuild.buildroot.org/results/9fc2864149c66aac027b5938cc080ca47734d37f | ORPH
    sh4a     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/736b1ac379969943b0f0df417a48765026e6d3f8 |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/6ebc3e4112d3277288a0f884d8aa540833ec47d6 |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/7c6f2f25d522a567202b5540a37dfca203b73897 |     
    arm      | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/fc1d7fb2fb0e3aa4a1ef0d216ab4a337ec113b21 | ORPH
    arc      | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/d671fc7b103fd3208953568751fafcf68c917e33 | ORPH
 microblaze  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/e65c6296ed2dd5257b63398214df7bcbc5bcdf21 | ORPH
 powerpc64   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d0ccfc8cc38382c6bb48ab2f700a13c959c9cddf | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/3c989fead45968d9f3dd89ae32f8e29878550698 | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/6b03c2ff02393a4d627a589b10f7053c22e008e0 | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8a42aa0a3d3c3767b4a004b4991176d80e2ae6c0 | ORPH
 aarch64_be  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8d94159d3715d2d3b8a603cd611ffe6bda9a374b |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/959a057dce23744ef0b6b49d0f2bc88ee334ded0 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/60ba0dc39e19f6cbc1e5e0c0529042885cd62410 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/6445510e8d638de8da5969fa1d7dc134a0e3e256 | ORPH
  mips64el   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/15cf37490369ec13683d50faf9dd26d9c1790e9f |     
loongarch64  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/874c1f78cf0243ae6ce59c3658583a0c22e4ae47 |     
powerpc64le  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/2a3a809545beeb28898b12b85e799e76bc062c90 |     
  powerpc    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f8b4ff00bbff4cc8572b27b81acfe9065e8c30a0 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/2dfa6e57600c8ac4d11b3f38014e7fa4de0a47aa |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e5a7fb39d4091636e103ab55a55acfdf7d11436a |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/9f9f92f990eb17ddf682b95fb2ee416d8660c6aa |     
   sparc     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/399108140f1932e867e2907c5fa1be2add53beab |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

             libargtable2-2.13 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                 logsurfer-1.8 | 1 
                     nvme-1.12 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
                python3-3.13.9 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/fc518047704d9ec67b92712d244170d979a0d210 | ORPH
 aarch64_be  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/c7a4079cd9210df64c3f1854d93d5ca34b14938f | ORPH
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/3e48525ecb7a6304e16187e9ff2b4b315d2a6fb9 |     
  powerpc    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/ba070ec3f666685d18c9c795aeacc4b3e738b8e8 | ORPH
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8600d85de5fee34d2031d4863a2c8899e51c8102 | ORPH
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/30e93527077c593d3b3af8f865152dd3cfa2a8e9 |     
   sh4aeb    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/fc61135ec542253143f6393936fe1898e6935425 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 2 
                s6-dns-2.3.7.2 | 2 
               bctoolbox-4.4.8 | 1 
     libphidget-2.1.9.20190409 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a5755a400cb52968ed0a18f79ed8dd018fcbbf9c |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/23c95cab9da7aa3cc5cab3d1912e933d7b5eb56a | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/2d2b34b07afe6095e0d7af8e680c7ec28119b81c | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/ce5dbae9b05f15e6b85bc7a09a1c70b733d26f33 |     
   s390x     |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/70b714a7f17a3160f11b04b848dabad928edc72f |     
    mips     |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/936ee2ae517a295fb674ad046414ca6bf5049df3 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

cpuinfo-8a1772a0c5c447df2d1... | 1 
                libcurl-8.16.0 | 1 
              netavark-v1.14.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/016ff630ff17ff80aaf6a42f13cfd0b63116d144 |     
  sparc64    |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/6ec29203231c48baec00a2e390c1b20ffad2af41 |     
  powerpc    |        netavark-v1.14.0        | NOK | https://autobuild.buildroot.org/results/209bed64e9b1e7b6fc80ba3c947b1c9d59910572 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
