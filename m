Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE9AC369AB
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 03:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88ED660811;
	Sat, 19 Apr 2025 03:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ahnoCJMz8_e; Sat, 19 Apr 2025 03:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A49060807
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A49060807;
	Sat, 19 Apr 2025 03:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AA1A230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 03:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C2404036A
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 03:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgV94y_f7QuJ for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 03:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2859940103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2859940103
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2859940103
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 03:29:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1612938f8f.0
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 20:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745033355; x=1745638155;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dgtaGLQ9lqStpJIZyKAAfSk1T9WqxLVjb91ytiTDHsk=;
 b=mRRV7ncpaTiTDXPtgycrFuMhb/npNBLm0k2pArxW04irJ5Lt5zxTvJ3aAaCMErW62A
 1H07KbjmXFapRMhuZYBgVtG6o/MR6Sv3jPB8p0mAFNESuW9r8E79iJnO100lkqBsmxMm
 BbWicPOPVetxcjsrR31/X2zEH2gX0Ngsxx8A1PQ9acoED1IsEacwvVxrvo5GOah9q4VI
 d8vrdVrHd3Mk/ZyZQp3PUYVxHxctQlte+d80TSslfwiihuNT+TH4Z5/hI90vraVnEnco
 eT9tTOezdh83XTFrAB1ZvAN56FKEtO7rrFzTFPr32UAN7B5Pg6LF45MLcD4ozIzlzJ+G
 Vdpg==
X-Gm-Message-State: AOJu0Yz15ixq8cYBZi0RhvC3VhCZy0uG0XiRl1GkjgcV3YfEcu9YLdNT
 7D6xO2cxSk521k/uzz2EK0QKT76+wkaEL2PBolf4HAbEnCYEBjY+ldBHlg==
X-Gm-Gg: ASbGncsyP2PGjZ36QR+X+bLIvA01wwz50yUJrKmsa1GoAKvfdXkyCr1t50TYJkjoXQH
 Q1qgPlvpHuT8Z1cTcxNq1M3ilNDpB2VDSL5CCeI4j7+1kcBt7m2hJ6CEvYoCZiuWFq0Hen0eFfk
 tyqCqYGgyNkTYVnqidBUCiWP3RKY8tMHLdEKq6N7vd5f9E5I9TkRwljRDotDgZaEMseLGnMWJlM
 I31LTrcV7szh+NM6zKa4ASuXuKOmhOp8rIXnSDIbuqHenprcU1/ov5dNwLq17IL0U/g59Vv3PIl
 BoVCZu7kAARdlGeJBtvLU+sRlbgiFTDuA1hrcMVCKDbG
X-Google-Smtp-Source: AGHT+IF67NaxpLupGpDsDcSqbgbC7jc6WkebVrkkwu1F9uGiOzuumgCRYUQIiqxD/+KcL/n6U7z9yg==
X-Received: by 2002:a5d:6d85:0:b0:391:b93:c971 with SMTP id
 ffacd0b85a97d-39ef9090abfmr4387447f8f.20.1745033355004; 
 Fri, 18 Apr 2025 20:29:15 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4207c5sm4390653f8f.6.2025.04.18.20.29.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 20:29:14 -0700 (PDT)
Message-ID: <6803188a.5d0a0220.c3aca.0117@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 19 Apr 2025 03:29:14 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745033355; x=1745638155; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dgtaGLQ9lqStpJIZyKAAfSk1T9WqxLVjb91ytiTDHsk=;
 b=A6ogD/9Mwoa4aJglnyCyB9HN7i7T/OvMXaSbX0ZI1Sa05Yrf/gtsqrxf3xu9/S2KRe
 CR6V5GWez8hVnREa7CnWc3FC83Zjljut0k16SYrZN3GsqtkrU+2WyAyeIMdzTLYLB7zn
 AgjjwZ4taONYtf/JbmhVhucK7nQk9UucDPLT667YRw19kcDsuUyJJOI3/Tnw74MpQ9lK
 rHyH7lff7NDub3chZbdgHhzOESgrQLYoJuRvSEX/TjuK5GQPQplFREo0YZqijrPG0MFb
 L0Ztq58siF7HBhVaN3gTsX4/RJhirETCLhMPYYGSblgl4oSjOQEc5PTjFfBQmgCfa8/e
 bqmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A6ogD/9M
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-18
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

Autobuild statistics for 2025-04-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  2  |  0  |  3  |
  2024.11.x  |  3  |  2  |  0  |  5  |
  2025.02.x  |  3  |  3  |  0  |  6  |
    master   |  4  | 11  |  0  | 15  |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-20.11.1 | 1 
            ecryptfs-utils-111 | 1 
               host-runc-1.2.4 | 1 
              host-rust-1.82.0 | 1 
                   libcap-2.76 | 1 
                 libcoap-4.3.5 | 1 
               libfuse3-3.17.1 | 1 
                memtest86-7.20 | 1 
               pulseaudio-17.0 | 1 
         python-remi-2022.7.27 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/3bfd18a2330689bf2b9d763d8c331c285cb87d8e |     
 powerpc64   |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/5296b85a6d04d9eebbd56afc54a3bf57704acca9 |     
    arc      |        host-runc-1.2.4         | NOK | https://autobuild.buildroot.org/results/47acd0e8d840242c6c84bcd9e42e870494713184 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/a7af1c01048e30bb6836ac6805640afe80bf8d6b |     
   arceb     |          libcap-2.76           | NOK | https://autobuild.buildroot.org/results/34ae62ae23b5d73c802c2035dad3632c28df85e3 |     
   armeb     |         libcoap-4.3.5          | NOK | https://autobuild.buildroot.org/results/82c2391ef73389fa67c3c1872c33dacd3dd14904 |     
    or1k     |        libfuse3-3.17.1         | NOK | https://autobuild.buildroot.org/results/aa16b78fbef8979f8dbf4befdeba03612440fe69 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/09e61df19207d6b210c8cd371abd8593b6424632 |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c74bc0145e30606020aca84132d5cfc8c4209579 | ORPH
    i686     |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/eab710d12a57a08c15e8182a48fb1850f05788b6 |     
   mips64    |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/b5c986b8ebe1d96a1e5f4ec5b8866c2ccc2a25db | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

dvb-apps-3d43b280298c39a67d... | 1 
host-prelink-cross-a853a5d7... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | dvb-apps-3d43b280298c39a67d... | NOK | https://autobuild.buildroot.org/results/fd16b5cc881e8f9f4767ac06d394855dbbe3d11d |     
  sparc64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/2e3d018c31ea167d7897999fd27c0e47da75079a |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
   python-pydantic-core-2.26.0 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/8a158cf0da945363d09a62f3591938ede0680e93 |     
  sparc64    |  python-pydantic-core-2.26.0   | NOK | https://autobuild.buildroot.org/results/1eef20030cfe8ecf1d6fe5687cb97f77214e0416 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 hddtemp-0.4.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5402d5a4a6f51e6e29405a6ec39aaaf154a6386b | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/89ca4ae90761f8a8cd75c6b392aed9f7929b35ac | ORPH
  sparc64    |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/f7c94467bb0bdf91a411cdbdeb3d293b03eda052 |     


Gitlab CI results for 2025-04-18
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680166  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680267  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680281  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680297  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680307  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680361  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680442  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680481  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680486  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680491  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680492  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680498  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680501  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680503  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680505  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680508  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680583  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680588  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680592  | ORPH 
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680604  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680695  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680821  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680865  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680872  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680874  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680893  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680899  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746680907  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746681165  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746681219  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746681252  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9746681259  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046578  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046610  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046627  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046658  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046678  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046759  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046781  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046793  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046812  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760046893  |      
                   stm32mp135f_dk | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760047285  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760047624  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760047696  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9760047811  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
