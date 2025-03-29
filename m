Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821B1C36014
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 04:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F331B607C0;
	Sat, 29 Mar 2025 04:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qhHAp6fTpSt; Sat, 29 Mar 2025 04:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E481D607DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E481D607DA;
	Sat, 29 Mar 2025 04:15:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 456CB1AB
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 04:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E6160836
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 04:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAT2ihKvEpqy for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 04:15:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B942860823
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B942860823
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B942860823
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 04:15:08 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5eb5ecf3217so5204605a12.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 21:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743221707; x=1743826507;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=agDl9sYSAVAY74U+NzjoHxtuib6YVEFKAjTFX9aT75M=;
 b=C1BtI7RC0NlLBEKYMZNPMjxOKfhnbMLhVL0V/T/SYwFS1lmJgujz8I9S+3ssr2JREd
 7/G7LULmuuQE0ymjEgwEsGZ0m7EmPBqVKdEweobgfTiTq3hjG4d38G3KIWzjYYDKMjzE
 yVdj5Hx5zm08t+yqRSxXrXG9mTSd35RBLxpPJBMsBJLKGN9g3pQUGHyM0tHeL1Sjq4Pr
 uSuz7bdpdIyO3+o2LQpkpdCT757w4pItjEjxr0qeZgbtZPNSvfF7kanrYJHKN7iw1+t+
 SoB1D5CP+ES5S33PhPB9/nmUq9H5OEd7eJpBgooLKArHA+5dZCc7P2X1h0Kxh/tmdsh4
 yW3A==
X-Gm-Message-State: AOJu0YyTnC/dECC4TOoqCaOl2GaYBX/NhvKCIW2btGgtrK2rdfHj0di9
 5+ot8hxFvBZSgmQbwn9/gKphhtSXscfjs8KFpgK0SxMYRFBNKbA5PP0NeQ==
X-Gm-Gg: ASbGncucwBrMMq9z7Eom3t9dGGUnhbk1QgFJy4QNoamrjHaPp5a6D9fJCrEJUvuFmrd
 qAMGIB/ybjVyKhUd1p2ts5VwF6dCt2BDQAbAlBhnp7zrGsfHhPKzdjNMcbk2fyJz9AZ8aWFYGYy
 qDdN0i0Ls034ePBmyYF7wb1b3tju/NcCB9ZI6VvB8OBa23kY/8/BOOa30l/XGDxX2hK/4vt7KnS
 ReCCPkwqKiJkSoB8V/nxq6MHyuOAc99ZAOt2OrrBi9uurtL63YHG+2honUrAHuY98JnO9Tnn2bK
 I/OzBzI0jKTh339BejdJrhOtzsljFxGif14X2i7CcV5mYFLM
X-Google-Smtp-Source: AGHT+IFul3PETJmToYObhBl8IdN6MEHNF4l2ZuuQ/HIkRnO76NVgIojLGHFJwRJhnfg6EH12G5wZ7g==
X-Received: by 2002:a17:907:7ba1:b0:ac2:7cf9:71a0 with SMTP id
 a640c23a62f3a-ac738c59c7dmr130654666b.48.1743221705135; 
 Fri, 28 Mar 2025 21:15:05 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7192ea03esm258410966b.84.2025.03.28.21.15.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 21:15:04 -0700 (PDT)
Message-ID: <67e773c8.170a0220.1d234b.8c99@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 29 Mar 2025 04:15:04 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743221707; x=1743826507; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=agDl9sYSAVAY74U+NzjoHxtuib6YVEFKAjTFX9aT75M=;
 b=DLjGE37MT4aEbyjHGfYLU9YZvUtob+Eibboa4R2ZbSLfDoB7k8q6CyLKfjvNQGrWsJ
 a8PR/Fm7lPVDkDAGdCZtLKn8MK4mcexxwuAggnIluqKmjhgFvlecff27iT7KL+qsygD+
 7rGVdp9DuIXTGguKiacmwPmFQWOvgJ520Ytcbiqd0nukqR/ZNSSQy0MfLWqbc5DIAMLQ
 j5t8Yu5KA7je6FdTlFS8Gmh94kG3iVfsOE8k1EREvL08QU6R71yOxCxu2L+vSJcvKQP2
 PtGrC+d94aVZP+anTFTYHpXFil5ssFmqxPyIvkxO+Uwb0Hwsz69qNaDu7nGtYctHVSBu
 kf+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DLjGE37M
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-03-28
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

Autobuild statistics for 2025-03-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  4  |  0  | 11  |
  2024.11.x  |  2  |  3  |  0  |  5  |
    master   | 17  | 1071 |  1  | 1089 |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.31.5 | 708
            host-fakeroot-1.36 | 75
                host-m4-1.4.19 | 70
 host-binutils-bare-metal-2.44 | 45
          host-binutils-2.43.1 | 42
               host-flex-2.6.4 | 23
        host-util-linux-2.40.2 | 16
         host-libopenssl-3.4.1 | 14
               host-attr-2.5.2 | 12
            host-binutils-2.44 | 9 
             host-libffi-3.4.6 | 9 
                       unknown | 9 
               host-zstd-1.5.7 | 8 
            host-binutils-2.42 | 6 
     host-ncurses-6.4-20230603 | 3 
         host-e2fsprogs-1.47.2 | 2 
                   perl-5.40.1 | 2 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
               cracklib-2.9.11 | 1 
                  ffmpeg-6.1.2 | 1 
                 hddtemp-0.4.3 | 1 
                heirloom-mailx | 1 
host-binutils-arc-2023.09-r... | 1 
               host-gawk-5.3.1 | 1 
                 host-gdb-14.2 | 1 
            host-pkgconf-2.3.0 | 1 
           host-python3-3.13.2 | 1 
            igd2-for-linux-2.2 | 1 
                 libv4l-1.28.1 | 1 
           libzenoh-pico-1.2.1 | 1 
                lmbench-3.0-a9 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
uclibc-ng-test-132c6134d691... | 1 
               valgrind-3.24.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/2e121a7dfa0b0e3d1f329701cf9eaf2c3daea0ac |     
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/3647a34e12229ae2a0936aada21869281df38c23 |     
 microblaze  |        cracklib-2.9.11         | NOK | https://autobuild.buildroot.org/results/1d4824daa194711f7cbac89fd376f3057fd4f7bf |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f4ac05379d656f998c326485deaf982fd64f8337 |     
 powerpc64   |         hddtemp-0.4.3          | NOK | https://autobuild.buildroot.org/results/98c04390b87519932e4539466f78cb52dfa75456 |     
   armeb     |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/373eb9cddf5dfe97d9bd4f6d5afaa7aaaf0a4b05 |     
   armeb     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/0d6c817a31bea111bcf37988cf82f26cc27da5de |     
   mipsel    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/c7bd7ff43079029bae636f15c28137a48b89b170 |     
  sparc64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/b4ad75d3f0344c5901a796f8af9bc4e478601f2f |     
    mips     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/a2bea218bf0c9b7b316037f12d6a46f2dc372b8c |     
 powerpc64   |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/071569de83d0add572ddad4a9fe5fee2727eb71d |     
   armeb     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/cf67f3d6a248f3125d06814d083ad97147c45449 |     
   armeb     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/ca75751286b93efb4d250ccff244017389ccfeb2 |     
    or1k     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/9ce0510335e88d308ed4246bd8d21f1eca822492 |     
    or1k     |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/f233b17c7a00df2712747951ec727ccf57ba8838 |     
  sparc64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/5d350a377173ae739796e7f1796c3251ac682c94 |     
  riscv64    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/cd59e99a91c1fd198a74ca731e56d1d7d0148681 |     
   mipsel    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/d123de4aa5018e1c6e1dbf091c58da34884b0f13 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5445b3f66f6ec9bdde673688a2e76c8cc61c697a |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e0a2e123e0110ae2cf3330c4bea19a0675afb52c |     
    arc      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f5961766f365ba6f1af481031aa71c74217002b1 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e7f8c4327e5014c177a820ead0720f4e04333688 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/86aed7a5b320fbde9f95c6590b7073ff970ce663 |     
    arc      |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/468d0f93301c959c7da3d39b84e9c4ca9830fb00 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1a8346e00885c116109c9a762d732f8b8cd21e26 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/bf9928dd420866111b499bd7aded26681c5750ca |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d1b52a778db3dd0067cefef53bda56fd546d7dbb |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/de9c6f5c8b0e26bfccf01d10d96279f0b814d4ed |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/5954448cc25e523013c8dd5a689dc1cd00156880 |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f6163d52a3cc28142bad58e258401ecdce57bf85 |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f05cdf85c11f2df5aaf118adb2fbb39fa1efea91 |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/eeec2238cb59669a403c86edbf64dabe6f1495a7 |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/cef10c2874d7c47575f34853e5b869961d106eca |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/12a7728a393f61017b8d7e144a41f073ad50b2ac |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/8877221891cb4546e242c7608eb7283e843c446d |     
powerpc64le  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/50374bc3bfe77a6d9b2c39155c81f76d4bcc8d55 |     
    arm      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ba482f81ebea99f184ed81dc62972546c0e56953 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f4a4418e6d0aa8bb884d0732719ab11cf37bce96 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a88bb175bb14342d558eefa7da73b4ac932eb11a |     
    m68k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e76268c68a1847903f4e89509482087562567690 |     
    sh4      |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/062aa35314664c88abe89790c88e0353f9d86997 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/b5203d3e48d5b7e93637d17f172e4242a89c0c79 |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/23ff0096d51ccf050b0de3d51e52355351bcaeb2 |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a45ce6b41fdfa910acee5e3ac76a1f671396e0ce |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/a9b4cfc7654797bd0be2a950f27b3c81991957ec |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/15c905b7274ad619a3f9c36105f1a32f29211b6f |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/c2d509e9ebeefdd613b4c0614cfca000e4705d75 |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f842fd5a4f6a626fc4676c684cca8a0b5d156613 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/96497c32cbbdd220b1d0b6409094fea88e392b8e |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/472a4ff501bb4f82d68f3e8de7e50c956122cf0d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/9ecfc72e509db91e38a272ca9d6fe73de2bdf440 |     
  mips64el   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/aa948c44fecd0d0ff91c17ca751326bbaacb9ea3 |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/180fff6f3b3f5eaec3d81435e5f3a49e17bab32f |     
  riscv64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/66e2814b33777acecdcbdc7e9fe7a9b46e1759d1 |     
 aarch64_be  |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1bd3fec561addb9f8b01fd09a8cf37bede0a8079 |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/86002c7f427b79866236b5d04b2d19cdb7d37b99 |     
microblazeel |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/299a4646d20a2fe55c74bd33daa432230d865a30 |     
    or1k     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/909b668f89e39c000933e80151e014675fbe9ef6 |     
 powerpc64   |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ef9031fdef3d3979bd5d70d044b18c48c9598326 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2f8b3413155b0703216dc1fe57ef28894827493a |     
   xtensa    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/e4088e92903749af2115d5cba213725097a31ad4 |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/09085aa66679b2a81502d6cc0ceec6c166dcf3c7 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2afe0672a96592d524ff8143050a31adcf84bebc |     
    sh4a     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3d1790858619f81ccca631fa0be3edef3b62ce1a |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f033564396d9a8b514ce869e187a7b1f50e77b61 |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/f8d2da250f4c3d9a7c169bb2366a3edfb0bd63ef |     
microblazeel |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/d808d62bcb39dc8efc4a2bbd966481f9bb83d662 |     
powerpc64le  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/1debc8fdcb3740c94d0602f5e90420c57ee7ba4c |     
powerpc64le  |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/82c3b890e7e99270e01b611e78189f29834b32fa |     
   arceb     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/71c02fc668dabbac036a67a9f2d2988f428a317b |     
    mips     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/bdc9a272768102e31cece0b7e8cd98dd117ddc06 |     
   mips64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/725ff908e007a26d6ce74c0aa9d023991a042019 |     
  powerpc    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/b16955e2666771de6a4921aa810146a445dd2e3b |     
   s390x     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/eb2fe46b11d08b75083591c53efb99338911b263 |     
    arc      |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/ce706b694ae22ca12434a0f10269f8ab2d71332c |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9447e22e418758dde14011aa2a56ac7b2bd39509 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/613971c2754d3cfa9fc8552de651c8ab07a30194 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c3e5292ff53f245b0c7e0d9a1245fa4b3cd9dc56 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e380f1e015bfac534f64c912e3ffa03a6b1094d1 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0efc20d29532d9814b32cd5110c0fbe5a30aa468 |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8f26c7f570d5af3f110b4824ad51b97b0b916b44 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/238fe4d276bafddb78ed067019c3418b2658debf |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/b91f906d946ce736c300fd6e37756bcf6cd26ef4 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/46498c5703fe0b3f629e7d809dc44a1f34277e01 |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/486c8ac8a09316ac7d7000f41cf058368d5f5a3f |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/dd9b836cb61474655f4c3595d6c806c590292db4 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/fb455af09e7d20bfcd0cb691ff54ee08774e7172 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a739e02c8098475b448a616507166e95e957bf55 |     
   sparc     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/0514b5dd1a87813e0d61a24c9e4d37f73d48ea16 |     
   sh4eb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ea9151b89ae54960d78347894746e022a79623b5 |     
   xtensa    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a9345a7275b7fc6ff1866f9b839e56917daa93b2 |     
   sh4eb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/4e6f3a72777c0cb34cbb87a16eaab6140dcdb7c2 |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/6387750627175ebc731cfb252a2a2bb96075ac9a |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/cd024469a062e01ae4dbf3f1c812597503ba08e5 |     
   arceb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e72595244632481ff291d04c575dbb4c1d9a40ce |     
   x86_64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/c2537a533d16428d8fa7e06fe615d8e0b3726f00 |     
 aarch64_be  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d4313f4fdff7d3804bc102c59db8df94b374d76b |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/42468891a30e7551848b0d759affba8c4c975466 |     
  riscv64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3234f63adc6284a3454d4fd83cac90e2ca49f541 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/199771d6adf988a2ee60f03173f0d69fe87821e8 |     
  aarch64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/318c6f173ba90fe3a494a1c595bef3fb163e7824 |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d5d08202ba70fcea3649a03681727a1715962e83 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/1a9d05c73ba4ac2521d676848719a09f26a8ad41 |     
   xtensa    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/049a7a0524d015934ea02a5ffa4ae230ea602c4c |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/e0602744ba230fc589fb750d48ff17ff9dd860a0 |     
   sh4aeb    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ee2da64829f8183448fc02d57074b0041d6e2ce9 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/bfbab869ad7debfddec270efd5cb260fb4b9fed2 |     
   armeb     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/08cf832847e776e9a2297ddc5745d577088ac968 |     
   mips64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/076cc81c2d984caa59e391ec59376f719b318792 |     
    arm      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/3fdf9048b9677663f9c9de7c6753a9b4905e422e |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/d3cdef190b1a11491190614ffa49895ad9d2cb10 |     
  sparc64    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/117f88edd45615fb9976d0eb7c328d3054d10a91 |     
    mips     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/8ee8d595a970ba0fb5c385a3c783a53c05e896ef |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/a2c334fa10c1d75edbc702f19f98491bf2466c0c |     
    or1k     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/00e56552c2dac586db35b2e1ede0d0a18789cf1e |     
 powerpc64   | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7dedf0038fcbcc0df59d0861f3bd1d4c3b710ca2 |     
    arc      | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/ac01d5566710b1a4d88160574fbc3a17648ea876 |     
microblazeel | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/9a2761709e141fa3545eb5ffbcce67066f88cc61 |     
   s390x     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/04464f61bb9b32bd6459a7dd57464e25e932561a |     
   mipsel    | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/61e545ad4a06a506098f894efd16d028a5069632 |     
 microblaze  | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/761a8d043ecbeb4df1847c65d1ec327b59cfe416 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/be11b393136a326c22ad56f06898b9e2694cdc7e |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6afbf31b4bdcbeef403f1d2060e86fdea3ad18ba |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b3b3ce38cece4d77e9fd577a84f2d582b68aacfb |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/91fe8f7589bb3cee81071de63c9e939ca1e885b7 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/57f7803c7fd58d2466f7450a5148ebc060f2cee8 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b394c77997a9fe317ac566c615ac3037bcaad499 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6339cdcd6b5350abbcd99cd3ed0dc83c5d2e2828 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4fe872222e1c371ba9d349ed13b1e1da8362459b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/37a8db67deb11c6318df59324771b929298d8a67 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/13b1be0931286b4ef70bf2f8563171318df00ded |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d20693121122d24e3d89a9060024dc57af64e831 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/db3bf298701ce2b7ab583234ecf5ad7b3bf97045 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d7098a825772b7c156c210d52d9148e90cbda14e |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f6cb2cae24acad46a955010aaec02cd9c49e9922 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17bcabb74a1304b212286033bee8aead480a52a9 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cb28b35b79a2975111323a37df3a68593b61c6d9 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/41a6814527bb3a6cde126541ad5735aedbcc3293 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f9bc8e07e7357183259c9496dde9345120ffcd36 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f979f4aaf856bd3da81a39c03440a76b873e02f |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0bf73c809be7a90b0ad8296cd468e0bac9e76eec |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17db0f268934a661a5687b8c65d7ed839e72235d |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5519de3e492ad1388fb5910b810fbcd8751b0956 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b0a4fda4a34b387c9b92b65105f38de457fcd615 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ef18c15991924794b36c9e28ff8c86c7d3c568b |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed2f8989fad87e97259aef0536045ed6e6cdf3f5 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9828e1f491500dc5f5e8af5c9319af39c0d290e4 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7f4f525e24d3860519ed4bdc86a5215f10c9a083 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/515f432d606941e8aa9bf34f5ba7f7156a26b4ed |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/319d566e4bd492fb36e37cf77df012351a2f8703 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea95e3f62f05b2aa78bf9afa61b23442761a5bf4 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5a12ea1ba0b1e765f3373a2537ff521f81539ca8 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f46406e9a4865b622cd01085ecce8e29ce288b75 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/da4e64eec2084caf9c676e4f7f6d4715a04b993f |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dba3c8fbf00e56be93d338f832fc4efdbf8ed052 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/52a5ca05a3267b4c331915cf33b06b869ec161ed |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/790e72c697b8dda34701e6766a0c0fd8c33cab31 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/671ab0f0d8746f52691fc5d6dddf73bc8020e667 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e37a5ae01206ed4ec3a21f8d493de232f30d3ace |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/30ebe01f19c30cbe329cc9f876b75776c112b56a |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7285b4d2450c594d54ab90051a6feb88bff45693 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e7fb7a15e667133232d30cd6f74c4ec978a200ad |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9d96b881b4a496870b1fd074837afab2786359bb |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bb87153ec0db0fdcf7f97cf8093e67120ae39392 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ffaf68d1059c36a9a9109e6fbd566288940e7fa2 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4bedadaae560854220acd4ea2271ae2d1cb0b3c7 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/59ef251a2f22aec828d4046591870bf508223b9e |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/759c48e59add676cf782ad8a0a257c030416f1e1 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99bae34e7e768dc050c8a5a2556ddbdc8753f429 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fde8088f31c5269170d1ea6f6ed17544ce7717a2 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b91a84c66598c7490981708d0794257e405e6b1a |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a2135f8929a2a841f8bbade941cdb71b99a5aa91 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/46eeb62b453fcf38977661935f8cef35503a6403 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/baa9b2bea071eec5b9f6ebffe19aff9a159bbe82 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c6216ef10890691f01094d3cc6718f7ea77ab90 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed8181e95bfd0eb645722481495ba942e329b0ec |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6fa76ec83e64de8114f9c8fb8948daacaef690b0 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa7d8ce957a69f70bec4d1218d41cbdb1a8deca5 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/33529ab0f9ea11cc881d3a59e315f1af991032e0 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/72f0f15d2ca92eb8b62739fa9cae70e7c18aa692 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7fbc99fa0b9eefa087580c22f08a185cd53fe381 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ad24b0428b4d293810d95849d482062e527cbb91 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a1db556d0dae6bbc45105983d39e84a331f4913 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/471a3ec664e4e5b079f653a0bffd0fb5fe2fed0a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/374d7433219a6db379852a5eb12a83503c42d075 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/66218ffee391acf8774479e0d0229566d9fdda04 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e9df887c8db9cfbde210671628649967a136762e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4bf72e0240a4839f2662279d4d05adcff3cc9bdd |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7ca7a10dd23e737db1965808dd592e342a772881 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8dc9904065e4c01ada36634604b55ec410858fc8 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cb3399cbd42d652cdfca78ac5343a89c2d7a0617 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/359443228239f6c2900229e7029172d5b4f1f4a8 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/07ddb2f543b7c76fd47328cf91ebed2f035f9b66 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1936ca06fc5580dc67225648b73c1d079d4ad20c |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a24305c4ef79d62107142d11c6d970aabfeaa9f4 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/61f46c3e70e9f6e21349bdac605b3d1f0166a2fe |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2747f4feb0f94898723a8d72976e896f3f42d60f |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c95db71957f15ba144ff6ca2db66712081a9517 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ba923944755a807a241a4acd89f57121a385ae15 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/72367f40b159612bd706de908fae4c300232c60c |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aeada51ab306f0ac4da88043881dd9a4ee1117d8 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9a2eb37cbba10ec00912bd9692bdab2b82251e1f |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f119ed552aef271ee8f7ff682408a1c58655d6e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/be6e91867ba6c158a021f5724613ff0ffc12131b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/631ad465e8af2cc68109682b20c418765194414d |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/44c0945527c0081b871ac18b0e0aaaa96672c881 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3e25dbaf2899020e20f950aecf4ea13167cd33cc |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6626812b77778fab3cc578a89d538133d6e5b09f |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c83eccf216ac49c661714acecc87fd8722cccebe |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/81e32399de135df74f58522ca46c54b51e5fbe5f |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5c9fd30a23bfc6ab9cfb03255d8cbb8b9a84cf33 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3de8e2b763cc7753990db6a5b58f2f588f17379f |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b000bdf7039b7d36aac89690508161f67c07ce38 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a92d67053ce8480293e1ce7c6b0378122a832ff4 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/89552003874bffacfa8631104a906f32b3797838 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/25682b7499a5debac9aa6e375162ce9bc8d7c669 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/265d418dd33a4fe29cd476cb9ece8f9d4be24dfa |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1e13f3d2a58581ff85494533dec05ab181506d51 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ab183b7f9da66c98379883025aa1c6e328f6d3a6 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/618329a83b6e5649ebfbe00f71c30040e0b100a7 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/07aa0d1e73a930d42300aaabe4e435db11978921 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f10655ba6e5e24a1f9a317b7553633bba67d8aa3 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fdf1156a6485de320654385a977bc18c8b01bebf |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cbabeb0e3d4e5b52b7f088ee887db2a85e46bdfe |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0f315e10d7ad701555d21a7a14f09f56767867d5 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e13978b2809f9bf404f5b94da93a9128e786ebfb |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e5d80debfdf24890866cf4b4283b3abe4dd5854a |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f5b9267bbeaa46d0d924ef699d123fc426d8d385 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99f802a5984a7bc1ee3e42b458b0bd4930fd89eb |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f561c209e67032c666dd80fc945078d75000ad74 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/765b2301aa9f157dda4989420f19af6a6400e850 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6675d8d06b9bb421b4704bae6b49718862f825cc |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6cc8cae1bd2aee875719ea7e4248e47b43219d7f |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7d4d34b8c0c3fff8d0d77c5eb16803173952afd1 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0889a53e24c50044e0d89eb69a047d66aa86815d |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d10f4ace66318d764a98be4833a07c5194561b59 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d77ddf4fd02725fe1513f47d953a84c023b75b51 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/438ba4b4520b8c4e64db2477ee716272f510e96b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/309f5c6628403e938dff0b55f72fe4f310adf220 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c609c40fed998a08c8b098d212f5786805003006 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/92c386dab4b75352941a8dce0cbbd84b0f944404 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/09076e8beb9d10bbf35ce68524109e182e9c7e54 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4ca564c2f9835a6f580713f78c30acc0679d827e |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/121e178d0771be28ebf3590e47eae9383cf0a8ee |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c729cebbe9567c6908b33c956f5ad049b15d5a9c |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c866c76013cbe7c9de24d56204b581be94b7cb43 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b187c57ebfeecd183ca3c56a4b1e9eece213395f |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d48ee9fb5320ef7949e4a5e67bc6beee3c0037c6 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c9c0e0f47da7ad4a41589830a5af73768134f7b7 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a49e1f7bee63608ad5311078e3ec2b618d6116c |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/eaa910ec70c2d467ae85b2eab532c9cebac5d4e8 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/76bc6046e8957debae4742db1b6bbb3ee9751570 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ed18535d43f88335eaa407b6c6ed740bac91fe14 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f2cd57402bc68f57aa7a37fafef4106a6bc3c93 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9a46c15a0887170b744b52d59b7306630c57321 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4421773608aa98308fcb38cda8e1bb420c0ed6a8 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/13b00c3692ce452c95192411a2d5fe227d11ca57 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/222fd04ea722707e1079335a42996eca816acd69 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c6cd427a51f0de379445552772d558c98c6b1133 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f5a45be828794dd038091470d9035ed1b4603dcb |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d2309d9ce8f713e651108518f04f0f8351a73194 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d163715eae59d70e76cf156a0586d8947d89c0c7 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bfb5e3e3c1dd9efcbf5d2319500aa7e58000187a |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/afaa7ac69f11ade6eb621366b5914710344a0b41 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/35af97eba111b9b3f99d1c0459248d48e342c808 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/86e445de8152b29785cb2c4c4da22f5981e31154 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/871e943a190a0622119228310f662544369c4c58 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4bed816c5b161fa5f2b2661b8087835422707aac |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6beea8b959bd89b61f6cdc1972c77483318fec12 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/064a8dbe06a88d7d93d302fb2775ff29c6751f5e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/032c72ea7baa736962ec491242d8c88ae532f0cc |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9aabdcd2cab7d30ddcfcba4278424544d80cece9 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c50b73d0105df4d098be4258f995a7e5dee040ee |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8068c7613ae143328a30e7d8efd4bc6cf231f628 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ecf15fe89e30f768e4b0a8a98754b913d16e08ea |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb6309ccaa495895942766a3af6878e4be18d38c |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4829a4d2693f2cf03903af80b55e971be6e52805 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0d14251ab6dea3656da12f01186902dc413dfe3b |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d06b745ea813ced7ba18d70ed7d9aa4230ce1ed5 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4f9b36c95c1a234b8c26100a559a1bfeea086c83 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2384aafe686c396104e7fbb29584859f5b2ffa09 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9db4f79aa6cf647858526c07650fbe2a673b0477 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8d9c21e98a61d7244b3261dc003a4f9bf7322075 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/54f8f5c4b6348454af5c2c338ee9d15772ed84b0 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d05a814aced258a64126ce215afe1a4424df26c0 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6bbd4392e577b901caee6d0f06771d58d2d3fafa |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8bf060242677a5f951eaad3e81b3d57505940b0a |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/11bb1cd649082bc5a40572945ad9c8b78db1609b |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a6617e910a4f9937c56c8069cf8add38fec9e997 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/904f94d12bab2825e83e6d6cbce220ccd6c12371 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/58921e1ca7cda79f5d6a0e78d3d06b5162934e0e |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/db2e4be9a6b1b20824d3d3397170f692bd2e51a9 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d44bc6ac2e592754b9657009c4cd73964574d56f |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1b28b203c971a9bd7586e5de7ce91aa16e322aee |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67ef3a482dd3a6abd2e80ad678e0aa90b0eba59b |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fd5fa63b6093002e871cb7de591c00a33b0560df |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2c9d8be4caac974601a5ead72270deac066a8391 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f57f0ceabe135c14a5fb13955991b1799e49f35 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d0f8d8c7e0fbcf97d696842d689fcec39e27f32d |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fefda0ed53f91c21d68af023f61255ca0eda3fae |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74b2d9b2cce18191df1ee939e6c35fa39b8fe592 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f30e8ca04cedc93a15ab75dd9bc234ae0f4d8bcf |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c830341e9825dbb536da39b4f6cec4fd861782f |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/82567722c2b6a1c24dd2cab1b8691a2a8ff9d996 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d14ff1a88212718ec2261e77252e36c69ef6fcbc |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b8dd414aaa5d6c9bfc64b0599db393fd811b484b |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ca6071a6c6ffb62665784039bbd77ebf50afec7c |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/993a0dff81e809d89a25cb276e6f1508da5d6bf4 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2b7b646177e890638320a5c6795d551e520fddee |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f7b89244486627d20af8b6f438bf68b526ed6bc |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dbb589a601e57ec5d0b07c0f921a1a2e56403442 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5a88a53156ebd41b396f5fb5117fe07873423d56 |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7ae66dd1797e4289a595a9685f0a111663a57350 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/88c8a9b56136016ab3419e8feb1adb0a6c89bc6d |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d3ace426f11d5532d9c68d2e546b017b6f838344 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4f50ebef04fa07dfeae79d5713c11ff9357a37d3 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd6fb46a3f03f5a39317d559d1eedf9616456b3d |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/055c6dc6d4460dcf2652b29dc0d10c3c3df2f8ed |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1b27475ec2a36c208c66352ed94b2dd17771c06f |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/032761b22fe2ee2771415a5505cfb5a1391a1bde |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6f9b33c3db9264f30f34901638e754037dfefe5b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/63dd15dc09d1e7f90e8fc9698823d606c850f91c |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6255a865455478ba75e2b1ffc5d86fd9c91c46e1 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/59583403e082973b8b76aba5b729d54802e628f7 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0158b488771199795e335b0bdf8c8e28b819f8bf |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b14fbaef84a60e0d5ba1d170966c16c4cc2b52b5 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f56d882d326eb8d4b0068d17ef641d8a6d7fcdf9 |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b69f919a5a6e23db0d79c78bee7e6609cf5c1ced |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6134911917194e6ae9cd1333706eee04c5041572 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/192ed638980e9b059ecc08c8e6e3b98fc76be976 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0e9eb0992e491e4072d402dfc57b0e1c31fc9352 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a4e3d0a794c1fa1446afcdf45d98334b62e9cfc9 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7d6fe84ad0209aee2dacdf7e51e7470b8e515290 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e6a20ad9325edf529588ee7bc62a9e22cbbf68d2 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5ae82e769914a52fb3cecfca72e7eaa65f8813a8 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8d6e3db884909cba9f59608e2a99a45b342c01e0 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/08185102653a92d1f73f159c1386f12914488418 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ccae707b818f620854797385e04df5e095b1c7c6 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/edbd94aceaf4481d48a72ea9cad4a20ac73c07c2 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2161df0a7375631fa877e920fbbbc3730c5d7b5b |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/de9e9da22bd108b401e8190293da9d6656e04e41 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa765a629047f5a103eb67408588384e40d5560b |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dafc8475f3c5ac6c67c7be06ac651e5c3233919f |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bfe2a18e11d43bcbf0e1c355cc1ce434a77a8c9a |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/953ba53e5670927072d25a3d95d794223688822a |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/39e27e8fb0e040b3b4452b3494dbce7dfdf7389f |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d24bd829dda2d039e7bcdd893dbb7a12b50b4262 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0401c1eed413fdfd23193cbcf9b13162c452bfa5 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1d003727db6178365fee1b5a1a5fce795ee95955 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/625b100bb07a95bf2afc4f9cd531ff0529f2f940 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ceef0646d4cab0f33de6da01ec2e1e3f1bed2f1 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5bb8f75bf059bda567d9f38a14196c4c375be3dc |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/761d83e7e50413d7c038f6416092ea8d950b4e64 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/267d0eb35a8b616ca18a2901bfa1de2a7eb5cff9 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/12ae16991be2fe2265afaec74df9c61494546f47 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b79afc723d04557993317d962594f90bb65a355d |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/453bbe0d5ed1c4a375182824d7668eb971aba0bb |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/23836c7ba43ca4e394a0a1340a3d6fa9ace213f8 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/24844a9ae187439c3e4ba0a16d8a49c1674cf4a4 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd92f84613e50a61b7e8e8395edfaefe5231020e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4d3018e6831622ccf2015642ac698f034323222b |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2b43ade53e3f812a79d801a8a5ca97937e24e947 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67d4dd6c8483cc7f22bc381fc960e6cc492ceee1 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7e27a32db60d38bd285675357b12079e8355e646 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e37e2f3e272e6820d7c71781a8e0caaa1302ee57 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ac1df022c8c08a92e0da861fbfc366e63ff8862 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/23a3df9ee6991ad476ac8cb179cfd4cd1f1c7101 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0fe1f5dcc2eafc2a3117ad96936b82253349dcaf |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/42f4c3390b92777d8d20c2c69783bb097fb6ecb8 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d7afedd8e77eb2db6f6cfc352ff41da35668d80 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ad896c5e3c763c03e6e5ad17c4502ff11bed76be |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/06bb210a7b44d6f0b42d247eb6400c79bcffa047 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4f215868b0295b32b08c561d7561e4765897b854 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/896f938e8eb820c1f8adb4a762b8f813ee20c3e8 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a9a59f109e3015901fbfa29583325e697fbf8b9 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/211cee73b03b6a6f37349e6c8402f84f5df39459 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/583462ee797c1b2602d458d0b378b7b9dcb4c8da |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/88fcc8c69c49484c0dafa1e43c3bc0b3695974f3 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c3649554f9380e48b7081da367a9171c82dc81e6 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/37285b5c72cdd1f6973169a06ace0e2b25dda9f3 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5076764cf1c72a580fbae5a32f657162e38dea26 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/65c5dfa75cdd1f85c8354c148e533d5aa36cc35e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e043c872093f3b7c063fa0a88cb2478dc8cd22b1 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/16c9a933ba191553d4e3c12041c0919d1e9d7020 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/346f73e18ead591c523b199020409397c5bf869c |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74ae720a04bd0be202e175219b994c094a347b62 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/decc0df80bb71a190ca5715ebd9c64a115647cd1 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec4900de1a5d4626f683a48a07ff05cd97b656e2 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/819e91acefb20b453c51bd8fb75c0b3c8b669601 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94e381607676d62bd13159cd3d9c22067db9c6f3 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fd81a5eb0d4817018fc8fc1775ec1d532618845c |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fc17e3c44d9950d8ae47dbe5dc967b6777771fc4 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7475629f54d2ad76d1f45b6310316bdadf1270ea |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/05658199305d1d6c28f54bb6639e99a3411fefea |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/493a7c6e9d2406b0790d4f6956067eeb314b1aff |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3cba1a1d63260f4404f80ede7faf1a87550010ef |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4cdce0105ecb6820c695e396fe2501533b1307d1 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2de698cbc14e1fe7ab2351bd9f17ea52f7efe067 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/621e5f926697340123f7535c87d35cf45957b6f7 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d50bc7fa7a8ed9451a9ff5f33bad1041a60f0d40 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/876d5d3708f07412522eb9d2e92d3760ba2f5697 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97fd84307d57eb71f9302655fd492cb2cc2140df |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2fe2a1e251c36f36a983e125e316be930e8c531b |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/208dae8ab540ace13ec63112383e66564860d6d1 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dffc3368c125fc1d02c94fc8b4ed4c3471e013fe |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0c8cbd5c00887452faddabfed2de892ff4e4ef69 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/39cec1473cbf3c2d6897b44954ba338ac5b85d7b |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/58148c0a856df04df39342111123804aa82ed7bb |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f327ef72672e55702b6b2dd010dd5943fd2d5343 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a80a83939c417b93ad1d7fcd4a1689afab804922 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6eef9a3d7ea6c9b2a1d17a6bab94b5661a3bac43 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f0690df805c6591ead6f35d71a6ec5237b8a4d37 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/91311b2ecdd9c2e9e9de4093e4f93ca6c09b25d2 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e5f7ab6a606d0a2784f423c95fbb89a37c110318 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f46770bfdd5dcce6292baf633d4b3ccc550f8d4a |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa692a22174beab83eef8a66036d396c2c9b6bc0 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b81d097cb8fed9e0ea11815e2267f3fead15770 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e150bb06c8f7d5eb53a2f459fafdee6a3b7306e0 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b47dbb709b6347dd4e6eed578307ee901eb676db |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b42d1b773c28a3f819b736863628a878b7b66a96 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ac470a06043595e8c369947a55fb861ed4cb2f1f |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0e4cbe76637543338a1c875f6af871f1a526ec84 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/511d22dd4bee32806ed96bbf30e244acd15c6c93 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1e10ca932faaea21a31271c832fd4048ce707d75 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d09ed71f8329658680d252c37d0b3528ab5c0ee1 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b9fa4b06a304ab96da8baee592a31f9d77856ef |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dc0133d05b594c9b165d181d7261d8f9bc4c7e9a |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e4786aac8d4721302b3f773159792c9d134a9df6 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8c97faeee90bf46e1048b5e30f454e32b14d0048 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b53f349e57883544a6340c0ddc7aa7ebd3a98bd5 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8443e6bcf802bddbdde4b12c39c776f0e1cd6ad7 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/43ea7b186fc69e7074374457a7e4b25c355d12b9 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a11eb2d8530c39a1c7a5e6a43ce38306ae074ed9 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/75b0edd790f96167a924a089a47c83ee8dbde8b5 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b31f265454d10d38221d3126732705e028b96fdf |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f81cc82c405ec3db29ea5090263d7df73f27689d |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a67eb857d5c4d45a0cab53b3dd55ebda90caadc2 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/54fa42fcae25718a9e83e581b46b7c015a17310c |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fe06b8765031f066522ef14ba91f0bae3c1db618 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2e393a60251263a72f7449d74b04898db757dac1 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5d60cce74fabf214025cb59960fb6cf98028e137 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5692f2d4813f027f984e4cb73cc9d31f1ae73fdc |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af58aefa636ad7a51fe1d69e9d8ef5b7cd852467 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/34a98496deeead31e30898d61b2e5c90d0adb120 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d25e4e8b0fc359be2d91f3d28832a93ca1470764 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9de7859a47e49cf267ef3056bc8966d8a77861e0 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/87b113397ceab37f0142caca0ff7f273f75a57f5 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f6f662cc2af647e8454353b6b62a9cb625df7273 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0052d7e1620cba6f6a435eff39587c5407a2313a |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cfe3b8d374912dc453cee1c5f9e7697982cf1f3b |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b4cde7199f67c5cbd2d984917d1e48f9b4dbf482 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a51d4b04cf835c7b42ac5fc7b7e621ae9c495f22 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e199869b3af690fc2a0d22cb85e5675b9118bdc2 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e753a9450533baf40c6053bee28005f09190125d |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd9637fbddb806b9284f66584871631e0c08e52a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/64c34145cbe179e2a8bf7539c26c1c86a538d63c |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/71822b60c1b87869858299ed5fa3b1f3ec049adc |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cb22370883f949f9aba0a8c4160554d78c4ad20f |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/451695df8a44cb3486827ddedfaf38e197b90194 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/838880edc17d8f8bedc4a034d9b05b95eea06456 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/af6cf2dc4ea4d1999b01e7deb30a41c681958f8d |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bf49b9b6ffab3fb35d7186d16833efed3460070c |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4b59e048f6e1748b5be41f804b288257396de762 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/46c1cec04b863eafe2c94805b6ce44e86340e483 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3562afb21a64ecfd3eb762645d498a4521354cf1 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f711e03eab5aca1e35760430c21eb9d3a2b9f8de |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/937532486ae63619a4ad80f38fa4eb8191229546 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/76872eefa50f4c11dc03ca60d6d87b8ef23aa4cf |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/151d8aa66786dfa3493a915b943d95b3fffe007d |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5b23acfd0e7116df7de0b14e04034c7e5f3134d6 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6a9a70ff383d3a07ae4df04c6b08667031b2ffe7 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e5c874745ffe6204d7a7aaeb453da8a9adbe6ddc |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/367428f6fbf69bcec92a1911762df7f12346f619 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/08d372a6f7cff88929ede6ea315a272873627076 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/edcb911e3f2f50a73917becc53665e22bf99c9ae |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/86d38a8ece59f5919fdb440fcab7f8b33f6b2c9e |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9131bfc61cf0c0b88ac43235307657d574622923 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ce6cf00ed7ebb3385a3bbc2d5f27b88f1467b3b5 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9e0fde299ac5a8ff1dd09d98246338cb5fa3fddb |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/721a5f48b6fab09ec70be1eb06d18e3f4bb9bfc1 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/180837a014904f991078409c371337193203c873 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0fb867b2dd1679c7f7303c71968e15c0d284a29f |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/33f33a981429a9b0afe46bf1bf60695effd42471 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3924ae88a79068f47a2e0015a6040fc6654c1758 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/53eef3b4b6d2623d9615214a17b36dac135ce9db |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e48033e00012152e1f83eb278fda0caa14c7fb04 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3a1ee71755a954fd1af79c415b5da74d2e31006d |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/98d6192026a73b46cecb1f5ea0bf0519e08ba96d |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2efa43ffad1e28e62ec8f006d31f012e1e4dc838 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ccd5f944d3554fb76128e699aeb4148ca2dd05a |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ffd4cbbbea4f53305b7ab897f3d515e5bcafc5e |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/99aa8774dbb327cb7d1d765e16eb5dfdef547222 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bcc8137b718728d7c07c55b906fe22a5dd744849 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/44896ab33f83bcc573f6a48e07d6fd5c3bf9855e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d90f30a27c933b8295544ce05dc41a53c15d359 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/16cf4dbc88b7b47d79d1b28e869b7895c5e73ecf |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/006dc6d23fcd19b43ec25852c5a7bf41be493901 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5f6ea91ac109792a65fdaa5d27e233a52df52553 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/96cc69964703b90be042b241040fdd476bee976c |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0ab4d1b6bc0df59e81048c4fb7a332b06b7d75e2 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a5876998530ff61ed09bb9feaa4e27197cfd75c6 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/65d4fb9d045ff04656ae3086ec16c7c95942406f |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/544f88235b096c023008f50df7536a807060c5c4 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4b9599a63a03d2f88549dfd54c988c83a0b36581 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7001308b95861b3137a625d50b32cd7a4e4ca582 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f8b2aadfeb57dcf2d9020025938d1279c4ddd4ee |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4a288ae91658a6eab10e4c4e40f5f711f1cea5c6 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c9d10ae54b063e0cef4cadb241fe7a8e442bb47 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/535746fe1ce297644603a6a6035f59c13107bc4e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c709c6758d1627abce97b5c6131d35114066b142 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/68c8772a6f6b8596851e0df8bac297b0953402df |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/82ba353d74101b90df660926e4ecbf934d1024e6 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/55dc76a5d11d6c100007485a02c2ad63046e6ad4 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7b5f4f17a132979343cb877a0a2b32a48d70645 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3a0605e085a63e0b6d394fe1badf78974675db8f |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d0e4bb9bd35b9b1a31615032f04890ea184d897 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f8ccbb8576a7e315bac09edea8db6b3353894e7a |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/363c2bab111b5ea8fedccf0da04238899b75bece |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d5e19578fc58af0a8da3158e0156940b3bef28d1 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/07b7e00ff1cbe2c3520e287c797076b23cdfb29a |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2105b391d6fa012205b048b2d4915e1aa87a75c4 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aaab35ce5af3a9035f12f80fa5c7812ad334658b |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ba0af486c55a52bedc48084bd05d1063200cf0e7 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/26ad5e4862c6d7f837d15ae86e5e4154a1e54c7b |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2a5b5a0eaeb9c3803dc7ad68f38384a6b97f6d1 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b6bacb2545b51578e04001c44ff32b3b03091f76 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b52cc7d73f33d518780acc85e7d49681cfdc7358 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/86a2ee34551ee0ba49666057df6157c53d2da69e |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4c7f370ac9954221eb74917e8e5387f05b585266 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/07f8a8c67d91406480a9785fc76b22e5cc1d77c9 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3beb20efa971d0e793d67eebaf7485a62a9d1759 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e65adc392039bd88640af0fe92931b5e4a239516 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7e037a1f5858d6d31c24c20f1b531a5c1c20fdd6 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84f48a272b7116693d380df2f30bcf23d2c4dde2 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/22347061a75c16829f548d1646de71260f3c639b |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1a77db0d8b7a9d1feb200482c29f18331329c4c6 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/36309f4908ef3a0380a86b45f95a7b0d86b9b4f8 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa896c5b3881f385d543ff8cde0a2f1f94dc3f17 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e17870359288578ff3f747867570c4ef67fa38a3 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/32c5902369bc0c8d6db6de7b0bc0afdbfc41350d |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a1b126a8de009f6c5a1cff502c13f55e05c68122 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d504d1a80cee70f29909c0b0d2a6e16d33656208 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/05044bfdb881bd1e2a638f0f2828ddb656306e03 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a253e61d633f617fcb576f66720df0d8f674c496 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/53ae1b9c170e09dd888b455e7e89207eff1bdd28 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/13b1ce74911693c9d04902cbfd595dcd9bc9805d |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2f7b10ee6ac11380b619402f37bc10790d5df646 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/959d3d5d008ab3eaeb12f8f1432e5a9e97b00942 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/49c57a2c7d720031e4a93529874f5e3d410d4ef9 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/969f28da816e906790ebb869e1db13f3ccea99ef |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a8aa9dd749aba8795ddf5b236d3420bbeea49372 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cacb673dc4d135a76e9d2d3f3574dabf41d63336 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e1d2ff89a28447c9ab058e2ef28a569d30f3f3c5 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/212a2f545b0e332af688aeefecefb9889c6504bd |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e7c2d13e67a6b7cddaefa416b0d394b39eb32ce0 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fc80a034f628e27d0b0689cc29b941988262f9c8 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/917953ac76c18a41e662822ca760b22b6ee7b66e |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fa13a6e6e9d8992828175705752671c26c954a80 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8960446ed789e32e3b806fac405274f055f34b00 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e4887f503073db5766a1f8091e7069ee1a6d42a5 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0ae97e11890a486c0b260a734b8e5fbe6456991d |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b5cd48241beebd17e6ff87b4a13df43ab062ed04 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2b542c6922dfc4c26d915fc8a117a0ce87956ab5 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/54b6bde467899edf5365cd2fb96056d3abdd110a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/27108ffb91c8e72efddb04521da2810aa1f6398e |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9772aec56179891caf75b267830efe6e7e9a2c51 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/87e5403ff2170b8a07c27a9c4c4a42215bc0c2b5 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b25effbe4ffa51823abd6304457b6919ce9dd458 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2afefe5bc372ce5cb059aca4b6c6f95adfc8568e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f602f8c29834fe6936bdc140dea606c809c59f0d |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a5b9b67ceb2ea66b3b71d60322b32cb21df5b73c |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9f6072c144177e2320702ab1846b0d440bacd9b2 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f7cdf316f67aef60752686f81976af504b992481 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/537521a0cf4cc72c0d728a3b213830a2b65b683f |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e71dd01b4d750bbcfb15466d48b20279f68ea3cc |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c355843a957f05ff2ae84fc70a4648fb54f047c3 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9edf056b702896e4cb06edc242faaa8e8ae7bbd1 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c76ba90534ef44d49ee0697224812abf3708bc3d |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f75e6d270bff60db695ecb0deb0d342bf5047368 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ce65f21403242eaa3ac315d6a1a0c47df47330c6 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/50e6261bd223ebf95595243ffe585b7e826ccb4f |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/67bb13d09c614aa2eb6c97a792ba2a0e8ca7f57c |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5f91114a066ffa970397df095756011efb94aec7 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/099d0606d529fa02059522e5a8c95b9ce828808d |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1336162c8b8eb497f0cc709c3234f6fb2246fc96 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2326f94c20a2a3cb5496d7ab58e54c55d266976d |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/95dc848cc67da16f0bd10a63e105cabb02d8da3c |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7e33b1313ca6211e066a38b0d7022beea5b9bdfd |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/876cc0e7035cd3f9cfc4b6a4a724cc134fee49a3 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ef41151846113fb9d35d68497e4a792693a87c99 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fe4164eff146f553b2fec8ecf76578aa19d3b835 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9ed2914f96cb6d6a508d6aafbad8ddbe742c7301 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c33389f5665bc0a3121dcd4164a48451165a6cc0 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd4733b36e62d314cfcb0ea0561cadeb6578bf61 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/15a45445123cd35563d2f4bedb69b336a7867c40 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7ca44de904b9b9c9d3ebb83ca70b013b3b981b60 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cca4021b4500c95711e7d9e918b245094441397b |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5e638525b1b84ad911cd8bd2a798a2d733ebe66f |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/edfc80411d9d898d5975e204e5330753a900bff6 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/80f665f1554520d2225f606406790e09d1c2975c |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b6871fe2abc324ddf68de4dd9c89bd6559d42c9 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1c9dad0ca8cf5ddbc89eba0cdec8cb3b445c761c |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fd6894e97e7bb57d915b521fd399eb9879b953c7 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/199bebd6b96f5537ae92942d3930cd2655c2b207 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cf7554754058e1a9f2d7febe287c726b01fd0475 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5cd13dc6a47831545b8a4bc6f97b3671a8a467de |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17162a9a264be069814e855d64c00b3ec2114a60 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9aafb44e9671890445514460a9fde3d76b81a37d |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0e4a1d61f80d49a2e78de4ad60393c2d32870a09 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6b4246f9ee3902085c101f64c6b76199e425f55a |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74c92516e110f7c65de6a2aca266db2921e152f6 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3787ce6a4d92bbcc06a711da039b6b7725b4e875 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3c558877a0fd531d4159cb2a4dedfa23584fbd49 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a0a841e0dab47e8b19f7cc7ed1d5b88983cf182e |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f655ea0b91755c1b82e20679a13ed1173c40db55 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ee9755eb2d7b357256cca28851aa55a65c0bfc46 |     
    sh4a     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b04e1dc00d936bcef4ae49b928bca3a3cd75cfd7 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e2108ab531aadaee12fb9aa72a978f71f2251279 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bc9ca330d584e4525da6cc1f09d040110dfeada1 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/16e0d3ca0656e6fd0d9cd4831a9c5f2ab9930df7 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f76ae03feebc3088f96bb5036b66d1c2caf99509 |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6d6755538f070419fbdc49b8d75fdb6183a482ed |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e668b94b30be13d3b92fce3b85f1543b05642eb1 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c0265417629704d2cba53df04cef3a23bd7597d2 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a02279cd120172c1ca8a6463a62d8c71150635f |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1e7845372c369abab82b263d1114aa6e1a527c98 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ac57d83c579a545e778884c0fa31d826f6b8a619 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/752743b76fe9357fcbcde752726d070bcd918d0c |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1809e580a6d594c3a4a92811fe8c3049abad4b3d |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/85f31abd061bdf6848c5fda998547d395bebc875 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0399079adb914983644947fc4aa41044a51b23c9 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/31a5939068042cd845e8cf356df9b42992f28f44 |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a4bfbccc98a5cabf78747f0beff97aafa727b11d |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ff60db6fd2c86014adfb5d3eb59b7b3d077e9589 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79b9f2ff6bd8222b78277ee798f4f9d55e070aeb |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/54bf3e22094e6033bca57baa77747850b98c900a |     
   sh4aeb    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2804a88c0fbcfc945b4791fdc174e7533b94af5d |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2bb80d26ec11a3a216275d5f5289bb91690d7eef |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b64c299b00d500c0e397f01e7cba1ccffdaa4290 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d03d5a35b47476f7a568835bfd6a281070dd7ce |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cbae73d3d08d071e1f01832e4a367510f60eaed4 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bf7e52857436b0ff767d3eb9eda41af18fc9bedc |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/734cb0b26e4f53063e8083a1fe74eac3ed1b910f |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c4449949bcfaa6f27e7a974ac4d0f720cf2551b4 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b151c9d4b00836467faf74615ca17c2b1c54f0f8 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bd6f6a01ba86757b1cebbbe2157cfd62d192e00c |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/bfbff04ac0a53734ca6a3eeb231b0a376b17c55c |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9b1440b32f4f009378e8ff354854d0dea2cdf754 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/818d4bd22fc3930be308da1d26cb986a1672b4ca |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a3d8dbccd184e66bd426b5b10f7661aed64ab292 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/83f9fc8760f1da26a111929e7a461ef61be1089e |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b267ebcc156f1f4aa38d264fbd042ac1abd0daa |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e56cd3034593d40f1eded785fe79348dbb7a2cee |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ef49b8dfb4112587928987ad605346467d3170fc |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6d2c0359ed0b8bc252479b8738bdeff56172fdbd |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/795d1fb05755840646c0c4ae902e7ed48401dc0a |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9cc597fd8f20f39afaff7d630e1c3650a78ffad2 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/047da1bfb42f4ec9d1b6c230c9eaed14e58f8ae4 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5eb42e1e61dab7611f4de0ebdec890a9f31a9f86 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ec6090e81993bd8d85b2c17b381cbb2ca36d07b2 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ee9deb633141e91a84bd2a600bcd348558e0dd7f |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b76f9c8f14543c4af8043534532d337eaa31d8dd |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1866ade0cb037e7a905e999a201e2c0a55f0208b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/941bdb994bb40d07c8d618e51658ca743e3df946 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1e78740873a1b961a17d06c46be919e22fd42420 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/70bc559843b67ad8205823981f94ac95b8b5e8dd |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2246b3836f9add5141c7a4e253f0f051cbb2c84a |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/31ce3da075f3b6417692bdaae5c7c1a169332599 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2590ff0f18da72b330f5520e6693383e535c424e |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b373a318832a8b3bd9a4526d2ff00d0adb4dc98d |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/610c5ec8e37ea49d1cfa9de6ab1e46501eac92ae |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f44f3125c4b63f40fbde5479306126fc3ba64cf |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/03f975ca9ff49a0f7d56d07c0014f1a88f49ed09 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/308433f94aa7572f619feb24fb1914ed4dc2f45a |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7bbe20c3dac09c4798b4266ed42dea1ddfa7c8f7 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7787865a3c66ec2bcbb908fe6b151ad7cbee7021 |     
  aarch64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d46137daa21e67ad4dc1bf8d2358064712676561 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ebcf5cef15be5cdb670ab4a3c2eb6b9364288c24 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/489f8722a7b498c2408fece2ac0fe3d5ec6e521a |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ecf7845f701e809e13b6ef05364718a3c029ca73 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7a48b4140ed07a0339c408056e54d3a144c2ea0 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/185e46cbf3131e923e4158e7ff215b07915ec957 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0528bf8600e460031621174fe451eec640e4c86e |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/25f5f44b050a675f5438d55ae4b77febefa9142d |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/356a2559be8554682fd9b01bba0bc3d4a46e1c61 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a71bbe5454c963cb0eb0f75f7ed49495dae0159c |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/426fe5247fb0392733bb638861a054bda37ae83a |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cec722b6bc58c95ff377f9bea0f046d37f68d374 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/88842a305c7fd11e5da86c73444d1feaa612c289 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/81b94998746da68f54c45e30c967253e90fc9c57 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/359648c7c6a3a72e74430b9182782b3e86208a4c |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b7dbe0b9df51cd89ab924fed8a4bf9536b3916d0 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4f5a6f2879299869d33b65ad7eb35115fed4a99e |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/17a5b1252e8f835a674da2d88a5be95e3551ee1b |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0700b8836f62aa56d48b12824f7ee6baf89f1a73 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a665fc31c192ccaf54ef035554439d0e41e02a07 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3fb5736db29f5b25ce0b743b763181c0f2969b91 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2076461ca951a6abd358d47f5f7ef2c3f02320d4 |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/74f664d176654359dd8be2b32162a90eb4e0c5fc |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8a096f0ac6c315180970039d629e126244dc6046 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/80f2a2c17ccb986779716a3ea9ad34adc234e619 |     
    sh4      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3638218e04d6714774f627c52db25bebb3744911 |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f6a420366412c68f68964794f42bc40641dc75db |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/25a6cb97a5102603cce6cf3042b933f85f5da778 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3ffbf4aaf28d4fcc6b584c018a41afcf35dc6dee |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4a8a28015d3c4cc78a441a7c2171f50572549ebc |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/33a4cce316b0b7463962ce919ed9454891184406 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9ade3c73820b86c4bc938f14071741fc26a377cc |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4575148a25670d5fb73f60c7a017e7d9c31dea10 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fb3d1e27d97c4948495056119a16e3f7d28dc881 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b6bac4f23b2b80293dc0ebaf6bc366cf4caae31d |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f12a7a645df6ab67004a5dbfe19b8092c3ca4378 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0cbff898d8991a5553c6d288c5c2c82ca2e144cf |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/228bf71170f4af681a0e43569aa5f5ce81147c21 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7ec1f6ce538445e23ef2b3e7ef38e82fba62287e |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/32c0a85ce98c5039a9ae764f685a63d2c546ec16 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94c1fd84175821a02cce6e8802572a0294e215b6 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7182d13341f1f7ab428bda61bc1dc5f711a23088 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3eddcbd16ac3656a9f46629dbbff48b69858079a |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f33efd6a93143d12868ca98e0e6a9284d3f85f8b |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/84c338bcfc8200f81a223f1bba6a250114ac899f |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f89940358d2c135da87712e9dd1b45d6f7e42d3 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8300b87651babaac52170d512bdeac7c56bde9f7 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/40d3b6c832a115a6fe972bf77fb4c53cade607ef |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7e0897b466b36419711c4aa33d7fd3d540163c8c |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/715947aa76d65a5d69a694619e7611d8ee454820 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6367e803aabf49a44b9f76a25eabd40c4e06c9b1 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/503d732c900357738b2725428bb447ee1af7f222 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/47d6bf7dce0692dc64370444ffe696a73e8cc41b |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7a0b73de10261c7b94d4a622d00b054cfa041831 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f43f335af753e88f2b088c87f9f242b8634015ac |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4efdfdd87163948459c39abd815d247f0fc3e1e2 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6884653a0a6593e54408be83c710cf5660c26d2b |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/105a4884bd582324743dfd07a05b2d0043874cad |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7fe5245cc3fd475a0af96843d5f033a6d597dfde |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3c9f794dbf38b5e7ffe6ba22882a08b5aa3f8bfb |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a8401829a81b57eaeb595f5c1f0beac4f4dc232b |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/06589c3b0548ad77571db0a9f556cd3fbc337133 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c72696b65ad9fba0d33373ab2a031485ace38426 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d340bab41e4dbafa97637c6e25a840e95a5914a4 |     
 microblaze  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/04c9c29f7b61b1a6de76753793d7ef671baf3d46 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3ce50c055ec55031817e22fe13b6f6ba3aaba95d |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/16b257938738d9dad7a5a1e150ac046ea5dca63c |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f23a7420b3ee00f2eece1f0a6089e63e8445c7f5 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2e10750c1b02ccabb07d95f0b3abeb7b8ce4bddf |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c52f9cffff66c734eab4bc9a75c66afa2ec3f3f0 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f79b7dec21afb32965fbc787d8437a52353579ee |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d787f05f2647bbcbba96c59a6efe1929fa5caede |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/432534846ab52a471f8c965126fdcfc610916224 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/90d689da52ba0cf2618a2189cd1bf6e036e8be74 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dd769f074ca7aef83cb32725e940b300059f2db5 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a641f8ee3b1ed3d101509d6d14b4c29ad5f2cac9 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/80125a18a6a028d968bfecfa602a5ac47c57cf2a |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/dfa72dbae768f644a89a78ceed062d795c9b698f |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6e55ffe9941960eea7289fdb9b6316fe4dd61dcd |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b65fdf851740d7dfb830b1536bc874d3cc6fae35 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/9cf135a916545cd3bba391e31dbda5093787b64b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3f9cd3c02865075b9681198b944e3e3ff66dee50 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d8152bf83226826261ac9d711b06ce64f5fb0a58 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/93bef5cbd955d389960ec4030da58ed5c572ab99 |     
  riscv32    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b88d74648e2b7bc7817d42cc255d1f6ffe6fac29 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a70d4812bc26fc4f5624cca3c666d4e8e2a5bde2 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/994e1f2dcaca4de409b53912d720e34037eeddc4 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/648bffc3e5c7c70f7ecd0c5c2986c17996c54f33 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/3d34cf14384acfca426d5de24013d21c6d8a5f12 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/43855449b81a4183bf7a5238c6cca5e974aa93de |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/da5632a8ef4b62f2c77daa7757526800e3fc6ec4 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5235236c699a58ddb0bec7a51a98a98d903fcdfe |     
    i586     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c33c5e98f018c93eae92ff392098baaba1ee6162 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/077aa8a7e5be49628508cd2108a616f452528be1 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/75891305c2f2710c27032fc4e89a96a4465922e7 |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2d87a9378e14c59e72da2aafb8c77d92e5e5269 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/94839fbbaab45eb19a66a2779618ca1632b98f2f |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cd504b833b2bb80b470b9e817206c8af732f2c5b |     
 aarch64_be  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8b49c6d30de5bf6077fefdd50da97e3a82497d90 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/441276a37ef57884eeba11096fe2351f6e76ec8e |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/30961267f4faa69b69523a18ad3667cbfb9f1338 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/56e65269cc1329fd0157315dd1ac454209441407 |     
microblazeel |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5befa841d9870c778c4194e92006169f02995b9e |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/792370f9cae6192c719586b06eced4ea39361201 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/62cb7d56e57771254235a2e2311eaf96c5965716 |     
    arm      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ef555b6ebf8500397257c369cb4593d6e98d38d1 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/60ca130e415775e2dc7d58af6fff88373718a804 |     
   sh4eb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/8879e3d4cb1a27ac3db96f099a2c5f35d24533bd |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2a76e3712137aa92e4a2ec4dc5bd2c389df5819e |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b9a8d5777360139749d60743ea7a51779541485f |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/fd8e4e5f2733665782204479e185ec6950a3f2b2 |     
    i686     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/97817d8309fcded36c0674ed8d05e9b78a1ca47a |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5f9286ff9ba8e797eda60381bc84fef4da155a27 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1be4ab12ef4e2710f0f5aa46b6ca9a31bc693f5a |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/21fc55c5f95ad2442ef883d4c826534fccec35a2 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1ce21eb66c1426214a13b112fd2fb6eb7905f850 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5204f29be0d868bd345648b02d3104ceaa1869eb |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/2bc571050f594d7e97a75ae54e36bc733b8269f4 |     
    or1k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5639bf1904869d33d1609ec048d7eeee67cdb11f |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/79ec02f808521ea17498e38a142541de882a95fe |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/a2af800629b4df1fae165b7b9a2171a1e2cb4f44 |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/90da216e2c9c785ad8d583ba9d055cd95f57783b |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6ae4b8ba03877003a3f7fe685a1522d972c06bb8 |     
   mipsel    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e972bb332522ec7743723b7fe46b4913b17e5d1b |     
   mips64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/5b338d2672dae7d3f6ba002b2afdccfbf0c42dcd |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/e62f84c956e4b30bb4f635126ffed58e2266943d |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4438576f605621c5cabba40ae66f3496fb7bb006 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/650b79c449ed8b2b607110ba16d7bf0286b0ec99 |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/150bc166a2ed05aea1c869c79d12139b3cf6685b |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0e039eff8f63a12f613088a8f495f6823fdaa27a |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7d51d97b09eb01dfde2be7a391e60aa18cc28815 |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/be0723ca054c9684821cecb1927a107e4b938e6d |     
  sparc64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ea6276ca5ff75d0f861604fc25d0a2424f1d7578 |     
    arc      |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/6dd4b7deb6f76ca0048c3710f789d4bdd2138d9d |     
  powerpc    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/803a6b69845ea84198d6237d2bfb847ad02b6b6e |     
 powerpc64   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7345c0312b6b76558fd213cd57092c5737d51671 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d4702f8750f1a53f07553c2be4f0c432887f5025 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/ce6bbec29dc3b530e49518269e5f91493b7573fe |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/d51dc804dee3620c9c83d18df0588d44de4cb3cd |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/614bc6d169b1d574bf60664d56f1ed426a8cbc50 |     
   s390x     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/7d92c40022395d43c102735a66126460a91b1fe6 |     
   armeb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/b4ab6b7b253e74ef8bfab90e5b0f897767d10b0d |     
   xtensa    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f6133dca868f7a436f8e474b2c914ca530ca0bd2 |     
  riscv64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/4baae61a201be29ba90f52db7132d930ef359a9e |     
powerpc64le  |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/34ee99063540f3535f2b6a35dfb329485b9e098b |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0e0f352af9ee9815dea521398957e9eb813e6c33 |     
   sparc     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/cf988b31bcce9df8dbb62a6992c9151a968ddac0 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/aa667a271bec2040a3bb9f3c717adf876fd9ccb0 |     
   arceb     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/1e87369090dce1ee856538a795e5b7a0cbfc7656 |     
  mips64el   |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0c0049daf8c0d82f2838c8ccd5a9596304fb4f12 |     
    m68k     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/f0891c019f3537956b46ef3c82ceed82e720eaa6 |     
   x86_64    |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/0721eb34770cfe370e10a079049ed812d7784c31 |     
    mips     |       host-cmake-3.31.5        | NOK | https://autobuild.buildroot.org/results/c2df00c4a3b4384048b47c8a1f774aada0218422 |     
   mipsel    |     host-e2fsprogs-1.47.2      | NOK | https://autobuild.buildroot.org/results/faa28536891edc03a876a6cd3959feb82266dd4d | ORPH
    sh4      |     host-e2fsprogs-1.47.2      | NOK | https://autobuild.buildroot.org/results/32b9f096794ea8392e322edf8e8b3f97e939e669 | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/5108968bde538f7bc87968f95550ea6f2d555059 | ORPH
   xtensa    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c327cac58eec8b56acc2d98bfdf676d5014af00f | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b80406e77c1d33b56b424e6c27dbeab0013a7bc9 | ORPH
    i586     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c97c8b5d92c0f86e4ec82ef144d06954bce10e88 | ORPH
   xtensa    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/63153bdbc58565f23cf29ddc6802cac2ff62afc7 | ORPH
    arc      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/07c1d603a55af4d611205843ed8008258f357059 | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/4580ec10b1e0a1e556b4d09c91e6b6fd69c678e2 | ORPH
   arceb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/1282a5d7241cae4c8a9f6a16ac1e6791b845cb4d | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/d404d159ea709e07e4cb25af4b11b6195665e958 | ORPH
  aarch64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/927c326aba4014de1a023d1ba83ef6164e1a75fa | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/a2a045a0df74c55f99ad04c46bd31f234b88e9c2 | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b837af64b5e18863bc39bd04ef87a6c15e1af026 | ORPH
  riscv64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/769c0d286154de088520a2bc186f6d2735425501 | ORPH
    arm      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/978d35b1239cbcd35de52efe78ca9aaa54fddee0 | ORPH
   sparc     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/55925d3481bf5c2366bd04ac10ab73038400e0e8 | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c388b70e146892833288551469378ba1b9c99647 | ORPH
  powerpc    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/26ca9d43eee799ad8ee07e62aed3d51cea36f9da | ORPH
    i586     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/acf028f74f5bdbec3c0ac5336e5c274856789c2a | ORPH
   sparc     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/e468d982b561cb914a4a4287e837cb8488f79389 | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/4d5436bcd9165ea9eae03b17082db7655f39a5ac | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c39f2b5d937277b4aca24a0938dd85c87491a657 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/84bafccaa7cf5197d55b5c15001741ff75885444 | ORPH
  sparc64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/59c272b9959d9e556720080bd2edfba170bcdcf3 | ORPH
   sparc     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/18fef4f556e6a911caee4f99ddc797619ce80177 | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/52f01413b142b70285df65e56a22ec4aef971a73 | ORPH
    arc      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/0e37e67f2bba5e801c92376259782610ee5eff33 | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/008460cf53a3087dce84c5d7c32fa24fcb14a594 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b193a3a42e3792d7d46ad278c59ff5d9a73fa7af | ORPH
   sparc     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/26c4dcc19b735591a8b15d734ee02c4a99d1c4d1 | ORPH
    i686     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/7416978648f0c7429e4bdb7c073080c5ecb6438e | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/782cb4930a0aba2e2c13b42666aeeb649e53965c | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/0a0d4291023e2383478c8802314b3f360f232a76 | ORPH
microblazeel |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c565b77b30f80478224a136df4b6c029f786b5c1 | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/53331339a141773c0a0e4b946cdb002db1783e96 | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/db6c204b4106363f78dee621bbc3096bd051169d | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/38214ece4758f6c610baf7a300761c34669a3317 | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/a8c95e6f9adb980d0df7824958d1d74acb3db662 | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/ef773652bb37510b17812eb2c36169db27dcb7f9 | ORPH
  sparc64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/2af807a352b932958c0c76b99c8d322ae3f6a40b | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/38d15032a3ca963ec7022a8e63595c1f3daac589 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/bb72c4ecd07d178745309bd48b30e2702e67ce55 | ORPH
 microblaze  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c5db23469e0b0a7526a145fb1759d847816bbc08 | ORPH
microblazeel |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/7eeb65004320b4e6677499e404ce11c998df6208 | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/cb07c23abc53c4ab3916fe8679842284cf3c905d | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c0c2da6f453e856cc79bb84303e4374a92ab6ec9 | ORPH
    mips     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c275991d7efb470a17efafd327eba1ff2228a233 | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c9de4cf64cddcfa0a96948a356d4aca509470c8d | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/c112a690ef1de26639080c18982d64294dd5c4f3 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/9b1f2b1eb25928961987789a7abde1bea25218b2 | ORPH
microblazeel |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/d18b4886a95ec10aec60cf4074f2b12f2a825748 | ORPH
  mips64el   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/8944c0384ab6da316fbe10507d02e4bfc8be3a4d | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/a161e40b938c9b411349f90e31ac4be2b7ff1926 | ORPH
   mips64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/2d0cda8758e54f45c53e8b64c4f4c2877213d31b | ORPH
 microblaze  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/e8c09e58b4bb96b2c281d57adcee8dca20375ca2 | ORPH
powerpc64le  |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/659627fe116fd564450caecb1112125974b8918a | ORPH
   arceb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/22735bb68dfed576d868267d7ba121d29c9bf4a8 | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/4dd402b52a4b54f825585aefd1a7c0c6fecc7f81 | ORPH
  sparc64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/f461021159590fa5c219c664c6068cc923bbb49f | ORPH
    or1k     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/23251ba5152e0badfa6d277964d395ef5fc335fa | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/56cfdfcec77f7412d52b899ed571418d10e7c59b | ORPH
   x86_64    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/624ff52c0d07991157d1f2fcd248e5c8d35c1569 | ORPH
    arm      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/004e3c1b7f462529f1063da2f2a47137cd5ac3c2 | ORPH
   s390x     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/450beace67981d782ce0a3fa3d557dbe749145cd | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/6544553b780e5c6755472e32b093c5054f3edfa9 | ORPH
   mipsel    |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/8a6df357bf5ac94de5ef555a64d2834217af4f39 | ORPH
   armeb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/1b06bcb5bbfa2e50c57fcdef4e5438b29ac6f60e | ORPH
    sh4a     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/53a496facf71c701cc2d4c5e1e981768c5ccaf0b | ORPH
    arc      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/52364a1ec1da1ccd47ae202c1c852426173e7192 | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/341cc5ec20669d88551493136be74ddebc85abef | ORPH
   armeb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/74ba7bde6b12441d62c28fb1784f52fa9ebc314c | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/df447e47f8823daad3a70c7b80de00a44b1c80bc | ORPH
   armeb     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/abbfbb5535ab75b06d6f256bf7507ad9a36ccfd4 | ORPH
    arm      |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/092c8e0473367202bfa2ccf05628864a581b655e | ORPH
 powerpc64   |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/6a9c4a934ba0b17416c701c09dba98e7bd06d7bd | ORPH
    sh4a     |       host-fakeroot-1.36       | NOK | https://autobuild.buildroot.org/results/b4191ae9d0929412903939707c4f6c4f2d8dfe4e | ORPH
   sh4eb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/bf018fdf6d3e1e77c0e8d382c37bb7a5625d703f | ORPH
   x86_64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/93b0532824e1e94dd81b3d15465364f02e5567fd | ORPH
    i686     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/8d1a7efcc3b51150743f963eaa113d5740266e99 | ORPH
  powerpc    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/6804d427b5456b40d3725d39f0c04077c1414e50 | ORPH
  riscv32    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/9f34d5e0d6378f6450c6697e729e803040267f73 | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/e3d18a72f03dfea52768e64ac29fcbc60330738e | ORPH
   armeb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/f452fbe44409ab84368c92a1ae1757bc9de74a1f | ORPH
   sparc     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/2999900e64e0ecef42bec30626cf03ccbed05181 | ORPH
   arceb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/c1045b648f2370df5b00fc98f873cb58b3d8550c | ORPH
   mipsel    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/249a726c967491c29b589764880cab7590a8163e | ORPH
  mips64el   |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/04971335754bfd5ffd47d043ca745270282258ae | ORPH
   x86_64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/b88987f04ecdbe7926804ba3604ab7a2148bc227 | ORPH
    arm      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/5e31550c34daa084f6737a7a3504961d1970efa5 | ORPH
   arceb     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/98cbe3bda61cdd216541a8bae84294e694fa7164 | ORPH
    arc      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/26b84832c41c334424cb0eaf5db23e6ced7e3062 | ORPH
   mips64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/1b153f0ad2092caf378babf61ee5d3d9b45e3514 | ORPH
  mips64el   |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/8cfef3ab6701b295672537657e6324bb3c5a70bb | ORPH
    mips     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/3608931f6a928f68bdbcff2954dfd99760e81efd | ORPH
    arc      |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/ca28dbd7000ca94e75b2aacbafe87c52479f78a1 | ORPH
 microblaze  |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/bc9b34e22bf9b1bdd16754b63e4950511e616a8e | ORPH
    m68k     |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/16b60f3a7a291760844e8bacba8b148daa1e2349 | ORPH
   x86_64    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/7b9685b15d04f1c19249e0a497c9d50ec6f16d86 | ORPH
   sh4aeb    |        host-flex-2.6.4         | NOK | https://autobuild.buildroot.org/results/38974aab914a5ac83792baccd3ae1656e8fa7ace | ORPH
    or1k     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/c3e05b251b5a543d060d29fa144c9c857294d39f | ORPH
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/6c2a7fb0f14a51e43ec8b465a54c5b252959e086 | ORPH
powerpc64le  |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/643cc8d1a4cc6e1f465e78c2f9d070b4035abec1 |     
  mips64el   |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/886b39bc104c02efcff893c05c0edff396995c77 |     
   sparc     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/3ec3b22028ff00f0ebaac30384bf30d8f83ae2b1 |     
   armeb     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/29e0efc7b4245c526093c7ff7b20da4a63238542 |     
   x86_64    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/3de6edc1278146cdfad7e42a8e71e20b8ae1fe6a |     
   armeb     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/8b277a19570bd93fe189448f8ebf649d75bfbe4c |     
  sparc64    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/4d098267a887204b02019ba5b8c659ba3f7829c0 |     
   mips64    |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/133bd2f3e3c7bc0ac449a05a5ea6af3965b2dcca |     
    i686     |       host-libffi-3.4.6        | NOK | https://autobuild.buildroot.org/results/68c6d3a9ba23193a3f9d9ddc7672ee7286f45192 |     
   mipsel    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/79e8bb04f0eaa96c45528f22284bcf5a28b6a812 | ORPH
  sparc64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/48ec67bbe0d8aa0760603a56e0742bb086893de9 | ORPH
   x86_64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/790212fac9c7d19921e33d09f6f8510c7c7ea975 | ORPH
    or1k     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/c82fb670fa1c5e37d233f04ab1c61627999cce9d | ORPH
    sh4a     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/c7ff61eee4face7e88de5f8bb1b60a2645be4d7a | ORPH
 microblaze  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/8aa92364a94d19f248cf6babccbcff3b4010d736 | ORPH
    arc      |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/6f34254b0086d8d835a93fb160cc9a298392b5e2 | ORPH
 microblaze  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/c37fa056ed797058351bdc435f7adf0e34a0eba6 | ORPH
powerpc64le  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/79bedeab7d247b7a687cf33b041d48836cc8c452 | ORPH
   x86_64    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/f2f8829f30654fad14d0447a468f5598941e9cf5 | ORPH
   sparc     |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/b84414aaaab0146c3f43490649e708202305b280 | ORPH
  powerpc    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/dd7940052de913c024ec8f17014876bd8cadb878 | ORPH
   sh4aeb    |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/e3af3054a5952276651f1db0e1d95b4129cc57c0 | ORPH
powerpc64le  |     host-libopenssl-3.4.1      | NOK | https://autobuild.buildroot.org/results/0bba7835572d34c34edd134c09f1a2161754dbcc | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6023db625dfc3c9b6c585a0ff94da7b049add8e0 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/89fec88fe974112cee7232462cf7cc64f3155f4e | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9a7ae20de41460cb8f84e0b76861d90ab2759934 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ef7ab0fb15b4c5cce3505254b51b5aecec6a253b | ORPH
    sh4      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1eceffc48d1ba739a8e1a3d6ab3e8f224c020d65 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/700ddf9378480cacf0423e77e9ef3ff55d1572ac | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3b56e748814ac8e6a61171c6786fc912b705309b | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cc54593f798f8146f33289a77aebbf585ef5e14d | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9c9cae8b5ffc1d453979f90b4f2e5e54fa5936a7 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/68847ddb1b41b4c159d0ff2780f129047293d597 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/32440c7ef5be916a7f4dc18eddf3055b34b73741 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ec360be2c22b805d0561210d65adb0d327efc5ea | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/dd1bfb5ab7d2fbf06307933199544eaed43441e5 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f4649fb20f76bbda5e3b24ec01cfc075f8863cae | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6f77baf9c9f16735a2322b8c36d904ccbd94b48e | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b2730a4450fd78637a9c336a6175e52a500f52d | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b2f4311d0d082988029c1541b2dc65d5c2a5207d | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8b3d565b3b0d6244d5ef7eb5e6dadf52da612df9 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/546b1c6a440d95f914836f972328e3fd4840ac93 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1ce4ab9203d2e6c6f0c8832a4454b03180d3ff89 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1f645ebcbdddeb894d2253522a06bbedcad4e53b | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/547dbf1a0fcf58fae39c51e5595dc1ad8319b866 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/fe8dbf77a8a5c7d6b16c0f6ef9c156585e9a795e | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bc5072d67d536d94b31fb9d445512c989e1361b4 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/defa46fd423f39ca72d468e13650beaf81c4ad92 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/944628b593b7194e38b69ee6779b6b9755c8a950 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/981bbe914791075d38665cd38480e6ca23ccead5 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d93cbf54578686adecc1970e2b9d48d75b08c7de | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7ffc40ac5f71f6f23b8c93d6cbb6cebda1290822 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d02ab087a4cceffab1da6183b03e62ac0ccd81f9 | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/2f6f7bafabc9a189a9afa9cfba32909945c0a3cd | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ccdaa31ee5c36bb6ffac806f729391cbdbc5f9ed | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a55b3fb05f5cf2b1e4373990e96ce9a904ff19ef | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/61f9630403c838d98a4ad57969d814e99f6cb31a | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/555723851118a128542a68eadcf9df5ddc70d13f | ORPH
   sparc     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1b2b585152282a76c1ca53e2832a35461e238b79 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a3fb50efd123ad6eaf506b8af33d86cc0a52400f | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ef8f53b7683880e637de5189a88dfa6dfc629770 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/3cb7fbf0aa59127994282e62035797f7daae43b2 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9170d8a2a320ee745afafad420746bd02f968f02 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d2c0814c9c74c9ad4cdb30bf5041328298e4f820 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/141db1cfb4de4c9a7a81ca664aad239519b920bf | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/e378d6a602af44215bcd79cc70784f1db8a59c2e | ORPH
   armeb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/00bcf7c35130e859f695d15df5016fe0f355dd0b | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5872443e31de9519b31c16a0421e25b721e1ab95 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/1a8a80eb30988666b8779173d4abcd8941b85806 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/26992d677a200f2f30c6520f6b22c95b94774815 | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/8a99634144c29f5b66809342c17c586d4bd4b1a4 | ORPH
   x86_64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/09209d64a65ad1ffede459bfa0282d32cd7fca03 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ccde78436de5a573029697ccb2b49e6268ad67fc | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6c7903c7f5c64ceeb41f4b6f16fa055688d8bcb5 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/9e538713510e19317f24ea6e27b0f4fecaa13533 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/06388d2c8d09b98c049cd691a185da54d25e0eb9 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d404a01fb243d376a4a4aaff0881c72d8f8f00e3 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f2429a6dc8ed48077e7b5e0d29740eff468ee1d7 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/b75ffa89945ddf2b34153bd493f6f63d554312fe | ORPH
    or1k     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/d1fc9eaafb41acb691db042fb883370304c431e6 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/937b55dcfd2ad33cab36a0d3b0fc267cf196eb45 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6a74ef1de209d91b8e409de84a2cfb9e21cea693 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/873f366997a56df9de64ea2e15feb74ae3c1e3c9 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/24fa8957b23f04b47b91e6301a0af8c025beb938 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0193cedc08ed567868f8bb98cc36835a38e53934 | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/df67a33f880770cf49b9c56d1d8f31acda59f232 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/0a4c359139bfcfd53c2ac0908760947402f460ca | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/7ee96e22c7d42da3c44714697e96645491b46bc1 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ce75c7b17fd8d38ff6dc0e41bbce84ca2dea25ef | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/cef511b3aac93224e2bd5c4c184e3a23c70cd2f6 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/96f8d37a8abef834ec80d735c18ec4d93a15e34e | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/5ab664c9003001ccd7603472002d664c96aa418f | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/312769df49493581f3fefbb17171ac025c7a3c26 | ORPH
   armeb     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/299d4ce972f33a271c5fbe17cc459095ef6bc30c | ORPH
   x86_64    |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/7b0569684f868c1081c46ee2fcb217e94fbf4f9a | ORPH
    mips     |   host-ncurses-6.4-20230603    | NOK | https://autobuild.buildroot.org/results/552471e4d7f7a9b061d0d571d633b9deec79d343 | ORPH
 aarch64_be  |       host-pkgconf-2.3.0       | NOK | https://autobuild.buildroot.org/results/6910f943ea1a926ef1784934f089b9dc0d9294fb | ORPH
 powerpc64   |      host-python3-3.13.2       | NOK | https://autobuild.buildroot.org/results/dc4843a9376fa1bf9d81b75929c9f573ae6ec497 |     
  riscv32    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/fedd477b93fb2973210b8428c47800a63fd44eca | ORPH
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/dbed023d39660c7544132ecea2af5d6add7e1409 | ORPH
   arceb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/e2064a951b390fd73242438495ae58d219984638 | ORPH
 aarch64_be  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/61ca6bc638bfcf2508aba818253cb87189c4889a | ORPH
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/073823403a3b317828c0544dd04b3606e8e9a3fb | ORPH
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/d2e56f99bc4bbf0e81285e84a15b10bfa800fbf0 | ORPH
   x86_64    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/ed7a5966509282d1090f8622517cb0aa703093f0 | ORPH
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/9901b9a1d50701de2c3840afadc104b1ccd9983d | ORPH
    arc      |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/53f759e298e46dd2c2c78cbea41db0b070d18b63 | ORPH
microblazeel |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/4b1d0568270400d1d93b1e630c50a72932ffc5e5 | ORPH
   armeb     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/be483cbf8f01793a65b098dec7289a16658d7c60 | ORPH
   s390x     |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/d76d0e5e5b1f50cdadc9cb2df247313ef1456192 | ORPH
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/a3378335c8b02c7d175ac37bb94ee2fe1e7e341b | ORPH
 powerpc64   |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/41bbcf04a15a6fdd9f5ebffaaecbea728546629f | ORPH
  powerpc    |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/2af9a0f29892cd4cc4bc54871b6672c808368322 | ORPH
powerpc64le  |     host-util-linux-2.40.2     | NOK | https://autobuild.buildroot.org/results/17e976dd8d22b1c2f7553fe20260b8dae0d2073d | ORPH
    sh4a     |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/339f7cc28defa6db480c82e4d627f3b01069d9c7 |     
powerpc64le  |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/6c2d67f543aabb7c510efddc9167a4a48fbfb5de |     
    arc      |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/6f0f6af32e0faae7aa4fbef108c579137e34e430 |     
  riscv64    |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/840d75cb13a16f842b05468cd179ddd3a36958f1 |     
   x86_64    |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/8200c0989dcea7aa3027d180b9ce60fd1a928a2a |     
 aarch64_be  |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/7765e309f7fdc219a7582bc60bff8153db15ec3a |     
   x86_64    |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/2757b734048409c42d912db89fedb917f5557080 |     
microblazeel |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/f8fce56fec2bfb18a9faf68a0be402873cdb10cd |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/8021bec52975939567d4ca93d5a7d454ce6fe18e |     
   sparc     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/591382dd2620889bf47eba958897269af3a73df8 |     
microblazeel |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/830b6b915c538003a1198a663b0a8fc42e99becb |     
   mipsel    |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/5ce95dd32e77e7d903e14e422812b0f6296afd19 | ORPH
 microblaze  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/760cabedd22ee4fe655518b14ff6dd797ed0d006 |     
  aarch64    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/03a22909e6a742d24619a72c04b68f0f305b1415 |     
    or1k     |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/7ec3e75e66cdfd98afaadbebf0a180c6ee698bc5 |     
   armeb     | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/1d48a82cf39a49f2be382a1e9739599de7187fc5 |     
   armeb     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/1ab01d7f77ce633c0ff0442a69945dbac86eaa61 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/b5388cc0c00fef584790bc5104528a9a7f85dd85 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2a1c456327d6cbe4bab7638649a1841d1dedbc9e |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a654072798c9e43d1dad8665e0d07ac147cf99ed |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/168bb6d86e28ce903481506063990e15aca1412a |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b195ea8dabf58abfcf22d62a5ad1999e6fa65404 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2539752de2da4cb99f2596fecfb86bcd1f5962d1 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/557e885c631ee2595a3917e827bd1f0d95212085 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/483ca320d1dd0f09d02a11d99a9574fd3d241014 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/2e1ede12eceb7e6bf41dfa29531051439fde6f00 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/55928de6e6287fe9f4b5c852974803abc8c95926 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.83 | 3 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/716eeef7941c9d8e410c82396c07dfbd0a5effe8 |     
    i686     |          linux-6.6.83          | NOK | https://autobuild.buildroot.org/results/7d1adfbd502bccb008c7072aebaef468681c641f | ORPH
    i686     |          linux-6.6.83          | NOK | https://autobuild.buildroot.org/results/ae8d195c2b56f07d7456dbd2ee9e968865531c80 | ORPH
    mips     |          linux-6.6.83          | NOK | https://autobuild.buildroot.org/results/29c367a9be64e8657ee62b66a86417236f80abe0 | ORPH


Classification of failures by reason for 2024.11.x
--------------------------------------------------

             bluez5_utils-5.79 | 1 
                 c-ares-1.34.2 | 1 
           python-daemon-3.0.1 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/1ed1d0a1b5b089de5c166ead6ec2f60ab6f6bc8d |     
  mips64el   |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/46d75e50a08995329ee6833a45e00da586ff75fe | ORPH
 microblaze  |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/338d4a9de79717807e3a0526fdfcfd348740adfa |     


Gitlab CI results for 2025-03-28
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535555943  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535555995  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556004  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556008  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556013  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556078  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556130  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556262  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556295  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556317  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556329  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556381  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556392  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556407  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556417  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556427  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556528  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556532  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556537  | ORPH 
           friendlyarm_nanopi_r3s | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556553  | ORPH 
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556667  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556816  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556863  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556876  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556919  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535556926  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535557237  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535557295  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535557330  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9535557334  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549631829  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549632040  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549632094  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549632291  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549633276  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549633592  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549633801  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549634250  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549634996  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549638495  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549655585  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549656142  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/9549658531  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
