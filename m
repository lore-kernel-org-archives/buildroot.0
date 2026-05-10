Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB0DCD343F
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 03:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A8642297;
	Sun, 10 May 2026 03:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUPk_UVB8Htd; Sun, 10 May 2026 03:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C9E4229C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778383730;
	bh=vr/ZbV0Ycsy51ZtAYUFISCUR2osjWO3GdOkQcI1jfoQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JMfd/OCVuPMGGPL5TJ8rBE5n9/sHjATQf/k4b79u645Wv8VrafzoPrzGW2rIBgwj0
	 bB1yrS1HDnz2Qc33NZIaRIp1Cep2ZUPe8LzTgxr4u2unJJ+hFPqX1aMawRaUfrMF3b
	 6Og07x2W+YR4LDx3MzwOHhppkbmW72BV9hnScHaF4ihzddXjDotBs6Z59YIyGkP0Od
	 OsR+Vjre6SOj4gqHylthYJ/7KzY4EOeZ1XmX4ONvAcohCVt5ySrAFp9tA8OEqk/Fi8
	 3KwGSY0dDQs2fuxoKrzXT7spMGJ/6RwHgRORBJZIy8OuPapxZsquDqXREsB7A5gU4y
	 ZiAwSszcF36Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C9E4229C;
	Sun, 10 May 2026 03:28:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6017225B
 for <buildroot@buildroot.org>; Sun, 10 May 2026 03:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 467C54229C
 for <buildroot@buildroot.org>; Sun, 10 May 2026 03:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqmV9ItrJRL9 for <buildroot@buildroot.org>;
 Sun, 10 May 2026 03:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6235C42297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6235C42297
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6235C42297
 for <buildroot@buildroot.org>; Sun, 10 May 2026 03:28:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso36005585e9.0
 for <buildroot@buildroot.org>; Sat, 09 May 2026 20:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778383725; x=1778988525;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=epaEjAlQYHYWnqQBHnwThNRyAKGc0r/FJ7i6GpdaDjA=;
 b=ZIbBb755ZsSY91hED/NvbMqnLZO/KNTM39V7APGg1xl+HbGqQysUdsUhEApLXz9Rd4
 mMUCOtYIwC9soTt+iyUBHjIIspbnTybq2Jqzo6ySuhxjUYSU8irFuQCJkAmSzrni/RkZ
 pLFD14JdF9ifrj+sctfmBM/gFNHK/TXtkKaVdQSDBrodJ5EQAm966BpUrZRUqfVIGuTz
 Bm4WF4ny3jcsOjd2rMkyYUo53wZq8g4c5PCV8OwFhS11Hc4MzS2HsLfg8i+I9hkZqzn9
 1jb3pMoebvR+vbI3fcfPY1+1C4BX/WKQENmMav1mgErHpF+bLKpVF3pGeeCq2RcRE0PS
 37mQ==
X-Gm-Message-State: AOJu0Yy/PIa+ZkD03Qc1GO1Yr1vJaLF534CL/4KtM1vx23lCUV/mRKG8
 FtAwkHKRGEM91YF0MvH8ExtYFAFHLOLPXDf2HgGQS/hDVcVbGTlb3Sh24EfuZJ3O
X-Gm-Gg: Acq92OG2ve+N0qb60RshEWpzQ2X9ohHvJoJ2VRV2XuitsYtiySBQd2sYypXf6LfoBuX
 ZarWer15zFPueXGUNuq/lahxqow2YATN+SQiQGfwvYKW+QTlEDAZmia+DlHLU/1Jz9lQ6wga2Ja
 /QkZpyV/zIwul/JNX3QlnwPGlVOWstNyParJyhd4SIDSp+A7fr99opLC3iOdBaCF6wFBtX4XVEK
 tF3q4FGMsj5JfJtR0mirpCFV7qfRKw2MQlme+mb64QLIoPoIPIJainun/cx8h5xCkC3vpXS4cmP
 GA7o2YL2+uuu0OtC/gDX5I/A7D8YM5WzQpck9z4XxrzAJiH6HWqtYm12z/aPTCjwUDywqMEhlK1
 saBvV5ayRl2Tb05VZMWP1IEZ0ulVngPcZzJV8fiM/ETF3LyG0882dbRfVtygXD3jBeH+M6u2WHr
 un79mw3ZSz1vfVD/Be2l5uaLRYucxoJQY1wU7/FjPOd8l9qsiLcdM=
X-Received: by 2002:a05:6000:2689:b0:44a:2555:f8a9 with SMTP id
 ffacd0b85a97d-4515b524014mr29080021f8f.10.1778383724802; 
 Sat, 09 May 2026 20:28:44 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6c79fsm16415778f8f.15.2026.05.09.20.28.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2026 20:28:44 -0700 (PDT)
Message-ID: <69fffb6c.df0a0220.37b8b2.279b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 10 May 2026 03:28:44 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778383725; x=1778988525; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=epaEjAlQYHYWnqQBHnwThNRyAKGc0r/FJ7i6GpdaDjA=;
 b=M9bKj5WsfxLDB7HsrnZV2Ln9pBuVBF89mIFvlUcLIUmpguwcPqmsHt8W1w5o2UNLkA
 LIl9cg0hke2xpOFppybFhu6jIwantmomRZ2+QR8XnyQPxmDGBeOaf034upd3khdysqJk
 GNcn8Gi1G61huKym2qs1wXdaCLrBKQm7qRLdnvaUAKfPCDZC0VXldh11nABEdY3DaabQ
 Fl1W2VY3HvesLPvgQhIdMXqnqSfDIdwUCerHAgHCMJ64INo9hjqIx29Uq95289pTR3Gv
 f0gKHmgxqeYj7uLrBrZYWQKA2C7p7p6xhkMFP6hzEt/5cg1EOX0D7wFb4MLW2KSMdfCk
 Pikg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=M9bKj5Ws
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-09
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

Autobuild statistics for 2026-05-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 36  |  0  | 41  |
  2026.02.x  |  8  |  9  |  0  | 17  |
    master   | 49  | 114 |  2  | 165 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
  gobject-introspection-1.84.0 | 4 
             libgphoto2-2.5.33 | 4 
               linux-pam-1.7.2 | 4 
phidgetwebservice-2.1.9.201... | 4 
glibc-2.43-22-g8362e8ce10b2... | 3 
                 gnupg2-2.5.19 | 3 
                  libnfs-6.0.2 | 3 
                  ntp-4.2.8p18 | 3 
                   perl-5.42.2 | 3 
      shadowsocks-libev-v3.3.6 | 3 
              host-guile-3.0.9 | 2 
            host-protobuf-34.1 | 2 
            jpeg-turbo-3.1.4.1 | 2 
                libnss-3.123.1 | 2 
                 linux-headers | 2 
            minizip-zlib-1.3.1 | 2 
                       mrp-1.2 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                    olsr-0.9.8 | 2 
                   s6-2.13.1.0 | 2 
             util-linux-2.41.4 | 2 
        util-linux-libs-2.41.4 | 2 
           at-spi2-core-2.58.2 | 1 
               binutils-2.46.0 | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
                  dnsmasq-2.92 | 1 
                 e2tools-0.1.2 | 1 
                elfutils-0.194 | 1 
            erofs-utils-1.8.10 | 1 
                flannel-0.26.0 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                   guile-3.0.9 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.95.0 | 1 
      host-uboot-tools-2026.04 | 1 
          host-xfsprogs-6.19.0 | 1 
               host-zeek-4.1.1 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                  janet-1.41.2 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.131 | 1 
           libmicrohttpd-1.0.5 | 1 
                libmpeg2-0.5.1 | 1 
      libphidget-1.24.20260127 | 1 
           libwebsockets-4.5.8 | 1 
                 libzlib-1.3.2 | 1 
                   linux-7.0.5 | 1 
                   linux-tools | 1 
                  ltrace-0.8.1 | 1 
           lttng-libust-2.14.0 | 1 
                    lua-ev-1.5 | 1 
                  mender-3.5.3 | 1 
                 nethogs-0.8.8 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openocd-0.12.0 | 1 
                openscap-1.4.4 | 1 
               pistache-0.4.26 | 1 
           python-html5lib-1.1 | 1 
            python-numpy-2.4.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
            resiprocate-1.13.2 | 1 
                 rtl_433-25.02 | 1 
                   swipl-9.2.9 | 1 
              syslog-ng-4.11.0 | 1 
                 systemd-258.7 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.04 | 1 
uhttpd-15346de8d3ba42200249... | 1 
          usb_modeswitch-2.6.2 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/57bb711f6978fed6977aded5de0c2ad9f153c936 |     
  powerpc    |        binutils-2.46.0         | NOK | https://autobuild.buildroot.org/results/2b2195b446de098d15f105a11dc7dc9b321f3626 |     
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/2cc00b468b09c1d6c51a30f04c72f77ed3c17390 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fd37cf49f3265d558bf903ccba1ba5d35e173eec | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b7f28e9a0073958edee50eaf2e0d7cfebd290279 | ORPH
   mipsel    |          dnsmasq-2.92          | NOK | https://autobuild.buildroot.org/results/9ca24bbf71ac8fb18b6712925577299d2ea1e5ed |     
   mips64    |         e2tools-0.1.2          | NOK | https://autobuild.buildroot.org/results/b5df33f1a092fcf1dbecee2ec3e82a9847751c14 | ORPH
   xtensa    |         elfutils-0.194         | NOK | https://autobuild.buildroot.org/results/e978dbd1f90f92d4ba2c0a2ea09a561b87f61f6b | ORPH
   sparc     |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/b6d4eb9df5907f619b0af46ced836a5bbfcc6d4a |     
    arm      |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/739aa9a25c4791bc19189bd079193d1864805f3a |     
   sparc     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/941e5f44327e2ff678d983c991f61c92851c84ba |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/306133474d6405dd20035e164eb5145874db4ff3 |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/d014f9019e97b9a00b38dfa3ae56bcb80dc894d1 |     
    hppa     | glibc-2.43-22-g8362e8ce10b2... | NOK | https://autobuild.buildroot.org/results/25006cd79cf04b3d6d77c0b852854fb4f1da9193 |     
   x86_64    |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/2f4f5d2d594b274c266d90896767f50335befc8a |     
    i586     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/bd8485c39e5b45c6ef29732f827d68f4ab25611c |     
    i686     |         gnupg2-2.5.19          | NOK | https://autobuild.buildroot.org/results/9353d4736d22cf69b3cc0abf9e85239b2cfbe4c3 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6673521ae916b43fff606389f62a379bcf0bbafe | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/08c2ad3ef44e98a06782dc8c9a1a27b9d64643f7 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/da2c3203bc5255dc9238b76b9d7c3bbc95130775 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5f9b3e3ea1ebb5a8cbcd7d713a0deed27650b156 | ORPH
  mips64el   |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/916fd91143c723cbaff6a6ee4f0eefb68ec3e6c7 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2c187a3647845717e57cf248b30173f26a2c57a2 | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/692169c061e93bd66fb0926c67e9e8ae9fcec9f1 |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/88e128c1bfce3f88b65e0e193dfdd23e47151177 |     
    m68k     |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/67b3029111d98f1874d4eee96aa0fe564984f65f |     
 aarch64_be  |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/6613b6650a2668e3337502d04767b2756f5d6fdd |     
   armeb     |        host-rust-1.95.0        | NOK | https://autobuild.buildroot.org/results/f72533da94af717a64afb8b1a1a5a37ab9a5d62d |     
    hppa     |    host-uboot-tools-2026.04    | NOK | https://autobuild.buildroot.org/results/0b0378efb96e077412843c18732bc2f6035604bb | ORPH
   s390x     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/12eecb83bf9ba46252e2e12f8d24940516d3243d | ORPH
  aarch64    |        host-zeek-4.1.1         | NOK | https://autobuild.buildroot.org/results/81482d8abf9220d177f116588314a71cd3ea7d0f |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0154e6b9af909dc309e456aa832ce66101f9447d |     
 microblaze  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/d60b9a29106f38d97e4d91e4a07d4c58bce0f5e2 |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/0d4d147a6f4996fa946645c69b50641704748215 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/ee72e408d9cb5ff4f760b1d0c37a4c9cb8df940a |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/b45424c949cc3e6f91825ec5cc4669243f356a14 |     
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c79692948778054421bde8f46383d592224ebcc9 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/74bc97d1178f911ca68b7041a9e3dac75c8a7864 |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c2c6b2aefd38c97c62c13f5a9ee1c8d5e925ec19 |     
   sparc     |         libdrm-2.4.131         | NOK | https://autobuild.buildroot.org/results/1276d39c814908a124bd1e95305736f5fca6c397 |     
    i686     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/7b25cf9d7825a837db8225916adec26326a5e7d9 |     
 microblaze  |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/436d39fa0b615a9b6e564ed5fd7f65890846c076 |     
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/407d5e74b79d3f331c26d566aeece9f929976842 |     
    arm      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/a73371af0d51443c0b88e74ca88a1730a512edb1 |     
  mips64el   |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/20298a9101b95aa70f042641896bdd99eccbcec7 |     
loongarch64  |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/2279a260841c643c72b378d0bd0267d339e2764b | ORPH
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/ca7673732799c027452d328d85b3b9a3b0832b7a | ORPH
    mips     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/86fcb5507c8e7ca4482d37df76e4bb507572f626 | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/59225c33a7a7bc2c6b23bbda7f5a96c88ad77069 | ORPH
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/f76fac0ce48f35f86fb86f7864fd934b1533c100 |     
 powerpc64   |         libnss-3.123.1         | NOK | https://autobuild.buildroot.org/results/a9fca5212435a2ce919a6d174cfe0b5692472de4 |     
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/dfbc73391cdb183c791cc7e32cee33aeefd668ed |     
    arm      |      libwebsockets-4.5.8       | NOK | https://autobuild.buildroot.org/results/3a8bef1acb7198c01a65416042a0e84c9d242065 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/f650aaccb57915fe0be4f39f64733e8d54951d81 | ORPH
  powerpc    |          linux-7.0.5           | NOK | https://autobuild.buildroot.org/results/4c1607edae726252ec64a375983b232b9032db1a | ORPH
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/3b5c1dc77eeaa7a6811696ac018923950ee742f7 |     
   x86_64    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/51ee0240734c232a49815586df1aeb9c7a28ff23 |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9ba4add15fa25d14679eaf4ff56d8b8e03ec2b82 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/67efe6ee2b8029543d74999e0cfe536dd1e4177f | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/510cb017497e85c9a90f5a505e68c9132b9f31b4 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/1810f654c1baef7e662788d0e8e24f6eed0071fc | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/22b02e701df2b5528f10bd6dd9bb1cbed045b049 | ORPH
   sparc     |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/90aaf33f957412ad93d03728b5b190f2c13ce1d4 | ORPH
  sparc64    |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/37b6dbb5104439092dcd1be92865fb269637b2dd |     
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c21f5db23279a9605d4b154c505264672bd2d215 |     
    arm      |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/b411ff925743353409a1d2bce5ff314abfa4f4c5 |     
  sparc64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/1962376c5de17b2d9c7c156328ae4b2827c86506 |     
 powerpc64   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/e7288035d6cc7bfb5ed78142845b09a954251e85 |     
   mips64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/5343eec8a93ebe2e979227e32b2ced971dd2aab9 |     
  riscv32    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/1be2ac50f1cfe282adcfd3cfbc1c4d319e7e14b6 |     
  aarch64    |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/a3e9a11ea8ed4b0027ef60affdc76c3137eb3101 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a8cd687ab4da23964ea8311411dc601afeda6035 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/825d2438c2bbe2151c44668769994371dd7e35a1 |     
    or1k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/7c70314d495c87b6ec2fd37a67acdb5893590e42 |     
   x86_64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/c832ec0e03ba5d2ebdba24148429824ff6281574 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/26e9add04ccff255a6585b7929fc17407bfb3cb7 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2bdcfc67af1107094e10792fa26bdfae93db381b |     
loongarch64  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/96969fe8e1d81f447f301a33146fe2dcc2391f48 | ORPH
microblazeel |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/8409421fd3b0dd219a25428a3e0f3c85f877ca49 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/528752472e4ea9c60c8ca7da1f05a758807cd684 | ORPH
    m68k     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/83faad73bbf56ecdf3f9baf203cf3dcf7cebdd81 |     
   armeb     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/591b10358e74d14c90e8ccc48a42eb464dc790c2 |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/25e25c0268a3524ffaae9077961afef36c5fd67b |     
    arc      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/97a429520c9a51501f42658541d32c1f933441d3 |     
  mips64el   | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/b85cc40b2d3402b23771db1415213b42a0009cb8 |     
   mipsel    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/c86558be116ab60759669a08370c957a6f2657af |     
   s390x     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/3a612948a76f15b4174b5e64796db7bd8aa62e8e |     
    or1k     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/78972e8f86a79ab0f4b5725e5cca84a2c4e520c5 |     
    or1k     |        pistache-0.4.26         | NOK | https://autobuild.buildroot.org/results/b107dabeff737fd127f0855504188dd1d6418f68 | ORPH
   s390x     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/ca482792e46b1fce0298df76daedb7e741a51ea7 |     
    arm      |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/495eb8eeda9445d141cbaf73af36a69458d08dbc |     
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/5cba209286a3cdbcfd1a062fae6c12f49ab3bd1e |     
   sparc     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/cdc9d0fc9429a8685a9ef7c821cb3e8ebe91bf80 | ORPH
 microblaze  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/6c4d6a582770453db32a31c977ff8b5106153030 |     
 aarch64_be  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/93313c2ab1198ac1517d4495d4614a274bc89164 |     
  sparc64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/2c2fee86529beee29b4c5e01afe5977642b9738b |     
   x86_64    |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/8f086b8805c3065945135e253bd691e2416bdbca | ORPH
   mipsel    |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/913f023490f64d5f07851524a8cdfe186d1dfacd | ORPH
microblazeel |    shadowsocks-libev-v3.3.6    | NOK | https://autobuild.buildroot.org/results/6d536de64272204068b659aa1c02eda1c698706b | ORPH
   s390x     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/825dc7b2c5af58c16c0447faf3c069dfb6db98c4 |     
   mipsel    |        syslog-ng-4.11.0        | NOK | https://autobuild.buildroot.org/results/4761f6e22ee98bd4fb945f2d4b7e376121b4dd78 |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/bb15d41f2f7a34c952ebb51eb59342f5b8b6fae6 |     
    m68k     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/92d6822f7a2fa3204102502971ec67e4dedd4220 | ORPH
   armeb     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/a6792a8e7a9e62b6f3098ab526f7add86b4cdbea | ORPH
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d356acf0f6ed52e733a5071ea7cac15844359756 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7e256a2848da10f4a3770e156ff1f2cde5881663 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cc4e43919981a4cd941a40dfd706b4c9e524bd32 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/6970e59bfe5b555c535c3ed78d04acd3fa47d8d5 |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/8ff30218975d67d26440bddf89299da50b181578 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c54cd7ff0aefd451dc8db933f88138fd74a4c2ef |     
   xtensa    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/45729fdcfcf9faee5af762c956085d87b904dab1 | ORPH
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/8badb2c07dbf86f3edede61ab739704de6c0b24f |     
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/2948da10b294663d34b83d982288b80cb4cad2e0 |     
  powerpc    |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/0df71763a13a83d12e0ca11f79bfa679b831d946 |     
   sh4eb     |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/de5183df161c3f8f2e740a8895cb7b044e7b685f |     
   sh4eb     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/aab3e47d8612835a0cd202bd60e5969885e2cbdb |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                  boinc-7.20.2 | 1 
                      fio-3.41 | 1 
                   guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
             libgphoto2-2.5.33 | 1 
                   perl-5.42.2 | 1 
                     pigpio-79 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/31b50d58bb0c75d7760cc5e08ec57da96a3965e1 |     
  sparc64    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/10729f9c4758423ce93a3dd8e8a7747df5bd3ad9 |     
   mipsel    |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/2eca93f5c054fba3b1f6e6cf63b64ae1b6f7d3b6 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/c9d61a2834aec615353d4b93fe338906db30f7ac |     
    mips     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/6105d89a5f1c3ae01d05e8790efff21ddf7567de |     
    arc      |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/555efcf05a7e9db5f1b5d7b66277834f838b87d5 |     
    arm      |           pigpio-79            | NOK | https://autobuild.buildroot.org/results/3fb1f93711fc2968239087836ff5f5efba3e6769 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9396816d4914480a3afe7dc4fd77887ec7d6c4a1 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a922498eccb89c52d9e11800e2cc2adc127a0bb3 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-util-linux-2.40.2 | 25
             util-linux-2.40.2 | 7 
                       unknown | 2 
abootimg-1ebeb393252ab5aeed... | 1 
              e2fsprogs-1.47.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     | abootimg-1ebeb393252ab5aeed... | NOK | https://autobuild.buildroot.org/results/9bd4e30ffd3e0f01757592c56df5eef2c5284447 |     
    m68k     |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/51acfa9e42649ee34bdb95c7276a6cb22b0b4d8c | ORPH
    sh4a     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e5fd0d5c943785c49b4da4ac973916430cc32d10 |     
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/2a5e7a71b4ecd7124321e5013c7e0fd8e5107a97 |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/dd4df2ff6abfc6b91f4f527dcc4bbdd6a780221b |     
  aarch64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/0a83d3274256d3d0799655989b556a8b99e56ce6 |     
  aarch64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ff8f266eed64fcc52e04abaf32a23f4a0401862b |     
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e3dac4134153736f6df940340f7b9ee6cab2be6f |     
    or1k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/be36724e334740903c57f00a79070986d3c9122a |     
   arceb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/b928e3a0de6f766cf1a71dc78ecf1faedf8d88bc |     
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/c1126e34314661b87b3c1876abf8a196302cd605 |     
  riscv64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/cc096c5c99d37b66050bb4bedf9bc42179d7ef6a |     
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/3a357fe82036d5d2fe78784d69c3fd36dca7d52f |     
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/34517183cafaddc582cec1abed1908674f03ca15 |     
   arceb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/662f70c8eeca728a212d36a185ad522d947b7880 |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/4f3aeb256bd59e64a618c9c456ebddac55add866 |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/fb779139f4b3a1cb5459c4f2aa484615ae087f09 |     
   arceb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/15d9154d03f48c902922ed35499c8ff828400c56 |     
  powerpc    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/b619b3cafe389da02f291e8fdf5777090193500b |     
    mips     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/487aa90b253d301733f0a1abaf18038aa9ecc968 |     
 microblaze  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/251a407f6fbc80bde4b6841034f713e21b4d2274 |     
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/186182f1c6657b9ec034d26340a042af13c77df5 |     
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/53ee94ff72e40d639747c3d3ed9ae6d87de0287b |     
    m68k     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/7fe09773befd6ca487ddad4c3cf144b56acda711 |     
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/11370e4dc3542c7450ee3e9723ff93622241c388 |     
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/eff3925732446cbac138fcc00ea56ed4787405b4 |     
  mips64el   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/eef940a419586732a9150a917fc467acc8a9b767 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bf7fa3ac993e34ee43583a80482da7f62423a205 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a8d591d3e411e8b8649ca524e10f72d63019ba4c |     
 microblaze  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0b43a495c2823edb65351f126c8ff6d893c612e4 |     
 aarch64_be  |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/18e129580cda967c877df2569a293b2960c23096 |     
    or1k     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/71111aca30cfd4ea083f390f090ab7659d16eb40 |     
   s390x     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/8dded3883745b7d7cd9df0f9af6b671d81085d9d |     
   x86_64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/c3b7d09cb292217f22ec04f2ada6c7cdbfc6d602 |     
    or1k     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/47d6aa59df31147af32f201615b01c8f1b7d79b7 |     
   mips64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/f1b3d8eb722836fd25b32ec62fa9159cab0e23e7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
