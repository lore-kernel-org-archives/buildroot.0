Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E368E6749F
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 04:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1063960BCC;
	Fri,  1 Nov 2024 04:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpBWqVUY7ydQ; Fri,  1 Nov 2024 04:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34C7C60BA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34C7C60BA9;
	Fri,  1 Nov 2024 04:19:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CF37979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 04:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E16794094F
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 04:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjZr2YBO-UVN for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 04:19:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54D2A4093D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D2A4093D
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54D2A4093D
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 04:19:03 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c935d99dc5so2165908a12.1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730434741; x=1731039541;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XeYQb0WCqUBT2b6Xy2lotLOIFRlSF+46eYpGwNphQtY=;
 b=DI3Oj8oGTjU4lJPIrOkg/gcEgC9DqI9sEjeRBug0ShI3WJJZYB5QPBCT0x7utc3abi
 uYOd63GJsc272T/aRE/sli406MKnMNFSPm1ZZfEm19N0XDiJ55lCpuSeIycJw2PMAMbi
 m/iUrbUYEgrD57goSGCVcCFQO8wpb5z/Nj/rJ5jStt14fg90/DQzHbqkC2c/f2+0SvXi
 SUs2ONNSyY3HTi3SgaOv6+MW8b5yvW6D//w7YKGTEp0p09zs3YEiKj9RV7iWyGchwrxq
 kGqIpObKD4FvvO6Ky/l8ldVvs+PIC6IutdFrUizy21V1joPnn7CIVUZwKuuw0M78n70h
 kVmQ==
X-Gm-Message-State: AOJu0Yy0rJN3Vq+9yVzaliCLqwBpoKPKYAdSJ1OK70zPcbzhbwrotCo8
 UM+BmRwFE5MyKyFHyE3C+xVwYqGgzsvZkV8NZJB6y7J/KCnhc4EQjkezgg==
X-Google-Smtp-Source: AGHT+IHpEox1p00szU5uet2472A9dOOG2KdjzIuaGERJiWhjAfJmVQ/XzjRynNaZXb4IxnTL63+BoQ==
X-Received: by 2002:a17:907:7f07:b0:a9a:17f5:79a8 with SMTP id
 a640c23a62f3a-a9de5d6fad3mr2181979966b.13.1730434740785; 
 Thu, 31 Oct 2024 21:19:00 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e565e0940sm135844566b.104.2024.10.31.21.19.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 21:19:00 -0700 (PDT)
Message-ID: <672456b4.170a0220.187d8b.41f3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 01 Nov 2024 04:19:00 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730434741; x=1731039541; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XeYQb0WCqUBT2b6Xy2lotLOIFRlSF+46eYpGwNphQtY=;
 b=aFo7YSkLMcUgiqDit0W5jdU92Kuh3IxFSzZDulma51LDW6njjg9tuG5j6YftZsKcKh
 CdPV4Vin7egc1QNWu88uXY4mnUeeKQ/2ISesItABYg6mGXQPScSB6IyvlGnbBkdw8Kta
 YbjQsimddhiSf48/Sb4xjDyGKf7r7yq5PBs6BoUCp3/AA9PlpSZQL3EeV80yEEoKe0b2
 RWvRv9pfYWVZ5EKzEeKH/SlAFPhx64o9q+QaMxcyoxuDQcSl+hsmPZpQ05xyms3upREy
 yyx7Pdhz5w7kyKPvzm8xG13YF5bqJ+yAlKSvZV9fCCacvLT4YIkE9MLrUMMgzBYr6yDC
 k7Xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aFo7YSkL
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-31
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

Autobuild statistics for 2024-10-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  1  |  0  |  0  |  1  |
  2024.05.x  | 18  | 21  |  2  | 41  |
  2024.08.x  |  2  |  4  |  0  |  6  |
    master   |  7  | 28  |  0  | 35  |

Classification of failures by reason for master
-----------------------------------------------

                 gnuplot-6.0.1 | 3 
 ibm-sw-tpm2-rev183-2024-03-27 | 2 
                  linux-6.11.5 | 2 
                    bsdiff-4.3 | 1 
                   bullet-3.25 | 1 
           crucible-2023.11.02 | 1 
                  curlpp-0.8.1 | 1 
             dahdi-linux-3.3.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
              fluent-bit-3.1.3 | 1 
                    git-2.47.0 | 1 
        gmrender-resurrect-0.1 | 1 
              host-rust-1.82.0 | 1 
              libopenssl-3.4.0 | 1 
                libxml2-2.13.4 | 1 
            netstat-nat-1.4.10 | 1 
           oath-toolkit-2.6.12 | 1 
               procps-ng-4.0.4 | 1 
      python-autocommand-2.2.2 | 1 
    python-cryptography-43.0.3 | 1 
                       unknown | 1 
             util-linux-2.40.2 | 1 
        util-linux-libs-2.40.2 | 1 
           v4l2loopback-0.12.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/9bffa0768609b423069afedd0c649f5c13739ebd |     
  powerpc    |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/b73ef474a9b5b8bbc2740c216cbd46635beef4f0 |     
   x86_64    |      crucible-2023.11.02       | NOK | https://autobuild.buildroot.org/results/f0a5f13ef1767871eed8a1625be8f4f659d827eb |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/61f2415d7a72634836d9b4d073ac2b86fc4d6921 |     
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/658bd7ad5b1d2f21494939a11478da9fa7c1d96d |     
microblazeel | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/82ed220b00e72039195fd24986cef744e9bade43 |     
powerpc64le  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/f07042b0807c4a46d5779f825c03d493d30c53c8 |     
    i686     |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/3509b24c1980449fe0bb34c0f395cb0edb05390f |     
  sparc64    |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/eaa88a0951c1fa9a3ded13bed17ed982a61c97d0 |     
    sh4a     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/119ce03e81aa127a01d5739a3ffbed899e292c6c |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/ef3afb40fb87e289d4766ceed73719450879851f |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/97e6ebfb3808ca41655362a2b58f3377db8e0cbb |     
 powerpc64   |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/06c9936eaa69e5ab53f393d64d5cd2dd350651bc |     
   s390x     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3a60ab3750a17caaf63c91bad861e5e30a78dd10 |     
    mips     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/4881a6dc9f95f5ae2b2ac21d954284d1db7f35d1 |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/a90d6fcea0b3bb119c8fc38a6125cb3fd57dacf9 | ORPH
   sparc     |         libxml2-2.13.4         | NOK | https://autobuild.buildroot.org/results/1dad8bd922ec2a6bc68a55f4a0d0019f4cae4545 |     
   armeb     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/f4983f8aefc4eef7e1f1cdb8e7580d9042e24135 | ORPH
    m68k     |          linux-6.11.5          | NOK | https://autobuild.buildroot.org/results/8bf98818fbb45c59b4964be638079995bf45274f | ORPH
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/244956839ae82dff7948b34d6627cd52f430c538 | ORPH
    mips     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/193c9a52a29a2cb61f26d415761d71ff08b64b06 |     
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1f7c338cee3f3a01c1d1969bed48c0519a03196a | ORPH
    i686     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/eee6090929d430daf200d2d2b6aa212cf1947ce5 |     
   s390x     |   python-cryptography-43.0.3   | NOK | https://autobuild.buildroot.org/results/98819c1e202ddd77a390c9063ad31ee0601fefbe |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/db02bc0e84cf6cbda6d6855f6abfc1c1daf1a86f |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/16d42dde39c4b68671e22613962f8907dbac8329 | ORPH
   arceb     |     util-linux-libs-2.40.2     | NOK | https://autobuild.buildroot.org/results/3ecb2b02c4e4ada9d7c830181e57800c47175d18 | ORPH
   armeb     |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/356be839ce23154e9f808469b4483e7eaae316e1 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

glibc-2.39-74-g198632a05f6c... | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
          libcamera-apps-1.2.1 | 2 
               arp-scan-1.10.0 | 1 
                  dhcpdump-1.8 | 1 
                  ffmpeg-6.1.2 | 1 
                     file-5.45 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
                host-go-1.22.5 | 1 
              host-rust-1.74.1 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.8.12 | 1 
                opencv3-3.4.19 | 1 
         python-remi-2022.7.27 | 1 
              skalibs-2.12.0.1 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/00a2983c2f68ee892b3f127b64960ce51982a0f1 |     
    mips     |          dhcpdump-1.8          | NOK | https://autobuild.buildroot.org/results/a3ea562a4e55d4084d7b4a1ff67ee349ab37291f | ORPH
  mips64el   |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/34298bfaebd15ed1024c14de10be2f3d3f901f77 |     
    arm      |           file-5.45            | NOK | https://autobuild.buildroot.org/results/5b42b78ee059bdbcfc0d7aaea731a55c9a606c35 | ORPH
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/9d993072663a2db5c57564f97e5c552289b27ea5 | ORPH
    sh4      | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/29cca32d93868d37560658767d961b76a91fc90a |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/1eca94fb4e6282014a66e0ef3877eb7f7c607fb7 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/3203e21b3f187fe54834f3fcbb83ed22ceec71d8 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/bf8e783751121a0c625b8269a080d3481ea8a96e |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/28f27c9e8024d4c3c53f4357f9e6853d472853f6 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/0b72688d745d95540adfc785dc527b02f257bc43 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/fbf3cc5db75b9ad23c2874cb6255ca7854a5d792 | ORPH
  powerpc    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/cee4926c9c0f9ad8d16a32ce5eded0c846334543 |     
   armeb     |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/39dc22dec885e2e339c5075dfbe260c8991522e7 |     
    i686     |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/5a140ace7fbe18e8291e04db5a8d2b9dad01e7ce |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/ef87587793c115898e9b64bba396c8ef8d5980e6 |     
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/ed83920fbc8ca05bbb1941beee158a1594a0b215 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/3b6ae780e7563eea6fcbb5c6b98d68bf05807a1a | ORPH
   armeb     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/723a556ee3f70a84b08aac3a5b497e042c7e8df5 | ORPH
    arm      |         opencv3-3.4.19         | NOK | https://autobuild.buildroot.org/results/5ee82f3d414296832b7f2bf5bf80a3ff5eb1df4f | ORPH
  sparc64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/718f0968e6d5ab60d092c4705046018d27f89f51 |     
    or1k     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/d97f7ada6878a8bfb29d978cf3b61e2817c7b7a9 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/4d56196ea3744dfa8784c7330ef66cda0f32ad53 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                     frr-8.5.4 | 1 
            gdk-pixbuf-2.42.10 | 1 
                    mpv-0.35.1 | 1 
                tinifier-3.4.0 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |           frr-8.5.4            | NOK | https://autobuild.buildroot.org/results/92b1be4fd52bd4fc8cd2945b32c70edc176d4fa0 |     
   armeb     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/c23b6e11593f088ff781bd398b92c2221b3f3983 | ORPH
    i686     |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/3d9b1d2fa8bedad80f7e561f1f8edc773e9f1909 |     
  riscv64    |         tinifier-3.4.0         | NOK | https://autobuild.buildroot.org/results/d5f958d1baea1c69c04cf1fc1e5d377a593a307d |     


Gitlab CI results for 2024-10-31
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748198  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226271  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748226  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226322  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748227  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226325  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748229  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226334  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748233  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226341  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226349  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748285  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226399  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748303  | ORPH 
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226432  | ORPH 
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226438  |      
                       beagleplay | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226461  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748326  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226472  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226486  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748333  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226490  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748338  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226492  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748348  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226496  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748354  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226498  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748357  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226499  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748360  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226504  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748363  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226507  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748366  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226510  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748418  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226655  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226730  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748463  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748473  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226845  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748484  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748486  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748493  | ORPH 
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226891  | ORPH 
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748563  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227073  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748565  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227083  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748570  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227104  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748604  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227198  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748612  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227212  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748675  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227315  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748685  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227324  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227337  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227359  |      
          qemu_riscv32_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227503  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227509  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748926  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227556  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748949  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227572  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748966  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227577  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748969  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227580  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169748993  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749000  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227602  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227604  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227607  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227608  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227611  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227613  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227615  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227618  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227619  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749049  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749055  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227629  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749144  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749156  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227663  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749161  | ORPH 
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227664  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8169749175  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8233227669  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
