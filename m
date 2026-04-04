Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCDDE88D7E
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 03:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E46A98183D;
	Sat,  4 Apr 2026 03:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78fgFFN4skEQ; Sat,  4 Apr 2026 03:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A038176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775274268;
	bh=k/U5klo1Y3PPQTA42T8lzC+/EbyVIDThfoDHFo1dbtU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DReuMhoY4s4CwKEUVC0urUKFAnfyfpyVwcwr+9z0u9SpIsRvz8WPsYUVeVt6im8v3
	 mOmDHjyXwelY/zqYcfvVWlgt3I/wrbA9wv1ng96c0WO6bSpIYrTYOEkRnBLpoEb+O4
	 QsJ9HQKO1mJ7ts/YX9zI50I28zDEUqSdgEPidTl+JBHs5ttbDoBuplU5BhLL7SCWBC
	 SwB4PPIS2VzsRfeDcYNxah/9L070k8mp7Jl1p252/oUz9QILkdsrGpmt93jX9D9h+a
	 FVJ+61knqMVNUEOYISiQQmjqKcklnhut6erwJ01J+ImNln1lifX1q4XyuZlMP0whWN
	 Ha7hHqPIo9dDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A038176A;
	Sat,  4 Apr 2026 03:44:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95AFB91B
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 03:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8692B607DC
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 03:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3S89FcNx8nH7 for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 03:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30599607D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30599607D5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30599607D5
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 03:44:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso20574785e9.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 20:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775274262; x=1775879062;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFisUlyJ0vagHgA6r5j3mBlFBX1kl67cxPhybf6vuM0=;
 b=FP/E9ysf+2ZvVsx6NFtwPxc5a1MbS1ZHWYLS3/j2kjQIyk7x9hEJJBhpwQZg15FTnN
 zywnqH0cIj90ZtJrc+IiZBg6Eo7owZf1MYK3AmcZr/yKN1sC32fJHq05WWZ16DGqOoLX
 MQc8LEppJosF7aEjse2yg9nM6HNwtoVQA5TNJRd7gYnWPLe3gSZw3XZdVmcgwolmuxrb
 oYvyFfm2AllP2R34j3gwp2ODHpx+HZLjWXuw8FpF/+gfrj/M6P+kzZXQkLkV19SEF4Ns
 g5nMLTbfXIYmvWypmDRTsz310BhykJRCUp41p6g2ru4m4abftsMzlAwKVw1C4Aa+knqr
 Ojog==
X-Gm-Message-State: AOJu0YzB0h0NOMYdMVqa1mNT+ZW+zzoGJm/+22q3H/HnhhCZaRmYR2VQ
 yXUQkpcFzcCxDjuZWF1+bT3WLDqTlBdOKR08q2+jRAy/LRIlBy53Lr0J4xkCxi47
X-Gm-Gg: AeBDievqWEJgOqH9LouXupImJAYjkHhQnOsGIYoBBBk/kNurAeOAA7GHRf+CcizCYL9
 8tXN+/ynW4skmOtxoD8lplRqEsf6UuRtuY6R106LoyGKuYe4ROxohBCJ0aU5VaCYIZ3e8pIg4aZ
 sfMzRtnuh8JtYQjTDHdz5mDDWSQMGDR1G//sq7kJrN8exhlRcHcEDBlEbeEtyS4t9CHJ9A6jZ+Z
 474X8i1KfESHCrwc1Za3zY5CQKXt2fY8bU1LpCbEhxEGAvN45A32h8Sk7I1/cm1EQmK5jmnwSdR
 3AI//gDDd3RqpSCASkIqCinbli/K/xcBtRat3n5zlzczPoAivliSzsoAY8CdkFGls11IJ2dfUZg
 6wH7IieTrO2ggnke1Omzl5hsN7gQfdHo35QRN0oaHzKYb0dfCNy6quQyUBtg/hx7e5norskLSoM
 GYRhr6Ac2zMd1qTYjjwnmo5NeRKQ==
X-Received: by 2002:a05:6000:310a:b0:439:d242:e8fe with SMTP id
 ffacd0b85a97d-43d2929d2eemr7833973f8f.11.1775274261392; 
 Fri, 03 Apr 2026 20:44:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f13sm21172579f8f.3.2026.04.03.20.44.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 20:44:21 -0700 (PDT)
Message-ID: <69d08915.df0a0220.ff914.6890@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 04 Apr 2026 03:44:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775274262; x=1775879062; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=nFisUlyJ0vagHgA6r5j3mBlFBX1kl67cxPhybf6vuM0=;
 b=rKX0qUVrcLwdi8xnoKgwgLHeSOxGicgqgKF7POu9ihKLTNye2raiT/3WjbH37B9j2W
 d/JqcKIsoDUgEg6sYXZnazDSnVHFNKgjECzIXpqC7I9wRCVmAyS2OEnWRPmIWiVqFXOz
 ZZvJ7ldInwKc+wxCH0eLhjzzV+O3wyz6iu4IyrY0qyt1++NzUj6gu50eiTR9l2ayJOdt
 BtF/s7T1glkvEM43LzK52X885g6auxPwSnvYhW5Q+ntVQUorAMqHfTRFxW3Z3sILWKXo
 B2bzmCJ3UCfh5hFZUOVYh8oCR+Yi2+N+PPvgxNSZjGA124SZcqPzqBBnlDEgnudKQRM1
 b2nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rKX0qUVr
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-03
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

Autobuild statistics for 2026-04-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 48  |  0  | 65  |
  2025.11.x  |  2  | 17  |  0  | 19  |
    master   | 63  | 160 |  1  | 224 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.43-17-gdd9945c0ba40... | 10
                 mdevd-0.1.6.5 | 10
                       unknown | 8 
                  libnfs-6.0.2 | 5 
     libphidget-2.1.9.20190409 | 5 
odhcp6c-f19dd37fb467c9cf10c... | 5 
           uboot-tools-2026.01 | 5 
                   perl-5.42.2 | 4 
                  cairo-1.18.4 | 3 
             dahdi-linux-3.3.0 | 3 
                flashrom-1.7.0 | 3 
host-gobject-introspection-... | 3 
              host-rust-1.88.0 | 3 
                libcurl-8.19.0 | 3 
                  libnss-3.122 | 3 
              libopenssl-3.6.1 | 3 
ustream-ssl-5a81c108d20e247... | 3 
              e2fsprogs-1.47.4 | 2 
                easydbus-0.1.0 | 2 
  gobject-introspection-1.84.0 | 2 
                host-odb-2.4.0 | 2 
leafnode2-9543ffaf82406f943... | 2 
libdill-32d0e8b733416208e04... | 2 
                 libmbus-0.9.0 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                   linux-tools | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
             tpm-tools-1.3.9.1 | 2 
uhttpd-15346de8d3ba42200249... | 2 
             util-linux-2.41.3 | 2 
            18xx-ti-utils-R8.8 | 1 
          aardvark-dns-v1.17.0 | 1 
               acpica-20251212 | 1 
                apr-util-1.6.3 | 1 
             babeltrace2-2.1.2 | 1 
                      bmon-4.0 | 1 
                 c-icap-0.5.10 | 1 
                   dante-1.4.4 | 1 
            erofs-utils-1.8.10 | 1 
firmware-utils-c42a3bc53da8... | 1 
                   flann-1.9.2 | 1 
               freeipmi-1.6.16 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
               graphene-1.10.8 | 1 
     gst1-plugins-base-1.24.13 | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
           host-libtpms-0.10.2 | 1 
                  janet-1.41.2 | 1 
                   jimtcl-0.83 | 1 
                     kbd-2.9.0 | 1 
                  kexec-2.0.32 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libfutils-c326ce0cc2a735438... | 1 
             libgphoto2-2.5.33 | 1 
                  libnfc-1.8.0 | 1 
              libsodium-1.0.20 | 1 
                  libva-2.23.0 | 1 
libyuv-4825d9b29eea4dac2460... | 1 
                 linux-headers | 1 
                    lua-ev-1.5 | 1 
                       mrp-1.2 | 1 
                  nginx-1.28.1 | 1 
             ntfs-3g-2022.10.3 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 
                 rtl_433-25.02 | 1 
                  screen-5.0.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
          sphinxbase-5prealpha | 1 
                 sqlite-3.51.3 | 1 
                   swipl-9.2.9 | 1 
                 systemd-258.4 | 1 
                tpm2-tss-4.1.3 | 1 
                 vmtouch-1.3.1 | 1 
                 zellij-0.43.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/49a8603237a18b6bd821423c8a50778d49b938f7 |     
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/cf4c5bb8347c0d9d6590652a54efe048c8082fc7 | ORPH
powerpc64le  |        acpica-20251212         | NOK | https://autobuild.buildroot.org/results/a8705560f3b1ceca4ff2e8e066b78d169a6608da | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/6f9faccae04a9a4759743df86707e3d7b8736289 |     
   sparc     |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/9929e3104b3f0950b008a16a6928e8bd8c4edf86 |     
    m68k     |            bmon-4.0            | NOK | https://autobuild.buildroot.org/results/db9bbdaabdcce4d134f5e53a72055452816ea15d | ORPH
microblazeel |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e43868c50126610891a9be325a36b88a063ff39f | ORPH
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/0b920ddf2dd0f79c9e062afd79e67b1e8a922a71 |     
    m68k     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/3e8ca348651bf06c084aafed9882495aaaabc813 |     
   x86_64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/ecab570aad010146e2464b45124693d8b117b297 |     
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d9bd9c97c5d76cb1e31f6baadfc2bfad01ed9417 | ORPH
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/80f20ede903074721633922e22ad98792e42e906 | ORPH
 powerpc64   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c5f04399a16a3eaea2896aad5abea3277847d293 | ORPH
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/1e7b4054e83a8137203082e194556ce249eafb3f | ORPH
microblazeel |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/060ebb27b41b747df0a3b4e48202990e2276f9b3 | ORPH
    m68k     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/428cb220692d4a761f603569ec65ebc3cdcb6c68 | ORPH
 aarch64_be  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/b6ed6b0e2b90ec9f2c6833a4184aa1b40f7ab33b |     
   mipsel    |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/66810d446ea638c1e4e85d14e1b31b28cff5e611 |     
  riscv64    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/fb27d9ef86da3629131eba13f8e5e458c747d9e3 |     
    arc      | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/58b4497737bedb3a464e37f23bf609c4455353f1 |     
  mips64el   |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/ecb2ebc87d98b0f1e8691bd6953b288861988d8d |     
 aarch64_be  |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/67f7230421ea66090a013b92150cd6dac90054e9 |     
   sparc     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/ddce746ff3eb4d6449c88f3be0cf7241d5f1890b |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/f5515d7353c2d864229fef1c5994ccec2bf784d8 |     
   sh4eb     |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/366a063d22c7295faec9c1d1cf08c4e2f3f7dfb0 |     
    arc      | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/e33e4650a5888d38a5ed3b3c799a678d832fdd11 |     
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9c6b377bf28eea3780410457745341a5e2bf4ffb | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d0683c6c0acc75c6fa450c27477c83609ba78727 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/da705910b19c652974ae5c37d00dbb65d79eab38 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d32b08a0552523af27f40bc695d5723ed39aba0f |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/0d743fdb09c60296e4097e04d9934a338330cb67 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/360d9fc86bfa195763162185cbc8d26be17f57ec |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/d3daea4628e34f288be43362e7931763b89e0a20 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/f8a6f7cafe30c3e4740eb7f71f9e45c33bd5395b |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/fa84cb1d80d71e5e1eb02ef47b5f976197d108ef |     
  riscv64    | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/54d1313829b91fa8bb66098dde54bd4fb4ddac21 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/6eaf200f0ec8eb4b5604bfed3a6bf5f588c0ecff |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b596728bd9e350df81857d03118319be98798acb | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3666bcadb780e938346da02c39845694c063ace9 | ORPH
    sh4a     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/05e34aa555f7f1d60218a2fdedc907fd1e9e283c | ORPH
   sparc     |   gst1-plugins-base-1.24.13    | NOK | https://autobuild.buildroot.org/results/5cb4e9b6b00b9346da0f336408132e7cd63837f5 | ORPH
  powerpc    |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/b0dc4b0db5ab074216b27b0e6228f241b4713666 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/170c73fc8f6e9a51c4b7fecb2ea073e94adade86 |     
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9ab6f22cd8407a47b4ca111974cb7d6dc9aca183 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c158c6db03c129bb20497226d7d79aa131c09d7f | ORPH
  powerpc    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0e9c7915f9e270cd3b3325715fbac0f33c7bd7b0 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/41c466fe529bb857c4ada898a16ec5e19f8f353b | ORPH
microblazeel |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/dbf5e90b40cbe7f9ff25da58e3551129dbf22bbe |     
   xtensa    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/405cbacc7b1feecef97bb4f5b52c67727366d52f | ORPH
   mips64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e8a0f735459b4877e0363e3c381a790623056183 | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/15049517ca5ef45a64defeb3081bf0e321f3d79c |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/9aacf33ae8ecac63fad4aa587283ebe7aa87129d |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/243a40355134e06307486a0e5084b6b71f4aa390 |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/fa700b0172fdf164cd3a7086029481fc0b10a162 |     
    m68k     |          jimtcl-0.83           | NOK | https://autobuild.buildroot.org/results/99bff7d5766997283f9e32308651d7edeecce2c2 |     
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/0b2698f8e8ca1c639d0972f0e97bf1b1d0ced323 | ORPH
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/b082403616a1f87957850accdb1224e676edd06a |     
   s390x     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/8d5289c83373f8d72b4321c7a43c5a38d2192894 |     
    i486     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/9672e23c8afa1aa0b8ed7beec2e1e47a7fbf916a |     
   sparc     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/f34dc033d97cf3dfd08e5fbe3a68d5b0200637bb |     
  powerpc    |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/7eaec44a272c05f2f65084d903c39a753956e47d |     
   mipsel    |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/e3308a0870a37ac0a2c54ed7c691b581192ea2d5 |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/af98df3a42b94f50d255d8e329043bccea36eb7a |     
    mips     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/f8eaed06543a696583539911edcbd5a1991bc3a2 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/895b86cc68484f82a0c2f94d0bdfdb501390b5c2 |     
microblazeel | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/ef2303dc1b40c85a2eff320bcad67859cdb92352 |     
   mipsel    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/22f531e2cf17a92f908e6d178048597b39b7b4e7 |     
   mipsel    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/86883c7fd0d698c0ae793a8050cae6a186e78dcf | ORPH
microblazeel |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/a68f8823b91a8df8bfe116ce4649a4898011d581 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/dec1ad9870bd7b794aba69fda00822d09dcb92fe |     
    or1k     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/1a3c384053fa2c5e8d72d28a4781957bf02f6b31 | ORPH
  riscv32    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/83d568c64ab5e5f1ad19e7098c109c496b38e70f | ORPH
   xtensa    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/63eb8814f0b1d459270af616949eb564c3f830a2 | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/fef31a81e1a5f86b01639befffdf229881921e0a | ORPH
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/fad3b39f054aca7a47f0c4b9e630e7ef31285809 | ORPH
    m68k     |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/287ad08126683da153473c21170555c3ee38fcee |     
microblazeel |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/9d7ae4b9d6956163ea00e5a8bbb4a8275624f677 |     
   mips64    |          libnss-3.122          | NOK | https://autobuild.buildroot.org/results/3b205de1b1176d69ec3492dad745312583d033a6 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/f53da7104767b614d6a3767a97b7cc2fc79b8344 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/168e9cf964cc626e3f1fff77cc0e2c7e36c8d74d | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/ca4d2fcaf0d50893481e73d601740915f386e4cd | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/34721fc4b5e78b45db0f3159158659c012efaaa4 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/42107ffc6e81fae8a955b811fb2534b61a05c2f3 |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d54822a0e1478f9f587385be5e55470ba86a64ca |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2849afbb5d16aad5b95750d8a67534f2afbae851 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f6c78694bce3d6a769a24af1fb315cc9290a8dfe |     
  mips64el   |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/8463afcef147b9267693aaf4bc6e62b98ca49a14 |     
    mips     |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/1a690709b709b3eb2af44eaa9e560f5ac1c3df31 |     
 aarch64_be  | libyuv-4825d9b29eea4dac2460... | NOK | https://autobuild.buildroot.org/results/a5fc408f535de67cf2a01732f3da80acb65cc950 |     
 microblaze  |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/9655ef499b18715191915e42855ec820dc82f4dc | ORPH
    hppa     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/b7dffecb0423064a8ecd3fb8c2ad3b16f4a607c6 | ORPH
   armeb     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/eb730f6305e51b4a4994dd1c19d45533c07a18f7 |     
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/38f9c99bddc59f9d565151238720a672bf5746bc | ORPH
   x86_64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1b193c8768e773a22d2d91689b6c0ad67ccbcbda | ORPH
 aarch64_be  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/1e8597a83585252ff6b074eced100908ba1767f6 |     
  aarch64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/92b9b307996a44b66dc3f7f7d35dd74816b62480 |     
loongarch64  |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/fe26913759bf62a1f18f6d3a16060c637b77c9bd |     
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/af7141e0cce3882e85a17295bc5dd2582d6e71ad |     
microblazeel |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/29c084ce16bcff4ae55c0fb23aaecbf8083f0823 |     
   armeb     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/bd455064b8fb83ad2dd8bea030fe5c875c533fed |     
    sh4a     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6c9d944d79fda1421d0252591022394bd8e3a2de |     
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/c2fef67802f10a9f659461a1845fa88227e7d4a1 |     
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d4151a0c4e6b6b6263b5790569249b7bd359a72d |     
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/b91a54ec81d8fa819792ee827b25fcc0dca34ac0 |     
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/467d595bf58183124fc52896abff640b8a421b2a |     
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/aabe28d7d8a933fdc046c5c557aeecd31b2763b7 |     
  riscv32    |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/dfc9348e72221be654d28841199061f4509a8e2a | ORPH
 aarch64_be  |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/d61527a7194e9cb656b6e0df35bffa8d9cb98ad8 | ORPH
   mipsel    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/51e2bc53ffd63d331c1be3c98dce7aa72530d469 |     
   xtensa    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/127399f1a7518bf83a5c3f590b2502f0e2a162bd |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/260edaa6c10f739ea6c680d2730c3b86cca13913 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/aac1aa073318018331859de295a69e230d5dbce8 |     
    arc      | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/359da1f8ea309f05442d5778e0b0255b72e23383 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/dbca11765628322e792e4641d2b7d99ad06c91f0 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/c2f04902593fa8094f48cc980d4d23d04c7bafda |     
microblazeel |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/8c7de5d2149ba128ac61fb2e33e50250c5b4b632 | ORPH
   sparc     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/21d732719c752b28e397fe8ded88bd8fe92c0f48 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/34b295e27c52948dfa93ee75851fd0f0e1b2b94c | ORPH
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/01db44ac8092d88179a99aa99f5a12228730092e | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/76f6414bc292a3bfc01b46fdda5dbdb9c46680fe |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e264c73adbde1faf2ed4f39fe2e8612ca636db00 |     
    or1k     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/69b720224fd564fbda3880ad5a7a8db9fc390360 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/5e88b17a800a117cb903d4841ab09cedf67052fc | ORPH
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/abd2b78073d8bf53311486f3764ff2ae23203140 |     
    mips     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/d5395a28cc441283d663b6c41ed3d60fc2bd828f |     
   x86_64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7fe98f06227eb54e1416f3fb5026df691e480db0 |     
  aarch64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5c175e1ad92cdd4ab7d9331199d97af2932bf3e8 |     
   x86_64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/d1db1d801be7ab6f879763b885fa6a3f4329d7e2 |     
microblazeel |          screen-5.0.1          | NOK | https://autobuild.buildroot.org/results/7ff4c62a338ede725bbc81c0889a1675f86653ba | ORPH
   sh4eb     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/c2a1861f2fa66d3fac250604cfb16de8e5e9a301 | ORPH
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/47d51a97944e52afba2508d3a805fe7374d9e3be | ORPH
loongarch64  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/fbea7dd5001adc63a69e0be005229450e846e81e |     
   s390x     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/99759bb0564e5a0f52ac8f1038ecc1b2c7b7cfb6 |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/530477b469b101566ea63df0abe9c60878ccf996 |     
    arm      |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/97202e45989fa5351f3f8ebfddffc430b6001620 |     
  aarch64    |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/703b55fdf6e27866ab3753964d0456cc33754d73 |     
powerpc64le  |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/208b72e602ef4d67ae2f1ddab6a2fafedb7ade2b |     
    or1k     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/f253f554167e898d59ae98c29e605d1af07ad27a |     
   mips64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/a320e15ede1c68e54c9139d57483cb0fb77143f2 | ORPH
    mips     |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/341cf32151b70b42574566996e8af87b361d29c7 | ORPH
    m68k     |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/501280ab5cb88f7c2305249a88c714ac6ce4228e | ORPH
 powerpc64   |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/4482f8492dc843f2a454a959de30648d797d22af | ORPH
    arm      |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/d9677c625804cdc6a6aaae5ddf7420a6744459a5 | ORPH
 powerpc64   |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/dec2ec3b09d28e4e502dd0ca08089565bd3fa224 | ORPH
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cf3db5c40a1b565515c222f885d85221144a07d5 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e0aebcf66b25460ec4d861aa3672b05d3a1203cd | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/4a40c49ce9234f0d88318ea8a7b1684b97d80146 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/25955db5148d05023feb1c97fb988f5a2595e79b |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/19a9974123190e2b0cf28a9ce1532309e4146df2 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0bd8c1dfc0ca8c645ce5a0cce11dc547d0be63ed |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/35632ced194a0322ef250fac0a8a85a51e8b30ea |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/335367f69aa83b1c2fdee5566ce9d937f7e5e967 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/78df05304e1b858413cd67cf37c195923980e0fe |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/76ab0c4af206069dad5083d0dab8cf508fafef9d |     
   x86_64    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5148ed336e8b4e91553d80979e7e0f77a1b47d38 | ORPH
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/f158480a996a74ea5bc3909086f1d52d5a069fe5 | ORPH
    mips     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/d29c972b7937a32aef8fbb3033c137845cb3f0c9 | ORPH
microblazeel |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/e1e5d8314e54fe4de5c4de2b55b54322e53fdabd |     
    mips     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/0f9a0bbd090f0502ed7ffd8a3c19369ba4dbda2d |     
  powerpc    |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/420ee98e86bc240a7a0c2df92966286985aa2b39 |     
   x86_64    |         zellij-0.43.1          | NOK | https://autobuild.buildroot.org/results/e8510186abf20a6b23aba2c47bdf8fde015c9f16 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

package/linux-headers/linux... | 3 
             alsa-utils-1.2.14 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
host-gobject-introspection-... | 1 
              host-pahole-1.28 | 1 
 host-softether-4.30-9700-beta | 1 
     libphidget-2.1.9.20190409 | 1 
                libsoup3-3.6.6 | 1 
     linux-5.10.246-cip66-rt29 | 1 
        ltp-testsuite-20250530 | 1 
           oath-toolkit-2.6.12 | 1 
                   perl-5.40.3 | 1 
              tailscale-1.78.1 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |       alsa-utils-1.2.14        | NOK | https://autobuild.buildroot.org/results/fe3559279494ee0040780a5da0be69243108410b |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6c7eab2b68ffe29bdcf113dd7b91185b85f4f238 | ORPH
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/fb5e2172b8cb5fc49a2429c529c326271bd4be00 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cb22088b961366795a858d5bdd46e77ca6a5c2f5 | ORPH
    mips     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/30511285e9f4adb3cd554ac152715709d693368d |     
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c90c21e19a0dfb97f55493c69374fb8ead5c115a |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/eab28169066e53a6348047751d21b87157a4b7a0 |     
    or1k     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/7faff88ec5eca989e7600eb0073f7c2027e207d8 |     
   arceb     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/29e5cfa0ddf21221f2730fbd8b7b8cc837739742 | ORPH
    or1k     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/b50c51e22402075b66969c28f61ba69d2d7d9f3f |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/99df48ec91fcf4dc6148a85c8d03282db346c2b6 |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/cd57dee2ccbe5d17901dd1c6eb17ec7e84a4e2f8 |     
    sh4a     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/8a2f61363387f7f07d0ded05b2a39e2390068b37 |     
 microblaze  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/75a0694b93f63fce6dd70ea86a59cd61a829cca3 |     
powerpc64le  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/341d1c6b28299be308be3180fd8e98fe2f39f51d |     
   s390x     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/bbed52527bbd8d0974adc5c92e644297fc289733 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/88a4092bfa8ca4aec780bfad173ceec8cbe62eb0 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-pahole-1.27 | 3 
leafnode2-9543ffaf82406f943... | 3 
              libopenssl-3.4.4 | 3 
                   perl-5.40.3 | 3 
                    ficl-4.1.0 | 2 
  gobject-introspection-1.82.0 | 2 
          host-faketime-0.9.10 | 2 
                 libmbus-0.9.0 | 2 
           oath-toolkit-2.6.12 | 2 
                 openssh-9.9p2 | 2 
                 c-icap-0.5.10 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
             fontconfig-2.16.0 | 1 
                freerdp-2.11.8 | 1 
                   fwupd-2.0.4 | 1 
           ghostscript-10.06.0 | 1 
                  giflib-5.2.2 | 1 
                haveged-1.9.19 | 1 
                 highway-1.2.0 | 1 
host-binutils-arc-2023.09-r... | 1 
host-go-bootstrap-stage2-1.... | 1 
           host-go-src-1.23.12 | 1 
host-vboot-utils-4b12d392e5... | 1 
                libcurl-8.19.0 | 1 
                  libnss-3.108 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.246-cip66 | 1 
        ltp-testsuite-20250130 | 1 
                     nvme-1.12 | 1 
             parsec-tool-0.7.0 | 1 
             pptp-linux-1.10.0 | 1 
               snort3-3.1.40.0 | 1 
                       unknown | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/bfe344bedc20de74f6dffdc273e860c810456a35 | ORPH
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/e79ef028fb523645bd37800114d1edbf723a3a20 | ORPH
microblazeel |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/e2887e34c03830472838987624cbd77048cca4f4 |     
  aarch64    |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/8575ef600061964c92cf22c74a5b4d515964ba40 |     
  powerpc    |       fontconfig-2.16.0        | NOK | https://autobuild.buildroot.org/results/cf26ad4a23f3cf4f5503068d9f650853ace2a4a3 | ORPH
powerpc64le  |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/f5959d8cfd5e1cd1b138b7bf460dbab84364dd65 | ORPH
    or1k     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/fce7cde81d33b52214222f603b872faecbd5f79e |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/20c6c62262412aed7cd47634f3ef712d6537bc46 |     
 microblaze  |          giflib-5.2.2          | NOK | https://autobuild.buildroot.org/results/d4cf9259156e4e67ffe06282d9ea08b895b93192 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d6f9f2fb24bc4f710771828e570dfa18e7d1d6db | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f7a28a87b1e5c1f346ff560f2c4d0f52c7ce3cd2 | ORPH
    arm      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/3f56eb88e0a882bdeb8bc65ec28621976a6ec551 |     
  riscv32    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/709c9798719091dfd37d067b182364cc40de7a3b |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/fcce3a9ac2a1a31fe4f72f1cbf774f8b77302298 |     
   sparc     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/766d9b703739c8e84ec07454b7d3a0c7985781ad | ORPH
 powerpc64   |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/5434b38b6191f2c089ed93805e6b0df75353a7b5 | ORPH
    sh4a     | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/711d7e33f5a925b22ff9c34270d4647501cf9cd7 |     
    i586     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/d1a0c19534d4d3de4cfde31d32e123d63ed67b44 |     
  riscv32    |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/3227d34c16975aff474811a9422c948643cb00c3 |     
   armeb     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/a54c470d19b0b724bab5632da7ef086dc4c9b8a9 |     
    mips     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/73d4ddd1f4820a98dbad7c851bf490cbe07e8220 |     
 powerpc64   | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/524bffc22be5ade58203d8b325917cb7892a1d4b |     
    arm      | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/f4954d9ee43f6ef0119ef1b8edd21c51aa71127f |     
    or1k     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/83b96005b505711de371e566f6b8996fb4dd1f4f |     
 aarch64_be  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/918aa79f44cd481f4a9100d6a3728faf32af5bc9 |     
    mips     |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/45b37e72f69c5fa39f114deb99f941e73cfefa27 |     
   sparc     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/51cc68ea2ebfadb458bba3aea5f56b397673fdfb | ORPH
   arceb     |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/68410a687d0c584c79e3eafa5d185d53bf7feaf8 | ORPH
  mips64el   |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/38f1a619318d12f7a264ea54d26a9820cff8bbfb |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/7b120143a6fe2d21aec5e12edcdbdb4fdadde3e4 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/275ef8b20fc86f866f8dbeece5ea7ba7fb2562e0 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/845a50e9b97826fe700d78c72c75dbc824417203 | ORPH
 aarch64_be  |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/9073cb7f46bfa89047c954dc7b2d99328feac904 |     
   sh4aeb    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/3f2e81d3692af7d9f3495365a1e1c13ce8024f9b | ORPH
    arc      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/5693707da944681727358d4c1467dc190f2f746c |     
   sparc     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/5d29d00ce644560a613d8cf16dba9fd59db1ebd9 | ORPH
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/60281f6d5555cf8a411c4ebd4d274238b30a036c |     
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/2e030c3cf4bb903e89696ca969229ed933b7e680 |     
    arm      |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/9ff6f9f968c31784baf48b5e3176a1470d4d98bd | ORPH
    arm      |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/bbb5c6fcbd312792a3b47019b5efb845399c2494 | ORPH
  powerpc    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/6d2a3b23de8299156dfc87b0ac959ac24232152b |     
   xtensa    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/4befdd044a0c8f5b09af8561cfdf7848ac8c9b7b |     
    i686     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/ac537131f0a57db709880ca01b82ddc7aa1f4dce |     
    or1k     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/ddfa744cc64f5fc1f43cd968ce14504678aa27d0 |     
  powerpc    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/a66e6bdd49fd6147cbf3d57870131e2ec9731661 | ORPH
 aarch64_be  |        snort3-3.1.40.0         | NOK | https://autobuild.buildroot.org/results/691c6b2d3b14d6ab7a05d39c17276b64f7fbe306 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/facc67a698c2abc5c4d7f4e2aebd0df51e9094d7 |     
    arm      |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/add57042ca6b1a2bc73b384aeb73ee7953c16ec7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
