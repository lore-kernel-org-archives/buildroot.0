Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921FACD4F26
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 03:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED3060AE5;
	Wed, 24 Jun 2026 03:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qddri58NxAC8; Wed, 24 Jun 2026 03:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F6260AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782271712;
	bh=i9n03Wx7B5iTr3vp18TAsVBjxj9WkmbV59MyiA/xt5w=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kh3UrsmxsLu8M4xiLtE/Zml7DsT34R9OcKT3L7UNEBtWmHZxVJ8Kl8edzTk/+up4D
	 YYCWaKSb4WQM0bFMEllOQupIvTrvc4PxD7LjLhmsL7zdkVzDDAZD9mHjjy3hKM1fuO
	 mdJp7msjH3M0IJhyWjptKPlsn5+NfUawcWxUZ7NUO6MXlF0BGd3gd579DG+KftKWyT
	 WEJntecLL3qtO8JyniF1siTea4jbP010peHAoNyOM8o9a/q+paMv80sie4q5XfdTzN
	 F5C3ML/cXiE1iZliWLcgSHJI5/0X1jl1A2IDxPPnAbjt9UM54DOJK+OvGWh/iY1dHI
	 lALHOdXb0JZqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F6260AE4;
	Wed, 24 Jun 2026 03:28:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A966A256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B5B481DE7
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUG840dHBPrC for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 03:28:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5929781DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5929781DE5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5929781DE5
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:28:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so6274365e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 20:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782271706; x=1782876506;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FNKxc91ux8BE/npM87DhvpUqVCmExabc69yNgqOwg/g=;
 b=gQeAaLjdFglLMWbp7QokiWvC1/Qz23O2rJo1W8ftK7zS3pDk0GZWk9HO4eT86Envr1
 xDJHBJuOLNMD/94knvp2vDDi6vld1e44jonLwcMUYmxuWHlYqE1E0MsL82611p81SMQm
 agtH1nhbWg4S8ge1mVV5sQybwjY6ZwOA+lizTwJ8lNKKmOVoUVdS0nZNpQU7TfesfbMH
 M9UwIc6btxoIHKObsjlt8yl0ELhB6Auy18tgT+xTm9wSJEzh3TeQj0IYJlr15x68kkB2
 STo2L+8IjjJ01xmvXeYYFhU8GIL26v0+ADI4ogEaDfv+vmIrPGtgv8TQoCaRxpnLVkGH
 PORQ==
X-Gm-Message-State: AOJu0YxpQxNzwjcR3woUhKnZa83sAkay2GhWWcrNrloi+YK2vOO37MSv
 SrpK/kmeBOVJLOBNnxTlTjEUlpz92Ogc0TG96z0GVGMkDB33alzWKDn0t/9JydIA
X-Gm-Gg: AfdE7cmvfFBfcSyTvEbvIn7fgdOQuw9i8JgsqcXGIw+/MpiWlr3bbnbhN+4vXgHW3W+
 OGqWoXZycytF305koNUagt0fAcu5P847wihpPzG7IXY41CM75Y91b+PkLCDTLb0MJHk4Mm9aD9T
 4e6TQ7iASeeudhCSzaDiRWXglGi6sHRmQZbC5c533r2bqj2sFZ1LUpI7ndGz2rn18aGT3NjrcJ/
 iTwpzUrQMmXr2gwC6BSvxa3SriGLEYCJsfO0UzX+8QLBirKS1RVP3MpkUrjJP69aTmM3ZFv0xYV
 y5YF3In7lZSWp5GHXSNT9eeTzZjsx7Zl1u667IKICaro+s2fHl5lsKyRVa5gk30CIy2zEHCBXxE
 whNBjql8hJt4lpMVU/KpWQGHoTKplzBwM4Xe60ZTE6hS6Wau5xw7HAD7x89vJWeRY/9F6P1M5D5
 nUmd2O+0Eb02lSYIE=
X-Received: by 2002:a05:600c:4f93:b0:492:455e:a161 with SMTP id
 5b1f17b1804b1-4926086d0e8mr16321315e9.20.1782271705812; 
 Tue, 23 Jun 2026 20:28:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd154fdsm392578775e9.1.2026.06.23.20.28.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 20:28:25 -0700 (PDT)
Message-ID: <6a3b4ed9.a05553f2.30663f.6a61@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 24 Jun 2026 03:28:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782271706; x=1782876506; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FNKxc91ux8BE/npM87DhvpUqVCmExabc69yNgqOwg/g=;
 b=BeM6ahbvpVqnqGoIR1N9lQRI7rk+BXRnywaPaUPG8QepoUKPDehwPJB3JJdWQCU3L1
 dep0K3hCGDEYMOJujbzc8R5yWH1eLa1wJdieF+KATcv8C134a50RD9rFbFWtQp4Fl9bh
 jF52PZk0CErTysS+WzAOf9p+uK2jNh0W4v5mT84bUymYVTWgrhWi7K6kzyjl+NyVdHJs
 8DLCPBMNPAvHwUTb1vF/EDyaFN8k5dK3kQesjmjD9WegUrW+1sE3Ou49yBoQiywAgoy6
 MNYpXvMqX3TGFAu6WEXm2Ar87QTIFaFejUWTg8+VLHWzVVoDy3/1jsP2c42b590hN01b
 rBYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BeM6ahbv
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-23
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

Autobuild statistics for 2026-06-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  | 10  |  0  | 12  |
  2026.02.x  |  1  |  2  |  0  |  3  |
  2026.05.x  |  0  |  3  |  0  |  3  |
    master   | 49  | 170 |  1  | 220 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 19
              host-pahole-1.28 | 9 
                   ccrypt-1.11 | 7 
                   perl-5.42.2 | 7 
               host-dracut-110 | 5 
                host-odb-2.4.0 | 5 
              host-guile-3.0.9 | 4 
                    olsr-0.9.8 | 4 
                 systemd-258.7 | 4 
amazon-ecr-credential-helpe... | 3 
                   dante-1.4.4 | 3 
host-google-breakpad-f49c2f... | 3 
               linux-pam-1.7.2 | 3 
                  ntp-4.2.8p18 | 3 
                  stunnel-5.78 | 3 
            18xx-ti-utils-R8.8 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 2 
                easydbus-0.1.0 | 2 
                 gnupg2-2.5.20 | 2 
  gobject-introspection-1.84.0 | 2 
    host-gcc-bare-metal-16.1.0 | 2 
       host-gcc-initial-15.2.0 | 2 
                 host-gdb-14.2 | 2 
host-vboot-utils-7dfa482d6a... | 2 
          host-xfsprogs-6.19.0 | 2 
      libabseil-cpp-20260107.1 | 2 
               libepoxy-1.5.10 | 2 
                libgsasl-2.2.4 | 2 
                    ne10-1.2.1 | 2 
           oath-toolkit-2.6.14 | 2 
      passt-2025_06_11.0293c6f | 2 
uhttpd-15346de8d3ba42200249... | 2 
           at-spi2-core-2.58.2 | 1 
                   atop-2.12.1 | 1 
                  bitcoin-31.0 | 1 
                       busybox | 1 
          cloudflared-2025.8.1 | 1 
                diffutils-3.12 | 1 
  distribution-registry-v3.0.0 | 1 
 docker-credential-gcr-v2.1.30 | 1 
                    dpdk-25.11 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
              erlang-26.2.5.15 | 1 
                espflash-4.0.1 | 1 
                  ffmpeg-6.1.5 | 1 
               freeipmi-1.6.18 | 1 
                    frr-10.5.4 | 1 
                     gdbm-1.26 | 1 
               graphene-1.10.8 | 1 
                       gsl-2.8 | 1 
                haproxy-2.6.27 | 1 
          host-binutils-2.45.1 | 1 
                host-zic-2026b | 1 
                   i2pd-2.59.0 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.86.5 | 1 
               libsigsegv-2.14 | 1 
              libsodium-1.0.22 | 1 
   libtorrent-rasterbar-1.2.20 | 1 
                   linux-7.1.1 | 1 
        ltp-testsuite-20260529 | 1 
            minizip-zlib-1.3.1 | 1 
                   neon-0.37.1 | 1 
                  netsurf-3.10 | 1 
                  nginx-1.30.2 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openocd-0.12.0 | 1 
                  prboom-2.5.0 | 1 
               pulseaudio-17.0 | 1 
rtl8192eu-9664b2bfc4bcba55c... | 1 
                 rtl_433-25.02 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                      sed-4.10 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                    szip-2.1.1 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
               tcpreplay-4.5.2 | 1 
           uboot-tools-2026.04 | 1 
                       unknown | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/062c2ebd2a9ba3bb82b2b52c81d0d3dc828c3d5c |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/15698bf36dc099a0a3b231ccf8aa57a2c2606d7f |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/95128be03e1525a9574c445700ba2f4ae6a874dc | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/bb5b3a2565d17f282f9aabb32beb4d5ed3539f03 | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/3355151236401cb0aa8eaa802cdd189e528b58eb | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/c87457ca3b99ab1b9c22349baa8850a659359d7e | ORPH
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/7d8b23413eca9820cc06e79a7c4586396b8be97f | ORPH
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/22842d17947f8d017139df96d006628bafb7f644 |     
    i686     |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/7808cab0ab4d642d12e39e8a00df9d2c2d82c2cf |     
    i686     |          bitcoin-31.0          | NOK | https://autobuild.buildroot.org/results/190e2fa08eecab44a8c73541836a79d7c5834af4 |     
  mips64el   |            busybox             | TIM | https://autobuild.buildroot.org/results/57c1eadac93dcadc0c4bb36e2ff426546f88d128 |     
    arm      |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/94c8536ce3585d49ec69f0eccae21e59042bd86a | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/82c57ec2d99f5487b145da537faea19c45c254c4 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/38759772749714a04201201747c62c0aeb1c5e8e | ORPH
    arm      |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/cc753c1c9aec149b4960cdc6ec283e32208a669a | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ce1254a285a9e9ea619266c4503d50307085798b | ORPH
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/85b11a50f4096ead1f27ebb0ce3d8b321162ee16 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/750e0cbf3e8b13291fac066c0e0845d925aa8f79 | ORPH
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/c4e7e0c784da2360d02b4935bc8d03ba6427b2da |     
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/cf71cd67a1a4ff461ddd0986382c688865e1aa3e | ORPH
microblazeel |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/4e4abb9f841c1565a6eb33c59b6ed7aee4ec496c | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9ef117c6e9603c2a854895d69d80579110892896 | ORPH
    i686     |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/05f467bb03f38420641127e0c5322266c6584dea | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/048f6ccbd9924c61b361f33d50d78ac643377ab5 | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/ad5c678d2ec93e8104f5b62092ca379720119bc4 | ORPH
   x86_64    |           dpdk-25.11           | NOK | https://autobuild.buildroot.org/results/e5eec36404dc1abeefbf04a8551c145a3d91fcf6 |     
   sparc     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/06ced9e4465178c56a5d4d4607c56c31b125437c | ORPH
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/83bf3b9f4d8e5ebb6eec554f6595fc4bf2770c82 |     
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/1192675c7eacf000988a98165eb4f8243a5ba6ca |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/239c77c5f01008b451e4c5fab8cd7ccceba5c91e |     
  aarch64    |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/b765a0f8d07af0ab92a3c0e6f05349d6315664d0 | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/52813b3505dade06169701eea9f728ebdb49c3d5 |     
    i586     |         espflash-4.0.1         | NOK | https://autobuild.buildroot.org/results/4e38ce3963b2071fabf011d99a1f12c9a3ee292b |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/e85690be332d9a88904e1c09067c95a752c0fd44 |     
   mipsel    |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/5fbc1d0e75dfaf5cb71cc3ba29599fe679ba996c |     
    or1k     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/fea65061eaa60b0000504fe34d6bc2eb9e668097 |     
    i686     |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/fa208d155e35764a4862575d443e254aea0f7d04 | ORPH
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/62c4d08044f94fbfbe58e1ae217b8a6910b5473a |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/f68c8ce39cccd50e5de1bba26693686bcb1b994c |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8801bd2e12be0dcdabe55d7f91a7acfcadb9d7fc | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/100ce1625fe9f7b41f16ceda8e789b4b27ce25a2 | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/68eff3b42d3507dc9e17349a634e09252a1a97b6 | ORPH
    i686     |            gsl-2.8             | NOK | https://autobuild.buildroot.org/results/19b0193e9cdd2581993965e7a3227f83cd5964b2 | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/0f6e220bd1b66e0de3c873f0c395da90378e492f |     
   x86_64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b4c0feb13bf46f9fa6446b5a014ebaf023aeeac5 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/3419384a020ee54ae690a2282f6009abb6ec74b7 |     
  riscv64    |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/30dbc71e34bf33ae8ee786c3caf699ac3cd73f33 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/417452b367d56b8d8eca46256f86cc0d67e0874c |     
   sparc     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/b69c0d5b1c330987d74b5d377fd16c4837bebabf |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/fee27da27f1b3ef63830832cd45d361847211cf8 |     
    i686     |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/ada57b694125afb9630950f6ba52179b5122d297 |     
  mips64el   |   host-gcc-bare-metal-16.1.0   | NOK | https://autobuild.buildroot.org/results/90a1197fd6ad6d3ac088bde09015a9ee230b5be5 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/c5597a5c25804c1ed15a0d6e1aa29485a80cd38d |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/9512d7c79d4124a52eed71d3321e56ae3e6cda74 |     
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/329f51635484ea48b6b66c59b22508dc8d83ebb9 | ORPH
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1df0f9341c99ccddbdd8e388038fdc499b517d7e | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6967946e4548cd76a256843dc6010f285208a288 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/58f0b79e1f03d2b3420a2dd62a8671ba9a58478a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d70c9c483c674dbe25409e56d8a88bcb1b018a27 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b7e1f4df61805a118d27498ff2b964508a48a33e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7215a5cb95205598d044c6c3a07cac630335b0e0 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/78255f2494372c3b78c4db3c667bc5e399b74f3f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d2497c40e3c0502521c820e65732e6bc46f9bf36 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5fbb8d6f6c712a6e56c39f815b23eb67eb811885 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0d894f96f3d60b0d7f2977600b9965f8019c0125 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7acf261dd746fcde602e657de48b2fa32b108e24 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bbab68aa5556dd1ddbf26c10f829b7e51214de00 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c171042f455b344e2363355fca4a3e8a569ebb01 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3a51a3bf89931adadb8480c0f79528c0443fb469 | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3ff45a51264a6d45b3b41ba51225031a1daad630 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4fc19d48eaa1777eb2c152387ece26c5a2599938 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3656a9e55a16f62745d8cbd494f590c53681a522 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b80bde8884aef3a70168110d8249ac6675e34531 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63e886fc494b797ef1f0cd06d62b462919bb98c0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1242703497a3e461860595cc79d978b19df1c9d5 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/10b5f1a92f94978cd90650a52a6ec08ec7efdc4b |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/ec49f92bd204782ad292720c20bb9560f96cf924 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/92d36c75068c8ef0cd7e76f3170f6c856f4f549c |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/1d526bd095bfea9989abcbb5556f6539cd69142a |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/45f520d9249e21090b1fac32026e760b7c2c7a7c |     
   x86_64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/13bba945b8ea64b48388a21f174dfe5b35d91dbf |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/bdcce6dac0b14b59932e1d6bbd3c6e3223cea9e5 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/8a5f76b78486fe3348d3fb32ddca90a002437b8c | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7567dafb37ac7b4c2e89991c382392ed3708531c | ORPH
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a28817630a5ba300231a4eaf78ec74762400b39d | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/222261f6f8be56f7c2417b9b48b7094e5ebb9284 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c04135652dae86574639d62b6a812678225f94b8 | ORPH
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3f510a14cc1f3eedb09d91a0e051e4f007c7fcc7 |     
    arm      |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/953ff524f4930e2b6f091d99da62d23a3b723714 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/785bb9b70d9072313c44b4330fbba35386e0b7da |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/16339e18ff936732ab9de613fa0737c7ab572777 |     
  riscv64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/1a335e0a263bc6a166f2e557bd7287789a3ffa0e |     
 powerpc64   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/273fd375290953c722eb9b58f6f9f25aefd3b552 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/087f56528312e8c5f02f10e436a2222ec7a3cc5d |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ffa04d2ae15ad08d41fb5854f5111957a2dda8ba |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/a6541c4f9f86c68c772e4388d3a68273d81b039c |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/36fe82825345053b34c52534e160b59d376276ce |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/c23c95a3115fd69d75b1d07269d1fdcb847c1fb9 |     
   sh4aeb    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/49c4db8b3774747f08c98af5885d9f209674ec22 | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/ad37659ee30703fbad09d0ef8b52c046be92a39c | ORPH
    i686     |         host-zic-2026b         | NOK | https://autobuild.buildroot.org/results/b1dba9a1a8ff7ebbb3dcd20f68c5daabc851b634 |     
loongarch64  |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/7da136aa23db1f78d7703b994c258d073fd80b74 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9c9fdc8c59e3f89648c07e39c5ff3e979e8bd8e5 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/da02a3772b13a0ef7cecedc1fbecca13f07f621c | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/589eae7d8ee2191a2f0b24d26007629e4bccdf55 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/f93c31e4e328d0e96617e52b7a4204fc72686c6f |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/57e54e9f4bebfcaa123e1f19bba26e3006f64c54 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/d243edbd9fa11149b28a7fc8f05f54431df1aac0 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/cf68752e6fb1649075309dd2c982c787c97c62fb |     
    i686     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/58e74e78b5c4efd5533f815c21371202043c65f4 |     
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/8b72287bcc05d236c9f6889dff8330ce7ba8ae13 | ORPH
powerpc64le  |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/10cbd7ac0c983b27bdc3d50353109a3bb86cd2cc | ORPH
  mips64el   |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/3a667f13fbb3e3412347f40bc6537cd60d7c9185 |     
  mips64el   |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/2de61d31fbf1438b0bf330613e25c7ec47924d39 |     
    i686     |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/687c4da5ec9cb23c0b534062022285cc359a75cb |     
    i686     |          linux-7.1.1           | NOK | https://autobuild.buildroot.org/results/ab633661cf4eb4b1b513b644bde416f89e110c17 | ORPH
    i586     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/ba930df394373b52125ec3f249781ad6ad2d2772 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/214e747a24cbdf32e45d33d6cb55157276f54aa3 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f120f915657b70f6be450ce94eabc43b33f9d59c | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/deaacf68a0e1ed0b1df3cc4f96839752dd4d5f88 |     
   x86_64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/1d9715482a0df0b8ae3f40d846723ec950efe99d |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/b2bf811eb93077d150a374aef1fccf6869470c97 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/e6c58019729475d4850590cbc30d8181c76fa6be |     
    i686     |          neon-0.37.1           | NOK | https://autobuild.buildroot.org/results/c27a518ba19625185474742595b724034f5f50e4 | ORPH
    i686     |          netsurf-3.10          | NOK | https://autobuild.buildroot.org/results/35ff22c521fabe6bfdeea0c42abb2bbdd1027db0 | ORPH
   sparc     |          nginx-1.30.2          | NOK | https://autobuild.buildroot.org/results/4efd5ca93abb181d3a982938429db00f235031e1 | ORPH
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/311144a1bc3d553e59b4797d075dd9ca0def406f |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f4218d898034562608e0ca96360e899c8af8c498 |     
    i586     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/395a3b18719e4ec0c0b94b0692caaa9566ee57c6 |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/64d8c1dd9463bf8113537ab0628f8baccc8f12f5 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/a67fea6dcf6bd48e410998ea1d1a19593f1a3d91 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/34a3d17136e43eabb3bc93e1bd9459fa609b0a6f |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/a2622e4374fb7153e9349416cef17cf2c8bc4974 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/0139edfec93672f9dfa69c4183b7c08488b65078 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d34f7bac0a7c3e00609b4d792da6bff492ae21a5 | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/5753d2e0123b97d5230caaecfbda593560ff6501 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1c86a1af440b8c7b0e3470dddcdaa25e53aefb58 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/615b078351533da9acad2b2cce2991bfd5d2da1e | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/bc5eb1e1245ca4ba9d2f2375d8071d50a861b73f | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/2044b9cdef1c8463f0f12c286610a7d1d7d50320 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/724040fa2d3a36d71bb33aa92b1d1e17edb835ca |     
    i586     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/81281a2d895bc5003f9a669645396a457620cafa |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7b44df487e6343c2df51fdabd55827af41feeec1 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/11b7494bcbd47203237dffe25da784fb8d38b1e0 |     
    i586     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/3808abc31989734b42c889f1607262b573b349fd |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/127600fb305ff6ad56a7cc59a0d4c9f59142f6a3 |     
 microblaze  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/31a3fc95bf3cbc2843460b9cf7b7d2742a9be866 | ORPH
   x86_64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bdb657b2369fc7198f7c33dc7588a26de2a7c0a7 | ORPH
    i586     | rtl8192eu-9664b2bfc4bcba55c... | NOK | https://autobuild.buildroot.org/results/102bcca56dc21c55f700ff0e87491474fe2ebddb |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/928fede1d7cc1f3f021dd0272f60955e8f308e4b |     
    i686     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/9994eb3f8e0fa1c7f48312707e5162c97f52a15c |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/509431d72a4365e5fcd04f468825e8bc5ba6332b |     
    i686     |            sed-4.10            | NOK | https://autobuild.buildroot.org/results/8b3f4d635f84a9d86b62a70e7c9eb92ca8b86dd1 | ORPH
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/ddddc123f42f782d290c0eedf81aad6372309a71 |     
  aarch64    |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/d4a859ddc4e7e173e9788fa728909af8c69567bc |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/6af71d39c5c8999ae9451e086ccedf01b0acc23b |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/f292dc231cbf22edb2069c6198952b4d4ecc5eab | ORPH
    mips     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/356b09e0c0bdac4be42768cbb6b04b715d044a51 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/ef4b0fa8a8e10461a1e14f7d956c287957b5362b |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/e13eaf307af9549b8d8181930e68cb5b9deaf456 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/ed53cf6a1ea7ba9ede0131a598218d1fc2c740ec |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/0e960440abd3b6b16cd88f6f7deab70687a36ed0 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/45713d02dd1d75c0167473ca251360af61d3242b |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/aa3c6269ad299586fac3bff12cafc95b8b8b0886 |     
    i686     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/4b5d5956813dc03b1a462eb12f64ccb9bdb9fd75 | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/b93c5ad5be949c5d8db4d3c5d7148f7464167893 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b3b98f1d90d76b2d21cc12ef5aa8d6667ad19104 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/33e6adc4b802083049be2ce541b5c5140a8c088c | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/236279d96394e7d367f81cabf4297eea696fdb88 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/303d2890edc4e7c1c3a3b2b89a2a5525abc5af0a | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/fd06f38f78f6b79a551e6cbc0a59ff5270e1d834 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

      libabseil-cpp-20260107.1 | 2 
toolchain-external-bootlin-... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/8abf1ceb33f8f551cf07dccd36c7798894134b02 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/77d9bc35bef54790fc5eaace165d9b9bab055307 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/b26d5686cf40223259f32634a25db506845912bc | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 fwupd-efi-1.7 | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/4e0628e754a748a7ea3b1d120025dcaf102c45f1 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/eb317b32d53d242f26ca65a9bf332bde144b243a | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
                   dante-1.4.4 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
package/linux-headers/linux... | 1 
                    qemu-9.2.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
             strongswan-5.9.14 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/dbca19dcd49d0ecc829440efc0c631250b447a85 | ORPH
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5642a7795b5aab28bda45b3398dd291379eaedf0 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f4b74a45fabefa09efd4c33d90071280a096d9bc |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/774d2e34b5af1712c6f86d22086b6bf59781a941 |     
  aarch64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/9c30c4ea0c2d8aff5234f1c416d62dfe0e1b526b |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/91a51fd37252f4b91caca8cac46875bfff4a2743 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/c34bee2f18fb8aa2238e613724b554608e141749 |     
    i686     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/599e488a34b2d06b6e3cda45d5ef03894b5c8863 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/46edcd67c04eb114f26653f3823899de108ae413 |     
    arc      |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/189f3ea1d3bf8706a49f7159b94af39ece06ca12 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
