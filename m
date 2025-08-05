Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABDBC87FCF
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 03:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C52821FF;
	Tue,  5 Aug 2025 03:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XUi9T_uNmUf; Tue,  5 Aug 2025 03:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B7081839
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B7081839;
	Tue,  5 Aug 2025 03:14:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F3E61A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 03:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E91A283C9C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 03:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhaCQc7R5lEh for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 03:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4774483C9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4774483C9A
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4774483C9A
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 03:14:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af949891d3aso370754466b.1
 for <buildroot@buildroot.org>; Mon, 04 Aug 2025 20:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754363654; x=1754968454;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hJMK0JWHXKpadmvnYouzqAO7SX+WoRQqVdhGSjd5LfE=;
 b=Da/LKGYdUiOlCAgn9NQ30QOmFphQ7QJ+vb+UD1uKKSiqGh7vcKBEBSYymOZY0jjoh0
 B9yFc/0vg4t8ij9LzWgxxBLtfN/rXJwc2WI0OOhLVJHxqhbYGEl1UlNRxD6e7JgkLm8Y
 r9AATmg8wlCAam2rbsgUIJHF58u8DHQtlZC+/OMtAplILnrSeZyEsJQfKYUpLlVJhg5R
 OQZ2/SEaY5er26nv0XukMDkXDR7lS5VnI4TUXULm6vXVN+gSO8kFHRUuFGxnwx66T45j
 6e8FFvWj/uqcgL4MJD0j6g27onlbvsA2B/52wFRiE6FSnjzXsAjCtcs86FAAEoVwRJfQ
 zHAg==
X-Gm-Message-State: AOJu0YzEg+7zJTkaUsY9soQq4Cszr2cfJcYU9xUUSwlrREP64PyTZXRh
 PTNy7mMeHy4p8Xjq1Uxpw6KPLSeMirrUalplqiqeKRziMwz9p1P+bke6Gg+JWg==
X-Gm-Gg: ASbGncvNGXxVCtXbCdBpH0AO6+wMB2NSbA9QJmwEiFcUunbril1eY1ivAPlBUkov7KX
 LZ3GW8mBAhy2qkqY+bSWzStThbgsVQ/6wLqzjI4IBUSpHyu5A2griCGUsbJ3Y6uiKw4ADJU1ruk
 rUK2qnevVc0pFPaGJPTPc+uCe88SW4l9szQZAy74iSuJmbn0dEoSnGorWs0T0y4e8EIpP9ER5Ia
 ZC79eGoMyJg9nJBSYgxBLxIDVRJhoiPhGI7cUTyA9gtX7TSJw58tKET+BfFDijc185ysZgM6DZT
 ZOF6eiZhD2zMArDK1WsP3cONS/ou+6c/fGT+iViLuL3Xtb5JN3pvtebY1P6VNbzG7gm7165Hl1k
 QLRekXwBM8HbRfUyXcMEmYwlJDezpHrTrf758
X-Google-Smtp-Source: AGHT+IGB5T5A1KKkMDrp+xiBW3PBxIM5MANk4X/ExQ0Oh5jTkbHOJkTYbDY10Z5QGJd7Cyk7j6mOXg==
X-Received: by 2002:a17:907:7fa3:b0:ae0:da2d:44b9 with SMTP id
 a640c23a62f3a-af94003327emr1294324266b.7.1754363653745; 
 Mon, 04 Aug 2025 20:14:13 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0753f9sm821653066b.20.2025.08.04.20.14.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 20:14:13 -0700 (PDT)
Message-ID: <68917705.170a0220.36db6f.44e2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 05 Aug 2025 03:14:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754363654; x=1754968454; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hJMK0JWHXKpadmvnYouzqAO7SX+WoRQqVdhGSjd5LfE=;
 b=Tkx3ndwuv1K5iU/yak/Wi1SGwdSk4gse4reRkBoTmbmDyN17NGAICPOm8D0GBE5www
 s2Wzd7QIoRclkD0D8xNxNcpNkeAHvj+oo0BlnID6byhxNg56bFLW/7l52uukwR0Mk9Up
 mqbUHFP672k654kJ2Wu+kHU30fIp5kyLkEZO2H6PGi7w5TX2V1kAGvjkg9m49vf630oo
 ziX/G3q+68gw7g2tRzZqvhabccIwxfVlG8IVlGELGx7PAeEB1YuJqsyqb2mju9cSmijC
 r4H9fvzEmJRMv4dQzEiSiXhxqAhdEn0FLHLEeVUVIvrhtXZotKWUonp+BUzmG4e5XK1v
 xMJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tkx3ndwu
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-04
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

Autobuild statistics for 2025-08-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  6  |  0  |  9  |
  2025.05.x  |  3  |  4  |  0  |  7  |
    master   | 16  | 120 |  1  | 137 |

Classification of failures by reason for master
-----------------------------------------------

                liboauth-1.0.3 | 7 
        liblog4c-localtime-1.0 | 6 
                   bash-5.2.37 | 5 
         linux-headers-6.1.147 | 5 
         host-gcc-final-14.3.0 | 4 
              libselinux-3.8.1 | 4 
               bctoolbox-4.4.8 | 3 
                   cvs-1.12.13 | 3 
                 host-gdb-14.2 | 3 
    host-llvm-libunwind-20.1.8 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                  libsvg-0.1.4 | 3 
                       unknown | 3 
                flashrom-1.5.1 | 2 
                    gpm-1.20.7 | 2 
host-binutils-arc-2023.09-r... | 2 
       host-gcc-initial-14.3.0 | 2 
                host-m4-1.4.20 | 2 
            netstat-nat-1.4.10 | 2 
            python-yarl-1.18.3 | 2 
                 agentpp-4.6.1 | 1 
                    bat-0.25.0 | 1 
             berkeleydb-5.3.28 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                   dillo-3.0.5 | 1 
            ecryptfs-utils-111 | 1 
                     ed-1.20.2 | 1 
                  evilwm-1.4.3 | 1 
                   exim-4.98.2 | 1 
                 expect-5.45.4 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.05.1 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
               graphene-1.10.8 | 1 
                   gvfs-1.57.2 | 1 
                 host-gdb-15.2 | 1 
  host-gdb-arc-2023.09-release | 1 
               host-runc-1.3.0 | 1 
            igd2-for-linux-2.2 | 1 
                       jose-14 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20250127.0 | 1 
                 libcddb-1.3.2 | 1 
              libopenssl-3.5.1 | 1 
               libsigrok-0.5.2 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                libvips-8.10.6 | 1 
          linux-5.10.162-cip24 | 1 
                    linux-6.16 | 1 
                 linux-headers | 1 
            live555-2021.05.03 | 1 
                 logsurfer-1.8 | 1 
                   nanocom-1.0 | 1 
                     nvme-1.12 | 1 
           oath-toolkit-2.6.12 | 1 
                 octave-10.2.0 | 1 
              openconnect-9.12 | 1 
                openssh-10.0p1 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
                  procs-0.14.9 | 1 
                python3-3.13.5 | 1 
                 rtptools-1.22 | 1 
         s6-networking-2.7.0.4 | 1 
     s6-portable-utils-2.3.0.4 | 1 
          sane-airscan-0.99.33 | 1 
                   seatd-0.9.1 | 1 
                setserial-2.17 | 1 
          sphinxbase-5prealpha | 1 
                 systemd-257.7 | 1 
                   thttpd-2.29 | 1 
             util-linux-2.41.1 | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/87c7e2d43fcc46c56dee9985cf3d9ec15ccacec4 |     
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/a2a398e1d9ac2863af241a12e3bf64fc56de4b99 | ORPH
    or1k     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/aa779e3d337f1bf615185e90f73fb770f411368c | ORPH
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/444091b622ac2f9d61c3f356803a866f1a5d1ce5 | ORPH
  aarch64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/22d45277aae87be2ebfa3b6f13992c3c8d55b99a | ORPH
    arm      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e098b927d88a0e520b54bea310d8ae22e739ecd8 | ORPH
   s390x     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/c7aba860193f89a30debb8bd1c521f60e7299fa4 |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/cc34782ce3f6d397616ddf09ccadae730d993a4c | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/af58d907aa7ab8268638d65dd173f74d0b1bd898 | ORPH
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/976369ff0cdd4e59f92fb57e2b8f3b6134598e80 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/892c056214e107a23341e754b80edca9516108fa | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/6ed7e1175dbf4ca845ee0933b137dbfbb5097ba8 |     
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5577629b4e7ca4b0f8f45554d37472a5addf9fef | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/51ecf2440c311e8390db5ac6d4daf2fd07ff3de9 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/43018eeabaa86bd769afb4ab7f1a3cc83860967d | ORPH
  aarch64    |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/f2197fa71d390424fe389b2bb5f191a0ee502092 | ORPH
   mipsel    |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/3050d33c10ce7a7d77cb7059e8eb9e2952af67d1 |     
 powerpc64   |           ed-1.20.2            | NOK | https://autobuild.buildroot.org/results/7de74ee499d2fe026a90db7352ae6b50cb4ff247 | ORPH
   s390x     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/25040ce7e94acf8f92c24db895d7dea081de1d7a |     
   armeb     |          exim-4.98.2           | NOK | https://autobuild.buildroot.org/results/45a1ac3d70df9505e9e1bb162233894db3377544 |     
   s390x     |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/dc1ab5388eb53d2b58e2ab50cd4dbfef1350f8f5 | ORPH
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/ad454a9ef48e61d6ec0e99d9d10a120fd67e9c8d |     
powerpc64le  |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/c5afbe0107aeef47e045381dc464c6dd1bf370e1 |     
 powerpc64   |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/3c4447992effaf3d2bfe06e46fafecd4e9dc3b21 |     
   mips64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7a061211f242fc8342ccced5e0e16d2cca989298 | ORPH
    i686     |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/a5fbceb7e3cc936c880121ceb00705a1d3c76b88 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/a863f8697e6b8ae86c39cb50c19b7964cc2afbe0 |     
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/6784fd00582e4566c229a4da8bb1f1286f21a458 |     
   arceb     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/555c00cebf87d76e210c74344ab77222c641c53a |     
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/592bf2a8c52e10248c5874e8cb1f9f499b8197d2 |     
    arm      |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/d8d4ca059f64d579b5e8706ffed6e69bba212605 | ORPH
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f81f7f97f53321970c03d2b2dae988590285307c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/5df0f1820e7b526e23132b8537f6b361c9556c81 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/a16211f42972160a7ab07d4ee28118719bf2fa2c |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/ec875e10dbe51abdc61fd5e362d6883b2357b2db |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/f57b118d8639b7bdc72153554d927b41b4f8fbc8 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/3b2626bce228e66fcd6798df914c1c6c6dc28b79 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/8345baa607d3d1a390761c6ee43eaab9b74e25e3 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/13bf4a80d8ff2609b268f802a0dbbd3c9f3e5303 |     
   sh4eb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1bbb84b10a31b68b9a826eb8e589fe905b8b8195 | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/420774f1d4fcf828bf1156e25303ac3a06feb91c | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/409fd16b7075801302af096792fae1fc7de17738 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/60aa94dd9a19cdc9e505a8744637a4d347d5fdf5 | ORPH
    arc      |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/de4f306e844cfa071ad961c91ac67d894fdd6234 | ORPH
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/9da59da72ad006814e117707254442b764a42c0e |     
    arm      |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/fc7eb4e3e52376a385389c19f7aff6a9deb25572 |     
  aarch64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/79bee170b4775c41a03318a0813ec1cb6746be74 |     
  sparc64    |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/28e14dbbd2127cc07b016079241eee1000be1f9f | ORPH
loongarch64  |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/aabfd81c17f0deba1ad9a655e15e3b34788b1163 | ORPH
    m68k     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/02de105aa4d595c8bbbc6961919d7e8c7425f6fd |     
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/74017d1fc5326630d012e4e2785af83eb0425aed |     
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/40dd60b6d8d8598d73614b0eb18261188347d485 |     
   mipsel    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/32f63b47e1bcd09d63072c39d12f6ab77b297374 | ORPH
    mips     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/1b56b75989ec4e5501c12372e09377b0a988d839 |     
   x86_64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/6dd17e7148f4a0f765c459149e069b267be50b36 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/57174db43ce85e23ae28162dde219969ddedade1 |     
    i586     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fd6c938050334d9a63cd720cd58f7295201ce0d8 |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/286b957b811f1f670aa99ca4bef5c65d64f18b14 |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/2fb74968273cea03414772bb218dca7af12ef4b8 |     
    or1k     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/df6fb8357d6503353e89c5c1bb8e13298c2ffc3e |     
powerpc64le  |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/1117073a977bd76510a1cc140b3ae07f84309242 |     
    mips     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/d8c32896b185db9d9267d35860ec8fdd82b49642 |     
    i686     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/bd502ba4547b4fba256a41f941a44a883a78688c |     
   sparc     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/9532ac6dd29724a17d02b988f0f4c97208b77f44 |     
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/04c4a1791286cd4ee78dc41ed631d0c9389fec83 | ORPH
    sh4a     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/b3064eb83f3d89e44d5e06dfb350deb220397a4d | ORPH
  powerpc    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/800dc2a17eaa9999e1ed36166f1a0529c981ee75 | ORPH
    or1k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/2c0b12985110151e26ccf8ffcac21a8b48558073 | ORPH
  powerpc    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/325651fa4471a9515281b68e19f4a4f8907ebe64 | ORPH
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/a669830b2951872649161b7fe7bbba98314182ba | ORPH
   armeb     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/b5fe88d3a110ff5c8d82679463e7b29c1259212c | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/ef768d81ad9d1469ba42535077f30de6c594f36d | ORPH
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/126d09fd65fcdabb314dbcae66440a0cfdde8dcb |     
   mipsel    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c80bdad62d731de73c7e0e66e64b4ff85cc0bb8d |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/5bb0619c0ad266d1fe9653e57444f5057ba2ebf7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c1dc989ea71e4d4ba9c3003a688b3f7a02fc9ae1 |     
   s390x     |        libsigrok-0.5.2         | NOK | https://autobuild.buildroot.org/results/dd2cdb96e7af978f4557601fe0d00e6449396e9b | ORPH
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d98243188800d14372d79eb992381be2c4f095a1 |     
    or1k     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/08ef8fb888b76dc539b43346baf635c95c878031 |     
  powerpc    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/d4ecb4a45cf5e0106557a7b9d3afdd854f0d6576 |     
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/d85791d376f0314bb21a5cc4b0149bf778685d53 | ORPH
    m68k     |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/309b1842302956c128e6e5386de4ca2e8e735fb5 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8ce2af575c2d6b3e24f8cea28b2f33ea72b3bedc | ORPH
  mips64el   |           linux-6.16           | NOK | https://autobuild.buildroot.org/results/f97cc17125e213cfb94b37fca193a61fad39ac53 | ORPH
   arceb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/4cfd93069d4e3fc7506305beadf38a41e2c470c5 |     
   xtensa    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/bfeb4156c2ca4374374f132a3093b3995c50e949 | ORPH
   arceb     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/74c6c5d9f839c9aab453081ff003258e3d6dd806 | ORPH
   armeb     |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/1e08a5e836b478e37194637cea86334fe6059606 | ORPH
powerpc64le  |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/2a483a8417b88783660e8140f6866ef8593ab1ae | ORPH
  riscv32    |     linux-headers-6.1.147      | NOK | https://autobuild.buildroot.org/results/9ae944389c39049c98ce53987aaf96872e7f7f87 | ORPH
powerpc64le  |       live555-2021.05.03       | NOK | https://autobuild.buildroot.org/results/2d0f8051aa36bc9d1bfca8c2a8e7c841f0112b87 | ORPH
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ad5e4031075c67834af6036186522eb7b8102693 |     
   armeb     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/57d7d11b9c6e937adea796b6d3cd232328348b99 |     
   x86_64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/c6410db7575bd82c3ae4f4cf7c1bdbf535087991 | ORPH
    or1k     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a9217dd2eabfcc3fdbbefceae98e85899f82a3ca | ORPH
    or1k     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/113c124c4395dbe9a9e7713c9a4e47b55bc249d2 | ORPH
   mips64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/5037e75f888f58d71d3036108e782d0b142667ad |     
powerpc64le  |         octave-10.2.0          | NOK | https://autobuild.buildroot.org/results/215f3ed34546c16252daf58239cf8f4d49e9d4ec |     
microblazeel |        openconnect-9.12        | NOK | https://autobuild.buildroot.org/results/25cbf5aabc3782df369a61ba199ac251fde69a47 |     
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/add86702c53a16b4936f514e3e4cae5fea8d548e | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/7d891648c49686696565d6bbcc7e3db5d782c394 |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/142f6cf01763cfcc240e50db9caa9d37dd8e3263 | ORPH
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/2fc1f5ea611790e9169e97f75a58856907720e9b |     
  aarch64    |          procs-0.14.9          | NOK | https://autobuild.buildroot.org/results/2ec11868abc29453948ea5d751e234b3ddcedadd |     
 microblaze  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/754e7589bd6f8e22ae973393d8856b4c85ed0eae |     
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/573561dd90585b4d7f0d9c373dd278e839f96d10 |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/d5f6919ef963f81361978eb5b5539ddef3d35012 |     
 microblaze  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/1500d92d6271e1c1b87330ce6b9f3663af3a5d87 | ORPH
  sparc64    |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/a5fc4c831473d4282c4084699ae2c5744e9bef75 |     
    arm      |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/29a4f45fa1bf118caa9a92628cc166ebd4d3ea44 |     
microblazeel |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/93315362aeefd40973e090a82daf66ef2cba85f9 |     
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/3509c5ac6d1f520b9fb9d5240bc2e6db1caeba94 | ORPH
   s390x     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/a1704efcba03c9aa93d2a00a1ab23e85593506c5 | ORPH
   sh4aeb    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/0ca40c333e2be63fe755ca7b68046562026c68c5 |     
   armeb     |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/a9a2ba70ff4c86064ff8b4413af57d8c496d26b8 |     
  sparc64    |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/7b87effba28f98f67fe810f3852e22215a238017 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/42a53dfeec408642e95554238d9e46cb0da8f75d |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/174820083235d4c7575a826465152270ce24d46f |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9db489ff8f93ba7e58ed4930476ae444cf6d0dbd |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/4d2c1726f862d65bec904b24d41572dd77598706 | ORPH
    i686     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/b367e607ec0f1b9eb6dcd25e81ea6ea05d00db1d | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 apache-2.4.64 | 1 
                 host-gdb-14.2 | 1 
             libapparmor-3.1.7 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
         python-rpds-py-0.22.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |         apache-2.4.64          | NOK | https://autobuild.buildroot.org/results/37141f440edbe24f5a9f0f257c258377cfb75b7e |     
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1fe0b455a876b568ac2b6f0171e0cb241ca7e832 | ORPH
    i686     |       libapparmor-3.1.7        | NOK | https://autobuild.buildroot.org/results/9c8535be8738133ee47ca93557f482bcef86f595 |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/72d50eee5310a7b37a58324b9939a0c9d0ef7b2f |     
   sh4eb     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/93dcc889ec33e8b745cf030d24acabb741863d89 |     
   s390x     |     python-rpds-py-0.22.3      | NOK | https://autobuild.buildroot.org/results/cdb58ef4f242fa65affd57e3f833271f09460374 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                    dust-1.1.2 | 1 
      libabseil-cpp-20250127.0 | 1 
           oath-toolkit-2.6.12 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/7d48aae1395f6fe222c7d94ddd2a3abdee198bf3 | ORPH
   mips64    |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/e7dc4c161506f56bd51d24fdc63f529040c67df7 |     
   mipsel    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/56c9a0f9ddc58e16a6512d4a6e585641c4447310 |     
  powerpc    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/b73911dde0e5013ff5052080f83b36ebebb5cea0 | ORPH


Gitlab CI results for 2025-08-04
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353221 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353220 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353218 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353216 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353215 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353213 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353211 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353209 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353146 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353145 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353142 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353141 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353080 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353078 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353077 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353076 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353072 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353071 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353070 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353069 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353065 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353001 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897353000 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352999 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352998 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352997 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352994 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352993 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352992 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352991 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352990 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352989 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352958 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352950 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352945 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352936 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352914 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352912 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352909 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352907 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352905 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352902 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352898 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352895 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352876 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352845 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352840 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352837 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352825 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352824 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352817 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352816 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352815 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352807 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352799 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352795 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352784 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352769 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352766 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352752 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352751 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352747 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352746 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352742 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352725 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352723 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352720 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352718 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352717 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352710 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352706 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352702 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352686 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352684 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352682 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352681 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352676 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352671 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352669 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352665 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352663 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352662 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352651 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352650 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352647 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352645 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352643 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352642 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352640 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352632 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352629 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352623 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352611 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352603 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352588 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352585 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352581 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352580 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352570 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352564 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352556 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352551 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352550 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352549 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352548 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352546 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352545 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352544 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352529 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352523 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352520 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352517 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352515 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352507 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352503 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352497 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352496 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352491 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352489 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352483 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352481 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352480 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352478 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352477 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352473 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352469 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352468 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352464 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352461 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352460 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352459 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352458 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352457 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352455 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352446 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352434 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352430 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352426 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352422 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352396 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352395 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352394 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352391 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352390 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352387 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352386 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352384 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352382 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352381 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352380 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352379 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352378 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352377 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352376 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352375 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352374 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352373 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352372 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352371 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352370 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352369 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352368 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352367 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352366 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352365 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352364 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352363 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352362 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352361 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352355 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352342 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352341 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352322 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352307 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352306 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10897352304 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
