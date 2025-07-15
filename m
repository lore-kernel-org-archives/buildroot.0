Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC22C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 03:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7465C82FCE;
	Tue, 15 Jul 2025 03:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfXYWSh-iYqQ; Tue, 15 Jul 2025 03:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A16183065
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A16183065;
	Tue, 15 Jul 2025 03:14:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0348967
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 03:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 925C340831
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 03:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeVB0xYHNLHH for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 03:14:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13601400B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13601400B4
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13601400B4
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 03:14:54 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso6904242a12.0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752549293; x=1753154093;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ttRysmrlRLrgWffhIgxv80tHNOH7BEYdhPDrn1fE06g=;
 b=aRahxDGIl2VXXtm3SZsalyN2yU3KwC96/8TTUOgQtPNbXMBsV44btx/16BcCPsfjtq
 yqymtdd9YIbmBxvwbOLUD5/ZIZkmu6/dFeX7JJl11yTjrgByAWG9tTaKkPuCNpiiP/Cr
 UKMjnqeYVxbPieVvYxgvli5c0yJDYZ7tKcMoPE8cdmAISQKH46yg7agHIBoAtij3mAUb
 HuAYnDAFYL36N/3nmdVMxVa2tNumzpLy8ivaLEdqOMMdGBxRFvfvVRkJgerdqRlUYUj1
 CkF6IMF8IGp+L6Q3SjsQKWHNfs32wuCixpBp/3op7c+ubEDfzFJjkyag84beUrUkeghU
 Sgog==
X-Gm-Message-State: AOJu0Yysl5n6bv50Y/DiWFCU0VfHyiXozEK1p480XWrNPwJzEr6xAYOi
 en+28hB3uG8JuZh8hCYbioDnnf5isdYbpkrqg7EK2+fEyXzdEOUpUvSJg3HbSQ==
X-Gm-Gg: ASbGncvUlI03RyitW9E7HQPskwoc9sC0Q3eyq5DJJUGSNRABMEQBc/VMCCEP+Zfsg14
 WQ9sNu4rLguw8/0TP/zg43SzXBbUPbnKm8PP4A9AjWGOwdB9aEuuTwbvuYXK53Qs9H+YA3Q9tji
 iwyUzeu+0gcbdOyFyZnO69HwLJAWEZKBx9i7NHIkp8sdCLoEpSFmXPkFR2lAnrVIbQxP5fX+k4N
 e6IR3803x8LNExY/E3yg0pRH11WGw0+fcpujJdGF5iCDsYo0CBlXycUxn/v/159NsY0WNcgLefu
 Gu3Vr692SqSpYbySXyzUuFlTcLYCp8KcF5Hqx9ItyCRchoc72mPltlYaNDAT2oQZlyomPmYN4bn
 ztPFwACLGR8YI7FuVKmhsM95lFQ==
X-Google-Smtp-Source: AGHT+IGeQju3hiJJXHNXsigf049B8ptNuDmVmWzMtyGukzIttbSXMEnVEQTpp6htjmPy/Rd5icKpgA==
X-Received: by 2002:a05:6402:26d5:b0:607:2469:68af with SMTP id
 4fb4d7f45d1cf-611e763864emr11774514a12.9.1752549292676; 
 Mon, 14 Jul 2025 20:14:52 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c976f41asm6619150a12.63.2025.07.14.20.14.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 20:14:52 -0700 (PDT)
Message-ID: <6875c7ac.a70a0220.e3fe4.29d1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 15 Jul 2025 03:14:52 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752549293; x=1753154093; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ttRysmrlRLrgWffhIgxv80tHNOH7BEYdhPDrn1fE06g=;
 b=F8/a8HvzPfBDdC5ijD/ewwXL5ioIaUul/XX8/8v78DavyyHFjlI4DGlEbvGkv3UEK4
 bUQQJ2l6P7gYWXnIy/FeeTOCXME/R3/zPgSfgiAtPsMLkxF9D3vCC5YWXUqgkSFASJck
 m5P7kaa8GlqrmoGfB1uHmTgdP67a308ZtVP6aT672eLHvUikF8FzM7eufNUv1s/Xg+Lt
 xc5R19vAK93y9+2GpoorrVnL5+4RHTKIZswZUkN5SCL9cPX1lIYSd+tgb9GeRuPxBtd+
 IcNrpritnrxHTtI5ENYgUixS6VOXC160KRAluO6GQxqovu9GK54JGEd5fwdxIo/0Z1H1
 Spww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F8/a8Hvz
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-14
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

Autobuild statistics for 2025-07-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.05.x  |  2  |  2  |  0  |  4  |
    master   |  9  | 42  |  0  | 51  |

Classification of failures by reason for master
-----------------------------------------------

              skalibs-2.14.3.0 | 7 
host-binutils-arc-2023.09-r... | 2 
                 logsurfer-1.8 | 2 
                setserial-2.17 | 2 
android-tools-4.2.2+git2013... | 1 
                   bash-5.2.37 | 1 
               bctoolbox-4.4.8 | 1 
                  cairo-1.18.4 | 1 
          chocolate-doom-3.0.1 | 1 
                   cvs-1.12.13 | 1 
                  dpdk-24.11.1 | 1 
                  dump1090-9.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
       freeradius-server-3.2.6 | 1 
                    gpm-1.20.7 | 1 
           host-dosfstools-4.2 | 1 
         host-gcc-final-14.3.0 | 1 
                libdnet-1.18.0 | 1 
                libdrm-2.4.125 | 1 
        liblog4c-localtime-1.0 | 1 
              libselinux-3.8.1 | 1 
                libshout-2.4.6 | 1 
                  mbpfan-2.4.0 | 1 
                   nanocom-1.0 | 1 
                  ntp-4.2.8p18 | 1 
                openssh-10.0p1 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                  prboom-2.5.0 | 1 
                python3-3.13.5 | 1 
                       unknown | 1 
        vulkan-headers-1.4.317 | 1 
                 watchdog-5.16 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f8002bc86753ff22d3514a0875e7f5100fda3c7c |     
    arm      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/e901f2a38195af393579643e39758f78d3c40b8b | ORPH
   xtensa    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a64fa35ef800217c14c74be564b9b1f5246b39b0 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/0401172e8383188a3c6a2f7086b0145de7cfc45e |     
  aarch64    |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/48e158b58e0023d61ab3032b49d540f124b2b1ec |     
   sparc     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e9d85059f90282e75081b1016c7da8e85e49d230 | ORPH
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/bdd6cbecc72bd393f3eada51993bbdc29c7e8ca5 |     
 aarch64_be  |          dump1090-9.0          | NOK | https://autobuild.buildroot.org/results/36a41dee62aa9f033e67af2efa1eb744412578ef |     
 aarch64_be  | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/9760b5d8931ba6638e12a3b81cbde11635dd93fd |     
   sh4aeb    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/5385275f3cce57cc0d9acea4f9c44d7997791df5 |     
powerpc64le  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/a7da9223ce3ea75bf8a01787fd302fd708b38505 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/636903d35700362e6212c4eb5834eb10853e9c95 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/c73de8fcd85ae53df4fe64748beef1edcceaa113 |     
microblazeel |      host-dosfstools-4.2       | NOK | https://autobuild.buildroot.org/results/a84bc452984555e68b8834dbe23c6a5f615fbde2 | ORPH
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/4976bfd8b8ce7bbda63a29b720474cf1decf634d |     
 aarch64_be  |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/4b679c01e5bbcfc5dc3bd0c9f19dab0b427dc5be | ORPH
   sparc     |         libdrm-2.4.125         | NOK | https://autobuild.buildroot.org/results/9a787182b6f62f3dc99a2dc06ae76fcd026377f9 |     
   mips64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/19f857b435584c8e5275e2aa7df8c45da3cf2e5d |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/c3cf3aeffbad5d503ed3071af143d9a7394ebd6d |     
   armeb     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/55018d4bd35ab89c090656603fd6a21e6ad9a320 | ORPH
 aarch64_be  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/43389931d9e8dd3556f9bc4251d919dc78bcac16 |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/0607cf6e7e08bfd19263004944e727a35c6f937d |     
   xtensa    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/f6227c33265f43a230658be42b07d1258070f9c4 |     
   s390x     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/94a4b73e120f74a92a4bae199e6c1a8aa66435ff |     
   arceb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/550518dcc520caa6a6bcb9005ef452456c700bb8 |     
  mips64el   |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/b72c3761d69abf1b12903baa56c50ca45cee4a9f | ORPH
microblazeel |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/81a304858f0762e260c0d41703e41de9a3e4b4e4 | ORPH
    mips     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/a8989a95426dd864e53b910f8ad74ccfb4a1ab46 | ORPH
    sh4a     |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/3e5daf934010b9c22d6a797c7aef5d9019e83ef0 |     
    mips     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/350d7f9a69f015d0220a15e8b9f62d47b988b607 | ORPH
    arm      |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/67e1a81f162f464bc2e8c12bfaa38c86d2b8c262 | ORPH
 powerpc64   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/a5a973cc5207792f428140dda5ac4259f2800b00 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/e9ad2a30eec924c22756160e739cb548171e9527 |     
   s390x     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/d19f8e9d21dce3efc5e22ff5870d7fb7b91eb2fc |     
   armeb     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/7be44f2669a30702e527c81813470577577e2897 |     
    or1k     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/2e1e17ab09ec2d734200e20f8148f2617e3c82b4 |     
   s390x     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/e33f1eb1fbb59258172c02ef7d538b6be50d40c7 |     
   armeb     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/1864c05464729a553695ec93a95176648bf3a5c2 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/ef08a4d4183674ff615fd14052f30fae2e5c1fb8 |     
    mips     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/a871b9edae7049c68acaad08b8a72c57091b79cf | ORPH
  powerpc    |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/8a0c76798b317abd1489e98f52e59a9b83502cb2 |     
  riscv64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/974fe9351f9a9570c9b063a4d5ea86095358815b |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

             lirc-tools-0.10.2 | 1 
              mariadb-10.11.11 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/05f1e4aa76d044679635c08158adf5f63e2c92c1 | ORPH
   sparc     |        mariadb-10.11.11        | NOK | https://autobuild.buildroot.org/results/4db8c6620ce6a6aa5fa0122f2a4e153c5827760e | ORPH


Gitlab CI results for 2025-07-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10675603390 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10675602374 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10675601624 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826467 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826460 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826459 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826456 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826452 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826450 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826449 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826448 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826447 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826446 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826444 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826442 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826435 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826434 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826433 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826431 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826428 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826426 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826423 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826421 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826420 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826419 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826416 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826412 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826411 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826408 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826390 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826384 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826345 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826300 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826203 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826194 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826190 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826160 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826152 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826140 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826132 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826129 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826099 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826090 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826038 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667826032 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825954 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825843 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825835 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825831 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825711 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825709 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825698 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825697 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825696 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825694 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825690 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825677 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825657 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825655 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825654 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825652 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825650 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825649 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825647 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825646 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825645 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825642 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825640 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825629 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825626 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825623 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825618 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825612 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825604 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825599 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825596 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825592 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825583 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825579 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825569 | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/10667825561 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
