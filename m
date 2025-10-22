Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72D7CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 03:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 545AC60E72;
	Wed, 22 Oct 2025 03:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NO-GHbDrD6jt; Wed, 22 Oct 2025 03:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F091B60EB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F091B60EB4;
	Wed, 22 Oct 2025 03:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DADB470A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 03:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD1204068B
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 03:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id to6JusOwqvaz for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 03:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 222E340688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222E340688
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 222E340688
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 03:20:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so1757487f8f.3
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761103223; x=1761708023;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0YY45z6CCNb1zRN9SPYEsWSDLK1HMv1zj9duf1um9Gc=;
 b=ISRw1a1L3CbymL/h9RucSRobuSeVVVJmdw5/rZncptI11tJv6Hy1Iatkuh6agJLv8y
 M7GswCVQGgmF+MLWbjsqrQnLyr0GnCXsTv0aVwZwrXZef3ZHpQxqfR53e2k8fX2GtiKv
 HQ91YBBy2QFcp/3miiUYo9HN861IcDmAGuk9lWnfgbNS/ygI4lMVL4Cnxj5+XzU+hOqZ
 DGGzxbWxwsmA+9GJ4oGHhPCI9ZEkiARB1TtjSg/+BH4Nv8JYAgNJquyW73xZjt3ONjZi
 lHzV/OoX+XnHJzmyRDY5EZwsSNl0U6khkrpH0df4Ra07WUFpXZPzdAu0+ouh92td3969
 cqdg==
X-Gm-Message-State: AOJu0YxlxbS+CZCttVeSFiKWgRKQyPmCJFEWUEcPtUth63ODXhT1ZxvE
 4JRCZZBQJToOmMvo47KzJkW0U4td2paEHbhQ6yJVH0J451GHbKZdOMAdgJaFKw==
X-Gm-Gg: ASbGnctKSrYdKO47DCDPptVMOXOHcXrjfAAEaV46tZoDpGpCeOOX8nZ7PgKoCg4cx1p
 c/wxR6MGCBZKDt6Rstvd9InlniOWQOlXGfq9Io4zUqFOmKL779OxdwgjA6wO55jiV4/A4RYCHPg
 oXfdf5r9z1Ymxwg/YRkFC4z2Frx5o5xqfXbxwIEXfEXLH5EYgcARaJDWCAqQ/try8xOooG3mruF
 LWnb2RxgOKg39Yu7vvnjZ75s5XIroL3fb/ynukY0Tqn5l9xYWwysZJJg7opOXQNOGPwm9coADpM
 7Ap4MDFCsUqlHZ4tuxeir8vyGZ9f0jhj/fVTehdcOgnLgJlvES9BUOosbO3r/dLXQSP9RXkV32L
 rCGZpdiHwrQ1HW/1DBy+4RAcjxpqKv2UOcn8ovDA4jQg7B+1lgZJOcxacYdDw5zKVIO+y1snD02
 7V/TZ/1HU=
X-Google-Smtp-Source: AGHT+IEQKUztPEwmt40cYYjPLuetzJHCecq1O6CLPyocAQK3Xz1WvdxR5ajsu3/NBJ+e6L3D0/ecmw==
X-Received: by 2002:a05:6000:240c:b0:426:ee84:25a1 with SMTP id
 ffacd0b85a97d-42704daed04mr14506794f8f.38.1761103222689; 
 Tue, 21 Oct 2025 20:20:22 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9f9dsm23011461f8f.39.2025.10.21.20.20.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 20:20:22 -0700 (PDT)
Message-ID: <68f84d76.5d0a0220.102a5e.9eae@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 22 Oct 2025 03:20:22 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761103223; x=1761708023; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0YY45z6CCNb1zRN9SPYEsWSDLK1HMv1zj9duf1um9Gc=;
 b=jLKRn60ElW0ySCbdmnLFWXGv9OJGsSwePlyYyhu8UipgrDeaMgyGtEMvd4wAOCn3GD
 Z5Sfs+bL6jqEaHLnF97nxOmwxvtExIHDlsBLCCEYUkhNowb0QEvyeP3Kusq6HivB5W18
 Xz1Fx4bJgUwZYp9kOCuWYs76ysmxaGfbd3e+oeg5RqFWXx7BdMJVjdAAq82T7IaTU44T
 nAtqgHTj+bY313Z+ECvwPwutUz6sM3Id6sJ6N71IBJIx+IJuuSaos9j3GA8pg9nuutiz
 eWn5HJDamSOtMCg4c5G2W+S6QDfehBpqK6zUKcB4ZR+MQN/gI+P0u/4OyxMVok4u54M1
 d6ZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jLKRn60E
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-21
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

Autobuild statistics for 2025-10-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  6  |  0  | 10  |
  2025.05.x  |  2  |  1  |  0  |  3  |
  2025.08.x  |  1  |  1  |  0  |  2  |
    master   | 33  | 79  |  0  | 112 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.17.4 | 5 
                openocd-0.12.0 | 4 
                   perl-5.40.2 | 4 
                   cvs-1.12.13 | 3 
           host-openocd-0.12.0 | 3 
     linux-5.10.162-cip24-rt10 | 3 
             berkeleydb-5.3.28 | 2 
            gdk-pixbuf-2.42.12 | 2 
             libgphoto2-2.5.27 | 2 
                  libjwt-3.2.0 | 2 
                    mpir-3.0.0 | 2 
                python3-3.13.9 | 2 
                       unknown | 2 
               asterisk-22.3.0 | 1 
  binutils-arc-2024.12-release | 1 
                  cairo-1.18.4 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             drbd-utils-9.21.4 | 1 
              erlang-26.2.5.15 | 1 
                      fio-3.41 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
                   gvfs-1.57.2 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-14.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
              host-rust-1.88.0 | 1 
 host-softether-4.30-9700-beta | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                    kmon-1.7.1 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                 libiconv-1.15 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                libshout-2.4.6 | 1 
               libtheora-1.2.0 | 1 
               libucontext-1.2 | 1 
        ltp-testsuite-20250530 | 1 
                 netsnmp-5.9.4 | 1 
                openssh-10.2p1 | 1 
                      poke-3.0 | 1 
                    sdl-1.2.15 | 1 
             strongswan-5.9.14 | 1 
               tinyxml-2.6.2_2 | 1 
                tpm2-tss-3.2.2 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-132c6134d691... | 1 
             util-linux-2.41.1 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/700874b14ba26cb07d6b2090cb48361c4031640c |     
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/fe62905e6d35cce865bae47ecef642d3f088fc06 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/332f34faf93e9157a220ee3bcda16880a06c3f2e | ORPH
   arceb     |  binutils-arc-2024.12-release  | NOK | https://autobuild.buildroot.org/results/d316eb10895401254a698e66e718c89d1a5e72c9 |     
  riscv64    |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/990a452ba5bc6db45beab23fa014c95fce90713c |     
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ac1a70ed838e51aee3a2cdf6a05989ceb8ac7e25 | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/d1019eb118b660f7445902eb26fcf1e25e1f48b9 | ORPH
 microblaze  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/ff714666a2a355c4e70f7414251c7647118fa004 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b05d411fce1b73da54d8666d0bce37286029be49 | ORPH
    i586     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/aa8b612565a9e093324d5e94914c6cd8218ef74e | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/2d23a034e2c36575b93e99d222c42b5b35438b3c | ORPH
   arceb     |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/a1b515cee5e34107acdf8c835efc0a132e0b2fa7 |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/05af5817ed970ad6f3f155f26c5e996d38063759 |     
   sh4aeb    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/f4e977fc1099ce13a84e58eaa71af55e95658d31 |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/23e8a568054a8a3a04592ec3ea640357a96a1b93 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7b2c5decd70d4f66c30cefb5b04fb4ad14a54aba | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/f8c6d11b772a0c76e4d6c58655177517777d8f9d |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/b4ddc25b8f1f9bdb412d57a87afbaada805e291a |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/109509f1350381fa3d4171e878c31e8de37096a7 | ORPH
   s390x     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/14fd1caec6f9c7e203109918b2d78bbf3b1f0de7 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d92f447fafb134d0072d882c5173e20ffe0a34fe |     
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7896c198c1aa28118c79ad3502512546324ee4a5 | ORPH
   x86_64    |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/b6ee7d2d761d3e04349529b4b5c1b07e0be17421 |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/f4b060812733eb3f5b4960bead64be35a19c7b8b |     
loongarch64  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/551f584edf9cdc0a04e7297f31fca418e868e583 | ORPH
  powerpc    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/121645d2affbb7621b27445fd6ebabe7c406d502 | ORPH
   s390x     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/d9e64dc95f22d84a6c220d71e8f22ba7ca7a581a | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/e4e42bbaea612b123c888e7cb1adf98d822a4d9c |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b55a480fa49ffdd45b294da8c30da7a4bf046149 | ORPH
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/62a97f2727ee7000e8b35021888306a920bc50b4 |     
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/51e846fa70abb0cb382ecbe343c2a8916f921a3b |     
  aarch64    | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/fe9148f9745d79fb90160a4345c05dad505e4fb9 | ORPH
   armeb     |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/1dda736a23039e51a7ae8abffaaa28a61bb8af72 |     
   mips64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/6dbac4a1645c5ca00f0b8fe29ea87f2ff9420640 |     
   armeb     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/1b8a3cfd2062492b9cefd0721bd336781f6a7379 | ORPH
    m68k     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/c829500a251347cd8d7cc7be4194534704c9b49c | ORPH
   armeb     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/db742e301a401c9f4bdf3c7e8cfde9f0ba1c4558 | ORPH
    arc      |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/70169f657ccf2750ccac3f8e1ba01f5dd70ac2a0 | ORPH
    mips     |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/a54990d87158fdd58e626fbbb643a95c1a90e86d |     
  aarch64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/2d04bbc1cdb186b1b3530a4ec51e597461f8e84b |     
    arc      |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/ec65612274b2e51d0bdc1315346105a1cd31d1a8 | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/00de9637a569ae0f996283703c64ef44cfd36e47 |     
loongarch64  |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/c53b7b613269acddd3467865c11784f59062a943 | ORPH
   armeb     |        libtheora-1.2.0         | NOK | https://autobuild.buildroot.org/results/8af9ce8c03b00da2dcf29bc1c6f4afef9a002a58 | ORPH
   sh4aeb    |        libucontext-1.2         | NOK | https://autobuild.buildroot.org/results/e9ea3d72eb8685fa18efc226166b777f123d8f5e |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f62f695e2603a752ed5b7d6ced37a211e7175363 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/17c2e1523f5df7b90e21dc7a2fc27745c753b659 | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/96982a8a5e56984077c6abdad2d49bc142f5a75d | ORPH
    sh4a     |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/2742ad9b733c8452bd9285dd3a9829926fe6c74f | ORPH
  mips64el   |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/3c637b7a806640e940537f856ba7163b894077f9 | ORPH
  sparc64    |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/15186150b8c68ebd007740ff41243f6845c50efc | ORPH
powerpc64le  |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/77e7ceca35780bb5b183db0ccd39f41a0a4f76f8 | ORPH
    i686     |          linux-6.17.4          | NOK | https://autobuild.buildroot.org/results/62ef9aa353d605f26386b60eebb5adc35383c424 | ORPH
    i686     |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/ef08d29b373f9c63885b5cb157d04a5dec83cb7d |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/7c39a7bec8d0b07ccd64d4ec1ad784d63c879dbc |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/86f7e4f49d4c6345ffcfecc8b44d7fa74f7862af |     
    sh4      |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/c64579a35c879407c3220fb08fc737ab7f68d277 | ORPH
    mips     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/0692f92fd7368a60846161981cd94b0d2a38abc2 | ORPH
   s390x     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/ff8200966ed1714170b40266ab4c7a91ba99122e | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/e657dce8fce82b7a67455f27107995f1cc2a45c2 | ORPH
   xtensa    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/2a4dfc9c936580b4a10af5b0bfc81b4910b01e4e | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/7187739f209402b4fb3c1bf3336de7826d4db1f8 | ORPH
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e07557cb005a8bd794989048cd031fcca3493143 |     
    m68k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/28abb9d5d5262ac3fb25d168c44d57b2d831b83f |     
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f9750b4a2cf1ca32f7dd4f0f68482da6fb419a8b |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/e49bdb809436df625ec22a1195621b503e4eb7d7 |     
  sparc64    |            poke-3.0            | NOK | https://autobuild.buildroot.org/results/225f464b977d783aebb599234525d3e394c564e0 | ORPH
    sh4      |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/5c48e27c6b102556be6a40642cae39ffa9de9b98 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/6e6cb1b0bfb6c222894cb8dac0bdb9cf4e08db31 |     
    mips     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/42cc35dcc6c1b0b0c8f7dbb928327d1932836203 | ORPH
    or1k     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/0fcb270f71605b6085cea69ee91de165c44596ed |     
  mips64el   |        tinyxml-2.6.2_2         | NOK | https://autobuild.buildroot.org/results/370b3e0715a3f4cb8fa41c7cd005aee559c61c0e | ORPH
    i686     |         tpm2-tss-3.2.2         | NOK | https://autobuild.buildroot.org/results/c108b53dae633b5a3d3f094cda49aaa415a96bad | ORPH
   xtensa    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/dabf79f64da06944c55db7617a7ae8ed04dc0632 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/b7a02ba80b3e1b99f1294a686ab7fb665887c2ac |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/1dd208dee08ac4472fc117e1df95ddc2f4ddee85 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/5cd7748c740a0935536d518265ebbecf684a43ea |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/a9fe0ac2b2eaf8a3394ce5a6fb27e570e980f913 | ORPH
    arc      |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/3610f35666f271eddba7d47b90747657a90170b5 | ORPH


Classification of failures by reason for 2025.08.x
--------------------------------------------------

                   perl-5.40.2 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/51cc5e0b44cc99e0acb981d12c3e0c09314886e6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  bitcoin-28.0 | 1 
                  cmake-3.31.5 | 1 
                  ffmpeg-6.1.3 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                  libsepol-3.7 | 1 
                libvips-8.10.6 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-28.0          | NOK | https://autobuild.buildroot.org/results/8cdb331006ce2f6d997f0d363c11b125cce8f2b5 |     
  aarch64    |          cmake-3.31.5          | NOK | https://autobuild.buildroot.org/results/167932357e521ecd834ce40bd01510c4da89ed60 |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/1098cdc5d754307eb59bae8c38c25ec9d87b2f70 |     
 aarch64_be  | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/be74c3448847c72ebf9e1891758083f1aa46cd2b | ORPH
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/2c9bc41bba65cb2f32ff053be37a062387702a54 |     
    or1k     |         libvips-8.10.6         | NOK | https://autobuild.buildroot.org/results/8fe821dd7dff1b70b82a7be424045ac85499bfc3 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                   perl-5.40.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/45fc6a7044d19dafaf349f4a4329c43b9738328d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
