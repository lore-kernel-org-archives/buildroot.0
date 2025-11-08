Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E27CCFA05
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 04:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08607606F3;
	Sat,  8 Nov 2025 04:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tg7dRrUBjT7Z; Sat,  8 Nov 2025 04:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9E1660727
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E1660727;
	Sat,  8 Nov 2025 04:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E77A2CC
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 04:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5576760727
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 04:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2pm4gNFbB9T for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 04:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0F78606F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F78606F3
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0F78606F3
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 04:21:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-429b7ba208eso771435f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Nov 2025 20:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762575668; x=1763180468;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93yrdnV+1uBe8aGWBu6YQUyWPbA2+Y0CoYLkELfwFT4=;
 b=lOHTjY+lu+yBuNadrJBpf41PiHIKPMytBC0vsxCJdpItn8iO+VhezKgIXsyYPTK3ly
 F3+7TKy1vS882CdbqEegRwz+5HzEZ+3KBYt4DE473Jrcl50uIoly6BFwqUClLXhnq4T9
 GgcDYMK9mV2efo1KbwDAPdQQ0wfo2AsQkO70IhNe/z6KhShv965RBncDamqjk+3of3A8
 qRLbuu45OwQ/vW46bEaSXQb2j5gWx6L44GuxxqZGq2r6I/PihN8rxRW7NXaSO7CKc1Uh
 LANbYpv8F73DdLh//2G/ZvzpoE/ETUO79Kk5ImUaIJbIYgKRCcjGWYR3NMht/JUTkTPR
 +uVg==
X-Gm-Message-State: AOJu0YyUe4OuSUXwi/P6nYvnyacgjdRh0K1fY04NYbNd4Txa6uQiFql8
 aa6XIsG7WyiGry7Spd9FQrvIjsxspJTfUJf6MJpFzNraNN8zc8uck8xbu1x4hw==
X-Gm-Gg: ASbGncu0edEid1a2YSMzVaWARYutzDnsxUP1GgBPFhvRc2j/yraMAAnXf1/BGs1SLGK
 hnLqgDg2qfvwh0lb0LypnlnJ/NaiEzrpDjKlD2d6ET5ElgokGG1G8yOeuBhEhLhSmE/78aJ/dqf
 Y66TUirBJpUtmxb8kL91y0zaz9fn8gDrQbsy+X+PXbp6LGjt9RwiXfUtl/40m0IlUmpOLjk1hS8
 R7bf1Yz1dJlRRnmqukKSAE60TAtKfpncuwIXYDJEPZ47oNS/2d5xHYdyUOzbeaW/Wxnow6RSllX
 MyiwOe6syfELzmVhi94sv3X+0nL7/Es69JB0IMbZe18BeF6ah7V9Pz4D+Knpu4OIe0t3ed1cOSv
 NplqHQpjlHbOkzH3L0fIlju1dquEP9ajHChBQf+k75k7dMLaUsSfXjW2dMZk7hsTOu0YzkDHpzJ
 wU4i5DmeJumz86jZil1g==
X-Google-Smtp-Source: AGHT+IGl3y7rmvy26oLNL/ZuuqpxknvneQ7NMC7DRxvGuZy48ntmTgm8qOaJ0uHWfh1MZFpvTGbpGA==
X-Received: by 2002:a05:6000:646:b0:425:75c6:7125 with SMTP id
 ffacd0b85a97d-42b2dbefab1mr752589f8f.16.1762575668299; 
 Fri, 07 Nov 2025 20:21:08 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac677ab75sm8611132f8f.35.2025.11.07.20.21.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 20:21:08 -0800 (PST)
Message-ID: <690ec534.df0a0220.272351.76aa@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 08 Nov 2025 04:21:08 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762575668; x=1763180468; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=93yrdnV+1uBe8aGWBu6YQUyWPbA2+Y0CoYLkELfwFT4=;
 b=UUL3UoIhq6wKiIl0ZisOk5w4j6agM2gBghtU9tvxSMVNFAFd28/mZJAUiYAHkvGXcy
 TWVFQe+ktYtEnL/32sVLqsLcgvJWySr1fxZEZ9JHIuP4ADwjCBaflLaW7sISLlvlkLy6
 zXIBs49rJiBxCi1DC/mbtSAkiqLO4op/s7WWgOeC1I3TF9u2nf/vr+t4tL0QXgz9FR5G
 3/tiUIcAvtA/Rc3/6PRZbSEldi17mI8ddmuOmNW5o7phJpocJ0MhR84TUanuhoz2zz6W
 ALArponVM/+fuB1aurqMKIMx/cg9jR11PHkNUDD/MbdtuxMCh+NI4Od4ZZ5jOXR7hiHU
 GEFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UUL3UoIh
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-07
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

Autobuild statistics for 2025-11-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  6  |  0  | 12  |
  2025.05.x  |  2  |  3  |  0  |  5  |
  2025.08.x  |  1  |  1  |  0  |  2  |
    master   | 38  | 74  |  0  | 112 |

Classification of failures by reason for master
-----------------------------------------------

                openocd-0.12.0 | 5 
                   cvs-1.12.13 | 4 
                       unknown | 4 
                   dante-1.4.4 | 3 
                  linux-6.17.7 | 3 
               bctoolbox-4.4.8 | 2 
                      fio-3.41 | 2 
  gobject-introspection-1.84.0 | 2 
              host-guile-3.0.9 | 2 
           host-openocd-0.12.0 | 2 
                   libcap-2.77 | 2 
     libphidget-2.1.9.20190409 | 2 
                   perl-5.40.2 | 2 
uclibc-ng-test-132c6134d691... | 2 
             util-linux-2.41.1 | 2 
            vorbis-tools-1.4.3 | 2 
           at-spi2-core-2.58.1 | 1 
                    azmq-1.0.3 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.8 | 1 
             bubblewrap-0.11.0 | 1 
             dahdi-linux-3.3.0 | 1 
               dvbsnoop-1.4.50 | 1 
               dvdrw-tools-7.1 | 1 
                enscript-1.6.6 | 1 
                 expect-5.45.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
           ghostscript-10.06.0 | 1 
                haveged-1.9.19 | 1 
              host-bison-3.8.2 | 1 
          host-tipidee-0.0.5.1 | 1 
                 libbsd-0.12.2 | 1 
                libcurl-8.17.0 | 1 
              libopenssl-3.6.0 | 1 
                  libsvg-0.1.4 | 1 
             libucontext-1.3.3 | 1 
              libudfread-1.2.0 | 1 
                 lockdev-1.0.3 | 1 
               lrzsz-0.12.21rc | 1 
                memtest86-7.20 | 1 
                    mpir-3.0.0 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.12 | 1 
php-pecl-dbus-b147624d480c3... | 1 
                s6-dns-2.4.0.0 | 1 
                safeclib-3.7.1 | 1 
          sane-airscan-0.99.33 | 1 
           sane-backends-1.1.1 | 1 
              tailscale-1.78.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/71c42ec55bafad4268e4dad18706033b8df25b53 |     
   sh4aeb    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/eba5a1cb3910d5084248d66452e40ce25bfa92cc |     
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/49d1213463e096763f277ffa249566929e92dca7 | ORPH
   s390x     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/98139b1a5d8b94ad7a93072e540fd20e5b848667 | ORPH
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/942a65bc59949f9884a9df6523f306930b18aafb |     
powerpc64le  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/4692fce533e4672869d540ebf61fc6d42b86d901 |     
    arc      |       bubblewrap-0.11.0        | NOK | https://autobuild.buildroot.org/results/7e72ae8b0f13653765f4a64cb46bcfa32ab1c9f4 |     
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ba9de5bd8a8fb0121cb9395c541a670e69a8018e | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e82ab70d44f44a4df6cdbb761efb2d25aa294138 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/faa59cd6b06801a8965fdf8c53f10c454f9559f7 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1f0a892db9f79f0b08c4660868ac9b08fe48b79c | ORPH
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/48561f90924263f62183504c8be853cda9949c41 | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/70afcab736a39296d6c3b9e81374d96d6f75aa11 | ORPH
loongarch64  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/afe9ee7edcfde1c4c74cafe1aca53c9db931940e | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/975be30953ee67a9805374ab88b3897b35ff356d | ORPH
 microblaze  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/d27505717a3785358a0016b259e57a2f8c667bf9 |     
   mips64    |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/cf55a6ab689cab839aa8748e2d850780bb0179c7 |     
  mips64el   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/13c0b90260a69dab86efd3da2d9df16a8297dcb8 | ORPH
  mips64el   |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/7f4cf7a2d125e7cfc05e6a5b88c5ad026b6fea43 | ORPH
 microblaze  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/623d5591597fb52afabad60cd3d0cf8a7e684cc4 |     
 microblaze  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e96546f54549cbc31c452bcab3b7d83876414989 |     
  mips64el   | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/a25b45dd3d5d464c103b972d15c93fd0929de8d8 |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/c59c500f0fb1f2ff3f8ae6423d9d148af2fca041 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/dfd85354cc5c32a520025477af7550c33fda8bf9 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4b19a5e370c188b391da99222c520cf1118ff48a | ORPH
   armeb     |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/ca51adae1eba7ffa440cf707899c0da62b630313 |     
   sparc     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/7706e0d94c116ffbbeddd10abd6475aa80125f5b | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/81ca09cba48e67c7097a25a65c770245271b3010 |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/658630528dc418132d684b28f61a2dc185ebd985 |     
 aarch64_be  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/d94c568cc7ab954dfcd765f5fc9c46ef6d29b4ff | ORPH
powerpc64le  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/ca3ea56b1a0d5f5e9ebef41587c7f523a2a0d119 | ORPH
powerpc64le  |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/5f135b704c5a4753a62805b115f08053173bcde2 |     
   armeb     |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/0fb050828c7e998286f81e500afc6672f8e57ba3 | ORPH
 aarch64_be  |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/f6dc61a9d57e282691b87a3a8fadcb5d5ea8fd8b |     
   xtensa    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/a61aa433e1955867f8b8c5b9ae3732ae6be65f84 |     
   arceb     |         libcurl-8.17.0         | NOK | https://autobuild.buildroot.org/results/d91a44970519bbd60de251aa7f29061af8fbea34 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/4231cebdeaa172c342df4b3f43060e93fc9bda18 | ORPH
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/38d77747725d048b8d7a96e7113cc8a217997749 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/68d9f4ead3ae9e419c0389c5949d43f89e63428f |     
    sh4a     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/508d0a6443a519ded00c4b2a8111858f6f1aebf1 |     
   sh4eb     |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/4a73817b6fc03f0ed46c200e31f5ed717480a4ac |     
   xtensa    |        libudfread-1.2.0        | NOK | https://autobuild.buildroot.org/results/839d1b879187454ba9064845451f2c2ff398a663 |     
  mips64el   |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/b42f5f86ecd6d3d4cd0661c20ba68ebeead1442e | ORPH
   s390x     |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/d89c27602a1fc7107eefbc8f7814d67ef3918a16 | ORPH
    m68k     |          linux-6.17.7          | NOK | https://autobuild.buildroot.org/results/e3161217e9ae2a8c8475781970159aee84918840 | ORPH
loongarch64  |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/4571d82d3a2286d049e98438e33ad1bcf52d4be8 | ORPH
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/2757cd7e432c394f9a96b047d94557b686c2fb46 | ORPH
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/5d15ef180c8bfb39c79df3132f9c97f351f858e0 |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/28814b756c1946d9b6cee3ca7faa2c94f296edcd |     
    or1k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/7ee2945d5517d072574d21edda2918bb49bd2b9a |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/646b04053834b29f085b94f5fc05aff33c5e5df0 |     
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/fd7e18613c17fea11576cc431343acf95831692c | ORPH
  sparc64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/8f08081696fac0e3270d0d9398f85294d59e8ea1 | ORPH
   armeb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a4294b42850bcc1dc52acbb8c7b74454c9272c71 | ORPH
    arm      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/52c9820e77cfa701e74a9fb6108e2532b7f53736 | ORPH
    sh4      |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/993994d1d4957192fd9cc3418d430396089d488e | ORPH
   mipsel    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/29f310a67db1321d35faaa0409b3366b8bdffb23 |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/b1808fa2ffb3543ff8834ebed6356d8faf33a779 |     
 powerpc64   | php-pecl-dbus-b147624d480c3... | NOK | https://autobuild.buildroot.org/results/e12d3dadb1cd4ca3d46ca309a2d6cc017cd20836 |     
    sh4a     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/aa583320e2121494994f061d58864dc7ab273899 |     
   x86_64    |         safeclib-3.7.1         | NOK | https://autobuild.buildroot.org/results/e8a2973cba9b72c7e23d54f09f47a2e6cdbcb77c |     
 powerpc64   |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/5fbb30268a0e4e153cbe6ec9217daffc6669ea85 |     
   arceb     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/212a6b52e5219200f326e935dad413736f3249df |     
  riscv64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/259a45661a38b5717afab941ca1f4980cf3eb992 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/7d39881bd1542c3c1cda09e5e948e66fec261699 |     
    arm      | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/710343ef93ec06789e055a7ef381e96c1d4286e8 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f9daf22ed42a2321e7efa5af7ecc64c7a799de5e |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/c2e4bd7899f9197777e555557836c36fe721683a |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/b940f9dda1386a9e984467e9a7b93635faaf9c17 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0618a257050d174406fd932fed763e4d4940dc26 |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/5a815e1e997478f6f18c6ce6d9a713a044caa5f3 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/6fda6a8c272636730a95845ed5f65fb895426719 | ORPH
  riscv32    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/61a998266304f17a737d7a697a014a0cf3dc4897 | ORPH
    arc      |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/58d1e0a822b9a1c94c75be351daecb24fd1bb8e9 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                 libgee-0.20.6 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/914c9fd465cc1c61e131b0db171cc0b4ef869c96 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 linux-6.12.55 | 2 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
package/python-flask-cors/p... | 1 
         python-rpds-py-0.22.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/789428fab7fa01fed7425c3c2419391b07d6b387 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4dcb7517e1ebdbae0f683d2388a57bd185a37db7 | ORPH
   mips64    |         linux-6.12.55          | NOK | https://autobuild.buildroot.org/results/591e24a14cf5ab3e7e806f9b8137b71b50ef3b59 | ORPH
   mips64    |         linux-6.12.55          | NOK | https://autobuild.buildroot.org/results/a6ca02dbe17f59dc162a80d2f803ef9bda6edf60 | ORPH
  sparc64    | package/python-flask-cors/p... | NOK | https://autobuild.buildroot.org/results/f191c625818fafcbc34e665690608ca5d7f49c12 |     
  sparc64    |     python-rpds-py-0.22.3      | NOK | https://autobuild.buildroot.org/results/d94f6873f0b287bcb23cecdb789330d0b14a83cb |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 host-gdb-15.2 | 1 
     host-python-maturin-1.8.3 | 1 
                openssh-10.0p1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/81a67e4b07794291fed9370c08d87f49772fd996 | ORPH
  powerpc    |   host-python-maturin-1.8.3    | NOK | https://autobuild.buildroot.org/results/e635d4351611a3d68149970ebc6ab82eef60e9b3 |     
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/0e016338c60acc450f349e43ba979df4c8673f83 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
