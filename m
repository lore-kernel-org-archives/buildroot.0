Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B098105D999
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 03:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A958260F7D;
	Wed,  8 Apr 2026 03:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io6vLC7pRdds; Wed,  8 Apr 2026 03:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B6060F81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775619050;
	bh=6qAKetc2zRJW//OOn9SJT9sc+ahHATiKSidgxtDC4eU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Utd4pTCAy2o3KDHcmDJqHIY0a+Xgydn4FtAZPxKPmcrqyBM5OAZN8VDO5B6HV3RWJ
	 kFbcjz/+/6c/NbL1m/0jIPoqbz1wWib9vbz7tAGlsiUB6C3LcXxYSBRNWTKI7rjJEp
	 0i2zKKVaGv6j+8eA7tep5diCVgbn/K82BIeA3CLE2qTYPBTfX771JblGbe4oBSrxLF
	 x4kyKvvR+pFnrHtsjqMCLjeUha2faZ2T5lyJc84TMLEN35edisizvzXD2tRnFkYhJo
	 1t8Ym4AtJtfOHSRVK9EJ62LnsuGF+WzU20nxCwPHdksQhr3uAVLNJL820T0iQ2koCX
	 fXkixqwmTLdDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B6060F81;
	Wed,  8 Apr 2026 03:30:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 659B82C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 03:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B40B400D8
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 03:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlxtlBqx4Z-p for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 03:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 104604002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 104604002D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 104604002D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 03:30:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso42408285e9.3
 for <buildroot@buildroot.org>; Tue, 07 Apr 2026 20:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775619044; x=1776223844;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRlOdOU1ZoOGN08R8hzlapvCT6PUP6TWN3g8rAXKRK0=;
 b=UEhbuxLwJpyC2M3nIs+8vm9/LowoWYNOmj1qr513tI4tAPOe2s0tDnXgQFzuvin1p4
 adG0TAVWFVkn55CROXv2UY1mxSwZSonWycd84jin5A0ry1ahD34TR+KCA2QmDwtEmMrL
 W89FUIDza27vnkZIMzgIi30qpPtp2WdlJ6Eh5J+C4LJUN7EP+8ZykoB2wIOFWegdsUOv
 e+OhYjRjGnRa/KwaFyBwXWywLYRBQuXXnY9xtPXWFfP2ZyCa4jxJFtwHdxAfXs8TRxxF
 jCszMoGOj7dYKjZjXH1ZVPeMt1E3OXErG9Mry0U7lVs8wibL+iRxvh5fUmipwwKu41jN
 68pw==
X-Gm-Message-State: AOJu0YxBMRmNVZUmm1n692HYBu0IayPffLCs6QrIeLtEHYLli0cJnFE1
 j9FR8r/aIGt5pEte4jbuwGjk1+T+fehGLHBFZ/IBNpwzh9TLlEZJBxL9CZ8ISWrl
X-Gm-Gg: AeBDieuMW3Z//nq4IaakqGPPThJZw2645mr1B+AUGYNMLKUBuPlwToSizKcol1F7yxX
 P1ZsTAHBp49ZtqGk0xxQb3gHovh4mfpE2kNXSAhWqgMYHE6WkAUiw9XJ4h5uD9YRwq8nqjz8fmV
 soEahtfWMvi8C7pAcoLllXGOVGYv9tESSH930WRlzs4Yw5yyhLVHHIIRcClyea+bu8NBDZiLbOU
 ukWoKW9r0s/MU/rXRAMKjXg0YfK7SMX9AoDnxEDlrnvpbsAZSGS6bZb92AzAz7TEKsEwOt3EswM
 ymKey30EFbDbYEgZVqkaBnLmI8GWew3m4UYOlvMgl9CmC3Q4zBzRf/dTEsWe3tzvWTLWC1R5y1K
 ZC2KvNeJaSJrEZs3+oWyHNQeANhF5ax+3ViehhA8uLYgW0EhPfB1urjdupjRlPLXCGsKkh4bJ+W
 /QUp6Gw6lrQWTBA3Bll1QB3CRbu8Ot9A==
X-Received: by 2002:a05:6000:40cc:b0:43c:ef4f:79cd with SMTP id
 ffacd0b85a97d-43d292e70e0mr28572775f8f.48.1775619043830; 
 Tue, 07 Apr 2026 20:30:43 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f08sm57467983f8f.6.2026.04.07.20.30.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 20:30:43 -0700 (PDT)
Message-ID: <69d5cbe3.5d0a0220.3a7c36.8cbf@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 08 Apr 2026 03:30:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775619044; x=1776223844; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DRlOdOU1ZoOGN08R8hzlapvCT6PUP6TWN3g8rAXKRK0=;
 b=KT1MYfOStbCRCaSF2Avz+ehm95dQEzZggl8HFqDBUfiYahA13WVOwIHvkz06WA+qtl
 D1hwWv7BFcwCrtYna89L6hh5EGD0bbkbXoq60mUnLVYqNl9m39BdutlzRc44DbT09sC9
 irxTIe16vb70pqx9VOUPB0+CSS9PTHrngR8dBq7C+h6TNvYcdZ684y68co0NEsXNHS2m
 D6TQMKrYpYs1r6OksnuQ7Oc0bi271naAqkXa5+biTbBj2Dxj2IKAlpLYnn8O12myfZc3
 hYlH2dkCUHEq3wn9Q6A3b+OYo3pZ/YJZglikGc/kE7uvJmotmuZta9pzr/8Ywslq0sRH
 Gr1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KT1MYfOS
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-07
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

Autobuild statistics for 2026-04-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 52  |  1  | 62  |
  2025.11.x  |  6  | 11  |  0  | 17  |
    master   | 54  | 138 |  2  | 194 |

Classification of failures by reason for master
-----------------------------------------------

odhcp6c-f19dd37fb467c9cf10c... | 9 
                       unknown | 7 
host-gobject-introspection-... | 6 
                flashrom-1.7.0 | 4 
glibc-2.43-17-gdd9945c0ba40... | 4 
  gobject-introspection-1.84.0 | 4 
libdill-32d0e8b733416208e04... | 4 
                  libnfs-6.0.2 | 4 
             util-linux-2.41.3 | 4 
                host-odb-2.4.0 | 3 
                 linux-6.19.11 | 3 
uhttpd-15346de8d3ba42200249... | 3 
ustream-ssl-5a81c108d20e247... | 3 
                 c-icap-0.5.10 | 2 
             dahdi-linux-3.3.0 | 2 
               freeipmi-1.6.16 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                 linux-headers | 2 
               openblas-0.3.32 | 2 
   openvmtools-11.3.5-18557794 | 2 
             parsec-tool-0.7.0 | 2 
phidgetwebservice-2.1.9.201... | 2 
           python-html5lib-1.1 | 2 
            python-numpy-2.4.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
                 systemd-258.4 | 2 
             tpm-tools-1.3.9.1 | 2 
          usb_modeswitch-2.6.2 | 2 
                   atop-2.12.1 | 1 
                    bat-0.26.0 | 1 
               bpftrace-0.24.2 | 1 
                   ccrypt-1.11 | 1 
                   dante-1.4.4 | 1 
  distribution-registry-v3.0.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.4 | 1 
                   exim-4.99.1 | 1 
                  ffmpeg-6.1.4 | 1 
                    flac-1.5.0 | 1 
                 fwts-25.11.00 | 1 
                 host-gdb-14.2 | 1 
         host-libopenssl-3.6.1 | 1 
              host-rust-1.88.0 | 1 
                 host-tar-1.35 | 1 
                  iozone-3.508 | 1 
                 lcdproc-0.5.9 | 1 
      libabseil-cpp-20260107.1 | 1 
                  libbpf-1.6.2 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                libgeos-3.14.1 | 1 
                libglvnd-1.7.0 | 1 
                   libks-2.0.5 | 1 
                 libmbus-0.9.0 | 1 
           libmicrohttpd-1.0.3 | 1 
              libopenssl-3.6.1 | 1 
     libphidget-2.1.9.20190409 | 1 
          linux-5.10.246-cip66 | 1 
            minizip-zlib-1.3.1 | 1 
                  nginx-1.28.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                   oatpp-1.3.1 | 1 
                    olsr-0.9.8 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.2 | 1 
             pptp-linux-1.10.0 | 1 
pthreadpool-560c60d342a7607... | 1 
            quickjs-2025-04-26 | 1 
                   s6-2.13.1.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
          sphinxbase-5prealpha | 1 
                 sqlite-3.51.3 | 1 
                   swipl-9.2.9 | 1 
toolchain-external-bootlin-... | 1 
           uboot-tools-2026.01 | 1 
uclibc-ng-test-132c6134d691... | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/b820c5a0c8a9be5ebc05571651b11083faf1c58d |     
  aarch64    |           bat-0.26.0           | NOK | https://autobuild.buildroot.org/results/2d5fd5518b8018b60f3a3919264a1ae1a426d30d |     
  aarch64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/0a2fe8c4d5d21d82fe55d1105f445b5b30b6ccca |     
    sh4a     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/a055bd0b44fa6628c1799b8af4f5a969a23922c0 | ORPH
   sh4eb     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/160834a5655a6b20e9c08871c5e4547ee7935ef9 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/15eb333afc5ec16848820e4a0158475b13c257e5 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/26162bb8f50121caf8779216eae168c8b04965f1 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a64413b059e1c01c20d8ced9264ca6c0b412ceb6 | ORPH
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2bb88a62baddd1fbbac994995b959ba6713a7383 | ORPH
   x86_64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/90341abc56c78fb7ed20633771d861a1a6ba6b08 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/5959fd4730099607be29d7499a861fe1cd2e7bcc | ORPH
  aarch64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/0feb1d54f84c405915fd7411b6e6f2f8d16f493b |     
   mips64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/7815dee26f0b0100925738a4f3d77efacd6dac4d | ORPH
   armeb     |          exim-4.99.1           | NOK | https://autobuild.buildroot.org/results/52bd09294acc97be0450b7e55b75f681cee47c03 |     
   s390x     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/46da672a437511ac248d8f9c85ed55979012f8a9 |     
    m68k     |           flac-1.5.0           | NOK | https://autobuild.buildroot.org/results/2393e1ecea6ad29f462ace1d81b106e466fff9dc |     
 powerpc64   |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/c96120a002a496ee71971cd848c872408c7b2631 |     
   mips64    |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/93b28e10547916beeab1c32ae0ec0a4fb6b303cc |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/12a747064eb99863765762cea5ac8c46b040bd37 |     
   armeb     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/66c006e597fc6721c36ec34ba8534ffd08f11125 |     
 aarch64_be  |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/dde434b4a225d79ebdb1f9cbf0fe6bd40b3703dc |     
    sh4      |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/9372317be198fdc15a1afbe77510c992adbd45a7 |     
    arm      |         fwts-25.11.00          | NOK | https://autobuild.buildroot.org/results/efddd3fc2c7ab358cee8d64573cf0335d1d3370c | ORPH
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/8717f44502c5472bbc7e47a207658515a5289aa0 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/e221f4e1d51f87763bee521aa9290d373baed05d |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/f950147e8282adfa26c3afbee71e5e83b8036362 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/b5b7a366279d2022f40e1d36e2474af0723e3520 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/bd145fa9228d0b170d74bab41712e0fb1589ddc5 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5caf4d193469c7a498d8ed5bb66e13f2d507d09a | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/049aa77ce5db92f44855e4496222ec2d68872fed | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/cf74da8838d055cabb43ae76d9c093e49278808c | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/73ede82e30073cccd5aba7b799ccc56cd2674587 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3b4af5080902df73d92a67f47f6d836c7253c850 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dfb3510a1ed760ab42d33846e06740a6f4accfa5 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6877fe01cbf4059c5617e67a308cb648e5e53b59 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d8e450acd25345b7d813a1d2c2c29a4a908e7b3b | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5db7da0e046437e6ea7afe63c5677ab0e0ef83d4 | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a8f7ee2de59213d07cc6dbd9fdbc9149cd90dc9d | ORPH
powerpc64le  |     host-libopenssl-3.6.1      | NOK | https://autobuild.buildroot.org/results/32db713c2217bf5d3fc6a611f16b71c5699c1815 | ORPH
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6708111649fdcd57a0fac3c8fdc4b849560d53ec | ORPH
    mips     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f3299dc0eaebf1d328e615f6887f53985f952cb7 | ORPH
loongarch64  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/ce5904ad5a4a52b81e354b344c06feef06db3f4c | ORPH
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/b45291cd5407ba42725fc08362fd83f56841681b |     
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/45412e852f5af2fe11019b1d0fb492341b1a95f7 | ORPH
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f4180f566a03f25be45db6553322409ab90f305f |     
  powerpc    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/191a2b9faffb14d1db2d25bf13ab7b70b028cd4c | ORPH
   mips64    |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/e73f1b3b27d86783324acf7f920e3c5b759f77a9 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/905c66229ce5c52649cca724a1fbc3a2e92460f1 |     
   xtensa    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/319934c281328bfb6f56d428f8b1f5b23f2835fc |     
  sparc64    | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/4b8a031fed1487acd6aabf8db7440d03d226e443 |     
powerpc64le  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/192ecac26fdada9a09ec8a86a3ebed0b1f09e570 |     
 microblaze  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/7990ca2149dfa4b108e2ac63c3a0bf9bdfa5cc5d |     
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/8efd399a2ad6a6c1b3770737612042b63a58209b | ORPH
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/3a55aa8ed5238fa3845307f6c1b90dad04c1283c |     
    or1k     |         libgeos-3.14.1         | NOK | https://autobuild.buildroot.org/results/4f5bf3fc4da1568c9a36c91dee856778a479b88e |     
  powerpc    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/292707340d5d22dc2501bbd560a84d0819a2b810 | ORPH
 microblaze  |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/c2cec702d7d2ca9d82208c0f5c67c050e0c2c542 | ORPH
 powerpc64   |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/18622a0bab6ef4ce7b466a5eaa185da807802e85 | ORPH
   x86_64    |      libmicrohttpd-1.0.3       | NOK | https://autobuild.buildroot.org/results/ee1a7b9e944de8728e6129603cd188a8b171b042 |     
  riscv32    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/b6c46190fbafd3975b581c0776585c1743de85ba | ORPH
microblazeel |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/e021700fba7f45f8924aafb2fc9b7312bdd465b6 | ORPH
    sh4      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/7b90cbf102113f5e855279f3ca492ca79f843837 | ORPH
  mips64el   |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/09efd90cdb745c56b99d4a0f55927237e8c1b2a5 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/519d4b996c8e2a07c507b6d4cba402684030b71f | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/021f48a009ba7bcaca4c0b283f681aba27b7517a |     
   s390x     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/566186d32adb41c9736d8e0d9bc57bcbc5955547 | ORPH
    arc      |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/a05ea6077baae14fff265c55e3b60144c1336e1c | ORPH
    sh4a     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/107087272095392c3ece0cf84dda938869021f94 | ORPH
   x86_64    |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/f5aa6a703574d6d3aeb6b629b75e2c5a5701ecdb | ORPH
   armeb     |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/d20ce21d3d798affd612b8670140e965c4b1edae | ORPH
    i686     |         linux-6.19.11          | NOK | https://autobuild.buildroot.org/results/d4458234c23af5974906943a99b516dc92bfcb41 | ORPH
    sh4a     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/3f699c02e8c05ddf2442633d4e05a81eb09772d8 |     
 aarch64_be  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/ffb5e6b591ea39127efa37ad04e46424c3038c69 |     
   s390x     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/7818ece391e3b3f1df3107fd00e8ccd8f9fc07c0 |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/df04e431d3ca6a0f777f302f2f661667bc2a7725 | ORPH
    or1k     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/645ad4a0ce30f845a6680fa10e1fec2366382b96 |     
microblazeel |          oatpp-1.3.1           | NOK | https://autobuild.buildroot.org/results/4df91dda42f6e54b1b139e86624dad5fb913f127 |     
loongarch64  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/0d8dc39b8df8983e5ee717854a9dddc5ce50cfc5 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b931607c360d7da9ff49f8da24bb58222553fad6 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/a6a138e14b871ab07ce916b00def32411d2ddc0f |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b78cb6674c95428675cf8ce6fbbeac3f16177a4b |     
   mips64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/da13eccec8dc4bec423f6a11a3fe2576bac1f24a |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1b3d1019cbad22b2bfba1f44c4e2df7d6983dce0 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/7def1bd47d04c510c23dee49d098324b81916449 |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/cb16db7f90d1dcb295d4eebc2a47b7848d9f76d2 |     
 powerpc64   | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/6ced8a51bcf3267a1504b5d7f7125bd70fa98ebc |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/850f36f77a2840ab9d1c1eb6295ffaa125c547eb | ORPH
  mips64el   |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/0564f1bf208b0f846b709bc83ed8102bfd4b4e21 |     
   mips64    |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/ed089abd13622e84dd809297d83266165ff0eabb |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/43ce76af14d3ca45a40b2a562d32333f014e2085 | ORPH
   sh4aeb    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/cef2620a3ef9cff1dbc00c91f24089f22b320129 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/3c92519eeae411dffd7b00ef032d40bad5c63358 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/04f047f941de785f0ff3ec069dff70efd2a5be56 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/ae33249fdf3be2395138a41170d6be2af568b898 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/d845f5178a42a4df393f8d23addcd4823a64af51 |     
microblazeel |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/3d3cb8c5b4db980a863536143452ab644e715f26 | ORPH
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4379911adba128ba593ab3a0b1df14e1737253e4 |     
microblazeel | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/6da6ebe1597b7c4ba28c2178dc9171adda06290a |     
    arm      | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/f54269d9a1a299469acf1b54cad38f3431c606d4 |     
  mips64el   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/af4f59dca0b644b27170062d8ec8b455fd41e061 | ORPH
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/764dbf3a0964893e9d4d37ca840883158ea4102e |     
   sh4aeb    |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/8da0ee8c32814ae7986d13c572abde0213f19060 |     
powerpc64le  |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/deac77be75bd20f82bcb3679e87fb63ee9962f59 |     
   x86_64    |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/d1526888f79f0c948011eea01917a5f1a7e3f6c0 |     
 microblaze  |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/62ddd3598d1e040ff1a6d31e96a6c4a926ead766 |     
    m68k     |       quickjs-2025-04-26       | NOK | https://autobuild.buildroot.org/results/6466a9df6b5c693a9cee3527de733192696a5bcf |     
powerpc64le  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/ddf261d8aa4eb43c6254df9c9ca45d65c3b425c2 |     
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/86f8409de3e69181e4d350b0f8742994b22c7643 | ORPH
   s390x     |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/74ba5a974f9ac47a75ae4c7abfce6816b0be9d60 | ORPH
  riscv64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/80868aef8f6f033514ff90240d5f87a3aceebb5d |     
   mipsel    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/c5197352ed5b475493b0e228f4400c4709480e3f |     
    m68k     |         sqlite-3.51.3          | NOK | https://autobuild.buildroot.org/results/1014368f3d7a5334dfd699e7abaef60bf083b284 |     
    mips     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/51947219e5fd92fbb9070f73654953a553299450 |     
    i686     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/91a68db1803ccb6045fce194ee65a91396b17bbd |     
    m68k     |         systemd-258.4          | NOK | https://autobuild.buildroot.org/results/6855007f028ffa3b73ce295957e042e1d9882e15 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/cb58139193e1c95ab7120fefa3dfb2e06d2c34fa | ORPH
   s390x     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/e09a6bab771a005aeda58dc0e487de5039691b92 |     
    sh4a     |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/11f8c3dc6973da1a03ea0f82b5b5259a101952d3 |     
  powerpc    |      uboot-tools-2026.01       | NOK | https://autobuild.buildroot.org/results/5fdbb116afda7ce3ae91236deb80ca5d0ca12f33 | ORPH
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/4f4e9d5b38884c20c4ec9c20de155c16cd4d10fb |     
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f5ac70acf6d2678b100e36b99544e958c264b2a8 | ORPH
 powerpc64   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f88735ea83fb787ad133f9c8f8d67ecdda19d667 | ORPH
   mips64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/25255b57e4d84ffcac9b37991498568d5e75016d | ORPH
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9870a4844adeb318bcc3eaaca91651e2ad419855 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/91466d88bc59cb26392873693a935db82b5662ce |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/37319db6a33099f1045fb4e4793d12039ca1ee74 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/deddc74b859f13f1d2254d52e0e14b60356acf53 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/6b01e1ee9034a1e4ffa8dd416eead40a0c7dd4d0 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/74eb8305dd2e57dda2d8ace2a486fb68e5b56a16 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/a9946cb63d59e2225c05904aa7c6912764d936cf |     
    arc      |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/fd37c301a65126753ad5059760a057bcb9d25d5e | ORPH
   sh4eb     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/674f1345a3a7d1fa3bfa9a8815a4fa819a766834 | ORPH
    sh4a     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/edac19e56118d255a551f1717c70868cf99762c6 | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/da6b22f490413f63717313f691a8d2b9705f2dc1 | ORPH
microblazeel | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3c6fef305f6a085f02045f695f972ffefc13f190 | ORPH
   x86_64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/8cf6fc43f1104797cd6284e87341c84891c92328 |     
    m68k     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/50fb49ae17c436152a1608b03ba0ff2c8dcc0284 |     
    sh4a     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/bb160a66b6bbc0a24d55d66f11b4943d0e9643c9 |     
  mips64el   |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/c9549ccbb6ac46c3f6edcf83b3d3eadc65d6e5d4 |     
  powerpc    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/fa290c9cd6a41a027c7e2f1906e88500f043901d | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                bpftool-v7.5.0 | 1 
             dahdi-linux-3.3.0 | 1 
  gobject-introspection-1.84.0 | 1 
host-gobject-introspection-... | 1 
                     kbd-2.9.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
     libphidget-2.1.9.20190409 | 1 
                openocd-0.12.0 | 1 
package/linux-headers/linux... | 1 
              udpcast-20230924 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/f799ab0c20118022c2833b67aa9e51f73b97f303 |     
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4d56f5c210375bde8615eac3a75677dac4d6f9f1 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/625a8180005e20c2f6bab99ff68ae612a124e60f | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dc9084357b1f5361eca37fa163b98172e5be7f43 | ORPH
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/6887bb24e6fc26874271604362264609f3afc074 | ORPH
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | https://autobuild.buildroot.org/results/e71a6f8bfa4d5bb9f29eaaf6b713fba605357ad9 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d7da50dc30b7d51146261fcb84427cad9b2f6782 |     
   arceb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/617637cbf326ab427de88eedd9d5d266eb0f541e | ORPH
    or1k     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/64f7615d893627c8ce2d9c68adaeedd1c4b52604 |     
    i686     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/493adb0947238cec194e103b58480ce606fc0bc1 | ORPH
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/0d0edcfafd405e8a3758660f35e1f0fbd19a8cd6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 5 
              libopenssl-3.4.4 | 5 
                host-odb-2.4.0 | 4 
host-binutils-arc-2023.09-r... | 2 
host-netsurf-buildsystem-75... | 2 
leafnode2-9543ffaf82406f943... | 2 
                   perl-5.40.3 | 2 
                       unknown | 2 
               asterisk-22.8.2 | 1 
                   aumix-2.9.1 | 1 
                   dante-1.4.4 | 1 
                        ffmpeg | 1 
           ghostscript-10.06.0 | 1 
        glib-networking-2.76.0 | 1 
                haproxy-2.6.23 | 1 
          host-binutils-2.43.1 | 1 
                 host-gdb-15.2 | 1 
                 host-gdb-16.3 | 1 
           host-libtpms-0.10.2 | 1 
              host-pahole-1.27 | 1 
                lesstif-0.95.2 | 1 
                   libcap-2.73 | 1 
                libcurl-8.19.0 | 1 
             libgphoto2-2.5.27 | 1 
                 libmbus-0.9.0 | 1 
                libnvme-1.11.1 | 1 
          linux-5.10.246-cip66 | 1 
                 linux-6.12.79 | 1 
        ltp-testsuite-20250130 | 1 
                   ltris-1.3.2 | 1 
            lttng-tools-2.13.8 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
             pptp-linux-1.10.0 | 1 
      softether-4.30-9700-beta | 1 
              tailscale-1.78.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        asterisk-22.8.2         | NOK | https://autobuild.buildroot.org/results/6444fe5eca0bcc68ed2aaef2ff545020909a9ebc |     
   sparc     |          aumix-2.9.1           | NOK | https://autobuild.buildroot.org/results/b91e19bbf69b96aa05a2446f610532395bbdd99b | ORPH
   mips64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/439a19547f886b13b8e224a25511b73b4ee34e11 | ORPH
  riscv32    |             ffmpeg             | TIM | https://autobuild.buildroot.org/results/7c5147b690e992359f58291f8b0be03176ecd95d |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/1516dca9c6c8b86612fd8b748751c45ffb5844ed |     
    i686     |     glib-networking-2.76.0     | NOK | https://autobuild.buildroot.org/results/44dd6fd376768e4004c72fafd4bda926cfe1b16e | ORPH
    i686     |         haproxy-2.6.23         | NOK | https://autobuild.buildroot.org/results/e8cf70998899a3702eef84b2e2e4cb2196204a5a |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fb344e1e5fd09cfe0c89ede776ba5a15cbabf63a |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/625b9d9c5f7b683fad98cfd05a707e710b7dc66b |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/46e10110a6fcd7db3b78b9f43ec95834950a6243 |     
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5a47dc04c09f81e97a7aaf00707c7037c84c31d8 | ORPH
  mips64el   |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/297947203cb0dd5d1e933b401fa9c4d141be1b14 | ORPH
   mipsel    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/3e10dcde7ce9a9f4c5eaf68178e0cdd976a7c0e6 |     
  powerpc    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/b76f57d2a34628102b0859917551cda8bbd18ed3 | ORPH
  powerpc    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/e649ba5b8b0ea130d281ca3b04286219948b68be | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/def5183489d4c9fdc1fe1895d27d6d2946acc587 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c3527e17cc14736d48bc09e65eb38fe40406ccf9 | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c2bde811a72d0af66ae77bffb5e428637bdc174d | ORPH
   sparc     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3b9e362a5dd10a8f014e05ceb05c23e12c2a32ee | ORPH
    sh4a     |        host-pahole-1.27        | NOK | https://autobuild.buildroot.org/results/8992c14db2eb797fc3fdb3a4f165c8cb0ca483ee |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/3c22e9dbf0f4a2ccd07e0ddde1f5dd98b18356ab |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/60995b91e1763db643490fb4ef5d48045258bfeb |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/199557c3fd5f8630ef8cdf727b3d812abe239ac7 |     
   s390x     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/4e7def24e4381cfac4979202394fe8c6772f7a04 |     
  sparc64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/81ae11b685de4c09a4b652bbbbba8e4426792929 |     
    i686     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/57af45d430f006c55a41741f16f403710d37fe6a |     
    arc      | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/2a11c2c111f4d7f6f53392e87b28d1d4a3b67700 |     
powerpc64le  |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/d22ee9994f1ae034f0ab925a3e2c2b6857365511 |     
    arc      |          libcap-2.73           | NOK | https://autobuild.buildroot.org/results/a98d44cddbed592bfb7fb2d239149058fe1d9f5f |     
microblazeel |         libcurl-8.19.0         | NOK | https://autobuild.buildroot.org/results/e4d67e38025db487c8ced1258e39c228d68e54a1 |     
    sh4      |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/94227a4ea51c5f92a12fd039413f1520bc798b2f |     
    arc      |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/9009f7ec341558ca43a345b48cb32fe3dd9a1876 | ORPH
    arm      |         libnvme-1.11.1         | NOK | https://autobuild.buildroot.org/results/b9f9df2565003f1a0f2e061e26258022247b4e56 |     
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/a3fac391fcef9d985680b4df4108d6cefe16e556 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/90843e76ad6631ac548b95d18d51b971668d8340 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/2d43e55f49eb36764874afd9af3d8d553a2e8133 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/a20f773eaa4c75b762de492a46ac6f7cda0a5e47 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/87e3936f4454b5d8d4688c55800d5d5318937a39 | ORPH
    arm      |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/cf9a4ec4dd1ff3a07a407e2869efd0023b231081 | ORPH
   xtensa    |         linux-6.12.79          | NOK | https://autobuild.buildroot.org/results/936fe4e88bb70660110077427ec1af9d02484b1c | ORPH
  riscv32    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/5f689f0f5f36ed1313f238677e8c69ae1c549170 |     
    arc      |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/983efddd47a85823d48e0addb66846aacb73d60a |     
   s390x     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/6f26d497b1838f4a02feba9ba21a9c76ff3c3161 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/1451841af752c140b3c96a5e110a3d98d318e16a |     
   xtensa    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/3eb29a6da94a6d5554b44ab65df875912e3cdd65 |     
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/b8328c0751f413f61ebc4c1bc5d023cbc11953e1 |     
 microblaze  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/edcb9937539bc608c225f2b5e167290cc60b2df8 |     
  mips64el   |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/c4269ae688755d0d3fb8c5e65f136daaf2692145 | ORPH
microblazeel |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/2369e58cf72d7902812f05dbb0059ec8d4dc85da |     
   mips64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/7f8a8625ba6a3f7f2f44bfbcb2e69b2d8cb56c69 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/b6ec5cfdd37eee2ceb64a8bfd17febb7712c8a65 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/b9a8491032c713626ffb35f9427eadfe9a64fee0 |     
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/222cc68e149019e9c8a93d13fb95877194bc0a74 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
