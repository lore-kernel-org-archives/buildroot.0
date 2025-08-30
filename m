Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ED0CA0FF9
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 03:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 513BF61AF0;
	Sat, 30 Aug 2025 03:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ksZtid_5A1x; Sat, 30 Aug 2025 03:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D20C861B73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D20C861B73;
	Sat, 30 Aug 2025 03:25:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC9ADFA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 03:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A153041D99
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 03:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzXnY21jpJx9 for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 03:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1323141CB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1323141CB5
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1323141CB5
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 03:25:22 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b03fa5c5a89so2621666b.2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 20:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756524321; x=1757129121;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kmx7BXfLXLULs46+0IOsr93kbS278x3K6zfW88cZu2c=;
 b=BsK7kB38HtVkZkjRFCQRQIoSApWH/T0gs//muav8M5tLRmO3kISj0QPPAzsc6gq1Iz
 de2pmJdzzGrpTEtL2Oe+GrXAVDqtdGfXrL9eSaPC3OMloWtsvLB7AajaSjHch6xkvzUW
 onLTFIaAkMN+BM2hAu8tb9oJlqjiq4rMZVjgqV6Tz1SSPRzzCzvTRefNrE/ROzgdYfdi
 EIDkUsqCxq9eLHu71E9uJfgJvbaA9s0tRPI2Lr4IrZXRR6gjFAYSyQ6kDQU4X0JkL8PO
 FOpBbqXgo+aGShQeKIFWQVPU75v5EoqJaBfu7ywPByvmLtQ6Kqdg+ICQAyNvyt4C4XRI
 9qPw==
X-Gm-Message-State: AOJu0YwsVuRSQ+unVzN1IhxtCrDh96yc56LGEtxv5y1DTxFxKOc+R/5Y
 96+akK5o5IKBsEhuDOP2L3xqdiIluYSYWeGU3iGopLkc2R6LY3v9uwDy4FXk4w==
X-Gm-Gg: ASbGncuSOGAd8SvPYl/RJf+p2gcbp8WZeTMBEUq6ccyi1AHO3dos9a1sTiG3c3wq1fz
 JClDIexa94g6FWlqkKrERUujrGL5Jg6CasEYR45ZLV0wTxJLNqVdzRRByjPDYEyjG27CJBO3t08
 ZleNdZ68VLc72MDaCJ3mtIHrZGyc3c4/EcXhYUSNVqrk1hGjOOMrUa57tyj1REdRNF2g+TsGETU
 fGi7f5htfqxHAdhluoFz7AdPNrJFKe9n7rOBRIawsMBzSULb3mcSQH6m6h5OUUdgir8N6eUWZKB
 T96BQUHlH47ei7/F7S0K/XHl7AOrQwPpWfsIsg5P2salIQI06LxtHwpvCLzAFx+Vp9K7avaLCAn
 m9h+9HqN/iJRry+vwQQJRGUpdZtjyqrUMMpJ33Wyz
X-Google-Smtp-Source: AGHT+IFmepOH07auBX7YjeKi1qrQ//cdbFEz6E6A4iz1R9ymwwHqTftwGPeu84Dwo6IRsDn5ppg1cg==
X-Received: by 2002:a17:906:c149:b0:afe:af91:2e44 with SMTP id
 a640c23a62f3a-b01d8a6ac14mr73497066b.14.1756524320288; 
 Fri, 29 Aug 2025 20:25:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd8ed2sm324657766b.66.2025.08.29.20.25.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 20:25:20 -0700 (PDT)
Message-ID: <68b26f20.170a0220.3b66f2.8f8e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 30 Aug 2025 03:25:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756524321; x=1757129121; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Kmx7BXfLXLULs46+0IOsr93kbS278x3K6zfW88cZu2c=;
 b=Wnl2ltdBNg+hiPqXknEvnyKsLDy0cyBkRuLL6bv4YRXr23s/FkTYQKO0t89MYFmFIk
 9+FopB/LKGFwTSdq05htZySacy0d+O3pNRv1F3xj3gZUCmcLWY+5RwyPG4lWzi13Otll
 lubofHmmQpfU4imQre7Xa/FuHg811+CBjU7+L8v1KEK78IwVKO0J6GSyy2+SCaTmMncs
 VYQvuhhJW9/2O7af5NIxuhH07TQ/7Vv8dt/DX1mMI8SDAG/VLkzmI4lEaKjaSWTJdpiH
 481n/r9XDjfZk7nUlC/3xyUQClTKZhBWtvG4hpcGlUHGyPU08dKJ+O87mimeBqfs4kuo
 IoeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Wnl2ltdB
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-08-29
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

Autobuild statistics for 2025-08-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  6  |  0  |  9  |
  2025.05.x  |  2  |  3  |  0  |  5  |
    master   | 24  | 86  |  0  | 110 |
     next    |  0  |  4  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

            netstat-nat-1.4.10 | 4 
                 c-icap-0.5.10 | 3 
    host-llvm-libunwind-20.1.8 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                       unknown | 3 
        vulkan-headers-1.4.317 | 3 
               bctoolbox-4.4.8 | 2 
brcm-patchram-plus-15bd6638... | 2 
                    gcr-3.40.0 | 2 
                 host-gdb-14.2 | 2 
                 host-gdb-15.2 | 2 
host-gdb-arc-2024.12-releas... | 2 
               host-vde2-2.3.3 | 2 
libdbi-drivers-0bfae6c43134... | 2 
              libselinux-3.8.1 | 2 
                  libsvg-0.1.4 | 2 
                 logsurfer-1.8 | 2 
                     nvme-1.12 | 2 
                    sslh-2.0.1 | 2 
amazon-ecr-credential-helpe... | 1 
               asterisk-22.3.0 | 1 
                   atop-2.11.0 | 1 
                   avrdude-8.0 | 1 
             batman-adv-2024.4 | 1 
                     bc-1.07.1 | 1 
                     crun-1.22 | 1 
                   cvs-1.12.13 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
            ecryptfs-utils-111 | 1 
                enscript-1.6.6 | 1 
              fluent-bit-4.0.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
host-am335x-pru-package-5f3... | 1 
              host-rust-1.88.0 | 1 
            igd2-for-linux-2.2 | 1 
                       jose-14 | 1 
kismet-52bcb902e36b2df1562c... | 1 
             libgphoto2-2.5.27 | 1 
                libkrb5-1.21.3 | 1 
                libsepol-3.8.1 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.16.2 | 1 
                   linux-tools | 1 
                  mbpfan-2.4.0 | 1 
                 mdevd-0.1.6.5 | 1 
                memtest86-7.20 | 1 
              mosquitto-2.0.22 | 1 
             parsec-tool-0.7.0 | 1 
                   perl-5.40.2 | 1 
                   qemu-10.0.0 | 1 
                    sdl-1.2.15 | 1 
               syslog-ng-4.8.1 | 1 
               tcf-agent-1.8.0 | 1 
                    wipe-2.3.1 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/62a1422ef81a864d4c8ffd8f9c5b1d0a3d6db633 | ORPH
   arceb     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/6fb6c55113783b0a579ceb241cec6f7601168b1b |     
  sparc64    |          atop-2.11.0           | NOK | https://autobuild.buildroot.org/results/5070613f2f0736ec8efd3316884828902ca8e307 |     
loongarch64  |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/f18d47289d8b4dee768275a468c25b4f4399cf8c |     
  riscv64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/a186ac8e86eeb5af7d68381855151d2c9ad63ee0 |     
  powerpc    |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/629b431b84215251413031efe6e6f2969f691dc3 | ORPH
   mipsel    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/6700b647725cebb2244194aac4ad4436bd0ed796 | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4230dbecdfaf623ede890588e9b000be5d715b87 | ORPH
powerpc64le  | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/2058934e442c0b3f3d0bd81bd7ed080c2eaade31 |     
   sh4aeb    | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/58433a24328236b40526c0776c8f400d26e84b27 |     
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/f09bd53b87f7830d64f7ca9f3cad0a2b3a267bb0 | ORPH
   mipsel    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/aaccedca1f18555220efee0f4669e1283b2690b8 | ORPH
   mips64    |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/eeb61725e6c8b6a8340924a58a939946915f31c9 | ORPH
    or1k     |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/13cde18977cedce28c189c11ef5846bd81c3f382 |     
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d884790f46140ec8d1cfd7f8d0e1f05782a746e2 | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/330475cc2eeed7957416df9604bd8ab8a27c5ba4 | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/34aebfee6788e42f9478902713ae67caa821199a | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/a3f0a7f2211e8fc3fb60f7e40b5fa12be6aad2d4 | ORPH
 powerpc64   |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/f32ae62961aac7e8344f4be109040e7de2eb415e |     
    or1k     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/06c1d03779af0c3a2dba9d235b041b6ec9456f0d | ORPH
   mipsel    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/a8a5b6165bb0043508a70c7f324a58025efbccbc |     
   s390x     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/fb6a00b661c5e0940ed9ac3b68d98320fb803969 | ORPH
   mips64    |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/c75e67f8abfd47ac91d370055cd8e02c77ede085 | ORPH
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/eec429b20df93f65f604f2fe6a683d97fe617947 | ORPH
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4a81a987c5124a054d526766b26d1ee5ea610210 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/76c878c4d3f92b5d3d9abbd7005b2b25423960ad |     
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/53bd6b0fcb928f90b032e59c9706740e4bb440b8 | ORPH
powerpc64le  |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a26d85b5c8af9d637b40eba72ea2f8f332b60c78 | ORPH
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6b35bea7d6e7fe60d0bb1adefebfc02f57236b03 | ORPH
    m68k     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/82715dfeed997aba8fc26ab3082a2c50e116d5fc | ORPH
   arceb     | host-gdb-arc-2024.12-releas... | NOK | https://autobuild.buildroot.org/results/71d5e17ad4401774f8619f986d7fad379ba4e37f | ORPH
   arceb     | host-gdb-arc-2024.12-releas... | NOK | https://autobuild.buildroot.org/results/3aa41ebced95c1351d20dae308632b1002e8fc1c | ORPH
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/c7c19e4ee049a6ffe686684b84b6478e73585fb4 |     
  riscv64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/81f327fbe198e4184ec0fa9338fad40873f275c3 |     
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/8dc6b9c33254b8e6ab2b4f99d647fa2251bfc39a |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/cd06fee05cc3c0f1419f29637b5144dde2408179 |     
    sh4a     |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/c3743509772493f3ccd9a5b4db7d61599cb0fc13 | ORPH
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/ef2e45cce856566f426d7aba675f26571665df45 | ORPH
   mips64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a0f857f5115007131467be4e320cc1b6a8565e6a |     
   sparc     |            jose-14             | NOK | https://autobuild.buildroot.org/results/cdcb6f4b5b7d925b82f31afb8c4baf941e9d8449 |     
 powerpc64   | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/4fee09e43817401d7788129754fc92a752b770cc | ORPH
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/73a5be371562f8cbf7855fc9bebab76f3c932d33 |     
    i686     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/144f2880bbc572f0b20de843c272bf482b58594d |     
   armeb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/edfa84e2b778cdb8d9025c0a27ccb0748bd83762 | ORPH
    sh4a     |         libkrb5-1.21.3         | NOK | https://autobuild.buildroot.org/results/5bafa76d6e28b8e9aa848d71900cbf2f93dc1263 |     
    or1k     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/71c73ed357e4921af9ce0245379e4b11a6667f2e |     
  powerpc    |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/029a1d69df4693fbc5835ab79cdbd020576da8b5 |     
   xtensa    |         libsepol-3.8.1         | NOK | https://autobuild.buildroot.org/results/0a1606767923d96c41b447a0540024a12da6f089 |     
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0620550ef7478d96e257e3bc47501e436033f15b |     
loongarch64  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/7b63079c413e47e290de5bf42245e2ddf8b40847 |     
    i586     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/c5088fa94061d91ea525eae91fe2ea71d601bc67 |     
   s390x     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/3945335fdc8534720f4b49b0725699bb1fc30217 |     
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/3f350d10de41c8368b3eb823608658d57f925bc8 |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/58b42db8265d04a6f9e9a9acf92fc7b3e807835e |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/15fab39ccc7b02c7ff48c967fddfb623e69be6a5 | ORPH
   sh4eb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f220a1adc0624f1c17eb679da753409ddbda627b | ORPH
    i686     |          linux-6.16.2          | NOK | https://autobuild.buildroot.org/results/bf3c1018fbf12eb162bf2d5565bc2db9ddb68ec3 | ORPH
 powerpc64   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9f54b8a72b2fb4ee0d69f18e5640f8735f148b0b | ORPH
    or1k     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/76b9f4ec2854e021b0479521aa7d2f47c6500540 |     
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/6914273b5bf24b7eba2cf01af6fd4c71c64e9528 |     
   mipsel    |          mbpfan-2.4.0          | NOK | https://autobuild.buildroot.org/results/9526503fe8e756bd4444f1fb1e9cf1391c461901 |     
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/2247de8e2bc663f28e33c4cd33acbf1cd06e7155 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/bb9a821dae9613cca048056ea6b59928bdcee846 |     
loongarch64  |        mosquitto-2.0.22        | NOK | https://autobuild.buildroot.org/results/51c162557df2f50ea238bd41e0f57b3b6e0d3610 |     
    mips     |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/09ec5cfbf908d45a3020f1720e02d57ccc3182a2 | ORPH
  sparc64    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/26fc05f0c6310a9133b5cf36293666b14b5c06c5 | ORPH
   xtensa    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/d8e2f6fb411d3cf19c1b870e1417d9bc8e9d78b5 | ORPH
    sh4      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/cb3c0d6e61a7d923d5fe9c659c54a2d11a4df8f7 | ORPH
   sparc     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/00d810e833281305e60c7c90c327dd42b62f9a60 | ORPH
   xtensa    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/487bf6ea22500e51867a1385913b6e12fe3e4667 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/fb25f3d460f1ba3a120ca5948dff633e979709cc |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/eca58fdfe75726427fd7cd6b464b3d56598b0fd6 |     
   s390x     |          qemu-10.0.0           | NOK | https://autobuild.buildroot.org/results/4e6531bf8b38c9e8d2770ef25a29731f1c839ddd |     
    or1k     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/00b6270fb4ce30cebc9a5e6b40418ea89361ac9d | ORPH
   mips64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/7e95726101a5bc934a104b3f1b80940efc3dfc7b | ORPH
   armeb     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/4acd73709460bce4d4c29a1f254afb82d473ac5e | ORPH
 powerpc64   |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/5c58eed81fd36b71857dbc402032d963c2bdd306 |     
    i586     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9a09c44585977cc8f65cd060762385d044ff46e7 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/500aa519e3cbb04c1cc6f2f7ea76b42c707f949c |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6be0870abd3509d3508db4dab28ba90824659451 |     
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/d70b001b00e4f4fd82a74ce0bad044c9028bee1a |     
   s390x     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/4197761f44db67629ef95c64d91fd274807791e5 | ORPH
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/fb6e53a5ec6f504ca10fe216ea5ae06a17d62af0 | ORPH
 powerpc64   |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/ff3fa9ee09b51d51b09cd32cb335b431e62daf0c | ORPH
   xtensa    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/18461638d219d407e4c1922412bbf9a3fb1ff5e0 | ORPH
loongarch64  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/ce9fcee14df356a58dbddf17e339db94d8eeb42e |     


Classification of failures by reason for next
---------------------------------------------

              json-glib-1.10.6 | 1 
     libphidget-2.1.9.20190409 | 1 
              libudfread-1.1.2 | 1 
            netstat-nat-1.4.10 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        json-glib-1.10.6        | NOK | https://autobuild.buildroot.org/results/9c41a641854c1f9ef448394326d5ee0ecd15c1c4 | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b13295ba6a04d760a5ff6bc48518a90f67f51abe |     
   armeb     |        libudfread-1.1.2        | NOK | https://autobuild.buildroot.org/results/a4afbf925a46e256c488fb4be0a25156aead49ec |     
    sh4      |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/bc52c072121286ddde3eee98ac28feb98f33dbbd | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              containerd-2.0.2 | 1 
  ffmpeg-n6.1.2-27-ge16ff06adb | 1 
host-binutils-arc-2023.09-r... | 1 
              host-rust-1.82.0 | 1 
                  libsvg-0.1.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/738a46c8c6e95040b0a4f4b16fa6e65356f033e4 |     
   arceb     |  ffmpeg-n6.1.2-27-ge16ff06adb  | NOK | https://autobuild.buildroot.org/results/6a9d9c9039aff2b58cdbf0ef23867828c278a241 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/1c2b9c682644ce6ba514b38dc24cbffad54698ba |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/83b895642a08239f0f8b7a99b3d8a6dc2f634c12 |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/b88805ce3729191db75ebf93bbbbcdebb34ed450 |     
    sh4a     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/257a3d1ab0049f80dd189771446a494cd58440de | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                 linux-6.14.11 | 1 
                    ofono-2.18 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         linux-6.14.11          | NOK | https://autobuild.buildroot.org/results/5400bea4443ccec3af4e574fb4753f604883719a | ORPH
 aarch64_be  |           ofono-2.18           | NOK | https://autobuild.buildroot.org/results/286f57a00300ebbcc55d69f55cb512614220b971 |     
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9427e1a9064f6ae299e0be7ba8ef2336861d7510 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
