Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2321C5B549
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 03:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B0A81EF4;
	Thu,  5 Jun 2025 03:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIQMhKcimQYt; Thu,  5 Jun 2025 03:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B70CD81E90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B70CD81E90;
	Thu,  5 Jun 2025 03:16:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6527F22B
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 03:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B31A6069F
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 03:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0tptxS9dOLd for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 03:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 840CD606C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 840CD606C1
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 840CD606C1
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 03:16:13 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-601dfef6a8dso865266a12.1
 for <buildroot@buildroot.org>; Wed, 04 Jun 2025 20:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749093371; x=1749698171;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CLrbMGnJxEjb9O9M1GTeVjUAg5YoaQ7QpdEg89W5fes=;
 b=TA5Gm8ljsIlVha7qSaeAeqtyRIGz+4T+ilju38LwTYOVYQcSMTtFl+RA8HFV0H4aSe
 J9Qmmgy1r9QOc2WoyCaXCiAEpVquNHy1lYSM6OeDtFVwezFniChQJ7YodxdobRqr11EZ
 sAaipRksOVhoL61KtKGKF0KAJgyWNPu6a8X5Eql2Z/Tyy2K9SeTKf94lR6y4fR35cfj6
 fJ2CNVfHBUxf4eWG0itRiyMZxWN2gfvEtfa4aY+A0hQ26Dzet3Q6syxqFFRgVCdk/Bg5
 4YdnVBQ1Mc12gqcjoKHAnNxud/zYKB1+VHGE4j/m80m1VuXYl55LP0t+bGW+Be+S2iOP
 6Y7Q==
X-Gm-Message-State: AOJu0Yy8m9r0rzxhd6bt84LSwyLPHk2yKOtyIOZmc1Nk+OO8wGyUhRB2
 7GMZOcWaqgrEEdYNHGqMH8UJSH6Qvz9uu8k9/n4Ofp99OMVRXZofDTpYoOsn8A==
X-Gm-Gg: ASbGncvFN+JhHwxWLVvhIwj1n5y5zQNa4CkE2+djVuFX+aypAgOocLA9YE5RmYsdBh4
 BDI7M2aVqTzZG29497fLfM2ElCnhMg/WlsegdqSgsQY/FuYh7EpdqvM0IzxiB/cOjResiOt2mSD
 n4Wq+QAIx51tzmsdTv+4qdHUV1UFNdu3SkQyYAFk5PTmEirvszxjEDMpOI/QdE6j41pu2IulDKG
 1kc2wFBAMVKAfJ/eILhRY+k4TL3HC3lkgm5jSm+k3w9caba94NcIhHukpUi3KxARp0PY9kfvs+t
 fC3e1WlUKXD1jxk9NeoOZQ3oX8Fxxx1AWXaU5TkilBCQjMYllQs5oKZaqvpbBUpGJg==
X-Google-Smtp-Source: AGHT+IFDLNFTC+pl+9DmhGNh+zM7Gf5Vsu5VkODDpb6LepoHe0jysR7EeRtJEQ2NCFwfJfWCJ0xFIQ==
X-Received: by 2002:a05:6402:42c3:b0:5f3:857f:2b38 with SMTP id
 4fb4d7f45d1cf-606ea17a5c6mr4918624a12.17.1749093370927; 
 Wed, 04 Jun 2025 20:16:10 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adb2dbcd459sm1068407166b.167.2025.06.04.20.16.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 20:16:10 -0700 (PDT)
Message-ID: <68410bfa.170a0220.c2ad9.a7a1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 05 Jun 2025 03:16:10 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749093371; x=1749698171; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CLrbMGnJxEjb9O9M1GTeVjUAg5YoaQ7QpdEg89W5fes=;
 b=lxUyxDBakRIKdywCyi54l9O52jKzpFduej62foPYp4JcX12+SJ0DR2keP6CmPUhwCt
 qNIS7pIQ99HuNFQi8UpIxvfvTXOhpGVUks4JIkf84/6KyyRMEyrMidtZ5aNHmpeI5gsH
 9gVZCiNdbXCHmZMIPSf0NYWm+aMkbLkciwqs7sVmGHYFDrXyMtffjWK1viSgvK8cB599
 acqSRmK+O3ZEdNz82jVG0RMvUddfJ0fTqOuHA+7Lv+E8+J3Rk7MjqPo6G8iRo5bFnr9Y
 iE6jIfPowE94g2hSXdcGhZ4peoVPU+9TPeOUXf0cdSJDy7yA0Fw7YcGZdxheEtxKHjBJ
 X5KA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lxUyxDBa
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-06-04
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

Autobuild statistics for 2025-06-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
    master   | 13  | 103 |  0  | 116 |
     next    |  1  |  6  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

                    bmx7-7.1.1 | 20
                libcurl-8.14.1 | 9 
              libselinux-3.8.1 | 6 
                       unknown | 5 
               bctoolbox-4.4.8 | 4 
          host-binutils-2.43.1 | 4 
                 host-gdb-14.2 | 4 
host-gobject-introspection-... | 4 
                   avrdude-8.0 | 3 
                   perl-5.40.2 | 3 
                    azmq-1.0.3 | 2 
                elfutils-0.192 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
          host-oniguruma-6.9.9 | 2 
           libzenoh-pico-1.2.1 | 2 
             parsec-tool-0.7.0 | 2 
               asterisk-22.3.0 | 1 
             bmap-writer-1.0.2 | 1 
              cantarell-0.0.25 | 1 
               catatonit-0.2.1 | 1 
                  cmake-3.31.5 | 1 
                 coreutils-9.5 | 1 
            ecryptfs-utils-111 | 1 
                flashrom-1.5.1 | 1 
              fluent-bit-4.0.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
gemmlowp-16e8662c34917be006... | 1 
                gesftpserver-2 | 1 
            host-libp11-0.4.12 | 1 
                libssh2-1.11.0 | 1 
                  libva-2.22.0 | 1 
libwebsock-3c1615eeadb0b582... | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.14.8 | 1 
                   linux-tools | 1 
                   nanocom-1.0 | 1 
                openssh-10.0p1 | 1 
                openswan-3.0.0 | 1 
                pipewire-1.2.7 | 1 
                 pixman-0.44.2 | 1 
         s6-networking-2.7.0.4 | 1 
               syslog-ng-4.8.1 | 1 
ustream-ssl-68d09243b6fd447... | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/d02a60025a1d94d1bd126d692c700ebb935204bf |     
    arm      |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/03d0c3e5d2e5880adee2b08363b13f66791c90b6 |     
   armeb     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/dfe135e3552aa0b23671fc607b7dcbcbe22ebc67 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/de7ca98b9a57a92a1bb195a51932fed540492e5a |     
   arceb     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/c77b87527a11ce15571702d88a433b075d98827e |     
    m68k     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/da931fee4efa9a380bf8457555484fa1783e78a2 |     
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/c06467fc02a0410e02b8334ae3a326568d0f0122 | ORPH
   xtensa    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/cbc728f4ef9a6795fdb2df11405f7169c103278e | ORPH
microblazeel |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e727f8eb1280d59da11348ba227b02e2e927b21c | ORPH
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/5c6253c1c7adc7f2de16b0176e88a7048c1b2876 | ORPH
  powerpc    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/21525e2c370dbace45a37500cea2a4c289eeba99 |     
   sh4aeb    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/bdd29124c42bcc8f3577cc7c1e19cceb66fc293d | ORPH
  powerpc    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d7538e99e092ad1211c80056d54c003b907afce8 | ORPH
    arm      |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/516dd16dd488b1b583506c720d0659d626d5762d | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/8f878d4f5dd3fa95ca7ac8bdeb57aa85150d010b | ORPH
microblazeel |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7c7ed4ae213b3c32f482a0c98b678c7345386cca | ORPH
    mips     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/38edb20e2c6ef1ea341e4b1328c09c9712090617 | ORPH
   mips64    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a452bf90d001d7f33da7a38a8a23c48b5ade2a19 | ORPH
    or1k     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7c3b53fb95d76f331c81387886c61b0e5c0623f1 | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0194d319e254c24840f7e98bd5b6ea9fd31c3dcd | ORPH
   armeb     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/7a5363f6fc0a417f88a6f9facd057a96f31c68d9 | ORPH
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/cbc670f199e3a5228b4f7dc7b36b84c30005468c | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/df01075ab17c85db21a1e67b46e3d7ef44096d6e | ORPH
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a422c6f4d4eb6ba7131aea569d0ae1c29a0559cb | ORPH
 microblaze  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/322ca3ee76c5f0d708979a27abae72e8f04fdce8 | ORPH
 powerpc64   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/c545c331270ea3505071d7c9d3df832462b61e2d | ORPH
   sparc     |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/3b0cc0cbf8b30ad26f8176d8c5aa4d499c53b6a8 | ORPH
   mipsel    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/d36995a989b2362d3999d007eac5ee4a119cf3d6 | ORPH
  mips64el   |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/23e4a2605d8092e87cbc252a8e7c380f0f8a73e1 | ORPH
   mipsel    |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/a975f973742fe79072d61c0823c1a52f6821d0eb | ORPH
powerpc64le  |           bmx7-7.1.1           | NOK | https://autobuild.buildroot.org/results/0ed381ac00dd4b26969e62f37d50a590b7f65f7c | ORPH
  riscv64    |        cantarell-0.0.25        | NOK | https://autobuild.buildroot.org/results/d44f91ecda6711275744cc472a0418d64fc84c5b | ORPH
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/9aad64f4345aa542afc91b516632f779306b9a95 |     
   mips64    |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/5bb11d8b7c49bf69ee918cc873cff6f1053b3e64 |     
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/5f36254d3dac2205a70c90456b4ba0db668e622e | ORPH
   armeb     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/841869e6062479c9a7a21ca13fb633a334677b82 |     
 microblaze  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/c91ed5b3adde288befa5a4bbeab9f21b052b6420 | ORPH
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/cc4ec7260e673fdb17eec9432c77b803ada62815 | ORPH
  sparc64    |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/3114724a285d35f44bdebeebbe1404f650f05f4d |     
   armeb     |        fluent-bit-4.0.2        | NOK | https://autobuild.buildroot.org/results/ade1783e6a8a9025a4fc12a8370d479662b84ec4 |     
    arm      | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/8693950d8aed8d9b6ded548dbc5eca4c07e9f715 |     
 aarch64_be  | gemmlowp-16e8662c34917be006... | NOK | https://autobuild.buildroot.org/results/2eda512e3b2b7006276590b3fed5e044ce7f4da1 |     
microblazeel |         gesftpserver-2         | NOK | https://autobuild.buildroot.org/results/e347514f818305a17d760c912876fbf867e0e74a | ORPH
    arc      | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/f8daaa8eb42cf82c99d6790148b4fdcb53b855d8 |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/c03ab2065a9d0186109609afe6e359f3f9def67d |     
   mips64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/ed4f4dea6f0f3371f2aa19bff8b4b9600d089b09 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7e3b5d732a5236c64d6d1e0163cd135d6d61ae83 |     
   mipsel    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/7e78d7ee44af02703bb46914bd2dbe48ecffa10d |     
    mips     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4a002235ecf208cd05b8900519d34bb331bee3c8 |     
   xtensa    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7f924557ae65aed482e491a5b842b7062e44a7cb | ORPH
  sparc64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/fa5c3b8ff708aa98cbe645ad3fc5db8416a1e8ad | ORPH
    or1k     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/ef26114a3f6c01be94fed55a571daab5f7ff2579 | ORPH
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/5656b699346e0c75a5b14d21c307487516a8fda1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f1ef10d883b625ada3cf99fcca679d3bf9303f53 | ORPH
   armeb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5e5713f2c041533d1acd80d1be8b593b6aac125b | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a0a9ae75210cc0e252b76b59701df5338d299c85 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2b3685e5643234a83687b805bbfa5ddd4e060d61 | ORPH
    arc      |       host-libp11-0.4.12       | NOK | https://autobuild.buildroot.org/results/d641769aa5236d6f93048d63bcbd88f353fd7290 | ORPH
    i686     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/50c36016d7442787e59f6737ef24ea82d7378681 |     
    m68k     |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/eff2112849b45056cf6b030813809aae1a0262f1 |     
 microblaze  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/45e5cd39fddee64f38cf4601877826ff7433a26b |     
   s390x     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/9e9c8b28c476544a1a5cb4f62666525225e15aca |     
 aarch64_be  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/ea44b98214c3c8d744815e2a866fbf8776291829 |     
    m68k     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/c20410a27179c9795b67329205d2309e6645c910 |     
 aarch64_be  |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/da6842355e678ab121abdab6d033b63e75126d8b |     
   sh4eb     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/1a2e50304566f4b94aba146f47f5ced820dc28a1 |     
  sparc64    |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/ceae784431353ca38ade2bb969fb74920a7d0221 |     
    or1k     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/8b0f94053d889fc32e1978803057520ab2c7fefd |     
   sparc     |         libcurl-8.14.1         | NOK | https://autobuild.buildroot.org/results/22f74cfacd3045e553a1012ce96ea5950623b106 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/3c36731113c205e899c4647e34990dde2302e602 |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a76f411e1d835480ee55e029ff97c6728ca53518 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/fae4eb52b18779fc6518d23b00bae42645297bff |     
microblazeel |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/36fd55c5792634e1a931fcf54cd679b53075e478 |     
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a5feb9c204d552849892ff062d4321f6fa204f44 |     
    m68k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/458cf7eb50a43faabf06d92330a1f53bd93e86b3 |     
    arc      |         libssh2-1.11.0         | NOK | https://autobuild.buildroot.org/results/cd627cad637e897c2a14893ed50167aa098369ac | ORPH
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/1ff38d53d5511bbda180220b836527bc8b60d3c5 |     
   x86_64    | libwebsock-3c1615eeadb0b582... | NOK | https://autobuild.buildroot.org/results/ad6e86765ca0bfd551330c061f23c39bc04a5a93 |     
  sparc64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/6828b13b72dda1dcf3c26eaebd2d75df872755b7 |     
 powerpc64   |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/dee8003c151b2c80d3a7b4ceee4e97b6c0176dc2 |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4ea4e0ebf95381c99035113b1e43177b10a4feda | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/90739f2be8f9978bd96d4f3b40e60bb0aa88c2e2 | ORPH
    sh4a     |          linux-6.14.8          | NOK | https://autobuild.buildroot.org/results/c2f9187e7fe68dec835cc78b9de49a59cc67c414 | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7e9d8acd65ca17c67df7024445fa17759147f297 | ORPH
   armeb     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/afd45c900ae01b2e422b98ff0928f8b7c077f1bf |     
powerpc64le  |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/95371322e0d302fca268fa835e52cecfc720b269 | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/54f45a5c5f9e2cccc4050d8e8bb4f1f77a3df86c | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/489796dbbf5a9acf4dfeb61ce01b6050cc28ea18 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/391ab5a3ca153ca2b3320a6f95c0aaf7de2c0784 |     
powerpc64le  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e5bacb66591ead95d88e81f46e259762cdece315 |     
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/5fb601cfa8e1ed9e1c03bc71ba530814f17d38c4 |     
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/ac2ecf222aa43b6f5a9cc011f37a32ca9dbb0829 |     
   arceb     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/c612fdcb1be46d6e4387f07ddc7adc18e3c8e0e7 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/2e4b48d58d289d29b24e847912a3391aa4fce571 | ORPH
  aarch64    |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/9bafc02f3a4652bdd08514b8a4656a5698cd96d5 |     
 aarch64_be  |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/ec46dbd2089eda588f41131946c3429ff1dfb292 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d2028229c2d3dcaab43b995d157fd0553e9e361 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/aaf3a2ddc50db269c971bf5c688b29bf9bcba8a3 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/17a8e11525bc527eb743a3a5731d4cb85865f3c3 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/08608643efbdba85a56e69238d502abeadaab566 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/7ca118df59b31abd24fcad23375af6caf5067481 |     
   x86_64    | ustream-ssl-68d09243b6fd447... | NOK | https://autobuild.buildroot.org/results/b55b203de6deaa2313f41d2eeabbbf9e3b673ba4 | ORPH
    i586     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/d9fad0f6bd6b641537bf7523ffb1ca6a52a3b97a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             fluent-bit-3.2.10 | 1 
host-binutils-arc-2023.09-r... | 1 
          host-oniguruma-6.9.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/8db1f7aca68b87aca860e71baa96f7091ac7a532 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/f6b4759d3ae4a87469e4e7957a86a2516a5373da |     
powerpc64le  |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/829bb5734565a71f654c34be7e49024433483f91 |     


Classification of failures by reason for next
---------------------------------------------

               asterisk-22.3.0 | 1 
                  bcusdk-0.0.5 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
              libopenssl-3.5.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/410056472799bfbfbd0d7e404507c295bbd1ba6b |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1308df70df2b255af68f6ba3a87ff79b78d40aad |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f8a2cf8d790f57b34032c81371cc381a33e99ae4 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a9c9135ab2b215666401ef708a28c69279237012 | ORPH
  riscv64    |        libopenssl-3.5.0        | NOK | https://autobuild.buildroot.org/results/dbbfb038f904388de0dbb99b3d46c3470748739d | ORPH
  riscv32    |            unknown             | NOK | https://autobuild.buildroot.org/results/69858591529cbabd8460c60a3bf3904979e09e22 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
