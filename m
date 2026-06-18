Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A79BCD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 03:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5C62412D8;
	Thu, 18 Jun 2026 03:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzwLtiztXNwb; Thu, 18 Jun 2026 03:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 137E3412D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781753262;
	bh=RKGctQQTyX6UvYKgbGVubmiwxy58a15VegefjbtTpMM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZRytQmslsD7VPd2rm6MDAbhPrJqBPaVOacIpuGO7wf23rSHZsu758rPlweNwxsTL0
	 F28Mc51ZbeUWovw+M6z/0zCB2tZeo7cFayHvWW76LDdJCyUC79mS3f5SrXovQAIZQY
	 a0AUE2IDHoJC362v4HbYi++5ACWzT7LCfVG7RYhVIl40tZhrZAuGU8rJV+I/svyVJc
	 tO3aVfy16k+5KFfs4R1ZTWcUhJP/twGYBpKJxJI/Lwp8gHWW5pc+pk4E90XLl2YZwy
	 lh8GWBf5wYf5WZLOsBDIFkmFpy+f8aDOyZpuZL6T0pzRWPrhCAhApjHRnDq+4/nriv
	 aVfKkcC/7ierw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 137E3412D9;
	Thu, 18 Jun 2026 03:27:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26414386
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 03:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12777412D7
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 03:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWAetokYPgwZ for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 03:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40354412D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40354412D5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40354412D5
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 03:27:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so3074745e9.3
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 20:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781753256; x=1782358056;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GbaVoOGkQoXPkudnO5H+9vFVaJxNvI6KfrsjNqGrQo=;
 b=D6frFNpnFf2LJQvjmOulaxHj0caRPEr1I3g9RBdvZeM+w+kc2KShPoOj4brUIPk1Fe
 Hdjv3k34FKkNn0s0Nbi7nt9m1idHRePV204JMkOpFXX9MAiHjfMBwCn+aqyqTnC+GNGA
 g1df28k8q9j+a3fS+zl3dWs3RuL5HeTwMZMmyx0RvNPLbq24OyONmVKYNl5goowYr24J
 t4Gk7qW7dMb03iPxGgZgjCRtsV124Qg80a6HJJoKeto3qZrcnC2PtsPdILjDnkF0pX70
 1q08s9tWXQ3/Xx7ZtvJA3g8vmwM45uiJIPT2Vwm+pzevwOYbdPCxSLgLAXHa46K2MD6f
 KUoA==
X-Gm-Message-State: AOJu0Yx9dtK0oRpw7QcySnBhOt1EMHqFcnrTUZMUav//PT3nfZ7/jdRz
 ndHa+/5OwjbK45vFv0P4BVLc9U0KATiAfQa2rVXnWwaVrgNB0Wnv7H2DzcU59olw
X-Gm-Gg: Acq92OGcR85BNmIYpThrs6rfrMvstNXRtLN0UunRzr2OUiHoowMqcXHl1lIibqFGPQ9
 4rAUiyHTDMQxLNCPUriRF4+v3oGYx2N5+cTea+uUhwwg2L+IBR/p+jznyZ52RzEzVsP8W9fIVeU
 JZ8rmlivtwbSr7x52zropHUf5gnQsjk7JRBiwJd9KQg6tNGqLZRFkR4/zcXNF9JdOGN/k/uFsNR
 9HMBL/DHW8AgSk4IrCD0kl273TTIRNwZNtyYSxEPn0QCiTg7XuCOUz+RZcBi2Fw4AJI5XUZx8vw
 FwcE5QbdpHbHU8eCQNwVK48CZrcmHT8IagFA3eitKZj52+MsVNZ10QjAGpz64Drc1B0bIj24PUC
 iWFL12jRg3dLVDMbOlkbjki3m5VaE5ho7kGOoedbTTKRtGR1Tq6U20ZFiNTs1YWPcuEB/FPRdU/
 74CFGcCwIMRQR5yD5+auyFqj4axQ==
X-Received: by 2002:a05:600c:4e54:b0:490:d32b:39d6 with SMTP id
 5b1f17b1804b1-4923412f17amr100591385e9.19.1781753255869; 
 Wed, 17 Jun 2026 20:27:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4ff67sm214951725e9.6.2026.06.17.20.27.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 20:27:35 -0700 (PDT)
Message-ID: <6a3365a7.459cdc55.395752.82b3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 18 Jun 2026 03:27:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781753256; x=1782358056; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3GbaVoOGkQoXPkudnO5H+9vFVaJxNvI6KfrsjNqGrQo=;
 b=n1+DnJmuUnIb6QctpOwtXN7PF/4VAshPEwotRYDYTU5ZF9n/efZkqXZjzKoPHcysL+
 qcUlkql3EU52K+zAmE9dNOAoZypXZvpmncsWpeihAU4O394uZkspE1jVX7X3/+f4XO6a
 63bQ6oFkeWTto8dobYS/9MnC+L0pb/jl5LA4Y54xxR/YJetWZPLbPancyWES1gNF9VJF
 7PphbNkVgZYgWABOE85zYi1lK+y3t4tbXbf8Cq5548R5T3a4xE4BCdo2uHEHR2kXansN
 D/tkcBk57bEYpO+DazxS1bcyVpyP6ACekDTe3nTZcRnWIJMjPjNAAuE57ZPXL4nUpPeV
 kWGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=n1+DnJmu
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-17
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

Autobuild statistics for 2026-06-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 23  |  0  | 30  |
  2026.02.x  |  4  |  6  |  0  | 10  |
  2026.05.x  |  4  |  5  |  0  |  9  |
    master   | 34  | 82  |  0  | 116 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
                net-tools-2.10 | 6 
                   perl-5.42.2 | 5 
host-vboot-utils-7dfa482d6a... | 4 
              host-pahole-1.28 | 3 
                   guile-3.0.9 | 2 
       host-gcc-initial-15.2.0 | 2 
    host-mender-artifact-4.2.0 | 2 
                  iozone-3.508 | 2 
                   linux-tools | 2 
                    olsr-0.9.8 | 2 
uhttpd-15346de8d3ba42200249... | 2 
amazon-ecr-credential-helpe... | 1 
                  bcusdk-0.0.5 | 1 
                 binutils-2.44 | 1 
                   dante-1.4.4 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.15 | 1 
                  ffmpeg-6.1.5 | 1 
                    flex-2.6.4 | 1 
                    frr-10.5.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.43-27-g4070d808bea1... | 1 
                 gnupg2-2.5.20 | 1 
  gobject-introspection-1.84.0 | 1 
          host-binutils-2.46.1 | 1 
               host-dracut-110 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-16.3 | 1 
            host-mfgtools-0.02 | 1 
      libabseil-cpp-20260107.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libmpeg2-0.5.1 | 1 
                libosip2-5.3.1 | 1 
           libsoundtouch-2.4.1 | 1 
                libxml2-2.15.3 | 1 
                     linux-7.1 | 1 
        ltp-testsuite-20260529 | 1 
            minizip-zlib-1.3.1 | 1 
                    ne10-1.2.1 | 1 
                  ntp-4.2.8p18 | 1 
               nushell-0.108.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                     php-8.5.7 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
               tcf-agent-1.8.0 | 1 
            timescaledb-2.27.1 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.04 | 1 
   webrtc-audio-processing-1.3 | 1 
        wireless_tools-30.pre9 | 1 
                      x265-4.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/f14132740f8e1344cab3e4c6284e06d7c0a07e30 | ORPH
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/a6d9c770158a5f30287970cb47e28df394a97401 |     
    i686     |         binutils-2.44          | NOK | https://autobuild.buildroot.org/results/44499ec30a986251d7fe2fad2677512e71ab2487 |     
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a0f81cd69fb2ef827f1d2927982cac53508dad3c | ORPH
  aarch64    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/df4c582ad6cb5c4abe85b952b612259b0896a77a |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/1b5a6af85170abd5ae91a56c8a3ff776185c2f64 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/638c05d029e78e2da273873d78ef14fb0c7f5ec2 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/cda3068c2b55433e93918d07046635ddd8460656 |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/b388c3b8d914380538a089325c9cf3d0cc167757 | ORPH
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/a77697e65452fd4268a58e1de62f25042e51fead |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/dc862a2bc0d9efb348c30af98d4f3c911f715e97 | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/adddbc5e0e1e0474dfbf676b0832217c43bdb427 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/129c9f2cf1f3e8539dfd45b911cd82b54ee596d0 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8294a88dd480aaa5baede2bded499e0e9f384acd | ORPH
    arm      |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/d7b901db7df722261792631713ef6f573b99cc88 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/d6aeba18c8208c0d3dde4f566b47132e870654fb |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/1eec7f5a4be117cfd43df9361c4ce0ef02d63f3f |     
loongarch64  |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/e47b3389008282541cc96f846f3294e882ba3283 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/f1e639ea700556a8e00edbb2a6b200a20aad3060 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/1ee826d219728a54c48a220c5e6773137746472c |     
    i586     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/354ede02c6a3fbd20ed8ed9c8c4d696b93b83e0a | ORPH
    i686     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/fd59d2edb53cd0fff044203fd73404cfbe56b1a2 | ORPH
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/5595616a26e9e95c5982d7115e11552f5fb18e8d |     
   x86_64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/ae0f2d4f64df6a5aba80201caca510ec07e45998 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/828d510703161276f610062f7f9f9287b992e8b7 |     
    sh4      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/fb3f918ada45f793ab003c46abdfbc14ca946fcd |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3b851e5a86c3540373ad3413d41317ad97d7ba9a |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ee37f8c4eceac67147d5be2eb0cc952975bae4f6 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c7f302c2781dba97808d8dacc1722a939eed0207 |     
   x86_64    | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c6db90339dd0f698269dbec06b813ecbe153ea05 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/78fe7ade3213b11809f8b09725513bd6fafdc413 |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/0826326e07c75c778a1260d3f2e94b67654f6fe3 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/02384f7eeea2a64545753dfeebf3c6f93f3717e1 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c06ea3c52e2a5fc772c6f4742a8038f36515801e |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/381e2b8ec406673d81981cf708a31cc079e96dfd |     
  riscv64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/faa65d6f9e6adb03596767f4970c9e5d89960bb5 | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/f0346ba2adcb057bbb3df1a0ee45d38bdc09d444 |     
powerpc64le  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/f8674ec39946517e78a46124a50973c2f56c11f4 | ORPH
powerpc64le  |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/1ef1b52eb648d67647e34e9f1555840e10db5b49 |     
    i686     |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/d4023b076ea87759592ebe64d666590c8ff34cf0 |     
    i686     |         libxml2-2.15.3         | NOK | https://autobuild.buildroot.org/results/32c389f1d9232a16da3275dae5236d6d624ce527 |     
    i686     |           linux-7.1            | NOK | https://autobuild.buildroot.org/results/9befd7d7f0281fb63255018122585562eecaed54 | ORPH
  aarch64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/87a28b2752b21973ca9d68bc5a96c6b5c50e55f3 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/44bd3aea9d7ce5127e5fbd77d5940dd696df10a6 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/f03aaf6b63991ff94323ac99b1f83c3d0816b694 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/6e33b7586fdeed24ea8f16b5cc782d990e2f52b9 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/90f1b2df09b9cec881a09d8275a6b6f9af24b1fd |     
powerpc64le  |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/6c7783e3b6dad01b5dd725141ebed2b84242051e | ORPH
    i686     |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/f458315cd603116ed22bbd0b8fe4202647c89324 | ORPH
   mips64    |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/2a602ca3ccd49552803481330fc3e348e7ce4246 | ORPH
  aarch64    |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/677941173dc4da44ab7379150372c8bdeb9b4baa | ORPH
  mips64el   |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/038557a5ec8675f74abfb296c805e1391967cae8 | ORPH
    i686     |         net-tools-2.10         | NOK | https://autobuild.buildroot.org/results/f83a03b9a09a2632e56cdc105acf0bf40e051e25 | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/37a1f41d913648ae493683a91ba41b5114e9d918 |     
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/76a2c9ae56fe7cfb1e2d75d9c28dcbddb5c62e66 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/9805ea3c601a180ff07a013d0288f27d29a28bcb | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7764520ef07d1905037582c75a6a7aa3b8a8c2d4 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/11758c530fb17d7c0db0f01fd9759634918ef624 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/cd4ebcbf6403b26fa5fcc43bbc8f969f264ae72b |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/dfe307c46c9de15c4075e8dd1aa89d1206f296d4 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/46133b25e3161465f25fed726cabe9c63cca3579 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ad4e4f11a7bcada59b58640f6cf725160185ca3d |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5ea927929f79d1f080b97171afd429b7dd8f4dd3 |     
    i686     |           php-8.5.7            | NOK | https://autobuild.buildroot.org/results/cbcdf0fcc55fd4c23105a3024cda2e5160d9532d |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0990dae68fa376c828c154fb29a048a6f6410219 | ORPH
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2e16acf60674d955f35cadb9a80f909757b51c45 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/eb4d6bf7fa61ba7a104856ddcd8a2442446c3249 |     
    i686     |       timescaledb-2.27.1       | NOK | https://autobuild.buildroot.org/results/83b99900ef2e456ae637732fed45028b5acb05b0 |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/7217ee75c6f7b216fa2f3592a0af012e46650413 | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/c58466e15b740cee60afa077e8072a5317b66778 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c79be7efd5c76f901fea9365aae70f3db47a2db1 | ORPH
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a5e36423b1d7afa1e469bf52fe01d321cb01410f | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/b825a794e37b2bfadbd61d9591b8c1527456e72b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b27a6bd512aec2bf6366627917706e4757747d38 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5dfbcc659e7bb98d890bcf029c479ad9dbcf02e2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f62f3bf0e3a29be1a42d2c2c844efd7905ed3be2 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/fd961018349f827b1dc7cf1df9b96a2e10394b67 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1ec2810e81c01799b8ecbc79740e2bbcc924eafa |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/97331727c1463b9f92bdc2f070da8f05a4c7ec7e |     
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/7ba7eccecf6800b0967f40174ae0e5c1116a4ce5 | ORPH
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/e7332b9c91ed03eb797312ecc7338c34704dcee0 |     
    i686     |            x265-4.1            | NOK | https://autobuild.buildroot.org/results/e0b77168dd55bfc5aa4eca4649638b19cdedbc05 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

              fftw-quad-3.3.10 | 1 
                haveged-1.9.21 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
vexpress-firmware-901f81977... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/627c4067f0c7011c5d901a0399c4d5174572a2b2 | ORPH
  aarch64    |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/46127c33bb3119faabc9a95e759f129f57756a3a |     
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/71bfd80ef72b156fb233114f72e159621539823a | ORPH
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/6b1518e67026d4d8befd855856996d6e55085071 | ORPH
  aarch64    | vexpress-firmware-901f81977... | NOK | https://autobuild.buildroot.org/results/73ae6a52ed85b2776e3289d439256110a68846e8 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                memtest86-7.20 | 2 
amazon-ecr-credential-helpe... | 1 
                  broot-1.55.0 | 1 
                openocd-0.12.0 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/4928f36f973cdfdff458595c6f065977607494a0 | ORPH
    i586     |          broot-1.55.0          | NOK | https://autobuild.buildroot.org/results/156abd4e214e230d36426fd407a7edb030fe0f31 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/d8f4d82a65b1b944d3a9d6c30470fa54a65aabbe |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/a4cae072e9744a11221d721e02646b0bf088e157 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1c06ffd9aeae4dcff08e1df5b431a82fbe114615 | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/d4a5e81bee98b6ce40aa7cc8b88cd3e99d98e11f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            host-go-src-1.26.3 | 2 
                 openssh-9.9p2 | 2 
             bmap-writer-1.0.2 | 1 
                   dante-1.4.4 | 1 
              erlang-26.2.5.15 | 1 
              fmlib-LSDK-21.08 | 1 
        host-python-lxml-5.3.0 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
             libtorrent-0.13.8 | 1 
                  liburing-2.6 | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
           oath-toolkit-2.6.12 | 1 
package/wine/wine.mk:347: w... | 1 
                   perl-5.40.4 | 1 
       sp-oops-extract-0.0.7-1 | 1 
              udpcast-20230924 | 1 
                       unknown | 1 
                     wine-10.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/167cfcd6886c8220db51f4ba6db28c8e3a55e0f0 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/be7b0d7eaff7c3e30d0eaa368b66975be2bf871d | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/4511d36ade3392e431ed5359ad4d88f8104d0866 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/10045d4ef4553b7760142add37518001d0f0e09b | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/cc5d6fe8e978a6986f1098ae018be2b00f50102e |     
    i586     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/9ac0ac319eb995cb810f90c312c79621ee1c201b |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/226b78a5afa65ec8231ee607e3fbacf3e5427421 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/f62ce8266d018f38d4717c664f29696fcedbb69a |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b9126386490f5313b3af9f14218aa7bf8cdb2cf8 |     
powerpc64le  |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/c5c3908eb5cd41e1f8977e9864161c442eaefe48 | ORPH
    i686     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/b1c8d8e2a0e370f19be146b2e177af0da72189e1 |     
powerpc64le  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/b974fe601c8fe5d69603720a613a48f9c35cb2a6 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/7947b1a91370f46e0e3ee28218237e6d133e578e |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/ee7b6da07a772897dfa8cd4436365ea7bef62916 |     
    arm      |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/532b287a652eb0e501c3bcf031c2047c31bbcadc | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/ee9329461cc36650416013216cac15820ceb7174 | ORPH
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/214725b17468ede4cd7be77569ee7bbdfdfa7ea3 |     
   x86_64    |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/9a94948cc352f6c58bec6dc63d1bd84125411133 |     
    i586     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/4276de73c4208b6a0505ebb3c26cf835cc4c37ed |     
    i686     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/b9300330cc4d475254a51c838989e1ae0dba883f | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7c1abfe74f8e533c0e34ac4a843342db74e5a605 |     
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/850a86874d52339e33ded3924353a38f1d9c29a7 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/7fa1c697c411033c49e452ca322255b453466a49 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
