Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8267C282D1
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 04:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDFA541193;
	Sun,  9 Mar 2025 04:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjatPsrOye20; Sun,  9 Mar 2025 04:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0935D411A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0935D411A3;
	Sun,  9 Mar 2025 04:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C30DC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 04:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F047981F66
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 04:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwXJMfsIBJmu for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 04:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5405F81F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5405F81F93
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5405F81F93
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 04:15:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac256f4b3ecso343345466b.0
 for <buildroot@buildroot.org>; Sat, 08 Mar 2025 20:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741493710; x=1742098510;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zuu8GVMsa1cThtlziXIkxzAdQ4knlIQqevtLutJc0/A=;
 b=oTowNr4akxJd/NQ8Coz1EBTSmxudZdMZbxNJQ5HzshXlIBCrIAjN+5y/WzVqa8Wrw6
 NYndiOXuiYof36RkxSO+3usWozhwIqTJ50Cnmal2U84V1mFBLS63vt4uNN32/JoPBsTR
 kHoRRT7QWXC1pHybqnx5jJlxV1byE0H52/jvCLwVPQ8on01aSCugBdg7gVK7VSa6we4p
 YnCiZKtwvG7sQKS4pzndq+4OMEq7PnKWwHKSdh3926+Gas40OB8sIMFsWt/Yu+6riJjn
 NNWC22SkJp2c+6iFoXCxQsLazA/DfrIKp1AvenEOUL6gOzkok6o17azKvmbsmE4GMJhy
 vd8Q==
X-Gm-Message-State: AOJu0Yy4bBPisyhv7f4aUl1j7ktkQUyPefDxVOB85nHzUXZ6eYm+J4od
 UyCuqHBKUkbCHWgeOQ7MgClOG4hj0iFcMf43Yz0YOeEAVrr4fFQfQI46tw==
X-Gm-Gg: ASbGncuamqtBZH44HzMXuDjSxDqG5WbGqV9uj8bHyZZ/KXXf6SjmEw86J34Lj5mHjmy
 uP60Bn9DYW5gfr35QPWsHeK1TIOBd8Bhvo2gQrq7tB+YTdqrJGFFAxVqImlcbIt1sGAPbKdJG7s
 N6YVFLAKBBsZg9AktCKkm1IyPyyLBjls3JPz5wnBeK3naDGYcCs5b2ZCC40FHdbPHZLv9AsCBgU
 /nNd5ZKUcRs8lZagfm+drCgqNF2auBouQGEGHDRavM8dwIiUxEIQR6IEDtqwIJ3+Tx8xkJqCDKu
 hOwkiXWKN6RDHdvLss4qCS4mrMcXN1y5i17/nrvxR2H1X7xu
X-Google-Smtp-Source: AGHT+IEM10o2eSImajrqf5Yto1JqveRiR0dQ/vtI5Su8l7s4IciEzuhf2jZlXGtVbRJWknLm9uVECg==
X-Received: by 2002:a17:907:6c16:b0:abf:6bda:e799 with SMTP id
 a640c23a62f3a-ac26cabee21mr550528766b.13.1741493710025; 
 Sat, 08 Mar 2025 20:15:10 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23943a07asm541285166b.14.2025.03.08.20.15.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Mar 2025 20:15:09 -0800 (PST)
Message-ID: <67cd15cd.170a0220.383d40.3ccf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 09 Mar 2025 04:15:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741493710; x=1742098510; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Zuu8GVMsa1cThtlziXIkxzAdQ4knlIQqevtLutJc0/A=;
 b=Syvp/0v61r1mkReyhGt6lOQ0E8CxApyekiQ2BJWeXbnGG7c8FyQ7e3PI98vftCZXaw
 Z7Trb4Zn5sTX3DGBM2HKkRr4bqsV/Vhfsmu0jwzEQvVFeL25bVlvTdxOCYQF6tofzpAQ
 FlqkhgkP3DLXiTtlu/grZjQLmqrmPlEK8fZPSHTtw3Jc0c4zEkt+ml+0YaYBraXEpouu
 2DMhmIrUgownneRJ5tCvNL5m9dFHbl0T7rJ/3mE9LuJEWpUmTp97TMUExNLQ20H62Plj
 1pw3FNGYiF9+gdKmwAqqIFW+SrML9Gdz6Ac6gc0IZeV8NqBurJn3wC1KyO0e/UZPS8pK
 KnDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Syvp/0v6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-08
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

Autobuild statistics for 2025-03-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  1  |  0  |  3  |
  2024.11.x  |  2  |  3  |  0  |  5  |
    master   | 27  | 46  |  0  | 73  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
                elfutils-0.192 | 2 
                  ffmpeg-6.1.2 | 2 
  gobject-introspection-1.82.0 | 2 
    host-python-greenlet-3.1.1 | 2 
           libfreeimage-3.18.0 | 2 
                   linux-tools | 2 
           at-spi2-core-2.50.0 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  boinc-7.20.2 | 1 
             dahdi-linux-3.3.0 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                   fwupd-2.0.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
gemmlowp-16e8662c34917be006... | 1 
                 gerbera-2.4.1 | 1 
                 hddtemp-0.4.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                 libcdio-2.2.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libesmtp-1.1.0 | 1 
                  libnss-3.108 | 1 
                  liburing-2.6 | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
mjpg-streamer-5a6e0a2db163e... | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.26.3 | 1 
                  ntp-4.2.8p18 | 1 
               procps-ng-4.0.5 | 1 
                rdesktop-1.9.0 | 1 
               valgrind-3.24.0 | 1 
wilc-driver-linux4microchip... | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/453790139eba7aead31a70a4c02372fd996d0808 |     
    arm      |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/d32bbfbc48c4e0607aef3c3b40c8f65ab4394ee7 |     
   s390x     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/554661d05fc639397547a88b4c70f3384d64c55b |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d880496791b0f5e87b83b4d78b2924dae5484c2f | ORPH
  aarch64    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/d04f4877576449927780a8c5645b14e24750f3ed | ORPH
powerpc64le  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/968023e69ea6a22d391232d9230d2da6ab09f266 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b1c1bb16ef1b86b5d45b459cd1bc75af7f5f692c |     
   s390x     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/95b15872385aef9bf33692d37ffefdd41ecc6bb5 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/eb854d79c007e39ff5443bf9983a942750840ce2 | ORPH
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/83f3276e47514115cd6e59fb5148f208f19f0d80 |     
 powerpc64   | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/0fe8a6e41839b55f3016406dd580a13c5f75c966 |     
   armeb     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/73b014f01a41082fe95e4367aaa9222652f05b56 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ddd8ff778e9b586b07e73b7db7e01642966a67a2 | ORPH
  riscv64    | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/a611066e6cd8d66e86ff08050b2a6cbe23357acc |     
microblazeel |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/6ffd75037628057a74cc612d575f4042c48780f7 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/02267c4df1f1992590fc580cac540ef9783d3d05 | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/202f5a364e971aa2efd4fa1d39fb6ffd86679a6a | ORPH
   sparc     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/ab9c55291106bf136326be9ac39e52fdd5b55b8e |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/4dfdc16bb6da4ce10d96c3ebc4d421e0f6a8b440 | ORPH
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/0ce6676704e547f01a81d8fa4af3afa1c0544347 |     
 aarch64_be  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/88aab48c10c6cd25d0f6183b8dac8bcfadb68ca6 |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/7d58b3fa72ec4c6ca3fc4ff63fd0da334f549563 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/caec6bf0f91b1a09328c80705e224fab20d793ce |     
  mips64el   |         libcdio-2.2.0          | NOK | https://autobuild.buildroot.org/results/cf998c21f2cfd4fbbd7ac906764d6d2286385f30 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/c673dda0d5d24d8ef642e83312b1611e010950ee |     
 powerpc64   |         libesmtp-1.1.0         | NOK | https://autobuild.buildroot.org/results/181ddb2ad57edfa8702bf527f0d91b54523fc7ac | ORPH
 aarch64_be  |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/6de93b3b944ee089e9c302cd027ee96e252621b6 |     
   mips64    |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/d1eb524f64a682c427f0c583ead6cbb5d5366f65 |     
    m68k     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/964ef4b8ca82bc9509a3f52b92b772b077e2c38a |     
   arceb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/0dade70e59a56bab6b22eb165c0dbd76cb5eed69 |     
  riscv32    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/49476ea4d6fb6c8f09bc908b55516af00bea0a7b | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/2039d7af7d4468f937e3472c2645cf20e3723243 | ORPH
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/ea84a903a03ae56d4e2d64096cdbee573fa8067b |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/44bfcfcb22926fe1740aada5b553710e4c6d940a |     
 aarch64_be  | mjpg-streamer-5a6e0a2db163e... | NOK | https://autobuild.buildroot.org/results/5cf8f2cdc7bd157a8932eb9cdef255795a152c96 |     
    mips     |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/a4d6a2308b0a40cd68bb66bc56dc48c91a989e64 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/59c77de8f96a6faf5f406f6f4392301315da9115 | ORPH
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/169893c2432c4300cc6f716dcbe708da892d58b4 |     
 aarch64_be  |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/101737e6808f4614ba80996ad7d058cfea5c16e2 | ORPH
 microblaze  |         rdesktop-1.9.0         | NOK | https://autobuild.buildroot.org/results/86fd8c8eb9a49f8f9c85dfb81f49ca2efc16bfe8 | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c35c7dad9a4d5f0ad4408dcd4c19185e5bc1684b |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/e8b1bf7002af634e21b8819f201e9eb858c2c79e |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/5ae965a3791e7c8b251d41527af1f0d9d81142b4 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/ee8ca1495f2c292396310ce1da2e36ccadad1c59 | ORPH
  riscv64    | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/b4756c0acb29900f5048c54bfc9bcabb47c90674 |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/a7ea6a79fc674340bcc33072aeab0e16fe655d67 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  procs-0.14.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          procs-0.14.3          | NOK | https://autobuild.buildroot.org/results/292116688c1dc7f7247749958fe8a5ad946e8273 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

               aircrack-ng-1.7 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        aircrack-ng-1.7         | NOK | https://autobuild.buildroot.org/results/3b085b5d628d1174410bbb4ae113b4b6da68e05a |     
powerpc64le  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/0d8fc336ce8b56996aae5de52ee739eeeb5feab0 |     
   mipsel    |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/48b568d20127a20973a8a07e01e3dc529f9357db |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
