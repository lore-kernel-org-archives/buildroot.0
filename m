Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F04F531EA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 03:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D123428C6;
	Tue, 14 Apr 2026 03:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEtfpnLzRkfo; Tue, 14 Apr 2026 03:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3478428C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776137206;
	bh=JOxVDtSBj7WFudODNulPn1j5CE5i/LsyC2wwJ/Pjjto=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gqf9zIf7iIt+CpPmefZ7YJ6hXKgjyz2SgqhfFQsX89PcE13+8Z0v6VA0MSU1B+vsl
	 FG4CiSu5fag/QFn7syYPHaw2BO60/D+BqggCEOZze5RRAueA+cBCyLIESnxP2bBMFB
	 9xzLrXDNwo28HBFhsBd/EliwnnKn7Fuv3reA5AB62M2NsG5gDfQQKSCx3xkqlEBpm0
	 ouS89GhdjNDELveuFZsIeN2y2/7dInskjNOw3FwU2DWFyhN0JNePLyzaSrni5M9Btw
	 qdIwKja3zqPezz+KqONirUdqM/FNwUc66a3jC5NU46nUwaWi2u4k/OcLE0W+AF7Rsl
	 1WplHbHHeDYJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3478428C7;
	Tue, 14 Apr 2026 03:26:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9040E394
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 03:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D53C849D1
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 03:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o32sinkU0Zti for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 03:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD0238111D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD0238111D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD0238111D
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 03:26:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488ba840146so48905205e9.1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 20:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776137200; x=1776742000;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MSTuP7EgfoxCJs7dcGd3C9GTxltg1ShrppEkW7K80IM=;
 b=JCZFre6u7+wFq4WMqFEnN9RRR7WYTORyd+kx8CKgv3Pfz3+Q6854Jgek59+pBb6Grm
 0wtLDPtRReHlsSIuvRH5MnEeeIQDJLJR9i6vIIs9XNDtO+UhAvZAXWxblpfael/wVzxj
 NWZ1G2hRmV4amE6sBsmHI4mwDqXf8Pf0oDhMGrcAwtb81sl19P5IG0dbapEdGV9a5G1V
 FxNvewbzPGhqEjDocOlRKezAPqGUiYtcuzzxDBbW+/lS+3O+LAHb2010ydLU5Ahvn68p
 GSt5ZYu39zcipxdCfKCgnimmGJPSSbPVe/f1zTzo/5oXXQL8PbfkF9cvud/Kg4B/syA7
 CaKQ==
X-Gm-Message-State: AOJu0Yx50PXYhtr32P0nOofVEVY3/JOXH5pzuQGMXt2Wh3VH9J9vc5Oa
 cWvxw7Er2RD7UzdliqMNqf6WWkrBVE/At1CfAnrn8htzCSRLMVnMXD3gnfe3wfU8
X-Gm-Gg: AeBDievOg8F+qHmNwfg1XecRDc7E0rR55RgsoYsnxG+oQt6FfdTxFznYTiQqApvbEJ9
 carKvZ3tsqJ7fmt5RFArbCSDPZL3txzpKiIbkfxzy48d+loOKhiBD7d2h7ictdVGHxe0xC7jTSb
 cWdjD0/47Q+9ubxF7TcRFEMLiLMJcoToHy8Wu6PU3VoWi4XV44vhRtvNOTOxyxk4vt1CTTFcMrV
 Nni0Lb4aDrq0apXR9UIrM5hKjWjSPwq8C5f1EYvp/J/AZnHUd62j5AKfOCNTykz6HTlrmd2m3wL
 C4bS6bZYanoFjyHdGomKRlTDtnkGI+Lxh4oCrT2dcpYG5mbtxbO7tS8r6aAAZczMVTog5YUgPdb
 YKR+kSDnNtnvrQZIdWYu6S1kFV+7YV0C4d2KcmVGWKUE890kvIWl5dGOOzeDXTsVMav5+NrWoNL
 10Qu8EIHGgLeg7Q/CPT53o/SqIRrAtPcCdJlSMueuz
X-Received: by 2002:a05:600c:3b0e:b0:487:20ee:bef6 with SMTP id
 5b1f17b1804b1-488d67e65fdmr212698985e9.11.1776137199379; 
 Mon, 13 Apr 2026 20:26:39 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5d70315sm115740455e9.1.2026.04.13.20.26.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 20:26:39 -0700 (PDT)
Message-ID: <69ddb3ef.050a0220.c8a22.5672@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 14 Apr 2026 03:26:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776137200; x=1776742000; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MSTuP7EgfoxCJs7dcGd3C9GTxltg1ShrppEkW7K80IM=;
 b=V78GfFhlWVdi3ITi8wqSpe9UEGJ6aZX2s7W0ELlaIv8kttl7BCa13xufrZ2Lr63G4R
 NPNrqwM2YJvBOPcEByS0JAolhZHEyiovA7sA1eNMNbc6oVHutT2GN/dYAKUFqrC0wf0M
 W5xU6J+g5tzo8nEf+bsq6zk1T2AUKE+2ueJpA3No3IyLIhsMQulZKvAMxlqA6ZFnSNnj
 eCKVQSDUUXqA1RtjRKZfeIZDJa7hZMuXl18ISz29f/If0mZ0JzjKQshwKx2MvHUVnjjP
 q7pbqqpDN2DPIGVX5PMVLjpkrO3ZZEgtOqkJuYZKpGNOTDuTteG3Rr/TZ8iU31P+06vO
 cKZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=V78GfFhl
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-13
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

Autobuild statistics for 2026-04-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 13  |  0  | 30  |
  2025.11.x  |  2  |  9  |  0  | 11  |
    master   | 59  | 84  |  0  | 143 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.43-17-gdd9945c0ba40... | 5 
                flashrom-1.7.0 | 4 
             dahdi-linux-3.3.0 | 3 
                 host-gdb-14.2 | 3 
          host-xfsprogs-6.18.0 | 3 
                   i2pd-2.59.0 | 3 
                openssh-10.3p1 | 3 
            igd2-for-linux-2.2 | 2 
odhcp6c-f19dd37fb467c9cf10c... | 2 
                    olsr-0.9.8 | 2 
                   perl-5.42.2 | 2 
       shadowsocks-libev-3.3.5 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
ustream-ssl-5a81c108d20e247... | 2 
             util-linux-2.41.3 | 2 
                 wolfssl-5.7.2 | 2 
               asterisk-22.8.2 | 1 
                   dante-1.4.4 | 1 
        edk2-edk2-stable202602 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
                 gnupg2-2.5.18 | 1 
  gobject-introspection-1.84.0 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.88.0 | 1 
          host-tipidee-0.0.5.1 | 1 
                     kbd-2.9.0 | 1 
                  libbpf-1.6.2 | 1 
               libcgroup-2.0.3 | 1 
                libcurl-8.19.0 | 1 
            libnetconf2-3.7.10 | 1 
                  libnfs-6.0.2 | 1 
                  libnss-3.122 | 1 
              libopenssl-3.6.2 | 1 
      libphidget-1.24.20260127 | 1 
                libressl-3.9.2 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                 linux-6.19.11 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
                       mrp-1.2 | 1 
                    neard-0.19 | 1 
                openocd-0.12.0 | 1 
phidgetwebservice-2.1.9.201... | 1 
                     php-8.5.5 | 1 
           python-html5lib-1.1 | 1 
            python-numpy-2.4.0 | 1 
              python-xlib-0.33 | 1 
                   s6-2.13.1.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
                setserial-2.17 | 1 
                   swipl-9.2.9 | 1 
               tcf-agent-1.8.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/2c10330c0e2ef18bb7930d2bbfdceb80b6d4e656 |     
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/509be04e83a40a51987909408a621ff290ae7410 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/16b16ebf3a4dc5e02a03005c059bd5dab382d023 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0d296f6c7682f40ff6ce2c165d1e966c22236c3b | ORPH
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/700b63e1a9f970a2f88d8082055b5bc2d68f4f24 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/e3e72e5ee518f6d3aabfd5ada1ad63f474c4d6a2 |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/60e7527882d47363e4211cbb9effa7c05d780069 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/29585a810cf46a7947506349f4bead26e8f8e002 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/bc887a44d7808c416ce9ead85471591378bd7137 |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/e2ec22bf9d6a9c9fe7f30a9a5ade7e6789b072b3 |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/efbea81c2c12b6189fa20b274806e6ce1bdbd7ae | ORPH
   x86_64    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/73f7b9b61c2b1d387f5d417d73cd539b039e3420 | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/b6d0166ba8f331d00a0494c1d3777809d5f52f1a |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/973b2be95eb6b5ea30fb32dcf5590c4038f62010 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/9932dc0d9a6c9cab842ab353f18f01f401ac7ce8 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/a0711b6ce7140c055ec42222bd9218a612bb075e |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/1f05584e5e5ff4c01bf0762dc8d0ab1da4b17bf5 |     
powerpc64le  |         gnupg2-2.5.18          | NOK | https://autobuild.buildroot.org/results/05fde0cab4884eb5a4398b31c8b90416d7dd6a3f |     
    sh4a     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/99cde7d0894b596fbeb912ab6c578e1821d3fd1f | ORPH
   sh4eb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a3b78163ab73ee0d0698b32d8155f857c4e72af2 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/b081637d23be4fb0961a9191ccc7efb6aeff2341 | ORPH
    mips     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1fe0b1d2a93e41b1730cd1bdcc798f61d5623e9f | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/6e0588b007d47c3091828f367a8064f52a487efe |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/c0fd40662426b4d0a326cdbc9b4f6b29e4a7a7c1 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/18741653a04d9aee00fa73aec915f13b4bf658fa |     
  mips64el   |      host-tipidee-0.0.5.1      | NOK | https://autobuild.buildroot.org/results/76ae72c5ffd9493cdcfde90db4de66bd20a0bedd |     
   mips64    |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/473963998c710fc968872f4d0f7e8feb4b2e7c40 | ORPH
   mips64    |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/2697b3b1418a431f774f42d837ec1f1c1cab1b97 | ORPH
    or1k     |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/e603713e4f78bd440ecdbaace3ce4776ac619266 | ORPH
 aarch64_be  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/17f2c6970c7e501a7d85321290b7e43133503db9 |     
 microblaze  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/d48741b817d6428643a922755b3c4d568b627fe6 |     
    sh4      |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/3dab40540fbfb571860bfffa0b0426567931638c |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/58862820059d92325729b489e02cd5a75b457476 |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f51aa690a48209d08d69c109c4f6957181d8faa3 |     
    arm      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/98f9e352fd25967515e389b6026c37acdd71d81c | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/71cb09a3e986e118afc97fdfc9903e4206ff37d2 |     
    i686     |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/9623412ddac8b253e60605821efd051be5e9e053 |     
  mips64el   |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/f1eb4c3a57e5a595ac7e7bbb7da3b7939c537bb6 |     
    mips     |       libnetconf2-3.7.10       | NOK | https://autobuild.buildroot.org/results/3025dbfe5ce966b3aaf492b594224265b0440c62 |     
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1511452cb58b760fa1f7ba5a580046cb7ed16edd | ORPH
 powerpc64   |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/9d8afd884d3a2f3b999fb6051c70fd9f09e487f8 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/76fcb294cc9af60c6163d36bc16a128bd5c753d8 | ORPH
  sparc64    |    libphidget-1.24.20260127    | NOK | https://autobuild.buildroot.org/results/9ec5a5b83af1c75da5d02c3dfb6ecc461adb24d7 |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/9129325961971123105ae1041d8eada86e36a80d | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/094af1ca29b124f6b841790c738c6ba78d34d52c | ORPH
powerpc64le  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/fc465fcbfc297a36abc45303d863594e6ce2477f | ORPH
    m68k     |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/218a6b804ca52c36195c30e9ab5def1774a18bc7 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/69cff1de1a9d90958b9a6a935376f8924b79a806 | ORPH
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/738b3f40aba193c900a80e778a0dadd00f1730e8 |     
   s390x     |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/644cebdb1533c39e8fe4daed5d51eadd74db9139 |     
powerpc64le  |           neard-0.19           | NOK | https://autobuild.buildroot.org/results/65e423ab89f75b8dcd0ab3959b96e723bfcdb995 |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/195f0e455037f4011b06e8cd27fa14d190aa07b8 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/99c52449f2df358c43aa040107363773b2945383 |     
  aarch64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/5f51eb2277c4fef4e0074eab2779bea1bfc6b480 | ORPH
   mips64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f51389eb41cb12d6b7327e09d28e5399b892dedc | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/44b1c51972d89ec2a8b877b10439c61d22455016 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/f3795760d78cb2be5cddd1b9ded33704575a5560 | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/cbfbad68eba88b420fb913322ce855a9ac83fb4c | ORPH
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/1dcdc5f07438ae62d4398a9289326b60365ac288 | ORPH
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c6a3757d6fa8c4b1edefe1ce51110876a7b299f1 |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/9e88a27962c3885b6a659b107d8bddd9e90316ee |     
 microblaze  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/460b8838cc9ee69d2efdd9df87972d5ddbb25b0a |     
    hppa     |           php-8.5.5            | NOK | https://autobuild.buildroot.org/results/a94845b8bbb9794d9e13cfbbc7054da415b11bf7 |     
 microblaze  |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/9c791ef47a0b7201ff630c38bf5e0b9f1bdfc28e |     
  aarch64    |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/f8d5703924b92d916c9b5f7a37dc3c31d9f0a86f |     
   x86_64    |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/bc9e0003311ef6e9d43475d924016880839918a9 |     
  powerpc    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/ae719426e194641141f6f5382ce3b83ef0035bb2 |     
loongarch64  |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/4af98e235b815ec73697d2da52e45bd0fa735779 |     
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ba24c3b42a28bde1d8eeb0d62156a5a8186fe3cc | ORPH
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/a44d920316c48c2ea88c0f77c124d3ddc9e917b0 | ORPH
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/e8f003809ac01d9df021141412df2316211f0313 | ORPH
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/7e7ec9867a2464e806cbc7b068aadd480d52fd97 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e43ead3a7a7e05a339415a1a7d313757a0d80301 |     
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/ce0573158cb36d37edbb5d4f3dc2ede24d1c053c | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/ab91d0ba3a3057d3621a753a2aa7fccb12e940c8 | ORPH
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/3c6a87f93e5ac029df4cee417699b16a27ee3768 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/18247c68366abeb6ae97f05d46ceaf0f5a94c592 |     
microblazeel | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/b44c8376e5d54045cb117dc9c42ed4e3b781eed9 | ORPH
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/85ecfb062e52ae79e53d9a056d97d54f15f94172 | ORPH
   armeb     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/ac2bc633db0c605564c79bfdfa0e257a9b4f1b28 |     
powerpc64le  |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/54d4f380e1ab6ac16acd55c365a1bf9c963364fa |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/f83c4f8175752b03ae4a15b9288a25308009bfc4 |     
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/e92f12f4529891c49d884eb999166cd9f31f0fc0 |     
   x86_64    |           zeek-4.1.1           | NOK | https://autobuild.buildroot.org/results/0227cdc337fe7cbb19d9b88b2c3d890c6a3ee347 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

package/linux-headers/linux... | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
                  dnsmasq-2.91 | 1 
  gobject-introspection-1.84.0 | 1 
            host-go-src-1.25.7 | 1 
 host-softether-4.30-9700-beta | 1 
           sane-backends-1.1.1 | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/4c1cd422bbd0759f7c81bdc3664e683ddb1def3a |     
   mips64    |          dnsmasq-2.91          | NOK | https://autobuild.buildroot.org/results/d801c2dfdf74064ad9f6e38092b702a2719ae78e |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8912fa7a2a9db00456424e84c249752a46c0cae6 | ORPH
    i686     |       host-go-src-1.25.7       | NOK | https://autobuild.buildroot.org/results/6976718486bc0a57832b8a4965f3e6cb723e00ad |     
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/fb0986a90b1336c98851beec96cbd908e1a23b7e |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/bd9efca43aa500e953d68db453a953b508d2fb14 |     
powerpc64le  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/580905d34a245a82dd6e75714abcfde885874275 |     
    sh4      |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/390a79ff7984c98fa7f29ccd72071c692c9e4372 |     
    arc      |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/c4ad2c80963e4f4584da7abcb3aa960922be64ab |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libopenssl-3.4.4 | 3 
                       unknown | 2 
                   exim-4.99.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
                  liburing-2.6 | 1 
                 libzlib-1.3.2 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.3 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          exim-4.99.1           | NOK | https://autobuild.buildroot.org/results/02d05cff912a180a35e1d347753f688c1ad0ef30 |     
   sparc     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/bd7c583ea5818d79fb5370ae36a9c7eb23838aa2 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/53c27c5d2419bf43b9afa0f0655f97473567017b | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/ae1f2e1d6b74af553069824df9bc7d11b4e28c25 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/5124dd641aead4471d2ea0b4f627a5b4224b4262 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/ecfb34a9ce3013aaa06e8d6cc95684293968ac5f | ORPH
powerpc64le  |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/42fe32e9928204575eb4270d7d9481a80202b8a0 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/0d50e81dab7117dafde4168559f442d05a2c7eda | ORPH
   armeb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/77db05f61538de8c920e0b81e6c16bb33cd8f94c |     
   armeb     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/6d8ba78995a33ce18d8584819a3092390cb9f1d1 |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/a8445faba5dd178116378014e0a84266acf2bbf1 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/87ff91b52930ca28feddceaa7f40657f6019473e |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/310fe2fdeebcf9d0080e352741cd539ec95f7a3a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
