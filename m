Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0C3C83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 03:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D72C36138F;
	Wed, 16 Jul 2025 03:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jG9YbshEq_Qr; Wed, 16 Jul 2025 03:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F98961395
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F98961395;
	Wed, 16 Jul 2025 03:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F04611AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 03:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6063F83B5F
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 03:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wd0Ygu1nM5hA for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 03:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5712783BA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5712783BA0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5712783BA0
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 03:14:47 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ae6fa02d8feso754084266b.0
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 20:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752635685; x=1753240485;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJrJRPCNyCpCzveQRubqnCpVpGE+Hb63WXdUqzOmRvk=;
 b=HBEEr7K0t/0TVINz5rAs6uu5hAP++OSBghafpmOL4FkDFa/led7XjdyHjO18nqGA+k
 5NbqdI5RoIzLxVnRb4PO/CmUxVte9+fRudtdqmWUPqzGgiXNqSD+1csJccUV0+dp8ADr
 +dxCoq30TnWnBV8Npn7rPAoNNf7WmATEGng/60D8dqI7kFSytWrKfj+QKmIq90Pdsgz/
 dPI7F+AEJOrqG3ZcdmbECyD1fFLbBVtyXXJ9Lj+PDgPjw89LqpapakguxzPdAlSKdh6C
 roVwo5VTiZJjOcmsNH2MBj3TWt665Cl8dhQIygNSbK1QKvfVw/2vENCGNzDhG1OGE3Cl
 WDMQ==
X-Gm-Message-State: AOJu0YzZrkIELabV9JvqD2L6tG0HRr9uqtjUF5QTjtX6GucevKZq4VcD
 bYu98q33x2h5hX8TB4i3vFTf1GpxYJ0BVgGFkFidE1S2jeT5qIUKOHHyy8Vkpg==
X-Gm-Gg: ASbGnctf0B52qo1/8VipfxNy/mnfZtwMli9Teo7GVLgMPxx33jrpFR8kSwnQyCCHJhL
 GhfQ4VJ4HgWCYwpUH1QQBZrv4pMDVDVUyOJwaEL5OPQzg6xRIKGRntgiRuZg6Y4tBkigBWvotyt
 vhm4Zd4LWkAxfnt1ojrqncHf+nhN+m/4e2kpgqzZAsD1cePRNiCAAge5deSOZowkPKBmVpzrMYz
 +89ARYNENs50BiicWdh2JmrQxx09X+lMOslq7VQuljqaa1xY+3LoTrOm9i1XtXKkxzmtMrQUqos
 Rp/KjBSSXEV7fb6+IDQd0APz6sBVf9oeYjM1aexlDx+zHFPPD0cJef8RTxNwxm4KSfoqnaRGBaw
 Dt3yg3B2u+I7KrJycdcJ064DoPA==
X-Google-Smtp-Source: AGHT+IFnrQcDn3gD0jymmqkyxctLKQLP8YaaxeJh+45cfhgg4M7c/A/xDDiz/Gi35ijEqI0urf5hag==
X-Received: by 2002:a17:907:3fa2:b0:ae6:c0a3:1606 with SMTP id
 a640c23a62f3a-ae9cdd84f87mr111962766b.7.1752635684934; 
 Tue, 15 Jul 2025 20:14:44 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82645fdsm1120721366b.97.2025.07.15.20.14.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 20:14:44 -0700 (PDT)
Message-ID: <68771924.170a0220.352923.f8b7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 16 Jul 2025 03:14:44 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752635685; x=1753240485; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fJrJRPCNyCpCzveQRubqnCpVpGE+Hb63WXdUqzOmRvk=;
 b=QvKWWyadgi6MTB/p7KSt4i2rO9Dcm72b092MpPYom9EoMbVHKxdi1dmEkIBPSvK37C
 q1xDJpFXToMGkkYn51Ft6mT1tyw52yJZsnOcdD+llabVaG0uHkIhdO2bFpKHLYRlq7Sw
 4xcXYFtnPJjrRaRJASm+k/1DYJGrDedb67hVlFkB8h/7lNyz4uu2xWrBjVBge7yodjx5
 BqKDmX8sKnWlN+pViduasFvyYVe8r7usmTvBCEBotkENXu+WMsJ1+eR6F/CnCAV9qKqR
 CVo3S5r8XRGGEvWNTHeveaYMYJ/Sj8snH5o4HrrC6hGovTUE81s5uERGxswjAtHpp6Ge
 92xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QvKWWyad
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-15
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

Autobuild statistics for 2025-07-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2025.05.x  |  4  |  6  |  0  | 10  |
    master   | 18  | 107 |  0  | 125 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
              skalibs-2.14.3.0 | 5 
                   bash-5.2.37 | 4 
                 libcddb-1.3.2 | 4 
                liboauth-1.0.3 | 4 
               bctoolbox-4.4.8 | 3 
                   cvs-1.12.13 | 3 
libdbi-drivers-0bfae6c43134... | 3 
              libselinux-3.8.1 | 3 
                    mpir-3.0.0 | 3 
               asterisk-22.3.0 | 2 
        b43-firmware-5.100.138 | 2 
                    ficl-4.1.0 | 2 
host-am335x-pru-package-5f3... | 2 
        host-sentry-cli-2.20.3 | 2 
                 libgee-0.20.6 | 2 
              libopenssl-3.5.1 | 2 
                libshout-2.4.6 | 2 
                   nanocom-1.0 | 2 
                  ntp-4.2.8p18 | 2 
      passt-2025_02_17.a1e48a0 | 2 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.4 | 1 
                   crun-1.18.2 | 1 
               ebtables-2.0.11 | 1 
            ecryptfs-utils-111 | 1 
        edk2-edk2-stable202505 | 1 
              execline-2.9.6.1 | 1 
  gobject-introspection-1.84.0 | 1 
        host-berkeleydb-5.3.28 | 1 
            host-binutils-2.42 | 1 
host-binutils-arc-2023.09-r... | 1 
          host-elf2flt-2024.05 | 1 
         host-gcc-final-14.3.0 | 1 
       host-gcc-initial-14.3.0 | 1 
       host-gcc-initial-15.1.0 | 1 
              host-rust-1.86.0 | 1 
               host-vde2-2.3.3 | 1 
                  iozone-3.506 | 1 
                  libjwt-3.2.0 | 1 
        liblog4c-localtime-1.0 | 1 
                libmbim-1.32.0 | 1 
                 libmbus-0.8.0 | 1 
                libressl-3.9.2 | 1 
             libsemanage-3.8.1 | 1 
                  libsvg-0.1.4 | 1 
libubox-3868f47c8f6c6570e62... | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250530 | 1 
                    musl-1.2.5 | 1 
                 netsnmp-5.9.4 | 1 
            netstat-nat-1.4.10 | 1 
                    ngrep-1.47 | 1 
                openssh-10.0p1 | 1 
                p11-kit-0.25.3 | 1 
                  prboom-2.5.0 | 1 
                 rtptools-1.22 | 1 
     s6-portable-utils-2.3.0.4 | 1 
          sane-airscan-0.99.33 | 1 
                 siproxd-0.8.3 | 1 
                    snooze-0.5 | 1 
               tipidee-0.0.5.1 | 1 
               trousers-0.3.15 | 1 
              udpcast-20230924 | 1 
        vulkan-headers-1.4.317 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/00e3c07df3330e90638f9b7d8dac52b0345c6dc6 |     
   x86_64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/13e8517aba1290f3bc5c6849adcb5f5e80e5ff6c |     
 microblaze  |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/e33643ca31dba1753f12ce0caf7565ff48afbb9b |     
   x86_64    |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/275d432c683f041ad1563881c0874247aa680d1d |     
  sparc64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/1be6105aa581b116c2e03885c8a807de4c11efbc | ORPH
   x86_64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/b3995c53332781efd2a0390a0e4284760ec31a69 | ORPH
   mips64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d7da6f171e317ec08e5e86e78db360caa27870dc | ORPH
 aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/24836f8aa47249b22e6d0af7f0130f8a200d7961 | ORPH
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/f958feded8a5d5ef5f61318767539e48af0b0f81 | ORPH
  aarch64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/643e0062401b2064d4b6dfd6187ed0a34270068f | ORPH
   sh4aeb    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/729aa576b9966c24412e3ccaf250ecbe943663fa | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0b06fcda74051807dc648b7886181e69e0c4c1b4 | ORPH
   xtensa    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/ea4de1086d15e11fc6b0777d7c959a26388ee493 |     
   armeb     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/169af459758043ba65b8159aa4a1fe1bf6fbbe94 |     
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/baa43ab5a17e43378bc6529fecd5a7d7b6abb8ee | ORPH
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b639106d869147c4bf5a11cd07c1e6781bef51b3 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/37fc1eed4af59302d0b5c15ebfaa71f4a9b78df2 | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/d62911797cb3692d67899e6ad5c6a018d070fadf |     
  sparc64    |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/7aca229922457c1362d603d9446ec04c07e0aee3 |     
    i686     |     edk2-edk2-stable202505     | NOK | https://autobuild.buildroot.org/results/34cb2d99cbc676e19688b7db94d9a73a0f64d567 |     
  sparc64    |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/5d902f033384ab6cfed064d1bc715963490a12b2 |     
 aarch64_be  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/d8fe8d98c691445da80c38d220bad8274323ed51 |     
    or1k     |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/b5f04ffff2adaa851001d834934f3b47ac7c9672 |     
  powerpc    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/60433a9bf816ef6fb23325e15384e4940b604c29 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/84e5d79bed9ca7dfe591b075b7b85d1981b88f83 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/0e13e83d88caacde4ac5ab61f031e8fa03c8e15f |     
    sh4a     |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/62f849742a4c6b2d793d5925fa6e7a4978a3d51d | ORPH
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a463f1a55e39279052ed07da9ffe5ec80787350c |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/4e9c8ec17e1a4a173a014bdff6012d0414512ea6 |     
  riscv64    |      host-elf2flt-2024.05      | NOK | https://autobuild.buildroot.org/results/571029670884841b4200afc85fb972486d1fbd9a | ORPH
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/847057ca12011f42e1c58602dc4e847ac700c6b2 |     
loongarch64  |    host-gcc-initial-14.3.0     | NOK | https://autobuild.buildroot.org/results/af76f8e8784b3cf78f54d95d2235c58db597756b |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/c0cf36c8f607ef71a30e1b545eb88be79d78b75c |     
  powerpc    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/72848b6ddf5d70dadb1bb7d924bb87f309a8473f |     
    arc      |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/27571508365f3843bc0b62f5133c6e68df02597d |     
microblazeel |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/e77ebd4ae662a0f143edc9eb0b9995974526b5b8 |     
microblazeel |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/13cc533b1853442ecb23e54b6fba87348dc6227e | ORPH
  powerpc    |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/c3afab2b646ce451a46b742f4ddd82a8b0b43512 |     
   mips64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/0118bc6a956842daf3b4f35fcf1172a48d959e83 |     
powerpc64le  |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/3a08e3db3fb355b683bae7f702fb82a052d72010 |     
  mips64el   |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/91b18e43cbcb83f7cb88b4d133d8d8528e3790e7 |     
  sparc64    |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/6c201794385fe4c732c57262e4a089726415b76d |     
   xtensa    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/129d78faabd6380fd55fd63d1e8216612cb7ccbf |     
 powerpc64   | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/24498ce9ac537588aaeddde27f22917084b453ec |     
   sh4eb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/1aaccf63b4d185ce93b17dc9f493e164b2414da2 |     
   mipsel    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/40cd89fa54b722bed10efa69370702a01e387a56 |     
   mipsel    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/41d241ac7a3946c7d189af7574f1bd02dc77004f |     
   sparc     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/5ce772e82628e144ff73f02fe975991459ed5c57 |     
   sparc     |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/e5ed85b04f60f9f129aa1a0bcb2731bf3deef81f |     
   armeb     |         libmbim-1.32.0         | NOK | https://autobuild.buildroot.org/results/1c54fe79dd2d4903cb86afdfe87e5cfd06f62a20 |     
microblazeel |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/defcd0bb685656618d3fa2ec6b4bd6addc7e9a39 | ORPH
   mipsel    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/69466bd453337bc62cd5a17c21839a8b404de33e | ORPH
    or1k     |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/dd1fa927488f21b914eb3de48f3483201044d4d1 | ORPH
   mipsel    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/c0e3963770ff3fef854f7bb59b8c96fde23ac1c8 | ORPH
  sparc64    |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/199bf0516d318fc01ad3630c70c72dfbb1e2f6c7 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/e6f4a175b93a8d924c361c1c5c47b27cf83c5119 | ORPH
  riscv64    |        libopenssl-3.5.1        | NOK | https://autobuild.buildroot.org/results/0a306ce6015e456507474de342e4b368ff298bb7 | ORPH
 aarch64_be  |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/e5f3ab392674c6396fbbd979c654ead41b4557af | ORPH
    mips     |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/a2d0aef3a85a51e0bb986ea1da51b1d03ec76be5 |     
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/1a72434f0cbf040c9609845906ba7e040ca306eb |     
    sh4      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/0ddbdcfa84693de7329bde9cb92bf86e896d5b84 |     
   x86_64    |       libsemanage-3.8.1        | NOK | https://autobuild.buildroot.org/results/913852e35c925888ced37e15be3731b9d3963019 |     
  aarch64    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/18cc393358f091cec1eb8ab9ddaf14a3c76e265c | ORPH
   armeb     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/b3b21b38ced924abbb82eed8acbc9e8546a83b68 | ORPH
   x86_64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/088921165c0e2db1d2a3c28c990fdea2d7046e1b |     
    arc      | libubox-3868f47c8f6c6570e62... | NOK | https://autobuild.buildroot.org/results/d728ab2ef9c99fb70704d7fcc2a8f33e3b70acf4 |     
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2fc1485d0e10d261425d0e083dc51ec2ae872b62 | ORPH
  powerpc    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/bb804ac75aff6e5ffe5e5c913334971d290afbdb |     
   arceb     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/59b3ad33667b7e87c81e49dd434d5f494e189e0d |     
 microblaze  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fef9fe321e13c0bc378b43e0011e07e4a9ae11eb |     
    m68k     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/9189877d92d76ea6c615a27ff5482288d0342a70 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/fe2093116ddded9f00052a7a5e77ce5c0a592cba |     
loongarch64  |           musl-1.2.5           | NOK | https://autobuild.buildroot.org/results/8f110dca3d3c5c1805ba966f43d190c98478b56a |     
   sparc     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/27749f5bae6351dde31b4dd849e8a3513f4c4d73 |     
 powerpc64   |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/cb3f64833129f83d39fa8733967577af94ea5406 |     
    arm      |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/069c666769c779d9aba6461d5433cedee8e35937 | ORPH
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/08dd23f9a6116b402f703a391ad7b028e07652aa | ORPH
   mips64    |           ngrep-1.47           | NOK | https://autobuild.buildroot.org/results/c7575134461e829046f38de17636dc8e8a6c5a9d |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/292bfe54ea2f5927efd0dca00b32a0b0c82527d3 |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8541911fd298a13f69567a1a10830d8bee1b588b |     
   mips64    |         openssh-10.0p1         | NOK | https://autobuild.buildroot.org/results/eb9bc717ffb068b36a3b2f14d600967945ca1f02 | ORPH
 aarch64_be  |         p11-kit-0.25.3         | NOK | https://autobuild.buildroot.org/results/4c7ed72976840272266701de026040bab9ddd08e | ORPH
    or1k     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/2c411328f89e46fa71aaba7cd1c482eda76ed22d | ORPH
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/b580f67e92b32911c3e4ea04c93b50fb5d30dee3 | ORPH
   mips64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/c2f1b4aa5741a4d67d31117906042124ddec9cd3 | ORPH
powerpc64le  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/0bff0ad4b349083877fe508bbf696975439471d9 | ORPH
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/1db9a16b17286725f4ade50ac8badcb6cb5ab9ee |     
 microblaze  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/eb23a245dbf7653ce34772cb18a4ea5bed740299 |     
   sparc     |         siproxd-0.8.3          | NOK | https://autobuild.buildroot.org/results/38c140cd5b894923cfa49c6caac4fd3be9005209 |     
    mips     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/9b7b9aff53806dba8a852dca090170a4a433ed27 |     
   sparc     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/b78c4bea4cb64d073fd8eb1784d30293a76d553b |     
   sparc     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/73f24917d45bde6ee70b0fc40cd35976aacc1905 |     
   s390x     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/e05b4790ffda808012cd7be3b0c0bdd3aa68a219 |     
  mips64el   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/951d17f096daf3daa472dce5a16f2a45a7907475 |     
   mips64    |           snooze-0.5           | NOK | https://autobuild.buildroot.org/results/c8cafbffb7ae7589a3e67708d0d1d2f62e96ab40 |     
  aarch64    |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/cdd029247997363af51442873b89bbb7e1c0531d |     
    m68k     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/37e5193ce91a020db31f35aacfe2f9502c41a56d |     
   sparc     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/df8038251683b9e9ce3308bd517d7d334fea2d37 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b96264effe44e2c8101340e1008f65f2225e3865 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/09372374952dd5f8eecb820fa5ba1fa56c735694 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/727affa72d3711f842f1e732bfd90f69aa2f56bb |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/7b985334c915453c8248609f31fabfb1792ff680 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/1f7c6d691e65264aa54512f8fcff1423cd0cfc15 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/1a0d812d4d35a59015b6057a7d8794c6d4d22b2b |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e88886297fe2fae12096875060f43bca77a2a93c |     
   x86_64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/0159fc86214e1e31217663fac37a310bdaeb0347 | ORPH
  aarch64    |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/0ce08d88f8d92cb885f2aeef954796cb997ad35b | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 1 
                  prboom-2.5.0 | 1 
                   s6-2.13.0.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d10bf959337e7455c496670ba30de3c540883e03 | ORPH
    m68k     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/7052fa3dfac20ea55566bf08199e9957ab1a84a1 | ORPH
   mips64    |          s6-2.13.0.0           | NOK | https://autobuild.buildroot.org/results/1da53f4bf8d928d809d86c7f58e7df670fc0c915 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

          host-oniguruma-6.9.9 | 1 
              host-rust-1.86.0 | 1 
                 netsnmp-5.9.4 | 1 
                   perl-5.40.2 | 1 
              tinyssh-20240101 | 1 
                tpm2-tss-3.2.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      host-oniguruma-6.9.9      | NOK | https://autobuild.buildroot.org/results/c81b3bd151fbc43d368e47d6d3fedd2198646460 |     
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/9b51090725f8d03fcb01550cf103aa0303bc3646 |     
  powerpc    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/f971613ec776837da676cefc2c75b50eefa6492f | ORPH
  powerpc    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/a0ca04e9079fc89798987a054e0993fa030da60d |     
  mips64el   |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/9edfcb1c46c16bca8da55554694f8fd93be54d44 |     
powerpc64le  |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/b5d9111a14ad2875e0c5765b290a05ae1bda02ab | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
