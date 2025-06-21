Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE9C7115C
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 03:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2827241B95;
	Sat, 21 Jun 2025 03:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_IDttcYsMft; Sat, 21 Jun 2025 03:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCBAB41B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCBAB41B97;
	Sat, 21 Jun 2025 03:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF198C8
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 03:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E11896081E
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 03:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DR5hjM8runpi for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 03:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F74D606E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F74D606E6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F74D606E6
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 03:16:43 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ade58ef47c0so496317066b.1
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 20:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750475801; x=1751080601;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lYYJkwb5uoYvEi0FMgq3Gd08p3a1r+3HGrErK6TMaps=;
 b=TUU+95r9TVgh4jk/s8jmZlGkwCi35QBif/2AX095N1XeyOUnJYqx9qSjINoVFjJGxr
 nR/KN6SeiOnaOIoI5fHHhlBWe1FvfSWvyL/NC/uFkfoaj/tXf14FePOIVkHhPaAAxnh4
 uimjaVkIF2IdjL5hsxKDfAedghZEB1GlfmkDcSBwxGH91avvi/kqxroPJAax2vg7yzP9
 UsAjbArR8waDMBpLYO0XLn4vmjQ0+sfMNkSrCXPmNbc+T3Wx4XVlFLshLPkKctyVuJst
 ajvjQbrXBWysAjR90vGXy9IkMGsVOoYf17jUXGn256ZY2i9TCB0Guugc+6NMQa+mJH7d
 wx7Q==
X-Gm-Message-State: AOJu0YxO4m2Mn5ZlMUDBjUO8pXkHsTNJWJQLJkReMIW6891dXavG2Ln1
 lowcBTnkfFD+6/9FhgnP4eXsns2bLShqbePDym1iWG884XfBs0bqoH95ZYPlcA==
X-Gm-Gg: ASbGnct7RrtAEcxFyu2jtYkK11dptqE1ZEVBEjHVy745WCWtIiA24UjBQYWeX3NO9m5
 m7XM+GP5WwNWMxLgIM4b00c4qX2VnMR4a62khezv6F6utJGzRw6bxhs1o88AQg6KaWfP3JzMK3A
 op1XHJFSM2ozC21coPsjSebHYekUxToolJt/20MhipNIZHXOqgXl4R7rwSkWzzg+PaaRVESV5vX
 Okn5IYgI4Ah6VY36ZGZNVxcV9Ykld97dwZ2VfV+aWiM26/xjvpeL5xgJTD/bwlPMkPQEzOmPkWT
 zQexoY6upYqAjeoV5ky7Ui/tZqzDrH4n3PvTep1epIfpKHEOsZ9fiZzX2zzz4q/9nQ==
X-Google-Smtp-Source: AGHT+IHVs5guJ1mVfSmgpCTRf0osg4DV/4DY0rmsV3Ubs6pFGp8YaNokrTY/KodmVLFJ50824lgSxg==
X-Received: by 2002:a17:907:a089:b0:ad5:6e40:9830 with SMTP id
 a640c23a62f3a-ae05aff83d3mr436560966b.20.1750475801008; 
 Fri, 20 Jun 2025 20:16:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae054206fc5sm270454266b.153.2025.06.20.20.16.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 20:16:40 -0700 (PDT)
Message-ID: <68562418.170a0220.1abe61.776d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 21 Jun 2025 03:16:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750475801; x=1751080601; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lYYJkwb5uoYvEi0FMgq3Gd08p3a1r+3HGrErK6TMaps=;
 b=fqwX/zoZtKfVJVx2Q8NOaA00CsBE/puNq4cTcavoIvoaoGkP5jH+Fz1dummeWk1NzZ
 C6pUmtnoyCmwzZafTMnHZZONkK2C5StxcFlaIzefq4AYLjlrHjzLn0IL+sOGEE+2y0kK
 d9rXGXcW/n1X7PoZdk2rElVMY/okelQf5Su+I8LavYnxx9nnNCsEsNqXUE6/7sowT7V1
 U/ILGwBJa3FKobvQ1ucGs/rT+gc9GXtvLjRlZUjEhIzQLuc4hy/A+cWIBUJdyW14B5bP
 tBTuHLwcLE1mA/en9/ETqDA7UKefM8+Bhqfam//b2+6Ov50t9CsjiWdnlk5J7Pe6EkBg
 A19g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fqwX/zoZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-20
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

Autobuild statistics for 2025-06-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  7  |  0  | 10  |
  2025.05.x  |  0  |  2  |  0  |  2  |
    master   |  5  | 36  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

                    bmx7-7.1.1 | 3 
                       unknown | 3 
               bctoolbox-4.4.8 | 2 
             berkeleydb-5.3.28 | 2 
                    gcr-3.40.0 | 2 
        liblog4c-localtime-1.0 | 2 
               syslog-ng-4.8.1 | 2 
                   bash-5.2.37 | 1 
                  cairo-1.18.4 | 1 
                     daq-2.0.7 | 1 
                flashrom-1.5.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
                    gpm-1.20.7 | 1 
        host-berkeleydb-5.3.28 | 1 
              host-rust-1.86.0 | 1 
                  iozone-3.506 | 1 
                 lcdproc-0.5.9 | 1 
             libgphoto2-2.5.27 | 1 
                 logsurfer-1.8 | 1 
                  mbpfan-2.4.0 | 1 
                  ntp-4.2.8p18 | 1 
                     nvme-1.12 | 1 
                openocd-0.12.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.2 | 1 
                     pound-4.8 | 1 
                python3-3.13.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/0a418ac9efacc44088b51a825363db856521fdf9 | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/50992eccc49c59f73df18799a4fea8ff1cd40a4e | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/fabd327e1d0a4a056a078147dbefd9be93f13a3d | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/b6d6b695d7412018ac61ae3fdec5ffc5a828c813 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/7549e183bc2f973560e837a098d3f46ed85cc513 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/5c14959b5215af9a7512ac8bd23258682b514ddc | ORPH
   x86_64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3606a070b16d80109462c0a448073986f7c37694 | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8ee788291e44cc0fe407baba9573ef19eb6cce16 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/1aa1932eaa62b88eeb528e3bfa833aec41103dbd |     
  riscv64    |           daq-2.0.7            | NOK | https://autobuild.buildroot.org/results/6c243f586c2300858e4aa06b7f25d4bdb1d12011 |     
    arc      |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/3505baf293449ae9a17e66e596d0404fa6554003 |     
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/7eb97163455a8d9de1719afda68b22aa8581e09d | ORPH
    i686     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/d87497480453aa2938126de493165ef024c4a247 | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/182219241e0579cba56ec6dd32aaabd3d5e70d9b | ORPH
  sparc64    |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/b15d334d1751862249d7b5417c054f6222eee608 |     
   s390x     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/524106fe8bbfb21e3ec4e43862d03429b3a84984 | ORPH
    arm      |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/67b8efae7e0d34fc566c509f547e7bb9a487b44f |     
   sparc     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/3b1c3fc466c7a319d46a2c955e057b4e3b12fed9 |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/0aa6356eaf97669b8cfe11603ab65690a219d2cd | ORPH
   sparc     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/f02039d6de50a8d18c57b7ee0c6f61ea8ec481b7 | ORPH
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/be8eab0ca4efad226fb87da3aa2fe0053120fdb6 |     
 powerpc64   |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/838ca5b3b5e18cddd41b4961a57b41bad3a3d2bb |     
   sparc     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/e64a456c5855775a407dc1c8a2eb87a7088bbcfd |     
    sh4      |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/620f9d5715c9958b484f4724b56339323ea6aba7 |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/261e630f20dd20b7f606a7bcbd8fa7b50ce82fbe |     
    or1k     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/2629906c43bfc3e1ca1c5084c3d39e4d12c80666 | ORPH
   sh4aeb    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a3d4b712623c55649c2ad6c488479cc85629e846 | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/f0b4694704197fb0cb38315e24d654916f4aa6a7 | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/bf91469b8161a9fa675c175c73db000052f678c6 |     
  aarch64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/05b91db4c23c984dd217d924a94bd0678fa0d53c | ORPH
   arceb     |         python3-3.13.3         | NOK | https://autobuild.buildroot.org/results/c8c8dcc32ae1c328a2b55fd047993afee2be6170 |     
    sh4      |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/f7c4d552fee7d987af628219e4383469a65c32da |     
  mips64el   |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/f61434e8ce6d7554f667fe1b6c222c9e7ed943d4 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/1740f3aa7f2bdbd317108816831e39aa0ead96a4 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/4149ddb770ca92f2a218e25f8d6f62d58d978562 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/5697d86cbe44c05717b69ff4aedbfe3c84ff11c5 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
          host-binutils-2.43.1 | 1 
            host-libp11-0.4.12 | 1 
          host-oniguruma-6.9.9 | 1 
                 libssh-0.11.1 | 1 
libuci-f3fc0b76040685829191... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6dfdd5f89018b85623fb20a73c4749fee5c24646 | ORPH
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/64d96aaf7a3d41f123fde470a9d804e9f9f4122c |     
 microblaze  |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/5a54425673ec32ccf91ca64d848dd1052ce54a41 | ORPH
   armeb     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/5623cad0170512dcad207baf8c37429cc62e6ef4 |     
powerpc64le  |         libssh-0.11.1          | NOK | https://autobuild.buildroot.org/results/fc322f0a0805d206d0bbdd32c941628fa925fd71 | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/de571f4b16a2079d198f999396c569209d46a82e |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/dd9068f0e2907c6e2bc23728b068a1a7d6c01a5d |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

          host-oniguruma-6.9.9 | 1 
                openocd-0.12.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/4f7eb8a51582b8525eaaebb91d81f57f6fbe2605 |     
    sh4a     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a2bf2c8a228a6bfb27f0e2187468066f089e30f8 | ORPH


Gitlab CI results for 2025-06-20
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396000890 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396000907 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001008 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001022 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001029 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001037 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001046 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001056 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001061 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001071 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001081 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001092 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001099 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001114 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001130 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001174 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001202 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001228 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001245 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001257 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001266 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001284 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001291 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001296 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001300 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001302 |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001379 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001486 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001514 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001519 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001521 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001527 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001645 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001751 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001754 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001796 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001808 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396001812 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396002072 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396002101 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396002130 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396002132 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10396002139 |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408192626 |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408192790 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408193164 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408193618 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408193703 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408193928 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408194088 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408194148 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408194259 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408194358 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408194431 |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408195606 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408195784 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408201109 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408201279 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408201418 |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408201515 |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408201540 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408205250 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408205435 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10408206076 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
