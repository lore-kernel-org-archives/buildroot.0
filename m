Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A8ECCF9E0
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 03:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BFE833A3;
	Sat, 25 Oct 2025 03:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GePb0C1yfj8i; Sat, 25 Oct 2025 03:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE1083337
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE1083337;
	Sat, 25 Oct 2025 03:21:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52FD5D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 03:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44F2A83323
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 03:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6fObxac4FhH for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 03:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DFC2832C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DFC2832C7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DFC2832C7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 03:21:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so15954685e9.2
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 20:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761362501; x=1761967301;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mWP7RJ0BZzp5YMUCw2cA0juIaIWnqrp1wslVLjeLEaA=;
 b=OUX1XYkDHbCWJuQ0+B/FA9L4iL07QSqs47lLkaTte/5YyLosPcum0OhnqycJWEYgCW
 xIfVwDpTmVbQRFAr3CPxnI1HJN3xboK8BC8JtJhWzukrTAuH8yP4wQh+0N2UOKUuO+L8
 jsC3hrrbzyITXI7GjNU6U0xD6LD/fxgimnHFkKIcuiGfTG/catMhiZwciqsgGqUplena
 JU3rNpEUmeMimfbGsZDdXuv+MzEm9Dwlk6pQJZsVwH2EyAYkGNBytO05PAvYgsc4vy1v
 tWHPWBHPMWUeuKmXUILTN7rMq8lNDKrXsYxpoPsV2X6GEcdsmyIyzAHbYDN5Cs4QNgm0
 Q4uA==
X-Gm-Message-State: AOJu0YzZFny6fC3/wLXnm+gQkXA+2uJYgiTpyuQgysejiQd4wDIJTstE
 lTTh/igFT9OjqRsOPnlQ3XZByDAQ7qHwSAP5YiAvRQnqKvU/hryJTQn9Rl4/wQ==
X-Gm-Gg: ASbGncvBDihu7SeCS1Ye6aUAg8Nwhiyg12XQPCfM3XbRJjPoNP8P9C53Y3FtLBzQln4
 qn5fGQbJ8mRCKQloePJzIxX3TSp8SgSiQDyADXAAZzNdytEG7qGdVcJYPGj84DtF6wZCO8VH447
 6VBmWwnMXrL9Tf52JtL1isycJG6mdbI/HW4tfSNYUaT+v8o7fdPgj5VMI0tvrEczYOR3Mt1oYjs
 vULzsiJ3SmPDiyalrzc64RtBAzQQ3viLjbFXzF9C1CqlrugXX+abBer+HxIYvX/5gJ64gZyuWcI
 nNcuLMxrCkX1dNtRrfbgCMixVkB78nb6wDhGWQmS6gzrdEjOWTlv/ZPjpyU/XqsbEI8jBOOfXG/
 Qvg3cNnVs4KRfhlRjCR748NjscGUKD2zk0bWjdlyvmqetZirChvxvbvT2uWufP6gBDRxtXBkiW/
 9tA97dhFj9Ye2qwzdbXA==
X-Google-Smtp-Source: AGHT+IFMM1kshGuOaplo7KTFzyKWDQUtaqx6QfuOnvW1uoqTDIvQObQbOxaL/ZZJNuKkL2pzthnJ0w==
X-Received: by 2002:a05:6000:22c6:b0:426:daf2:ee36 with SMTP id
 ffacd0b85a97d-42704d99493mr20391897f8f.41.1761362501057; 
 Fri, 24 Oct 2025 20:21:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da645sm1395670f8f.30.2025.10.24.20.21.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 20:21:40 -0700 (PDT)
Message-ID: <68fc4244.050a0220.262d77.2fd0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 25 Oct 2025 03:21:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761362501; x=1761967301; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mWP7RJ0BZzp5YMUCw2cA0juIaIWnqrp1wslVLjeLEaA=;
 b=aAtIpvvWdufmsdLHFpMcjSs7XmYrhZYhis2hvBJCPz0ny/H5Twk9WUw7FumpWkzLzE
 lAzkcOCO72XtBOo8ONXGQMZXWbBOHxXbYi+AnNxn+7V+z8MjCnx/dRalT/ReLlYDPmua
 JKVZAJnpkfy+dwIIEbsY3oLBiG6ow0pFlY9U7wF/2ZdeYr5AwSTw2BYPVoi4OoRjX83s
 L6FwzwqMT1Nztt9VxdsRbuCygNqw0MqEuXyw4pDqtRPX5BR0ixXOfqucQ+gr51cbLGcy
 3igYEemryEPmShk5C6HvalPyo4kF0N62cMxMYi/5ftN87+TZz+mjfZWN+IhXAnXog2Sx
 7d8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aAtIpvvW
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-24
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

Autobuild statistics for 2025-10-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  8  |  0  | 13  |
  2025.05.x  |  5  |  5  |  0  | 10  |
  2025.08.x  |  1  |  4  |  0  |  5  |
    master   | 39  | 85  |  0  | 124 |

Classification of failures by reason for master
-----------------------------------------------

libdbi-drivers-0bfae6c43134... | 6 
                    mpir-3.0.0 | 6 
                       unknown | 4 
               bctoolbox-4.4.8 | 3 
                   cvs-1.12.13 | 3 
libftdi1-v1.5-62-g5e67403c4... | 3 
                openocd-0.12.0 | 3 
                    brltty-6.6 | 2 
               host-runc-1.3.0 | 2 
                 libiconv-1.15 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  linux-6.17.4 | 2 
               linux-pam-1.6.1 | 2 
                    sdl-1.2.15 | 2 
             util-linux-2.41.1 | 2 
                 apitrace-13.0 | 1 
               asterisk-22.3.0 | 1 
           at-spi2-core-2.58.1 | 1 
                 babeld-1.13.1 | 1 
                 c-icap-0.5.10 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                  dpdk-24.11.1 | 1 
               dvbsnoop-1.4.50 | 1 
                enscript-1.6.6 | 1 
            erofs-utils-1.8.10 | 1 
                      fio-3.41 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freeipmi-1.6.16 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-14.2 | 1 
              host-guile-3.0.9 | 1 
    host-llvm-libunwind-20.1.8 | 1 
           host-openocd-0.12.0 | 1 
            igh-ethercat-1.6.3 | 1 
                  iozone-3.508 | 1 
                libglvnd-1.4.0 | 1 
             libgphoto2-2.5.27 | 1 
                  libite-2.6.1 | 1 
                libselinux-3.9 | 1 
                  libsvg-0.1.4 | 1 
          linux-5.10.162-cip24 | 1 
                memtest86-7.20 | 1 
                      nbd-3.25 | 1 
open-plc-utils-1ba7d5a042e4... | 1 
                openssh-10.2p1 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.40.2 | 1 
              php-xdebug-3.3.1 | 1 
                python3-3.13.9 | 1 
           sane-backends-1.1.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
toolchain-external-bootlin-... | 1 
                   trinity-1.9 | 1 
                 xenomai-3.2.5 | 1 
                  xl2tp-1.3.18 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/517aee068488147198d058f9e7a7dbb624abdfd2 |     
 powerpc64   |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/acfb206e1128a45389c366d1c3b184f2633db018 |     
    or1k     |      at-spi2-core-2.58.1       | NOK | https://autobuild.buildroot.org/results/cdb205cd001e2f5afad2c076e349ba282eea7f9a |     
loongarch64  |         babeld-1.13.1          | NOK | https://autobuild.buildroot.org/results/b0d7c61a4a01699bb039de87c890ae5da74d4917 |     
 aarch64_be  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f5c6ae2f37fed28ae08cc161b167b82e04c265e4 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/64e970eee4a957fde8a43f2ec2eb8be55e171e17 | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/5e72b33ba69e71d7f27e13faa1342ed1b6063dc8 | ORPH
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/b4190f663622ebb0fccda92ab41209473ba79ed3 |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/3c77f846e79bd1ebaa18b88c5c62c65c0b44beed |     
microblazeel |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/ac0396a6e31994602ea6f260ae90a98a2c742f48 | ORPH
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6aadec41449a578a03110cbbaad6d16a5d45ddf2 | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/fefb9a3cd587df811b9e834fa4f29f38a3b44f94 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/22c932e319c3b388fbb96fe3392582b78b547506 | ORPH
   arceb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/366461ebe503073e1be5ed92b5590752d8da1ca9 | ORPH
   armeb     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/9147c9e5a8fb3d17743ea1cdb3ed82cbc05943fa | ORPH
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/cd5fce659782f866ef0df5ba8dc2fdfe6cadaaa3 |     
 aarch64_be  |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/d96c8ae98cdccf20548759f6118b8282aca9471e |     
   s390x     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/7fdda216e2ec57b9bcc1d2613b6546db35a29749 | ORPH
   armeb     |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/011e3a4d7cd54a192dcc33890708806442f073d7 |     
  riscv32    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/e38f379058af99abcceffa67fa4847d28f5ab878 |     
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/44124be4724ed4d52aa0e1b34beb87f728bb8f63 |     
    sh4      |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/bf4633e82d539f089de554b8ce3e1bbf5c339484 |     
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/e0a16c586ba7d23fbbde2aa006d71d93eec65cbc |     
 aarch64_be  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/70c5953225fb71a7feddf769f44a049a86ece795 | ORPH
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/59c4c12f172f8d0a5c03f06f1723682363796467 |     
  riscv64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/cd5d65e896bb5fab3497c479b74fe3eda266eae8 |     
loongarch64  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/43ef1bc7a169139e7026aa29d1e1198f1b68bd4f | ORPH
    or1k     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/3de8387195d53bc187be9df44407ab14ceb712b1 |     
    arc      |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/6b79267ef27a6b1396c35b23c70fd55f591962fd |     
loongarch64  |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/a456ab840d7a7249be34da2d8e0e0f271a32ac79 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c490248e4fb6a839438881e84ef66f9e9387458a |     
   mipsel    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/fb5b7a618d48e1ad57c660eed8e6e5877c1a6584 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/81795b775dcd6ec6c1c92d55505c9d7160c7b39c |     
    mips     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/19ca3d5729b7ab0240d5405c479346218af30077 |     
loongarch64  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/0de299cea91a83f21082cde4e679243dc769aa82 |     
   x86_64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/711f0c68cddbe09994401ee7c278de7335763caa |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f804988cf6faf1e5c1341acc29ed89b522213294 |     
microblazeel | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/14f7fd109164324d6fb614bb2e8aa56ef647c679 |     
   arceb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/813ef7d36734219508b75635e4770eeaea3e5404 |     
 aarch64_be  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/08f8b62246286c455749d37e43b7f7f894ce2493 |     
   armeb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/907125f1ac28e3c2fbc9b580c5b6598871b3d67c | ORPH
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/169463bcd25b967c407dfc19b39ffaff48f11d97 | ORPH
    arc      |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/3875466a80e57dfd96911a2166e496cf7d41bb69 | ORPH
    arm      |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/f902226aa582ad009ff5127123abca31f95b44e4 | ORPH
    m68k     |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/fbfd6004cc7251edd22c6ee9a177c2ba3a6adf6f |     
  aarch64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/f9f1ed62c276f742e1d6ea80726a5cb486409bed |     
 powerpc64   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b5e104b48a255b7023adfe2ecb856df29150cfee |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/d6cbbfdcbebe985d743232070824779e790aa5a8 | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/bf5c40ba9423b101d810e316f4db48133025e1b7 | ORPH
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/ab44a8f7e1910789603ce184fd774df42c65a020 | ORPH
    i686     |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/aa78ca7062ea70e52e0ca0e480ef2fe218911334 | ORPH
    arm      |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/dd5581dd2861d5ca86746a5aadb34d1dad9a5c0a | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/111766c8cb5ee1721bb90b544c036ccf5d9f3c98 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/dba6b3655af515694d9934080ed1ad5187c9ef60 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/b20bde3218e66e0b80b9ffe0199ad455778f3080 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/74b14a130346d2db62afd5877263032a1e9134ff |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5dd498d1d5662d623c460cfbeedc817396e6200d |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6987a6051ecd51b402c0ffde95d1d393feb04dc8 |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/347dd299d19a83d4c34cdab5f76b8e71c0fdc352 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/5d42f06b65bcc53f43a7933a3f4f5404ebe84e1b |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b8ea0f3d3c0e5a279e947025b05ea84a25e5de3c |     
   mips64    |            nbd-3.25            | NOK | https://autobuild.buildroot.org/results/de4ce12316126a54ffd0fbee41cbbcc78e323da3 | ORPH
 powerpc64   | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/57074e27dab6bab33e5ab60b37d03748d0c52380 | ORPH
   x86_64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/4f79a456d6e88e33be2a279e5288debd1f27c183 | ORPH
   x86_64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/ffada322418deeff9da81378ef089c81b91dca86 | ORPH
   arceb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/56a46ae6b36bd438fe75a32f1f3a5c94cf01a8e5 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/2e85b7250ff761a666190620a67e0b2270af2676 | ORPH
   s390x     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/3ca78a85320509eb8281f2d458659a62bf38ce1e |     
  aarch64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f3d744155a8747ee83bfc824b5cac095452d9482 |     
 aarch64_be  |        php-xdebug-3.3.1        | NOK | https://autobuild.buildroot.org/results/eef1f268ce922e8c81e4654316cc83775a60cf22 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/470e351f727fff00fcfc3c45ba24704df7f133ad |     
microblazeel |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/99543715a78a600f22d2e93f6a99a572c9b2f0ab |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/6de2eafd5f2cb3e3b4f45d374c72315bd8f9d379 | ORPH
 aarch64_be  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/4dc0c309d8e55172999de2d707381b611ddb7011 | ORPH
   mipsel    |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/e1953f1ac35c45a949e57b473d4dbe8df322dd6e |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/f4d6b9b6e3a93e920a9ffb4c67e82a1b7aab1f7e | ORPH
   x86_64    |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/5e09322fa881a6d8a3556d1a2d98eda7a78054d0 | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/d6c82cab792fd5f2977e6c3c0cfb07dba71d8b9b |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2350066c1ec39ee6fe5cb1d63265613a329ab734 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/fcda07e176e036084ead8f8dccde1807baa224ee |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/762539908dc94e4e64cd49d35659ee5522a8f4df |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/22e9066093cc193ba63821f5511372973dba4285 | ORPH
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/dfa529dc5b24d082486ba15d2fde2f75d7efa8a7 | ORPH
    m68k     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/b4fb31f4b2bcc9494bd32401517636f9ef35f1c9 |     
 powerpc64   |          xl2tp-1.3.18          | NOK | https://autobuild.buildroot.org/results/bac6a0cb3f38b0de5b0376e7eba5e0ede5fce589 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

           dmraid-1.0.0.rc16-3 | 1 
                enscript-1.6.6 | 1 
                setserial-2.17 | 1 
                 siproxd-0.8.3 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/a9a86563b01bbf1cdc361e6d750b621fa42663ef | ORPH
  mips64el   |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/fca2d2c9d4c2547cd0d1f0661b06dcdf8e1fb938 | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/466423f38a2566a51d16c50f15b4634db43dcc8a | ORPH
   s390x     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/aaffd27d8297d91c188b6970153d905c4553b78a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                haveged-1.9.19 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
            libxkbcommon-1.9.2 | 1 
          linux-5.10.162-cip24 | 1 
                   perl-5.40.2 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/aa9bc59e2b3d5bb63cfa4edbbc2abf25faa06f64 | ORPH
    arm      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/3142d9c733c4b350d6888d886f2904217230e78f |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/1b18908c36acf22d3d68893291e560a91dc9b7fa |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/df4eb64bfb529275362285cc2fc148dcf23e11ec |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/d7dedf75608f9606d9b5b788d1b7c45909c17c77 |     
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/449f933c29a1d2e22c9e521ab99567e404468e7e | ORPH
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/69611aab1b2c5326d8f559fcc840779fbd24e538 |     
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1cc4989b5753b238b5a2dfc55d6ccbfb6772a480 | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 2 
                 coreutils-9.5 | 1 
                haveged-1.9.19 | 1 
              host-rust-1.86.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f32e030b14d7d93495c0d0484cd922add2d7c27e | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9a6f098da9eecda76dda8a356c86c29b6d3939f0 | ORPH
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/cbedef983ee41621ee057f5bced3c6758fa04118 | ORPH
    arm      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/6aad80837c3b0314eff3503fe24757eacba5e48b |     
  sparc64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/87b03de2a0f2f701ffed3d51e6a3a5efec922340 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
