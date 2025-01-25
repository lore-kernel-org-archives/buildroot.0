Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9615C02182
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 04:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB474151D;
	Sat, 25 Jan 2025 04:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_RzWnrWbsph; Sat, 25 Jan 2025 04:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14064156D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C14064156D;
	Sat, 25 Jan 2025 04:24:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06510941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 04:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DADAB60768
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 04:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzE54BgiBQtL for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 04:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF86960762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF86960762
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF86960762
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 04:24:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aab925654d9so511412166b.2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737779067; x=1738383867;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=96H95CjvmdSa04SeexV9HW1cbensoZSGoMgLLNBUGIM=;
 b=mcTfBYGNxNJXgvg+CK4PKBZJF91PAx4/Fk0TG5zCzKhS3tDWUvYAjyhuRSL4/B4q5n
 knvk4pUP9Al93Oi9YMRaIKDwxmpWOq6uzfbRoqQ2E9eGwnRFkQZ4Qa0xfnX6degf5PL6
 cvxU85KuzODbng5WyaG6kdqabJnUOGGi0UColYWhyCerpPascvNWBwyaGwrU2PINBOvX
 byTMup3iDimsT5hlyTbz/xxmvPNDsAw27av3H4kd6sBhzUDc5vtSuJEz3SznUb2xx4xN
 GiXDRle8fhnEdUp4Zdud4AqXxbjwpp0kae2H4Sj7QLLiqZOxwYh/ZNtjGOCclOlo+Q9a
 6mOA==
X-Gm-Message-State: AOJu0Yz+BgVi1rA96wj/PskjodH4K2SbIlah+eZLNNiDvpp7WB+8WVxz
 fZuudoDfJYO0VcHxESqTOYLIPu3SSsWy4xljDjh1PVpj33DvG3BeqyogHw==
X-Gm-Gg: ASbGnctM2c+mtI6hDD2nkK0AyJHmoKmZHVyn6zajibGRN253hSZpB/FzN+OoJ8VntJL
 6QiyMks+aLgb8K2cavMvTZDTGwijc5yk9YnXJOPNKEPn6KibXZlZdo5Vu9b97WUAT+XYJvY/4pf
 algL1Pqt09s/epmduGx8XvN32rtSxzJHNridptOFMTYvxhvHhnKJZg8mEfP1ZojpnUP/UvASpmR
 OZ9FmoArR4CcnWcaIrHJyl5bqH45tUC0b7Qr3cs4AqM6c04l4HBb4GuuyyHnhouZBT2AjeStful
 G2oo1hNC
X-Google-Smtp-Source: AGHT+IGxykdy+O0p0bVuAINZdJ9TzVQ9eXBvCcGgJV1gXrhP94ZpE9UG1Dpk85ece80lzNY7ieqMtw==
X-Received: by 2002:a17:907:3f12:b0:aae:83c6:c679 with SMTP id
 a640c23a62f3a-ab38b3226a2mr3051538366b.32.1737779066510; 
 Fri, 24 Jan 2025 20:24:26 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab0bcsm225232066b.95.2025.01.24.20.24.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 20:24:26 -0800 (PST)
Message-ID: <6794677a.170a0220.18dbf2.732b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 25 Jan 2025 04:24:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737779067; x=1738383867; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=96H95CjvmdSa04SeexV9HW1cbensoZSGoMgLLNBUGIM=;
 b=OJ7/Uhy7Oy9b8CvmaWUyuolqP5F4IKGi5mpFBvbVJzDXB4Hyq2Jz6WlnRPw0S5tTgC
 CVsjgTN2UtskFBUUoYotThLHEibaZVBX840ecsMTEds/hvgLRrWygnT5tEiBgRkaWdEH
 ivk0vvgLbQSqcN7KvZm57bz8tI4zsI8Aj0tucQzGKJsZcng+yNfFCwaG6xo76j6lBFLF
 4inrU7F3WN97ULzALqsrhwu1crQ7bM5uzYRM/sXxwlsrtI18LJ04aPVr73GmPVOhnqe1
 ulr3ATzQoZe8ywZCi8+++S8bHqeMqivCZmC0fr3/axFx4Zql9Q61O6yZXNqQBWFYVI6n
 cUcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OJ7/Uhy7
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-01-24
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

Autobuild statistics for 2025-01-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  4  |  0  |  7  |
  2024.11.x  |  2  |  3  |  0  |  5  |
    master   |  9  | 61  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.40.2 | 4 
                   cvs-1.12.13 | 3 
           libzenoh-pico-1.1.0 | 3 
                 linux-6.12.10 | 3 
             bluez5_utils-5.79 | 2 
fs/ext2/ext2.mk:66: /home/a... | 2 
              host-rust-1.82.0 | 2 
           oath-toolkit-2.6.12 | 2 
                   perl-5.40.0 | 2 
                    qemu-9.2.0 | 2 
               unixodbc-2.3.12 | 2 
                       unknown | 2 
           at-spi2-core-2.50.0 | 1 
             batman-adv-2024.4 | 1 
  binutils-arc-2023.09-release | 1 
                    brltty-6.6 | 1 
               dvdauthor-0.7.2 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
fs/ext2/ext2.mk:66: /home/a... | 1 
                  fwupd-1.9.20 | 1 
        gmrender-resurrect-0.1 | 1 
  gobject-introspection-1.76.1 | 1 
               graphene-1.10.8 | 1 
                   host-go-src | 1 
    host-python-greenlet-3.1.1 | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
             libargtable2-2.13 | 1 
           libfreeimage-3.18.0 | 1 
             libgphoto2-2.5.27 | 1 
                  libnss-3.107 | 1 
                 libv4l-1.28.1 | 1 
               libvorbis-1.3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                memtest86-6.20 | 1 
                 openssh-9.9p1 | 1 
             parsec-tool-0.7.0 | 1 
               procps-ng-4.0.5 | 1 
           python-numpy-1.25.0 | 1 
rtl8189fs-9a82349c2c40515f9... | 1 
                 watchdog-5.16 | 1 
wilc-driver-linux4microchip... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/92128a9e4763e41f44b2250e9165e90ba414d37b |     
  powerpc    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/25711f91822bb23ee7f7b5dba6cfe622f968e08e |     
   arceb     |  binutils-arc-2023.09-release  | NOK | https://autobuild.buildroot.org/results/986879aac1974d184931ff4e5ca200c3dcd46ef0 |     
    or1k     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/7966ff0147dd8400082d0f454b0df83735d54bfc |     
powerpc64le  |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/6716f065a90b5bfa519b10e772a7b6b8decf66c5 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/3c0c39e0f845cac85e08d17bd9c3f217ca1d76fd |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/68d86d3ec31b1c2749852787e600e153fc6a4b9e | ORPH
   sparc     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/da95d2db746d2597c1692b8faa752540a1ee9b6d | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4af54d3f45ebca4f66e177106c1c1c7caafaa9f2 | ORPH
    or1k     |        dvdauthor-0.7.2         | NOK | https://autobuild.buildroot.org/results/6caf83cd37e1f788e6cff7bd696398a7057175b5 |     
   s390x     |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/353d901ab108506637e2340a22409762270e3250 | ORPH
microblazeel |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/a3f8021929cbddcf2d35f8b5636bb73ff3e92661 |     
 aarch64_be  | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/ad7787e9f598bb504d37600ef21c82fa382bd624 |     
   s390x     | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/79d4828dfeec679833fab1c5773a57da15925e25 |     
   x86_64    | fs/ext2/ext2.mk:66: /home/a... | NOK | https://autobuild.buildroot.org/results/6e5f88a797de479bfe2628d0d6470fbb5f2e42a2 |     
    arm      |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/6a249fc9b589fa790343008cd0140d7bb9998c35 |     
 microblaze  |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/1e8e5fa4cd135240375c8b6df32c4aeb8644fc1e |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4d282aa9d55e7f71a935e6127dd67132b50ad30d | ORPH
   mips64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/030d30819a45b65f7c672664dc628d0c06334920 |     
    i686     |          host-go-src           | NOK | https://autobuild.buildroot.org/results/cc383a9f1aac44e883f8aa1d9e1608ee68f41d5e |     
    m68k     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/ec8d54bd9eb200b3dbd703e848bc773907fd8890 |     
powerpc64le  |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/80af630323575898529ecaa1ac8331b311a52e86 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/24f7fdf6e363798deb06a57a1c4f6055c3c9364c |     
    m68k     |          jack2-1.9.22          | NOK | https://autobuild.buildroot.org/results/34b8c19a56c75cb5585ea07b855ab0822539e1fe |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/0c9a34aeea0678441f8b44b109641f03167d024d |     
powerpc64le  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/e807f38eaa562cda577ff9a6fdf10b4c19eb1b98 | ORPH
 powerpc64   |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/a26442f0b2b5b11f660f77cb62db597e69aec296 |     
   mipsel    |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/1c68b24153bf63db6d028239206295cf28b79a14 | ORPH
   sh4eb     |          libnss-3.107          | NOK | https://autobuild.buildroot.org/results/d74b929ad88efd869cf2bbf790fc1d5f8c4ba470 |     
  powerpc    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/722b3485e7cbe67b9f9319a885cdb97e44fb9b2b |     
  powerpc    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/30a15b9f9dc3d8f8f917ac2ef69b449872afecd6 |     
   sh4eb     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/7c51144a70dd55c7ff866f261989715324083709 |     
    m68k     |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/0ff364b32d46c307095b55f70561e8f3d3efca58 |     
  aarch64    |      libzenoh-pico-1.1.0       | NOK | https://autobuild.buildroot.org/results/8dde5d2ae10fbd6201a8eda643c721be0b5b71b9 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/affa52132d5e410ab833f2c4b9bf864fd9b4282f | ORPH
   sh4aeb    |         linux-6.12.10          | NOK | https://autobuild.buildroot.org/results/6d0ef04105b646b1ccaae554c90b1d6552dba3d9 | ORPH
    m68k     |         linux-6.12.10          | NOK | https://autobuild.buildroot.org/results/01f91db3bc98a88633d554d482d49f8a4fc5a88c | ORPH
  powerpc    |         linux-6.12.10          | NOK | https://autobuild.buildroot.org/results/3adf816f96d5027d93d2e746d664d106d2ac2f71 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0f5e90035d9358e0ae8533ab1c108dc4ace22c01 | ORPH
   x86_64    |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/a64d20539aeb7e30e9d917dd5c3ba7c8e75976ae |     
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/0c8ed7a7cafc96b920deac32792475537d293fdc |     
 powerpc64   |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/aa1ac6c70f9681a507879f172e15d39eafc52479 |     
powerpc64le  |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/40d47c3519a5a98139df441ad0accb38778aa2ae | ORPH
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/0222b9f8485a54940d6f2e23cb76987c3ff115df |     
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/99e27aee6c0410995cedd8063400cd169073d394 |     
  mips64el   |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/9a04a29b0889b11c2e3f4db4df796850b169430a |     
   armeb     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/c377bef402f57b93086a92dae47d8702cdac2a9d | ORPH
 powerpc64   |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/410f978c947908f0b0b930ee2f593406784fc0a1 |     
   s390x     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/376ea96ddfc0f220bca8bd241614303747f61bd4 |     
    i686     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/87d790aeb5627a45f5250e4e8f8db0c64f69637e |     
 powerpc64   | rtl8189fs-9a82349c2c40515f9... | NOK | https://autobuild.buildroot.org/results/c765a490bb609a4fce1ae80dd51c0fdef61b9744 |     
 aarch64_be  |        unixodbc-2.3.12         | NOK | https://autobuild.buildroot.org/results/a5ab2a2cd7417bb23c2a2c73b29a6ea1d9fe76e9 |     
 aarch64_be  |        unixodbc-2.3.12         | NOK | https://autobuild.buildroot.org/results/e58109376335c50b6e51244a7dac53894653a5d2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe01c04e14b38397eeb69d4a1bef7d072eaa891a |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/0ee1665dc5a90d28d5a43b4ce36e3ce287a69890 |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/0ed07216e1d71577cd67a99ad931a768d02fbd3a | ORPH
  mips64el   |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/25a4090c9268f6722a4b5aa5064fc3dd60ffc941 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/a683f2145da0d9a5cec6dbce9171d8c6d1c2fc68 | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/fbec369999311fb37a8be08a5ef3e574fd141e59 | ORPH
  powerpc    |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/9c99550e4517d3259809fbad1aa9fed062894cd7 |     
  mips64el   | wilc-driver-linux4microchip... | NOK | https://autobuild.buildroot.org/results/e3b400548d90d337204eda8859746bc0b278cf1d |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

dvb-apps-3d43b280298c39a67d... | 1 
  gobject-introspection-1.76.1 | 1 
host-prelink-cross-a853a5d7... | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     | dvb-apps-3d43b280298c39a67d... | NOK | https://autobuild.buildroot.org/results/7f3142ad97f2b9e2e2c08ae24c0c0fdeaaa6411d |     
   s390x     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/08fe4c39bd6c1ad191134ddbc625bd3209b3bab2 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/f2f4c89877e3638164e0ae012a69064de99e1597 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/abbc9a2af13bfd3d352b1b536ab53257d0c0e9a0 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

host-binutils-bare-metal-2.... | 1 
              libopenssl-3.4.0 | 1 
          perl-net-ssleay-1.94 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/a49d1feb83312be07608d37c742da5b7a85430af |     
microblazeel |        libopenssl-3.4.0        | NOK | https://autobuild.buildroot.org/results/bda4b4d3a4b58b77ed315bf218e59e55d42afb1f | ORPH
   s390x     |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/c46dc6bfb3eacd51d71c3ad7403996486428ede1 |     


Gitlab CI results for 2025-01-24
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840007  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840027  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840110  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840128  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840142  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840163  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840287  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840315  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840328  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840329  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840330  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840335  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840338  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840359  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840363  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840369  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840374  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840385  |      
               freescale_imx93evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840481  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840487  | ORPH 
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840509  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840653  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840732  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840733  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840736  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840755  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840760  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840782  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840784  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840788  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840793  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840797  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840888  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840898  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840903  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840904  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840915  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840917  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840919  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840921  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840922  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840924  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840925  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840926  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840928  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840943  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840970  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840971  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840976  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
