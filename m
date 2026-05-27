Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B559CD5BD2
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 03:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E86BD41E71;
	Wed, 27 May 2026 03:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqfFlPNzdrNn; Wed, 27 May 2026 03:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B8CF41E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779851881;
	bh=pJNnDvRZm9lo2no7zNv1UY1zTWjNsjKq7kh+FgptuyI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DxrbtcNJ1FU/h77N2NqmxoYJR6hPYltp49v78e44FPzeoy2QTnvK0kNdPDK/xM8OJ
	 oeGJfjqfQJuVhHMDqMnWLG/7jfUA91AnNsDI0oKH3Y8ynW09t8X6KbSkJ8VyEFScXL
	 UaaSkHrb3to75hseFm0/bHOFxwwSjcAX31P7Qnn/HiGI5tD4xM8pxefwdDsEKKlbN+
	 OEiorrbz+Obsk/3wnm0QFAdgVWqQBBvA9xbF8fU/rZ+kJGrdApkIrE9f04y6XT/hPG
	 DrTWYNZ83HHG33h9OEEmk2Q++Wlkaaw0DdY8e56fbhMReMf06+5YvX0cVUe5Ni8bZu
	 2v5nVy3DWlkRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B8CF41E76;
	Wed, 27 May 2026 03:18:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25A2A21F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 03:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15AA841B06
 for <buildroot@buildroot.org>; Wed, 27 May 2026 03:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foBUYsKFSM0c for <buildroot@buildroot.org>;
 Wed, 27 May 2026 03:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C09F41762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C09F41762
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C09F41762
 for <buildroot@buildroot.org>; Wed, 27 May 2026 03:17:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso6232674f8f.0
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779851875; x=1780456675;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4YFcfEEuw6GEvrXf1M/Hmsvyeju2UkQ194ZsbDUti0=;
 b=iVNLCSs7S5W5Bf5eDl/3/ysJmRG0QVWLAJ+xXGxTSXVU5VXYv6/XllIroB4v6yK9DI
 /zJwVGK5Eddcrn1to9AqHjUzD1Ib94N/uLa9pdACxKFxFIm8DbTgOOs61VFaLn9acmiR
 gcIKtl52nle8aAhfueND67ACjElO5yLTH5r78n0qlhKnCN6j2XW559nVufXe0fg/tddM
 Oex1TO80hwCKuUiM2m7+dzt8zgP9hCTLjfIN3iyY4/ZS++P/aPnoKyOA+VKMAwpaFBUE
 y4pnFkBaJHshvxb526z4zWYDupRn9YIMMCi1idiyqUfXbXjmTr4Q9B1CqZBWkl7e7oAt
 o61w==
X-Gm-Message-State: AOJu0YyGXpLxBm+le2R9M91tjVSd/mrHhDWZ+VsBJ4Et0onPOIpsS8ai
 T+GXEgJ4y2oC48UnO5X0aN7kgXtqRQkhcZWOgskr8u7qPHxj2PssjpbUU4KqJ1eP
X-Gm-Gg: Acq92OF56V5sflGAJZYOh1pVO/FkqDZlHi/DGENOUxEPdxxGbRfR92FPnRx1jJuv5qy
 r+G7T1MGO+VG4oBNjBSSiSGnF80a2HS4F2ztKUcClnpxcHiakds0JeYnyKe5S/5DBGEsZS7hhJj
 9f6McLj4C9UogM2zcKrOqJnZDpuj5QK4H8DtI3JVnxIL8YdZycwS4gp8fn+olNSOsRT8MqQAGeM
 BIr/Fy1zSHwPxCWBQq00o/AJCN0Yh4h7tq6lgAFef7DPwJlVXQcW3QbRRtnyqg5ofgOOJwyguEJ
 mdkw5Ec4wYzEZmSdrpKZRt46ST/K9+NrdatOZTf4aKYbh+r10HDZ0Q9w9AMweJeGgy9rSSFJz7V
 ah0C7YaI3KQTR9FWG2hnH+C+9E+UIvGJut31pQOgS397GIoDFbM6oMoSp7RtqVgl+AlwK6qgNqu
 f5yhPBILqGXfYrTDIy+ju5YFQlMWYCAw==
X-Received: by 2002:a05:6000:25e8:b0:43c:ef4f:79e4 with SMTP id
 ffacd0b85a97d-45eb3af14fcmr36448591f8f.37.1779851874783; 
 Tue, 26 May 2026 20:17:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5c2323sm2798259f8f.34.2026.05.26.20.17.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 20:17:54 -0700 (PDT)
Message-ID: <6a166262.03c7beee.7ac76.c19c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 27 May 2026 03:17:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779851875; x=1780456675; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=s4YFcfEEuw6GEvrXf1M/Hmsvyeju2UkQ194ZsbDUti0=;
 b=rIzT0xEZAnJbX2eHQ6Wokm51q2jN4bveMHXLB1IzkwD7vrV5HRM/Mq40bbTo5czrgt
 KWGKTVNCNWj/l5xX8916CmeeGApKpCr7LwL4/zrYWAfMpxwAI9JFFrklzBvPviSughCl
 hat3cPW5sLWPJAkh7/1wQfqkvi+Ka4FKnhHhvv7bz2PxsAsjKDJe8We3GBpnfW1mRsXY
 fSDkXSYViUWVmN/bbUW1u1eUDBN5rAoulyz2KS8ZcXmzyyfZMObAz0cGKQt5+wqB7hhV
 MleK466Uhf1+z28QkyYglpPlpdanOQOK6dePpXj/hFbPSzDem0d/t/9kV5FtWiLPpj/k
 ZzwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rIzT0xEZ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-26
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

Autobuild statistics for 2026-05-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 15  | 15  |  0  | 30  |
  2026.02.x  |  4  |  7  |  0  | 11  |
    master   | 52  | 85  |  1  | 138 |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.42.2 | 6 
                   dante-1.4.4 | 3 
  gobject-introspection-1.84.0 | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
                       unknown | 3 
ustream-ssl-5a81c108d20e247... | 3 
glibc-2.43-27-g4070d808bea1... | 2 
                  iozone-3.508 | 2 
            jpeg-turbo-3.1.4.1 | 2 
           libmicrohttpd-1.0.5 | 2 
     linux-5.10.254-cip72-rt32 | 2 
                   linux-tools | 2 
                    olsr-0.9.8 | 2 
                   s6-2.13.1.0 | 2 
                  bitcoin-31.0 | 1 
                  brotli-1.2.0 | 1 
             bubblewrap-0.11.2 | 1 
             dahdi-linux-3.3.0 | 1 
 glslsandbox-player-2023.04.05 | 1 
                        gnutls | 1 
                   gssdp-1.6.4 | 1 
               harfbuzz-14.2.0 | 1 
                haveged-1.9.21 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
            igd2-for-linux-2.2 | 1 
                iproute2-7.0.0 | 1 
                     kbd-2.9.0 | 1 
     kvm-unit-tests-2025-06-05 | 1 
                      lft-3.91 | 1 
                  libbpf-1.6.2 | 1 
                 libcddb-1.3.2 | 1 
         libhdhomerun-20210624 | 1 
                libmpeg2-0.5.1 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.2 | 1 
                  linux-7.0.10 | 1 
               linux-pam-1.7.2 | 1 
                  linuxptp-4.4 | 1 
        ltp-testsuite-20260130 | 1 
                   mpd-0.24.12 | 1 
                       mrp-1.2 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                opencv4-4.13.0 | 1 
                openscap-1.4.4 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               pulseaudio-17.0 | 1 
            python-numpy-2.4.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
            resiprocate-1.13.2 | 1 
                   slang-2.3.3 | 1 
                  stunnel-5.78 | 1 
                   swipl-9.2.9 | 1 
                 systemd-258.7 | 1 
                tinifier-4.1.0 | 1 
               tipidee-0.0.5.1 | 1 
toolchain-external-bootlin-... | 1 
                tpm2-tss-4.1.3 | 1 
ulog-0389d243352255f6182326... | 1 
        util-linux-libs-2.41.4 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/636c97ae3841bf2f70a3fc63f0207671cfc1ed57 |     
    arc      |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/00f0d9f6ce1bbf83a0439131b4152e19468f9d29 |     
    arc      |       bubblewrap-0.11.2        | NOK | https://autobuild.buildroot.org/results/38866657910d83e1fc890f1cbf8784e0de5fba32 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/76828f5f02f83a4d288df9fa57a7e8b664f1543f | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d8bd0a5a50afd16aa637278b9472c3a93842c32b | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/766527118b8fd5121d2cd7c11a74a5db1206a78e | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b769065eb844a4d91cfc06d9b2da1f6d180355a7 | ORPH
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/656c692edf5d87750c3c0dc86fb0db32d8679399 |     
    hppa     | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/957a75b0c807474175cc04f697ea01c2aaefa8e4 |     
  aarch64    | glslsandbox-player-2023.04.05  | NOK | https://autobuild.buildroot.org/results/b30072e14b549ed512ffd5f6e0f5c2914e1c73cb |     
    or1k     |             gnutls             | TIM | https://autobuild.buildroot.org/results/476c24482be25e5e4a92179cf70a8dc90106e8e2 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/05c9800a207e6e6ba57469cd246df1a4af50b856 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/98c3b92710b1c53ef420e81e654a7476695c0ad6 | ORPH
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/9f31705334bd6e8dc58cd17bd4707524bd79febe | ORPH
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/f7b84bda31edea47ad6a2bd7d0fcfd12eb66f8ca |     
loongarch64  |        harfbuzz-14.2.0         | NOK | https://autobuild.buildroot.org/results/36bf5a19114fb5eec8659d32ebffbb53c6171970 |     
   armeb     |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/353da8b3b916d54dcabda1e322ed58226df84401 |     
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/092a57a4a7ee6722128a965eb6c99e6c56903910 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/dc6b256312ab6f3e15cd5dbd83870a739a7f833d |     
  riscv32    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2ecd3a77e84c86edab85aeb48897ae5fc994942b |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/32ef3da6542d3859943ed0c24858d64768107ab1 |     
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/babd0454e9de0a84e3852cebe630d7fbb2a9aedf |     
    arc      |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/a4481f4554191a3da67fd2571b8df3da75c2e157 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/4b8fc0ea0456aeb4a4988e1b1fa28866f2994478 |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/f60ab99205c8a9a128c9c90283b26a8f7a5f20d5 |     
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/17b98b7d029d0f30571b86c4663eea2ae63502ec | ORPH
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/09dc82b7a50a22e39b901ea1bbb07b5fa008c3c6 |     
    arc      |            lft-3.91            | NOK | https://autobuild.buildroot.org/results/7e9115c133479badcc5f27c0c9ef353a3abf343e | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/3ea537b8f13c539d76b680ca0596a814b57964a1 |     
   sparc     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/7afa536aadc194ceab841b04bf7f3faff619b901 |     
  powerpc    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/aeedd6f949d7d4fe0102b75663d380dbc334b2ba |     
   armeb     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/024382a53f9fbf9e698bc55e1853af2297280591 |     
    or1k     |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/77e40a697ad9a59c0503d92373921ab23926924e |     
   x86_64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/53daf0b4bd8b476252ca219e53a966405ece7e51 | ORPH
   armeb     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/0a0efa51b41ec12f716a97171a5ebb52340e3fb2 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/5629693c1f6cbdf6f0102bcdf35a755f63138f06 | ORPH
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/a952bc1a3bc807a8f9e739919453d70816c7c0b2 | ORPH
   sh4aeb    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/4b54f0e7e68fda4b67310b7a9357f2d5a09d9d8e | ORPH
    sh4a     |          linux-7.0.10          | NOK | https://autobuild.buildroot.org/results/754ac9ecdafa9a4158296376cea3cd055b71aee6 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e94e0651833838672dd440e1c4583ed829465939 | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1383c47245ddf735cc7305b820dcc072009fe381 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7ba28a5601bd83870831bdcb0fcf0d0673eae63f | ORPH
  riscv32    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/8ba71445855a7a99066f3219cf3419f7d0110028 |     
    hppa     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/9384c19654b59a539a704dee64095347749c3865 |     
 aarch64_be  |          mpd-0.24.12           | NOK | https://autobuild.buildroot.org/results/87c79193d2ea86f47e36232fe514837ad99c5f30 |     
    arc      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/b0695b449f4570eca69ce262ac5b1ed15eaf243a |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/541c0e3a221261b5a36b56ca48fc3903026418e0 |     
    arc      |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/a23f6282462c143dcc52678b567e71225726bbbf |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/bd5c2d167f0d05526e2c74be8547ad69ced2682f |     
    hppa     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0f1cc1f6f50e49bcb819024cde0c8325fc2eba99 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/31bfc7b10960c192a9a1a9691479fc1820538dd9 |     
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f70e00e9a276b89fbdf5cc24f4a5f2c396b26ca6 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7bd72cdbb4788169657bed620b5ab1de2a058a96 | ORPH
powerpc64le  |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/6e09c63af0927bb179694dae341e10ac9326cc05 |     
  aarch64    |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/38f9064b5b25ede7dc8f4bff187e3636b61f9de1 |     
  powerpc    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/b3b182aacf9512cd34b70a70eca4fd6ee3c5cf78 |     
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/229676c2a24a2587a06579ec887a6fb546b106e9 | ORPH
   s390x     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8c112036021f08cb3097d81c4cc35ce0f319d1ce |     
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ea24cad6111d5cbd8737d5ccf17f906d7e6e0825 |     
    or1k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5503578463709a9f8139ce4f73f8701e3a3e1b3a |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3946338a217e9491ddace6eb9117c669cf7701f7 |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/db0e48f96dc3a54c540c34040b27022d6532d30e |     
   xtensa    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4e38acf8f02cbc421a563369fdcf76034b681ecb |     
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b26532563f64fd17f77d1f8095b81e6214db390b | ORPH
   x86_64    |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/1a0a4321d89c110730e6b49a72c3e0017ab541a3 |     
    sh4      | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/cf7dfe73654c2aabc3915dd566bba6b49c147fb6 |     
microblazeel |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/c7c095b32602149236577031ddf7bfddc3cae1c9 | ORPH
  mips64el   |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/63836f98ce4c260ee36ab5871be9ecae5118120b |     
   mips64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/d0e12e28dc433ce9b4d07bbb5e8015760cca6571 |     
    m68k     |          slang-2.3.3           | NOK | https://autobuild.buildroot.org/results/9123dbce7e6052aabafb600cf6d517ef6cb874e8 | ORPH
   mips64    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/cfb9e970d3a72b845b094fc87e127a388f6c1c5b |     
    or1k     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/3420aa9390a527f9644b363645490f21495cc507 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/7e9a8cb589801e4609adcc2fec4e78ccf2f6dd5c |     
   s390x     |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/ae0de14c4499c48454cd9892680d15a2345c9ff6 |     
  sparc64    |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/14161a456b00ff98875c4de6f361087be2b9dce6 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/a0c8b777ee715a43276e59f6a820ed641767ee5f | ORPH
 microblaze  |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/f2acc00d69117ee2346818c7cedc2e4cd9e1324f | ORPH
   x86_64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/73258f133b4e72880b802fff5c2ca15747c796fb |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/9d301047753b6253d17af4e698c292c764c3b8c3 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/c36be3c5cba54cdff7a290e81afb7c216bae9f57 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a3dbdbc3d6f29989d297a72292ff27769de67a94 |     
  aarch64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a3381fed5e9f1439d8d0da2fbae89841ce1fc550 | ORPH
microblazeel | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/ecd0e0c069958bca07cee7032deb91f34f1c99cf | ORPH
   mipsel    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/41b1a865159c2fd2ec15189ebd34046f1f7b45c2 | ORPH
 aarch64_be  |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/bd1ef4fad2223c8b979e195264c66c7eca9d9dad |     
   armeb     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/04d6c964f86f18599d31682e61c548302f4c44fa |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

           at-spi2-core-2.58.2 | 1 
docker-credential-acr-env-0... | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                       mrp-1.2 | 1 
               procps-ng-4.0.6 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.4 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/0c043addc1397c8d264edb06c6206cb81828c55a |     
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/792d86ebffbb89866b6e12117b4fdd4de6b51b94 | ORPH
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/5a4df9378a55951472620cf7fb400c2d7b77989b |     
  mips64el   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/d637c2bd3b7fa8ce1ebe9964840e39974b410dbe |     
  aarch64    |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/cd06c41677f87c870b50960dc1cf0bff3ec83ba3 | ORPH
   s390x     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5865b9843d2785fd3f7271defb1d2daf924e609d | ORPH
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/df734d7a09170575a6a1ec1ffce5c8aafabb9953 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 openssh-9.9p2 | 2 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                    gcr-3.40.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.82.0 | 1 
           host-go-src-1.23.12 | 1 
      libabseil-cpp-20250127.0 | 1 
              libmodbus-3.1.11 | 1 
     libphidget-2.1.9.20190409 | 1 
               libpthsem-2.0.8 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
             libtorrent-0.13.8 | 1 
          linux-5.10.246-cip66 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/77739ce9ad7561cec6b4f55d9019cdad47800406 |     
  powerpc    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/5f4230fbdca446142c9994aff931f2634b6925c2 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ab4f0b5015a3635de3e6e69e3bd50a459173102c | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/483a184d0b15f53d0ef4d51ed41fc9963df1644f | ORPH
    i686     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/b934e4ad23e922e3e82f371935514a190897e5ad |     
   armeb     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/be56f6ef1b90bf6a1c0f9b610d1b55c4df8da7d1 |     
   s390x     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/180ce5094e26f3599e4cc617b60732d19c6de7c4 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/970e6a659f53958e7e31bf74c1fae9feffc547f7 |     
powerpc64le  |        libpthsem-2.0.8         | NOK | https://autobuild.buildroot.org/results/e19172d1db9c2e06286de0933a88cb4b9680ce4b |     
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c7525beb9754e6cf2d8288b78d4a87068e9fab35 |     
    m68k     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/51de8c36b7a22dddaa571cb3d540b870b258ba50 | ORPH
  aarch64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/983035a3b8ac0a65324e87682bd8b11eb6088599 | ORPH
microblazeel |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/19daaa35acc1db88d71327ded7590d59acbc564a | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/aa7a45e7c1f3f3a4513c0fc46db30c89a82421c1 | ORPH
    i686     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/bcc0a4229017adeaf21e9f828c20d971aa5fee88 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
