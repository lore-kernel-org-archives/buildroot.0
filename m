Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5263FC54ED1
	for <buildroot@archiver.kernel.org>; Sat, 24 May 2025 03:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8529605C3;
	Sat, 24 May 2025 03:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7_jWCrhTZRo; Sat, 24 May 2025 03:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2046606AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2046606AA;
	Sat, 24 May 2025 03:14:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CB8E119
 for <buildroot@buildroot.org>; Sat, 24 May 2025 03:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DFDA40B4A
 for <buildroot@buildroot.org>; Sat, 24 May 2025 03:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XweIDYFSbWt4 for <buildroot@buildroot.org>;
 Sat, 24 May 2025 03:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A2D7405FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A2D7405FD
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A2D7405FD
 for <buildroot@buildroot.org>; Sat, 24 May 2025 03:14:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a37d24e607so422432f8f.1
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748056485; x=1748661285;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vnNIvSEegx625VeSugPzvyx4ssHnwMtVOtxs4rBE5I=;
 b=BKYp4mrsX8pKXOStL/4WD5O+PFMyQ3sU6nV0/9lEEOVAtRA/1T2etoBTxNCwwoS/9Z
 JOv6I5rPHc39+Myvo1tJWPuh8qLBQMgsfEPOcAX4rWnbOHwC7v6rEhfWYpW2h1OfUqOM
 BeY98x8jeOdzMtxVctQ69PFkB3oq4ZDn/ziZcFBCuM0AUgdV0eTBfcKs9YJn8gqhEvFA
 nNZO6MY/OE5ov6joNI3YhjL0Vk115/Mv9FnpQ3j8q6nR7czAGhsfMpmL5RE6Cqp3Lk6e
 bxLw5U6iANb6xVEZgpG6wZcTXyi8E5pKComtTQWTT0gOQWK3zbZUBzZbqouPS515bd07
 Du7w==
X-Gm-Message-State: AOJu0YwTKVuiiUTuiBOjVc05Nsqh83bsdDuFNMEPxM8+Sm9K3tmqXhSJ
 h8nLODjH4Pa+rnIS4MtEZ/ixEGVSZwISkOusfWhmTwQ6TSETBchmfKh/rjXzGg==
X-Gm-Gg: ASbGncv9ivPVWs8fIRau82BRt2C25Pg5oTp0e9EyZphNbolt9++wGb3F6G3vQ1K7n8p
 x5WyzeYqZapzP4Wa6yIkoPnGfS+RwA4mJ0pvRfpCgRh6/kUlKlAM6DVDqbL9jxxB9rseLlzSHPi
 lR5iYdE83Y5Ekdf8RPvY6IL87aR4wfZnE5dO8DWT7e/W1BHH/inaqD4osG8T7+4LxcTxONlveKe
 jGEJ/NIrwfCvUGlnOeTOyxiPIz874j4Ku2BbtDsSHF/zqF47c4yK0C4z9sue7BlY7qaPhGrPXax
 FwdBumqNJfmtQYRRfCrlMzflZqGRFH/DY9Nt+hMRZT/XH6TxuIYc1+AY6gdFc6Xu3w==
X-Google-Smtp-Source: AGHT+IE4Xbq6tdsG+UiTBRWOPl2oY8uK4JJ1aHz/9KlaCvCceQXDgNFl19CMMH54uB0WSj1I9GfSNw==
X-Received: by 2002:a05:6000:40cd:b0:3a3:779b:5b41 with SMTP id
 ffacd0b85a97d-3a4cb45445emr1186263f8f.28.1748056485235; 
 Fri, 23 May 2025 20:14:45 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d230sm27908100f8f.4.2025.05.23.20.14.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 20:14:45 -0700 (PDT)
Message-ID: <683139a5.df0a0220.9d412.67bd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 24 May 2025 03:14:44 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748056485; x=1748661285; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8vnNIvSEegx625VeSugPzvyx4ssHnwMtVOtxs4rBE5I=;
 b=SfjHrrizQHd2TwUV0vaDjgF6wNwzcZwrWOrlmBZtRsejhmC5TWm0XAK1IBhDzySlBk
 L1sold5JvFNuYxc3ZLuJdJbr4Y3CcYYwJyv7m/imGPTO6Pb/Wq1IFDR5Sng1X9dvnLcE
 gJHIew0duu+CDtCW3WLHjOCXqcucVO/Fp2c0oGjRGpscrKjBWu44LDvx9ZyTxwRkDYAE
 5YXBWz5X2h4pSFD8PEQHMTnsNMXTFDvn62sBjsynToJXzilOnOOsPq78l6QTdAdCXifD
 hUqPyhgGIG+kNqLg4ouV6syGe0sNJVfV+5trWnCFX/u9Il84D7pxxnNfe+wZXfDEMDty
 /e+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SfjHrriz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-05-23
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

Autobuild statistics for 2025-05-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
    master   | 17  | 33  |  0  | 50  |
     next    |  2  | 10  |  0  | 12  |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.43.1 | 5 
               bctoolbox-4.4.8 | 3 
                    bmx7-7.1.1 | 3 
               catatonit-0.2.1 | 2 
      passt-2025_02_17.a1e48a0 | 2 
                       unknown | 2 
                elfutils-0.192 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
            host-binutils-2.42 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.86.0 | 1 
                 libspdm-3.5.0 | 1 
               libunwind-1.8.1 | 1 
                  prboom-2.5.0 | 1 
             python-webpy-0.62 | 1 
rtl8189fs-3f34f380715b88e4a... | 1 
          sane-airscan-0.99.33 | 1 
                    snooze-0.5 | 1 
                   swipl-9.2.8 | 1 
               tipidee-0.0.5.1 | 1 
ustream-ssl-68d09243b6fd447... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ff54c60f9df054d9ec8183cec773a8b1162ed6b6 | ORPH
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a1f21aafc705bdd5105f3bb21b269673b8af19dd | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c0c9b3720da6b9b722dd47690651139b18a33ff6 | ORPH
   xtensa    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7bf7e536e48145fc1d87ac565c9b140bf2f54fb5 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/e66a474939bbe45e193ffd315da9d059419c92e3 | ORPH
   s390x     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/2963f82fc4c335b15afe29718469cb518f21b49d | ORPH
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/5d0c0e2ff1454a2b8c046e96a7c2241772b118c2 |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/73f1400e127526cb7ad4e9bf0486abe7692f6500 |     
   xtensa    |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/9e1f30b3f5ee29d4bc956ee60da521e8ee86ffda | ORPH
    m68k     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ef4e191909984956ad4d7bda65b08a8a8ad36d6d | ORPH
  powerpc    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/9c9842061ea493033bcb9c9cf499833bc91c7ea6 | ORPH
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/c2702c3194c960ac5795e44aef76ce699e396834 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cd4b15d2c96fb92c531b7cfbaf1f1cf8c5907cff |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/67c6121e88754a57bc28e45f3b3aa68b4cdb6075 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1b45a0ee18779cc6adb415a711dd77e6f8464218 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0afc0eced2e27bfe9cd1f792e4ecb69ae73129f7 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e97f7d17aa4d2a2ad898bd0eb07320d09021ede4 |     
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/9f717ac208b427819fc1b09f2eaefc210deec841 | ORPH
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/fa5aa1c55a55ff616d08eb4b91b686f9d1636ced |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/1d00ade7e19594b2ce126da0231ca8a8be3769e7 |     
    m68k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/73e9919e366d1ccf0ef20262f4a75df6a8d42f03 | ORPH
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/2c4d99845788ec8f2157c02ab8f5829d93d5d3c2 | ORPH
   arceb     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/cc17492d156d8a39aa3ca801decf748de01dac63 | ORPH
   armeb     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/31fb3a8b8f31d2bce1dec096b2a66326807fdefe | ORPH
 microblaze  |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/8b994cab8341d8672985f5da698cc8a4bcdc3f08 |     
  powerpc    | rtl8189fs-3f34f380715b88e4a... | NOK | https://autobuild.buildroot.org/results/23e7d5e6925ba898d6c0b22ce6b8e73ee1ee1799 |     
 powerpc64   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/ae664ee84223c59fe736703892be1343970697d6 |     
  riscv64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/3b515f0829fbd5fb736e0bf8914c547507b73d5d |     
    arm      |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/7d20ecba7226f428bb1a4fb16b2969a8c17a50ac |     
    arm      |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/7623024e2440ec7f73e4045e9b347d76705c9cd0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/ae5adb3def58f36fa3193fb097c388add5a638f6 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/42ddd2ba557f865956a250c613df7bdcddd4bd4b |     
microblazeel | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/f06d2a45e05aed39cc5a3bdd1f1c477b7dbe2047 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    flex-2.6.4 | 2 
              host-llvm-15.0.3 | 2 
                 openssh-9.9p2 | 1 
         s6-linux-init-1.1.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/13c7727e19d0e7a896dffb43d9e8d217b84f1f3a | ORPH
    or1k     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/e8443eb62c1339ede13db24377aefae40b05f41c | ORPH
  aarch64    |        host-llvm-15.0.3        | NOK | https://autobuild.buildroot.org/results/4ee7c5bf27e9fc0aa074da3a9e1dbaa4eeec187a |     
   armeb     |        host-llvm-15.0.3        | NOK | https://autobuild.buildroot.org/results/99f9464b846a4f434c110ba7ea106406996b7919 |     
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/caed0e83533edf8df5eb16c5d7e05e116e847692 | ORPH
    or1k     |     s6-linux-init-1.1.2.0      | NOK | https://autobuild.buildroot.org/results/106708fdbf6fdc05460980b95042702b25ef8c13 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 2 
                  cairo-1.18.4 | 1 
                  iozone-3.506 | 1 
               libconfig-1.7.3 | 1 
                  linux-6.14.6 | 1 
                   nanocom-1.0 | 1 
       shadowsocks-libev-3.3.5 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/856fe9a37aeacbc4a019a01638dff3a5f182e1f0 |     
   s390x     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/fd476a7cac8663827d90f88bb122bbf49d7d2663 |     
    arc      |        libconfig-1.7.3         | NOK | https://autobuild.buildroot.org/results/5bd0bd7e2ad990ede98d8deaeeae0c26bcd098c4 |     
 powerpc64   |          linux-6.14.6          | NOK | https://autobuild.buildroot.org/results/da5771aa8a6f313ca2710730c62c7d8abfed43f4 | ORPH
  powerpc    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/3c66762ba68224b2d7b67570b7e44f86fc30629d |     
microblazeel |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/c927437016e934761e4ceb655e66902c30e5bca9 | ORPH
powerpc64le  |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/c5dd973cbc8ff57b6350b38de923e15249a62208 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/13357fcc8b7ae66f5fe520249903774bf1f491f4 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/be4c566c8b4ced01e1bd320cbd231114cc0592f1 |     
   mipsel    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/96a9ba69b2c485a2e68a792568de34e72a5464ab | ORPH


Gitlab CI results for 2025-05-23
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576722 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576729 |      
                aspeed_ast2600evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576752 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576799 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576808 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576816 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576820 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576880 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110576932 | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577022 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577041 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577060 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577076 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577109 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577122 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577131 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577137 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577141 |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577466 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577557 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577694 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577759 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577770 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577826 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577834 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110577992 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110578022 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110578036 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110578041 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10110578073 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124660903 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124661097 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124661199 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124661315 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124661404 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124661486 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124661541 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124661700 |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124662411 | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124663303 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124663373 |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124663728 | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124664933 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124671286 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124671771 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10124672884 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
