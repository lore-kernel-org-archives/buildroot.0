Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B681C3600C
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 03:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05DD861045;
	Tue,  1 Apr 2025 03:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvnVWhxSkSvN; Tue,  1 Apr 2025 03:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 803A76103D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 803A76103D;
	Tue,  1 Apr 2025 03:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0566D8E
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 03:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ECC2405FA
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 03:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34SsSOgXf4gc for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 03:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D9FD405CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D9FD405CC
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D9FD405CC
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 03:14:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb1eso880493a12.0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 20:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743477296; x=1744082096;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2J+TV42F2hlT/F0myxtBOnZzrmw5lywGekMdrHqOf0=;
 b=Q4xjEmmQyx3Pvvzkl5Yg6ZgvN4H1ciofM1sn+I3S3oNg2PuYldglQt46H9wLwm/S++
 QLgQFVVEuVV5K860cDmTSO7Xe1ESIQeTGh3gNnMxgp1iLxNy5yKJcuFzJM55K7Tk2rsA
 YnS62B9kKgkmVzgvU71nEnLVHhBZjHAwmVk/WegW7LUEKncruVHnuCCEkxg2T9keZNv0
 oGkjH+nzWAylVS8HVFCsIhzjTyW+lRSoIzK5qerLmsOltV0LGQadxldxAc0Z5ehe/6/F
 EReiPfv25Or3NFSaDTqGRAFtU17OgXwXf1xQmMXR92qawsBCn3i4AW2bG6nzjmhOoZ2K
 Kprw==
X-Gm-Message-State: AOJu0Yy/Kt9DvchMvHCLmyw+nSXl7Y1TeuU+Mu6k0SfRSWJmU6pLZoPz
 h1ZoIlVCiLWZ5ggPGgbmkcp3ihLDwCs7j+Wt5iZWP12mJr7J1TWcUXZdKA==
X-Gm-Gg: ASbGncuO543lOvqRFW3LwQ/sB98ihepLWRRYyUQEBUNgGRcOO2w5GutcQp1yUMUVT0e
 VeM4VVvggT2icfOaFUmqesxkpVcCOGf4HXsjWK63JQ3ghMsy+LJzg+FbOAqGMUskFXJoWpki2dz
 Sh4S585ba+8/44H4AHdA4ZfKrAKISEni7pd0XHcvm2rH+9wmaYzmBJ0SZyK6E9hE8NnZmD6afgw
 /JEOAdPpMEoBdLw+F7j5iMBK6zo5vi29l9kex2qhax/AeJJ/bK7CnRE1OPV65HXpywhW+v1OV2n
 4rZwoTJA5fzSHQwHWj3mfiwdvCpzfVNOY9gfzUFEZsaVS0bjLmWaE0G6Wrw=
X-Google-Smtp-Source: AGHT+IFpSFFIxb3A+saBvgsGY2obi4Ys6vPaVXg+i9c4pWGiKEtDl1tiGcIRVR8D6RxQyJ8RI+GYmg==
X-Received: by 2002:a05:6402:4407:b0:5db:68bd:ab78 with SMTP id
 4fb4d7f45d1cf-5edf6005ac1mr9533061a12.10.1743477295098; 
 Mon, 31 Mar 2025 20:14:55 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc18030afsm6667027a12.81.2025.03.31.20.14.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 20:14:54 -0700 (PDT)
Message-ID: <67eb5a2e.500a0220.1a3e03.586f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 01 Apr 2025 03:14:54 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743477296; x=1744082096; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h2J+TV42F2hlT/F0myxtBOnZzrmw5lywGekMdrHqOf0=;
 b=bMSO6YgF82/HLYfBcBYIPX7PXZzTz/MNrqe5zjWzHZKzmCM2p/ubx5oz64xa41x9bc
 SVTz4jrIoT3khjoRXwY0MwU0Rle9ZhFX49Y3jdheSx0HyoNtYup4JsyzSuSCBNuMzEk+
 VwjJ+IdW5nb9+W3YSedpK+J9P2HRxFyM8NQQbu+Amc1BjGE2UAxSJO9iY3jRU+sv0hG+
 H8alEuT0jbzbkDHVxAQQwYyxGh304RQu18kQxBsjJ98QkkSA9H3Z0+y8gaeF73n/+wCx
 CKFxuE4ah6MLdM2Xhwotbrlu2BAtVQdrrHVhjFUFDVIRa7NzOH9p7PszXN1cjRsgtnQ3
 u1bA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bMSO6YgF
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-31
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

Autobuild statistics for 2025-03-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  2  |  0  |  6  |
  2024.11.x  |  1  |  5  |  0  |  6  |
    master   | 17  | 257 |  0  | 274 |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.31.5 | 161
                host-m4-1.4.19 | 15
            host-fakeroot-1.36 | 12
          host-binutils-2.43.1 | 11
 host-binutils-bare-metal-2.44 | 11
        host-util-linux-2.40.2 | 9 
                       unknown | 6 
               host-attr-2.5.2 | 5 
               host-flex-2.6.4 | 5 
               host-zstd-1.5.7 | 3 
            host-binutils-2.44 | 2 
             host-libffi-3.4.6 | 2 
     bandwidthd-2.0.1-auto-r11 | 1 
                   bird-2.15.1 | 1 
                 gerbera-2.4.1 | 1 
                 hddtemp-0.4.3 | 1 
            host-binutils-2.42 | 1 
     host-ncurses-6.4-20230603 | 1 
             libargtable2-2.13 | 1 
                 libgee-0.20.6 | 1 
                  libsepol-3.7 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
                   ncftp-3.2.9 | 1 
           oath-toolkit-2.6.12 | 1 
      passt-2025_02_17.a1e48a0 | 1 
                   perl-5.40.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/87670b7280ae1eae8eed3252ed380340e7dcb6d6 |     
    arc      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/beb51ea9287fd745415831e839fc346163d985be |     
    or1k     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/4cac027c77be6762abe308063d985e77f23e92d7 |     
    m68k     |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/41ad2e8b9789d8affa27f72a38bed6cc7aa0076f |     
   mips64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/749cc4d971a09f912f4734ca8d3a77d41217e4bf |     
   sh4aeb    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/07b7f2356192043b56ae6fee0a8329259e3ed3ea |     
    arm      |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/caa4dca78803cc36534e8cfdb3fb6059b09e3e21 |     
  mips64el   |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/5df732f1e6b780b5ba23c4c1aaf6b3222344e756 |     
  mips64el   |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/c46c3b638b5297a5387926cba52b54d71ff6aa6a |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/4d296fb4b65db81d9563082535cccc725e0b1cbe |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/095667763d9f612f2edf0fb4f24260da0795f55e |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fd84cfc83719f54983466835f560502cac0c1007 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4e05f8cb4d7d62c2b5aa1289a9caa133e320f9b2 |     
 microblaze  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/41be7df955c859a1fd3eecec0d546dc714b2bfcb |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ea0e41384979b2fdfa21d90fcc362f63a20d9285 |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e26723b4d2628b744bb8bb548f3db8361c5dcc9a |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/31d21d6c3c0e73b18de776ee4e9c377d6ca986b7 |     
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3bda8fcdd7551eb034d203f0495351564e5b205c |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aec3a176feb2789b3c632425554a06f55e827d16 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/884311686a2043a87b9e5ac0b9e9c57bcf5a5efe |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5b919dfccde9768cea16cc5e8dc31fe5167af78e |     
   sparc     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/e7e14fc22371892336dde284e868f3b410e20824 |     
   s390x     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/dbe2574926e30281405816711ecab55a289a8cfb |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/672f6dd701bad1298a85b7e068ad157a3cac2f57 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/dda2b3eca8f516f69976d3405ad483d534bc9426 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/24cb60a3f4f09881fb479c37b718ceed162bcdc2 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d40281287d8998408e77a08f0ced4093fa8b9705 |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ff55c14ecf49c05a633d483d0e655957fc611d1e |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6f68bd038aeeeaa1aeeff1afedf2ccab6251efe6 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/2d0e5e2ad4536ed62e9328e1be13a30fe7badca2 |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e7a7c694dc2a316d214f0b732063f51e0dedb6f7 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/25b20d0c21cf199f5c72a01069eabc94fc362c0d |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/48af58d39fdf9bc61ae685d1ee0f4d8be42ad5b8 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ee582abb85e8d5d0e7ec9453e7c652d0d5d992cf |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/62dd3fd085650ffb734c457a3d6a007fe793f8ac |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d152042c033c8700c22efd4249002da0e9b360cf |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c44753c9d73bf5a93dd9e10d5ea7c4a72618a6d1 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a9818da1664d2f7556fe4eb46339a25d2f33769e |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/995e570421912cb1ab245d6adf7375e315940178 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/625c17b85d3443ce40a58eb80fec8d7ea3475f84 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/976c126bd8d1d7906e4ec5711cf2f62cf3c0ce57 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/10b7919708d1a14b8f43c18ae863f1292b609e9d |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/55a03e5f9cffbb43bc770cf66eae7f97f90cc22b |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3448a24b562497b3efcd40f593fe1311d6280347 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/07933c57fb12988931847889b9ae650f847b67f0 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/98e939ad0736bbd2bc34dbdd47eaad01f637fc78 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/93806bcca80b3c3eb215e9c40796f1473acd1a83 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e6d37bc5fdda171c015a43424a08ea9d4d88c58a |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dbb172f4bc29e2a4197eb3f01a49b717aaaf0dc0 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0321ec6e40dc46096532ecef3b905bc3728e9bb7 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6739e622d3b10b7be1cc6fcc6711b48322a5ef89 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a2350e07a7504e2e32a5d0a040b635f5dd08e36 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/73743770bf823bf69138051a73f4d226f60ab685 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/731ac536eae07e60adf0b03c6f638df5bb2432a1 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a5d33f97ba7b853689866cdd801aaba2ad36a63 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a9a1ba0410424bca3150d76fded5d464877431d6 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d4c1f850ccac10e2b8d0af58b73f113606b4859b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c663d101bbd09f984ea34342bad939120aca34d |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/249510b53eb26f5a65a3c9350f60ac4e4588f6c9 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/378d8588f88d4d9ec45649cda17f6e214860072f |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/77ce31c66cf06bdd4f5f513d8e16baf6b9429cff |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a0f4461785aa17885f107a0c76dd64f230eca092 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f19feac8b7c0da47dd82337395318dea68a24708 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/31e22a38e5a332badb6999b89be3e38cc45d585a |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d47b39d1e7089dcc1475d2df8eb672f7be1247ad |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2b02b96119e3b5bd5f1fc3d2d82bcd5ba04cc136 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/172ec80171561591ed7c572b90be856ce1d608ea |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f8f5a259b2bea6acf2f4ca987003f1f1030280a7 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cc8f8121e38b58b4e940303050a6199b83cc9d88 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/598ab4efc7b94489d501c98f9861070b95cc8fd3 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0d03d85587212f5ba51fa03dd8c6955d00d6943f |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eaca8461d2d0918ae32cd08f9e8ced0e5e18a928 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4edb11358e1712a5679bbe722046685c3e5c8891 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/06a65170a13daa5c1164c02ae0a4f5864e39890d |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d512a2c3390af5853b6731e7ae72edb1f5c5428d |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/922cc6e0dc2d2a9a30d710205c9be8911ceabd55 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b4ec0415ecc5c25239c77cce772a97e23bd5847e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/038b819449b94ba5546b70d738deddd48bb30afa |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/363b56c3535b199485c3f85514724a7679cbdf9f |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/689b044f88b9f036b1394a34e9484177b80a4661 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/467baf2f9d49c14e07e88de11e03b965a4c19cdb |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/df0530f61448e29ff8eed2ee125de254300de519 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/886ef8f2a71c8b2951576af497f14cbdd8fd4201 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67ab78e1e5f8da0c4bb695031afda139664608c4 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5219c5c1466549e1f16e0534586b808334d08956 |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/469a2d7974c83762ede9ab46fdca208623c940a0 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9acf71fae87b02da673fff0abdfd8bd10561103f |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/712f9a39e5f96a35bc53c9c958e1eaccfea293be |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/393b2039f67ddf32528aac697640b0dc71cd0eea |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8abf1f4dd8d94fe1c4bc79c2c74ee677c5aa55a9 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/716020de399e6fa8692ad4d735551f14b16a256d |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/47a4cb15599ef7bbf5588a33317c51118daba5bf |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e2024394203be25c2a5be9d8bc766053ccbccb9e |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5436b6fc901a4f198da5d75ac46a03d1d64917af |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bbd56fead2212f39523ea5294f254c74ebf2b7c8 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f1a1310c44adca18a786bf3b9090485cdef5a30c |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/155988cf79ab34a13dd23af2a0da22dcf23c4f8a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/82725292ef0a0fa71f02d5c39b06f2ed1132e3d5 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/227f8a20800f1520b1999afd0b771cf88d65314d |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0f429ebb395a5b8f47d8d869b4ef8c7c8b4c61ed |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a0a7e43955fe4ac67a56d81394f77f158fb1003b |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e0653a16b66d86b6c10ce71b3eb323160da0177b |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3585aa0acddebf69c21884063940d3f7987e5cf9 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/43bf60a7e6e1adf028f3a36e5dc5780b4629e563 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/27f26bd6838ac2ac78af046a2bb62d5406be60a0 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/862d1ebabbc051468a07126011f96f754fb38328 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6b3235b3523836c4782ee786bc0259ac3a51ac01 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a2b7959e7a33ec57c21f22a282e63ec925bd9cfe |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/07bb18d4ea94d897a4c16600d052a6c88606ee0e |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2b9ba6c316830e95191512b79e7b0c80b58ca9de |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fda136b75619f11b26566b1837dbbcc667bb05e9 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3003a330becf8c778e757a7e97d8da219bf9517b |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/641260c4b1e1a76ada92316b0733ee7e56fe57f9 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1790bf53aa924cd177a31fa6ede969a20a7f73c1 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c82accb6d603059e50ba9c1cc97379732cf5672a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/069f62cb56399eef6cc546af5cc152ff803724aa |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a08086c4025d004562113bb2ba89cf9c36cdb6d0 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9c4719de43b98da2cef45218048ef15daa99605b |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c01fb11b56ee29a26cb0bfa920e0842cbdb6dcc6 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84f3ebc2ee839c2e1b564766c75234a652175f4f |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/efbd335848362d7ec41f1956aea12e0e236ac6d4 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b8857d6d32de6e72d14a81189a407f2a3cd4ab11 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ba85e60da55714db71fe57d45f49abb33c3e382b |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c34957d319cdde9fdbc4644d0b0e0761787530f |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/766f95540b7d49d877a259b86205f7973c64362c |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e0b73d29dcd471772f13cea2bdde431a8f5c5a49 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8065820be4984fd3566ecbb592c99f8159e7c1cc |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6c7d1d52c626ed21835c5f60714c30fe0c927239 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/012022ebf11e56157771f7b4288ad9ad5256e110 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f9374b81b7503f83f039cf266d9d7c1edadfceac |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0230f7721e7e3407211c7de185cafb0f1f2d5eba |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c259e273c8f0db878d54317782ee6493fc7da36a |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1df6c0c7dfa4f3940601f74a7bf5fce29126f38a |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3c3e1550a68e7915f7ae41bd0ac471e2dc6b3920 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a3bf186247ef87eb7924f9a4971149ed2c08263 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4266b65cc7c514852f33a4405bb408f1734362eb |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a55ba53200e1ff3dcb6125ac85b91f7925cb8b14 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cb903ad8ae44d4a3d62472d813c42b3fcb07f940 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/28a9ea216435fea74b65260d7908beb79177ec82 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/50670749d2b025e937aa2bb0dc70b6da41f985eb |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/96381a2a41df8dc40793ea4301295ed6ab225e53 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/45ce3fd0bfaf24e63b39a99593ddb0c0e7ca3f29 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/254d7630f4f805bc2575fec51fe2068037c75621 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/65fe70dade86fe99cb0f9ecb325ae807e11fb45f |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c9d30c748d9b208a81cd8af7eeba4434a6c08846 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74f74e9d1b2d570e03da829e64e8a2e8a9ad46f0 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ab2ef0d31cf352daed1751531df7568dbc36392 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d1d2b4de8633b409453a8b78282f2ecc80c28625 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fffe23a592cca28f788940f0276f0aa0a822587d |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e8324c24a23eb83cba03294de9b2dbe057f405e6 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/df95283ea335c3d2829728ff5c7fcc6a169f8323 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/49da057a184cc8304b451d07e4e33f1e8ccb8742 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/078d4a292aa370e038429ff19db85f80b0d1f9ed |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a00c39429382357bb12988ac3d65300ac0d98671 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a8ab8318832108fed84cec869208d46b7333ceef |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b113de27d2dad7974d98ef19b83b9265a90402f1 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0225f2e9c40bcb3a856a46d037bd08c1f3e9c612 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8d34a06d17c4924ef0b607b22d4fb9c22bfe3a85 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5a934111eec5eb4d509a89195e3e2e1260b7e8f9 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d6d4e1682fc301dc7fe9509665a979389680aad5 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4e5189144cddb121d7520b818a6a6d45f85d509d |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9a7574ec6e88bcf1e02344e7e857938461adda44 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a8efa1a1aa67275feb56e075eecba68f457c5c3a |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0cfb53f23f1b58d259a63cc083a1e9f5d871d6a5 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/268ecaa2cbcc878ede5869f1cfc0163fcda5aab0 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6280da07e5e9015cfdb1afd136b4441ac51559dd |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b00426008f4b024c6c65e3f915f8382654d1fe7 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/326f880c66c99660b108bda7a16d617bd80f1750 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cbee7a4f7653cbbdcd317048b84e4d8036dc13a0 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8d060af96af01c381ee4bfafc498702df4522920 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2d1d237e79bba4a0516b5da23da07e6bcf1530fc |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/56e12b5b7b4af60709e02feb5da48ecfad7ba728 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f2e0dce76e2941da69afff15b522640d3bf7db53 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b56f121b6a8ee9fb7e1ee27bb793150f67e4880a |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/52e78276e7be7673315514711fba0e08837f8b50 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/180242ebc0a75387a9bd31aae31dadfd869eb6f5 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6fce87f0e6f6f5c0484d830fb01577f455958a43 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ff85fe7c2b423061ec59d1288b096acd149e8b3b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d6e3af9beca405afee47ef3d1f67227628b5475a |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/01caecb7204ae16e8f814798103e2e0cdad3a13d |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0dc27b7c8e4dbfc11cbd976d6861d0578838b98f |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e28c095808617366c37839cc21722a3d7a1446bd |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/632435cafb066c635c2a2a1ea7dc54f50021697a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d979caed02b00254783a5bee6d2722a68c14ff1c |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2b3f85b5be0adb2132d0011e86492597456062b2 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4180ddee6682cc4b3fa7d167b09de9489bacf575 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/72a9625e0a03f1d25ada6ca878fe2c1a5f2ab704 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/632c7ab10baae13207f571e73d2d4c75f120c62e |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e64f18459ba31e7c7d166c834698b4b6c294e428 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c071319a6b629a36d09f90a7e7f233f43fdc8b0d |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/59db1a940bbf0094668d3a94971318b6b94fc4b7 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b1300d92cbd0ea97aed1ec32e119ba5f95a25d74 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dd6391f509ada3c231acbc878e47a9c235f1b10a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/198a89f905b0c5ac375dfbaa4f3afb0771e41d53 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1123132cf34820a0368a4a8eab7dffcd08563e7d |     
   xtensa    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/8754561fb2b2cdd74904c791f9bc03e2fe805ad5 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/ec3e4d4ba0150df7e8e74eed41df595685da393f | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/8a42fd5dd8f55773b42e3420a9ebd60118704de6 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/ed10ca2594938f41c514de62cee2718eb8362c7d | ORPH
  riscv64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/fdb98aa02ef02b6dd9b6f1ebdbf683a3c9e82c69 | ORPH
  powerpc    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/8b601a74de1c9f937de2a35ba183d9104fe96155 | ORPH
    or1k     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/5afbcc8c4f675505b21dab5f011b9de3631328b9 | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/96e526aa00f3e89cc8f137430a4852a13c5e67cd | ORPH
  sparc64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/f15cdd68d8e825630db2dc3238e0ef19d09f167e | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/1420978b2fee32d2f09b32c862d6cbee74d34a26 | ORPH
    arc      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/6c427476521bf02967bd295f32f299f7882c53a6 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/a6acf8cd3e2e1e0cae2854d36bcd5b015c51133e | ORPH
   arceb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/3485499f9814d652e82399cdfb160e1fab295875 | ORPH
   arceb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/8e7e1c0845418f6d163d001b32c0f77b59821eb3 | ORPH
    arm      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/0d294d490121b824cee0ba2da1e58867f1903723 | ORPH
   sh4aeb    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/a478eea8060f4279d0f3d79dc23f9fab7b0d2819 | ORPH
powerpc64le  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/64661ab97a4a48863f89d196137c02121423cf1f | ORPH
 aarch64_be  |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/cca282de7cd87baa4a3ce1d7ca3d65e4d8cbe85c |     
  powerpc    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/a4f3e6c88c7124903ed0e3018f3124d359d4fe1d |     
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e6f88e4aebcd1e248cf7a1df697de8353b9de0a3 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b4d0f34ccf3506c02d74b4fa84c04a16fc2f0b66 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9a9abb2feef81b7a06a3e35888fa1c54f9840fad | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d679a7a541b4d0e8ad9400343348fc854ae68e7a | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/53b4b7cee8dd884285a898483459e250020eb416 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ad481f8e012b0ef7d5d80cbf7e965849a1222d7a | ORPH
    arc      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f23677db300e6a07928aa462fd2163f5c98a1114 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/09090c55fe7d71d1c521ea306100c15d52c4afe1 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8ebad4c6c012ca252ff7a180a772eb6fa7944b97 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4410dc570bb55646f2b5ac25402aed3867dbb9c2 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9178d3d4fc45c0c4548cb08befe1da47d2269705 | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5904284e06a9087021d889866ecc64590b8010c4 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fc5ef9fcfae6559b3908b3bd993fefc9cda017cb | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d865c38db0adb31e801b116cd5dde7875ba53b54 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8216a1c4404ddb4ac9495747570006778652a233 | ORPH
  riscv64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/52eab975362529820e5e76e93d5917044d070681 | ORPH
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e05d8aeb17abdf21b972bc8920ccb3611d421b21 | ORPH
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/15f6359c8be97d0bd2811a956841914b7b81dcca | ORPH
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/91553d41bbc9cffbb3855515fc2da7c6aeafd6f3 | ORPH
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/502c52357a0c1d4d9e622d2742714ffbc3b0234b | ORPH
    arm      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/8477af6d80da1c130a95042741d19a52a9844029 | ORPH
   mips64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/d4ecc522b434f9ae6253a299e10118a2cceb0369 | ORPH
   mipsel    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/d2efff2edda52fe8b170a1172bef4ad05aafcfe1 | ORPH
  powerpc    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/a3217cd1d65db60ffecc9623a2b315a88bfeb272 | ORPH
    arm      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ccfdec84d5bc81c6ac4e5b111ea991dd3ffa0257 | ORPH
   s390x     |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/c41b89ed0ba8794486a5acb6330abf775517ca84 |     
microblazeel |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/7bf5c18c796b40c2e893310f577fc1bede9a5061 |     
  riscv64    |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/2bb3977415032e18ad1384c9f6c8977a0d6093f4 |     
   xtensa    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/ab021dea491789c3d514363d7df030c01df9c57f | ORPH
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a41694d913051a184079558addd19f4561faea77 |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/3c8943333c8ce23b68061e2f7249bf8fb7cfbc05 |     
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/9329a3af03633a62c31e902bc611cb6f64e37382 |     
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/04e82dbc0ddce0b88fe14cd506208d29a4eade4a | ORPH
   s390x     |          ncftp-3.2.9           | NOK | https://autobuild.buildroot.org/results/4146116bca17eef6bda26e0f461c91a60d6b7a58 |     
   armeb     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/56658550577ef6aa61d2f11becf501b6212dbd77 |     
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/435f28d7952eb647bd7ef8aeb4612ef90ab35086 | ORPH
    m68k     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/a2fdca5bdc0df109004c461596e61c787e47c970 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/66e990d93a782073510d1fe7335cccfd76a486a0 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/d4fbdb427d07cc0482164289ff76f313942f4be7 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/ffd33f24f325c2a671b3aaa6d62b771af1ce5297 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/7b02daf862e607b926ec20510d2720532d3934f9 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/e1eb858b31118a6f22be8b3214ce771f37c77033 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/fc051f951d10534b12d843fabf9cf509b703b150 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1f186a3d50af0cad90a1770a8388f12aa25add3f |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/51364c33b1fc5ea831853ea0930435c39e410b9f | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

                 c-ares-1.34.2 | 1 
              fluent-bit-3.1.3 | 1 
                 libssh-0.11.1 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                       unknown | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/4600e3bb4f701be964dcb3b93b26c94ba36e889d | ORPH
   s390x     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/f5620521d03510e83ce5611a7e3bae13c90d99e4 |     
 aarch64_be  |         libssh-0.11.1          | NOK | https://autobuild.buildroot.org/results/3ef12a941f7d155f71ea23cace96c98d27834043 | ORPH
   sparc     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/2a43fb246b73a7084e00776bb929f4d878704e52 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/631f8485d19cb7a7f74d7f332c90c5ff4012ead3 |     


Gitlab CI results for 2025-03-31
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569780007  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569780006  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779993  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779989  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779924  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779845  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779837  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779835  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779789  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779786  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779776  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779764  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779763  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779762  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779760  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779757  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779755  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779753  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779750  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779748  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779747  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779716  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779648  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779626  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779623  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779554  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779553  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779547  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779545  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779544  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779543  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779541  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779540  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779539  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779538  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779536  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779535  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779533  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779532  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779531  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779530  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779529  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779528  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779527  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779524  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779523  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779522  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779521  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779520  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779519  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779518  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779516  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779515  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779512  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779511  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779471  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779467  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779462  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779447  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779400  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779391  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779372  | ORPH 
                 test_run | https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779338  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
