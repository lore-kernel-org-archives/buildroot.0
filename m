Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40DFC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 897466121C;
	Mon,  9 Jun 2025 14:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ffel-RN58vj0; Mon,  9 Jun 2025 14:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7218361221
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7218361221;
	Mon,  9 Jun 2025 14:05:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4357A1F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 03:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E77C81238
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 03:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wBoJ8xYyGzk for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 03:15:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CC5980BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CC5980BCB
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CC5980BCB
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 03:15:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad574992fcaso576676666b.1
 for <buildroot@buildroot.org>; Sun, 08 Jun 2025 20:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749438942; x=1750043742;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OUUtUiwxswTVcQA7gQcxNqUoiaEAti8Bzk16O8DUa08=;
 b=K/MuLgE3SfM54VOCcvBcBIUx+66DkedOZ4jvCB57SBtQGg2vZY7F+9Yl7pfvMyo/0H
 mRxuc4dB5PcOsgsb8DQPligjQY7f0fkLW7T8Fg1Bj+P8CWJ8Cc0/dG99UoaKq0bYW/ln
 BT2fKelwBhua78fKFrAkYOtRpeqL0LVrTIr75N/Et9xlgeE/whcubn9DVqD6+FW+1P8y
 U4jIDlkTqLLQc3a4Y1Rhu97059wsC1vrvuvVh4M772AR7IIXFqvLEecqxa8OgIStC2md
 CXWB2I4Le14W5Nb/zbO8K3uMPtAi5cOeiiPy6g2UqN8HUxOYxoqJMtt7lvYGlbcl3ATH
 TNtA==
X-Gm-Message-State: AOJu0YyNwORbGtH2llNa4etAOHMQ3si1UdziJics4/62LHTJL8Vlx8yG
 FZoyXRQ8Q3p/je0VskDB22F6uqtm8wegeJYTl5sAhG4M2m2vhs6rqmq5xD2ugQ==
X-Gm-Gg: ASbGncsDUDDzRakIS/bMYnIUboRy/kEKOcKeM1QhVjq/2lZQjlHcOEhs1Gb6Y5vZTQy
 WmuyCeV3iPhunUQFF80uXlfmqreBledWk97PMAgSOgjbmPURvdr0pwfkWbCAmACJDYThqiE8J/L
 P0vctZHe0TNep8hhMH/8LpPMraYsdoPN1xOu3ZBcLIqJiS5XTQbEvATqY6W9/iDroIqcTRfur37
 Ygic7v8p3odR7ZhZg4yLNwNCQjyz4Gqvm3A/9HpabADpk7g6Qdxm/FWoJ3Z+/uRERbsv3G7GKg1
 raEOboHBVuen1+jeybPUPwVQHAPEPU1fgv7M4653FwlZFkrczribbko=
X-Google-Smtp-Source: AGHT+IEPEaYoax4Jzl4NyBwz1ZjwzPTmUT3jXFOuxj3zZ4EMjWfvZCxmH20xRDtS+SHkfxeFj78Aew==
X-Received: by 2002:a17:907:7284:b0:ac2:a50a:51ad with SMTP id
 a640c23a62f3a-ade1a932f8bmr1007654166b.14.1749438940843; 
 Sun, 08 Jun 2025 20:15:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc3a5acsm488357366b.137.2025.06.08.20.15.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 20:15:40 -0700 (PDT)
Message-ID: <684651dc.170a0220.3854e9.b40b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 09 Jun 2025 03:15:40 -0000
X-Mailman-Approved-At: Mon, 09 Jun 2025 14:04:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749438942; x=1750043742; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OUUtUiwxswTVcQA7gQcxNqUoiaEAti8Bzk16O8DUa08=;
 b=kz/PhHGj/wXMKcpw3AqIR9e0S8KiawpW3l9XixmVHFGUfvf+scsCMMckq498cre46G
 J98mdRqEIMv71FFFHL6WH5ikdY+d7mRlbkst00UidmqiKAy5GA6L3sXkQdXB/VKU/342
 QlubOul28bZFsX7fW990h9MYWNdrprj89W5bj/QNsmrmv/1YnSWQ/lEhr6mBCBpC+fmQ
 pds5efCISfkfOTVNrwpSnWpdPMNSrSKcVd6LaJK4yz3F8eTjyocEwEaWLtxWb5l9pi4l
 XCEWA2Pa4qayk6vsKPqgut65HL1560VJYV79jfIbkYNLlpS0Zqj0hc/djVivdD9WPU21
 S5Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kz/PhHGj
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-08
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

Autobuild statistics for 2025-06-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  8  |  0  | 13  |
    master   | 16  | 527 |  0  | 543 |
     next    |  1  |  7  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 71
 host-binutils-bare-metal-2.44 | 47
                       unknown | 27
host-gobject-introspection-... | 25
    host-gcc-bare-metal-14.2.0 | 24
            host-coreutils-9.5 | 20
         host-libopenssl-3.5.0 | 19
           host-python3-3.13.3 | 19
                  bcg729-1.1.1 | 14
            host-binutils-2.42 | 13
                   avrdude-8.0 | 12
       host-gcc-initial-13.3.0 | 11
              libselinux-3.8.1 | 11
                    bmx7-7.1.1 | 10
            host-binutils-2.44 | 9 
host-binutils-arc-2023.09-r... | 9 
         host-btrfs-progs-6.10 | 9 
                 apitrace-10.0 | 8 
             host-cmake-3.31.5 | 8 
           host-libsepol-3.8.1 | 8 
                elfutils-0.192 | 7 
         host-mariadb-10.11.11 | 7 
          host-automake-1.16.5 | 6 
       host-gettext-gnu-0.22.4 | 6 
                host-m4-1.4.20 | 6 
libmodplug-d1b97ed0020bc620... | 6 
          host-oniguruma-6.9.9 | 5 
                  ntp-4.2.8p18 | 5 
                libcurl-8.14.1 | 4 
              libopenssl-3.5.0 | 4 
                 linux-6.14.10 | 4 
                 openal-1.22.0 | 4 
                    azmq-1.0.3 | 3 
               bctoolbox-4.4.8 | 3 
                  cjson-1.7.18 | 3 
flashbench-2e30b1968a661474... | 3 
              host-audit-3.1.2 | 3 
         host-libselinux-3.8.1 | 3 
          linux-5.10.162-cip24 | 3 
              mariadb-10.11.11 | 3 
                 pixman-0.44.2 | 3 
               asterisk-22.3.0 | 2 
                      dht-0.27 | 2 
                 host-tar-1.35 | 2 
                 host-xz-5.8.1 | 2 
      passt-2025_02_17.a1e48a0 | 2 
                   perl-5.40.2 | 2 
toolchain-external-codesour... | 2 
             18xx-ti-utils-8.8 | 1 
amazon-ecr-credential-helpe... | 1 
             berkeleydb-5.3.28 | 1 
             bmap-writer-1.0.2 | 1 
                       cfm-0.3 | 1 
          cloudflared-2025.1.0 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
fmlib-lf-6.12.3-1.0.0-3-g7a... | 1 
                   foot-1.16.2 | 1 
                    gcr-3.40.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.05.1 | 1 
  gobject-introspection-1.82.0 | 1 
              graphite2-1.3.14 | 1 
                host-acl-2.3.2 | 1 
host-am335x-pru-package-5f3... | 1 
        host-berkeleydb-5.3.28 | 1 
           host-doxygen-1.8.18 | 1 
         host-e2fsprogs-1.47.2 | 1 
           host-elfutils-0.192 | 1 
        host-fakeroot-1.37.1.1 | 1 
               host-gawk-5.3.1 | 1 
       host-gcc-initial-14.2.0 | 1 
host-gcc-initial-arc-2023.0... | 1 
                 host-gdb-14.2 | 1 
  host-gdb-arc-2023.09-release | 1 
              host-json-c-0.18 | 1 
              host-pcre2-10.45 | 1 
        host-util-linux-2.40.2 | 1 
               host-vde2-2.3.3 | 1 
             libargtable2-2.13 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                libglvnd-1.4.0 | 1 
                 libmbus-0.8.0 | 1 
             libopenmpt-0.7.13 | 1 
                libsepol-3.8.1 | 1 
                 libsoxr-0.1.3 | 1 
                 libspdm-3.5.0 | 1 
                libssh2-1.11.0 | 1 
                 libv4l-1.28.1 | 1 
                   linux-tools | 1 
               openblas-0.3.29 | 1 
                openntpd-6.8p1 | 1 
                python3-3.13.3 | 1 
          sane-airscan-0.99.33 | 1 
                    yajl-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/29bf5206ae51f8b2391aeba8fcc33cfeb84255be |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/708b3331f07dcba9c7a387341454a2f12a6c2e3a | ORPH
   armeb     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/6eb3b8ade103ad7171dc3264f124e35362d5eee0 |     
powerpc64le  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/fba4ecb759d4b4657f5a75ce9eedae4824f76080 |     
powerpc64le  |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/d06367941ef26da689ae829f1dbd04a64d3a395d |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/9531ab34ed1628a50f02ad73b1a0fa35ca49ab77 |     
  sparc64    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/85a9990fd785253b4d8caecb59f3fbb63015915c |     
    or1k     |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/74d483540f3806af200e1418231c7e585864059a |     
   sh4aeb    |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/8551f6efd37d896f95fd25e8a60cfaea719c8934 |     
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/9991126490a0fca2a974a4425e579f47044c6803 |     
    m68k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/9ab49ee28f5dafd691d55055d8b0b67227ac15ff |     
   mipsel    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/80ec07742aea815bd17f2443b8e1b1e310f70d20 |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/fa0c413cdcc702e3733c3f038821193ed484eeef |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/1fc3623b6535326d74f9a8537f995750d707019e |     
 aarch64_be  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/298598ca55bb2151f0cc7b23f4641081c733705c |     
   sparc     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6962024cd88a529e372e7ca760bfe37b7ab0204b |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6050d92ce53eed154eb9159d32a79e0d582532fe |     
    or1k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/239501505f81cfe88d9047db6c39d182007da12e |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/5b7447a201e40dfcc7c128d8a0d230762420b449 |     
    i686     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/6d3e141b7d4c226c72b554b89240b3703ada0a4c |     
    m68k     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/dc101b32f95e57736305226af7d150a6e5972dcc |     
powerpc64le  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2094881289a676cb9dda11aec9fa4c344d475844 |     
   arceb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/e3e0006f3f7f90e755e72bde37baa03f2ee75df8 |     
microblazeel |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/bec6e044953e63760397f6825d8aae0535f7a7b8 |     
    m68k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/a153ba8502ac1e8a1b3e289699846a5476d306c3 |     
    m68k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/7c2a00ddea74ea180dda7a3b5243bb07517f6a01 |     
  powerpc    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/383c08243a63e97cd064616268a3607fc6e43b71 |     
   xtensa    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/e13facec046ddfd0dcc6b32e86c00c2da825eded |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/beaf217f230d5c5b40c81ca12a3049944e5b3f0d |     
   x86_64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/699004405ab2247cb82a3dec69634f447bf03fef |     
  powerpc    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/2f42f13e128bddb2d975090faa50ef4d608b4eec |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f5bf4bfeade7932339a9085f30bb601ebf9dacf0 |     
 microblaze  |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/be395b4ef0121be97a04043bd5853f7ccbf6ef2c |     
   armeb     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/67af7b2257cb039008a3e23b897f6ab715a0a6aa |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/ec8669c64cd12fbabec5182775a1357afb060e06 |     
   sh4aeb    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5c2f9bc93308c297b10ae86bfe56c5e3b64c18ff |     
    arm      |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/6138865dc78eab6a38c0a3249fc13654fc49a64a |     
  riscv64    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/5afd9d72c793e18e4086eb93beef9307faa7f262 |     
   s390x     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/0953f57bdba1c6e609984d096129e847dd6472d9 |     
    m68k     |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/f26e35fa2300d4ecdb50fb0cf10c0529e0114933 |     
   sh4aeb    |          bcg729-1.1.1          | NOK | https://autobuild.buildroot.org/results/9b06cf564b4efc2d4bf88664a8359445d4d2bded |     
    mips     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/7448dcd51e390ea472030a09862d8d57d11c3fde | ORPH
    or1k     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/35af404c434d06d37c52ff725d6671894ed7952c | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a0d7000645c2deaa73b59205402dab6211a70951 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/03c7a26258d573e5d4710a255b0cbbd445cc9607 | ORPH
    i686     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/1372eb3bac6423cb249f759a3092f75cf718fa61 |     
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7d1bb9fa98176da8d36fbada19d1b5ce0c845416 | ORPH
    arc      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/9928b9d36735a7feb491052222df2fefe75d3d2d | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8597993cd2cdcb6ab5ae3988e1f8abfc2feabeae | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b9c955ab2a722669b625a1a62b096c7831aafa68 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/b274187d045da19bf1ce44e30c00f0b9bf174512 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/cae7e4d82137c465f18b509188351c92b0dcd557 | ORPH
  aarch64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/9eca72ffc1e8143b5aeee476561598db7bf5fa05 | ORPH
 aarch64_be  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/124e6c1a3745315bbfada5cfcc7e427f5755cc0b | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d785a086642b1953c420a4dca1a43daaa9e7d590 | ORPH
  sparc64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/4c0aabc0c23d6e4738c2689a4922b29599a2f2e7 | ORPH
  riscv64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ea9267811538f11673333b733db0cf3431866d9d |     
  riscv64    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/71513c5428b7fc03033bb8ef061403b2be19b847 |     
   xtensa    |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/81625795ac7090e1c48dbb17a5de4a8020fa2809 |     
    arm      |          cjson-1.7.18          | NOK | https://autobuild.buildroot.org/results/922b0ef256e833185db4d100046f5811534441ea |     
  riscv64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/9efc2725ec5b3d1d8621e234125f95feb548da68 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/8ab2252de819fd533fdbd8732d24980076778eab | ORPH
   mips64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/3ae3c0ebc2ef2e25f2fe038fd1502860aa8bf37a | ORPH
 microblaze  |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/bf15a2bd51d68c96488b94890c2a259e2144fa7e |     
   sparc     |            dht-0.27            | NOK | https://autobuild.buildroot.org/results/d7a2d394cffb56b313b90355352a5fdbac8da226 |     
    arm      |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4a5f1ee8583333153a2601bee35910c87d8952be | ORPH
   x86_64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/065c3dd04ff31ebe1a049a7c138cf2e3c131796c | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/498e4db44bf456ee028572d254c9689a6c8d5c31 | ORPH
microblazeel |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/60f92cc4a2cf6169516cf38f9e849426780ea889 | ORPH
  sparc64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/b6e3628779eb96002467400b73b213b007bed7f1 | ORPH
   s390x     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/a0a623267cdc73249a01849d9ddea5216c4605ed | ORPH
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c965a15d5e1a099364407af4fcd247b49fcb757c | ORPH
 microblaze  |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/d1f581b2f2a9ed8993aa7d5d2d04774469bd268f |     
  riscv64    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/6665511e9afb08f9155f367f949c2cd69871c89e | ORPH
 powerpc64   | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/9b54b99c31a1d80377bf7b3b0c77a4de1c400524 | ORPH
  aarch64    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/a90ba978f584406038bc51084ce26dbc6ec227d5 | ORPH
  aarch64    | fmlib-lf-6.12.3-1.0.0-3-g7a... | NOK | https://autobuild.buildroot.org/results/f7e15651b765891ad44032bc549ae430322cf4ec | ORPH
   mips64    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/509ae54982d386f05a3b3790a58509a2996beeb7 |     
  aarch64    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/502396b0f445d29e1d7189a063f59d2de8fcc98d | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6fef5100202c328f89c9242bb54d52a67b712a13 | ORPH
 powerpc64   |      ghostscript-10.05.1       | NOK | https://autobuild.buildroot.org/results/191bd301cb24c97956bde03a3d47d22d9d576e7d |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/8147a0ca8ab1094a289f6f9cfbbd401adda3db41 | ORPH
microblazeel |        graphite2-1.3.14        | NOK | https://autobuild.buildroot.org/results/0c5cfd16cf3d380a501a9a6dbc25adf325be10ac | ORPH
    or1k     |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/a9e3407930f4a9624a6d29735348391258db6ae7 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a06f6407445235acec5fb8e848eac3f26a56c90e |     
    sh4      |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/1c68080c29c091feea42613665212e6ce07faf67 |     
   x86_64    |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/f5a281313daa49bf459c79133c2d8a1fb195c2fa |     
  mips64el   |        host-audit-3.1.2        | NOK | https://autobuild.buildroot.org/results/0e0e6e7114729815c3ace946ecf9e87c426dc1fe |     
  powerpc    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/e3209033ae5ebf3cd44ee15657b084370a435a72 | ORPH
   sparc     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/d3976629ff3791e7d3a05a4aa4084cf9e99baff4 | ORPH
   s390x     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/42d13ea7b7bce22b7a26f0380f54d2df7819c93e | ORPH
    mips     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/15d16a96fadd0229e0341738ce9c2151e65a6867 | ORPH
 powerpc64   |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/d9b2bb5e1eae30f3a10016e97132d522dd09d7cd | ORPH
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/53cded164bb0d59a989de699f9a4ba99d6b11d87 | ORPH
  aarch64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/5715bf7f1e7646b9f338a19166be8c75a8785e41 | ORPH
  aarch64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f5a88d2a6c7196e0ec4df400dd0a1c14fce89b3f |     
    or1k     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d25a921ac1a488395ea338994b9f343b363fe55c |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a4ec9b69ce16074f132ac86116954cf1bdadf30c |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6bc361781b55b2d160d04ebe3aa0c9b206f23580 |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4e0a85a0a1eefe86b5dd9afbea36e1f6c0d25ed6 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/97a18c17a9d3370847c5c2f9308af108ba5c7562 |     
   s390x     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/6bcd20128cc07bdedf82b403a9739ca604bfe540 |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b2ae4003d8bc372b3ea1a6789f2d524349037d9c |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/169560b246a3b0a5bb1cb674f7b011878c937601 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/264fef57cef6405b81b9d78ae917bb2a2bc91b65 |     
   mipsel    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/aeaabf32ba3c52bf2d48f4b3567e4e21cf239c36 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/eecb6d35c59402e52cfef2376c97a15d1cda3b86 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/3a2e163eb7a4c0468c9a750c997f41ea8eef10ed |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8dc5db1376dbaac23f6de6a1ba9ae65565e30595 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f6c666fe8982852192955a2b301b471914098468 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6d8af2bc7d42e0bbfbf4869d8d4ef68351a30f77 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cdeb037c1cc5fbe1dec8adc48b8dc0188a48e97a |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2f9550d6ff9746e84b9ff4c3e702a8f6675dc9a8 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/63f13c17ad36916c946e50c132c1beca0d6dfad7 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ab65ecc94d57f2a654edd8d1fe5da595b448f310 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6b631d75a1e08f03138709dc65a99c514f7c0240 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1fd252da02589b738db90f69fa6ef21ec6f2eda9 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/adf33462db399fde61bdba2d90354e0cdebff5f5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c8ded8ca6fcea83079ae6b400367e4d840ca3ae2 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ae8f9658b5201105bb1d756fbdeaef82caf63e72 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d94e417441d52e0c88e862b37fdb0101d4a3b456 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3c074ef238494e9dee782ec02e892d9343df04c2 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/267abaef2f27c199368f4214d255baed9f2621f3 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e557f165a0612d5df33801c3d22a7e4b3e79679c |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/37f631fa214af2eabd279a8a8cedc34d23872ea2 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/73259d7ca9fafe718b90faaf2dffd80625da402c |     
   sh4aeb    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bea573ad6bed5a8edf75f3a02050e4dbbc46c851 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a714dc498c210a4d9ca01fe264ad74a6f846de04 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1e4884c9ad7b17bfe4e50f106d65b0087240d06a |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e6b85b54b7b7e85c4ef9ee24b5cc1d673afb4859 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dcfd59aafa042fb8312ce689419b721b98719b20 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/92619a49f01ad25f88269b6c52722bb40f8faa7f |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e738c9d03d8ac4631f9f561d87fbd08d7b22da50 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9dae0b37234f4b394882af0387ede8b9d6f88970 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d020db57ec926acfe40bb59ced0b6cffbc61e949 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d8d74e4bdcb0c29a65ab43c3b621c535e0f8bdf9 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f1d362cdef3c8e0342de16be7b868a3fd075696d |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3e6efedaeee867d9f13299adb15089b385c8ddf5 |     
    arc      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bbe011ee2f005b1c348842b6bdf485036a873d3a |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/44efeb919b3770988178d49e0fbe61f2ecd75a5d |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e978a4ec709b6fed7b7ca02ea8ef22220b9c9261 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/dde68a00e41c1b76c2d8b859a987fa1079c3cbc7 |     
    sh4      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d81b440c393a46554fa17c558116a79b7dc47731 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3890a908d781ff302a31ea6d2d9b905aa355bdd5 |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e24d9c1ad276de81d318025752d8dc64a594ef6c |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/330f013de7a0ba443a751d21aaef4be9c7b13d7f |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/75adf6207ce50d63b8520b135fd23587311494c1 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2344af0eacb4b463b260ad97eb261c20ae84e59f |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8147820944631d176b92b66b9859a87cb5ab314a |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/64f16de1b86c6fba89f93effcc431d1ff4c8599d |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8cbee6b6862fdb66f60753ab7193622d15380391 |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2fb90cd3761e1d40cd9055e94a76fe8501f1dd0b |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b3bb22c688aec12889e7deb65668615ad00f6318 |     
    sh4      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a288ce279e3c8f3daec5151bfbd663028ee70cd9 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/28fb3fdf98b5ef95a8db3957391c823166013ef0 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4eb73851a5b73bb4710bd988636e13298ad29833 |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/da4a7c58c32abde96574501ee1e7effbfd6a67ea |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9ba6d7adfc664848e1da2d1cc864c98f7c9f011e |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8929177a311d971839db7213b4f321316329889d |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7092d9f21902458fb2374f1937be1ee149f1caa5 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5da3d64c1a445e1ceb6331da5248da96d1b9578c |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/eeedc6ff7262afc3d601238d9c571853a9bba561 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/07bddd6b622cd991b5373e830f3d52362ad104f2 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9c707c834f77c9dfa59908a216f06e8cdb62da86 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/6bd1389c6a41526b04efd0de8ed3c736d86c3a7a |     
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8ab3a6c26756f62cab834563a34848648fcc45ce |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e37fc8e864e02a5b9312b66a8718a1ee8fa219af |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ff8c38e5eeba1b64483db6d5da347c0198de99db |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9fd473c97552c0940ef1c4984a987db19dcf47bd |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1892d1a290496d0f97995cc7ec387465f508724f |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4a155d076fde63fb6831a738a38d5b9d3ca7a27e |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5ba6760b4931aa9f2ebd6e94cadcfbfca6f99349 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f9c1f7b8b363bcbf8eee1ab85ebf0461d56701bf |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d8cc5bcdb3aadb1de935a882819a91c7cf533117 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b3500e972f8f22b4986dfad51eb6373ee3560bae |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e813422cd023795e0b854ea080cb91b547c57437 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3076e5d1cf69adbda6d94cc27caa759fc5c103e0 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2afd344d819095a820f711af5fbd07d13e6dcb9c |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/781ce5e3927e990bd04c5eaa317ae7135f0f292a |     
 powerpc64   |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/e25362ff89efabd2a0327571e15734ff8122fb34 |     
   xtensa    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/60d883133a3937af157661a4fd9618a765f6410c |     
 powerpc64   |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/d8c3b8cab5cc3fa9c19e4ad96e194954f119ac20 |     
 microblaze  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/6276d07eb73cab962ab58d38c0d172fc929ef4f6 |     
 aarch64_be  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/2683dc19541c0027b0eedfce17dcde47b60d51da |     
   s390x     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/f85bfc757ae51c7794deb7f5cb3dd371296a013b |     
   armeb     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/03b704a4a42e83b72f28c5658567b0a5535c24b1 |     
  mips64el   |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/cee6177d8ec0055a888ab8a5f008cb112dc98111 |     
  sparc64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/27da06d0682b441eb5be5b479dd8f557335d2eb5 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4cc1426a6070b41c1f71db91c8274195da58e9f4 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/53fbc118a15262d6c6ccc06630e95bcb040fce82 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/d9885cfa728709ec480df332a36ff0d76ab2dc76 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/39c02ecb6a6d16ad92a6b73daf5930c9e2352ee7 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/6346a46692439140e449ef130485ecf372141246 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/73c7257e14bbe0e9a908714f085430c9cee7efbb |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3161aec7506b2d48241a5b34641505b3a1e2fc94 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ded6ded8e4d5b0760b90bd910081ab91cfe8b053 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/ef764f2ca1c4f232c559fe0812f2174572b3d6db |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/67cd1207103222861e421b2f4b72af6d2ee410ad |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/49e3b6b0fbb61e6e51038633444288b5f49aeb93 |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c0561743d4f1e8df69e350a4a90e87b7ab2999e7 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/5555aa539dcb22f0cc63056089c49f4c35e4b96f |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b3d0ebfd7288f7c0a259db690ffc30bdbb30c209 |     
  powerpc    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/16be4658da033b3af06a1684cc07781f48e96cdc |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6ee29857327ef9ba86ecf00644dcfe54076349be |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/77c997d745c0d2ace7a12f36d318f346faabf006 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8f01e05660b0ab7ef060e6d85fece1dfbbf70ca0 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c8555d8184b883d50494fb05d4a6f217f16d5d66 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/024fec2050c3bf21adcc34a95d49f9662a9a34ec |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1e1cb2f0018d641ab008b8ac8ee8857c67d93546 |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/bc99cc5f12a2d11499033707d5abe87238ea48be |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b636c8a5d43bd8d9df6c89fda76f4ea2261e7dec |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/dd881e64625649f1384fcda277253a3ff3ff52b3 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6d856adf3e48e27c33b35ea8a4e7795da1a577ee |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/dfcfcc61c028223cb8983002b21c3251acdb6186 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/91e3c1ca550f92c9d243bd68adb58d24c035e04e |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/db8c1623e3a3428ba4f4e02093a9f3705ff994fa |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/510f2c90788d48d0a7c0a341d4c03e1f9079b0a6 |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/55d1b6d05e052bd5b30db45491943d2c5a903ec1 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4f0d11c584a59063b6a72bd45588211828810b1e |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3d3765e2a5d1f149cccc711589d3cc349618c0e3 |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b878162a244a322cb504cc4131b58b287e3f9a65 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ed63e0fcc5330dcf96f910cb2744a69cc0b5f173 |     
  mips64el   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a7cc51572ba45ed1c733431ac3a5baf4f065be58 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/85beab307e195c2eec4b8981ec34eedc89f0c8bd |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7bd43f6c8a165f8670cfe7e7ea52a50fa182ddf3 |     
  powerpc    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/bdf8335c813ea2a7ccc7195bc0b1e19f1202df5c |     
powerpc64le  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0f36a266b4c82ab21216b55e2793cd9e0cabc5aa |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d5569f1071dac3149057486947f69b8caedb554c |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c1a5aa96d52b6c46f23b17f6967c73d70fc9a290 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/48617d75239ab30db9a23cabd11ec050be636116 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/190f209fc4aaff2f5006ded0522ec77453902899 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e881d81f90d34e612533bd53924acd61a13d06a9 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/212923c5a288d64823d616335c870a12a588d320 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3fc7edb97fd28164f6e78cb13ccd4dd58561ca03 |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ebd47ea90eb9a29dfc00c2479d54ece56701b9fd |     
   sh4eb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1aa49bd8f6c5c8bda1f56721aaf04ba7995bf558 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/910205720a82ae30a1b6fa0e60c77c3ca738abc4 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e5829859fe1662e96e5ecbd2ccc772ebe009ef60 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/025101be68850f86180c457b59cd33e29818ec02 |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a32e17f91008f1cd7acaae6821f579e8c6790afc |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/98db44659c41301047a9cb7bedc21f2e7af010ca |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a1524f769e801c9335540727f4be6eb164c7ffbe |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/afb4d3e889f144ab2dcd067996071adb42f4b525 |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/43839efffc44bf23219563850ef05ac3d428c37a |     
   s390x     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/b0eeaad62fad2a8aca731ef774064751c97480da | ORPH
   mipsel    |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/c0ffe60425e6ecfc4695561ff4dfc6768f73ff80 | ORPH
    arc      |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/10829f4b08a060522fb96cef2287cd1e1eee8f6a | ORPH
    mips     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/37862325cb370fd62453eee8b6d4679ec20967c6 | ORPH
   sparc     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/3fb29d0bd76a24d3d18f7ed9e71b1e2b8a513db4 | ORPH
    arm      |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/d5c84c583858ef0ba12cf276015942eb7701dc37 | ORPH
   x86_64    |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/de4865e2285b821840f733f778566259b0e895d6 | ORPH
  mips64el   |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/68260b720e6ce2f55450ab6ffd25ee9927dac111 | ORPH
   armeb     |     host-btrfs-progs-6.10      | NOK | https://autobuild.buildroot.org/results/8f9ef93aa2ed0cc9c2346d28bbe22f30ff588597 | ORPH
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/39da12f1f7db4e83140a8133e2c5dd89fbf2b4d8 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0d39e936af9330fbee2ed56d47b55910379a30b0 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9512c15b8ba9914e08fc94e9301b24a0007864c7 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e92c223b9305ea8a1e88ad6af02067ce930534d6 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f7ebdd9751a218daa151631148c045f18e4a74ce |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9cfc2393102de6c417b0b1598eb5f45144e3c353 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/78a6716ab17981e295c7afbcf64f7984ddd5a941 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f6e576ca6158c4bf42b02be8414f4e0bfc95bbbf |     
 powerpc64   |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/bc7499361590e5f012cb8ff7011e5bdcb62f2dba | ORPH
 microblaze  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/7d75bfb968ed2902ffbac356af2878c71bd0f829 | ORPH
   armeb     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/a1f8f86cfa4d3e70054283fc4a9381e53ff498e0 | ORPH
   arceb     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/619f67957772654afd4328cf1fb48a9f838b5a91 | ORPH
   mips64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/640d60cad636ceb3860a16e94ef8d4cb6371fa4a | ORPH
  sparc64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/3a8ed7052a1826db00a310c589a68c9b92012ff3 | ORPH
  mips64el   |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/37f91ea490ed3990b17d9f07b61b289a226e3cc9 | ORPH
    i586     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/6219dffa9d75f0cad77209bb944953d439af6752 | ORPH
   s390x     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/d2e0529a1470fe282d757de0a2f8e1c53ed488e8 | ORPH
    or1k     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/3d075ae6a4d8055491c0ffd5de8fef5459599d33 | ORPH
  riscv32    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/51b38aa81e43a3e17a07aadfc40deec9cf0748f4 | ORPH
   mipsel    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/9d102eac3254a1f20bfda60fbc22f1d8042945fe | ORPH
    arc      |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/f9557c51988278e62604be5591fa2128fcd2ceb4 | ORPH
  riscv64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/092199d35f2c94ccbcd058c382ee3b2be7ce9256 | ORPH
   s390x     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/8b93aee8c217283bf10b1c5e14a8d240a3d24da9 | ORPH
  sparc64    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/dc177cd97674ea4775e7e4bded657a7979958030 | ORPH
   xtensa    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/1d9280ecf0e2074847d093f10245b7290e421eb0 | ORPH
  mips64el   |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/cf7da1382186e2578db5222006cf5c72a8126035 | ORPH
   mipsel    |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/5e57f15254ad4d125450b90081eeefff7c366fce | ORPH
powerpc64le  |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/a5427dffea0d2ff086114e0144c43351d5d4c7b5 | ORPH
microblazeel |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/e80c938980ac199f422d1ede668eda41da1ba07c | ORPH
   armeb     |     host-e2fsprogs-1.47.2      | NOK | https://autobuild.buildroot.org/results/0749e04e44dd7b2ddb33b57d3c010f6c3859daae | ORPH
    i686     |      host-elfutils-0.192       | NOK | https://autobuild.buildroot.org/results/367412ada71150e0ec55979109ec2cc418db8fd8 | ORPH
    mips     |     host-fakeroot-1.37.1.1     | NOK | https://autobuild.buildroot.org/results/591896e7850211af15f60f661198dee783d0aaa3 | ORPH
 microblaze  |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/c051a81d851bd2249f27b1307b195b96e1e99a5f | ORPH
    i686     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/5086de1917c014c7eb23c55ab8d63e6b977a7640 |     
    arm      |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/4dd67ad38a01143b4b80322e776943a099f80709 |     
  mips64el   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/3f1ae9ba724fb27cb65958c7ababa4769ec46448 |     
    m68k     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/53968643bcb4bb580850fbedfc9f92bc35dc731c |     
    arm      |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/9cba7046ba46aad2f62fb708f90dff731f610d20 |     
  powerpc    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/ba6c08667ec2e58cac6f88d0ecaa7bf23ef2ba98 |     
  mips64el   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/2e6cfea12b6a5a50cdfacc9bda233b9bc454db67 |     
   sh4eb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/f0dc6df66c860eb5b1f86c5301c326337337afac |     
   s390x     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/62033987e2278539bbcab0511f5b410def2a5672 |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/87f6a1619f195774e81808efa7790f79f7fbd81b |     
 powerpc64   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/19d0f5275607ac82aa2125f8bf88bd6dd9677f26 |     
    mips     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/e172d91caa10a76ce54196cdc728f1e18fdd6bd1 |     
    i686     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/4232c44beba0ba2383f3b6fcd56dddde194f0510 |     
  mips64el   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/8748bd040367ff3ca8c30f4b87c0b42c1d955a09 |     
  powerpc    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/756cc0dd8f0545bf7aaab8943545a94daa5b56bb |     
   s390x     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/139d559a33f5fb6f5e74977e3ec162bcf60a0b33 |     
 powerpc64   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/93b56b5afed6e00d432e2bf13710298b368c6f11 |     
    arm      |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/ad1a2d246d9e78045741c36f9a854cd0116a3e68 |     
   armeb     |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/5acddc49b3e18b9b88e24dfa26ce708aef19c11d |     
powerpc64le  |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/8668d6159534cd415342b2d0d286eab41d1416e5 |     
   mipsel    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/668012a436e219b3ab3a7140b9ee33c143e08eab |     
 powerpc64   |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/55f272a055e5e2ed2e696bd6ef2ef71e89ba9382 |     
  powerpc    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/ee9e7d28dac0c271712a419543207c7e141b795e |     
   mips64    |   host-gcc-bare-metal-14.2.0   | NOK | https://autobuild.buildroot.org/results/d7b9eca8af68e9e8e5b604a6815d4bea7d33042b |     
 microblaze  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/b5a295d72e0c0c474df3333e0ccd4c64ada4b1d8 |     
  riscv64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/78ccb81491017912cd7db0d05a2e0bcef606ecaf |     
microblazeel |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/cad9321d972f859cb660c8f48c69dcfee0d5a560 |     
   sh4aeb    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/680e6138fdd558b2302fae81906976a90f5ff2bc |     
    i686     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/2dd4809712eb2f497f4292a08a0145a777925590 |     
 aarch64_be  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/2a09eeac7e6c20c2692488eb8dc063de80e50a2c |     
   x86_64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/525716a94c91527d9003c3ec68bf50d6808f179f |     
   mips64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/e82c08bb19873e2a6bc6bfc3ff76e877a5ae2dc8 |     
 microblaze  |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/86968adcdbda9261097e4795c442bbaf2c3ddbc2 |     
    or1k     |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/fd76262e852a90f179fd541e37f2d031eb26acca |     
  riscv64    |    host-gcc-initial-13.3.0     | NOK | https://autobuild.buildroot.org/results/8244ba4ec1006cc389bc24f41d4b06d0f4be6518 |     
   sparc     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/28ea2dd1104f21cab077a394581e324b203763c9 |     
   arceb     | host-gcc-initial-arc-2023.0... | NOK | https://autobuild.buildroot.org/results/13746e4eedf0a717942a103e695be657a0a80114 |     
  powerpc    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ceee91c301d3ee5843f7058714e8a8ef4a1479aa | ORPH
    arc      |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/f56531f0a27f4a249524d047e979986257403b36 | ORPH
  mips64el   |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/3cc78fe9846d43de8e8825848db127ee0e4db307 | ORPH
  mips64el   |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/8bbac2e00202589490cf7b7c019c8a469109e0e5 | ORPH
    arc      |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/8c654a1ed33881c940f3ecf347f00e6ce13f3edf | ORPH
   mipsel    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/88b277188b8d458d272f6cd2c0b4983dd25260fc | ORPH
    mips     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/ed69c8b4f82b22b27abb04be9d2ce79ba1199a45 | ORPH
   arceb     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/656ee32fc24a4b4ad29cecbd7fd503a3c7f03f2c | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0e4bdecc57555663c55bbb17613cb94d0dce460e | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4d34ad2a3b4014429ae5fa68ce5c49c81f1b9510 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3873e15ff546604a1bae11681f6686e798b73434 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/581086d30b347c680e66693a82c61a2816f667d7 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0b4128e20ded078f049be3704a4faa88dea9dfa9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7625c92f7f8e58bd306879c648ab5aba66491992 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/440c15c9cff68c46a6f6eaefc3c49cb8a21600e8 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/99a359f7afb87d10d6094a66e54e9b0066f0a4df | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c93c2c28cd2a34dbd8d63e9b142a3f476e803ddb | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9ed63c4aec583c8936ca7456d8df33a683592582 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5f95cd267c1fa7405149f83472448fac309731de | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b9b4476ed4e0941ba169b16d4685cfecce38e6c4 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ffa49b650f8e7bfdb36141185cc8c908b5a94f27 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3eea16b2a3a943e543278a4912a59e01d27f3ca1 | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/8cbfe487a07773ffb79e04ab20d0b0657e1e6a4c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/34836d8f09ce8114c9aabdb2293abf0867e41d99 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1567fcddd703c451692865785135ffe5d82e8ba5 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/53ecaccb937f0b6316650e2273d2d5c268963be6 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/52b242cccb293f90c23044760a622c77804610f4 | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/50f76182cbd7a0797817da14984b7793889d457a | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b258366f9f30c60d7ab40e0427b6576d5b692165 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5c8813fb63ebec6d8272897a3470e8702364e3f7 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/349ed06fc840ff226774d939446fc70b060635b7 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb95012cdd578d901abcb62bee52f9442649592c | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c871dee4b0bc9c7a9b341564165dcd5c73335508 | ORPH
  sparc64    |        host-json-c-0.18        | NOK | https://autobuild.buildroot.org/results/e59f7d459c5b77acb0b313401587a4c8f596688e |     
microblazeel |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/73efb0fbd48a506d5ce1f530027aacce5bf6db01 | ORPH
    sh4a     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/dabd5639af2aa97d6caadea6b8ba5a87d3c018c8 | ORPH
  sparc64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/ed1b5a6e40208db0b8987373240955d2622bcd89 | ORPH
    i586     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/d18065cad0dbcd2b2b9b9ae78223c98f10b8a7e9 | ORPH
   sparc     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/6ddb99c37c92d2baf3a36c7313cfc44aebd6f755 | ORPH
  sparc64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/257dce127946f94e5d64db2b43016eb2b3d0c24e | ORPH
    sh4      |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/d4ce82ef54e7117388f4872dd78582daa0845a4b | ORPH
   s390x     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/20f8c0d716d08f0f1ea3cde444517151f854b742 | ORPH
    or1k     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/d666efe7a45ecb5f47f901d545fb806a7320f6ca | ORPH
   s390x     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/0238ec5e471911def5cb8251f5c6cc4c3abee611 | ORPH
    mips     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/5100a33020e3ab99915218a9c1fa29e85cf9b60d | ORPH
    mips     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/26a85b50aa4f64c51c7b5fcf25ca7ca59262e9e0 | ORPH
    or1k     |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/f270f7abc1b7eac54be1f67d10c01e789bb95ff0 | ORPH
   mips64    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/a69ff8dc19ea30d16c9503b09ae97aedbda9280b | ORPH
   mipsel    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/7ca5999b96c397b7ac58c66f260cb164d82c8567 | ORPH
  mips64el   |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/f1191f58215d5995df19ba97b653b562730fffc8 | ORPH
   sh4aeb    |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/477898fe84b86086a29509e194cc086ba09e554b | ORPH
microblazeel |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/55b83d7508b6716776909d181a291429bfa258f5 | ORPH
powerpc64le  |     host-libopenssl-3.5.0      | NOK | https://autobuild.buildroot.org/results/a58d56fcf51613ada0974d9dead4fabb233abd1d | ORPH
    or1k     |     host-libselinux-3.8.1      | NOK | https://autobuild.buildroot.org/results/f384ea13288d8185d4d082c3deb0d4807d2da3a0 |     
microblazeel |     host-libselinux-3.8.1      | NOK | https://autobuild.buildroot.org/results/73af3f4fd763387e845da801f6a27fc6a1018f3a |     
   armeb     |     host-libselinux-3.8.1      | NOK | https://autobuild.buildroot.org/results/f536d406087f9c0395e455eb3b659bec7ab12f73 |     
   s390x     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/85fd1de145386ff652372689f400a9273de33de1 |     
   arceb     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/a9e174b3498ad00e704b0be7d9429ca24fa365f3 |     
   mipsel    |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/49c45b13badcae61f4e117cb36d2ba96bdd8bb51 |     
 microblaze  |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/ed8c93e4db43ed61ff3d60cf0c2046f1445e6e35 |     
   mips64    |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/e5d96d427c596249b4206e41759ff2f6396420fa |     
   arceb     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/c54df7a8bdd32efb5e625fd8b7e6efc711b9caa5 |     
    sh4a     |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/5b394d3b00a0e7d491c07aec5d03a8abfd2cef87 |     
  riscv64    |      host-libsepol-3.8.1       | NOK | https://autobuild.buildroot.org/results/253424b18e3ea18b2564c3e36712d5a9e6dd5c81 |     
    m68k     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/c297dfba9b0d83f7d92301bdca1e2668552d6113 | ORPH
 microblaze  |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/8a60c8652bd05f7310fd96256d5fe092d9f8776c | ORPH
   sh4eb     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/d9e3a253d4efc9e6fdf36ac3479227ae3df9f902 | ORPH
   s390x     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/e4ec4fd9adcf4c3a1f6abaad5b42a6056b569317 | ORPH
   arceb     |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/80a7f920aecab85a564d1241bec179f739977420 | ORPH
 powerpc64   |         host-m4-1.4.20         | NOK | https://autobuild.buildroot.org/results/38586c61173b4bfed2f7b5f5d79d647daa4bedb0 | ORPH
   armeb     |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/7e8ee78b091f3d94f64e854d95f888697cc287f2 | ORPH
powerpc64le  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/15ddcecea7807f602cc11f59b0929be3df7db031 | ORPH
   mips64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/5978cc4b5eddafd027fb57372b0bfc14c5615a3f | ORPH
 powerpc64   |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/20c8043a6b23fabff3820a0ac7f4ef968f154357 | ORPH
  aarch64    |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/0f7f033ef0ddc38b2a03ceab0c8839df375ff817 | ORPH
 microblaze  |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/cc2671a6afaee0902c04c2e8f22c3ef896b0db18 | ORPH
microblazeel |     host-mariadb-10.11.11      | NOK | https://autobuild.buildroot.org/results/48a80ffc1b32c25404172a950287a42ac6fd2dbc | ORPH
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c94c57413ba83be5793e8b27b586b45717a39acd |     
    sh4      |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/3713872d598793c6e989a7ec8eb47a7d3d45ff19 |     
 powerpc64   |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/ef8daad4172f860de0c542b82b5b0b2bd78ea142 |     
   s390x     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/72f9b872b54ca8b2910da8c5ad882449120e3dee |     
powerpc64le  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/8acfa3162113c22102c67580bba35f522ed5f6d3 |     
   armeb     |        host-pcre2-10.45        | NOK | https://autobuild.buildroot.org/results/dd02d79a41339249e7f3a1ef0e94566e42b33594 | ORPH
    arm      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/6204d75cd46abe7d1a4f00343a75538c1f813c1d |     
 powerpc64   |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/19f1930b0defb0e36fc170b20400cfe4382b45d2 |     
   xtensa    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/55bbf92bb52373864eeffa67f4a0253e7c7b0764 |     
  powerpc    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/ce7b2803c457d52b677912b9365014f07d78e37a |     
   sh4aeb    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/e9f40448c9791f76d12d8e8aaf30d50ff3a622e0 |     
    arc      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/f03284f425d42e78c5e0d8e43e86f9a2577d6833 |     
   mips64    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/beb9bae07cc5f8689bb776c3a682d859957cb163 |     
    m68k     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/9b5a35080f302896655f1fc6ce91523aef950288 |     
   sparc     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/48a44040d6f379fcbfc1f51c682b9e69a520a2c4 |     
powerpc64le  |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/d58e483961575783d6fa82b41c1b742e58c9ef54 |     
   x86_64    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/2fadaf8f5d9e82faf7d776869246fb05c508e9b8 |     
powerpc64le  |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/b99b15bf1ac5d2d8e5c7b0b98bbff07b038c47c2 |     
   x86_64    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/ced67a4d1d26ae3b6fe2142b55ab7fae5e193955 |     
   arceb     |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/04f9457d25c0489fc8eef1973804afa6845c9514 |     
  riscv64    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/3d5724af38009d8c1f191d561421952607ef4d48 |     
    arm      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/04767892c73944ded809d51f11000d90374b7fdb |     
    arm      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/d4ca2203ced25bb54424a0abbcbeb49374030292 |     
  riscv32    |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/3b18ed8be972476f2f8dd6cdb812de9de5dfe7e6 |     
    arc      |      host-python3-3.13.3       | NOK | https://autobuild.buildroot.org/results/676427a4458142bb26d64cfedee62187d8f25c3b |     
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/093b08edc459ed858a07aaf6429725560029ea5d | ORPH
  mips64el   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/088343188fb1fc8ab0ccb9c05ef5e3aed0abd0d8 | ORPH
   armeb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e9b4944f53f46a2bbc6e15e0e73d28f0c4307323 | ORPH
    arm      |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/6dd15b7706219b03b9da5cc008ac6c736bede943 | ORPH
   armeb     |         host-xz-5.8.1          | NOK | https://autobuild.buildroot.org/results/5b2d6d81794218d1f32fe994fcaa551e818f8489 | ORPH
   x86_64    |         host-xz-5.8.1          | NOK | https://autobuild.buildroot.org/results/5571f78e1c802ad239d5f5e41c57cdb125525d9c | ORPH
   mipsel    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/cc1ea0f4227c020f9849c6574c9464010c314ae4 | ORPH
  mips64el   |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/1fed20f4d0cdadd283540981cd28e897fb831016 |     
   mips64    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/ecb0ceffe7d5beebbab8938359251a88b99df60d |     
  mips64el   |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/25337b78857bc2c5f6dc8fc8a109d21d36e7223d |     
   sh4eb     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/e1ffb60de1ee4130e05d2d954271436a70e253ba |     
   sparc     | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/38d514b2e416275804973abef0776d718cbe3fd2 |     
 microblaze  |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/4a3878c96019778c975fcec50f06d0c010f25f66 | ORPH
    arm      |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/2a1293ef7a101cfb55f4cd2193df9e1fe350bec9 | ORPH
 microblaze  | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/7358f87b7725d7b7b17baddc43c98cf2d72b7476 | ORPH
    sh4a     | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/d8b72e41d4e5284b357adb6b9859535fa18d4e04 | ORPH
  mips64el   | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/045d9c53823ad555225bf73c2a43e634296831cb | ORPH
microblazeel | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/39fb3292f3771a5d98caad745b45e968e14f5b13 | ORPH
    or1k     | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/cdf8e6f61071c594aa62b4b12e393e403b0bc972 | ORPH
  aarch64    | libmodplug-d1b97ed0020bc620... | NOK | https://autobuild.buildroot.org/results/9a4ee748a6a6ac1473c1a0c1f57f6c218269e727 | ORPH
    i686     |       libopenmpt-0.7.13        | NOK | https://autobuild.buildroot.org/results/a15bff06ee8af8d929622e247f13dca14e64e9f5 |     
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/649d079161227a86f417713bd825c359fe265e85 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/c67def783432abc6b5285e8a274b4cde9337f256 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/0552c87271b5ce90fb66f17d88fb9ff496439352 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/9b3abd192e16dda67eb0930fa241561df5e4e913 | ORPH
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1d9a52f7f63a12dcec75b6cef92403a090f51b5a |     
   armeb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/cc27ba83ecd6a39da58f0dbf5e4736bd7007a06f |     
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ecc9f86b9b0076778f22894d3451c3cf235fa093 |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/ab1f3c03225a87f70ff551550c54ec2080dac7f7 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a965c1b58140e172b611797936c4a10d1a601c14 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3dfb587f6dbfe7d3a05bb990bf0c36f6f0b60e9d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/11bf76ee90fac01fdbbde06991c1dae25770e030 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/024169b49a7886b8aba91329933e30e649b8d9b5 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/169f05b37de62cf933c085ee343753d5fa0cb17d |     
  riscv32    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/f5a31c35ca8df7498fad86c3b82b84a683adcbbf |     
   sh4eb     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/bd1d33938342d81b0a7c139cd0f46bb160d44a2a |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/cdee4202277e4cab9cfd9ec1775288f759f03a50 |     
   armeb     |         libsoxr-0.1.3          | NOK | https://autobuild.buildroot.org/results/e332cf4dcee31297617113ed4385c89d10328878 |     
    i686     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/77c45be60b74775f98e23ca4340d8546c9d037b8 |     
   s390x     |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/64ff5c58396b91e6fdef70a4590d5256d0a81e69 | ORPH
  mips64el   |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/2a1c5779af9db2fbe88afb35861e22a4ffeafa35 |     
  riscv64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bce9aef94e2becc8c5f6c725d7cb4c9f7d3035c3 | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/a3e7aab5623d2217c9a54a21a0baa417ff41de19 | ORPH
    sh4a     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bba69dce1b205ba760cc8eec84bae07f30a2379f | ORPH
    i686     |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/30b5e62b71bd62ceb7b439acf102d0d151ad52ad | ORPH
   x86_64    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/9b98bf261ba894b9a2949f0508dc180af3562f2c | ORPH
  powerpc    |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/3780d02caa045f815f1e888accdc5c349bdda575 | ORPH
 powerpc64   |         linux-6.14.10          | NOK | https://autobuild.buildroot.org/results/4007a263d2512135f26ab51ec6b04ff95a759ebb | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1f0c083e5bc67c271d81e9fe99beda241a6ba44e | ORPH
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/8aa80dd4713eae60418cbdb5ff5fb8a212795a58 | ORPH
 powerpc64   |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/4184391e2cac4f03027ac393523c4a924b07a747 | ORPH
 microblaze  |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/5d4a6b3291e76a0bbc88d17c88e4ec3c7d31f638 | ORPH
    arc      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d7260a6dbeb0e99af4dc18ee9fc14b70cdb40469 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/2f9c148bf20b64ed14dd3daa01068bad545d88b6 |     
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0c3b9d04a350394b5143652f45d0568ef3c8eaf4 |     
 microblaze  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/9c297f5a6b06e469f1ce37b6f5ff17bd324ad9fe |     
  powerpc    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/de65539cccd34cf16319d3bc45090df795dc6353 |     
   sparc     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/66ab3edcbb11409dea590e0c87f62cde258480e1 | ORPH
  powerpc    |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/0839f9da98578c33e9042db651ca9b7cf4009cdc | ORPH
  mips64el   |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/abd0bd8e8379e37286a92646339b9782f0d0e097 | ORPH
   arceb     |         openal-1.22.0          | NOK | https://autobuild.buildroot.org/results/19e2b7b504b9e3d8e64e279af2b56e1faaf01f0c | ORPH
   mips64    |        openblas-0.3.29         | NOK | https://autobuild.buildroot.org/results/9e86d068a21915871be29faded2527e6c3bb2d3c |     
    m68k     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/ab94064d4aca537f13d9b397ca3d14d4e3968986 | ORPH
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/db6a34ee6459046cea6193362b92b5d795c9aa5d | ORPH
    mips     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/084e966fd5d52e656c5c33152964a99e675165de | ORPH
 microblaze  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/4ca5620d21997884f12865e67a767be2653b09f1 |     
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/3fb4d4b9213cf5def667a6379e7b469bfd500848 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/1cab4e74983ce4dac6f41a0944beb072d1c6dbb4 | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/3b5ee79711e3ea19d50aa2f140e2254934d641ec | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/09edcb42ab17f2c08a8529d1f3d335d9d3f6a4fd | ORPH
   sh4aeb    |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/5bdf494971449d0af2a6be66a98d518c5df0ad27 |     
   armeb     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/5c0a02b5f2e013caa0c9f72d7d8dd452fe5e8f3a |     
   mipsel    | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/20d89c97652f29423612df9d0820ccfa8cd40ebf | ORPH
    mips     | toolchain-external-codesour... | NOK | https://autobuild.buildroot.org/results/040bfdf4b62bf4a829a169fdf8dc9ec294b70188 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/21424c1b4c722b81fd093cccccee317d2e4cda50 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3acb7b7ca997747be5c99b5eaef612e3e283f3e1 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/716dc244db9b4ee84b03631f970cb2faf3316129 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/2305bd4c08f731383aaf72859e252ed9d58eb419 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe36b2411686e755094a4004d48e700f47e089e4 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e39ca6ad91cbdad634a1508bd95dbb11db54f626 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/9691cc2a274c6cdb2affd33b8980517be7b030fb |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/9f612f67fd7fb46e2836b6833e8544b90de9778a |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/f2c87e21c2b0c92bcef5fb0e2a4ca4cdb4f15fb2 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5f82bb74ce690f7d33a019ac458198575b4a13ca |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/6c6adb6f8cab1147ec2339fd63faea7587fd4124 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/917133d376b0d9577ce8d8c75a1b7978299b5b5d |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/128a9556fea0f40bbac48055a6efede80b7da620 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/830fde638e90495e9a6c53e0bfc4770acfcb2d40 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6ce435cde29075298129c572818688c3708692f1 |     
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/ec7de988e3c027654924c5cb9eb42c1fbc56da0f |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/a15651c47d9887c335b4215281e40a76465205df |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/9888e535bbfddc40813be13714ab8292089f306a |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/137aa3884945037c392bf1c82c7881ee8552980e |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/3fa2e4e53692bb463f276ae51f30ddb868780a64 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/1632ed2689061401cd0c5af83581196ead886375 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e7e420d96e910a873934e8a4aaa987035f93b91b |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/f7aca91046153f6459b3359fb7fda5f61a609050 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/e296f04484093a7d96bedb74d3b7613bbb63c418 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9eb8bea5be4ca353ca162ed9ab1e7ae4240294f0 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/db9ed70c646b314ce4d76ead14bf4209ec07320f |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/3917ae7e9bdaaefeec1e9d4572f677c0a3b25c3b |     
   armeb     |           yajl-2.1.0           | NOK | https://autobuild.buildroot.org/results/c311bc79f194e370665f1cce8ece4d1ba5cab66f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
             fluent-bit-3.2.10 | 1 
host-binutils-arc-2023.09-r... | 1 
          host-oniguruma-6.9.9 | 1 
                libdrm-2.4.124 | 1 
          linux-5.10.162-cip24 | 1 
                   perl-5.40.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/bb39695cbd58f7431e0f3a67845e4e7b5509a9ef |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/873c6637974d58a1cfba37ceaab807760e14bf80 |     
   sparc     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/13f7298b11d6c037b28052c9fedbf18d789a5df0 |     
   sparc     |         libdrm-2.4.124         | NOK | https://autobuild.buildroot.org/results/58ffef6c16b0bd557a79a784ddd6aa4c7d806516 |     
  sparc64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ffb2ede3c345dcb657fdc85a7db530d38e410fdd | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f4995982b765df17d9ed95ce133c46378af12ce5 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c71ccb8d02e38187aa3e4842d8ad9bb7c0fba1a2 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/721db0d049c020337d0cf13ebda98e1558243647 |     


Classification of failures by reason for next
---------------------------------------------

        liblog4c-localtime-1.0 | 3 
                     daq-2.0.7 | 1 
   host-bootgen-xilinx_v2025.1 | 1 
                 libcddb-1.3.2 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/2e3a678b1cf94bab3e50a53051cd06f3f90e6a6d |     
powerpc64le  |  host-bootgen-xilinx_v2025.1   | NOK | https://autobuild.buildroot.org/results/6a11a5a66faaa1647c7c837e6ad63df6467a39fe |     
  sparc64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/da7ff2c9b7747226733b0f2af50a6d3bd8a48e78 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/672f6b52748222dc2f86cf0d11fd26b7d2ef237a |     
  aarch64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/afc41e135651ef2eab717950bad55b26eced1dda |     
  sparc64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/c1916e2e865d922096a1efa3e0ac0146546de452 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/0496b43b623c82f3bb2e8d982e3306fe58c54cd9 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.14.0      | 1.15.0       | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.3        | ORPH
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 48.1         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.6.1        | 4.7.2        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2025.1       | ORPH
  amazon-ecr-credential-helper |  DISTRO  | https://release-monitoring.org/project/359761 | v0.9.1       | 0.10.0       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/013989 | 4.2.2+git... | 15.0.0_r36   |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 10.0         | 12.0         |     
                           apr |  DISTRO  | https://release-monitoring.org/project/000095 | 1.7.5        | 1.7.6        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.2        | ORPH
                     armadillo |  DISTRO  | https://release-monitoring.org/project/007006 | 14.4.2       | 14.4.3       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/006988 | 5.4.3        | 6.0.2        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.3.0       | 22.4.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.50.0       | 2.56.2       |     
                           atf |  DISTRO  | https://release-monitoring.org/project/021394 | 0.21         | 0.23         | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/000135 | 2.11.0       | 2.11.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.2        | 4.0.5        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/000142 | 2023.02.20   | 2024.10.16   | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.18         | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 111.0        | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.6        | 2.1.1        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.16.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2025.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2024.4       | 2025.1       |     
                            bc |  DISTRO  | https://release-monitoring.org/project/000170 | 1.07.1       | 1.08.2       | ORPH
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                           bcc |  DISTRO  | https://release-monitoring.org/project/012803 | v0.34.0      | 0.35.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/021323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/014746 | 4.4.8        | 5.4.21       | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/014378 | 4.4.8        | 5.4.21       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/080042 | 4.4.8        | 5.4.21       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.14      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.18.33      | 9.20.9       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.43.1       | 2.44         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.1.2        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 28.0         | 29.0         |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.83         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.79         | 5.83         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.0.2        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.88.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.6        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.5.0        | 3.8.1        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.5.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.23.3       | 0.23.4       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.6          | 6.7          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.14         | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20241223     | 20250419     |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 1.0.0        | 1.2.1        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.1.0        |     
                   casync-nano |  DISTRO  | https://release-monitoring.org/project/378246 | 1.1.1        | 1.1.2        |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/000257 | 4.11.2       | 4.11.3       | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.6.2        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.4.9        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/000276 | 3.8.1        | 20200710     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/008547 | 3.0.1        | 3.1.0        |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/000291 | 1.0.8        | 1.4.2        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/011811 | 20.1.5       | 20.1.6       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.3.2        | 2.5.0        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/010503 | 3.0.21.02.21 | 3.0.25.02.14 |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2025.1.0     | 2025.100.150 |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.2        | 1.1.4        |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 3.31.5       | 4.0.2        |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 1.1.5        | 1.1.7        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.3.0        | 1.6.2        |     
                           cog |  DISTRO  | https://release-monitoring.org/project/021333 | 0.18.4       | 0.18.5       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/017705 | 20.1.5       | 20.1.6       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.8.9        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.13       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.2        | 2.1.1        |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.5          | 9.7          | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.19.0       | 0.20.1       |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/000362 | 2.9.11       | 2.10.3       |     
                          criu |  DISTRO  | https://release-monitoring.org/project/000366 | 3.19         | 4.1          |     
                      crucible |  DISTRO  | https://release-monitoring.org/project/267616 | 2023.11.02   | 2025.05.28   |     
                       crudini |  DISTRO  | https://release-monitoring.org/project/021669 | 0.9.5        | 0.9.6        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.18.2       | 1.21         |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/021409 | 1.13         | 1.14         | ORPH
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/013709 | 2.7.5        | 2.8.0        |     
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/000380 | 2.4.11       | 2.4.12       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 2.11.0       | 4.9.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                         dante |  DISTRO  | https://release-monitoring.org/project/014716 | 1.4.3        | 1.4.4        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.19       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/000391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/007487 | 1.7.0        | 1.7.1        | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/005356 | 1.14.10      | 1.16.2       | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                      ddrescue |  DISTRO  | https://release-monitoring.org/project/000410 | 1.28         | 1.29.1       | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.23.1       | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.24.2       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20220117 | 1.3-20250116 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/000438 | 3.0.5        | 3.2.0        | ORPH
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 27.5.1       | 28.2.2       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.16.1       | 0.24.0       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.32.4       | 2.37.0       |     
         docker-credential-gcr |  DISTRO  | https://release-monitoring.org/project/377457 | v2.1.26      | 2.1.29       | ORPH
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 27.5.1       | 28.2.2       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2025.1       |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.0        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.0        |     
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 24.11.1      | 25.03        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 107          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/000462 | 9.21.4       | 9.31.0       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/021344 | 1.5.4        | 1.5.5        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                       dtbocfg |  DISTRO  | https://release-monitoring.org/project/235269 | 0.1.0        | 0.1.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 9.0          | 10.1         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.1.2        | 1.2.1        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.2        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/000659 | 1.20.2       | 1.21.1       | ORPH
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.28.1       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 25.04        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.192        | 0.193        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/017781 | 0.69         | 0.77         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.6        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/000696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.0.2       | 28.0         |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.24       |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.26       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.32       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.18       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 0.8.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.57       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.32       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.23       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.27       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.19       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.14       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.5        | 1.8.6        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 3.2.0        | 3.3.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.7.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.5        | 1.2.9        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/000769 | 0.27.6       | 0.28.5       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.20.19      | 0.21.3       |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.1       | 2.11.2       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.1.1     | 1.37.1.2     | ORPH
                      faketime |  DISTRO  | https://release-monitoring.org/project/021348 | 0.9.10       | 0.9.11       | ORPH
                         fastd |  DISTRO  | https://release-monitoring.org/project/017116 | 22           | 23           |     
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.8        | 3.3.1        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.38         | 3.40         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.3.0        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.27.0       |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/016642 | 24.12.23     | 25.2.10      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.3        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.4.5        | 2.4.6        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/011526 | 11.0.2       | 11.2.0       |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 6.7.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.16.0       | 2.16.2       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.22.3       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.2          | 5.3          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.14       | 1.6.15       |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.6        | 3.2.7        |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.15         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.13.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.0.11       |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/000868 | 5.3.1        | 5.3.2        | ORPH
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 3.40.0       | 4.4.0.1      | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.8.2        | 3.11.0       |     
                          gdbm |  DISTRO  | https://release-monitoring.org/project/000882 | 1.24         | 1.25         | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 2.8.15       |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 2.4.1        | 2.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.25         | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 18.0.2       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.84.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.1          | 0.3          |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/001202 | 4.0.0        | 4.0.1        |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/001206 | 6.2.9        | 6.2.11       | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/001215 | 2.4.7        | 2.5.7        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/001216 | 6.0.2        | 6.0.3        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/001217 | 3.10.11.0    | 3.10.12.0    |     
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.5.4        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/009771 | 2.15.9       | 2.17.7       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/021447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.6.0        | ORPH
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.10.0       | 0.10.2       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.66.1       | 1.73.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 48.0         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/001267 | 2.7.1        | 2.8          | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.11      | 1.26.2       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.11      | 1.26.2       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.11      | 1.26.2       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.11      | 1.26.2       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.11      | 1.26.2       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.11      | 1.26.2       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.11      | 1.26.2       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.11      | 1.26.2       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.8.2        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.11      | 1.26.2       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.0       | 0.15.2       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.11      | 1.26.2       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.11      | 1.26.2       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/018290 | 1.16.0       | 1.17.0       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 3.24.7       | 5.16.0       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.10       |     
                  gumbo-parser |  DISTRO  | https://release-monitoring.org/project/214990 | 0.10.1       | 0.13.1       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.6        | 1.6.8        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.1       | 0.14.3       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.1       | 0.12.2       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.48.1       | 1.57.2       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/006136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.22       | 3.2.0        |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.25.2       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.3.7        | 2.0.0        |     
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.11.2       | 2.12.1       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.50.2       | 2.57.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 73-2         | 77-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.41       | 0.8.44       | ORPH
                  igh-ethercat |  DISTRO  | https://release-monitoring.org/project/021674 | 1.6.3        | 1.6.4        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.1-43     | 7.1.1-47     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.5       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.23.9.0     | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/020341 | 25.2.1       | 25.2.4       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.506        | 3.507        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.1        | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/001393 | 7.23         | 7.24         |     
                     iptraf-ng |  DISTRO  | https://release-monitoring.org/project/007034 | 1.2.1        | 1.2.2        |     
                       iputils |  DISTRO  | https://release-monitoring.org/project/001395 | 20240905     | 20250605     |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.3        | 1.9.4        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.26         | 0.27         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/018380 | 3.0          | 3.8          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.35.2       | 1.38.0       |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/001417 | 2.14         | 2.14.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.3.1        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.5        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.81         | 0.83         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.1        | 3.6.3        | ORPH
                          jose |  DISTRO  | https://release-monitoring.org/project/011761 | 11           | 14           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 3.1.0        | 3.1.1        |     
                            jq |  DISTRO  | https://release-monitoring.org/project/013252 | 1.7.1        | 1.8.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.6.4        | 2.8.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.3        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.14.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 33           | 34.2         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.3        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.1        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/009815 | 2.16         | 2.17         |     
                        ledmon |  DISTRO  | https://release-monitoring.org/project/012346 | 1.0.0        | 1.1.0        |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 661          | 678          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20250127.0   | 20250512.0   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/007629 | 1.2.0        | 1.2.2        | ORPH
                    libarchive |  DISTRO  | https://release-monitoring.org/project/001558 | 3.7.9        | 3.8.1        |     
                        libass |  DISTRO  | https://release-monitoring.org/project/001560 | 0.17.3       | 0.17.4       |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/001559 | 2.5.7        | 3.0.2        | ORPH
                       libavif |  DISTRO  | https://release-monitoring.org/project/178015 | 1.1.1        | 1.3.0        |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.5.0        | 1.5.1        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/001567 | 0.11.7       | 0.12.2       | ORPH
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/007869 | 2.10         | 2.11         | ORPH
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.5.0       | 0.5.1        |     
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.5.0        | 1.7.0        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        |     
                        libclc |  GUESS   | https://release-monitoring.org/project/376264 | 20.1.5       | 20.1.6       |     
                     libconfig |  DISTRO  | https://release-monitoring.org/project/001580 | 1.7.3        | 1.8.1        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                       libcurl |  DISTRO  | https://release-monitoring.org/project/000381 | 8.13.0       | 8.14.1       |     
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.3        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.22         | 1.24         |     
                        libdrm |  DISTRO  | https://release-monitoring.org/project/001596 | 2.4.124      | 2.4.125      |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.1       | 1.13.4       |     
                       libexif |  DISTRO  | https://release-monitoring.org/project/001607 | 0.6.24       | 0.6.25       | ORPH
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                       libfcgi |  DISTRO  | https://release-monitoring.org/project/059392 | 2.4.5        | 2.4.6        | ORPH
                        libffi |  DISTRO  | https://release-monitoring.org/project/001611 | 3.4.8        | 3.5.0        |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.0        | ORPH
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/000846 | 3.4.0        | 3.6.0        |     
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/001623 | 1.11.0       | 1.11.1       | ORPH
                        libgee |  DISTRO  | https://release-monitoring.org/project/001625 | 0.20.6       | 0.20.8       |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/021361 | 1.7.3        | 1.7.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/001174 | 2.6.4        | 3.40.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.84.0       | 2.84.2       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/012098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/001628 | 1.51         | 1.55         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.23.2       | 2.0.0        | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/012558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.2.1        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 2.2.1        | 2.2.2        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.43      | 3.24.49      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.14.5       | 4.18.5       |     
                       libheif |  DISTRO  | https://release-monitoring.org/project/064439 | 1.18.2       | 1.19.8       |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.48       | 0.5.50       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.15         | 1.18         | ORPH
                     libid3tag |  DISTRO  | https://release-monitoring.org/project/021478 | 0.15.1b      | 0.16.3       | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.42         | 1.43         |     
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/005597 | 2.3.7        | 2.3.8        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.27.0       | 1.28.1       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.2       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.1        | 0.2.3        |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 3.2.0        | 3.2.1        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.7        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.48         | 249          |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/021483 | 0.31         | 0.32         | ORPH
                    libmanette |  DISTRO  | https://release-monitoring.org/project/229630 | 0.2.11       | 0.2.12       |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.12.2       |     
                   libmediaart |  DISTRO  | https://release-monitoring.org/project/013148 | 1.9.6        | 1.9.7        |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/001986 | 2.2.7        | 2.3.3        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.10.1alpha  | 1.11         |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.0        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 5.0.3        | 6.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.2.7        | 1.2.9        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.2.1        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.5.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.5.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.5.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.5.0        | ORPH
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.5.1        | 2.6.0        |     
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.0        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2025.2       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.12       | 0.4.14       | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.0.7        | ORPH
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.7.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.9.2        | 7.10.1       |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.1.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.60.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/013823 | 2.5.5        | 2.6.0        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.7       | ORPH
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001718 | 3.8.1        | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001719 | 3.8.1        | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.6.0        |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/001728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.30       | 0.7.33       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.3        | 2.4.0        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.5.0        | 3.7.0        |     
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/015633 | 0.13.1       | 0.14.0       |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.2        | 2.4.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/011793 | 1.1.1        | 1.2.0        | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.4        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.13.8       | 0.15.4       | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.11       |     
                       libtpms |  GUESS   | https://release-monitoring.org/project/116460 | 0.9.6        | 0.10.0       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.2        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.2          | 1.3.2        |     
                     libuhttpd |  DISTRO  | https://release-monitoring.org/project/089386 | 3.14.1       | 3.14.2       |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/001748 | 1.8.1        | 1.8.2        | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.19      | 1.14.23      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 1.0.3        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.14.0       | 0.15.3       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.6          | 2.10         |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.28.1       | 1.30.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.10.6       | 8.17.0       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 11.4.0       |     
                  libvncserver |  DISTRO  | https://release-monitoring.org/project/001756 | 0.9.14       | 0.9.15       | ORPH
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.15.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.15.0       | 1.15.2       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.7.0        | 1.10.0       |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/001783 | 2.13.8       | 2.14.3       |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.19       | 0.3.22       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libxslt |  DISTRO  | https://release-monitoring.org/project/013301 | 1.1.42       | 1.1.43       |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.4.0        |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.4.0        |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.10.1       | 1.11.4       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.24.26      |     
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.6.1        | 1.7.0        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2021.05.03   | 2025.05.24   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/001830 | 20.1.5       | 20.1.6       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.18       | 1.0.19       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/001830 | 20.1.5       | 20.1.6       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.2        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.3.1        | 1.4.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
                 ltp-testsuite |  DISTRO  | https://release-monitoring.org/project/021502 | 20250130     | 20250530     |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.13.9       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.13.18      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.13.15      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.8        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/001856 | 3.11.1       | 3.12.0       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.1        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.51.0-1     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/021512 | 2.14.0       | 2.15.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.32      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.4        |     
                         lynis |  DISTRO  | https://release-monitoring.org/project/001862 | 3.1.3        | 3.1.4        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2409         | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.5        | 1.7.7        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.11     | 12.0.1       | ORPH
                  matchbox-lib |  DISTRO  | https://release-monitoring.org/project/021187 | 1.12         | 1.14         | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.28       |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20250429     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 206          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.7.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/021746 | 4.4.8        | 5.4.21       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.29       | 1.6.38       | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 25.1.1       | 25.1.3       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 25.1.1       | 25.1.3       | ORPH
                         meson |  DISTRO  | https://release-monitoring.org/project/006472 | 1.7.0        | 1.8.1        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/015392 | 2.25.1       | 3.56.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2025.03      |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.2       | 1.25.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.12.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.10       |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2025.05      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.22.0       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.7        | 3.0.14       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.34.3       | 5.35.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/014864 | 0.24.3       | 0.24.4       |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 4.0.0        | 4.0.1        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.2        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.32.8       | 1.33.0       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.40.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 7.0.0        |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/002026 | 2.2.1        | 2.3.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/008868 | 1.1.6        | 1.1.7        |     
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.11.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.26.2       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.2.13       | 2.2.14       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.4        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.38         | 1.43         |     
                          nano |  DISTRO  | https://release-monitoring.org/project/002046 | 8.2          | 8.4          | ORPH
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.25         | 3.26.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.8.2        |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/002055 | 0.49         | 0.52         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.5-20250517 | 6.5-20250531 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/007604 | 0.33.0       | 0.34.2       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.1.2        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.19       | 4.2.4        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.14.0      | 1.15.2       | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.33.1       | 2.5.3        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.12       |     
                   netsniff-ng |  DISTRO  | https://release-monitoring.org/project/002071 | 0.6.8        | 0.6.9        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.25      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.3        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.0        | 1.1.3        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.64.0       | 1.65.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.3       | 1.28.0       | ORPH
             nginx-modsecurity |  DISTRO  | https://release-monitoring.org/project/068639 | 1.0.3        | 1.0.4        |     
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 24.1.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.15.1      | 24.1.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.96.1       | 0.104.1      | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 575.57.08    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 560.35.03    | 575.57.08    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 1.12         | 2.14         | ORPH
                         oatpp |  DISTRO  | https://release-monitoring.org/project/370050 | 1.3.0        | 1.3.1        |     
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 10.1.0       | 10.2.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.5.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.2          | 2.17         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.3.4       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.3        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.11       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.4.12       | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.22.0       | 1.24.3       | ORPH
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.19       | 4.11.0       | ORPH
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.10.0       | 4.11.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.13.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 10.2.1       | 10.5.0       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.5        | 5.0.8        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.62.2       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.16.5       | ORPH
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.26.0       | 0.26.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 12.5.2       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.8.0        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/011081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.34       | 0.4.41       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/021691 | 4.4.8        | 5.4.21       | ORPH
                     osm2pgsql |  DISTRO  | https://release-monitoring.org/project/002575 | 2.0.1        | 2.1.1        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/002582 | 0.25.3       | 0.25.5       | ORPH
                         p7zip |  DISTRO  | https://release-monitoring.org/project/002583 | 17.05        | 17.06        |     
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.5.3        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.28         | 1.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.54.0       | 1.56.3       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.8        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.3.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.35         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.95         | 6.97         |     
            perl-datetime-tiny |  DISTRO  | https://release-monitoring.org/project/002802 | 1.07         | 1.08         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.012        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.647        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.84         | 0.85         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.30        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.089        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.77         | 6.78         |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.051        | 0.052        |     
           perl-module-runtime |  DISTRO  | https://release-monitoring.org/project/003111 | 0.016        | 0.018        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.38         | 9.40         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20240924     | 20250202     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.48         | 1.50         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.74         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/011962 | 0.146        | 0.148        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/014406 | 2.006000     | 2.008002     |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.31         | 5.32         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/003627 | 8.3.21       | 8.4.8        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/015603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.22       | 5.1.24       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/021743 | 1.5.1        | 1.5.3        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/017401 | 3.7.0        | 3.8.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/017400 | 3.2.0        | 3.3.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.3.1        | 3.4.3        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/012515 | 2.2.3        | 2.2.4        | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 1.5.1        | 2.1.1        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.1.1        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.2.7        | 1.4.5        |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/003648 | 0.44.2       | 0.46.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 2.4.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.13.2       | 1.14.2       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.4.1       | 5.5.1        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.3          | ORPH
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 22.12.0      | 25.06.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.5.2        | 3.5.3        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.8          | 4.16         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.13       | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.9       | 0.14.10      |     
                       proftpd |  DISTRO  | https://release-monitoring.org/project/007609 | 1.3.8b       | 1.3.9        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.5.1        | 9.6.2        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.2       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 31.1         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/003728 | 1.14         | 1.15         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/005749 | 0.81         | 0.83         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.9.0        | 1.9.31       | ORPH
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/034074 | 3.1.15       | 3.1.16       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/021243 | 0.4.12       | 0.4.14       |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 3.2.0        | 3.4.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.11.14      | 3.12.11      |     
           python-aiohttp-cors |  DISTRO  | https://release-monitoring.org/project/012956 | 0.8.0        | 0.8.1        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/021252 | 1.3.0        | 1.4.0        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.14.1       | 1.16.1       |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/037849 | 6.8.1        | 6.8.2        |     
            python-argcomplete |  DISTRO  | https://release-monitoring.org/project/003773 | 3.5.3        | 3.6.2        |     
            python-argon2-cffi |  DISTRO  | https://release-monitoring.org/project/033377 | 23.1.0       | 25.1.0       |     
              python-async-lru |  DISTRO  | https://release-monitoring.org/project/056566 | 2.0.4        | 2.0.5        |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.19.0       | 2.21.0       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/015099 | 25.1.0       | 25.3.0       |     
                python-automat |  DISTRO  | https://release-monitoring.org/project/015101 | 24.8.1       | 25.4.16      |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.16.0       | 2.17.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/009047 | 4.2.1        | 4.3.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.12.3       | 4.13.4       |     
               python-bitarray |  DISTRO  | https://release-monitoring.org/project/011014 | 3.0.0        | 3.4.2        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.3.0        | 4.3.1        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/021929 | 0.9.0        | 0.9.1        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.37.34      | 1.38.32      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.37.33      | 1.38.32      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/011101 | 0.13.2       | 0.13.3       |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/044268 | 1.2.5        | 1.2.6        |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 5.5.1        | 6.0.0b4      |     
                 python-calver |  DISTRO  | https://release-monitoring.org/project/100823 | 2022.6.26    | 2025.4.17    |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2024.12.14   | 2025.4.26    |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/021937 | 4.2.0        | 4.2.2        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.1        | 3.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/020163 | 10.0.1       | 11.0.0b3     |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/003802 | 8.2.0        | 8.2.1        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.2        |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.3.1        | 1.3.2        |     
                   python-cppy |  DISTRO  | https://release-monitoring.org/project/089055 | 1.3.0        | 1.3.1        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 44.0.1       | 45.0.3       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/011593 | 1.2.0        | 1.3.0        |     
             python-cssselect2 |  DISTRO  | https://release-monitoring.org/project/086109 | 0.7.0        | 0.8.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.0.11       | 3.1.1        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/021939 | 4.1.2        | 4.2.0        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.34.0       | 2.44.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.1.1        | 5.2.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/003828 | 5.2.1        | 5.2.2        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2024.11      | 2025.2       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.0       | 0.19.1       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.11.2       | 4.12.2       |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/062869 | 1.9.0        | 1.9.2        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.17.0       | 3.18.0       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 5.0.0        | 6.0.0        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/025028 | 0.45.0       | 0.46.1       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 2.0.7        | 25.2.10      |     
              python-flit-core |  DISTRO  | https://release-monitoring.org/project/044841 | 3.11.0       | 3.12.0       |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.55.6       | 4.58.2       |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/041138 | 1.5.0        | 1.6.2        |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 15.3.0       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.24.1       | 2.25.0       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.38.0       | 2.40.3       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.66.0       | 1.70.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.1.1        | 3.2.3        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.20       | 0.1.21       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.70.0       | 1.72.1       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.70.0       | 1.72.1       |     
                python-grpclib |  DISTRO  | https://release-monitoring.org/project/039170 | 0.4.7        | 0.4.8        |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/019033 | 4.1.0        | 4.2.0        |     
python-hatch-fancy-pypi-readme |  DISTRO  | https://release-monitoring.org/project/274452 | 24.1.0       | 25.1.0       |     
              python-hatch-vcs |  DISTRO  | https://release-monitoring.org/project/301800 | 0.4.0        | 0.5.0        |     
                    python-hid |  DISTRO  | https://release-monitoring.org/project/049364 | 1.0.6        | 1.0.7        |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 3.1.0        | 3.2.1        |     
               python-httpcore |  DISTRO  | https://release-monitoring.org/project/079947 | 1.0.7        | 1.0.9        |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.11.0       | 4.12.3       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.2-1      |     
              python-iniconfig |  DISTRO  | https://release-monitoring.org/project/114778 | 2.0.0        | 2.1.0        |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/011475 | 1.0.1        | 1.2.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 8.31.0       | 9.3.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
                python-jeepney |  DISTRO  | https://release-monitoring.org/project/019564 | 0.8.0        | 0.9.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/003898 | 4.23.0       | 4.24.0       |     
python-jsonschema-specifica... |  DISTRO  | https://release-monitoring.org/project/316377 | 2024.10.1    | 2025.4.1     |     
             python-legacy-cgi |  DISTRO  | https://release-monitoring.org/project/375190 | 2.6.2        | 2.6.3        |     
               python-libevdev |  DISTRO  | https://release-monitoring.org/project/250362 | 0.11         | 0.12         |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.2.0        | 3.3.1        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/020016 | 1.8.0        | 1.8.1        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 5.3.0        | 5.4.0        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.17.0       | 0.19.2       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/003915 | 1.3.8        | 1.3.10       |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/003916 | 3.7          | 3.8          |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 3.26.0       | 4.0.0        |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/050566 | 1.4.0        | 1.4.2        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.0       | 3.10.3       |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.8.3        | 1.8.6        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.17.1       | 0.18.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.1.0        | 3.1.3        |     
              python-modbus-tk |  DISTRO  | https://release-monitoring.org/project/022813 | 1.1.4        | 1.1.5        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 10.6.0       | 10.7.0       |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/011132 | 6.1.0        | 6.4.4        |     
        python-mypy-extensions |  DISTRO  | https://release-monitoring.org/project/023367 | 1.0.0        | 1.1.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/007791 | 3.4.2        | 3.5          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.3.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.10.15      | 3.10.18      |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/060461 | 24.2         | 25.0         |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 3.5.0        | 3.5.1        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/003960 | 6.1.0        | 6.1.1        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 11.1.0       | 11.2.1       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 25.0         | 25.1.1       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/007500 | 1.5.0        | 1.6.0        |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/020203 | 3.2.0        | 3.2.1        |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/013204 | 1.1.1        | 1.2.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/008742 | 3.0.50       | 3.0.51       |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.2.1        | 0.3.1        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.26.0       | 1.26.1       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 29.3         | 31.1         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/003978 | 6.1.1        | 7.0.0        |     
                python-psygnal |  DISTRO  | https://release-monitoring.org/project/218690 | 0.11.1       | 0.13.0       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/003980 | 2024.1.3     | 2025.1       |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/003767 | 1.2.12       | 1.2.14       |     
                  python-pyaml |  DISTRO  | https://release-monitoring.org/project/083931 | 25.1.0       | 25.5.0       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/011987 | 0.4.1        | 0.4.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/013166 | 1.27.0       | 1.28.0       |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/019900 | 4.5.0        | 4.8.0        |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.8        | 0.7.9        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/036851 | 3.21.0       | 3.23.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20241204.1   | 20250607.2   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/029768 | 2.11.4       | 2.11.5       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.31         | 0.32         |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.14         | 2.15.2       |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.7.2        | 1.7.2.post1  |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/015600 | 3.8.6        | 3.9.2        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.26.0       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 25.0.0       | 25.1.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/003756 | 3.2.1        | 3.2.3        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
        python-pypika-tortoise |  DISTRO  | https://release-monitoring.org/project/181934 | 0.5.0        | 0.6.1        |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.9.0        | 0.9.1        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/020081 | 0.8.1        | 0.9.2        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.10       | 1.2.11       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.5.9        | 1.6.2        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.16       | 7.1.20       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/003765 | 8.3.5        | 8.4.0        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 0.25.3       | 1.0.0        |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/021140 | 0.17.0       | 0.18.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2024.2       | 2025.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 26.4.0       |     
                 python-qrcode |  DISTRO  | https://release-monitoring.org/project/020011 | 8.1          | 8.2          |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 5.2.1        | 6.2.0        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.22.3       | 0.25.1       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.12.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.3        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.18.10      | 0.18.13      |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.11.4       | 0.13.0       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.15.3       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/059641 | 1.6.1        | 1.6.6        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.27.1       | 4.33.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.21.0       | 3.0.0a1      |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/011699 | 1.3.4        | 1.3.6        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 79.0.1       | 80.9.0       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.11.0       | 1.11.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 8.1.0        | 8.3.1        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.1        | 2.2.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/004026 | 3.19.3       | 3.20.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/021608 | 1.5.3        | 1.5.4        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.12.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.2        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.12.1       | 5.13.0       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.6          | 2.7          |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/021612 | 3.6          | 3.7          |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/029718 | 2.0.0        | 2.0.1        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 0.46.2       | 0.47.0       |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/004923 | 1.13.3       | 1.14.0       |     
              python-termcolor |  DISTRO  | https://release-monitoring.org/project/010198 | 2.5.0        | 3.1.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.21.0       | 0.22.0       |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.13.2       | 0.13.3       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/007498 | 6.5          | 6.5.1        |     
           python-tortoise-orm |  DISTRO  | https://release-monitoring.org/project/033168 | 0.25.0       | 0.25.1       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/019614 | 24.9.1       | 25.5.0       |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/017451 | 0.28.0       | 0.30.0       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.11.1       | 0.12.2       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2025.1.15.22 | 2025.5.9.12  |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 24.11.0      | 25.5.0       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.4.1        | 4.4.3        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/019755 | 4.13.2       | 4.14.0       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 2.6.16       | 3.0.2        |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.34.2       | 0.34.3       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/019818 | 0.34.0       | 0.35.0       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 64.0         | 65.1         |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/024711 | 8.6.0        | 8.7.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/008100 | 15.0         | 15.0.1       |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/011428 | 0.45.1       | 0.46.1       |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/012031 | 3.2.1        | 3.2.3        |     
               python-yamllint |  DISTRO  | https://release-monitoring.org/project/009761 | 1.35.1       | 1.37.1       |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.18.3       | 1.20.0       |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.141.0      | 0.147.0      |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/013254 | 3.13.3       | 3.13.4       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 10.0.0       | 10.0.2       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 12.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.40.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.1        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.1        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.1        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.9.1        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.9.1        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.8.1        | 6.9.1        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.8.1        | 6.9.1        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.4          | 1.5          |     
                         quota |  DISTRO  | https://release-monitoring.org/project/004145 | 4.09         | 4.10         |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.15.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 56.0         | 57.0         |     
                      readline |  DISTRO  | https://release-monitoring.org/project/004173 | 8.2          | 8.2.13       | ORPH
               redis-plus-plus |  DISTRO  | https://release-monitoring.org/project/368624 | 1.3.12       | 1.3.14       |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/016520 | 3.8.1        | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.46.2       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 10.2.1       |     
                  rpi-firmware |  DISTRO  | https://release-monitoring.org/project/021744 | 1.20250326   | 1.20250430   |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 23.11        | 25.02        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.9.8        | 0.15.4       | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 8.1.2        | 8.1.5        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 3.4.3        | 3.4.4        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.2.4        | 1.3.0        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/007635 | 1.86.0       | 1.87.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/007635 | 1.86.0       | 1.87.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.65.1       | 0.72.0       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 0.44.2       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.37.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.13.2.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.1.3.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.3.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.7.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.5.6.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/004758 | 4.21.4       | 4.22.2       |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.33      | 0.99.35      |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.4.0        |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.0          | 2.1          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.9.1        |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/004779 | 2.32.6       | 2.32.8       |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.4        | 3.2.4        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.1        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/004784 | 2.24.0       | 3.2.2        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.4        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.46.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.9.0        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.5        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.4       |     
                       sexpect |  DISTRO  | https://release-monitoring.org/project/269648 | 2.3.14       | 2.3.15       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 3.3.9        | 4.3.7        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/010719 | 15.8         | 16.0         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.14.4.0     |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.18.0       | 1.19.0       |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.8.0        | 4.9.1        | ORPH
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/096795 | 1.3.2        | 1.3.3        |     
                        snappy |  DISTRO  | https://release-monitoring.org/project/004844 | 1.2.1        | 1.2.2        | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.7.0        | 1.8.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.5.1        | 3.6.3        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.8.1.0      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.18      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                       speechd |  DISTRO  | https://release-monitoring.org/project/328138 | 0.11.5       | 0.12.1       |     
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.9.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/004877 | 3.48.0       | 3.50.1       |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/004879 | 4.6.1        | 4.7          |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 6.13         | 7.0.1        | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.18       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.2.4        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.22.20      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                    stellarium |  DISTRO  | https://release-monitoring.org/project/004891 | 24.3         | 25.1         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.18.05      | 0.19.01      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 5.9.14       | 6.0.1        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.75         |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 25.03        |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.19       | 7.0.10       |     
                          sway |  DISTRO  | https://release-monitoring.org/project/011497 | 1.10         | 1.11         |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.3.1        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 9.2.8        | 9.2.9        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.10.1       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.40.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.8.1        | 4.8.3        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.7       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 257.5        | 257.6        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/001982 | 2.0.2        | 2.1          |     
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.84.1       |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2022.1.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.9.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.1        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/013716 | 4.4.4        | 4.5.1        | ORPH
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.7.2        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.19.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.5.0        | 5.5.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.5.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.22.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.20.0       | 2.20.2       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.0.2        |     
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/021379 | 0.6.0        | 0.6.1        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20250501     |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.9          |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.6.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.1        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/016819 | 2.3.3        | 3.0.0        | ORPH
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 3.2.2        | 4.1.3        | ORPH
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2021.07      | 2025.04      | ORPH
                       udpcast |  DISTRO  | https://release-monitoring.org/project/010206 | 20230924     | 20250223     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.17         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.7.0.0      | 4.8.0.0      |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.21.1       | 1.23.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 2.1          | 3.6          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 6.2.12       | 7.1.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.9.6        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.90.9       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.0.1        |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/011151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.9.0        | 2.10.0       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.40.2       | 2.41         | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.40.2       | 2.41         | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.13.2       | 0.15.0       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.17      | 0.56.18      | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.0.6        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.7.5        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.0145     | 9.1.1441     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.11       |     
                           vlc |  DISTRO  | https://release-monitoring.org/project/006504 | 3.0.21       | 3.0.21-1     |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.1.2        | 3.2.0        |     
                  vorbis-tools |  DISTRO  | https://release-monitoring.org/project/005104 | 1.4.2        | 1.4.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.80.2       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.5.12       | 3.5.16       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.4.5        | 4.5.1        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.3.262      | 1.4.317      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.4.317      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.4.317      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/021633 | 1.7.0        | 1.8.1        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.8.1        | ORPH
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.42         | 1.44         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.48.2       | 2.49.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 14.0.1       | 14.0.2       |     
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.21         | 2.23         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 10.0         | 10.9         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.5        | 0.5.10       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.2.11       | 4.4.7        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.18.2       | 0.19.0       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.9.1        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/017547 | 1.14.3       | 1.16.0       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.44.4       | 2.48.3       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 3.5          | 4.1          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.27       | 1.4.29       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/015053 | 1.0.6        | 1.0.7        | ORPH
                 xapp_bdftopcf |  DISTRO  | https://release-monitoring.org/project/015054 | 1.1.1        | 1.1.2        | ORPH
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.4        | ORPH
                xapp_fslsfonts |  DISTRO  | https://release-monitoring.org/project/017157 | 1.0.6        | 1.0.7        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20240910     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                   xapp_oclock |  DISTRO  | https://release-monitoring.org/project/015042 | 1.0.5        | 1.0.6        | ORPH
                  xapp_sessreg |  DISTRO  | https://release-monitoring.org/project/015040 | 1.1.3        | 1.1.4        | ORPH
                 xapp_showfont |  DISTRO  | https://release-monitoring.org/project/012316 | 1.0.6        | 1.0.7        | ORPH
                  xapp_smproxy |  DISTRO  | https://release-monitoring.org/project/015039 | 1.0.7        | 1.0.8        | ORPH
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/015038 | 1.0.12       | 1.0.13.1     | ORPH
                  xapp_viewres |  DISTRO  | https://release-monitoring.org/project/017162 | 1.0.7        | 1.0.8        | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.4        | ORPH
               xapp_xbacklight |  DISTRO  | https://release-monitoring.org/project/005161 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.4        | 1.1.5        | ORPH
                   xapp_xcmsdb |  DISTRO  | https://release-monitoring.org/project/015031 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xcompmgr |  DISTRO  | https://release-monitoring.org/project/005174 | 1.1.9        | 1.1.10       | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
               xapp_xcursorgen |  DISTRO  | https://release-monitoring.org/project/021210 | 1.0.8        | 1.0.9        | ORPH
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/005255 | 1.1.14       | 1.1.17       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                    xapp_xhost |  DISTRO  | https://release-monitoring.org/project/015021 | 1.0.9        | 1.0.10       | ORPH
                    xapp_xinit |  DISTRO  | https://release-monitoring.org/project/005258 | 1.4.2        | 1.4.4        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.4.7        | ORPH
                   xapp_xkbevd |  DISTRO  | https://release-monitoring.org/project/015017 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                    xapp_xlogo |  DISTRO  | https://release-monitoring.org/project/014991 | 1.0.6        | 1.0.7        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xmag |  DISTRO  | https://release-monitoring.org/project/014963 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.8        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.2        | 1.5.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.6        | 1.0.7        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
               xcb-util-cursor |  DISTRO  | https://release-monitoring.org/project/005166 | 0.1.4        | 0.1.5        | ORPH
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/005217 | 2.10.6       | 2.11.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.5.0        | ORPH
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/005239 | 1.9.2        | 1.10.0       | ORPH
        xdriver_xf86-video-ast |  DISTRO  | https://release-monitoring.org/project/017163 | 1.1.6        | 1.2.0        | ORPH
      xdriver_xf86-video-fbdev |  DISTRO  | https://release-monitoring.org/project/005218 | 0.5.0        | 0.5.1        | ORPH
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/005219 | 2.11.21      | 2.18.1       | ORPH
     xdriver_xf86-video-mach64 |  DISTRO  | https://release-monitoring.org/project/005225 | 6.9.7        | 6.10.0       | ORPH
        xdriver_xf86-video-mga |  DISTRO  | https://release-monitoring.org/project/005226 | 2.0.1        | 2.1.0        | ORPH
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/005229 | 1.0.17       | 1.0.18       | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
       xdriver_xf86-video-r128 |  DISTRO  | https://release-monitoring.org/project/005232 | 6.12.1       | 6.13.0       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.20.0       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/005182 | 3.2.4        | 3.3.0        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.11.0       | 6.14.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.45         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.18       | 1.3.19       | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libICE |  DISTRO  | https://release-monitoring.org/project/001638 | 1.1.1        | 1.1.2        | ORPH
                    xlib_libSM |  DISTRO  | https://release-monitoring.org/project/001726 | 1.2.4        | 1.2.6        | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.12       | ORPH
                   xlib_libXau |  DISTRO  | https://release-monitoring.org/project/001765 | 1.0.11       | 1.0.12       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.3        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/001777 | 2.3.8        | 2.3.9        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.1        | 1.8.2        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.11       | 0.9.12       | ORPH
                    xlib_libXt |  DISTRO  | https://release-monitoring.org/project/001793 | 1.3.0        | 1.3.1        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                    xlib_libXv |  DISTRO  | https://release-monitoring.org/project/001795 | 1.0.12       | 1.0.13       | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.5        | 1.1.6        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
                  xlib_libxcvt |  DISTRO  | https://release-monitoring.org/project/235147 | 0.1.2        | 0.1.3        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                   xlib_xtrans |  DISTRO  | https://release-monitoring.org/project/013441 | 1.5.0        | 1.6.0        | ORPH
                         xmrig |  DISTRO  | https://release-monitoring.org/project/017499 | 6.22.2       | 6.22.3       |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.03         | 6.10.1       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.28         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 389          | 399          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.2       | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.1         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.13.3       | 4.15.0       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.5        | 7.2.7        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 7.2.1        |     
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.6        | 0.9.8        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.80      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-48426   | https://security-tracker.debian.org/tracker/CVE-2024-48426  
                        assimp | CVE-2024-46632   | https://security-tracker.debian.org/tracker/CVE-2024-46632  
                        assimp | CVE-2025-5165    | https://security-tracker.debian.org/tracker/CVE-2025-5165   
                        assimp | CVE-2025-5166    | https://security-tracker.debian.org/tracker/CVE-2025-5166   
                        assimp | CVE-2025-5168    | https://security-tracker.debian.org/tracker/CVE-2025-5168   
                        assimp | CVE-2025-5169    | https://security-tracker.debian.org/tracker/CVE-2025-5169   
                        assimp | CVE-2025-5167    | https://security-tracker.debian.org/tracker/CVE-2025-5167   
                        assimp | CVE-2025-3160    | https://security-tracker.debian.org/tracker/CVE-2025-3160   
                        assimp | CVE-2025-3196    | https://security-tracker.debian.org/tracker/CVE-2025-3196   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                        assimp | CVE-2025-2151    | https://security-tracker.debian.org/tracker/CVE-2025-2151   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                     bootstrap | CVE-2024-6531    | https://security-tracker.debian.org/tracker/CVE-2024-6531   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libavif | CVE-2025-48174   | https://security-tracker.debian.org/tracker/CVE-2025-48174  
                        libbpf | CVE-2025-29481   | https://security-tracker.debian.org/tracker/CVE-2025-29481  
                      libde265 | CVE-2024-38950   | https://security-tracker.debian.org/tracker/CVE-2024-38950  
                      libde265 | CVE-2024-38949   | https://security-tracker.debian.org/tracker/CVE-2024-38949  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2025-43967   | https://security-tracker.debian.org/tracker/CVE-2025-43967  
                       libheif | CVE-2025-43966   | https://security-tracker.debian.org/tracker/CVE-2025-43966  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                           sox | CVE-2023-34432   | https://security-tracker.debian.org/tracker/CVE-2023-34432  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                     tcpreplay | CVE-2023-43279   | https://security-tracker.debian.org/tracker/CVE-2023-43279  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                       tinyxml | CVE-2023-34194   | https://security-tracker.debian.org/tracker/CVE-2023-34194  
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-48426   | https://security-tracker.debian.org/tracker/CVE-2024-48426  
                        assimp | CVE-2024-46632   | https://security-tracker.debian.org/tracker/CVE-2024-46632  
                        assimp | CVE-2025-3015    | https://security-tracker.debian.org/tracker/CVE-2025-3015   
                        assimp | CVE-2025-3016    | https://security-tracker.debian.org/tracker/CVE-2025-3016   
                        assimp | CVE-2025-5165    | https://security-tracker.debian.org/tracker/CVE-2025-5165   
                        assimp | CVE-2025-5166    | https://security-tracker.debian.org/tracker/CVE-2025-5166   
                        assimp | CVE-2025-5168    | https://security-tracker.debian.org/tracker/CVE-2025-5168   
                        assimp | CVE-2025-5169    | https://security-tracker.debian.org/tracker/CVE-2025-5169   
                        assimp | CVE-2025-5167    | https://security-tracker.debian.org/tracker/CVE-2025-5167   
                        assimp | CVE-2025-3160    | https://security-tracker.debian.org/tracker/CVE-2025-3160   
                        assimp | CVE-2025-3196    | https://security-tracker.debian.org/tracker/CVE-2025-3196   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                        assimp | CVE-2025-2151    | https://security-tracker.debian.org/tracker/CVE-2025-2151   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                     bootstrap | CVE-2024-6531    | https://security-tracker.debian.org/tracker/CVE-2024-6531   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libavif | CVE-2025-48174   | https://security-tracker.debian.org/tracker/CVE-2025-48174  
                        libbpf | CVE-2025-29481   | https://security-tracker.debian.org/tracker/CVE-2025-29481  
                      libde265 | CVE-2024-38950   | https://security-tracker.debian.org/tracker/CVE-2024-38950  
                      libde265 | CVE-2024-38949   | https://security-tracker.debian.org/tracker/CVE-2024-38949  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2025-43967   | https://security-tracker.debian.org/tracker/CVE-2025-43967  
                       libheif | CVE-2025-43966   | https://security-tracker.debian.org/tracker/CVE-2025-43966  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2025-26465   | https://security-tracker.debian.org/tracker/CVE-2025-26465  
                       openssh | CVE-2025-26466   | https://security-tracker.debian.org/tracker/CVE-2025-26466  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       quickjs | CVE-2025-46688   | https://security-tracker.debian.org/tracker/CVE-2025-46688  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                           sox | CVE-2023-34432   | https://security-tracker.debian.org/tracker/CVE-2023-34432  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                     tcpreplay | CVE-2023-43279   | https://security-tracker.debian.org/tracker/CVE-2023-43279  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                       tinyxml | CVE-2023-34194   | https://security-tracker.debian.org/tracker/CVE-2023-34194  
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the 'next' branch
--------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2025-3891    | https://security-tracker.debian.org/tracker/CVE-2025-3891   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-48426   | https://security-tracker.debian.org/tracker/CVE-2024-48426  
                        assimp | CVE-2024-46632   | https://security-tracker.debian.org/tracker/CVE-2024-46632  
                        assimp | CVE-2025-3015    | https://security-tracker.debian.org/tracker/CVE-2025-3015   
                        assimp | CVE-2025-3016    | https://security-tracker.debian.org/tracker/CVE-2025-3016   
                        assimp | CVE-2025-5165    | https://security-tracker.debian.org/tracker/CVE-2025-5165   
                        assimp | CVE-2025-5166    | https://security-tracker.debian.org/tracker/CVE-2025-5166   
                        assimp | CVE-2025-5168    | https://security-tracker.debian.org/tracker/CVE-2025-5168   
                        assimp | CVE-2025-5169    | https://security-tracker.debian.org/tracker/CVE-2025-5169   
                        assimp | CVE-2025-5167    | https://security-tracker.debian.org/tracker/CVE-2025-5167   
                        assimp | CVE-2025-3160    | https://security-tracker.debian.org/tracker/CVE-2025-3160   
                        assimp | CVE-2025-3196    | https://security-tracker.debian.org/tracker/CVE-2025-3196   
                        assimp | CVE-2025-2152    | https://security-tracker.debian.org/tracker/CVE-2025-2152   
                        assimp | CVE-2025-2151    | https://security-tracker.debian.org/tracker/CVE-2025-2151   
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                     bootstrap | CVE-2024-6531    | https://security-tracker.debian.org/tracker/CVE-2024-6531   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          dpdk | CVE-2015-1142857 | https://security-tracker.debian.org/tracker/CVE-2015-1142857
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                       freerdp | CVE-2024-32662   | https://security-tracker.debian.org/tracker/CVE-2024-32662  
                       freerdp | CVE-2024-32661   | https://security-tracker.debian.org/tracker/CVE-2024-32661  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libavif | CVE-2025-48174   | https://security-tracker.debian.org/tracker/CVE-2025-48174  
                        libbpf | CVE-2025-29481   | https://security-tracker.debian.org/tracker/CVE-2025-29481  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                       libheif | CVE-2025-43967   | https://security-tracker.debian.org/tracker/CVE-2025-43967  
                       libheif | CVE-2025-43966   | https://security-tracker.debian.org/tracker/CVE-2025-43966  
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     linux-pam | CVE-2024-10041   | https://security-tracker.debian.org/tracker/CVE-2024-10041  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                        mender | CVE-2024-46948   | https://security-tracker.debian.org/tracker/CVE-2024-46948  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2024-49393   | https://security-tracker.debian.org/tracker/CVE-2024-49393  
                          mutt | CVE-2024-49395   | https://security-tracker.debian.org/tracker/CVE-2024-49395  
                          mutt | CVE-2024-49394   | https://security-tracker.debian.org/tracker/CVE-2024-49394  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7848    | https://security-tracker.debian.org/tracker/CVE-2015-7848   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                        opensc | CVE-2024-8443    | https://security-tracker.debian.org/tracker/CVE-2024-8443   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                           orc | CVE-2024-40897   | https://security-tracker.debian.org/tracker/CVE-2024-40897  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2023-0778    | https://security-tracker.debian.org/tracker/CVE-2023-0778   
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-8354    | https://security-tracker.debian.org/tracker/CVE-2024-8354   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sngrep | CVE-2024-3119    | https://security-tracker.debian.org/tracker/CVE-2024-3119   
                        sngrep | CVE-2024-3120    | https://security-tracker.debian.org/tracker/CVE-2024-3120   
                           sox | CVE-2023-34432   | https://security-tracker.debian.org/tracker/CVE-2023-34432  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                     tcpreplay | CVE-2023-43279   | https://security-tracker.debian.org/tracker/CVE-2023-43279  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                       tinyxml | CVE-2023-34194   | https://security-tracker.debian.org/tracker/CVE-2023-34194  
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                      unixodbc | CVE-2024-1013    | https://security-tracker.debian.org/tracker/CVE-2024-1013   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                           vim | CVE-2024-45306   | https://security-tracker.debian.org/tracker/CVE-2024-45306  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                wpa_supplicant | CVE-2024-5290    | https://security-tracker.debian.org/tracker/CVE-2024-5290   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                        xerces | CVE-2024-23807   | https://security-tracker.debian.org/tracker/CVE-2024-23807  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
