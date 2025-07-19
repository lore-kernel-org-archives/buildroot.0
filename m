Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C50C83F1A
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 03:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6460683AF7;
	Sat, 19 Jul 2025 03:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X30rbmF9NOrQ; Sat, 19 Jul 2025 03:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B68382EA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B68382EA1;
	Sat, 19 Jul 2025 03:15:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E516F222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 03:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74957824E3
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 03:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jq9vWXUdHEYP for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 03:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 369B182140
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369B182140
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 369B182140
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 03:15:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-60cc11b34f6so6612966a12.0
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 20:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752894925; x=1753499725;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SS1RzoPl+THNOvN90EyIqhzgdOmJrnIuX+8PXsxXtwk=;
 b=LHMKacWPIwED1F++OLXYfCHSV/2WBMO9ohKvmSjq7VwXLlKiUYrcugCD2DkY1Y4deR
 Qo0V8LhduhCJMOotPkM/tVHYv12y+d8bJJccv2lCw00jjrh/AcFGmyiNrOqiK3LNIE2C
 bj1dSzM8WRv9iEhrtX+/RGB8UkLcIPqB4CWp6JeckGT2Mcf934jWckyOsxfH1hl2uYbH
 nxDOZ9NTT9GgatuHxlIC+g4MyIsShAlpG/N2IlqGzHxgg0iRHxU1tw0aF2WCWiVndcep
 gaXoKGtZ0oT5Tf50MzDXUSdxuOyO4EUky4ltwtuknm8ABgdjmq5CdzNBgv6biVPyE6ty
 nicg==
X-Gm-Message-State: AOJu0YxLz65MM4qrdxYYvZGzAaF0OJCMEtWMUK5ljcmDXooSLOTdSFlH
 KXEN3rgn48qTqXmTwRRU3mf1MuBFlB8cFMI3jc7jqqfqDuu3l+3KGVPRsY66CQ==
X-Gm-Gg: ASbGncsT/QvJZperJGZGpKinVDgJ9BdWX9E8MUBHAUluuEWZqTIYeTpGwDf0iTQWYoe
 5hCzI6t8dRf3LU9a8i7XSZbXox97r+6To8bvz6mh4LTm2UxaCXeUjpPYrgt4EHXeLYqeqt6DVMg
 pkfTh3WXN/yOt1tQsaGX6u66kFqubYc79050hmEnoUQgoKeGsxVrlz7T0ua2AtjOZN+IJV6I/J0
 43Jtrgf0GtKDnVwZPh9FYjJUi/YzZ6HxHOgmCKAVWZNY0GDjrLatCED8slzXPZue02EKwhCoR3o
 Kgk/rDUUzWOD/EKZPkIEa46wXYuPbPEiGGAMnzrrwIAG7qw4T5AxkPOBIx7u19UVNlzAybg03DL
 zw3LuKD5de649ywbp2Js/O8JVHCBvfE7c9heB
X-Google-Smtp-Source: AGHT+IG5B56RrtkERGA3yLuNrB1c0ToqAYZ5FuxSuY2GKdp9yBn69DjuBzHIzD6C+55+tvE46aaPQA==
X-Received: by 2002:a17:907:e2c7:b0:acb:37ae:619c with SMTP id
 a640c23a62f3a-aec4de62d50mr866013666b.15.1752894924263; 
 Fri, 18 Jul 2025 20:15:24 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6cad3e58sm225899366b.147.2025.07.18.20.15.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 20:15:24 -0700 (PDT)
Message-ID: <687b0dcc.170a0220.3c965b.597a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 19 Jul 2025 03:15:23 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752894925; x=1753499725; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SS1RzoPl+THNOvN90EyIqhzgdOmJrnIuX+8PXsxXtwk=;
 b=YGIdTrpTAcQMfb1OHv601sknxT+XnVHiS3DCVU0L/58Q8KJNJLY0+LLsQ204/sUwcT
 jD+vS8/li2rNPOIMVE0eCaSe9D+sH0NopJ5aurRhTMhlV2ESMCFPUavVpvHt5xlWtQTQ
 nIgykKclkYhps5VXvhe+jBmQg/8qsY1fRjaznOuxyh1tKSPxCBng9JHVwzH1Q4fAMjQo
 1BkjCAyiNJ9eY/aSXgK8+poWRJwqzBWplIjvIjFQeKpjhEufPAG5djB64tnO62S8SguA
 lGQhhRiWvazsF7o1Sffb4iLoMOh5GscXyLhCGZAcmrLpe7bcIoOi+z9a/pIh+DJUzXz7
 exXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YGIdTrpT
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-18
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

Autobuild statistics for 2025-07-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  3  |  0  |  7  |
  2025.05.x  |  5  |  7  |  0  | 12  |
    master   | 20  | 112 |  0  | 132 |

Classification of failures by reason for master
-----------------------------------------------

            netstat-nat-1.4.10 | 5 
host-binutils-arc-2023.09-r... | 4 
                 libcddb-1.3.2 | 4 
       host-gcc-initial-14.3.0 | 3 
libdbi-drivers-0bfae6c43134... | 3 
     libphidget-2.1.9.20190409 | 3 
                   perl-5.40.2 | 3 
                   bash-5.2.37 | 2 
               bctoolbox-4.4.8 | 2 
             berkeleydb-5.3.28 | 2 
                    brltty-6.6 | 2 
                  cairo-1.18.4 | 2 
            ecryptfs-utils-111 | 2 
        host-berkeleydb-5.3.28 | 2 
                 host-gdb-14.2 | 2 
                 host-gdb-15.2 | 2 
        liblog4c-localtime-1.0 | 2 
                 libmbus-0.8.0 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
          linux-5.10.162-cip24 | 2 
                  ntp-4.2.8p18 | 2 
        python-aiohttp-3.12.14 | 2 
                python3-3.13.5 | 2 
                setserial-2.17 | 2 
                    sslh-2.0.1 | 2 
                   thttpd-2.29 | 2 
                       unknown | 2 
                 agentpp-4.6.1 | 1 
        b43-firmware-5.100.138 | 1 
brcm-patchram-plus-15bd6638... | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
           dialog-1.3-20220117 | 1 
                   eza-0.20.19 | 1 
                    gcr-3.40.0 | 1 
                     gdbm-1.24 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
                    gpm-1.20.7 | 1 
         host-gcc-final-14.3.0 | 1 
  host-gdb-arc-2023.09-release | 1 
              host-guile-3.0.9 | 1 
                 inadyn-2.12.0 | 1 
                  iozone-3.506 | 1 
                       jose-14 | 1 
                lesstif-0.95.2 | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libiconv-1.15 | 1 
                  libite-2.6.1 | 1 
                liboauth-1.0.3 | 1 
                 libpng-1.6.50 | 1 
              libselinux-3.8.1 | 1 
                 libspdm-3.5.0 | 1 
                  libsvg-0.1.4 | 1 
libubox-3868f47c8f6c6570e62... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250530 | 1 
                  mbpfan-2.4.0 | 1 
                 mdevd-0.1.6.5 | 1 
                    mpir-3.0.0 | 1 
                   nanocom-1.0 | 1 
                 nettle-3.10.2 | 1 
                    php-8.3.23 | 1 
procrank_linux-21c30ab4514a... | 1 
               pulseaudio-17.0 | 1 
            qpid-proton-0.35.0 | 1 
                   s6-2.13.1.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 samba4-4.22.3 | 1 
                 systemd-257.7 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ulog-0389d243352255f6182326... | 1 
        vulkan-headers-1.4.317 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/1a129e507ddb939bdef433d78c2fdb0b7ceacc76 |     
    i686     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/481c64d073b3237b5e79adb7b6dd9830180f787d |     
 powerpc64   |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/bd9efd4c2e87c7d47031780de4a02c4f264ce16c | ORPH
   mipsel    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/a124631e6e3b4238058e2a87b37349a7af4c2556 | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c4ce3ba7074f367c4ba0ec9121f2a79c852ea10a | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c444a67663009e4e27955221f9c3c17e0c949d0a | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/2a8fa1188fbfc8b0a53a20d0705dce6bd4f66793 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/336614d251b9e23a3d3d5527706e429507beaa33 | ORPH
   arceb     | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/5b4bdfee4cec47ecabc82ef14b56bd480dcc5741 |     
  powerpc    |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/d835c9c8cdda20aa1a983e4cf9c186e2367b3bad |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/2aaaaf43e6f92cc2b4884d2f597caff222b14cd6 |     
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a7c16f242b3f9f09242eaa3d8bb7d7f0632c4b9c |     
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/45f15796196ce8a80d1d7febd9fcae2d369ec1eb |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/134a6a22f22adc47f8be2e7a5e4ef7f6d9d71fb6 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/30b3b3ef43b560271a29426bdc59a3e67b04595d | ORPH
 aarch64_be  |      dialog-1.3-20220117       | NOK | https://autobuild.buildroot.org/results/c0f614762653ba253931f9b450c51156463d03d5 | ORPH
  mips64el   |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/4ca0efc512f08f8b9f236cab9c9fc8690394aac7 |     
   mipsel    |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/b6665a7a5672bd69478676e723392a25ae34e53c |     
    i686     |          eza-0.20.19           | NOK | https://autobuild.buildroot.org/results/6797b6260a32a71d34f37562911410b12260a1aa |     
powerpc64le  |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/b8a34de293ae6c5b8a3a599c8c856aac7dc3d97c | ORPH
   armeb     |           gdbm-1.24            | NOK | https://autobuild.buildroot.org/results/a3f243edbfbc0a04c09281d559393d640ba9a7f5 | ORPH
    mips     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/9b46efc36fe5b4cbae42fa830eb4b4aa3480fbbe | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/5d9c7159db458b7f3b2e57da417c467a2e472c96 | ORPH
   s390x     |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/56141511a1771e2d236d665867de174bc2fdd7bb |     
 powerpc64   |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/a8051600ab95a63c852960f8dace757b16c665f0 | ORPH
   sparc     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/cd45b6289594709d4484d5004009c7796e5a22c9 | ORPH
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/3c64c25e66ff27fa705ba2b8e19fd4024a145cbc |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/fba7e586257a54c1b1c519cbc1cb278c2ed3c13b |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/34453e578b803fa666cadadb67ee3215190721b5 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4176ff75134bdb4df093883f654fa5061a1b864c |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/5db7e68547dedeb91c3b582283731034b6215ba4 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/edce3cd21af3fc68dd692470daa5a05d1b775aad |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/cea8127caca038c352d9dead28e5faf967bc0e56 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/bbb10594f6b057bafceac0f013437b6ad58d2842 |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/78f3d6afa106f1af5db757097f1fd242379190f9 | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5251ff8e3c55316f57c6242cabb31fabacd22f49 | ORPH
   x86_64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f71bd1e944b07ff72ff3bbebdeebceba823f8c05 | ORPH
  powerpc    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/037ed1e061799ac29e30370d1a5d71c2542de8dd | ORPH
   arceb     |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/08fb93de11066975994de5f3c7b37e95d5bbf1ba | ORPH
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/cb86c871c780910200a9a666af86b28f6e6402be |     
   s390x     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/0ed1a49cab6d9b34040f5e1e6cf42a36c2b8e6fa |     
   sh4eb     |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/5639bbb561ea3105a1cd1cc5a09330ed936590b8 |     
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/d3f69e0341aa280bf987fd1b6fd997962b3ede6b |     
 aarch64_be  |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/798ccab7b69754fb9b73b84e31d91bece8e7a2b4 | ORPH
powerpc64le  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/ae03dc8c6dff3062f412478cea98e21d10218dee |     
 powerpc64   |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/2c52e658b7afddab6e536aa889c7f2bf2ea5f1b8 |     
 aarch64_be  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/9ec1bdd33e422a0d164cc88b274abc5be02f0541 |     
powerpc64le  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/2c52d014509aa02c16d89016dac0e53b61069172 |     
    sh4      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/087de021202491c02349ecfc26829c226c858862 |     
  powerpc    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/58b3e2d5080760f9cfb3e2bc59be76ea7b0a02a0 |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/7951cb525737d27984c7aa3e15e607ab237e7791 |     
  riscv64    | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/b71e7cb57eb12ac92591e4710a17c88dab945220 |     
    i586     |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/a09c6fd46d7a8f9d786947fdf08aabc53b75829f | ORPH
  riscv32    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/cc401a3179e2edbba04a20d0e29c2b68aa8a20b7 |     
  powerpc    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/a3707146f9ef62047e71f4bb1d7e00f565c5b632 |     
    arm      |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e6bf49153c975a2508d3b68e07b7afe015fe661d |     
 microblaze  |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/c6f1765ea2f398073e12c992d23ddc2ec6169cfb | ORPH
 powerpc64   |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/9b338d9b3855321156c63b1cf54093f77fbb9103 | ORPH
 powerpc64   |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/098227007d45b87881bddd09c42b88bc9335e135 | ORPH
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a4259e6f3da0ba33ec5df05c74448a81455b965a |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d921d6580a05602203d1081d0e36d4fa3fd3ccae |     
    arc      |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/92be760bd20695c3ae0bfc597408ad7f2e89573b |     
  riscv64    |         libpng-1.6.50          | NOK | https://autobuild.buildroot.org/results/f9e194f9a026eceb73dc5c7a61bd2bfe05d325c4 |     
    i686     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e8d960278858d4b2a0594c1ddfaaddb71c43afdf |     
    i686     |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/a6604e917497e61135d0b9b7bf3ff22f1822ebcd |     
  riscv32    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/1217af63935fc621d68b1efe744217a550e035fe |     
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/cebf0d3a60495e55f15f988b6f47795727918b65 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/70070f0ad83097a1a71e2d7de166b8cb23c832b5 | ORPH
 powerpc64   | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/2458e9ea0c7f636492e64e7473ab07a3174791fb |     
powerpc64le  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/7b769bff9ebb35ec7e1e7d5eda431b79feeffd48 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f2ce42a8a53159ae5aedfd6ed9155f488826ba2b | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5e25af17aa1ac1778aa38efdd1c3d3412bcd9307 | ORPH
    sh4      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/885ec643eaef206c45762b4f9ce43745d9c25a12 |     
    arc      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/2ac08cecd6a505f1bac1a673efc280b3a8dcb23a |     
powerpc64le  |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/c6eced2767f0a69306e1a2c2750e119200897eb6 |     
  powerpc    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/d1577b088065159ef0edc968f32f7338009c2c89 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/1a4c31706b24e38ab060739db6433ad63a05b250 |     
   armeb     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/17a03cb7775b6572c92a4081c8b70270b73c2930 |     
   s390x     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/40c9b0ffc2bdc14cb445a0c82b5f805ea6da8d7a | ORPH
   sh4eb     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/59a3e279ed5dd91cd8e2ab0a1d8b0acd318d4a0b | ORPH
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/06c7ac05b1a0f5e4d222e515c74acbb31a20a945 | ORPH
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/5ac4d3eeefdacf2578a2b06e8feae2a157f31c7e | ORPH
powerpc64le  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a46f7e9c2ac273b8f4428f6995c4fefe96ef6264 | ORPH
microblazeel |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/117dd0d2051e0622058cbd027dd1aa602ecddc3d | ORPH
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f518c8500018444c0529226c6405bf83cd4aac67 |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/49910c21b2b9b95a32136b1d58eab0e6e591dafd |     
    arc      |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/925cc69732424f8c3b826f1fed1a6d7a11ff9203 |     
    i686     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e4abb56ed017ec78c3ceb6ada0ce6a508c04c128 |     
   mips64    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/8ba6e9c2b481680fc31d6bd59fee4843f1e00892 |     
    sh4      |           php-8.3.23           | NOK | https://autobuild.buildroot.org/results/73ed7b0090672a21b69d4185facbf44e27d124a5 |     
  mips64el   | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/666430f380d458e2aae85cc6ee71c157270339ca | ORPH
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/de5411c2065bc8ca270e2a4abae45d82940934c2 | ORPH
    sh4      |     python-aiohttp-3.12.14     | NOK | https://autobuild.buildroot.org/results/077b66aae7426dc29d2321979d1d72bec35239a4 |     
 microblaze  |     python-aiohttp-3.12.14     | NOK | https://autobuild.buildroot.org/results/d00eaf25d9ed5f22ea08d2d286eb59bfc4b09778 |     
    sh4a     |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/7e5719143ad7839cb9fb6d87bae64e77f4f11454 |     
    sh4      |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/b409a13b533e6609cf7c68b5b3e831b60ce3b115 |     
microblazeel |       qpid-proton-0.35.0       | NOK | https://autobuild.buildroot.org/results/f25307df5c4711152652d358e54c2a0a37e000f6 |     
    mips     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/1c746e7bf3667ce8c20334ef55b3e6e7e7f01689 |     
powerpc64le  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/606414a408776ad5b33fa03cccd50a0650bc0f24 |     
    m68k     |         samba4-4.22.3          | NOK | https://autobuild.buildroot.org/results/8e0f4681f171eb366897adf96f67647a38a462cb |     
    arm      |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/7f7e59018d74a7b5f3b9e0c42ce6305cdb24b116 | ORPH
    or1k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/ab4ceffb007d29f3d96d1819075f5432abb86293 | ORPH
    sh4a     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/ef82b51acccef2c0c8e48607e37f23427bf4b847 | ORPH
   mips64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/750ea391b6267629f9c95cf09c88abd096ae32c4 | ORPH
    m68k     |         systemd-257.7          | NOK | https://autobuild.buildroot.org/results/4580f9074b2f67f54b07cae4a46577b644345ca6 |     
 powerpc64   |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/d296419a05282575861a552ac0f977d82bb37622 | ORPH
   armeb     |          thttpd-2.29           | NOK | https://autobuild.buildroot.org/results/a3267948169a59778a0fe5a06f9d9b31298ce504 | ORPH
 aarch64_be  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a723cdab54d4ff57007603b721191eaa654c4e8e | ORPH
   sh4aeb    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/7dc07e26342f8582c3537c031dcf5c632d58f41a |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/4e97627cc80a18c23db5a1bc4d3be7e510bc2424 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/75603d8f470114dabb9030ce0cb5bac61b5719ca |     
    or1k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/3fdb0aaf19914ff79fcbf26c0e4881a83fc991d3 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
  host-gdb-arc-2023.09-release | 1 
                libsolv-0.7.30 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/da157c5763209d4c8a6d5ccfae7f31cb475902e8 | ORPH
   arceb     |  host-gdb-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/f6f5d6e22ca8ad7326d04ec0ee34b53ff37ef9cb | ORPH
    m68k     |         libsolv-0.7.30         | NOK | https://autobuild.buildroot.org/results/f2792b056c6ee368fd17b42920bacb21ecfae550 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
               graphene-1.10.8 | 1 
                 host-gdb-14.2 | 1 
          host-oniguruma-6.9.9 | 1 
pthreadpool-560c60d342a7607... | 1 
python-remi-2022.7.27-37-g1... | 1 
               valgrind-3.25.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/2a530963fcf3f4aa4d8e1bc33b44cf26a7f79068 | ORPH
 aarch64_be  |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/db8965da6892e9aa7a645ba7587a41285e2a9445 |     
  riscv64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/1ce9da704063b40aba21787e876a559cf6dc4161 | ORPH
   mips64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/4cbfd123fa6777b5e25a23d19456b404053fdc80 |     
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/31197a75014288d4f3fd954c7430600a102f6005 |     
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/92b6727e07ca265aa87118509cdb030b13851090 |     
   mips64    |        valgrind-3.25.0         | NOK | https://autobuild.buildroot.org/results/152cac87bf4ff6ec067512fb0a78d0370f1725c1 | ORPH


Gitlab CI results for 2025-07-18
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534157 |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534163 |      
             asus_tinker-s_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534189 |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534192 |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534194 |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534201 |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534203 |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534206 |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534212 |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534215 |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534218 |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534223 |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534231 |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534235 |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534238 |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534242 |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534249 |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534270 | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534298 |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534318 |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534326 |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534330 |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534332 |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534346 |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534355 |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534362 |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534367 |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534369 |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534427 |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534501 |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534544 |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534549 |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534557 |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534564 |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534634 |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534657 |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534660 |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534678 |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534684 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534688 |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534701 |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534705 |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534718 |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534720 |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534721 |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534723 |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534726 |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534728 |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534733 |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534734 |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534739 |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534740 |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534743 |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534747 |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534750 |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534758 |      
            qemu_riscv64_virt_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534761 |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534765 |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534767 |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534834 |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10708534844 |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384087 |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384165 |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384266 |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384342 |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384531 |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384618 |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384673 |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384763 |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384792 |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384866 |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722384927 |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722385028 |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722385089 |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722385425 |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722386991 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722387021 | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722387093 |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722387965 |      
                    zynqmp_zcu104 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722388019 |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/10722388071 |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
